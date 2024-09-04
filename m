Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DF4CD37BD
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 00:21:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 848C910E641;
	Wed,  4 Sep 2024 00:21:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IumRYkoi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 704DC10E638
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 00:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725409276; x=1756945276;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pqvMAH6lFWcUdrmnm+U7m3xxvi1/0715IM6t5OAGnK4=;
 b=IumRYkoiplWbPeDnru6jNgdAugu7JftU1e4HVmqOjnN4KzLxXeFbpo3x
 +iqscO+yXnnK0N/nNXOuQL7epKnYeFNHLrs8n/hIoblsPyl6zn80Vw1/e
 S2yF7LQfjjuR+b9ry0QozVO9ebOdCejFJsMN1a7hyff2OVXA9Vz1y97K9
 TK6aTO7djsg9HAHEti2zDR9ESA1wmv31lvMcUI6E/+ECdl3N8t2biZMrf
 WEacpGQY9chCTNItu9WcIj04FrTGxAoP914TLP4/9eNCXsXfBVIQG6q9c
 7n33XY3HSkC2eKrCADTNEiK65JJpOOHO5ah34eGcvP44Y1mdrI0uIhCbO g==;
X-CSE-ConnectionGUID: Tp+dzLXSTeO9qxxpqkX9BQ==
X-CSE-MsgGUID: IYMwgSb0QWqWxUFLZYMZwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23904807"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="23904807"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:16 -0700
X-CSE-ConnectionGUID: D2Bw/wSpT2WOPJtIUOCVFA==
X-CSE-MsgGUID: dxUPwgykSSKxnYJyjBm6jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="69944260"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:16 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 19/43] drm/xe/wa: Convert register access to use xe_mmio
Date: Tue,  3 Sep 2024 17:21:20 -0700
Message-ID: <20240904002100.2023834-64-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240904002100.2023834-45-matthew.d.roper@intel.com>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
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

Stop using GT pointers for register access.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 28b7f95b6c2f..d8a5a85e9ebd 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -883,11 +883,11 @@ void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p)
  */
 void xe_wa_apply_tile_workarounds(struct xe_tile *tile)
 {
-	struct xe_gt *mmio = tile->primary_gt;
+	struct xe_mmio *mmio = &tile->mmio;
 
 	if (IS_SRIOV_VF(tile->xe))
 		return;
 
-	if (XE_WA(mmio, 22010954014))
+	if (XE_WA(tile->primary_gt, 22010954014))
 		xe_mmio_rmw32(mmio, XEHP_CLOCK_GATE_DIS, 0, SGSI_SIDECLK_DIS);
 }
-- 
2.45.2

