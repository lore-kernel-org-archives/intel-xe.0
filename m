Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4897AC7EE25
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jun 2023 18:26:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DBE410E6DD;
	Fri,  9 Jun 2023 18:26:25 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6CB410E0B6
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jun 2023 18:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686335182; x=1717871182;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ya7R9aAvhmRGXgpIk5aGgh0qfhxFQZq+zZ172VEt6Rs=;
 b=Z4Ydm+svX/uhBITD0cDeX9Hirfd1cV9SCokiOrP9gWywAaveDiYfXzHo
 lp6yGEv4uYjITPga/LlPVbrzqtKxdWJkNfORWZSKkkenXbvgrMHsHaHXq
 SRX3W26Zba61DfUlhVAIHMRbctNkMetGzmDBeO8ykU7Zhfzuuaj2bMA3Z
 1ijLDifVFc3U36fIBd7kPcdxZqskgAXOm5jPrrSNl0Pxm/9Iidg8iXOIg
 DKHUHKG2012UFrL1Kor80PYBz1bwpjByMriC92xXyX7VqQ2LdZOLi+ook
 oqhY0KdqJjWbq9hP1CskvPfpWKMvi+MnYCrcTxRSI2F8+YzWSTP6BXPGA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="361019678"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; d="scan'208";a="361019678"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 11:26:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="800305003"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; d="scan'208";a="800305003"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 11:26:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri,  9 Jun 2023 11:26:25 -0700
Message-Id: <20230609182627.143150-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609182627.143150-1-matthew.brost@intel.com>
References: <20230609182627.143150-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/3] drm/xe: Handle unmapped userptr in analyze VM
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

A corner exists where a userptr may have no mapping when analyze VM is
called, handle this case.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d1c380ad7f6b..e4311c48cc54 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3453,9 +3453,13 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
 		if (is_userptr) {
 			struct xe_res_cursor cur;
 
-			xe_res_first_sg(vma->userptr.sg, 0, XE_PAGE_SIZE,
-					&cur);
-			addr = xe_res_dma(&cur);
+			if (vma->userptr.sg) {
+				xe_res_first_sg(vma->userptr.sg, 0, XE_PAGE_SIZE,
+						&cur);
+				addr = xe_res_dma(&cur);
+			} else {
+				addr = 0;
+			}
 		} else {
 			addr = __xe_bo_addr(vma->bo, 0, XE_PAGE_SIZE, &is_vram);
 		}
-- 
2.34.1

