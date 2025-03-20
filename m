Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C85C36001
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 19:27:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D44310E6A8;
	Thu, 20 Mar 2025 19:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XHuy2QUO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 938B810E688
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Mar 2025 19:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742498848; x=1774034848;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2Dc3DzpqTAQ+/E+EWPqpr9Zpm1oeU+07t7WX8kocHD8=;
 b=XHuy2QUOauEVzN0Rnp/aLgBxLoq39mUqxzCdS2z06bvGc57THtAt1kDO
 GZ6lzUaeq9AA7zRv5P8bC9hcdM+tEXV02bcG9/ENE0b8An5l1tVw/o1sw
 anIsVruxDSz5NVqXCyKpGWcYEn51e+c54mGzPpNW3RIHOVenzneB+5mDk
 sUW1XyPmIXwGZnsgjB8Vt4zcdk4JdS60cviYUipkHwNqSPl7OfU0aggiL
 NzQnTxt1GaMnRA0R26rxtl8hya+j+HktLVGP0T/aHq4E9P7eJIMexfPbR
 60mjDEakK1ri0DDv+ui5ZJPlSjujA+1nurDerLcmcxjUDWxp0wjeo8V0y w==;
X-CSE-ConnectionGUID: B+i+QCpVTNmqrR8BEdabOQ==
X-CSE-MsgGUID: SSyiBna8Qb+G6Pbq+GO5Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43678751"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="43678751"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 12:27:23 -0700
X-CSE-ConnectionGUID: eLl+7+JqRG+Ej7p6oMFCnw==
X-CSE-MsgGUID: YfDWHEttTt2Tln9aSeMC5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="123156825"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 12:27:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jose.souza@intel.com,
	carlos.santa@intel.com
Subject: [PATCH v3 7/9] drm/xe/uapi: Add
 DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
Date: Thu, 20 Mar 2025 12:28:29 -0700
Message-Id: <20250320192831.3842138-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250320192831.3842138-1-matthew.brost@intel.com>
References: <20250320192831.3842138-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE which accepts a user pointer
to populate the exec queue state so that a GPU hang can be replayed via
a Mesa tool.

v2: Update the value for HANG_REPLAY_STATE flag

Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Carlos Santa <carlos.santa@intel-corp-partner.google.com>
---
 include/uapi/drm/xe_drm.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 616916985e3f..671f138fd43d 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -204,8 +204,12 @@ struct drm_xe_ext_set_property {
 	/** @pad: MBZ */
 	__u32 pad;
 
-	/** @value: property value */
-	__u64 value;
+	union {
+		/** @value: property value */
+		__u64 value;
+		/** @ptr: pointer to user value */
+		__u64 ptr;
+	};
 
 	/** @reserved: Reserved */
 	__u64 reserved[2];
@@ -1249,6 +1253,7 @@ struct drm_xe_exec_queue_create {
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
+#define   DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE		3
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-- 
2.34.1

