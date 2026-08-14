Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581CCC5CFC1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 17:19:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1482410F6E4;
	Fri, 14 Aug 2026 17:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HFVehvZQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3A310F6CE
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 17:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786727949; x=1818263949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dMPuODIgsWQcsYAH58GMpQmwtocy6NRQdK/HtHaaNlg=;
 b=HFVehvZQEVK9fw1fWGLktwpTUBhyZTs7yQFigL7+091cDzdCJdbY+e8a
 DR++wZsSU0qMx2zEhQNAAxstOEKoSioaCC/87m7mTBP2ezOOaT8wYsIz7
 5kRbsNI6N2JGaEyZfOLDBc2VodZo9MsrzJWSS22WXDhbOqK25HGGIB3yU
 2msgNLEpTV/zq/xLNDE+Lcxynzg2l4z+G2q0pFhw+mViS5GTd3jDfdZBh
 RvAiHluIO3BGiqyupZFu4CvT7hc67ek5Lt2kqaWcfA85mc4kVvSOiq4Un
 z+xptlqVcTJgUIhXyCimlQlLZG5qGUTx8bGCQP0ET/CS/onI/nkk3QuRu A==;
X-CSE-ConnectionGUID: IVhZUL9rQL6xVHl1C37wtA==
X-CSE-MsgGUID: 7cymcLi3R1qncy96MyEUXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="98464115"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98464115"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:19:09 -0700
X-CSE-ConnectionGUID: d4VLKYl2ROqKG+Ixo2o3RA==
X-CSE-MsgGUID: fi+QQijrRPeBZTTxU6161Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="262946351"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:19:07 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v5 28/33] drm/xe/pcode: Report 'initialization timedout' error
 using SIGID
Date: Fri, 14 Aug 2026 19:17:54 +0200
Message-ID: <20260814171801.13347-29-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814171801.13347-1-michal.wajdeczko@intel.com>
References: <20260814171801.13347-1-michal.wajdeczko@intel.com>
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

Report 'initialization timedout' error using xe_log_err() helper.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 14b13a11d1d6..e1b8062541a9 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -297,7 +297,7 @@ int xe_pcode_ready(struct xe_device *xe, bool locked)
 {
 	u32 status, request = DGFX_GET_INIT_STATUS;
 	struct xe_tile *tile = xe_device_get_root_tile(xe);
-	int timeout_us = 180000000; /* 3 min */
+	long timeout_us = 3 * 60 * USEC_PER_SEC; /* 3 min */
 	int ret;
 
 	if (xe->info.skip_pcode)
@@ -318,8 +318,8 @@ int xe_pcode_ready(struct xe_device *xe, bool locked)
 		mutex_unlock(&tile->pcode.lock);
 
 	if (ret)
-		drm_err(&xe->drm,
-			"PCODE initialization timedout after: 3 min\n");
+		xe_log_err(tile, PCODE, ret, "initialization timedout after %ld seconds\n",
+			   timeout_us / USEC_PER_SEC);
 
 	return ret;
 }
-- 
2.47.1

