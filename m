Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FE8C67861
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 14:36:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7848F10EC9D;
	Fri,  5 Apr 2024 14:36:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SM/SSZag";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A029210EC9D
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 14:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712327795; x=1743863795;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=28e+rG765HUVhOVVgfdAqhS+hfABJM8M2rzSTLBdbDA=;
 b=SM/SSZagZIVafTAlShJ3yLBAcv7Ns2FIwf+NZRVmUs/HkXFrt8vvBOal
 V75Ch3IeUkuymDfgD7f+lSuAlkRmYZeLkKEeB7jMWzhOe4wHsLVRRRUEq
 1e1iChCyIEK8m1ktgvl5+C/BEHPMRdz6yv9lwGgyknavL0Ls0DyuQLNyV
 3ZmY9XwTvZFKQvJ9MC0mi3CgvhmSyXk8u9dju/92QjHtk9pAiJwYMkuVI
 mwqX4x7jthEpf9Ml7vViGTZFdF2VS1oMCD4siojyV5xyrl17mvuZ+SDsm
 DVHCEnUKd0I/AY0/FNrkgUot5eAwc4qywNOW+7iNFcU99OYuH35sjWRA4 A==;
X-CSE-ConnectionGUID: wq8iG50aS3G7NWyiLcRo4Q==
X-CSE-MsgGUID: RR1cg03IT8evRnXIalfGTg==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="11434674"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="11434674"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 07:36:34 -0700
X-CSE-ConnectionGUID: pQxf/S/RTF69tqEzqcl1QQ==
X-CSE-MsgGUID: 4kXp85meQteZRsUJ85NZZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="19635923"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.143.198])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 07:36:33 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Check pat.ops before dumping PAT settings
Date: Fri,  5 Apr 2024 16:36:25 +0200
Message-Id: <20240405143625.935-1-michal.wajdeczko@intel.com>
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

We may leave pat.ops unset when running on brand new platform or
when running as a VF.  While the former is unlikely, the latter
is valid (future) use case and will cause NPD when someone will
try to dump PAT settings by debugfs.

It's better to check pointer to pat.ops instead of specific .dump
hook, as we have this hook always defined for every .ops variant.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 66d8e3dd8237..f0031c2e9818 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -447,7 +447,7 @@ void xe_pat_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 
-	if (!xe->pat.ops->dump)
+	if (!xe->pat.ops)
 		return;
 
 	xe->pat.ops->dump(gt, p);
-- 
2.43.0

