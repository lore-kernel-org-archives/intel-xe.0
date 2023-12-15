Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB583C46CA2
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 15:46:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E47410EA54;
	Fri, 15 Dec 2023 15:46:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1432D10EA45
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 15:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702655179; x=1734191179;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D16Zbi88/TlfNxhPiBhP/PqoPf97C0MbrbUgdI4ssgQ=;
 b=OYs4tLqMBd93KThobMu/HYJZq1IC2wKea3gwuJZjzBwKWlZInnp9PwjG
 GibVsX2ztS/BFcjR8kCtMY0bRnrV9LvojiQVZ4wOSxFh2mP0tY0C9zlYX
 Wt3heLdRavdiKRORCgmXAq8P5XKUXZ0WXbOvmZ8eARpcu1AvR0eb5AeiD
 WhoksEhsKwOGNLkc3Ih6PKEB6f0lhDsknL7SVnkyFP2lezZdUkd1Lpguh
 lHbnj3cdcJWBCEzL8Hlxm2O+uysxs0XrHB2A5aGc8r+S1Ipxa4Z8lDndv
 Ff4yIwrl4od/XCSlWXegpauPfFps5MHZb/91BnI8LEJy7BGVtUFz/mLmt g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2141861"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="2141861"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 07:46:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="16324489"
Received: from sdiolatz-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.48.85])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 07:46:18 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v1 10/21] drm/xe/uapi: Document use of size in
 drm_xe_device_query
Date: Fri, 15 Dec 2023 15:45:42 +0000
Message-Id: <20231215154553.7-11-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231215154553.7-1-francois.dugast@intel.com>
References: <20231215154553.7-1-francois.dugast@intel.com>
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

Document the behavior of the driver for IOCTL DRM_IOCTL_XE_DEVICE_QUERY
depending on the size value provided in struct drm_xe_device_query.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/uapi/drm/xe_drm.h | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index d7893ccbbf8c..d759e04e00ee 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -467,9 +467,15 @@ struct drm_xe_query_topology_mask {
  * struct drm_xe_device_query - Input of &DRM_IOCTL_XE_DEVICE_QUERY - main
  * structure to query device information
  *
- * If size is set to 0, the driver fills it with the required size for the
- * requested type of data to query. If size is equal to the required size,
- * the queried information is copied into data.
+ * The user selects the type of data to query among DRM_XE_DEVICE_QUERY_*
+ * and sets the value in the query member. This determines the type of
+ * the structure provided by the driver in data, among struct drm_xe_query_*.
+ *
+ * If size is set to 0, the driver fills it with the required size for
+ * the requested type of data to query. If size is equal to the required
+ * size, the queried information is copied into data. If size is set to
+ * a value different from 0 and different from the required size, the
+ * IOCTL call returns -EINVAL.
  *
  * For example the following code snippet allows retrieving and printing
  * information about the device engines with DRM_XE_DEVICE_QUERY_ENGINES:
-- 
2.34.1

