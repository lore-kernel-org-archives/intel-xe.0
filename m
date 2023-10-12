Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC27CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 10:28:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 696AB10E4A7;
	Thu, 12 Oct 2023 10:28:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD28410E4A7
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 10:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697106498; x=1728642498;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+pQPQ9LQhGprCFEaWzI/aarM/SIPKMpSwUkgEr2A3Rk=;
 b=d1CkzdRWU8OYmLhj2NINd/iecF8HENx9klFLZglBHV43PULWSNXT9qvT
 qA7XSVSCVRZHozmJ0aaOuxcFt8lfvy4cmjpRM5KXR/4qstaxCC52s4Yoj
 5OhYRuajD47zAomBGyEPiSVzk1eqO7rIGeOzp/gVcWwwP4EzPyGpCJIdk
 iq1voBuqeW9ixSbkc7N3PdKncjIA2fFOlPsd1AKLCbSTP9g01NZDNRZuN
 bODdl6WA6Wa3NlefRPSNo4PrcKWKc+ms81Yt4MmYObXLRu/nae3Pu97ur
 mEb5BnnHrISJ3CVwdYmexMHc/nlEWKE/yOIpb6LmH6/3+pHrE8kPyuFeO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="471145967"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="471145967"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 03:28:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="1001505453"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="1001505453"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmsmga006.fm.intel.com with ESMTP; 12 Oct 2023 03:28:17 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 12 Oct 2023 15:56:21 +0530
Message-Id: <20231012102622.810974-2-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231012102622.810974-1-suraj.kandpal@intel.com>
References: <20231012102622.810974-1-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 1/3] fixup! FIXME: drm/i915: xe doesn't have
 gsc hdcp interface or something
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
index ce9993c64459..8cca4793cf92 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -173,7 +173,6 @@ bool intel_hdcp2_capable(struct intel_connector *connector)
 
 	/* If MTL+ make sure gsc is loaded and proxy is setup */
 	if (intel_hdcp_gsc_cs_required(i915)) {
-#ifdef I915
 		struct intel_gt *gt = i915->media_gt;
 		struct intel_gsc_uc *gsc = gt ? &gt->uc.gsc : NULL;
 
@@ -182,10 +181,6 @@ bool intel_hdcp2_capable(struct intel_connector *connector)
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

