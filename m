Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7488AEEB59D
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 11:57:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 380E110EB57;
	Thu, 12 Sep 2024 11:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iPlUIzGF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D2DB10EB57
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 11:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726142261; x=1757678261;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=01l6fcpz1v1SzaZVL88oCKA0nKIt8H/gpRvY03chk5E=;
 b=iPlUIzGFesQ/uQ0iY/LJt5o7fjb43OC5+lgJhJKNL0gkiafLCkZMqx4L
 dfJ3A2AOZxeCVlyCjPy2R0a5dfDPYDNFu9V/XfFl9K72DUhk9HRf3d3UR
 ITcV3Dm7Poj04N1SuPfZX7rgHmbUzBv526S3kmMmYxS5xbLehR8RAk8VF
 GOpWoGplc1MB6GcYEoikCP7df/4Q6mPMRqrToPK7VVNKVEl0fFq1BYqsb
 l8LX7VNLuQ/RjZYUNWGyOULYOu2I36KwPIIei+DX9e/xmz+V2NAajrBFE
 3YGdPo3AqD2zTDvB7mVpXS0APVZxPX2PQPSPL3+YliDmU3E6AFJWeLz7R w==;
X-CSE-ConnectionGUID: UVdGFVqJTD6nPl5AvBMhrg==
X-CSE-MsgGUID: 8CwEbnGeRlOfDAquQpjOSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="50405238"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="50405238"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 04:57:40 -0700
X-CSE-ConnectionGUID: CXfYg/t+Rj+uHL28FWnlVQ==
X-CSE-MsgGUID: YvWZnwWSQh20EQdpeNn2Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="67977304"
Received: from pltuser2-ms-7d25.iind.intel.com ([10.190.239.58])
 by orviesa006.jf.intel.com with ESMTP; 12 Sep 2024 04:57:38 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [v2] drm/xe/pciid: Add new PCI id for ARL
Date: Thu, 12 Sep 2024 17:29:06 +0530
Message-Id: <20240912115906.2730577-1-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add new PCI id for ARL platform.

v2: Fix typo in PCI id (SaiTeja)

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 include/drm/intel/xe_pciids.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/drm/intel/xe_pciids.h b/include/drm/intel/xe_pciids.h
index 79001afa7d27d..b733555258b13 100644
--- a/include/drm/intel/xe_pciids.h
+++ b/include/drm/intel/xe_pciids.h
@@ -181,7 +181,8 @@
 	MACRO__(0x7D41, ## __VA_ARGS__),	\
 	MACRO__(0x7D51, ## __VA_ARGS__),        \
 	MACRO__(0x7D67, ## __VA_ARGS__),	\
-	MACRO__(0x7DD1, ## __VA_ARGS__)
+	MACRO__(0x7DD1, ## __VA_ARGS__),	\
+	MACRO__(0xB640, ## __VA_ARGS__)
 
 /* MTL */
 #define XE_MTL_IDS(MACRO__, ...)		\
-- 
2.34.1

