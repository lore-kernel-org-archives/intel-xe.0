Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0DEE7718B
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 05:01:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F40210EE94;
	Fri, 20 Dec 2024 05:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d6h7U9wr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 548FE10EE84;
 Fri, 20 Dec 2024 05:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734670917; x=1766206917;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ggL052RCucGYFBrEo1WNXO/NpltLvnvXAWGNheaHNNI=;
 b=d6h7U9wrbHrkxl2VBja5oS8Cj5ie7QTjuLXwlt4+DuXK98r3cG5PYm64
 0AizWoPyAC5sjCw7oUNaFAOdWwUiJ5SOwSyBXCkrOJZdj/O05nh411GJM
 /UVbL00rOglyJctrMqzUYf9s9mzK6V6rOhxbd7hbP3Eq0P+cAPTmndGf5
 kuHRyuh1k9r1PnAZFSWua49qpUDPz9zxBB78eevRqhACzcMx7VYxBCSrn
 4y5OBVYtO1nfgxggZKcoeKLfEoRlzzltwR42UiRFS/YzatD3QuiwKdoyL
 3PDLvdAXFXNbiwbQpAe1wA4DhqLvUwSSCFIzBK67gFTqWEAgdPg68Ol9O Q==;
X-CSE-ConnectionGUID: Pmc7Lc5wQmOk6Q8Rt7b7aA==
X-CSE-MsgGUID: Ke51m4iAR2qByfLCx+FvtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="34929106"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; d="scan'208";a="34929106"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 21:01:56 -0800
X-CSE-ConnectionGUID: s1bQ8QhVT2+nyANhslWJqw==
X-CSE-MsgGUID: BWZBOxd8T6qcGbr7B00aWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; d="scan'208";a="98471447"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa006.jf.intel.com with ESMTP; 19 Dec 2024 21:01:55 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH] Revert "drm/i915/hdcp: Don't enable HDCP1.4 directly from
 check_link"
Date: Fri, 20 Dec 2024 10:31:53 +0530
Message-Id: <20241220050153.3053540-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
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

This reverts commit 483f7d94a0453564ad9295288c0242136c5f36a0.
This needs to be reverted since HDCP even after updating the connector
state HDCP property we don't reenable HDCP until the next commit
in which the CP Property is set causing compliance to fail.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index f6e68a0e3b6d..33c705b5ee28 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -1166,9 +1166,15 @@ static int intel_hdcp_check_link(struct intel_connector *connector)
 		goto out;
 	}
 
-	intel_hdcp_update_value(connector,
-				DRM_MODE_CONTENT_PROTECTION_DESIRED,
-				true);
+	ret = intel_hdcp1_enable(connector);
+	if (ret) {
+		drm_err(&i915->drm, "Failed to enable hdcp (%d)\n", ret);
+		intel_hdcp_update_value(connector,
+					DRM_MODE_CONTENT_PROTECTION_DESIRED,
+					true);
+		goto out;
+	}
+
 out:
 	mutex_unlock(&dig_port->hdcp_mutex);
 	mutex_unlock(&hdcp->mutex);
-- 
2.34.1

