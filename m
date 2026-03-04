Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28CEEB7EB2
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 08:56:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E9210E97B;
	Wed,  4 Mar 2026 08:56:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="apQ+xcAW";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E46EF10E97B;
 Wed,  4 Mar 2026 08:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1772614593;
 bh=tHOmZtrOly7PXuz69kUC6IxLTam3g6sB+vurUrHdDvY=;
 h=From:To:Cc:Subject:Date:From;
 b=apQ+xcAWL8wwnOewNMx+1fIk435lSkYJAvOxx53Jb9Dib2reawA6o3cdPHDd2FZ4d
 7egd2VsJKFQw3lc3KaDLh+rVT4aFbeCO45rcehqy/5O+gaW5+ws0e9nas7azTpW2rH
 HiKOQ7uXduuRoEdXVdYf5CoJUsLg6eWNQTI0trFPTrY7Q1UcqI889r/OGWmfMQRySr
 Vg/eC2+9oNzcp/N2KYjqSNMLtAd2WystfLVLR8cgEac0vEClrDkPH1eQbGV3xi/Ftd
 8lUcQb3fXsyZz6ZIeET3UjBEWnH+300TbGTV2hCd4XOMn4cnRWwNYoae99O3Nq07E5
 HfPPLLCmOCfmg==
From: Maarten Lankhorst <dev@lankhorst.se>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>, kernel test robot <lkp@intel.com>
Subject: [PATCH v2] drm/ttm/tests: Fix build failure on PREEMPT_RT
Date: Wed,  4 Mar 2026 09:56:16 +0100
Message-ID: <20260304085616.1216961-1-dev@lankhorst.se>
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
Changes since v1:
- Use the correct locking primitive (Jouni)

 drivers/gpu/drm/ttm/tests/ttm_bo_test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
index d468f83220720..f3103307b5df9 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
@@ -222,13 +222,13 @@ static void ttm_bo_reserve_interrupted(struct kunit *test)
 		KUNIT_FAIL(test, "Couldn't create ttm bo reserve task\n");
 
 	/* Take a lock so the threaded reserve has to wait */
-	mutex_lock(&bo->base.resv->lock.base);
+	dma_resv_lock(bo->base.resv, NULL);
 
 	wake_up_process(task);
 	msleep(20);
 	err = kthread_stop(task);
 
-	mutex_unlock(&bo->base.resv->lock.base);
+	dma_resv_unlock(bo->base.resv);
 
 	KUNIT_ASSERT_EQ(test, err, -ERESTARTSYS);
 }
-- 
2.51.0

