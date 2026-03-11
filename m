Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E566D1125850
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 15:52:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A472210E205;
	Wed, 11 Mar 2026 15:52:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DfTIrREM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D6C10E098;
 Wed, 11 Mar 2026 15:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773244366; x=1804780366;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uG869t6HGAcmjIfly/o3jUK1NEazwOC8zTnWbqkUebE=;
 b=DfTIrREMQhlOxxdXW8x10I7LOpgqqzdDzf4L342oL9HVEijfASIjSnt3
 lIRqkBPSOI+fgWYhXuHKijTPwYwXPumr8GZcfG00aED3oOmqwscaaK+um
 lzv3LaOU7Sm8y3QxLBj3blfFtXo4CEBkYQe90WC/2SqMCh4QNOwBhnTNI
 S5J306Z7vKxd5vJbotoCvDDjlXJPYR3HcuzvfmF2fHiWsiAVX6hKQsLi1
 +U7Hvgkdiv+GldQIKbKQVZVhg+v8eP3zroU7LV/drQOsXn6pno9Eqyi2C
 n4jyrLtwvFuJgtdkOxlwOOL0q1NoDSqYsGJCX4412YamKcZC2sMPQT7mE Q==;
X-CSE-ConnectionGUID: A3OLHqqwS4WRYrwdVSC1JQ==
X-CSE-MsgGUID: nKTM/RjzQ6ukeflbMSshAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74398173"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74398173"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 08:52:46 -0700
X-CSE-ConnectionGUID: kbh0C4BITbaYpVvsWgcVjg==
X-CSE-MsgGUID: HJOSLQRXSDm+579X7cZMvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="246064342"
Received: from gsd-build.iind.intel.com ([10.190.229.167])
 by fmviesa001.fm.intel.com with ESMTP; 11 Mar 2026 08:52:43 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/sa: Scan all holes when fences are disabled
Date: Wed, 11 Mar 2026 15:52:35 +0000
Message-ID: <20260311155233.1903253-6-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311155233.1903253-5-satyanarayana.k.v.p@intel.com>
References: <20260311155233.1903253-5-satyanarayana.k.v.p@intel.com>
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

The suballocator algorithm tracks a hole cursor at the last allocation
and tries to allocate after it. This is optimized for fence-ordered
progress, where older allocations are expected to become reusable first.

In fence-enabled mode, that ordering assumption holds. In fence-disabled
mode, allocations may be freed in arbitrary order, so limiting allocation
to the current hole window can miss valid free space and fail allocations
despite sufficient total space.

Update the fence-disabled path to walk through all holes and select any
fitting range, while keeping the existing fence-based behavior unchanged.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/drm_suballoc.c | 90 ++++++++++++++++++++++++++++++++++
 include/drm/drm_suballoc.h     |  5 ++
 2 files changed, 95 insertions(+)

diff --git a/drivers/gpu/drm/drm_suballoc.c b/drivers/gpu/drm/drm_suballoc.c
index b74277bbc14b..307da191a855 100644
--- a/drivers/gpu/drm/drm_suballoc.c
+++ b/drivers/gpu/drm/drm_suballoc.c
@@ -78,12 +78,33 @@ void drm_suballoc_manager_init(struct drm_suballoc_manager *sa_manager,
 	sa_manager->size = size;
 	sa_manager->align = align;
 	sa_manager->hole = &sa_manager->olist;
+	sa_manager->fence_disable = false;
 	INIT_LIST_HEAD(&sa_manager->olist);
 	for (i = 0; i < DRM_SUBALLOC_MAX_QUEUES; ++i)
 		INIT_LIST_HEAD(&sa_manager->flist[i]);
 }
 EXPORT_SYMBOL(drm_suballoc_manager_init);
 
