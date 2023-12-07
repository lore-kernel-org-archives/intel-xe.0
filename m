Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6916AC10F05
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 13:50:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D4010E1E1;
	Thu,  7 Dec 2023 13:50:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823D610E1DB
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 13:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701957025; x=1733493025;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RTub0rFFrWIUCjsskRKwQil5i8tsjfqs8EXJrZC/Fl8=;
 b=Y1wkvb1XdFZniW562jJd5LBT/k4B4JpQkd75ApZlqHV5mzCVK7VHu+fO
 qpWjkIq/T3oWgRGbmnT8X2RByYOEWyEk4JovJGNtZTnCYd1yVlM6QjxXF
 G+2d9QGy17cvA96W/HMAEAs1I8qR2UA40yNyA3lKyFrTki9iVIlhrqS39
 3fYgpXkA95ayrW27T43rqIiLi239N5R8mk7cMJ44thY3xRsN0J1CyjZhf
 bzbZBoq3YLhSX4uaiUyw2eTnNrqbm6q81mfEXA8BJ1GUDdooFLn4Q3z8a
 Rgh9cS6jEIS/OIpM241+akNXxFsYI1oTlCGfp8m4noi5pAP/3kNdOZ8IJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="373722245"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="373722245"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:50:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="765115455"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="765115455"
Received: from elenagol-mobl.ccr.corp.intel.com (HELO fde8da82816e.intel.com)
 ([10.252.46.155])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:50:24 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v1 04/14] drm/xe/uapi: Document drm_xe_query_config keys
Date: Thu,  7 Dec 2023 13:49:59 +0000
Message-Id: <20231207135009.7-5-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231207135009.7-1-francois.dugast@intel.com>
References: <20231207135009.7-1-francois.dugast@intel.com>
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Provide a description of the keys used the struct
drm_xe_query_config info array.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/637
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/uapi/drm/xe_drm.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 7b18844401fd..cc1c6c5d594c 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -352,11 +352,31 @@ struct drm_xe_query_config {
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

