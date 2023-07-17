Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC14C0015E
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jul 2023 13:32:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC99010E256;
	Mon, 17 Jul 2023 13:32:18 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49F3210E256
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jul 2023 13:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689600737; x=1721136737;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q5r1M/6CVN3hsN7roa+TQ0OOdN0ylLYJG+yyiHSxueI=;
 b=ku5kcB9R57rbcSDraSVkWYdrDYB4oWw9tTp4ud9gh2eFNexAYrqt5nvM
 gup8PBP3jLiDup9InOhshO8IaI6sDUVxSHK5482c4A+Ii6aTuaaXWf+bZ
 GYlPtUwSTg5fv0PP3kIGGi4iiXAkfunOzqePmpB9JvoOS+w8XPG8GrIfb
 uQGa+sxaGtD2PISEHN0Ceuv4Tb/NIgRg2qDwMuc3qzA/SHXFIwMtgRvrc
 zVJYWre+5Q4+jrHXQz7ELnX1mrisIB7GLobjXsrk3eCR5DapnvkVcB/HN
 YtWleWTf6wONMNb5uK9zCVKMP4Tr+WDB2OwLEYTVoJzGhA8MdcU5sWQSI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="355867842"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="355867842"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 06:32:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="836881081"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="836881081"
Received: from kprutko-mobl3.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.13.224])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 06:32:15 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 17 Jul 2023 14:32:02 +0100
Message-ID: <20230717133159.47980-8-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230717133159.47980-6-matthew.auld@intel.com>
References: <20230717133159.47980-6-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/4] drm/xe/selftests: hold rpm for
 ccs_test_migrate()
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
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The GPU job will keep the device awake, however assumption here is that
caller of xe_migrate_clear() is also holding mem_access.ref otherwise we
hit the asserts in xe_sa_bo_flush_write() prior to the job construction.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index edee4116c59d..6aad1443b00e 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -158,9 +158,15 @@ static int ccs_test_run_device(struct xe_device *xe)
 		return 0;
 	}
 
+	xe_pm_runtime_get(xe); /* FIXME: remove once mem_access actually works */
+	xe_device_mem_access_get(xe);
+
 	for_each_gt(gt, xe, id)
 		ccs_test_run_gt(xe, gt, test);
 
+	xe_device_mem_access_put(xe);
+	xe_pm_runtime_put(xe);
+
 	return 0;
 }
 
-- 
2.41.0

