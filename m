Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11970C2BBCA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 21:46:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C832C10E325;
	Wed, 19 Jun 2024 21:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FGjMbxOZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1587B10E295
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 21:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718833588; x=1750369588;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=B8rwQBj4uo6ki3w5Wn3g49Ss7wApd/pET5tfCq0Dyh4=;
 b=FGjMbxOZ4dnTEYd1Y0rGmb5tYpkFESsscSFN+w0V8v1HGcy1HYtJb4nk
 VI6eQeyCc5NFh6LvhNYGIha0QRznci7ulmRW0Fpw9sxVKc/9/K58WJ5s6
 42z3tN1eTVJPLauz4LfG6VOYMUD04HCV0CdGd0GSbpNXV39JzuFYZxwO1
 4C3ZLz6LpBSaCt/xVTDujGzDENs9i4pGz3+uQDZslEawpL3+xiM5Yzpzn
 QzJTp0egWg6lyHan4tNCDHUL7mgyoQj9QnkFc9StCEv2r7qtPpYcYHO7m
 ZES03kG4kfh6h+WwpPlXWNS4qjiuCYZCHFuwGu7UJXSo9U0h9tZmhZ1AC A==;
X-CSE-ConnectionGUID: NC1Fh1r9RSmRl5wAnD0MWA==
X-CSE-MsgGUID: 6894QW/AS3mSUsBwhOKMuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15662975"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="15662975"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 14:46:28 -0700
X-CSE-ConnectionGUID: kb7rvDjrR4iAnwAw3GqsQQ==
X-CSE-MsgGUID: DblrPi1DQkqbTnoD9v+TqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="42157805"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.119.62])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 14:46:27 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/9] drm/xe/vf: Don't run any save-restore RTP actions if VF
Date: Wed, 19 Jun 2024 23:45:50 +0200
Message-Id: <20240619214557.905-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240619214557.905-1-michal.wajdeczko@intel.com>
References: <20240619214557.905-1-michal.wajdeczko@intel.com>
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

There are no RTP save-restore actions applicable for VFs on
current platforms. If any future platform will require some,
we will need to update the RTP framework to support VF_READY
or VF_ONLY actions. In the meantime, just skip all actions if
we are running as VF driver.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index ac31cba1dbea..5b27f7c45ea3 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -13,6 +13,7 @@
 #include "xe_gt_topology.h"
 #include "xe_macros.h"
 #include "xe_reg_sr.h"
+#include "xe_sriov.h"
 
 /**
  * DOC: Register Table Processing
@@ -257,6 +258,9 @@ void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
 
 	rtp_get_context(ctx, &hwe, &gt, &xe);
 
+	if (IS_SRIOV_VF(xe))
+		return;
+
 	for (entry = entries; entry && entry->name; entry++) {
 		bool match = false;
 
-- 
2.43.0

