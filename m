Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17ABFC79F88
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 13:44:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF6F10F5D3;
	Thu,  3 Sep 2026 13:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ogGsxa/+";
	dkim-atps=neutral
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE02510F60F
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 13:44:18 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-4843e9c5960so2338359f8f.0
 for <intel-xe@lists.freedesktop.org>; Thu, 03 Sep 2026 06:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788443057; x=1789047857; darn=lists.freedesktop.org;
 h=content-transfer-encoding:reply-to:content-type:mime-version
 :references:in-reply-to:message-id:date:subject:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=8EdCrSCj77M32Pu3SEBs0Nl7Jw7mm9Bq+OEkpl3c1Aw=;
 b=ogGsxa/+tyxPYrJKDu1RbrMSVZtr5w7pHsOf3kCbqcPVSU9mh1AHjaqqTBFslTJJWr
 TgiYVJUshKSlf4UTJS8XT9MQRzvf2Xr2xXpMuLYiIgZCMiUGgjhU8fkU2spzhdXh7sOp
 LRPfw9DG/EwXnhs42h5iO1//fh9I1RrT4kz+Bus9ADcAnOlMNb4bAQinXirugjgyub5V
 CTrcfkyTTflMMVV4n5EJofWFbkxoVS3UJklS6hPCryEL2JnzAoMeirpBOYbblk891kaA
 YToWoiAbq/xMaJp70j9cxKQooMds+/iMPf18Sf4JtkZ+irNW3o4Y0bjSFU8uaQ77qjCy
 7JDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788443057; x=1789047857;
 h=content-transfer-encoding:reply-to:content-type:mime-version
 :references:in-reply-to:message-id:date:subject:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=8EdCrSCj77M32Pu3SEBs0Nl7Jw7mm9Bq+OEkpl3c1Aw=;
 b=qxccTNj5ybH3CbXgfiOmGFCT62yVCJNShd2HWDH6oHOnNMHheIxwDd8gA2rVF3yQd5
 ow6zJfb6T135AmKnE9KCxfKBfNy6QsHTEii6mWc8VYmgF++1yuf0UEAIAV2xTC/4tkQJ
 Y6YqOfBjUK2+lDRzmrf58HUcMbUHdMdt/KCS6i79XxJFQIwS3PQtBryPdfhAI/c3vPoS
 2v7Os9xUJXP8f10rn43HCZt5AYF0p+iX/yMWiFR45kYdAvTYmlCB9Gc1zgysIjpb8g6s
 RL5W4HJcgVW/CoyxlhArdjBTkoUmaGfe0BxfvzhqiQgb/60xLEKxqS+pApq0/3m/6T+x
 kWSg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzm+f2SGYx+/7ZkmM6sf4pXOdJ523yGtyLWF7urhJ3dsf7UGjqS7wGE15Wnm53KG4g5+tG+nCeuvg==@lists.freedesktop.org
X-Gm-Message-State: AFuF++lPYH8WLrxVDeAL0c824P1kErQ2uKORoRJ88vGZtMjDKMnvRC9Z
 DqpWQIkLjhyCDiv28Oaw/rr9ekEDr4jNudJj/nSvEwMjpA146pzazNQn
X-Gm-Gg: AYBFou3wzZ74h3z/CysonwjOx5UjJzQgPKh069ME/jAzFBPXdyO27+1kV2mbgmH5IoM
 u1QM2dimNWbPN6zUsRL+C7Mx7aL+0gCl9HLf12e8PZoreaJNt3C6BmT9+oa6BnfGNk8Fy1EDfx9
 3HS5xa9c62JOoCJqeKeAkfUUzgnJChSqN9suubazpdnRTjGSCzZ496QJrfU6vWRHIKY1vwOxAPm
 EP0UEeZNJc0i8ayOm27NktFlDerjnBl1HEG+tLphu/QgTrQ0xD9ZBHMqxu3FS69oISHxunlZfR/
 c1mcw6loffWcvPOfunCdnsqHG4JAazKWJaBQEPtcjFw8XfE7oU4G2NpY3LDNy8kI2N+72z+RS5y
 nOtDSfnyELHqF2RcwNCpDiKqwyUvuSR0JI7Q7937PVM88yW8iq6N2Sp5bMOjuFuceenokCmB/CK
 WHR100/McXSKBBxqcaXnnW3eh0L8JGwYw69Oc6t/WY1SzaLMQvYSFDiAoA5TYrcAPwDjeq3SToO
 A==
