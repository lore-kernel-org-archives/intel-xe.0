Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA10C5321D
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 17:29:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0DA10E7F6;
	Tue, 20 Aug 2024 17:29:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LRHgDXew";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3CCD10E7F2
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 17:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724174943; x=1755710943;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=o8mvUYJYr85MjVIypADxf6r6I6pnRipEeR+PXv7+Orw=;
 b=LRHgDXewpylx7OvQHeDwQgmTe7oWRVdE/CiNkTUy7f3y0f4Bpc2JikMh
 VvAoD1cYBSFwhMaZgOTlg6Ej/zswf+arlRErZ/vC+xC0Fz/1N8k0t9q7o
 cIXndPca4kBbZaa8NmuOS4iyGFIrxsspYOOpf8uhfui/K9fXJ1kFPbg1F
 Cak/3eT2TObp4l1p1f6sAlrmV3FpGOOq92O7GIFbVx36ES+HtfuJysmrs
 0dU3VH57pRnKlyUv1XlCqciLjHHNril4ol/CahuAPt6XcBgBhUpVwvKTA
 8Z4omswXm11wzMZxK+1M8+g+iJRUT615GCqP2I7DWpOryelj45MqCQiYj Q==;
X-CSE-ConnectionGUID: KBfiDxXfRL+3dEgW4mAO9A==
X-CSE-MsgGUID: Zdrq5AyWS/GMHGPJ2tMDDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="26365494"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="26365494"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 10:29:02 -0700
X-CSE-ConnectionGUID: dMOKsqFXT4OdrDhNNCq5VA==
X-CSE-MsgGUID: Cro4mpf1Qj+uRWMSzgh6AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="65651737"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 10:29:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 3/6] drm/xe: Drop warn on xe_guc_pc_gucrc_disable in guc pc
 fini
Date: Tue, 20 Aug 2024 10:29:55 -0700
Message-Id: <20240820172958.1095143-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240820172958.1095143-1-matthew.brost@intel.com>
References: <20240820172958.1095143-1-matthew.brost@intel.com>
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

Not a big deal if CT is down as driver is unloading, no need to warn.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 32e93a8127d4..def503abeed5 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -1042,7 +1042,7 @@ static void xe_guc_pc_fini_hw(void *arg)
 		return;
 
 	XE_WARN_ON(xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL));
-	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
+	xe_guc_pc_gucrc_disable(pc);
 	XE_WARN_ON(xe_guc_pc_stop(pc));
 
 	/* Bind requested freq to mert_freq_cap before unload */
-- 
2.34.1

