Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E582C0015E
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 21:44:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F32B10E1A9;
	Thu, 20 Jul 2023 21:44:44 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9DD210E1A6
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jul 2023 21:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689889479; x=1721425479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SJp6e2D2ly4n0AUDF2th6xhhaVCeYOgAKyIk/nq/h6Q=;
 b=NSdbs/+KJ8CkjFgJYE1x9sqZ3JhCLKojFMFDlc/b9oWfP2S63NNFVjxN
 CQf3bIg89YNUExSUIvVeyYDi5Y0HkCLrFYiUr9H3p2U+Qe3s8WgZTzQux
 qnagpqf/rHKwVnAml+vllDXRnroewqJfIPxJ1z+vPaL/0Dnt6/8zfm13L
 1XAyaf9DCw6WC5Nt1PK0iS1Vn0y8XdpO+kRyzAgI++gEUtJ5Ly5IvjhTB
 58KSBdmeg3z0oELgCEuPitgm4BDpJ6qThhkkttsGj+OmNi9NqTXdX7xlz
 +EnH1nBP0KsYUZWyIp0FhxEJLMpEotm4nsE3JBjFKxVmYzf6gt8NfzVuh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="433093168"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="433093168"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 14:43:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="814693482"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="814693482"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 14:43:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 20 Jul 2023 14:43:42 -0700
Message-Id: <20230720214345.203464-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230720214345.203464-1-matthew.brost@intel.com>
References: <20230720214345.203464-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/7] drm/xe: Replace list_del_init with list_del
 for userptr.invalidate_link cleanup
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

This list isn't used again, list_del is the proper call.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
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

