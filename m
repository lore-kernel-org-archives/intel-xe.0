Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109F3C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 21:29:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47F310E70E;
	Fri, 12 Jul 2024 21:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ijp7/S3d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B2110E70E
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 21:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720819760; x=1752355760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bFztUzd7BwyKza3JwNqsFOxbT5hz60qSGZiY1+I94lg=;
 b=ijp7/S3dAp8g9HJaV6XQgACqGM8mX2HbuPYETcRSNqeiq8wZwuniCF3t
 s2V0Xm1W63/7Opz615OS9NxCwiWDpnFUQxycmcIcdVcW4z0EGLrF5yRIr
 dxhSlF1XTXXnwGeK4Ci6rPf1k70lf8tb50sR2m80pSIPDZbg6kncHv0/L
 /JQ6EHERHA32gs8j6xXI2HVQxr58dwG30PjiKw6yWYc9cZ7yJtX/8agIx
 C0Q+BpHbeMuT8rM4NsJlgcuZcQOdSjVDHjdTRQy+B2d67gSSHMjOiA9yC
 qaZm8rxVgHUlmMZ44VnXGKlE+P65grOrsNt+9IgdWQatNd90N3UfcIzvF w==;
X-CSE-ConnectionGUID: quxacU4zTNOu4pJDATiqCg==
X-CSE-MsgGUID: 4gPKyxX0Rea8pRbkOg37KA==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="17990153"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="17990153"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 14:29:20 -0700
X-CSE-ConnectionGUID: kgDTw9d6QtyGT+brjFtzVA==
X-CSE-MsgGUID: NO0nz+RwTC2mXfxsWZeXVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="53864567"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 14:29:19 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [RFC 01/14] drm/xe: Make exec_queue_kill safe to call twice
Date: Fri, 12 Jul 2024 14:28:45 -0700
Message-ID: <20240712212901.2684239-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240712212901.2684239-1-daniele.ceraolospurio@intel.com>
References: <20240712212901.2684239-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

An upcoming PXP patch will kill queues at runtime when a PXP
invalidation event occurs, so we need exec_queue_kill to be safe to call
multiple times.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 5b166fa03684..02f684c0330d 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -280,8 +280,10 @@ void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 		return;
 
 	down_write(&vm->lock);
-	list_del(&q->lr.link);
-	--vm->preempt.num_exec_queues;
+	if (!list_empty(&q->lr.link)) {
+		list_del_init(&q->lr.link);
+		--vm->preempt.num_exec_queues;
+	}
 	if (q->lr.pfence) {
 		dma_fence_enable_sw_signaling(q->lr.pfence);
 		dma_fence_put(q->lr.pfence);
-- 
2.43.0

