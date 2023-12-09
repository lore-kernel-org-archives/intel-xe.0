Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC18C4167B
	for <intel-xe@archiver.kernel.org>; Sat,  9 Dec 2023 07:46:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C0810E068;
	Sat,  9 Dec 2023 07:46:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823C510E068
 for <intel-xe@lists.freedesktop.org>; Sat,  9 Dec 2023 07:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702107994; x=1733643994;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=76+I7Esw/k+YCtUuMRZJwoDioeTEr8ig705Kjq0TNM4=;
 b=SttMHheV5MgOANifcpYr68BSzHibI6SfUHeF2kNDlEnvL5SMUNwhKDCY
 NOD0+s3piv50Aogvk4uSfcM077NcuG8YEBIh825ro7QdIT/D+CMJmZ95h
 irF4hrVV/DTrfnNgOfQA5kBRS+VFrIyf3ZHDKhXRon8fGhbccm6olcNvt
 BKZ7LG1f03QZMTUR/2Z2WwoERukOw50LdtBwef45SWMBHv6MbbVrkC2+T
 nUZs4wcsWDrSXv8/qvpXHfxMDmawneVNdqnMyFzT8uNWgMcRwH/lCxqM+
 csF3XuEiTu0aUVndMjdiguOQmRmOuKUdkohGifjIWRqtSei7c169M6qY6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1571965"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; 
   d="scan'208";a="1571965"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 23:46:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="748594843"
X-IronPort-AV: E=Sophos;i="6.04,262,1695711600"; d="scan'208";a="748594843"
Received: from lswathi-mobl2.gar.corp.intel.com (HELO 678c7e38464d.intel.com)
 ([10.249.33.238])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 23:46:32 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/uapi: Remove DRM_XE_UFENCE_WAIT_MASK_*
Date: Sat,  9 Dec 2023 07:45:58 +0000
Message-Id: <20231209074558.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Those are just possible values for the comparison mask but they are not
specific magic values. Let's keep them as examples in the documentation
but remove them from the uAPI.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/uapi/drm/xe_drm.h | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 0895e4d2a981..a0e8bf4cadc8 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1042,11 +1042,13 @@ struct drm_xe_wait_user_fence {
 	/** @value: compare value */
 	__u64 value;
 
-#define DRM_XE_UFENCE_WAIT_MASK_U8	0xffu
-#define DRM_XE_UFENCE_WAIT_MASK_U16	0xffffu
-#define DRM_XE_UFENCE_WAIT_MASK_U32	0xffffffffu
-#define DRM_XE_UFENCE_WAIT_MASK_U64	0xffffffffffffffffu
-	/** @mask: comparison mask */
+	/**
+	 * @mask: comparison mask, values can be for example:
+	 *  - 0xffu for u8
+	 *  - 0xffffu for u16
+	 *  - 0xffffffffu for u32
+	 *  - 0xffffffffffffffffu for u64
+	 */
 	__u64 mask;
 
 	/**
-- 
2.34.1

