Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2BDC25B76
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 07:46:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA5410E092;
	Wed,  5 Jun 2024 07:46:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KvIFl2Wg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC66F10E092
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 07:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717573574; x=1749109574;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TfEwU9oE3ZUHCgvBZzs8G+d/l4k/2X2jLYbntaT5y2g=;
 b=KvIFl2WgPiq1acHZBEIXPNbzGK1CekVhtjDlSevYUHIjlDQorCEixzWW
 4QTqw1nhPBwdDYS1KYjj+6aRKu+q3MwT8hVUUpvmrWxVTx5JFaOJdF+no
 JDN4qC+Rn3onaaWFb+gGHi8oG1uIfvbu01ccvxIAW+1LQW508nFuodzZK
 OHx2BPKyFNadsD0yzAfdz8MkiMPim0PBUhFQR5tv29oYO565FdoPd5Wyh
 QQe6C6bOZTUS3lpYOHkdIEGQ+00IyaXUHH9CAQ0kwPhtsWc9tzkCedPzc
 N2CELvsLiC8VA4Il6vV6Ant2NFZpXRU3PnP6Xk0mK3iNNaFJIJT797gvh Q==;
X-CSE-ConnectionGUID: g12yx9CWREqoP7+RHZG9Dw==
X-CSE-MsgGUID: kzhE5ZBQTwuXOISuNclLAw==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="36684668"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="36684668"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 00:46:14 -0700
X-CSE-ConnectionGUID: TDqrJMWNSi6ZwnKOFs09Lg==
X-CSE-MsgGUID: Wfn+s9Z6TbKVw569PINlfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="37622131"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmviesa009.fm.intel.com with ESMTP; 05 Jun 2024 00:46:13 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH] drm/xe/hdcp: Add BMG restriction for HDCP 2.2
Date: Wed,  5 Jun 2024 13:13:48 +0530
Message-ID: <20240605074348.1807649-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.43.2
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

As of now HDCP is not supported on BMG graphics platform.
Add check to restrict HDCP 2.2 on those platforms.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
index 14b8b4278317..328ec58612b0 100644
--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
@@ -33,7 +33,8 @@ struct intel_hdcp_gsc_message {
 
 bool intel_hdcp_gsc_cs_required(struct xe_device *xe)
 {
-	return DISPLAY_VER(xe) >= 14;
+	return DISPLAY_VER(xe) >= 14 &&
+	       DISPLAY_VER_FULL(xe) != IP_VER(14, 1);
 }
 
 bool intel_hdcp_gsc_check_status(struct xe_device *xe)
-- 
2.43.2

