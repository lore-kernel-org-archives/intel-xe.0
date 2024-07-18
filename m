Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC29C41513
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 20:32:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE85D10EB08;
	Thu, 18 Jul 2024 20:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NNGCLqza";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054F310E0EF
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 20:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721334718; x=1752870718;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=jjFMzcJIflShG5TuwkuIOc9v2UNmfuWCDwb4FE7ELW0=;
 b=NNGCLqzaIXKkAWMpp1YyilNhNIdjejP0rpNm3vPBEyDupEB+UtBT7jEo
 7V5rO/C1H7/4KjT55YrZau8sisOgI4J8AjpztNX3AqTeEKRN5JkNQyIPd
 U4vCGCUwDmIdc4IiJFyRQ+3U6CGbEDWvMzbP2Gm+37imISmV6r6bSu7Kk
 PJEphvaQrkq5fV/NI7gTkaLzPghJ+x1C0mAyZL6UHBjVGlsPTr3DiEOC9
 1VOKWdb9g4ybg1sppvVaMDv7SK+foFtt3eJHidR78tlm8oB5jG/Ko9CCG
 jcKXdElY7EJTZuFB15UXgvSILbaomTHeDfN6TepmDhTpQEmkHnktLe0T+ g==;
X-CSE-ConnectionGUID: PaieYpEaSqi5MyuWYd77QQ==
X-CSE-MsgGUID: q3GHR2AvSl+sXKbCfb9ifA==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="19059944"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="19059944"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 13:31:57 -0700
X-CSE-ConnectionGUID: pWFKVshjQrWAPX1oJKKN8Q==
X-CSE-MsgGUID: Ql6HjQsASDOeadQpaGCbnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="81520622"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 13:31:57 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 1/4] drm/xe: Move part of xe_file cleanup to a helper
Date: Thu, 18 Jul 2024 13:31:49 -0700
Message-Id: <20240718203152.3566929-2-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20240718203152.3566929-1-umesh.nerlige.ramappa@intel.com>
References: <20240718203152.3566929-1-umesh.nerlige.ramappa@intel.com>
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

In order to make xe_file ref counted, move destruction of xe_file
members to a helper.

v2: Move xe_vm_close_and_put back into xe_file_close (Matt)

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index f51d456d15f7..0a7478d1ee63 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -93,9 +93,25 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 	return 0;
 }
 
+static void xe_file_destroy(struct xe_file *xef)
+{
+	struct xe_device *xe = xef->xe;
+
+	xa_destroy(&xef->exec_queue.xa);
+	mutex_destroy(&xef->exec_queue.lock);
+	xa_destroy(&xef->vm.xa);
+	mutex_destroy(&xef->vm.lock);
+
+	spin_lock(&xe->clients.lock);
+	xe->clients.count--;
+	spin_unlock(&xe->clients.lock);
+
+	xe_drm_client_put(xef->client);
+	kfree(xef);
+}
+
 static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 {
-	struct xe_device *xe = to_xe_device(dev);
 	struct xe_file *xef = file->driver_priv;
 	struct xe_vm *vm;
 	struct xe_exec_queue *q;
@@ -111,21 +127,12 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 		xe_exec_queue_kill(q);
 		xe_exec_queue_put(q);
 	}
-	xa_destroy(&xef->exec_queue.xa);
-	mutex_destroy(&xef->exec_queue.lock);
 	mutex_lock(&xef->vm.lock);
 	xa_for_each(&xef->vm.xa, idx, vm)
 		xe_vm_close_and_put(vm);
 	mutex_unlock(&xef->vm.lock);
-	xa_destroy(&xef->vm.xa);
-	mutex_destroy(&xef->vm.lock);
 
-	spin_lock(&xe->clients.lock);
-	xe->clients.count--;
-	spin_unlock(&xe->clients.lock);
-
-	xe_drm_client_put(xef->client);
-	kfree(xef);
+	xe_file_destroy(xef);
 }
 
 static const struct drm_ioctl_desc xe_ioctls[] = {
-- 
2.38.1

