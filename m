Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0290C43458
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 19:45:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 920BD10E54C;
	Mon, 13 Jul 2026 19:45:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xa9afviC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2D810E54C
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 19:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783971902; x=1815507902;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NFrrb/mSmXtKhNMTAzwqJPRbONwWod8E7da7WgTpAn8=;
 b=Xa9afviC+2UTrBojXBNXdna2oPG73Up+QcGPZRmCLdA6Qg4KbPVG0niz
 67mTgQtT4uDFlVnGqZUoXnsvbE6PkERqx8dpWAMSibobc+Uu7MXPlWRhz
 ZB1o0+OPyY6fXj46MWO7T9Hu6zAMp8HtpJymzxaaJBaYAGTOhX7YbE1aj
 xqECy0eoX86edTUR9tGR2QJY2gkhGlaMh2da3d7ld8nIrz5VRdBQJg460
 eHMsZ8kcVtUy1/hEOAZ4zy+5Rqrky15eTVZlbFV62pWWVsiZ7FIby0SUG
 0aDDH2pCVgcfbq4iCG8DWb509xEjrHfkWhCMcFz/Od9SEh3OE4/R8urbX Q==;
X-CSE-ConnectionGUID: VWaa2Nj6QCST1P9p0cmQUw==
X-CSE-MsgGUID: 5L1ydEEwSF6cA8NFMUOP6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83570727"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="83570727"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 12:45:01 -0700
X-CSE-ConnectionGUID: n7X+0hfkRJC375mdyIJJEg==
X-CSE-MsgGUID: hcXR3oKuTLW6TonLvJ23AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="255142999"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 12:45:00 -0700
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [PATCH, v2] drm/xe: Reject PXP usage on multi-queue exec queues
Date: Tue, 14 Jul 2026 03:44:49 +0800
Message-ID: <3fe42f29f4216bf9e7de4dbf582ace608e6d30eb.1783971737.git.jagmeet.randhawa@intel.com>
X-Mailer: git-send-email 2.53.0
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

HWDRM is currently the only supported PXP type, and it is display
related, so it cannot be combined with multi-queue exec queue groups.
Reject exec queue creation that requests both multi-queue and PXP,
returning -EINVAL.

The secondary queue path already rejects any PXP property, so this
adds the missing check for the multi-queue primary,
which would otherwise allow the combination.

Validated with igt@xe_exec_multi_queue@sanity, which exercises both
the PXP-unsupported (-ENODEV) and PXP-supported (-EINVAL) paths.

Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 1b5ca3ce578a..ea8546b67e6e 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1056,6 +1056,7 @@ int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
 
 static int exec_queue_user_ext_check(struct xe_exec_queue *q, u64 properties)
 {
+	struct xe_device *xe = gt_to_xe(q->gt);
 	u64 secondary_queue_valid_props = BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP) |
 				  BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY);
 
@@ -1067,6 +1068,16 @@ static int exec_queue_user_ext_check(struct xe_exec_queue *q, u64 properties)
 	    properties & ~secondary_queue_valid_props)
 		return -EINVAL;
 
+	/*
+	 * HWDRM is the only supported PXP type today. It is display related and
+	 * hence can't work with multi-queue. Reject the combination. The secondary
+	 * queue path above already rejects any PXP property, so this also covers
+	 * the multi-queue primary which would otherwise allow it.
+	 */
+	if (XE_IOCTL_DBG(xe, (properties & BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP)) &&
+				(properties & BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE))))
+		return -EINVAL;
+
 	return 0;
 }
 
-- 
2.53.0

