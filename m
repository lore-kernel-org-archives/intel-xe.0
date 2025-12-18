Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E01D6E2A5
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 15:35:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C518A10E84E;
	Thu, 18 Dec 2025 15:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CzOS9Mxg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD07110E84E
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 15:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766072130; x=1797608130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W5rWayGNIcqPTpSv4A0F/5pfEQa10iUpbWDjawg+wkU=;
 b=CzOS9MxgmG5pii1Y65AxpZ72cpHPTNciiurm+zlUJF68yaSHA8KIO1Dv
 laadaqyMi1pLtB5XMY4liVPnMX7lMWBtNNsZ1l/CCdBbk0wV4u7V3320y
 9+bGqo/NBC2x8Wq1FN14tUXti+fwJYVZyjU00zlW7AnbOMBOM1niBDodt
 Zu9KJsNxYA9oIJm8B8AG31cjdzfTEyqalc4KB9iturMp6XSDmbmsgvXXb
 enOnF5twpZeZCn5p6TM/BCUPKXShD952xFBDn/4uAuJ2IBcaAM86Xh4Eb
 ZzYgNrOoDCOxIXnYJeBMmASYebcMoF8W45uLoYAHbssXWnXrqHTAnyX0m Q==;
X-CSE-ConnectionGUID: dql3jRAMR8WZXko1wqUtBw==
X-CSE-MsgGUID: l53nHtKaRceY2VI/J2ckCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67906272"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="67906272"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 07:35:30 -0800
X-CSE-ConnectionGUID: l0vkc3uaRtKPbPJDqWdI9Q==
X-CSE-MsgGUID: XteN38I7QLCuBm12S9cF8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="236042223"
Received: from dut4086lnl.fm.intel.com ([10.105.10.207])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 07:35:30 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com, daniele.ceraolospurio@intel.com,
 rodrigo.vivi@intel.com, michal.wajdeczko@intel.com
Subject: [PATCH 2/6] drm/xe/xe_guc_ct: WRITE_ONCE g2h_fence done in
 parse_g2h_response
Date: Thu, 18 Dec 2025 15:35:30 +0000
Message-ID: <20251218153527.6436-10-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218153527.6436-8-jonathan.cavitt@intel.com>
References: <20251218153527.6436-8-jonathan.cavitt@intel.com>
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

Use WRITE_ONCE when operating on g2h_fence->done in parse_g2h_response
to prevent the compiler from ignoring this operation.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index d177df166d2a..38b58590c94b 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1500,7 +1500,8 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 
 	g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
 
-	g2h_fence->done = true;
+	/* WRITE_ONCE pairs with wait_event_timeout in guc_ct_send_recv */
+	WRITE_ONCE(g2h_fence->done, true);
 	smp_mb();
 
 	wake_up_all(&ct->g2h_fence_wq);
-- 
2.43.0

