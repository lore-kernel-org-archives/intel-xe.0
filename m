Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6F9C10F07
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 15:19:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4DB10E57B;
	Tue,  5 Dec 2023 15:19:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A39610E574
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 15:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701789575; x=1733325575;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=1uKC1gaUiouNcyVN8epXKd+300MFor7nVuqMSzlR1pM=;
 b=JXaD27uF7ipAKokLyutO40po/hY+Z4VAwPGoA7goO5LIttsNc8HgrFdc
 Klpot0Q3e0/JHy1wGsuruCrnm8hNf1fNM/MTppkZnqATZJfyNyU7qUApf
 qrLcbR1zIB3//BDavRD7rzNoU4I3ePMCfiIiRs6ZpI9pBr2vSdrp9krJw
 gJvQ4ODewtmBCiK6FYZC7FTedQbyUpk3sqah7MHUrGXMr2HgeTUuSXDAy
 3sdpKI1+KeOYY/DO8ZZJAP/6WkARU4Cv/g0sf255LCLG8XvHgHVLW3K6i
 z9a5M2ZBR4wARHNi4UVkbny2lKNLRyG0Z6WxmmMNDQLODhY68/b+KBUND w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="393641595"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="393641595"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 07:19:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="770956847"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="770956847"
Received: from mstribae-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.119])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 07:19:34 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  5 Dec 2023 16:19:09 +0100
Message-ID: <20231205151913.4259-13-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231205151913.4259-1-thomas.hellstrom@linux.intel.com>
References: <20231205151913.4259-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 13/16] drm/xe: Adjust to commit "drm/gpuvm: add
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

