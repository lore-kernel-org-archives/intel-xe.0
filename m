Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618F2C3DA6D
	for <intel-xe@archiver.kernel.org>; Fri, 23 May 2025 06:39:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E0810E7A4;
	Fri, 23 May 2025 06:39:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e7QaaOx0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470D810E7A9;
 Fri, 23 May 2025 06:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747982365; x=1779518365;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ykog9yXlqSqnpyFTofEI8Ua164R5Q9JbRNdV+UPPS5A=;
 b=e7QaaOx0erox0ryzLDCMPDajHjS1VjlJTrFtZlNSmszO5RqS8+w7t1NG
 FQmgk+WPtWGPeHdH85tulsA7lWZ7PRhTSA3s904W0/y0tTVaD786qdRcY
 CZvDOnPMs1wW7uMEONpFrAFxTgTQNLR0sSI7WkehuYubH3zG/4oF9nJVZ
 1HfvPgKmiQe1iVUI+apPmttHIBzApNUNyF992UXJy7BKtBIHV63Ht+vwk
 2C2uRyIAT9/rqSMKzqTxHzBOOnCCIaNT1y83Ej1TAuQISfutUUR40tHDM
 yFQDxSLI86XArujb5P8495bzWERPIIH3ATZ4ltaLZyVv2FIPa+0xSi6ar A==;
X-CSE-ConnectionGUID: bO6xAqQxS+Cs2IpAosm+oA==
X-CSE-MsgGUID: Cn5MbJ38S9mlnK9GJQmGCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="67592300"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="67592300"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 23:39:25 -0700
X-CSE-ConnectionGUID: L3PO6wKhQK+n65JK59e9FA==
X-CSE-MsgGUID: pAreyhiwTkuz4C30DsaLfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="171985350"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa001.fm.intel.com with ESMTP; 22 May 2025 23:39:23 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, uma.shankar@intel.com,
 animesh.manna@intel.com, chaitanya.kumar.borah@intel.com
Subject: [v8 11/11] drm/i915: Disable updating of LUT values during vblank
Date: Fri, 23 May 2025 11:50:41 +0530
Message-Id: <20250523062041.166468-12-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250523062041.166468-1-chaitanya.kumar.borah@intel.com>
References: <20250523062041.166468-1-chaitanya.kumar.borah@intel.com>
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

Do not schedule vblank worker for LUT update if the registers are
double buffered

v2: Do not schedule the worker at all (Ville)

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index 29cfc38f12e0..a88317ea4e9c 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -417,10 +417,13 @@ int intel_crtc_get_pipe_from_crtc_id_ioctl(struct drm_device *dev, void *data,
 
 static bool intel_crtc_needs_vblank_work(const struct intel_crtc_state *crtc_state)
 {
+	struct intel_display *display = to_intel_display(crtc_state);
+
 	return crtc_state->hw.active &&
 		!crtc_state->preload_luts &&
 		!intel_crtc_needs_modeset(crtc_state) &&
-		intel_crtc_needs_color_update(crtc_state) &&
+		(intel_crtc_needs_color_update(crtc_state) &&
+		 !HAS_DOUBLE_BUFFERED_LUT(display)) &&
 		!intel_color_uses_dsb(crtc_state) &&
 		!crtc_state->use_dsb;
 }
-- 
2.25.1

