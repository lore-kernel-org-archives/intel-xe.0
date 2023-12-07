Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C758C10DC3
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 14:12:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B53110E8C2;
	Thu,  7 Dec 2023 14:12:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B569010E8BE
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 14:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701958341; x=1733494341;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=1uKC1gaUiouNcyVN8epXKd+300MFor7nVuqMSzlR1pM=;
 b=Xcr7OVJx893DDwEFGu9qdiT5mYnkv9X+lBp0icaWvLBC+AG0Mr3GP3XT
 IrSoDw+dupy8QepWT47aSsprjj81VjaQ2UCoIK68djqcaiKVxf/oKEUYR
 z0hz05FBVI7ZxmDky9uk55mctxky1EyHWLZPc1peLasFYm0BcYlSxGqSL
 Lb6+nde+aVHvBWFHbPCnloXmJDG+FMvNiI4u3krF+UFawwUl0zAazXDyW
 66+ot1g0Q+/EOXsQaBVg1lheR67GF9B9baCW7ZtFkHj7Y1C0RHw0gbhd2
 njtdQgMRFlIcLandbTHvrASpqKj3k4yAzaLFA5Ng4qECJrLlpFG7ycdWe g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="12947567"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="12947567"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 06:12:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="721479788"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="721479788"
Received: from jpoulsen-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.234])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 06:12:19 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 13/16] drm/xe: Adjust to commit "drm/gpuvm: add
 drm_gpuvm_flags to drm_gpuvm"
Date: Thu,  7 Dec 2023 15:11:53 +0100
Message-ID: <20231207141157.26014-14-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231207141157.26014-1-thomas.hellstrom@linux.intel.com>
References: <20231207141157.26014-1-thomas.hellstrom@linux.intel.com>
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

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 9a090f21f9af..034496ac2341 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1385,8 +1385,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		goto err_no_resv;
 	}
 
-	drm_gpuvm_init(&vm->gpuvm, "Xe VM", &xe->drm, vm_resv_obj, 0, vm->size,
-		       0, 0, &gpuvm_ops);
+	drm_gpuvm_init(&vm->gpuvm, "Xe VM", 0, &xe->drm, vm_resv_obj,
+		       0, vm->size, 0, 0, &gpuvm_ops);
 
 	drm_gem_object_put(vm_resv_obj);
 
-- 
2.42.0

