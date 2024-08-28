Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6731AC7113C
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 21:08:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3525810E5EB;
	Wed, 28 Aug 2024 21:08:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jLV/OPq9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2750010E06F
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 21:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724879336; x=1756415336;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dOshc1ASewyuHqCsXk9sM1m/EtCsz2bPtXsAiYjpl1o=;
 b=jLV/OPq9wqXr3cBjfcYN/7cCWahp5Em8fLg/J2bilnEj7+OAn2dT/f6n
 3KqyvL+NCzMgIIcpmC54QvJJQ19tdoiyBCy+EYq8AwyfQTjGnPFbhTMRW
 hKLFmf4LAf4x65qLl/rPT4bYWhE1rT+j2zGpm9TNI0e2SRSThFJp6HRjX
 PzCdmEA6tmiMKNyLTX4aew/Amt4y9lgctWJgQiwFGG+n/a1cWH5jA+LMt
 f+Z201vDFhs5Eo856mynpXZvNf3lisxnq49L/MFtBnyYHEQ+qhEPtLgbT
 aM+UeYFIA14JRcqi2m0sJOIs09aWoabUWqNg7iQHg7TkkJwm86s0huao4 g==;
X-CSE-ConnectionGUID: /MZ1VipIQvKIMTriOv3huw==
X-CSE-MsgGUID: n8KladiATI6sqhvkwy68vA==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23626044"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="23626044"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 14:08:55 -0700
X-CSE-ConnectionGUID: aiBfu4amSQuIl23L1ohf5A==
X-CSE-MsgGUID: sCu8xH7/R3Gzk0O/DiV78g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="67720247"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.82.99])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 14:08:56 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 3/4] drm/xe/pf: Drop GuC notifications for non-existing VF
Date: Wed, 28 Aug 2024 23:08:08 +0200
Message-Id: <20240828210809.1528-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240828210809.1528-1-michal.wajdeczko@intel.com>
References: <20240828210809.1528-1-michal.wajdeczko@intel.com>
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

It is unlikely that GuC will ever send a G2H notification with an
invalid VFID and it is currently harmless if that actually happen.
But in upcoming patches we will start using that VFID as an index
and we must be sure it is a valid to avoid a crash due to a buggy
firmware or a currupted G2H message.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index d11839d9e7d4..ad447d867e51 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -8,6 +8,7 @@
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_gt_sriov_pf_control.h"
+#include "xe_gt_sriov_pf_helpers.h"
 #include "xe_gt_sriov_printk.h"
 #include "xe_guc_ct.h"
 #include "xe_sriov.h"
@@ -212,6 +213,11 @@ static void pf_handle_vf_flr_done(struct xe_gt *gt, u32 vfid)
 
 static int pf_handle_vf_event(struct xe_gt *gt, u32 vfid, u32 eventid)
 {
+	xe_gt_sriov_dbg_verbose(gt, "received VF%u event %#x\n", vfid, eventid);
+
+	if (vfid > xe_gt_sriov_pf_get_totalvfs(gt))
+		return -EPROTO;
+
 	switch (eventid) {
 	case GUC_PF_NOTIFY_VF_FLR:
 		pf_handle_vf_flr(gt, vfid);
-- 
2.43.0

