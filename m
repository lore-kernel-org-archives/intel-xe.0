Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA3DCCCD18E
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 20:48:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E155E10E705;
	Tue,  7 Oct 2025 20:48:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QCPAHD1e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71B310E38E
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 20:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759870130; x=1791406130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j+ueTJA+bQXVo/bGUNJKsVm7gvXYXvpo6o7EkHEJFuk=;
 b=QCPAHD1eSt2wPV/F7X+UkGqhlqDwNti6gehmhIHybyK/n05GtoEzDMZG
 x7TWTtm93A1inyQLAS6pzQouRYPsEuKeMgBgtFO5gt0xec4/F6VZGUi+x
 oNeiUkdvZ7ud3ZqdVAhgvwAk1/uYHEaaT48sCl0+WfzmU3CFp06FqxtdO
 liTsGPEaR8xHfA0A8UWLt7bpbUt/s3HsiauLW460evmBvjixkaCCZOa8A
 x8cF0aKp8AkhicDtPAl0D6INIvueXQ65WRhmc3jprVpLuMI/PD5VTfiRc
 shw68J/55ZlZZWS8q1leMd/1jVf1bfUN8g9/i+ik1ISdwPzb0ZPwEWhGu w==;
X-CSE-ConnectionGUID: lfQsR5zzRcuUtUlRUbPBsg==
X-CSE-MsgGUID: xP2JGxpSQrCER3AG07M5fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="49616752"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="49616752"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:48:49 -0700
X-CSE-ConnectionGUID: mrmc4EJJTzOh7tsoQZXWwg==
X-CSE-MsgGUID: qrPn5SgVSsmgoyDOqnFEkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="184631099"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:48:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v4 14/23] drm/xe/irq: Don't try to lookup engine masks for
 non-existent primary GT
Date: Tue,  7 Oct 2025 13:48:44 -0700
Message-ID: <20251007204829.1468209-39-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007204829.1468209-25-matthew.d.roper@intel.com>
References: <20251007204829.1468209-25-matthew.d.roper@intel.com>
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

