Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47AC9C624D6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 13:09:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E71D510F1E0;
	Wed,  2 Sep 2026 13:09:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="jCZmRtUK";
	dkim-atps=neutral
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E8610EAE6
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 21:00:00 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-93900ed2925so36852085a.0
 for <intel-xe@lists.freedesktop.org>; Tue, 01 Sep 2026 14:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1788296400;
 x=1788901200; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YZD8NsGTxScfsyqxwjhq65/CKhM7Tjjz26PTc7lYLxg=;
 b=jCZmRtUKFTL00dPJ0x0K/ivKTaafbAkRiyAkKBpOftRV0ehXO/xAGVeTuxha75F2V7
 rdsA1IJrkMxDMNnabF6nI5bbB51eaeosCWyfhvpzwXBVifwNK/T9HRhfQk2BdEda/LJk
 smj6TP+TUxb05EjzKXBOHaOPVOUPJFUe8Vgv3F+IAgqzyUijI15qrK3Kx+Jz4eX+6WVI
 ETvOco4RnPVEAycL2EqyJaA2z4jVji2nmSqoEyVib62TRkfaqS96WQWCc2DEg1a0hZxo
 d/NO+kMj6yp2HzXKl5IYrHO3vUDnIFp4lx0XwxbM3xvWAUgG2Ra/tTTIZr3HRIKhY9Gw
 zn1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788296400; x=1788901200;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=YZD8NsGTxScfsyqxwjhq65/CKhM7Tjjz26PTc7lYLxg=;
 b=O6QyBGnkJwunNbqIGUE23sfG7VEDJetZcNAIEnBvyXlqwuCwqC34Hmn6XI8pIpXNhH
 ZnkyayiiWZ6o3BOz+t9TbcWXbKczkVwRfYzgRfVNds87fdfinNJULgAIB6zhk5j9unlz
 CQWZihl/toifqci6+S1Fwm3rc89/B+FMC8d8WskNvEcJ5pEYVFR758gAvK99hac8d26N
 l1EmKZ5NR++P7i2v5UyrLqzWol55Q+Rud+FFu8VgLPStTPCSKzDoB6Tx60IGkpozlT1m
 +u1lwDK6TTlDbdKqHnZmG8Ef15Ls+Y4qQLWKENdlFXiwbatyh6AU/WGUJ9QOjvJ26D66
 9q/w==
X-Forwarded-Encrypted: i=1;
 AHgh+RpAhOMtHOXmbkHWSZNjdpqtGbA900oGUJvUOYE3Nnqo/Sm6tapc4CVrAF20BvXA4HwaXti7wsQ0Dg==@lists.freedesktop.org
X-Gm-Message-State: AFuF++n2SUWv4W0/SiCRPtG9iLo53Sj6Yz3xjMPwyos2r+MyqLSpsSpd
 SysRpep9r8VeiVmQ/jeNOYrlYEz6zLGo/1GpAZCU66X6/iBMOXBsk4Bu7b/kL3mxE04=
X-Gm-Gg: AR+sD10i2b6Z8FcTMx+gkhACCd6GuD40O8TO3k18Q+AXR0XVysBn4UQ2d4MEygP98FC
 O4AaOOL9WdBWFTZsmVIwDqct9Gw1POt0eDvjfG4otdZYeSbwi7XEXSacVQBYej0kBTpcyoaGk/D
 qXEJ+n0PTQnLgDmjINcaBtXs0+9ms1X2she3qNwJazIU92i/KAF+LaGvzXn1MOCgmjrdt/P4kLx
 vjrIxeVovzLRaYzS+WBblUauhdh7T42ZkUxRamB9kB5EVtgZO87HePRKVLmHJd6ZWcArGZIOv65
 NGtciC8R7Fr1lBCZXMhGsEOneCsRcIQLNkmzuOAkrzAK/gJICws7MPiS8IkBewbRnfJlFm/btUA
 G6FXgm7cc9qBJG1xj7ponB4E2JHrTs2of7iAVS6BcKhbz7GQ/KqSpPokiP5mVfEaYpJOLSnycZM
 Cf3D0q6gBxgR5gYmvfw7OT8cfqcrefrNDAF52eBf3hmbdiSrR6Knyklg8ImUO9dyLwUvlVId+sJ
 P+B3JCVhHv42NtY2J+tJ/4EvSGNdcBQOQ91OxirdR6fGGx1aHJoK/twDCN2NTzAipmzckEGu6sW
 jS6/fLY4zt9zZcwtijAFAYFVR2nYAyHWPQ6KA0hF8/qbN2e6dpX+w2OjXm1l/V7iHY9J
