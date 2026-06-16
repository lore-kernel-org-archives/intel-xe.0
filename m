Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E90CD98E4
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 19:22:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 080BA10ED02;
	Tue, 16 Jun 2026 19:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W5X3h8vK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 843CC10E830
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jun 2026 19:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781637755; x=1813173755;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=mKwexVUEMVJWL8yjF4vggV7+x1JzMXQVLTApBHZZKqg=;
 b=W5X3h8vKzpV8Kxs3+huA70b6oGGlWwzzQ3HiVr6wP9RJdFcuHCvybDjf
 KZ2tAxQe9bgCpo09HgZy9oiw4iw8cKRulyANo6aeNiqMiYe2EDja4h5Mh
 MmRo48yC6QBDirgEk2OKnql85EwJeOm+kG71TAPrEe8HqOKG2Lxl6Tzgq
 KjH11PAeDB6BypKVPs9mCnyhBMXCyo1pq5lrb8iVViYkWpyUvjz1H5/dd
 QuLdAiiK/TjcugIny6Q5AT5XlvHu16YoOhSdFNvsqUqP+ogNzGDDu31bD
 DaWTvNiJlKAurcwDoGlxhujYpkhcvq05zNUP0dKYN7uLL/5CMcxu+KrMt A==;
X-CSE-ConnectionGUID: 96W5y46lRwOCv3N8EIF7xA==
X-CSE-MsgGUID: lVMPeE6HR9mGKkse8UAEQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82483222"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82483222"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 12:22:34 -0700
X-CSE-ConnectionGUID: MBo8sbw7QPWt5CI3t/hmPg==
X-CSE-MsgGUID: O5skmICNSoSZkdwc8bwBVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="247940032"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.134])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 12:22:33 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Tue, 16 Jun 2026 12:21:53 -0700
Subject: [PATCH 3/4] drm/xe: Move engines' LRC programming RTP table off
 the stack
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-rtp_with_dynamic_vals-v1-3-f2b47bea9dd3@intel.com>
References: <20260616-rtp_with_dynamic_vals-v1-0-f2b47bea9dd3@intel.com>
In-Reply-To: <20260616-rtp_with_dynamic_vals-v1-0-f2b47bea9dd3@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Violet Monti <violet.monti@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3490;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=mKwexVUEMVJWL8yjF4vggV7+x1JzMXQVLTApBHZZKqg=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBqMaJ4pJ16IjxUBYkZBMR8Kzca/JFU3rcJf2xDb
 LLSKxCQH+aJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCajGieAAKCRBNeSQFyHKQ
 BOyVEAC1P10VlJKpjpPIuibhSdVs5kPGgYMJ2RSG9hkJ7ApO3TPh+ya9QEIsd0kq+Vr54zpYtwp
 RE/3viI5XFVEQ+rky7GHFHE7nNFmSQAlSyEZ3M3NpigLn4JvcCUB0Uphg+/j//8N72J2XE+NmB7
 tbwpwzz5YQcj4VgGJ6s4GH/5O144GGkC1PzkdIcn/iEgsGjk8CuQvNAanVPpiHZSYjf5bBCV74u
 0tNyKt90yoc1sgneOqJnixFR8QegDrmBFkbu/+cKGnets6LaYu63beBxgqU8YMj4d8XH02GgjEC
 2LAZPwzoHF+gTEGpWcaY5letkc8mfzxsnsDB8YVewhQka8cltJXU0voQ2Hcr9gaayDYkAWDiOR8
 2z34jcMeg+MFGXkS9tZGR7riTru0SR/JfLfE21vNhag4+/5ros3DDQ3RZogMwLWl3OFmzJ8rZBD
 rp8uRZdJTL7oOT0MX83RLlRpHaP6CZgnHa/tZbpxaPOOiVSbl9x7gdFcU33+oriTMULxsrGOaOU
 P8tkV2KAFoiqkx0GzgzCC5jt0v3HeqDnrO8mhLc3HQ7GDxE6sGRCgxP0mCTX9mZXvRVD8wGv52i
 5EhA/uRj7kH0bgYwiGG6jJPW2iVD2VVjNJWxFwJXeIq6tPV0rz19CTVlQNXmL7sLoKgE075zlI+
 mHfce2ETpPaJSVg==
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

