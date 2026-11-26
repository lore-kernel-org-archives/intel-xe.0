Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A55606A31E
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 10:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HVLySK4o
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED55A10E2B6;
	Thu, 26 Nov 2026 10:46:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F2410E1F9
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 10:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795689971; x=1827225971;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rUrGMmi3OvEnUWTwsN11RgCidHPKvaGsPTwsXIomzQY=;
 b=HVLySK4o8RT5IxB6U69CUelFfaknpFr7hXElyvUDjLQSNLchrsr5pjDA
 r4S6stnYRM/tZqf7zwINtRAMhUPop2HF1IPmJijrBczEymxaCo+Id0ra7
 fpj4VKKc0Exyof+IgvCitjoGOjUth8oQkGKhhTXvLa7ssodAjUE8++gTn
 sf/Fk2UfQim5aTYjUo5ZxTpz2ucbJjypdCIfjQHuFej29Rrd5TRODKdIJ
 EJo42Xs8jrtu7QLTtU04eBxL2l9lmm9++50qhARQiddAQiQWjoDPXm26B
 bgsZgunESbs/M/5gQCjUB/rH636B+hNh2KSGWx0meh6lQ3IWcsVTJcNez g==;
X-CSE-ConnectionGUID: QngYexEAQfOktAyLP9DXXg==
X-CSE-MsgGUID: QgxRcMAoTh+xCaTRaY657A==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4605055"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4605055"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 02:46:11 -0800
X-CSE-ConnectionGUID: 1hZBzQ4eQB6srRrclPWC5w==
X-CSE-MsgGUID: BedXQBk4SlKTzak6gZP0ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12744917"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 02:46:09 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 arvind.yadav@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V3 3/3] drm/xe/vram: stop decay worker from rescheduling
 itself forever
Date: Thu, 26 Nov 2026 16:15:56 +0530
Message-ID: <20261126104552.3890797-8-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261126104552.3890797-5-tejas.upadhyay@intel.com>
References: <20261126104552.3890797-5-tejas.upadhyay@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

xe_ttm_vram_decay_gc_worker() unconditionally called
schedule_delayed_work() at its tail, so once the worker started (on
the first SOFT-offlined page) it kept waking up forever at the decay
period, even after every SOFT entry had long since decayed away or
been promoted to HARD. The reservation path already re-arms the worker
appears, so the perpetual self-reschedule serves no purpose once the
list has nothing left to track.

Track whether any SOFT entries remain after the sweep and only
reschedule in that case, letting the worker go idle otherwise.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 5aee3e135143..0dede12799bd 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -383,17 +383,20 @@ static void xe_ttm_vram_decay_gc_worker(struct work_struct *work)
 	struct xe_device *xe = ttm_to_xe_device(mgr->manager.bdev);
 	unsigned long now = jiffies;
 	unsigned long decay;
+	bool soft_remaining = false;
 
 	mutex_lock(&mgr->lock);
 	decay = mgr->decay_interval_jiffies;
 	if (!decay)
-		goto reschedule;
+		goto unlock;
 
 	list_for_each_entry_safe(pos, n, &mgr->offlined_pages, offlined_link) {
 		if (pos->mode != XE_PAGE_OFFLINE_SOFT)
 			continue;
-		if (!time_after(now, pos->last_seen + decay))
+		if (!time_after(now, pos->last_seen + decay)) {
+			soft_remaining = true;
 			continue;
+		}
 
 		list_del(&pos->offlined_link);
 		xe_ttm_vram_buddy_free(mgr, &pos->blocks, pos->used_visible_size);
@@ -404,9 +407,11 @@ static void xe_ttm_vram_decay_gc_worker(struct work_struct *work)
 		kfree(pos);
 	}
 
-reschedule:
-	schedule_delayed_work(&mgr->decay_gc_work,
-			      xe_ttm_vram_decay_gc_period(mgr));
+	/* Nothing left to track; re-armed on demand when a new SOFT entry appears */
+	if (soft_remaining)
+		schedule_delayed_work(&mgr->decay_gc_work,
+				      xe_ttm_vram_decay_gc_period(mgr));
+unlock:
 	mutex_unlock(&mgr->lock);
 }
 
-- 
2.52.0

