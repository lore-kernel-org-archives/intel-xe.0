Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98186E784B0
	for <intel-xe@archiver.kernel.org>; Thu, 25 Dec 2025 01:17:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32BE9113F75;
	Thu, 25 Dec 2025 01:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K046hVpT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7127112ACD
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Dec 2025 01:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766625462; x=1798161462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+9y49kERBO3we3Z0IHBC0PENwxHaIDcGUitXcA65sBU=;
 b=K046hVpTrpPHIXaUZz93RD+IwJcMxUuUpEXS3ytYEjaYzeEMSak+XzlH
 u62bDPOo1A7uXgRAAGTCg7qAhSbu9PmAvdctzi1zpDdqafcRXRDN7T5/L
 dlvFZYibHkENgvqnfMYBJT6DL4Eh+htoNzo7A04I7CCIiFm6hmaFSgu02
 TvACD0R4iKgoZdeJ4wQPr0hfAofslym0+3l49AFcFOwXuya+6tlKUUlhp
 AFZaffvLeVSNnO2gikw/cgZvr6C7nt0ZRnDsozGHhaXDTdoO6u0A8qqZ2
 oV87OUFD486sRoctU4fHed35sE0KXQFwMRLVSdLIMMuAE41p3xfjSSA26 A==;
X-CSE-ConnectionGUID: WEyLH4eCTo2FTvQkAfyRMw==
X-CSE-MsgGUID: ygt+I6U4SF2FejrogzJFXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="85866358"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; d="scan'208";a="85866358"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 17:17:41 -0800
X-CSE-ConnectionGUID: VLNw/mGfQ0qddRyCXJmRJA==
X-CSE-MsgGUID: Unngenr+QY+eL6NKXGdeSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; d="scan'208";a="204629127"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 17:17:40 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	carlos.santa@intel.com
Subject: [RFC PATCH 04/13] drm/xe: Add deadline exec queue vfuncs
Date: Wed, 24 Dec 2025 17:17:25 -0800
Message-Id: <20251225011734.341683-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251225011734.341683-1-matthew.brost@intel.com>
References: <20251225011734.341683-1-matthew.brost@intel.com>
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

Add set_deadline, enter_deadline, and exit_deadline exec queue vfuncs
for deadline control.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index cd7a6571f5c6..ceb0dcea6dfc 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -301,6 +301,15 @@ struct xe_exec_queue_ops {
 	void (*resume)(struct xe_exec_queue *q);
 	/** @reset_status: check exec queue reset status */
 	bool (*reset_status)(struct xe_exec_queue *q);
+	/**
+	 * @set_deadline: Set deadline for on a queue for a fence.
+	 */
+	void (*set_deadline)(struct xe_exec_queue *q, struct dma_fence *fence,
+			     ktime_t deadline);
+	/** @enter_deadline: Enter a deadline */
+	void (*enter_deadline)(struct xe_exec_queue *q);
+	/** @exit_deadline: Enter a deadline */
+	void (*exit_deadline)(struct xe_exec_queue *q);
 };
 
 #endif
-- 
2.34.1

