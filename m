Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFFCC0218C
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 01:14:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB6FC10E3CB;
	Thu, 23 Jan 2025 01:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MiUnwkv6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4067310E041
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 01:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737594863; x=1769130863;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OnRn2xy7+0r8s0krSRQ+mBhCkrc6lBLosF42bqgsRz8=;
 b=MiUnwkv6PsJR8Tb+qzxvcDO72jbHMiw5bzR/kv37SkRonsOnCCvhSZva
 dkUSea2K7JUDog0sW2gO8Ipin3/B01EstfOrih1Z6SlrVyqitj6u8lB09
 ULJvnvn4R8A3leIJcRw1a+/k/YGBQONFVvPoS7AvIlvjWNj1Qpyaa0X19
 RTkfLlsEopFJbi3DAKCcljnbaMf2PfpPqpJ9aAkGGnAmDaimD+QdOOduj
 3Sq9bDBDDDK5NpOcP2TEpPFzazszCdrrj2gk9HKqfgOHw2ML0n5G7CQRN
 2S5n3eyVBi/CZ10o8gzkUUVxzstu6dAk/L37c+u64pevLQHkvbvG2VP2k w==;
X-CSE-ConnectionGUID: OrD4jzsVT9+8HFfXSGuIjw==
X-CSE-MsgGUID: sdOZe/UiTzyZXRsDsx6dSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37967064"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="37967064"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 17:14:22 -0800
X-CSE-ConnectionGUID: WClrh0DvRyapSKunbjyFag==
X-CSE-MsgGUID: jbCU+a6/Rpq5njA4K8ElqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="107124119"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 17:14:22 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jose.souza@intel.com, lionel.g.landwerlin@intel.com,
 carlos.santa@intel.com, rodrigo.vivi@intel.com
Subject: [RFC PATCH 4/6] drm/xe/uapi: Add
 DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
Date: Wed, 22 Jan 2025 17:15:11 -0800
Message-Id: <20250123011513.362430-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250123011513.362430-1-matthew.brost@intel.com>
References: <20250123011513.362430-1-matthew.brost@intel.com>
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

Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/uapi/drm/xe_drm.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index e2160330ad01..0fe8c2e8b022 100644
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
@@ -1137,6 +1141,7 @@ struct drm_xe_exec_queue_create {
 #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
+#define   DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE		2
 
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
-- 
2.34.1

