Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46DECCFA00
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 09:36:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A629210E59B;
	Tue,  4 Nov 2025 09:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YASeQIYs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2722A10E5B0
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 09:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762248960; x=1793784960;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hz8itDWVdl+ul7Deg8GG62sNxGsorRVY+hc57zlrF4I=;
 b=YASeQIYsxvOY3XqEMdgf6rYjnSfkk2LtZl8iBGryCLX4Aw1NHZdZIuTi
 6yEEXmbPvC8LGRyfTWVfBCKzsP3TfCHyj35yCFsjShMZWYRhIgTXZHbRd
 WRODSo293KRv9C2J3kU6humK5UXHz8xkK2GEdb/ZrnMZUUWOEgXU6XTZT
 9ENsSMLRcNuB1smz0qLJIafx7vjwjh9Oq9FfbIxgr9HKWr+VTYQLAApKp
 YVqqupdyQRbHvkJDRLXcpMnpkTb2qQR4+fSjghTD7EeOrXGzs1rM1PSEy
 7Pwm6YtM/r+YYWdxiXSLDvvYiT7VFbgkU8YsJOUJsRCskubpLX2uf18u6 A==;
X-CSE-ConnectionGUID: 4wskyQsHR1mVtMa3AOO7fA==
X-CSE-MsgGUID: YDk9l2DGQU+c+f2bIZ7fWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64255431"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="64255431"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 01:35:59 -0800
X-CSE-ConnectionGUID: 40Gzxsy3S+6q/biAbCoYJw==
X-CSE-MsgGUID: zmJ8GkxLS9CUHO0LHDAD7Q==
X-ExtLoop1: 1
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by fmviesa003.fm.intel.com with ESMTP; 04 Nov 2025 01:35:58 -0800
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH] drm/xe/xe3lpg: Extend Wa_15016589081 for xe3lpg
Date: Tue,  4 Nov 2025 15:35:40 +0530
Message-Id: <20251104100540.2083040-1-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.25.1
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

Wa_15016589081 applies to Xe3_v2_LPG_LG renderCS

Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 81e62291af45..3764abca3d4f 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -922,6 +922,11 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(XEHP_SLICE_COMMON_ECO_CHICKEN1, FAST_CLEAR_VALIGN_FIX))
 	},
+	{ XE_RTP_NAME("15016589081"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0),
+		       ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
+	},
 };
 
 static __maybe_unused const struct xe_rtp_entry oob_was[] = {
-- 
2.25.1

