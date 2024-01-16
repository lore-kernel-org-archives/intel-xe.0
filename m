Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87853C47DA7
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 17:42:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C91C610E5E1;
	Tue, 16 Jan 2024 17:42:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB1210E546;
 Tue, 16 Jan 2024 17:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705426954; x=1736962954;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dZ/YDda0ow0P9dvQa1U3S3y/My71KsPZJoHpY5FyZJM=;
 b=CF2OgVhH3NBon/WRKRkDctXHpcM2vUoQXAyqM0Z8k7g+XJyqzufcZioz
 lrJj9W5Zq5sAI1R6FHhS6IrGYadOvpDg3FnTNUh4/H5eScRGJqBrCmpxA
 Pq05NjXVDGYcpIsImERvLS38Nmg2XN2dY5WClWfUB79AjmYOo0OEvutxe
 ITRzYtBhv2h8gmzsduY9sxSBZ1XUfWhBd8uqa56r7JkzQwGvCA59cIUrR
 psIG87rQeES0oTDmvMh6GUkbut7n8D5w8L/CxWG+zD5geJOcd3dtv18CQ
 Jw6e9yMacJC5ZegrSOgGvCt/fvTWikMONxSuH3Af6Eq/lPyRWN17jYNGG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="13288230"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="13288230"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 09:42:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="927555540"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="927555540"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 09:42:31 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 5/5] drm/xe: Enable 32bits build
Date: Tue, 16 Jan 2024 09:40:50 -0800
Message-Id: <20240116174050.2435923-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116174050.2435923-1-lucas.demarchi@intel.com>
References: <20240116174050.2435923-1-lucas.demarchi@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Now that all the issues with 32bits are fixed, enable it again.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 1b57ae38210d..1b0ef91a5d2c 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_XE
 	tristate "Intel Xe Graphics"
-	depends on DRM && PCI && MMU && (m || (y && KUNIT=y)) && 64BIT
+	depends on DRM && PCI && MMU && (m || (y && KUNIT=y))
 	select INTERVAL_TREE
 	# we need shmfs for the swappable backing store, and in particular
 	# the shmem_readpage() which depends upon tmpfs
-- 
2.40.1

