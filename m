Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA10606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 20:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ggd8hW+6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B1810E8F1;
	Fri, 30 Oct 2026 20:34:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF2210E8C6;
 Fri, 30 Oct 2026 20:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793392471; x=1824928471;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=xlbu5HB9JOmyBEHyZaVxYWMrCgl4V+PT5u7zSAm2Cjc=;
 b=Ggd8hW+6+Ubl2k1RvX3ecNaom1whJHpnKfV9NTdgbkoEwNZJWyN+Iuql
 /yOSoOs6aLAPkGlHyXwFavWIgwRxGtomSpGvyrM0tmutLuIUAwv7MoW/l
 4dNsonTncuRrrB0WO2+MZF37SIg1lmtGF0uZ+BDMXwqiMaT1EkfxjdeYk
 RLR5Rq9riYTm/FnEr82Rcavsy2ONw/ivODBbDBM/Kx0jh5JVoGkzii07w
 d86TKnyv0+EHyxSyJFVbWBbaP9iJd4DpNSJt48qG2pU6k0GK65h9XNBfP
 hhJVXHy5Qki0gAANVu1ZX3wGfb76wK6dFZmdGbSvrluqEj0GFpwRqLFng Q==;
X-CSE-ConnectionGUID: sSucKzSHQKi19TbGvrTFUg==
X-CSE-MsgGUID: ina0Ml4ZTYmbquOxxyTttw==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2042444"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2042444"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 13:34:30 -0700
X-CSE-ConnectionGUID: QXxUfAGVQ3+bCFZnlmEReg==
X-CSE-MsgGUID: Sw2RmbaxTs+ALP4fgDdnQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5500625"
Received: from astead-desk.fm.intel.com ([10.80.113.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 13:34:30 -0700
From: Alan Stead <alan.stead@intel.com>
To: rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 vivek.kasireddy@intel.com, dongwon.kim@intel.com, james.xiong@intel.com
Subject: [RFC v1 2/3] drm/i915/dip: Send the HDMI 2.1 VTEM when VRR is enabled
Date: Fri, 30 Oct 2026 13:32:21 -0700
Message-ID: <20261030203314.1085262-3-alan.stead@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030203314.1085262-1-alan.stead@intel.com>
References: <20261030203314.1085262-1-alan.stead@intel.com>
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

An HDMI 2.1 sink is told that VRR is active with a Video Timing Extended
Metadata (VTEM) packet. Without it, the sink treats every refresh rate
change as a new video timing and blanks while it resyncs.

Program a Class 0 (Gaming-VRR) VTEM through HDMI_EMP_CTL/HDMI_EMP_DATA/
HDMI_EMP_HEADER whenever VRR is enabled on an HDMI transcoder, and send a
final VTEM with VRR_EN=0 and END set when it is disabled. Both the
modeset and the fastset paths go through intel_vrr_enable() and
intel_vrr_disable().

Notes on the programming:
- HB0 in HDMI_EMP_HEADER must be set to the EMP packet type (0x7f). The
  hardware doesn't fill it in, and sinks ignore the VTEM without it.
- MD2 bit 2 (RB in HDMI 2.1a) is reserved since HDMI 2.1b and sent as 0.
- Base_Vfront and Base_Refresh_Rate are only sent for timings without a
  VIC, as required by the HDMI 2.1 spec.
- The 11 byte payload is zero padded to a full packet body.

HDMI VRR is not enabled by the driver yet, so this has no effect until
the following patch.

Signed-off-by: Alan Stead <alan.stead@intel.com>
Assisted-by: LLM
---
 drivers/gpu/drm/i915/display/intel_dip.c      | 75 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dip.h      |  2 +
 drivers/gpu/drm/i915/display/intel_dip_regs.h | 17 +++++
 drivers/gpu/drm/i915/display/intel_vrr.c      |  4 +
 4 files changed, 98 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dip.c b/drivers/gpu/drm/i915/display/intel_dip.c
index 831881e6c15e..4748f6012337 100644
--- a/drivers/gpu/drm/i915/display/intel_dip.c
+++ b/drivers/gpu/drm/i915/display/intel_dip.c
@@ -4,11 +4,14 @@
  *
  */
 
+#include <linux/minmax.h>
+
 #include <drm/drm_print.h>
 
 #include "intel_de.h"
 #include "intel_dip.h"
 #include "intel_dip_regs.h"
+#include "intel_display_regs.h"
 #include "intel_display_types.h"
 #include "intel_hdmi.h"
 
@@ -74,6 +77,78 @@ void intel_dip_write_emp_as_sdp_tl(const struct intel_crtc_state *crtc_state)
 		       EMP_AS_SDP_DB_TL(crtc_state->dip.emp_as_sdp_tl));
 }
 
