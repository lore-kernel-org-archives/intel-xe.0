Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB6A606A321
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 10:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n7dkZqTx
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF6810FAB4;
	Wed, 11 Nov 2026 10:58:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF8710FACB;
 Wed, 11 Nov 2026 10:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794394733; x=1825930733;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wAxIcKnQLFuEIpR+gtRgDnl+FmtnM4Ewvlsw7sKz1jw=;
 b=n7dkZqTxEnqocclq0IA3V5C46ypk05A9sacgiW7KACk+53KPcuEkbf6d
 BZGFlUBcRF/xWJ87Uo8VD32YuP91zETXNJkJR5ZyuMBKTUNqub24zakUk
 Jdj/jj4WtB6o7HB/jEmXkFvMPxfQF8MHs3oMvEoVOB7Ej/8vlF6vm8MtA
 +tFde3Q9f37DjuvT6WCBS+8nXkczDOsSYedKYBfgLFnTLXXzIcQhiktBO
 LQmdmnf7CFVZw5bTdV1pWgHczXz3A8o2q9IZ1wUve4QTlBvXSWoDGhx8b
 DjtPUW9YZB2TZP+YOFMG+PtbdrOYM4oMxyAnUJQPiwYJSx2ztmOm8rykZ Q==;
X-CSE-ConnectionGUID: RW6o40DmSQSd9tEnoUIJFQ==
X-CSE-MsgGUID: u3vDnL5QRbeYGJ526csZ7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3064423"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3064423"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 02:58:52 -0800
X-CSE-ConnectionGUID: 4VajYzGfTKeSOMtMoe96gA==
X-CSE-MsgGUID: 7PgorDSwSK2UdINBsoYILg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8962332"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa010.fm.intel.com with ESMTP; 11 Nov 2026 02:58:50 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 stable@vger.kernel.org, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH] drm/i915/dip: Write the DIP header last with SDP transmission
 lines
Date: Wed, 11 Nov 2026 16:05:42 +0530
Message-ID: <20261111103542.4093652-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.50.1
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
on platforms with EMP_AS_SDP_TL. CD domain packets have no ordering
requirement and Bspec recommends the same order for all packets, so use it
for all of them. Older platforms keep the current order.

Bspec: 75640, 71197, 74384
Fixes: e1123e617e51 ("drm/i915/vrr: Program EMP_AS_SDP_TL for DP AS SDP")
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17732
Cc: <stable@vger.kernel.org> # v6.17+
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---

Notes:
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
     - 6a1712052859 (v7.2): AS SDP on whenever VRR is possible. The PTL
       report is fixed by reverting it. Narrower than the spec argument, as
       it only covers v7.2 and later.
     - bfa597238073 (7.4): CMN_SDP_TL. The NVL regression, verified on
       hardware, but covered by the older tag as every kernel with it also
       has e1123e617e51.
     - 8845021b7331 (v6.10): first header first AS SDP write, but
       EMP_AS_SDP_TL was not programmed until e1123e617e51, so exposure
       before it could not be shown.
    
    Not verified:
     - The failure was observed on NVL with CMN_SDP_TL (rewriting the GMP and
       VSC headers makes the panel recover). The AS SDP and the VSC SDP with
       an AS SDP on BMG, LNL and PTL follow from the Bspec requirement and
       were not reproduced here.
     - No reproduction on kernels older than v7.2.
     - Stable backports need the HAS_EMP_AS_SDP_TL gate adapted, as it is
       defined in intel_dip.h, which is new in 7.4.

 drivers/gpu/drm/i915/display/intel_hdmi.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 4ec0db8d93fb..3ecf017b3176 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -51,6 +51,7 @@
 #include "intel_cx0_phy.h"
 #include "intel_ddi.h"
 #include "intel_de.h"
+#include "intel_dip.h"
 #include "intel_display_driver.h"
 #include "intel_display_regs.h"
 #include "intel_display_types.h"
@@ -524,6 +525,15 @@ void hsw_write_infoframe(struct intel_encoder *encoder,
 	const u32 *data = frame;
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	intel_reg_t ctl_reg = HSW_TVIDEO_DIP_CTL(display, cpu_transcoder);
+	/*
+	 * On platforms with the SDP transmission line registers some of the
+	 * packets are double buffered in the transcoder clock domain, and the
+	 * packet is clock crossed on the write of the header (dword 0). Program
+	 * the payload first and the header last, so that the whole packet gets
+	 * crossed. Packets double buffered in the core display clock domain
+	 * have no ordering requirement, so use the same order for all of them.
+	 */
+	bool header_last = HAS_EMP_AS_SDP_TL(display);
 	int data_size;
 	int i;
 	u32 val = intel_de_read(display, ctl_reg);
@@ -535,18 +545,21 @@ void hsw_write_infoframe(struct intel_encoder *encoder,
 	val &= ~hsw_infoframe_enable(type);
 	intel_de_write(display, ctl_reg, val);
 
-	for (i = 0; i < len; i += 4) {
+	for (i = header_last ? 4 : 0; i < len; i += 4)
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
 
+	if (header_last)
+		intel_de_write(display,
+			       hsw_dip_data_reg(display, cpu_transcoder, type, 0),
+			       data[0]);
+
 	/* Wa_14013475917 */
 	if (!(IS_DISPLAY_VER(display, 13, 14) && crtc_state->has_psr &&
 	      !crtc_state->has_panel_replay && type == DP_SDP_VSC))
-- 
2.50.1

