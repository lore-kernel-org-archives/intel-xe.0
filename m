Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F10C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 22:53:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE4710EB4D;
	Fri,  8 Dec 2023 22:53:36 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id A1A6C10EB4D;
 Fri,  8 Dec 2023 22:53:35 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9E185AADF2;
 Fri,  8 Dec 2023 22:53:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B0?=
 =?utf-8?q?1/13=5D_drm/sched=3A_Rename_drm=5Fsched=5Fget=5Fcleanup=5Fjob_to_?=
 =?utf-8?q?be_more_descriptive?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Fri, 08 Dec 2023 22:53:35 -0000
Message-ID: <170207601564.7326.17036477523737118325@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231208202723.918082-1-rodrigo.vivi@intel.com>
In-Reply-To: <20231208202723.918082-1-rodrigo.vivi@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [01/13] drm/sched: Rename drm_sched_get_cleanup_job to be more descriptive
URL   : https://patchwork.freedesktop.org/series/127581/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a53489d54e528472366f16aac6ec0cfa0c137cdf
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Fri Dec 8 15:27:23 2023 -0500

    fixup! drm/xe: Introduce a new DRM driver for Intel GPUs
    
    Adjust to recent drm-scheduler changes that already landed in drm-next
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 1fc141d1f445b8e5ab4ff14645b0482dd98460b9 drm-intel
998237644 drm/sched: Rename drm_sched_get_cleanup_job to be more descriptive
4dec32b95 drm/sched: Move free worker re-queuing out of the if block
-:7: WARNING:TYPO_SPELLING: 'existance' may be misspelled - perhaps 'existence'?
#7: 
existance of the current job, given both drm_sched_get_finished_job and
^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 15 lines checked
69cb52ab7 drm/sched: Rename drm_sched_free_job_queue to be more descriptive
b02563cea drm/sched: Rename drm_sched_run_job_queue_if_ready and clarify kerneldoc
89b1d7a68 drm/sched: Drop suffix from drm_sched_wakeup_if_can_queue
b830bc2ed drm/sched: Don't disturb the entity when in RR-mode scheduling
Use of uninitialized value $cid in concatenation (.) or string at scripts/checkpatch.pl line 3228.
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
Don't call drm_sched_select_entity() in drm_sched_run_job_queue().  In fact,

-:29: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes:  ("drm/sched: Split free_job into own work item")'
#29: 
Fixes: f7fe64ad0f22ff ("drm/sched: Split free_job into own work item")

total: 0 errors, 2 warnings, 0 checks, 36 lines checked
1aa72a707 drm/sched: Qualify drm_sched_wakeup() by drm_sched_entity_is_ready()
Use of uninitialized value $cid in concatenation (.) or string at scripts/checkpatch.pl line 3228.
-:8: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#8: 
can queue to the scheduler, i.e. there is no point in waking up the scheduler

-:12: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes:  ("drm/sched: Don't disturb the entity when in RR-mode scheduling")'
#12: 
Fixes: bc8d6a9df99038 ("drm/sched: Don't disturb the entity when in RR-mode scheduling")

total: 0 errors, 2 warnings, 0 checks, 39 lines checked
67e3b3351 drm/sched: implement dynamic job-flow control
e1ac95cdd drm/sched: Fix bounds limiting when given a malformed entity
Use of uninitialized value $cid in concatenation (.) or string at scripts/checkpatch.pl line 3228.
-:14: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes:  ("drm/sched: Convert the GPU scheduler to variable number of run-queues")'
#14: 
Fixes: 56e449603f0ac5 ("drm/sched: Convert the GPU scheduler to variable number of run-queues")

-:39: CHECK:SPACING: No space is necessary after a cast
#39: FILE: drivers/gpu/drm/scheduler/sched_entity.c:90:
+			entity->priority = max_t(s32, (s32) sched_list[0]->num_rqs - 1,

-:40: CHECK:SPACING: No space is necessary after a cast
#40: FILE: drivers/gpu/drm/scheduler/sched_entity.c:91:
+						 (s32) DRM_SCHED_PRIORITY_MIN);

total: 0 errors, 1 warnings, 2 checks, 20 lines checked
8e5359685 drm/sched: Rename priority MIN to LOW
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
This mirrors DRM_SCHED_PRIORITY_HIGH, for a list of DRM scheduler priorities

-:84: CHECK:SPACING: No space is necessary after a cast
#84: FILE: drivers/gpu/drm/scheduler/sched_entity.c:91:
+						 (s32) DRM_SCHED_PRIORITY_LOW);

total: 0 errors, 1 warnings, 1 checks, 84 lines checked
970003186 drm/sched: Reverse run-queue priority enumeration
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
Reverse run-queue priority enumeration such that the higest priority is now 0,

-:80: CHECK:SPACING: No space is necessary after a cast
#80: FILE: drivers/gpu/drm/scheduler/sched_entity.c:92:
+						 (s32) DRM_SCHED_PRIORITY_KERNEL);

total: 0 errors, 1 warnings, 1 checks, 90 lines checked
cda605a69 drm/sched: Partial revert of "Qualify drm_sched_wakeup() by drm_sched_entity_is_ready()"
Use of uninitialized value $cid in concatenation (.) or string at scripts/checkpatch.pl line 3228.
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
Commit f3123c2590005c, in combination with the use of work queues by the GPU

-:7: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'f3123c2590005c', maybe rebased or not pulled?
#7: 
Commit f3123c2590005c, in combination with the use of work queues by the GPU

-:10: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'f3123c2590005c', maybe rebased or not pulled?
#10: 
This is a partial revert of of commit f3123c2590005c since drm_sched_wakeup() still

-:10: WARNING:REPEATED_WORD: Possible repeated word: 'of'
#10: 
This is a partial revert of of commit f3123c2590005c since drm_sched_wakeup() still

-:14: WARNING:PREFER_LORE_ARCHIVE: Use lore.kernel.org archive links when possible - see https://lore.kernel.org/lists.html
#14: 
Link: https://lists.freedesktop.org/archives/dri-devel/2023-November/431606.html

-:19: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes:  ("drm/sched: Qualify drm_sched_wakeup() by drm_sched_entity_is_ready()")'
#19: 
Fixes: f3123c2590005c ("drm/sched: Qualify drm_sched_wakeup() by drm_sched_entity_is_ready()")

total: 0 errors, 6 warnings, 0 checks, 11 lines checked
a53489d54 fixup! drm/xe: Introduce a new DRM driver for Intel GPUs


