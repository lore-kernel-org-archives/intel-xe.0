Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0F710A62CA
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 13:09:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3053610E925;
	Thu, 26 Mar 2026 13:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lvtAb4jH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9332410E2E2
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 13:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774530552; x=1806066552;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1oHsTLea++QJhAflQwaG8RvuEkSYw/zgiJBx5YPLKQU=;
 b=lvtAb4jHqmtVjH+g8pZOKs7ylRrCzF3xCxr3vndaYpj+U74/6xy+wl3P
 VA4zxLD+uuJ65q3odR5LnX5ilZAfh+rkOjLd3ZEWKmkHEglK9kEhbqiky
 J/QJ06NIFdP5yjy1S/BDX1SAnrvRiKhkclP30q13iEucIILJN3sTGV82F
 NYgq7DvwK4Bh+slnFr//SqhfjSrMH1aGTC9sAnibcF3Qnm5Zux205IGc9
 cF2gGBDZhBzPvrJ8yqCdwKe19KrFXYg8+HxOkbZqCS86JS8BdHRaJ3/jk
 PZva+42B5RZwDLzDfxqyIPsfCcbDTuzP3r5BumNCeSZ8mIH2jY0CyP5/6 w==;
X-CSE-ConnectionGUID: c7QguObQQh2dU6VpA6OvEw==
X-CSE-MsgGUID: Tp58BSkHRRm4eqMQdZm/2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75784780"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="75784780"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 06:09:12 -0700
X-CSE-ConnectionGUID: o8FLEACORf2AQUmjRIvoYA==
X-CSE-MsgGUID: CGxzeLjvSzudXz3eQRW/0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="224070555"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 06:09:10 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [PATCH v9 08/12] drm/xe/bo: Block mmap of DONTNEED/purged BOs
Date: Thu, 26 Mar 2026 18:38:34 +0530
Message-ID: <20260326130843.3545241-9-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326130843.3545241-1-arvind.yadav@intel.com>
References: <20260326130843.3545241-1-arvind.yadav@intel.com>
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

Don't allow new CPU mmaps to BOs marked DONTNEED or PURGED.
DONTNEED BOs can have their contents discarded at any time, making
CPU access undefined behavior. PURGED BOs have no backing store and
are permanently invalid.

Return -EBUSY for DONTNEED BOs (temporary purgeable state) and
-EINVAL for purged BOs (permanent, no backing store).

The mmap offset ioctl now checks the BO's purgeable state before
allowing userspace to establish a new CPU mapping. This prevents
the race where userspace gets a valid offset but the BO is purged
before actual faulting begins.

Existing mmaps (established before DONTNEED) may still work until
pages are purged, at which point CPU faults fail with SIGBUS.

v6:
- Split DONTNEED → -EBUSY and PURGED → -EINVAL for consistency
  with the rest of the series (Thomas, Matt)

v7:
  - Move purgeable check from xe_gem_mmap_offset_ioctl() into a new
    xe_gem_object_mmap() callback that wraps drm_gem_ttm_mmap(). (Thomas)
  - Use an interruptible lock. (Thomas)

v8:
  - Check xe_bo_lock() return value and propagate error. (Thomas and
    Matt)

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 7da374c7a44e..533e75b9c701 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2168,10 +2168,35 @@ static const struct vm_operations_struct xe_gem_vm_ops = {
 	.access = xe_bo_vm_access,
 };
 
+static int xe_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
+{
+	struct xe_bo *bo = gem_to_xe_bo(obj);
+	int err = 0;
+
+	/*
+	 * Reject mmap of purgeable BOs. DONTNEED BOs can be purged
+	 * at any time, making CPU access undefined behavior. Purged BOs have
+	 * no backing store and are permanently invalid.
+	 */
+	err = xe_bo_lock(bo, true);
+	if (err)
+		return err;
+
+	if (xe_bo_madv_is_dontneed(bo))
+		err = -EBUSY;
+	else if (xe_bo_is_purged(bo))
+		err = -EINVAL;
+	xe_bo_unlock(bo);
+	if (err)
+		return err;
+
+	return drm_gem_ttm_mmap(obj, vma);
+}
+
 static const struct drm_gem_object_funcs xe_gem_object_funcs = {
 	.free = xe_gem_object_free,
 	.close = xe_gem_object_close,
-	.mmap = drm_gem_ttm_mmap,
+	.mmap = xe_gem_object_mmap,
 	.export = xe_gem_prime_export,
 	.vm_ops = &xe_gem_vm_ops,
 };
-- 
2.43.0

