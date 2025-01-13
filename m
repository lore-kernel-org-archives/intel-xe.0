Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E3DC02180
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jan 2025 21:08:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B116210E43D;
	Mon, 13 Jan 2025 21:08:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C/omA6yp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F216F10E43D
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jan 2025 21:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736802516; x=1768338516;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WkJwLIg4ECkEYDVJC7RZYaeV9VGxcXim53d+jMS7eWs=;
 b=C/omA6ypA3BF11VjnA72bSYO+bXr2mMoatWptk8Jkwbh3TevrHVPqcc+
 KROC2t7A/OryJ9L4IO9LnL0d7Oo7RlGZ3kjJvQCd5fuxiOz89AML1ALMi
 LgDfcWy3NwhVILq/fyGPJK3eoHIP0BRGyaUq9ukYbMr5KxlcIXu8VdKuc
 Nw9kdm9RtRPJ/IZlqAotO8fEeYnxduIx81UE4fqU5KEC0Qnp8g0XY8/UJ
 SLGuBfFwUmd2bGq2bSI605YYic4YYwIyIUovh5CRSaASbLhp5+7dKlw7z
 j562XN7vFY+PmhXl8mf6my4oQlKkcKADG9K/hn3xO/0v1b614cxisuAiT A==;
X-CSE-ConnectionGUID: GSHdv0lXQJ6F1NMsZW7QwA==
X-CSE-MsgGUID: rd8Phn97RHWcDwIK2Yo/ZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="36994673"
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; d="scan'208";a="36994673"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 13:08:36 -0800
X-CSE-ConnectionGUID: E3NFrxXxSXuxuadPL9g0VA==
X-CSE-MsgGUID: yxL5ZYxVQieteeqsjtPyzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="141875952"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 13:08:35 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Fix a typo in xe_vm_doc.h
Date: Mon, 13 Jan 2025 16:23:24 -0500
Message-Id: <20250113212324.3264218-1-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
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

s/vm->ttm.base.resv->lock/vm->gpuvm.r_obj->resv->lock

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_doc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm_doc.h b/drivers/gpu/drm/xe/xe_vm_doc.h
index 078786958403..1030ce214032 100644
--- a/drivers/gpu/drm/xe/xe_vm_doc.h
+++ b/drivers/gpu/drm/xe/xe_vm_doc.h
@@ -431,7 +431,7 @@
  * bind path also acquires this lock in write while the exec / compute mode
  * rebind worker acquires this lock in read mode.
  *
- * VM dma-resv lock (vm->ttm.base.resv->lock) - WW lock. Protects VM dma-resv
+ * VM dma-resv lock (vm->gpuvm.r_obj->resv->lock) - WW lock. Protects VM dma-resv
  * slots which is shared with any private BO in the VM. Expected to be acquired
  * during VM binds, execs, and compute mode rebind worker. This lock is also
  * held when private BOs are being evicted.
-- 
2.26.3

