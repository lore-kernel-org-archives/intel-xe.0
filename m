Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C022C54EFC
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jul 2026 17:27:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F4810E4BD;
	Mon, 27 Jul 2026 17:27:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n4IjEoTx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F242610E483
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Jul 2026 17:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785173238; x=1816709238;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vurP2JZrVNXApiQ75ZfqMR41uZ5AsTOslR1IlP4Uwy8=;
 b=n4IjEoTxMFAbHg5AMGx4hZtRAaHCKyD0sU2UoVj77j/uyilRM0awKxW3
 hKC6F7IVnoqYsxQnsSio6x/hBBXU5dQSJH4HRjBC8LngqYpATvgiwgM4A
 2blrkGgnfGSeTsc53IC/i4HOY/1p9l21d3Nqh5oIdOfZX2GcxP0JMNhNa
 iBPapt1d8nmdMbYzJB3svp5v9y0Lm2UdE0jPHB5jLtpT6g34Augsc9xdd
 NVHOn5LfxotMwmx0Zz2lOtfvzBbjGnTISRa1e5XGt8TnoyLq802YT/bbB
 tRm0uEFZg4iRPWQNgQ2nbwbOF1utXcvOAQhS4zU/iXrX5r8Ev0XuMC0x1 g==;
X-CSE-ConnectionGUID: 9L83RrABS06bO6uyiNLwTQ==
X-CSE-MsgGUID: C5lBVdTIS+C1JcBi1bi5MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="108542898"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; d="scan'208";a="108542898"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 10:27:17 -0700
X-CSE-ConnectionGUID: RrdOWU6WQrqQB8u1ghFMyA==
X-CSE-MsgGUID: 2PDKNVbeSCKuJ4sh1q3ejA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; d="scan'208";a="255159391"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 10:27:16 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v3 2/2] drm/xe/oa: Extend OAM unit hwe assignment for new dGfx
Date: Mon, 27 Jul 2026 10:27:12 -0700
Message-ID: <20260727172712.2877706-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260727172712.2877706-1-ashutosh.dixit@intel.com>
References: <20260727172712.2877706-1-ashutosh.dixit@intel.com>
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

dGfx vecs hwe's for media version 35.00 and later follow the same
assignment to OAM units as vcs engines.

Bspec: 77977

Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 21dbd98b2521f..56d51c40093df 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -2624,10 +2624,11 @@ static u32 __hwe_oam_unit(struct xe_hw_engine *hwe)
 		return XE_OA_UNIT_INVALID;
 	else if (!IS_DGFX(gt_to_xe(hwe->gt)))
 		return XE_OAM_UNIT_SCMI_0;
-	else if (hwe->class == XE_ENGINE_CLASS_VIDEO_DECODE)
-		return (hwe->instance / 2 & 0x1) + 1;
-	else if (hwe->class == XE_ENGINE_CLASS_VIDEO_ENHANCE)
+	else if (hwe->class == XE_ENGINE_CLASS_VIDEO_ENHANCE &&
+		 MEDIA_VERx100(gt_to_xe(hwe->gt)) < 3500)
 		return (hwe->instance & 0x1) + 1;
+	else
+		return (hwe->instance / 2 & 0x1) + 1;
 
 	return XE_OA_UNIT_INVALID;
 }
-- 
2.54.0

