Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 606ECCAC5B5
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 23:46:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FCAF10E9C9;
	Thu, 25 Sep 2025 23:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lWHs2G/0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E90310E30A
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 23:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758844007; x=1790380007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/ePcV1VuIKsl8SR06yVgKlZxFcihHavmenM1zsAwsR4=;
 b=lWHs2G/0gcFr9BzB81tlmwVRtx1jAo9uZDB90T8iW1sZlK9hnJ/5quue
 P0uXOcBwsTlz5m66V+H1vSWIuqbyO6TuW8S6nxpjN/3XLSMPVtRDaHJby
 E9Qit6r1Myf3sdUSSxNkgWN2WH0ctu3ZtEWityiDCCo/CzjaI9ExkWssU
 tt/m7Pp+u7P0MfrRnChKkPVZr4wBRdsLyvr5r4c6KHVTpdUSNkHqduZsY
 NkWmG5cQwRjRJgd36F9KeI3Z80l/o9NQ49A07kBtcvpKgVn84k+dgKVF1
 BT2Zc0panEdshcMJ73VL3T9qgEcoPYAFYMkFGSNWF6KOdfqXMFs3KzvO5 A==;
X-CSE-ConnectionGUID: 63m4v8KbRkiqSPLsTnSMbw==
X-CSE-MsgGUID: PJlGleoqTTSSM8GcvHEGZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="78817675"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="78817675"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:46:46 -0700
X-CSE-ConnectionGUID: t2vs+MibQvyC6Rk/TtbGvg==
X-CSE-MsgGUID: 5E49Pyi+ROeKN3TXCYV34g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="181852983"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:46:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 13/22] drm/xe/irq: Don't try to lookup engine masks for
 non-existent primary GT
Date: Thu, 25 Sep 2025 16:46:41 -0700
Message-ID: <20250925234628.2112163-37-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925234628.2112163-24-matthew.d.roper@intel.com>
References: <20250925234628.2112163-24-matthew.d.roper@intel.com>
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
---
 drivers/gpu/drm/xe/xe_irq.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 5018a116852f..eaca56df08e4 100644
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

