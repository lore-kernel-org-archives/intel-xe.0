Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C83C001DF
	for <intel-xe@archiver.kernel.org>; Thu,  3 Aug 2023 03:23:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF1B010E025;
	Thu,  3 Aug 2023 03:23:26 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D182810E025
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Aug 2023 03:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691033003; x=1722569003;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vwkC8si7Yu3iXvcPo8NW9v+u92V2TImQaTrhPQ+ICqQ=;
 b=i5viw10myXuBl9I5kdUVJAr6BoGZNvz1scgUxhzBkhyskS6pE+G7uop+
 Pqyjkxi4yzcKOZV0j/gwr6AFumb+/2oPioIjftFTvE+KfoVBXBUxVLxWd
 LgBB8p1MUHlXB6GyyovM7fOLdl7tKaAFf3QozQ60ljVVITxrkMDR5n3vM
 GGR8I+VMgEUQQDQubdy+OIj1uuUaZB6ZOuVnlR7gyTWL2PvJimwoJMhvu
 xZ73KreqdCewxSoX+ALAi/w9/pcR38m2YhwmukmSLK5QpnVoXpjVDm5YY
 pqTA+D299GOgIXFFVS53/SmLMWb5gvyYc5wYyTDpHjjpDVOh8dlk60IpW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="367218411"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; d="scan'208";a="367218411"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 20:23:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="729385961"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; d="scan'208";a="729385961"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 20:23:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed,  2 Aug 2023 20:23:17 -0700
Message-Id: <20230803032317.706386-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Set max pte size when skipping rebinds
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

When a rebind is skipped, we must set the max pte size of the newly
created vma to value of the old vma as we do not pte walk for the new
vma. Without this future rebinds may be incorrectly skipped due to the
wrong max pte size. Null binds are more likely to expose this bug as
larger ptes are more frequently used compared to normal bindings.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Testcase: dEQP-VK.sparse_resources.buffer.ssbo.sparse_residency.buffer_size_2_24
Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
Fixes: a042bb4ca894 ("drm/xe: Avoid doing rebinds")
Reference: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23045
---
 drivers/gpu/drm/xe/xe_vm.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index cb28dbc2bdbb..936492915ecb 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2406,6 +2406,20 @@ static u64 xe_vma_max_pte_size(struct xe_vma *vma)
 	return SZ_4K;
 }
 
+static u64 xe_vma_set_pte_size(struct xe_vma *vma, u64 size)
+{
+	switch (size) {
+	case SZ_1G:
+		vma->gpuva.flags |= XE_VMA_PTE_1G;
+		break;
+	case SZ_2M:
+		vma->gpuva.flags |= XE_VMA_PTE_2M;
+		break;
+	}
+
+	return SZ_4K;
+}
+
 /*
  * Parse operations list and create any resources needed for the operations
  * prior to fully committing to the operations. This setup can fail.
@@ -2516,6 +2530,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 						IS_ALIGNED(xe_vma_end(vma),
 							   xe_vma_max_pte_size(old));
 					if (op->remap.skip_prev) {
+						xe_vma_set_pte_size(vma, xe_vma_max_pte_size(old));
 						op->remap.range -=
 							xe_vma_end(vma) -
 							xe_vma_start(old);
@@ -2550,10 +2565,12 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 					op->remap.skip_next = !xe_vma_is_userptr(old) &&
 						IS_ALIGNED(xe_vma_start(vma),
 							   xe_vma_max_pte_size(old));
-					if (op->remap.skip_next)
+					if (op->remap.skip_next) {
+						xe_vma_set_pte_size(vma, xe_vma_max_pte_size(old));
 						op->remap.range -=
 							xe_vma_end(old) -
 							xe_vma_start(vma);
+					}
 				}
 				break;
 			}
-- 
2.34.1

