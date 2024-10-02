Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD603CF31B4
	for <intel-xe@archiver.kernel.org>; Wed,  2 Oct 2024 11:44:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A98810E33B;
	Wed,  2 Oct 2024 11:44:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KHzgiEME";
	dkim-atps=neutral
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66DE410E33B
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Oct 2024 11:44:24 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-20b7a4336easo24547945ad.3
 for <intel-xe@lists.freedesktop.org>; Wed, 02 Oct 2024 04:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727869464; x=1728474264; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZK68v8EHoh43PWgrdifdWee0z8C1rUHw/9s77xZjh8U=;
 b=KHzgiEMEC9Y2Qu00H7MS6kXl9hIFilsAQQTxCe/S2My6vveGDjBo/5nuqnSje7nNs1
 CRa4TL444XdqQAmMX7puPh6SM8MchuE8K8YC6T0ovL/dIsnJvjNV0W0ifMIIlW7PW2OV
 qCrW8cQ7aMfiKGovSBK0f8LEP8DhRH+n20f4Jwl1OZCsjPhYfoj6bRTJ0kka55hKFr+0
 UajHt2TVLyr0/brWtLKn4vcCk9+T28Uxrgkv6QyaovQqUYzAjw97o6c87QXBgm3bEs4k
 uB3J0fupKamQ57gBv7KQ7H9StC1ME5bIxS28mU7DU/+8hMZwsgrRlHEiCfy0pDin+MOC
 Gh1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727869464; x=1728474264;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZK68v8EHoh43PWgrdifdWee0z8C1rUHw/9s77xZjh8U=;
 b=AI6wQsXRZnB36lmHoG6Kb4iTus2A/zjF+joCDoSBhii+AhwSEVopKMOWX8/KvD4vEK
 20efTwJPGFPXolRa6i4duZAJU9jjuLNrpKxzbby3XhqyZbZTUmdANBDiOQFZQGf1o2l/
 E3xQU6GjR4leFekk5r2S6DyS38Fsvc3OONcDI+zxC7JK3QtNq0YZ7Rely1x0D360TRyx
 uPrsdXgs0jKTCsqb2l+xLPoDpUABq3MmGHIdtYm0/bKmfaZDO0XNLovQScSnHqISYKs9
 AAeo1FtRmd8l5fzUP64DVzU8odaLmIBOitzJjGdrGLCwhWJ0Udl2yxCOYJU1nsH5HgVp
 lwlg==
X-Gm-Message-State: AOJu0Yyx/NRMbmzp9XjId6ZW5euPp2/6G1Rkf/O/JvWYIqgUvmM7/ScQ
 a65FvzX3k+L179uxGlL1er9yrjrEM2T+TU/4hfQGLZ0IwG1FKZIYZAeewm0zJi4=
X-Google-Smtp-Source: AGHT+IGgQcpiwLEUFING1XERnam/U6qGF5xvkKehoSlTg5qsDFQdvCsXqg+zGMHrMxtCOGUnhHYhBw==
X-Received: by 2002:a17:902:d2ca:b0:20b:6ede:5b1c with SMTP id
 d9443c01a7336-20bc59f9ec9mr44058075ad.25.1727869463500; 
 Wed, 02 Oct 2024 04:44:23 -0700 (PDT)
Received: from localhost ([134.134.139.75]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20b37d61ddbsm82983705ad.7.2024.10.02.04.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 04:44:23 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH] drm/xe: Mark dpt requiring 8K alignment
Date: Wed,  2 Oct 2024 14:47:55 +0300
Message-ID: <20241002114815.1970048-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
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

Due to hw requirements relating to long strides let's align display
page table to 8k.

BSpec: 50417

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 9 ++++++---
 drivers/gpu/drm/xe/xe_bo.h             | 1 +
 drivers/gpu/drm/xe/xe_ggtt.c           | 2 ++
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 79dbbbe03c7f..976f4d1a03cd 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -103,19 +103,22 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 					   ttm_bo_type_kernel,
 					   XE_BO_FLAG_VRAM0 |
 					   XE_BO_FLAG_GGTT |
-					   XE_BO_FLAG_PAGETABLE);
+					   XE_BO_FLAG_PAGETABLE |
+					   XE_BO_FLAG_NEED_8K_ALIGN);
 	else
 		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
 					   ttm_bo_type_kernel,
 					   XE_BO_FLAG_STOLEN |
 					   XE_BO_FLAG_GGTT |
-					   XE_BO_FLAG_PAGETABLE);
+					   XE_BO_FLAG_PAGETABLE |
+					   XE_BO_FLAG_NEED_8K_ALIGN);
 	if (IS_ERR(dpt))
 		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
 					   ttm_bo_type_kernel,
 					   XE_BO_FLAG_SYSTEM |
 					   XE_BO_FLAG_GGTT |
-					   XE_BO_FLAG_PAGETABLE);
+					   XE_BO_FLAG_PAGETABLE |
+					   XE_BO_FLAG_NEED_8K_ALIGN);
 	if (IS_ERR(dpt))
 		return PTR_ERR(dpt);
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 31f4ba3bd8c1..154d6fe4c823 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -39,6 +39,7 @@
 #define XE_BO_FLAG_NEEDS_64K		BIT(15)
 #define XE_BO_FLAG_NEEDS_2M		BIT(16)
 #define XE_BO_FLAG_GGTT_INVALIDATE	BIT(17)
+#define XE_BO_FLAG_NEED_8K_ALIGN	BIT(18)
 /* this one is trigger internally only */
 #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
 #define XE_BO_FLAG_INTERNAL_64K		BIT(31)
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index f68af56c3f86..0b17c0afcd95 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -605,6 +605,8 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 
 	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
 		alignment = SZ_64K;
+	else if (bo->flags & XE_BO_FLAG_NEED_8K_ALIGN)
+		alignment = SZ_8K;
 
 	if (XE_WARN_ON(bo->ggtt_node)) {
 		/* Someone's already inserted this BO in the GGTT */
-- 
2.45.2

