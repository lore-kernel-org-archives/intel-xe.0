Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F415BC6FD1F
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 19:13:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE44910E07E;
	Thu, 21 Mar 2024 19:13:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dqjoP9pi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F1F410E07E
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 19:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711048383; x=1742584383;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cPEDzTXUI/04l7DQKTBnGCQI90eTQLioDUc0jLjic7E=;
 b=dqjoP9piSJ43wIVJx5n2lrTe5b7mrF8l+s/encNILSIwRlmglHnJhVwf
 ick8dKPVuXpr9Vk5gyOJ01TT2p22+zcb/LdZbs05jMJTvkGaSYC3H8ymC
 MBzn/c4QsE3lrWbOpFXG0qf8M6wFRS3z7WKmYyr4tD30V3E9hmG2yafzO
 j2fd/mhfSvwPx/WvVvRxsu2f3/cisg5SVv2/GAAViG7oKhdicqxcHDiIx
 GFJ1hzEIR1d56Mja5zcWP2VrNpzJJ2Ko1dkpQh54lFT5iY9GJsEBaG1FC
 3nnpqqy0/kqOvQljJxWcfsNGiIaqqxNT36rx9dgnmAsSmw6tWZ9U3nCH0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6676540"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="6676540"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 12:13:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="14664947"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa006.fm.intel.com with ESMTP; 21 Mar 2024 12:13:02 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH] drm/xe/guc: Add some failure checks
Date: Thu, 21 Mar 2024 12:12:19 -0700
Message-Id: <20240321191219.243583-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

Return failures from pc_adjust_freq_bounds.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 6dfae1c23946..9c110537d135 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -695,24 +695,28 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
 
 	ret = pc_action_query_task_state(pc);
 	if (ret)
-		return ret;
+		goto out;
 
 	/*
 	 * GuC defaults to some RPmax that is not actually achievable without
 	 * overclocking. Let's adjust it to the Hardware RP0, which is the
 	 * regular maximum
 	 */
-	if (pc_get_max_freq(pc) > pc->rp0_freq)
-		pc_set_max_freq(pc, pc->rp0_freq);
+	if (pc_get_max_freq(pc) > pc->rp0_freq) {
+		ret = pc_set_max_freq(pc, pc->rp0_freq);
+		if (ret)
+			goto out;
+	}
 
 	/*
 	 * Same thing happens for Server platforms where min is listed as
 	 * RPMax
 	 */
 	if (pc_get_min_freq(pc) > pc->rp0_freq)
-		pc_set_min_freq(pc, pc->rp0_freq);
+		ret = pc_set_min_freq(pc, pc->rp0_freq);
 
-	return 0;
+out:
+	return ret;
 }
 
 static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
-- 
2.38.1

