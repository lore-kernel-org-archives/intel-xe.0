Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E24CC531FC
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 21:25:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCF1610E471;
	Fri, 24 Jul 2026 21:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LhSAg6w/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4631410E471
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 21:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784928301; x=1816464301;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Mob4cEzlUDHRof/HN6/G3UotWMtgnUdOdoOO0e+SqAk=;
 b=LhSAg6w/fRL7xz7kSwcuWBH/nobMba5Kah8fBmNDM3W7/dJ7TCg5RelF
 JX3HBDCajd0XE3PeCCn3OW71a4jRXOCzF+rGEQ/pzlufoBHOcZL29xLwA
 HyFTB4n/b5MqPYq0YMvvE90q7VlzQjkZ8QuRKW6ymLqj/NBlJptzkciiV
 e4Nwy3Two4Br45j5leL/aD2MSS1iS/wAmAde/mwBD+7ZcpuXycBDxDUmt
 2A6ozs3nHwPTvOhT1OWUcXY5u9v9+m6s2e3E1qU7iAI5mPFH97d8+aaEU
 r74Gq9T0NIh3zyoPi85kGKIXJXp/oTL1wtnF5QU+WpKk7oEDFiwTiBHQ1 Q==;
X-CSE-ConnectionGUID: F/pTjVZMROqhscRFMHxYuA==
X-CSE-MsgGUID: /cnMjUXLQpmIw1I0PUZOXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11855"; a="84580176"
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; d="scan'208";a="84580176"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 14:25:00 -0700
X-CSE-ConnectionGUID: 0so/wG2sSx6i4Vc1L3htmw==
X-CSE-MsgGUID: s76O5x6tTSafF433qa+vfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; d="scan'208";a="254886713"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 14:25:00 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v2 2/2] drm/xe/oa: Extend OAM unit hwe assignment for new dGfx
Date: Fri, 24 Jul 2026 14:24:54 -0700
Message-ID: <20260724212454.2823014-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260724212454.2823014-1-ashutosh.dixit@intel.com>
References: <20260724212454.2823014-1-ashutosh.dixit@intel.com>
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
index 21dbd98b2521f..44dc0574f34e1 100644
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
+		 MEDIA_VERx100(gt_to_xe(hwe->gt)) < 3500 )
 		return (hwe->instance & 0x1) + 1;
+	else
+		return (hwe->instance / 2 & 0x1) + 1;
 
 	return XE_OA_UNIT_INVALID;
 }
-- 
2.54.0

