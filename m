Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EE7C47DAF
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jan 2024 19:24:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF5EE10E8F7;
	Thu, 18 Jan 2024 19:24:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F7D110E8F4
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jan 2024 19:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705605847; x=1737141847;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=voZFwWhtxr5gmsfkFtXjH+QgaLGvCS1sHd3zmLE+5Vs=;
 b=RVotHX9vl6HCWxEOucueA85D+//a3tqF0jiOOJpG1juQQbSfikEy+5wn
 6+x2tkO1YFQelqDhOcpd+7ZzJGd/5vdGRDkv7XbBoaX+ljrBs/82DkDXK
 w9PXAY4nd93zsPw9o4DPjnKAoEKirPVZDphbwQS+vYptQrfF5dhnKoKtt
 AA+EldRQhn8Bu1HSZAZybYa9kppgQHWnZg2dsFkeiz13/r632Ot4ITNHS
 jmYWV6j6HjC3DIieGwjJLOzNCxZ5Dm0dd39JulGyhQQNgK4NMuf8HjqQT
 MvszaCa7cWddGJJ9F93lQar/IrOTTuVtGI7zEZDrsdRCkUYo0Do7KylXF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7642097"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="7642097"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 11:24:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="490988"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 11:24:06 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>,
	rodrigo.vivi@intel.com
Subject: [PATCH v3 2/3] drm/xe: Move TLB invalidation reset before HW reset
Date: Thu, 18 Jan 2024 11:24:41 -0800
Message-Id: <20240118192442.1480073-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240118192442.1480073-1-matthew.brost@intel.com>
References: <20240118192442.1480073-1-matthew.brost@intel.com>
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

This is a software reset which can be done immediately after stopping
the UC.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 0f2258dc4a00..c19fe0c02961 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -619,12 +619,12 @@ static int gt_reset(struct xe_gt *gt)
 	if (err)
 		goto err_out;
 
+	xe_gt_tlb_invalidation_reset(gt);
+
 	err = do_gt_reset(gt);
 	if (err)
 		goto err_out;
 
-	xe_gt_tlb_invalidation_reset(gt);
-
 	err = do_gt_restart(gt);
 	if (err)
 		goto err_out;
-- 
2.34.1

