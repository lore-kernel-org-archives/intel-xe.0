Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54864C3601A
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 17:48:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1257D10EA3F;
	Thu,  3 Apr 2025 17:48:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J6+lqy6i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9483510EA4F
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 17:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743702506; x=1775238506;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1St3zpU+LvxoBkftwqFwfQpwQw9bvmRTca13K2HDMNw=;
 b=J6+lqy6ivF2loJXyHCeWgOrzvwf+3N3wDyR0i9zRZMDBY9htqj5GXoDR
 f+8JY/fosp95Ht9/lEXDPjevPfrLprcsqzdyxG1rKSUiRQSegVKQXGfuw
 SO1EKDvGQp/PlRtLin5GorJVfZTN9RRr9d3eM8VBUZI6TY0xX61KHlJdc
 84UjJ70mZ2Ms+rjI/njyx8GGdtfVewkqigJyoLVkxljNk6AvMuDq9D/xa
 keGx1igsHmUDdVAkEz4FHXyzjY4ETZrrG90oDJux2X8l00dI7/dtZ6TUV
 hslgQibf/pQDgMftvVfrRsSA2kYw+rUhxQL9R9a1AS5ySKcOpxs/Wb8jQ A==;
X-CSE-ConnectionGUID: dBIsFaM6Qv2gLZj1GYGUig==
X-CSE-MsgGUID: sD39Z/PdQgKMFCSkLbN8fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55758458"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="55758458"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 10:48:26 -0700
X-CSE-ConnectionGUID: CMa9hpxLQSiCwAnkC4QIdA==
X-CSE-MsgGUID: u2alPvlBTkiCY2+nUDKBLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="132201598"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa004.fm.intel.com with ESMTP; 03 Apr 2025 10:48:25 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 3/3] drm/xe/doc: Wire up PCIe Gen5 update limitations
Date: Thu,  3 Apr 2025 23:17:42 +0530
Message-Id: <20250403174742.1294227-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250403174742.1294227-1-raag.jadav@intel.com>
References: <20250403174742.1294227-1-raag.jadav@intel.com>
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

Append PCIe Gen5 update limitations to xe_firmware document.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 Documentation/gpu/xe/xe_firmware.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/gpu/xe/xe_firmware.rst b/Documentation/gpu/xe/xe_firmware.rst
index afcb561cd37d..14179055404a 100644
--- a/Documentation/gpu/xe/xe_firmware.rst
+++ b/Documentation/gpu/xe/xe_firmware.rst
@@ -31,6 +31,12 @@ GuC Power Conservation (PC)
 .. kernel-doc:: drivers/gpu/drm/xe/xe_guc_pc.c
    :doc: GuC Power Conservation (PC)
 
+PCIe Gen5 Update Limitations
+============================
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_device_sysfs.c
+   :doc: PCIe Gen5 Update Limitations
+
 Internal API
 ============
 
-- 
2.34.1

