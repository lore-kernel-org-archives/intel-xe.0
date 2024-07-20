Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03709C3DA59
	for <intel-xe@archiver.kernel.org>; Sat, 20 Jul 2024 14:25:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B8B10E002;
	Sat, 20 Jul 2024 14:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CaPD8FxC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3EA10E267
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Jul 2024 14:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721485552; x=1753021552;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qhzz9rDwOH1lF6s+ebaAJEJv3sYFIIHw41WDWBRY17Q=;
 b=CaPD8FxCd+LeDlwAJpvaHa+TwopV/NzMLKB0Zu78eVbXrzJDiEuqz7/1
 5qWurb4wTv6Gz386UBeDk4rfCXJGndOlO99BwVSFbhgBfbKdH4tG375XE
 jDn9Mtp1KiXMeDplkrrKuJMSZkOKjeW8/k94CgklOIw1VuYb+R5GDV9/B
 LJrSa8rnCQPWxOLk/d6twt9xPI/Cg8glgl9q0Trl0GKShpKN8dpnkjCe8
 UoJCM66AwUsHZ81G33C5yP/Ij8/4ZDU8sD00WWn6ETGA8ca/Z50pJRE/+
 VjAKVz0XL9fnpk2UDheg/iMkGflh/IG8AkwsXTbTZ8fQNKSBMRFWw0vKj A==;
X-CSE-ConnectionGUID: 3fQsj+NpS927U96IqnOoog==
X-CSE-MsgGUID: d9yktJIwR0mWDrsIfhm7mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="41624497"
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; d="scan'208";a="41624497"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2024 07:25:52 -0700
X-CSE-ConnectionGUID: /uhwPKmPTgmikGvIjtLONQ==
X-CSE-MsgGUID: wbX0El6SRJal4kNaeKYKnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; d="scan'208";a="55948482"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.48.8])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2024 07:25:52 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 7/7] drm/xe/tests: Skip xe_mocs live tests on VF device
Date: Sat, 20 Jul 2024 16:25:28 +0200
Message-Id: <20240720142528.530-8-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240720142528.530-1-michal.wajdeczko@intel.com>
References: <20240720142528.530-1-michal.wajdeczko@intel.com>
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
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
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

