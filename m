Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986A8CD98F3
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 19:26:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ECDB10F0ED;
	Wed, 17 Jun 2026 19:26:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RyQ0bYwd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B40B10EB0E
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 19:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781724394; x=1813260394;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=eYyGzL0ANiOwq6AmEdFv5Iq27EECT38oJSYs5+x/5O0=;
 b=RyQ0bYwd1Zhp7c+xqOzS+PNG5iTALr0mUAIPAK44Iaj1C6QaZFdJSkIy
 i58jaYRx+sJseHlM9EFn714Yit8/dLQW1UaNnqw257ucO0GRA5iMpX6hd
 yUboOqlXBobx0k4sIeTCqQFFBSn4WdLqjgxsuaqUhDuwLZ6WM+Vc2tieP
 9k3hgXeCpVgcnEQyHFfk5bx0XHQagqo3CTfAJInyOQUlpEcr5hRfhvNMY
 3zsshT7hlz7zQHS8mirEzhQ1yBY9s6Cjx78OCa6BQeDaWUoKWS8mAoA7f
 me1pImG27Tyt9MEnZrmppCik3w1TSnGgNAYf76fRMCmphvekwMefQf7JA Q==;
X-CSE-ConnectionGUID: MdnJP9yJSpG03DHdkNROuQ==
X-CSE-MsgGUID: svpKEd9KRtK+bjCjEnatXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="105339757"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="105339757"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 12:25:47 -0700
X-CSE-ConnectionGUID: ZoXkAFwBR1mvlmJZk5kyTg==
X-CSE-MsgGUID: JX4HkDHLS+mD8yaly85sUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="278347306"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.134])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 12:25:44 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Wed, 17 Jun 2026 12:24:47 -0700
Subject: [PATCH v2 3/5] drm/xe: Move engines' LRC programming RTP table off
 the stack
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-rtp_with_dynamic_vals-v2-3-3f4cb34c2ea1@intel.com>
References: <20260617-rtp_with_dynamic_vals-v2-0-3f4cb34c2ea1@intel.com>
In-Reply-To: <20260617-rtp_with_dynamic_vals-v2-0-3f4cb34c2ea1@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Violet Monti <violet.monti@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3580;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=eYyGzL0ANiOwq6AmEdFv5Iq27EECT38oJSYs5+x/5O0=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBqMvS3fQQEGj4C0YSV0dD84GOaAAqiT+RmTeBoL
 Zu2WW1BYgCJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCajL0twAKCRBNeSQFyHKQ
 BAeDD/wJknm+WKcGqtDa88zIMYavoX7H9Zn90xYYGp6u6fpmr623LY7J5om9D2G3egmhYBqmkdu
 YvgxiRbE8BYTXmXc3n+JIAs4iRg8V+LAdmA02rBsUWhD9tjQVgoiLpTzw/YC/zpJhhM2BymV4DQ
 UjFNAMHE1K2ClLGHjoH+efCCvAjG7ynWwwZleRtVUY+l1MOiN3VgqMzBWzNL/LREwsDEs3mS2ZD
 jSzY0ECX4PA6Qwz59YSKKCVEaWTGTkKxb+Kv/4Z/UlDhVkCv30X0hGOfJLC9QrHSw63BQ+lstvH
 ixLetihWyrD/oZbRj5HAY6Inpt2owM/5yGpOecOEig/6uW/BnCmIh2skdoggf09aZLGwCSvILt8
 l7zoFmQ+zeIXXqLiG6u6380dFYvRwNguVTSGq+vna/PvsDeo1qMr02ZOE5S/JY2IOzoyaDzhv/B
 m22Mt7sHUloFx/E14DJGw2JrckEuXz2nBoH+Cp+VyFTEmzyhW406tc3GRGX/RVFIaPQZvVt+gWB
 8Bjq+ZtYzNzcuH2utzgOXfyqfr3S6QDXXC0igAqzur9h7YB3ZUREOBvn1zekfJE3vfyCE41ZmoM
 pvMHwN2YDGuBd0M972RtxJmD3Pe7eiJjbGmM2u4Su1t91hsgcIPkLv4+zWywPikRVhKrlN4biId
 AmH1L6ogZMSn2Mw==
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

v2:
 - Made table static

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 60 ++++++++++++++++++++-------------------
 1 file changed, 31 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 98265293f2dc..603bb197801a 100644
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
+static const struct xe_rtp_table_sr lrc_setup = XE_RTP_TABLE_SR(
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

