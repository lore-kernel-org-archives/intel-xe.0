Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00E6CD98EF
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 14:53:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB6210EC44;
	Tue, 16 Jun 2026 14:53:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kNUFWXwV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0010810EC35;
 Tue, 16 Jun 2026 14:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781621605; x=1813157605;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eW50ZoaGXj/7fV5pwBoxYtXLsVq8znE1LNhJHmpmsag=;
 b=kNUFWXwV9y5BMzHn7FtCsltrfNj1mloYNfp6fWIGTqfZ0mfY5+yHpTfG
 SSlsQJ8ZC5WeQscHW5uUYHg9A4bfCaDtUp9iaKeotS9rIapnKXPfKo6CU
 MzqcdISmqUXhMht/3CpeohISwa0PmtyCL4nL2Eg+0ePtxm/5cGp8/v3sH
 78pGT5h9XzRdOY1CTSfHUd2RIEb+bjI4/VbzNkQow4u5JAnkMHPJlplH2
 wQtTG5pV++E4yaG4jSLmHdW4Yh+rkZAlmKqSy2d5pPprxlnqtbTJXxeQT
 +T46fLbIeJF5yCYpPa2eq2dEo0YE7YGP0UJCXuWwfduhx2H3LNVZr9JeB A==;
X-CSE-ConnectionGUID: VX+5I8GRS+GGd17ZjsnTpw==
X-CSE-MsgGUID: Nx+xnNG6Rfu6y7yke9s1Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="69932843"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="69932843"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 07:53:25 -0700
X-CSE-ConnectionGUID: wr1/1pm0SHK6Q+LvENi4KA==
X-CSE-MsgGUID: i4S9xPotQ++Avhvh+iFddQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="285896337"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa001.jf.intel.com with ESMTP; 16 Jun 2026 07:53:23 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 chaitanya.kumar.borah@intel.com
Subject: [PATCH v2 07/11] drm/i915/vrr: Fix the CMRR enabling/disabling
 sequence
Date: Tue, 16 Jun 2026 20:12:28 +0530
Message-ID: <20260616144233.832276-8-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260616144233.832276-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260616144233.832276-1-mitulkumar.ajitkumar.golani@intel.com>
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

Write TRANS_CMRR_N_HI register last in the sequence of
CMRR register writes, hardware will consider this as a
marker to double buffer the registers at next rising edge
of delayed vblank. Remove the related FIXME comments.

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 83f25184c66c..0113f413f04b 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -878,10 +878,10 @@ intel_vrr_enable_cmrr(const struct intel_crtc_state *crtc_state)
 		       upper_32_bits(crtc_state->vrr.cmrr.cmrr_m));
 	intel_de_write(display, TRANS_CMRR_M_LO(display, cpu_transcoder),
 		       lower_32_bits(crtc_state->vrr.cmrr.cmrr_m));
-	intel_de_write(display, TRANS_CMRR_N_HI(display, cpu_transcoder),
-		       upper_32_bits(crtc_state->vrr.cmrr.cmrr_n));
 	intel_de_write(display, TRANS_CMRR_N_LO(display, cpu_transcoder),
 		       lower_32_bits(crtc_state->vrr.cmrr.cmrr_n));
+	intel_de_write(display, TRANS_CMRR_N_HI(display, cpu_transcoder),
+		       upper_32_bits(crtc_state->vrr.cmrr.cmrr_n));
 }
 
 static void
@@ -892,8 +892,8 @@ intel_vrr_disable_cmrr(const struct intel_crtc_state *crtc_state)
 
 	intel_de_write(display, TRANS_CMRR_M_HI(display, cpu_transcoder), 0);
 	intel_de_write(display, TRANS_CMRR_M_LO(display, cpu_transcoder), 0);
-	intel_de_write(display, TRANS_CMRR_N_HI(display, cpu_transcoder), 0);
 	intel_de_write(display, TRANS_CMRR_N_LO(display, cpu_transcoder), 0);
+	intel_de_write(display, TRANS_CMRR_N_HI(display, cpu_transcoder), 0);
 }
 
 static void
@@ -994,12 +994,6 @@ static void intel_vrr_tg_enable(const struct intel_crtc_state *crtc_state,
 
 	vrr_ctl = VRR_CTL_VRR_ENABLE | trans_vrr_ctl(crtc_state);
 
-	/*
-	 * FIXME this might be broken as bspec seems to imply that
-	 * even VRR_CTL_CMRR_ENABLE is armed by TRANS_CMRR_N_HI
-	 * when enabling CMRR (but not when disabling CMRR?).
-	 */
-
 	intel_de_write(display, TRANS_VRR_CTL(display, cpu_transcoder), vrr_ctl);
 
 	intel_cmtg_set_vrr_ctl(crtc_state);
-- 
2.48.1

