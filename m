Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB9CC53200
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jul 2026 23:07:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0663610E0C3;
	Wed, 29 Jul 2026 23:07:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dm/FTFCL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0A810E0AB
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jul 2026 23:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785366415; x=1816902415;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ms27ao1I1mbYmolIO53t7+8iHQQcFxvu8vlp5tO7/ZE=;
 b=dm/FTFCLQTaMy+xm2C8biElsezbmJg2YdkeOX8JZW9hupq1xi5D24ye1
 9nc8E0QcvuTjAocMXaxP/oig5pk988wIeZ55qIHfcoZNPHerKPsE7B0co
 WPZypMaZ0mG9k+953GNPFSKnrgbPlgP6nDmAEZcKFP3Wb9dx6TYp/gQOz
 3QDorxS5aIPVSSmPcgL3ZrrKTQrVSNxYLCp3w6j4huRC6I8NPd2pjHGB0
 8U0iAmxRo19NJ9Dx/rmYjxQ6sFEcjDU7CACAC0gXMFJuT+hUPzKKUTRmY
 3ix1i6YEh6B3MJDAl97lf5nl2vSmX2ni5xn1Dg62WL3XeW3AQhbLpnFaV w==;
X-CSE-ConnectionGUID: XWzoQgFjTK+yXG6hfbUKnQ==
X-CSE-MsgGUID: TcvjEdXuR96+272Xpn1SXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96568380"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="96568380"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 16:06:54 -0700
X-CSE-ConnectionGUID: iiheEBv2TzGCKUQGSwcYKQ==
X-CSE-MsgGUID: axETZv32QTqmVfeNxMtEzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="255824518"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 16:06:54 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v4 2/2] drm/xe/oa: Extend OAM unit hwe assignment for new dGfx
Date: Wed, 29 Jul 2026 16:06:45 -0700
Message-ID: <20260729230645.3052178-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260729230645.3052178-1-ashutosh.dixit@intel.com>
References: <20260729230645.3052178-1-ashutosh.dixit@intel.com>
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

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index b3acbcd678b7c..cb526de0ef87f 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -2577,10 +2577,11 @@ static u32 __hwe_oam_unit(struct xe_hw_engine *hwe)
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

