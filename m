Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD00C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 20:17:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0867E10E4E5;
	Mon, 11 Dec 2023 20:17:44 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2EF7810E4EC;
 Mon, 11 Dec 2023 20:17:41 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 2C07EAADF2;
 Mon, 11 Dec 2023 20:17:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B0?=
 =?utf-8?q?1/13=5D_drm/sched=3A_Rename_drm=5Fsched=5Fget=5Fcleanup=5Fjob_to_?=
 =?utf-8?q?be_more_descriptive?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Mon, 11 Dec 2023 20:17:41 -0000
Message-ID: <170232586117.19579.12379641264213058341@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231211191306.1069362-1-rodrigo.vivi@intel.com>
In-Reply-To: <20231211191306.1069362-1-rodrigo.vivi@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/127643/
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
commit 855391ae5efced71e5ec774889bab649df718239
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Mon Dec 11 14:13:06 2023 -0500

    fixup! drm/xe: Introduce a new DRM driver for Intel GPUs
    
    Adjust to recent drm-scheduler changes that already landed in drm-next
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch f622e36eab1cfc58254088de6bbb8db3e97a0140 drm-intel
c9662b6c7 drm/sched: Rename drm_sched_get_cleanup_job to be more descriptive
Use of uninitialized value $cid in concatenation (.) or string at scripts/checkpatch.pl line 3228.
Use of uninitialized value $cid in concatenation (.) or string at scripts/checkpatch.pl line 3228.
Use of uninitialized value $cid in concatenation (.) or string at scripts/checkpatch.pl line 3228.
Use of uninitialized value $cid in concatenation (.) or string at scripts/checkpatch.pl line 3228.
-:12: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '7abbbe2694b3d4fd366dc91934f42c047a6d282d', maybe rebased or not pulled?
#12: 
(cherry picked from commit 7abbbe2694b3d4fd366dc91934f42c047a6d282d)

-:20: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes:  ("drm/sched: Split free_job into own work item")'
#20: 
Fixes: f7fe64ad0f22ff ("drm/sched: Split free_job into own work item")

-:21: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes:  ("drm/sched: Don't disturb the entity when in RR-mode scheduling")'
#21: 
Fixes: bc8d6a9df99038 ("drm/sched: Don't disturb the entity when in RR-mode scheduling")

-:22: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes:  ("drm/sched: Convert the GPU scheduler to variable number of run-queues")'
#22: 
Fixes: 56e449603f0ac5 ("drm/sched: Convert the GPU scheduler to variable number of run-queues")

-:23: WARNING:PREFER_LORE_ARCHIVE: Use lore.kernel.org archive links when possible - see https://lore.kernel.org/lists.html
#23: 
Link: https://lists.freedesktop.org/archives/dri-devel/2023-November/431606.html

-:24: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes:  ("drm/sched: Qualify drm_sched_wakeup() by drm_sched_entity_is_ready()")'
#24: 
Fixes: f3123c2590005c ("drm/sched: Qualify drm_sched_wakeup() by drm_sched_entity_is_ready()")

total: 0 errors, 6 warnings, 0 checks, 53 lines checked
0156c60a1 drm/sched: Move free worker re-queuing out of the if block
-:7: WARNING:TYPO_SPELLING: 'existance' may be misspelled - perhaps 'existence'?
#7: 
existance of the current job, given both drm_sched_get_finished_job and
^^^^^^^^^

-:11: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'e608d9f7ac1a94a4a63d1ef2b37dd80669ad828d', maybe rebased or not pulled?
#11: 
(cherry picked from commit e608d9f7ac1a94a4a63d1ef2b37dd80669ad828d)

total: 0 errors, 2 warnings, 0 checks, 15 lines checked
6228e8364 drm/sched: Rename drm_sched_free_job_queue to be more descriptive
-:20: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '67dd1d8c9f6543661720b9a89e28a25488cb8753', maybe rebased or not pulled?
#20: 
(cherry picked from commit 67dd1d8c9f6543661720b9a89e28a25488cb8753)

total: 0 errors, 1 warnings, 0 checks, 48 lines checked
eff58e3c0 drm/sched: Rename drm_sched_run_job_queue_if_ready and clarify kerneldoc
-:15: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '35a4279d42db534ad71a3a598029a53f22856f93', maybe rebased or not pulled?
#15: 
(cherry picked from commit 35a4279d42db534ad71a3a598029a53f22856f93)

total: 0 errors, 1 warnings, 0 checks, 52 lines checked
4deb729f0 drm/sched: Drop suffix from drm_sched_wakeup_if_can_queue
-:11: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'f12af4c461fb6cd5ed7b48f8b4d09b22eb19fcc5', maybe rebased or not pulled?
#11: 
(cherry picked from commit f12af4c461fb6cd5ed7b48f8b4d09b22eb19fcc5)

total: 0 errors, 1 warnings, 0 checks, 38 lines checked
9ae8c0c6f drm/sched: Don't disturb the entity when in RR-mode scheduling
Use of uninitialized value $cid in concatenation (.) or string at scripts/checkpatch.pl line 3228.
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
Don't call drm_sched_select_entity() in drm_sched_run_job_queue().  In fact,

