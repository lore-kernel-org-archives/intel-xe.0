Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96FAFD8FC4
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 15:12:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6131010E97D;
	Thu, 26 Feb 2026 15:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="I4XAmEjp";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4876B10E97D;
 Thu, 26 Feb 2026 15:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1772118754;
 bh=2AjPQRmfHERL0DlpebWKgoN0aziK4CtcrdIZFI3vp5c=;
 h=From:To:Cc:Subject:Date:From;
 b=I4XAmEjpKHQD/1f7GYRHBHJJZiR5jf9rLQ0T/I4SRRBQSaPHbClJu36ylVKo5Ks7j
 1gvBwhjjhy7eN/B4xHOnjuOT42ORbp/iAqqKPC3uD1HroKFUeuwlY9QDxvMfzO3raJ
 X09SKDdNrhw9Xq0rnu+AXlaiAXBjBAuHPDZV8Bd/aVbZdYnHT7SjEFpG+8LF1HQTKm
 1AqfX7BuAs88dB082jL47niyQC5Bprs/QfwjJL16DACthOftI0lXeqJJz0IUcDGRDT
 YWRKzFujYGN1Up4kBxPBba+ZFWkwzSAgK6fM12KHpbGs0HYsHijStYjNE+Wg3/74RF
 P7HdDHXdr0N7w==
From: Maarten Lankhorst <dev@lankhorst.se>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Maarten Lankhorst <dev@lankhorst.se>,
 kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/ttm/tests: Fix build failure on PREEMPT_RT
Date: Thu, 26 Feb 2026 16:12:28 +0100
Message-ID: <20260226151228.256003-1-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
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

Fix a compile error in the kunit tests when CONFIG_PREEMPT_RT is
enabled, and the normal mutex is converted into a rtmutex.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202602261547.3bM6yVAS-lkp@intel.com/
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
index d468f83220720..2ba5ddf2b1c9e 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
@@ -222,13 +222,13 @@ static void ttm_bo_reserve_interrupted(struct kunit *test)
 		KUNIT_FAIL(test, "Couldn't create ttm bo reserve task\n");
 
 	/* Take a lock so the threaded reserve has to wait */
-	mutex_lock(&bo->base.resv->lock.base);
+	ww_mutex_lock(&bo->base.resv->lock, NULL);
 
 	wake_up_process(task);
 	msleep(20);
 	err = kthread_stop(task);
 
-	mutex_unlock(&bo->base.resv->lock.base);
+	ww_mutex_unlock(&bo->base.resv->lock);
 
 	KUNIT_ASSERT_EQ(test, err, -ERESTARTSYS);
 }
-- 
2.51.0

