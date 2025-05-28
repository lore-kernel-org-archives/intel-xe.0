Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6A4C5B554
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 09:13:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F042910E5BE;
	Wed, 28 May 2025 09:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="ZNzNIht9";
	dkim-atps=neutral
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C2A10E5AA
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 09:13:22 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-441d1ed82faso33286655e9.0
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 02:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1748423601; x=1749028401; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o+2yJB04g31aImN9kYR5m2tQHvzWGDu5CMhZSnchaeA=;
 b=ZNzNIht9SaM4P887e49QmKo+fjcorunc6XkJyDfZ8kE7MGxGA7CTVf9U41NujTyUgn
 Qrlo1YFKRWRFjKTyP/LIQQyrylXeZ/R3KiiL700D5PA6VSfqtIIHSJhnwQ1u16RhesmF
 EH899ZVwi8sRzJXYWB+tZb+AZyPB+hq4BXULQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748423601; x=1749028401;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o+2yJB04g31aImN9kYR5m2tQHvzWGDu5CMhZSnchaeA=;
 b=Q/kHeqIWAMDDO7yWiF5MZVxmOgV0wNvFx4D1TqsuQdNo3nGrf36/ZfxXU5nxntRpdW
 bQ9PHKaNxfhaNQNt50x8UHirxNi7DXzD/rZcx/P4b5iUZZ9wp2+a5cnoithv8pSrHwPT
 lqNqgOKdE7gnGUFlsVxvaCI3FvrrRHp/HFf4V877tHPJMTZ5Aot3xq4Zt5SBCdEnJ+v3
 91NrfpZbRRV304k5ZuWxgdYj3pxmR8zV9WGXF9A9z1SiYblmehfQdsGrvAaHkPa2AM38
 onA3TXc3xx8YSY9GiIv2O9NKU6aFpupMfEY2K+oM73nyOQLVTqVrI0lYSz2ZanAc3CNU
 caBw==
X-Gm-Message-State: AOJu0YzkNRVeCcgqvpYcWjjlzJoPpoUmSxfl7NSFtk/OM3QGExvmwbo6
 QJ4KohE1vABMFgXQVzV9vaHr7v4k8BDK2JqEYwSiiiSCUibfgcdJ/kUBq9rrfUs3W9g=
X-Gm-Gg: ASbGncuruUmdu3k7Eda3VCKO1xhWx35aBfF+1FKg1yo1WR5W6hvCKkdugsUfNROsm3g
 fA6AANa5KSFGtloGGSnSmWV51Iy1oECqHM4npkzeBHvTFzU5ZoabbL1D0UF0a6m6tiiY264SZE6
 KKzJjEpTnThtMAaF1bzuFlRaXlnvwSPHEABm5MOHKc5jJ1VNcpKazLPmdW9x7LGrbc4g1ReIdSl
 0mJWqksg7GsfIvCFSK6HiaxyHRCA9p9LHkDu3frku2xed409CFJfCUVzk2g9xsnawItg2yTvv/0
 ObY5rsW+er+AF/VoaTVcSPP28io/idJdCavRX1YXQauJmVxLy0BqCCqoly75MLU=
X-Google-Smtp-Source: AGHT+IF+J9gs9Akej4NXfbvlZZ1XUk4UkDRdivSjnyJiYRklFqBZKmKqHXdSYCOnnomp4+/c/cb2rg==
X-Received: by 2002:a05:600c:1553:b0:43c:f513:958a with SMTP id
 5b1f17b1804b1-44c935ddb46mr149555705e9.13.1748423601141; 
 Wed, 28 May 2025 02:13:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4500e1d85b5sm14811715e9.32.2025.05.28.02.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 02:13:20 -0700 (PDT)
From: Simona Vetter <simona.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: intel-xe@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>,
 Rob Clark <robdclark@chromium.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, stable@vger.kernel.org,
 Simona Vetter <simona.vetter@intel.com>
Subject: [PATCH 2/8] drm/fdinfo: Switch to idr_for_each() in
 drm_show_memory_stats()
Date: Wed, 28 May 2025 11:13:00 +0200
Message-ID: <20250528091307.1894940-3-simona.vetter@ffwll.ch>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
References: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
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

Unlike idr_for_each_entry(), which terminates on the first NULL entry,
idr_for_each passes them through. This fixes potential issues with the
idr walk terminating prematurely due to transient NULL entries the
exist when creating and destroying a handle.

