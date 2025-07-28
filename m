Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F3AC83F26
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 08:16:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FDDB10E49A;
	Mon, 28 Jul 2025 08:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="htl9ANPm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F9010E49E
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 08:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753690604; x=1785226604;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FQHSlBE//at9L7lTNf8lCEPaG5hBVee1UwMRLkiwnyE=;
 b=htl9ANPmNaZzF+ZnrbWzTtSyCTOJhMCsoernaJ1Vt7W2ypZ8PU9XIeAC
 1LLT7o0lETApcRrfcjmMMptIUqp2pT2iuj5lEwZmXZIrFD8ljyCEsrchS
 CZ7JZC+R+mGqgYkZOuEoVZUf8pgckjcgVu7gcKgQ8yTtAjduHv63opjOb
 gBV5zt1Uit5LQHoizsJHHyY53G9bG7T3APbFHlMx3w19QtG2lIytVBIKL
 Q5kpJZKRdGiAlJDHPiS1xKxicQ2b2cY61+TvQufZEEDPFnMlY9E3tCR+w
 KOivijuPgcSbbZXUrK7cRaI8znbehDM7H6CMQv92ikoOoZv7k3CdWPGci Q==;
X-CSE-ConnectionGUID: v5Izk0iYQsil6nQCkh1zFw==
X-CSE-MsgGUID: 6caWvLfERyeyMTD2my7Kuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55630602"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55630602"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 01:16:44 -0700
X-CSE-ConnectionGUID: 9ZDByhHASgq2coNZkq5q1g==
X-CSE-MsgGUID: a7xdmYx/Q1+w/mIobFPW7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="166829016"
Received: from nakshtra-system-product-name.iind.intel.com ([10.190.238.69])
 by orviesa004.jf.intel.com with ESMTP; 28 Jul 2025 01:16:43 -0700
From: nakshtra.goyal@intel.com
To: intel-xe@lists.freedesktop.org
Cc: dwarakanath.ramadeva@intel.com
Subject: [PATCH] drm/xe/xe_pat: Adding the graphics version for BMG-G31
Date: Mon, 28 Jul 2025 13:46:41 +0530
Message-Id: <20250728081641.1178859-1-nakshtra.goyal@intel.com>
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

Adding the corresponding graphics version for bmg_g31 i.e 20.02
Bspec 68090

Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 2e7cb99ae87a..a0872f84dc29 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -385,7 +385,7 @@ void xe_pat_init_early(struct xe_device *xe)
 			xe->pat.pat_pta = &xe2_pat_pta;
 
 		/* Wa_16023588340. XXX: Should use XE_WA */
-		if (GRAPHICS_VERx100(xe) == 2001)
+		if (GRAPHICS_VERx100(xe) == 2001 || GRAPHICS_VERx100(xe) == 2002)
 			xe->pat.n_entries = 28; /* Disable CLOS3 */
 		else
 			xe->pat.n_entries = ARRAY_SIZE(xe2_pat_table);
-- 
2.34.1

