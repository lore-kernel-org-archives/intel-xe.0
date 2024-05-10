Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6EDC41513
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 18:12:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B0C510EC25;
	Fri, 10 May 2024 18:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TsUNW2oS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8532E10EC25
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 18:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715364772; x=1746900772;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XHNEtK+GtaqoxDZwbJLAWebySHaQoalt0s6ESqr2Vjs=;
 b=TsUNW2oS68p0zkDR4RRERyKgFJIY05T9MpilzwjGALX1kAOpL4QUd809
 fvnQbpir7wRInlN8KiISKS7oK7Sa/CqJh6XBCrgbXR1sfJqcNojCeoxo9
 C0XW1/XMVOhwyLdfjZjvr042ldjyWXuOOFDnqSGacUq6VmO09te+HMfBR
 EFWKAMe82fnHYnKRxG8Kn06tMMkJvT+l7LpulWUfzdYXEB8+P+3MGuuS8
 y5W0Jgep3FRhGYGmdr29EJUq3yjW++sk+nCNMfLLqdK69HD3MIbEP5/d1
 tBVHFEPVM7aToibm1RIom/zCFOL6fgnkHJjTEILlf6ZP663+OeQo3xy4h Q==;
X-CSE-ConnectionGUID: HIMnX4M3QgS0bnWGKgvo3w==
X-CSE-MsgGUID: hc47iqtYSY68RMX4NfiAkg==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="28844630"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="28844630"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:12:52 -0700
X-CSE-ConnectionGUID: quml7ZsgSnKT9BAYdK12CQ==
X-CSE-MsgGUID: w/3KoGLoT7i1NrrHw7fN3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="60544156"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.149])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:12:50 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 19/20] drm/xe/display: stop calling domains_driver_remove twice
Date: Fri, 10 May 2024 19:12:32 +0100
Message-ID: <20240510181212.264622-41-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240510181212.264622-22-matthew.auld@intel.com>
References: <20240510181212.264622-22-matthew.auld@intel.com>
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

Unclear why we call this twice.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 6d74c9f55b0a..734bddbb8932 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -134,7 +134,6 @@ static void xe_display_fini_noirq(void *arg)
 		return;
 
 	intel_display_driver_remove_noirq(xe);
-	intel_power_domains_driver_remove(xe);
 }
 
 int xe_display_init_noirq(struct xe_device *xe)
-- 
2.45.0

