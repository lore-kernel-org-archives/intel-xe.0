Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1742EC531FC
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 20:11:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B54610E0C5;
	Fri, 24 Jul 2026 20:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NFglER3Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1930D10E0B5
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 20:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784923894; x=1816459894;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Mob4cEzlUDHRof/HN6/G3UotWMtgnUdOdoOO0e+SqAk=;
 b=NFglER3YophZqrQr8wK5ke2bx2Mu4s+WCgKEpFJT/wdGCptS1sV097nU
 mUhauI2FrAygZbe7MpSJOitBTMxZRpj1oV9ZTiZnLcUuy6X8fWSAfUQ98
 /oM9fBsY0pIevzaRyQ43QxoFnS/Eiuhldx08pNY7KM9HNsJl/qRzGfsyS
 5XFVFLuwKZ0EMbB0PAwwP6Yf13PLpUXteWsITD2SKX+7MxhUMPc9p16xB
 Or1qUy+engD9Z4Zo0XKZuzq3lrCMaMbK24AmIFtcM69vuLPmeaWEVUpiI
 tvJn1f4lgim6356PRbgDX/a4wtbxs2LPXpA0d5iept0qR0nyZ8qqCFPZb A==;
X-CSE-ConnectionGUID: oqrncCDeT2+9QMkmS7G5MQ==
X-CSE-MsgGUID: 5CwoU2XfSv6slhs68YfgTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11855"; a="89268051"
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; d="scan'208";a="89268051"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 13:11:33 -0700
X-CSE-ConnectionGUID: UhjlNLwEQeyH4jP83l+FNw==
X-CSE-MsgGUID: QP1OCP4gTnew2C03fOjyyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; d="scan'208";a="258241799"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 13:11:33 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 2/2] drm/xe/oa: Extend OAM unit hwe assignment for new dGfx
Date: Fri, 24 Jul 2026 13:11:29 -0700
Message-ID: <20260724201129.2814030-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260724201129.2814030-1-ashutosh.dixit@intel.com>
References: <20260724201129.2814030-1-ashutosh.dixit@intel.com>
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

