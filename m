Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908F3C7EE21
	for <intel-xe@archiver.kernel.org>; Mon,  1 May 2023 07:51:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0563A10E303;
	Mon,  1 May 2023 07:51:15 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A824B10E333
 for <intel-xe@lists.freedesktop.org>; Mon,  1 May 2023 07:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682927472; x=1714463472;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DqNzN/uSHWqR/PdjW8dwsE/LI0huyCcgosqRdc+aUms=;
 b=IdrGn9z0N4pRO15A3soZfuIgF/7O19PArH4WXF1JZEU8V4J1nfORQGIB
 Fw9TV5r4e5abjZGs5r+BYWpQ8b79VH8a8rj9RNy5n7VYwOmyVWry5+/pQ
 u9QJfHxgqLh4qE9utqW3TFiX1Ybe+mbQytQuK1XxYmUJr1easBIga4EXv
 jsAOw4KHO5Uv9k1790wcJszn/z0LkxeMV0ep7BnA4mi3ZZsjt/0EQoe+v
 pF+6Af9x+ab0LAO5ONXYknFpIu8OZ6KeHPPXRx1GXPrb6WN+D8/wO/wCc
 Bwzq1c5+NEojcpnjAlNQpZRxGLsvTPEUH09ibRsHaLQeEn5sgaUkMpswg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="346910708"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; d="scan'208";a="346910708"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 00:51:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="870095201"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; d="scan'208";a="870095201"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 00:51:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  1 May 2023 00:50:50 -0700
Message-Id: <20230501075114.3108352-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230501075114.3108352-1-matthew.brost@intel.com>
References: <20230501075114.3108352-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 06/30] drm/xe: Ensure LR engines are not
 persistent
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

With our ref counting scheme LR engines only close properly if not
persistent, ensure that LR engines are non-persistent.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_engine.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index d1e84d7adbd4..91600b1e8249 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -596,7 +596,9 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
 			return -ENOENT;
 
 		e = xe_engine_create(xe, vm, logical_mask,
-				     args->width, hwe, ENGINE_FLAG_PERSISTENT);
+				     args->width, hwe,
+				     xe_vm_no_dma_fences(vm) ? 0 :
+				     ENGINE_FLAG_PERSISTENT);
 		xe_vm_put(vm);
 		if (IS_ERR(e))
 			return PTR_ERR(e);
-- 
2.34.1

