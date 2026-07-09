Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32AEC43458
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jul 2026 19:44:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A714B10E2DD;
	Thu,  9 Jul 2026 19:44:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fgmFmdD3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6343510E2DD
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jul 2026 19:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783626282; x=1815162282;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jAntR/1poH2yPTsJTCt+xYblLJpvGpcjejWWM6ak/ls=;
 b=fgmFmdD31laM+uO/sWkk5/fHU0501S3lI9Z+se1FOhqKX6b88i7Kd5BB
 vObLj6YeH7bKVIPsT3+ixnZxdQe9hVcpp9n9I2iR2lRMZsU3hZXylE1V0
 5oozKA+SCeXJiWmvNav+ZkYCPHIDNkAZ19dvX2YCI6qUpJ9MIbe+NFvq5
 XhZ/8g6YADT2VSal912JHXtYiMarS6qUM6TQz14nIUDyc67ju7ibSmVD3
 NOh6dEdCP2JHY4TixRVKs6qjQsLG10/GBXmNE5CCLAKn/woUPs6Uk0x7y
 +vt3InspHHPAJpG1RBnyQWnIfEBGZsMjDpiRI732yjNQ1+WD7rokMRPxe Q==;
X-CSE-ConnectionGUID: AHD7bHQgQc6XmPT8U5JLVg==
X-CSE-MsgGUID: ZPBLZtQ6TwqngC/cNje2EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84516216"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84516216"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 12:44:41 -0700
X-CSE-ConnectionGUID: nnQxK5NPQY6eOXcVPywTOQ==
X-CSE-MsgGUID: FxFgDupkQbKpMxPpzqUWog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="248305377"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 12:44:39 -0700
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [PATCH] drm/xe: Reject PXP usage on multi-queue exec queues
Date: Fri, 10 Jul 2026 03:44:16 +0800
Message-ID: <d17f069c16b9e07dfbfae730914b1c095739fe4a.1783626140.git.jagmeet.randhawa@intel.com>
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
index 1b5ca3ce578a..d5bc8994a756 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1072,11 +1072,22 @@ static int exec_queue_user_ext_check(struct xe_exec_queue *q, u64 properties)
 
 static int exec_queue_user_ext_check_final(struct xe_exec_queue *q, u64 properties)
 {
+	struct xe_device *xe = gt_to_xe(q->gt);
 	/* MULTI_QUEUE_PRIORITY only applies to multi-queue group queues */
 	if ((properties & BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY)) &&
 	    !(properties & BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP)))
 		return -EINVAL;
 
+	/*
+	 * HWDRM is the only supported PXP type today. It is display related and
+	 * hence can't work with multi-queue. Reject the combination. The secondary
+	 * queue path already rejects any PXP property, so this also covers the
+	 * multi-queue primary which would otherwise allow it.
+	 */
+	if (XE_IOCTL_DBG(xe, xe_exec_queue_is_multi_queue(q) && 
+				xe_exec_queue_uses_pxp(q)))
+		return -EINVAL;
+
 	return 0;
 }
 
-- 
2.53.0

