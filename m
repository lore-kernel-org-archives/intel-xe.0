Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B45ACD6E72
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 13:59:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0257A10E849;
	Wed, 11 Oct 2023 13:59:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0260610E86E
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 13:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697032789; x=1728568789;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vVdrbAxnSorZ+c0vOmNfuY5tu/0gm4zjcl6IPAnMzFk=;
 b=H+5h86eX/Ag3ufkZgSfYiAGneG+AubFLilFOdrMPimFmeI5RuR4Rq2UI
 Xc7IdPPJ8nc5r0b8k1TtDnQ6nm2XJYL69sBxmMz2CjyAXyKtLdpWi/L48
 hZEAfpO3cuD1kVuopHxD0Ds4PzZecH40D4PccxuZYbxs99eAfEcIYXIB6
 xvVR+p+J7HRBhP6mWepY9OEeYr4UKwE8MKYQv+zEqz+Yu179Ua0I879E1
 xxXJVLR7JtYAXVrL9P1oQRfghE3urvuHuYmU5GxXaBUC2KiEdWchhOThX
 NncBTMZmgyS9SCciq4Q0s3iNASPzGodqwckLkC1Db8fToIX2Y1IhZsz8G Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="451156250"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="451156250"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 06:59:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="753829141"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="753829141"
Received: from stahadie-mobl4.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.249.36.91])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 06:59:47 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 11 Oct 2023 13:59:19 +0000
Message-Id: <20231011135926.7-11-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011135926.7-1-francois.dugast@intel.com>
References: <20231011135926.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC v1 10/17] fixup! drm/xe: Add uAPI to query
 micro-controler firmware version
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove warnings below when building documentation:

    ./include/uapi/drm/xe_drm.h:491: warning: Function parameter or member 'uc_type' not described in 'drm_xe_query_uc_fw_version'
    ./include/uapi/drm/xe_drm.h:491: warning: Function parameter or member 'major_ver' not described in 'drm_xe_query_uc_fw_version'
    ./include/uapi/drm/xe_drm.h:491: warning: Function parameter or member 'minor_ver' not described in 'drm_xe_query_uc_fw_version'
    ./include/uapi/drm/xe_drm.h:491: warning: Function parameter or member 'patch_ver' not described in 'drm_xe_query_uc_fw_version'
    ./include/uapi/drm/xe_drm.h:491: warning: Function parameter or member 'branch_ver' not described in 'drm_xe_query_uc_fw_version'

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/uapi/drm/xe_drm.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 4755aa5e73f2..f0c32da829b9 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -466,7 +466,7 @@ struct drm_xe_query_topology_mask {
  * of the micro-controller firmware.
  */
 struct drm_xe_query_uc_fw_version {
-	/** @uc: The micro-controller type to query firmware version */
+	/** @uc_type: The micro-controller type to query firmware version */
 #define DRM_XE_QUERY_UC_TYPE_GUC	0
 #define DRM_XE_QUERY_UC_TYPE_HUC	1
 	__u16 uc_type;
@@ -474,13 +474,13 @@ struct drm_xe_query_uc_fw_version {
 	/** @pad: MBZ */
 	__u16 pad;
 
-	/* @major_ver: major uc fw version */
+	/** @major_ver: major uc fw version */
 	__u32 major_ver;
-	/* @minor_ver: minor uc fw version */
+	/** @minor_ver: minor uc fw version */
 	__u32 minor_ver;
-	/* @patch_ver: patch uc fw version */
+	/** @patch_ver: patch uc fw version */
 	__u32 patch_ver;
-	/* @branch_ver: branch uc fw version */
+	/** @branch_ver: branch uc fw version */
 	__u32 branch_ver;
 
 	/** @pad2: MBZ */
-- 
2.34.1

