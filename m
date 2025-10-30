Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95EAACCF9F0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 14:24:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46DCE10E9C3;
	Thu, 30 Oct 2025 14:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IQ9aO51/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2668A10E9BE
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 14:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761834263; x=1793370263;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GrNdYyFb2P6Q5hvdEe9Kiapu0l3cJdqYPxjZucpjyZk=;
 b=IQ9aO51/EdPgBPpsHHd6g7ZBJ6eASBmeMhOuOTLyfAxU2So6n6DoYQzV
 /+tnGQ8FkNnR4dokkNv1tmf3ZhKa4ClNGonxURTJGTZcRbeo8NW6ygnOJ
 CGc8s4OElpGwcBsWq2S4bLuX3kRk7il9TFKpUjqvcBwHJSV8/mZnUnTKC
 R2KGnpkSTD7z2Q2b3jJzGWj2mH/DVEPHDDDX9DGqTdIPRObn4Fz4pSguF
 DQT2I6gmWMf4Ruf9QfGqsMV56MyjUWL1/+4KZ/UscsREMTNA/5z9n/Oij
 MRKYJ+QUZjIKAz42RN97GHBZODp8xAwaIoxLc5Wr62zwT5SaY1Xx53SVd A==;
X-CSE-ConnectionGUID: 5RCRoxfgRvK0ohtxot808w==
X-CSE-MsgGUID: Mply88HKSQWZvGSyPyZj+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63181360"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="63181360"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 07:24:23 -0700
X-CSE-ConnectionGUID: 3GiRxwU/ToKqDjKf5+Nlmw==
X-CSE-MsgGUID: J50znSpoQxKerOdLOFsldw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="216625338"
Received: from himal-super-server.iind.intel.com (HELO
 hghimira.iind.intel.com) ([10.190.239.34])
 by orviesa002.jf.intel.com with ESMTP; 30 Oct 2025 07:24:22 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v3 5/5] drm/xe/vm: Skip ufence association for CPU address
 mirror VMA during MAP
Date: Thu, 30 Oct 2025 20:22:53 +0530
Message-Id: <20251030145253.867189-6-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251030145253.867189-1-himal.prasad.ghimiray@intel.com>
References: <20251030145253.867189-1-himal.prasad.ghimiray@intel.com>
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
---
 drivers/gpu/drm/xe/xe_vm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 882968ea9efb..236fcaf5389b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3202,7 +3202,8 @@ static void op_add_ufence(struct xe_vm *vm, struct xe_vma_op *op,
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

