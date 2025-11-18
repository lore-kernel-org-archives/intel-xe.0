Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44411CEE348
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 18:08:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058ED10E081;
	Tue, 18 Nov 2025 18:08:50 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BEF510E081;
 Tue, 18 Nov 2025 18:08:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Scope-based_forcewake_and?=
 =?utf-8?q?_runtime_PM_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Nov 2025 18:08:49 -0000
Message-ID: <176348932904.6922.17662541390243144178@a3b018990fe9>
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

Series: Scope-based forcewake and runtime PM (rev5)
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
commit f395230cc4933124b2d2d8a16acb1c2108ae25f6
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Tue Nov 18 08:44:06 2025 -0800

    drm/xe/debugfs: Use scope-based runtime PM
    
    Switch the debugfs code to use scope-based runtime PM where possible,
    for consistency with other parts of the driver.
    
    v2:
     - Drop unnecessary 'ret' variables.  (Gustavo)
    
    Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch b603326a067916accf680fd623f4fc3c22bba487 drm-intel
eb8e939870d4 drm/xe/forcewake: Add scope-based cleanup for forcewake
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
d99a315dfc26 drm/xe/pm: Add scope-based cleanup helper for runtime PM
ad9e2bda06a1 drm/xe/gt: Use scope-based cleanup
e3bfadf88ab6 drm/xe/gt_idle: Use scope-based cleanup
d98990ea0d01 drm/xe/guc: Use scope-based cleanup
7daa07e84572 drm/xe/guc_pc: Use scope-based cleanup
ae4c7abb6d7a drm/xe/mocs: Use scope-based cleanup
884f34df8038 drm/xe/pat: Use scope-based forcewake
a17dfe2f7b0f drm/xe/pxp: Use scope-based cleanup
7989f70393d7 drm/xe/gsc: Use scope-based cleanup
a4d16661d098 drm/xe/device: Use scope-based cleanup
a5d9e24c3489 drm/xe/devcoredump: Use scope-based cleanup
1b979bab0b5a drm/xe/display: Use scoped-cleanup
83c429eccb13 drm/xe: Return forcewake reference type from force_wake_get_any_engine()
e6ab32db7e6a drm/xe/drm_client: Use scope-based cleanup
7102a0fdc20b drm/xe/gt_debugfs: Use scope-based cleanup
f02246c1a8fd drm/xe/huc: Use scope-based forcewake
dd742fc7c465 drm/xe/query: Use scope-based forcewake
628c69894f5c drm/xe/reg_sr: Use scope-based forcewake
7f4c6889cd19 drm/xe/vram: Use scope-based forcewake
a88a6b5e83bf drm/xe/bo: Use scope-based runtime PM
bcfd2b18e541 drm/xe/ggtt: Use scope-based runtime pm
3f665ed9436c drm/xe/hwmon: Use scope-based runtime PM
6eb68fb527bd drm/xe/sriov: Use scope-based runtime PM
80b755ad85ef drm/xe/tests: Use scope-based runtime PM
8959c5808d9b drm/xe/sysfs: Use scope-based runtime power management
f395230cc493 drm/xe/debugfs: Use scope-based runtime PM


