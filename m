Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D52AC282C5
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 20:54:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B98110ED42;
	Fri, 28 Feb 2025 20:54:02 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C252110ED42;
 Fri, 28 Feb 2025 20:54:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe/vf=3A_Store_the_VF_GuC_version_in_the_compatibility_?=
 =?utf-8?q?struct?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 28 Feb 2025 20:54:00 -0000
Message-ID: <174077604078.3266045.3599746979793235724@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250228200246.3117410-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250228200246.3117410-1-daniele.ceraolospurio@intel.com>
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

Series: series starting with [1/2] drm/xe/vf: Store the VF GuC version in the compatibility struct
URL   : https://patchwork.freedesktop.org/series/145667/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 13c2fd66677bb42dc013ce4f4dbaf1cdbf1f5428
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Fri Feb 28 12:02:46 2025 -0800

    drm/xe/vf: Fix guc_info debugfs for VFs
    
    There are 2 issues with the guc_info debugfs when using it from a VF:
    
    1 - We report a GuC binary path and a GuC release version as wanted, but
        the VF actually wants a compatibility version and no specific binary
    
    2 - We attempt to read a bunch of registers that the VFs doesn't have
        access to.
    
    Fix #1 by setting the VF expected value during handshake and #2 by not
    accessing those registers if VF. The output of the debugfs changes from:
    
    GuC firmware: xe/ptl_guc_70.38.1.bin
            status: PRELOADED
            wanted release version 70.38.1
            found compatibility version 1.18.1
    
    to:
    
    GuC firmware: Loaded by PF
            status: PRELOADED
            wanted compatibility version 1.2.0
            found compatibility version 1.18.1
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Lukasz Laguna <lukasz.laguna@intel.com>
+ /mt/dim checkpatch ca9d01b66c70413a62a1a28fbf8709d2e8440c1c drm-intel
c97ea3e44d4d drm/xe/vf: Store the VF GuC version in the compatibility struct
-:247: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#247: FILE: drivers/gpu/drm/xe/xe_gt_sriov_vf.c:1091:
+	struct xe_uc_fw_version *guc_version = &gt->uc.guc.fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];

total: 0 errors, 1 warnings, 0 checks, 305 lines checked
13c2fd66677b drm/xe/vf: Fix guc_info debugfs for VFs
-:22: WARNING:BAD_SIGN_OFF: Use a single space after To:
#22: 
to:

-:22: ERROR:BAD_SIGN_OFF: Unrecognized email address: ''
#22: 
to:

-:80: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#80: FILE: drivers/gpu/drm/xe/xe_guc.c:1528:
+		drm_printf(p, "\tBootrom status = 0x%x\n",
+			REG_FIELD_GET(GS_BOOTROM_MASK, status));

-:82: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#82: FILE: drivers/gpu/drm/xe/xe_guc.c:1530:
+		drm_printf(p, "\tuKernel status = 0x%x\n",
+			REG_FIELD_GET(GS_UKERNEL_MASK, status));

-:84: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#84: FILE: drivers/gpu/drm/xe/xe_guc.c:1532:
+		drm_printf(p, "\tMIA Core status = 0x%x\n",
+			REG_FIELD_GET(GS_MIA_MASK, status));

-:86: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#86: FILE: drivers/gpu/drm/xe/xe_guc.c:1534:
+		drm_printf(p, "\tLog level = %d\n",
+			xe_guc_log_get_level(&guc->log));

-:91: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#91: FILE: drivers/gpu/drm/xe/xe_guc.c:1539:
+			drm_printf(p, "\t%2d: \t0x%x\n",
+				i, xe_mmio_read32(&gt->mmio, SOFT_SCRATCH(i)));

total: 1 errors, 1 warnings, 5 checks, 94 lines checked


