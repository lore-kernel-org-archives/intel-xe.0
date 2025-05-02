Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0788C3ABAC
	for <intel-xe@archiver.kernel.org>; Fri,  2 May 2025 18:39:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A742510E1B8;
	Fri,  2 May 2025 18:39:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dbq8uF5E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2137410E1B8
 for <intel-xe@lists.freedesktop.org>; Fri,  2 May 2025 18:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746211149; x=1777747149;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bF8P3m+i1SCjT5PpWoigWBuRvnr+VbHLtYVNJRDsmu8=;
 b=dbq8uF5E/nVgtWsR3rIFKi+EosYkYYUV7MxGU+2R4750BDCuJ6GsRiIm
 DksbdocwEF1CMzzrZrlmwQdiyLr8zam64W+G/K08DJswjvkEXSe8c86OG
 6d5QPZHqgHoNV3+VuYGCjmLPCusYdPrwRfuX4HBQOzsNmuz0VKed08SEi
 /pEjl6F/2vFmToRAa5yEJUpo3mC20/K6t0A9919fFcMHZqGyCDPkCaEOJ
 WqJIznAxNu2nPdsMIOjeeiRUa3RtUs1lkDWmg6+ofafKgL6Vk1wJ8zUcJ
 ITRX7H/tyOdG+vJm3f/YKGAeBjaBQg95fx2nHb4kXOo5LoaMWFFjppPaw w==;
X-CSE-ConnectionGUID: 4T9aLvWMQZ+NidaC6RbKWQ==
X-CSE-MsgGUID: vnprKhagR0esfhI6u1uziw==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="65306299"
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; d="scan'208";a="65306299"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 11:39:09 -0700
X-CSE-ConnectionGUID: ZDsAqS0hSGCzNeTsvw6MdA==
X-CSE-MsgGUID: iIvurGgGQ/O4T6O2968stg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; d="scan'208";a="139874046"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa005.jf.intel.com with ESMTP; 02 May 2025 11:39:07 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v6 3/3] drm/xe/doc: Wire up PCIe Gen5 limitations
Date: Sat,  3 May 2025 00:07:39 +0530
Message-Id: <20250502183739.3308069-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250502183739.3308069-1-raag.jadav@intel.com>
References: <20250502183739.3308069-1-raag.jadav@intel.com>
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

Append PCIe Gen5 limitations to xe_firmware document.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 Documentation/gpu/xe/xe_firmware.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/gpu/xe/xe_firmware.rst b/Documentation/gpu/xe/xe_firmware.rst
index afcb561cd37d..5d23e9f27391 100644
--- a/Documentation/gpu/xe/xe_firmware.rst
+++ b/Documentation/gpu/xe/xe_firmware.rst
@@ -31,6 +31,12 @@ GuC Power Conservation (PC)
 .. kernel-doc:: drivers/gpu/drm/xe/xe_guc_pc.c
    :doc: GuC Power Conservation (PC)
 
+PCIe Gen5 Limitations
+=====================
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_device_sysfs.c
+   :doc: PCIe Gen5 Limitations
+
 Internal API
 ============
 
-- 
2.34.1

