Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E5CEB64D7
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jun 2023 18:28:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A447210E3DB;
	Tue, 13 Jun 2023 18:28:43 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3241210E3DC
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jun 2023 18:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686680921; x=1718216921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qpsv8T180TychbtCYxP9v0bzT8R7Ubl8nifvpvnPlDE=;
 b=MxGce9i+e43tfMuBBNITlqoRsCfX7dlb3WBKaKBn4g7AjpCjod27nB99
 D6qrjWahjRWf0DJXG1T/ZrRf2vo6AQ/lu0QgSvbD01FFAAC9B9kLrkvFU
 lFmTTLkwnnd4LSx8CEXtY7HZT5ebQXDFhWB1Sg4G94Izs+RDKRwaPPCPn
 ojYoglDBo4C+H/UibJUB0oq1ZOVsNrsTA8afOAQP2Rnt3KibqDjDb6r8F
 vwR6VfKEfW1a6pkHL5mew/peicc0LdA4q/wNHhWKvNiG2afjOuVRMchuH
 7s+mGPlL4jHH38JFAa2qlsD+P9ARe+rCnkUSPzN8kbfNr5NVrbDPV+DxU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="358422540"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; d="scan'208";a="358422540"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 11:28:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="689118910"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; d="scan'208";a="689118910"
Received: from anushasr-simics.jf.intel.com ([10.165.21.205])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 11:28:40 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 13 Jun 2023 11:30:47 -0700
Message-Id: <20230613183047.787756-2-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230613183047.787756-1-anusha.srivatsa@intel.com>
References: <20230613183047.787756-1-anusha.srivatsa@intel.com>
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

With the fake device creation fixed,
add Alderlake P platform in xe_wa_test.
With this, driver is able to run the kunit test for
ADLP properly.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
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

