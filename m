Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201CCCDB470
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 08:42:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF1B10EA05;
	Tue, 23 Jun 2026 08:42:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.b="nO/hURDq";
	dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18FFB10EA05
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jun 2026 08:42:07 +0000 (UTC)
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9D1C83F4B4
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jun 2026 08:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1782204125;
 bh=YRUdbfA4V8+mw/54eWhWx7hbp+2WiDaQD/36neeUeQE=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
 b=nO/hURDqPv0Hw+LeLdwYSAUk9XCKOBR9X3Z/uIukpBB3qVPz3Pw+1ESZJgjGJ14Pj
 nKO4TdZw5pW1QHKNGOc4HnV3dJxVarsK3IxuDleBCezW0zOPqHvE9C/erIscGYpVjy
 bq52dGJcTAj4QzxwpIjl4Rja+SCm01bq716vSYAFXPaAnlJSsuHh/RSXyidt7d3KAq
 tRNokxpmLunnnuk4TKtjmLpt0pUmKPvTOdjm28W79pIWLL+X4I6vG3n73M54UcEx6f
 amxwZsRaXibaFzggaJ4YcHAhUaBnr+TlH10lCJO0QgS5ZlGMARuGNuLo/BzZO59l3Y
 UBCOlIMc0AZpJ4drsYivLxXMABmq+CvzMwppXP0agREcOcThVUc54DwPW10QMvmKQw
 h+K1xspjEjve9A3kpo4snPags7/TC5pjfCn5aeQfe0hYmBLFPgz+Me5up9PvH2uz92
 macX5KHODPLXe6RDwJf2v0l5ghVB2jplbqqAv5IstVl8q7OtdS9M5sMyPAtEQ8Zh2v
 0MLn8M3P+WDNaCvgAr1DlOJhh/OaOC1PUR0aBGpGdXzbon1jNpLYGERow5EtQs/GvK
 lHv2moGgCZ3pz3vNoglD686SDlGC1pd6RUDAcOV2qC7cFHjrhJaBROxO4Fe4623vsa
 Pkr2HLigBqiT+hT4YZb5y6j8=
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-845338eb797so740603b3a.0
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jun 2026 01:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782204124; x=1782808924;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YRUdbfA4V8+mw/54eWhWx7hbp+2WiDaQD/36neeUeQE=;
 b=UVUEwvcp8WTP2Q7wvFizVwHMw4HqHwiezJMOGKNOMjSQ706MW9V3I0wRejCOTpSdsp
 WQA6yS03rAJ2IEOspklxkTfgOZq7sx2Bs5tSmax1Q4F6dw6KuXtaODeSMjJoFZHyRNtS
 qVfOpltbt4ILR0r0V5LjkD/Bj4P2hdb8FqZ9gPEyuYak52QmWneI35jG7TnQYbDnoRvl
 hkjmqn89SYt/47Eb4MjsAtMXrZNNl3Khhk63B1GKooNg24Jy8L02i4Hu5jcs0To/hIB2
 pakrkpU/x4ztNPD0w9dpR+9ehO51fNEZWPz3HlK80Z3b15XA1KaqD5O0pkAYMMAtqW/+
 ARqw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9LVaClb77/RUlfsOfi3y8X3azeeaEwa6UiKkuMmRDS7KrJrwp7hNjxuFBgnStMZ0f0QLixptsiHQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrVrpm1amWlv75Jw1CelzqWBcqN01/nSr1EO0qAioQg3wSyBVZ
 L+bSmVAT95nKs2XThaOKZB5BSYqmp7+Ztyl6DnjrNhyS2iAZePTyLpfeXeznSWuLd9QSIdCL2Av
 /9nV6Hxs9oB0VtzhwC5tCSp4M9848gMihyZXJcNWchy7eC6+HIPdrG+wrs6PdUQkKEZ7mZnT2I0
 qHkhgRmLKL
X-Gm-Gg: AfdE7clAaSAgai79OHkKqttNlQzc3NuZUcDuSLcCmHzrhLVddxR1Ue6Dn5s0oga2HLb
 HLABJQAfNQ4gWsRuk+t0IVelgPtaKiuZjZc2GydMpgFKmIZkd1Vf7kbxZfhE8BUEs22k2y9O2hh
 nsELlxCeDBXrKgLDfdjXO8j6usxb7LcueL3HZv7fFkXJE7O6VgVfqc/5BWnv5bmM4MBOCj3LoZi
 VGx05+klhagV0MRuhAot0Tw920fpfgteo/9t5BC5EZpUZs7B7qMM55ZjuVvzmaRMvX7EYzS5TZC
 tvFFF+rweuTEMCy1coKBE0QEytmhm6hLaTK2KLXchey394ry+my1ZiDt4r1hNrXXFN8gIxs3AOp
 vf2z6nH2AAB8fUxU4vQLyH+OLEUSxYFaAVZTyQtzULPPmAjkavMZnXnGoE9aOwWKP6klUB2veYw
 LEN81gDJI=
X-Received: by 2002:a05:6a00:21cd:b0:835:447b:a2ac with SMTP id
 d2e1a72fcca58-84591b23f6emr2544152b3a.5.1782204124205; 
 Tue, 23 Jun 2026 01:42:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:21cd:b0:835:447b:a2ac with SMTP id
 d2e1a72fcca58-84591b23f6emr2544117b3a.5.1782204123617; 
 Tue, 23 Jun 2026 01:42:03 -0700 (PDT)
Received: from localhost.localdomain ([103.155.100.6])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84564da30b5sm10828955b3a.25.2026.06.23.01.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2026 01:42:03 -0700 (PDT)
From: Aaron Ma <aaron.ma@canonical.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH] drm/i915/psr: Skip PSR exit for legacy cursor updates on LNL
Date: Tue, 23 Jun 2026 16:41:37 +0800
Message-ID: <20260623084137.3421894-1-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

ORIGIN_CURSOR_UPDATE falls through to _psr_flush_handle() on LNL
(DISPLAY_VER >= 20), which calls intel_psr_exit(). Cursor plane updated
via legacy ioctl (drmModeMoveCursor) does not dirty the primary
frontbuffer, no PSR2 state change is needed. Match the existing
ORIGIN_FLIP behavior by unconditionally returning early.

Before this, the psr2_sel_fetch_enabled guard only prevented the early
return when PSR2 selective fetch was active, sending cursor updates
through intel_psr_exit() and causing a black line artifact on some
panels during the exit/re-enable transition.

Fixes: ef39826c12b4 ("drm/i915/display: Fix glitches when moving cursor with PSR2 selective fetch enabled")
Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index e138982dc91f6..32bee6c03b754 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -3771,8 +3771,7 @@ void intel_psr_flush(struct intel_display *display,
 			goto unlock;
 
 		if (origin == ORIGIN_FLIP ||
-		    (origin == ORIGIN_CURSOR_UPDATE &&
-		     !intel_dp->psr.psr2_sel_fetch_enabled)) {
+		    origin == ORIGIN_CURSOR_UPDATE) {
 			tgl_dc3co_flush_locked(intel_dp, frontbuffer_bits, origin);
 			goto unlock;
 		}
-- 
2.43.0

