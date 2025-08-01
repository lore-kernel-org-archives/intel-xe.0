Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0457BC87FD2
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 18:14:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C40FD10E8E9;
	Fri,  1 Aug 2025 18:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C8PliuOn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FAE410E8E8
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 18:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754072048; x=1785608048;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qADf4n6GLuVPKX1bhZD5QiypjFKIieN1c77N316Jr/k=;
 b=C8PliuOntTimrdK3i4vNa5CMHqbbFW+LXoV/jQI+WeGozKOP0dH4Zd/U
 SqEgzpgRXimeCrubNQ6dwmY8+Lyaf9fcXGLIkLdo2piJ8bXZTrlcTjAu7
 3DNEWwcmjimuzHznKltG2BV1tNaQz/rmbCj6O70eW4smew5b1Z5go1s8E
 co7xsOoV9mJe12JDwnfW5cup7Glm4zvdJ9QAIi35coDSqVutJgKGte1c3
 q5N5pnx6IHYLa8vD5sKu0CUWqsj/1w6SRwS52/do4nYaNq/JU2T6nipYx
 3gPKzBoD346HfG3wkYPDv7P/6fOx+m3K+e1FDNRtAAuRtSOX4oJ99JUrt g==;
X-CSE-ConnectionGUID: 0QlxjqxaQlqKmLHKqdvkkQ==
X-CSE-MsgGUID: NDnYS0YnRm2jLLK7/iraOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56315583"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="56315583"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 11:14:08 -0700
X-CSE-ConnectionGUID: GAuNpssHTzO++huSl/V5mg==
X-CSE-MsgGUID: tP3Qjzr1QiO0JqXhUcaccA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="163553825"
Received: from mkolod1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.39])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 11:14:07 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 6/6] drm/xe/kunit: Extend platform generator with PTL
Date: Fri,  1 Aug 2025 20:13:50 +0200
Message-ID: <20250801181350.180780-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250801181350.180780-1-michal.wajdeczko@intel.com>
References: <20250801181350.180780-1-michal.wajdeczko@intel.com>
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

Our list of typical platforms used to generate test device objects
does not contain any PANTHERLAKE. Add one.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index 90c55f72d687..f1c3ea015725 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -59,6 +59,7 @@ static const struct xe_pci_fake_data cases[] = {
 	GMDID_CASE(LUNARLAKE, 2004, A0, 2000, A0),
 	GMDID_CASE(LUNARLAKE, 2004, B0, 2000, A0),
 	GMDID_CASE(BATTLEMAGE, 2001, A0, 1301, A1),
+	GMDID_CASE(PANTHERLAKE, 3000, A0, 3000, A0),
 };
 
 KUNIT_ARRAY_PARAM(platform, cases, xe_pci_fake_data_desc);
-- 
2.47.1