+/**
+ * drm_suballoc_manager_fence_disable() - Enable or disable fence tracking.
+ * @sa_manager: Pointer to the suballocation manager.
+ * @fence_disable: Whether to disable fence tracking for free suballocations.
+ *
+ * When @fence_disable is true allocation scans all holes without waiting on
+ * fences. When false, the manager tracks free suballocations behind fences and
+ * reuses them only after the fence signals.
+ *
+ * This should be called immediately after creating the suballocator and before
+ * any allocations are made. The behaviour is undefined if this is called after
+ * allocations have been made.
+ */
+void drm_suballoc_manager_fence_disable(struct drm_suballoc_manager *sa_manager,
+					bool fence_disable)
+{
+	sa_manager->fence_disable = fence_disable;
+}
+EXPORT_SYMBOL(drm_suballoc_manager_fence_disable);
+
 /**
  * drm_suballoc_manager_fini() - Destroy the drm_suballoc_manager
  * @sa_manager: pointer to the sa_manager
@@ -110,6 +131,7 @@ void drm_suballoc_manager_fini(struct drm_suballoc_manager *sa_manager)
 	}
 
 	sa_manager->size = 0;
+	sa_manager->fence_disable = false;
 }
 EXPORT_SYMBOL(drm_suballoc_manager_fini);
 
@@ -161,6 +183,69 @@ static size_t drm_suballoc_hole_eoffset(struct drm_suballoc_manager *sa_manager)
 	return sa_manager->size;
 }
 
+/**
+ * drm_suballoc_hole_soffset_eoffset() - Find a hole fitting size and alignment.
+ * @sa_manager: Suballocator manager.
+ * @soffset: Start offset of the selected hole.
+ * @eoffset: End offset of the selected hole.
+ * @size: Size to be allocated.
+ * @align: Allocation alignment.
+ *
+ * This function is used when fences are disabled. It scans the holes starting
+ * at the current hole pointer and selects the first one that can satisfy @size
+ * once @align padding is applied. We may need to scan the entire list of holes
+ * and update soffset and eoffset for each hole to find a suitable one, as the
+ * current hole pointer may not be the same as sa_manager->hole.
+ *
+ * Return: true if a suitable hole is found, false otherwise.
+ */
+static bool drm_suballoc_hole_soffset_eoffset(struct drm_suballoc_manager *sa_manager,
+					      size_t *soffset, size_t *eoffset,
+					      size_t size, size_t align)
+{
+	struct list_head *start, *hole;
+
+	if (!sa_manager->fence_disable)
+		return true;
+
+	start = sa_manager->hole;
+	hole = start;
+
+	do {
+		size_t s, e, wasted;
+
+		/*
+		 * We can't use drm_suballoc_hole_soffset() and
+		 * drm_suballoc_hole_eoffset() here as the hole may not be same
+		 * as sa_manager->hole.
+		 */
+		if (hole != &sa_manager->olist)
+			s = list_entry(hole, struct drm_suballoc, olist)->eoffset;
+		else
+			s = 0;
+
+		if (hole->next != &sa_manager->olist)
+			e = list_entry(hole->next, struct drm_suballoc, olist)->soffset;
+		else
+			e = sa_manager->size;
+
+		if (e < s || e == s || (e - s) < size) {
+			hole = hole->next;
+			continue;
+		}
+
+		wasted = round_up(s, align) - s;
+		if ((e - s) >= (size + wasted)) {
+			*soffset = s;
+			*eoffset = e;
+			sa_manager->hole = hole;
+			return true;
+		}
+	} while (hole != start);
+
+	return false;
+}
+
 static bool drm_suballoc_try_alloc(struct drm_suballoc_manager *sa_manager,
 				   struct drm_suballoc *sa,
 				   size_t size, size_t align)
@@ -169,6 +254,11 @@ static bool drm_suballoc_try_alloc(struct drm_suballoc_manager *sa_manager,
 
 	soffset = drm_suballoc_hole_soffset(sa_manager);
 	eoffset = drm_suballoc_hole_eoffset(sa_manager);
+
+	if (!drm_suballoc_hole_soffset_eoffset(sa_manager, &soffset,
+					       &eoffset, size, align))
+		return false;
+
 	wasted = round_up(soffset, align) - soffset;
 
 	if ((eoffset - soffset) >= (size + wasted)) {
diff --git a/include/drm/drm_suballoc.h b/include/drm/drm_suballoc.h
index 29befdda35d2..066412196f8a 100644
--- a/include/drm/drm_suballoc.h
+++ b/include/drm/drm_suballoc.h
@@ -20,6 +20,7 @@
  * @flist: Array[fence context hash] of queues of fenced allocated ranges.
  * @size: Size of the managed range.
  * @align: Default alignment for the managed range.
+ * @fence_disable: Fences are disabled for this SA manager.
  */
 struct drm_suballoc_manager {
 	wait_queue_head_t wq;
@@ -28,6 +29,7 @@ struct drm_suballoc_manager {
 	struct list_head flist[DRM_SUBALLOC_MAX_QUEUES];
 	size_t size;
 	size_t align;
+	bool fence_disable;
 };
 
 /**
@@ -51,6 +53,9 @@ struct drm_suballoc {
 void drm_suballoc_manager_init(struct drm_suballoc_manager *sa_manager,
 			       size_t size, size_t align);
 
+void drm_suballoc_manager_fence_disable(struct drm_suballoc_manager
+					*sa_manager, bool fence_disable);
+
 void drm_suballoc_manager_fini(struct drm_suballoc_manager *sa_manager);
 
 struct drm_suballoc *drm_suballoc_alloc(gfp_t gfp);
-- 
2.43.0

