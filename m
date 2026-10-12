Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97315CA9ED5
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 05:19:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 532C210E811;
	Mon, 12 Oct 2026 05:19:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8DC610E118
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 05:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791782366; x=1823318366;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vDUmv4tIyO2HAdjTNA1ZKs0GweTOcUCU2RQOMPFFbyM=;
 b=PVx+c37mpIF+9gFvtfw5X/dFMEe/O1Pkm4LokQUIOw6opw6WYQLoDrqd
 IS7D8rVUSbStbCYhc2NwyBSV4N1ESclaR4DsL0iZ2wQaCqM6kghNEFU51
 5Cgd1ibwNmpMJNWuwETecog+iYDxFL8Yz7UWqtmOvjIgCNzRA8Qljb6Xy
 Vp93P3YF6+BULcWax90uSUfxZCpCL190jfACnKmuHbhCCSdScAusu+LWM
 fAdekowBDS6gRlz5jZnIL3V9M4hm+o3ttunUB7y2A2G63L6lKmvpX0Lbk
 Y50+fhbF1rQjPXiNTYuq2A3XZoHT/pgjxykCfaVD4P5cG5vop31zPkli4 Q==;
X-CSE-ConnectionGUID: WgIwMAlpQbSRi64y1RR4rA==
X-CSE-MsgGUID: O1R5dY7GRVuyqP6sQjz79A==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="390500"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="390500"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 22:18:31 -0700
X-CSE-ConnectionGUID: PuWbJdC4StC1FJ7+F6rSrQ==
X-CSE-MsgGUID: u5tjOO4iTUqS8eyrEhj+gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="735800"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa009.jf.intel.com with ESMTP; 11 Oct 2026 22:18:30 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v6 01/12] drm/xe/log: Add VRAM, PAT,
 and HWMON DRIVER_HARDWARE components
Date: Mon, 12 Oct 2026 10:48:12 +0530
Message-ID: <20261012051823.2201360-2-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261012051823.2201360-1-dnyaneshwar.bhadane@intel.com>
References: <20261012051823.2201360-1-dnyaneshwar.bhadane@intel.com>
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

