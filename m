Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03310CD3427
	for <intel-xe@archiver.kernel.org>; Sat,  2 May 2026 00:53:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B340710F65D;
	Sat,  2 May 2026 00:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jaHMVOyN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1C310E245
 for <intel-xe@lists.freedesktop.org>; Sat,  2 May 2026 00:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777683221; x=1809219221;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fPPTTBtmBNT93i9DCrNhbRxkRJrUf+NBiZ4wFe82KaM=;
 b=jaHMVOyNUNkNoRrMJ6qbXqjVOVnwXFlhHQtOgcrOBznl/mPpv76zp4MT
 eCDLjpkrvhGOC3olNoecsTZiHslBmvsSYt9Qr8jAExe7oBQcKQC7ubKZ+
 wpcobYNrCHG9Q43ZXeQ8Nh1sw/5LRcNFsdrLDNr+86LiEuEOUe/BZhPRE
 2ceOgkfTKPsJH6SmdteTuadFB+VIg1Du3fj8xVrAglYmSu2eeO8kgR2si
 v/9NM0u0QK6998GgD5E7kQbQZCL/+WCSa2PEzmjVJ54H4ZlTJRMe7u4+u
 f+jpliiN6DQYcLJbhQGwtiZ1IpId4G/azP190T9R92R4Zbkzdko3+A7Gg g==;
X-CSE-ConnectionGUID: vHWTDmhrSt+VlMdgvTvp6Q==
X-CSE-MsgGUID: lGcLfeq3QF6cZr4o4PAUbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78841564"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; d="scan'208";a="78841564"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2026 17:53:41 -0700
X-CSE-ConnectionGUID: a6QE8XnLTAO7E8NAN9Y8Ug==
X-CSE-MsgGUID: 7Ss4LIwfRfyNavVNH5wVRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; d="scan'208";a="228510962"
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2026 17:53:40 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com,
	stuart.summers@intel.com
Subject: [PATCH v2 9/9] drm/xe/multi_queue: Whitelist QUEUE_TIMESTAMP register
Date: Fri,  1 May 2026 17:53:42 -0700
Message-ID: <20260502005332.3135977-20-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260502005332.3135977-11-umesh.nerlige.ramappa@intel.com>
References: <20260502005332.3135977-11-umesh.nerlige.ramappa@intel.com>
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

In a multi-queue use case, when a job is running on the secondary queue,
the CTX_TIMESTAMP does not reflect the queues run ticks. Instead, we use
the QUEUE TIMESTAMP to check how long the job ran. For user space to see
the run ticks for a secondary queue, whitelist the QUEUE_TIMESTAMP
register.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
v2: Whitelist QUEUE_TIMESTAMP only for copy and compute engines (Niranjana)
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 80577e4b7437..37d6ac720d5c 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -33,6 +33,14 @@ static bool match_has_mert(const struct xe_device *xe,
 	return xe_device_has_mert((struct xe_device *)xe);
 }
 
+static bool match_multiq_class(const struct xe_device *xe,
+			       const struct xe_gt *gt,
+			       const struct xe_hw_engine *hwe)
+{
+	return hwe->class == XE_ENGINE_CLASS_COMPUTE ||
+	       hwe->class == XE_ENGINE_CLASS_COPY;
+}
+
 static const struct xe_rtp_entry_sr register_whitelist[] = {
 	{ XE_RTP_NAME("WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
@@ -54,6 +62,12 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 				RING_FORCE_TO_NONPRIV_ACCESS_RD,
 				XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 	},
+	{ XE_RTP_NAME("allow_read_queue_timestamp"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3500, 3511), FUNC(match_multiq_class)),
+	  XE_RTP_ACTIONS(WHITELIST(RING_QUEUE_TIMESTAMP(0),
+				   RING_FORCE_TO_NONPRIV_ACCESS_RD,
+				   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+	},
 	{ XE_RTP_NAME("16014440446"),
 	  XE_RTP_RULES(PLATFORM(PVC)),
 	  XE_RTP_ACTIONS(WHITELIST(XE_REG(0x4400),
-- 
2.43.0

