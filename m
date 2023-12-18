Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A139C46CD4
	for <intel-xe@archiver.kernel.org>; Mon, 18 Dec 2023 19:00:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CEA510E3AD;
	Mon, 18 Dec 2023 19:00:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E4110E3AE
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Dec 2023 19:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702926047; x=1734462047;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ea+XzXiqWQmLYX06q/1X1HL9Gv7sZFoLI16VQRkb0WA=;
 b=j6/Y0budcWtHyb8mtjgUtUxh2p3l4eKptxU819FZz4XJcqYb+uib5Dqx
 q4DxK3xNM5ehzGjttoUQ09VWunyGaesJPXvbeBUHSG6VOMYYWkSriVYA8
 peU4HW9xh0eJ3ILCcdLbTYwpIYxZnHgoXWoG7faaYgWi0dchowo6B2p+P
 48qT7Xqi+CkwHvRMuKx6xyoccElsDtP6rVlKxkQGD9N5T8KN/GQc8LXfB
 /tNizjq++vmM5yhZfHPekpBybCsMUJ3koAqvx/C3s/TZu0k2CVodpIIpq
 /BAA8z8Vqf+Tzk+2ek1BNj1DtROXPyzUxJynfKz7//qyZGLOL7Hzy9kYr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="461984325"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="461984325"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 08:53:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="779157427"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; d="scan'208";a="779157427"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.130.107])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 08:53:52 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v2 02/10] drm/xe: Define registers used by memory based irq
 processing
Date: Mon, 18 Dec 2023 17:53:36 +0100
Message-Id: <20231218165344.458-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231218165344.458-1-michal.wajdeczko@intel.com>
References: <20231218165344.458-1-michal.wajdeczko@intel.com>
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

The RING_INT_SRC_RPT_PTR register points to a cacheline in memory
to which an engine must report as source of interrupt prior to
generating an interrupt to the host.

The RING_INT_STATUS_RPT_PTR register points to the first cacheline
of the Interrupt Status Report (ISR) page (4KB) in graphics memory
to which all engines report their interrupt status.

The RING_IMR register has the interrupt enables and interrupt masks
for an engine.

We will refer to these registers shortly.

Bspec: 45963, 45964, 45965
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Link: https://lore.kernel.org/r/20231214185955.1791-3-michal.wajdeczko@intel.com
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 5592774fc690..bd9c956f48a7 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -75,7 +75,9 @@
 #define FF_THREAD_MODE(base)			XE_REG((base) + 0xa0)
 #define   FF_TESSELATION_DOP_GATE_DISABLE	BIT(19)
 
+#define RING_INT_SRC_RPT_PTR(base)		XE_REG((base) + 0xa4)
 #define RING_IMR(base)				XE_REG((base) + 0xa8)
+#define RING_INT_STATUS_RPT_PTR(base)		XE_REG((base) + 0xac)
 
 #define RING_EIR(base)				XE_REG((base) + 0xb0)
 #define RING_EMR(base)				XE_REG((base) + 0xb4)
-- 
2.25.1

