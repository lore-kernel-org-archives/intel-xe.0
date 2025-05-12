Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B19C3ABCB
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 16:20:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F83410E44F;
	Mon, 12 May 2025 16:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aeegCDN0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3F810E43B
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 16:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747066809; x=1778602809;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iW+k4AeqzqiKO99HMMGg2R0yHjw1S/LcH3tIwTqHFrU=;
 b=aeegCDN0KBBjJbstiaEiIbT6jaV76toVKKQXLqbcoueUjE7t/L+JoJPa
 Att8CmC+5dNFDmkX/YNyEYusIpQFkX3xhac4UVTKaseUEoZAzbg4YuD9F
 v733y9o4yN/hMhzgHUP3zdAUAO164aGKzASSvGPspgO6afsunKVrrvOAJ
 byHns3u/Sjrh2ZiUCboQxuSgaIqc57cjA3fBZWVQ+PcYSGiYoPgjaAann
 aFeUPjFOw0PFTbvDtEu/euhPqGdajdu/FZLlXL4CcM1P1euACMKyf8PT9
 xDSyGNgp/XsTxPqkvJdK9NNXgdrEYoqYuMWSMyglUrhmXOtz1dWSprepi A==;
X-CSE-ConnectionGUID: 8eMsrSxeR/GR5emtQOt4Tg==
X-CSE-MsgGUID: o/CSbYv1S5mLtTydaYQ3cA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="66282575"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="66282575"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 09:20:09 -0700
X-CSE-ConnectionGUID: RqfIVE3oSlipwkusuubsuA==
X-CSE-MsgGUID: MM+zAwebSliKygr1yOa8sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="142187537"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.179])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 09:20:07 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 John Harrison <john.c.harrison@intel.com>
Subject: [PATCH 2/2] drm/xe/guc: Suppress Dead CTB Dump during fault injection
 tests
Date: Mon, 12 May 2025 18:19:47 +0200
Message-Id: <20250512161947.128-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250512161947.128-1-michal.wajdeczko@intel.com>
References: <20250512161947.128-1-michal.wajdeczko@intel.com>
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

There is no point in generating a CTB dump due to a fault
injected by our tests, as it they will just stress our CI.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index ff6edf1b14f4..c21dc88099ab 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1964,6 +1964,10 @@ static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reaso
 	if (ctb)
 		ctb->info.broken = true;
 
+	/* Skip dumps during internal testing */
+	if (xe_fault_injection_in_progress(ct_to_xe(ct)))
+		return;
+
 	/* Ignore further errors after the first dump until a reset */
 	if (ct->dead.reported)
 		return;
-- 
2.47.1

