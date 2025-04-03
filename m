Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84C3C3601B
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 09:42:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8771210E97D;
	Thu,  3 Apr 2025 09:42:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MQBF75mv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E196510E97D
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 09:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743673320; x=1775209320;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2qPXmgruKGpfPz+xFN6k7KPtAmQEHYqKDv9Zj72Yn7Y=;
 b=MQBF75mvIW3rfelF2Xd6G6rulEPOwOpIg+7PLeraQ3vU23rywDBBZ/9M
 qTypVT4TlkuyLkKIAFA+1EvjNQGqowiN5x748ljc38XCmpf3pqQ16fx2a
 dXHPH0VosRWLySrud2LdFPZkEbxaQMDBOr3HRe+FORu7hm7NECGvavpXm
 5tir8QB9j/B4txEwpScD1eEumtPT2f9Dfdyhf52aweG7nS4mtiAf1DwyU
 iwwHNeYrQqFML8Rpi2XOsfOfGoHbIs6T2IoF80CRAaEzln4Qltndw1XxQ
 zg58aoVnbBwwGD+hP1MkwMnvnd81SQAjfbXWzXpayPqeC0QGleLTWl2xZ Q==;
X-CSE-ConnectionGUID: gxtjSBM4QM64UD0XebGrxg==
X-CSE-MsgGUID: ISBELW9JTxSz7CrWRh800Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44955485"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="44955485"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 02:41:59 -0700
X-CSE-ConnectionGUID: 00m19jdKQiqKFSuXnnJzHw==
X-CSE-MsgGUID: FL6G6AyKRSSf4izW+VXK2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="131938095"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 02:41:59 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com,
	lukasz.laguna@intel.com
Subject: [PATCH 1/2] drm/xe/vf: Don't support changing GuC reset policy
Date: Thu,  3 Apr 2025 11:41:40 +0200
Message-Id: <20250403094141.25941-2-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250403094141.25941-1-lukasz.laguna@intel.com>
References: <20250403094141.25941-1-lukasz.laguna@intel.com>
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

VF can't change GuC reset policy. Ensure the driver does not attempt to
do so by adding an assertion.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index bee4e0cfe7b8..2ea07d28728e 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -990,6 +990,8 @@ int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
 	struct xe_bo *bo;
 	int ret = 0;
 
+	xe_gt_assert(gt, !IS_SRIOV_VF(gt_to_xe(gt)));
+
 	policies = kmalloc(sizeof(*policies), GFP_KERNEL);
 	if (!policies)
 		return -ENOMEM;
-- 
2.40.0

