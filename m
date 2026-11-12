Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3547606A32E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 12:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b0n4db/y
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D501120B5;
	Thu, 12 Nov 2026 12:44:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2BB1120C1
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 12:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794487433; x=1826023433;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ddX9r6fMx90JCF/Q0BfmY7KjHJeVXwWR1Xu2sx+u5Rs=;
 b=b0n4db/ymxMsN6W0ZaW2hNtsb2kgd5SJoMdBLFy2pGcY5nSC5TPujoAb
 pwgJ0UxBesi/uCuu6Atv5inrM7KczzBbBO7TFBlf6wCF8yo1GhKyOKMaV
 I5flkM1XbUx8pWuBtTMl8EuLpr56s205/3/EuGv64ZftK0fShygvhS2jO
 sAgGhdZUTXXlqDGjMQi8EmTkqUto5v6EtJdQ3KkeilkOtm8pbIXWybRkY
 gh1yzHoeWpdK+ccEwe5dMCU9s9eLAO8AL4IlShydeaatD1jA/Urdd80+c
 twGlyoWVSyi+jaYG/RQVQcTW5ORRWtoHE0yDX7c5xVMSGhpVJbzmRcsyF A==;
X-CSE-ConnectionGUID: xTUuRgC7TVe878xOQhlIzw==
X-CSE-MsgGUID: WBAYgZm0Ss6SM9RJb8TQhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3181277"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3181277"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 04:43:52 -0800
X-CSE-ConnectionGUID: Ogp+4DOXS9+QBI2BU59T5w==
X-CSE-MsgGUID: PxNiVCfUSGOwOQgr2IMd2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8577417"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 04:43:51 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V2 3/3] drm/xe/vram: stop decay worker from rescheduling
 itself forever
Date: Thu, 12 Nov 2026 18:13:33 +0530
Message-ID: <20261112124329.2960272-8-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261112124329.2960272-5-tejas.upadhyay@intel.com>
References: <20261112124329.2960272-5-tejas.upadhyay@intel.com>
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
via its !delayed_work_pending() check whenever a new SOFT entry
appears, so the perpetual self-reschedule serves no purpose once the
list has nothing left to track.

Track whether any SOFT entries remain after the sweep and only
reschedule in that case, letting the worker go idle otherwise.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 07360ab7b072..7613024a1410 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -373,17 +373,20 @@ static void xe_ttm_vram_decay_gc_worker(struct work_struct *work)
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
@@ -394,9 +397,11 @@ static void xe_ttm_vram_decay_gc_worker(struct work_struct *work)
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

