Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D674CCD18B
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 08:01:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E63910E55D;
	Wed, 18 Sep 2024 08:01:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fi1gTfJw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B1DE10E565
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 08:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726646512; x=1758182512;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o8SAHOLfb11atgCqsxagwknZt/D8LmN4VNu0mMQYojw=;
 b=Fi1gTfJwWowFcO3qfGSC+PFSjjqAYEEVv5w9OGCg9M/5/KfhxFMVS6Pe
 9V0emPJBt2GGIJTgZlTPjDaPn78gGw+2DR2idX8zVDZz6gPln4Tv55Qzv
 eDepBsZTAs9KDKa/B55EHBi/KSD27lziBVIPDwnoEv1qp3g51+Ck9Ufes
 /G6yagNUvUquFS9MG1jT0WAKVnN0YIJHURn/ceHHLeVak3aSm+UYTDyMk
 0xfVp+jf0O46gmsb4VKlvqwXPzo//UMf43Lb6t432kL/ZP0CYZsnJjykA
 ApOLE5eBYvE6sis06VWedVjxHhpaCSDWg/GdLg6ofWsNA3cfgWH98f/EX Q==;
X-CSE-ConnectionGUID: 5C4ldE2lQIKDD5xMKxX2uw==
X-CSE-MsgGUID: w0EGmfKaRFOgbyHUoqr7kA==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="36113154"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="36113154"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 01:01:51 -0700
X-CSE-ConnectionGUID: nW4DUMmcRVeOEwuLUZtIRA==
X-CSE-MsgGUID: 1CDeTPMQQyqtfYmHKiTckA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="74458164"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 01:01:49 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH] drm/xe: Decrement client count immediately on file close
Date: Wed, 18 Sep 2024 13:41:50 +0530
Message-Id: <20240918081150.280055-1-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.34.1
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

Decrement the client count immediately on file close. It is not required
to be deferred to the resource cleanup function. Otherwise there will be
a small time window, where there will be a non-zero client count even
after closing all open file handles.
This affects ccs_mode(xe_compute) igt tests as these tests try to change
the ccs_mode immediately after closing all file handles, but the driver
rejects the ccs_mode change request as it sees a non-zero client count.

Fixes: ce8c161cbad4 ("drm/xe: Add ref counting for xe_file")
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 4d3c794f134c..3bccea6212ff 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -107,17 +107,12 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 static void xe_file_destroy(struct kref *ref)
 {
 	struct xe_file *xef = container_of(ref, struct xe_file, refcount);
-	struct xe_device *xe = xef->xe;
 
 	xa_destroy(&xef->exec_queue.xa);
 	mutex_destroy(&xef->exec_queue.lock);
 	xa_destroy(&xef->vm.xa);
 	mutex_destroy(&xef->vm.lock);
 
-	spin_lock(&xe->clients.lock);
-	xe->clients.count--;
-	spin_unlock(&xe->clients.lock);
-
 	xe_drm_client_put(xef->client);
 	kfree(xef->process_name);
 	kfree(xef);
@@ -178,6 +173,10 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 
 	xe_file_put(xef);
 
+	spin_lock(&xe->clients.lock);
+	xe->clients.count--;
+	spin_unlock(&xe->clients.lock);
+
 	xe_pm_runtime_put(xe);
 }
 
-- 
2.34.1