-:28: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'bc8d6a9df99038f61adf2881ad9f717abe414e06', maybe rebased or not pulled?
#28: 
(cherry picked from commit bc8d6a9df99038f61adf2881ad9f717abe414e06)

-:31: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes:  ("drm/sched: Split free_job into own work item")'
#31: 
Fixes: f7fe64ad0f22ff ("drm/sched: Split free_job into own work item")

total: 0 errors, 3 warnings, 0 checks, 36 lines checked
2c6c09fea drm/sched: Qualify drm_sched_wakeup() by drm_sched_entity_is_ready()
Use of uninitialized value $cid in concatenation (.) or string at scripts/checkpatch.pl line 3228.
-:8: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#8: 
can queue to the scheduler, i.e. there is no point in waking up the scheduler

-:11: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'f3123c2590005c5ff631653d31428e40cd10c618', maybe rebased or not pulled?
#11: 
(cherry picked from commit f3123c2590005c5ff631653d31428e40cd10c618)

-:14: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes:  ("drm/sched: Don't disturb the entity when in RR-mode scheduling")'
#14: 
Fixes: bc8d6a9df99038 ("drm/sched: Don't disturb the entity when in RR-mode scheduling")

total: 0 errors, 3 warnings, 0 checks, 39 lines checked
f07d1b2e9 drm/sched: implement dynamic job-flow control
-:24: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'a78422e9dff366b3a46ae44caf6ec8ded9c9fc2f', maybe rebased or not pulled?
#24: 
(cherry picked from commit a78422e9dff366b3a46ae44caf6ec8ded9c9fc2f)

total: 0 errors, 1 warnings, 0 checks, 503 lines checked
5e3805250 drm/sched: Fix bounds limiting when given a malformed entity
Use of uninitialized value $cid in concatenation (.) or string at scripts/checkpatch.pl line 3228.
-:13: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '2bbe6ab2be53858507f11f99f856846d04765ae3', maybe rebased or not pulled?
#13: 
(cherry picked from commit 2bbe6ab2be53858507f11f99f856846d04765ae3)

-:16: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes:  ("drm/sched: Convert the GPU scheduler to variable number of run-queues")'
#16: 
Fixes: 56e449603f0ac5 ("drm/sched: Convert the GPU scheduler to variable number of run-queues")

-:40: CHECK:SPACING: No space is necessary after a cast
#40: FILE: drivers/gpu/drm/scheduler/sched_entity.c:90:
+			entity->priority = max_t(s32, (s32) sched_list[0]->num_rqs - 1,

-:41: CHECK:SPACING: No space is necessary after a cast
#41: FILE: drivers/gpu/drm/scheduler/sched_entity.c:91:
+						 (s32) DRM_SCHED_PRIORITY_MIN);

total: 0 errors, 2 warnings, 2 checks, 20 lines checked
2bcaac06b drm/sched: Rename priority MIN to LOW
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
This mirrors DRM_SCHED_PRIORITY_HIGH, for a list of DRM scheduler priorities

-:18: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'fe375c74806dbd30b00ec038a80a5b7bf4653ab7', maybe rebased or not pulled?
#18: 
(cherry picked from commit fe375c74806dbd30b00ec038a80a5b7bf4653ab7)

-:85: CHECK:SPACING: No space is necessary after a cast
#85: FILE: drivers/gpu/drm/scheduler/sched_entity.c:91:
+						 (s32) DRM_SCHED_PRIORITY_LOW);

total: 0 errors, 2 warnings, 1 checks, 84 lines checked
d49cc24a7 drm/sched: Reverse run-queue priority enumeration
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
Reverse run-queue priority enumeration such that the higest priority is now 0,

-:23: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '38f922a563aac3148ac73e73689805917f034cb5', maybe rebased or not pulled?
#23: 
(cherry picked from commit 38f922a563aac3148ac73e73689805917f034cb5)

-:81: CHECK:SPACING: No space is necessary after a cast
#81: FILE: drivers/gpu/drm/scheduler/sched_entity.c:92:
+						 (s32) DRM_SCHED_PRIORITY_KERNEL);

total: 0 errors, 2 warnings, 1 checks, 90 lines checked
0ed830872 drm/sched: Partial revert of "Qualify drm_sched_wakeup() by drm_sched_entity_is_ready()"
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

-:16: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'f92a39ae47076ea123c7980fb85e6e33313f372e', maybe rebased or not pulled?
#16: 
(cherry picked from commit f92a39ae47076ea123c7980fb85e6e33313f372e)

-:21: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes:  ("drm/sched: Qualify drm_sched_wakeup() by drm_sched_entity_is_ready()")'
#21: 
Fixes: f3123c2590005c ("drm/sched: Qualify drm_sched_wakeup() by drm_sched_entity_is_ready()")

total: 0 errors, 7 warnings, 0 checks, 11 lines checked
855391ae5 fixup! drm/xe: Introduce a new DRM driver for Intel GPUs


