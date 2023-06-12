Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB57C7EE2F
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jun 2023 17:14:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB0A110E18F;
	Mon, 12 Jun 2023 17:14:58 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0DF10E2BF
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jun 2023 17:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686590094; x=1718126094;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dZUTXHsMCpZAh1pXEcitzWgfR6+JsKzSzeQIUz3kDFw=;
 b=E1/iU8Wv2ooujG2dDj/iFEeoVdPqRvInYEYpI2F2A5X2FrcaCV2YyiFP
 s2vobkvLN11/HDhkBB2anKy9Lv9eE79F5lBruwFlTmSZl6U5SYq06FWn8
 dlxBWz5z4VhKKLzRFEc2zyON6FgJR5gV8hoPaba2s/DasZHt2RwNW8I0B
 Vkc2SZvP/4v2OdC/o1I6NXgTdxoLtmrRwiKuEkqhSt7NRJ43ntBy1wlzp
 N63XsmKthJ6nrpt8aX8sh4SpT8i+yuVXdS3xsvIrSNtMmjv6RyCljD6uz
 f346GWNYv82iDGVOcOsw9QLjdguJZQB2CiH/HB4p0+WWnD0uWNm47vC16 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="342792838"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="342792838"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 10:14:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="688715285"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="688715285"
Received: from mgutier2-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.22.12])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 10:14:52 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 12 Jun 2023 18:12:25 +0100
Message-Id: <20230612171225.88689-13-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612171225.88689-1-matthew.auld@intel.com>
References: <20230612171225.88689-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v11 12/12] drm/xe: add lockdep annotation for
 xe_device_mem_access_get()
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The atomics here might hide potential issues, so add a dummy lock with
the idea that xe_pm_runtime_resume() is eventually going to be called
when we are holding it. This only need to happen once and then lockdep
can validate all callers and their locks.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h |  8 ++++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1dc552da434f..3011a72da42f 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -225,6 +225,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	if (WARN_ON(err))
 		goto err_put;
 
+	drmm_mutex_init(&xe->drm, &xe->mem_access.lock);
+
 	return xe;
 
 err_put:
@@ -443,6 +445,22 @@ void xe_device_mem_access_get(struct xe_device *xe)
 	if (xe_pm_read_callback_task(xe) == current)
 		return;
 
+	/*
+	 * Since the resume here is synchronous it can be quite easy to deadlock
+	 * if we are not careful. Also in practice it might be quite timing
+	 * sensitive to ever see the 0 -> 1 transition with the callers locks
+	 * held, so deadlocks might exist but are hard for lockdep to ever see.
+	 * With this in mind, help lockdep learn about the potentially scary
+	 * stuff that can happen inside the runtime_resume callback by acquiring
+	 * a dummy lock (it doesn't protect anything and gets compiled out on
+	 * non-debug builds).  Lockdep then only needs to see the
+	 * mem_access.lock -> runtime_resume callback once, and then can
+	 * hopefully validate all the (callers_locks) -> mem_access.lock. For
+	 * example if the (callers_locks) are ever grabbed in the runtime_resume
+	 * callback, lockdep should give us a nice splat.
+	 */
+	lock_map_acquire(&xe->mem_access.lock.dep_map);
+
 	if (!atomic_inc_not_zero(&xe->mem_access.ref)) {
 		bool hold_rpm = xe_pm_runtime_resume_and_get(xe);
 		int ref;
@@ -455,6 +473,8 @@ void xe_device_mem_access_get(struct xe_device *xe)
 	} else {
 		XE_WARN_ON(atomic_read(&xe->mem_access.ref) == S32_MAX);
 	}
+
+	lock_map_release(&xe->mem_access.lock.dep_map);
 }
 
 void xe_device_mem_access_put(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index a39f3d3f3bc7..82b80e3f2d44 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -323,6 +323,14 @@ struct xe_device {
 	 * triggering additional actions when they occur.
 	 */
 	struct {
+		/**
+		 * @lock: Dummy lock used as lockdep aid to hopefully ensure
+		 * that lockep can more easily see any potential deadlocks when
+		 * calling xe_device_mem_access_get().
+		 *
+		 * Doesn't protect anything.
+		 */
+		struct mutex lock;
 		/** @ref: ref count of memory accesses */
 		atomic_t ref;
 		/** @hold_rpm: need to put rpm ref back at the end */
-- 
2.40.1

