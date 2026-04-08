Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F7D10FC464
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 23:44:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9C010E703;
	Wed,  8 Apr 2026 23:44:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TBvezUFH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7008F10E6FF
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 23:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775691869; x=1807227869;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=MGC0UG534injlTtAY1iUJCZ7xOFg1+GLF0+a8looijw=;
 b=TBvezUFH26Cz91OZsn7Jh/3FuuPSgKYY8uDS02KRbPXy1lNSANP6hHyA
 AkxTMWCbM3rnjwqSwobBvaBZaRTTWIoGiCFhmjhhhYGSUuCe32bJkqvfV
 11L6D3tNi6kbZUuaEE1HkY6v+OXT5rFmV8pMgcAL1/1NSBJYMX3tgFeQe
 Gly8SrokRdGH8947KyIalLvQTaOCVeptb0HR45s8XW1FqQYppE5AVNHAZ
 0WPTnNMWEfVNXtXlYo5YBYBFan1cROaALnIVn4JH14v//KwgOcclk76qq
 dGPqNvbJbJ78tAlcAd4ZROQFTw2YJ1CUgv4GcC8SGdfgPds6bGV4p9pkn w==;
X-CSE-ConnectionGUID: hQdofP4wTcKsHmLo+WDjAA==
X-CSE-MsgGUID: lLd6DnHsSrWT3StBcyV/Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="94272801"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="94272801"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 16:44:28 -0700
X-CSE-ConnectionGUID: vBCx66E+RcefMH/Q2etyUw==
X-CSE-MsgGUID: GPQL2RheQHurwQHDI5YoFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="227616922"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 16:44:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Wed, 08 Apr 2026 16:43:06 -0700
Subject: [PATCH v2 07/10] drm/xe/oa: Consolidate RTP entries for OAG whitelist
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-oa-whitelist-cleanup-v2-7-db4a06aae8b0@intel.com>
References: <20260408-oa-whitelist-cleanup-v2-0-db4a06aae8b0@intel.com>
In-Reply-To: <20260408-oa-whitelist-cleanup-v2-0-db4a06aae8b0@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1897;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=MGC0UG534injlTtAY1iUJCZ7xOFg1+GLF0+a8looijw=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp1uhbFhZzQ7qGZ7rl3PqO5C7fwdNnuXA2JTVKC
 e0404lfVy2JAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCadboWwAKCRBNeSQFyHKQ
 BJrpD/0TaXrrPsm+G8XKY3VMU7vE5OaXirrgXL/V7bvaXwo2Wz1d3iI93Lb/nhiaFLPjwpt5fD9
 faU6KFSp4NYkUDchfonE2TvwnjOAiyBhEUbFD1uxF3lTwaVpZH6+YJkAtD+zzQXXnC5GOcIfR/G
 G2YGcSbmgPC41Pu69pREsssKmOq8lbWDOBKg+lNN7p74ki5vck3wgVVqWt+CiczS1sGIycxwMZk
 lWm5PzE5sQGcUhXbDTte0XS6hE9OSdo6/e1lKT8RIHb+TKNt5taC2YDHJ8WcBn/evJDWwmQdbCk
 wIy9yhdljaLFyDZs/C8kxUjXx7KK1RrsL35Ibcx9VsQAxCWIRgqYQk4ckTH3zFJcccBEwkaLOIm
 SgPzTZ8kyzb0Ws1MnKAqA7QXTMoNwK9GbkGwSlHtLnevU4XapgW4etGmoPn0rhHDofGbSvdpJFs
 kDd+C19loOxiecc15nbL4ANVFqIQPnfFByswFXGHQusys7PtJL5ucIavbPoadHlnlxrsO9r4RmM
 JgGdrtRz/xBvloL8DANzITDTv2r/IfLUH/cmAojVxuXc3GpVrpVrIoC/9iiwLHo+oBO1DQcSDkw
 3dYaxJ1iq6DzG/3uO6G5BxWB+Uv8KY5boxRU06VO4VcqrVgOWDDT9oSjQ9MM7raXPhS3AmvOPk9
 n1+XixW3I4zDkzA==
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

Since we're exposing exactly the same sets of registers on both RCS and
CCS, there's no need for two table entries; we can just use one entry
with a custom match function.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 82a2091904fc..de35f64c71cd 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -34,6 +34,14 @@ static bool match_has_oam(const struct xe_device *xe,
 		hwe->class == XE_ENGINE_CLASS_VIDEO_ENHANCE;
 }
 
+static bool match_has_oag(const struct xe_device *xe,
+			  const struct xe_gt *gt,
+			  const struct xe_hw_engine *hwe)
+{
+	return hwe->class == XE_ENGINE_CLASS_RENDER ||
+		hwe->class == XE_ENGINE_CLASS_COMPUTE;
+}
+
 static bool match_has_mert(const struct xe_device *xe,
 			   const struct xe_gt *gt,
 			   const struct xe_hw_engine *hwe)
@@ -124,16 +132,8 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 #define WHITELIST_OA_MERT_MMIO_TRG \
 	WHITELIST_OA_MMIO_TRG(OAMERT_STATUS, OAMERT_HEAD_POINTER)
 
-	{ XE_RTP_NAME("oag_mmio_trg_rcs"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 3099),
-		       ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(WHITELIST(OAG_OAHEADPTR,
-				   RING_FORCE_TO_NONPRIV_ACCESS_RD |
-				   RING_FORCE_TO_NONPRIV_RANGE_4))
-	},
-	{ XE_RTP_NAME("oag_mmio_trg_ccs"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 3099),
-		       ENGINE_CLASS(COMPUTE)),
+	{ XE_RTP_NAME("oag_mmio_trg"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 3099), FUNC(match_has_oag)),
 	  XE_RTP_ACTIONS(WHITELIST(OAG_OAHEADPTR,
 				   RING_FORCE_TO_NONPRIV_ACCESS_RD |
 				   RING_FORCE_TO_NONPRIV_RANGE_4))

-- 
2.53.0

