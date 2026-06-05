Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D635CD8C87
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 23:21:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF66311ABC7;
	Fri,  5 Jun 2026 23:21:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S3nPZqs8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5DA311ABBF
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 23:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780701679; x=1812237679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2GEFlp3HTz0J29zN9brMjXO+mX86S7PepgO1oxGNaTg=;
 b=S3nPZqs80xyXVemfAldTXV5EjEp5nc5M3Fa2dIaEKj1ZbhSybs63U7QG
 ARMHcuMuuUXuSBQgsxWyoYWiA+4LSD4ZFmXocdkEfHBC9134ZwUwSg8Ma
 PNTxvWdOhmO8ps2ZyyKWoIxYKORTi6VPIfyFr4HihVsT7nuihzerJ6wbn
 UDmo1w55H92/psXsowKKAnbs4NvGaXKxToB4cuKrHhU/z1LriJFpyfj5U
 D7Ht88SjBROhiZ8LcAZJ1rF1Lauw8nPOaSdPWubf95QnH+WT9KwwOcsbF
 KsSWUexQPUwfCHkqsEsRKmTuUVBWWgC14MwPfTtcQlPNHfSCGKG/d/rt4 w==;
X-CSE-ConnectionGUID: weSuM8Y9RuqZA27luxr7Vw==
X-CSE-MsgGUID: itR1z3eZSe2GP+/+5hFHGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="81449678"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="81449678"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 16:21:19 -0700
X-CSE-ConnectionGUID: 3RmXCuUdQK+ri+/oiRSU2A==
X-CSE-MsgGUID: HFFyIRonTBeymREinX9bRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="245018290"
Received: from dut4385arlh.fm.intel.com ([10.105.8.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 16:21:19 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: michal.wajdeczko@intel.com, ilia.levi@intel.com, x.wang@intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 alan.previn.teres.alexis@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 03/12] drm/xe: Cap MSI-X vector count to XE_MSIX_MAX_VECS
Date: Fri,  5 Jun 2026 23:21:10 +0000
Message-ID: <20260605232108.674580-17-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605232108.674580-14-stuart.summers@intel.com>
References: <20260605232108.674580-14-stuart.summers@intel.com>
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

Introduce XE_MSIX_MAX_VECS (1024) as a software cap on the total number
of MSI-X vectors the driver will use. We want a way to cap the number
of vectors separately from the PCIe capability. This way we can more
easily manage certain system-wide configurations that might differ
from the per-device level configuration.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: Copilot:claude-sonnet-4.6
---
 drivers/gpu/drm/xe/xe_irq.c | 2 +-
 drivers/gpu/drm/xe/xe_irq.h | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 9e49e2241da4..3429bb305293 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -895,7 +895,7 @@ static int xe_irq_msix_init(struct xe_device *xe)
 		return nvec;
 	}
 
-	xe->irq.msix.nvec = nvec;
+	xe->irq.msix.nvec = min_t(int, nvec, XE_MSIX_MAX_VECS);
 	xa_init_flags(&xe->irq.msix.indexes, XA_FLAGS_ALLOC);
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
index a28bd577ba52..5f48249dae8a 100644
--- a/drivers/gpu/drm/xe/xe_irq.h
+++ b/drivers/gpu/drm/xe/xe_irq.h
@@ -10,6 +10,13 @@
 
 #define XE_IRQ_DEFAULT_MSIX 1
 
+/*
+ * Software cap on the total number of MSI-X vectors the driver will use.
+ * Allows the supported vectors to be managed independent of the PCI
+ * config space report.
+ */
+#define XE_MSIX_MAX_VECS 1024
+
 struct xe_device;
 struct xe_tile;
 struct xe_gt;
-- 
2.43.0

