Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D737F364C0
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 20:37:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22BAF10E861;
	Thu,  9 Apr 2026 20:37:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CmOcJqsT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34AB810E83A
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Apr 2026 20:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775767042; x=1807303042;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2a51KCkr2gZjRHmXsWvt/UXS6F0U29t97U6ZJB0zvfY=;
 b=CmOcJqsTrvukyqlFKbjTFs/ZBqpAmJti7TTTuktKOmRmKQmXbL26MzhL
 852B6pKHxuU3mxr/kZEboT4IUd5RLp0VqptCqFz/gk2vWEMbG/53ieDwt
 mFGtDLWoayCz3qZn98PxtTlORpduJLAIZ1cW7xNdm9bzTMa1IMPIAw2Yb
 8tQ3l1qCERdRCtpM6DUlkZKq/KjblBbMZMfXQtDf7YRsscvFWxvhgIKrS
 npElprpNWC3VyQCKd4cbcNEUsGPupNIzXSi6FLNrPCiMARhSpERYwFZka
 L7zMpmHSJS2YOYu4ltuYhdaOFwFEYrPo9OUh7/AfVfT2eTVSiJjfUPz6u g==;
X-CSE-ConnectionGUID: 7gk/T+ydSPOV0BFmy1CiRA==
X-CSE-MsgGUID: TOpvqrFeRCW7JBV1OiRJkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76692625"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="76692625"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 13:37:21 -0700
X-CSE-ConnectionGUID: a7Y8zBfWT9+V2bsTNbxh+A==
X-CSE-MsgGUID: 200a5ODcTYOKSBmox6R0Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="227881128"
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 13:37:20 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com
Subject: [PATCH 5/5] drm/xe/multi_queue: Whitelist QUEUE_TIMESTAMP register
Date: Thu,  9 Apr 2026 13:37:20 -0700
Message-ID: <20260409203714.1887402-12-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409203714.1887402-7-umesh.nerlige.ramappa@intel.com>
References: <20260409203714.1887402-7-umesh.nerlige.ramappa@intel.com>
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
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 80577e4b7437..4517465ad423 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -54,6 +54,12 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 				RING_FORCE_TO_NONPRIV_ACCESS_RD,
 				XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 	},
+	{ XE_RTP_NAME("allow_read_queue_timestamp"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3500, 3511), FUNC(match_not_render)),
+	  XE_RTP_ACTIONS(WHITELIST(RING_QUEUE_TIMESTAMP(0),
+				   RING_FORCE_TO_NONPRIV_ACCESS_RD,
+				   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+	},
 	{ XE_RTP_NAME("16014440446"),
 	  XE_RTP_RULES(PLATFORM(PVC)),
 	  XE_RTP_ACTIONS(WHITELIST(XE_REG(0x4400),
-- 
2.43.0

