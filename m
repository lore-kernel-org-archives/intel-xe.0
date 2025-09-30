Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645FFCCD188
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 22:56:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6946E10E644;
	Tue, 30 Sep 2025 22:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XkOlw2nM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948E310E080
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 22:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759272994; x=1790808994;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OAEDf25IxOx4ynWEGwz0ocW+fOJjjg/+LgdTsN3asYk=;
 b=XkOlw2nM1MX05xks2OJOoQuXsjxwWomzw1faPljoCCtW02trD41eT5xy
 RgdLowa8IFgkfJ6Jo8lFLg4OEp3n/cDYGxd1eSmV9U5IXhkZoMAw5+g/I
 UyN1oDa8nQIqy7g6CIteFwL7WH2LlXoWFZDEfjpC98eKkOKN02DIj5QV5
 g1Gt8Ojv6GZhthvJTysaiW9O+vPAxZaZSkVOSbO0CfLnr6oOq0XjgCrze
 pbfHoc0rmn8u7nD3EEFtTxcJaY+U1ZhoJq4AkKybcvx3jCWRy8v7Z1aVB
 I2ZOYc1pR0uY4yiUAi1YPqFvU+kk1vZGW8oLW+/N914VBjDxkgGAocUA1 A==;
X-CSE-ConnectionGUID: jkUiH5qYTPOHN2lDXXK02A==
X-CSE-MsgGUID: 9h2jjwUqReCwKZfOrHaEJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65397758"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="65397758"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 15:56:33 -0700
X-CSE-ConnectionGUID: nENxIdYZSeaVgAozqXOgwA==
X-CSE-MsgGUID: mSYypQWBR12muOCayPrKuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="178229482"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 15:56:32 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v3 17/23] drm/xe: Bypass Wa_14018094691 when primary GT is
 disabled
Date: Tue, 30 Sep 2025 15:56:34 -0700
Message-ID: <20250930225618.140071-42-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930225618.140071-25-matthew.d.roper@intel.com>
References: <20250930225618.140071-25-matthew.d.roper@intel.com>
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

Don't try to lookup Wa_14018094691 on a NULL GT when the primary GT is
disabled.  If the primary GT is disabled, there's no mid-thread
preemption happening which would make this workaround relevant anyway.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 83d61bf8ec62..dd69cb834f8e 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -266,7 +266,7 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
 	unsigned int fw_ref;
 	int ret;
 
-	if (XE_GT_WA(tile->primary_gt, 14018094691)) {
+	if (tile->primary_gt && XE_GT_WA(tile->primary_gt, 14018094691)) {
 		fw_ref = xe_force_wake_get(gt_to_fw(tile->primary_gt), XE_FORCEWAKE_ALL);
 
 		/*
@@ -281,7 +281,7 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
 
 	ret = gsc_upload(gsc);
 
-	if (XE_GT_WA(tile->primary_gt, 14018094691))
+	if (tile->primary_gt && XE_GT_WA(tile->primary_gt, 14018094691))
 		xe_force_wake_put(gt_to_fw(tile->primary_gt), fw_ref);
 
 	if (ret)
-- 
2.51.0

