Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F81E77188
	for <intel-xe@archiver.kernel.org>; Thu, 19 Dec 2024 01:09:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD7E510E164;
	Thu, 19 Dec 2024 01:09:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OiLlC6Xg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CDBC10E164
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Dec 2024 01:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734570595; x=1766106595;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5ycyKqHeEBbPy4y8NDmO1bVLF5tXv+ub/M2Eq7+k2YU=;
 b=OiLlC6Xg4yW6DVRaf9ScvkkUhstEI0/gWqFzaY5gSldtgY+L4XfOKB6F
 oV2W98JEqxdOeSOfp0j2BNGBG+LbHg1CXKubmT1jL1dejtSZ4VgDcczZO
 PT9QbbhhlmTSt9f6YaodbodeFPLcXMUASclK3YmEZJtTdSHGkIpa/L6rb
 07Bc0f6CRu/F3L1qWK4r2gH5dMuPb71q7oUY9uiwdg0v/IeHymsGa6UES
 mP1O9pJv0yCnt3++g6k3PzCQUGzebmllV4fsJMg/lBa/+5E7iym2KTzEa
 dso42VpYFNujkzRz47devMHjQYo8BMlp3CkBGD3wyRuALdjaR9Zz6gqF8 w==;
X-CSE-ConnectionGUID: /aAMhuPXQWWxv3gSwevxrA==
X-CSE-MsgGUID: 255LUB27RnCrIajmWE5gHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="38850434"
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; d="scan'208";a="38850434"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 17:09:55 -0800
X-CSE-ConnectionGUID: PNteiy+4Q/S0m5IDnnkAvw==
X-CSE-MsgGUID: F1j+1GzZTmqC7kTefoxDjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; d="scan'208";a="97928276"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 17:09:55 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Eero Tamminen <eero.t.tamminen@intel.com>
Subject: [PATCH] drm/xe/gsc: Make GSCCS disabling message less alarming
Date: Wed, 18 Dec 2024 17:09:24 -0800
Message-ID: <20241219010924.2466333-1-daniele.ceraolospurio@intel.com>
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

The GSCCS is only used to transport messages from the driver to the GSC
FW; therefore, we can disable it if we're not using the FW, which is
the case on both BMG and PTL. However, the current wording of the logged
message could be interpreted as a problem, so reword to make it clearer
it is not an error and lower it debug verbosity as users don't really
need to know about it.

Reported-by: Eero Tamminen <eero.t.tamminen@intel.com>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3866
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 4294aa600192..ac9c666a9652 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -775,7 +775,7 @@ static void check_gsc_availability(struct xe_gt *gt)
 		xe_mmio_write32(&gt->mmio, GUNIT_GSC_INTR_ENABLE, 0);
 		xe_mmio_write32(&gt->mmio, GUNIT_GSC_INTR_MASK, ~0);
 
-		drm_info(&xe->drm, "gsccs disabled due to lack of FW\n");
+		drm_dbg(&xe->drm, "GSC FW not used, disabling gsccs\n");
 	}
 }
 
-- 
2.43.0

