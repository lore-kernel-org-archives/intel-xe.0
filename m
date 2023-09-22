Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5548ACD4F49
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 11:17:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C0F10E658;
	Fri, 22 Sep 2023 11:17:33 +0000 (UTC)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF5110E652
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 11:17:28 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-503f39d3236so3347254e87.0
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 04:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695381446; x=1695986246; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ULR5qrOmAgrIGPKxWsIcdaWL88oCMPYQemdlag6sHy8=;
 b=gT9plqQhxbGPvby6Esgm8ZmoBMKtDzU8jUg2pyW4rCveMcyoYQ3w3DYuJztIS4uzDR
 gExdRpJ/CXGNUEGpXwTIA9wSwg5xlxnZ3albZ5UgISj1u5zr+DCI/iiO/P7ZhFa3NfgQ
 BL9EQtnCntUnoj39dZk27dNIQzzqDZ+KSvIRZzI6bkZQZ5NHnbEqZNGN7lIb3TiInUMT
 QSu4THt8Ofzvvfu4+fCQKafnystBdHbUwJ8xf+W6HX0m4hWim3BFY2HGVh7xz7LVkBBj
 IBQqa0SG976ZqLMSBIc6TZrTu2M38r7Ec4XQw47TFwcLdiG60bBRO4pDeqRtomxctGHw
 zsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695381446; x=1695986246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ULR5qrOmAgrIGPKxWsIcdaWL88oCMPYQemdlag6sHy8=;
 b=fG36tJJ3tZmttg+HzCjJR+EZcmNx8cdJsWJ+fdIuYl96WKdINkquwWVYfL8da48U1a
 UNph2/roNNW1T69xRPZ1f8lk1pXiO07uy+ztVFdj1P+loSJs/EujlRaq8pMmN71hrceb
 fORnm++vue1kOKVhiymwUNxd6gjCYmIUMkTKYLZ29AJXFzxhe2goIAAX8ws8lOwGfgA/
 z0qN0bXKbRJ7aB/Ymmb9gbPOE3cngWwVSz2CrOuL2xkZEG9Zc+3tl5ko3SRE0fED3x7H
 w2mYwGfwWYQdnOS6VI4iJtdWTl73ffO6G8CLsDcEI846ketDBvpyg7YqOtoX611DHCsE
 jzcA==
X-Gm-Message-State: AOJu0YytClelFuXq7ZbNDaGNOgyjx6QYrSBwhMsDSLVyMVkmlBj8iXIy
 O1X/zMpWSxw8Qx1EamHH0hpgSmx+eXlCRdPp
X-Google-Smtp-Source: AGHT+IHGbJlz+mvlKM5rmIMckLL9LhUjM3tDfcsi5jfyPIXB3RL7/K+HUHQn/V5GaE2W6BkGOzENKg==
X-Received: by 2002:a05:6512:606:b0:500:8c19:d8c6 with SMTP id
 b6-20020a056512060600b005008c19d8c6mr6996618lfe.58.1695381445687; 
 Fri, 22 Sep 2023 04:17:25 -0700 (PDT)
Received: from jheikkil-mobl1.. ([2001:998:22:0:1488:375a:eebd:d2f0])
 by smtp.gmail.com with ESMTPSA id
 r20-20020ac252b4000000b004fea1a2231dsm686502lfm.263.2023.09.22.04.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 04:17:25 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 22 Sep 2023 14:17:19 +0300
Message-Id: <20230922111721.302657-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922111721.302657-1-juhapekka.heikkila@gmail.com>
References: <20230922111721.302657-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/3] drm/xe/display: Add writing of remapped dpt
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

Xe need to use remapped display page table for tiled framebuffers
on anywhere else than DG2. Here add function to write such dpt

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 3422942a9951..b7b587c41690 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -40,6 +40,31 @@ write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_
 	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
 }
 
+static void
+write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
+		   u32 bo_ofs, u32 width, u32 height, u32 src_stride,
+		   u32 dst_stride)
+{
+	u32 column, row;
+
+	for (row = 0; row < height; row++) {
+		u32 src_idx = src_stride * row + bo_ofs;
+
+		for (column = 0; column < width; column++) {
+			iosys_map_wr(map, *dpt_ofs, u64,
+				     xe_ggtt_pte_encode(bo, src_idx * XE_PAGE_SIZE));
+			*dpt_ofs += 8;
+			src_idx ++;
+		}
+
+		/* The DE ignores the PTEs for the padding tiles */
+		*dpt_ofs += (dst_stride - width) * 8;
+	}
+
+	/* Align to next page */
+	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
+}
+
 static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
 			       const struct i915_gtt_view *view,
 			       struct i915_vma *vma)
-- 
2.25.1

