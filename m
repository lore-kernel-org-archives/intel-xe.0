Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44432C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 21:01:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE20810E69E;
	Tue, 12 Dec 2023 21:01:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416D710E69E
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 21:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702414884; x=1733950884;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R3X+QajrLAow+ZKfGApyRimH+Ej4zSsP+CbAOUJj5As=;
 b=Rq2Z7RUCIqd6iB+RIqAqn3IbkATkabzBrMBJdBuStKUjs27jjc+4oyDW
 7i6opuw5PUoGqrlaQQAcHuwLob8bI//lH8hEH4edxtaxBjOrJ7koXRdFs
 l9PUi3L5WD0pXvCsyj6MOm+NxoIu8ejJe9cRcxFBNwm/GDkZqj6ekH0/R
 UJVUCvmhLNj/IuAmh03xI/oOKubpmMxyURoV8R7nxJ/p+qTxnWXJtAxSZ
 JlObLu0JW9bgqZrzan6JauThCL3dQmFTW5YzBAR6ckVzmwi9jjOg5K41f
 9gq7rrYOcLkwN3WNBO3Fxovrp44g27dy+V+9y1/f8PfUaA+o1a0c1wqF6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="397654585"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="397654585"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 13:01:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="917417156"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="917417156"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.128.218])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 13:01:15 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 03/10] drm/xe: Define registers used by memory based irq
 processing
Date: Tue, 12 Dec 2023 22:00:47 +0100
Message-Id: <20231212210054.1747-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231212210054.1747-1-michal.wajdeczko@intel.com>
References: <20231212210054.1747-1-michal.wajdeczko@intel.com>
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
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 3942db268b01..5e15c707e017 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -39,8 +39,10 @@
 #define RING_MI_MODE(base)			XE_REG((base) + 0x9c)
 #define RING_NOPID(base)			XE_REG((base) + 0x94)
 
+#define RING_INT_SRC_RPT_PTR(base)		XE_REG((base) + 0xa4)
 #define RING_IMR(base)				XE_REG((base) + 0xa8)
 #define   RING_MAX_NONPRIV_SLOTS  12
+#define RING_INT_STATUS_RPT_PTR(base)		XE_REG((base) + 0xac)
 
 #define RING_EIR(base)				XE_REG((base) + 0xb0)
 #define RING_EMR(base)				XE_REG((base) + 0xb4)
-- 
2.25.1