The 'lrc_setup' RTP table was allocated on the stack because it wasn't
truly constant and needed to calculate the proper value for BLIT_CCTL at
runtime based on other stack variables.  Using the FIELD_SET_FUNC action
allows us to make the table itself truly constant and move it off the
stack; the BLIT_CCTL value is now calculated during RTP table
processing.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 60 ++++++++++++++++++++-------------------
 1 file changed, 31 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 98265293f2dc..0b688b851b71 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -337,39 +337,41 @@ static bool xe_rtp_cfeg_wmtp_disabled(const struct xe_device *xe,
 	return xe_mmio_read32(&hwe->gt->mmio, XEHP_FUSE4) & CFEG_WMTP_DISABLE;
 }
 
+static u32 blit_cctl_val(struct xe_gt *gt, struct xe_hw_engine *hwe)
+{
+	return REG_FIELD_PREP(BLIT_CCTL_DST_MOCS_MASK, gt->mocs.uc_index) |
+		REG_FIELD_PREP(BLIT_CCTL_SRC_MOCS_MASK, gt->mocs.uc_index);
+}
+
+const struct xe_rtp_table_sr lrc_setup = XE_RTP_TABLE_SR(
+	/*
+	 * Some blitter commands do not have a field for MOCS, those
+	 * commands will use MOCS index pointed by BLIT_CCTL.
+	 * BLIT_CCTL registers are needed to be programmed to un-cached.
+	 */
+	{ XE_RTP_NAME("BLIT_CCTL_default_MOCS"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1274),
+		       ENGINE_CLASS(COPY)),
+	  XE_RTP_ACTIONS(FIELD_SET_FUNC(BLIT_CCTL(0),
+					BLIT_CCTL_DST_MOCS_MASK |
+					BLIT_CCTL_SRC_MOCS_MASK,
+					blit_cctl_val,
+					XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+	},
+	/* Disable WMTP if HW doesn't support it */
+	{ XE_RTP_NAME("DISABLE_WMTP_ON_UNSUPPORTED_HW"),
+	  XE_RTP_RULES(FUNC(xe_rtp_cfeg_wmtp_disabled)),
+	  XE_RTP_ACTIONS(FIELD_SET(CS_CHICKEN1(0),
+				   PREEMPT_GPGPU_LEVEL_MASK,
+				   PREEMPT_GPGPU_THREAD_GROUP_LEVEL)),
+	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE)
+	},
+);
+
 static void
 hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
 {
-	struct xe_gt *gt = hwe->gt;
-	const u8 mocs_write_idx = gt->mocs.uc_index;
-	const u8 mocs_read_idx = gt->mocs.uc_index;
-	u32 blit_cctl_val = REG_FIELD_PREP(BLIT_CCTL_DST_MOCS_MASK, mocs_write_idx) |
-			    REG_FIELD_PREP(BLIT_CCTL_SRC_MOCS_MASK, mocs_read_idx);
 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
-	const struct xe_rtp_table_sr lrc_setup = XE_RTP_TABLE_SR(
-		/*
-		 * Some blitter commands do not have a field for MOCS, those
-		 * commands will use MOCS index pointed by BLIT_CCTL.
-		 * BLIT_CCTL registers are needed to be programmed to un-cached.
-		 */
-		{ XE_RTP_NAME("BLIT_CCTL_default_MOCS"),
-		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1274),
-			       ENGINE_CLASS(COPY)),
-		  XE_RTP_ACTIONS(FIELD_SET(BLIT_CCTL(0),
-				 BLIT_CCTL_DST_MOCS_MASK |
-				 BLIT_CCTL_SRC_MOCS_MASK,
-				 blit_cctl_val,
-				 XE_RTP_ACTION_FLAG(ENGINE_BASE)))
-		},
-		/* Disable WMTP if HW doesn't support it */
-		{ XE_RTP_NAME("DISABLE_WMTP_ON_UNSUPPORTED_HW"),
-		  XE_RTP_RULES(FUNC(xe_rtp_cfeg_wmtp_disabled)),
-		  XE_RTP_ACTIONS(FIELD_SET(CS_CHICKEN1(0),
-					   PREEMPT_GPGPU_LEVEL_MASK,
-					   PREEMPT_GPGPU_THREAD_GROUP_LEVEL)),
-		  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE)
-		},
-	);
 
 	xe_rtp_process_to_sr(&ctx, &lrc_setup, &hwe->reg_lrc, true);
 }

-- 
2.54.0

