Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64437D12698
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 12:02:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3329110E28C;
	Tue,  5 Nov 2024 12:02:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QBV9Ge6b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F99E10E28C
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 12:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730808134; x=1762344134;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=D6jfgjItakhEHiUWDvXLQAtra13k6PeE2eIN6cgCeik=;
 b=QBV9Ge6bMxgkiIj5pfakRrSKel0FNMEKsDQHhvkvumN+KyH3vsBGZ3DS
 wsiFzPkBnPyGQq0DU7Le7ohWTgZDfrfBWqMOPy++eP6NORRUcwhJOVcty
 YS93i7CUZoPy6ymQy1k2/U9ZCmtKtOr3tTzZHTE5YxLIAOg49jn5VOXAF
 nYU2Ble19+DC91QsT4t33axn8hZKPWIyVhrUcrH9eJ33VpPKx3timC6uO
 yF5aVNgown6ExW69eBvAo6zrjSAavy3Ioep4/zL2w/DxdDS4wlx5KeHl9
 sM0fqyvQM/A+bu1myQsWvB2S1gVlfwOz3zxpqH3tF1txvfGtbkgsBohOl A==;
X-CSE-ConnectionGUID: tC4zU5qxTpKswRNCiNqFSQ==
X-CSE-MsgGUID: 58D1lVndQUyJuNI5Mvn/tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="30772800"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="30772800"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 04:02:13 -0800
X-CSE-ConnectionGUID: qc7mCMIYRz6XbSlp0p9cQQ==
X-CSE-MsgGUID: WPf7tQ5fQd6Fd9c6+l/8Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="89128254"
Received: from spandruv-desk1.amr.corp.intel.com (HELO
 gjsousa-mobl2.corp.amr.intel.com) ([10.125.109.238])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 04:02:12 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] [CI] drm/i915/dmc: Test Xe2LPD DMC v2.23
Date: Tue,  5 Nov 2024 09:01:48 -0300
Message-ID: <20241105120159.18286-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.47.0
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
index 87bdacfd9edf..76a33d12dee9 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -116,7 +116,7 @@ static bool dmc_firmware_param_disabled(struct intel_display *display)
 #define XE3LPD_DMC_PATH			DMC_PATH(xe3lpd)
 MODULE_FIRMWARE(XE3LPD_DMC_PATH);
 
-#define XE2LPD_DMC_PATH			DMC_PATH(xe2lpd)
+#define XE2LPD_DMC_PATH			"i915/xe2lpd_dmc_ver2_23.bin"
 MODULE_FIRMWARE(XE2LPD_DMC_PATH);
 
 #define BMG_DMC_PATH			DMC_PATH(bmg)
-- 
2.47.0

