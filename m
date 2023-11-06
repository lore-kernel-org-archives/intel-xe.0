Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7155BC4332F
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 19:28:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC0910E3DD;
	Mon,  6 Nov 2023 19:28:12 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0CCE810E3DD;
 Mon,  6 Nov 2023 19:28:11 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 0BDC0AADD1;
 Mon,  6 Nov 2023 19:28:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Mon, 06 Nov 2023 19:28:11 -0000
Message-ID: <169929889104.20424.17945884335707618328@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231106183938.71640-1-matthew.brost@intel.com>
In-Reply-To: <20231106183938.71640-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Sy?=
 =?utf-8?q?nc_DRM_scheduler_with_upstream?=
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

Series: Sync DRM scheduler with upstream
URL   : https://patchwork.freedesktop.org/series/126029/
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
commit b208d17a08934e2d827731a0b02ec7c49ab754cd
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Nov 6 10:39:38 2023 -0800

    drm/xe: Use pool of ordered wq for GuC submission
    
    To appease lockdep, use a pool of ordered wq for GuC submission rather
    tha leaving the ordered wq allocation to the drm sched. Without this change
    eventually lockdep runs out of hash entries (MAX_LOCKDEP_CHAINS is
    exceeded) as each user allocated exec queue adds more hash table entries
    to lockdep. A pool old of 256 ordered wq should be enough to have
    similar behavior with and without lockdep enabled.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b drm-intel
6425ce83e drm/xe: Update to upstream DRM scheduler code
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

-:1077: CHECK:CAMELCASE: Avoid CamelCase: <Out_free>
#1077: FILE: drivers/gpu/drm/scheduler/sched_main.c:1199:
+		goto Out_free;

-:1082: CHECK:CAMELCASE: Avoid CamelCase: <Out_unroll>
#1082: FILE: drivers/gpu/drm/scheduler/sched_main.c:1204:
+			goto Out_unroll;

-:1346: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#1346: 
new file mode 100644

-:1411: WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#1411: FILE: drivers/gpu/drm/xe/xe_gpu_scheduler.c:61:
+		  uint32_t hw_submission, unsigned hang_limit,

-:1411: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#1411: FILE: drivers/gpu/drm/xe/xe_gpu_scheduler.c:61:
+		  uint32_t hw_submission, unsigned hang_limit,

-:1473: WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#1473: FILE: drivers/gpu/drm/xe/xe_gpu_scheduler.h:16:
+		  uint32_t hw_submission, unsigned hang_limit,

-:1473: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#1473: FILE: drivers/gpu/drm/xe/xe_gpu_scheduler.h:16:
+		  uint32_t hw_submission, unsigned hang_limit,

total: 0 errors, 4 warnings, 4 checks, 2140 lines checked
b208d17a0 drm/xe: Use pool of ordered wq for GuC submission
-:66: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#66: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:234:
+{
+

-:67: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#67: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:235:
+
+}

total: 0 errors, 0 warnings, 2 checks, 103 lines checked


