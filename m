Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2FCE6FE49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 21:48:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B7C10EAF8;
	Fri,  6 Sep 2024 21:48:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LfQG4drd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 887A710EAF8
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 21:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725659334; x=1757195334;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qVl2gzTDkvjIUhqzvHXBOGeqESne1sEMPw3crXgIPq0=;
 b=LfQG4drdJTc3yJM2HE4u2hVNWpy9Ua8iWflwH65pgbm11AuIEQQzvtTo
 nV2a5cvqRX4qdmep91NuAGp53riIk5jx6NaVhLtE64ItQEzizNv31LMlz
 bZYGQi4tHtQ+ga4ZQtsCdf06/Lq/3D+cVEWbG60qrW0yKemDTZZPSFrcz
 bqny4E55klRU0KoyjbcbJlCC632PWayJCM7KTBqw7Li3RU484iQihAdXD
 FNuz4gPm8p9DcryHlcwUXBCeONIyhE4OyWgtp9D8uW2GWHN4giumNH63W
 ka3NIoPEoxCZA+wusjWesTj95QtOab1GPHI9qFbe3mp8V9sOoYiLUPAOx w==;
X-CSE-ConnectionGUID: s9AbgyAKRiyI4kK9v6PzMA==
X-CSE-MsgGUID: 7Zq2CELlSieDYsPnO5xSjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24543073"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="24543073"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 14:48:54 -0700
X-CSE-ConnectionGUID: t9exeqqGS2aXs2coRx2Nxg==
X-CSE-MsgGUID: hBADk1s9RACYE9pTRhYBQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="96860170"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 14:48:53 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Jose Souza <jose.souza@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH] drm/xe/oa: Enable PES disaggregation
Date: Fri,  6 Sep 2024 14:48:39 -0700
Message-ID: <20240906214839.2460360-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

PES disaggregation for OAG needs to be enabled to obtain disaggregated
metrics when disaggregated data is needed.

Bspec: 61101
Fixes: e936f885f1e9 ("drm/xe/oa/uapi: Expose OA stream fd")
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_oa_regs.h | 1 +
 drivers/gpu/drm/xe/xe_oa.c           | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_oa_regs.h b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
index 1189f5a540a82..a9b0091cb7ee1 100644
--- a/drivers/gpu/drm/xe/regs/xe_oa_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
@@ -52,6 +52,7 @@
 #define  OAG_OABUFFER_MEMORY_SELECT		REG_BIT(0) /* 0: PPGTT, 1: GGTT */
 
 #define OAG_OACONTROL				XE_REG(0xdaf4)
+#define  OAG_OACONTROL_OA_PES_DISAG_EN		REG_GENMASK(27, 22)
 #define  OAG_OACONTROL_OA_CCS_SELECT_MASK	REG_GENMASK(18, 16)
 #define  OAG_OACONTROL_OA_COUNTER_SEL_MASK	REG_GENMASK(4, 2)
 #define  OAG_OACONTROL_OA_COUNTER_ENABLE	REG_BIT(0)
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 63286ed8457fa..0369cc016f6ab 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -440,6 +440,10 @@ static void xe_oa_enable(struct xe_oa_stream *stream)
 	val = __format_to_oactrl(format, regs->oa_ctrl_counter_select_mask) |
 		__oa_ccs_select(stream) | OAG_OACONTROL_OA_COUNTER_ENABLE;
 
+	if (GRAPHICS_VER(stream->oa->xe) >= 20 &&
+	    stream->hwe->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG)
+		val |= OAG_OACONTROL_OA_PES_DISAG_EN;
+
 	xe_mmio_write32(stream->gt, regs->oa_ctrl, val);
 }
 
-- 
2.41.0

