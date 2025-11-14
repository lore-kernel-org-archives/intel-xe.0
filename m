Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D33CEACCC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 21:43:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45CE10EB2D;
	Fri, 14 Nov 2025 21:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RL/NtaDi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D3710EB2F
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 21:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763156630; x=1794692630;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=STts1Pp5GyfVz/l1oSA3+Cg0AlHzspC4lFDNvlykvzs=;
 b=RL/NtaDiifiS+Uh/1JQ83QtfYY/5VdvtY+0ga+INS7HIfy5Gum4LszK9
 q1PsmhnwlWZjSm4mkjnfqN1cBF/ed7qbGCsIrPsTk2Xefs1JD/KPnNR8m
 5+hrZkLQpxLIJoBRXDlGElz5VgraZUa63UM86RzTEBiJJVQWsvz14GzfE
 lFqOELoZF2qAGbakua5hdyoBlAV3kV18+/QaeA4P7n0hNouytr6RRr6ZH
 XD2AlrMnC81szOaTpDedghnPvPyJgOE3sxlSq5F/9HcAxtD/tiXm3soUj
 HWLWsJ5IaCpf/0v0ui5QGK6/w8vU4Dza6GVcakuSs13+xmqupvnD6QjsR g==;
X-CSE-ConnectionGUID: 7/numNZqTtWqryGNou9+YQ==
X-CSE-MsgGUID: 83pxZAO/TJKN4BXYyHneWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82648326"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="82648326"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:43:50 -0800
X-CSE-ConnectionGUID: TGPmGFprRd+8FLdXwSiN9w==
X-CSE-MsgGUID: I9ex5nINSVyWc/F0AQ0FiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="190308339"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:43:48 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v3 22/27] drm/xe/ggtt: Use scope-based runtime pm
Date: Fri, 14 Nov 2025 13:43:58 -0800
Message-ID: <20251114214335.2388972-51-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251114214335.2388972-29-matthew.d.roper@intel.com>
References: <20251114214335.2388972-29-matthew.d.roper@intel.com>
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

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index ef481b334af4..48ab8b43fcd0 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -396,9 +396,8 @@ static void ggtt_node_remove_work_func(struct work_struct *work)
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

