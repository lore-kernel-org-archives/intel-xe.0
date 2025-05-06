Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A02C3ABBE
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 05:50:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56DDC10E1BD;
	Tue,  6 May 2025 05:50:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V1i54Hmu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052EB10E4F6
 for <intel-xe@lists.freedesktop.org>; Tue,  6 May 2025 05:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746510621; x=1778046621;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bF8P3m+i1SCjT5PpWoigWBuRvnr+VbHLtYVNJRDsmu8=;
 b=V1i54Hmu7s/Z5M27p+lgfsvAlfD2yQ8lLifnKWHDcINny7p57LtsfvQZ
 80iHihhP0i4Jnn2z/ukE+5Z3zqow9WBVD44MZTWIg4XIqPdGYT0DCvtLQ
 yxNotZyIh4Eyvb68umWSAfGyErDeX1ecaEfciea3enAO/hnTP3b1Zo03I
 OZodVydSr7IkUTPDYTM7c7jcxei9HO4HEk1X0NqrJf3imd+S6LI1UWcuj
 FKInk8uYWzr7Ox9Rg6fGlbzkLGIBGUi45MPGdql9sS9sL713+iKNlfkIx
 EH2oY6juzsR6flPvvLM7IhNkhDaxjJ0jqj6ZDZjF7xUbG1n2pF/TUoOyx A==;
X-CSE-ConnectionGUID: ky/0YfL3S/Soe06pDR0uDg==
X-CSE-MsgGUID: kIG0p7QeRkC/Nad1LtW3Zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="48029021"
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; d="scan'208";a="48029021"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 22:50:21 -0700
X-CSE-ConnectionGUID: 239M83wKRsO2R8VN7/YMkg==
X-CSE-MsgGUID: kPu3L+QcRKmP3t7YPnWwqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; d="scan'208";a="136473455"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa009.fm.intel.com with ESMTP; 05 May 2025 22:50:19 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v7 3/3] drm/xe/doc: Wire up PCIe Gen5 limitations
Date: Tue,  6 May 2025 11:18:35 +0530
Message-Id: <20250506054835.3395220-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250506054835.3395220-1-raag.jadav@intel.com>
References: <20250506054835.3395220-1-raag.jadav@intel.com>
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

