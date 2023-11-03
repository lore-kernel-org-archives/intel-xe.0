Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2A8C001B2
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:35:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6701610EA06;
	Fri,  3 Nov 2023 14:35:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BED510EA02
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 14:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699022122; x=1730558122;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EAv9FmFpINBdsFj+VDTVDccTp3rg6oqGSKlMGgOUW/E=;
 b=kBppm6/jTYE3ZZVj2rXkMud4hZaDjH3unpItfQTXRxmd2u86mnTdWXN0
 TpvF+3AYTq6AEfpjLzrSdfdYWQ1en8hAaaUcrSx+gjPsf6xKYX26Uus7p
 vllxDr/OCGdZpHVdjfwiiDulY5z1Yf+3J5GI/HnDzogNQi+I9v4+LrOZV
 ZqnAX0U1iBaqlGEu2LczCw4Wwux6pRU26ldB5XCrK2oQEZsT3Els2Z5DA
 V1ojGP4xDLgU7GWAPzhDWqemd95/QG03pE3r0JxATEzVOnYJ6ddAecjmp
 RETa/FC7UrJ0hpoR9/2Nnk7wfmlreW8fYQGz+MlB8+5IkIoLW/2zMyqq7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387843354"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387843354"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832434"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1008832434"
Received: from mtisan-mobl1.ger.corp.intel.com (HELO 8dd9ac0a63b4.intel.com)
 ([10.249.42.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:21 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:34:16 +0000
Message-Id: <20231103143456.7-11-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 10/50] fixup! drm/xe: Add uAPI to query
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
 include/uapi/drm/xe_drm.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index b53b3d9882a1..b1e9d8089d5f 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -486,13 +486,13 @@ struct drm_xe_query_uc_fw_version {
 	/** @reserved: Reserved */
 	__u16 reserved;
 
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

