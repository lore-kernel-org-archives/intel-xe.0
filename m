Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD08C7EE3A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 00:04:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CBCA10E51D;
	Thu,  1 Jun 2023 00:04:16 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4617810E0EB
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 00:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685577852; x=1717113852;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vWwxCosYfOMujfbrx7yqiQj/hV2AguKQ6ywvCiBvuhY=;
 b=OAYmqE01xhH3xv/Un1zUJDnHE4hygeW+Aq5b8OZAbvfN4r99vuJozkDA
 WANDl18DqAwK3MelXZ5vtpxdEnhRkZDKvQTBplBaHkMUhLFvDgRh19pma
 M7VH76VKloQfsrPTfZYFNRH1XRBHzOSPWqyHzxA/BEc5Zc+9cZ/Qu6aE8
 3TNhX5hcZ2qea5gOC6RyLAoZc9oQGxKI2eRmmYnbE4pLI5PHsHATVq88G
 sM5Wyrh4iXVbtQKCyOeCuWGN6sb0ZJOFYBvqhXxqRfQ/Za+QD84r8aXZW
 bzwd3t1aTlP09k8DfqQrNVCIfKoVb7ekMAgMcll96LYYntYD7fXcRwHM9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="339996824"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="339996824"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 17:04:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="657556166"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="657556166"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 17:04:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 31 May 2023 17:03:39 -0700
Message-Id: <20230601000403.432517-8-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601000403.432517-1-matthew.d.roper@intel.com>
References: <20230601000403.432517-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 07/31] fixup! drm/xe/display: Implement
 display support
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/display/ext/i915_irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/ext/i915_irq.c b/drivers/gpu/drm/xe/display/ext/i915_irq.c
index a0f22bd52549..6235ff9dec36 100644
--- a/drivers/gpu/drm/xe/display/ext/i915_irq.c
+++ b/drivers/gpu/drm/xe/display/ext/i915_irq.c
@@ -670,7 +670,7 @@ gen8_de_irq_handler(struct drm_i915_private *dev_priv, u32 master_ctl)
 
 void gen11_display_irq_handler(struct drm_i915_private *i915)
 {
-	void __iomem * const regs = to_gt(i915)->mmio.regs;
+	void __iomem * const regs = xe_device_get_root_tile(i915)->mmio.regs;
 	const u32 disp_ctl = raw_reg_read(regs, GEN11_DISPLAY_INT_CTL);
 
 	/*
-- 
2.40.1

