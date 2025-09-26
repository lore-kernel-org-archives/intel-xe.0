Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1991BCAC5BE
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 20:09:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 763D610EAE5;
	Fri, 26 Sep 2025 20:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YPWvPBuh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE0910E133
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 20:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758917361; x=1790453361;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UBNvIC6ImFL6I7FksDMqVKpYRE2wdazDPhllG6412WQ=;
 b=YPWvPBuhnNX9Y4Z+6ajVmsAJMTajcBA+LhtiWF285jqH9J15aBZ5nR+v
 plqKbE7C2iOWtZSvL4Zkg+OdosGNm1m4iKz+VLeX+XfBt/Uur20f8ndc5
 +DWtPG7hP+4cXzdsrqq9qHpka/7ywoaJ0imB5edyTfXQSJSBTf/B+LkSY
 124jFazc56vvPDeo/4Km474H0uRQccqvk089mX2MLaD8iOdYmMCUgz3Eg
 QAWilHbRFRRDxrhlKghymQesboVlgRy/OGU4vPVi33YJbpO/+gsp2cG1d
 YYa3RrK9mQ8+KyW7gdPnkBYu0GFiP9/FMVpsntcRAekHfjKoyUEmCrB+/ g==;
X-CSE-ConnectionGUID: KGQRX93PSbSQQVi32NN+Hw==
X-CSE-MsgGUID: MmFiCSZeSfK/aFX0dJugeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="72352468"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="72352468"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 13:09:21 -0700
X-CSE-ConnectionGUID: 1QMWh06TSWK/zgKosld9Ug==
X-CSE-MsgGUID: 33fyUkYlQ92VlDrtWjHvdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="177634942"
Received: from dut4086lnl.fm.intel.com ([10.105.10.69])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 13:09:19 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com
Subject: [PATCH v2 4/5] drm/xe: Guard against NULL GT in xe_guc.c
Date: Fri, 26 Sep 2025 20:09:22 +0000
Message-ID: <20250926200917.164618-11-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250926200917.164618-7-jonathan.cavitt@intel.com>
References: <20250926200917.164618-7-jonathan.cavitt@intel.com>
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

Static analysis reveals the following issue:
xe_device_get_gt is theoretically able to return NULL in some cases, but
several use cases don't check the return value before performing a
dereference, resulting in a NULL pointer dereference.

Use xe_assert to assert root_gt is not NULL before dereferencing it.

While we're here, replace xe_device_get_gt(xe, 0) with the equivalent
call xe_root_mmio_gt(xe).  There's no reason to use the flexible
xe_device_get_gt function when we're only always tring to get GT0 here.

v2: xe_assert root_gt is not NULL (Michal, Matt)

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index d5adbbb013ec..38fba439f1e8 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -466,10 +466,13 @@ static int guc_g2g_alloc(struct xe_guc *guc)
 		return 0;
 
 	if (gt->info.id != 0) {
-		struct xe_gt *root_gt = xe_device_get_gt(xe, 0);
-		struct xe_guc *root_guc = &root_gt->uc.guc;
+		struct xe_gt *root_gt = xe_root_mmio_gt(xe);
+		struct xe_guc *root_guc;
 		struct xe_bo *bo;
 
+		xe_assert(xe, root_gt);
+		root_guc = &root_gt->uc.guc;
+
 		bo = xe_bo_get(root_guc->g2g.bo);
 		if (!bo)
 			return -ENODEV;
-- 
2.43.0

