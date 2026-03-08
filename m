Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD582F513F0
	for <intel-xe@archiver.kernel.org>; Sun,  8 Mar 2026 13:25:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1BD10E178;
	Sun,  8 Mar 2026 13:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hqabPmbE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF34710E177;
 Sun,  8 Mar 2026 13:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772976312; x=1804512312;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pzWJYYo75iTD6Bbz7bxz2RQ1Ghk02W+Gz1Q+3ufhaeA=;
 b=hqabPmbEXIkTYsAk1kwlz2fA48esq5u3eR5sDQvNFAAwZaqvNMj23R9K
 +gAdskRvx2q9u59inh0iAJqkYh6IRhw/InGWytTaYoEq6R8837MLsCnYl
 juwyUmgj2O+kBSy3i5TrLAVadV1HSB1P8CuZlsYLnQf8aZxWEitbiPCgg
 DlC8vFp7ZR5PeSPWQUC3FfgQN/1VX27uNwWgVNRfJQdO9R3J4A4T+1mCh
 AnYuDmkVs7OOKU64ckkhOh/mpQrq6UUabnnbC9sWlFr8ryhPBCeV57OPn
 B2ifmE7/VZQ2nUPhYohurUcIg2niRdvSYTRVqCZoZRQmqCkAWseT9oLBT A==;
X-CSE-ConnectionGUID: JF47SF0mSQuu4Ky2mPevmg==
X-CSE-MsgGUID: SVKSdCiwR2ySG7ZP5Igp1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="77871407"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; d="scan'208";a="77871407"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2026 06:25:11 -0700
X-CSE-ConnectionGUID: 3CBM5sVIQYSeRvoQxO+mvQ==
X-CSE-MsgGUID: pWPNryZhT46Q+OBtDZWYlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; d="scan'208";a="217598181"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by fmviesa008.fm.intel.com with ESMTP; 08 Mar 2026 06:25:10 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [RFC v1 08/11] drm/i915/buf_trans: switch from u8 to u32
Date: Sun,  8 Mar 2026 14:24:43 +0100
Message-ID: <20260308132446.3320848-9-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260308132446.3320848-1-michal.grzelak@intel.com>
References: <20260308132446.3320848-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Match width of fields of struct xe3plpd_lt_* & struct dg2_snps_*
with vswing/preemphasis tables layout.

This change affects DG2 and MTL+ cases.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 .../gpu/drm/i915/display/intel_ddi_buf_trans.h   | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h
index 7703c6c0a0cb..bea6fb2ec6f4 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h
+++ b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h
@@ -45,17 +45,17 @@ struct tgl_dkl_phy_ddi_buf_trans {
 };
 
 struct dg2_snps_phy_buf_trans {
-	u8 vswing;
-	u8 pre_cursor;
-	u8 post_cursor;
+	u32 vswing;
+	u32 pre_cursor;
+	u32 post_cursor;
 };
 
 struct xe3plpd_lt_phy_buf_trans {
-	u8 main_cursor;
-	u8 pre_cursor;
-	u8 post_cursor;
-	u8 txswing;
-	u8 txswing_level;
+	u32 main_cursor;
+	u32 pre_cursor;
+	u32 post_cursor;
+	u32 txswing;
+	u32 txswing_level;
 };
 
 union intel_ddi_buf_trans_entry {
-- 
2.45.2

