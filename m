Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E58CD6E71
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 13:59:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA72F10E842;
	Wed, 11 Oct 2023 13:59:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF1210E83F
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 13:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697032784; x=1728568784;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uWYjTXcIzB2lRtgYyXgi3MAhFlGzPupzD5QrJzAQ6TU=;
 b=j+JcBWx0f0JvgMA4W138rJnLJ9HxcFGra16HN42tJTW7koUxvOK6ESvZ
 9pudbPwLxb5WKKojq4FOu3F0KvqbA+m3JnxNDGDbjYS4v9mid2UjWGp5F
 RzhkXPc+CLPmbqN3WS4ADneigJ7GRAKH8qCEilgrJ95KLMSBFvXeuuMWC
 j3kVGJsZBf0LzXNhywA+YvFO1WEP0wNBzsqEsZ7pfT3yWoHQ9mS8lui5H
 0vFnPzLqBpfEhI5rn7uA7Wwm9elcDcg/AmPvy8MVq9aHOT813N/xGjHht
 uvJBLcCyyyguqxOBkostXp7I8Z/1UJp7S3dMDq3U8xe6kz9/LgZ5P5AYk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="451156228"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="451156228"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 06:59:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="753829034"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="753829034"
Received: from stahadie-mobl4.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.249.36.91])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 06:59:43 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 11 Oct 2023 13:59:15 +0000
Message-Id: <20231011135926.7-7-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011135926.7-1-francois.dugast@intel.com>
References: <20231011135926.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC v1 06/17] drm/xe: Extend uAPI to query HuC
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
index efbcf2ef436e..00a8aa7668de 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -528,6 +528,15 @@ query_uc_fw_version(struct xe_device *xe, struct drm_xe_device_query *query)
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
index e091dcf75b88..8d5bd2b9c408 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -475,6 +475,7 @@ struct drm_xe_query_topology_mask {
 struct drm_xe_query_uc_fw_version {
 	/** @uc: The micro-controller type to query firmware version */
 #define XE_QUERY_UC_TYPE_GUC 0
+#define XE_QUERY_UC_TYPE_HUC 1
 	__u16 uc_type;
 
 	/** @pad: MBZ */
-- 
2.34.1