Note that transient NULL pointers in drm_file.object_idr have been a
thing since f6cd7daecff5 ("drm: Release driver references to handle
before making it available again"), this is a really old issue.

Aside from temporarily inconsistent fdinfo statistic there's no other
impact of this issue.

Fixes: 686b21b5f6ca ("drm: Add fdinfo memory stats")
Cc: Rob Clark <robdclark@chromium.org>
Cc: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: <stable@vger.kernel.org> # v6.5+
Signed-off-by: Simona Vetter <simona.vetter@intel.com>
Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_file.c | 95 ++++++++++++++++++++++----------------
 1 file changed, 55 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 246cf845e2c9..428a4eb85e94 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -892,6 +892,58 @@ void drm_print_memory_stats(struct drm_printer *p,
 }
 EXPORT_SYMBOL(drm_print_memory_stats);
 
+struct drm_bo_print_data {
+	struct drm_memory_stats status;
+	enum drm_gem_object_status supported_status;
+};
+
+static int
+drm_bo_memory_stats(int id, void *ptr, void *data)
+{
+	struct drm_bo_print_data *drm_data;
+	struct drm_gem_object *obj = ptr;
+	enum drm_gem_object_status s = 0;
+	size_t add_size;
+
+	if (!obj)
+		return 0;
+
+	add_size = (obj->funcs && obj->funcs->rss) ?
+		obj->funcs->rss(obj) : obj->size;
+
+	if (obj->funcs && obj->funcs->status) {
+		s = obj->funcs->status(obj);
+		drm_data->supported_status |= s;
+	}
+
+	if (drm_gem_object_is_shared_for_memory_stats(obj))
+		drm_data->status.shared += obj->size;
+	else
+		drm_data->status.private += obj->size;
+
+	if (s & DRM_GEM_OBJECT_RESIDENT) {
+		drm_data->status.resident += add_size;
+	} else {
+		/* If already purged or not yet backed by pages, don't
+		 * count it as purgeable:
+		 */
+		s &= ~DRM_GEM_OBJECT_PURGEABLE;
+	}
+
+	if (!dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true))) {
+		drm_data->status.active += add_size;
+		drm_data->supported_status |= DRM_GEM_OBJECT_ACTIVE;
+
+		/* If still active, don't count as purgeable: */
+		s &= ~DRM_GEM_OBJECT_PURGEABLE;
+	}
+
+	if (s & DRM_GEM_OBJECT_PURGEABLE)
+		drm_data->status.purgeable += add_size;
+
+	return 0;
+}
+
 /**
  * drm_show_memory_stats - Helper to collect and show standard fdinfo memory stats
  * @p: the printer to print output to
@@ -902,50 +954,13 @@ EXPORT_SYMBOL(drm_print_memory_stats);
  */
 void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
 {
-	struct drm_gem_object *obj;
-	struct drm_memory_stats status = {};
-	enum drm_gem_object_status supported_status = 0;
-	int id;
+	struct drm_bo_print_data data = {};
 
 	spin_lock(&file->table_lock);
-	idr_for_each_entry (&file->object_idr, obj, id) {
-		enum drm_gem_object_status s = 0;
-		size_t add_size = (obj->funcs && obj->funcs->rss) ?
-			obj->funcs->rss(obj) : obj->size;
-
-		if (obj->funcs && obj->funcs->status) {
-			s = obj->funcs->status(obj);
-			supported_status |= s;
-		}
-
-		if (drm_gem_object_is_shared_for_memory_stats(obj))
-			status.shared += obj->size;
-		else
-			status.private += obj->size;
-
-		if (s & DRM_GEM_OBJECT_RESIDENT) {
-			status.resident += add_size;
-		} else {
-			/* If already purged or not yet backed by pages, don't
-			 * count it as purgeable:
-			 */
-			s &= ~DRM_GEM_OBJECT_PURGEABLE;
-		}
-
-		if (!dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true))) {
-			status.active += add_size;
-			supported_status |= DRM_GEM_OBJECT_ACTIVE;
-
-			/* If still active, don't count as purgeable: */
-			s &= ~DRM_GEM_OBJECT_PURGEABLE;
-		}
-
-		if (s & DRM_GEM_OBJECT_PURGEABLE)
-			status.purgeable += add_size;
-	}
+	idr_for_each(&file->object_idr, &drm_bo_memory_stats, &data);
 	spin_unlock(&file->table_lock);
 
-	drm_print_memory_stats(p, &status, supported_status, "memory");
+	drm_print_memory_stats(p, &data.status, data.supported_status, "memory");
 }
 EXPORT_SYMBOL(drm_show_memory_stats);
 
-- 
2.49.0

