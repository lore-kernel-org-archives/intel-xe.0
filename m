Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFF2C28B28
	for <intel-xe@archiver.kernel.org>; Wed, 12 Mar 2025 17:31:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F9210E079;
	Wed, 12 Mar 2025 17:31:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n1Q2G/3H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96AC210E079
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Mar 2025 17:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741800686; x=1773336686;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=k/p3zZQeqqbNPHq5STtfu31il6TIPtkiauocEt6Qz2c=;
 b=n1Q2G/3HJY1nhVykjgEepp3NUu+/GNCZY0JZKwW1oesIOfV2Cm6lbJ4D
 yRTbXGDIyLs8tPM03awy1BOaWbAAhPd+WhoNxdjOpgRWEWG5EvRK4jEpR
 BsUfMFXVxbrkrMUS1I55vCiN27UxoRPej1JVVG8AG7JrmWN4Y5qWsKW3S
 3mW2elPzehUSpMpatH5upNo2PfmNlvZZMFq5vxKuwo1G8kBCVG8ahD7nO
 bEjMl9X3seHcIWfNAmycmkFkA21I3ozxn6NDaJ/fNAho2zhN43HWCH9vB
 dr/BYdWpX4RmSCAwAGdaZrbeBA7+7qj0XTJOvYX2OA82vF1N4CsIn1kPo Q==;
X-CSE-ConnectionGUID: LpWEGXB4SEGT+6s3/0l4wA==
X-CSE-MsgGUID: ZyOiOggsRIGqB9w+zBxltw==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="53886061"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="53886061"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 10:31:25 -0700
X-CSE-ConnectionGUID: DNV4nQxnScSdKe24LgryXA==
X-CSE-MsgGUID: WtetWNNJRtaxem/1HhGlPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="121615743"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 10:31:26 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH 1/1] drm/xe/eustall: Fix a possible pointer dereference after
 free
Date: Wed, 12 Mar 2025 10:31:20 -0700
Message-ID: <eae49a414a7314921108e0388810aaee6261ad92.1741800396.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.48.1
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

If devm_add_action_or_reset() isn't successful, xe_eu_stall_fini()
is invoked. So, unsuccessful return from devm_add_action_or_reset()
shouldn't dereference gt->eu_stall as xe_eu_stall_fini() already
frees it. Fix this issue.

Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/xe_eu_stall.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index 88a92baf5c95..f2bb9168967c 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -222,13 +222,7 @@ int xe_eu_stall_init(struct xe_gt *gt)
 		goto exit_free;
 	}
 
-	ret = devm_add_action_or_reset(xe->drm.dev, xe_eu_stall_fini, gt);
-	if (ret)
-		goto exit_destroy;
-
-	return 0;
-exit_destroy:
-	destroy_workqueue(gt->eu_stall->buf_ptr_poll_wq);
+	return devm_add_action_or_reset(xe->drm.dev, xe_eu_stall_fini, gt);
 exit_free:
 	mutex_destroy(&gt->eu_stall->stream_lock);
 	kfree(gt->eu_stall);
-- 
2.48.1

