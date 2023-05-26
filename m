Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49932C7EE2C
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 17:10:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D10710E1DF;
	Fri, 26 May 2023 17:10:59 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F5A10E1DD
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 17:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685121053; x=1716657053;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=imR2uznb4U2YhxAtividth0++dmQYcXL2hcUbE6PV5U=;
 b=DZTEnYqm36m29b95dJ9uDVYvOvffse1AuClyXYhjJNTnClIR8AhkHnFf
 lDiVXXVx6hmaao1ZIGHLGQdPhU2yAgtVQaKLbJIsgjfE03D80dZ34LHuR
 hWCF2w+EDXpRiYTdaOORNNKG1EEbhq9EviV62poMI1qG763LCVQe2VoTa
 rZ5BPs03xYr8ev60gwwDBa+8JHtSMXQsP6L9keKGqg53jn4NCzeyGuJsm
 iIs8JkUbfCjxbAH5JZuGxgTxi39uD8nZ0hv+24yFsZnWFjkN39DMHj91V
 BClpXEKA7B609wx00T5kxh+yMtIsMi7JgQLR9IpCKZzdXsYvkg9ZOHvTS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="353094991"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="353094991"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 10:10:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="879603450"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="879603450"
Received: from anushasr-simics.jf.intel.com ([10.165.21.205])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 10:10:42 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 26 May 2023 10:12:01 -0700
Message-Id: <20230526171204.2754550-4-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230526171204.2754550-1-anusha.srivatsa@intel.com>
References: <20230526171204.2754550-1-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/6] drm/xe/adlp: Add missing ADL-P entry in
 xw_test_wa
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

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

