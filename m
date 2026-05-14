Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148BBCD4F25
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 15:00:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF1D10E3D6;
	Thu, 14 May 2026 15:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yf3Sn8i8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D001010E3D6
 for <intel-xe@lists.freedesktop.org>; Thu, 14 May 2026 15:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778770822; x=1810306822;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M6f3PHj9FehxhIbTwZhMRHsSCrfb8OQgYQ7T7D7Ar8o=;
 b=Yf3Sn8i8xcoaTuWFYKJcWeTI/d8xnDRRcjVTJMPgPQkjl4bOPONvUs2H
 agfkXIg/7A/M7U8W9jvcq45AB3+kAvJsHUtkFIlLoo+f8ZWZc7BvSUHEV
 UAIn61aNGA4x4uFNJWkZ7yx4UmEj6vEIoW3GoZLaiQ8uy4iVOGaR3kapt
 BLyMIYKkLVPEOAvO3MDagC2OCdhmQm023tIaEU0zx5ZPUL42ajtV6K++/
 WynPQ3s8maVCb/NekEJk/46pqjpKpYtpsJboDcTlNm7xbF57hUP7Ehzl0
 meIt6rPBrkPOu+P1qv7QD0G4nGkd+6qou8fOMltR7jqS0E9t+yuBns8IK A==;
X-CSE-ConnectionGUID: PHPXyHRHQQ6DV8Wx//zMvg==
X-CSE-MsgGUID: dYmQS1dlStit5nhFnT7AZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="91178815"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="91178815"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 08:00:22 -0700
X-CSE-ConnectionGUID: RXU142oQRXSOI03jZ4/ljg==
X-CSE-MsgGUID: vvdNJSAHQDmJtBmGGgAG9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="262152850"
Received: from johnmoon-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.112.169])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 08:00:20 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Ilia Levi <ilia.levi@intel.com>
Subject: [PATCH 1/9] drm/xe: Add IRQ page to HW engine definition
Date: Thu, 14 May 2026 17:00:02 +0200
Message-ID: <20260514150010.7123-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260514150010.7123-1-michal.wajdeczko@intel.com>
References: <20260514150010.7123-1-michal.wajdeczko@intel.com>
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

For each HW engine definition, we already make changes to the IRQ
offset, as required when using MSI-X, but we leave actual MEMIRQ
page selection to the MEMIRQ handler, repeated on every interrupt.

As a preparation step to simplify the MEMIRQ handler, store the
MEMIRQ page number as part of the HW engine definition.

Suggested-by: Ilia Levi <ilia.levi@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c       | 11 ++++++++---
 drivers/gpu/drm/xe/xe_hw_engine_types.h |  2 ++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 0f0e08bcc182..3c3b6bcc4b53 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -503,9 +503,14 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	hwe->class = info->class;
 	hwe->instance = info->instance;
 	hwe->mmio_base = info->mmio_base;
-	hwe->irq_offset = xe_device_has_msix(gt_to_xe(gt)) ?
-		get_msix_irq_offset(gt, info->class) :
-		info->irq_offset;
+	if (xe_device_has_msix(gt_to_xe(gt))) {
+		hwe->irq_offset = get_msix_irq_offset(gt, info->class);
+		hwe->irq_page = info->instance;
+
+	} else {
+		hwe->irq_offset = info->irq_offset;
+		hwe->irq_page = 0;
+	}
 	hwe->domain = info->domain;
 	hwe->name = info->name;
 	hwe->fence_irq = &gt->fence_irq[info->class];
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index 0f87128c6529..2cf898e682f5 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -118,6 +118,8 @@ struct xe_hw_engine {
 	u16 logical_instance;
 	/** @irq_offset: IRQ offset of this hw engine */
 	u16 irq_offset;
+	/** @irq_page: MEMIRQ page used by this HW engine */
+	u16 irq_page;
 	/** @mmio_base: MMIO base address of this hw engine*/
 	u32 mmio_base;
 	/**
-- 
2.47.1

