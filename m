Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDEBC04AAB
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 11:51:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9138A10E65E;
	Fri, 22 Sep 2023 11:51:41 +0000 (UTC)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E20D10E65B
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 11:51:31 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5043120ffbcso2474261e87.2
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 04:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695383489; x=1695988289; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KRDgWsNUHFkjq7tT8CRIKUn5C9J0DoHXcTZsqyekmRY=;
 b=Ss+7ibbv68atjikeBu7l1RBs2GR2CmhV4nAWTj6hbX9fLSndvG/rRPYh2OMFsIf4Bg
 Ix+Zx252wwtA+Puv84LU5FaQ6Y6NqvYZGM6dpI2DGq5QocoMdFhGvEJrk1myTTN1TS3n
 QpX3M8v7DQri1qVqY5pcXWdbskzurICSNXSU2MwTGr5qPZ8rqQycE64PJxqJTFg6bLoB
 ujUpgxrIJDBagZF+uC+KBVZBVh9aLp+RmD80g7wCfdY2CMYZTtKnuNhky3HhlML0GWss
 zpqAn+lXFgVCtHO/s7WPxtOsczaohWQvnqcFsYYwskm98PlyE19EN8C8uVZ7hw9oJsA5
 50vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695383489; x=1695988289;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KRDgWsNUHFkjq7tT8CRIKUn5C9J0DoHXcTZsqyekmRY=;
 b=SU5B71j/cvfLVJoYpBLEck3UROLfKTxZRRvqJ5KU9wQTYWHWgGwzTSQom3n6acT5gI
 Nge176VQfQkg6YqVt9SG4xW2VP8bxU6qgSC3vygf/rlCaIgukCsqlM6KGMMSSokDZqNi
 hlp6cOVHh0YPXmp8tAgWdxTsBv6iJUR2g7LMfL7b4r6fpHGANsyf4bvtIU1S5vd6OZhC
 tcjFEDy7aQbtWb337FS0iLVKKM7TMkNde6SdJTkPZla8Jfebk6PDHz3Hdr+6HRknUmd0
 nuBfkhIko57xfvYBbAcwjWN4UpyYEvpY+8ANTDpWdUWEgYPye5zc7+TFPkgab1p+qm+z
 HT3A==
X-Gm-Message-State: AOJu0YwP4xZHBLxAxA9pFOiqTBbx+Y9Zc6CrhP8X8lrRudAf7K5nxkYi
 btAUAzw+jDeBNyXGf5fyPI8JF8oUdlJWd+wk
X-Google-Smtp-Source: AGHT+IHQyBnjf0+kT+8czEjf470hqdBP1iIy6zsTPot1yjTG8OjtaGJfnESeqMKYKsCbHuCGDFHblw==
X-Received: by 2002:a05:6512:758:b0:4fb:91c5:fd38 with SMTP id
 c24-20020a056512075800b004fb91c5fd38mr6400445lfs.0.1695383488623; 
 Fri, 22 Sep 2023 04:51:28 -0700 (PDT)
Received: from jheikkil-mobl1.. ([2001:998:22:0:a3c1:45a8:51d0:6c6a])
 by smtp.gmail.com with ESMTPSA id
 m7-20020a195207000000b005009d5aaaedsm700508lfb.172.2023.09.22.04.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 04:51:28 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 22 Sep 2023 14:51:20 +0300
Message-Id: <20230922115122.305107-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922115122.305107-1-juhapekka.heikkila@gmail.com>
References: <20230922115122.305107-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/3] drm/xe/display: Add writing of remapped
 dpt
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
index 3422942a9951..b64670a35588 100644
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
+			src_idx++;
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

