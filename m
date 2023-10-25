Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A310C07545
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 04:11:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7169910E548;
	Wed, 25 Oct 2023 04:11:55 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2BA6510E548;
 Wed, 25 Oct 2023 04:11:54 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 2937AAADF1;
 Wed, 25 Oct 2023 04:11:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Wed, 25 Oct 2023 04:11:54 -0000
Message-ID: <169820711416.20490.11266016034557200078@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231025040520.1236213-1-matthew.brost@intel.com>
In-Reply-To: <20231025040520.1236213-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Update_to_upstream_DRM_scheduler_code?=
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

Series: drm/xe: Update to upstream DRM scheduler code
URL   : https://patchwork.freedesktop.org/series/125540/
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
commit 672549977619a1ab7cd54fa168f24c9ec2bbe8fc
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Oct 24 21:05:20 2023 -0700

    drm/xe: Update to upstream DRM scheduler code
    
    The largest change is the message interface has been removed from the
    DRM scheduler. Xe still needs a message interface so it is implemented
    in the Xe driver by adding a Xe scheduler layer.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 4354e27efb78582ee567ba6264c79d0872a3a4e7 drm-intel
672549977 drm/xe: Update to upstream DRM scheduler code
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
-:496: WARNING:LONG_LINE: line length of 202 exceeds 100 columns
#496: FILE: drivers/gpu/drm/scheduler/sched_main.c:75:
+MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");

-:1096: WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#1096: FILE: drivers/gpu/drm/scheduler/sched_main.c:1156:
+		   u32 num_rqs, unsigned hw_submission, unsigned hang_limit,

-:1096: WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#1096: FILE: drivers/gpu/drm/scheduler/sched_main.c:1156:
+		   u32 num_rqs, unsigned hw_submission, unsigned hang_limit,

-:1156: WARNING:OOM_MESSAGE: Possible unnecessary 'out of memory' message
#1156: FILE: drivers/gpu/drm/scheduler/sched_main.c:1199:
+	if (!sched->sched_rq) {
+		drm_err(sched, "%s: out of memory for sched_rq\n", __func__);

-:1164: CHECK:CAMELCASE: Avoid CamelCase: <Out_unroll>
#1164: FILE: drivers/gpu/drm/scheduler/sched_main.c:1207:
+			goto Out_unroll;

-:1426: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#1426: 
new file mode 100644

-:1491: WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#1491: FILE: drivers/gpu/drm/xe/xe_gpu_scheduler.c:61:
+		  uint32_t hw_submission, unsigned hang_limit,

-:1491: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#1491: FILE: drivers/gpu/drm/xe/xe_gpu_scheduler.c:61:
+		  uint32_t hw_submission, unsigned hang_limit,

-:1553: WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#1553: FILE: drivers/gpu/drm/xe/xe_gpu_scheduler.h:16:
+		  uint32_t hw_submission, unsigned hang_limit,

-:1553: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#1553: FILE: drivers/gpu/drm/xe/xe_gpu_scheduler.h:16:
+		  uint32_t hw_submission, unsigned hang_limit,

-:1959: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1959: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:1170:
+	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops, NULL,
 			     q->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,

-:2413: WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#2413: FILE: include/drm/gpu_scheduler.h:533:
+		   u32 num_rqs, uint32_t hw_submission, unsigned hang_limit,

total: 0 errors, 8 warnings, 4 checks, 2218 lines checked


