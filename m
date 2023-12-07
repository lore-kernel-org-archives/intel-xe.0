Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB84C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 13:50:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9141210E8A5;
	Thu,  7 Dec 2023 13:50:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E468610E8A5
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 13:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701957028; x=1733493028;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N75440UO6Vh1+GByA1BBW6G25GbmI1ipq3mSVbzykxc=;
 b=UNWYjqF+h3KwJkmDO7+TYfX7wIvuR2dcgTa1AElWLZ3c4yBRy4HUUEVR
 zPA+AeCnbOihUNzTZNHA33XqX88jOVUnP5UQDYP1j4Dc3/s0yvFoxMquS
 LObBws66bZIHK/X0dwNefWxiVdLeZqT9JUEtKiIV8HJomLqwn7oVmb0ht
 rkRWD5baD/cIF2BpCsGpbJ2oqlVpMuv34FNU9pi1zS7NIjbS1rof2RG1b
 YOwKdfldYBG8oi196Uf2REVxfDyA9srczBL7z4OFJxrFdND2+piJ7sF0c
 Pl7Z0y6LwQ5zqojGl3QeAgRnKwjQAIIiixKGgUzKUStmF0Kdh/bp5SKvy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="373722251"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="373722251"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:50:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="765115461"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="765115461"
Received: from elenagol-mobl.ccr.corp.intel.com (HELO fde8da82816e.intel.com)
 ([10.252.46.155])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:50:25 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v1 05/14] drm/xe/uapi: Document DRM_XE_DEVICE_QUERY_HWCONFIG
Date: Thu,  7 Dec 2023 13:50:00 +0000
Message-Id: <20231207135009.7-6-francois.dugast@intel.com>
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

Add a documentation on the content and format of when using query type
DRM_XE_DEVICE_QUERY_HWCONFIG. The list of keys can be found in IGT
under lib/intel_hwconfig_types.h.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/uapi/drm/xe_drm.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index cc1c6c5d594c..492f3c240e87 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -539,6 +539,11 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_MEM_REGIONS		1
 #define DRM_XE_DEVICE_QUERY_CONFIG		2
 #define DRM_XE_DEVICE_QUERY_GT_LIST		3
+	/*
+	 * Query type to retrieve the hardware configuration of the device
+	 * such as information on slices, memory, caches, and so on. It is
+	 * provided as a table of attributes (key / value).
+	 */
 #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
 #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
 #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
-- 
2.34.1

