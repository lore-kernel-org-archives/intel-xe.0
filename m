Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED48CA1016
	for <intel-xe@archiver.kernel.org>; Mon,  8 Sep 2025 15:26:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA64510E53E;
	Mon,  8 Sep 2025 15:26:14 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 607B310E53E;
 Mon,  8 Sep 2025 15:26:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/debugfs=3A_Don=27t?=
 =?utf-8?q?_expose_dgfx_residencies_attributes_on_VF?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 08 Sep 2025 15:26:13 -0000
Message-ID: <175734517339.313432.1429400447036980624@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250905173625.8398-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250905173625.8398-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/debugfs: Don't expose dgfx residencies attributes on VF
URL   : https://patchwork.freedesktop.org/series/154110/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f7e0e6277ba784ba915913ac027859a8a3c9d422
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Fri Sep 5 19:36:25 2025 +0200

    drm/xe/debugfs: Don't expose dgfx residencies attributes on VF
    
    In addition of checking if we are running on the BATTLEMAGE,
    we should also check for not being a VF driver, as VFs can't
    access necessary registers, and doing so leads to:
    
     | .. [drm] GT0: VF is trying to read an inaccessible register 0x35b004+0x0
     | RIP: 0010:xe_gt_sriov_vf_read32+0x5e2/0x8a0 [xe]
     | Call Trace:
     |  xe_mmio_read32+0x110/0x280 [xe]
     |  read_residency_counter+0x42/0xd0 [xe]
     |  dgfx_pkg_residencies_show+0x115/0x190 [xe]
     | .. [drm] Package G2 counter failed to read, ret -19
    
    or
    
     | .. [drm] GT0: VF is trying to read an inaccessible register 0x35b004+0x0
     | RIP: 0010:xe_gt_sriov_vf_read32+0x5e2/0x8a0 [xe]
     | Call Trace:
     |  xe_mmio_read32+0x110/0x280 [xe]
     |  read_residency_counter+0x42/0xd0 [xe]
     |  dgfx_pcie_link_residencies_show+0xe7/0x160 [xe]
     | .. [drm] PCIE LINK L0 RESIDENCY counter failed to read, ret -19
    
    Similarly, there is no point to expose inject_csc_hw_error on VFs,
    as HW errors support is already disabled for VFs.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Soham Purkait <soham.purkait@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch ebf01ea46d9db9493cf6abb4d6cdc1da2110549d drm-intel
f7e0e6277ba7 drm/xe/debugfs: Don't expose dgfx residencies attributes on VF
-:49: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


