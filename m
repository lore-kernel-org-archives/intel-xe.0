Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 289D1CD98F2
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 19:06:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9CEB10E36D;
	Thu, 18 Jun 2026 19:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gM/MYFui";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA2310E36D
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jun 2026 19:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781809560; x=1813345560;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bKIjqAgmudJt+oQzAuEdOJG+n0JT04RQZvEOvHXNldw=;
 b=gM/MYFuiJCU1jyJ6qednPrEcd/kWeo3hWQgpAa9pJQ+L4PZWTiyRbydd
 z0bwtDXWnig7/KfDsTYFtoRcGykjwe8txFQRnQcl0HyV88Wx2vRZm8qwD
 yns5MzxivCJMqh2q7JQku1NzupfqGkFx0LUS7rB9c0QtBss+Z73Pb6l/q
 3c0eodTHFmuIHT/OtV/b248GQGRHc184LcAd/qbiRdecWF0jlcgi5Euqp
 nSaE8Qiry2AoQPUFXkxr3c+iTkctJ/hJ+aeJgPoJv8pgbKrBh3IyZsUgL
 nFM4ArQ1vr/IuuxuOSX+Xyts9Cya6ArdKzQcj8gdmvrsoqlEDzYdgRv6I g==;
X-CSE-ConnectionGUID: BPFbuaShQqqA7Lj8rMBdxQ==
X-CSE-MsgGUID: LQZtex5UTp+sjL/gnqiXFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="82433033"
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="82433033"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 12:06:00 -0700
X-CSE-ConnectionGUID: Qsf4EN+JT0Gpv/FCuxYCwg==
X-CSE-MsgGUID: zpCHQhjATKaHQcOLbNc63Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="248319683"
Received: from padamowi-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.18.63])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 12:05:53 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/3] drm/xe/kunit: Assert ggtt and gt pointers before use
Date: Thu, 18 Jun 2026 21:05:39 +0200
Message-ID: <20260618190542.593-2-michal.wajdeczko@intel.com>
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

While our fake xe_device will be always initialized with the GGTT
and GT0 and the xe_device_get_gt() will never return a NULL, add
explicit asserts to emphasize that.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
index 51e1e04001ac..20686dbe6d13 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
@@ -54,12 +54,16 @@ static int guc_buf_test_init(struct kunit *test)
 	};
 	struct xe_ggtt *ggtt;
 	struct xe_guc *guc;
+	struct xe_gt *gt;
 
 	test->priv = &fake;
 	xe_kunit_helper_xe_device_test_init(test);
 
 	ggtt = xe_device_get_root_tile(test->priv)->mem.ggtt;
-	guc = &xe_device_get_gt(test->priv, 0)->uc.guc;
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ggtt);
+	gt = xe_device_get_gt(test->priv, 0);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
+	guc = &gt->uc.guc;
 
 	KUNIT_ASSERT_EQ(test, 0,
 			xe_ggtt_init_kunit(ggtt, DUT_GGTT_START,
-- 
2.47.1

