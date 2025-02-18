Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D69C02198
	for <intel-xe@archiver.kernel.org>; Tue, 18 Feb 2025 15:11:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4587D10E3B9;
	Tue, 18 Feb 2025 15:11:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fZ8KRwki";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E708F10E3B9
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Feb 2025 15:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739891462; x=1771427462;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RLBP9G9sGK9sF1k9EUy2Pro39IFsbjv86D1qwYJHvks=;
 b=fZ8KRwkiD3avVUkV8j/yeQOIc74ReripXVEwYX0jNGhbwuedyhxR7LY4
 FaQLu4L1GKN2RuwLYdl4RNdGRzB2i43OjQ9RBKhpza5opZzwCQ1YplSm8
 QUcy5gIdfFza9AX/zw2rfn3yHcRJU3XOfRHJU5m5LuZCmmpm2vA4M0We4
 Mg6F04pa8dGDZfCbBbFyje6+RmRvEKNf8sTgOE+89XHbteDK6+hx7Us+1
 dZDvU957BjN2Dpqut30FO1NgFZXFL1IGb6cHB1vDVdXqYTyA+wl+36yQL
 +32nmQnQW15qQaUB9cJJuWpAjHcqEzZmzoMwvkxtJ389hIBXPaLMW1QpM A==;
X-CSE-ConnectionGUID: qiyQcHTvQ++9nGIEFr8SfA==
X-CSE-MsgGUID: /MBH/lfETF6anGAp/AbufA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40302393"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="40302393"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 07:11:02 -0800
X-CSE-ConnectionGUID: 1jp+2xKcQg2AhzX94WubFA==
X-CSE-MsgGUID: bZF/ZS9gSeGaf8cXbM7UeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115310936"
Received: from msatwood-mobl.amr.corp.intel.com (HELO msatwood-mobl.intel.com)
 ([10.125.109.176])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 07:11:01 -0800
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com,
	Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH] drm/xe/kunit: Test WAs for PTL
Date: Tue, 18 Feb 2025 07:10:57 -0800
Message-ID: <20250218151057.50478-1-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.45.0
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

Add PTL to make sure the workarounds do not conflict. This matches the
machines with PTL for CI:

	PANTHERLAKE b0b0:0000 dgfx:0
		gfx:Xe2_LPG / Xe2_HPG / Xe3_LPG (30.00)
	  	media: Xe2_LPM / Xe2_HPM / Xe3_LPM (30.00)
		display:yes dma_m_s:46 tc:1, gscfi:0 cscfi:0
	Stepping = (G:A0, M:A0, B:**)

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_wa_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
index c96d1fe34151..416258c193f6 100644
--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
@@ -75,6 +75,7 @@ static const struct platform_test_case cases[] = {
 	GMDID_CASE(LUNARLAKE, 2004, A0, 2000, A0),
 	GMDID_CASE(LUNARLAKE, 2004, B0, 2000, A0),
 	GMDID_CASE(BATTLEMAGE, 2001, A0, 1301, A1),
+	GMDID_CASE(PANTHERLAKE, 3000, A0, 3000, A0),
 };
 
 static void platform_desc(const struct platform_test_case *t, char *desc)
-- 
2.45.0

