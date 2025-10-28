Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89982CCF9EE
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 12:25:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C7910E5D2;
	Tue, 28 Oct 2025 12:25:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j4qcHw5W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB3510E5D4
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 12:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761654316; x=1793190316;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3NLa2JjaSdKgRwghl/76oCFLOOhImARWg6nr1ZhUTgw=;
 b=j4qcHw5Wv7wxB5x9xtbQUwtlkjAt1vjs1+tFWt3DXoDvo54/c4x1d7YQ
 f0fwLYam1s3JDyzJrnV3c0Vs9fv3yExSnJquRoAVukyq4qdCkImOl9lnn
 xL1lTDN2s0WRJ3hBfO42cqF6ALITsrn1tlNAvDZwdPyIOkHlYRNkeU7iQ
 zNqAr9ozCz6UfoQvMl3ixzlm/wYRPiOL6kvxpG79uMWb0r6V8hnTxMXhS
 G8jMjCi6VFm9T+wA9YjDh6nXWTSLCegvMWvq6PgY6u9i4ieGb8GhFr+Jc
 oSLi7g/MzsO/+ss0Z+N87YRWd2TWFoyjLRfP09j5coCvJ+EIPW7PAnzRL w==;
X-CSE-ConnectionGUID: gIADOZoMQ2ClLbDTFdJSKg==
X-CSE-MsgGUID: I6dZfMIfToipDoxo7y7tfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62956647"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="62956647"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 05:25:16 -0700
X-CSE-ConnectionGUID: LvBGUpjYS6C6oBbdzFuPig==
X-CSE-MsgGUID: /aXvQcXoSv6v1fnyZ+V+8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="190524476"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 05:25:14 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [RFC PATCH 8/9] drm/xe/uapi: Add UAPI for purgeable bo state to
 madvise query response
Date: Tue, 28 Oct 2025 17:54:14 +0530
Message-ID: <20251028122415.1136721-9-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251028122415.1136721-1-arvind.yadav@intel.com>
References: <20251028122415.1136721-1-arvind.yadav@intel.com>
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

From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Complete the purgeable buffer object UAPI by adding the response
structure to drm_xe_mem_range_attr for querying current purgeable
state of buffer objects within a memory range.

This allows userspace to determine the current state of BOs:
- WILLNEED: BO is actively needed
- DONTNEED: BO is marked as not currently needed
- PURGED: BO has been purged by the kernel

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 include/uapi/drm/xe_drm.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index e5345101a92a..0777e0b4dc63 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -2145,10 +2145,13 @@ struct drm_xe_madvise {
 		 *    should not be purged by the kernel.
 		 *  - DRM_XE_VMA_PURGEABLE_STATE_DONTNEED: BO is not currently needed,
 		 *    kernel may purge it to free memory if under pressure.
+		 *  - DRM_XE_VMA_PURGEABLE_STATE_PURGED: Read-only state indicating
+		 *    the BO purge state.
 		 */
 		struct {
 #define DRM_XE_VMA_PURGEABLE_STATE_WILLNEED	0
 #define DRM_XE_VMA_PURGEABLE_STATE_DONTNEED	1
+#define DRM_XE_VMA_PURGEABLE_STATE_PURGED	2
 			/** @purge_state_val.val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE */
 			__u32 val;
 			/** @purge_state_val.reserved: Reserved */
@@ -2214,6 +2217,15 @@ struct drm_xe_mem_range_attr {
 		__u32 reserved;
 	} pat_index;
 
+	/** @purge_state_val: Purgeable state configuration */
+	struct {
+		/** @purge_state_val.val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE */
+		__u32 val;
+
+		/** @purge_state_val.reserved: Reserved */
+		__u32 reserved;
+	} purge_state_val;
+
 	/** @reserved: Reserved */
 	__u64 reserved[2];
 };
-- 
2.43.0

