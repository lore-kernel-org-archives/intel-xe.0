Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02157CFD315
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 07:27:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B546F10E35A;
	Tue, 25 Nov 2025 07:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BFZfMmjX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1CEE10E35A
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 07:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764055648; x=1795591648;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1vuH2N17+mRv6A9Qihnsb2Wp4vJsFODhqYGRcrqqq9o=;
 b=BFZfMmjXv4UZ6VdY9F8uzvO3dBQ0iXvQb3LEmgu2jfHHgiN/eEBvXivi
 +eN5rDOWiAlYiWXcyHTzCxYW9aT5mMU4dlBSrzcWzufO1eWONPUKbPp2l
 OKlZHv8KLgR1Y2r6QbF+B/vHjM14rzQ6tk8paI6sqh9i9vWU+WOf9qw6k
 zJC+0qouyU71OMNaEk9YCXiZcFwEXjfh4C6HtrS9syQS7qEsdWR89h80f
 PFmJSYg0UNKo3JKymIDj27J8Xa+QPqJa6cgsJW0uAucm5uBl6FvL+xvdc
 g/VYEE392cV9U8rpC6pZAuI0lcSr7g0/tfjvLQyZN8GxjuPeyqoyJIOO1 A==;
X-CSE-ConnectionGUID: pugXa/mERaaTG6eg/0UE6w==
X-CSE-MsgGUID: plL2mAFZTkGRhB2tafzqWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="91553155"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; d="scan'208";a="91553155"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 23:27:28 -0800
X-CSE-ConnectionGUID: +tuRQes/TxKD6FuYhoBKEg==
X-CSE-MsgGUID: T17Q3GLYR/iyO3Zx/aUhxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; d="scan'208";a="191698558"
Received: from himal-super-server.iind.intel.com (HELO
 hghimira.iind.intel.com) ([10.190.239.34])
 by orviesa006.jf.intel.com with ESMTP; 24 Nov 2025 23:27:27 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v5 5/5] drm/xe/vm: Skip ufence association for CPU address
 mirror VMA during MAP
Date: Tue, 25 Nov 2025 13:26:28 +0530
Message-Id: <20251125075628.1182481-6-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125075628.1182481-1-himal.prasad.ghimiray@intel.com>
References: <20251125075628.1182481-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The MAP operation for a CPU address mirror VMA does not require ufence
association because such mappings are not GPU-synchronized and do not
participate in GPU job completion signaling.

Remove the unnecessary ufence addition for this case to avoid -EBUSY
failure in check_ufence of unbind ops.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a7a21966e390..a70a4a1fa03c 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3218,7 +3218,8 @@ static void op_add_ufence(struct xe_vm *vm, struct xe_vma_op *op,
 {
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
-		vma_add_ufence(op->map.vma, ufence);
+		if (!xe_vma_is_cpu_addr_mirror(op->map.vma))
+			vma_add_ufence(op->map.vma, ufence);
 		break;
 	case DRM_GPUVA_OP_REMAP:
 		if (op->remap.prev)
-- 
2.34.1

