Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F81C55184
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 13:11:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E18ED10E6B6;
	Mon,  3 Aug 2026 13:11:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.srl header.i=@kernel.srl header.b="MZDZr3iP";
	dkim-atps=neutral
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99FF10E446
 for <intel-xe@lists.freedesktop.org>; Sun,  2 Aug 2026 17:07:02 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-49548e01d02so7006835e9.0
 for <intel-xe@lists.freedesktop.org>; Sun, 02 Aug 2026 10:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel.srl; s=google; t=1785690421; x=1786295221; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BRAy2nVyQPy4R9FHWUMzTGUQy8Oyu41Og5cXR0XYVss=;
 b=MZDZr3iPGjvriRzFaq1J42OFHTpqPDE699owHosylqzoEEfExish/+umtooucTo0hm
 neuvVZM/cwNeqJ/MkBynNEK/460ylRUN4jvENrVNj0b9hmtJmgDDjdx3QYCnrqg/5xzM
 HDZZVyffG3y4bKdl47Lvbgv4s3reLFwEJelWDJui2N+SvlJnLV121/gAWiI/6YHun4HA
 qMs2WnVkpTfu9XtkKPyMMLuNrT7LGXixhSrTdOt0qGQt66Ng+56pI5EfBu5TQMpJCD1q
 uiAXEETTFKHm2rMszUXZR+ETaGhwFl5b41oXD4xcz/7JcdpDZ+VjtRn5dL5f+RbkhSNj
 huHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785690421; x=1786295221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=BRAy2nVyQPy4R9FHWUMzTGUQy8Oyu41Og5cXR0XYVss=;
 b=oLE9KiivG2mTg77o88EC9HvLDexPj51JxRc1jpHsv1CCujJx9hHv1nMKXfpu0ucniE
 kC3BW3OBZj+OvLvidbS6daq3kBiCAsSeh09w939H65o6cezxfhsWx38o48yq8CgDvUMi
 IHq5368LCortCjCP8UD1b379Vo0drVOrv2prcjXqxUderAVsa+NgTbkhgYE9vbNhKihD
 Xb4+pScJJLdYfU9ab3CpuYO9EKDclNr9M6g6xS3oxuLgC8MelKH170E9eoAhyT1WmQpe
 3nqYsHnmjI0dDKJHT0vLZAz1LGmANfT+bwNEZrvlEsDWUIUJ1pQY3/JYwZvIstZD3vA0
 0zFg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp1OvDQJkIYs2JAUU/EJPA7TvLqLt6h0WS7rETUo2dUCv5lSgrlGArOb3iLwordjmhcwDfzEeSSBw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHm8rldKgbOD/3OhDKf9LVTsGJpMipdIKxBKLCDbvSqSQq20e9
 LdKKXk5PxAp14cbEc5xzoAyph8BMc0AiVOt9ho2B/aM/wrPFfZ0lZ7bMSpM6/urktt0=
X-Gm-Gg: AR+sD10L2SY5C87VsU7fl8KDXIpccf2WYmtN9zRK9KnJO+UoAf4V7G/MAgQS15GrEZ2
 ypS28ocQ+4pVJ/u7T5qoGdBOo4NKD5hNzeDBRtCa40+qOKVulngVb9gzvr7QnLXy628OVZUTkPF
 MuLrArkO9+OqNT23TgeMiq0HRR8VcurYlvoOQ5jzuNTFn1OsC2boL6cz0EZLHCsHB4Jb2SZSFm4
 pLmn2S+sops4cjuPxLj+J5hbJup8ZQbyT4LiSW+QRSdL+pVIaKccVAd6NQyEMHxfvUcLJYQWuEK
 6gm4RP5/hbt+RnbEfUOHHnBYn2x0qSsXwHtBOASS2fMjPbs2fhB6RcOG+w4dASm+jjiTorhcO5u
 1EcAT2AN8dl6dN/pzMvPhDwvlwSPCOcznMoxBfRUaS6JV5EYGCM6jLXr5K+0XUIqRk/ZLX73gAD
 znDU1scW5wgBTkhtJT7bJ5Zr2asm5XxGbmjvhUn8aIWAw5vR3JjHv2xgboWSn+4i3T+Tt4FCnWi
 jm8u61xnJ5W1VcCeuCdiZdJxO2YPSNC62MYeU8FWRXtXD/XerrkuJyZes9YrPj0UuO8UJaTcOVI
 gzVS2VebSXjMiSpiWTOdaQfCl75qGCZAwL/G5+2J0EcsmCTxnb7CKyiASZX5So50y1Om44mfUWM
 +gB6+bDMNg2OOj/lufRtdFFOQUyMKWLOds2T7tmfK4Y6rwfCzTA==
