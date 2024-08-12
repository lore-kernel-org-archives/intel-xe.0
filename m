Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A285C52D7C
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 20:12:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 504FE10E2A8;
	Mon, 12 Aug 2024 20:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MYLnrfG4";
	dkim-atps=neutral
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 622C710E2A8
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 20:12:36 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id
 5614622812f47-3db1d0fca58so3210664b6e.3
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 13:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723493555; x=1724098355; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dATszDia9XGt8okKDBFzEDH3NBau2UVqGjVmcVm8iHw=;
 b=MYLnrfG4hK53elb7eBvex2ph6cRa+K7UFAEpkdwFp0Hns4yLiyiUU0MGBtHJ/26WBx
 PO+Kje/w2a01PqChEzBpMylzT+BA9nz48E6PmKtoPLPjQtxHrIa2giS7mT2XFEwgxKnR
 PZIoFRo+tl9gLhMjn2xKXpDZprwVMFp8yz4jcQsjWlP/4P0qRqhp86J3o06IUN7VU0a9
 onOuN/k16THP0ePDMVALhBEot/ivTELkwQKxh/A6FEoJXapIUgiZRN+9n42UUAcNMCXq
 1wcgBwFsMyqx+kBbTHsuM3O5Yp+6yBKP55O58M4TseMZid8m15rs3M8fuLLM64s/7eEb
 8/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723493555; x=1724098355;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dATszDia9XGt8okKDBFzEDH3NBau2UVqGjVmcVm8iHw=;
 b=wWc5BiRWEf+cOAldnmBl3gfLDJK+0E2sCl3W0SQl9Tx0QteffJhD08yoVyTiIlsLti
 xi4t47/119B+FrhroMozorKiOIomWtk1LSNJs4LqR1l8UP7tDyCLvgBB1pu12kR0Gr1Z
 GNINX/M7B5IC1Vgw5S4ZvRrjbe0kTgdUDQZ5pNzXEzent9YlEbrywI762TdhyQDZhWJI
 QFS0mNQeErLrs6grEbSndx5RlR2r7BzOB9sy8IRvdAa26f+/UWYCKFvf5D7htwtnT9XC
 Hl5VcRKcpyTkJbdZXJND51WVMQUwJFgToSmJ2UeXfxSxQJOCavB3520CySlDov2L3zKi
 CoIw==
X-Gm-Message-State: AOJu0YyZdxqdjZO7Q9szZuLXgsRlQ3ujbRMIXaXoG3d9fR7TP6mfSR1H
 ORA7HJ+wawWkFof1IujTriY0IU/HIOMYZJcX62WAP53s/9chU7eJaqNJBPeEyyE0RKDx
X-Google-Smtp-Source: AGHT+IGpeuLfNC0/ru0//GXLAmh9OCE+RQt+RFCzo/E54j/d1uJwBIww6ekyuLvZzwAKU6Y+bGrk7g==
X-Received: by 2002:a05:6808:2223:b0:3d9:2b45:1585 with SMTP id
 5614622812f47-3dd1ee30795mr1431977b6e.22.1723493555310; 
 Mon, 12 Aug 2024 13:12:35 -0700 (PDT)
Received: from localhost ([134.134.139.69]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-710e5ab3054sm4390664b3a.188.2024.08.12.13.12.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 13:12:35 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH 2/3] drm/fourcc: define Intel Xe2 related tile4 ccs modifiers
Date: Mon, 12 Aug 2024 23:14:36 +0300
Message-ID: <20240812201549.2014168-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240812201549.2014168-1-juhapekka.heikkila@gmail.com>
References: <20240812201549.2014168-1-juhapekka.heikkila@gmail.com>
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

Add Tile4 type ccs modifiers to indicate presence of compression on Xe2.
Here is defined I915_FORMAT_MOD_4_TILED_LNL_CCS which is meant for
integrated graphics with igpu related limitations
Here is also defined I915_FORMAT_MOD_4_TILED_BMG_CCS which is meant
for discrete graphics with dgpu related limitations

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 include/uapi/drm/drm_fourcc.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 2d84a8052b15..b7f0cc536626 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -702,6 +702,31 @@ extern "C" {
  */
 #define I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC fourcc_mod_code(INTEL, 15)
 
+/*
+ * Intel Color Control Surfaces (CCS) for graphics ver. 20 render compression
+ * on integrated graphics
+ *
+ * The main surface is Tile 4 and at plane index 0. For semi-planar formats
+ * like NV12, the Y and UV planes are Tile 4 and are located at plane indices
+ * 0 and 1, respectively. The CCS for all planes are stored outside of the
+ * GEM object in a reserved memory area dedicated for the storage of the
+ * CCS data for all compressible GEM objects.
+ */
+#define I915_FORMAT_MOD_4_TILED_LNL_CCS fourcc_mod_code(INTEL, 16)
+
+/*
+ * Intel Color Control Surfaces (CCS) for graphics ver. 20 render compression
+ * on discrete graphics
+ *
+ * The main surface is Tile 4 and at plane index 0. For semi-planar formats
+ * like NV12, the Y and UV planes are Tile 4 and are located at plane indices
+ * 0 and 1, respectively. The CCS for all planes are stored outside of the
+ * GEM object in a reserved memory area dedicated for the storage of the
+ * CCS data for all compressible GEM objects. The GEM object must be stored in
+ * contiguous memory with a size aligned to 64KB
+ */
+#define I915_FORMAT_MOD_4_TILED_BMG_CCS fourcc_mod_code(INTEL, 17)
+
 /*
  * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
  *
-- 
2.45.2

