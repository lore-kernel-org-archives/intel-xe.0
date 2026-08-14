Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248AAC5CFCF
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 17:19:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D010910F6CF;
	Fri, 14 Aug 2026 17:19:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GpjBnUVo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D90810F6DF
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 17:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786727947; x=1818263947;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jRGTdwn/L1Z3tG3srTzrfUfX7HZQ64tkK6Jn/jECpS8=;
 b=GpjBnUVoJHJzuocY1eZgbdXYDQIrT0lmXn5q4g/Nv2nVVEZd5Ws1+295
 bCpj9waEmPe4aTxZkGahLqcu3IrB7mw/snYnEwUauHJVFBYrSGIld0nTo
 aFcsnbl8E3V/z3b+TkNJPeMqZG8uEfSuSOxBEkwSwORJL9Je6UlamWAzz
 YULDgfse0QO/K1EQoMKWua3CvrInjBTbYMs4Ny0PIlwuqs4Z2ChE76DeT
 gw3fws4zxebquLBbnrjT52sfs998JnVBPYKeI0ZT0xay51RVE5ztpdGx/
 oA0IRE3xPh6TW5bCq+p6FxekStuerk/gU7trCkcWNb+2NxDAnKKThdAkL g==;
X-CSE-ConnectionGUID: EH/sp9f4Q0CDn8VCabj4HQ==
X-CSE-MsgGUID: 9vGW/F9vS+GZNagTnqVrXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="98464109"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98464109"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:19:07 -0700
X-CSE-ConnectionGUID: +GnGhQAHTUK6wYLF2yr/xg==
X-CSE-MsgGUID: eiBiRqWARgqoZ6jWX97ONg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="262946314"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:19:05 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v5 27/33] drm/xe/pcode: Report 'timeout,
 retrying' error using SIGID
Date: Fri, 14 Aug 2026 19:17:53 +0200
Message-ID: <20260814171801.13347-28-michal.wajdeczko@intel.com>
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

Report 'timeout, retrying with preemption disabled' error using
xe_log_err() helper.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 014632e11338..14b13a11d1d6 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -218,8 +218,7 @@ int xe_pcode_request(struct xe_tile *tile, u32 mbox, u32 request,
 	 * requests, and for any quirks of the PCODE firmware that delays
 	 * the request completion.
 	 */
-	drm_err(&tile_to_xe(tile)->drm,
-		"PCODE timeout, retrying with preemption disabled\n");
+	xe_log_err(tile, PCODE, ret, "timeout, retrying with preemption disabled\n");
 	preempt_disable();
 	ret = pcode_try_request(tile, mbox, request, reply_mask, reply, &status,
 				true, 50 * 1000, true);
-- 
2.47.1

