Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0946CC83005
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 16:05:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C8410E532;
	Wed,  7 Jun 2023 16:05:15 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACFD210E535
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 16:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686153909; x=1717689909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3W1PBsTh//DQTF7Ii2IMuuOadEmRU+UClrFQoBpS0hI=;
 b=WQhE5+ANn/xJItBM1tTmIvx+4TcsZC2YrHFZz08bCNZixoNvgdo26I6Q
 nx9Dsq4pGSzjhQ0I5M0/pFSbUgsH399TfvWbfIA0L+k3WXjmKmAdjAPNT
 A5fXxDAmYuljZLYf3MT7QWRSbLRatLcOy36BQtdnlapOelLLd7TNaAbLT
 Wqs0bQ3SY7aejSIm9y1ESNbBL1jqlNyMLwM+q2Kndjh26TjRyKlh2VxO8
 KeOCrK4seRpgfrXg1PsnVcHCePEImMA+0R+7CYXGxn5PGADk0Hg9rUPoB
 6n53/1OvWW4lMLkf1WCftnHvXNHPTC1QBd7nlmNzCuGJbkpujFN9OIvvT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="336660345"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; d="scan'208";a="336660345"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 09:03:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="822216357"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; d="scan'208";a="822216357"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 09:03:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed,  7 Jun 2023 09:03:33 -0700
Message-Id: <20230607160334.4111289-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230607160334.4111289-1-matthew.brost@intel.com>
References: <20230607160334.4111289-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 7/8] drm/xe: Only try to lock external BOs in
 VM bind
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We only need to try to lock a BO if it's external as non-external BOs
share the dma-resv with the already locked VM. Trying to lock
non-external BOs caused an issue (list corruption) in an uncoming patch
which adds bulk LRU move. Since this code isn't needed, remove it.

v2: New commit message, s/mattthew/matthew/

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d1c380ad7f6b..2780f350ed33 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2146,9 +2146,11 @@ static int vm_bind_ioctl(struct xe_vm *vm, struct xe_vma *vma,
 		 */
 		xe_bo_get(vbo);
 
-		tv_bo.bo = &vbo->ttm;
-		tv_bo.num_shared = 1;
-		list_add(&tv_bo.head, &objs);
+		if (!vbo->vm) {
+			tv_bo.bo = &vbo->ttm;
+			tv_bo.num_shared = 1;
+			list_add(&tv_bo.head, &objs);
+		}
 	}
 
 again:
-- 
2.34.1

