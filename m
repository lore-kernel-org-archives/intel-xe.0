Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB083E71D58
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 20:45:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555D210E715;
	Fri, 29 Sep 2023 20:45:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C03FE10E717
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 20:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696020325; x=1727556325;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WIVPkWMcCgGcU/3bFbMTvR8o0/pSWTiRubciARoaOqA=;
 b=cHUFnGS+tueS/qtr6NMeRLJnupevp2xLPUpAkGlk1e4xCRx0Y5/jgZsY
 SoA8GT5R5/hPvOS/fojckiHDskwAILGFs00Yniz3lzZqhAqE9xRaw/KM0
 jA2epgd9nBj0/0/k2s9CyZau/u5WAz3gzeuQjON/8euc0oPNoE19V55TK
 nXxlqfGNAl0ndQK+CXPGoFGunPTJW2GXNoYIPkLx5ehb4iBnvN0g52UgB
 IfnEbW8F206EOpTxEKly4eTAPMZzw3upxFkOmzQ0zhDVuTSrX6fSsqcyh
 LuWGOx3B5O55cKob/sHbcNRJhr3RAPawu8JuMDSeaCgsEVtkteEUoRdBA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="367427391"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="367427391"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 13:18:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="726691247"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="726691247"
Received: from anushasr-simics.jf.intel.com ([10.165.21.200])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 13:18:57 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 29 Sep 2023 13:16:59 -0700
Message-Id: <20230929201659.2840724-6-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230929201659.2840724-1-anusha.srivatsa@intel.com>
References: <20230929201659.2840724-1-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/5] drm/xe: Add missing ADL entries to xe_test_wa
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

With all ADl platforms and subplatforms added,
also add support to xe_wa_test kunit tests for checking
their WAs.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_wa_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
index 69c9ea1fa82b..6e1127b276ea 100644
--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
@@ -50,6 +50,7 @@ static const struct platform_test_case cases[] = {
 	PLATFORM_CASE(ALDERLAKE_P, B0),
 	PLATFORM_CASE(ALDERLAKE_P, C0),
 	SUBPLATFORM_CASE(ALDERLAKE_S, RPLS, D0),
+	SUBPLATFORM_CASE(ALDERLAKE_P, RPLU, E0),
 	SUBPLATFORM_CASE(DG2, G10, A0),
 	SUBPLATFORM_CASE(DG2, G10, A1),
 	SUBPLATFORM_CASE(DG2, G10, B0),
-- 
2.25.1

