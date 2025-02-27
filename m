Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1FAC19F2E
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 10:23:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4544310EAA2;
	Thu, 27 Feb 2025 10:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j1jrFOMu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D206710EA89
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Feb 2025 10:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740651828; x=1772187828;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uo6r+zKBA8prxt6NI1L5bNkMvL3Vi4K+t3xRPlQXhDc=;
 b=j1jrFOMuPpshIdJRVzeHjB1xfuwWDsJiHlXTWxym2A1ZVvBLV5UdP9Ya
 WNm7e+wJysrW+YD9wDay8ZkkqZcwYBsWp88yGdkQr/aeb/UGVRb3gzAo4
 YkNWRvuMiec4fNI690rq3ZZoaTHDTbu9Hb8ATusF9emZssGF3XCiZV61H
 yCx3QP7munZGdzUq8L7UbsPunmh2xZ2N3f4z3/y1WwoEjMoaZ5rqplSGP
 xj08MGRPHuyAGv0fLkPGEp1V61hv/T+XLb8oPScgxTgBrP05BS1FwNvsG
 VgF0sbJIPSDguBSDk2cEj3YXY0dXzfNTe8/AjO3EVKyP4mjibgjjwlRq/ Q==;
X-CSE-ConnectionGUID: n24HEfsjTai/rv7lgZrynw==
X-CSE-MsgGUID: kX4MTbPnR36H0b2jg/Ud2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41416720"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="41416720"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 02:23:48 -0800
X-CSE-ConnectionGUID: 3sqXVtQVRAu23jV6gVWhLA==
X-CSE-MsgGUID: artp46MUTxmkhr1MRtrNkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="117010479"
Received: from unknown (HELO nakshtra-System-Product-Name.iind.intel.com)
 ([10.190.238.69])
 by orviesa006.jf.intel.com with ESMTP; 27 Feb 2025 02:23:46 -0800
From: nakshtra.goyal@intel.com
To: intel-xe@lists.freedesktop.org,
	ramadevi.gandi@intel.com
Cc: francois.dugast@intel.com
Subject: [PATCH] drm/xe: Add fault injection for xe_oa_alloc_regs
Date: Thu, 27 Feb 2025 15:53:39 +0530
Message-Id: <20250227102339.2859726-1-nakshtra.goyal@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Nakshtra Goyal <nakshtra.goyal@intel.com>

Add fault injection for xe_oa_alloc_regs to allow it to fail while
executing xe_oa_add_config_ioctl().
This need to be added as it cannot be reached by injecting error through
IOCTL arguments.

Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index d89e6cabf5a5..b8704360f998 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -2231,6 +2231,7 @@ xe_oa_alloc_regs(struct xe_oa *oa, bool (*is_valid)(struct xe_oa *oa, u32 addr),
 	kfree(oa_regs);
 	return ERR_PTR(err);
 }
+ALLOW_ERROR_INJECTION(xe_oa_alloc_regs, ERRNO);
 
 static ssize_t show_dynamic_id(struct kobject *kobj,
 			       struct kobj_attribute *attr,
-- 
2.34.1

