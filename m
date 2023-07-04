Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4B3EB64D9
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 14:24:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA1810E18F;
	Tue,  4 Jul 2023 14:24:50 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D32E110E18F
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jul 2023 14:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688480689; x=1720016689;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/DY3kMzG5E8+V9Tm5oLAC5tUTXsxn+9Jtq6etOFeOY4=;
 b=m3n1bdr5cqJ6ldzxDWGRF4Wkm2Uz0MdtUhIQdtdQEURsLPYm5FNsJfXK
 EL0rF7yU6JBH0+oo1mWPkgKjUAfk1wFLta2gaoHAw7LsgoszTjD5ySBVq
 jhc4Gk9YUD6LhTK5qCyyVdJlb/SIchOEggthIDl6FhDxPKpyBENvz4ASh
 Beg8SZhWL8WHvg8glHYal1FMLwuFpPAyicCLyTGzQK/QWAmFJEE7KH9+P
 L9LbaMVTNH3klINZHrL9xa/LF6xVq0V3Q2BKul8bRImafiE8zxqw6TUIl
 9C8mO5hDn6m21SGZ96kaslLCBV+P+njhAEW8lxaC4a7/B8pOqeo4oOZmJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="429170236"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="429170236"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 07:24:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="892879230"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="892879230"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 07:24:47 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  4 Jul 2023 07:24:40 -0700
Message-ID: <20230704142440.58130-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] drm/xe: Make explicit that exec uAPI expects
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

BSpec: 60223 59475 45718
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  6 ++++++
 drivers/gpu/drm/xe/xe_device.h |  2 ++
 drivers/gpu/drm/xe/xe_exec.c   | 14 ++++++++++++++
 include/uapi/drm/xe_drm.h      |  4 ++--
 4 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 07ae208af809d..887aed80a20e9 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -437,3 +437,9 @@ void xe_device_mem_access_put(struct xe_device *xe)
 
 	XE_WARN_ON(ref < 0);
 }
+
+u64 xe_device_canonical_addr(struct xe_device *xe, u64 address)
+{
+	const int high_address_bit = xe->info.dma_mask_size > 47 ? 57 : 47;
+	return sign_extend64(address, high_address_bit);
+}
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 779f71d066e6e..4df4f52f946ea 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -140,6 +140,8 @@ static inline struct xe_force_wake * gt_to_fw(struct xe_gt *gt)
 void xe_device_mem_access_get(struct xe_device *xe);
 void xe_device_mem_access_put(struct xe_device *xe);
 
+u64 xe_device_canonical_addr(struct xe_device *xe, u64 address);
+
 static inline bool xe_device_mem_access_ongoing(struct xe_device *xe)
 {
 	return atomic_read(&xe->mem_access.ref);
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index c52edff9a3584..29587a1bf3772 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -229,6 +229,20 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			err = -EFAULT;
 			goto err_syncs;
 		}
+
+		for (i = 0; i < engine->width; i++) {
+			const u64 canonical_addr = xe_device_canonical_addr(xe, addresses[i]);
+			if (XE_IOCTL_ERR(xe, addresses[i] != canonical_addr)) {
+				err = -EINVAL;
+				goto err_syncs;
+			}
+		}
+	} else {
+		const u64 canonical_addr = xe_device_canonical_addr(xe, args->address);
+		if (XE_IOCTL_ERR(xe, args->address != canonical_addr)) {
+			err = -EINVAL;
+			goto err_syncs;
+		}
 	}
 
 	/*
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index e890b131af918..72dc2161fd232 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -811,8 +811,8 @@ struct drm_xe_exec {
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

