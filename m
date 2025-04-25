Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45F9C369D7
	for <intel-xe@archiver.kernel.org>; Fri, 25 Apr 2025 14:07:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 894F310E2FB;
	Fri, 25 Apr 2025 14:07:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DQX1UGzQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B41C10E2EE
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Apr 2025 14:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745590067; x=1777126067;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bF8P3m+i1SCjT5PpWoigWBuRvnr+VbHLtYVNJRDsmu8=;
 b=DQX1UGzQlc6k0VwJ5/1hH5pdK+VwKr01ZGHOl/qlRiO5APbPftg4BfGy
 2broSbNuxMskpNr++PHn1FQPfmL9ZPArFvrWc6eq4kd89GY+gdQQxRuRq
 VP6ikowGfiO2o6ahsEmBvj+06ms+D3dfjz2iEq3VCvKPvagKd5T0818r4
 S3NvZlwQ8Eehu5de7WgZ5ewJBadqH2mGuF/P5/VCRf0P5YWs0JJg/TbBJ
 LwIGfTxK6puk69FOpdrwIZ5XM9hQtaZRGcD0t4tleai6qv+vVoLgewexs
 8GSU8KEvp0REqBO3J5SXkIf/16041N+8chf95Lczgtro+pFYFwUQjKTdJ A==;
X-CSE-ConnectionGUID: NlBr6HdAQtyGb65QhZeHnw==
X-CSE-MsgGUID: y83qO/mFQ4Cf7a/g8LHpMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="47345505"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="47345505"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 07:07:47 -0700
X-CSE-ConnectionGUID: k4lAmOy8REq9/8XoVOXlBg==
X-CSE-MsgGUID: vekcEF4uTYmCxs7TLvYChg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="132900207"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa007.fm.intel.com with ESMTP; 25 Apr 2025 07:07:45 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v4 3/3] drm/xe/doc: Wire up PCIe Gen5 limitations
Date: Fri, 25 Apr 2025 19:36:26 +0530
Message-Id: <20250425140626.3082588-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250425140626.3082588-1-raag.jadav@intel.com>
References: <20250425140626.3082588-1-raag.jadav@intel.com>
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

