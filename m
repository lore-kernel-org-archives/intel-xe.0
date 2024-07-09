Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10AB7C3271E
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 00:28:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB3B010E211;
	Tue,  9 Jul 2024 00:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AZnJt/ur";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ECD810E217
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 00:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720484920; x=1752020920;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=d10EuoXec38SZxnUaAJHbdW0LNOBamcwNUGe0aSQRzY=;
 b=AZnJt/urltmYzHR4R+a0Z4fmyy/r+Ee8CT0Z12OphOsJs0Z7TAp6ioGy
 rzToocefMJfvgMZisYzlHYNoBFdNwHImgPZdj3WjxCeF5me3Ds2KO6uiw
 9s4hGP7dyexV3mY97maJ9QhzaKfEiW9EC98zAV/nYCgAVAWyUimCcm2Mj
 1EtTB/aHLcAoBatX32d0+kdnO1sHKHiiFLsSIVOIPzKE+sv8UHp0QssuN
 jGDbEgSPDeebMahpWxQFeODbbgvg47B87fSfxRrcumCJF0ECRx/rXV54D
 +vVo4bxd/8zIoQdMyvqrG3tfJ13bmlpB8De6GwmS7faMHSqwG24vHrI4E w==;
X-CSE-ConnectionGUID: MFoi8vt/Te6ZV1DhmdHLZA==
X-CSE-MsgGUID: icpgTt3KTQSS05xTHKWB/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="29105702"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="29105702"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 17:28:39 -0700
X-CSE-ConnectionGUID: o5ikj2FdSuON/1pZAqcv3g==
X-CSE-MsgGUID: RfPXmhVTRYihdRu+mnmozg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="47630945"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 17:28:39 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 lucas.demarchi@intel.com
Subject: [PATCH v2 1/4] drm/xe: Move part of xe_file cleanup to a helper
Date: Mon,  8 Jul 2024 17:28:32 -0700
Message-Id: <20240709002835.3372618-2-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20240709002835.3372618-1-umesh.nerlige.ramappa@intel.com>
References: <20240709002835.3372618-1-umesh.nerlige.ramappa@intel.com>
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
---
 drivers/gpu/drm/xe/xe_device.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 64aea962afd5..c5464ad5d908 100644
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

