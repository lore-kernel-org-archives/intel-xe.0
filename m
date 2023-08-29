Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F36C83F14
	for <intel-xe@archiver.kernel.org>; Tue, 29 Aug 2023 09:45:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8AF10E1D7;
	Tue, 29 Aug 2023 09:45:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4BD10E1D8
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Aug 2023 09:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693302352; x=1724838352;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qi4SSf/1CLTxNEUqLhghE5yWbtWgm47qiVGzbacKx8Y=;
 b=RWIuo40wqg6j15cCtBSEfmMQSzUgpjakJQp1voPkLCbYk7JWvdq+U3VY
 FyJE5oD16WDv7xndJ6cxsIA0+u+jq2tkI51pzJ4anGa5GO0dZBnhWPhnc
 c0q5zFp0149yFgNQQPNLlAKlPaZBZhWrkUSftcDZCWpR/40dFtZOZTDvB
 tVKjs5I/0/4mBhuWM8Tpesm1maB5LnfsYolPfXlrsTfR136YTX354BC3G
 I5qDf7wtKHR4faq2VHqx7cCKwN3hSM2IutV+4KZ/wAq/18OXm7WAXaBtR
 IhGNBBiNVA74MhnGYMhPKh7o1ZhSbDKoWGWtMOTIsResLokT8iquiP7Ox g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="378045586"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="378045586"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 02:45:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="688433895"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="688433895"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 02:45:48 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 29 Aug 2023 02:45:38 -0700
Message-Id: <20230829094538.19551-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] fixup! drm/xe/pvc: Use fast copy engines as
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
Cc: matthew.d.roper@intel.com, matthew.auld@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Update Makefile to generate OOB header file for xe_migrate.c

v2: list targets in alphabetical order.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 550cdfed729e..9d2311f8141f 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -37,7 +37,7 @@ quiet_cmd_wa_oob = GEN     $(notdir $(generated_oob))
 $(generated_oob) &: $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules
 	$(call cmd,wa_oob)
 
-$(obj)/xe_guc.o $(obj)/xe_wa.o $(obj)/xe_ring_ops.o $(obj)/xe_vm.o: $(generated_oob)
+$(obj)/xe_guc.o $(obj)/xe_migrate.o $(obj)/xe_ring_ops.o $(obj)/xe_vm.o $(obj)/xe_wa.o: $(generated_oob)
 
 # Please keep these build lists sorted!
 
-- 
2.21.0.rc0.32.g243a4c7e27

