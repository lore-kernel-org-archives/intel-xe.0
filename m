Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653D4C369CB
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 11:14:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 299D810EABD;
	Thu, 17 Apr 2025 11:14:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FYyCDEI9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DC810EABC
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Apr 2025 11:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744888443; x=1776424443;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1St3zpU+LvxoBkftwqFwfQpwQw9bvmRTca13K2HDMNw=;
 b=FYyCDEI9rP/N8HTdFByxAAaUCHXOyqMgNZ9b6tEWZ7N5ILAw+AGCmIJ2
 1BZn2xY3zX55henRZlG+L4nQn5j4EYgfve/b3BtNvB5VtyyusPBfWoqnR
 jaxIMhqxFp8cU5UcC2RgAgjyf9QFuCczEWOdZ7l59AGIqsCN/HBx7D5+K
 D7op2JDvB6yFldwuK3MMY75stEQMS3OKRwKGTu+GEuxHylLNQ9QxjFZko
 /rwraFz7UkYGG4uzZQ7uUC/nym213FvtAddp4q0CGRR2C48/EGSEA7w6O
 yIwT6kay/VI1BI1mJa8FmwOVsv7Mb0M92CWUyglrEUSLooODAxojr69YZ Q==;
X-CSE-ConnectionGUID: Vjd2CWdKRSudZZ5Ztz5zCg==
X-CSE-MsgGUID: LBhbNZhLSiWGK30KmD1O1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="50279561"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="50279561"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 04:14:02 -0700
X-CSE-ConnectionGUID: l8cTdtIJRVGTkgKWdtjhaw==
X-CSE-MsgGUID: qnXvtgXvTCmnMZr/nfxyIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="130764099"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa007.fm.intel.com with ESMTP; 17 Apr 2025 04:14:00 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 3/3] drm/xe/doc: Wire up PCIe Gen5 update limitations
Date: Thu, 17 Apr 2025 16:42:33 +0530
Message-Id: <20250417111233.2322000-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417111233.2322000-1-raag.jadav@intel.com>
References: <20250417111233.2322000-1-raag.jadav@intel.com>
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

