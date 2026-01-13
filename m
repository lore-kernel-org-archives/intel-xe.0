Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC9BD29DC4
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 02:52:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C7310E458;
	Tue, 13 Jan 2026 02:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NaglJvKD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 729CE10E307
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 02:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768272759; x=1799808759;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eajqgzIg5h4p4KzTc7RHRSIyLBrkG6/NY6HI7+fD6rE=;
 b=NaglJvKDwbNmOlP4ODVez6ja6RVLnGQb6h58qkZxc63vvKPvxNNLBCKM
 YFs8i480dnoJzpjFfhB+Z/LKwV1Ke/AyDbZh4P8g0FI7ExUAYzLLXQo+z
 N+oTGg24anCkrfn5HIENbL1X5aZq7cnxTC0zaBjAZkL4imTARHtFmDwzL
 tY9TdIVFNxC1Ef151HKnyEfo5b6/EXszgftM5pcE7NjPJG/+x4I5F7xjf
 gYYSvfUSUlwAm+JpZRUQVwXiWZ+bahMo5Szhe2QWWsdp+NlVyuqgYg6tz
 mwfP6PjYrglep94mn0pFzzoq3yzg6VpSnhNxOkL0y0WyVOTEU08sn/O8p g==;
X-CSE-ConnectionGUID: ZuStFSD+QjqoY85mBfYlsQ==
X-CSE-MsgGUID: VJAIMaKuSjqsl5prtMj1Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69714535"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69714535"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 18:52:38 -0800
X-CSE-ConnectionGUID: hrMBhGWFTWanvSJrZMQovw==
X-CSE-MsgGUID: zoB5hJYSSKKrWr8vSb+C7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="204070343"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 18:52:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com
Subject: [PATCH v4 12/12] drm/xe: Enable context TLB invalidations for CI
Date: Mon, 12 Jan 2026 18:52:32 -0800
Message-Id: <20260113025232.3504648-13-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260113025232.3504648-1-matthew.brost@intel.com>
References: <20260113025232.3504648-1-matthew.brost@intel.com>
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

Do not review, CI only.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 6ea1199f703e..8a03bed61378 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -96,6 +96,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
 	.has_asid = 1, \
 	.has_atomic_enable_pte_bit = 1, \
 	.has_range_tlb_inval = 1, \
+	.has_ctx_tlb_inval = 1, \
 	.has_usm = 1, \
 	.has_64bit_timestamp = 1, \
 	.hw_engine_mask = \
-- 
2.34.1

