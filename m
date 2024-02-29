Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F91C54798
	for <intel-xe@archiver.kernel.org>; Thu, 29 Feb 2024 06:13:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FCD810E132;
	Thu, 29 Feb 2024 06:13:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H5HRrATD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75AEA10E13F
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Feb 2024 06:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709187213; x=1740723213;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kQ88m/xFwQs4nS/haXgpdisI3OfXg8yblPe4yPbWA1k=;
 b=H5HRrATDDAOGZ3e2yvsdqJmhvog/9UUcsQ0IlCF0lgA14neKosI+xXf7
 YcP0GlPkR9E6L0rXjoOUsz7omfrLZdaMP8tUqXhEUaF33n1ritF4IKxyK
 GDuTq7W2VKIDRekrp9QWRr+9twNyUepO2GZZpP43QMHNmupGFFaDqapNZ
 eXqrT8rbbl6PaWqsqVuTemq+HPw4nJ+gkuSfUp0e41p8cwY6uTDoRIz5Y
 ylfn+4ZKZ7NDfLLSUAL1HTudtcaQKX9QQJe2Il8MXjiC9ZnXfWlRZiFzm
 7JAIR8Ei0Zo+LaLml4SEcxpVQ3Jlk+F3SZTzocOfTL9tHS+BXPvKPdmUT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3802672"
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="3802672"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 22:13:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; d="scan'208";a="12400577"
Received: from pltuser2-ms-7d25.iind.intel.com ([10.190.239.58])
 by orviesa003.jf.intel.com with ESMTP; 28 Feb 2024 22:13:31 -0800
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH V2 3/3] drm/xe/arl: Add Arrow Lake H support
Date: Thu, 29 Feb 2024 11:43:31 +0530
Message-Id: <20240229061331.3398966-4-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240229061331.3398966-1-dnyaneshwar.bhadane@intel.com>
References: <20240229061331.3398966-1-dnyaneshwar.bhadane@intel.com>
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

ARL-H uses the same media and display IP as MTL, and a version 12.74
graphics IP (referred to as Xe_LPG+). From a driver point of view, we
should be able to just treat the whole platform as MTL and rely on
GRAPHICS_VERx100 checks to handle any spots where ARL's Xe_LPG+ needs
different handling from MTL's Xe_LPG (i.e., workarounds).

v2: Resolve confict and reorder PCI ids in sorted order

Bspec: 55420
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 include/drm/xe_pciids.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
index 2b7c2003ddb4..ab4a8987ac65 100644
--- a/include/drm/xe_pciids.h
+++ b/include/drm/xe_pciids.h
@@ -176,10 +176,13 @@
 /* MTL / ARL */
 #define XE_MTL_IDS(MACRO__, ...)		\
 	MACRO__(0x7D40, ## __VA_ARGS__),	\
+	MACRO__(0x7D41, ## __VA_ARGS__),	\
 	MACRO__(0x7D45, ## __VA_ARGS__),	\
+	MACRO__(0x7D51, ## __VA_ARGS__),        \
 	MACRO__(0x7D55, ## __VA_ARGS__),	\
 	MACRO__(0x7D60, ## __VA_ARGS__),	\
 	MACRO__(0x7D67, ## __VA_ARGS__),	\
+	MACRO__(0x7DD1, ## __VA_ARGS__),        \
 	MACRO__(0x7DD5, ## __VA_ARGS__)
 
 /* PVC */
-- 
2.34.1

