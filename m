Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A847CFB442
	for <intel-xe@archiver.kernel.org>; Mon,  7 Oct 2024 06:42:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF5510E308;
	Mon,  7 Oct 2024 06:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ur42QJp+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF6A910E30C
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Oct 2024 06:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728283322; x=1759819322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7lyOl7SIhTeaXqvXRVQfj1NCHVXqnAvyF2M2PMnAFgI=;
 b=Ur42QJp+OIGRqLcbfSdaaE8cg7oewh0lj6NMRVq+al5OeJ6w+VnlMA4v
 xs2QsaoQ+b/Vge4w/4Bny1TdKHxd4JTa+COK8cmCnsyKxYlvBxXypcDgB
 5aAEIhJ9W60ZuePDUUeghiVvSdY+cAhaXbr4i7eC0yItWbaSv62IugTxP
 Imz/zM4GHWReBaT2IuypgtO1+qQ+h4x8uipV874hy3ur2T6w7rMpSqnsW
 R0bghdnTNJWJ8LlI4md9DPbWkupw052vCJYYlWX4JGqDFclmCLeDgvByi
 OUehTsTV1GQ32F9ctYXG7SYPEoOrzRsaRpI+j4N8yULknUXT1kEQi58ha g==;
X-CSE-ConnectionGUID: YfPmhI/lR12jf0v2MPnCsQ==
X-CSE-MsgGUID: yCbLUZuMRii7U+u2cwdV1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="38548439"
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; d="scan'208";a="38548439"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2024 23:42:02 -0700
X-CSE-ConnectionGUID: FojlGGmcRCy6S7P6Af7fOQ==
X-CSE-MsgGUID: lWCGjROMQimCfkQU9h3wfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; d="scan'208";a="112842371"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa001.jf.intel.com with ESMTP; 06 Oct 2024 23:42:00 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v7 07/26] drm/xe/hdcp: Update handling of xe_force_wake_get
 return
Date: Mon,  7 Oct 2024 12:29:58 +0530
Message-Id: <20241007070017.1732886-8-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241007070017.1732886-1-himal.prasad.ghimiray@intel.com>
References: <20241007070017.1732886-1-himal.prasad.ghimiray@intel.com>
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

xe_force_wake_get() now returns the reference count-incremented domain
mask. If it fails for individual domains, the return value will always
be 0. However, for XE_FORCEWAKE_ALL, it may return a non-zero value even
in the event of failure. Update the return handling of xe_force_wake_get()
to reflect this behavior, and ensure that the return value is passed as
input to xe_force_wake_put().

v3
- return xe_wakeref_t instead of int in xe_force_wake_get()

v5
- return unsigned int for xe_force_wake_get()

v7
- Fix commit message

Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>(#rev2)
---
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
index 6619a40aed15..3567f474b6cb 100644
--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
@@ -41,6 +41,7 @@ bool intel_hdcp_gsc_check_status(struct xe_device *xe)
 	struct xe_gt *gt = tile->media_gt;
 	struct xe_gsc *gsc = &gt->uc.gsc;
 	bool ret = true;
+	unsigned int fw_ref;
 
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

