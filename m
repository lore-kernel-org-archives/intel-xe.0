Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74AEC624CF
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 11:00:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C23D10E648;
	Tue,  1 Sep 2026 11:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NhMrzaKO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EFE410E648;
 Tue,  1 Sep 2026 11:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788260420; x=1819796420;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HwfXvNqnQIwxxbZ+QXQw7WM/0dF2cOC8GauOMDFoefU=;
 b=NhMrzaKO+NBjEVgwZwqrXtrMCcC+jbVgKbz7sx+/IW367kpu/uPLu4HG
 Yok0hbmsoLCxA0HunwoCUhaQs/Dgp/svZJnLXevSSTWryFm+HRAgk5yHp
 PHl50ei1xtYMyX8fQxxWoJayNcPy8OByAAg0dX+K2RLIRxePpwQpxzEvN
 F6IdXdRKQSyU77uQ+D76yyvUGgyYAS4FEkxnVh5r9Bip9V50N1RCrB6ox
 lDBV1lI0aNQ3ZXpgMcPhK4Y9t+8XBdr2AotjMdOLpkiYHH3mx4gokrp14
 cSx/AMl0dC2K6sX6d/UYHncJxssqdBN7V4jogBV3LdDMxerzoA7S5wsf4 A==;
X-CSE-ConnectionGUID: ForLfIlDRJWz+rr7+C7Kag==
X-CSE-MsgGUID: w2fSKJj7Sju8Mu2cheEkCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88561580"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="88561580"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 04:00:19 -0700
X-CSE-ConnectionGUID: TjBZDXUNSOS+GMGxwXbNyw==
X-CSE-MsgGUID: 1s2jGMV+QmaXZymb4P5jmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="298955065"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa002.jf.intel.com with ESMTP; 01 Sep 2026 04:00:16 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [v5 2/2] drm/i915/audio: Prune ELD SADs based on HDMI audio bandwidth
Date: Tue,  1 Sep 2026 16:06:39 +0530
Message-ID: <20260901103639.617757-3-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260901103639.617757-1-chaitanya.kumar.borah@intel.com>
References: <20260901103639.617757-1-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add bandwidth check to determine whether a given audio sample rate and
channel count can be carried within the hblank period for HDMI TMDS mode.

Use this check to prune unsupported sample rates from each SAD in the
ELD during intel_audio_compute_config(). SADs with no remaining
supported rates are removed entirely.

Sample rates are pruned rather than channel counts, since compressed
formats (e.g. AC-3) are associated with specific channel counts.

v2:
 - Use DIV64_U64_ROUND_UP() instead of DIV_ROUND_UP_ULL() to avoid
   do_div() truncating the 64-bit divisor to 32-bit, which caused
   audio_packets_line to be wildly inflated and all SADs to be pruned.
 - Guard intel_audio_hdmi_eld_compute_config() against HDMI FRL modes.
   (Remove it when BW calculations for FRL are added.)

v3:
 - Rebase

v4:
 - Rework SAD removal into a single-pass, two-pointer compaction
   instead of memmove-ing the tail on every removal. (Jani)

v5:
 - Drop the FRL guard, i915 doesn't support FRL yet. (Ankit)
 - s/required_tmds/hblank_audio_min (Ankit)
 - Add HDMI_TMDS_AUDIO_PACKETS_LINE_MAX macro
   instead of a magic number 18. (Ankit)
 - Use drm_eld_sad_get()/drm_eld_sad_set() instead of
   raw ELD byte access. (Ankit)
 - Drop extra blank line. (Ankit)

BSpec: 68944
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Vinod Govindapillai <vinod.govindapillai@intel.com>
Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Assisted-by: GitHub-Copilot:claude-opus-4.6
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_audio.c | 153 +++++++++++++++++++++
 1 file changed, 153 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index eae76e961105..32f8c5e55319 100644
--- a/drivers/gpu/drm/i915/display/intel_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_audio.c
@@ -697,6 +697,156 @@ static void ibx_audio_codec_enable(struct intel_encoder *encoder,
 	mutex_unlock(&display->audio.mutex);
 }
 
