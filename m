Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B406B606A332
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 14:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mgkuo664
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 705CD10F23F;
	Mon, 16 Nov 2026 14:38:09 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8BA10E664
 for <intel-xe@lists.freedesktop.org>; Sat, 14 Nov 2026 01:44:00 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-c45551fa84eso388391866b.3
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 17:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794620638; x=1795225438; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0Pz+qENIdDsgTiQZzFFYd3dQorXrNLOkeSm/a1z1K+E=;
 b=Mgkuo664Kc+3FoLbPLfohgPkMkYSwge8DcAzrSxtpUw3aG4PAkt7zZdUAPr1OchCvI
 F5ps4O14wr6hmecGyGD+5tQPKHId2pmrruSfIGmyjZD5EbNV2zVtGfQvzSTmbGwWI/Un
 PgtnXnU/8YtfZoKVg0ZPpgFqyX+eckaI/UEc7qe6RGBKGfaUbpr6gXk7wOAUwxtkqCAv
 mceKMX4jGNq6b0y/MWhBbVsnNZoYoqnAfmrc0MkLEWkaokaVdv2bIyuZyJTEs//xdWOs
 vD3MK20+OhflObUxL3h7hxIPbHAFo66KyaEYUqwGiRTX+k9hx3np2up2lOPSdtXbtqeF
 lkdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794620638; x=1795225438;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=0Pz+qENIdDsgTiQZzFFYd3dQorXrNLOkeSm/a1z1K+E=;
 b=WJTL80l03RdBZKA396knQmB9UXoyYt35w6HTNGGpz4FtKRPvGgukRI7BB9u7c1h6yJ
 HSlXN+dwF/ED0PBbcUiPopv1AhVRkYIxyEi5whdq82na3Kcb2NHjLwRN/egmTLqE+wjc
 J4hnSO4N+tpkhqKca14JfdHQY7ijRe7hou3mp6vnR2t0/g1d+Ha2OJAeiUWYsj0GUvns
 PXFK3Zy3XO+niBTZQNzdi8EG1Q2utDxgFSKVSCM4Mkc8pGi187zaX/Bf4OsNiNPY8744
 phwDKFErqYTMmQ2x8Knx858ONTRFZN6zuBlDigTdOZgr+7td3PgPiTSrBYp2U/5fq5GS
 d00g==
X-Forwarded-Encrypted: i=1;
 AL+hErHzbssJ/luNKQvfqzsCxP411BvjOuv71vEzQnZ4hR904/huZLed7VmysJxTdwvmzZ9OI3cSeiFqWQ==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+blDz0Ea+glRWXZJN1c5ojIIwSB48BxuyR4VnnGAKBnbMzBrb3
 ZkZjovt9WSyjRIviwEHVsHc4MxQNLRbAV7GqaL8KiV9aRTV7Rn56Vek7/X210RSH9L4=
X-Gm-Gg: AYBFou1lxZVtufxD53RlBW3QNfZXoEeD8kQwYvSgSHAhpGgBFPfIwdX/GQUkzIoLvCT
 cBNosAF/NSOIZTiYc5b4vJArLupDmJ9D0hwzNKCNpviFA9QMgn0Hk18UGxZd+REkpIpaQxuYOTF
 +VZ5WJwmOnOx3muZQohsKSUgXSSLjCq7hUcHGIm1F6o9Sk7xVnbDaPOHc49IGSrCkAciZzBgnuw
 t2Q5EwrvVVGJAjYsxLnaB8p7KmprHA7HPQ0cR39nBoRmCQ2nvQIiukosrIH03tYaXcsrtk834BU
 KsF+t4/ONLoXxatirNj1LEunVxUOcSZ83qw7tDZRQ5Ket9caDddQ3I/FucfxwdhBG2hUo70oNx4
 dAdTVnpULnhfqMcK6Tj/0aU+cQsFEloR4tyyUaPpWyv34ZXVlRBZfYhey6AmIRZelj48mLCB4hT
 4FCaK3RKjWOnfwAKXYy2BO8sMCxD0HncPtmvo1HDqC70lclWNFSz2eLNiZPOkTbbUSme1ywXnOJ
 o/y2p+n+WkeVRBBbdtOwbV9YG5U/tTnMxiNLLPpbVbp5J8LCzOfCtQCF24Di1yrr6o9grlOVPMj
 /wcSXA5udaIUYjFYkPCPCzMFlmrx0ssOYS+wnbA31MSHmESI4eR1Z3RtitztDkVmH1S56rJVbpX
 LckMgQL+PVRrIbpswYB+mKQM=
X-Received: by 2002:a17:907:7b85:b0:c46:a72:e0c3 with SMTP id
 a640c23a62f3a-c5096398905mr356309566b.16.1794620638353; 
 Fri, 13 Nov 2026 17:43:58 -0800 (PST)
Received: from SMOK.angora-ide.ts.net
 (mm-156-219-126-178.vitebsk.dynamic.pppoe.byfly.by. [178.126.219.156])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c5095b5a4c1sm161402666b.48.2026.11.13.17.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 17:43:58 -0800 (PST)
From: ElXreno <elxreno@gmail.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 ville.syrjala@linux.intel.com, ankit.k.nautiyal@intel.com,
 mitulkumar.ajitkumar.golani@intel.com, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ElXreno <elxreno@gmail.com>
Subject: [PATCH 2/7] drm/i915/vrr: Fix the pixel clock overflow in the vmax
 computation
Date: Sat, 14 Nov 2026 04:43:30 +0300
Message-ID: <20261114014335.2132756-3-elxreno@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261114014335.2132756-1-elxreno@gmail.com>
References: <20261114014335.2132756-1-elxreno@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 16 Nov 2026 14:37:53 +0000
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

intel_vrr_compute_vmax() multiplies crtc_clock, which is in kHz, by
1000 in a signed int. A 3840x2400@240 timing has a 2342.4 MHz pixel
clock, so the product overflows, the quotient turns negative and vmax
is clamped to crtc_vtotal. vmin then equals vmax and VRR is never
enabled for the mode, although it is within the range of the panel.

Do the multiplication in 64 bits.

No Fixes tag: intel_vrr_compute_vmax() is only called for a mode
within the VRR range, such a pixel clock needs the joiner, and
intel_vrr_compute_config() takes joined modes out of the range so
far.

Signed-off-by: ElXreno <elxreno@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index e59345bd1d33..a5a5d11380a4 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -416,8 +416,8 @@ int intel_vrr_compute_vmax(struct intel_connector *connector,
 	const struct drm_display_info *info = &connector->base.display_info;
 	int vmax;
 
-	vmax = adjusted_mode->crtc_clock * 1000 /
-		(adjusted_mode->crtc_htotal * info->monitor_range.min_vfreq);
+	vmax = div_u64(mul_u32_u32(adjusted_mode->crtc_clock, 1000),
+		       adjusted_mode->crtc_htotal * info->monitor_range.min_vfreq);
 	vmax = max_t(int, vmax, adjusted_mode->crtc_vtotal);
 
 	return vmax;
-- 
2.56.0

