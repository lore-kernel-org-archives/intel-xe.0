Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39042C43602
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 22:44:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F9D10E413;
	Mon,  6 Jul 2026 22:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U6nUNL/w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F166410E413
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jul 2026 22:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783377837; x=1814913837;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oR+WOoWlBslo2DMa2oAVu5KeiVVNs24/pczSoLj2eBA=;
 b=U6nUNL/wiQ1eS3jrMx2YNkgyyiDyJGYGNHxdgM2JrE9ZxRQXW4QXFBBH
 cCEsqrc2Xjhsvm4KabJNsu5BgF94nLsZd07yGV7YN0ouCjgeidndvAyjx
 6ip1Z6Ywz4sSpTYoRb25rKzaBkwwjrDWAnUv5fup4Stm8AJkqRP3TS84E
 6BsqABNbo3Vqihh5c948lpjOhj1Y08Tdgw3X1M3DWXSpT0Zf2GULJW/HC
 Ozg4KOq0f5f02syAVcLlSHYv/n6dl7E84Q9dvtxQtRIhMZpBtXN9uSWfr
 ohzj+pbNOHBLaNTDDNX2Q1EFck5B+Ud8ewCMp398LniG4/5PbQ5h63yPT g==;
X-CSE-ConnectionGUID: N4eMnH0bSSCIcA6vk0XvLw==
X-CSE-MsgGUID: rVvX4oGRTa+umH6/3S1cQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="83892286"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; d="scan'208";a="83892286"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 15:43:57 -0700
X-CSE-ConnectionGUID: 4QvsyLb5Tam4i9tOhZ/O6w==
X-CSE-MsgGUID: Yk5tsHa3Q6y9lZ7xwnCLTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; d="scan'208";a="283935389"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 15:43:57 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 2/2] drm/xe: Add support for WA 16029897822
Date: Mon,  6 Jul 2026 15:43:46 -0700
Message-ID: <20260706224344.2723462-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706224344.2723462-3-daniele.ceraolospurio@intel.com>
References: <20260706224344.2723462-3-daniele.ceraolospurio@intel.com>
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

The WA is implemented by the GuC, so we just need to enable it via the
dedicated KLV.
This WA is supported starting from GuC 70.69. Note that the GuC does not
enable the relevant feature on NVL-S, so this WA can't (and shouldn't)
be enabled on that platform.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com> #v1
---
v2: don't enable the WA for NVL-S
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
 drivers/gpu/drm/xe/xe_guc_ads.c       | 6 ++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules    | 2 ++
 3 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index fbbee40d7217..e4b028ab24c9 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -505,6 +505,7 @@ enum xe_guc_klv_ids {
 	GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG					= 0x900c,
 	GUC_WA_KLV_CLR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CTX_REG			= 0x900e,
 	GUC_WA_KLV_REMAP_RANGED_TLB_INV							= 0x900f,
+	GUC_WA_KLV_IGNORE_MMIO_READ_SEM_TOKEN_64					= 0x9010,
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index becf9a004867..79d6fd8d919b 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -367,6 +367,12 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 	if (XE_GT_WA(gt, 22022079272) && GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 62))
 		guc_waklv_enable(ads, NULL, 0, &offset, &remain, GUC_WA_KLV_REMAP_RANGED_TLB_INV);
 
+	/* The GuC does not enable the sem_tok_64 feature on NVL-S */
+	if (XE_GT_WA(gt, 16029897822) && gt_to_xe(gt)->info.platform != XE_NOVALAKE_S &&
+	    GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 69))
+		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
+				 GUC_WA_KLV_IGNORE_MMIO_READ_SEM_TOKEN_64);
+
 	size = guc_ads_waklv_size(ads) - remain;
 	if (!size)
 		return;
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index a2ccd036abce..5d6574ec9dee 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -69,3 +69,5 @@
 22022079272	MEDIA_VERSION(3503)
 		GRAPHICS_VERSION(3510)
 		GRAPHICS_VERSION(3511)
+16029897822	MEDIA_VERSION(3500)
+		GRAPHICS_VERSION(3510)
-- 
2.43.0

