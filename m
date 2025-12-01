Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721F6D116E2
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 05:54:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3392D10E2A4;
	Mon,  1 Dec 2025 05:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EOrkCXGB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5643C10E2AA
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 05:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764568441; x=1796104441;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2eKCd9XLJtFSgkDuAqxUh1SIzkMSWfootqFGJjkDv3o=;
 b=EOrkCXGBuFPsEj57pAdgPg5qN9t2ntYKCsNP38lxLdtKHGJKXRoRmj/g
 yD0lMNpz0NHMzC+fvU5fcW2rWCuTE3KzydCypqBtQtUhWIAGJRCtW36o0
 qs4cxS0sMG9mozlFuW903Jo0JyiJs6BSzLUaM2b1Q6PRI94aL5phHXsRl
 kbi5XhWWTksiiic/2LoKihgHph4BQy1t8Z6dfHxlpKVujxTAf8+OTsuP7
 0avFhm8nQoi8NSN/e3h1ft5QObMnwceOWOsL8ooDqQAO/nO8ghBr6f8/j
 Fxnmo5LQaSoc/oD/bWX1bLJwOt0nF4gAbObMY5eaVnSf4cc96ZY61AaeD w==;
X-CSE-ConnectionGUID: 4Zp5YyNuRVGqHVsUgCMpig==
X-CSE-MsgGUID: sBwSb0PZR0uu5gqK2I6bxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66457395"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66457395"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 21:54:01 -0800
X-CSE-ConnectionGUID: q7cUpTNtToezb33vcqeQaw==
X-CSE-MsgGUID: ODv6qk5oSlW7TPTKCt4OXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="224950843"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 21:53:59 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, pallavi.mishra@intel.com
Subject: [RFC v2 8/9] drm/xe/uapi: Add UAPI for purgeable bo state to madvise
 query response
Date: Mon,  1 Dec 2025 11:20:18 +0530
Message-ID: <20251201055309.854074-9-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201055309.854074-1-arvind.yadav@intel.com>
References: <20251201055309.854074-1-arvind.yadav@intel.com>
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
- DRM_XE_VMA_PURGEABLE_STATE_WILLNEED (0): BO actively needed, has backing store
- DRM_XE_VMA_PURGEABLE_STATE_DONTNEED (1): BO eligible for purging, still has backing
- DRM_XE_VMA_PURGEABLE_STATE_PURGED (2): BO purged, backing store freed (read-only)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 include/uapi/drm/xe_drm.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 02d63938d16f..8f289a2849ff 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -2147,10 +2147,14 @@ struct drm_xe_madvise {
 		 *  - DRM_XE_VMA_PURGEABLE_STATE_DONTNEED (1): Hints that BO is not
 		 *    currently needed. Kernel may purge it under memory pressure.
 		 *    Only applies to non-shared BOs. Returns retained=1 if not purged.
+		 *
+		 *  - DRM_XE_VMA_PURGEABLE_STATE_PURGED: Read-only state indicating
+		 *    the BO purge state.
 		 */
 		struct {
 #define DRM_XE_VMA_PURGEABLE_STATE_WILLNEED	0
 #define DRM_XE_VMA_PURGEABLE_STATE_DONTNEED	1
+#define DRM_XE_VMA_PURGEABLE_STATE_PURGED	2
 			/** @purge_state_val.val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE */
 			__u32 val;
 			/**
@@ -2224,6 +2228,15 @@ struct drm_xe_mem_range_attr {
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

