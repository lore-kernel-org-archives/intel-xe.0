Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D8BC4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 17:51:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B098410E8F2;
	Thu,  9 Nov 2023 17:51:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 728CC10E8F2
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 17:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699552265; x=1731088265;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oqRltiHsVDCGhXnToGtBDYN1BhwsNy3T5ToPXMpevck=;
 b=BPJim5m20I+3JvD8AzPgtVMYWT7pwo0HPmvWggSTI5QjPYUNXF5y1phl
 U8Aulj9s2UBNwCWPJTwVN88pMUdrz/IaWWJvx0qUbxEQSvJhCnrpg+lxJ
 xXAp/4vX4avkpkJ31ME7f1fheRbqwDNpY2edJT+aSnUIxVNBY3gwps6E2
 SqH+gOs/kZSNKVl1TVZCm0HX6V/i/tQD36PIqVfszYCH56J+ke+89zYhl
 psfv85HUwx2z7XqZqUr1qtwIhwGPJYF2quiB2FziKrox0A8YP/qGk2089
 E2vqkK5WlfREd2dleiTQ/3Sh6bWVWXfBgh7/lcepf0eLcYEwcNoAsgh/v A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="3012960"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="3012960"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 09:51:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="11219303"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 09:51:03 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 09:51:32 -0800
Message-Id: <20231109175132.3084142-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231109175132.3084142-1-lucas.demarchi@intel.com>
References: <20231109175132.3084142-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Fix build with KUNIT=m
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Due to the current integration between "live" xe kunit tests and kunit,
it's not possible to have a build with the following combination:

	CONFIG_DRM_XE=y
	CONFIG_KUNIT=m

... even if kconfig doesn't block it. The reason for the failure is that
some compilation units are pulled in xe.ko:

	drivers/gpu/drm/xe/xe_bo.c:#include "tests/xe_bo.c"
	drivers/gpu/drm/xe/xe_dma_buf.c:#include "tests/xe_dma_buf.c"
	drivers/gpu/drm/xe/xe_migrate.c:#include "tests/xe_migrate.c"
	drivers/gpu/drm/xe/xe_pci.c:#include "tests/xe_pci.c"

Those files shouldn't use symbols from kunit, which should be reserved
to the tests/*_test.c files. Detangling this dependency doesn't seem
very straightforward, so fix the immediate issue instructing kconfig to
block the problematic configuration.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 2fa2d6dacb96..5b3da06e7ba3 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_XE
 	tristate "Intel Xe Graphics"
-	depends on DRM && PCI && MMU
+	depends on DRM && PCI && MMU && (m || (y && KUNIT=y))
 	select INTERVAL_TREE
 	# we need shmfs for the swappable backing store, and in particular
 	# the shmem_readpage() which depends upon tmpfs
-- 
2.40.1

