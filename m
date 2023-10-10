Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7DACD80C4
	for <intel-xe@archiver.kernel.org>; Tue, 10 Oct 2023 12:48:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10CDC10E347;
	Tue, 10 Oct 2023 12:48:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA8810E050
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Oct 2023 12:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696942132; x=1728478132;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=z3TtmV1kFMTUAojy+y+9gn9Nf7uRT892QPXt7P2Al3o=;
 b=df1ev5yrkWxW/d28OGQrG9fLIPsphPdPR3f6M5VPUwjz1uXHWnZHcnsr
 1J503Su4O+7nHEuzJchrHO2QZQCGCgSF5k4BSM5mF+XIuzBw5FngldLue
 q2zJzTDjwOEOPWphfwZsK4TJtEaA4uynhDzO01waniZlB27bSWwrMBdiV
 znBA8TvsBBLooo50O7dYwwDX2UuLmjElGNqiSNdBQUKHWaZxxZJlwgWmd
 KiEifEJW0xkYmi2GVgulRoRi5pGDzICMOY+MjbvDKOazo8H8b2mSU0t65
 2Bf/Hg1k0X5DziZfgX/kaNBRa04fyibVgYbZkjGhgWxckxnSV5KkOJZrX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="374725037"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="374725037"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 05:48:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="703302369"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="703302369"
Received: from agargas-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.164])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 05:48:51 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 10 Oct 2023 14:48:32 +0200
Message-ID: <20231010124839.7948-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010124839.7948-1-thomas.hellstrom@linux.intel.com>
References: <20231010124839.7948-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 04/11] drm/xe: Adjust to commit "drm/gpuvm: add
 drm_gpuvm_flags to drm_gpuvm"
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
 drivers/gpu/drm/xe/xe_vm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e46812c01154..70bd36912720 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1380,7 +1380,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		goto err_no_resv;
 	}
 
-	drm_gpuvm_init(&vm->gpuvm, vm_resv_obj, "Xe VM", 0, vm->size, 0, 0,
+	drm_gpuvm_init(&vm->gpuvm, vm_resv_obj, "Xe VM", 0, 0, vm->size,
+		       0, 0,
 		       &gpuvm_ops);
 
 	drm_gem_object_put(vm_resv_obj);
-- 
2.41.0

