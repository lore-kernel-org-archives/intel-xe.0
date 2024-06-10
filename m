Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6968C27C55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 12:04:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB9910E281;
	Mon, 10 Jun 2024 12:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GQNqeMR4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EACB510E281
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 12:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718021061; x=1749557061;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=6B8pkwj5IYcUvtHrUlA6lWt2IBvaEwFjd62p3FQ0e/8=;
 b=GQNqeMR4hlTySaAU3O6Dfh0lc3/yQ9No2M1BteC3aeNYtfea7OtUnCoi
 hH4y5jKSJypQ7b3H+m41PRS5CXBFgC8Pd6jcqIYkpglZYqt5V344eZ6Pd
 r6fFRN4fwfzM0p3VCuFgbdxv1Byzszmd4lq7XYZ04/77NbtMNxi29P7Lq
 8ovsMacQpj+odR3GL1bhSGSbukF//auidZangPlnd3tIIskQp8irDLB4l
 kex6/G1JPZvE0J74FP2cFTQ2QVaeHrGz82AVu3IIan7fQdsQT6CBNHs93
 dbe1CCMshHh3wDlaGsvu14kO7NMVGTyREpJJAGJofywkReP9AM6mOEvhj w==;
X-CSE-ConnectionGUID: G7S7zaSHS/y+EXuRGv1JNw==
X-CSE-MsgGUID: 6h+lfc3ZT6OrnjCT2dL0uA==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14830936"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14830936"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 05:04:21 -0700
X-CSE-ConnectionGUID: k6Psez7vQJ++hrfM78Vk4Q==
X-CSE-MsgGUID: IPl9lGJXSCi5eO20d/0vFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="39117391"
Received: from mmanski-mobl.ger.corp.intel.com (HELO
 mwajdecz-MOBL.ger.corp.intel.com) ([10.246.1.253])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 05:04:20 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] drm/xe/guc: Drop unused legacy GuC message ABI definitions
Date: Mon, 10 Jun 2024 14:04:10 +0200
Message-Id: <20240610120411.1768-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240610120411.1768-1-michal.wajdeczko@intel.com>
References: <20240610120411.1768-1-michal.wajdeczko@intel.com>
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

Those were copy-pasted from i915 code and never used in Xe driver.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_messages_abi.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_messages_abi.h b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
index 534a39db7772..e32142e3fe41 100644
--- a/drivers/gpu/drm/xe/abi/guc_messages_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
@@ -220,17 +220,4 @@
 #define GUC_HXG_RESPONSE_MSG_0_DATA0		GUC_HXG_MSG_0_AUX
 #define GUC_HXG_RESPONSE_MSG_n_DATAn		GUC_HXG_MSG_n_PAYLOAD
 
-/* deprecated */
-#define INTEL_GUC_MSG_TYPE_SHIFT	28
-#define INTEL_GUC_MSG_TYPE_MASK		(0xF << INTEL_GUC_MSG_TYPE_SHIFT)
-#define INTEL_GUC_MSG_DATA_SHIFT	16
-#define INTEL_GUC_MSG_DATA_MASK		(0xFFF << INTEL_GUC_MSG_DATA_SHIFT)
-#define INTEL_GUC_MSG_CODE_SHIFT	0
-#define INTEL_GUC_MSG_CODE_MASK		(0xFFFF << INTEL_GUC_MSG_CODE_SHIFT)
-
-enum intel_guc_msg_type {
-	INTEL_GUC_MSG_TYPE_REQUEST = 0x0,
-	INTEL_GUC_MSG_TYPE_RESPONSE = 0xF,
-};
-
 #endif
-- 
2.43.0

