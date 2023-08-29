Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B20FC83F14
	for <intel-xe@archiver.kernel.org>; Tue, 29 Aug 2023 08:04:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001E810E0B8;
	Tue, 29 Aug 2023 08:04:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A665710E0B8
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Aug 2023 08:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693296274; x=1724832274;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XyRv+w9NCaJEyZSnqhm8Htn6QbYO4lJMrHDx0Dm2pRg=;
 b=QleCAPGc+MILNIV48Go8BO1ms11xy8kVtHXvkEmNCEtb/ewk56K1GehN
 KjEdudtIMpibSK+nX5ZlflBBZvGNO8oor1zGrfG2aG5si6T+TNJaUrQfG
 xMZ95i4Piuq54B0ggNftwcrtC3fBrmA74MyWt1sk7IyWkyhbiZk8o6Efd
 Fv6UCzuzJ57MSm2fqzTajulROWgVKxaC7NKW45hHP53hOWvw4+lNbjGKa
 7SESSnPySK0rH9QgfdhwwlvXsq7u98bgVtV5Whay7TX7xWrD/G8fzZVkN
 nMHrD+0e7VQhfr5TmPvxaiPW12i38ECXW0NGUEKRWLl9xMf7kGYk6fa2i A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="461669180"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="461669180"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 01:04:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="808586240"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="808586240"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 01:04:33 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 29 Aug 2023 01:04:29 -0700
Message-Id: <20230829080429.4024-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe/pvc: Use fast copy engines as
 migrate engine on PVC
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Update Makefile to generate OOB header file for xe_migrate.c

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 550cdfed729e..78365e14f0d3 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -37,7 +37,7 @@ quiet_cmd_wa_oob = GEN     $(notdir $(generated_oob))
 $(generated_oob) &: $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules
 	$(call cmd,wa_oob)
 
-$(obj)/xe_guc.o $(obj)/xe_wa.o $(obj)/xe_ring_ops.o $(obj)/xe_vm.o: $(generated_oob)
+$(obj)/xe_guc.o $(obj)/xe_wa.o $(obj)/xe_ring_ops.o $(obj)/xe_vm.o $(obj)/xe_migrate.o: $(generated_oob)
 
 # Please keep these build lists sorted!
 
-- 
2.21.0.rc0.32.g243a4c7e27

