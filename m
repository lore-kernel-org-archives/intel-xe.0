Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C337DCD6E77
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 14:45:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C4910E8FD;
	Wed, 11 Oct 2023 14:45:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DEFF10E8FC
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 14:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697035522; x=1728571522;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=3k3NjwRBTxVuwDEY5q9kZHgIGlAIdSiMZjV9S/X2Mck=;
 b=SM5m994cokXu+T2GHOOeSVEK/29HbzsG8T31ll1GNE5ZvlM9e9p02c4k
 O+13reZN3UVfM8oXVnXJtUZIIt477JsNpe8OWymzgCpNNHArmBGsGt4yZ
 sT8xkb1d57pqFpULho1QTHLJwKU8LiQY77BIlwFxWV3vJjC2FWSjhfhKX
 hSCCp2sitxob9A4DOHPI/NfoLXG07spuaX7qg1oYtKlNr1yMLvE2gg1BS
 7wRBxV2xz1OOCx/hwmU4WBv9CBT+l5sAohThRUlUjrJx735vpQrZFzv2+
 AhwzSfvT0xePrREV7dJ5m2ZyKXGZBfeAjB72uFDP9hLMvQr1RXmf8PaRx g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="448882511"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="448882511"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 07:45:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="927587945"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="927587945"
Received: from clanggaa-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.169])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 07:45:21 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 11 Oct 2023 16:44:59 +0200
Message-ID: <20231011144500.17924-10-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231011144500.17924-1-thomas.hellstrom@linux.intel.com>
References: <20231011144500.17924-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 10/11] drm/xe: Use DRM_GPUVM_RESV_PROTECTED for gpuvm
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

Use DRM_GPUVM_RESV_PROTECTED to relax locking.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 464ef3845f40..69995e3c57ff 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1235,8 +1235,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		goto err_no_resv;
 	}
 
-	drm_gpuvm_init(&vm->gpuvm, vm_resv_obj, "Xe VM", 0, vm->size,
-		       0, 0,
+	drm_gpuvm_init(&vm->gpuvm, vm_resv_obj, "Xe VM",
+		       DRM_GPUVM_RESV_PROTECTED,
+		       0, vm->size, 0, 0,
 		       &gpuvm_ops);
 
 	drm_gem_object_put(vm_resv_obj);
-- 
2.41.0