+#define HDMI_TMDS_AUDIO_PACKETS_LINE_MAX	18
+
+static bool hdmi_audio_rate_supported(const struct intel_crtc_state *crtc_state,
+				      int available_tmds,
+				      int audio_rate, int channels)
+{
+	const struct drm_display_mode *mode = &crtc_state->hw.adjusted_mode;
+	int pixel_clk_max_hz;
+	int audio_pkt_factor;
+	u64 audio_pkt_rate_x4_x1000;
+	int audio_packets_line;
+	int hblank_overhead;
+	int hblank_audio_min;
+
+	/*
+	 * Part 2: Calculate TMDS clock cycles required for Audio Bandwidth
+	 *
+	 * Step 1: pixelclk_max = nominal_pixel_rate * (1 + 0.5%)
+	 * crtc_clock (kHz) * 1000 * 1.005 = crtc_clock * 1005 (Hz)
+	 */
+	pixel_clk_max_hz = mode->crtc_clock * 1005;
+
+	/*
+	 * Steps 3-4: Audio Packet Rate.
+	 *   R_AP = (audio_rate * AP + 2 * acrrate_max) * (1 + 1000 / 1e6)
+	 *        = (audio_rate * AP + 2*1500) * 1.001
+	 *
+	 * AP = 0.25 (2ch) or 1.0 (3-8ch); acrrate_max = 1500 Hz (max ACR
+	 * packet transmission rate per HDMI spec)
+	 *
+	 * Scale by 4*1000 to stay integer:
+	 *  x4: eliminates AP=0.25 -> audio_pkt_factor=1(2ch) or 4(3-8ch),
+	 *      scaled acrrate_max: 2 * 1500 * 4 = 12000
+	 *  x1000: eliminates 1.001 -> *1000*1.001 = *1001
+	 *
+	 * R_AP * 4 * 1000 = (audio_rate * audio_pkt_factor + 12000) * 1001
+	 */
+	audio_pkt_factor = (channels <= 2) ? 1 : 4;
+	audio_pkt_rate_x4_x1000 = (u64)(audio_rate * audio_pkt_factor + 12000) * 1001;
+
+	/*
+	 * Steps 2+5-6: Audio packets per line.
+	 *   AudioPackets_Line = CEIL[R_AP * htotal / f_pixelclk_max]
+	 *
+	 * With audio_pkt_rate_x4_x1000 = R_AP * 4 * 1000:
+	 *   = CEIL[audio_pkt_rate_x4_x1000 * htotal / (4 * 1000 * pixel_clk_max_hz)]
+	 */
+	audio_packets_line = DIV64_U64_ROUND_UP(audio_pkt_rate_x4_x1000 * mode->htotal,
+						(u64)4 * 1000 * pixel_clk_max_hz);
+
+	/*
+	 * Steps 7-9: Hblank overhead.
+	 * Standard:  2*dip_guardband + 2*control_period + video_guardband
+	 *          = 2*2 + 2*12 + 2 = 30
+	 * HDCP 1.x:  rekey_period + dip_guardband + control_period + video_guardband
+	 *          = 58 + 2 + 12 + 2 = 74
+	 *
+	 * Always use HDCP 1.x worst case (74) since HDCP can be toggled
+	 * via fastset without compute_config.
+	 */
+	hblank_overhead = 74;
+
+	/*
+	 * Step 10: Required TMDS cycles for Audio.
+	 *  32 TMDS clock cycles per audio packet.
+	 *   Hblank_audio_min = 32 * AudioPackets_Line + Hblank_overhead
+	 */
+	hblank_audio_min = 32 * audio_packets_line + hblank_overhead;
+
+	/*
+	 * Part 3: audio supported if Hblank_audio_min <= TB_blank and
+	 * audio packets per line <= Maximum allowed packets per line
+	 */
+	return hblank_audio_min <= available_tmds &&
+	       audio_packets_line <= HDMI_TMDS_AUDIO_PACKETS_LINE_MAX;
+}
+
+static void intel_audio_hdmi_eld_compute_config(struct intel_crtc_state *crtc_state)
+{
+	static const int sad_freqs[] = {
+		32000, 44100, 48000, 88200, 96000, 176400, 192000
+	};
+	const struct drm_display_mode *mode = &crtc_state->hw.adjusted_mode;
+	int hblank = mode->htotal - mode->hdisplay;
+	int bpc = crtc_state->pipe_bpp / 3;
+	int ycbcr_420_divider = (crtc_state->output_format == INTEL_OUTPUT_FORMAT_YCBCR420) ? 2 : 1;
+	int available_tmds;
+	u8 *eld = crtc_state->eld;
+	int mnl = drm_eld_mnl(eld);
+	int sad_count = drm_eld_sad_count(eld);
+	int src, dst = 0;
+
+	/*
+	 * Part 1: Calculate available TMDS clock cycles (TB_blank).
+	 *
+	 * TB_blank = CEILING[hblank * K_CD / K_420]
+	 *
+	 * K_CD = 1 for YCbCr4:2:2, bpc / 8 otherwise.
+	 * K_420 = 2 for YCbCr4:2:0, 1 otherwise.
+	 * Rearranged: CEILING[hblank * bpc / (8 * K_420)]
+	 *
+	 * TODO: As and when support for YCbCr4:2:2 is added, set bpc = 8
+	 * to achieve K_CD = 1
+	 */
+	available_tmds = DIV_ROUND_UP(hblank * bpc, 8 * ycbcr_420_divider);
+
+	/*
+	 * Walk all SADs once, keeping the ones with at least one supported
+	 * rate and compacting them down to a contiguous [0, dst) range.
+	 */
+	for (src = 0; src < sad_count; src++) {
+		struct cea_sad sad;
+		u8 new_freq_mask = 0;
+		int channels;
+		int bit;
+
+		drm_eld_sad_get(eld, src, &sad);
+		channels = sad.channels + 1;
+
+		for (bit = 0; bit < 7; bit++) {
+			if (!(sad.freq & BIT(bit)))
+				continue;
+			if (hdmi_audio_rate_supported(crtc_state, available_tmds,
+						      sad_freqs[bit], channels))
+				new_freq_mask |= BIT(bit);
+		}
+
+		if (!new_freq_mask)
+			continue;
+
+		sad.freq = new_freq_mask;
+		drm_eld_sad_set(eld, dst, &sad);
+		dst++;
+	}
+
+	/* Clear the now-unused tail */
+	if (dst != sad_count)
+		memset(&eld[DRM_ELD_CEA_SAD(mnl, dst)], 0, (sad_count - dst) * 3);
+
+	sad_count = dst;
+
+	/* Update SAD count in ELD header */
+	eld[DRM_ELD_SAD_COUNT_CONN_TYPE] &= ~DRM_ELD_SAD_COUNT_MASK;
+	eld[DRM_ELD_SAD_COUNT_CONN_TYPE] |= sad_count << DRM_ELD_SAD_COUNT_SHIFT;
+
+	/* Recalculate baseline ELD length (in dwords) */
+	eld[DRM_ELD_BASELINE_ELD_LEN] =
+		DIV_ROUND_UP(drm_eld_calc_baseline_block_size(eld), 4);
+}
+
 static
 bool intel_audio_needs_cpu_transcoder_id(const struct intel_crtc_state *crtc_state)
 {
@@ -725,6 +875,9 @@ bool intel_audio_compute_config(struct intel_encoder *encoder,
 	BUILD_BUG_ON(sizeof(crtc_state->eld) != sizeof(connector->eld));
 	memcpy(crtc_state->eld, connector->eld, sizeof(crtc_state->eld));
 
+	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI))
+		intel_audio_hdmi_eld_compute_config(crtc_state);
+
 	crtc_state->eld[6] = drm_av_sync_delay(connector, adjusted_mode) / 2;
 	mutex_unlock(&connector->eld_mutex);
 
-- 
2.50.1

