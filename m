Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A248CD98F8
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 19:26:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969A610F0EE;
	Wed, 17 Jun 2026 19:26:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gOnlLJEY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E88F10EB0E
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 19:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781724394; x=1813260394;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=oZi+nC9U4HWBTWDj5POPOVeDhvKRH579qg5c4MVnPq0=;
 b=gOnlLJEYQnjFuJzF42m4rc46jHyZgoTNrkDq0Je6YztxDQwqPYyEDc7c
 ZJ5WjxMFFXBMNaU7lDQ8ie4r0zlyL99g4sFUloTq+e35c55Gme2GKvrZM
 vH7+Tvg2XoulMjnW+PYnMKTQZINHNh1NJnnqITwP7kel0a2PDREqlKX2d
 8316rqitiBd024/J+fXIiAPr6uTr3PyQRHzvNBVrVBeTpTSRCfMKx2jgr
 oKOXd/T95nwnb4nuOUEJVZjfxvF7rQn+qx2pOH/4IlETms/zlqWSRWnYX
 /hWEk0TAy8GukDDfhRdveAk+4hFY32PkzZydMq0wGbgf/Zb4SqaoXJVs+ Q==;
X-CSE-ConnectionGUID: d7VHUShkSsygIYdegxMhcw==
X-CSE-MsgGUID: WOTR78BWRmmWErvoq69DLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="105339759"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="105339759"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 12:25:47 -0700
X-CSE-ConnectionGUID: ef6ZmALPTSGd6yKW7G8ifg==
X-CSE-MsgGUID: fNd0G/zrQvugNSyrbkcDKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="278347298"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.134])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 12:25:44 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Wed, 17 Jun 2026 12:24:46 -0700
Subject: [PATCH v2 2/5] drm/xe/rtp: Add FIELD_SET_FUNC RTP action
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-rtp_with_dynamic_vals-v2-2-3f4cb34c2ea1@intel.com>
References: <20260617-rtp_with_dynamic_vals-v2-0-3f4cb34c2ea1@intel.com>
In-Reply-To: <20260617-rtp_with_dynamic_vals-v2-0-3f4cb34c2ea1@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Violet Monti <violet.monti@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4301;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=oZi+nC9U4HWBTWDj5POPOVeDhvKRH579qg5c4MVnPq0=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBqMvS2DP+Fv5jt4Vrm9jtEJUSTevK4uxapP13K1
 EwAl5+K9rKJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCajL0tgAKCRBNeSQFyHKQ
 BLx9EACCGviS2zmriCorO9BHLUhlvC/X63KpmaNnA4oVErm9iOAeR5XSNMr7R4DDiD9LjHlGVDs
 Zzf5yp9Wwq8yqa2cGmThcbxhMLBjRzGEsHFToOoBQc9sJza/wwa+xolo/D2H+smq/xEcM+6ETHy
 BGd/ewap9u32RQNOg5jUZMVss4ESYsOgmr9kBRvgDXHwhZdfTWrgutWnCV6sCjpFgxSiSG1dDja
 kvCMsshGt/YHNAtGgEBOyC8MIdFE6mwg9ar/Kler8Qc7fA3SQht4U+2e/K9HxQUXCaxNVpKb21K
 O2KY/4yI758uxIksuODuATd8gfVXEEv8fL5eT1RqbEq1Xy9pmXZytJzOy54FKppdD9ySAx5jy/4
 7c4xSPBo60ua2c5q7jvVSdazhF9sIj8e01EUFkC1spUHoXM5e5hEfIhPPfBSas1IQyfwg15TwDg
 JeGy29Y96QnzSH9brJ4zRriCkMVKH7e0m0A0iu1A1VGQlfw6OtccoO19l6bihxMeYkyAwM3MOR4
 nt0yqmzAEyl57AQAuTvUSpNpBKEZ3kFBs9HfUTyCo1QDNUwcPMv7lrl0A7oPiMw5WvkU/NiPzMd
 Zwsn0WjrXf2b3i3SVEmB/mhzJx3u7LDmuFCyYxQeYS1amLJFAnAV58rT6d0qdYPQ9OUo9HWJhWD
 4JcP+PmiZeDIh9g==
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

v2:
 - Tweak kerneldoc to avoid duplicating explanation from FIELD_SET.
   (Gustavo)

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c       | 10 ++++++++--
 drivers/gpu/drm/xe/xe_rtp.h       | 19 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_rtp_types.h | 17 +++++++++++++++--
 3 files changed, 42 insertions(+), 4 deletions(-)

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
index 2cc65053cd07..0032f68ea187 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -322,6 +322,25 @@ struct xe_reg_sr;
 	  .clr_bits = (mask_bits_), .set_bits = (val_),				\
 	  .read_mask = 0, ##__VA_ARGS__ }
 
+/**
+ * XE_RTP_ACTION_FIELD_SET_FUNC: Set a bit range to the value returned by a function
+ * @reg_: Register
+ * @mask_bits_: Mask of bits to be changed in the register, forming a field
+ * @func_: Function that returns value to set in the field denoted by @mask_bits_
+ * @...: Additional fields to override in the struct xe_rtp_action entry
+ *
+ * This macro works like XE_RTP_ACTION_FIELD_SET(), except that the
+ * field value is evaluated at the time the RTP table is processed.
+ *
+ * @func_ will only be called a single time, when the RTP table is being
+ * processed.  After processing, the value in the reg_sr entry is fixed and
+ * will not be re-evaluated.
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

