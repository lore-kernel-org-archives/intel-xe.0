Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02549C35274
	for <intel-xe@archiver.kernel.org>; Thu, 21 Dec 2023 07:42:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B01410E05E;
	Thu, 21 Dec 2023 07:42:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8ADB10E05E
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Dec 2023 07:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703144522; x=1734680522;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=omdeVZctGcL7KEyyzr3yaPRk95sCrGb0xaT2zdpGh7Q=;
 b=PwN8xwXp49zYWT8NUkhGGpmBlwcArFR8GRkdSBgusC9hub1sf7RVCJrM
 jOfHvNkG1szJtjUvtdIpFdWUY4HvNsuC+c9RQhBe+c8QFhgkkYBkc8Vve
 es6Nas6hsKpFv1mf2N2afO8MsZsVwHSGGdviGMtCbfzlfsVHSRwQi7mHB
 rKh7IimOgyBeaQZSnVPq5SM4YgyvDe2Snup5WZ7GEvYejtjBdElNYqIAz
 8zWAxEeq5C3LXKdlCnCVx+SYRWUMLh5fhp8+X9rUUoe7HO8v6nD+pVCJO
 QeHUSUElv8yZNWYvTyrC0to/7Yf0EtrSDrQKy5zygPoTyRYIUX7PZJBxm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="9407612"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="9407612"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 23:42:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="776622714"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="776622714"
Received: from lapeders-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.203])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 23:41:59 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2] drm/xe/vm: Fix an error path
Date: Thu, 21 Dec 2023 08:41:45 +0100
Message-ID: <20231221074145.4199-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.42.0
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
Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

If using the VM_BIND_OP_UNMAP_ALL without any bound vmas for the
vm, we will end up dereferencing an uninitialized variable and leak a
bo lock. Fix this.

v2:
- Updated commit message (Lucas De Marchi)

Reported-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
Closes: https://lore.kernel.org/intel-xe/jrwua7ckbiozfcaodx4gg2h4taiuxs53j5zlpf3qzvyhyiyl2d@pbs3plurokrj/
Suggested-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
Fixes: 9f232f4ae249 ("drm/xe: Port Xe to GPUVA")
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 1ca917b8315c..127842656a23 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2063,9 +2063,11 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 		if (err)
 			return ERR_PTR(err);
 
-		vm_bo = drm_gpuvm_bo_find(&vm->gpuvm, obj);
-		if (!vm_bo)
-			break;
+		vm_bo = drm_gpuvm_bo_obtain(&vm->gpuvm, obj);
+		if (IS_ERR(vm_bo)) {
+			xe_bo_unlock(bo);
+			return ERR_CAST(vm_bo);
+		}
 
 		ops = drm_gpuvm_bo_unmap_ops_create(vm_bo);
 		drm_gpuvm_bo_put(vm_bo);
-- 
2.42.0

