Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB53CCD1AB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 05:40:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D2E10E6A7;
	Wed, 22 Oct 2025 05:40:18 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D4E10E6A7;
 Wed, 22 Oct 2025 05:40:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_support_for?=
 =?utf-8?q?_Crescent_Island?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 Oct 2025 05:40:16 -0000
Message-ID: <176111161678.40104.18063561424679134288@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251021-cri-v1-0-bf11e61d9f49@intel.com>
In-Reply-To: <20251021-cri-v1-0-bf11e61d9f49@intel.com>
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

Series: drm/xe: Add support for Crescent Island
URL   : https://patchwork.freedesktop.org/series/156297/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
8677d3b99d5fd579c143b22605d99121e2482e8a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 95ae36d63b69fda12564330e9aa0aa60f194cc1d
Author: Lukasz Laguna <lukasz.laguna@intel.com>
Date:   Tue Oct 21 22:17:44 2025 -0700

    drm/xe/pf: Handle MERT catastrophic errors
    
    The MERT block triggers an interrupt when a catastrophic error occurs.
    Update the interrupt handler to read the MERT catastrophic error type
    and log appropriate debug message.
    
    Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch fb0f56ad8a2c9953c57c3337a72ccbf9c5050687 drm-intel
2704d1358415 drm/xe/cri: Add CRI platform definition
449396234b92 topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI
a4ba0e17a6e5 drm/xe/cri: Setup MOCS table
064459b126cd drm/xe/cri: Add new performance limit reasons bits
-:200: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#200: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:276:
+}
+static struct kobj_attribute attr_reason_soc_thermal = __ATTR_RO(reason_soc_thermal);

-:218: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#218: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:320:
+}
+static struct kobj_attribute attr_reason_soc_avg_thermal = __ATTR_RO(reason_soc_avg_thermal);

-:236: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#236: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:342:
+}
+static struct kobj_attribute attr_reason_fastvmode = __ATTR_RO(reason_fastvmode);

-:247: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#247: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:353:
+}
+static struct kobj_attribute attr_reason_mem_thermal = __ATTR_RO(reason_mem_thermal);

-:258: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#258: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:364:
+}
+static struct kobj_attribute attr_reason_vr_thermal = __ATTR_RO(reason_vr_thermal);

-:269: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#269: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:375:
+}
+static struct kobj_attribute attr_reason_iccmax = __ATTR_RO(reason_iccmax);

-:280: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#280: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:386:
+}
+static struct kobj_attribute attr_reason_psys_pl1 = __ATTR_RO(reason_psys_pl1);

-:291: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#291: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:397:
+}
+static struct kobj_attribute attr_reason_psys_pl2 = __ATTR_RO(reason_psys_pl2);

-:302: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#302: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:408:
+}
+static struct kobj_attribute attr_reason_p0_freq = __ATTR_RO(reason_p0_freq);

-:313: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#313: FILE: drivers/gpu/drm/xe/xe_gt_throttle.c:419:
+}
+static struct kobj_attribute attr_reason_psys_crit = __ATTR_RO(reason_psys_crit);

total: 0 errors, 0 warnings, 10 checks, 352 lines checked
e5cbec3d0ba0 drm/xe/cri: Add check to verify if CSC is a PCIe endpoint
67e422b5353a drm/xe/pm: Enable D3cold WAKE# support
1f793ddbf660 drm/xe: Add device flag to indicate standalone MERT
6a91648287bc drm/xe/oa/uapi: Expose MERT OA unit
bf7a6b6998c9 drm/xe/pf: Configure LMTT in MERT
-:15: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#15: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 55 lines checked
98f06d67fb3a drm/xe: Handle MERT interrupts
08b489ecb4f5 drm/xe/pf: Add TLB invalidation support for MERT
95ae36d63b69 drm/xe/pf: Handle MERT catastrophic errors