X-Received: by 2002:a05:600c:8715:b0:498:273:327a with SMTP id
 5b1f17b1804b1-4980c66b5d5mr160221615e9.7.1785690421108; 
 Sun, 02 Aug 2026 10:07:01 -0700 (PDT)
Received: from KITT.minareto (host-95-230-187-130.business.telecomitalia.it.
 [95.230.187.130]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49807b6745csm161687225e9.7.2026.08.02.10.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2026 10:07:00 -0700 (PDT)
From: Cristian La Spina <cristian.laspina@kernel.srl>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Cristian La Spina <cristian.laspina@kernel.srl>
Subject: [PATCH 2/2] drm/i915/display: accept a luminance range from any source
Date: Sun,  2 Aug 2026 19:06:47 +0200
Message-ID: <20260802170647.206880-3-cristian.laspina@kernel.srl>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260802170647.206880-1-cristian.laspina@kernel.srl>
References: <20260802170647.206880-1-cristian.laspina@kernel.srl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 03 Aug 2026 13:11:38 +0000
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

intel_dp_aux_supports_hdr_backlight() refuses the Intel proprietary eDP
backlight interface unless the panel carries CTA HDR static metadata.
What the interface actually needs is the luminance range, and
intel_dp_aux_hdr_setup_backlight() already reads that from
display_info.luminance_range, which the DRM core now also fills in from
the DisplayID 2.0 Display Parameters block.

Accept a panel whose range came from there too. Panels carrying the CTA
metadata are unaffected, including those that provide the metadata block
without the optional luminance bytes and so still land on the hardcoded
512 nits fallback.

On the Lenovo Yoga 9 2-in-1 14IPH11 this replaces a backlight that does
not respond at all, because the PWM fallback drives nothing on an OLED
panel, with working brightness over the 4-500 nits range the panel
declares.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Cristian La Spina <cristian.laspina@kernel.srl>
---
 .../drm/i915/display/intel_dp_aux_backlight.c   | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 7a6c07f6a..8ac47ed18 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -136,19 +136,18 @@ intel_dp_aux_supports_hdr_backlight(struct intel_connector *connector)
 		return false;
 
 	/*
-	 * If we don't have HDR static metadata there is no way to
-	 * runtime detect used range for nits based control. For now
-	 * do not use Intel proprietary eDP backlight control if we
-	 * don't have this data in panel EDID. In case we find panel
-	 * which supports only nits based control, but doesn't provide
-	 * HDR static metadata we need to start maintaining table of
-	 * ranges for such panels.
+	 * Nits based control needs to know the panel's luminance range. The
+	 * DRM core fills it in from CTA HDR static metadata, or from the
+	 * DisplayID 2.0 Display Parameters block for the panels that publish
+	 * it only there. With neither there is no way to detect the range at
+	 * runtime, so do not use the Intel proprietary eDP backlight control.
 	 */
 	if (display->params.enable_dpcd_backlight != INTEL_DP_AUX_BACKLIGHT_FORCE_INTEL &&
 	    !(connector->base.display_info.hdr_sink_metadata.hdmi_type1.metadata_type &
-	      BIT(HDMI_STATIC_METADATA_TYPE1))) {
+	      BIT(HDMI_STATIC_METADATA_TYPE1)) &&
+	    !connector->base.display_info.luminance_range.max_luminance) {
 		drm_info(display->drm,
-			 "[CONNECTOR:%d:%s] Panel is missing HDR static metadata. Possible support for Intel HDR backlight interface is not used. If your backlight controls don't work try booting with i915.enable_dpcd_backlight=%d.\n",
+			 "[CONNECTOR:%d:%s] Panel is missing its luminance range. Possible support for Intel HDR backlight interface is not used. If your backlight controls don't work try booting with i915.enable_dpcd_backlight=%d.\n",
 			 connector->base.base.id, connector->base.name,
 			 INTEL_DP_AUX_BACKLIGHT_FORCE_INTEL);
 		return false;
-- 
2.52.0

