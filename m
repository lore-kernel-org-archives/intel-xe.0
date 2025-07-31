Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA218C87FCC
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 09:38:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718FA10E744;
	Thu, 31 Jul 2025 09:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nzLJTEoT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE00910E744
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 09:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753954704; x=1785490704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M024nvPOr4I+RBB08kEANs8bSlteeLs6vN9+m8+fHkc=;
 b=nzLJTEoT0JOMdD4Heb8KQbYdsygOor9SManVmBK4nuatP9/coHo1811z
 A/az99XaeNrh3DehWREJhh0NMNnAuKIPqA2hnt9ORyBZDdf4xLyfLnel2
 S8lZmxUgyJUxPvjlH0BumVzrJxA4CaYGaOBEteq4+CElrVC0U7l4mVLfy
 fMr783kxxxlN+Rjgs4c2Ux2fd2FX0xUAcfpqPR1DkLHgWGvMUn8LFY+FW
 h2HVKKmeH1uDzojAedBMI+OKN3h6N9UfQEBzGB/h14ZJSa2AxS3vxnCGG
 LH5hk54tThAcK+SJvZnIirWnxJOOSx30wRHWPwIFQvK30WkzzdnUAzhjt g==;
X-CSE-ConnectionGUID: HfuorNcXS7mG8aTF0VYosA==
X-CSE-MsgGUID: mkI1v3LWQWauevJGLtUCoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="43877056"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="43877056"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 02:38:19 -0700
X-CSE-ConnectionGUID: mZzDWDSKSSW0qiXXebx0iQ==
X-CSE-MsgGUID: ctC/7l0BQyCmbKnR/MQn/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="194056852"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.250])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 02:38:17 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 1/3] drm/xe/migrate: prevent infinite recursion
Date: Thu, 31 Jul 2025 10:38:09 +0100
Message-ID: <20250731093807.207572-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250731093807.207572-5-matthew.auld@intel.com>
References: <20250731093807.207572-5-matthew.auld@intel.com>
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

If the buf + offset is not aligned to XE_CAHELINE_BYTES we fallback to
using a bounce buffer. However the bounce buffer here is allocated on
the stack, and the only alignment requirement here is that it's
naturally aligned to u8, and not XE_CACHELINE_BYTES. If the bounce
buffer is also misaligned we then recurse back into the function again,
however the new bounce buffer might also not be aligned, and might never
be until we eventually blow through the stack, as we keep recursing.

Instead of using the stack use kmalloc, which should respect the
power-of-two alignment request here. Fixes a kernel panic when
triggering this path through eudebug.

v2 (Stuart):
 - Add build bug check for power-of-two restriction
 - s/EINVAL/ENOMEM/

Fixes: 270172f64b11 ("drm/xe: Update xe_ttm_access_memory to use GPU for non-visible access")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 3a276e2348a2..b8d1ec4c1861 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1987,15 +1987,22 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 	if (!IS_ALIGNED(len, XE_CACHELINE_BYTES) ||
 	    !IS_ALIGNED((unsigned long)buf + offset, XE_CACHELINE_BYTES)) {
 		int buf_offset = 0;
+		void *bounce;
+		int err;
+
+		BUILD_BUG_ON(!is_power_of_2(XE_CACHELINE_BYTES));
+		bounce = kmalloc(XE_CACHELINE_BYTES, GFP_KERNEL);
+		if (!bounce)
+			return -ENOMEM;
+
+		xe_assert(xe, IS_ALIGNED((unsigned long)bounce,
+					 XE_CACHELINE_BYTES));
 
 		/*
 		 * Less than ideal for large unaligned access but this should be
 		 * fairly rare, can fixup if this becomes common.
 		 */
 		do {
-			u8 bounce[XE_CACHELINE_BYTES];
-			void *ptr = (void *)bounce;
-			int err;
 			int copy_bytes = min_t(int, bytes_left,
 					       XE_CACHELINE_BYTES -
 					       (offset & XE_CACHELINE_MASK));
@@ -2004,22 +2011,22 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 			err = xe_migrate_access_memory(m, bo,
 						       offset &
 						       ~XE_CACHELINE_MASK,
-						       (void *)ptr,
-						       sizeof(bounce), 0);
+						       bounce,
+						       XE_CACHELINE_BYTES, 0);
 			if (err)
-				return err;
+				break;
 
 			if (write) {
-				memcpy(ptr + ptr_offset, buf + buf_offset, copy_bytes);
+				memcpy(bounce + ptr_offset, buf + buf_offset, copy_bytes);
 
 				err = xe_migrate_access_memory(m, bo,
 							       offset & ~XE_CACHELINE_MASK,
-							       (void *)ptr,
-							       sizeof(bounce), write);
+							       bounce,
+							       XE_CACHELINE_BYTES, write);
 				if (err)
-					return err;
+					break;
 			} else {
-				memcpy(buf + buf_offset, ptr + ptr_offset,
+				memcpy(buf + buf_offset, bounce + ptr_offset,
 				       copy_bytes);
 			}
 
@@ -2028,7 +2035,8 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 			offset += copy_bytes;
 		} while (bytes_left);
 
-		return 0;
+		kfree(bounce);
+		return err;
 	}
 
 	dma_addr = xe_migrate_dma_map(xe, buf, len + page_offset, write);
-- 
2.50.1

