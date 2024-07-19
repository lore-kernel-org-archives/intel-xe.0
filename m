Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06100C3DA7F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 19:06:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 971D110ECA1;
	Fri, 19 Jul 2024 19:06:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nbSYodbX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB1310EC9E
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 19:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721415983; x=1752951983;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3klZEQizVVdHcVbKTOlaLykuz24RDhrQnSGZqWnfRFU=;
 b=nbSYodbXrhIfqpGAyhgjoZRtebK2XGxYxkmyanRgNejLEPKXhr/8CtAp
 CMPhcYUHTSSlZIxmn2AyhE1ssA/CRDM3SdN3zdF+l5jxVTmDcltUnhvm+
 x3wg1Wg95byMs8OI7fQLwo+UU/8SJEGhpC/njxvOlm8IEAwwZ6e85Lyem
 2bfE3ouOK6ylcXaxa65sOOy82P6YY2F1oogU2CovlfhsI9x7CdM/XEDgM
 EXUIQINFvyBJ7ZKko59z+lB10XVbcz4iGAxyjktMAKxLa5st6LWyZHmmv
 o26DnAvO1i+KS6hASiz9lFKX7ovGzEqXkJzUTlx6wWwEpea1NJrKJiqnG w==;
X-CSE-ConnectionGUID: TW6U0KoKRpKxjocK9vbMUA==
X-CSE-MsgGUID: NQbVMSZ5Tr+fhsZtMNFXLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="29633407"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="29633407"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 12:06:23 -0700
X-CSE-ConnectionGUID: 5fUFaOMHR7KWuLywuRDoMw==
X-CSE-MsgGUID: 87J1gkPHRr+a/iPmexUw8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="51286711"
Received: from dut152iclu.fm.intel.com ([10.105.23.86])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 12:06:22 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: matthew.brost@intel.com, John.C.Harrison@Intel.com, brian.welty@intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 3/3] drm/xe/guc: Bump the G2H queue size to account for page
 faults
Date: Fri, 19 Jul 2024 19:06:14 +0000
Message-Id: <27ccde70eb10ea4ba490b16bdcf1626e7f3e0e7b.1721415811.git.stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721415811.git.stuart.summers@intel.com>
References: <cover.1721415811.git.stuart.summers@intel.com>
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

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 7d2e937da1d8..a3e9dd71f957 100644
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

