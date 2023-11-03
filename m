Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8E9C4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:35:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E63A10EA01;
	Fri,  3 Nov 2023 14:35:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA5910E9F9
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 14:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699022117; x=1730558117;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hxi3QseghW/drbrYtFBUu2En9DQ8S6AjHqqKjVQF8yM=;
 b=iK244VBzVEpdWsQu36HtN6ti0A6AvKWTALXINcpjdVm5PzdfwhCHhSaP
 TIhkIINYlwFntOjuNRdtaAb9LE+Xny7rPOW7FbLJWbIFil7QtA6In6SXv
 bjhe5gaGCJX4+yCiRxLwR5BYkjs8UpZQATRFA7HjD833hs9qiSZPZKcFm
 0+O2hF/Y6iOW93JH9aKS8n31CRSuzloLpcUpNcolr+kYDVXJwVNFgwSLB
 5rUe1L1G/ZJdDGGYeSe5XJt5dIFmYsqk0XPPorhJawrqUegbCwXl/QI1s
 r9XICaLYFQPLhHChXD/9/hPYFiaFg35ncZlqOhVUPncvKedENxv5JPHSS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387843347"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387843347"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832417"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1008832417"
Received: from mtisan-mobl1.ger.corp.intel.com (HELO 8dd9ac0a63b4.intel.com)
 ([10.249.42.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:16 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:34:12 +0000
Message-Id: <20231103143456.7-7-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 06/50] drm/xe: Extend uAPI to query HuC
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

The infrastructure to query GuC firmware version is already in place. It
is extended with a new micro-controller type to query the HuC firmware
version. It can be used from user space to know if HuC is running.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 9 +++++++++
 include/uapi/drm/xe_drm.h     | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 063f9bf071a3..a7f34669bb9a 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -528,6 +528,15 @@ query_uc_fw_version(struct xe_device *xe, struct drm_xe_device_query *query)
 		resp.branch_ver = 0;
 		break;
 	}
+	case DRM_XE_QUERY_UC_TYPE_HUC: {
+		struct xe_huc *huc = &xe->tiles[0].primary_gt->uc.huc;
+
+		resp.major_ver = huc->fw.major_ver_found;
+		resp.minor_ver = huc->fw.minor_ver_found;
+		resp.patch_ver = huc->fw.patch_ver_found;
+		resp.branch_ver = 0;
+		break;
+	}
 	default:
 		return -EINVAL;
 	}
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 783bda74bd79..67f96d44d509 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -487,6 +487,7 @@ struct drm_xe_query_topology_mask {
 struct drm_xe_query_uc_fw_version {
 	/** @uc_type: The micro-controller type to query firmware version */
 #define DRM_XE_QUERY_UC_TYPE_GUC_SUBMISSION	0
+#define DRM_XE_QUERY_UC_TYPE_HUC		1
 	__u16 uc_type;
 
 	/** @reserved: Reserved */
-- 
2.34.1

