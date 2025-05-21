Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694FFC54E65
	for <intel-xe@archiver.kernel.org>; Wed, 21 May 2025 21:34:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118F210E038;
	Wed, 21 May 2025 21:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GA86aGA2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A7C10E038
 for <intel-xe@lists.freedesktop.org>; Wed, 21 May 2025 21:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747863298; x=1779399298;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/6c6ByC3qDS1vNFp0wlh1g2zM8eOFzWeqvI135XSd9M=;
 b=GA86aGA2Gq1sdLHmeq+s1NSGtDbYEmHXqHefJr2s7mFy4/T1XuQJHSYj
 TQs2CRPLI5CBe1DU4hHFQ8vHCVYp8ayv6mjuLZ67XALOK1CELhwJK/NiN
 f1DUvsBPLq317KvMGAWc4jIBuQiZTPF8HHh1hj496x+pAxLkKLOW6Trkx
 ds1AImMU/slbzOYyQ092sVbPe3zfbwcEIvXntmCd+ZZOmeB3xpsN8NEOg
 vEEn1vtVI85AFLzPjz9jJFm0QNEtUrsZFPouE3vuXHzUrIPihjE+DfSWG
 ANRi2xeBVZ223L/tVvu4E+iyy5le5+6DJNJ8oURt3lXJyJyJICe1WfIFT g==;
X-CSE-ConnectionGUID: t4CqThRBQ3yfE9GMiS4XxA==
X-CSE-MsgGUID: Wg1QeO7BQ92iwgGqSfgJBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="61208474"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="61208474"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 14:34:58 -0700
X-CSE-ConnectionGUID: kxjdFltSTbezh+WrYTSOrQ==
X-CSE-MsgGUID: vGo4NATKTiaWQy4FEzd03A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="177418380"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 14:34:57 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/xe/gsc: Switch SW proxy allocation to uncached
Date: Wed, 21 May 2025 14:34:48 -0700
Message-ID: <20250521213448.3829840-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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

We're recently started to see a number of issues that seem to be caused
by memory coherency between the driver and the GSC FW when processing SW
proxy (xe#5002, xe#5047, xe#5071). These are sporadic and seem to only
happen on one particular CI machine, so I wan't able to repro locally
and fully root-cause the problem.
Given the memory coherency suspicion, as a first attempt to fix the
issue switch the allocation of the SW proxy object to uncached and
see if it is enough. Note that there is no performance concern in not
having this cached as the proxy flow is not heavily used outside of
driver init.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_gsc_proxy.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
index d0519cd6704a..302e43bb8681 100644
--- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
@@ -421,7 +421,8 @@ static int proxy_channel_alloc(struct xe_gsc *gsc)
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, GSC_PROXY_CHANNEL_SIZE,
 					  XE_BO_FLAG_SYSTEM |
-					  XE_BO_FLAG_GGTT);
+					  XE_BO_FLAG_GGTT |
+					  XE_BO_FLAG_NEEDS_UC);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
-- 
2.43.0

