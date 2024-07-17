Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0405C3DA63
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 19:52:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B4910E3D7;
	Wed, 17 Jul 2024 19:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mtQ9IOvY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B8110E166
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 19:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721245934; x=1752781934;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CX6MjQFhFungHKEX12FR16ZnxTCed2Cbyg2IjG32WIE=;
 b=mtQ9IOvYnP5+QtbXdHb8Xu4/1nYX2vt/wCOs6UHu59tHxuHr4LsXJe1e
 VAXt4Y+N+guJ3pfWdjHwV4KJ01wAh9HYi+dwOgmqGDuixK74/zIxpadqe
 v23JmlGijgZKsaWTqBSRFnExn5lSS8MPuKbGKqOGBfU+zjuQkR+O2oYlM
 SPoYWxTIvhEHheh13eyF6pJzJB+JVPSkPbUgmhg/EDp+xo0zgSG+Z/cSM
 iRRQZjKyiySl76GDaI+XPk9OT+jQ4dNZwRMjRGH/fNJGg+yIFF9UU5Oz0
 5aahjlINZj23vlI7k9yDQnjH2owsZopg82SF/48crrBc8a32JusIKFFPu A==;
X-CSE-ConnectionGUID: VeiUYefeQKSS9btUoTp7cQ==
X-CSE-MsgGUID: fi+KnJR4Rj+Hdk0VsKkvng==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18472951"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="18472951"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 12:52:14 -0700
X-CSE-ConnectionGUID: 1s2NEWfpT/OW5z/VPedOVA==
X-CSE-MsgGUID: ya11w+RFQj+CSndNwDRYCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="54690484"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 12:52:13 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 7/7] drm/xe/tests: Skip xe_mocs live tests on VF device
Date: Wed, 17 Jul 2024 21:51:55 +0200
Message-Id: <20240717195155.442-8-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240717195155.442-1-michal.wajdeczko@intel.com>
References: <20240717195155.442-1-michal.wajdeczko@intel.com>
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

There is no point to run those tests on VFs devices as they can't
access any of the MOCS registers. Skip testing on the VF device.

  [ ] =================== xe_mocs (1 subtest) ====================
  [ ] ================ xe_live_mocs_kernel_kunit  ================
  [ ] [PASSED] 0000:4d:00.0
  [ ] [SKIPPED] 0000:4d:00.1
  [ ] ============ [PASSED] xe_live_mocs_kernel_kunit ============
  [ ] ===================== [PASSED] xe_mocs =====================

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_mocs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
index 19554019b255..79be73b4a02b 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
@@ -138,6 +138,9 @@ static void xe_live_mocs_kernel_kunit(struct kunit *test)
 {
 	struct xe_device *xe = test->priv;
 
+	if (IS_SRIOV_VF(xe))
+		kunit_skip(test, "this test is N/A for VF");
+
 	mocs_kernel_test_run_device(xe);
 }
 
@@ -180,6 +183,9 @@ static void xe_live_mocs_reset_kunit(struct kunit *test)
 {
 	struct xe_device *xe = test->priv;
 
+	if (IS_SRIOV_VF(xe))
+		kunit_skip(test, "this test is N/A for VF");
+
 	mocs_reset_test_run_device(xe);
 }
 
-- 
2.43.0

