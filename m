Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88717C79FAD
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:45:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E35710EB1B;
	Tue,  8 Sep 2026 10:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kk5DdcvB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2867610EB1B
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788864354; x=1820400354;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=so6Hlee5JY7+msfu7v2oqSNubkdspWRafkW2vQ0qzAE=;
 b=Kk5DdcvB/369ld0HvLfcFJ/TmDRQB4WZ/renMYoQv3+KaJk4FUec4n8m
 jsdQv6aMPdZD1c1ipF1EosLKqdDEcoyMIS09ph78gmYgFuyn3z0L1J5fh
 drOqW2PiK2Zynbn2uvYtBlCd4yTUZlFqixnhd87x16AyoNzGJGFnfKZkL
 K4+NzGFmEoHLrvbiTd0P7bnGoOQmTjCLN3nJqX8qmrMER7i7fFTvrj122
 X8aSQiHq5UhX2sHrVanF8Fc3mtnwAXG+33XSp1xnCv3vwjGE58AOsPwWl
 /FGfSK66/jgjbcncEYurAPr6mBZafWyYcyUql05y6qYMXpEyQqF0RtuIL w==;
X-CSE-ConnectionGUID: gsrz5mPqS/2uGbD+lIl7Qg==
X-CSE-MsgGUID: oRcj3JNnT9qUcX2QA7RKig==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="91773067"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="91773067"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:45:54 -0700
X-CSE-ConnectionGUID: wkb9pdceS7mwu/E4DbGavQ==
X-CSE-MsgGUID: b0Nl7Q6nSkewFGLTD2ZZmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="264759062"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa009.fm.intel.com with ESMTP; 08 Sep 2026 03:45:53 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v3 01/13] drm/xe/log: Add VRAM, PAT,
 and HWMON DRIVER_HARDWARE components
Date: Tue,  8 Sep 2026 16:15:38 +0530
Message-ID: <20260908104550.1283933-2-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260908104550.1283933-1-dnyaneshwar.bhadane@intel.com>
References: <20260908104550.1283933-1-dnyaneshwar.bhadane@intel.com>
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
---
 drivers/gpu/drm/xe/abi/xe_log_abi.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/xe_log_abi.h b/drivers/gpu/drm/xe/abi/xe_log_abi.h
index d6105520173e..4a60aa48fab1 100644
--- a/drivers/gpu/drm/xe/abi/xe_log_abi.h
+++ b/drivers/gpu/drm/xe/abi/xe_log_abi.h
@@ -150,6 +150,9 @@ enum xe_log_location_bits {
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

