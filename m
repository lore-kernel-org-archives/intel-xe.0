Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688B6D111A8
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 05:53:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A7810E2A6;
	Mon,  1 Dec 2025 05:53:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a9XdKXi3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE5A10E2AA
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 05:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764568437; x=1796104437;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dJX99Zzkrsd6Yjd8spByxdyBmkMR92DYQSi/GvacsA0=;
 b=a9XdKXi3o9coWdlgs1ck+7VYmqbRIkG9IpMhufu5o6GQfmbm1FKgFHdC
 +5ggpRGiHuiqIwZimzNrwX3ALzr/VEJDsCA4i6pGaBU/w56CXXgTwPNdf
 TFAqHv1CAPBrDuT5GIutVzXHs/sQwiEFc7Jt5nLalOZ/8fQaGRWg0Cjbh
 FreHlwGgLgvmo3mVltKFwPHt7pSc2DSmGsd02z7rjGFXRr+c7E6bx3veO
 6ep0k76RDMkLo7wWES+u0X+3Kd0joXhMqU4Esup+RHCcO5xBkLJdlMjCe
 pph1cPn4jn7oxzU7nnC7mUJVhPUit/lwunjOx6Fa5xgwK4t8g2FrkD/nT A==;
X-CSE-ConnectionGUID: E6OgpTz/QLCx9mw7jYJFHw==
X-CSE-MsgGUID: HL58InP+SJ+7G06QuVhh8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66457390"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66457390"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 21:53:57 -0800
X-CSE-ConnectionGUID: gfJzNY1pTia+7Ri5ToEJ7w==
X-CSE-MsgGUID: Q5Vwmb0YT+OjnMiU7BufCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="224950836"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 21:53:55 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, pallavi.mishra@intel.com
Subject: [RFC v2 6/9] drm/xe/bo: Prevent mmap of purged buffer objects
Date: Mon,  1 Dec 2025 11:20:16 +0530
Message-ID: <20251201055309.854074-7-arvind.yadav@intel.com>
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

Fail DRM_IOCTL_XE_GEM_MMAP_OFFSET with -EINVAL when called on purged
buffer objects to provide early error detection instead of allowing
deferred SIGBUS on memory access.

Problem:
  The mmap offset ioctl (DRM_IOCTL_XE_GEM_MMAP_OFFSET) returns a file
  offset that userspace can pass to mmap() to map GPU memory into its
  address space. For purged BOs, the backing store has been freed, but
  the VMA node offset remains valid. Without this check:

  1. Userspace successfully gets mmap offset for purged BO
  2. mmap() succeeds (VMA is created but has no backing pages)
  3. Any memory access triggers CPU page fault
  4. xe_bo_cpu_fault() detects purged state and returns VM_FAULT_SIGBUS

v2:
  - Fix reference counting: use drm_gem_object_put() instead of xe_bo_put()
    to properly balance drm_gem_object_lookup() (review feedback).
  - Added xe_bo_is_purged(bo) instead of atomic_read.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 7f5bcf114ed4..dbbfb58ac657 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -3346,6 +3346,7 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
 	struct xe_device *xe = to_xe_device(dev);
 	struct drm_xe_gem_mmap_offset *args = data;
 	struct drm_gem_object *gem_obj;
+	struct xe_bo *bo;
 
 	if (XE_IOCTL_DBG(xe, args->extensions) ||
 	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
@@ -3375,6 +3376,16 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, !gem_obj))
 		return -ENOENT;
 
+	bo = gem_to_xe_bo(gem_obj);
+
+	/*
+	 * Reject mmap offset requests for purged BOs.
+	 */
+	if (xe_bo_is_purged(bo)) {
+		drm_gem_object_put(gem_obj);
+		return -EINVAL;
+	}
+
 	/* The mmap offset was set up at BO allocation time. */
 	args->offset = drm_vma_node_offset_addr(&gem_obj->vma_node);
 
-- 
2.43.0

