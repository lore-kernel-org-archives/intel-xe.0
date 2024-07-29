Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1ECC3DA7F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 16:20:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D9B810E121;
	Mon, 29 Jul 2024 16:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aHC/Cl74";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A8510E42F
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jul 2024 16:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722270041; x=1753806041;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cD1yYPen39OWl1A+R17OTbY8USXm4w/U65GgIA/esxA=;
 b=aHC/Cl74kZgu32//1f/U9xDIvVbAXn96TZXsFOboOU2CHYoLG1JUcAlC
 +hOCV8s++J3bjaAxWTuUPwNq8wDBl0ghyAYhyDb/98gjjE+yjJ3SzfN/a
 M5M0GcSbvhbD2B8i/tHhr6/UHTDEnLwAinAISVDRE2GQJqgPxXkWY+hbp
 G8MzxANwUfk8qOgl36OsyehXUF/FEIWnBps80JAWuH844KF7lj3kRZIuU
 jv9dM5x/ukV6RzzOr/HmhwIvG1sbbmQHtJT9o2+o7GN6/9KTy+Hdg9bsl
 n5e6oPiw+VS8ucXbAQoVGWObb1n75JQlmvhVN4XMSQ1yoCRIr1+I3hv5i A==;
X-CSE-ConnectionGUID: cAW+WUmoRwSjbeUYWu5Q1w==
X-CSE-MsgGUID: 5uZ4YTtvQayOEq8oA+n6gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="37514256"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="37514256"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:19:54 -0700
X-CSE-ConnectionGUID: Sv+0ljvWRCOVmGlAlKy9hg==
X-CSE-MsgGUID: rZ3YXEtxR/SxI3WkTe4ymg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53680208"
Received: from unknown (HELO DUT152ICLU.fm.intel.com) ([10.105.23.75])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:19:53 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: matthew.brost@intel.com, John.C.Harrison@Intel.com, brian.welty@intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 Stuart Summers <stuart.summers@intel.com>
Subject: [CI 3/3] drm/xe/guc: Bump the G2H queue size to account for page
 faults
Date: Mon, 29 Jul 2024 16:19:47 +0000
Message-Id: <dfae0d49694a94a75f9986fa61f9295630228277.1722269793.git.stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722269793.git.stuart.summers@intel.com>
References: <cover.1722269793.git.stuart.summers@intel.com>
MIME-Version: 1.0
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

With the increase in the size of the recoverable page fault
queue, we want to ensure the initial messages from GuC in
the G2H buffer have space while we transfer those out to the
actual pf_queue. Bump the G2H queue size to account for this
increase in the pf_queue size.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index beeeb120d1fc..f24dd5223926 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -105,12 +105,20 @@ ct_to_xe(struct xe_guc_ct *ct)
  * enough space to avoid backpressure on the driver. We increase the size
  * of the receive buffer (relative to the send) to ensure a G2H response
  * CTB has a landing spot.
+ *
+ * In addition to submissions, the G2H buffer needs to be able to hold
+ * enough space for recoverable page fault notifications. The number of
+ * page faults is interrupt driven and can be as much as the number of
+ * compute resources available. However, most of the actual work for these
+ * is in a separate page fault worker thread. Therefore we only need to
+ * make sure the queue has enough space to handle all of the submissions
+ * and responses and an extra buffer for incoming page faults.
  */
 
 #define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
 #define CTB_H2G_BUFFER_SIZE	(SZ_4K)
-#define CTB_G2H_BUFFER_SIZE	(4 * CTB_H2G_BUFFER_SIZE)
-#define G2H_ROOM_BUFFER_SIZE	(CTB_G2H_BUFFER_SIZE / 4)
+#define CTB_G2H_BUFFER_SIZE	(SZ_128K)
+#define G2H_ROOM_BUFFER_SIZE	(CTB_G2H_BUFFER_SIZE / 2)
 
 /**
  * xe_guc_ct_queue_proc_time_jiffies - Return maximum time to process a full
-- 
2.34.1

