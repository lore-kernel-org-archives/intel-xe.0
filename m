Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682CAC4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 22:21:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F394910E406;
	Thu,  9 Nov 2023 22:21:25 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id D880510E40B;
 Thu,  9 Nov 2023 22:21:21 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C2FFFA7DFB;
 Thu,  9 Nov 2023 22:21:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Thu, 09 Nov 2023 22:21:21 -0000
Message-ID: <169956848179.26588.8934271213947591724@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231109145347.345120-1-rodrigo.vivi@intel.com>
In-Reply-To: <20231109145347.345120-1-rodrigo.vivi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Sy?=
 =?utf-8?q?nc_DRM_scheduler_with_upstream_=28with_fixups=29_=28rev2=29?=
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

Series: Sync DRM scheduler with upstream (with fixups) (rev2)
URL   : https://patchwork.freedesktop.org/series/126196/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6ca253061ac32c2cf5a118640b1f42e615431914
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Nov 9 09:53:38 2023 -0500

    drm/xe: Use pool of ordered wq for GuC submission
    
    To appease lockdep, use a pool of ordered wq for GuC submission rather
    tha leaving the ordered wq allocation to the drm sched. Without this change
    eventually lockdep runs out of hash entries (MAX_LOCKDEP_CHAINS is
    exceeded) as each user allocated exec queue adds more hash table entries
    to lockdep. A pool old of 256 ordered wq should be enough to have
    similar behavior with and without lockdep enabled.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch b11007e91f8785a96903d9d3c3d1efbe7e969eaf drm-intel
96f42be15 Revert "drm/xe: Use DRM_SCHED_POLICY_SINGLE_ENTITY mode"
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '6e9b5e366a19826fa9946963f63dbc696ff024e5', maybe rebased or not pulled?
#6: 
This reverts commit 6e9b5e366a19826fa9946963f63dbc696ff024e5.

-:40: CHECK:LINE_SPACING: Please don't use multiple blank lines
#40: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:1255:
 
+

total: 0 errors, 1 warnings, 1 checks, 24 lines checked
ae5800707 Revert "drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy"
-:7: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '0dceb0dede50613712a065d627443f4c182e6e2c', maybe rebased or not pulled?
#7: 
This reverts commit 0dceb0dede50613712a065d627443f4c182e6e2c.

-:38: ERROR:SPACING: space required before the open parenthesis '('
#38: FILE: drivers/gpu/drm/scheduler/sched_entity.c:93:
+	if(num_sched_list)

total: 1 errors, 1 warnings, 0 checks, 360 lines checked
9354cc72e Revert "drm/sched: Move schedule policy to scheduler"
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '394fe33ea259ba7b01dd7b24cc7e9ddf98551c56', maybe rebased or not pulled?
#6: 
This reverts commit 394fe33ea259ba7b01dd7b24cc7e9ddf98551c56.

-:171: WARNING:LONG_LINE: line length of 202 exceeds 100 columns
#171: FILE: drivers/gpu/drm/scheduler/sched_main.c:75:
+MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");

total: 0 errors, 2 warnings, 0 checks, 276 lines checked
f8ea6c6d5 Revert "drm/sched: Add helper to set TDR timeout"
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'fcaa05c341776711572a1473678e5814d5c46bed', maybe rebased or not pulled?
#6: 
This reverts commit fcaa05c341776711572a1473678e5814d5c46bed.

total: 0 errors, 1 warnings, 0 checks, 31 lines checked
45ce7cd03 Revert "drm/sched: Submit job before starting TDR"
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '06a66bcdeeaedd17092c6c0829eaa71c199e9525', maybe rebased or not pulled?
#6: 
This reverts commit 06a66bcdeeaedd17092c6c0829eaa71c199e9525.

total: 0 errors, 1 warnings, 0 checks, 11 lines checked
b8cf68394 Revert "drm/sched: Start run wq before TDR in drm_sched_start"
-:7: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '5cc2f8e4eeb94814a95d46fa3ca9d2f7a0dc89b5', maybe rebased or not pulled?
#7: 
This reverts commit 5cc2f8e4eeb94814a95d46fa3ca9d2f7a0dc89b5.

total: 0 errors, 1 warnings, 0 checks, 15 lines checked
72b0e863c Revert "drm/sched: Add generic scheduler message interface"
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '567df7bf2005777a866c3ea15e96368caff69315', maybe rebased or not pulled?
#6: 
This reverts commit 567df7bf2005777a866c3ea15e96368caff69315.

total: 0 errors, 1 warnings, 0 checks, 158 lines checked
9b397b55d Revert "drm/sched: Convert drm scheduler to use a work queue rather than kthread"
-:7: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'f541e47f2535bf55054ce006fd6673964c989047', maybe rebased or not pulled?
#7: 
This reverts commit f541e47f2535bf55054ce006fd6673964c989047.

