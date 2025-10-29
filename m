Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F7FCCF9EE
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 08:51:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26DC10E76C;
	Wed, 29 Oct 2025 08:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KofkH09s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB5F10E765
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 08:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761727869; x=1793263869;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=diCCMFQm759Z8gTg6sZdC3kj36ch3aIUH0bynIJyPEE=;
 b=KofkH09s8c9q0Sa0ljej4PrelFcmvNd4apLD2bR2+JO/3vEBdRx8DYEf
 zS1WJ1d4mVZprCKRJEWqaPfivnCAJLbsAXdCvF7JdTMUCvn9sF2HYwCG+
 ttxN6XQg8KyOWN67tCTmHcMhrRNMN92lt4eJV8vxUmcxvLUtjGU1vwiY9
 f4hePfmvnnzd7m2k3BCeD+bUS1rGSXyRH+btQfcLS/lsioJQ9juLfLmDu
 6YOem6fOJjg14EZac1faFCcBmIrGL15/YYE1SDUp31m+RH3VDqlYEgj6V
 zoyhBmXh51NXjtC+4wx6sPeR7zXDnYmBAFSfzOKUwISAV3QDvW7RYBAKN g==;
X-CSE-ConnectionGUID: cQUPOT4/ScuGV7X9A1KDMw==
X-CSE-MsgGUID: mtbjoXoxQSCuIDAV/Nbg+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75290381"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="75290381"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 01:51:08 -0700
X-CSE-ConnectionGUID: YfpuGTaqS7C7xKrClDQKSg==
X-CSE-MsgGUID: H6DPxKKcSaCcdlJ1VvW1CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="185294653"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO tpalli-mobl3.intel.com)
 ([10.245.244.230])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 01:51:06 -0700
From: =?UTF-8?q?Tapani=20P=C3=A4lli?= <tapani.palli@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, tilak.tirumalesh.tangudu@intel.com,
 =?UTF-8?q?Tapani=20P=C3=A4lli?= <tapani.palli@intel.com>
Subject: [PATCH v3] drm/xe/xe3: Apply wa_14024997852
Date: Wed, 29 Oct 2025 10:50:57 +0200
Message-ID: <20251029085057.54210-1-tapani.palli@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028205958.GE5409@mdroper-desk1.amr.corp.intel.com>
References: <20251028205958.GE5409@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Whitelist registers needed for userspace to control autostrip on xe3.

v2: fix GRAPHICS_VERSION to match xe3 (Matt)
v3: use GRAPHICS_VERSION_RANGE to match all xe3 (Matt)

Signed-off-by: Tapani Pälli <tapani.palli@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 690bc327a363..7ca360b2c20d 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -89,6 +89,13 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 				   RING_FORCE_TO_NONPRIV_ACCESS_RD |
 				   RING_FORCE_TO_NONPRIV_RANGE_4))
 	},
+	{ XE_RTP_NAME("14024997852"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(WHITELIST(FF_MODE,
+				   RING_FORCE_TO_NONPRIV_ACCESS_RW),
+			 WHITELIST(VFLSKPD,
+				   RING_FORCE_TO_NONPRIV_ACCESS_RW))
+	},
 };
 
 static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
-- 
2.51.0

