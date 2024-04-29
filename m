Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C145EC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 20:45:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C35810E967;
	Mon, 29 Apr 2024 20:45:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W9o4StLC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C6910E967
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 20:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714423520; x=1745959520;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aPTzgkqh13sWW4rHqhYSueCi6G7hFvMQ62TcG2EXJ0c=;
 b=W9o4StLCcODV/k2HgzUym8Y8Gv7NEU4L0AKkN9OW8ksSONNlHSJ19Clv
 r+Wzzg3knZEspAz6M2xCVlqn1X6p6PDzGNRdBYyK+R1A2GJ7Ma7ju0AjS
 +UjkKs75ETm498chJa/T78KcltvhNccZ2FTTTp9U+p4ulsFLhNmWznbvd
 Osw+FjD41hIWz6ECyr2v6ZTeQWZ1A4ldLDI84lM+qzA/a4eoMURt10q6W
 JZH0C4iM9o1CoK8Y4fJwNNGs5hGM8HTciyiyjsYpjy5qO6029F4MC46vU
 GfIQRw/6fUg/RlSQVUqmEi+ZGkvdunmM5ijyk7LK9oxLEAn4/zI5FBTAa A==;
X-CSE-ConnectionGUID: 2bMJ3W0jRgeZi1PNtiXwCw==
X-CSE-MsgGUID: zA33Zg69TOq5KYtazzLnVA==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="9952521"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="9952521"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 13:45:19 -0700
X-CSE-ConnectionGUID: HROx6k0CT1Ss86BTDDuepQ==
X-CSE-MsgGUID: 8Svll0reTxyNV3qGse9oLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208";a="30678856"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 13:45:18 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2] drm/xe: Remove uninitialized end var from
 xe_gt_tlb_invalidation_range()
Date: Mon, 29 Apr 2024 22:30:39 +0200
Message-ID: <20240429203039.26918-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

This fixes commit c4f18703629d ("drm/xe: Add
xe_gt_tlb_invalidation_range and convert PT layer to use this")
which added the end variable as part of the function param.

v2: Add fixes tag(Matt)

Fixes: c4f18703629d ("drm/xe: Add xe_gt_tlb_invalidation_range and
convert PT layer to use this")
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index d0ee1e0df0bd..c3d015a7ac33 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -305,7 +305,7 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
 	} else {
 		u64 orig_start = start;
 		u64 length = end - start;
-		u64 align, end;
+		u64 align;
 
 		if (length < SZ_4K)
 			length = SZ_4K;
-- 
2.42.0

