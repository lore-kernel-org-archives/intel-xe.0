Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01427E7E636
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 13:04:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C667C10E3E7;
	Tue, 26 Sep 2023 13:04:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA7AD10E3D8
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 13:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695733454; x=1727269454;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=80y4mU5pjKq4n8Dj6+Yisdmbz8TwBXKwKus0EMWAOA8=;
 b=Ix9p8UcBanFxnk60yLkSuy4KEpvepEElwlHE8fL5K56CCrLvOXKcCejp
 FJ2FmlUXyqDAde/LOpD1sLn1w0V4cqUhMW3GG2VGT/DDeXfF8OaSUqMlE
 5P0pRbt8torzANMcGkFs/Bjw2bKJe362WjMa8h7FgwAPmqkyrDj1shroY
 uhP9i/Z+RaMjzgW9H75MYOQvjqDF8o5DtFT/u6OScqb5UJSHJd/vSLXqY
 Kmjgl+CXX9v18xR+Cafpi98azllPQuxgp7b2lrKIVXzB9uxbji0T/n70I
 54/uQy1EvrzeXMwCK+uXjC6fMjVL7aKbHjuv40nO/XYDQCFDKu/52q8Gy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="366617334"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="366617334"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 05:56:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="139757"
Received: from hblancoa-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.50.200])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 05:56:33 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 26 Sep 2023 12:55:37 +0000
Message-Id: <20230926125540.7-28-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230926125540.7-1-francois.dugast@intel.com>
References: <20230926125540.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 27/30] drm/xe: Extend uAPI to query HuC
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
index 7a0ffd9a654a..c250ca534bb9 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -530,6 +530,15 @@ query_uc_fw_version(struct xe_device *xe, struct drm_xe_device_query *query)
 		resp.branch_ver = 0;
 		break;
 	}
+	case XE_QUERY_UC_TYPE_HUC: {
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
index 84091860c7d2..fe7e83a5bd3e 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -478,6 +478,7 @@ struct drm_xe_query_topology_mask {
 struct drm_xe_query_uc_fw_version {
 	/** @uc: The micro-controller type to query firmware version */
 #define XE_QUERY_UC_TYPE_GUC 0
+#define XE_QUERY_UC_TYPE_HUC 1
 	__u16 uc_type;
 
 	/** @pad: MBZ */
-- 
2.34.1

