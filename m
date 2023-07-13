Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417E2C0015E
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 09:41:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E807C10E151;
	Thu, 13 Jul 2023 09:41:51 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEEDF10E008
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 09:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689241308; x=1720777308;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ADxswOyXw5OorUkthXNBZzr8pPaK1yymfaHXQ7MH1zU=;
 b=ASHd2svfPPFEnX1XSwhZKjcqAoLlpeYTdN2K0fvG1jlfMrhsRAs3KhQc
 0O94ZwMKAVBF3LDAVpjM6PAiF9v06PikBLvkXCFBR28Qx7h84jwQBID7s
 RzRm32fF35Gmy7+Nil3+zZ/5EAmC8b3E4s2q4qnylWLPcjE1MHozGvSjs
 46TwoxOs2NAZ6MaT6SGUkqUkDHClowZpnZGHr1Dm47qtgkA5rG2tudEK6
 /p8/Y1l0so4+jzyYje0qujPgPIjAo7982DIBTc9QAr6gY8eQZ3JMu3Wja
 g4iFXwLbc1pplGnyGIMOcK7XjISpYIiqJhQRGdr09YNvxJY9blkh4X62W A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="431292986"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="431292986"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 02:41:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="751555744"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="751555744"
Received: from rossdevx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.133])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 02:41:47 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 13 Jul 2023 10:41:27 +0100
Message-ID: <20230713094125.326709-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713094125.326709-5-matthew.auld@intel.com>
References: <20230713094125.326709-5-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/4] drm/xe/selftests: hold rpm for
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The GPU job will keep the device awake, however assumption here is that
caller of xe_migrate_clear() is also holding mem_access.ref otherwise we
hit the asserts in xe_sa_bo_flush_write() prior to the job construction.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
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

