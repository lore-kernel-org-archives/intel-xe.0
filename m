Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 953F9C44512
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jul 2026 19:08:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B745410F95A;
	Fri, 10 Jul 2026 19:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZAWL07Zk";
	dkim-atps=neutral
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B06110F952
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jul 2026 19:08:04 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-493b77b150aso11105565e9.2
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jul 2026 12:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783710483; x=1784315283; darn=lists.freedesktop.org;
 h=content-transfer-encoding:reply-to:content-type:mime-version
 :references:in-reply-to:message-id:date:subject:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=XYmheRZks84ebbE/VW7oiD93RBquqkXcsU3VJTJ0fDE=;
 b=ZAWL07ZkFh+E4CSLwiWku7/SewVUE0qjfvmQAr7FP+GpFv8Q8fQg2GFQMsISesbDQ3
 KUjzFsUBkrUz3F8YqThM2z+rNzXTgDbyJC/yMFSxOjJmu8PNoxiKjsyYfWRjSHO+MGJ6
 YG2fbEr0I41zChzujkDD4Z7UWS3zvTrNMjVpvNO2a6DLn1Cds+XX5LXvFUwwqVOkA1t9
 WIrkgq/BHWtK+G2i1i1uhlOK+H8O/b8LFkRKubKbsBNGPxhDjRM071JyvLglCkQPL2dg
 k2dtzRlo2U9Bz5YA+dawU/ZL1hMtWWg2Zdmy9G+Jw86j3EHJwNIUITh30JyK5YMOjA0K
 1/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783710483; x=1784315283;
 h=content-transfer-encoding:reply-to:content-type:mime-version
 :references:in-reply-to:message-id:date:subject:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=XYmheRZks84ebbE/VW7oiD93RBquqkXcsU3VJTJ0fDE=;
 b=r2040wlrN6SJDat48Of38fr5FnMhLQgnFYZkXHtUAig2+aO5S7HtTdTs1r/d/lwHxo
 MPJizT6ok24JvY+RsU4DBrcpn0/xReL50tSLKncOmJExRj67/nVa3RFRIqaSLMhWpiUI
 xzMwmr4oAu25NmpGCYYzm+uDrIYjm/4mxcrg3pgtJT3g9zUfQY9B1wNUIST0eLdS+Oxu
 Qv7S3WGdAlE7q3ULSZh4JNM2Zc5hvW+pAelpe6wtV42zVzkIyY/Rcvi2a6PUe/fcF9JW
 99b0n4YwMhb9C228cFpZCRlDuKW/Q4PI7u5luSw+vyWwZKMYPEoSWODFeF2omZSooref
 nDTg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqMmhNUWTN0Gxzr6qkkPgKWIEjxzTNyMoFVpKYOwUj9Tla+kz8wTfa8g7JAYQ1YszMDInztZHBwHg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmmSWIkfHoU3ntMz+btjbin3x61LZXXzJVTgdA6uhGCfrIMSxL
 kMb4pgxtm5naf0RrplfYHU4+lf111gxFsAqyIbiXxiCsdWaNjXaGQr6I
X-Gm-Gg: AfdE7cnIm+9wk31HVO0kRlBefys6juTzOiL6E4dA7dF6Tpjcd5d0K8uo3v5U+21S+tt
 GasF6/ZcyYep0TcNCc9HE40SeAiMSU8cwlXwKsqV4TC7qK+2h/FU6bhfYiVV+2T9eGyWzRSPa88
 Nx0Abioahk0cT4rupXHRWYNi2U5YcxIBZ68u9kqcj1UsEyoRpo9BrCqYOqjgU3Z0jyiDIoO1yrF
 JCQUTZxxgwHOwh+f4bbWKSSTvXCoMLCwB2BMSiKLyzzwLEfGrj9/D1xW1DrPhgraDQb1ATbJMX6
 ZY1Zheg9Bo/7QqqDHo98gUmkRerXl2BWkBiQ8ugTCtrXITKQlpZzg+pLx++paV22oyts6yN4T4z
 GPWHNoaAnNxacNsLuEoh0ZyONSzeVhiDE/novkOED9LyHb0DuGQvGqIGaNTLO52flEWRpLboLbb
 OSFaDNJysLe0PF9kwmMAdeAfbRHg==
X-Received: by 2002:a05:600c:1502:b0:493:c773:c3f4 with SMTP id
 5b1f17b1804b1-493f881d64cmr624905e9.22.1783710482709; 
 Fri, 10 Jul 2026 12:08:02 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:154f:ec00:aa08:de24:db33:4496])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493f567eadfsm55000755e9.6.2026.07.10.12.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 12:08:02 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, dakr@kernel.org, ecourtney@nvidia.com,
 simona@ffwll.ch, matthew.brost@intel.com, nat@pixelcluster.dev,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 08/12] drm/ttm: use dma_resv reference in
 ttm_device_clear_lru_dma_mappings
Date: Fri, 10 Jul 2026 20:52:48 +0200
Message-ID: <20260710190752.2355-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710190752.2355-1-christian.koenig@amd.com>
References: <20260710190752.2355-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reply-To: christian.koenig@amd.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Instead of trying to grab a BO reference.

Also lock the dma_resv object, that TT unpopulate is done without
holding the lock looks extremely suspicious.

Only compile tested!

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_device.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index e4188e2ee7ab1..be6fc42772f9d 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -293,19 +293,29 @@ static void ttm_device_clear_lru_dma_mappings(struct ttm_device *bdev,
 
 	spin_lock(&bdev->lru_lock);
 	while ((res = ttm_lru_first_res_or_null(list))) {
-		struct ttm_buffer_object *bo = res->bo;
+		struct dma_resv *resv;
 
 		/* Take ref against racing releases once lru_lock is unlocked */
-		if (!ttm_bo_get_unless_zero(bo))
-			continue;
+		resv = dma_resv_get(res->bo->base.resv);
+		spin_unlock(&bdev->lru_lock);
+
+		dma_resv_lock(resv, NULL);
 
-		list_del_init(&bo->resource->lru.link);
+		/* Double check that res and bo is still valid */
+		spin_lock(&bdev->lru_lock);
+		if (res != ttm_lru_first_res_or_null(list)) {
+			dma_resv_unlock(resv);
+			dma_resv_put(resv);
+			continue;
+		}
+		list_del_init(&res->lru.link);
 		spin_unlock(&bdev->lru_lock);
 
-		if (bo->ttm)
-			ttm_tt_unpopulate(bo->bdev, bo->ttm);
+		if (res->bo->ttm)
+			ttm_tt_unpopulate(res->bo->bdev, res->bo->ttm);
 
-		ttm_bo_put(bo);
+		dma_resv_unlock(resv);
+		dma_resv_put(resv);
 		spin_lock(&bdev->lru_lock);
 	}
 	spin_unlock(&bdev->lru_lock);
-- 
2.43.0