X-Received: by 2002:a05:620a:72c3:10b0:92e:bc28:5479 with SMTP id
 af79cd13be357-93960cafc51mr14525185a.2.1788296399612; 
 Tue, 01 Sep 2026 13:59:59 -0700 (PDT)
Received: from jake-laptop ([153.67.1.208]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9395f1aba80sm33533585a.20.2026.09.01.13.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2026 13:59:58 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: jani.nikula@linux.intel.com,
	rodrigo.vivi@intel.com
Cc: jouni.hogander@intel.com, mika.kahola@intel.com,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/i915/psr: clear the Panel Replay error status register
Date: Tue,  1 Sep 2026 16:59:56 -0400
Message-ID: <20260901205956.130779-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901203633.92628-1-j@metarealtyinc.ca>
References: <20260901203633.92628-1-j@metarealtyinc.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 02 Sep 2026 13:09:54 +0000
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

psr_get_status_and_error_status() selects the DPCD offset to read the error
status from based on whether Panel Replay is enabled:

	offset = intel_dp->psr.panel_replay_enabled ?
		 DP_PANEL_REPLAY_ERROR_STATUS : DP_PSR_ERROR_STATUS;

but intel_psr_short_pulse() acknowledges it unconditionally to the PSR
register. Under Panel Replay the error is therefore read from
DP_PANEL_REPLAY_ERROR_STATUS (0x2020) and the acknowledgement written to
DP_PSR_ERROR_STATUS (0x2006). DP_PANEL_REPLAY_ERROR_STATUS is never written
anywhere in the tree; it appears only in the read above and in its own #define.

The sink's Panel Replay error latch can consequently never be cleared. Once it
latches, every subsequent short pulse re-reads the same errors, so PSR is
disabled with sink_not_reliable set permanently, and until a short pulse
arrives the driver keeps Panel Replay enabled while the sink is reporting
errors it cannot see.

Observed on a Dell XPS 16 DA16260 (Panther Lake, Arc B390, display version
30.00) with the eDP Panel Replay quirk from commit cb8d155b0806 removed
locally so the feature could be exercised. The sink reports a persistently
latched error:

	Sink PANEL-REPLAY status: 0x2 [active, display from RFB]
	Sink PANEL-REPLAY error status: 0x1:
		PANEL-REPLAY Link CRC error

which survives across reads indefinitely, while dmesg stays silent and Panel
Replay Selective Update remains enabled.

Use the same conditional offset when clearing. psr->panel_replay_enabled
cannot be used at that point because intel_psr_disable_locked() clears it
earlier in the same function whenever an error was detected, which is exactly
the case that needs the Panel Replay offset, so save it beforehand.

v2: use a copy of panel_replay_enabled taken before
    intel_psr_disable_locked() clears it. In v1 the condition was evaluated
    after the disable, so it selected DP_PSR_ERROR_STATUS in the error path
    and the patch was a no-op there. Caught by Sashiko AI review.

Signed-off-by: Jake Steinman <j@metarealtyinc.ca>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -3840,6 +3840,7 @@
 	struct intel_display *display = to_intel_display(intel_dp);
 	struct intel_psr *psr = &intel_dp->psr;
 	u8 status, error_status;
+	bool panel_replay_enabled;
 	const u8 errors = DP_PSR_RFB_STORAGE_ERROR |
 			  DP_PSR_VSC_SDP_UNCORRECTABLE_ERROR |
 			  DP_PSR_LINK_CRC_ERROR;
@@ -3860,6 +3861,12 @@
 		goto exit;
 	}
 
+	/*
+	 * Save this before intel_psr_disable_locked() clears it; the error
+	 * status is acknowledged to a different DPCD address depending on it.
+	 */
+	panel_replay_enabled = psr->panel_replay_enabled;
+
 	if ((!psr->panel_replay_enabled && status == DP_PSR_SINK_INTERNAL_ERROR) ||
 	    (error_status & errors)) {
 		intel_psr_disable_locked(intel_dp);
@@ -3885,7 +3892,10 @@
 			"PSR_ERROR_STATUS unhandled errors %x\n",
 			error_status & ~errors);
 	/* clear status register */
-	drm_dp_dpcd_writeb(&intel_dp->aux, DP_PSR_ERROR_STATUS, error_status);
+	drm_dp_dpcd_writeb(&intel_dp->aux,
+			   panel_replay_enabled ?
+			   DP_PANEL_REPLAY_ERROR_STATUS : DP_PSR_ERROR_STATUS,
+			   error_status);
 
 	if (!psr->panel_replay_enabled) {
 		psr_alpm_check(intel_dp);
