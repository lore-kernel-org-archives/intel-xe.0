Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F812EB64DA
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jul 2023 13:54:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D55E10E596;
	Fri,  7 Jul 2023 13:54:33 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5936410E596
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jul 2023 13:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688738071; x=1720274071;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mWNOhB06tUmnaMo8w2b/CswVRfusrGOVTzWsK4LScts=;
 b=dle/Re+o1qb/NoVodBFNmpvAGeNJpebhC3pGZUIxWROyV7pbS1nGCprX
 fwGeWWmQi54bCLtoK26wrtDkorfxxTTOiXjEQ3znE8OYCSyUxF4LYGDIE
 DljO801aNKFwy0YBix45okxoU3BVvKAu6puIQ1MrvCGJCr2lsslrm1kDS
 44C9zBAEwJcurY58jC9WMOWLuDvPAbcODpgB/loPZHgENWLVNRGeRxCw2
 FlRz1i0VmK3zkC5BbSXUvzystSasRuvUALtluoeYZGyQ/yxZsjmMmYliB
 v1Flgt3gkjiTg5v/dNdIG1b2FnbrnURPAzsp5PiMJCzQPNnXL92JORJYW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="450248519"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; d="scan'208";a="450248519"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 06:54:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="1050552378"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="1050552378"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 06:54:28 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  7 Jul 2023 06:54:19 -0700
Message-ID: <20230707135419.14241-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3] drm/xe: Make explicit that exec uAPI expects
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
index 07ae208af809d..e0a0a1666e787 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -437,3 +437,10 @@ void xe_device_mem_access_put(struct xe_device *xe)
 
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
index c52edff9a3584..7a7713e69b14d 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -229,6 +229,22 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			err = -EFAULT;
 			goto err_syncs;
 		}
+
+		for (i = 0; i < engine->width; i++) {
+			const u64 canonical_addr = xe_device_canonical_addr(xe, addresses[i]);
+
+			if (XE_IOCTL_ERR(xe, addresses[i] != canonical_addr)) {
+				err = -EINVAL;
+				goto err_syncs;
+			}
+		}
+	} else {
+		const u64 canonical_addr = xe_device_canonical_addr(xe, args->address);
+
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