+/* VTEM: 7 byte EM Data Set header (PB0-PB6) + 4 byte data set (MD0-MD3) */
+#define VTEM_DATA_SET_LENGTH	4
+#define VTEM_EMP_SIZE		(7 + VTEM_DATA_SET_LENGTH)
+/* Payload bytes carried by one EMP data island packet */
+#define HDMI_EMP_PACKET_BODY	28
+
+/*
+ * Tell an HDMI 2.1 sink whether VRR is active with a Class 0 (Gaming-VRR)
+ * Video Timing Extended Metadata (VTEM) packet. It is a periodic
+ * pseudo-static EM Data Set: the hardware sends it every frame until it is
+ * reprogrammed. On disable, a last VTEM with VRR_EN=0 and END set is sent,
+ * after which the hardware stops sending it.
+ */
+void intel_dip_write_hdmi_vtem(const struct intel_crtc_state *crtc_state,
+			       bool enable)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+	const struct drm_display_mode *mode = &crtc_state->hw.adjusted_mode;
+	u8 vic = crtc_state->infoframes.avi.avi.video_code;
+	int base_rr = drm_mode_vrefresh(mode);
+	u8 pb[HDMI_EMP_PACKET_BODY] = {};
+	int i;
+
+	if (DISPLAY_VER(display) < 20 ||
+	    !intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI) ||
+	    !crtc_state->vrr.in_range)
+		return;
+
+	/* PB0-PB6: EM Data Set header (Sync = 0, DS_Type = pseudo-static) */
+	pb[0] = BIT(7) |			/* NEW */
+		BIT(2) |			/* VFR */
+		(enable ? 0 : BIT(6));		/* END */
+	pb[2] = 1;				/* Organization_ID: HDMI */
+	pb[4] = 1;				/* Data_Set_Tag: VTEM */
+	pb[6] = VTEM_DATA_SET_LENGTH;		/* Data_Set_Length */
+
+	/* PB7-PB10: MD0-MD3 (M_CONST = 0, FVA_Factor_M1 = 0, MD2 bit 2 reserved) */
+	if (enable) {
+		pb[7] = BIT(0);			/* VRR_EN */
+		/* Base_Vfront and Base_Refresh_Rate are only sent without a VIC */
+		if (!vic) {
+			pb[8] = min(mode->crtc_vsync_start - mode->crtc_vdisplay, 255);
+			pb[9] = (base_rr >> 8) & 0x3;
+			pb[10] = base_rr & 0xff;
+		}
+	}
+
+	drm_dbg_kms(display->drm,
+		    "[TRANSCODER %s] VTEM: VRR_EN=%d VIC=%u Base_Vfront=%u Base_RR=%u\n",
+		    transcoder_name(cpu_transcoder), enable, vic, pb[8],
+		    pb[9] << 8 | pb[10]);
+
+	/*
+	 * HDMI_EMP_CTL first, then the payload dwords (PB0 in bits 7:0), then
+	 * the header, whose write clock crosses the whole packet. HB0 must be
+	 * set to the EMP packet type, the hardware doesn't fill it in.
+	 */
+	intel_de_write(display, HDMI_EMP_CTL(display, cpu_transcoder),
+		       HDMI_EMP_CTL_TYPE_VTEM);
+	for (i = 0; i < ARRAY_SIZE(pb); i += 4)
+		intel_de_write(display, HDMI_EMP_DATA(display, cpu_transcoder),
+			       pb[i] | pb[i + 1] << 8 | pb[i + 2] << 16 |
+			       pb[i + 3] << 24);
+	intel_de_write(display, HDMI_EMP_HEADER(display, cpu_transcoder),
+		       HDMI_EMP_HEADER_HB0_EMP |
+		       HDMI_EMP_HEADER_DS_TYPE_PSEUDO_STATIC |
+		       (enable ? 0 : HDMI_EMP_HEADER_END) |
+		       HDMI_EMP_HEADER_NUM_PACKETS(DIV_ROUND_UP(VTEM_EMP_SIZE,
+								HDMI_EMP_PACKET_BODY)));
+}
+
 static int intel_dip_sdp_stagger_to_tl(struct intel_crtc_state *crtc_state,
 				       int stagger)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_dip.h b/drivers/gpu/drm/i915/display/intel_dip.h
