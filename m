Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D620EE020C
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 23:47:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC02910E966;
	Tue, 10 Sep 2024 23:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DnGokTi1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0BAA10E93D
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 23:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726012047; x=1757548047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S67seA00mrljdC2eAaH+39BY0w8dFJJT30OjqcgoIiE=;
 b=DnGokTi1c2W59WKvxn5ZW55XW6GhtM+8Vt1M5W2LI6Xzuk97OCKNm0/+
 cdDgXeMdnbJILUyLOGFytMEtLFlvNkKexw7qPCnvsC8VIVgApBBJWhM4n
 J9m1x/vWSGTJ8IJB1xRw8UFTjE1dRyItfx/47JtEOLYEn0cJtNwKXT1i4
 yf4UlbmbKrxDReEkQstZIxkcndblzlEV0YdjF+Wn79moo5EjYVmurdpI2
 f+m2gkr4wJxr97YOJDjXRYMkU5vqxxDdLwRUVTnMYB8rROtYclAt01oKm
 mw4BMMWKlryY/airMG9SehQk73PCmw+N0K85Q9976p/8Y/ng0RBfJE+61 A==;
X-CSE-ConnectionGUID: 5gWHHFOgRjSPj9YPIdSwpQ==
X-CSE-MsgGUID: lX1YO5mDT0O26DuRCn6w2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36144310"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="36144310"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:27 -0700
X-CSE-ConnectionGUID: Hv+l1Cs6TLylwDHxTN8/XA==
X-CSE-MsgGUID: nhK1lNbZRvqxSFQpNDynxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="71989599"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 16:47:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 19/43] drm/xe/wa: Convert register access to use xe_mmio
Date: Tue, 10 Sep 2024 16:47:39 -0700
Message-ID: <20240910234719.3335472-64-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240910234719.3335472-45-matthew.d.roper@intel.com>
References: <20240910234719.3335472-45-matthew.d.roper@intel.com>
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

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
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

