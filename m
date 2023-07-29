Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBE6EB64DD
	for <intel-xe@archiver.kernel.org>; Sat, 29 Jul 2023 03:31:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B8510E0BF;
	Sat, 29 Jul 2023 03:31:14 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F38610E0BF
 for <intel-xe@lists.freedesktop.org>; Sat, 29 Jul 2023 03:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690601472; x=1722137472;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IA7ohKNVFERRf3NNj+aM2WoPzh6OiK1TVKn+OvnYLNI=;
 b=F691WFYpWjQwinGm7eXxE8c8wUajTJiMi5XcfMryjA6lKOQYbl6KRIO1
 mtXzN1qiWBIPtF0Y2hw+uPBfb0OzhlVmxBJ2pCZHqGfeYbe6Uvd6WURgX
 gMguhlrktNJkkowsuJSABpF+wdhqVlZTAXwpUQNKzQcx5/GHcPOkExcHk
 StJo7ujTXkB2brFzlNTkzHGY11veIt+T7yoB5utibtetKAtb1Ll7sWDa9
 BH/bM2Y6jobTsAWtx1k8l0XcZube7GUpXSWbGGQBcdLZzacF1a2D1hFcU
 5RvgPfoueRmZyMFqd9T168BY239eFmGLQIlLy7hpg8h/JkDC4G3pW1iJI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="435015719"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; d="scan'208";a="435015719"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 20:31:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="817717316"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; d="scan'208";a="817717316"
Received: from gbilling-mobl.amr.corp.intel.com (HELO
 przanoni-mobl.amr.corp.intel.com) ([10.209.121.175])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 20:31:11 -0700
From: Paulo Zanoni <paulo.r.zanoni@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 28 Jul 2023 20:30:59 -0700
Message-Id: <20230729033059.2120121-1-paulo.r.zanoni@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: don't skip rebinds if there's a NULL
 binding involved
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

Commit a042bb4ca894 ("drm/xe: Avoid doing rebinds") causes
regressions in numerous Vulkan dEQP sparse-related tests. The errors
happen in tests that:

  - check residencyNonResidentStrict=true behavior (use NULL bindings
    and check that they read/write zero)
  - and use buffers bigger than 2MB
  - and write through sparse buffers using compute shaders with ssbos

So for example, the test:
  - dEQP-VK.sparse_resources.buffer.ssbo.sparse_residency.buffer_size_2_24

fails only if residencyNonResidentStrict is true, otherwise it passes
(becasue otherwise it doesn't check the values of the ranges that were
supposed to be bound through NULL bindings).

But the test:
  - dEQP-VK.sparse_resources.buffer.ssbo.sparse_residency.buffer_size_2_20

always passes because it uses a smaller buffer, despite doing
everything else equally. By maninpulating the sizes of the buffers we
can see that 2MB is the range where the test starts failing.

On the other hand, some other 2_24 tests were passing, despite having
4MB buffers and checking the contents of NULL binding buffers.

I can't claim I have a deep understanding of the code invovled here,
but this patch seems to be the minimal 'revert' that fixes the issue
and should be a good point to start the conversation on the mailing
list.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Testcase: dEQP-VK.sparse_resources.buffer.ssbo.sparse_residency.buffer_size_2_24
Fixes: a042bb4ca894 ("drm/xe: Avoid doing rebinds")
Reference: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23045
Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 6429d6e5113d..955f664ff1f1 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2512,7 +2512,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
 					 * Userptr creates a new SG mapping so
 					 * we must also rebind.
 					 */
-					op->remap.skip_prev = !xe_vma_is_userptr(old) &&
+					op->remap.skip_prev = !is_null &&
+						!xe_vma_is_userptr(old) &&
 						IS_ALIGNED(xe_vma_end(vma),
 							   xe_vma_max_pte_size(old));
 					if (op->remap.skip_prev) {
@@ -2547,7 +2548,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
 					 * Userptr creates a new SG mapping so
 					 * we must also rebind.
 					 */
-					op->remap.skip_next = !xe_vma_is_userptr(old) &&
+					op->remap.skip_next = !is_null &&
+						!xe_vma_is_userptr(old) &&
 						IS_ALIGNED(xe_vma_start(vma),
 							   xe_vma_max_pte_size(old));
 					if (op->remap.skip_next)
-- 
2.39.2

