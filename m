Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1E3C4451C
	for <intel-xe@archiver.kernel.org>; Sat, 18 Jul 2026 10:52:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C3D10E32E;
	Sat, 18 Jul 2026 10:52:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sms-medipool.de header.i=@sms-medipool.de header.b="b/PJ/HTk";
	dkim-atps=neutral
Received: from mail.sms-medipool.de (mail.sms-medipool.de [178.63.14.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7093310E56A;
 Sat, 18 Jul 2026 10:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sms-medipool.de;
 s=mail; t=1784371929;
 bh=3IuUFL+OtZXh1hA/9FYdPeYsr2TUteKbwTUskdSrVEY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b/PJ/HTkwjgaDuykQB332Pz/CTrG/K9ZIavYVx9fNQHa424sjtmBQ1m4j9E3yDQbn
 0+g9TNVTNtWNXe9L/6QGEHuTuE7F2+9SeD7hQd3XrupMVCZ+/q4P9s+QbZqHo+Mov7
 EKrwZAHCLw3yeNWCVnkk5u84ne/uLUv4gYuiUFa1xinvkKmgrH2iOA3sgWa2iWWFaB
 RahOXIN3j/UZf9qADSXKYPkLsq5EWVhp5uCn8EbMFShw4q16pLquxamAzruTbYU/By
 zoNZ80C+PxyXzuqZfpA4zrflxgagrljGQb/Jx8/Ss/Cvy+Fluh5uFu8MRFdZtNu4LM
 CTvJKz6gYCS3Q==
Received: from mail.stoss-medica.de (mail.stoss-medica.de [213.147.17.40])
 by mail.sms-medipool.de (Postfix) with ESMTPS id 79BC318C9E;
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
Subject: [PATCH v2 2/2] drm/i915/dp: Ignore the sink's DSC max FRL rate
 without a PCON DSC encoder
Date: Sat, 18 Jul 2026 12:52:07 +0200
Message-ID: <20260718105207.5565-3-alexander.kaplan@sms-medipool.de>
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

intel_dp_hdmi_sink_max_frl() limits the sink's max FRL rate by its
DSC max FRL rate whenever the sink supports DSC 1.2.
However, the DSC max FRL rate (HF-VSDB DSC_Max_FRL_Rate) only applies
to compressed video transport, which requires a DSC 1.2 encoder in
the PCON (configured via intel_dp_pcon_dsc_configure()).
Without such an encoder the HDMI link always carries uncompressed
video, for which the regular Max_FRL_Rate is the correct limit.

Applying the DSC limit unconditionally trains the FRL link at a lower
rate than both the PCON and the sink support.
E.g. an LG OLED G4 (Max_FRL_Rate 48 Gbps, DSC_Max_FRL_Rate 24 Gbps)
behind a Synaptics VMM7100 PCON (PCON max FRL bw 48 Gbps, no DSC
encoder):

  Sink max rate from EDID = 24 Gbps
  FRL trained with : 24 Gbps

while Windows/macOS train the same hardware at 40/48 Gbps.
The too low FRL rate needlessly constrains the formats available to
the sink.

Only apply the sink's DSC max FRL rate if the PCON has a DSC 1.2
encoder, matching the gate in intel_dp_pcon_dsc_configure().
PCONs with a DSC encoder keep the current conservative behavior,
since the link is trained once and compressed transport may be used
for any subsequent mode.
With this the setup above trains at 48 Gbps.

Tested on PTL (xe) with the above PCON/sink combo.

Fixes: 10fec80b48c5 ("drm/i915/display: Configure PCON for DSC1.1 to DSC1.2 encoding")
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Alexander Kaplan <alexander.kaplan@sms-medipool.de>
---
v2: No code changes. Picked up Ankit's Reviewed-by.

 drivers/gpu/drm/i915/display/intel_dp.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 7e860f62d5554..f21abb174c4a6 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4100,7 +4100,14 @@ static int intel_dp_hdmi_sink_max_frl(struct intel_dp *intel_dp)
 	rate_per_lane = info->hdmi.max_frl_rate_per_lane;
 	max_frl_rate = max_lanes * rate_per_lane;
 
-	if (info->hdmi.dsc_cap.v_1p2) {
+	/*
+	 * The sink's DSC max FRL rate only applies to compressed video
+	 * transport, which requires a DSC 1.2 encoder in the PCON. Without
+	 * one the HDMI link always carries uncompressed video, for which
+	 * the regular max FRL rate is the limit.
+	 */
+	if (drm_dp_pcon_enc_is_dsc_1_2(intel_dp->pcon_dsc_dpcd) &&
+	    info->hdmi.dsc_cap.v_1p2) {
 		max_dsc_lanes = info->hdmi.dsc_cap.max_lanes;
 		dsc_rate_per_lane = info->hdmi.dsc_cap.max_frl_rate_per_lane;
 		if (max_dsc_lanes && dsc_rate_per_lane)
-- 
2.54.0

