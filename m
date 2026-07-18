Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F8FC44525
	for <intel-xe@archiver.kernel.org>; Sat, 18 Jul 2026 10:52:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3717E10E56F;
	Sat, 18 Jul 2026 10:52:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sms-medipool.de header.i=@sms-medipool.de header.b="gmjGUTKj";
	dkim-atps=neutral
Received: from mail.sms-medipool.de (mail.sms-medipool.de [178.63.14.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA9710E561;
 Sat, 18 Jul 2026 10:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sms-medipool.de;
 s=mail; t=1784371929;
 bh=6Iohovlj+/8MKjUXT1wjG9WzkydLBV9N63VsEKDeHdY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gmjGUTKjGU4hmujL8nbXPpRzVC8qSvJOTMcYGhhfk0COBO85FRyaAClmUdSVB6O2v
 KQqulfxpyrxMQ/TDfzMkN5pDg0EFc3RwuWIzl2qj/43lBeiahfenugzHdS7uz1Pd7M
 ErJQRHs03WpHctHSAcyhqQs6mnYRlKsooEF+cFnV0ToTxhnqf8qmuEHoXDhldISGiB
 RmUEbU/2jE7/SWeLkXP08jyQyzH2oyKpkM3KiIMKhi+yms1g8g7ijI12yfG0Nq4WgD
 fE4f1MLPbKk5ZJknp56NZuBkThMkWT+8RZ3f7TdS+CnHp1m6eepFbDt3Y1yotaBysz
 aGgbfxjTl3eJA==
Received: from mail.stoss-medica.de (mail.stoss-medica.de [213.147.17.40])
 by mail.sms-medipool.de (Postfix) with ESMTPS id 7859418C16;
 Sat, 18 Jul 2026 12:52:09 +0200 (CEST)
Received: from NUC16-Linux.sb.golima.de ([95.88.98.111])
 by mail.stoss-medica.de (Kerio Connect 10.0.8 patch 2) with ESMTP;
 Sat, 18 Jul 2026 12:52:08 +0200
From: Alexander Kaplan <alexander.kaplan@sms-medipool.de>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Imre Deak <imre.deak@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, alexander.kaplan@sms-medipool.de
Subject: [PATCH v2 1/2] drm/i915/dp: Prefer DSC over 6 bpc uncompressed output
 for HDMI sinks
Date: Sat, 18 Jul 2026 12:52:06 +0200
Message-ID: <20260718105207.5565-2-alexander.kaplan@sms-medipool.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260718105207.5565-1-alexander.kaplan@sms-medipool.de>
References: <20260718105207.5565-1-alexander.kaplan@sms-medipool.de>
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

For modes which fit through the link uncompressed only with a 6 bpc
pipe BPP, the link config currently selects 6 bpc with dithering even
if the sink supports DSC.

For HDMI sinks behind a DP to HDMI protocol converter this is the
wrong preference: HDMI knows no 6 bpc transport format, so the
converter has to expand the dithered 6 bpc stream back to 8 bpc for
the HDMI link anyway, and DSC with an at least 8 bpc input provides
a better output quality than that.
Prefer DSC, following the pattern commit ba49a4643cf5 ("drm/i915/dp:
Set min_bpp limit to 30 in HDR mode") uses for HDR: keep the
uncompressed minimum pipe BPP at 8 bpc if the sink supports DSC,
making the uncompressed link config fail for such modes and the mode
fall back to DSC.
As there, if the DSC computation fails, the mode falls back to YCbCr
4:2:0 where supported, or gets rejected.

Besides the output quality, some converters can't even display a
6 bpc stream at high pixel clocks.
Synaptics VMM PCON based DP to HDMI 2.1 adapters from two device
families (branch device IDs SYNAq and SYNAa) output corrupted FRL
timings for an uncompressed RGB 6 bpc 4k120 (1188 MHz) stream,
resulting in a black screen, while the same mode works with DSC
(12 bpc input) and 6 bpc works at lower pixel clocks.
Windows and macOS drive 4k120 on these devices only via DSC.

A lower bpc limit explicitly requested via the max bpc connector
property is still honored.
This keeps the current uAPI behavior (exercised by IGT kms_dither)
and provides an escape hatch for sinks with a broken DSC
implementation.
DP and eDP sinks, and HDMI sinks without DSC support, are not
affected and keep falling back to 6 bpc.

Tested on PTL (xe) with the above PCONs and an LG OLED G4.

Cc: Imre Deak <imre.deak@intel.com>
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Alexander Kaplan <alexander.kaplan@sms-medipool.de>
---
v2: Apply the limit only to HDMI sinks behind a DFP
    (intel_dp_has_hdmi_sink()), leaving DP and eDP link config
    policy untouched, and adjust the subject accordingly. (Ankit)

 drivers/gpu/drm/i915/display/intel_dp.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index b2464a3dac056..7e860f62d5554 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2671,6 +2671,20 @@ intel_dp_compute_config_limits(struct intel_dp *intel_dp,
 								     crtc_state)));
 	}
 
+	/*
+	 * HDMI knows no 6 bpc transport format, and DSC with an at least
+	 * 8 bpc input provides a better output quality than a dithered
+	 * 6 bpc output. Prefer it for HDMI sinks, by failing the
+	 * uncompressed link config for modes which would fit only with a
+	 * 6 bpc pipe BPP. Honor a lower limit set via the max bpc
+	 * connector property.
+	 */
+	if (!dsc && intel_dp_has_hdmi_sink(intel_dp) &&
+	    intel_dp_supports_dsc(intel_dp, connector, crtc_state) &&
+	    limits->pipe.max_bpp >= 24 &&
+	    crtc_state->pipe_bpp >= 24)
+		limits->pipe.min_bpp = max(limits->pipe.min_bpp, 24);
+
 	if (limits->pipe.min_bpp <= 0 ||
 	    limits->pipe.min_bpp > limits->pipe.max_bpp) {
 		drm_dbg_kms(display->drm, "[CONNECTOR:%d:%s] Invalid pipe bpp range: %d-%d\n",
-- 
2.54.0