-:207: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#207: FILE: drivers/gpu/drm/msm/msm_ringbuffer.c:98:
+	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
+			num_hw_submissions, 0, sched_timeout,

-:464: WARNING:TYPO_SPELLING: 'seperate' may be misspelled - perhaps 'separate'?
#464: FILE: drivers/gpu/drm/scheduler/sched_main.c:1119:
+	/* Each scheduler will run on a seperate kernel thread */
 	                                ^^^^^^^^

total: 0 errors, 2 warnings, 1 checks, 504 lines checked
cb6f62b39 Revert "drm/sched: Don't store self-dependencies"
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'b832c809e82fe0767f486a5707f5808602c58480', maybe rebased or not pulled?
#6: 
This reverts commit b832c809e82fe0767f486a5707f5808602c58480.

total: 0 errors, 1 warnings, 0 checks, 13 lines checked
dd60010c8 gpu/drm: Eliminate DRM_SCHED_PRIORITY_UNSET
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
calls drm_sched_entity_init() with DRM_SCHED_PRIORITY_UNSET, which uses it to

total: 0 errors, 1 warnings, 0 checks, 18 lines checked
4ad328e61 drm/sched: Convert the GPU scheduler to variable number of run-queues
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
The GPU scheduler has now a variable number of run-queues, which are set up at

-:263: WARNING:OOM_MESSAGE: Possible unnecessary 'out of memory' message
#263: FILE: drivers/gpu/drm/scheduler/sched_main.c:1127:
+	if (!sched->sched_rq) {
+		drm_err(sched, "%s: out of memory for sched_rq\n", __func__);

-:271: CHECK:CAMELCASE: Avoid CamelCase: <Out_unroll>
#271: FILE: drivers/gpu/drm/scheduler/sched_main.c:1135:
+			goto Out_unroll;

total: 0 errors, 2 warnings, 1 checks, 302 lines checked
b6ea1e589 dma-buf: add dma_fence_timestamp helper
-:19: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#19: 
v2 by teddy: add a wait parameter to wait for the timestamp to show up, in case

total: 0 errors, 1 warnings, 0 checks, 69 lines checked
ac07f77c1 drm/sched: Add drm_sched_wqueue_* helpers
f1e6df459 drm/sched: Convert drm scheduler to use a work queue rather than kthread
-:314: CHECK:CAMELCASE: Avoid CamelCase: <Out_free>
#314: FILE: drivers/gpu/drm/scheduler/sched_main.c:1133:
+		goto Out_free;

total: 0 errors, 0 warnings, 1 checks, 395 lines checked
412571298 drm/sched: Split free_job into own work item
-:22: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#22: 
  - s/drm_sched_free_job_queue_if_ready/drm_sched_free_job_queue_if_done (Luben)

total: 0 errors, 1 warnings, 0 checks, 226 lines checked
d5eb7ac18 drm/sched: Add drm_sched_start_timeout_unlocked helper
c0cf13f01 drm/sched: Add a helper to queue TDR immediately
bc41cc6ba fixup! drm/xe: Introduce a new DRM driver for Intel GPUs
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:124: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#124: 
new file mode 100644

-:189: WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#189: FILE: drivers/gpu/drm/xe/xe_gpu_scheduler.c:61:
+		  uint32_t hw_submission, unsigned hang_limit,

-:189: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#189: FILE: drivers/gpu/drm/xe/xe_gpu_scheduler.c:61:
+		  uint32_t hw_submission, unsigned hang_limit,

-:251: WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#251: FILE: drivers/gpu/drm/xe/xe_gpu_scheduler.h:16:
+		  uint32_t hw_submission, unsigned hang_limit,

-:251: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#251: FILE: drivers/gpu/drm/xe/xe_gpu_scheduler.h:16:
+		  uint32_t hw_submission, unsigned hang_limit,

-:657: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#657: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:1170:
+	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops, NULL,
 			     q->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,

-:945: ERROR:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal patch author 'Matthew Brost <matthew.brost@intel.com>'

total: 1 errors, 4 warnings, 3 checks, 842 lines checked
5989ed279 fixup! drm/xe: Fix potential deadlock handling page faults
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:20: ERROR:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal patch author 'Matthew Brost <matthew.brost@intel.com>'

total: 1 errors, 1 warnings, 0 checks, 8 lines checked
6ca253061 drm/xe: Use pool of ordered wq for GuC submission
-:67: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#67: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:234:
+{
+

-:68: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#68: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:235:
+
+}

total: 0 errors, 0 warnings, 2 checks, 105 lines checked


