Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC2DCD6E5D
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jun 2026 20:57:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2B5113B30;
	Tue,  2 Jun 2026 20:57:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="nANA/alb";
	dkim-atps=neutral
Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com
 [74.125.82.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF9F113B30
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jun 2026 20:57:56 +0000 (UTC)
Received: by mail-dy1-f202.google.com with SMTP id
 5a478bee46e88-304df51ff3eso5925740eec.0
 for <intel-xe@lists.freedesktop.org>; Tue, 02 Jun 2026 13:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1780433875; x=1781038675;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=zJgTgRqQx2xuDhvFZl206Hrb1eedIpbxJ2h+oNVKZZw=;
 b=nANA/albtkDZvYrcY3cE5TF9AEz/UZKJZ5FkUXfMZ6b9c5lkTDKMYz5LrPkD1KIC26
 OyljiD2nXOM6hQJIfWX5IVW6xfdbp58AajdfHHMVFvV1fVdeqF62AE8NOI2EAopxJyXi
 0bK53u634U3HOUMERQoZVpoPoZBLD6levVcUor5sDjGr+HqJ/Mq39wE2emJfVjZIf9iV
 poqBVUJ60UH+XVvD9js2Qj75nwyNS7nXXN2cGanSVdfQfSdaWpNwBjSVL+loWCYjlcvF
 altV97M/sMsC+0PbK/4XHLx0IbiGaMYDPxPIuEkjVzg+UrBoj36jTMEKtzCeUaAOzHhh
 6Kxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780433875; x=1781038675;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zJgTgRqQx2xuDhvFZl206Hrb1eedIpbxJ2h+oNVKZZw=;
 b=DCfzAqBnut2jNd6/kzG0+CHjj/dZ9HLQhQVNk7xhhAtholQJqRKXV2pGvj8kpkGd9S
 iwU/etqQ3U70QP2wrZTz1ERr1QAffjTg6Z5szZv94JFck4cw8vB2+ka3A3Fx67CPi0+r
 r9Nz7RE7LxU7truZPmsbuRmuL6al3rYPzRmfM5NAEI6w8ONkpp6M86T3q8BX4+Kaviv4
 ZKjKA+kpDTZcfLWFiM1bGTXxx01U1wesIqHmujMq55TJDpykezeOBH4aL2BkI4Fu4pGd
 dgyODXjSw6/h7aln2J1k1y3O1IdE8IG2wtiEu7pxyhWeBQBfGmQAsf4h8l6t+BsT68PV
 zj6g==
X-Forwarded-Encrypted: i=1;
 AFNElJ8heXLAx3lyHxx1/PVxx7JOw6LIdtBLybdS59xT9p4WY+Tlu7uMlaJ4/KWIT0P2wtkaU0I6Oe/ckA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVL350QDnIY0Eud1KU6sr4h//F9s2a8BF1/L77Ptf+gTiv74C0
 4fCcHDqfY2caxeaZGioXFTT3oVPTaL8r2QruiG6P2vfpOQVWtSbaUumIwaR5TrvVut3U+U/H/lT
 OzAzTgBHG/FCn9g==
X-Received: from dlah13.prod.google.com ([2002:a05:701b:260d:b0:132:8d92:4d68])
 (user=jdsultan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7023:b8c:b0:130:c9cc:3395 with SMTP id
 a92af1059eb24-137f6bcccc1mr138726c88.29.1780433875119; 
 Tue, 02 Jun 2026 13:57:55 -0700 (PDT)
Date: Tue,  2 Jun 2026 13:54:02 -0700
In-Reply-To: <20260601212613.3682640-1-jdsultan@google.com>
Mime-Version: 1.0
References: <20260601212613.3682640-1-jdsultan@google.com>
X-Mailer: git-send-email 2.54.0.1013.g208068f2d8-goog
Message-ID: <20260602205422.1792007-1-jdsultan@google.com>
Subject: [PATCH v3] drm/i915/dp: Handle VSC SDP revision 7 in unpack
From: Juasheem Sultan <jdsultan@google.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Chaitanya Borah <chaitanya.kumar.borah@intel.com>,
 Gil Dekel <gildekel@google.com>, Juasheem Sultan <jdsultan@google.com>
Content-Type: text/plain; charset="UTF-8"
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

VSC SDP revision 7 (Panel Replay + Pixel Encoding/Colorimetry Format)
unpacking is missing in intel_dp_vsc_sdp_unpack(). This causes pipe
state mismatches during state readout because the VSC SDP state is not
properly recovered when Panel Replay is active with colorimetry.

Add the missing case for revision 7 to intel_dp_vsc_sdp_unpack()
so that the state is correctly recovered.

v2: Rebase onto latest upstream
v3: Fix git commit description

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Chaitanya Borah <chaitanya.kumar.borah@intel.com>
Cc: Gil Dekel <gildekel@google.com>
Signed-off-by: Juasheem Sultan <jdsultan@google.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 6ef2a0043cda..b8746dab051c 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5343,11 +5343,15 @@ static int intel_dp_vsc_sdp_unpack(struct drm_dp_vsc_sdp *vsc,
 		 *   VSC SDP supporting 3D stereo + Panel Replay.
 		 */
 		return 0;
-	} else if (sdp->sdp_header.HB2 == 0x5 && sdp->sdp_header.HB3 == 0x13) {
+	} else if ((sdp->sdp_header.HB2 == 0x5 || sdp->sdp_header.HB2 == 0x7) &&
+			sdp->sdp_header.HB3 == 0x13) {
 		/*
 		 * - HB2 = 0x5, HB3 = 0x13
 		 *   VSC SDP supporting 3D stereo + PSR2 + Pixel Encoding/Colorimetry
 		 *   Format.
+		 * - HB2 = 0x7, HB3 = 0x13
+		 *   VSC SDP supporting 3D stereo + Panel Replay + Pixel Encoding/Colorimetry
+		 *   Format.
 		 */
 		vsc->pixelformat = (sdp->db[16] >> 4) & 0xf;
 		vsc->colorimetry = sdp->db[16] & 0xf;
-- 
2.54.0.1013.g208068f2d8-goog

