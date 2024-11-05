Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF80D31767
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 16:45:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE82610E410;
	Tue,  5 Nov 2024 16:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O/Nila4J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F3A10E410
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 16:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730825134; x=1762361134;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EgqEvuZHzT332YtEUcXiScST2IRIcRFH4AmDIB2OI8E=;
 b=O/Nila4Juba20oBs+HKswIrnHXSG1P+pHPf/rl4RVtwIwNlkxam6CXjv
 N/RMadRpaus0inUHiCGeUKHWosv1DaDmKa40qnEpnfeYYkZqAQQXT3iM0
 mM6M73FYilrFyiilCKGfSjGh9Jri6SJLW/R+BUHDtIZbbN0+1cQHQ8DkZ
 uH0mTvvmneTasBIPukDK914PaFDDUxlWe82Q+3CxCoq3+WAOgRCF+aYlO
 r9/cwlWCrt2RLH6CjTz0DAebi18VYCM9Sot3JG/cm5Dfmen1/AnHIGd8g
 fZY6JfnIS/XNUW9AoYC1SZWtvXG2debMBigxoq78R3lk2QLSjU0HBAWp/ A==;
X-CSE-ConnectionGUID: 1hw+To0BQsGvYxYnK3ywAQ==
X-CSE-MsgGUID: Z9r+Q9xBRN6h7L7DVFiACg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30358529"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30358529"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 08:45:34 -0800
X-CSE-ConnectionGUID: 587Jmg3jTjCQ/fSKnhmsWg==
X-CSE-MsgGUID: jRVEjhDPQcOAKBx17b6QvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="88650176"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 08:45:32 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Take job list lock in xe_sched_first_pending_job
Date: Tue,  5 Nov 2024 17:03:27 +0100
Message-ID: <20241105160327.2970277-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Access to the pending_list should always happens under job_list_lock.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_gpu_scheduler.h | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
index 64b2ae6839db..c250ea773491 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -71,8 +71,14 @@ static inline void xe_sched_add_pending_job(struct xe_gpu_scheduler *sched,
 static inline
 struct xe_sched_job *xe_sched_first_pending_job(struct xe_gpu_scheduler *sched)
 {
-	return list_first_entry_or_null(&sched->base.pending_list,
-					struct xe_sched_job, drm.list);
+	struct xe_sched_job *job;
+
+	spin_lock(&sched->base.job_list_lock);
+	job = list_first_entry_or_null(&sched->base.pending_list,
+				       struct xe_sched_job, drm.list);
+	spin_unlock(&sched->base.job_list_lock);
+
+	return job;
 }
 
 static inline int
-- 
2.46.0

