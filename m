Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0EACD4F49
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 10:40:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FBC810E64C;
	Fri, 22 Sep 2023 10:40:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 435D710E64C
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 10:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695379200; x=1726915200;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TcihSaVzkNWBgW4hWthPJ6eGIOEWH9vCyO+mopaaWH8=;
 b=SZr6MF2G+JOqTAsLy+8jxnG+Xz9n9y7rDwvM+kSbK/WhEIM5/YcfUfvd
 +V61AkAaZAWNR+e3CpdJuqfvSfRf9CECY2RixlzppZPz9uRXssZUlHnrI
 XqfvGnX96SFNJ9i/XhMnChA0rFMRw9GmZDjKQCfaN/4aHXyli74IQYUoP
 iwmXzs6BhEZB/zWGC+Nkk9z5UQcrHdpJipt5ot66M95lxDfEM2DaccA3T
 /AaBArhV7JcHd+vBUiy0upkTDQxeJqZxmVdp509jfSZ9bnb/5tVPECG8U
 G+t18c20uqTm/mx3Bf98AT+CrgJQ8o6ma/OvOX+CpnRZ651VQ/7Yjlurr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="383546586"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="383546586"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 03:39:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="697127290"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="697127290"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by orsmga003.jf.intel.com with ESMTP; 22 Sep 2023 03:39:58 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 22 Sep 2023 16:08:00 +0530
Message-Id: <20230922103759.346871-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230922082909.334085-2-suraj.kandpal@intel.com>
References: <20230922082909.334085-2-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/3] fixup! FIXME: drm/i915: xe doesn't have gsc
 hdcp interface or something
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

Remove stubs to clean up HDCP code

--v3
-Should be a fixup patch [Jani]

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index f617ccd206c8..a42549fa9691 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -174,7 +174,6 @@ bool intel_hdcp2_capable(struct intel_connector *connector)
 
 	/* If MTL+ make sure gsc is loaded and proxy is setup */
 	if (intel_hdcp_gsc_cs_required(i915)) {
-#ifdef I915
 		struct intel_gt *gt = i915->media_gt;
 		struct intel_gsc_uc *gsc = gt ? &gt->uc.gsc : NULL;
 
@@ -183,10 +182,6 @@ bool intel_hdcp2_capable(struct intel_connector *connector)
 				    "GSC components required for HDCP2.2 are not ready\n");
 			return false;
 		}
-#else
-		/* TODO */
-		return false;
-#endif
 	}
 
 	/* MEI/GSC interface is solid depending on which is used */
-- 
2.25.1

