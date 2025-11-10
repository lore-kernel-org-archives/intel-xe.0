Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03048CCF9E3
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 23:20:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B6910E385;
	Mon, 10 Nov 2025 23:20:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QQ5tRT8H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17FAE10E49A
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 23:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762816834; x=1794352834;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=02PGIsZWt29QHVZYDVPSPqidGs0ftLH4PPwS1ylCH5g=;
 b=QQ5tRT8Hex3OXQ+lV6MhSuVHX/jDg1XHcC4XLoyDa59/GDRIm4Pwq59T
 GawkBkj8SeN+T2UdB5ci7lv7//cVYnd9BS1W2d8Y/zmHd/8muY0Kp273v
 2toPVPRR65hmGFDQ2Vav2utHpmsf6NAF87hwZuyRd7cdfa9rLaYA/R5H1
 0hn82IiDXiaBfJrScX9cooGKvBZH082LF0FcvIMEhQatW1qL+8USSViNz
 FgSN3ADklP+eMONc4yOcz/OXrThKb8C0IzftTSihWFM8NRmhM6cippwHl
 J1KV+8EXF/fZlZ7St+muNqsjBZdi9WLtHkcQqojiuo5ZopANpAEzjLt8G g==;
X-CSE-ConnectionGUID: LV1JHGV9RxO+RHHMIXDB3A==
X-CSE-MsgGUID: TMpN1vW1SkWr6FEtBbVsqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75486462"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="75486462"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:20:33 -0800
X-CSE-ConnectionGUID: /pQDGy6rQFGm1WAt9WUlzg==
X-CSE-MsgGUID: ++vLPjsZT9aTgGMGFI5RzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="189244022"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:20:32 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 25/30] drm/xe/ggtt: Use scope-based runtime pm
Date: Mon, 10 Nov 2025 15:20:43 -0800
Message-ID: <20251110232017.1475869-57-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251110232017.1475869-32-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
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

Switch the GGTT code to scope-based runtime PM for consistency with
other parts of the driver.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 20d226d90c50..5e1cd18ec611 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -385,9 +385,8 @@ static void ggtt_node_remove_work_func(struct work_struct *work)
 						 delayed_removal_work);
 	struct xe_device *xe = tile_to_xe(node->ggtt->tile);
 
-	xe_pm_runtime_get(xe);
+	guard(xe_pm_runtime)(xe);
 	ggtt_node_remove(node);
-	xe_pm_runtime_put(xe);
 }
 
 /**
-- 
2.51.1

