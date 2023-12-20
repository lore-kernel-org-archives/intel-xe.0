Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A083C3DA6E
	for <intel-xe@archiver.kernel.org>; Wed, 20 Dec 2023 14:42:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 230DB10E5C5;
	Wed, 20 Dec 2023 14:42:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B90810E5C5
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Dec 2023 14:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703083345; x=1734619345;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zWwhquvHPp7atmuymWuezq9VqaRKvbf8CAWP3N2REwQ=;
 b=ehDFqxj4TnUoZcAhEaayPscUpSRIw9H1oiNPPpHWvrhn7dS7UUm2YT9f
 3CYScpje2jS1VQ+6doPcIqLTS0caBQ8JecoKXJI4DwRDo8XX4rxf2o7FY
 pmBfl3qpzKgkESOXKkwUcZMFwGX9BjrdaB2WaiBxguB/iAlp+USp7ssgj
 5s+6EH5RIA50Rb0at/3UzOTXEjHnTzmeYCVraYvoSJhJx7hVFegmAMBsq
 wEYpyvdbo8LsOZ2djgIL0e6WQfkO6u2tMPcf6638CoXv0D8aEpEYywXsi
 INxq/lnbDTf3asS0xfcRQbqFDmNTJ0y/q+farB/hhbkOSXziwfhzuo9yE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="2678288"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="2678288"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 06:42:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="894718413"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; d="scan'208";a="894718413"
Received: from sbint17x-mobl.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.75])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 06:42:23 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/vm: Fix an error path
Date: Wed, 20 Dec 2023 15:42:14 +0100
Message-ID: <20231220144214.2077-1-thomas.hellstrom@linux.intel.com>
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
Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

If using the VM_BIND_OP_UNMAP_ALL without any bound vmas for the
vm, we will end up dereferencin an uninitialized variable and leak a
bo lock. Fix this.

Reported-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
Closes: https://lore.kernel.org/intel-xe/jrwua7ckbiozfcaodx4gg2h4taiuxs53j5zlpf3qzvyhyiyl2d@pbs3plurokrj/
Suggested-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
Fixes: 9f232f4ae249 ("drm/xe: Port Xe to GPUVA")

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
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

