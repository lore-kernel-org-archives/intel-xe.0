Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5098E109B46C
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 13:43:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013C110E2E3;
	Tue, 31 Mar 2026 13:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l0aiRZLL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC30610E2E3
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Mar 2026 13:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774964625; x=1806500625;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bCecvUzReXj6RGqV7eZ+BolnS1hfTXuviHAn64nNji0=;
 b=l0aiRZLLjV6ut8CfS7nXwE5fqqXTP8hlmqgMZqb/8eQQHhmA5iHA2npM
 0U4KDMf9gXDyLsCVq+mxWbEFqOaSMrTnlTsvFHclPH/OJHSawVVz6VQ/7
 Nkhsp8REZlMqbOP3EYd/rbj/9lEBH2ve/zBICt3W19WctyIQbMhN/z9sE
 QlztHZJ32BZkHmPbMRqPMGaAhwbU996ZjwIik1rpQxVLOkezFOi06Kwq/
 FADcs+CMGKohPhHdZtjIWg8M32Pin2GlaOZkYR+t0MaSPnshgkm2qj1ty
 sNckUAmbHTX8lbiRhK3KBO4LDnDlS1ZepG+UG4mrfJQo1Ak0UJffLMKaO w==;
X-CSE-ConnectionGUID: s5e+Tr5ZRT6FwL4IHj2ibQ==
X-CSE-MsgGUID: Bjq21x7XTQeoEmJWkg4w6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75941060"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="75941060"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 06:43:44 -0700
X-CSE-ConnectionGUID: KL/Mw+/BRAKfbW86HShLLQ==
X-CSE-MsgGUID: dsm3mwFKSdajkDPUdKrbKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="226239624"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.212])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 06:43:43 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/xe_pat: Print PAT_ATS during register dump
Date: Tue, 31 Mar 2026 15:43:31 +0200
Message-ID: <20260331134330.2535519-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

For Xe2 and beyond we miss printing PAT_ATS register.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 356f53bdb83c..75aaae7b003d 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -531,6 +531,14 @@ static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 	drm_printf(p, "Page Table Access:\n");
 	xe->pat.ops->entry_dump(p, "PTA_MODE", pat, false);
 
+	if (xe_gt_is_media_type(gt))
+		pat = xe_mmio_read32(&gt->mmio, XE_REG(_PAT_ATS));
+	else
+		pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_ATS));
+
+	drm_printf(p, "PCIe ATS/PASID:\n");
+	xe->pat.ops->entry_dump(p, "PAT_ATS ", pat, false);
+
 	return 0;
 }
 
-- 
2.43.0

