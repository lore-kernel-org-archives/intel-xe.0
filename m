Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1E1D6ACE1
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 10:22:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091C810ED87;
	Thu, 18 Dec 2025 10:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PMo7sPBA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7617110ED85
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 10:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766053358; x=1797589358;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QDQxrYbNuuDhkvM+Sz8WwBLaNKBIaFwnwwYm1kq1RZU=;
 b=PMo7sPBAhz8BB3OjtzSHfSbxZORm8615A7tnGDD+DPmUVJ0NJY3dF/3I
 f4JtfUn103uxYS2Vvf6ATIBT5PKSJ6J34vRxJ0uuyRcrfwJ0xUPBnKS4A
 Gaq6X8QynCbbYuRjMQkMg2qUigiXaSFYILg7zOOQXhpq/hCga7Gp6itTl
 gpME9brbkeoKV1t9oJcIrOSHdbjEBG6rZXuEbKafHHZ2OqxIssl0Hd+E/
 WSLqsg2/IB03q+hfgogF9Ldh6Yt4MuO3UoOcoZpsycpaLJrcSsozd761m
 2c3j4YALPjcEOeogN5SLnUi7ufeQHi6RVQZ6BCkyoLft5JKcvoapcWSyE A==;
X-CSE-ConnectionGUID: F/KVKdtXR9euL0FkQINesQ==
X-CSE-MsgGUID: Y6zvyRYaR/qwHgHr9W3/+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="78641284"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="78641284"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 02:22:37 -0800
X-CSE-ConnectionGUID: IR9aj75gTKy5Cw0tEXCgxw==
X-CSE-MsgGUID: ezyxyf/VSQihH86QlYHezw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="198617770"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 02:22:35 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 badal.nilawar@intel.com
Subject: [PATCH v2 2/2] drm/xe/xe_survivability: Fix static analysis tool
 reported issues
Date: Thu, 18 Dec 2025 16:21:54 +0530
Message-ID: <20251218105151.586575-6-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20251218105151.586575-4-riana.tauro@intel.com>
References: <20251218105151.586575-4-riana.tauro@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

1) Use static survivability info attributes.
2) Fix visibility condition

Fixes: f4e9fc967afd ("drm/xe/xe_survivability: Redesign survivability mode")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512101919.G12cuhBJ-lkp@intel.com/
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 23 +++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 2869866537ad..a25a23bcacc8 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -221,15 +221,15 @@ static ssize_t survivability_info_show(struct device *dev,
 		.index = _index,						\
 	}
 
-SURVIVABILITY_ATTR_RO(capability_info, CAPABILITY_INFO);
-SURVIVABILITY_ATTR_RO(postcode_trace, POSTCODE_TRACE);
-SURVIVABILITY_ATTR_RO(postcode_trace_overflow, POSTCODE_TRACE_OVERFLOW);
-SURVIVABILITY_ATTR_RO(aux_info0, AUX_INFO0);
-SURVIVABILITY_ATTR_RO(aux_info1, AUX_INFO1);
-SURVIVABILITY_ATTR_RO(aux_info2, AUX_INFO2);
-SURVIVABILITY_ATTR_RO(aux_info3, AUX_INFO3);
-SURVIVABILITY_ATTR_RO(aux_info4, AUX_INFO4);
-SURVIVABILITY_ATTR_RO(fdo_mode, FDO_INFO);
+static SURVIVABILITY_ATTR_RO(capability_info, CAPABILITY_INFO);
+static SURVIVABILITY_ATTR_RO(postcode_trace, POSTCODE_TRACE);
+static SURVIVABILITY_ATTR_RO(postcode_trace_overflow, POSTCODE_TRACE_OVERFLOW);
+static SURVIVABILITY_ATTR_RO(aux_info0, AUX_INFO0);
+static SURVIVABILITY_ATTR_RO(aux_info1, AUX_INFO1);
+static SURVIVABILITY_ATTR_RO(aux_info2, AUX_INFO2);
+static SURVIVABILITY_ATTR_RO(aux_info3, AUX_INFO3);
+static SURVIVABILITY_ATTR_RO(aux_info4, AUX_INFO4);
+static SURVIVABILITY_ATTR_RO(fdo_mode, FDO_INFO);
 
 static void xe_survivability_mode_fini(void *arg)
 {
@@ -252,9 +252,10 @@ static umode_t survivability_info_attrs_visible(struct kobject *kobj, struct att
 	u32 *info = survivability->info;
 
 	/* FDO mode is visible only when supported */
-	if (idx >= MAX_SCRATCH_REG && survivability->version >= 2)
+	if (idx == MAX_SCRATCH_REG && survivability->version >= 2)
 		return 0400;
-	else if (info[idx])
+
+	if (idx < MAX_SCRATCH_REG && info[idx])
 		return 0400;
 
 	return 0;
-- 
2.47.1

