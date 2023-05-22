Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F9CC77B7C
	for <intel-xe@archiver.kernel.org>; Mon, 22 May 2023 01:50:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D97510E240;
	Mon, 22 May 2023 01:50:47 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB3410E23D
 for <intel-xe@lists.freedesktop.org>; Mon, 22 May 2023 01:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684720232; x=1716256232;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1U5HfQzaOmx3gyH/iIqCCxJukxmm3M0AtdwHYNddKFI=;
 b=QVmSxpqMkRNy5Zi5hp/pLGY15GhKNv2n+uGtX0bnF3m55ELBtwxXXLyM
 MZdSYHJ1IEprCOtSm/wYjxQ8Q3a2eCob8Z5bq/7Vl7HCr/vZjYYc84gA/
 8aWT9cKQJ5pvtnjY8W9d6iqElBXB60a6V1WYE3lXAI9yOhYK/xXlw4RYq
 Q9zDJyvOG0aVvE1nEjDDvAAeX/7y+JSE9On8zahw4Wko8f/QXAj7JstiV
 FHWvLX0AapwhAiPZODVvGD2c7PbhYsgm5BkXmOpApg/o9Yh480Z8YhIOc
 O/mPiP/lPNOnsXryEtHjsZRleZkviAVdnovSyZc4X93VqwM2IZ1X+yslo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="381030420"
X-IronPort-AV: E=Sophos;i="6.00,183,1681196400"; d="scan'208";a="381030420"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2023 18:50:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="697471415"
X-IronPort-AV: E=Sophos;i="6.00,183,1681196400"; d="scan'208";a="697471415"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2023 18:50:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Sun, 21 May 2023 18:50:39 -0700
Message-Id: <20230522015040.3849776-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230522015040.3849776-1-matthew.brost@intel.com>
References: <20230522015040.3849776-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 7/8] drm/xe: Only try to lock external BOs in VM
 bind
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
index a0306526b269..0398da1ef1e2 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2089,9 +2089,11 @@ static int vm_bind_ioctl(struct xe_vm *vm, struct xe_vma *vma,
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

