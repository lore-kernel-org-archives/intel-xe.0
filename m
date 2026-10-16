Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C54CCF2C1
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 13:36:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA6210E25F;
	Fri, 16 Oct 2026 13:36:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D3810E0B7
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 13:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792157764; x=1823693764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Da9WsmUX677iK+5NyOWTP3lFaWTo4mTnrhQdycKlgp0=;
 b=lnfWlMuVg3kC+tfWsivlL/VglzVBwcts+sNsqzKqewcitVbjDeV/CtS+
 /zKwWOwvtQvQoqlTQC+x2QB8IAnb7AhCwftrlb5yF+3fArOfbLsS226ZP
 Ql7q7Bu67Z+KFC8M+oCy0pOnRNSIda/1OcM4Pfg9rNc49yIeaKx5Fvkio
 6/WtkKMxIP9EIz33mlQJqnOC2dNmqdcqLY4tIRMY1QTHeHyogd+n2oF8/
 bKA6Yox0TVrJMELalz2CbhIgPN5ajPb1uKIOb+MVqfM8PJrMXtt7+5DGq
 WApzhZb8Jp8xsZu1CqN0QQcLZuu9eT93qOgSpoSIwdLV9CzbVekQ86Pbo A==;
X-CSE-ConnectionGUID: fvZzmaAURWOAB6s6RGh+ug==
X-CSE-MsgGUID: ObxMeCYQRdeO6cgzxCBdnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="831463"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="831463"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 06:36:03 -0700
X-CSE-ConnectionGUID: RJjjyFlPSV6uKdUVnXN//w==
X-CSE-MsgGUID: 3bUw1YJ+Tge0WUw8XVSFWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="2273506"
Received: from abityuts-desk1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 06:36:01 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v4 4/4] drm/xe: Update non-purgeable shrinker batch size based
 on average BO size
Date: Fri, 16 Oct 2026 15:35:23 +0200
Message-ID: <20261016133523.3622-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016133523.3622-1-thomas.hellstrom@linux.intel.com>
References: <20261016133523.3622-1-thomas.hellstrom@linux.intel.com>
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

Update our preferred vmscan batch size for the non-purgeable shrinker
on count passes that allow backup (__GFP_FS), to avoid invoking
scan_objects() for requests too small to free even a single
average-sized GEM object. Our rough estimate for an effective batch
is twice the average number of pages per populated ttm_tt across
the full shrinkable and purgeable population. The factor of two
provides headroom so that most scan invocations can free at least one
GEM object despite variability in object sizes.

The batch value is updated as an exponential moving average,
(old_batch + avg) / 2, to smooth out sudden changes in the object
population. It is floored at 128 pages, the kernel default
SHRINK_BATCH, to ensure the shrinker remains responsive when there
are very few objects.

The populated_tts counter introduced in an earlier commit provides the
object count needed for the average. We inherit the same justification
as the analogous mechanism in i915: shrinking a GEM object has
non-trivial per-object overhead, so firing the shrinker for requests
smaller than a single object is wasteful.

This is only applied to the non-purgeable shrinker: purgeable objects
are reclaimed without writeback or GPU idling, so they're cheap enough
that the core default batch size is fine for them.

v3:
- Original patch reworked on top of shrinker split (Matt Brost)

Assisted-by: LLM
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_shrinker.c | 48 ++++++++++++++++++++++++++++----
 1 file changed, 42 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
index 8e3fe675e0f3..955908b3bdf3 100644
--- a/drivers/gpu/drm/xe/xe_shrinker.c
+++ b/drivers/gpu/drm/xe/xe_shrinker.c
@@ -30,6 +30,8 @@
  * @shrinkable_pages: Number of pages that are currently shrinkable.
  * @purgeable_pages: Number of pages that are currently purgeable.
  * @populated_tts: Number of populated ttm_tts currently shrinkable or purgeable.
+ * @batch_avg: Exponential moving average of the preferred non-purgeable
+ * batch size, based on the average populated ttm_tt size.
  * @shrink: Pointer to the mm shrinker handling non-purgeable (shrinkable) objects.
  * @purge_shrink: Pointer to the mm shrinker handling purgeable objects.
  * @pm_worker: Worker to wake up the device if required.
@@ -40,6 +42,7 @@ struct xe_shrinker {
 	long shrinkable_pages;
 	long purgeable_pages;
 	long populated_tts;
+	long batch_avg;
 	struct shrinker *shrink;
 	struct shrinker *purge_shrink;
 	struct work_struct pm_worker;
@@ -203,6 +206,28 @@ xe_shrinker_count_purgeable(struct shrinker *shrink, struct shrink_control *sc)
 	return num_pages ? num_pages : SHRINK_EMPTY;
 }
 
+/**
+ * DOC: Batch size calculation
+ *
+ * Update our preferred vmscan batch size for the non-purgeable shrinker
+ * on count passes that allow backup (__GFP_FS), to avoid invoking
+ * scan_objects() for requests too small to free even a single
+ * average-sized GEM object. Our rough estimate for an effective batch
+ * is twice the average number of pages per populated ttm_tt across
+ * the full shrinkable and purgeable population. The factor of two
+ * provides headroom so that most scan invocations can free at least one
+ * GEM object despite variability in object sizes.
+ *
+ * The batch value is updated as an exponential moving average,
+ * (old_batch + avg) / 2, to smooth out sudden changes in the object
+ * population. It is floored at 128 pages, the kernel default
+ * SHRINK_BATCH, to ensure the shrinker remains responsive when there
+ * are very few objects.
+ *
+ * We only do this for the non-purgeable shrinker: purgeable objects are
+ * reclaimed without writeback or GPU idling, so shrinking them is cheap
+ * enough that the core default batch size is fine.
+ */
 static unsigned long
 xe_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
 {
@@ -210,15 +235,26 @@ xe_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
 	unsigned long num_pages;
 	bool can_backup = !!(sc->gfp_mask & __GFP_FS);
 
+	if (!can_backup)
+		return SHRINK_EMPTY;
+
 	num_pages = ttm_backup_bytes_avail() >> PAGE_SHIFT;
-	read_lock(&shrinker->lock);
+	/* Consistently use write_lock() for simplicity. */
+	write_lock(&shrinker->lock);
 
-	if (can_backup)
-		num_pages = min_t(unsigned long, num_pages, shrinker->shrinkable_pages);
-	else
-		num_pages = 0;
+	num_pages = min_t(unsigned long, num_pages, shrinker->shrinkable_pages);
 
-	read_unlock(&shrinker->lock);
+	if (shrinker->populated_tts) {
+		unsigned long avg = 2 * (shrinker->shrinkable_pages +
+					 shrinker->purgeable_pages) /
+				     shrinker->populated_tts;
+
+		shrinker->batch_avg = max((shrinker->batch_avg + (long)avg) >> 1,
+					  128L /* default SHRINK_BATCH */);
+		WRITE_ONCE(shrink->batch, shrinker->batch_avg);
+	}
+
+	write_unlock(&shrinker->lock);
 
 	return num_pages ? num_pages : SHRINK_EMPTY;
 }
-- 
2.56.0

