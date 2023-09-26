Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD434E7E633
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 13:04:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E1710E3E5;
	Tue, 26 Sep 2023 13:04:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD3A10E3E6
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 13:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695733449; x=1727269449;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SUgCaxhf+590cI9gVZ18oKcGKqfU+w8TAP3PUuICZ5I=;
 b=IU52XvbpHWNiWeNKInbfT4WAfQG8o1E9FBb/srbFyJ1hRMHjGfMIYJFu
 IncxOFVOmNQuovrD5X5OmfoBsEBO5fHRcSY7+mSDAzrIPTzQGavPF5KjB
 Xg/LoBDxUGjeklLDJ1JmArVhh7nGj/phQcaN1g6g4eEfqHMbHupDM3WMK
 69iY30A1W1zlpkownDacSc8VdeKf7MyY37Asq0ddVssEWuOx+/bUORlE8
 IrxJD/aOrFInC76A70hFbnUKILEB2A324NEV+AnKx3gWbx0O/RIzMAbFe
 PsWeXyWeGyPSEtt3MJmd86kjwqVyIVnKaiN+8mZ6QSddGOTh+dRFqFnrg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="366617319"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="366617319"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 05:56:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="139727"
Received: from hblancoa-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.50.200])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 05:56:31 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 26 Sep 2023 12:55:35 +0000
Message-Id: <20230926125540.7-26-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230926125540.7-1-francois.dugast@intel.com>
References: <20230926125540.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 25/30] drm/xe/uapi: Document
 DRM_XE_DEVICE_QUERY_HWCONFIG
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
index cce36277ef68..79e47708d526 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -546,6 +546,11 @@ struct drm_xe_device_query {
 #define DRM_XE_DEVICE_QUERY_MEM_USAGE		1
 #define DRM_XE_DEVICE_QUERY_CONFIG		2
 #define DRM_XE_DEVICE_QUERY_GT_LIST		3
+	/*
+	 * Query type to retrieve the hardware configuration of the device
+	 * such as information on slices, memory, caches, and so on. It is
+	 * provided as a table of attributes (key / value).
+	 */
 #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
 #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
 #define DRM_XE_QUERY_CS_CYCLES			6
-- 
2.34.1

