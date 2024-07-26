Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695A9C3DA49
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 14:17:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5FD10E9A2;
	Fri, 26 Jul 2024 14:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lUuWQDCN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D1A910E9A2
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 14:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722003464; x=1753539464;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eFPFNuoLLhDUL5hQochGLJkCW6rVDhH69cJuyoV3M1I=;
 b=lUuWQDCNQK8FPXmxMzfwf66oTiLXxc6ZoqltWzR4Zq57i5p8yAB9OJKg
 8u/ps3NVMxwMqBbTug5U1DlXvP62K8OzLXjptlBdyWeyFGQTAH1VlykCG
 /JW2rmX4HYBmntcKvRNefxCRJuICEy9RelByx8vSxMuWe7UIeufoj1KG7
 PjgKBDgZZE7jecKV4ahV8Zmi15/+SRJneC7uq95bWUjsmzgetkLdfBuUL
 MCgeo30vrttk30bczk54A0DkvdPYj/swxjuLb8OQTB0n5znslqIl+NhcS
 3nBNQhdjYfZSZH0TohNYDvkJxx/m5TJ6TV0+a6gURjxIbKUEVpp+QGr9E Q==;
X-CSE-ConnectionGUID: WGHsp5f9QsGkmbbxFVLvlw==
X-CSE-MsgGUID: sUvq855CQEKqSwmVkGWXrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="23598794"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="23598794"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 07:17:44 -0700
X-CSE-ConnectionGUID: jifNi1+3QZC4gEUbMcvuAw==
X-CSE-MsgGUID: 49qcHTMhR5y1P3UgwtKIuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="57861465"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 07:17:43 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 19/21] drm/xe/eudebug: Implement vm_bind_op discovery
Date: Fri, 26 Jul 2024 17:08:16 +0300
Message-Id: <20240726140818.54304-20-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
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

v2: Fix bad op ref seqno (Christoph)

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_eudebug.c | 40 +++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index f0bec8c8bba1..a80ffb64df15 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -3070,6 +3070,42 @@ void xe_eudebug_debug_metadata_destroy(struct xe_file *xef, struct xe_debug_meta
 	xe_eudebug_event_put(d, debug_metadata_destroy_event(d, xef, m));
 }
 
+static int vm_discover_binds(struct xe_eudebug *d, struct xe_vm *vm)
+{
+	struct drm_gpuva *va;
+	unsigned int num_ops = 0, send_ops = 0;
+	u64 ref_seqno = 0;
+	int err;
+
+	/* Currently only vm_bind_ioctl inserts vma's */
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
+				 &vma->debug_metadata);
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
@@ -3095,6 +3131,10 @@ static int discover_client(struct xe_eudebug *d, struct xe_file *xef)
 		err = vm_create_event(d, xef, vm);
 		if (err)
 			break;
+
+		err = vm_discover_binds(d, vm);
+		if (err)
+			break;
 	}
 	mutex_unlock(&xef->vm.lock);
 
-- 
2.34.1

