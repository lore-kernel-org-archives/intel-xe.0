Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B1DC5AD49
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 09:02:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B5F510E57B;
	Wed, 28 May 2025 09:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DfQ/BPJh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB34310E5A6
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 09:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748422922; x=1779958922;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mIjcDkKgDV1TtVZ3aXCo5JMjAzmgtPDc2svvf/v1Jh4=;
 b=DfQ/BPJhyc/XqQf9AJu8hnkL3ywZBrF/y/3ZgHZgIBlKlQXX6n7mKS4Y
 c/WDuGdo7enoTVgokSwXNQWVEggWWioVru1nmrP/hDEx6KQ+Ylw7YFlia
 nUK0ftY9LjysZZKJ9J1NDS+umRMiO6FbAuuxk/FKViAaoFj1uXLeEhDDf
 sjMvSHrG1/4dbbc+H5lRvyFHmsX/ldsYF5xLM5gs/C1zA09Hhl//rr3GJ
 vcYZntw0+i3wlt30+jp7K4rwWXVKGeGQ9l2XuFmnSYvoTZDz9qro2qdeM
 WsIppCiNV1zEkEJGIvFELoI2X/MoWK0ms9e9pySDJnAgKnS5vray/+Zbn Q==;
X-CSE-ConnectionGUID: K+bPz7ZJTKmV/QEI97JoNg==
X-CSE-MsgGUID: ++YCMsYxTZS0DoBfm9Fjog==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50325755"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="50325755"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 02:02:01 -0700
X-CSE-ConnectionGUID: /va1Ov03QCmHTVhnoDYJlw==
X-CSE-MsgGUID: OzPzIZV9T72f/PRGezF/mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="143011212"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.84.121])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 02:02:00 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH] drm/xe/guc: Resend potentially lost H2G MMIO request
Date: Wed, 28 May 2025 11:00:21 +0200
Message-Id: <20250528090021.329-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

There could be a scenario where the VF driver is resuming faster
than the driver PF is able to complete the VF FLR sequence which
includes reset of the VF scratch registers.  This may result in
deletion of the ongoing HXG message (it could be either a host
request or a GuC response).

When we detect that HXG message was likey lost (scratch register
with HXG header was zeroed) try to send this request once more
before giving up.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 350434a8b953..52453845d1bd 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1289,6 +1289,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 	struct xe_reg reply_reg = xe_gt_is_media_type(gt) ?
 		MED_VF_SW_FLAG(0) : VF_SW_FLAG(0);
 	const u32 LAST_INDEX = VF_SW_FLAG_COUNT - 1;
+	bool lost = false;
 	int ret;
 	int i;
 
@@ -1322,6 +1323,12 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 			     FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_GUC),
 			     50000, &reply, false);
 	if (ret) {
+		/* scratch registers might be cleared during FLR, try once more */
+		if (!reply && !lost) {
+			xe_gt_dbg(gt, "GuC mmio request %#x: lost, trying again\n", request[0]);
+			lost = true;
+			goto retry;
+		}
 timeout:
 		xe_gt_err(gt, "GuC mmio request %#x: no reply %#x\n",
 			  request[0], reply);
-- 
2.47.1

