Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4122BE6781B
	for <intel-xe@archiver.kernel.org>; Mon, 22 Dec 2025 23:48:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F28F410E06C;
	Mon, 22 Dec 2025 23:48:51 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5DB10E06C;
 Mon, 22 Dec 2025 23:48:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/configs=3A_Fix_bui?=
 =?utf-8?q?ld_breaks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 22 Dec 2025 23:48:50 -0000
Message-ID: <176644733096.112879.18183232086415015849@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251222175006.9706-1-michal.wajdeczko@intel.com>
In-Reply-To: <20251222175006.9706-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/configs: Fix build breaks
URL   : https://patchwork.freedesktop.org/series/159395/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99339247d1ae4378b24366da182e712bdc623311
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5372c9080cbe13be468409dc80c9147fe21a394f
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Mon Dec 22 18:50:06 2025 +0100

    drm/xe/configfs: Fix 'undefined reference to xe_configfs_...' errors
    
    On configs where Xe is built-in (DRM_XE=y) but configfs is defined
    as a module (CONFIGFS=m), we were not enabling our configfs stubs,
    which might lead to the following build errors:
    
       powerpc64-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `xe_guc_init_post_hwconfig':
       xe_guc.c:(.text+0x2f08): undefined reference to `xe_configfs_get_psmi_enabled'
       powerpc64-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_hw_engines_init_early':
       xe_hw_engine.c:(.text+0xedc): undefined reference to `xe_configfs_get_engines_allowed'
       powerpc64-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_post_ctx_restore_bb':
       xe_lrc.c:(.text+0xb30): undefined reference to `xe_configfs_get_ctx_restore_post_bb'
       powerpc64-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_mid_ctx_restore_bb':
       xe_lrc.c:(.text+0xbc0): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
       powerpc64-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `xe_lrc_init':
       xe_lrc.c:(.text+0x32fc): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
       powerpc64-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.data.rel.ro+0x10): undefined reference to `xe_configfs_init'
       powerpc64-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.data.rel.ro+0x18): undefined reference to `xe_configfs_exit'
       powerpc64-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_pci_probe':
       xe_pci.c:(.text+0x1514): undefined reference to `xe_configfs_check_device'
       powerpc64-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_debugfs_register':
       xe_psmi.c:(.text+0x508): undefined reference to `xe_configfs_get_psmi_enabled'
       powerpc64-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_init':
       xe_psmi.c:(.text+0x5c4): undefined reference to `xe_configfs_get_psmi_enabled'
       powerpc64-linux-ld: drivers/gpu/drm/xe/xe_rtp.o: in function `xe_rtp_match_psmi_enabled':
       xe_rtp.c:(.text+0xba0): undefined reference to `xe_configfs_get_psmi_enabled'
       powerpc64-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_is_requested':
       xe_survivability_mode.c:(.text+0x434): undefined reference to `xe_configfs_get_survivability_mode'
       powerpc64-linux-ld: drivers/gpu/drm/xe/xe_sriov_pf.o: in function `xe_sriov_pf_readiness':
       xe_sriov_pf.c:(.text+0x2a0): undefined reference to `xe_configfs_get_max_vfs'
    
    Fix that by using IS_REACHABLE check instead of IS_ENABLED when
    deciding whether to stub variant or not.
    
    Fixes: 16280ded45fb ("drm/xe: Add configfs to enable survivability mode")
    Reported-by: kernel test robot <lkp@intel.com>
    Closes: https://lore.kernel.org/oe-kbuild-all/202512190407.CcUFXX2F-lkp@intel.com/
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch f101d56dc32350daa45c130ff7a6d46512f614a9 drm-intel
f69ca6f24817 drm/xe/configfs: Fix 'parameter name omitted' errors
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
   static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,

total: 0 errors, 1 warnings, 0 checks, 11 lines checked
5372c9080cbe drm/xe/configfs: Fix 'undefined reference to xe_configfs_...' errors
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `xe_guc_init_post_hwconfig':

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


