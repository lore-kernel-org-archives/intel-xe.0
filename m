Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1E1CD37A9
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 19:47:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6794510E678;
	Fri, 15 Sep 2023 19:47:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E8E10E67E
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Sep 2023 19:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694807247; x=1726343247;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WIVPkWMcCgGcU/3bFbMTvR8o0/pSWTiRubciARoaOqA=;
 b=Qg4XwDnhfK22bk35VEb3bUebDe2FxHofoVDUs1VfTVnlDtHqzdqxRK0O
 x6h+7rz2Hqj0GBXChYEgtXnVmZREw/hzpP2TsP42c9nVHYEpFcUIUw4Z1
 UMohlOya3CdOgEeccNA9SY7UAoGY4MqA2FrxEW8XwW6M3rmS+/tM0Sj7K
 5pXSmVPzzQ0URVx6OH+u4CY2pg5kYHsFoIGxfXw2/OvV+kltrHXAhFkfv
 1H09r6EAQrL9qBEbpkx41FtovvwjxgG+5inlxMMJvxpR2JLrqee1v1z62
 l5a1EhkDuNPhS8EK9MhJasbwKdjNdq/O75LjWdeJmLVRaw8mkE4+cJUwF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="382063330"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="382063330"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 12:47:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="888324556"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="888324556"
Received: from jmanzo-mobl.amr.corp.intel.com (HELO anushasr-mobl7.intel.com)
 ([10.209.15.212])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 12:46:50 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 15 Sep 2023 12:47:00 -0700
Message-Id: <20230915194700.184626-5-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915194700.184626-1-anusha.srivatsa@intel.com>
References: <20230915194700.184626-1-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/4] drm/xe: Add missing ADL entries to xe_test_wa
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

