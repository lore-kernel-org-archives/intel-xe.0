Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A51CD1284
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 10:51:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5221D112CB3;
	Tue,  9 Apr 2024 10:51:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RRk4DDt1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E251127B7
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 10:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712659886; x=1744195886;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zLBwQz8Pll18LiRp0UqpaT4ie9K7idslE3XMFscCIdc=;
 b=RRk4DDt1bL2nanYWxBApjM+psJbPeLC262J7OxtInRNEXj4bNl/GrtMs
 d2jzqAkTzH7yPqWEo9UrxjUj7HQRldY2aHvAw/NnoxXYwIHoY168++omI
 V9unC5mTaPsFojA6q+Z8qichO219Cn23TGhxlFkPy4qoTcRGabhy++yGT
 d7KaYTDCQfTyEnzyhnbs1gvIICI+q/PlDrHiQsIKiuAJGXbpDjtsETmZs
 2+bYow5NRbMBC8UBGEYVGYT9dLCnwpcfe+bT86ZJ5wleGmasSoBBSp7KS
 /jRO35PJfwgkLtZ2YLpv5hNpRxPxzsy1Et4LOCM9Vobju7sqcH+eatNj3 g==;
X-CSE-ConnectionGUID: qAzmjdGVRRiQsFEGvDloqQ==
X-CSE-MsgGUID: mbNt4t2OS8+G1XDKP92G6g==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="10939847"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="10939847"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 03:51:25 -0700
X-CSE-ConnectionGUID: gx8dPxiDQfu/dpqMPUUTEw==
X-CSE-MsgGUID: 8rOo8wW2QWOvFD4s9EQxMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="24825641"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.158.230])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 03:51:24 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 1/2] drm/xe: Assert pat.ops function pointers
Date: Tue,  9 Apr 2024 12:51:05 +0200
Message-Id: <20240409105106.1067-1-michal.wajdeczko@intel.com>
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

Make sure that pat.ops (if selected) has all required function
pointers setup. Only .program_media may be omitted if we have
older media version.

This should help avoid late runtime checks against individual
function pointers.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 66d8e3dd8237..026e4a9fe124 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -428,6 +428,10 @@ void xe_pat_init_early(struct xe_device *xe)
 	/* VFs can't program nor dump PAT settings */
 	if (IS_SRIOV_VF(xe))
 		xe->pat.ops = NULL;
+
+	xe_assert(xe, !xe->pat.ops || xe->pat.ops->dump);
+	xe_assert(xe, !xe->pat.ops || xe->pat.ops->program_graphics);
+	xe_assert(xe, !xe->pat.ops || MEDIA_VER(xe) < 13 || xe->pat.ops->program_media);
 }
 
 void xe_pat_init(struct xe_gt *gt)
-- 
2.43.0

