Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA45C3DA4A
	for <intel-xe@archiver.kernel.org>; Sat, 17 Aug 2024 02:47:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A3710E021;
	Sat, 17 Aug 2024 02:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jkAdCUzN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526BE10E01F
 for <intel-xe@lists.freedesktop.org>; Sat, 17 Aug 2024 02:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723862864; x=1755398864;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cD1yYPen39OWl1A+R17OTbY8USXm4w/U65GgIA/esxA=;
 b=jkAdCUzNf+FPgL04t2ZhtfJkaEFKxF2UOSJ1LWNTBgiR7NKeyWEEp+5U
 IVBX9QF9+cPxcMbrlx8OJs5lqz+KD03kETZ5twViZdRlsV6Pqscr9qj5+
 4GabBLvf8QixjLoWKb4RtllDv1pJgqGmuAuWRjUNHY0w3Iq+1rUvM2wUC
 RNjeCVjNkmaM203OIimnGPB/dcjUnZLDeBTxDJKsycziQnjlJkq55i7RB
 DzKmUrQL65WFQ/770w55fGZnX5Tcj1eEd4iGqZtrEFKDMrJ7ZGboCzado
 qVV2c34adae3VvlTWZLEkhM7YJh5OKNwqJqhzR+KNVUHovP1bp4ubfPcO w==;
X-CSE-ConnectionGUID: /LJA7UnHTcqDvwTg8MXzmg==
X-CSE-MsgGUID: w0zQ4iiFS5K8f0JnqjjOtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="33316199"
X-IronPort-AV: E=Sophos;i="6.10,153,1719903600"; d="scan'208";a="33316199"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 19:47:43 -0700
X-CSE-ConnectionGUID: m+XSrBJ4SVuaXObBHwOkTg==
X-CSE-MsgGUID: PfosmMVYT+G6+bRaCY4+4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,153,1719903600"; d="scan'208";a="59852827"
Received: from dut4310arlh.fm.intel.com ([10.105.10.103])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 19:47:42 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: matthew.brost@intel.com, John.C.Harrison@Intel.com, brian.welty@intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 Stuart Summers <stuart.summers@intel.com>
Subject: [CI 3/3] drm/xe/guc: Bump the G2H queue size to account for page
 faults
Date: Sat, 17 Aug 2024 02:47:32 +0000
Message-Id: <4c2b6974801bcffd8a010d838c8733fa4092573d.1723862633.git.stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1723862633.git.stuart.summers@intel.com>
References: <cover.1723862633.git.stuart.summers@intel.com>
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

