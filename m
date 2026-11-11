Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2ED606A326
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 11:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FXfbwwMs
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047CF10FAE6;
	Wed, 11 Nov 2026 11:14:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F22A10FAE6;
 Wed, 11 Nov 2026 11:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794395673; x=1825931673;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fnzEOwCHjDpWqrxB1DbPI9LdH7xvbC7iPRAf6iSv1us=;
 b=FXfbwwMsd/2IQrvVr3EZuAuc7Qds6mZSVVnI1tNCKyVK6ip5xYZJXSRu
 2MsAX+f38YAoZO6FEMShm5FSRiIfIprbk2pVOMYIRFTgiUTx9WzHt2p6l
 z3pgpMzt2eM5l1d22E6VdKyzQyspG6KfHkL4Smcsgu9MsbaDBN7FUodmO
 BWokCH1bERu91PzThfgBmBrgBqXhw20k7Yi2FrySb93XvIKfxoyveUNxQ
 d9EfqxUmfybsjVTcjPmelo+62agsDEIYyGFdXTLGs9iHDv65Nn68yn0nQ
 O/nDusgDlUh9d87G14RAnqft6Ae61Er9ildadyqxNpr9i0fQZItWSHiNI Q==;
X-CSE-ConnectionGUID: D2v9K32KSeCTxuenXl+ENQ==
X-CSE-MsgGUID: gFZdQgMVSey2SSKBBkSQdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3161695"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3161695"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 03:14:30 -0800
X-CSE-ConnectionGUID: cl3NP+yqSZqCQ+1wtSLbtw==
X-CSE-MsgGUID: oXKEQCuNSGK5wBxm+bHP3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8491546"
Received: from xiaolu.sh.intel.com ([10.239.146.103])
 by fmviesa005.fm.intel.com with ESMTP; 11 Nov 2026 03:14:27 -0800
From: Xiao Lu <xiaolu.xie@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com, mika.kahola@intel.com,
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 Xiao Lu <xiaolu.xie@intel.com>
Subject: [PATCH] drm/i915/ltphy: Fix the HDMI PLL setup for a DCO below 11.85
 GHz
Date: Wed, 11 Nov 2026 19:12:18 +0800
Message-ID: <20261111111218.23625-1-xiaolu.xie@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The HDMI PLL algorithm looks for a DCO frequency in the 11850 - 16200 MHz
range first and, if there is no solution, in the 10000 - 12000 MHz range.
The result is then treated as a low ("12G") DCO if it is below the fixed
DCO_MIN_FREQ_MHZ (11850 MHz). That selects different loop filter and DCO
fine settings, and makes pll_type 0, so the PLL registers are written at
the USB PLL addresses.

For a port clock between about 540 and 592.5 MHz neither y = 4 nor y = 6
gives a DCO in the 11850 - 16200 MHz range, so the solution is always
found in the second range, with a DCO between 10000 and 11850 MHz.
2560x1440@144 (580.1 MHz, DCO 11602 MHz) is such a mode. On NVL, with the
sink connected through a DP dual mode adaptor (Parade PS8219), the sink
never locks at this mode: SCDC Status_Flags (0x40) never read 0x0f, the
sink drops HPD within about 10 seconds of the modeset, and the compositor
falls back to 2560x1440@120 (497.76 MHz, DCO 14932 MHz), which works. The
same sink works at 144 Hz on the same machine with the Windows driver,
which compares the DCO with the lower limit of the DCO range the solution
was found in (10000 MHz for the second range) instead.

Do the same here. Make calculate_target_dco_and_loop_cnt() return the
lower limit of the DCO range it used and compare the DCO with that, so
a DCO found in the second range is not treated as a 12G DCO anymore.
The PLL then uses pll_type 1 (DP PLL), prop_coeff 3, int_coeff 7,
ana_cfg 8 and the regular DCO fine settings, like for any other port
clock.

Port clocks outside of that 540 - 592.5 MHz window get the same result as
before. Tested on NVL with 2560x1440@144 only: the sink locks (SCDC
Status_Flags 0x0f) and there are no HPD drops.

Fixes: 6fedb7bf73d7 ("drm/i915/ltphy: Implement HDMI Algo for Pll state")
Bspec: 74667
Signed-off-by: Xiao Lu <xiaolu.xie@intel.com>
---

Notes:
    With this the 12G branches (prop_coeff 4, int_coeff 8, ana_cfg 6, dco_12g) are
    never taken any more, since a solution is by construction not below the
    lower limit of its own DCO range. I kept them to keep the fix small, and
    can drop them in a follow up if preferred.
    
    Only 2560x1440@144 (580.1 MHz) was tested on hardware. Other port clocks
    in the 540 - 592.5 MHz window, e.g. 3440x1440@100 (543.5 MHz) and
    1920x1080@240 (592 MHz), get the same change but were not tested.

 drivers/gpu/drm/i915/display/intel_lt_phy.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c b/drivers/gpu/drm/i915/display/intel_lt_phy.c
index 86492651b0..a6374b07ae 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
@@ -1360,7 +1360,8 @@ static u64 mul_q32_u32(u64 a_q32, u32 b)
 }
 
 static bool
-calculate_target_dco_and_loop_cnt(u32 frequency_khz, u64 *target_dco_mhz, u32 *loop_cnt)
+calculate_target_dco_and_loop_cnt(u32 frequency_khz, u64 *target_dco_mhz, u32 *loop_cnt,
+				  u32 *dco_min_freq_used)
 {
 	u32 ppm_value = 1;
 	u32 dco_min_freq = DCO_MIN_FREQ_MHZ;
@@ -1401,6 +1402,7 @@ calculate_target_dco_and_loop_cnt(u32 frequency_khz, u64 *target_dco_mhz, u32 *l
 								 scale);
 					*target_dco_mhz = temp0 * scale;
 					*loop_cnt = y;
+					*dco_min_freq_used = dco_min_freq;
 					return true;
 				}
 			}
@@ -1548,7 +1550,9 @@ intel_lt_phy_calculate_hdmi_state(struct intel_lt_phy_pll_state *lt_state,
 		(ndiv << 9) + (1 << 4);
 	p.bias_trim.val = (csel2fo_ovrd_en << 30) + (csel2fo << 24);
 	p.ssc_inj.val = 0;
-	found = calculate_target_dco_and_loop_cnt(frequency_khz, &target_dco_mhz, &loop_cnt);
+	/* dco_fmin becomes the lower limit of the DCO range the solution is in */
+	found = calculate_target_dco_and_loop_cnt(frequency_khz, &target_dco_mhz, &loop_cnt,
+						  &dco_fmin);
 	if (!found)
 		return -EINVAL;
 
-- 
2.43.0

