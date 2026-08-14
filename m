Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E771C5CFC1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 14:38:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B42C10E57C;
	Fri, 14 Aug 2026 14:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XFbhtvvu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3931010E579
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 14:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786718284; x=1818254284;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CI26sZDdECdgTcUBsxMyUlXfu+8xDoRhrnude6pX9Xc=;
 b=XFbhtvvu5wKbIxXQAA1pH2l8iEyNmPzP5sL13n6SxPOTTUvi5h3sSzRH
 ZXrF84koL8E6jMOjcdFVvLSurOP6yJB6+dGXxsRnNA2wrlljV9OymmEU9
 y3ap+ZchrsvCshj8kCVFEMYosch1gxv3zOt65klcX9HiIdMIo32/vcL8R
 rUVUr4krUkM0YypXmnY8lC7PtpZTxzK0ioY6YhfXPykDtN7/bEt9/lUts
 3OAKlk0D5tlRStIscG+GNaK7KeYQ0mc3qbUIayoFVDajvNtJht9NbG471
 FzH7OLvg93URxSlCgZfHogP8s2QrPqyMwEYxlX2MSoATOg85lcwPTEqFb Q==;
X-CSE-ConnectionGUID: egeTh5lvS/CHG8cKdlo+SA==
X-CSE-MsgGUID: SB2dUBHlQ8+mvtWNCVfhMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="98655222"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98655222"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 07:38:04 -0700
X-CSE-ConnectionGUID: maAxIqA4S/+F49U0vQuhpA==
X-CSE-MsgGUID: ZsjMzth0RKe0p4dzT+h3VA==
X-ExtLoop1: 1
Received: from rvuia-mobl.ger.corp.intel.com (HELO fedora) ([10.245.244.164])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 07:38:03 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v2 2/2] drm/xe: Update shrinker batch size based on average BO
 size
Date: Fri, 14 Aug 2026 16:37:37 +0200
Message-ID: <20260814143737.49684-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814143737.49684-1-thomas.hellstrom@linux.intel.com>
References: <20260814143737.49684-1-thomas.hellstrom@linux.intel.com>
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

v2:
- Fix the average object size estimate to account for the full
  shrinkable and purgeable population.

Assisted-by: GitHub_Copilot:claude-sonnet-4.6
Assisted-by: GitHub_Copilot:claude-sonnet-5
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_shrinker.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
index cded230f5459..284fce207705 100644
--- a/drivers/gpu/drm/xe/xe_shrinker.c
+++ b/drivers/gpu/drm/xe/xe_shrinker.c
@@ -146,6 +146,8 @@ xe_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
 {
 	struct xe_shrinker *shrinker = to_xe_shrinker(shrink);
 	unsigned long num_pages;
+	unsigned long total_pages;
+	unsigned long populated_tts;
 	bool can_backup = !!(sc->gfp_mask & __GFP_FS);
 
 	num_pages = ttm_backup_bytes_avail() >> PAGE_SHIFT;
@@ -157,8 +159,32 @@ xe_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
 		num_pages = 0;
 
 	num_pages += shrinker->purgeable_pages;
+	total_pages = shrinker->shrinkable_pages + shrinker->purgeable_pages;
+	populated_tts = shrinker->populated_tts;
 	read_unlock(&shrinker->lock);
 
+	/*
+	 * Update our preferred vmscan batch size for the next pass.
+	 * Our rough guess for an effective batch size is twice the average
+	 * number of pages per GEM object. That is, we don't want the
+	 * shrinker to fire until the request is large enough to justify
+	 * the overhead of freeing at least one GEM object.
+	 *
+	 * Base the average on the full shrinkable + purgeable population
+	 * (total_pages), not on num_pages, which is reduced to just the
+	 * purgeable pages whenever the gfp mask disallows backup (can_backup
+	 * false). Otherwise the estimate would systematically undershoot in
+	 * exactly the GFP_NOFS / GFP_NOIO reclaim paths where avoiding
+	 * excessive scan_objects() calls matters most.
+	 */
+	if (populated_tts) {
+		unsigned long avg = 2 * total_pages / populated_tts;
+
+		shrinker->shrink->batch =
+			max((shrinker->shrink->batch + avg) >> 1,
+			    128UL /* default SHRINK_BATCH */);
+	}
+
 	return num_pages ? num_pages : SHRINK_EMPTY;
 }
 
-- 
2.55.0

