Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E7FC77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 20 Jun 2025 21:49:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D3010EBE5;
	Fri, 20 Jun 2025 21:49:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JQRE7UZG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85DA110EBCD
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Jun 2025 21:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750456167; x=1781992167;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w0IZ3BiynNWBRCZBZUwD362eKV09j0SkG1ePlOjw0Zo=;
 b=JQRE7UZGyglnS8RPTUe1FPPSYrG3CIoU4Qo9vxgJ7b63kQ7G/C/sXXu6
 5cS6uVNMNNPVC5gNjlL+4zZ/Sz0iCRFbp2mJ99dLm53oEE1Vmgj4pJZIr
 hQMRtxpaLT0UWtm9QWCmlDsz1/C6T0Azs6DMlrQw6yzHrzRXjFw3oGaWb
 JObhnbYYfz8JpPw6E5Gd7FI+HpKWdpDU5J5plOcjeS/hC4PALKBl7Y43x
 Aj3uA2n6LgJydPvgcS+tji+o1WWj6czV3HJx3HVpZZhk24HzXtk7S7lQO
 Ecp5JPOCK81jFjdN+0U67DkYEqU+1UxqLhIKc79P2znkS18Yv6OCnUorl g==;
X-CSE-ConnectionGUID: PoUPntZETVGmi7bSc+cfQw==
X-CSE-MsgGUID: hZXBgpNZS9STYQenu2A32Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="40336504"
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; d="scan'208";a="40336504"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 14:49:27 -0700
X-CSE-ConnectionGUID: ijr9Qn5ySVi/FuN3LjqDjw==
X-CSE-MsgGUID: rYPMMxhzTlidAOOjVWuyeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; d="scan'208";a="151158406"
Received: from msatwood-mobl.jf.intel.com ([10.24.13.181])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 14:49:27 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH 5/5] drm/xe: disable wa_15015404425 for PTL B0
Date: Fri, 20 Jun 2025 14:49:20 -0700
Message-ID: <20250620214920.718179-6-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620214920.718179-1-matthew.s.atwood@intel.com>
References: <20250620214920.718179-1-matthew.s.atwood@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This workaround only applies to PTL Compute Die A0. However, this
information cannot be determined until after the GT is brought up. This
means that we will assume that it is required for the initial bring up of
the gt. After GT init, the oob workarounds are enabled for the GT. Use
this flag to then manually set the bit in the soc oob bit field to 0
which will help performance after device bring up.

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c        | 6 ++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index ded0f3dc8d73..a624c3fb9498 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -34,6 +34,9 @@
 #include "xe_tile.h"
 #include "xe_wa.h"
 
+#include "generated/xe_wa_oob.h"
+#include "generated/xe_soc_wa_oob.h"
+
 enum toggle_d3cold {
 	D3COLD_DISABLE,
 	D3COLD_ENABLE,
@@ -890,6 +893,9 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	drm_dbg(&xe->drm, "d3cold: capable=%s\n",
 		str_yes_no(xe->d3cold.capable));
 
+	if (XE_WA(xe->tiles->media_gt, 15015404425_disable))
+		xe->oob[XE_SOC_WA_OOB_15015404425] = 0;
+
 	return 0;
 
 err_driver_cleanup:
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 8c2aa48cb33a..822cbff13819 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -71,3 +71,4 @@ no_media_l3	MEDIA_VERSION(3000)
 # primary GT GMDID
 14022085890	GRAPHICS_VERSION(2001)
 16026007364 	MEDIA_VERSION(3000)
+15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
-- 
2.49.0

