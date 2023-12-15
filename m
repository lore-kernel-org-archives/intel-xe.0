Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA31C46CC5
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 15:46:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB4910EA5F;
	Fri, 15 Dec 2023 15:46:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC4D10EA4C
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 15:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702655180; x=1734191180;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IRVmD4/SkIA+WuI9CfcQHd0Z6lyUo7OtGQofIKuihO4=;
 b=jdGgnKFTDDGYw1iVC3Vvjud7BESJyzvZahoUi40k5iBJgNIJbypXcdAy
 oduhfdJ5y3N3bfeHoVeEAXIUURN1J//+GVYz9iFyEwyIFsoyy0SbrzxlK
 GZOpAUJSs8j+cUfJYZTH7ax9eeMuqwT2dZsrKFG+zKcFoYIPcR/876rws
 kFvdHFI3z9RhGwes/kTzwkFXP4rJkmdgpjFzy4dNNeRHOhDbUKWewH3Nr
 tPUZ1thzCIw7on2XjFPlOqKXhqkDjky8S00T/B+1mzN8c2Q9H/bUv0UKQ
 Gdqj8yMXX3Df/CPLHc++Ah2hmzAmiFMXkMX8TOR2DgIicKAg338PKC1iA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2141862"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="2141862"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 07:46:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="16324496"
Received: from sdiolatz-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.48.85])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 07:46:20 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v1 11/21] drm/xe/uapi: Document drm_xe_query_config keys
Date: Fri, 15 Dec 2023 15:45:43 +0000
Message-Id: <20231215154553.7-12-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231215154553.7-1-francois.dugast@intel.com>
References: <20231215154553.7-1-francois.dugast@intel.com>
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Provide a description of the keys used the struct
drm_xe_query_config info array.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/637
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/uapi/drm/xe_drm.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index d759e04e00ee..9c43bc258f10 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -350,11 +350,31 @@ struct drm_xe_query_config {
 	/** @pad: MBZ */
 	__u32 pad;
 
+	/*
+	 * Device ID (lower 16 bits) and the device revision (next
+	 * 8 bits)
+	 */
 #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
+	/*
+	 * Flags describing the device configuration, see list below
+	 */
 #define DRM_XE_QUERY_CONFIG_FLAGS			1
+	/*
+	 * Flag is set if the device has usable VRAM
+	 */
 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
+	/*
+	 * Minimal memory alignment required by this device,
+	 * typically SZ_4K or SZ_64K
+	 */
 #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
+	/*
+	 * Maximum bits of a virtual address
+	 */
 #define DRM_XE_QUERY_CONFIG_VA_BITS			3
+	/*
+	 * Value of the highest available exec queue priority
+	 */
 #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
 	/** @info: array of elements containing the config info */
 	__u64 info[];
-- 
2.34.1

