Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB9FC77B75
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 14:48:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6A310E34C;
	Tue, 16 May 2023 14:48:00 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02DD210E354
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 14:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684248479; x=1715784479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3lWxvD5+7IlbF35zRg65ygNWwnyBtg1a6T70NzAQ8qw=;
 b=caX+kbG8wqYrg5U79Ob+3zHGpU6D0HHxNmcl1BmvLetDQlvfFAXhJLdE
 NOTQB67mtL1mMoUw2zc05uL5MeUby6K2ZecjYle5WoO1sPC+NooNQHwr2
 ASykVF2ynLjq8Di7QxmMZkJJ8/cXNn3Ez5yD1ut+wIJASuUeuGlPf0pT3
 2j7BE8BhRHFG5Sb6T9Sc29aFo/yL1fbyGyqCnQiYxMvr0aHMVwI0ewLKx
 deEkCkZwVtHqMro2QZk5P7MxRlvbFLszuuMFj5MR81ztsGaIYWEt/U0mb
 abhdp1bDQCsgQgxJ8Px2Q4YGNjpaG5GJdGQwKjNHd/Vs0x4Yd2sEhLmvB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="340865906"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="340865906"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 07:47:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="1031315122"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="1031315122"
Received: from aboreiko-mobl3.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.22])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 07:47:56 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 16 May 2023 16:47:30 +0200
Message-Id: <20230516144730.38898-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516144730.38898-1-thomas.hellstrom@linux.intel.com>
References: <20230516144730.38898-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 2/2] fixup! drm/xe: Introduce a new DRM driver
 for Intel GPUs
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

drm/xe: Properly remove the vma from the vm::notifer::rebind_list when destroyed

If a vma was destroyed with the bo evicted, it might happen that we forget
to remove it from the notifer::rebind_list. Fix to make sure that really
happens.

v2:
- Remove an unnecessarily verbose comment how to avoid taking a lock.
(Matthew Brost)

Cc: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 5f93d78c2e58..2aa5bf9cfee1 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -978,6 +978,9 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 	} else {
 		xe_bo_assert_held(vma->bo);
 		list_del(&vma->bo_link);
+		spin_lock(&vm->notifier.list_lock);
+		list_del(&vma->notifier.rebind_link);
+		spin_unlock(&vm->notifier.list_lock);
 		if (!vma->bo->vm)
 			vm_remove_extobj(vma);
 	}
-- 
2.39.2

