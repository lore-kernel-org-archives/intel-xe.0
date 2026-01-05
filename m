Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A910FC617D
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 11:52:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38DE10E3CA;
	Mon,  5 Jan 2026 11:52:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nqD+qlM8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 220FC10E180;
 Mon,  5 Jan 2026 11:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767613925; x=1799149925;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RGLVK76X/HITLeUMcXwlq00GUp+pEqle5XJovdQaENY=;
 b=nqD+qlM8/1O7ESd9Hg+knpHGVDSvDgoh/zpBs+NYSkl4hm6wH/Uc3tiN
 MlGY4v79hC/1MMVzW75gnunAcbhdErhjIOm9B4BLoFeq2Ft+J8RGjpazD
 stKBEXOBe5T6c+bYugc/5ZHt9ROeEzovZN2M4WlQEqSWmzJiVIqGc4sNy
 n3vQ0Fb4MEglDVD1+NuD6gnkcm9W0a3OE3AQlE5wJvcJm/QaLumnZHlnX
 Xn3zYf25pWcDdDcxU145yiy8e3FMxvc0ZDdGFdhBdlAPJaCNm7AqhmlXP
 cjqLtMLBTrvNTL99fWx+HuT5CcDtHogGdiFidNs8S1bpvS8vAmW5CsC8I w==;
X-CSE-ConnectionGUID: u17apVgmQziWBILUeB1Qxg==
X-CSE-MsgGUID: zbDhm/iuQEyyPYE2l9MrEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="69050663"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="69050663"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 03:52:05 -0800
X-CSE-ConnectionGUID: K6LP2LuOTEy+dtkhvQHM9A==
X-CSE-MsgGUID: KqUMM34iQxyUIBSJsFparA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="202614137"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 03:52:03 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 8/9] drm/i915/intel_lt_phy: Fix the SPDX identifier comment
Date: Mon,  5 Jan 2026 17:05:42 +0530
Message-ID: <20260105113544.574323-9-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260105113544.574323-1-ankit.k.nautiyal@intel.com>
References: <20260105113544.574323-1-ankit.k.nautiyal@intel.com>
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

Fix the SPDX identifier comment as per the licensing rules [1].

[1] https://www.kernel.org/doc/html/latest/process/license-rules.html

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_lt_phy.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.h b/drivers/gpu/drm/i915/display/intel_lt_phy.h
index 7659c92b6c3c..83fff7b6a961 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.h
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.h
@@ -1,4 +1,5 @@
-/* SPDX-License-Identifier: MIT
+/* SPDX-License-Identifier: MIT */
+/*
  *
  * Copyright © 2025 Intel Corporation
  */
-- 
2.45.2

