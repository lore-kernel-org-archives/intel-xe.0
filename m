Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5A3C27C75
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 18:07:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3673D10E6FE;
	Tue, 11 Jun 2024 18:07:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G/qkDXAL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3FB810E1A3
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 18:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718129272; x=1749665272;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q1mlAg/cfKTVq7jD/atyQBe/lsFjHWQdGMBSBzk8OOc=;
 b=G/qkDXALmn1ODS1tgjonq36VYVr/8b3lkoh+25fB34I2SnYdEdoB88SC
 HWj0tzJ4A7s3em27qKJZg0UocTnDTZLDix14KoI0juJZ3h2S2ePP1AmVR
 EUqwb6qNA1P1r8QlsLg83g3JohlCb5FwIfM6B9Jqe94/D8vVbwSQW/z5j
 9Xk9hUoRb2g1Abkv3bADvbImY9890wObwv/AzuIJoLZdMjJ+xxuEi1v0U
 3pf9E4rbEL/d4xV8q8AdWbTks/1MZESNx2o9K5vOWtXAeDFXerrhkCFct
 zbtoUiI0vtSXu1X/XXBc3EDEYFoiiG55HpKem3Cl/coT+jF1XIt9UteDr Q==;
X-CSE-ConnectionGUID: LubXIB3sT8aAZdohgmiiuQ==
X-CSE-MsgGUID: ZB5y3ewNRfKCf+KMjSX8GA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="32398381"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="32398381"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 11:07:52 -0700
X-CSE-ConnectionGUID: GBTM7jpGTYWVPABuHaZdkw==
X-CSE-MsgGUID: 41Qzt5r2TLKbU9SA1eZWUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="39620465"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.94.248.185])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 11:07:51 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
Subject: [PATCH 4/4] drm/xe/guc: Avoid named enum types in GuC KLV ABI
Date: Tue, 11 Jun 2024 20:07:35 +0200
Message-Id: <20240611180735.1988-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240611180735.1988-1-michal.wajdeczko@intel.com>
References: <20240611180735.1988-1-michal.wajdeczko@intel.com>
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

The xe_guc_klv_ids name just for workaround keys is too generic,
as workaround keys are not the only keys used by the GuC firmware.
Other KLVs keys are defined as plain defines or anonymous enums.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 2 +-
 drivers/gpu/drm/xe/xe_guc_ads.c       | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index a0b80c9fc5ef..831a2b57f308 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -346,7 +346,7 @@ enum {
 /*
  * Workaround keys:
  */
-enum xe_guc_klv_ids {
+enum {
 	GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED				= 0x9002,
 	GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING				= 0x9005,
 	GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE				= 0x9007,
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 1c60b685dbc6..a3de00e92b4e 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -285,7 +285,7 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
 }
 
 static void guc_waklv_enable_one_word(struct xe_guc_ads *ads,
-				      enum xe_guc_klv_ids klv_id,
+				      u16 klv_id,
 				      u32 value,
 				      u32 *offset, u32 *remain)
 {
@@ -312,7 +312,7 @@ static void guc_waklv_enable_one_word(struct xe_guc_ads *ads,
 }
 
 static void guc_waklv_enable_simple(struct xe_guc_ads *ads,
-				    enum xe_guc_klv_ids klv_id, u32 *offset, u32 *remain)
+				    u16 klv_id, u32 *offset, u32 *remain)
 {
 	u32 klv_entry[] = {
 		/* 16:16 key/length */
-- 
2.43.0

