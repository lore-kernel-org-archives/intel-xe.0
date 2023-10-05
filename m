Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A6AEE8FDC3
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 09:57:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B3610E036;
	Thu,  5 Oct 2023 09:57:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D1210E036
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 09:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696499859; x=1728035859;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SPYjhBrt/Gs1QX3uWBK5qD+MTZVdKKK1osAs8y1/QS0=;
 b=V1hgE6cl47sNk/aeMTpr3eY5uUPKk+zwB0jM99ZiXrLuklIJxB/3r+ya
 kgNEkXiSVNfFJOkpyU24Ry7oE5FY9trnd8vEs9jD/DGIed0/s6EmmiK2e
 HpEWnGg3xcMQ/VCZEY3RcCBHww2c/wDAW0rO1Rg2boN/05QK+es4EhhfG
 R87+4UbP/UAkS6RMzBEscH2E71rYwL3u0O7PMZa4V2F2UdzNqYhWoaPyC
 Dn7qvKiewdal7JD2DvbXcnrPWySk5H6om7DPg50vv48erL4kkhPRDSEU+
 YHITcvp7jHRhfmLBcfA49m+5T8Xvl6dwdH8VRiWASjvjAuv4IGYocO3/S Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="382325709"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; d="scan'208";a="382325709"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 02:57:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="842326090"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; d="scan'208";a="842326090"
Received: from cprunax-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.252.42.69])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 02:57:36 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  5 Oct 2023 09:57:29 +0000
Message-Id: <20231005095729.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/hw_engine: Document difference between
 instance and logical instance
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
Cc: Francois Dugast <francois.dugast@intel.com>, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add explanation provided by Matt next to the definition, so that
it can easily found later.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_types.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index 5d4ee2904240..aa8b5a2165c5 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -114,7 +114,13 @@ struct xe_hw_engine {
 	enum xe_engine_class class;
 	/** @instance: physical instance of this hw engine */
 	u16 instance;
-	/** @logical_instance: logical instance of this hw engine */
+	/**
+	 * @logical_instance: logical instance of this hw engine. This is
+	 * different from @instance because there can be gaps in physical
+	 * engines. For example on TGL VCS0 and CVS2 map to logical
+	 * instances 0 and 1. Only logical instances should be exposed to
+	 * user space.
+	 */
 	u16 logical_instance;
 	/** @mmio_base: MMIO base address of this hw engine*/
 	u32 mmio_base;
-- 
2.34.1

