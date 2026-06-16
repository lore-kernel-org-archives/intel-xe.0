Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D48CD98E4
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 19:22:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8353C10E665;
	Tue, 16 Jun 2026 19:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QEC+4rG7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B490A10EB37
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jun 2026 19:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781637757; x=1813173757;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=w90+w4z7hjABVL9RnBTAgfNLf4LjAJt3Bj9IbJgwDeU=;
 b=QEC+4rG7wMjjaNNvpuXtlMI7TXKFtlrBC4v0EerSzTE6g5d5OSqQy+t8
 nysm7Dn49u9RnzGOb04QhMinNm1pDf+RwaF6TcXsqOHotl9N2UxTNIqFO
 aJ0IaKwgWpdkbShJ4kCSR5WBzwBC9GfwWC8IuccxCqFUSWFe1/RHbTHo4
 IWO2PeTt14EoxOS5IrLjlLRaXebXcLE3wmZucDktP5prGGyaRaRFEVEcq
 584hZY6OnufxygJN+67yrgt9Nla9u0vYC4iZbPTcXhMUlRdEVOXX0QCrj
 UIq2LOBhcpijMa+YCtqhgSKRmMmmZrYY2krgtV0+BENsaxl3xGWo0Q7ys g==;
X-CSE-ConnectionGUID: 6oyoqlwUT0mP/AnnWMzZ2w==
X-CSE-MsgGUID: xmkO86LjSJWTUD3f9LPbAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82483219"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82483219"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 12:22:34 -0700
X-CSE-ConnectionGUID: E3FhOzYARWWGaXDXfnZPJw==
X-CSE-MsgGUID: VtpkI88sTa6hsqI+dTdegw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="247940026"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.134])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 12:22:33 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Tue, 16 Jun 2026 12:21:51 -0700
Subject: [PATCH 1/4] drm/xe: Reformat xe_rtp_types.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-rtp_with_dynamic_vals-v1-1-f2b47bea9dd3@intel.com>
References: <20260616-rtp_with_dynamic_vals-v1-0-f2b47bea9dd3@intel.com>
In-Reply-To: <20260616-rtp_with_dynamic_vals-v1-0-f2b47bea9dd3@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Violet Monti <violet.monti@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1869;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=w90+w4z7hjABVL9RnBTAgfNLf4LjAJt3Bj9IbJgwDeU=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBqMaJ4fPolyyWXWK7YdYwuKHzhKeXnVQB/HoDwv
 rYszyKCrkKJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCajGieAAKCRBNeSQFyHKQ
 BAT7EACXEZG9VF6WDKBlKDtsTeDhN+TdxWLzv+XUOUcuSr9ThqKyvghRxQ9MXWiEMQsjHhR0RXF
 1Lrf0kaKK6LdU+738GLQHIeWYKghalUAUBvu+Sa7llyevMQIvqmNZVqifwH+AsEYUbrQtyJnHfY
 5udpEdF5YYLRq1i2/TktMXTMeCkBOoyTsKUHWjS3Gvvp8nNkFkKaPrfo3e/ikmCdnOteDgi4PUn
 2mTxJB3FKD5bTHGofbqjLpmpZ3qAtDkSb4I2RJcUd4J0lm+I3No4crEF31j+hslUQxOXtpDj/tR
 zLGnbbXfP8XiYu1M92dZz3kxb1XfdPydpb9OI50XN+QuTW3W531TzIlvAq8z1T3xJPNMQk6Y9Im
 qZfoTShvj20RPm8L5xrr65jds/F45zr9m1I8z6hZiROV3V2qRxSyKj6DTeHZdKZHAgHLcsTVIbx
 WYtDiajm76rIrb/VeDj9L9Rh7ILdrscsMeMDI6wuWwSwfR/xtqiT7IkQY48czBnM2PO2TuZ59S+
 XdA5xZvpj15ocw+X3N1zJtg6fFG4Ngod8aPU9ufRHh8RwmjcWBeSh32y09CrZDZdrO9slTY+vj6
 muHNfkjrRrUtREmwvbMncextijgcil06EYcxr1GUko2bhSbyTu1Yb4nPblhCnQau+ukgbrYYuBA
 k9RRWQuCGUWhZwg==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

Adjust whitespace / newlines in xe_rtp_types.h to make it easier to read
and more consistent with other files.  No functional change.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp_types.h | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
index 58018ae4f8cc..1d7c63d0ae94 100644
--- a/drivers/gpu/drm/xe/xe_rtp_types.h
+++ b/drivers/gpu/drm/xe/xe_rtp_types.h
@@ -22,20 +22,24 @@ struct xe_gt;
  */
 struct xe_rtp_action {
 	/** @reg: Register */
-	struct xe_reg		reg;
+	struct xe_reg reg;
+
 	/**
 	 * @clr_bits: bits to clear when updating register. It's always a
 	 * superset of bits being modified
 	 */
-	u32			clr_bits;
+	u32 clr_bits;
+
 	/** @set_bits: bits to set when updating register */
-	u32			set_bits;
+	u32 set_bits;
+
 #define XE_RTP_NOCHECK		.read_mask = 0
 	/** @read_mask: mask for bits to consider when reading value back */
-	u32			read_mask;
+	u32 read_mask;
+
 #define XE_RTP_ACTION_FLAG_ENGINE_BASE		BIT(0)
 	/** @flags: flags to apply on rule evaluation or action */
-	u8			flags;
+	u8 flags;
 };
 
 enum {
@@ -69,6 +73,7 @@ struct xe_rtp_rule {
 			u8 platform;
 			u8 subplatform;
 		};
+
 		/*
 		 * MATCH_GRAPHICS_VERSION / XE_RTP_MATCH_GRAPHICS_VERSION_RANGE /
 		 * MATCH_MEDIA_VERSION  / XE_RTP_MATCH_MEDIA_VERSION_RANGE
@@ -78,15 +83,18 @@ struct xe_rtp_rule {
 #define XE_RTP_END_VERSION_UNDEFINED	U32_MAX
 			u32 ver_end;
 		};
+
 		/* MATCH_STEP */
 		struct {
 			u8 step_start;
 			u8 step_end;
 		};
+
 		/* MATCH_ENGINE_CLASS / MATCH_NOT_ENGINE_CLASS */
 		struct {
 			u8 engine_class;
 		};
+
 		/* MATCH_FUNC */
 		bool (*match_func)(const struct xe_device *xe,
 				   const struct xe_gt *gt,

-- 
2.54.0

