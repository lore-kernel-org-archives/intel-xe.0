Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893D4C4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 19:01:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B0A10E0EB;
	Thu, 14 Dec 2023 19:01:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85FF010E95A
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 19:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702580425; x=1734116425;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6n11/BvFZaeN6/dodo67BzvvCCgGnVt5oNh0SKNpOKo=;
 b=IVcEWPgewfzEKwsga66A6mkYshlqC6zFbCeFE8kGladTUnu3+3OvS1Vx
 Cv2bNpfBde0zlNNjQVb9NIRlBinf0gLwLyljF+geQ+lmmYeVAChfWmDuy
 5c+11svy2gLjIfmxPVWvT3d/CuyOCwm3wwSRWAFS5iPfSba/uOZJb2ITT
 1oh1MvNnOw3CnrkDm+9hv+ZsKuuvTSA/dHJtjjoKMTeYmnqm1CEQKYDEK
 jLopAlZ7jDc8pjWIg+ZXjN+xP2IDv1FzPXTQC7C/qTh73kEalca7Odf+d
 iRI2rNsDr0YgvCb2XDUk2OUrwiLImdPKpCiv5CIOLpBhxT/UYgUIxjDYn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="399006378"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="399006378"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 11:00:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="15964772"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.128.198])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 11:00:17 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 02/10] drm/xe: Define registers used by memory based irq
 processing
Date: Thu, 14 Dec 2023 19:59:47 +0100
Message-Id: <20231214185955.1791-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231214185955.1791-1-michal.wajdeczko@intel.com>
References: <20231214185955.1791-1-michal.wajdeczko@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>
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
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 1a857c4edcf5..1f7501032baf 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -39,7 +39,9 @@
 #define RING_MI_MODE(base)			XE_REG((base) + 0x9c)
 #define RING_NOPID(base)			XE_REG((base) + 0x94)
 
+#define RING_INT_SRC_RPT_PTR(base)		XE_REG((base) + 0xa4)
 #define RING_IMR(base)				XE_REG((base) + 0xa8)
+#define RING_INT_STATUS_RPT_PTR(base)		XE_REG((base) + 0xac)
 
 #define RING_EIR(base)				XE_REG((base) + 0xb0)
 #define RING_EMR(base)				XE_REG((base) + 0xb4)
-- 
2.25.1

