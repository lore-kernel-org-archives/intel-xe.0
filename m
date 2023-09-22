Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1591BE7D0D1
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 06:45:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C807D10E626;
	Fri, 22 Sep 2023 06:45:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C4410E416
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 06:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695365094; x=1726901094;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xKKnQwSK2okG8ITpaokpz6HlUbWT/2AJ33wQk53r7SE=;
 b=Y/dyFuPhvAxR04+FGmerXb4MiwwTtJW5jfUrubiwWxdmiE9/YpmfPbNT
 WEh+IcqGHBDiT4m90pxIxVR+MGBSiRNTZ7riNA4WvL9cKI4jdJAXaNdOZ
 h7Zsj++9mRnLungChIKvmf7cUXE8dlrnMSAVJTlu01OqIGuoanqlW5NpQ
 NAMGu70kOkz0F2oC1i2Fia9rZuG5jTlqRGfkXPJ0LZUzlEtI4vnXOZfIv
 koYOMZ8UhEc0/ID4flVoSfFeNGh5K6NOYrTiO8vMMCK2f5JY4yt93IFC1
 OsCTNJYvfVTKpU5EkentqhE+k2qXezE7YidpbVTxD6K172Q2IZwx8C+jk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="365814866"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="365814866"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 23:44:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="697055450"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="697055450"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by orsmga003.jf.intel.com with ESMTP; 21 Sep 2023 23:44:53 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 22 Sep 2023 12:12:48 +0530
Message-Id: <20230922064247.329994-4-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230922064247.329994-1-suraj.kandpal@intel.com>
References: <20230922064247.329994-1-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/3] drm/xe/hdcp: Define
 intel_hdcp_gsc_check_status in Xe
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

Define intel_hdcp_gsc_check_status in Xe to account
for changes in i915 and Xe.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
index 5c02675bbb09..85f6f22ba4e2 100644
--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
@@ -5,6 +5,11 @@
 
 #include "intel_hdcp_gsc.h"
 
+bool intel_hdcp_gsc_check_status(struct drm_i915_private *i915)
+{
+	return false;
+}
+
 int intel_hdcp_gsc_init(struct drm_i915_private *i915)
 {
 	drm_info(&i915->drm, "HDCP support not yet implemented\n");
-- 
2.25.1

