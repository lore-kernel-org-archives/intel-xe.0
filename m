Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCBBE81DFF
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 13:45:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8776F10E4FF;
	Fri,  6 Oct 2023 13:45:56 +0000 (UTC)
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B3B10E4EE
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 13:45:48 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2bffa8578feso26234161fa.2
 for <intel-xe@lists.freedesktop.org>; Fri, 06 Oct 2023 06:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696599946; x=1697204746; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NM3iKvNC1h3X6u33xWf/VMilWQ+Q58bVQ+XXb0+JoQY=;
 b=LKq6zDpUM2mDdiWsTZPROy120drNNxPZVCeSk3ZA0qZAeIeJ0zELYlACN2oIOfPuDd
 0M30VgrTWJwZC7OQr6nES1tyiaRmjWAL+FQ7SrxviYUDlGmnzvKarfb/zeeNwb/Q0KSI
 TRhBPAC7Cs3MKEaYn5WD+qAvrkcon0hAr+SbZOR7bjdwn0nJzNpXCfwpi2TJwqQzYZ35
 iDLwzAqRU3nIurEzQnmJ+dMcOjrdPr9sOJJSwNRo6aGfnrys1iWAH6WudeqKcuNmQbns
 3nPWi8xnxtJ+JJyUbALskNCLjKaKdMHO4Dl+qS+fZwMWYLexQgu2e9QvijXQdz6GXK0d
 bB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696599946; x=1697204746;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NM3iKvNC1h3X6u33xWf/VMilWQ+Q58bVQ+XXb0+JoQY=;
 b=Y6XZZrvWnBKntlhA0vjh2irzA1AKl7uVv13INdW7IunIADUi+/HkYs1T6xaEEPuxmP
 YmBJ+nCOuivq8vy+k3p99T6jfdm3UOPsR/LJQONsC1F7RHTB/gfgNKMXGIBLkMaLLx8d
 6PPkwQvv0g/F8u/aqhPX5kGlCQKL12Rdr2g/laZfq696DTZ2nksa8xZVZZhWj6fWBY51
 U1Mv/qo2g0kmWcgQX4aintQywY28KZuD+OnMyU5o6gLulgEYpybL35c1Yy/KiodAYVX2
 0U2fuUcOgSMONfiHBCXD5lFzBjyNLA0jR80Ws7LH2wvFusHtgUTzd40IMf9YiCmXnRvT
 X3+w==
X-Gm-Message-State: AOJu0YyA330HuyhFyYmEx0RhSTUSAIjbvqW5TVikwu3T7RfuYEinrmjY
 uhWAVVByaW9WTdz0ZDgp+IMKSkZpS0CTcw==
X-Google-Smtp-Source: AGHT+IFtsWnS0pjS/ycG6K+LKJCWCGmAdaf7iZwcbOMOLoK2nKFqZzgFThHEu+t9f3Khpn+HYcdxaA==
X-Received: by 2002:a2e:8241:0:b0:2bc:f5a0:cc25 with SMTP id
 j1-20020a2e8241000000b002bcf5a0cc25mr7437273ljh.2.1696599945850; 
 Fri, 06 Oct 2023 06:45:45 -0700 (PDT)
Received: from jheikkil-mobl1.. ([2001:998:22:0:a61b:a4af:7772:362f])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a2e3505000000b002bcbae4c21fsm794576ljz.50.2023.10.06.06.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 06:45:45 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  6 Oct 2023 16:45:38 +0300
Message-Id: <20231006134540.332716-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231006134540.332716-1-juhapekka.heikkila@gmail.com>
References: <20231006134540.332716-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 1/3] drm/xe/display: Add writing of remapped
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
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 31 ++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index b7a04fba3585..8a1cb6c28eb0 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -45,6 +45,37 @@ write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_
 	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
 }
 
+static void
+write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
+		   u32 bo_ofs, u32 width, u32 height, u32 src_stride,
+		   u32 dst_stride)
+{
+	struct xe_device *xe = xe_bo_device(bo);
+	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
+	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset,
+			     enum xe_cache_level cache) = ggtt->pt_ops->pte_encode_bo;
+	u32 column, row;
+
+	for (row = 0; row < height; row++) {
+		u32 src_idx = src_stride * row + bo_ofs;
+
+		for (column = 0; column < width; column++) {
+			iosys_map_wr(map, *dpt_ofs, u64,
+				     pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
+				     XE_CACHE_WB));
+
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

