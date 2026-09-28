Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF1CCA5FA3
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 09:24:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B4610E909;
	Mon, 28 Sep 2026 09:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SdwuvokE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D4810E6AC
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 09:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790587445; x=1822123445;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4LdNdz+e4a6oAZwMcVUuN/GmL00ZMYQ4USip7iKhvfE=;
 b=SdwuvokETreAGvz1/JSTam4JdoJfDsha+/Z6kwecP7fBgXLvOhRxmdEi
 m1dy6fdsfIjuG3EDwmPGmUR04p12MUGrfiMMvnbnRMYRhp/Fe4L0ZH8nt
 znYQ53QQJEGVDfsrsLoquUs8RFOZCZO3LuQmgGaJK8i5v8R5+IfchN00K
 1uFSGhi54S7F/DxyjHSpfPHHqD5UIXUbHm9M2XGr66DrGmrzUGqpfiZLa
 9H4QUzujfrG8pZ+V+m/vPxMnHscpGnWs/0vNBjVuZ7yJGz0B1Nf4kru0G
 jUy7hJ/mSWczHMzO3i0usnsGcV2YoXSz1rzSZGXOFskz+yK7iQMDAMZnz A==;
X-CSE-ConnectionGUID: xjkRWWiTSYSJYCzGrl4WUw==
X-CSE-MsgGUID: 1w06HaGgQ160gD7VKRcW+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="78845442"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="78845442"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 02:22:19 -0700
X-CSE-ConnectionGUID: qOPudQAhRBKiqwt685ch3g==
X-CSE-MsgGUID: 4A99wR7BQuWBn1fjT3CIDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="283077994"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa005.fm.intel.com with ESMTP; 28 Sep 2026 02:21:18 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v4 01/12] drm/xe/log: Add VRAM, PAT,
 and HWMON DRIVER_HARDWARE components
Date: Mon, 28 Sep 2026 14:51:03 +0530
Message-ID: <20260928092114.1610203-2-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260928092114.1610203-1-dnyaneshwar.bhadane@intel.com>
References: <20260928092114.1610203-1-dnyaneshwar.bhadane@intel.com>
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

  - VRAM (ID 6): Virtual RAM access and BAR visibility errors
  - PAT (ID 7): Page Attribute Table programming errors
  - HWMON (ID 8): Hardware monitor registration and sensor errors

All three use IO_BUS as their default SIGID since they interact with
hardware through MMIO or PCode register paths.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/abi/xe_log_abi.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/xe_log_abi.h b/drivers/gpu/drm/xe/abi/xe_log_abi.h
index 526aadf85fe9..69d9671a3798 100644
--- a/drivers/gpu/drm/xe/abi/xe_log_abi.h
+++ b/drivers/gpu/drm/xe/abi/xe_log_abi.h
@@ -151,6 +151,9 @@ enum xe_log_location_bits {
 	define(DRIVER_HARDWARE, 3, GT, GT_TDR, "Graphics Technology")		\
 	define(DRIVER_HARDWARE, 4, LMTT, IO_BUS, "LMEM Translation Table")	\
 	define(DRIVER_HARDWARE, 5, MEMIRQ, IO_BUS, "Memory Based IRQ")		\
+	define(DRIVER_HARDWARE, 6, VRAM, IO_BUS, "Virtual RAM")			\
+	define(DRIVER_HARDWARE, 7, PAT, IO_BUS, "Page Attribute Table")		\
+	define(DRIVER_HARDWARE, 8, HWMON, IO_BUS, "Hardware Monitoring")	\
 	/* */									\
 	define(DRIVER_FEATURE, 1, PF, SW, "SR-IOV Physical Function")		\
 	define(DRIVER_FEATURE, 2, VF, SW, "SR-IOV Virtual Function")		\
-- 
2.54.0

