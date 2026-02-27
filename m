Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00F0FEFB6C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 16:00:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFCB110E1AD;
	Fri, 27 Feb 2026 16:00:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lk/dpV+Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F30410E1AD
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 16:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772208026; x=1803744026;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kZzgVBnOQD77cc7marMae7bYa5aqOoBWO6E0/TteGX8=;
 b=Lk/dpV+Zdy3irdgl8mt1emIXOkQ8SBmMB/co/QCpx4yuDpDeI5J3zqqh
 jvXjXxP5Cfe4io7UKa39RKfa+OT0Hlk3liEZ8GXxIouzdQxnCuhGuu+GM
 uac1DBcKIjVXu6PTO83D4h7r3RAHufp3VopfQYoNn5xaG+m7vX5WfSPmC
 h5LRDtM+C5M1SqDkM/G+TdKHpBOSa7ZXw/vg6H3bkkwpfwQx48r0p4qo8
 ptByL9gGBuUK5Yd7rxp73nkIRR4Jtj/+qfRp0380L7HaUW42uDi+B8Esa
 fT1oqWn9Hi9Uxi7ORMyRbhZmGZtmIKtBzMzvCGJEcpSqWPaQhZDRqvDjP w==;
X-CSE-ConnectionGUID: 4ydPAsjTSV2l//wVgRAqhA==
X-CSE-MsgGUID: DTE4zK60SzemopZTWwDs5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="72995964"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="72995964"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 08:00:25 -0800
X-CSE-ConnectionGUID: loQyHyVxQu2aSgx6ap4nzg==
X-CSE-MsgGUID: /2DyUE8lQCuCTrZdN9vfdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="221557942"
Received: from pdaniel-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.19.11])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 08:00:22 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Nathan Chancellor <nathan@kernel.org>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH] drm/xe/tests: Change TEST_VRAM to work with 32-bit
 resource_size_t
Date: Fri, 27 Feb 2026 17:00:10 +0100
Message-ID: <20260227160010.12425-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

We've picked the value of TEST_VRAM to match real VRAM size as found
on the machines used by the CI, but that didn't work well on kernels
that have 32-bit resource_size_t. Use smaller value instead.

Reported-by: Nathan Chancellor <nathan@kernel.org>
Closes: https://lore.kernel.org/intel-xe/20260227011639.GA1683727@ax162/
Fixes: cbe29da6f7c0 ("drm/xe/tests: Add KUnit tests for new VRAM fair provisioning")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
index 305dbd4e5d1a..efa8963ec248 100644
--- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
@@ -11,7 +11,7 @@
 #include "xe_pci_test.h"
 
 #define TEST_MAX_VFS	63
-#define TEST_VRAM	0x37a800000ull
+#define TEST_VRAM	0x7a800000ull	/* random size that works on 32-bit */
 
 static void pf_set_admin_mode(struct xe_device *xe, bool enable)
 {
-- 
2.47.1