index 7c64c84cb1be..243bca435c1d 100644
--- a/drivers/gpu/drm/i915/display/intel_dip.h
+++ b/drivers/gpu/drm/i915/display/intel_dip.h
@@ -45,6 +45,8 @@ struct intel_crtc_state;
 u16 intel_dip_read_emp_as_sdp_tl(const struct intel_crtc_state *crtc_state);
 void intel_dip_write_emp_as_sdp_tl(const struct intel_crtc_state *crtc_state);
 
+void intel_dip_write_hdmi_vtem(const struct intel_crtc_state *crtc_state, bool enable);
+
 void intel_dip_sdp_tl_compute_config_late(struct intel_crtc_state *crtc_state);
 void intel_dip_sdp_transmission_line_get_config(struct intel_crtc_state *crtc_state);
 void intel_dip_cmn_sdp_transmission_line_enable(const struct intel_crtc_state *crtc_state);
diff --git a/drivers/gpu/drm/i915/display/intel_dip_regs.h b/drivers/gpu/drm/i915/display/intel_dip_regs.h
index d7e40a613913..273daaab8234 100644
--- a/drivers/gpu/drm/i915/display/intel_dip_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_dip_regs.h
@@ -15,6 +15,23 @@
 #define   EMP_AS_SDP_DB_TL(db_transmit_line)	REG_FIELD_PREP(EMP_AS_SDP_DB_TL_MASK, \
 							       (db_transmit_line))
 
+/* HDMI 2.1 Extended Metadata Packet (EMP) control/header; payload is HDMI_EMP_DATA */
+#define _HDMI_EMP_CTL_A				0x600d0
+#define HDMI_EMP_CTL(display, trans)		_MMIO_TRANS2((display), (trans), _HDMI_EMP_CTL_A)
+#define   HDMI_EMP_CTL_TYPE_MASK		REG_GENMASK(3, 0)
+#define   HDMI_EMP_CTL_TYPE_VTEM		REG_FIELD_PREP(HDMI_EMP_CTL_TYPE_MASK, 1)
+
+#define _HDMI_EMP_HEADER_A			0x600d4
+#define HDMI_EMP_HEADER(display, trans)		_MMIO_TRANS2((display), (trans), _HDMI_EMP_HEADER_A)
+#define   HDMI_EMP_HEADER_END			REG_BIT(26)
+#define   HDMI_EMP_HEADER_DS_TYPE_MASK		REG_GENMASK(25, 24)
+#define   HDMI_EMP_HEADER_DS_TYPE_PSEUDO_STATIC	REG_FIELD_PREP(HDMI_EMP_HEADER_DS_TYPE_MASK, 0)
+#define   HDMI_EMP_HEADER_NUM_PACKETS_MASK	REG_GENMASK(23, 16)
+#define   HDMI_EMP_HEADER_NUM_PACKETS(n)	REG_FIELD_PREP(HDMI_EMP_HEADER_NUM_PACKETS_MASK, \
+								       (n))
+#define   HDMI_EMP_HEADER_HB0_MASK		REG_GENMASK(7, 0)
+#define   HDMI_EMP_HEADER_HB0_EMP		REG_FIELD_PREP(HDMI_EMP_HEADER_HB0_MASK, 0x7f)
+
 /* COMMON SDP TRANSMISSION LINE */
 #define _CMN_SDP_TL_A			0x6020c
 #define CMN_SDP_TL(display, trans)	_MMIO_TRANS2(display, (trans), _CMN_SDP_TL_A)
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index b14750692ae0..f4cc4148d3a1 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -1010,6 +1010,8 @@ void intel_vrr_enable(const struct intel_crtc_state *crtc_state)
 
 	if (!intel_vrr_always_use_vrr_tg(display))
 		intel_vrr_tg_enable(crtc_state);
+
+	intel_dip_write_hdmi_vtem(crtc_state, true);
 }
 
 void intel_vrr_disable(const struct intel_crtc_state *old_crtc_state)
@@ -1024,6 +1026,8 @@ void intel_vrr_disable(const struct intel_crtc_state *old_crtc_state)
 
 	intel_vrr_disable_dc_balancing(old_crtc_state);
 	intel_vrr_set_fixed_rr_timings(old_crtc_state, old_crtc_state->cpu_transcoder);
+
+	intel_dip_write_hdmi_vtem(old_crtc_state, false);
 }
 
 void intel_vrr_transcoder_enable(const struct intel_crtc_state *crtc_state)
-- 
2.53.0

