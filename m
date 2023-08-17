Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80614C2FC18
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 11:04:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5961110E44C;
	Thu, 17 Aug 2023 11:04:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D45410E44A
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 11:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692270238; x=1723806238;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2VJHDolsRjngzYnMgEyYI81CMcbZZ8UK9NwlFO8gKWQ=;
 b=Dg2fGc4+WHdI1WqiZiZ0bP0i5bGLX951wYl2O7JlBjO45zpCcZ/ZxYJv
 WqKcGfpgCpuNQb1F85DZIFtTk+PHmwJl3G8cFTGieX1wl5X2w3C35CYKI
 AxiUu1c+i0Kg+b2Cv873oUPAC3mtnfNPrC1mJ42jXcp3UiVfsCWy1aNB/
 sLLMeV/LDJbD9llTDgl3KsvH+A5LcNpRyQMxk613vj8WeA5g4TUn9yovC
 AnFkPMKKXbTaePBtC90Cf3Z5AZZeped/fOKd/XCoDC5GNB46iQRQUX44B
 lDQY10wIzfvP4VbOTs7CyXGBSVMoUwNEUWCYydzJOAi/UQpEv49vAk22W w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="376516676"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="376516676"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 04:03:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="728099947"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="728099947"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 04:03:56 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 17 Aug 2023 04:03:50 -0700
Message-Id: <20230817110352.7601-2-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230817110352.7601-1-niranjana.vishwanathapura@intel.com>
References: <20230817110352.7601-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/3] drm/xe/pvc: Blacklist BCS_SWCTRL register
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Wa_16017236439 requires the BCS_SWCTRL to be privileged.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index e83781f9a516..94a2228bf873 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -50,6 +50,12 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 				   RING_FORCE_TO_NONPRIV_DENY |
 				   RING_FORCE_TO_NONPRIV_RANGE_64))
 	},
+	{ XE_RTP_NAME("16017236439"),
+	  XE_RTP_RULES(PLATFORM(PVC), ENGINE_CLASS(COPY)),
+	  XE_RTP_ACTIONS(WHITELIST(XE_REG(0x200),
+				   RING_FORCE_TO_NONPRIV_DENY,
+				   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+	},
 	{}
 };
 
-- 
2.21.0.rc0.32.g243a4c7e27

