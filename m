Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26359E92726
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 18:34:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E032B10E484;
	Thu,  5 Oct 2023 18:34:12 +0000 (UTC)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB61410E480
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 18:34:09 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-505748580ceso1633175e87.3
 for <intel-xe@lists.freedesktop.org>; Thu, 05 Oct 2023 11:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696530848; x=1697135648; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NM3iKvNC1h3X6u33xWf/VMilWQ+Q58bVQ+XXb0+JoQY=;
 b=PYyPRdRTrzhrrNrIK2cK5vMzfJgtFEnozZ3a4Nw+nBe86gQDA+vITbs5CJNaRnZdUW
 3v+NA/2VU53/m5bH5lk3BryF/f6I5tX5jGjw98egmlu+GoSSfRYmjb/T8lTe28ZM6Jdd
 3PsPmWVkGXExt7yCHapsau8Qkzx03a3ODDdIeDa17FxOuTKI/hxg6PIiG+xRGN4PhQFy
 8N1bzI4A6/dZTpKCIN2wMI2xi7A8u7nTE8N8wyw1//o+sWsyXcqL1zpBhCW1ljUA1vCL
 DoZrGY7dVzrBxApGkiwQ3wR8BpsxCt+yBSULmvEBGSUz4R+wukKFwiXZ1wASiIydpYSE
 9P1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696530848; x=1697135648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NM3iKvNC1h3X6u33xWf/VMilWQ+Q58bVQ+XXb0+JoQY=;
 b=ANnYKKGuHF5FpQKK0xcgBnciBqMPCQwd6u5mMsU23FS5tAvEHoz4uxT7/XWgKp824h
 Gd7296RO/zeTlLEsDX3y/4jFSbL7YnqXD4ZwDiGClhTTrG2XvMOrxKDxhBTVO3ZLlF1X
 Br428jGNsvQoNSvPrwrZn7vo6FZA7JypQSST6jwgrljC0xw+SUBeN2JyjMuPpR2IXd4p
 c+vAnA22z+NvEvd3XwX6CEIRvI6Mz0U8aGLGHJT8AZ+gTa5zdjw0PrbvKREae4Vw5IGy
 bDHXxwEAkQUanGQAgVD6UwvOQ3ilxV7EZOpv2TSj4f5p8eTOe8isxUyNxe4pC/3FhBYe
 SJIQ==
X-Gm-Message-State: AOJu0YwfjYZIOKwAEaLAi4KG7AzjyLqOSjijuahH+coNjD3nwUKsDkBt
 GdiKgyYVfaYvVznwC9/SZhsHuQe/9r4omr5X
X-Google-Smtp-Source: AGHT+IFFFVyCDqkTZqo3kqsaStMvQtfB820T4TKAnKa6san4COa/oQLF9d1ko+CwL/OUOCDp8SMEtA==
X-Received: by 2002:a19:791c:0:b0:503:314f:affe with SMTP id
 u28-20020a19791c000000b00503314faffemr4889462lfc.17.1696530847511; 
 Thu, 05 Oct 2023 11:34:07 -0700 (PDT)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 k14-20020ac2456e000000b004fe0ab60530sm393967lfm.49.2023.10.05.11.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 11:34:07 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  5 Oct 2023 21:34:02 +0300
Message-Id: <20231005183404.324835-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231005183404.324835-1-juhapekka.heikkila@gmail.com>
References: <20231005183404.324835-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 1/3] drm/xe/display: Add writing of remapped
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

