Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5603F433C7
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 04:55:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C0410E7D4;
	Thu, 16 Apr 2026 04:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y6+JDfaq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F3D10E179
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Apr 2026 04:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776315329; x=1807851329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yES1X9/LGqsDKhtNoDGP3Ch2U48exhmH2x/MJCEkgGs=;
 b=Y6+JDfaqKq3OCNGaBEPwIAffRNLLnpM0APGI8py/i5C5uWRr0StIT0Fg
 xeYjqjV0f/SC97++oK+cWFI+g6T/MSWvZatjCdbkI7lZONXccMHdd0Al0
 10bdtqTN0xaPwRif3QHqt4PlWDRGvISBYPS3jrd046DS6+mU3jqimyP4n
 ltzmkzq9UzSkxA2XKzK4V7EHIo3veYs9SJVia02rgZsz7Xv9a5+5bIAtx
 ccxjTV2hip3W48tWG0bTnBj8ZhbXAT9IsR6c3xmNjVEvUB5XOb67JBAVO
 ygHQp6q9QdW5ltNg4Sm2TU1gjh3jgnuFXa20A7+pauDTn5PGMfEqZcs8y Q==;
X-CSE-ConnectionGUID: AB1l7I1ASk6Lwf/nbqnMsQ==
X-CSE-MsgGUID: s5FJA5mAS4Kq7Bf8+PKKiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77487478"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="77487478"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 21:55:28 -0700
X-CSE-ConnectionGUID: YBOxFYlwToOFcFean572kA==
X-CSE-MsgGUID: nIASI+q/RxaAvxWNrZ10zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="232356476"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by fmviesa004.fm.intel.com with ESMTP; 15 Apr 2026 21:55:27 -0700
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v5 2/3] drm/xe/pat: Default XE_CACHE_NONE_COMPRESSION to
 invalid
Date: Wed, 15 Apr 2026 21:55:25 -0700
Message-ID: <20260416045526.536497-3-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260416045526.536497-1-x.wang@intel.com>
References: <20260416045526.536497-1-x.wang@intel.com>
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

Initialize XE_CACHE_NONE_COMPRESSION PAT index to XE_PAT_INVALID_IDX by
default, same as XE_CACHE_WB_COMPRESSION. Platforms that support this
cache mode will override it in xe_pat_init_early(). This ensures that
accidental use on unsupported platforms can be detected.

A subsequent patch introduces a helper to assert on invalid PAT index
access at all call sites.

Suggested-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 75aaae7b003d..fad5b5a5ed4a 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -559,6 +559,7 @@ static const struct xe_pat_ops xe3p_xpc_pat_ops = {
 void xe_pat_init_early(struct xe_device *xe)
 {
 	xe->pat.idx[XE_CACHE_WB_COMPRESSION] = XE_PAT_INVALID_IDX;
+	xe->pat.idx[XE_CACHE_NONE_COMPRESSION] = XE_PAT_INVALID_IDX;
 	if (GRAPHICS_VERx100(xe) == 3511) {
 		xe->pat.ops = &xe3p_xpc_pat_ops;
 		xe->pat.table = xe3p_xpc_pat_table;
-- 
2.43.0

