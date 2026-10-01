Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4687ACA5FA5
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 09:45:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF71410F5EC;
	Thu,  1 Oct 2026 09:45:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e0AgnzQS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E85210F5EC
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 09:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790847947; x=1822383947;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oLZgattrH13eQGR59pFaxIOF+hKQ8Bgsiwjr8ZZNPRQ=;
 b=e0AgnzQSgaeab0lFaKDWtF13GwuWBC0nZk71HWPUKETmlEw3+i7/+gv/
 oWFpxl2sTBMOP1OQCwa+NOG9qjBcIG4Ky+zGrpY9VgqEYsQIZUTRA787Z
 oMVBiOB7EpGWnyaoc0+bA2fvEP/gZiCJ2jHHQC5zzC8cCCeUwYqj7Duyj
 qfvVXd7QkTwcOKTZC1xS4Gu2i9jUR9rtlG/eov1gyhw36S7nlUh6P66Av
 gMLAHmLkd9ChHchpazcETDU/uG6JPpCscgwS2o+/x+KMHjgb0e1DDqoFQ
 RWd+HFZC9TLLwF2FL3Q3CrJPjpg/yYWraveDAHJznK3WkvvZlOOxPpGCV w==;
X-CSE-ConnectionGUID: n6tFAr2oTn6/j3qAy4wXDA==
X-CSE-MsgGUID: lDSUFhQHTqC1RDRblSV7cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="102124032"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="102124032"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 02:45:47 -0700
X-CSE-ConnectionGUID: A4JqHhDXRhq4Gsz5EOVd8g==
X-CSE-MsgGUID: v/ubkgN8QX+KvurN4srXOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="3799"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 02:45:46 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 4/4] drm/xe: Keep VRAM fault injection within the usable range
Date: Thu,  1 Oct 2026 15:15:23 +0530
Message-ID: <20261001094518.1493651-10-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261001094518.1493651-6-tejas.upadhyay@intel.com>
References: <20261001094518.1493651-6-tejas.upadhyay@intel.com>
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

xe_ttm_vram_inject_fault() picked its starting address from
vr->actual_physical_size, which includes the CCS/GSM/DSM infrastructure
zone beyond vr->usable_size. The buddy allocator (vram_mgr->mm) only
manages usable_size, so the first probed address can land in that
infra zone; xe_ttm_vram_addr_to_region() then returns NULL for it and
xe_ttm_vram_handle_addr_fault() requests an SBR instead of exercising
page offlining.

Start the probe at usable_size - PAGE_SIZE and stay within
usable_size so the injected fault always lands on real, buddy-managed
VRAM.

Fixes: 6ef3eb10aea4 ("drm/xe: Add fault-inject based VRAM page offline injection")
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 7211ab5f66e9..ec15eab1a2ed 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -988,11 +988,12 @@ int xe_ttm_vram_inject_fault(struct xe_device *xe)
 	struct gpu_buddy *mm = &vram_mgr->mm;
 	u64 addr;
 
-	if (vr->actual_physical_size < PAGE_SIZE)
+	/* Stay within the buddy-managed range; CCS/GSM/DSM sit beyond usable_size */
+	if (vr->usable_size < PAGE_SIZE)
 		return -ENOSPC;
 
-	addr = vr->actual_physical_size - PAGE_SIZE;
-	while (addr < vr->actual_physical_size) {
+	addr = vr->usable_size - PAGE_SIZE;
+	while (addr < vr->usable_size) {
 		struct gpu_buddy_block *block;
 		bool found = false;
 
-- 
2.52.0

