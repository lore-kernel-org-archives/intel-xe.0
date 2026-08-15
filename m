Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556FEC5DF66
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 12:39:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1574510E79A;
	Mon, 17 Aug 2026 12:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CkSBZ7k9";
	dkim-atps=neutral
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F2510E21A
 for <intel-xe@lists.freedesktop.org>; Sat, 15 Aug 2026 16:41:59 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-84867f07d63so1983904b3a.2
 for <intel-xe@lists.freedesktop.org>; Sat, 15 Aug 2026 09:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786812119; x=1787416919; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=B7syqqlv6107gB1yL3JYNqE/FxDJIWovYEa1sbJDV+M=;
 b=CkSBZ7k93cTL695Zy/LhesTrs2Kfeo6ct67Jf6BejyImkReQRygMKUSId4qPteznTG
 GItPw/ARx8e21c5ujM8wpLr9iKkZ0NnO+/8l0zSpeyE8mrZtHMtOk0M7uPoVCkH7hFMP
 wrecd+ckcYfwLbmwiqZ/j9J/Yhg8RdwQPN5tXR1XzFuIf1AkkIuOm/BWPGJGvMGiJBsA
 dgpNErpR1IfC634IqzJNNEYuJtnUha0yxG+oBNIExbPpnRT3Pbpf/ShD02khHrRaqNDh
 ZddDZavoMTc0Xn2d5PVRHCEJXmIimTdcH1jX5l6KDLN0+uO1FZLrSgVI8erZvvgAT6p4
 4W/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786812119; x=1787416919;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=B7syqqlv6107gB1yL3JYNqE/FxDJIWovYEa1sbJDV+M=;
 b=fzxFYEryi028cMGgn6bFVpP60q91e4ib8OnEmimh35lFMegT0YGomZozVrNjZ/arQ+
 Qg2tW91JPdIDqEfldH5tjOJNGeytnW4CXsTsq8Avphi/7MpQczm1L4Fo6IcmYQwgYbnR
 o2Q/9j6Sg/HL5C0Pd96TUDGmFqKN9uxgUrq4ko0UTtMqk+kPshRm6KWhgmgRdqSEDtiJ
 Y7LcBSS4/TZUVPuUDe/Osfvq7cJ9Byhq4HaXPMq914qf87ORYw1Mo/x77xeqvQG28kbg
 aMXv+U9oz0xTx+M0ErxNsW4KH51B1Z3Ze/y4+Cn6oJzZqYXU4JC3Pdv4sj9+hUpUq/eL
 XmQw==
X-Forwarded-Encrypted: i=1;
 AHgh+RreZljih1/o6NgyJD0AeST+LP7u27Ih8rxUGrpQlou22OM6MfoFfVy7aY4BQltCmKwZnPdoJdzu7g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOkBeffltg2E43b4xEexYD5l8lN+ylt9YOqibcq6cKLkIfGCLl
 9B+MStMMEzkPNWXTLGfP9zuke/bSJFqCtV/1JqsyOFZpbrOwdcYQzWdy
X-Gm-Gg: AR+sD13yxQCU0Nx73UwtBTi6IZewNVC5i0BciZnhmgMzKXpCJp5wGhrGXBP2qqD3i2q
 mp2hzWSeQezsYNEuYl5VivEBqY6gnFZn57haaXfpqDy6OBVkLJAlE7CLXcQOXcv8vw3PBEIltjn
 R4uk24U0qvtOXuEdMHQ2n3bQDl9Qsh/Nm723Nf6OEzCQ9FuwT/XqMWexxCbF1OuC9iONZo9gmHa
 NspybMLM9VcSU4GaLA+lF12IA52IQhoD1beomP+BuwZzvESPq+vkCCRPEmIP5qwSO+BkFwG4SiG
 D7y40DaVCrIYT4k3Kv/1cOwIS6X0NSOo8RY5DCFM6JePHO3YaRxcGqwDqSMoMOqheCp7WMnUVPJ
 msuLXR03GgbQRPyPIg3d0e4Lsge5zMfs+tM8IeuS1CnBE/YL77OM6B5EEdAdui54lDdcRIIU83P
 Z8k/rA48TEh6gU+UzohPLTdvYleCGNTo/hg00fu71yrShrV9GibqwLeuyVJKKNHmMRaErrkkCXc
 FWq0j3+mgxfnEIVQ3PvYg==
X-Received: by 2002:a05:6a00:1810:b0:837:f79d:909 with SMTP id
 d2e1a72fcca58-84fde2defa1mr13881212b3a.39.1786812118931; 
 Sat, 15 Aug 2026 09:41:58 -0700 (PDT)
Received: from allen-xiaomibookpro14.lan ([2600:1900:4030:ad65:0:1::])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8517d249c54sm1405086b3a.48.2026.08.15.09.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 09:41:58 -0700 (PDT)
From: =?UTF-8?q?Chang=20Jiong=28=E5=B8=B8=E7=82=AF=29?= <xspeed1989@gmail.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 ville.syrjala@linux.intel.com, stable@vger.kernel.org,
 Chang Jiong <xspeed1989@gmail.com>
Subject: [PATCH] drm/i915/cdclk: Don't force cd2x pipe select on Xe3 in
 bxt_sanitize_cdclk()
Date: Sun, 16 Aug 2026 00:41:47 +0800
Message-ID: <20260815164149.607690-1-xspeed1989@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 17 Aug 2026 12:39:07 +0000
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

Since commit 2ee8dbd880b1 ("drm/i915/cdclk: Fix up CDCLK_FREQ_DECIMAL
without a full PLL re-enable") bxt_sanitize_cdclk() normalizes the
CD2X pipe select field of the CDCLK_CTL readback to PIPE_NONE before
comparing against the expected value.

However bxt_cdclk_ctl() does not include the CD2X pipe select field
at all on DISPLAY_VER() >= 30, so on Xe3 (PTL) the normalized
readback (pipe field forced to the PIPE_NONE encoding, 0b111) can
never match the expected value (pipe field 0). The comparison now
fails on every boot and we always take the full CDCLK PLL
disable+re-enable path with the BIOS framebuffer actively scanning
out - exactly what this code was trying to avoid. On a Panther Lake
laptop (Arc B390, 8086:b080, eDP 3120x2080@120) this causes
"CPU pipe A FIFO underrun" during probe and persistent full-screen
scanout corruption for the first KMS client (the SDDM greeter);
the corruption lasts until the next full modeset.

Only normalize the CD2X pipe select field on platforms where
bxt_cdclk_ctl() actually programs it, mirroring its DISPLAY_VER()
check.

Fixes: 2ee8dbd880b1 ("drm/i915/cdclk: Fix up CDCLK_FREQ_DECIMAL without a full PLL re-enable")
Cc: stable@vger.kernel.org
Signed-off-by: Chang Jiong(常炯) <xspeed1989@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -2364,8 +2364,10 @@ static void bxt_sanitize_cdclk(struct intel_display *display)
 	 * dividers both syncing to an active pipe, or asynchronously
 	 * (PIPE_NONE).
 	 */
-	cdctl &= ~bxt_cdclk_cd2x_pipe(display, INVALID_PIPE);
-	cdctl |= bxt_cdclk_cd2x_pipe(display, INVALID_PIPE);
+	if (DISPLAY_VER(display) < 30) {
+		cdctl &= ~bxt_cdclk_cd2x_pipe(display, INVALID_PIPE);
+		cdctl |= bxt_cdclk_cd2x_pipe(display, INVALID_PIPE);
+	}

 	if (cdctl != expected) {
 		if (DISPLAY_VER(display) < 20) {
