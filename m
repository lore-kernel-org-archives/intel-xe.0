Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C766C55168
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 11:09:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F5710EECE;
	Thu, 30 Jul 2026 11:09:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kIiseOxE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4FC510EECA;
 Thu, 30 Jul 2026 11:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785409778; x=1816945778;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3za8YA1k/p5zaen+Geuzb90f+V4cZxvpJq6oClXnVGk=;
 b=kIiseOxEZysASm8IwhK3J9LO/LISSvB55s5JYAu0Fyci1Cvqh69b7LAL
 8EfCNNMsjlBYBZcqbSlmuRT6kvhTAGegOqgwguX1MR884XBqQJEsqUv6A
 KRB1F831VDVsLg3KEqSSs4LpkL7K5ns5mEF5HUsx23t8f5WzKpKxfX/PG
 fFTyzr5jjYyvQofHf5o+4KqznWD0DelC/9rap8y1/EI4yt0W/zYLp1iik
 Xm1HSzUK3tOVnx0/6cHAC7qhaaaT+jyPaJNEdh1f6nk/m9GYc9D+PSXik
 EwpKAAyKBypO/8jtlRWDYDSMbr3Zb4V1C62wOs0t/JYuoY2/Tj8tle2ou A==;
X-CSE-ConnectionGUID: VfToMuebR5+yh1BYxvEHvQ==
X-CSE-MsgGUID: BYs/MhZZT0ywnGXX7/xQVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86217227"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="86217227"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 04:09:33 -0700
X-CSE-ConnectionGUID: M57ZyHxBRsGMeTB0ilaqgQ==
X-CSE-MsgGUID: pVeWc516RmGTrq6RbRdFIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="298482250"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa001.jf.intel.com with ESMTP; 30 Jul 2026 04:09:32 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v8 01/10] drm/i915/psr: Do not enable PSR2 when CMRR is enabled
Date: Thu, 30 Jul 2026 16:29:08 +0530
Message-ID: <20260730105919.3913412-2-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260730105919.3913412-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260730105919.3913412-1-mitulkumar.ajitkumar.golani@intel.com>
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

CMRR is mutually exclusive to PSR2, do not enable PSR2 when CMRR is
enabled.

--v2:
- Restrict selective update config check (Ankit)
- Commit message change

--v3:
- Commit changes

--v4:
- Add check to psr2_config_valid (Jouni)

--v5:
- Correct debug message

--v6:
- Commit message update

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 40e3d7095996..410778e73a2d 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1491,6 +1491,12 @@ static bool intel_psr2_config_valid(struct intel_dp *intel_dp,
 	int crtc_vdisplay = crtc_state->hw.adjusted_mode.crtc_vdisplay;
 	int psr_max_h = 0, psr_max_v = 0, max_bpp = 0;
 
+	if (crtc_state->cmrr.enable) {
+		drm_dbg_kms(display->drm,
+			    "PSR2 cannot be enabled when CMRR is enabled\n");
+		return false;
+	}
+
 	if (!connector->dp.psr_caps.su_support || display->params.enable_psr == 1)
 		return false;
 
-- 
2.48.1

