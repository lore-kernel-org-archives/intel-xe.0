Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB498CD6E7D
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 14:45:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 997DA10E8FF;
	Wed, 11 Oct 2023 14:45:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C013110E8F2
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 14:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697035516; x=1728571516;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Pf2SlrgUnSEDtpI708QlMm7o4rxkQ28Ta1JocBASdas=;
 b=nRdRi1W7uvJwgM/rPmLJbXVR/Ph4MinJsbCutwgnKER6YNdr4OF0AqEF
 wSL8xeJ6AId5ALDsNRL55YYDxPkqAiMlZgWW7AjfVwx6DesGs4SnBB2qT
 LsUuNoye7QM0EFGn0I6QDa07+uWTnSyuFozSH7sPpYSc8EKVHsLA59i/K
 zKhnKeKQN9BxFqLwgSSIlb/YBdgV6yQNYtoTlF9Cyc7CWHf+sIe3fw+w6
 r+ozobcMOeH32jmpER25/yAa8Z6Hz/UOvX9SkK7Vk1pncnkbAK4RMKFXa
 6EaZwAU2BcU9nEDHYyFcjhSMNmCmbAwFkXi1tR+3Df1wh3rNh4SEt43SY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="448882486"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="448882486"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 07:45:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="927587902"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="927587902"
Received: from clanggaa-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.169])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 07:45:15 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 11 Oct 2023 16:44:53 +0200
Message-ID: <20231011144500.17924-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231011144500.17924-1-thomas.hellstrom@linux.intel.com>
References: <20231011144500.17924-1-thomas.hellstrom@linux.intel.com>
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
index 14039c9af6d0..e5a1c67e3bb8 100644
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

