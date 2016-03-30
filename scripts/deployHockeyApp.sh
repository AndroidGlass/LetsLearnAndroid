function uploadToHockeyApp {

  GIT_COMPARE_KEY=${CIRCLE_COMPARE_URL##*/}
  GIT_PRETTY_COMMIT_LOG=$(echo "<ul>$(git log ${GIT_COMPARE_KEY} --pretty=format:'<li>[%ad] %s (%an)</li>' --date=short)</ul>" | tr -d '\n')

  HOCKEYAPP_NOTES_HEADER="**Built on:** $(date +"%a %d-%b-%Y %I:%M %p")
  **Branch:** $(git rev-parse --abbrev-ref HEAD)
  **Commit:** $(git rev-parse --short HEAD)"

  HOCKEYAPP_NOTES_HEADER_HTML=${HOCKEYAPP_NOTES_HEADER//$'\n'/<br>}
  HOCKEYAPP_NOTES="${HOCKEYAPP_NOTES_HEADER_HTML} ${GIT_PRETTY_COMMIT_LOG}"

  curl --verbose \
       --fail \
       --form "status=2" \
       --form "notify=1" \
       --form "notes=${HOCKEYAPP_NOTES}" \
       --form "platform=Android" \
       --form "notes_type=0" \
       --form "ipa=@${HOCKEYAPP_EXPORT_APK_PATH}" \
       --form "tags=${HOCKEYAPP_TAGS}" \
       --form "teams=${HOCKEYAPP_TEAM_ID}" \
       --form "release_type=2" \
       --header "X-HockeyAppToken: ${HOCKEYAPP_TOKEN}" \
       "https://upload.hockeyapp.net/api/2/apps/${HOCKEYAPP_APP_IDENTIFIER}/app_versions/upload"
}
