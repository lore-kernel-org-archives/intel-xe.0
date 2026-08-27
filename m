Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68370C61DD7
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 12:49:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE02310F01A;
	Thu, 27 Aug 2026 12:49:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HbuLmQih";
	dkim-atps=neutral
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9363A10F006
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 12:49:17 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-496bb7cdf51so8922045e9.2
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 05:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787834956; x=1788439756; darn=lists.freedesktop.org;
 h=content-transfer-encoding:reply-to:content-type:mime-version
 :references:in-reply-to:message-id:date:subject:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=xG6mQ2QRSpU2x70IBi5oSep3ZvnHE7Nrzjk2RVOwrIk=;
 b=HbuLmQihjmM3dkruWZArA4tXHW+sE0cSZRPfHhJ8Ma3j+8ZJkq9MOvN4NAorUafFHQ
 KPO+TDYHEuKwpwG2NQk+502rUngTtL9T+NCiFAWh8o4BHayMLLUYZDuGwTGyRSO34MUu
 O+oUjO6+VJA9rMv7d0YNibGfK8lyognX1BXKSBaCgOuRaoJpJUgpSxI/VcB3ICO86zT9
 9N7O7OhjMgt2ug25IHKi3EDzKaYLbsDnQJYeVXPABIFc3k+CJapepFGGzgMUKb+CmXbb
 2HZK5gOiAZ/9yLGr/QgZB1MbWIv5VGWhBvwgY2puGdaklWRJgCzm5KZbB/l+f+LXa4UJ
 itqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787834956; x=1788439756;
 h=content-transfer-encoding:reply-to:content-type:mime-version
 :references:in-reply-to:message-id:date:subject:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=xG6mQ2QRSpU2x70IBi5oSep3ZvnHE7Nrzjk2RVOwrIk=;
 b=iweu9b9/0lxkAgYihqZ8/PHB+XxuX4/J5PPAzMu/orZTvVCtKOhS4FfUzS9TSWQweX
 iQuUXn91Aa4MkD9zJQ3/IWEDJeSDYvzKnbq7BQMkGPZPnWST0KsXppPGRtHERXAo265H
 qPAc+zkL9QA9STj0LlsaNXLOzW9fnX5MQn2wmOR0xzjuIKmK+8muHDlMMNbAVXIAmGsW
 4bgqxQTmQYc2hg5mjSyL1WDPL7kDeaXW0mHWpD2l/RmOsKYt/EhnTODdNo0d7GAMPrZS
 AcKtb8mRlrpbN+yiN0NdcSXpOoy0fqWH6g7p0KTBU0S3hQ9dzPtLSVr50oG86US1AONs
 1CEw==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro8ZU64mVLtT2VNSFPc43WD5sioNxV66A2OZwQuWDKtgzBm5NPg2y8McuHJrLk29Ec8PlfQAOB/2g==@lists.freedesktop.org
X-Gm-Message-State: AFuF++nREHxvZPo0Myato+y+Gsjie88CpoKGLzj7luPbQFfCjbBKc9kH
 4mTGL+QUJfvd6I6b72In6f5+WAmVoAiVwh4oaMPJirM+Pt6WU6V49jBt
X-Gm-Gg: AR+sD12h35JjQyJ2n+ECxR/L3ObJnA/gEMpOM73ycwf3qm0OH8GyHN+87NQlRREhOS3
 At1VNuvEmw0OYwxsS44p5wTE5tg486ZeGr//nK9Yj8mOzwYwDKUZObwFSJnUp5519hEhaCnRzp4
 jX54afSmCAb7LVFcgvdBt6X7dy04KSXDgDhMDfEljlTuUrgZoTNS+ML8v0JxfJHtfoC0/FT4lGm
 fcEOIFgrL3gvc3sy/8vMTmZ5siWfGpGYBoQlMDJP73YCVKUj9gVAeKqQFw1+XowAxpFdrZcs+Gx
 6OS6j2RohxROGMj4WIUbhOAZRl1Ws6HqRiU3HSYgvzTRt0jFAGlApZ0O5JG6wgkQFzmsu5Okptj
 llmTNK/cpw/rR1ZoOV+x2ZOT4Lvjmbg8olScgS5FUdisCE7U0kmy95veIIKXt59m6OHaF60zRrU
 X7d5o1xFhawWzfR2G1TPpJfCQ+gSfwN+P8VkpAKcO8gVNcFwyrrG9hsRFDLHnN3/bTA2RSJl2ZT
 w==
X-Received: by 2002:a05:600c:c0da:b0:499:83f1:398 with SMTP id
 5b1f17b1804b1-499dc820705mr162990835e9.9.1787834955856; 
 Thu, 27 Aug 2026 05:49:15 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1524:4300:a4b8:720e:f64f:4778])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b465226d8sm52089985e9.0.2026.08.27.05.49.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 05:49:15 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, dakr@kernel.org, ecourtney@nvidia.com,
 matthew.brost@intel.com, nat@pixelcluster.dev,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 02/10] dma-buf/tests: Convert st-dma-resv tests to use
 dma_resv_alloc
