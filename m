Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D855FCAC5A5
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 10:23:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F6310E6DF;
	Wed, 24 Sep 2025 10:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bphgnwtf";
	dkim-atps=neutral
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 591A710E6E0
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 10:23:00 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-46e2562e8cbso10198095e9.1
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 03:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758709379; x=1759314179; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2SZhlVPPd52n7ONt3JZoUJyYMwjtJvsP+AyT6HZcYJQ=;
 b=bphgnwtfVgPMcrNPkShLLNSdn0ridJZWHY5XvkkG8XsnkjlTO4h47OUWZg3YDQolRx
 HYgCb8Iqyh69RWcm1C4AjFoKrDUYXDQxE9PhaFKvj7E5kdUe/veqVfIdvX6fPBob+MLp
 tHbgR0XYo/aBFnYHHMKBoTwdbpNLYD2Aa22RMZBfRZ0a6l6JvARmm6Oxpf/iJhDTPXLu
 iEiOee5RDxoEs//3+/VuNBAD+QH8qNag/bFYt93+7hPdRP+YTRBbbAQiHhk9h7H7XMHF
 GypwH6aIlasKlBiwF+VkpL3gDEFPs1fUjoFWjHzxo35pQMZfcOwvz8LvLxr2EFKW/lPf
 lJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758709379; x=1759314179;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2SZhlVPPd52n7ONt3JZoUJyYMwjtJvsP+AyT6HZcYJQ=;
 b=O5cKlDUc0VxDFUoSYLHacamXZ/8FsVCMPeka1cjL5Fo/VlQwBX6ACevt3IuJylHZC9
 kbc4PESD5WTVARo1IIC+Dwy7KcOszRZJAzaI4DtmsEp93lFeE8SCDJA66PRPVocOFnHj
 1KT5uEvQpwF2TEMH+2vxlYaMimn8tV4U7RvC4CYOs59kSSk/KMjis+ruS7OvDWeWilUk
 Wb5rkYuAj91NWlC2oHHPCcpc/gp2z1T5duM+/sTZENSSt82Ds06m+dZKRlwxMoeMqNVj
 jdzf0T1NOrKyuIfZMbWzFgoyR1o3yHQsNHApUqIkKc019RS0sTWsITw0KYjLeFaXPvo7
 qtcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBmP5lT1VMH8Cc5Ni4J8s1J2brWAStManMOoJu6gKT4l8GgnbrhqexHhcWA3TcIQi7dqUBn2U3ug==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxd3HoEj36ZrQRlIIR+4oIeVSSqww9MTH8XoOHSOeT9R3YMNO0/
 p8GYVvOAuYobe23u9U8uFQjXf4wa59tdwkWvG4NnVNyDrSRZsu0PKyU0
X-Gm-Gg: ASbGncs8tVa7ZTugy3A94Pn3PWuZ89+FBmkuyeYgOotbx/5wmzfHMff2wcB5BznDsUN
 wu/rZbQlaqIb77IHC15TPmcQvqyDVXsdqhEWdxZ9ZdrDfLs03Z6tTAZ4+ywDG4QfxRIPmvDDp8j
 6CeLT+qMDFAY80qf2xhWrNqqrJN0pG6itMvvlYzjWz5sog6u5swAFseorZTvB1iwDDP/7dea1Tu
 D28E21Te61O57u1WEjezbuQHdXkkPNGpY6fe2m4QeUoGYVGtgcxHjbhHCrSxeTk+RoPnq5+IGrV
 fgApawpZM9CF6BB9cxdiVAlyZDD+HIoEZ6LiMiNYsqKDR/xRewIA+LAgiWVF1OYs9fmlvQHsLlr
 or6ErOr8vC3A9wGr9msCSeSAuDSHqBJf8
X-Google-Smtp-Source: AGHT+IEaxHf/2iRwwqfoIfQ+Znhm/drcILF6bGn2vT3pOma/+G7W3dJJfRF76aIPViePMXlaIdlZhw==
X-Received: by 2002:a05:600c:1d0d:b0:46d:fd71:f69 with SMTP id
 5b1f17b1804b1-46e1d988de8mr46724395e9.14.1758709378513; 
 Wed, 24 Sep 2025 03:22:58 -0700 (PDT)
Received: from localhost ([87.254.0.133]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-46e2a9b6e1bsm29341975e9.10.2025.09.24.03.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 03:22:56 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Badal Nilawar <badal.nilawar@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next][V2] drm/xe/xe_late_bind_fw: Fix missing initialization
 of variable offset
Date: Wed, 24 Sep 2025 11:22:08 +0100
Message-ID: <20250924102208.9216-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

The variable offset is not being initialized, and it is only set inside
a for-loop if entry->name is the same as manifest_entry. In the case
where it is not initialized a non-zero check on offset is potentialy checking
a bogus uninitalized value. Fix this by initializing offset to zero.

Fixes: efa29317a553 ("drm/xe/xe_late_bind_fw: Extract and print version info")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---

V2: Fix identical issue in parse_lb_layout that I ommitted in the first
patch

---
 drivers/gpu/drm/xe/xe_late_bind_fw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 38f3feb2aecd..8f5082e689dc 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -60,7 +60,7 @@ static int parse_cpd_header(struct xe_late_bind_fw *lb_fw,
 	const struct gsc_manifest_header *manifest;
 	const struct gsc_cpd_entry *entry;
 	size_t min_size = sizeof(*header);
-	u32 offset;
+	u32 offset = 0;
 	int i;
 
 	/* manifest_entry is mandatory */
@@ -116,7 +116,7 @@ static int parse_lb_layout(struct xe_late_bind_fw *lb_fw,
 	const struct csc_fpt_header *header = data;
 	const struct csc_fpt_entry *entry;
 	size_t min_size = sizeof(*header);
-	u32 offset;
+	u32 offset = 0;
 	int i;
 
 	/* fpt_entry is mandatory */
-- 
2.51.0

