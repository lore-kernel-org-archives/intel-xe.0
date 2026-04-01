Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1520110F6FDB
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 22:11:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCBB710ED77;
	Wed,  1 Apr 2026 22:11:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aPQ4XhVe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4B810ED77
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 22:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775081477; x=1806617477;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=GjFEbH4kidCoAZ8Xt/8dJBZwhEjbJKC+sljUtiJpW+I=;
 b=aPQ4XhVe6X0WG4W55SGvqInE+UdnjE6gz1Sg+Qy5U6y8j6KIU8C3C32N
 f3H5AgqgAiE9z0IlKi0OcQsMFXl9c9Y83PzvpcPyMRmsCrfMayvvRxjOW
 669G93iATOAM8yR+ey7MTU85gc4jx6knO/s4f6UKpWHrkwhtIXmqrWagq
 rnYyVD5+z7ADBSDs0Vcw67u4AH2vu8fsy7+jLdWkOmcPaJS1mRKG6PL7e
 SZhNVsPKoiDPcuIO55sWJrI11PB75sV+54y/5cwg1sCfa0m/Ch01w7hks
 IG1g95A9+R0THUFSIzarcFf0nj+mNKNsZcTLIbrBLmU+FGQdXn9bDNe0P Q==;
X-CSE-ConnectionGUID: CpY3x5uERRKK848+hWASow==
X-CSE-MsgGUID: nViDiNfKQ8KXjTi6YNKHbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="75852131"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="75852131"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 15:11:17 -0700
X-CSE-ConnectionGUID: ARGxxoB8SsWldbekNuIoug==
X-CSE-MsgGUID: oA+2g4vkQiefjuMRPQvf1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="222439559"
Received: from bkammerd-mobl.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.223.70])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 15:11:16 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Wed, 01 Apr 2026 19:10:51 -0300
Subject: [PATCH] drm/xe/xe3p_lpg: Add missing indirect ring state feature flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-xe3p_lpg-indirect-ring-state-v1-1-0e4b5edf6898@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqEMAwAwK9IzgbauOvBr4iI2mwNSC1pkYL4d
 8se5zI3JFbhBENzg/IlSc5QYdsGtn0JnlFcNZCh3nyMxcJdnI/oUYIT5S2jSvCY8pIZeyLj7He
 ljghqEZV/Uv79OD3PC961Q5tuAAAA
X-Change-ID: 20260401-xe3p_lpg-indirect-ring-state-6220d15b2322
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Even though commit 8fcb7dfb8bbf ("drm/xe/xe3p_lpg: Add support for
graphics IP 35.10") mentions that the support for Indirect Ring State
exists for Xe3p_LPG, it missed actually setting the feature flag in
graphics_xe3p_lpg.  Fix that by adding the missing member.

Fixes: 8fcb7dfb8bbf ("drm/xe/xe3p_lpg: Add support for graphics IP 35.10")
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 1df3f08e2e1c..6e560ef84a97 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -118,6 +118,7 @@ static const struct xe_graphics_desc graphics_xe2 = {
 
 static const struct xe_graphics_desc graphics_xe3p_lpg = {
 	XE2_GFX_FEATURES,
+	.has_indirect_ring_state = 1,
 	.multi_queue_engine_class_mask = BIT(XE_ENGINE_CLASS_COPY) | BIT(XE_ENGINE_CLASS_COMPUTE),
 	.num_geometry_xecore_fuse_regs = 3,
 	.num_compute_xecore_fuse_regs = 3,

---
base-commit: 40f5b5bc2d3df4c7c2d4e27b35b2d8179ac3f10b
change-id: 20260401-xe3p_lpg-indirect-ring-state-6220d15b2322

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

