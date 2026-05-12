Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F13CD4F24
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 13:53:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB97310EAD0;
	Tue, 12 May 2026 13:53:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SixQHrVX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8724910EAD0
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 13:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778594037; x=1810130037;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H6TPEOeRZDQbE19gwwV+9dh8dI0PGyCLmDb24rL5E9o=;
 b=SixQHrVXzbsAvK5ruYw1DfL/eW+FIQpC1ifIj7KU1GtfpE270QpG1wD4
 dRa4LMYDaU8d5k7jRtZkFG60LCiG92cczUrjOJcIVw/PsU+MuneQkD31U
 xLO0tV7OQz+7UszYtiQ6wEzkmwj754qYbBO7yw6Mucwh11NxRDBHFuEJz
 dN5LeMiv2xrSmYOsGzJRv1OvVH/YAsIVYMmlRIFfE4bvstGnE3by4AD4u
 QTDqy5AEpA1UMJQphNrF+cEbhoQPAoetAkV3resS8Q2LkuF1IoULv8vlv
 48F9IbFSp8ijVaTZo97d/fR30WkaUrOVLjqkoiGrNTTVF1Ge1naoDLn6W A==;
X-CSE-ConnectionGUID: jRBUSQL2RwmeM1TmJXciaQ==
X-CSE-MsgGUID: eMdTITYUT6GJsa12zjO/Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="96927801"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="96927801"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 06:53:57 -0700
X-CSE-ConnectionGUID: 5KYMWJt8Rn2AnFfPqr9u4g==
X-CSE-MsgGUID: z6WWUl8hQpamyIDceRkpIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="242134755"
Received: from vpanait-mobl.ger.corp.intel.com (HELO fedora) ([10.245.245.172])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 06:53:55 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 2/2] drm/xe: Update shrinker batch size based on average BO
 size
Date: Tue, 12 May 2026 15:53:32 +0200
Message-ID: <20260512135332.11702-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260512135332.11702-1-thomas.hellstrom@linux.intel.com>
References: <20260512135332.11702-1-thomas.hellstrom@linux.intel.com>
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

Update our preferred vmscan batch size on each count pass to avoid
invoking scan_objects for requests too small to free even a single
average-sized GEM object. Our rough estimate for an effective batch
is twice the average number of pages per populated ttm_tt across all
shrinkable and purgeable objects. The factor of two provides headroom
so that most scan invocations can free at least one GEM object despite
variability in object sizes.

The batch value is updated as an exponential moving average,
(old_batch + avg) / 2, to smooth out sudden changes in the
object population. It is floored at 128 pages, the kernel default
SHRINK_BATCH, to ensure the shrinker remains responsive when there
are very few objects.

The populated_tts counter introduced in the previous commit provides
the object count needed for the average. We inherit the same
justification as the analogous mechanism in i915: shrinking a GEM
object has non-trivial locking overhead, so firing the shrinker for
requests smaller than a single object is wasteful.

Assisted-by: GitHub_Copilot:claude-sonnet-4.6
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_shrinker.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
index cded230f5459..a15f568d8186 100644
--- a/drivers/gpu/drm/xe/xe_shrinker.c
+++ b/drivers/gpu/drm/xe/xe_shrinker.c
@@ -146,6 +146,7 @@ xe_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
 {
 	struct xe_shrinker *shrinker = to_xe_shrinker(shrink);
 	unsigned long num_pages;
+	unsigned long populated_tts;
 	bool can_backup = !!(sc->gfp_mask & __GFP_FS);
 
 	num_pages = ttm_backup_bytes_avail() >> PAGE_SHIFT;
@@ -157,8 +158,24 @@ xe_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
 		num_pages = 0;
 
 	num_pages += shrinker->purgeable_pages;
+	populated_tts = shrinker->populated_tts;
 	read_unlock(&shrinker->lock);
 
+	/*
+	 * Update our preferred vmscan batch size for the next pass.
+	 * Our rough guess for an effective batch size is twice the average
+	 * number of pages per GEM object. That is, we don't want the
+	 * shrinker to fire until the request is large enough to justify
+	 * the overhead of freeing at least one GEM object.
+	 */
+	if (populated_tts) {
+		unsigned long avg = 2 * num_pages / populated_tts;
+
+		shrinker->shrink->batch =
+			max((shrinker->shrink->batch + avg) >> 1,
+			    128UL /* default SHRINK_BATCH */);
+	}
+
 	return num_pages ? num_pages : SHRINK_EMPTY;
 }
 
-- 
2.54.0

