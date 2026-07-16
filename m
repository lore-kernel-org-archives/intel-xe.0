Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1EBC44512
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 21:47:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF61910E249;
	Thu, 16 Jul 2026 21:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cCxFWFME";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE92D10F3F8
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 21:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784238477; x=1815774477;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RadquN3YDAPScs5a/UFDRkMyCTKKAHzN/m9ad492JWs=;
 b=cCxFWFMEypBQTTosiW5IR/TJH694ngQmLx6ROTGkntfW03SaRJayvI01
 XJJ5cJJHzE3g5Eo7Zd87xuaTgTS9xGGknGecuVDYhpD0NlTyf2sO0ygRW
 hDBQpjZHMZEIrfJHo2LvYEZ44Y8lhi+WZNMe3zC42EKDG8hAb6e3LPFSW
 h6F8XvIBAZRZH+v1S20NyUZJC//gCYyiUSGQgj/E0gxblzqysOT/bzriD
 ZpnDk4q+ZCBav+fHR87XYIzvWuKfw7X7MrFpBRX0oTNk76ZcPNlZE5aKH
 n1aeVsQou8WB8+UBZECHycxZeB/PAimrTCt7ZulPExjkLZn/Xk+xm3/Mr g==;
X-CSE-ConnectionGUID: THsOmhqMS6GXSsewrcFpnQ==
X-CSE-MsgGUID: R5bk0epjRF6MXY8VxqExLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="95565018"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="95565018"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 14:47:56 -0700
X-CSE-ConnectionGUID: GnuNstCXRHW75vHnoHD4BA==
X-CSE-MsgGUID: 6s80RkO/TpOHMKujUi9fBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="260437056"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 14:47:56 -0700
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [PATCH,
 v3] drm/xe/multi_queue: Reject PXP usage on multi-queue exec queues
Date: Fri, 17 Jul 2026 05:47:45 +0800
Message-ID: <4d369249d52384bc93663055a3757a50614ebbfd.1784238312.git.jagmeet.randhawa@intel.com>
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

v3:
 - Change commit title prefix to drm/xe/multi_queue:.
 - Add Niranjana's Reviewed-by.
v2:
 - Move the multi-queue + PXP check to exec_queue_user_ext_check() to
   bail out early, keyed off the properties bitmask (Niranjana).

Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
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

