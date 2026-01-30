Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B12E6BF39
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 21:01:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4F310E39D;
	Fri, 30 Jan 2026 21:01:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jZH80qMX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA05210E95E
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 21:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769806904; x=1801342904;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WQey5LFp3pp2iulbdHFORMvyZIAfPBTqfYoHrk5r4fM=;
 b=jZH80qMXdcfHk1ZvEpGFW8LZILtiIS/uiC/O7mjoQ4y2enmNAryiB0EE
 eRSLD8NIxeyCm2Z0szMpJgrA63Mc0aXVtTtQKM3KgRvqecgqSjNUN7953
 rd2mLnu7dk/Zvosjgr3U7n6A/D7uRj1XukIL2cwaIHz0r9sr2OuS6LxK5
 qQ2UdywMRKVifSHg55QYSwSlop9o/94+hiYnx8k23a/vcdh2dVxvPgO6i
 UV8/Fsj9rlJQCBSFWEkC84yooa2WCUaJOwMP/kUN7wS9N41tH8WKFWsG9
 09WppTw/7wYfqqkshEi5fZ5KwVQb7mJXw4jsKAMHZjnLbZE+SEkf/xHwH g==;
X-CSE-ConnectionGUID: isgL10gtQ2CjnsjP0T4jLA==
X-CSE-MsgGUID: a60dffdHTAyWcpRcfwOMWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="71041396"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="71041396"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 13:01:44 -0800
X-CSE-ConnectionGUID: KUN3DhweTh2HRP4s/X2FqA==
X-CSE-MsgGUID: wSYMHrxTTN6wZr7D7FSGrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="208065072"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 13:01:43 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v2 3/3] Reapply "drm/xe/xe2: Enable Indirect Ring State
 support for Xe2"
Date: Fri, 30 Jan 2026 12:50:35 -0800
Message-ID: <20260130210120.2682085-8-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130210120.2682085-5-julia.filipchuk@intel.com>
References: <20260130210120.2682085-5-julia.filipchuk@intel.com>
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

This reverts commit 03d85ab36bcbcbe9dc962fccd3f8e54d7bb93b35.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 779546ec8836..37dfbcc8f028 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -94,6 +94,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
 #define XE2_GFX_FEATURES \
 	.has_asid = 1, \
 	.has_atomic_enable_pte_bit = 1, \
+	.has_indirect_ring_state = 1, \
 	.has_range_tlb_inval = 1, \
 	.has_usm = 1, \
 	.has_64bit_timestamp = 1, \
-- 
2.51.0