X-Received: by 2002:a5d:6f12:0:b0:485:81fd:734c with SMTP id
 ffacd0b85a97d-485860fa3afmr542807f8f.24.1788443056987; 
 Thu, 03 Sep 2026 06:44:16 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15d9:4700:e712:9f38:603a:54e4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448e736a6sm13597080f8f.5.2026.09.03.06.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 06:44:16 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, dakr@kernel.org, ecourtney@nvidia.com,
 matthew.brost@intel.com, nat@pixelcluster.dev,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 06/11] drm/mode_config: Use dma_resv_alloc for lockdep
 annotation
Date: Thu,  3 Sep 2026 15:28:01 +0200
Message-ID: <20260903134408.105317-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903134408.105317-1-christian.koenig@amd.com>
References: <20260903134408.105317-1-christian.koenig@amd.com>
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

Replace the stack-allocated dma_resv in the lockdep annotation code
with a dynamically allocated one using dma_resv_alloc(). This aligns
with the move away from embedded dma_resv structures and towards
reference-counted dynamic allocation.

The lockdep annotation block in drmm_mode_config_init() is used to
establish lock ordering dependencies between modeset locks and dma_resv
locks. Since this only runs when CONFIG_LOCKDEP is enabled and the resv
is immediately freed after use, the change is straightforward.

If allocation fails, return -ENOMEM early. The existing dma_resv_put()
at the end of the block properly handles the cleanup.

Signed-off-by: Christian König <christian.koenig@amd.com>
Assisted-by: Claude:Sonnet 4
---
 drivers/gpu/drm/drm_mode_config.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 312d5e9675f0..de424b755c62 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -658,10 +658,12 @@ int drmm_mode_config_init(struct drm_device *dev)
 	if (IS_ENABLED(CONFIG_LOCKDEP)) {
 		struct drm_modeset_acquire_ctx modeset_ctx;
 		struct ww_acquire_ctx resv_ctx;
-		struct dma_resv resv;
+		struct dma_resv *resv;
 		int ret;
 
-		dma_resv_init(&resv);
+		resv = dma_resv_alloc();
+		if (!resv)
+			return -ENOMEM;
 
 		drm_modeset_acquire_init(&modeset_ctx, 0);
 		ret = drm_modeset_lock(&dev->mode_config.connection_mutex,
@@ -672,16 +674,16 @@ int drmm_mode_config_init(struct drm_device *dev)
 		might_fault();
 
 		ww_acquire_init(&resv_ctx, &reservation_ww_class);
-		ret = dma_resv_lock(&resv, &resv_ctx);
+		ret = dma_resv_lock(resv, &resv_ctx);
 		if (ret == -EDEADLK)
-			dma_resv_lock_slow(&resv, &resv_ctx);
+			dma_resv_lock_slow(resv, &resv_ctx);
 
-		dma_resv_unlock(&resv);
+		dma_resv_unlock(resv);
 		ww_acquire_fini(&resv_ctx);
 
 		drm_modeset_drop_locks(&modeset_ctx);
 		drm_modeset_acquire_fini(&modeset_ctx);
-		dma_resv_put(&resv);
+		dma_resv_put(resv);
 	}
 
 	return drmm_add_action_or_reset(dev, drm_mode_config_init_release,
-- 
2.43.0

