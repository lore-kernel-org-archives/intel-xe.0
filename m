Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28B8C25B7C
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 18:09:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C2D10E1E2;
	Wed, 29 May 2024 18:09:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="By0smr5G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56A010E1E2
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 18:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717006142; x=1748542142;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MdPBxL5fLBV9b5sTn+NFykKoF4Ins+w+FNikM6mORaw=;
 b=By0smr5GjcX90KEHxef7Qnc+4ba13fj+AeuAqlkDawNodpsK2cz8gbaT
 DgWzk1SZbLOlUHbyc7vqXBIazFTqzq5vepCoKV5Ls5vtWJnVBlSCzKR8M
 PAYacncpFggjGDq1tBPPrUjPnyk/YtL3mQvfLq6kNbrQEEG7ROUzKHFA4
 50S2yy9zmnIMC6sHR6HlMcGZcGBP01KDA1AWVUV5jkiuyF/4rywV3qAJl
 RA4OIUGAzyhZZRxVx843GcsoHAbMDK65nO+XpoN+rRM1nkMms0g6oVF6k
 EPzaqOgTi7QCaOFd8OIu4vw6pGc3SqibH6V0bUczfWjB/xtdQP4dIs7ta A==;
X-CSE-ConnectionGUID: s70psQ2HSSGUNwMS9UJIOw==
X-CSE-MsgGUID: UX0B9t5GR/es3xd3dKXBcw==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13280490"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="13280490"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 11:09:01 -0700
X-CSE-ConnectionGUID: aE97zrWmQPG0ptzqrpCpeg==
X-CSE-MsgGUID: n5vzBFYTQhKuocGiiaK6Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="58690760"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 11:09:01 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Remove unwanted mutex locking
Date: Wed, 29 May 2024 11:08:51 -0700
Message-ID: <20240529180851.10871-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
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

Do not hold xef->exec_queue.lock mutex while parsing the xarray
xef->exec_queue.xa in xe_file_close() as it is not needed and
will cause an unwanted dependency between this lock and the vm->lock.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index f04b11e45c2d..4cca16f2d4ed 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -96,12 +96,11 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 	struct xe_exec_queue *q;
 	unsigned long idx;
 
-	mutex_lock(&xef->exec_queue.lock);
+	/* No locking needed here */
 	xa_for_each(&xef->exec_queue.xa, idx, q) {
 		xe_exec_queue_kill(q);
 		xe_exec_queue_put(q);
 	}
-	mutex_unlock(&xef->exec_queue.lock);
 	xa_destroy(&xef->exec_queue.xa);
 	mutex_destroy(&xef->exec_queue.lock);
 	mutex_lock(&xef->vm.lock);
-- 
2.43.0

