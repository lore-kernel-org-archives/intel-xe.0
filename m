Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823D1C5DF81
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 19:14:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43CB210EEA1;
	Wed, 19 Aug 2026 19:14:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n6hue5n3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D0F10EEA1
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 19:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787166888; x=1818702888;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ofU5lhE8ec3nR2z+haLwN8PAZlLxJ1Vp7J/nYkko9/0=;
 b=n6hue5n3xhMvBULDOXAF2kxC5QEOQcgGENAxdNH8FCg0MB7LXorfSqU2
 /JGdYkXj0IEoxUAy93sQW/gV4UWdWeAND1tfD7gJPHC4JA5rI6dwofHlm
 0Xurywp+73LsCQRN85UVoTsPCSLDFlxneik7D8UYqTwQH0XglOiK3a7vV
 bmuyRp8OsnK0t/sW2uO1bCIe2vqBr5fwIeGt033CL75hXmy2P2zign6fg
 HhroFaXR5ke+s/sF1hXvU3wOX/mCKf5SQnnB4eapo25t4EhLGvsPHHgP9
 /BLR1QT0APw1FYBYsEna0+9MUthJL1DYJqm4DYvzFDEsLIgZXXuxYu+gw g==;
X-CSE-ConnectionGUID: IDNrjGUKQseIn95ELEheIw==
X-CSE-MsgGUID: +0vs54ooSA+o3Q+e1G89Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="86647279"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="86647279"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 12:14:47 -0700
X-CSE-ConnectionGUID: 2MGwRQaWT7K14LV4O4Npsw==
X-CSE-MsgGUID: esyOzKrtSzST585mKn1uVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="295556687"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa002.jf.intel.com with ESMTP; 19 Aug 2026 12:14:46 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com, michal.wajdeczko@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH 01/12] drm/xe/log: Add VRAM, PAT,
 and HWMON DRIVER_HARDWARE components
Date: Thu, 20 Aug 2026 00:44:30 +0530
Message-ID: <20260819191442.1957986-2-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
References: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
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

  - VRAM (ID 6): Video RAM access and BAR visibility errors
  - PAT (ID 7): Page Attribute Table programming errors
  - HWMON (ID 8): Hardware monitor registration and sensor errors

All three use IO_BUS as their default SIGID since they interact with
hardware through MMIO or PCode register paths.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/xe/abi/xe_log_abi.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/xe_log_abi.h b/drivers/gpu/drm/xe/abi/xe_log_abi.h
index d6105520173e..b726cd8d6892 100644
--- a/drivers/gpu/drm/xe/abi/xe_log_abi.h
+++ b/drivers/gpu/drm/xe/abi/xe_log_abi.h
@@ -150,6 +150,9 @@ enum xe_log_location_bits {
 	define(DRIVER_HARDWARE, 3, GT, GT_TDR, "Graphics Technology")		\
 	define(DRIVER_HARDWARE, 4, LMTT, IO_BUS, "LMEM Translation Table")	\
 	define(DRIVER_HARDWARE, 5, MEMIRQ, IO_BUS, "Memory Based IRQ")		\
+	define(DRIVER_HARDWARE, 6, VRAM, IO_BUS, "VRAM")			\
+	define(DRIVER_HARDWARE, 7, PAT, IO_BUS, "Page Attribute Table")		\
+	define(DRIVER_HARDWARE, 8, HWMON, IO_BUS, "Hardware Monitoring")	\
 	/* */									\
 	define(DRIVER_FEATURE, 1, PF, SW, "SR-IOV Physical Function")		\
 	define(DRIVER_FEATURE, 2, VF, SW, "SR-IOV Virtual Function")		\
-- 
2.54.0

