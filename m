Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52423C43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 16:58:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C97A10EC75;
	Wed,  1 Jul 2026 16:58:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LoHimQ8D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD07010E3E0
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Jul 2026 16:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782925124; x=1814461124;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=absxuFPCTvvc29koUlFMbmgcU+7KqACkeFA2710huSQ=;
 b=LoHimQ8DqUSiRuuugeK96J/ig8Rifn4Suu1lg1ynLA2wqwaOezZwiaBA
 DeqCTztIUuxZer+bFCaYEoz3sAag4PC48LT9/bGWqT3dxnCYzXPxTQua6
 R1U3HTnxnF/+H4K8o8V7GdFfKackKndyY39I7gqWSd0v1gP+E2AFDgHQp
 zFy5xHoKiSFaFaw9am9NDohQD6EgEvB0ZDe7eF94muvOmBG86GDrZDpyU
 FWZiLcKoIQyB+wtXhiA94qJxv/PkoLbvXztZsvVQPd/t8YRJ671dN82H7
 bG9+0nJCrBsmMKlsen+QYgBqUw5Vz6kYun7XrMaCzVF51ySSiKH84XKcc A==;
X-CSE-ConnectionGUID: MycoZeGzQSyoaoYFHs/nNQ==
X-CSE-MsgGUID: pVH064LJR9G5NyVf3mwu7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="94317801"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="94317801"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 09:58:44 -0700
X-CSE-ConnectionGUID: zn2llsI5TSqHRVjwLQxEww==
X-CSE-MsgGUID: i2uTP7HJQvGvM3R0/j4Q4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="290731528"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 09:58:44 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH 2/2] drm/xe: Add support for WA 16029897822
Date: Wed,  1 Jul 2026 09:58:32 -0700
Message-ID: <20260701165830.2355397-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701165830.2355397-3-daniele.ceraolospurio@intel.com>
References: <20260701165830.2355397-3-daniele.ceraolospurio@intel.com>
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
This WA is supported starting from GuC 70.69.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
 drivers/gpu/drm/xe/xe_guc_ads.c       | 4 ++++
 drivers/gpu/drm/xe/xe_wa_oob.rules    | 2 ++
 3 files changed, 7 insertions(+)

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
index becf9a004867..ff36946523aa 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -367,6 +367,10 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 	if (XE_GT_WA(gt, 22022079272) && GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 62))
 		guc_waklv_enable(ads, NULL, 0, &offset, &remain, GUC_WA_KLV_REMAP_RANGED_TLB_INV);
 
+	if (XE_GT_WA(gt, 16029897822) && GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 69))
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

