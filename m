Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CE8E66892
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 21:12:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 527CB10F0C5;
	Fri, 19 Dec 2025 21:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mYfjIztr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CCD610F0C4
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 21:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766178727; x=1797714727;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=2wHtzUbf0N78Qo8b70kumdvtBadJHbAWbxem3WLnbwA=;
 b=mYfjIztrcFjzMGHg/rL2kO1ZzoB0zwFL09Zz1dw4rhseXvrOkc1osk2I
 oxyJL4SG3CLsp+YMnsKAzxEsWWXhpFOdFGGTGWNNCyUElEdSo+XtsVfWs
 kE6+Xg4UxhjcBaY515RECXOuF3fcts4o6Y0EkKEOLwHOLehZaiCN3RotZ
 aGdeVySXFaICdm3RCROCuLDDo7df8DOE77M35lQf3DEooqDlsOniDRyJL
 Yqw+xIXwjaq+rKrl93jGF30GtHMpqNuLgh39AIH2ixnB+T27FXYvF8Zvg
 4WDwR9dHhr1L99VpdAnTlFU4desGjR13BEwzijLyx/jsqx9+esdx/Q8E3 Q==;
X-CSE-ConnectionGUID: mt5v1TgMQLKzTMR0CLW/dg==
X-CSE-MsgGUID: dcKpJI7JSny/NKbiKI8Tjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="78460621"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="78460621"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 13:12:06 -0800
X-CSE-ConnectionGUID: Rz9EwA/NSPe6+kcAKlnX9w==
X-CSE-MsgGUID: Ze5wmMRUTg2/vjgiOU3Apw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="204030371"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 13:12:07 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/3] drm/xe: Assert VRAM address is valid in migrate layer
Date: Fri, 19 Dec 2025 13:12:00 -0800
Message-Id: <20251219211201.4107410-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251219211201.4107410-1-matthew.brost@intel.com>
References: <20251219211201.4107410-1-matthew.brost@intel.com>
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

We have occasionally seen the migrate engine take a page fault. Ensure
any VRAM address programmed in the migrate engine is valid.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 1cec1093541c..f8d688533dd3 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -135,6 +135,8 @@ static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr, bool is_comp_pte)
 							(xe->mem.vram), SZ_1G);
 
 	addr -= xe_vram_region_dpa_base(xe->mem.vram);
+	xe_assert(xe, addr < xe_vram_region_actual_physical_size(xe->mem.vram));
+
 	return addr + (identity_offset << xe_pt_shift(2));
 }
 
-- 
2.34.1

