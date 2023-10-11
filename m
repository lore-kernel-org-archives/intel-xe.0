Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2024DCD6E7E
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 15:45:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C95EB10E959;
	Wed, 11 Oct 2023 15:45:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0393C10E510
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 15:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697039143; x=1728575143;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2sbK988jMHAtpWyDuQUgEo6JWY6/slCZDcD1Qx/wRcM=;
 b=YZh6mm06lmQGBTm4J/zsw8/Ef95oBiCE0iKukqFx+Sak9RsZhPh6nXbi
 lEaCCDtEF9/nuFDFaX7SVkDhPt59PJx6rPJSfNdd8+8DncKKemtZu4PMS
 D7SD2rsGQ4EYNqdHMrIt36wK91RbHcbSqBwIlx0440qDDhAwut0jMeHs/
 ut5O51e26PkPLAC7cIeyaa6nlau/mPQDjfW1Q19KbDX74sQoZBiRQ9VIY
 nXOqDwMneAB+MOa4UCTQ1Ow5bWYdOupMh434a++7VOHxhed7HhDFgmvc0
 3/+7PW+88Ft4hHcBgkYKWTAB9fF0T2eNv896lmpNoYElS2ZXquU6SGyPq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="451189371"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="451189371"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 08:45:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="730543666"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="730543666"
Received: from shekharc-desk.iind.intel.com ([10.190.239.54])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 08:45:34 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 11 Oct 2023 21:15:26 +0530
Message-Id: <20231011154526.2819754-1-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/dg2: Remove one PCI ID
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

The bspec was recently updated to remove PCI ID
0x5698; this ID is actually reserved for future
use and should not be treated as DG2-G11.

BSpec: 44477
Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 include/drm/xe_pciids.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
index 29f07a00ac0f..b19478a58694 100644
--- a/include/drm/xe_pciids.h
+++ b/include/drm/xe_pciids.h
@@ -134,7 +134,6 @@
 	MACRO__(0x5693, ## __VA_ARGS__),	\
 	MACRO__(0x5694, ## __VA_ARGS__),	\
 	MACRO__(0x5695, ## __VA_ARGS__),	\
-	MACRO__(0x5698, ## __VA_ARGS__),	\
 	MACRO__(0x56A5, ## __VA_ARGS__),	\
 	MACRO__(0x56A6, ## __VA_ARGS__),	\
 	MACRO__(0x56B0, ## __VA_ARGS__),	\
-- 
2.34.1

