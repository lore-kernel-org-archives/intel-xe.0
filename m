Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94584C54E69
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 10:36:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 434BA10F55A;
	Mon, 18 Mar 2024 10:36:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N+++kQyt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C4310F559
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 10:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710758189; x=1742294189;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zeuKPTkYdWU2IwxQG/H2BGkrq0w9feW3+ekxyA0uAyg=;
 b=N+++kQytXcdheAvxHlvRViSp7NSokCH19KuelLqh/S3pIhAmg3IpCUgS
 LIOzGcHAVJ5JDdZGGXfK5CwOJ2CL2M6fWc9mvX3YykZpTQzFwyQWB92or
 JXW5Im6WU4crRvWSCqLhEgW3X4mtj+kcvsjIH10Oe+Wg3zvu0/xOYGFC4
 r/und8ZyyCTBAEi1WV5i6xvxpg8Fg5YkEp1oIcUqhQyNYNnNwjcCnEPzj
 dVTUiUZ/humymAhnrBtgnDO5VS/wovZ5hCLenOMYes9t9FCmEKo/il5wP
 awk9vUe+iDjmoA9OUobXtmmKBgaTT0ojTgDmV6dgwvPcpcexn0HB4Sqcy A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="16284332"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="16284332"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 03:36:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="18107703"
Received: from unknown (HELO mwauld-mobl1.intel.com) ([10.245.245.16])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 03:36:27 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH] drm/xe/vm: fix xe_assert()
Date: Mon, 18 Mar 2024 10:36:17 +0000
Message-ID: <20240318103616.26240-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.44.0
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

The region can be used an index into the region_to_mem_type, so we
should be asserting that it is less than the ARRAY_SIZE here.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index cbb9b8935c90..51d62323d9ee 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2033,7 +2033,7 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
 	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
 	int err;
 
-	xe_assert(vm->xe, region <= ARRAY_SIZE(region_to_mem_type));
+	xe_assert(vm->xe, region < ARRAY_SIZE(region_to_mem_type));
 
 	if (!xe_vma_has_no_bo(vma)) {
 		err = xe_bo_migrate(xe_vma_bo(vma), region_to_mem_type[region]);
-- 
2.44.0

