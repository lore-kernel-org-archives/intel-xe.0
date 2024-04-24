Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E26C41513
	for <intel-xe@archiver.kernel.org>; Sun, 28 Apr 2024 21:33:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8DF6112A1F;
	Sun, 28 Apr 2024 21:33:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="JQWB65E7";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F18931139D0
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 10:07:17 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1713953234; bh=TngqQV1owfBcq7nJi2GmZBEiNgUVDcv465LML0f9pqc=;
 h=From:To:Cc:Subject:Date:From;
 b=JQWB65E7BhUqhDkYsmabmWUBtrnIOGOdFttr235qhTaYOne2MSd1AjMpwKrJCG5GI
 MYJdQW/c0NBVB3Xb1Z4ADXRPi1Hk7x3rrGwL3kl5x4Ohelar9udrhD1n68veKq+ZoS
 OoBOEgkbq6QtWS+IfFNsa+IeYqXCzIaGxzjoJ5+S8K2/RnIBw/4FLtmDiyLTYD0KvT
 d9j8YHKLUQ/aUL4HoaqAstrFUhNeprhVRu4tfSu+0KoKUVBE6RNd58JkPyVdUv3INT
 ghoW0vXLLfwXLMpZMkQOFL4gaR/zSoOEZUiVZadOVgf2l1Dw0RGf3zOHysupPhBNUF
 LAWdC4c2/UreA==
Received: from fkassabri-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by fkassabri-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 43OA77wE269539
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 24 Apr 2024 13:07:07 +0300
Received: (from fkassabri@localhost)
 by fkassabri-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 43OA77MP269538; 
 Wed, 24 Apr 2024 13:07:07 +0300
From: Farah Kassabri <fkassabri@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: osharabi@habana.ai, Farah Kassabri <fkassabri@habana.ai>
Subject: [PATCH 1/2] drm: print top commit sha after loading the driver
Date: Wed, 24 Apr 2024 13:07:05 +0300
Message-Id: <20240424100706.269523-1-fkassabri@habana.ai>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 28 Apr 2024 21:33:52 +0000
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

Add the last driver sha to the existing log message
which prints the drm device info.

Signed-off-by: Farah Kassabri <fkassabri@habana.ai>
---
 drivers/gpu/drm/drm_drv.c | 6 +++---
 include/drm/drm_drv.h     | 2 ++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 535b624d4c9d..e0f7af1b6ec3 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -947,10 +947,10 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 	}
 	drm_panic_register(dev);
 
-	DRM_INFO("Initialized %s %d.%d.%d %s for %s on minor %d\n",
+	DRM_INFO("Initialized %s %d.%d.%d%s %s for %s on minor %d\n",
 		 driver->name, driver->major, driver->minor,
-		 driver->patchlevel, driver->date,
-		 dev->dev ? dev_name(dev->dev) : "virtual device",
+		 driver->patchlevel, driver->git_sha ? driver->git_sha : "",
+		 driver->date, dev->dev ? dev_name(dev->dev) : "virtual device",
 		 dev->primary ? dev->primary->index : dev->accel->index);
 
 	goto out_unlock;
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 8878260d7529..7578a1f4ce74 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -407,6 +407,8 @@ struct drm_driver {
 	int minor;
 	/** @patchlevel: driver patch level */
 	int patchlevel;
+	/** @git_sha: driver last commit sha */
+	char *git_sha;
 	/** @name: driver name */
 	char *name;
 	/** @desc: driver description */
-- 
2.34.1

