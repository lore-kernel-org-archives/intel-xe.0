Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E82ACEACFB
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 23:22:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0898710EB2F;
	Fri, 14 Nov 2025 23:22:02 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F8B10EB2F;
 Fri, 14 Nov 2025 23:22:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Scope-based_forcewake_and?=
 =?utf-8?q?_runtime_PM_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Nov 2025 23:22:00 -0000
Message-ID: <176316252093.56641.12806589317022912607@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251114214335.2388972-29-matthew.d.roper@intel.com>
In-Reply-To: <20251114214335.2388972-29-matthew.d.roper@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Scope-based forcewake and runtime PM (rev4)
URL   : https://patchwork.freedesktop.org/series/157253/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 45f0cad405f735d7bf5e5c05b1d6253ac9ce3bc7
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Fri Nov 14 13:44:03 2025 -0800

    drm/xe/debugfs: Use scope-based runtime PM
    
    Switch the debugfs code to use scope-based runtime PM where possible,
    for consistency with other parts of the driver.
    
    v2:
     - Drop unnecessary 'ret' variables.  (Gustavo)
    
    Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 3e04a6544879d3b9d186bf466fc9c1a8b4d1fa36 drm-intel
b4691c81e5d2 drm/xe/forcewake: Add scope-based cleanup for forcewake
-:102: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'done' - possible side-effects?
#102: FILE: drivers/gpu/drm/xe/xe_force_wake.h:88:
+#define __xe_with_force_wake(ref, fw, domains, done) \
+	for (CLASS(xe_force_wake, ref)(fw, domains), *(done) = NULL; \
+	     !(done); (done) = (void *)1)

total: 0 errors, 0 warnings, 1 checks, 57 lines checked
d076fcdfb3e1 drm/xe/pm: Add scope-based cleanup helper for runtime PM
e8ac9db4f339 drm/xe/gt: Use scope-based cleanup
c4dbd6928320 drm/xe/gt_idle: Use scope-based cleanup
b23dc8980338 drm/xe/guc: Use scope-based cleanup
7300889aa6f3 drm/xe/guc_pc: Use scope-based cleanup
9a813dd4bb52 drm/xe/mocs: Use scope-based cleanup
14ea82867271 drm/xe/pat: Use scope-based forcewake
79228806d76d drm/xe/pxp: Use scope-based cleanup
19be5fa06d00 drm/xe/gsc: Use scope-based cleanup
b0040dddf147 drm/xe/device: Use scope-based cleanup
3c4d8c7524c9 drm/xe/devcoredump: Use scope-based cleanup
0d1e54d870cc drm/xe/display: Use scoped-cleanup
cfa7602e542d drm/xe: Return forcewake reference type from force_wake_get_any_engine()
8fd17fc05f3d drm/xe/drm_client: Use scope-based cleanup
ec660a956fc0 drm/xe/gt_debugfs: Use scope-based cleanup
46307f7f58e0 drm/xe/huc: Use scope-based forcewake
2a65cd5c5e33 drm/xe/query: Use scope-based forcewake
087a2e897b0e drm/xe/reg_sr: Use scope-based forcewake
bcc19884ddde drm/xe/vram: Use scope-based forcewake
91ae50d776f2 drm/xe/bo: Use scope-based runtime PM
4360c707c862 drm/xe/ggtt: Use scope-based runtime pm
fe2920d106cc drm/xe/hwmon: Use scope-based runtime PM
134ae8bed7bf drm/xe/sriov: Use scope-based runtime PM
1b238e870830 drm/xe/tests: Use scope-based runtime PM
140917ded73a drm/xe/sysfs: Use scope-based runtime power management
45f0cad405f7 drm/xe/debugfs: Use scope-based runtime PM


