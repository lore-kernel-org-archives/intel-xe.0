Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283BAC5B552
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 15:30:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF6D110E8AB;
	Thu,  5 Jun 2025 15:30:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XWdkfSUQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA33610E92F
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 15:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749137455; x=1780673455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lmcSF5A5QzqcwLmEdjGmGz05y6rgh8x6I7sGueuwzrA=;
 b=XWdkfSUQbV7wUJVzd6qgnSiB1og/k1WN2YN0L16QfV6aFP8al35EyUTD
 xFW95E1zoZZDxF8id/0qVepJJtru60ik/owgibmls2U4u8Y0YrSUHsuhD
 nqkfOfdLcWbFIt5Njpy9dpo6wf9w0iwvyjpTnPNZg4VirEJb8Wb3Q2iRR
 pIz9VhuA0UpAIoLR4yZ0B5jSo9V3m/U1c7N81Zcrty3y6ATgpuBHNThGB
 ls2SAaG998fNI6gsja5rdqn+6LXL0CnvmpEtLX7ijz61ujkXvU8w/11TT
 Dnl25KfcNwanOE+8NdyUYanXRWGYjGNBqny9xhQct1UXJJVugTt/yaZy+ w==;
X-CSE-ConnectionGUID: 1Gt06vYtQ5uXiO++9L8psw==
X-CSE-MsgGUID: 9T3ntOtQRtWYO+2gCAtRQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="61529489"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="61529489"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 08:30:51 -0700
X-CSE-ConnectionGUID: oAFteS5+T/q01hwRpunLFA==
X-CSE-MsgGUID: +L+d+q7oSmeGnBHAh2n2OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="176502807"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 08:30:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 06/15] drm/xe: Add xe_hw_engine_write_ring_tail
Date: Thu,  5 Jun 2025 08:32:14 -0700
Message-Id: <20250605153223.2789122-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250605153223.2789122-1-matthew.brost@intel.com>
References: <20250605153223.2789122-1-matthew.brost@intel.com>
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

ULLS for migration jobs need to directly set hw engine ring tail, add
function to support this.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 3439c8522d01..5ab024743504 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -304,6 +304,16 @@ void xe_hw_engine_mmio_write32(struct xe_hw_engine *hwe,
 	xe_mmio_write32(&hwe->gt->mmio, reg, val);
 }
 
+/**
+ * xe_hw_engine_write_ring_tail() - Write ring tail
+ * @hwe: engine
+ * @val: desired 32-bit value to write
+ */
+void xe_hw_engine_write_ring_tail(struct xe_hw_engine *hwe, u32 val)
+{
+	xe_hw_engine_mmio_write32(hwe, RING_TAIL(0), val);
+}
+
 /**
  * xe_hw_engine_mmio_read32() - Read engine register
  * @hwe: engine
-- 
2.34.1

