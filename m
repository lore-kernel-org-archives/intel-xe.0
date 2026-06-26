Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D965C43327
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 12:59:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 196BE10F013;
	Wed,  1 Jul 2026 12:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qb47BMg3";
	dkim-atps=neutral
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A68210E38C
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jun 2026 11:29:05 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-c121e83b89fso88165866b.1
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jun 2026 04:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782473344; x=1783078144; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LhgdMS5TXgKcR8QoNKupqhHAfY6bdNKf0RyWHL3p3Ao=;
 b=Qb47BMg3DB7B/NeVHbovaa62uSwfiDLSx9hhVR7T9NRKnzHuL9Sbfob9/LELiHntO1
 sX172AfmV+kpbECuyUpIiwHE7W1Y/9YL8KuqnFBrE95snsE3wsLl30nBtP65fVrvKbdK
 1QPClWtKRDUE8ljXAEkC2CFhRj/8zkFa7MwDyZzh0Fi98y4CY8lppnkZZ1b2f1xkO/AM
 PjxOBSzdCuIB+6Dboy5FYAK8eRNo+hLqqZ4upFCTfYGDNKPoA9NWeh6bM4B3q82U1iDq
 T08S4/S5e+u0hto0nm4c+QcCB9zzx3OwFMkAWH5eho6jZHkdzPFmXPYHQjWp6euDk8qO
 y2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782473344; x=1783078144;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LhgdMS5TXgKcR8QoNKupqhHAfY6bdNKf0RyWHL3p3Ao=;
 b=fEj1/Ml6Hfi9MVv+eky4u5etuGursow/SsbwavX6/Eh3V2TvkD8f8E9aY9LCfItJpK
 WAwtBxyD8yJls2S1AHWYqzMv2GYPC9oypYEp65cC0vUcF8525/TPb5HtFHj7LQhH/PNT
 6VWGm6f79ODHXswMPaYzVKS1SHKanidL4GlZSVVwJwUwwkfeXSWpiYcg46LnqYoERUFB
 HBDYH/FWR1YWY9qL0xNaqPmExjGRlFjRABSabtotlWrvgL0uR4vFnYzZYz3oul3IWanA
 ddXrjuvX8durUtbRauzaZSSmLDcSpQEneKNwlcYnoJV96J6YE5ZX5B9s1mjsC/4ghf5p
 sJkg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoZunxC86isNodJJd4ocj1yASnbU4iFeNjMrH7SvE9hkzhBettw/BuIU2R8DVPOqTVRyeGwWdXMUQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0B0Y4x0PBn0eMtHAg67J2OPl2nMoCHNs6kZ++Nnfbt5nffHn4
 lVhKVilpVIpUsoH2e34V5+8lTDZnjX3fMQUv8MojtjyafPbmFmA/asNm
X-Gm-Gg: AfdE7cltomK7K/2YgBaOIZPz0mXLGdCwWAsMEiAqr4EN7cBsq7gE/x1f9POLN9JQvei
 brdm3BEq+HG2NBgS5iEPS7pUGUa5kun5d0I4GKlbYZ0XJ+nlNRI0VqdjAyyfgAazCOY0gOGgLr8
 DlMLWDTE5xTh/XELB9ErnZZzxAG/kR6grRKO/RDUqw++EHe0dJSVm4/I507p/D0M9TgGheFT8Nc
 dDZnM0V85pbDPCHh5455ZXlbMnKAXw0kD6/4q2iXLJVT4FYvb6mt4dB3lqbH0upmkdzfB+SFUMP
 bnT9RWasu51FdomwjwkVo/q0/IpsGy49MROgMBQmcP95IAFTT8o/0s8njhPrZZo6hC2GDd2OXfZ
 HiWC8+puC1v/meZOHgleSivgD2eGBs/pLacZ9TcFDxPA91OtA3bN4ze8eFOl2pZLZVZIYW/m1Ml
 /WPsvJGQaMztIo3BSkqfE38FmWoBuIN4uBLAaNkkUFJhzdU1BNDCV21qlv6trHgw5Ly9pVRa7Xf
 JAYyrdwRc+GlsyW89NelWmbkpzd9OXTrOWK3bp1/Z7M
X-Received: by 2002:a17:907:3c8b:b0:c12:f85:bea4 with SMTP id
 a640c23a62f3a-c120f85cbb7mr361613666b.47.1782473343510; 
 Fri, 26 Jun 2026 04:29:03 -0700 (PDT)
Received: from fedora ([154.66.167.183]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c122176f39csm88811566b.21.2026.06.26.04.29.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 04:29:03 -0700 (PDT)
From: aquiles <achillezongo07@gmail.com>
To: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com
Cc: airlied@gmail.com, simona@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 aquiles <achillezongo07@gmail.com>
Subject: [PATCH 1/2] drm/xe: count UMA shrinkable BOs as reclaimable without
 swap
Date: Fri, 26 Jun 2026 11:26:37 +0000
Message-ID: <20260626112638.2042298-1-achillezongo07@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 01 Jul 2026 12:56:31 +0000
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

On integrated (UMA) devices all GPU buffer objects reside in system RAM.
xe_shrinker_count() previously gated shrinkable (non-purgeable) page
counts on ttm_backup_bytes_avail(), so those pages were invisible to
the kernel's memory reclaim on systems without swap configured.

On UMA, shrinkable system-memory BOs can be reclaimed independently of
swap availability. Report them unconditionally so the shrinker can
always request their eviction under memory pressure.

Signed-off-by: aquiles <achillezongo07@gmail.com>
---
 drivers/gpu/drm/xe/xe_shrinker.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
index 83374cd57..3ca2de342 100644
--- a/drivers/gpu/drm/xe/xe_shrinker.c
+++ b/drivers/gpu/drm/xe/xe_shrinker.c
@@ -140,16 +140,22 @@ xe_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
 {
 	struct xe_shrinker *shrinker = to_xe_shrinker(shrink);
 	unsigned long num_pages;
+	long uma_reclaimable_pages;
 	bool can_backup = !!(sc->gfp_mask & __GFP_FS);
+	bool is_uma = !IS_DGFX(shrinker->xe);
 
 	num_pages = ttm_backup_bytes_avail() >> PAGE_SHIFT;
 	read_lock(&shrinker->lock);
 
+	uma_reclaimable_pages = is_uma ? shrinker->shrinkable_pages : 0;
+
 	if (can_backup)
-		num_pages = min_t(unsigned long, num_pages, shrinker->shrinkable_pages);
+		num_pages = min_t(unsigned long, num_pages,
+				  shrinker->shrinkable_pages - uma_reclaimable_pages);
 	else
 		num_pages = 0;
 
+	num_pages += uma_reclaimable_pages;
 	num_pages += shrinker->purgeable_pages;
 	read_unlock(&shrinker->lock);
 
-- 
2.54.0

