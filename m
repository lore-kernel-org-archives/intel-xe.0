Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B2A3CCF9F8
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 18:13:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29D210EB84;
	Fri,  7 Nov 2025 18:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bwPHWaNg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B43210EB7F
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 18:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762539212; x=1794075212;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=02PGIsZWt29QHVZYDVPSPqidGs0ftLH4PPwS1ylCH5g=;
 b=bwPHWaNgsSGc/XD361hSq0Py7ZiwQiOIQLPcGsQabwC+rFArUqR9YrlL
 DUXQD5tIFvZpKcJYiUV0xsGaJtPmObzmDVAQ/OJLRhsgDBzgTULdAm8L2
 fZVmBuVA5NsqHAUWPQGYU1o2HRRKMeA+u44uPitEI8DH083jms0lhZ+2e
 y+IzL7Wuv3M1mnY62fB6vRjxdKRhuihJ1jchBIgBzF5Ggh1htKkxQGJGr
 wja6nL2sBEr49FsgojY63aciVZ7Qlojw4DdxkW49QIOX8v/PIThhsUe8d
 UvtI5P+vLPJ4l2jtw65PrmH36bKwlch8obu+IP/2e50TM1AjNXeWvdYDU g==;
X-CSE-ConnectionGUID: dK18YU9LTpKn7/K6rPNPNQ==
X-CSE-MsgGUID: uqoLIAMxRtyAdIlI/43mkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64733162"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="64733162"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:31 -0800
X-CSE-ConnectionGUID: 2qiCu3/+RHOlAptXGXfFtg==
X-CSE-MsgGUID: gwvS4MwyQ2mLTFW3ubOZAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="193271238"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:31 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 28/33] drm/xe/ggtt: Use scope-based runtime pm
Date: Fri,  7 Nov 2025 10:13:44 -0800
Message-ID: <20251107181315.631642-63-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251107181315.631642-35-matthew.d.roper@intel.com>
References: <20251107181315.631642-35-matthew.d.roper@intel.com>
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

