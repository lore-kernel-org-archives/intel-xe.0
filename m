Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28142CD98ED
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 19:06:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDC4310F3CE;
	Thu, 18 Jun 2026 19:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VOgZJqlw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 875A010F3CE
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jun 2026 19:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781809563; x=1813345563;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YeiceiMi0G3i97+vDqDMtnS7c73aAo7E+Fa5ATrd0Yg=;
 b=VOgZJqlwj99EMPIpHsaActbw+Kq2lbR4Yk6YMz5iGQmOVVtKr5vqEcen
 412o93csQOvZRUvidXcXw8yoce8l4hmJRx10T3ojwfNoPdNTe4Tci8n0n
 NQ8kXpQN5T/oOgA0v7spz1XXrTQ1Qoc44B6W5xkN8GH7keFmi0YSBY3u1
 pbzIeXkZjXYhFfj0bZdnyzFNcgndyVP1VdLL0qewvvQ6O8RPsJkqB6l/p
 LLMRaVfPDEMhi7HK4QnFNHoqabUXnMiMlWNHgF1TFOo3/Txm8k3J28i28
 0SWOt3ZxJDcWeuNjUnNpnc9k5d1CcyXqSF45voWWPy/CEtBVTpKhij2BB A==;
X-CSE-ConnectionGUID: gIfbDcNQT561rRJcFA3HNQ==
X-CSE-MsgGUID: y4/4PRsqRxa9QpxOJqF5kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="82433035"
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="82433035"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 12:06:00 -0700
X-CSE-ConnectionGUID: HfqVTcG8TIyVbICUorWvBg==
X-CSE-MsgGUID: JWVZtVRZTgyL/QXRr+z4/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="248319698"
Received: from padamowi-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.18.63])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 12:05:57 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 3/3] drm/xe/kunit: Assert gt before assigning idm
Date: Thu, 18 Jun 2026 21:05:41 +0200
Message-ID: <20260618190542.593-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618190542.593-1-michal.wajdeczko@intel.com>
References: <20260618190542.593-1-michal.wajdeczko@intel.com>
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

While our fake xe_device will be always initialized with the GT0
and the xe_device_get_gt() will never return a NULL, add explicit
assert to emphasize that so we can safely continue to use the GuC
ID manager pointer.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
index ee30a1939eb0..aa7f9ddafa6f 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
@@ -11,9 +11,12 @@
 static int guc_id_mgr_test_init(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm;
+	struct xe_gt *gt;
 
 	xe_kunit_helper_xe_device_test_init(test);
-	idm = &xe_device_get_gt(test->priv, 0)->uc.guc.submission_state.idm;
+	gt = xe_device_get_gt(test->priv, 0);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
+	idm = &gt->uc.guc.submission_state.idm;
 
 	mutex_init(idm_mutex(idm));
 	test->priv = idm;
-- 
2.47.1

