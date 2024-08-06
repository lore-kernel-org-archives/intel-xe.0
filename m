Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8CAC52D70
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 18:05:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 946D489A5E;
	Tue,  6 Aug 2024 18:05:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XfsLEc1t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5AF489A5E
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Aug 2024 18:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722967540; x=1754503540;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=X3rlTzhVe2PqabVDrUt+HD25c2wMZExgY/HsqYbX6/E=;
 b=XfsLEc1tpj1M0i71NOQmUb3DsjR8XJ4Vrsp+mehiEIMwynwpETTpcTts
 3GPXSXyH11vS9wycyF9wkUq2RuOSsPTcFNM/FKVF6YHA/ny91qJPlV3UG
 cyRhP0ts+uZt7xpVsgl4gDYAVdlY9YtZexw++iJO+7wNn13/kWFHcKUlD
 DXN1ZnATyu4bLKL0ChlWds4OwBcsyMvwE1EJ/kokq2Q2ceITPKGV5WQhq
 aMl8b6n8+ctWFmj3wIj7Kayh2xUF9N1gCNAqGcQ87YIGGU5B9Mq2pVk5M
 tT+UpQKOGbkFE5v4DJ7XqQwh5aIVQepVvfA9lSQ9bdykefcwOHfVH5oIV w==;
X-CSE-ConnectionGUID: SjbkpHmjRmGW0YGiT4sOnw==
X-CSE-MsgGUID: 11ClsSFDSTK1ohONIf8GZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="20578824"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="20578824"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 11:05:39 -0700
X-CSE-ConnectionGUID: sjqgw2mUSKeOk5cSo1kXZw==
X-CSE-MsgGUID: oDYID/7kQ92qvULJxrYnQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="61540531"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 11:05:37 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH] drm/xe/pf: Fix VF config validation on multi-GT platforms
Date: Tue,  6 Aug 2024 20:05:16 +0200
Message-Id: <20240806180516.618-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

When validating VF config on the media GT, we may wrongly report
that VF is already partially configured on it, as we consider GGTT
and LMEM provisioning done on the primary GT (since both GGTT and
LMEM are tile-level resources, not a GT-level).

This will cause skipping a VF auto-provisioning on the media-GT and
in result will block a VF from successfully initialize that GT.

Fix that by considering GGTT and LMEM configurations only when
checking if a VF provisioning is complete, and omit GGTT and LMEM
when reporting empty/partial provisioning.

Fixes: 234670cea9a2 ("drm/xe/pf: Skip fair VFs provisioning if already provisioned")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 52c7277d243d..227527785afd 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1928,6 +1928,7 @@ static int pf_validate_vf_config(struct xe_gt *gt, unsigned int vfid)
 {
 	struct xe_gt *primary_gt = gt_to_tile(gt)->primary_gt;
 	struct xe_device *xe = gt_to_xe(gt);
+	bool is_primary = !xe_gt_is_media_type(gt);
 	bool valid_ggtt, valid_ctxs, valid_dbs;
 	bool valid_any, valid_all;
 
@@ -1936,13 +1937,17 @@ static int pf_validate_vf_config(struct xe_gt *gt, unsigned int vfid)
 	valid_dbs = pf_get_vf_config_dbs(gt, vfid);
 
 	/* note that GuC doorbells are optional */
-	valid_any = valid_ggtt || valid_ctxs || valid_dbs;
-	valid_all = valid_ggtt && valid_ctxs;
+	valid_any = valid_ctxs || valid_dbs;
+	valid_all = valid_ctxs;
+
+	/* and GGTT/LMEM is configured on primary GT only */
+	valid_all = valid_all && valid_ggtt;
+	valid_any = valid_any || (valid_ggtt && is_primary);
 
 	if (IS_DGFX(xe)) {
 		bool valid_lmem = pf_get_vf_config_ggtt(primary_gt, vfid);
 
-		valid_any = valid_any || valid_lmem;
+		valid_any = valid_any || (valid_lmem && is_primary);
 		valid_all = valid_all && valid_lmem;
 	}
 
-- 
2.43.0

