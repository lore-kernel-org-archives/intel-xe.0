Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B84CC41535
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 15:46:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC3EF10EA5E;
	Fri, 15 Dec 2023 15:46:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA0510EA58
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 15:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702655181; x=1734191181;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GiaVSNiBwe7c5/fDMAf6rNe810BQR4W+rE+Un+rTmyo=;
 b=Nw9SQfj/iG/XY4ruMysLMaoFAkTfPTsFtWWVl6kT+ZV1x7NFfbL+VVrZ
 uvJPY6GvOPY6UqZZ2WN7O0XKiSuETAHY49yC0TJpvw4/7IbkYlkIeMx+q
 Vbnli1d2UEoZJSO0Fk2Hvv+zKk/1/ImKwpkvwk09bzb+v/OOuP2yqmdQf
 LQouZGFaFWMhaJb+MQ8WT/Zae23OMXFRWefW0ps7DYaRDBTflcFIZfe7w
 O3Ek3OkGIn4wnW/EFCg7gp3qznpHDxGqfFEFXwaARq3xPzIoazZp4QcV8
 t+kz1DnAbcBxMykyMsqUaelF2JNaULPnOg9OZbqz6173AzkqWANaRwJ15 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2141863"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="2141863"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 07:46:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="16324503"
Received: from sdiolatz-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.48.85])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 07:46:21 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v1 12/21] drm/xe/uapi: Document DRM_XE_DEVICE_QUERY_HWCONFIG
Date: Fri, 15 Dec 2023 15:45:44 +0000
Message-Id: <20231215154553.7-13-francois.dugast@intel.com>
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

Add a documentation on the content and format of when using query type
DRM_XE_DEVICE_QUERY_HWCONFIG. The list of keys can be found in IGT
under lib/intel_hwconfig_types.h.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/uapi/drm/xe_drm.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 9c43bc258f10..70b42466a811 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -537,6 +537,11 @@ struct drm_xe_device_query {
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

