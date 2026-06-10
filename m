Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A52CD98CC
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 17:44:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF3B10EB58;
	Wed, 10 Jun 2026 17:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sms-medipool.de header.i=@sms-medipool.de header.b="P1R/bdPH";
	dkim-atps=neutral
Received: from mail.sms-medipool.de (mail.sms-medipool.de [178.63.14.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB90210EB44;
 Wed, 10 Jun 2026 17:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sms-medipool.de;
 s=mail; t=1781113456;
 bh=dpoFu1FGAJi3fJhQ8cTXoqtejaAXyrDlbC7wcgAcVRw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P1R/bdPHGFl2wMNFJUDYPWVOYiQPVyZnDTe4Q1j6tvP1/vEtcASqp6DO2q8Zjs9Zm
 DhPC0STJw2CUWg6EAXmtuo4RIFexn4VoMeYCe+WiMQMEAea8Au1W7ccEWgTYMTxel3
 rNzNb4mJRI8eXzqiCAQgwaiOnbIkGYtQhcBVc2o3/Te07+rMihoMmPL+Cch21IuSRG
 eNWgfTmBxnXqAIh4oqTVNuM+sEAk28A0mGOpts94yvDmPGygVY9pMaaCkfzjPeeBTO
 CCtx3olSW31g1SPKambwP9YwF25hibxH8mW+jRNudmm7LOLwRQb04CimkemkM1DcSO
 kob0+MnJxVwSA==
Received: from mail.stoss-medica.de (mail.stoss-medica.de [213.147.17.40])
 by mail.sms-medipool.de (Postfix) with ESMTPS id D757911B53;
 Wed, 10 Jun 2026 19:44:15 +0200 (CEST)
Received: from NUC16-Linux.sb.golima.de ([95.88.98.111])
 by mail.stoss-medica.de (Kerio Connect 10.0.8 patch 2) with ESMTP;
 Wed, 10 Jun 2026 19:44:14 +0200
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
Subject: [PATCH 1/3] drm/i915/dp: Prefer DSC over a 6 bpc uncompressed output
Date: Wed, 10 Jun 2026 19:44:11 +0200
Message-ID: <20260610174413.5881-2-alexander.kaplan@sms-medipool.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260610174413.5881-1-alexander.kaplan@sms-medipool.de>
References: <20260610174413.5881-1-alexander.kaplan@sms-medipool.de>
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
DSC with an at least 8 bpc input provides a better output quality
than a dithered 6 bpc output, so prefer it, following the pattern
commit ba49a4643cf5 ("drm/i915/dp: Set min_bpp limit to 30 in HDR
mode") uses for HDR: keep the uncompressed minimum pipe BPP at 8 bpc
if the sink supports DSC, making the uncompressed link config fail
for such modes and the mode fall back to DSC.
As there, if the DSC computation fails, the mode falls back to YCbCr
4:2:0 where supported, or gets rejected.

Besides the output quality, some sinks can't even display a 6 bpc
stream at high pixel clocks.
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
Sinks without DSC support keep falling back to 6 bpc.

Tested on PTL (xe) with the above PCONs and an LG OLED G4.

Cc: Imre Deak <imre.deak@intel.com>
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Alexander Kaplan <alexander.kaplan@sms-medipool.de>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 85d3aa3b9894..13cfccf60490 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2839,6 +2839,18 @@ intel_dp_compute_config_limits(struct intel_dp *intel_dp,
 								     crtc_state)));
 	}
 
+	/*
+	 * Prefer DSC with an at least 8 bpc input over a dithered 6 bpc
+	 * uncompressed output, by failing the uncompressed link config for
+	 * modes which would fit only with a 6 bpc pipe BPP. Honor a lower
+	 * limit set via the max bpc connector property.
+	 */
+	if (!dsc &&
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


