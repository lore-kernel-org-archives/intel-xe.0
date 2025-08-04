Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84631C87FCB
	for <intel-xe@archiver.kernel.org>; Mon,  4 Aug 2025 10:32:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF2F10E0C1;
	Mon,  4 Aug 2025 10:32:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bt3ODSZF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EBC110E0C1
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Aug 2025 10:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754303534; x=1785839534;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9kt+8bgIpbmKO8126eMMqfMPS0U2vl5eEGc7NbBhpdI=;
 b=Bt3ODSZFcIjAW/Ovhu+MrFsiQbs7e6Er1cxgyyjpkEyO6dJkm2Gmn18b
 unZFhUkHVHfPdfpqnawWhPhSRbFpyi8NDkcW2MhDg9MUc1ZSo56oN2GrC
 yLlYnSKsWOC95NaXE9lgWBieA53URBELJ+L3tJFrMu3XWyoOelXZq3vHD
 PpA8b/D4Pm4SeuFteB7PuNec03/KHCw9bYEXsAu+s71A99+9HEAFcDiYr
 t/NJBwX8lnVyDRfOAoEtCetaaygHd+2v2gntaKw/7eTwYP9rvENZcFtc2
 ZcMdgezz00PEgON3rVoAkyuuZZxIiolszdvJPxmAYJSOCYLl2fH2H1D2P w==;
X-CSE-ConnectionGUID: VyjJgqXTSEueiumGJX+Lhg==
X-CSE-MsgGUID: sY5QNJEvSKCiv7SwrPkirQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="55762234"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="55762234"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 03:32:14 -0700
X-CSE-ConnectionGUID: Dd9ifiNeRD29OWL+1f7eOg==
X-CSE-MsgGUID: ItAJjJylRv2T0+ikvBmFYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="164043676"
Received: from pgurram-desk.iind.intel.com ([10.190.238.70])
 by fmviesa006.fm.intel.com with ESMTP; 04 Aug 2025 03:32:13 -0700
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH] drm/xe: Fix coverity issue, truncation warning
Date: Mon,  4 Aug 2025 16:14:09 +0530
Message-Id: <20250804104409.3305071-1-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
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

Use conditional assignment to avoid cast truncation warning.
Set instance to 0 when hw_reports_to_instance_zero() returns false.

Fixes: 95336cfd5b2ce ("drm/xe: Add memirq report page address helpers")

Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 drivers/gpu/drm/xe/xe_memirq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 49c45ec3e83c..75ddf4eda355 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -257,7 +257,8 @@ static u32 __memirq_source_page(struct xe_memirq *memirq, u16 instance)
 	memirq_assert(memirq, instance <= XE_HW_ENGINE_MAX_INSTANCE);
 	memirq_assert(memirq, memirq->bo);
 
-	instance = hw_reports_to_instance_zero(memirq) ? instance : 0;
+	if (!hw_reports_to_instance_zero(memirq))
+		instance = 0;
 	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_SOURCE_OFFSET(instance);
 }
 
-- 
2.34.1