Date: Thu, 27 Aug 2026 14:38:50 +0200
Message-ID: <20260827124910.2245-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827124910.2245-1-christian.koenig@amd.com>
References: <20260827124910.2245-1-christian.koenig@amd.com>
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

Update all test cases in st-dma-resv.c to use the new dma_resv_alloc()
API instead of stack-allocating dma_resv objects. This demonstrates the
proper usage of the new allocation and reference counting interface.

All five test functions now:
- Use dma_resv_alloc() to allocate objects
- Check for allocation failure with KUNIT_ASSERT_NOT_NULL
- Clean up with dma_resv_put() which handles freeing

This change also provides better test coverage for the reference
counting implementation.

Signed-off-by: Christian König <christian.koenig@amd.com>
Assisted-by: Claude:Sonnet 4
---
 drivers/dma-buf/st-dma-resv.c | 90 +++++++++++++++++++----------------
 1 file changed, 50 insertions(+), 40 deletions(-)

diff --git a/drivers/dma-buf/st-dma-resv.c b/drivers/dma-buf/st-dma-resv.c
index 2c43d2d2b016..b843d9041782 100644
--- a/drivers/dma-buf/st-dma-resv.c
+++ b/drivers/dma-buf/st-dma-resv.c
@@ -41,7 +41,7 @@ static struct dma_fence *alloc_fence(void)
 
 static void test_sanitycheck(struct kunit *test)
 {
-	struct dma_resv resv;
+	struct dma_resv *resv;
 	struct dma_fence *f;
 	int r;
 
@@ -53,20 +53,22 @@ static void test_sanitycheck(struct kunit *test)
 	dma_fence_signal(f);
 	dma_fence_put(f);
 
-	dma_resv_init(&resv);
-	r = dma_resv_lock(&resv, NULL);
+	resv = dma_resv_alloc();
+	KUNIT_ASSERT_NOT_NULL(test, resv);
+
+	r = dma_resv_lock(resv, NULL);
 	if (r)
 		KUNIT_FAIL(test, "Resv locking failed\n");
 	else
-		dma_resv_unlock(&resv);
-	dma_resv_put(&resv);
+		dma_resv_unlock(resv);
+	dma_resv_put(resv);
 }
 
 static void test_signaling(struct kunit *test)
 {
 	const struct dma_resv_usage_param *param = test->param_value;
 	enum dma_resv_usage usage = param->usage;
-	struct dma_resv resv;
+	struct dma_resv *resv;
 	struct dma_fence *f;
 	int r;
 
@@ -75,33 +77,35 @@ static void test_signaling(struct kunit *test)
 
 	dma_fence_enable_signaling(f);
 
-	dma_resv_init(&resv);
-	r = dma_resv_lock(&resv, NULL);
+	resv = dma_resv_alloc();
+	KUNIT_ASSERT_NOT_NULL(test, resv);
+
+	r = dma_resv_lock(resv, NULL);
 	if (r) {
 		KUNIT_FAIL(test, "Resv locking failed");
 		goto err_free;
 	}
 
-	r = dma_resv_reserve_fences(&resv, 1);
+	r = dma_resv_reserve_fences(resv, 1);
 	if (r) {
 		KUNIT_FAIL(test, "Resv shared slot allocation failed");
 		goto err_unlock;
 	}
 
-	dma_resv_add_fence(&resv, f, usage);
-	if (dma_resv_test_signaled(&resv, usage)) {
+	dma_resv_add_fence(resv, f, usage);
+	if (dma_resv_test_signaled(resv, usage)) {
 		KUNIT_FAIL(test, "Resv unexpectedly signaled");
 		goto err_unlock;
 	}
 	dma_fence_signal(f);
-	if (!dma_resv_test_signaled(&resv, usage)) {
+	if (!dma_resv_test_signaled(resv, usage)) {
 		KUNIT_FAIL(test, "Resv not reporting signaled");
 		goto err_unlock;
 	}
 err_unlock:
-	dma_resv_unlock(&resv);
+	dma_resv_unlock(resv);
 err_free:
-	dma_resv_put(&resv);
+	dma_resv_put(resv);
 	dma_fence_put(f);
 }
 
@@ -111,7 +115,7 @@ static void test_for_each(struct kunit *test)
 	enum dma_resv_usage usage = param->usage;
 	struct dma_resv_iter cursor;
 	struct dma_fence *f, *fence;
-	struct dma_resv resv;
+	struct dma_resv *resv;
 	int r;
 
 	f = alloc_fence();
@@ -119,23 +123,25 @@ static void test_for_each(struct kunit *test)
 
 	dma_fence_enable_signaling(f);
 
-	dma_resv_init(&resv);
-	r = dma_resv_lock(&resv, NULL);
+	resv = dma_resv_alloc();
+	KUNIT_ASSERT_NOT_NULL(test, resv);
+
+	r = dma_resv_lock(resv, NULL);
 	if (r) {
 		KUNIT_FAIL(test, "Resv locking failed");
 		goto err_free;
 	}
 
-	r = dma_resv_reserve_fences(&resv, 1);
+	r = dma_resv_reserve_fences(resv, 1);
 	if (r) {
 		KUNIT_FAIL(test, "Resv shared slot allocation failed");
 		goto err_unlock;
 	}
 
-	dma_resv_add_fence(&resv, f, usage);
+	dma_resv_add_fence(resv, f, usage);
 
 	r = -ENOENT;
-	dma_resv_for_each_fence(&cursor, &resv, usage, fence) {
+	dma_resv_for_each_fence(&cursor, resv, usage, fence) {
 		if (!r) {
 			KUNIT_FAIL(test, "More than one fence found");
 			goto err_unlock;
@@ -158,9 +164,9 @@ static void test_for_each(struct kunit *test)
 	}
 	dma_fence_signal(f);
 err_unlock:
-	dma_resv_unlock(&resv);
+	dma_resv_unlock(resv);
 err_free:
-	dma_resv_put(&resv);
+	dma_resv_put(resv);
 	dma_fence_put(f);
 }
 
@@ -170,7 +176,7 @@ static void test_for_each_unlocked(struct kunit *test)
 	enum dma_resv_usage usage = param->usage;
 	struct dma_resv_iter cursor;
 	struct dma_fence *f, *fence;
-	struct dma_resv resv;
+	struct dma_resv *resv;
 	int r;
 
 	f = alloc_fence();
@@ -178,25 +184,27 @@ static void test_for_each_unlocked(struct kunit *test)
 
 	dma_fence_enable_signaling(f);
 
-	dma_resv_init(&resv);
-	r = dma_resv_lock(&resv, NULL);
+	resv = dma_resv_alloc();
+	KUNIT_ASSERT_NOT_NULL(test, resv);
+
+	r = dma_resv_lock(resv, NULL);
 	if (r) {
 		KUNIT_FAIL(test, "Resv locking failed");
 		goto err_free;
 	}
 
-	r = dma_resv_reserve_fences(&resv, 1);
+	r = dma_resv_reserve_fences(resv, 1);
 	if (r) {
 		KUNIT_FAIL(test, "Resv shared slot allocation failed");
-		dma_resv_unlock(&resv);
+		dma_resv_unlock(resv);
 		goto err_free;
 	}
 
-	dma_resv_add_fence(&resv, f, usage);
-	dma_resv_unlock(&resv);
+	dma_resv_add_fence(resv, f, usage);
+	dma_resv_unlock(resv);
 
 	r = -ENOENT;
-	dma_resv_iter_begin(&cursor, &resv, usage);
+	dma_resv_iter_begin(&cursor, resv, usage);
 	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 		if (!r) {
 			KUNIT_FAIL(test, "More than one fence found");
@@ -231,7 +239,7 @@ static void test_for_each_unlocked(struct kunit *test)
 	dma_resv_iter_end(&cursor);
 	dma_fence_signal(f);
 err_free:
-	dma_resv_put(&resv);
+	dma_resv_put(resv);
 	dma_fence_put(f);
 }
 
@@ -240,7 +248,7 @@ static void test_get_fences(struct kunit *test)
 	const struct dma_resv_usage_param *param = test->param_value;
 	enum dma_resv_usage usage = param->usage;
 	struct dma_fence *f, **fences = NULL;
-	struct dma_resv resv;
+	struct dma_resv *resv;
 	int r, i;
 
 	f = alloc_fence();
@@ -248,24 +256,26 @@ static void test_get_fences(struct kunit *test)
 
 	dma_fence_enable_signaling(f);
 
-	dma_resv_init(&resv);
-	r = dma_resv_lock(&resv, NULL);
+	resv = dma_resv_alloc();
+	KUNIT_ASSERT_NOT_NULL(test, resv);
+
+	r = dma_resv_lock(resv, NULL);
 	if (r) {
 		KUNIT_FAIL(test, "Resv locking failed");
 		goto err_resv;
 	}
 
-	r = dma_resv_reserve_fences(&resv, 1);
+	r = dma_resv_reserve_fences(resv, 1);
 	if (r) {
 		KUNIT_FAIL(test, "Resv shared slot allocation failed");
-		dma_resv_unlock(&resv);
+		dma_resv_unlock(resv);
 		goto err_resv;
 	}
 
-	dma_resv_add_fence(&resv, f, usage);
-	dma_resv_unlock(&resv);
+	dma_resv_add_fence(resv, f, usage);
+	dma_resv_unlock(resv);
 
-	r = dma_resv_get_fences(&resv, usage, &i, &fences);
+	r = dma_resv_get_fences(resv, usage, &i, &fences);
 	if (r) {
 		KUNIT_FAIL(test, "get_fences failed");
 		goto err_free;
@@ -282,7 +292,7 @@ static void test_get_fences(struct kunit *test)
 		dma_fence_put(fences[i]);
 	kfree(fences);
 err_resv:
-	dma_resv_put(&resv);
+	dma_resv_put(resv);
 	dma_fence_put(f);
 }
 
-- 
2.43.0

