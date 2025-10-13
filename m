Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49EA3CCD19B
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 20:10:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E5F10E516;
	Mon, 13 Oct 2025 20:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QIhwDPAz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF30F10E503
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 20:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760386203; x=1791922203;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Az7+qMtreBbP5KrgMAz2CKVmrQKsFG81Q/axpeX18Sw=;
 b=QIhwDPAzgcMqPiq6fJZdwjzQWLXRMC0IpRksrzUOu5V2ETvp82+Im6pj
 FQ4Trov3QfFW2ZfSAPgPUjpQx7Zu+J65ZZQ6cAwOccs8XuJLU8lauO3zs
 9d67r7XWCYtfGuhmadgHFlcHROAovBqP/O4w9fnz4EZ9otQCjQh8ZLgaa
 XGFMkOQWu2lMw8yW4z3/9J/scfX2O4HNdlZgkSm488D+6ScJCD7yz8XLr
 cDV0yHmuOi16lc5BorA/u6dxM1LAPdPdTUzBVeFSn+1wmAtqClNr9ag3U
 L7/mtwEx1cc/DJNgKD6olyHL1EyCWMkaa0g3mwqHYI2JHiX/q9+kpoJL7 g==;
X-CSE-ConnectionGUID: 56IHy67pRUuV/p2xj5E4sQ==
X-CSE-MsgGUID: Z7m2KAoCQpiMtNyMFbV5Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="72800546"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="72800546"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:10:03 -0700
X-CSE-ConnectionGUID: p/g8bpwDRqqyGM8aX3mgng==
X-CSE-MsgGUID: RF+vv31PRWi9v2PA4hgLEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="185707581"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:10:02 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v5 14/23] drm/xe/irq: Don't try to lookup engine masks for
 non-existent primary GT
Date: Mon, 13 Oct 2025 13:09:57 -0700
Message-ID: <20251013200944.2499947-39-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013200944.2499947-25-matthew.d.roper@intel.com>
References: <20251013200944.2499947-25-matthew.d.roper@intel.com>
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

If the primary GT is disabled via configfs, we shouldn't try to access
it to lookup BCS/CCS engine masks.  For the purposes of IRQ reset (which
masks & disables interrupts in an sgunit register), assume all possible
instances are present.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 9b938f1edaf5..838fb512b777 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -494,11 +494,15 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 static void gt_irq_reset(struct xe_tile *tile)
 {
 	struct xe_mmio *mmio = &tile->mmio;
+	u32 ccs_mask = ~0;
+	u32 bcs_mask = ~0;
 
-	u32 ccs_mask = xe_hw_engine_mask_per_class(tile->primary_gt,
-						   XE_ENGINE_CLASS_COMPUTE);
-	u32 bcs_mask = xe_hw_engine_mask_per_class(tile->primary_gt,
-						   XE_ENGINE_CLASS_COPY);
+	if (tile->primary_gt) {
+		ccs_mask = xe_hw_engine_mask_per_class(tile->primary_gt,
+						       XE_ENGINE_CLASS_COMPUTE);
+		bcs_mask = xe_hw_engine_mask_per_class(tile->primary_gt,
+						       XE_ENGINE_CLASS_COPY);
+	}
 
 	/* Disable RCS, BCS, VCS and VECS class engines. */
 	xe_mmio_write32(mmio, RENDER_COPY_INTR_ENABLE, 0);
-- 
2.51.0

