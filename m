Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56673C83F03
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 19:27:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C17710E8DB;
	Thu,  3 Jul 2025 19:27:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jOFYgMlT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335F410E8DB;
 Thu,  3 Jul 2025 19:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751570832; x=1783106832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/UhG+PrAWuDRKhnrnXNOPvjeJ896dmbS6DO0ehBJdK0=;
 b=jOFYgMlT3mfdL+Tje39jqaac0hvoykRrAZ0pIJZ6DD4p8txTTVDDZD4X
 iByLwqQ81EcQHIT5njOXfKipAFl4eJ4saw2Dl4MWPWI4zz2fiFsb5H5Sg
 BlTQhGupAkkwtt/V0JUtQwlSrwNa9zz5Is2iamAvwBuEMExh3kTeCU+cq
 a5x8XbTJ4Q0/XxUArc7LKfowjBuYISPtZGNC+Q5uass2N5spjnudc1fdG
 mDIaUZKJSwdDPRUgeAmR6m0mbXlbx/XZIOTHG/9feUBcmtKoixtUok3Pn
 iCIyWJJVQJFH1OzgkAJPDirk5fiTkhyky0aQkSFwtVj3OdmM0wj4fqI/o w==;
X-CSE-ConnectionGUID: JAJAFG5lSAOhYHWOOAnNUA==
X-CSE-MsgGUID: sGkqvAApTEuo38rQrMY1cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="65362031"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="65362031"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 12:27:12 -0700
X-CSE-ConnectionGUID: 8IbSuC9IQ2COae91Y/TvkQ==
X-CSE-MsgGUID: IXhIDOK1QX6M7FHkEc6tAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="191624698"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 12:27:10 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com
Subject: [PATCH v6 10/10] drm/xe/xe_late_bind_fw: Select INTEL_MEI_LATE_BIND
 for CI
Date: Fri,  4 Jul 2025 01:01:06 +0530
Message-Id: <20250703193106.954536-11-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250703193106.954536-1-badal.nilawar@intel.com>
References: <20250703193106.954536-1-badal.nilawar@intel.com>
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

Do not review

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index f66e6d39e319..ef3f4807b0b3 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -45,6 +45,7 @@ config DRM_XE
 	select WANT_DEV_COREDUMP
 	select AUXILIARY_BUS
 	select HMM_MIRROR
+	select INTEL_MEI_LATE_BIND
 	help
 	  Driver for Intel Xe2 series GPUs and later. Experimental support
 	  for Xe series is also available.
-- 
2.34.1

