Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59FEEB64DA
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 17:32:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809B810E535;
	Thu, 15 Jun 2023 17:32:15 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D14210E52F
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 17:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686850331; x=1718386331;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UOfyXNoxiZjMbMS3qhtOdbtTZwDbleCAVYx5PnAhrA4=;
 b=TPoApS56O7V7wKIQJiuJeoxkt1nx85T2eUnZ4QTf3ibI15pHzaAp1FTt
 MDD7WFqsNy2daVyaeZ8S9iYwVCLkDwJ/3co9NjZKxYD5uV6qiLWWvlmrH
 4fKfpYHLTxYjQ4QslYxFcGYOc6wYFDLHzHXcGKKa0vZrOVmOf686uFkca
 jP75C05Mrifplpza8evxmypXbdgXFc7hh0GQ1VI+Wl4TPm0J+p6U95uME
 NUAVVGPh1pOd0YJxs54UXIc/c+BHavInK1QGoxm3ZrhJqTl/ggKBG6SkZ
 nOqhLyr0FVWD33PrGSRXWZA8SjtR07oiJN6jgbGsNBa5CNMqVTad/gyd8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="348695158"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="348695158"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 10:30:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="742321909"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="742321909"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 10:30:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 15 Jun 2023 10:30:13 -0700
Message-Id: <20230615173014.258703-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230615173014.258703-1-matthew.brost@intel.com>
References: <20230615173014.258703-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 7/8] drm/xe: Only try to lock external BOs in
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
index 56ed2cb75c8e..ecf61e7dcdc2 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2148,9 +2148,11 @@ static int vm_bind_ioctl(struct xe_vm *vm, struct xe_vma *vma,
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

