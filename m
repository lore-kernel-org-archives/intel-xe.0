Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8261CCD98E2
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 19:26:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ABEB10EB0E;
	Wed, 17 Jun 2026 19:26:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H3CsELp0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64E410EB0E
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 19:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781724394; x=1813260394;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=HIBjzdM9HomSYaNHLjLB2wZgsgy7UlAjEpdtiT5pIOk=;
 b=H3CsELp0C36KASsxwc5OKMnMsKlSuYqGFPSAJrkaV9b0Swrlp6k4MnqF
 YBVhHpAdQxt7BYyYfYOGnGK8CevDkscwwuS2VEzQ1jusZAHpvSSmqR9oA
 aKbkT2lY0GdzOo8UbWzznPZIohHWPq+gOFS1lx1sEjhv6z31uRgyYllR2
 5Jsmz+sVkwVe50qz8n7ujD96hBi/cB3xgpnytZpnU5jOfawsVNh5DWR8k
 WeaVMkRVGvsZsB8O9MZ6BUes74Q5wNX+MNNLzaRVdlyo6pKS9/ZQ+SoKT
 XOAs/mdz5Zf9oRpu3ORZ6ybREfhdm7yXqI02tiBvpdCYpyw+e8fqwharK g==;
X-CSE-ConnectionGUID: GBdMEzGOTlyceSByH+8HVg==
X-CSE-MsgGUID: Ytl6HJxaTzK7Tsf53Y1PyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="105339755"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="105339755"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 12:25:47 -0700
X-CSE-ConnectionGUID: Aig4SjR2SjGTKEoiwvRNpA==
X-CSE-MsgGUID: kQwUojK/SP+9GerG0mzOPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="278347295"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.134])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 12:25:44 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Wed, 17 Jun 2026 12:24:45 -0700
Subject: [PATCH v2 1/5] drm/xe: Reformat xe_rtp_types.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-rtp_with_dynamic_vals-v2-1-3f4cb34c2ea1@intel.com>
References: <20260617-rtp_with_dynamic_vals-v2-0-3f4cb34c2ea1@intel.com>
In-Reply-To: <20260617-rtp_with_dynamic_vals-v2-0-3f4cb34c2ea1@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Violet Monti <violet.monti@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1923;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=HIBjzdM9HomSYaNHLjLB2wZgsgy7UlAjEpdtiT5pIOk=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBqMvS2Uu3XloYnX/0N8NtPD0zab5tiid9N5vx5z
 VG3ikM8kC6JAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCajL0tgAKCRBNeSQFyHKQ
 BIIZD/46lsJXho1YCW6qjDZ3VNxk9MPKSK2Ti4GoiwtGQ5ySaRvQuoFK08ewdZtzHFHKr8P8VRT
 WZVpnJ3vyOmcfxymu9vT5YSPB2JUA8l7AI48kls4sngEEDQ+fBsdN5HwbYCQ4tlNJP32DS7Q8rX
 ZqGMPsZVIVq5A138YyHRtKlYhmrX4XT8eI3SWAlC9lY0lYRVPqOoy54DeEY5PsPf7fOmkBqhvLx
 IdjSNf2eNckyQml7NoDmLUlPNbQ28Npz0pi3Ffgyz8hy1BoIkw03SZLB0eaP2j5rXYoDusaxyx6
 F6QFqfHNUL9rlSQfAc2eRoDrPuHud6/NpPet8uZLr20PlY7vIjqLOo5Gkjo/EIcGN2MYZB+jVPn
 jNuSjyE4ykdkR5mIb4Y8Sphhqbay2KR4vOwL1VJf+rR677O9pFHfXV+NlkeBljKFPYdFk+Z9WGT
 bWVgRq7DVHNMcem+yCGRKhG0h8LrsZHJALLQNcUmg096ar9EQUGEXpKfczNHiTK9mbMQUvtF0cc
 bK3lUzp2B26p0omFKFR0Zl4/cusF+sIQU+8fHT4IsmK7sCevY/IV1iDx9pm4A8YnctvIVgkz226
 VZJo55l37fO4NTeAAXggWNASvwcspc3i3sS3Q3v5GFW3e1T37cMr47geG9r8QEp87JwCZqdLNWZ
 dDa3QGJLjWYrRWw==
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

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
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

