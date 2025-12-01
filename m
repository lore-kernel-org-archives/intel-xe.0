Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57189D111A8
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 05:53:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17CC310E2A5;
	Mon,  1 Dec 2025 05:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k5SYXCHh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5074F10E2A5
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 05:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764568431; x=1796104431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pWQNqa6FGG25kO7nhmGoSBHgD/dicMxugnLRwDuleIc=;
 b=k5SYXCHhSgTAfH1HuAnikJ2K4HCnd6PE0+EjdU0nD5CrGwbBj4CRM0X+
 IC2f/7yzZhEgz29D6Lc9WCCd5YIAhaM/Q5MiiiFakaI1owwdHgkg+iV9b
 X0JeSz1IERvHOfS1YL4rCO76IdOcE/cXrUCOJIjhWJ5/pcedxH44J/Trp
 rfq7UXlgfWL2iaXr+aKxLZvzHJLN/jEaKg2O0REI/iWQYXd2B0QqyjU+N
 PA+lerssYx7yA3crm8wfhxtYJFFloAVwPOT2oprsX+x/aTm3HnEiSeGue
 oIGTa2NXQitn9O1lfnGlVaRnA5ZabppuHAm4WP75LUOQ1hkplPvipahWm A==;
X-CSE-ConnectionGUID: YMYHSu0JSIms2yZRpw1EeA==
X-CSE-MsgGUID: sdpTg0uDRDaS+eUZs+dVnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66457382"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66457382"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 21:53:51 -0800
X-CSE-ConnectionGUID: JSd5nZomQ9CWAiiI05oSjA==
X-CSE-MsgGUID: Vb9iRjYaQaWgoIKAA4BXJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="224950825"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 21:53:49 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, pallavi.mishra@intel.com
Subject: [RFC v2 3/9] drm/xe/bo: Prevent purging of shared buffer objects
Date: Mon,  1 Dec 2025 11:20:13 +0530
Message-ID: <20251201055309.854074-4-arvind.yadav@intel.com>
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

Introduce the `xe_bo_is_shared_locked()` inline helper to determine if a
buffer object is shared across multiple clients or drivers. A buffer is
considered shared if it is exported via dma-buf, imported, or has a
handle count greater than one.

This check is critical for safely implementing purgeable memory. Purging
a buffer that is shared would lead to data corruption for other clients
that still hold a reference to it.

The kernel cannot safely determine when all clients are done with a
shared buffer, so shared BOs must never be marked DONTNEED or purged.

The new helper is used in two key locations:
1.  In `xe_vm_madvise_purgeable_bo()`, to prevent userspace from
    successfully marking a shared buffer as `DONTNEED`. This is the
    primary safeguard against incorrect usage.

2.  In `xe_bo_move()`, as a final safety check before the kernel
    initiates a purge during eviction. This ensures that even if a
    shared buffer were somehow marked `DONTNEED`, it would not be
    purged.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index b0a31c77e612..97edb38bf1ed 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -478,4 +478,34 @@ static inline bool xe_bo_is_mem_type(struct xe_bo *bo, u32 mem_type)
 	xe_bo_assert_held(bo);
 	return bo->ttm.resource->mem_type == mem_type;
 }
+
+/**
+ * xe_bo_is_shared_locked - Check if a buffer object is shared
+ * @bo: The buffer object to check
+ *
+ * Determines if a buffer object is considered shared, which includes:
+ * - Exported via dma-buf (obj->dma_buf is set)
+ * - Imported from another driver (obj->import_attach is set)
+ * - Referenced by multiple clients (handle_count > 1)
+ *
+ * This check is used to prevent data loss on shared content by avoiding
+ * certain operations like purging on buffers that other processes or
+ * drivers might still be using.
+ *
+ * Return: true if the buffer object is shared, false otherwise.
+ */
+static inline bool xe_bo_is_shared_locked(const struct xe_bo *bo)
+{
+	const struct drm_gem_object *obj = &bo->ttm.base;
+
+	dma_resv_assert_held(obj->resv);
+
+	if (obj->dma_buf || obj->import_attach)
+		return true;
+
+	if (obj->handle_count > 1)
+		return true;
+
+	return false;
+}
 #endif
-- 
2.43.0

