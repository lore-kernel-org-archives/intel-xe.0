Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88199EEE241
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 18:58:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5368810EC20;
	Thu, 12 Sep 2024 18:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="loxOiucG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB4D10EC1C
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 18:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726167494; x=1757703494;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rL3ytIkXHUxIRqytOgGCCKP0UnpgL3c1nBL8zpOrFEo=;
 b=loxOiucGhRkRpz/LPtXxa5S1yaweSmajVrlB33n4ngLo3yrWbw03bFYJ
 BHEple8bRTSdOydE5BDhqq2GmIhDOcLMb4rUF0ig8g1R95eBfTyUtfQpp
 MphNCmcbXh767yz75aEAt2eNoXUNTjVwcBmRTVTJBL4AAEm5NwQJLb/tO
 c+j0WtWHsa3zkKDj3QYcrRRgNyiYbGPbmwoUSCoOBXD/k7pCp1QHcrMxt
 +nr6v8N9UParybMlHozfECdvXvB7fqkqLxSTG7MkMtDhV7d7XNu7h5G5s
 MdDm862AUu1NkMnSbrbC79mOJ7xH3ZASZ1vmHKz5NDGM7xnsSRzUkl8Jw w==;
X-CSE-ConnectionGUID: iNqDJcmQR+Cu2uOYfMYDjQ==
X-CSE-MsgGUID: 3hyaLbdkTeKYr+CFy+XDwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25202926"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="25202926"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 11:58:08 -0700
X-CSE-ConnectionGUID: O5mHrmSgSym7NMLd6E0ndQ==
X-CSE-MsgGUID: 1r0om7p7SxCeSG8l6oxn5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="71910102"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa003.fm.intel.com with ESMTP; 12 Sep 2024 11:58:05 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 04/23] drm/xe/hdcp: Update handling of xe_force_wake_get
 return
Date: Fri, 13 Sep 2024 00:45:44 +0530
Message-Id: <20240912191603.194964-5-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
References: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
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

With xe_force_wake_get() now returning the refcount-incremented
domain mask, the return value will be 0 for single domains (excluding
XE_FORCEWAKE_ALL) in the event of a failure. Modify the return
handling of xe_force_wake_get() accordingly and pass the return value as
input to xe_force_wake_put().

Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
index 6619a40aed15..1db8a5c62f60 100644
--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
@@ -41,6 +41,7 @@ bool intel_hdcp_gsc_check_status(struct xe_device *xe)
 	struct xe_gt *gt = tile->media_gt;
 	struct xe_gsc *gsc = &gt->uc.gsc;
 	bool ret = true;
+	int fw_ref;
 
 	if (!gsc && !xe_uc_fw_is_enabled(&gsc->fw)) {
 		drm_dbg_kms(&xe->drm,
@@ -49,7 +50,8 @@ bool intel_hdcp_gsc_check_status(struct xe_device *xe)
 	}
 
 	xe_pm_runtime_get(xe);
-	if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC)) {
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
+	if (!fw_ref) {
 		drm_dbg_kms(&xe->drm,
 			    "failed to get forcewake to check proxy status\n");
 		ret = false;
@@ -59,7 +61,7 @@ bool intel_hdcp_gsc_check_status(struct xe_device *xe)
 	if (!xe_gsc_proxy_init_done(gsc))
 		ret = false;
 
-	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 out:
 	xe_pm_runtime_put(xe);
 	return ret;
-- 
2.34.1

