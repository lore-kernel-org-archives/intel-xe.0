Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45B7CCF9F8
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 20:43:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8F510EB7F;
	Fri,  7 Nov 2025 20:43:46 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64BC410EB7F;
 Fri,  7 Nov 2025 20:43:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Scope-based_forcewake_and?=
 =?utf-8?q?_runtime_PM?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Nov 2025 20:43:45 -0000
Message-ID: <176254822540.31057.3722211837458306962@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251107181315.631642-35-matthew.d.roper@intel.com>
In-Reply-To: <20251107181315.631642-35-matthew.d.roper@intel.com>
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

Series: Scope-based forcewake and runtime PM
URL   : https://patchwork.freedesktop.org/series/157253/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d9120d4d84745cf011b4b3efb338747e69179dfb
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3e7b4b04ed1d66f9b0401869f1cb8b93f3f23ac4
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Fri Nov 7 10:13:49 2025 -0800

    drm/xe/debugfs: Use scope-based runtime PM
    
    Switch the debugfs code to use scope-based runtime PM where possible,
    for consistency with other parts of the driver.
    
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 4dff427fe8bbfd0bdbf7935d23a2aba0c350ab2d drm-intel
71511280d127 drm/xe/forcewake: Improve kerneldoc
1d73ee63879f drm/xe/eustall: Store forcewake reference in stream structure
b9fdd277fab0 drm/xe/oa: Store forcewake reference in stream structure
a12f36f0e820 drm/xe/forcewake: Create dedicated type for forcewake references
054b488a6db7 squash! drm/xe/forcewake: Create dedicated type for forcewake references
-:290: WARNING:BRACES: braces {} are not necessary for single statement blocks
#290: FILE: drivers/gpu/drm/xe/xe_gsc.c:284:
+	if (tile->primary_gt && XE_GT_WA(tile->primary_gt, 14018094691)) {
+		xe_force_wake_put(fw_ref);
+	}

total: 0 errors, 1 warnings, 0 checks, 1031 lines checked
d4d69ec2816f squash! squash! drm/xe/forcewake: Create dedicated type for forcewake references
21f16cf0b765 drm/xe/forcewake: Add scope-based cleanup for forcewake
bafed0fabeb2 drm/xe/pm: Add scope-based cleanup helper for runtime PM
4b1a1a664eb6 drm/xe/gt: Use scope-based cleanup
65cca554e566 drm/xe/gt_idle: Use scope-based cleanup
5115ce172ced drm/xe/guc: Use scope-based cleanup
50c9332fe31d drm/xe/guc_pc: Use scope-based cleanup
2254bb670c04 drm/xe/mocs: Use scope-based cleanup
817bee049941 drm/xe/pat: Use scope-based forcewake
7e3879d5d8ef drm/xe/pxp: Use scope-based cleanup
61ca2c189ee2 drm/xe/gsc: Use scope-based cleanup
03fdb5e56a93 drm/xe/device: Use scope-based cleanup
-:39: ERROR:ASSIGN_IN_IF: do not use assignment in if condition
#39: FILE: drivers/gpu/drm/xe/xe_device.c:222:
+	if ((ret = ACQUIRE_ERR(xe_pm_runtime_ioctl, &pm)) >= 0)

-:52: ERROR:ASSIGN_IN_IF: do not use assignment in if condition
#52: FILE: drivers/gpu/drm/xe/xe_device.c:239:
+	if ((ret = ACQUIRE_ERR(xe_pm_runtime_ioctl, &pm)) >= 0)

total: 2 errors, 0 warnings, 0 checks, 109 lines checked
cd4b190c8394 drm/xe/devcoredump: Use scope-based cleanup
ae9c45a3c213 drm/xe/display: Use scoped-cleanup
-:24: ERROR:ASSIGN_IN_IF: do not use assignment in if condition
#24: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:215:
+	if ((ret = ACQUIRE_ERR(mutex_intr, &lock)))

total: 1 errors, 0 warnings, 0 checks, 122 lines checked
16e480d2e64f drm/xe: Create scoped cleanup class for force_wake_get_any_engine()
526913b58b1b drm/xe/drm_client: Use scope-based cleanup
bcf1d955d0af drm/xe/gt_debugfs: Use scope-based cleanup
b0a9566ce664 drm/xe/huc: Use scope-based forcewake
0db66e348ecc drm/xe/query: Use scope-based forcewake
dec7534cdc08 drm/xe/reg_sr: Use scope-based forcewake
959bf6515c4a drm/xe/vram: Use scope-based forcewake
ad718e04d8ab drm/xe/bo: Use scope-based runtime PM
5722d706ed42 drm/xe/ggtt: Use scope-based runtime pm
d6de7b0c6686 drm/xe/hwmon: Use scope-based runtime PM
5333dbb282ba drm/xe/sriov: Use scope-based runtime PM
808fe73dca75 drm/xe/tests: Use scope-based runtime PM
60f137f1bed1 drm/xe/sysfs: Use scope-based runtime power management
3e7b4b04ed1d drm/xe/debugfs: Use scope-based runtime PM


