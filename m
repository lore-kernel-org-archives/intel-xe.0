Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E9ECEACDB
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 14:53:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B2E10E645;
	Tue,  1 Oct 2024 14:53:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GB9wS4Z/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4584C10E65A
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Oct 2024 14:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727794435; x=1759330435;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kefBqQj2X2Ruk3XWsM84rCk8aa/V+rzZQHMrzt1FPjA=;
 b=GB9wS4Z/LDjMkGBMBBfS2wuFuBtk16x1bQVIMey8cflAblAZHFm8RbrJ
 z5rv5LDPXEdg1X1+pRju7meo/gFKHJyGl1H81cMN8Wg8ITu67bwITXZc3
 B7wGptDzBb3lqK66uXvdG1NQFF1sZGtjzw82l406AfuwGpEKgGQN3d2UT
 8cbPqMV5EPhn1zUHBl1fbnrjIuhF853OpstBUyJCgS0Dlfm2/MMzV/mp8
 5gdG/aEEmj6GURwZyyiqcaIKQjsqLZCcucWJnEPHn6dnbah8rXkYGDKXT
 dS2xBcOo3L57WbFznW3qIL37vl2jNbyskgVUPS1xl7VkgXEqr6u34oEkC w==;
X-CSE-ConnectionGUID: odkfEAAVRgaI0nmdenwAqA==
X-CSE-MsgGUID: s49+MWpqSq+ixwCXCJuAyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27091427"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="27091427"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 07:53:55 -0700
X-CSE-ConnectionGUID: HuSdpplTSZ6GafcLsmxXOg==
X-CSE-MsgGUID: npVkqaQlQWSosw3bjZQcMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="97048773"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 07:53:54 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 16/18] drm/xe/eudebug: Implement vm_bind_op discovery
Date: Tue,  1 Oct 2024 17:43:04 +0300
Message-Id: <20241001144306.1991001-17-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241001144306.1991001-1-mika.kuoppala@linux.intel.com>
References: <20241001144306.1991001-1-mika.kuoppala@linux.intel.com>
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

Follow the vm bind, vm_bind op sequence for
discovery process of a vm with the vmas it has.
Send events for ops and attach metadata if available.

v2: - Fix bad op ref seqno (Christoph)
    - with discovery semaphore, we dont need vm lock (Matthew)

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_eudebug.c | 45 +++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 368e1a987f7a..faa49ba55b78 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -3153,6 +3153,47 @@ void xe_eudebug_debug_metadata_destroy(struct xe_file *xef, struct xe_debug_meta
 	xe_eudebug_event_put(d, debug_metadata_destroy_event(d, xef, m));
 }
 
+static int vm_discover_binds(struct xe_eudebug *d, struct xe_vm *vm)
+{
+	struct drm_gpuva *va;
+	unsigned int num_ops = 0, send_ops = 0;
+	u64 ref_seqno = 0;
+	int err;
+
+	/*
+	 * Currently only vm_bind_ioctl inserts vma's
+	 * and with discovery lock, we have exclusivity.
+	 */
+	lockdep_assert_held_write(&d->xe->eudebug.discovery_lock);
+
+	drm_gpuvm_for_each_va(va, &vm->gpuvm)
+		num_ops++;
+
+	if (!num_ops)
+		return 0;
+
+	err = vm_bind_event(d, vm, num_ops, &ref_seqno);
+	if (err)
+		return err;
+
+	drm_gpuvm_for_each_va(va, &vm->gpuvm) {
+		struct xe_vma *vma = container_of(va, struct xe_vma, gpuva);
+
+		if (send_ops >= num_ops)
+			break;
+
+		err = vm_bind_op(d, vm, DRM_XE_EUDEBUG_EVENT_CREATE, ref_seqno,
+				 xe_vma_start(vma), xe_vma_size(vma),
+				 &vma->eudebug.metadata.list);
+		if (err)
+			return err;
+
+		send_ops++;
+	}
+
+	return num_ops == send_ops ? 0 : -EINVAL;
+}
+
 static int discover_client(struct xe_eudebug *d, struct xe_file *xef)
 {
 	struct xe_debug_metadata *m;
@@ -3175,6 +3216,10 @@ static int discover_client(struct xe_eudebug *d, struct xe_file *xef)
 		err = vm_create_event(d, xef, vm);
 		if (err)
 			break;
+
+		err = vm_discover_binds(d, vm);
+		if (err)
+			break;
 	}
 
 	xa_for_each(&xef->exec_queue.xa, i, q) {
-- 
2.34.1

