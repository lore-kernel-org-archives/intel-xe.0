Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB2BC47079
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 17:28:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5914610E499;
	Tue,  9 Jan 2024 17:28:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 466F010E499
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 17:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704821292; x=1736357292;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=74M4QULb39ArnPc3yCM8HC4uh0txbEab3IxQVR7zfSQ=;
 b=RYZftDeDfSaBk+Gh8WRa8KgpER36C7t7m9QBXHvXklE4U7/ZlHe7BX4O
 gMubqXwCXLqeAKbi/YeP5aIiA4DXHg8JYEuhXUh8nmilt7yLy0vMXe1/i
 Jd+EjmcDhd4TN/6XxricqekeDYJ/7n6zc4gKlcG6LRvRDsmZtF0Q0q/Te
 jrmaZMllJzudFXBi3/rE0aT+/wT/N18jov/E5NO7hpUbko3SJ/oGQHynF
 kSPZ4D7joCdErH8nk9tqc9nt4q5/ohobp4or57mJAg+Ly+1xE66ujLvqU
 dCZWKlmbq7cH0y5K6ov4x0uDcMKKbKLK9k1D20VXQQk/bS9IYCvKteZsN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5624828"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; 
   d="scan'208";a="5624828"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 09:28:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; d="scan'208";a="16355308"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 09:28:11 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 3/4] drm/xe: Add build on bug to assert access counter queue
 works
Date: Tue,  9 Jan 2024 09:28:37 -0800
Message-Id: <20240109172838.1376015-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240109172838.1376015-1-matthew.brost@intel.com>
References: <20240109172838.1376015-1-matthew.brost@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

If NUM_ACC_QUEUE % ACC_MSG_LEN_DW != 0 then the access counter queue
logic does not work when wrapping occurs. Add a build bug on to assert
NUM_ACC_QUEUE % ACC_MSG_LEN_DW == 0 to enforce this restriction and
document the code.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index fdd5c47dbe37..83a0e9a5f3a8 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -629,6 +629,11 @@ int xe_guc_access_counter_notify_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	u32 asid;
 	bool full;
 
+	/*
+	 * The below logic doesn't work unless NUM_ACC_QUEUE % ACC_MSG_LEN_DW == 0
+	 */
+	BUILD_BUG_ON(NUM_ACC_QUEUE % ACC_MSG_LEN_DW);
+
 	if (unlikely(len != ACC_MSG_LEN_DW))
 		return -EPROTO;
 
-- 
2.34.1

