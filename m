Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64772CCF9F0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 22:24:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B85210EA61;
	Thu, 30 Oct 2025 22:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JoXKGn/f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7191D10EA62
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 22:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761863059; x=1793399059;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y9m/lou6gzxyFqW7uQZKrdP40VEph/aSsX8S2bao2BA=;
 b=JoXKGn/fEPG76zObgAwhg7js9hhRSR9zyF8CxyHXELa0PoorxlH84FA6
 MC1aC/A9qp5vJbCwvDOzvykbclqA3CfTHnKxHQ0JlYSb0PYV5I3qk4MfK
 T+vPPtTu0do5pqLkhpZbkDv/bKMWgne5SczzqUhNzLeGBKTXXhBzpah6G
 GbkZE4rtrtjtjoZe8Xiyki6g4OSB+nyAmJutxZyJrDC1ksP8enesV+qoG
 LSEfpS+lrL2ItLKExd0unYyM11erFs/GXK5K11J7QR85mb5u5Ud9TFyDu
 chDxHB0b/cvRy4rcBesV1bECdxIif+PkdOyUte+ne9Gp1CyuQAzyCo+Y4 Q==;
X-CSE-ConnectionGUID: twCG005tSierQsXV9kB9rw==
X-CSE-MsgGUID: h5GkhjWpQ1CWGgqAamL8lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64059948"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="64059948"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 15:24:19 -0700
X-CSE-ConnectionGUID: /WaGoFrQTGqyTPm6ScfHvA==
X-CSE-MsgGUID: Xpj/XLTtRdiE9KKNIqaNvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185346448"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 15:24:18 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 07/17] drm/xe/pf: Fix signature of internal config helpers
Date: Thu, 30 Oct 2025 23:23:38 +0100
Message-ID: <20251030222348.186658-8-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030222348.186658-1-michal.wajdeczko@intel.com>
References: <20251030222348.186658-1-michal.wajdeczko@intel.com>
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

Both pf_get_exec_quantum() and pf_get_preempt_timeout() should
return u32 as this is a type of the underlying data.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 169f975ade56..1a6c50af79d3 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1727,7 +1727,7 @@ static int pf_provision_exec_quantum(struct xe_gt *gt, unsigned int vfid,
 	return 0;
 }
 
-static int pf_get_exec_quantum(struct xe_gt *gt, unsigned int vfid)
+static u32 pf_get_exec_quantum(struct xe_gt *gt, unsigned int vfid)
 {
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
 
@@ -1830,7 +1830,7 @@ static int pf_provision_preempt_timeout(struct xe_gt *gt, unsigned int vfid,
 	return 0;
 }
 
-static int pf_get_preempt_timeout(struct xe_gt *gt, unsigned int vfid)
+static u32 pf_get_preempt_timeout(struct xe_gt *gt, unsigned int vfid)
 {
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
 
-- 
2.47.1

