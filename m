Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D02BC25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 14:53:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 422E610E2C7;
	Mon,  3 Jun 2024 14:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ntUEDDuV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818E210E2C7
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 14:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717426409; x=1748962409;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=098dgKsyK8U03giMs8X5g35lm6XtVu9hs+prMSYa4U8=;
 b=ntUEDDuVcOymGg/rVeXVxLa5kROSbRmIKg+DaId3iwcp0Z3RMmIE3/BK
 21W4eaHqWK0+MEWqPYbUZn/2Yjz2uQUnwXhEvdCb9Z63x3qxj09U6DG+w
 RER8kC0Mw8BOBDVqSg280u//D+PuC6QJZgd+8DSex1B3ZCASUzKXawvdu
 r6mXeNO5EeCtPwOnzjQwnXc7/Tsczy2THQOeNWkRscLW4nxlUtX1io4+P
 HtqGxBAjiE6bc12y5UafoplJc6XMP1LnMHNIxdKLG7b+LPyMj+sXWbS7X
 M4NOM/S24x2rtvF6jE67mnpFPVCAd+3f3x3ooi2VCuIZMGvrPpg4ck9mD g==;
X-CSE-ConnectionGUID: /Fj87gfNTd6S7RB5YWMw7A==
X-CSE-MsgGUID: ef5UY8dNQm2cC2itLA0/eQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="11876082"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="11876082"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 07:53:15 -0700
X-CSE-ConnectionGUID: yj22n5lURUm7Pi0o8rhxyQ==
X-CSE-MsgGUID: D92ZtseZTvOaGqoNPvs3Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="41818098"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 07:53:12 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: gregory.f.germano@intel.com, Vitasta Wattal <vitasta.wattal@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH] drm/xe/bmg: Add PCI IDs
Date: Mon,  3 Jun 2024 20:24:30 +0530
Message-Id: <20240603145430.1260817-1-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
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

From: Matt Roper <matthew.d.roper@intel.com>

Add the initial set of device IDs for Battlemage.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c   | 3 ++-
 include/drm/intel/xe_pciids.h | 7 +++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 5655222aa4e1..ebff5ea79b1d 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -340,7 +340,7 @@ static const struct xe_device_desc lnl_desc = {
 	.require_force_probe = true,
 };
 
-static const struct xe_device_desc bmg_desc __maybe_unused = {
+static const struct xe_device_desc bmg_desc = {
 	DGFX_FEATURES,
 	PLATFORM(BATTLEMAGE),
 	.has_display = true,
@@ -391,6 +391,7 @@ static const struct pci_device_id pciidlist[] = {
 	XE_PVC_IDS(INTEL_VGA_DEVICE, &pvc_desc),
 	XE_MTL_IDS(INTEL_VGA_DEVICE, &mtl_desc),
 	XE_LNL_IDS(INTEL_VGA_DEVICE, &lnl_desc),
+	XE_BMG_IDS(INTEL_VGA_DEVICE, &bmg_desc),
 	{ }
 };
 MODULE_DEVICE_TABLE(pci, pciidlist);
diff --git a/include/drm/intel/xe_pciids.h b/include/drm/intel/xe_pciids.h
index c7fc288dacee..73d972a8aca1 100644
--- a/include/drm/intel/xe_pciids.h
+++ b/include/drm/intel/xe_pciids.h
@@ -208,4 +208,11 @@
 	MACRO__(0x64A0, ## __VA_ARGS__), \
 	MACRO__(0x64B0, ## __VA_ARGS__)
 
+#define XE_BMG_IDS(MACRO__, ...) \
+	MACRO__(0xE202, ## __VA_ARGS__), \
+	MACRO__(0xE20B, ## __VA_ARGS__), \
+	MACRO__(0xE20C, ## __VA_ARGS__), \
+	MACRO__(0xE20D, ## __VA_ARGS__), \
+	MACRO__(0xE212, ## __VA_ARGS__)
+
 #endif
-- 
2.25.1

