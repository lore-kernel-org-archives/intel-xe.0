Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E4DCD98EE
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 19:22:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0065510ECFC;
	Tue, 16 Jun 2026 19:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gDAnkyba";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CFD10ECFC
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jun 2026 19:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781637757; x=1813173757;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=4sF47764lUutHE8+tKLTs58AeIFw/+u3euSFRkPedtA=;
 b=gDAnkybaTc/70AKU17ALh3OGyWqj4VXcBPZBYP2s4yT9PmwntBHslxe6
 9ouzzz+y1Fh96S3CGj+YOdViW8RwQGANOctUKE0KvyzfWwBdW0hi7tgV7
 LIicTS69LcM+VCauEPO4Ogi343gB410dNpv56Uy8Qq/IApEb+t/CPdEod
 plG5K7OGLts4JT+EhbKMXiiI1ait8+tuznPrtZ+HgQ69KmJGefiIfQmY7
 FP4k0P6d67ChSKF1XBREt4R9pqjn4qTAtXIp10oiQfVUxbTXSJrha1/Q2
 5tSxhNUb7sz2AidFOqsK+CJEoHjuxudzwcNlpDdNF03fAwopX2Uxq4I6x g==;
X-CSE-ConnectionGUID: rI+pSPR/TVmA+DINz5vn7w==
X-CSE-MsgGUID: 3ndvoJ6xRa+lyvWTd30GaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82483223"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82483223"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 12:22:34 -0700
X-CSE-ConnectionGUID: YuysNrhqRje9JCRNRW31oA==
X-CSE-MsgGUID: iwmKorzpSI+4W1dBFOEsgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="247940029"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.134])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 12:22:33 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Tue, 16 Jun 2026 12:21:52 -0700
Subject: [PATCH 2/4] drm/xe/rtp: Add FIELD_SET_FUNC RTP action
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-rtp_with_dynamic_vals-v1-2-f2b47bea9dd3@intel.com>
References: <20260616-rtp_with_dynamic_vals-v1-0-f2b47bea9dd3@intel.com>
In-Reply-To: <20260616-rtp_with_dynamic_vals-v1-0-f2b47bea9dd3@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Violet Monti <violet.monti@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4209;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=4sF47764lUutHE8+tKLTs58AeIFw/+u3euSFRkPedtA=;
 b=owEBbAKT/ZANAwAKAU15JAXIcpAEAcsmYgBqMaJ420zsvM2vhJaLHd4SkHU9GE2hBB3yVbAw8
 TuYmHyDq9aJAjIEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCajGieAAKCRBNeSQFyHKQ
 BHuBD/jIKHB/6ETU8B9TcoOLJa3t5w9YF2HWjbdhx5fgBC9DyrGUJe81/GgLMfCpOUROXa8BwGd
 QmID66WFRKVq6+ufv3OdafnHmREGLGZNJ7P1OJ2zV0HTpicJc0QE4M5CSQksUR50q73kgtbtV3f
 gbnkM4B4woFjtBkQHTcbGqtYKWsyke6YLl3+t0RideaSoErZrSUh0Eg3M0p2zT3chdYTyiCavbv
 7OmqV1A3XYP4GIU7FvBtOQn4Zq10HE1DL5PMYuVoiTR6kBTAJ805/bUzZ8oUPAEk6x6nUzg4LvP
 QaaMiRTywfH/F/8eKAwS1FlZvndsjo8BVWyQwIEgwvikeRSPvXE27TPz58+SPulSHfZohDhBEpl
 uaAoYwTnHy2qU+m7aIaCzG0st6R/lPjvSEVVSBBUMj8JGx8hGhYdHxIHKCjC+XQhuLIC0dSx8U5
 1UfjSnXWFgm51rcX2YSXXx0MOLuNikm+H0A/b7Kw9eeS5QR2xIR2nvDxqXdTMUpwX8lfhTWXsM3
 UDuwSUvV7XOBK2ahwz+eG20btc0nafYzrgD0ozCTRoup9yksYtxYpKrT9ZlDdQhPefoJKHVZqxA
 jslkmHshpE9bVcRj39kgbL29oKqQ/3xhnhJp6AlG5J7+7owhRQJGijaYgxQb4+vW/qcRiKIvDEp
 mfBYyFg34cd/5
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

