Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C462FCD6E55
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 16:51:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8514811212B;
	Wed,  3 Jun 2026 16:51:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k85/jhmS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6049E11211F
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 16:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780505496; x=1812041496;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DAt59R27rU7766W5g/AN0JHs3bbYfA8I711hRClxQM8=;
 b=k85/jhmS5AAD/4W9fx8DeVkjMPKubaKwmqYERE4Y2h1DJfHDL9QxJg9r
 V++1rV8MhdXv4r4ZNUslM7oSssMIgCPhMqK17SxEe+nHZnO/+pQEl61eL
 7K67v6BleFct9nZw180CWjcN5Vsuuhue8BodVklStF6Zt9CBJ7y6HrBWh
 W38hQ9f9m4EyuOjGaOW708+XLtzSa0GjuCQipjs2bdIsrCse+VGa4GhQ3
 8F+I/S//0/E7ZtlfbvGrXQh9bU8Yvyf/fD7syzr/Uk5k2xewEciFS8TjO
 IDBCS6xw+w8+1BF7lUxyRdE3vPH8Q3o2R1Ul6iGUkvVE7UOigALxDOaL0 Q==;
X-CSE-ConnectionGUID: 38KAW/XJSFG0t1tDCMTHBw==
X-CSE-MsgGUID: Bj3pjd3LTgmZXYuzjqGxYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81449082"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="81449082"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 09:51:36 -0700
X-CSE-ConnectionGUID: 8ug2sSDwQoedEUWJy74Ccg==
X-CSE-MsgGUID: kspalLHnT8+vuOd0OpEJ9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="239817917"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.195])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 09:51:35 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v5 10/10] drm/xe/guc: toggle paging engine support for NVL-S+
Date: Wed,  3 Jun 2026 17:51:03 +0100
Message-ID: <20260603165052.183465-22-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603165052.183465-12-matthew.auld@intel.com>
References: <20260603165052.183465-12-matthew.auld@intel.com>
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

NVL-S with latest GuC should be the first platform combo to
support the special GUC_PAGING_CLASS feature.

v2:
  - Update with the final GuC version

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 847c4d74d169..5dd8fdcdd4ef 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1848,6 +1848,9 @@ bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc)
 
 bool xe_guc_has_paging_engine(struct xe_guc *guc)
 {
+	struct xe_gt *gt = guc_to_gt(guc);
+	struct xe_device *xe = gt_to_xe(gt);
+
 	/*
 	 * On newer platforms the GuC now has a dedicated engine class for the
 	 * special PAGING engine, which is the driver reserved BCS engine used
@@ -1856,9 +1859,8 @@ bool xe_guc_has_paging_engine(struct xe_guc *guc)
 	 * engine here, this is purely a sw view in the GuC itself, which we
 	 * need to respect.
 	 */
-
-	/* TODO: Have some way to query this from the GuC? */
-	return false;
+	return GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 36, 0) &&
+	       xe->info.platform >= XE_NOVALAKE_S;
 }
 
 /**
-- 
2.54.0

