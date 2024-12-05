Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDACE77170
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 18:27:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF5D010EF68;
	Thu,  5 Dec 2024 18:27:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AUPuA33S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2F510EF68
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Dec 2024 18:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733423246; x=1764959246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xthot4pB+grDe/eZqqqIDNXZ1fpmo6oFA16lobFDblg=;
 b=AUPuA33SGD95aEJ+u516G6SQT4ArGNVNZfirAs4NSBbc+fw63UbzJxk/
 PoprzSpBd9ROOlExmaZ2+cTvpuAVzU+J9Se7XtBsqMwdj6UHoDvldca2v
 TsnirK2sxMCE3qEhyGiPMiiDSe9iXX0DYuY2JCUykb9FxXGt1pwqh7sWF
 tJTkCTVFCXnoq2kazZRKkdXDmy0Sl67qYFR3Jp01+Sa1MTF3y+QCKCeRh
 JBQetdt8ooPmJYCq41GEfQueMLhZ23M7xtkgnoxvrB9N2g1Z0MqTcFMzh
 ZKEvTImdWC9A8vJ3/7vxaWB91wt/dq2kwiBtutkI2hpg8p1wF7FmrPaWy w==;
X-CSE-ConnectionGUID: aIREXoxAQ7+2by8VK6lpTg==
X-CSE-MsgGUID: 4HUBQSOfTT+kl0H/F7IqqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="45134297"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="45134297"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 10:27:25 -0800
X-CSE-ConnectionGUID: jBOPBAJfTAemWeZ0rgASwQ==
X-CSE-MsgGUID: g0NjET2eTPudbW1eEH3nGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="94618182"
Received: from tmistat-dev.igk.intel.com ([10.211.135.226])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 10:27:23 -0800
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Michal Winiarski <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 1/2] drm/xe/vf: Don't check has flat ccs in bios on VF
Date: Thu,  5 Dec 2024 18:18:13 +0000
Message-Id: <20241205181814.1484975-2-jakub1.kolakowski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241205181814.1484975-1-jakub1.kolakowski@intel.com>
References: <20241205181814.1484975-1-jakub1.kolakowski@intel.com>
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

Don't check for flat ccs from VF-level as VF does not have direct
access to the register.

Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Suggested-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michal Winiarski <michal.winiarski@intel.com>
Cc: Narasimha C V <narasimha.c.v@intel.com>
Cc: Piotr Piorkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 930bb2750e2e..5d827b07cf02 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -600,7 +600,7 @@ static int probe_has_flat_ccs(struct xe_device *xe)
 	u32 reg;
 
 	/* Always enabled/disabled, no runtime check to do */
-	if (GRAPHICS_VER(xe) < 20 || !xe->info.has_flat_ccs)
+	if (GRAPHICS_VER(xe) < 20 || !xe->info.has_flat_ccs || IS_SRIOV_VF(xe))
 		return 0;
 
 	gt = xe_root_mmio_gt(xe);
-- 
2.25.1

