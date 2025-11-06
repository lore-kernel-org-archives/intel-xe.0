Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9FFCCFA03
	for <intel-xe@archiver.kernel.org>; Thu,  6 Nov 2025 09:34:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DAC310E863;
	Thu,  6 Nov 2025 09:34:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FhkIVmQh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534AA10E863
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Nov 2025 09:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762421697; x=1793957697;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WeSy0JEfYKeOu/eKbU/BO2gzJPPW02mZwmIUIZ00jAE=;
 b=FhkIVmQhUITOSyoxVe1L8KyN9Nk8gLFMJhs26/WIfZL/xLyWoUzUzg2e
 ZXhoDOCaXTAR0WOEl5/YfUOU8OgUBc0ufCrALckYcTnjHu08rjZXoO/Vm
 Xho/Ldp/7Nel8XeVgVqFDhnBgR1CzWI72tiK6vMX8apbgu53JRA85MB5x
 qS5oyV8OodO1Nn2HR7E+DlchnGMB3L5IktzSif547Ngq2EAV6cSXEEYbe
 F4I6p5eekY1javQc7Fsc3bQu3TzeKnhAe507BTjhDLfc8wo993ZV/hptJ
 iyE6b/ZGjD9sTF6pFsknjBQIU2wkgDNgQg61CX6t0ofB1uqDzitlmywrV g==;
X-CSE-ConnectionGUID: Owl/LjktTWGW5ObNMZoeBw==
X-CSE-MsgGUID: qWADy7lLSMGqLTNjTWquew==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="90021554"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="90021554"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 01:34:57 -0800
X-CSE-ConnectionGUID: y0jwJQtmRdme3MDrAWehAA==
X-CSE-MsgGUID: ei1ssDnrQ8WJW4lSy21JUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="192068201"
Received: from nitin-super-server.iind.intel.com ([10.190.238.72])
 by orviesa004.jf.intel.com with ESMTP; 06 Nov 2025 01:34:56 -0800
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH] drm/xe/xe3lpg: Extend Wa_15016589081 for xe3lpg
Date: Thu,  6 Nov 2025 15:35:17 +0530
Message-ID: <20251106100516.318863-2-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.50.1
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

Wa_15016589081 applies to Xe3_LPG renderCS

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

