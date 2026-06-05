Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93D4CD6E79
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 12:23:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D72C11A801;
	Fri,  5 Jun 2026 12:23:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VotzUqye";
	dkim-atps=neutral
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA9410E466
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 06:07:50 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2c0c3543590so10947185ad.2
 for <intel-xe@lists.freedesktop.org>; Thu, 04 Jun 2026 23:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780639670; x=1781244470; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=M5WkcatAHhLMBNeD67NubkG9Mg0FFDk4z9wml5JZOUU=;
 b=VotzUqye4l8ufsB0FJ8tEP7J+6cOElz5twrd8zV4DPpK/zK1E1ttRIrbeIrBIGCxv0
 2F3yleNhIa43o/iPh9dVPdjrFasLMXzfv+9bDEXbYSQtC09FvxBnC/vYjE3AD4MlDpbr
 iE5F2PwXU/0QWKjRlJDMgl5aCsqOqQWalXbP0WPHEYDBHdPU+T+Tv168u0sR8OLljtxs
 +3olFCZFSZpekkp9Mh3GpoE+3GcHUJE70pXX2os2VxIfhE/tv4tDuvc0e73PoZNNaKkB
 3GaDmkYG6pUMZRAo+Dq0WsDhm6tSjBMLKMY98fHpnmGXxE5KeiNIqQQw5YTkE2H4nXiE
 FAPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780639670; x=1781244470;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M5WkcatAHhLMBNeD67NubkG9Mg0FFDk4z9wml5JZOUU=;
 b=UlW9VDqeka1DjDSK71F5819WsHicKlk3TiujzgjogCAFaa2HkvUyozW/VB6gUsDpKO
 U3byJPPIXhROZz24STnaBfJiYFwcOjmk+9n/+xIH1jnn5IzzkjMNC2Df9nHCN6m+LybA
 +D1bD2sNaGoohQomiKBcmLpf3udOdjab9B760gHjyaW6ef6RRo95/r/HsxVWljtvsKDq
 DFTlWm0o0PFDmjXy1wgf9I17y7P+EOhOs7dxbHadbq/hfBcAQ2aCeO34TrViIGu6hw6i
 mjAyxXTK4xy2/g3hyRt24ssrA9jjq7SkNekT2mm5ZYC+Xch460JRDD16EgOitVoevaqa
 fvmA==
X-Forwarded-Encrypted: i=1;
 AFNElJ88kCitUHwZWTgHJ4vwVPNwjset007FTkS4yUJT7jp9L8Wt8N7lf6tITNhRc39lIcH9u+aiRwzarQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+KsemP1nndAvuAglZUN/J+hCBLbQrMBnGoYhzjLzQSFcZ8OLn
 nYQVVMc/HFxt4ZRSDy/sjbrKk2YyKorA7i1bwowzUxNVSbu4aZYNvWcI
X-Gm-Gg: Acq92OHc00H0zLPOwjI7Harsu86BTzOMElQIFx+1oWgQFeTrzc3aUEVi8womyvzFFOL
 NEw3ATl5+CGHf83ryJuLAicUJrQoGXmYkmxFParlE1Y4tZMd4VPQpzIJqrXwt4XzaplTluE3TYe
 iJ+Vu1R5Ol14klR9yVjvlVdjTeR3phJjv5zILI+hUKBkD0gZavzNLmzNIhj876Vym0IeON/gcAu
 CHsfIoHQdLjhqnfyaP6fMO2Pe+3XbfB9d8T60EFU8o50xTiAXgOL3F5pYLZEGrjvjAitPjpRsoQ
 J8fJsC1s8p7jYzrxRV/ncyGsdO+xhfovaQBmadg5WAVR3gSvLVDZRRE08obN9zclvGj1QnEdXkd
 GRWyBDQivRbAYPTN+izNtvMLzqc24GHQbXXmOgif0yLVDY9pRU6bvu5EHcUQMW2NNBYrlcu9FJT
 M2EFWlTdx5HLyz8B0U
X-Received: by 2002:a17:902:fc46:b0:2c0:b9a1:6493 with SMTP id
 d9443c01a7336-2c1e7b082b4mr20237105ad.10.1780639670162; 
 Thu, 04 Jun 2026 23:07:50 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c1646e5c51sm77298475ad.0.2026.06.04.23.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 23:07:49 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Imre Deak <imre.deak@intel.com>,
 Uma Shankar <uma.shankar@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] drm/i915/dp_tunnel: fix CRTC hw state cleanup ordering
Date: Fri,  5 Jun 2026 14:05:27 +0800
Message-ID: <20260605060527.1443552-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 05 Jun 2026 12:23:19 +0000
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

intel_crtc_prepare_cleared_state() frees the old CRTC hw state before
calling intel_dp_tunnel_atomic_clear_stream_bw(). The latter can fail
while looking up the DP tunnel group state, for example with -EDEADLK.

If that happens, the function returns without completing the cleared
state preparation, leaving the duplicated CRTC state with its hw color
blob references already dropped. The failed atomic state will then be
cleared by the atomic core, which can drop the same references again.

Move the hw state release after the DP tunnel stream BW clear has
succeeded. Keep the temporary state allocation before the failable DP
tunnel operation so an allocation failure cannot happen after the stream
BW has already been cleared.

Fixes: fb69d0076e68 ("drm/i915/dp_tunnel: Fix error handling when clearing stream BW in atomic state")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index ad2fe10b6b1f..0c015bc6c9fd 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -4646,9 +4646,6 @@ intel_crtc_prepare_cleared_state(struct intel_atomic_state *state,
 	if (!saved_state)
 		return -ENOMEM;
 
-	/* free the old crtc_state->hw members */
-	intel_crtc_free_hw_state(crtc_state);
-
 	err = intel_dp_tunnel_atomic_clear_stream_bw(state, crtc_state);
 	if (err) {
 		kfree(saved_state);
@@ -4656,6 +4653,9 @@ intel_crtc_prepare_cleared_state(struct intel_atomic_state *state,
 		return err;
 	}
 
+	/* free the old crtc_state->hw members */
+	intel_crtc_free_hw_state(crtc_state);
+
 	/* FIXME: before the switch to atomic started, a new pipe_config was
 	 * kzalloc'd. Code that depends on any field being zero should be
 	 * fixed, so that the crtc_state can be safely duplicated. For now,
-- 
2.43.0

