Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3176AC001B2
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 15:46:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB9210E8E1;
	Thu,  9 Nov 2023 15:46:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B517B10E8D8
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 15:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699544719; x=1731080719;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5KOFtPQkEKsYb+MpJRr46NyOysr1yb7DsDXpfcE5uPg=;
 b=g7Be4r2BTr6ZwFHcKfbSocF0vZ3v7UME9T7KwU0YQNCVVeQCftAWmOBZ
 v5DreoX+ppsknw04OeIiwXB9EPMRDXvIKOrUUdsju/uCHWPDJwqf5okyE
 QhKGp+avCK1vH7MBdodQdP/foG3WfiVIMIgGSjgvgscAqUX/SV8aApxCP
 tANNm8H3wa9mU2T3kCwgnr3NCsTXHTeqr/0ux7vO0oifW5KLQqE+pGs0u
 t0YExZk6uW3Pq2l84ySdxPYo7ldpafaRW+G+Ds8Bcf2Ph9swLvfLLsc+K
 d6PPySqSu2BaxFpO4zi2zXX03ZSESqVZKWVmMR5LFZCMkuEblBro2X9+W A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11556641"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="11556641"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="936885976"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="936885976"
Received: from hschreib-mobl.ger.corp.intel.com (HELO ac699de916ef.intel.com)
 ([10.249.42.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:45:17 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:44:19 +0000
Message-Id: <20231109154457.7-6-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231109154457.7-1-francois.dugast@intel.com>
References: <20231109154457.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 05/43] drm/xe: Extend uAPI to query HuC
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
index 68cf67461846..f03aea937459 100644
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

