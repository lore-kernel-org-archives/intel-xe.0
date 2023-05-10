Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5839EC7EE22
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 14:20:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E4910E4B4;
	Wed, 10 May 2023 14:20:00 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D8D10E4AF;
 Wed, 10 May 2023 14:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683728398; x=1715264398;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3j8RY09Nrc18YSpqt7dul3RIDM/3aBWwXVBmexY72Og=;
 b=ksgIGj8UeQi5fI6xxrb1leIjQLYOa4/psEdIVoJvK9BsaaNYJp0IfjXD
 8nrQPNT3SAAsGGc1l+u18VuJ0vSEJZzPITLLtjERRfW4w83SblZvEUcZY
 g/KAWV5tPkFlqZRdYi2KMoRCvJ1pycll06DEIYJR38iWIa4zw0gMuvHwO
 g2iR/m8nLDD4u2SGYjNaFSWlJOXLx04ZKacqG22J7poiDUgVmQhc6zJ+V
 ZxQmvDW3aALv0+6sr/Zt0hAZBAwhl80s1PZQXPQzJzKAQtOYDoAWBPOQv
 6hS2IExRXWZBRsTdRQyxwcP7qx9HkcPozL92e1fA/If8lAk0KS51aFuWC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="339469168"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="339469168"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 07:19:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="768931727"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="768931727"
Received: from aboreiko-mobl3.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.114])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 07:19:56 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 16:19:32 +0200
Message-Id: <20230510141932.413348-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230510141932.413348-1-thomas.hellstrom@linux.intel.com>
References: <20230510141932.413348-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Properly remove the vma from the
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

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 5f93d78c2e58..f54b3b7566c9 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -978,6 +978,15 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 	} else {
 		xe_bo_assert_held(vma->bo);
 		list_del(&vma->bo_link);
+		/*
+		 * TODO: We can do an advisory check for list link empty here,
+		 * if this lock becomes too costly. Nobody can re-add to the
+		 * bo to the vm::notifier::rebind_list at this point since we
+		 * have the bo lock.
+		 */
+		 spin_lock(&vm->notifier.list_lock);
+		 list_del(&vma->notifier.rebind_link);
+		 spin_unlock(&vm->notifier.list_lock);
 		if (!vma->bo->vm)
 			vm_remove_extobj(vma);
 	}
-- 
2.39.2

