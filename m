Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667F6C7EE26
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 16:59:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F1710E54A;
	Fri, 19 May 2023 16:59:47 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B0C710E545
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 16:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684515581; x=1716051581;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G8Fh2ggp6olqp5lJ6cU074+O8OFjU7ycuT2J+RPN8tw=;
 b=K/lOnNd75BpQNE7d59wXsGx7TjjGOcprvG+cbhTx1nVN5UU16mCkhLcs
 aU+koFbAwPsluhkz0xSOO9cP/f8/A3WYeoV7aRo7t3BVK2gfY//CGbtMb
 iWg7+bNvNuAXjMevcXzd6YYBKKqe0ldC/aK2lK/R0fAOPCdvdd+ByAWh/
 +LaBaWzEAJ1UyrFowIqEJ1V9dDCyyg/+RyhxDlmcrBp+qUumcNC1yYQpq
 JBd5LCWoTO+2BVNUt+jdnutiP28b+wM2jW7wuHwMWngCoUM1Zcx49tIJI
 VNnZdmJKEIzMTr122c9fsYxD3vjHkZuTxZDPHxqNA9iqSyeBQlLaRPMdT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="332030794"
X-IronPort-AV: E=Sophos;i="6.00,177,1681196400"; d="scan'208";a="332030794"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 09:59:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="876906509"
X-IronPort-AV: E=Sophos;i="6.00,177,1681196400"; d="scan'208";a="876906509"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.143.198])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 09:59:40 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 19 May 2023 18:59:27 +0200
Message-Id: <20230519165927.1204-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230519165927.1204-1-michal.wajdeczko@intel.com>
References: <20230519165927.1204-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Drop legacy GuC interrupt register
 definition
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

It was used by the Gen9 hardware, not supported by this driver.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_guc_regs.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
index f08966c2be20..20430927eafa 100644
--- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
@@ -86,10 +86,6 @@
 #define   GUC_ENABLE_READ_CACHE_LOGIC		REG_BIT(1)
 #define   GUC_DISABLE_SRAM_INIT_TO_ZEROES	REG_BIT(0)
 
-
-#define GUC_SEND_INTERRUPT			XE_REG(0xc4c8)
-#define   GUC_SEND_TRIGGER			REG_BIT(0)
-
 #define GUC_NUM_DOORBELLS			256
 
 /* format of the HW-monitored doorbell cacheline */
-- 
2.25.1

