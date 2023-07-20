Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E08AEB64DC
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 15:55:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16BAB10E168;
	Thu, 20 Jul 2023 15:55:54 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1676410E168
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jul 2023 15:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689868553; x=1721404553;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eNbYpzAcCAWKwqh+EVGBJ4dIvAzf031ZhDOdLcy0Jvw=;
 b=a3hYMDx4T9rgMfGnBERk/tqfk1izIQaffRnV2aZ6omws5S4c47dl9wCg
 773Se6PyI2na2lqdGRsBq9aw/ooBZP0EtJoBU/R/Sa5NnOadJmtihw7XN
 QP+8JKflXdC7ub0+EP5mIdFCnApp2wtRSZA6eGMG+ouOeZgyARntAB7Em
 JNbV15jiBzeoiiae4Zi9ObHj+X4FEJekoqGUQwBpwiSTxzK6AOdqd0fif
 y3gPTWtbt4q+Ajfupl4jz0ZymR36JqUFQF2ilUEFu+Ejc5ES7w/8uMwar
 0iXz9fwmcVZQX+GMpPRShengnQ01HaYa4RfnVUXB3r5L3N/66qUYBpfX6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="347088638"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="347088638"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 08:55:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="754105477"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="754105477"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 08:55:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 20 Jul 2023 08:55:43 -0700
Message-Id: <20230720155546.199766-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230720155546.199766-1-matthew.brost@intel.com>
References: <20230720155546.199766-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 4/7] drm/xe: Replace list_del_init with
 list_del for userptr.invalidate_link cleanup
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

This list isn't used again, list_del is the proper call.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 3c7951e4afad..52278ec2ade1 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1065,7 +1065,7 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 		XE_WARN_ON(!(vma->gpuva.flags & XE_VMA_DESTROYED));
 
 		spin_lock(&vm->userptr.invalidated_lock);
-		list_del_init(&vma->userptr.invalidate_link);
+		list_del(&vma->userptr.invalidate_link);
 		spin_unlock(&vm->userptr.invalidated_lock);
 	} else if (!xe_vma_is_null(vma)) {
 		xe_bo_assert_held(xe_vma_bo(vma));
-- 
2.34.1

