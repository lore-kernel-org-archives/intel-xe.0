Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B37DC04FDF
	for <intel-xe@archiver.kernel.org>; Thu,  3 Aug 2023 15:30:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B69810E61A;
	Thu,  3 Aug 2023 15:30:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A99D10E61B
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Aug 2023 15:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691076627; x=1722612627;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DiQaeaL1NeBURWL7ksjEu15jZJu7/2fWpGfn9dni1Tc=;
 b=CdRUC4JIJud7DytrzoXBfPFwqV1k+WO1Z1Pnfgg7OCCCGUXHajxkukO/
 QYePPCohTOSefEuNu819KmKrXh1rfa517ZG4ceic3ieJGHVbAvEJo2TsH
 jNGtlXwxTaxLJzCzc6eDqcJf4uhvVOUz0NW2Q9f0cztgJW+B36Q8WuPuJ
 POSRWQGx9tsqTNEBd3S2veJwetdkTFcN1hhg8MYuYs5njWmhucS3cFSTe
 gVp4+ifPXoiRi7PT1ZZ8lHS7wS7NKFFxf0bppGBA8dIvvjNeBkKabaJ+X
 zPCy+7b2WtkxZp7egJeJfhrGs8iMjHl8Pt/2gtqvCLm1j/+d7v4rnw8Jm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="372664378"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; d="scan'208";a="372664378"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 08:30:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="764687350"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; d="scan'208";a="764687350"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 08:30:24 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  3 Aug 2023 08:30:16 -0700
Message-ID: <20230803153016.94282-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4] drm/xe: Make explicit that exec uAPI expects
 canonical addresses
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

The batch buffer address in exec uAPI is used when emitting
MI_BATCH_BUFFER_START that expect canonical addresses in future
platforms, for current ones the bits above 57 for PVC and 47 for
other platforms are ignored.

So the safest approach is to require canonical address for all
platforms supported by Xe to avoid uAPI breaks.

v2:
- fix check for non parallel engines

v3:
- fix style

v4:
- replace XE_IOCTL_ERR by XE_IOCTL_DBG

BSpec: 60223 59475 45718
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  7 +++++++
 drivers/gpu/drm/xe/xe_device.h |  2 ++
 drivers/gpu/drm/xe/xe_exec.c   | 16 ++++++++++++++++
 include/uapi/drm/xe_drm.h      |  4 ++--
 4 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 766df07de979c..9a4995304328e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -500,3 +500,10 @@ void xe_device_mem_access_put(struct xe_device *xe)
 
 	XE_WARN_ON(ref < 0);
 }
+
+u64 xe_device_canonical_addr(struct xe_device *xe, u64 address)
+{
+	const int high_address_bit = xe->info.dma_mask_size > 47 ? 57 : 47;
+
+	return sign_extend64(address, high_address_bit);
+}
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 71582094834c6..a061b348f25e2 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -143,6 +143,8 @@ void xe_device_mem_access_put(struct xe_device *xe);
 void xe_device_assert_mem_access(struct xe_device *xe);
 bool xe_device_mem_access_ongoing(struct xe_device *xe);
 
+u64 xe_device_canonical_addr(struct xe_device *xe, u64 address);
+
 static inline bool xe_device_in_fault_mode(struct xe_device *xe)
 {
 	return xe->usm.num_vm_in_fault_mode != 0;
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 8a5b614df0900..4f651a042e560 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -229,6 +229,22 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			err = -EFAULT;
 			goto err_syncs;
 		}
+
+		for (i = 0; i < q->width; i++) {
+			const u64 canonical_addr = xe_device_canonical_addr(xe, addresses[i]);
+
+			if (XE_IOCTL_DBG(xe, addresses[i] != canonical_addr)) {
+				err = -EINVAL;
+				goto err_syncs;
+			}
+		}
+	} else {
+		const u64 canonical_addr = xe_device_canonical_addr(xe, args->address);
+
+		if (XE_IOCTL_DBG(xe, args->address != canonical_addr)) {
+			err = -EINVAL;
+			goto err_syncs;
+		}
 	}
 
 	/*
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 86f16d50e9ccc..477072fd6c207 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -865,8 +865,8 @@ struct drm_xe_exec {
 	__u64 syncs;
 
 	/**
-	 * @address: address of batch buffer if num_batch_buffer == 1 or an
-	 * array of batch buffer addresses
+	 * @address: canonical address of batch buffer if num_batch_buffer == 1
+	 * or an array of batch buffer canonical addresses
 	 */
 	__u64 address;
 
-- 
2.41.0

