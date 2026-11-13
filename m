Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C404606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 08:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XajBeD/G
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A3C10E7A7;
	Fri, 13 Nov 2026 08:12:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C9810E3AC;
 Fri, 13 Nov 2026 08:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794557515; x=1826093515;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3OdHyYwSg8n/0/KoXGdQFFLwl3dWu001MPbwazm2EFQ=;
 b=XajBeD/G0R3w5sNdTJ0y7cJqpT1rgVoZtLctMmsr/2QYY3HhPhsMW1ka
 BOQL9mfzzr33SlGEC2TUDiC5aOhRxmxuCOwBPWYKZaPReuxz+WAcBm4R/
 2rCcQOWVeT+so7BYMwDENbJvjZJJlI31qO0MpX1y4+VwIg1xtYT3N++VW
 F/Lncw/BFRnkpf3PDtO7djDAzQc3OW43p53BV/b70XYITPygC7h+9N20W
 2k67ghSPWM5df5t2h+RjnZRk7LR+EI7e3zFCKappiWstdUH6e4Y9alH8d
 oJQVhelN1IPVb3QCRzTazxKNgOt3HgR3eS6KXOkBuogbGpV3c7+MzizVj w==;
X-CSE-ConnectionGUID: xgJIqseISg+2DWDrPdVcTg==
X-CSE-MsgGUID: mdJzvjFtSCi01fvR9xo1SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3225004"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3225004"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 00:11:54 -0800
X-CSE-ConnectionGUID: sh6jVZ1tTO+q7Lxa0lzaSQ==
X-CSE-MsgGUID: aw039dfFSBOEAhNdQF5P6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="8762246"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa004.jf.intel.com with ESMTP; 13 Nov 2026 00:11:52 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 stable@vger.kernel.org, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>, Xiao Lu <xiaolu.xie@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v2] drm/i915/dip: Write the DIP header last
Date: Fri, 13 Nov 2026 13:18:49 +0530
Message-ID: <20261113074849.30768-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On platforms with SDP transmission line registers, the packets anchored
to them are double buffered in the transcoder (TC) clock domain. The packet
registers are in the core display (CD) clock domain and the whole packet is
clock crossed on the write of the header (dword 0), so Bspec requires the
data to be programmed first and the header last.

hsw_write_infoframe() writes the header first, so the packet is crossed
before its payload is in place and the previous payload keeps being sent.
This hits the AS SDP, and the VSC SDP whenever an AS SDP is enabled, which
is whenever VRR is possible since commit 6a1712052859 ("drm/i915/dp: Enable
AS SDP whenever VRR is possible or PR !async"). With CMN_SDP_TL, enabled by
commit bfa597238073 ("drm/i915/dip: Enable Common SDP Transmission line"),
it also hits the GMP and VSC SDPs: on NVL, entering HDR on an eDP panel
leaves the image discoloured and scaled until the headers are rewritten.

Write the payload, including the ECC zero fill, first and the header last
for all packets. Packets double buffered in the CD domain have no ordering
requirement and Bspec recommends using the same order for all packets, so
use it on all platforms.

v2: Always write the header last, without the platform check. (Ville)

Bspec: 75640, 71197, 74384
Fixes: e1123e617e51 ("drm/i915/vrr: Program EMP_AS_SDP_TL for DP AS SDP")
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17732
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9746
Cc: <stable@vger.kernel.org> # v6.17+
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: Xiao Lu <xiaolu.xie@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---

Notes:
    The same ordering change was posted earlier by Xiao Lu
    (https://patchwork.freedesktop.org/patch/763779/), for xe issue 9693[1].
    
    Fixes tag rationale
    
    The Fixes tag points at commit e1123e617e51 ("drm/i915/vrr: Program
    EMP_AS_SDP_TL for DP AS SDP"). The AS SDP has been written header first
    since it was added by commit 8845021b7331 ("drm/i915/display: Read/Write
    Adaptive Sync SDP"), but EMP_AS_SDP_TL, which holds the double buffer
    point and the transmission line of the AS SDP on BMG and LNL+, was only
    programmed from that commit on. From then on the driver relies on that
    register to anchor the AS SDP, and the VSC SDP whenever an AS SDP is
    enabled, and the programming note of the register asks for the packet
    data first and the header last. The two later commits cited in the commit
    message only widened the exposure: the first enabled the AS SDP whenever
    VRR is possible and the second added CMN_SDP_TL for the GMP and VSC SDPs.
    
    Alternatives considered:
     - 6a1712052859 (v7.2): AS SDP on whenever VRR is possible. A PTL report
       [2] is fixed by reverting it. Narrower than the spec argument, as it
       only covers v7.2 and later.
     - bfa597238073 (7.4): CMN_SDP_TL. The NVL regression, verified on
       hardware, but covered by the older tag as every kernel with it also
       has e1123e617e51.
     - 8845021b7331 (v6.10): first header first AS SDP write, but
       EMP_AS_SDP_TL was not programmed until e1123e617e51, so exposure
       before it could not be shown.
    
    Not verified:
     - The failure was observed locally on NVL with CMN_SDP_TL (rewriting the
       GMP and VSC headers makes the panel recover). The AS SDP and the VSC
       SDP with an AS SDP on BMG, LNL and PTL follow from the Bspec
       requirement and were not reproduced here.
     - No reproduction on kernels older than v7.2.
     - The HDR test on NVL was done with v1, which only differs by the
       platform check; NVL takes the same path in both versions.
    
    [1] https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9693
    [2] https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9746

 drivers/gpu/drm/i915/display/intel_hdmi.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 4ec0db8d93fb..66149aff7993 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -535,18 +535,27 @@ void hsw_write_infoframe(struct intel_encoder *encoder,
 	val &= ~hsw_infoframe_enable(type);
 	intel_de_write(display, ctl_reg, val);
 
-	for (i = 0; i < len; i += 4) {
+	/* Program the payload first, the header (dword 0) is written last. */
+	for (i = 4; i < len; i += 4)
 		intel_de_write(display,
 			       hsw_dip_data_reg(display, cpu_transcoder, type, i >> 2),
-			       *data);
-		data++;
-	}
+			       data[i >> 2]);
 	/* Write every possible data byte to force correct ECC calculation. */
 	for (; i < data_size; i += 4)
 		intel_de_write(display,
 			       hsw_dip_data_reg(display, cpu_transcoder, type, i >> 2),
 			       0);
 
+	/*
+	 * Packets double buffered in the transcoder clock domain are clock
+	 * crossed on the write of the header, so it has to come after the
+	 * payload. Packets double buffered in the core display clock domain
+	 * have no ordering requirement, so use the same order for all of them.
+	 */
+	intel_de_write(display,
+		       hsw_dip_data_reg(display, cpu_transcoder, type, 0),
+		       data[0]);
+
 	/* Wa_14013475917 */
 	if (!(IS_DISPLAY_VER(display, 13, 14) && crtc_state->has_psr &&
 	      !crtc_state->has_panel_replay && type == DP_SDP_VSC))
-- 
2.50.1

