Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC67C54E41
	for <intel-xe@archiver.kernel.org>; Thu, 29 Feb 2024 07:08:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D1010E14B;
	Thu, 29 Feb 2024 07:08:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cBMVMCv8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B72A10E14A
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Feb 2024 07:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709190485; x=1740726485;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8MF5ekKfTZ762U2whetgVWGH+l4s0t0O/CcEo0oiP2w=;
 b=cBMVMCv8e61ADQ4OQJFI5upL2gg/IsOiOn6SPd31AiOcoFMMYRq4l6qv
 7LPFRYtRRIzRcaViycAJ8RoZ+vAb+did/lvxVxajQV/UXtNQrCekDPf7V
 oZ29aHmxYCs1TWNWYI9jRfkMAQcfbxZ1T9drLPqm6kyN5Qfvo7iW2xXN1
 cO8sRx+KUW6l7fnKqB+HiLAALgrL8bziV0cmfed4XtcpBn2cr71E9WhRi
 fANr4+DrNbYrWipR2TYslDQ+rpyS5dk6yxuB4mXMzHMA33dLoAeFEQB/i
 mod7SNbGyxWLg4X1rCUr84BgsxRiZm2nPxDFcB1IIY95xloP+/9pNlsrb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="29073968"
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; d="scan'208";a="29073968"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 23:08:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="8149851"
Received: from pltuser2-ms-7d25.iind.intel.com ([10.190.239.58])
 by orviesa006.jf.intel.com with ESMTP; 28 Feb 2024 23:08:04 -0800
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH V3 3/3] drm/xe/arl: Add Arrow Lake H support
Date: Thu, 29 Feb 2024 12:38:06 +0530
Message-Id: <20240229070806.3402641-4-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240229070806.3402641-1-dnyaneshwar.bhadane@intel.com>
References: <20240229070806.3402641-1-dnyaneshwar.bhadane@intel.com>
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

v2: Resolve conflict and Reorder PCI ids in sorted order
v3: Append signed-off-by commiter to this commit

Bspec: 55420
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

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

