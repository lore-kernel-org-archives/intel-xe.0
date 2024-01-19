Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BD3C47422
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 00:16:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF42310E951;
	Fri, 19 Jan 2024 00:16:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 592A010E949
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jan 2024 00:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705623368; x=1737159368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2Px7UqbQUr8y8PUIrx1/T2aQPQI9UX8DtOjPeYYWHOI=;
 b=ZixOsX07ytIdiBcb+nseaTd9fCZrrabXo5FjS5/yVRmALAjc2wtNH18y
 hjayy1HVY4XSRJxqXgR5m1ejRs1ARRQG5ndy5cccMqSpwBWXLPTJr5gSL
 8X/a9d19IShWQOLbd17zPasw4NBoNxUdKfWCHs8L1GFWTwNuo7CL6ArNw
 4NriaRvsFrdGSeoqtSacSDOMUm6ZHq0NapbfzCOzaDG3AIUi29bB8MLUC
 LVdYJMA9btZ+umJa2z0Wtt9qK/Tis16x7ZOzexlBCWJEqA4kzrUdOzBXF
 lEPETCCazuJTqHgIUwBaoPaVjITiGFzbZHIB8Z5ZYsDYk4vYmq4baEpUE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="404373186"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="404373186"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 16:16:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="818924000"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="818924000"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 16:16:05 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 5/5] drm/xe: Enable 32bits build
Date: Thu, 18 Jan 2024 16:16:12 -0800
Message-Id: <20240119001612.2991381-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240119001612.2991381-1-lucas.demarchi@intel.com>
References: <20240119001612.2991381-1-lucas.demarchi@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Now that all the issues with 32bits are fixed, enable it again.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
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

