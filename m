Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CDFDC7EE23
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 17:11:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14D2B10E086;
	Fri, 26 May 2023 17:11:10 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0490D10E1DB
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 17:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685121054; x=1716657054;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SRbrPSvKwvZzou+DyCv9Hs0jameX773Ls0/PGEnUY4I=;
 b=LgP8OmSe5rC+1EXwvQgH4kpGCC8qFO61yTNvE7q96PA8tL7vzG+WHhqC
 Ky1H0qxqqlpjxlZn9iEV8+WWe96JfPsDXDBoGJgTncaxXVzlVkHx01Run
 uuAasUc+hjxxv/mkXLJwXLA6vYJEro1D0O51uQOzxrRrIdCNZqYzA/fFR
 5qrYwOE2bnA6JyChxvvBuZ6WNNZuqCYqo4xHGRyg7q2Pwef2awhe0ttAp
 UyZ+ja8Bccmp5z89TwEn9DzHpz67fd+kiv12rVDf58Lf03FcxznYyAhSZ
 D4TjbzX2mLQP2p64FuA0+7QdyMDkzukefeuMwtqOk2hGGGmCH/RvWTGi8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="353094997"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="353094997"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 10:10:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="879603466"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="879603466"
Received: from anushasr-simics.jf.intel.com ([10.165.21.205])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 10:10:44 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 26 May 2023 10:12:04 -0700
Message-Id: <20230526171204.2754550-7-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230526171204.2754550-1-anusha.srivatsa@intel.com>
References: <20230526171204.2754550-1-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 6/6] drm/xe/rpl: Add missing RPLP and RPLS entry
 in xe_wa_test
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
 drivers/gpu/drm/xe/tests/xe_wa_test.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
index 16f7f157c875..f86fa0f2ce10 100644
--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
@@ -58,6 +58,8 @@ static const struct platform_test_case cases[] = {
 	SUBPLATFORM_CASE(DG2, G11, B1),
 	SUBPLATFORM_CASE(DG2, G12, A0),
 	SUBPLATFORM_CASE(DG2, G12, A1),
+	SUBPLATFORM_CASE(ALDERLAKE_P, RPLU, E0),
+	SUBPLATFORM_CASE(ALDERLAKE_S, RPLS, D0),
 	PLATFORM_CASE(PVC, B0),
 	PLATFORM_CASE(PVC, B1),
 	PLATFORM_CASE(PVC, C0),
-- 
2.25.1

