Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6C3E71073
	for <intel-xe@archiver.kernel.org>; Sat,  7 Sep 2024 00:08:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B0910EB3D;
	Sat,  7 Sep 2024 00:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B7BX37g+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D94E10EB2B
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Sep 2024 00:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725667678; x=1757203678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6HsESTRH5IxBgm0kwMSKW7oo+culjVJ+lUe5qf9ML2A=;
 b=B7BX37g+Gp5qDGitmWVq2lfPfBRiFUdeCTZ4R1dK6XzIe7Q+n1US5T/m
 6DpPz5N9LDn1+RxLWPGNkONJ3tuW0O2SAZxLap5w6jzymo660rGwtJ8Zm
 zeKOu01rUINVMc9TCvjfd6KVgPw69+lnVeATUCeNYSKr7jtt/5nh/1G9t
 RcSlU9z/l6ErgFUq3UdTB3TcWaT1Hbu6vhtOa1MZwcL4dAaN5aP4KY/UC
 WYWRU4XzNqBjgLlunT7czVGIXQbyPgQDR10wQ9CP5cQyc7gde+bcQh7n1
 qTTl4Igw7lRmoDb/nmBbUeT7K2rrOY/wkZq9WuZ7WnE/fj80hPlZFwHk6 w==;
X-CSE-ConnectionGUID: +3JHJqWxT0yCBTUP98thAw==
X-CSE-MsgGUID: iCJaNB4vTgWiNu7PUIPTwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="49855306"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="49855306"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
X-CSE-ConnectionGUID: TSRx+V9MQ+y3aSxniVMKdA==
X-CSE-MsgGUID: K8Fc0LM1QxeJ/MotS+/aSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="65792664"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 16/43] drm/xe/stolen: Convert register access to use xe_mmio
Date: Fri,  6 Sep 2024 17:08:05 -0700
Message-ID: <20240907000748.2614020-61-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240907000748.2614020-45-matthew.d.roper@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
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
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index f7113cf6109d..423856cc18d4 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -60,7 +60,7 @@ bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe)
 static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 {
 	struct xe_tile *tile = xe_device_get_root_tile(xe);
-	struct xe_gt *mmio = xe_root_mmio_gt(xe);
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	u64 stolen_size;
 	u64 tile_offset;
@@ -94,7 +94,7 @@ static u32 get_wopcm_size(struct xe_device *xe)
 	u32 wopcm_size;
 	u64 val;
 
-	val = xe_mmio_read64_2x32(xe_root_mmio_gt(xe), STOLEN_RESERVED);
+	val = xe_mmio_read64_2x32(xe_root_tile_mmio(xe), STOLEN_RESERVED);
 	val = REG_FIELD_GET64(WOPCM_SIZE_MASK, val);
 
 	switch (val) {
@@ -119,7 +119,7 @@ static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr
 	u32 stolen_size, wopcm_size;
 	u32 ggc, gms;
 
-	ggc = xe_mmio_read32(xe_root_mmio_gt(xe), GGC);
+	ggc = xe_mmio_read32(xe_root_tile_mmio(xe), GGC);
 
 	/*
 	 * Check GGMS: it should be fixed 0x3 (8MB), which corresponds to the
@@ -159,7 +159,7 @@ static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr
 	stolen_size -= wopcm_size;
 
 	if (media_gt && XE_WA(media_gt, 14019821291)) {
-		u64 gscpsmi_base = xe_mmio_read64_2x32(media_gt, GSCPSMI_BASE)
+		u64 gscpsmi_base = xe_mmio_read64_2x32(&media_gt->mmio, GSCPSMI_BASE)
 			& ~GENMASK_ULL(5, 0);
 
 		/*
-- 
2.45.2

