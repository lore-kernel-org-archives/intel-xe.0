Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12863C47DDF
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 16:16:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD11A10F524;
	Mon, 22 Jan 2024 16:16:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C337010F51B
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 16:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705940205; x=1737476205;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rcnNqtiXB/Tn+RVBk3weKARjUucgYlsALw6TAnXQL/k=;
 b=cYVSofOWqJe/LxlmGniSDFJQIW4Lu0Y7moenpWSgqkAUXeKQT+Msk8lf
 D4HUcRh7xKdV/evx0543kcjG12OchWYgYlT3T2NmoudgPA06e9HkS4Nwe
 0ZHW/EcBxYQUpeB2E/s71mTgNFsJl39r++CkIpaxH7eebUSuxiI0yFOhR
 Yy8Ewncx6AQME5hwu2WaVERINRHJZJvMJzwVsIGj/5ChdESmtc9eukFzo
 +1kPiJNGDsFW2yQOgqbXdOxm2oJ3dVa0nAGcPWiVaksvaYvSOjOLqw4Ql
 uh0Bj07/Yg0M9q86/2POH874fD7YwieJIFeExgapjeOJU9H92nbIfe94q w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="400902485"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="400902485"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 08:16:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="929035061"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="929035061"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 08:16:40 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v4 2/3] drm/xe: Move TLB invalidation reset before HW reset
Date: Mon, 22 Jan 2024 08:17:15 -0800
Message-Id: <20240122161716.1503064-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240122161716.1503064-1-matthew.brost@intel.com>
References: <20240122161716.1503064-1-matthew.brost@intel.com>
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
index 1fe4d54409d3..6d1ce85fc36d 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -632,12 +632,12 @@ static int gt_reset(struct xe_gt *gt)
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

