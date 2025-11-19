Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9950DCF394D
	for <intel-xe@archiver.kernel.org>; Wed, 19 Nov 2025 16:19:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4266710E135;
	Wed, 19 Nov 2025 16:19:21 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F6C10E135;
 Wed, 19 Nov 2025 16:19:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Scope-based_forcewake_and?=
 =?utf-8?q?_runtime_PM_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 19 Nov 2025 16:19:19 -0000
Message-ID: <176356915975.8491.2632188664303163716@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251118164338.3572146-29-matthew.d.roper@intel.com>
In-Reply-To: <20251118164338.3572146-29-matthew.d.roper@intel.com>
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

Series: Scope-based forcewake and runtime PM (rev6)
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
commit 91931c36c47f11dc0572a6d8248684fecce2359c
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Tue Nov 18 08:44:06 2025 -0800

    drm/xe/debugfs: Use scope-based runtime PM
    
    Switch the debugfs code to use scope-based runtime PM where possible,
    for consistency with other parts of the driver.
    
    v2:
     - Drop unnecessary 'ret' variables.  (Gustavo)
    
    Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 186229155346a45a09ce797200476a00872abbd2 drm-intel
91d35c7d68be drm/xe/forcewake: Add scope-based cleanup for forcewake
-:106: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'done' - possible side-effects?
#106: FILE: drivers/gpu/drm/xe/xe_force_wake.h:88:
+#define __xe_with_force_wake(ref, fw, domains, done) \
+	for (CLASS(xe_force_wake, ref)(fw, domains), *(done) = NULL; \
+	     !(done); (done) = (void *)1)

-:119: WARNING:TABSTOP: Statements should start on a tabstop
#119: FILE: drivers/gpu/drm/xe/xe_force_wake.h:101:
+	     if (_T.fw) xe_force_wake_put(_T.fw, _T.domains), fw_ref,

-:119: ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#119: FILE: drivers/gpu/drm/xe/xe_force_wake.h:101:
+	     if (_T.fw) xe_force_wake_put(_T.fw, _T.domains), fw_ref,

total: 1 errors, 1 warnings, 1 checks, 57 lines checked
81421f6b8e15 drm/xe/pm: Add scope-based cleanup helper for runtime PM
f9a7e35f2c0b drm/xe/gt: Use scope-based cleanup
786d1d11ae4e drm/xe/gt_idle: Use scope-based cleanup
d8266a87bad8 drm/xe/guc: Use scope-based cleanup
251528109ce6 drm/xe/guc_pc: Use scope-based cleanup
871566acf540 drm/xe/mocs: Use scope-based cleanup
b75ad56c0de7 drm/xe/pat: Use scope-based forcewake
be60a8a29a8b drm/xe/pxp: Use scope-based cleanup
de9e32ca0b0a drm/xe/gsc: Use scope-based cleanup
8003cc7bd98d drm/xe/device: Use scope-based cleanup
6fb0e755b1c5 drm/xe/devcoredump: Use scope-based cleanup
1d4bd40d93ba drm/xe/display: Use scoped-cleanup
19236936e075 drm/xe: Return forcewake reference type from force_wake_get_any_engine()
636b224c9205 drm/xe/drm_client: Use scope-based cleanup
045eafaf2851 drm/xe/gt_debugfs: Use scope-based cleanup
004e6d1874f2 drm/xe/huc: Use scope-based forcewake
f6b81b2dd2ca drm/xe/query: Use scope-based forcewake
0f380a8bfefd drm/xe/reg_sr: Use scope-based forcewake
a1ac61f85c9c drm/xe/vram: Use scope-based forcewake
d1fc6e7e95e1 drm/xe/bo: Use scope-based runtime PM
e3ab26009e29 drm/xe/ggtt: Use scope-based runtime pm
85d80816c2c8 drm/xe/hwmon: Use scope-based runtime PM
bd3a770e6181 drm/xe/sriov: Use scope-based runtime PM
b18f9ddadfa9 drm/xe/tests: Use scope-based runtime PM
d0c800abb7b8 drm/xe/sysfs: Use scope-based runtime power management
91931c36c47f drm/xe/debugfs: Use scope-based runtime PM


