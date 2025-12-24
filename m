Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CC9E78487
	for <intel-xe@archiver.kernel.org>; Wed, 24 Dec 2025 20:03:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4851C10E029;
	Wed, 24 Dec 2025 20:03:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J+AHVmwh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F0D10E029
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Dec 2025 20:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766606599; x=1798142599;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AFERCF2eMJMcsMPQsfi5dxVN9AKUh5/HhUHvXLt583o=;
 b=J+AHVmwhbHaSHHnNTSQi2Sl3hoWu+GUKaaJzeu+TWgfvpD/JaRaFQdgQ
 9uRVz1oh1ytd2kmRrrXOxNYYqR+PKhcvgHadUd/3U7Q6Et3DhWK6wnoXy
 wDLCwV6niUNoQ6WwWq2ciTERaTnMUB+yMbmbGsscGm4GC22bRKKj7Kq12
 B8CD/FiePsuaIMVJ87dz0pBGEMOLqmJJs4h9uvZ0A8L2A8l2FsywNvwz9
 r4Z43Z/Pki12NiqQUMczFjjAKC6b8YPzhugZYYlekgGogwRtrdjSUSm7E
 jl7PUeVFsZiXksbnmbDcwMzUrmZli4oJtAR6lYVyjRgjZaolzIhrWmlqH Q==;
X-CSE-ConnectionGUID: f1eHzhwrQaqTIvwBwqQaLA==
X-CSE-MsgGUID: fWs+3xUSTd6rwl9j3bXlgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="79160746"
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; d="scan'208";a="79160746"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 12:03:18 -0800
X-CSE-ConnectionGUID: pPQzsgBLTkGXOKvxq5ScLQ==
X-CSE-MsgGUID: ANmg/04hQ06MS96PVvMDWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; d="scan'208";a="204217040"
Received: from khuang2-desk.gar.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.124.220.202])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 12:03:18 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] [CI] drm/i915/dmc: Test Xe3LPD DMC v2.33
Date: Wed, 24 Dec 2025 17:02:54 -0300
Message-ID: <20251224200304.46865-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.52.0
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

NOT TO BE REVIEWED/MERGED

Hardcode path to DMC firmware for CI purposes only.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 2fb6fec6dc99..ecb7736615b2 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -133,7 +133,7 @@ MODULE_FIRMWARE(XE3P_LPD_DMC_PATH);
 #define XE3LPD_3002_DMC_PATH		DMC_PATH(xe3lpd_3002)
 MODULE_FIRMWARE(XE3LPD_3002_DMC_PATH);
 
-#define XE3LPD_DMC_PATH			DMC_PATH(xe3lpd)
+#define XE3LPD_DMC_PATH			"i915/xe3lpd_dmc_ver2_33.bin"
 MODULE_FIRMWARE(XE3LPD_DMC_PATH);
 
 #define XE2LPD_DMC_PATH			DMC_PATH(xe2lpd)
-- 
2.52.0

