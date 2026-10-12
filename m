Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6123CCA9ED0
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 12:25:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C94510F06F;
	Mon, 12 Oct 2026 12:25:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A69B10EF66
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 12:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791807926; x=1823343926;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vDUmv4tIyO2HAdjTNA1ZKs0GweTOcUCU2RQOMPFFbyM=;
 b=PohvU3BcjGxEmDMxTGDW7cxchA64B5l7AeAjTrKlJHgpBJHz1RSwVcKC
 y1iKqgcM74RFf1rFC84CuG2qwFETJJt0MqznIJUuZeOi8HXv+0v4Q31cT
 3dnowNWZ9fSy7mjPFslP0LS+1n9BDYPro52nwPhFPEr8B5UJlvMyZs8V4
 PYnvDCV/r+NFMeIU8fSMV0l9nLEIHXje7zDo6qsOVLQ4WyFPWc9EWp5eV
 S5F7LgJEyAlRc6HYM5z1YeQRFsJAHyrooL9dOrhIp/L1CZ1M407j7c8Pr
 rF82WAZNoVyEuGfAeJsBVkwcnhaOVGUKYR6Vygk1FwsZE92oZsIqM5/JS w==;
X-CSE-ConnectionGUID: pPSl14ecSSG76GaLnnXnDw==
X-CSE-MsgGUID: 2ixBksVASJewfTEocjY5Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="522898"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="522898"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 05:25:26 -0700
X-CSE-ConnectionGUID: UtDm5wJjSQSTggtvNOSsbQ==
X-CSE-MsgGUID: DxEfr/H/Siqxk2WkHR9KAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="962778"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa004.fm.intel.com with ESMTP; 12 Oct 2026 05:25:25 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v7 01/12] drm/xe/log: Add VRAM, PAT,
 and HWMON DRIVER_HARDWARE components
Date: Mon, 12 Oct 2026 17:55:10 +0530
Message-ID: <20261012122522.2307625-2-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261012122522.2307625-1-dnyaneshwar.bhadane@intel.com>
References: <20261012122522.2307625-1-dnyaneshwar.bhadane@intel.com>
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

Register new DRIVER_HARDWARE log components for hardware I/O subsystems
that currently lack structured error reporting:

  - VRAM (ID 6): Video RAM/Local Memory access and BAR visibility errors
  - PAT (ID 7): Page Attribute Table programming errors
  - HWMON (ID 8): Hardware monitor registration and sensor errors

All three use IO_BUS as their default SIGID since they interact with
hardware through MMIO or PCode register paths.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2:
- Added Video RAM/Local Memory Name(Mallesh)
---
 drivers/gpu/drm/xe/abi/xe_log_abi.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/xe_log_abi.h b/drivers/gpu/drm/xe/abi/xe_log_abi.h
index 526aadf85fe9..d7bd85ea9673 100644
--- a/drivers/gpu/drm/xe/abi/xe_log_abi.h
+++ b/drivers/gpu/drm/xe/abi/xe_log_abi.h
@@ -151,6 +151,9 @@ enum xe_log_location_bits {
 	define(DRIVER_HARDWARE, 3, GT, GT_TDR, "Graphics Technology")		\
 	define(DRIVER_HARDWARE, 4, LMTT, IO_BUS, "LMEM Translation Table")	\
 	define(DRIVER_HARDWARE, 5, MEMIRQ, IO_BUS, "Memory Based IRQ")		\
+	define(DRIVER_HARDWARE, 6, VRAM, IO_BUS, "Video Memory/Local Memory")	\
+	define(DRIVER_HARDWARE, 7, PAT, IO_BUS, "Page Attribute Table")		\
+	define(DRIVER_HARDWARE, 8, HWMON, IO_BUS, "Hardware Monitoring")	\
 	/* */									\
 	define(DRIVER_FEATURE, 1, PF, SW, "SR-IOV Physical Function")		\
 	define(DRIVER_FEATURE, 2, VF, SW, "SR-IOV Virtual Function")		\
-- 
2.54.0

