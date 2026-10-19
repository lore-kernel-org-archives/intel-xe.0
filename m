Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D0ACCF2DF
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 09:57:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9DB10E90A;
	Mon, 19 Oct 2026 09:57:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA54D10E90A
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Oct 2026 09:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792403853; x=1823939853;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eL/slysQOD2UhVTeGx0m6roOEiZbT3sZDWmctlymdws=;
 b=axCINeGRMoXj/qvXm7geMs8Gmoq6xonsiC35GgFj+BeTYneNfVyOi5Wo
 KH1dU1QVjibvvexnWApktnc1R29V/Hhb4h6b6IVWEk/NuTeFdfvoLO7cw
 k4ToKqDNGx73JevsCpKMTGCBlsfAarMZ/bKSyH91LHOgv/ZH3vIEhAm7O
 uCom76f4wJnD+Mcq7eVV017I4u4aGWKNvKzEZ5+VelZZIHO9RrwfjG8uj
 fzT8xWLMVVZknqmimv5QAng7fKuryH114+lidHSLb+4ubZXpaH/qlVSE2
 5lihQi8bjdD81y8MPvXAp8m9Aon3ErYupYyIrVCHN3Axc+MZoW/WSMa16 A==;
X-CSE-ConnectionGUID: OtI9MDIoRzaM3ChTX+y1ug==
X-CSE-MsgGUID: M1S+xv3DTWy/8OmDs6ISQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1095004"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1095004"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 02:57:32 -0700
X-CSE-ConnectionGUID: t43zrXL+SSWrRbFePszK8g==
X-CSE-MsgGUID: 190zSOe9TUCBAYcA9+83gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2553658"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO fedora)
 ([10.245.244.14])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 02:57:30 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v5 4/4] drm/xe: Update non-purgeable shrinker batch size based
 on average BO size
Date: Mon, 19 Oct 2026 11:56:55 +0200
Message-ID: <20261019095655.3501-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019095655.3501-1-thomas.hellstrom@linux.intel.com>
References: <20261019095655.3501-1-thomas.hellstrom@linux.intel.com>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_shrinker.c | 48 ++++++++++++++++++++++++++++----
 1 file changed, 42 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
index 39aa0fad8c24..772dab9b3ed7 100644
--- a/drivers/gpu/drm/xe/xe_shrinker.c
+++ b/drivers/gpu/drm/xe/xe_shrinker.c
@@ -34,6 +34,8 @@
  * @shrinkable_pages: Number of pages that are currently shrinkable.
  * @purgeable_pages: Number of pages that are currently purgeable.
  * @populated_tts: Number of populated ttm_tts currently shrinkable or purgeable.
+ * @batch_avg: Exponential moving average of the preferred non-purgeable
+ * batch size, based on the average populated ttm_tt size.
  * @shrink: Pointer to the mm shrinker handling non-purgeable (shrinkable) objects.
  * @purge_shrink: Pointer to the mm shrinker handling purgeable objects.
  * @pm_worker: Worker to wake up the device if required.
@@ -44,6 +46,7 @@ struct xe_shrinker {
 	long shrinkable_pages;
 	long purgeable_pages;
 	long populated_tts;
+	long batch_avg;
 	struct shrinker *shrink;
 	struct shrinker *purge_shrink;
 	struct work_struct pm_worker;
@@ -207,6 +210,28 @@ xe_shrinker_count_purgeable(struct shrinker *shrink, struct shrink_control *sc)
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
@@ -214,15 +239,26 @@ xe_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
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

