Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D007CD4846
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 17:24:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D0E10E6AF;
	Fri, 22 Sep 2023 17:24:43 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 662D510E6B0;
 Fri, 22 Sep 2023 17:24:42 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5D628AADD8;
 Fri, 22 Sep 2023 17:24:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Fri, 22 Sep 2023 17:24:42 -0000
Message-ID: <169540348237.5199.17334901714272916960@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230920231942.2706278-1-matthew.brost@intel.com>
In-Reply-To: <20230920231942.2706278-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_DR?=
 =?utf-8?q?M_scheduler_update_=28rev2=29?=
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

Series: DRM scheduler update (rev2)
URL   : https://patchwork.freedesktop.org/series/124021/
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
commit de1fa34b55dcc71aabeed2ae6f35c646f6a10003
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Sep 20 16:19:42 2023 -0700

    drm/xe: Update to upstream DRM scheduler code
    
    The largest change is the message interface has been removed from the
    DRM scheduler. Xe still needs a message interface so it is implemented
    in the Xe driver by adding a Xe scheduler layer.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 6149acb947f2f8b65ee1a058982a5d6fce3124ec drm-intel
de1fa34b5 drm/xe: Update to upstream DRM scheduler code
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
-:202: WARNING:LONG_LINE: line length of 202 exceeds 100 columns
#202: FILE: drivers/gpu/drm/scheduler/sched_main.c:93:
+MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");

-:768: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#768: FILE: drivers/gpu/drm/scheduler/sched_main.c:1169:
+			DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
+				  r);

-:879: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#879: FILE: drivers/gpu/drm/scheduler/sched_main.c:1360:
+
+}

-:969: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#969: 
new file mode 100644

-:1034: WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#1034: FILE: drivers/gpu/drm/xe/xe_gpu_scheduler.c:61:
+		  uint32_t hw_submission, unsigned hang_limit,

-:1034: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#1034: FILE: drivers/gpu/drm/xe/xe_gpu_scheduler.c:61:
+		  uint32_t hw_submission, unsigned hang_limit,

-:1097: WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#1097: FILE: drivers/gpu/drm/xe/xe_gpu_scheduler.h:16:
+		  uint32_t hw_submission, unsigned hang_limit,

-:1097: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#1097: FILE: drivers/gpu/drm/xe/xe_gpu_scheduler.h:16:
+		  uint32_t hw_submission, unsigned hang_limit,

-:1505: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1505: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:1169:
+	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops, NULL,
 			     q->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,

total: 0 errors, 4 warnings, 5 checks, 1717 lines checked


