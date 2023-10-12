Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8E4CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 04:22:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72CEC10E402;
	Thu, 12 Oct 2023 04:22:10 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9509710E402;
 Thu, 12 Oct 2023 04:22:09 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 925EDAA916;
 Thu, 12 Oct 2023 04:22:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Thu, 12 Oct 2023 04:22:09 -0000
Message-ID: <169708452959.25005.11484830964915903141@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231011235126.585242-1-matthew.brost@intel.com>
In-Reply-To: <20231011235126.585242-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_DR?=
 =?utf-8?q?M_scheduler_update?=
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

Series: DRM scheduler update
URL   : https://patchwork.freedesktop.org/series/125012/
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
commit cb7c851703f33a012c8d67425369aff28652ad1b
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Oct 11 16:51:26 2023 -0700

    drm/xe: Update to upstream DRM scheduler code
    
    The largest change is the message interface has been removed from the
    DRM scheduler. Xe still needs a message interface so it is implemented
    in the Xe driver by adding a Xe scheduler layer.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 6c0d1e36f310682297a5b07336b0883afc77f66e drm-intel
cb7c85170 drm/xe: Update to upstream DRM scheduler code
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
-:180: CHECK:LINE_SPACING: Please don't use multiple blank lines
#180: FILE: drivers/gpu/drm/scheduler/sched_entity.c:94:
 
+

-:260: WARNING:LONG_LINE: line length of 202 exceeds 100 columns
#260: FILE: drivers/gpu/drm/scheduler/sched_main.c:93:
+MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");

-:939: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#939: FILE: drivers/gpu/drm/scheduler/sched_main.c:1280:
 
+		}

-:1057: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#1057: 
new file mode 100644

-:1122: WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#1122: FILE: drivers/gpu/drm/xe/xe_gpu_scheduler.c:61:
+		  uint32_t hw_submission, unsigned hang_limit,

-:1122: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#1122: FILE: drivers/gpu/drm/xe/xe_gpu_scheduler.c:61:
+		  uint32_t hw_submission, unsigned hang_limit,

-:1185: WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#1185: FILE: drivers/gpu/drm/xe/xe_gpu_scheduler.h:16:
+		  uint32_t hw_submission, unsigned hang_limit,

-:1185: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#1185: FILE: drivers/gpu/drm/xe/xe_gpu_scheduler.h:16:
+		  uint32_t hw_submission, unsigned hang_limit,

-:1593: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1593: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:1170:
+	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops, NULL,
 			     q->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,

total: 0 errors, 4 warnings, 5 checks, 1805 lines checked


