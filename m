Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B4FEB64D8
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jun 2023 17:47:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A7D10E3CC;
	Tue, 13 Jun 2023 17:47:40 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8993E10E3CC
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jun 2023 17:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686678459; x=1718214459;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JMiYTz7h6Y1NvxaKLfYvhxGZQ87HJfv1+HBcxO3v8IE=;
 b=CYuvoQdE2YfHMSUeeu2msbBohvX2GxYu3b5ojm/34IqLyI9wU32/qWOf
 W9AXiQF7cZp1SBeUrzF0b6jaO20RZdTiK6EkEc3J4qWuALOUrmv2tTOiw
 pScr8apA8pmTvAf8pW1t6dSTxz/qoTPvx5dzbH1KCdS/kFSmUKrKEBLD/
 SSLhN1iTeF8LacNPTAiOmUfMw0Oyi2U6d6GikX7PvgWaZJG6QI388ZwDY
 qj8LE63gzfoIPGkyd/xrel8r79ew/rweKAmDk4hVHrTH8El3/1vykLz92
 OKgh9qgHEUZ0BeiZxJVJXZn/40hNS1rz6a3zZys4J+6/ue3bXUbsNZ6Cw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="386811418"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; d="scan'208";a="386811418"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 10:45:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="781770971"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; d="scan'208";a="781770971"
Received: from anushasr-simics.jf.intel.com ([10.165.21.205])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 10:45:50 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 13 Jun 2023 10:47:40 -0700
Message-Id: <20230613174740.786041-2-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230613174740.786041-1-anusha.srivatsa@intel.com>
References: <20230613174740.786041-1-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Add missing ADL entries to xe_test_wa
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

With the fake device creation fix in the previous patch,
adding Alderlake P platform in xe_wa_test.
With this, driver is able to run the kunit test for
ADLP properly.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_wa_test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
index 7a86be830b93..16f7f157c875 100644
--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
@@ -46,6 +46,9 @@ static const struct platform_test_case cases[] = {
 	PLATFORM_CASE(ALDERLAKE_S, B0),
 	PLATFORM_CASE(ALDERLAKE_S, C0),
 	PLATFORM_CASE(ALDERLAKE_S, D0),
+	PLATFORM_CASE(ALDERLAKE_P, A0),
+	PLATFORM_CASE(ALDERLAKE_P, B0),
+	PLATFORM_CASE(ALDERLAKE_P, C0),
 	SUBPLATFORM_CASE(DG2, G10, A0),
 	SUBPLATFORM_CASE(DG2, G10, A1),
 	SUBPLATFORM_CASE(DG2, G10, B0),
-- 
2.25.1

