Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6811DCDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 10:28:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D6510E4A9;
	Thu, 12 Oct 2023 10:28:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D1510E4AA
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 10:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697106502; x=1728642502;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xKKnQwSK2okG8ITpaokpz6HlUbWT/2AJ33wQk53r7SE=;
 b=bVX9kQiFxdejPz41M53PeZEuTfSprIzcGEu0l/dBqt8i8gnEUpbx8JM9
 Kum57xhF1RBZjepSx1w13uZ/MRuXoaP8NqgsUXr1VzBUT6ej+I1c+jlK1
 SV3L4oqKlsS5XNeOr7MEZM+G/CZbHmanQ4PwLTIKp6grFjmZmb1d3u/PH
 Ig2gwmwodFhjiYe13LcPGq2pB876TvMQla513IRxRQ8aCfFuU2GjR25c/
 XAWYfq6AFwIpStm585vVPZ6kQL1MTcSgUFkqXNDL5ZqNMESrcipMYEdXM
 ewU4p7+T38IdHEcl+TTiO2u7I4XYRvy2PjUX4/HDoByCN15Hofew8px8R Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="471145974"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="471145974"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 03:28:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="1001505463"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="1001505463"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmsmga006.fm.intel.com with ESMTP; 12 Oct 2023 03:28:20 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 12 Oct 2023 15:56:23 +0530
Message-Id: <20231012102622.810974-4-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231012102622.810974-1-suraj.kandpal@intel.com>
References: <20231012102622.810974-1-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 3/3] drm/xe/hdcp: Define
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

