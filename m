Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F928D711C8
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 21:29:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0286210EB73;
	Thu, 18 Dec 2025 21:29:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J/uAtQfd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F6110EAD9
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 21:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766093389; x=1797629389;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W5rWayGNIcqPTpSv4A0F/5pfEQa10iUpbWDjawg+wkU=;
 b=J/uAtQfdbnRDIj5QyTXDRW1pIB987VdBAo3nbQbZZ32NFER5x8wKHnD1
 SnYZas1slmRag8YvZsvfUvP0RHGFXz4kt+6qPKSS8D3p76qmsYdsB8RMw
 ZoyAsf8h0mZN337BROLVD5GRW7NgyHdpFNX+7mUo4QnCofHjoLOlWXbBU
 xN3P3xBYowEmALh7snHeXqg2SEAOdr/2ya/B2i4pA5VJqrRCrf9IWp/Gh
 XHoWgCQkFsX11Ql/1yXW6xzck1eIJWBr/YAt7o5r17NUwODcDGSsXshrb
 qTBk72dFzqkMm/JJiVdEX5/+U8DkJh4auFbSbDEGoCQgnXv/PTlwMg4/N g==;
X-CSE-ConnectionGUID: D8/dqQ2HSduAUd7ULjjtPw==
X-CSE-MsgGUID: DulxMgqoSjKXYSkddaSvxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67808711"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="67808711"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 13:29:49 -0800
X-CSE-ConnectionGUID: PaOd76ynSvqqRfsNc3cbWQ==
X-CSE-MsgGUID: HfOOi89HSQSKiT79oZdSMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="198594093"
Received: from dut4086lnl.fm.intel.com ([10.105.10.207])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 13:29:48 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com, daniele.ceraolospurio@intel.com,
 rodrigo.vivi@intel.com, michal.wajdeczko@intel.com,
 stuart.summers@intel.com, dixit.ashutosh@intel.com
Subject: [PATCH v2 2/4] drm/xe/guc: WRITE_ONCE g2h_fence done in
 parse_g2h_response
Date: Thu, 18 Dec 2025 21:29:49 +0000
Message-ID: <20251218212946.16577-8-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218212946.16577-6-jonathan.cavitt@intel.com>
References: <20251218212946.16577-6-jonathan.cavitt@intel.com>
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

