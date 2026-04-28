Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5833BFF886F
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 14:27:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19AD010ECA4;
	Tue, 28 Apr 2026 14:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hNGGNVXG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F69310EB1E
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 14:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777386471; x=1808922471;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uYILZyGLeY6VmBh1fkni105kzrkjqGJpxDrWZFpfx84=;
 b=hNGGNVXGk4DzG7BnD0Jld3IpTgKrLI/dvMNTpeDPGd7WhSZQKjpZJlPd
 4ENyQrJAr3aGr0J22N7lp0KYIawElIqaV14e/eh65BVwLGm3IRvHCjYiJ
 bD6twQf14MNmc3icnGSX2/z5EYMUM/WFyOVA7Hh8jar/HS2ClN/BdokEX
 6L/zCiBe57tKRmGEx+fvVCKjVhd6KkmnI89BagYGSonQi8lVKIPVpScDk
 WYUMl34eMKn33ee4A3Z6QYgTc361n5XS2FtxsIOUx7Zu45ysmNujmSLJ7
 22GI7pKZRd/XpOIo28l/PcxED/GaSiwX5dHjwWOleQA+VllAgNUqCmHrp w==;
X-CSE-ConnectionGUID: kOvJN9AER4m72NXL02GcoQ==
X-CSE-MsgGUID: bVbAbzEBRaue54zsqE609g==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="95862338"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="95862338"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:27:51 -0700
X-CSE-ConnectionGUID: 7mqbNQXYQzqPitqgZuL80A==
X-CSE-MsgGUID: asBWokuxQ32XEPNOB9XSgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="238942383"
Received: from orenpaz-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.20.98])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:27:50 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 11/13] drm/xe/memirq: Refactor xe_memirq_hwe_handler
Date: Tue, 28 Apr 2026 16:27:18 +0200
Message-ID: <20260428142722.582-12-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260428142722.582-1-michal.wajdeczko@intel.com>
References: <20260428142722.582-1-michal.wajdeczko@intel.com>
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

We can use helper functions that take care of adjusting source
and status vector offsets based on the MSI-X support, no need
to duplicate logic here.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_memirq.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index f5e139f4525b..30266b258087 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -493,16 +493,18 @@ static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *stat
  */
 void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
 {
-	u16 offset = hwe->irq_offset;
-	u16 instance = hw_reports_to_instance_zero(memirq) ? hwe->instance : 0;
-	struct iosys_map src_offset = IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
-							    XE_MEMIRQ_SOURCE_OFFSET(instance));
+	struct iosys_map source_map =
+		IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
+				      memirq_source_page_offset(memirq, hwe->instance));
 
-	if (memirq_received(memirq, &src_offset, offset, "SRC")) {
-		struct iosys_map status_offset =
+	if (memirq_received(memirq, &source_map, hwe->irq_offset, "SRC")) {
+		struct iosys_map status_map =
 			IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
-					      XE_MEMIRQ_STATUS_OFFSET(instance) + offset * SZ_16);
-		memirq_dispatch_engine(memirq, &status_offset, hwe);
+					      memirq_status_vector_offset(memirq,
+									  hwe->irq_offset,
+									  hwe->instance));
+
+		memirq_dispatch_engine(memirq, &status_map, hwe);
 	}
 }
 
-- 
2.47.1