Most of our RTP programming involves programming constant values into
register fields.  However there are a few cases (e.g., RING_CMD_CCTL
programming) that rely on dynamic per-GT or per-engine checks to decide
what value will be programmed.  Add a FIELD_SET_FUNC RTP action which
will call the provided function pointer once at RTP processing time to
determine the appropriate value.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c       | 10 ++++++++--
 drivers/gpu/drm/xe/xe_rtp.h       | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_rtp_types.h | 17 +++++++++++++++--
 3 files changed, 44 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 83a40e1f9528..6a8d6ea68f25 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -227,17 +227,23 @@ static bool rule_matches(const struct xe_device *xe,
 
 static void rtp_add_sr_entry(const struct xe_rtp_action *action,
 			     struct xe_gt *gt,
+			     struct xe_hw_engine *hwe,
 			     u32 mmio_base,
 			     struct xe_reg_sr *sr)
 {
 	struct xe_reg_sr_entry sr_entry = {
 		.reg = action->reg,
 		.clr_bits = action->clr_bits,
-		.set_bits = action->set_bits,
 		.read_mask = action->read_mask,
 	};
 
+	if (action->use_func)
+		sr_entry.set_bits = action->set_func(gt, hwe);
+	else
+		sr_entry.set_bits = action->set_bits;
+
 	sr_entry.reg.addr += mmio_base;
+
 	xe_reg_sr_add(sr, &sr_entry, gt);
 }
 
@@ -259,7 +265,7 @@ static bool rtp_process_one_sr(const struct xe_rtp_entry_sr *entry,
 		else
 			mmio_base = 0;
 
-		rtp_add_sr_entry(action, gt, mmio_base, sr);
+		rtp_add_sr_entry(action, gt, hwe, mmio_base, sr);
 	}
 
 	return true;
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 2cc65053cd07..e374b57a066c 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -322,6 +322,27 @@ struct xe_reg_sr;
 	  .clr_bits = (mask_bits_), .set_bits = (val_),				\
 	  .read_mask = 0, ##__VA_ARGS__ }
 
+/**
+ * XE_RTP_ACTION_FIELD_SET_FUNC: Set a bit range to the value returned by a function
+ * @reg_: Register
+ * @mask_bits_: Mask of bits to be changed in the register, forming a field
+ * @func_: Function that returns value to set in the field denoted by @mask_bits_
+ * @...: Additional fields to override in the struct xe_rtp_action entry
+ *
+ * @func_ will only be called a single time, when the RTP table is being
+ * processed.  After processing, the value in the reg_sr entry is fixed and
+ * will not be re-evaluated.
+ *
+ * For masked registers this translates to a single write, while for other
+ * registers it's a RMW. The correspondent bspec notation is:
+ *
+ *	REGNAME[<end>:<start>] = FUNC(GT, HWE)
+ */
+#define XE_RTP_ACTION_FIELD_SET_FUNC(reg_, mask_bits_, func_, ...)		\
+	{ .reg = XE_RTP_DROP_CAST(reg_),					\
+	  .clr_bits = mask_bits_, .set_func = func_, .use_func = 1,		\
+	  .read_mask = mask_bits_, ##__VA_ARGS__ }
+
 /**
  * XE_RTP_ACTION_WHITELIST - Add register to userspace whitelist
  * @reg_: Register
diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
index 1d7c63d0ae94..b78092fa06e0 100644
--- a/drivers/gpu/drm/xe/xe_rtp_types.h
+++ b/drivers/gpu/drm/xe/xe_rtp_types.h
@@ -30,8 +30,14 @@ struct xe_rtp_action {
 	 */
 	u32 clr_bits;
 
-	/** @set_bits: bits to set when updating register */
-	u32 set_bits;
+	union {
+		/** @set_bits: bits to set when updating register */
+		u32 set_bits;
+
+		/** @set_func: function to provide bits to set when updating register */
+		u32 (*set_func)(struct xe_gt *gt,
+				struct xe_hw_engine *hwe);
+	};
 
 #define XE_RTP_NOCHECK		.read_mask = 0
 	/** @read_mask: mask for bits to consider when reading value back */
@@ -40,6 +46,13 @@ struct xe_rtp_action {
 #define XE_RTP_ACTION_FLAG_ENGINE_BASE		BIT(0)
 	/** @flags: flags to apply on rule evaluation or action */
 	u8 flags;
+
+	/**
+	 * @use_func:
+	 *   Internal flag indicating @set_func should be called instead of
+	 *   using @set_bits.
+	 */
+	u8 use_func:1;
 };
 
 enum {

-- 
2.54.0

