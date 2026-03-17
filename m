Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DEBDFF6E87
	for <intel-xe@archiver.kernel.org>; Tue, 17 Mar 2026 22:09:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C452310E222;
	Tue, 17 Mar 2026 22:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="gQl11/55";
	dkim-atps=neutral
Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com
 [74.125.82.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E180210E222
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Mar 2026 22:09:36 +0000 (UTC)
Received: by mail-dy1-f202.google.com with SMTP id
 5a478bee46e88-2c0cd2e4aa6so11149229eec.0
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Mar 2026 15:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1773785376; x=1774390176;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Lq7yxYkymk6UoPo+9FJHSu8+kVpVAWguO7UjWCYWFjQ=;
 b=gQl11/55/bZ2QO8qCh+GXd+c9R5CnxNsbq6jeSAuN4Dd7Sp2xpHxZ/MUXG7QZ9dOum
 K/l3bhIHbtSHg5ZUeZOYLrJ04+GC9aDdQNMzAJeXo1371fGRXc7M0Jnnib7M61HEtHPY
 wJ8k/qRafMwPoRC53sSMjFWDmlfhrQB3Gf7c4oY02HWx/Bk1ermBQfUkgMGZnjMi1gLc
 KN4EzG+e/WB8TjYXsBczfYynS4922/gNsj7OLyGqrRckVVR6at/jy3g1HZF71tDFKPda
 UVgWisYwTHLuTA+chWFZr5u391cVJnLYoJ+nwY844+ewz8BS7CcOf4OwF1L4PgVMbckU
 3F+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773785376; x=1774390176;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Lq7yxYkymk6UoPo+9FJHSu8+kVpVAWguO7UjWCYWFjQ=;
 b=NO1w93+kqbOEaY3oFPKeesy75Yaq4bk7KMV8NtwrIF3+IZShyBRLhGV2GAk3TuFDuM
 8u4rQ4dfe4NpbmXWAoQeF4f2kGKHogqBj2FVEHhdr9buZdUcn7NwXF127Hw5QiL16jsc
 spYD3uylJCVVva1iI1fL4a5Gpoyl4Wi4YCGaimDMx/sjIQt6U9NSBMwkvr/TgxRE4uYZ
 FsnIqMQUXdityk0gdAxdQn3JfUmpvWVJuq09EwRz6D6cdoJnx7+2i2Y4zWow0Iolw/lc
 zQ7TPQ7tqTaft8qU02XF4t4kNxq//WyENEo/uLvYaUL/uoRqmGYAZnT9HA0lvFV3OaD7
 AqtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUOnasRziP73lBMFsLHm3k9MbsvH2alXtCzcu6uLc2W/V+veybjsncXyOuGXJ69BjUV8ZFslrG7w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyytPgcHwO/FHEuJWT+RLUyh2CNpY1a0iBAl/xOCUpM5HDF595w
 T5XzeUS3Gv+U5z6Rzbr7rAoLINPOPCvoaVZWZh6VEIHUFA5DEmlya3bs6Yky7lJap987sWPO01E
 5jTUHHAk51D/oYg==
X-Received: from dybso14.prod.google.com
 ([2002:a05:7301:690e:b0:2c0:b988:33bc])
 (user=jdsultan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:80c8:b0:2b8:6a22:6d52 with SMTP id
 5a478bee46e88-2c0e5147e25mr564411eec.33.1773785375972; 
 Tue, 17 Mar 2026 15:09:35 -0700 (PDT)
Date: Tue, 17 Mar 2026 15:09:02 -0700
In-Reply-To: <20260317220908.130968-1-jdsultan@google.com>
Mime-Version: 1.0
References: <20260317220908.130968-1-jdsultan@google.com>
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
Message-ID: <20260317220908.130968-2-jdsultan@google.com>
Subject: [PATCH v4 1/2] drm/xe/display: Fix reading the framebuffer from
 stolen memory
From: Juasheem Sultan <jdsultan@google.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Manasi Navare <navaremanasi@google.com>, Drew Davenport <ddavenport@google.com>,
 Sean Paul <seanpaul@google.com>, Samuel Jacob <samjaco@google.com>, 
 Rajat Jain <rajatja@google.com>, Juasheem Sultan <jdsultan@google.com>
Content-Type: text/plain; charset="UTF-8"
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

Currently, we attempt to pin stolen memory using the ggtt address. This
doesn't appear to actually read the framebuffer that was setup by the
bios. Instead, we have to use the underlying physical address offset
within stolen memory.

Signed-off-by: Juasheem Sultan <jdsultan@google.com>
---
 drivers/gpu/drm/xe/display/xe_initial_plane.c | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
index 4cfeafcc158d..d818993d9b8a 100644
--- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
+++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
@@ -19,6 +19,7 @@
 #include "intel_fb.h"
 #include "intel_fb_pin.h"
 #include "xe_bo.h"
+#include "xe_ttm_stolen_mgr.h"
 #include "xe_vram_types.h"
 #include "xe_wa.h"
 
@@ -87,7 +88,26 @@ initial_plane_bo(struct xe_device *xe,
 
 		if (!stolen)
 			return NULL;
-		phys_base = base;
+
+		/* Read PTE to find physical address backing the GGTT address */
+		u64 pte = xe_ggtt_read_pte(tile0->mem.ggtt, base);
+		u64 phys_addr = pte & ~(page_size - 1);
+
+		u64 stolen_base = xe_ttm_stolen_gpu_offset(xe);
+
+		drm_dbg_kms(&xe->drm,
+				"Stolen Framebuffer base=%x pte=%llx phys_addr=%llx stolen_base=%llx\n",
+				base, pte, phys_addr, stolen_base);
+
+		/* Make sure that the physical address is in the range of stolen memory */
+		if (phys_addr >= stolen_base) {
+			phys_base = phys_addr - stolen_base;
+		} else {
+			drm_err(&xe->drm, "Stolen memory outside of stolen range phys_base=%pa\n",
+					&phys_base);
+			return NULL;
+		}
+
 		flags |= XE_BO_FLAG_STOLEN;
 
 		if (XE_DEVICE_WA(xe, 22019338487_display))
-- 
2.53.0.851.ga537e3e6e9-goog

