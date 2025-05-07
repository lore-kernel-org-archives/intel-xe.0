Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71545C3ABC0
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 12:20:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB2710E79B;
	Wed,  7 May 2025 12:20:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W+ejYos3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7970310E79B
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 12:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746620438; x=1778156438;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VLQrtrC74O+15nil/fCkMTEeLl/C1ki8Ic8cscA1bfE=;
 b=W+ejYos3kGX4AV/CZ8fw+UY71XwlCDxrXuPyAHOATihS9dGRdjn95oQ5
 Gct3Wy/df21CkOw/OcveeEDN3ym5SFFqyGOKikv1eLFQWiUZwZ9dHQqWm
 gFx3apnlhUEsfR14t1rCcFrG/DNFcxfihS+8EQelkp8pu0aXM9MSA83aP
 I7YjCdfEyL5NwhwCY0gSqWsJaCNO+bTKoGMlO4z2itD0xkifAb9snNhuC
 oRUulaMiqIn8U7hGd8G1AjD3rdqOL7LkPeZT7XjNssMgWjNMFhF0Km5Y8
 BFW3Cy5Aa8vigg0XQDaxQ49H+VGfuP2jgosPEkbwMbBcVP2RlH4DSCznl w==;
X-CSE-ConnectionGUID: Ym9r88DoQYKLeP/myFXzlw==
X-CSE-MsgGUID: WEYflcTJRuG0uLwmmb7syQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59699505"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="59699505"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 05:20:37 -0700
X-CSE-ConnectionGUID: si6k09AsRS2SAdtaew+dgw==
X-CSE-MsgGUID: HS/bA5q0Qb2VwPpICawV0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="135659237"
Received: from unknown (HELO nitin-Super-Server.iind.intel.com)
 ([10.190.238.72])
 by orviesa009.jf.intel.com with ESMTP; 07 May 2025 05:20:36 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: joonas.lahtinen@intel.com, himal.prasad.ghimiray@intel.com,
 tejas.upadhyay@intel.com, nitin.r.gote@intel.com
Subject: [PATCH] drm/xe/ptl: Disable null query for anyhit shader
Date: Wed,  7 May 2025 18:14:37 +0530
Message-Id: <20250507124437.2651331-1-nitin.r.gote@intel.com>
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

For PTL, disable null query for anyhit shader as it
currently does not bring any performance benefits.
Quite the contrary, disabling the mechanism brings a
small but consistent perf uplift.

Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/gpu/drm/xe/xe_tuning.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index 49ddbda7cdef..6f2f3428b12e 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -98,6 +98,11 @@ static const struct xe_rtp_entry_sr engine_tunings[] = {
 		       ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(SAMPLER_MODE, INDIRECT_STATE_BASE_ADDR_OVERRIDE))
 	},
+	{ XE_RTP_NAME("Tuning: Disable NULL query for Anyhit Shader"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(RT_CTRL, DIS_NULL_QUERY))
+	},
 };
 
 static const struct xe_rtp_entry_sr lrc_tunings[] = {
-- 
2.25.1

