Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905F0C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 13:50:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F31210E1DB;
	Thu,  7 Dec 2023 13:50:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6266710E1D9
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 13:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701957024; x=1733493024;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/+NXdrgIS0MaDv4ib/5FzYwO7s8S2N7eT8EGPDQo6Qg=;
 b=BY0Kf4GVird9Svr2wIJrUmmxb0XCZ9XCpj7RxVmL5HK2dv/6ykijxBC2
 gb1uX8XcAv5RajAcr9kZsEJtwmXpFipt2V7utB0cUu3kB/4dHwNBDRaiN
 fwC59eBaeewjiKTnpBv11Qc4L7h4v0jMinr4uMhLEYm3lt/VfdUZp299m
 MU64R7A2w6rdirCq6NsOf0Ext/AgCcm1qonTZ/01lm7uq3/+jP9JvgmC8
 nyIkSW10+TSILrzvHql4OkAup8KwDD7njyQVZFIaSvMGtjcXyq9xpJo0C
 dYAqavxfy30tROyWOz7cbZBnJtCcoPIrgvwc4iTUi9iIoP8RenKHcuZGl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="373722241"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="373722241"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:50:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="765115450"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="765115450"
Received: from elenagol-mobl.ccr.corp.intel.com (HELO fde8da82816e.intel.com)
 ([10.252.46.155])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:50:23 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v1 03/14] drm/xe/uapi: Document use of size in
 drm_xe_device_query
Date: Thu,  7 Dec 2023 13:49:58 +0000
Message-Id: <20231207135009.7-4-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231207135009.7-1-francois.dugast@intel.com>
References: <20231207135009.7-1-francois.dugast@intel.com>
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Document the behavior of the driver for IOCTL DRM_IOCTL_XE_DEVICE_QUERY
depending on the size value provided in struct drm_xe_device_query.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/uapi/drm/xe_drm.h | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index d6cd76385e2c..7b18844401fd 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -469,9 +469,15 @@ struct drm_xe_query_topology_mask {
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

