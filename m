Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0D2CD4F5B
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 11:17:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5809E10E65A;
	Fri, 22 Sep 2023 11:17:33 +0000 (UTC)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4581C10E655
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 11:17:29 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2c123eed8b2so34211891fa.0
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 04:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695381447; x=1695986247; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SXLq24pO0YEeB+Qty+M9X6/PIVLmXYRUYZl8VQ1VCGQ=;
 b=NmbvKEQ3QkuFnPJah6KXPJOdjjGrsxt6HYREaJiszpNsqbYdOHzSW/7n6eNL0GNmIa
 ySIEdGaxa38cK9SIF/seTBVFobj3HrgG5rvOsuiOvVAIX8PYfSvItTjt8J/M4qxAJZtc
 FJM4KCkIn3G2hr9zXwUPNs4fy1PjYz4uFYNVbCGzhe8RpL+aZNhmpquh7BhkAx1FMg3+
 2HRAvWez0wyyrGHbTVAQPhC1xMxzymttKor1WUTAzMPFHvKO1OF8TJsC9/OIuZzjQqLi
 PQjRSbqxDS7fx2CeS63vMPO4uF28H+44WRWogA4wdDdimBVvZCoLPGcI+WENY7YD6t88
 TtqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695381447; x=1695986247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SXLq24pO0YEeB+Qty+M9X6/PIVLmXYRUYZl8VQ1VCGQ=;
 b=jdIjX0oYVKplCjs2ipMyMrZyhXzqbiPrSS8sVrfD2a7+shQ3cOpm4T1RPlL0QGMuP1
 nB+1jtBUmaBte3ydAl717XX0CfqAnQJ/oq5QzmytCl3QoyyQj2ZVt75XJZZB+gSArFV9
 NXpJZPkfbwg5XG3joZGRsrbh+KQ2eY+zDSBOTSi7AF6rORKPAWecE42I0OG/l+tC5RLw
 33t6sIbiFZCS0W+M3az8cywhndzHtlvkCpt7iXyu56+2X/5iqQnLluFFOiDivXQE+RnF
 mToVxy/8zALuFozanxSLEG5bCa+Ry1Ykj+KmWhmD0+oOhjPzHsnqGiezWIZ/LjYCZsY/
 VyLQ==
X-Gm-Message-State: AOJu0YxOTt/93YNPs8wNpxKsAoUEdTDMfG1OCPriyertTkt4wTdh/ds6
 Crsc2Rmec1o9INqoHTjHEWcB970PwmdChPHG
X-Google-Smtp-Source: AGHT+IGZaZu7T3bG/TQjk+XujUFJbWEBZUD7+ioDT1CEiQoJVqaBkEPLBWOJdmgtw1GuSvCc9gN9WQ==
X-Received: by 2002:ac2:58e3:0:b0:500:9f7b:e6a4 with SMTP id
 v3-20020ac258e3000000b005009f7be6a4mr6637726lfo.32.1695381446485; 
 Fri, 22 Sep 2023 04:17:26 -0700 (PDT)
Received: from jheikkil-mobl1.. ([2001:998:22:0:1488:375a:eebd:d2f0])
 by smtp.gmail.com with ESMTPSA id
 r20-20020ac252b4000000b004fea1a2231dsm686502lfm.263.2023.09.22.04.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 04:17:25 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 22 Sep 2023 14:17:20 +0300
Message-Id: <20230922111721.302657-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922111721.302657-1-juhapekka.heikkila@gmail.com>
References: <20230922111721.302657-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] drm/xe/display: Enable remapped display page
 tables
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

Enable usage of remapped display page tables where needed.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index b7b587c41690..66b1a25cad53 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -76,6 +76,9 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
 
 	if (view->type == I915_GTT_VIEW_NORMAL)
 		dpt_size = ALIGN(size / XE_PAGE_SIZE * 8, XE_PAGE_SIZE);
+	else if  (view->type == I915_GTT_VIEW_REMAPPED)
+		dpt_size = ALIGN(intel_remapped_info_size(&fb->remapped_view.gtt.remapped) * 8,
+				 XE_PAGE_SIZE);
 	else
 		/* display uses 4K tiles instead of bytes here, convert to entries.. */
 		dpt_size = ALIGN(intel_rotation_info_size(&view->rotated) * 8,
@@ -104,6 +107,18 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
 		for (x = 0; x < size / XE_PAGE_SIZE; x++)
 			iosys_map_wr(&dpt->vmap, x * 8, u64,
 				     xe_ggtt_pte_encode(bo, x * XE_PAGE_SIZE));
+	} if (view->type == I915_GTT_VIEW_REMAPPED) {
+		const struct intel_remapped_info *remap_info = &view->remapped;
+		u32 i, dpt_ofs = 0;
+
+		for (i = 0; i < ARRAY_SIZE(remap_info->plane); i++)
+			write_dpt_remapped(bo, &dpt->vmap, &dpt_ofs,
+					   remap_info->plane[i].offset,
+					   remap_info->plane[i].width,
+					   remap_info->plane[i].height,
+					   remap_info->plane[i].src_stride,
+					   remap_info->plane[i].dst_stride);
+
 	} else {
 		const struct intel_rotation_info *rot_info = &view->rotated;
 		u32 i, dpt_ofs = 0;
@@ -220,12 +235,6 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
 	if (!vma)
 		return ERR_PTR(-ENODEV);
 
-	/* Remapped view is only required on ADL-P, which xe doesn't support. */
-	if (XE_WARN_ON(view->type == I915_GTT_VIEW_REMAPPED)) {
-		ret = -ENODEV;
-		goto err;
-	}
-
 	if (IS_DGFX(to_xe_device(bo->ttm.base.dev)) &&
 	    intel_fb_rc_ccs_cc_plane(&fb->base) >= 0 &&
 	    !(bo->flags & XE_BO_NEEDS_CPU_ACCESS)) {
-- 
2.25.1

