Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7B7C7EE24
	for <intel-xe@archiver.kernel.org>; Fri, 12 May 2023 07:53:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 771AD10E620;
	Fri, 12 May 2023 07:53:35 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF4810E620
 for <intel-xe@lists.freedesktop.org>; Fri, 12 May 2023 07:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683878014; x=1715414014;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ypuO8L2r8k4RFFF36z3wbStTvE3wb4rTw95hItvT17k=;
 b=ZBYm4Ld1pKOd1pg2fRxNiRbGq7IstXy/mhNmoV3ioTWH26WWMb7e//7Z
 FCj+a4QEC/4R7Kirr3f+HljwsM7gGZSonilZ83nmFWweWEXD+TQqomDr2
 sJo43y8z7K8yJYwVM80NwvWJgW2Ujec9Leec43hYXB5pulwA7c388HlBT
 ot4D+a8nj8tFCWPsADES8EaMggTZK1GsvIMl6Pkx5qWY7j5LxWRZQeWag
 K8n4Q5Cl/ozyw19p6wvfZvKAWEcaXdmXq0SBTYD6MaJp6JW62qC1komci
 I8IOH6CMbz5LgSXD0CFe7Tqqp05iIcipKlLX8K98d8L5DWsWLhzN8sEYq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="414098350"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="414098350"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 00:53:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="789713101"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="789713101"
Received: from jpoulsen-mobl.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.161])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 00:53:06 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 12 May 2023 09:52:43 +0200
Message-Id: <20230512075243.447305-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230512075243.447305-1-thomas.hellstrom@linux.intel.com>
References: <20230512075243.447305-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/2] drm/xe: Properly remove the vma from the
 vm::notifer::rebind_list when destroyed
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

If a vma was destroyed with the bo evicted, it might happen that we forget
to remove it from the notifer::rebind_list. Fix to make sure that really
happens.

v2:
- Remove an unnecessarily verbose comment how to avoid taking a lock.
  (Matthew Brost)

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

