Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F159C3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 21:40:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5400210E638;
	Tue, 16 Jul 2024 21:40:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="feLhqIgW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE87410E8E7
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 21:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721166004; x=1752702004;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ndSqTIsMaasiWIPty3c4mOGiCCcb0cLmH6MLZfsO6yA=;
 b=feLhqIgWNB8YWAMdqAhq72YK/W8+Q7TwEimLJUvNMGdYLgugtqLJb8sq
 NtaebTGM0kmoaEtjHlaBVkKrFw3QKI/7s5oyEIacmY33N3yMs6oMz07XN
 cfCbiVjF5NXzycjljkMIehuiCMg2kLjfus/+5r6XlqSgDOr96L3Y1t9cA
 34EzFlrLK91Lt3qBPSsxOGqpETAvUIpoT3kpFYIgl75HOsrNK0TvCPGFT
 O+aEFkoZHIhQ10LnF/3ltBdFNGti64TjZEZnOZXte6t+tJhjMQgFjC/JO
 vTrLcDwgJ9HiqX9hC1dgqpe4A/GQqfpDO22H4laoWSGiNRgFtyMkBO/sB w==;
X-CSE-ConnectionGUID: M0mGXimiTAWdSJzn8LtTUw==
X-CSE-MsgGUID: TZpNnQAOR7G0gh6FIiUgHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="44063157"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="44063157"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 14:40:04 -0700
X-CSE-ConnectionGUID: 1ekbzlezQjqhRh0qo4chNw==
X-CSE-MsgGUID: 9dBaVhSbSeqhDnovdFn2iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="73364456"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.36.158])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 14:40:03 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 7/7] drm/xe/tests: Skip xe_mocs live tests on VF device
Date: Tue, 16 Jul 2024 23:39:01 +0200
Message-Id: <20240716213901.398-8-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240716213901.398-1-michal.wajdeczko@intel.com>
References: <20240716213901.398-1-michal.wajdeczko@intel.com>
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
index 7842471859dc..6a73d5d3c611 100644
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

