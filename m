Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B1BD43370
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 06:18:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8C110E4EB;
	Fri, 12 Dec 2025 06:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GUvZBvrB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3970610E16F
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 06:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765520337; x=1797056337;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xMjIXwc+4mG+USu+mkDG+kEHMqIXf+Aq4zy0kakp0Hc=;
 b=GUvZBvrBBgkMy6w0MjClT0//ZiWpov6QRNqzMOxtvRIeLUT6rAVo3XOE
 7fxLfBxvjumoZddFZp9tuiTdBn2nqGvBw9mz9uf45Chx0gMAynlpDAgoA
 rYFaw6lc4OeOFQmKWpq+0SwMvrKP4yfWnboRa+okL6+jsNodl8OyBu/Bt
 w7YPFCpOv2buZfeulOsIvICt5WSythJanoljQcQ1K0nmi3ec8FFkCquSo
 yb8MpjFzJvdv4CEg/50s4nC10oeet3RfWjcxKckNcmSIwgQ3oXEOtYWRz
 NOmNAc/1KIEXSHXV2J0FpKL6yRyHMxuJxMnXXT6KamDmiGNkwZOIgwEiE Q==;
X-CSE-ConnectionGUID: fo0gATTpSlGLucOdcFG9RA==
X-CSE-MsgGUID: InvY4oWwTuOiu02BcWhjxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67557155"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="67557155"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 22:18:56 -0800
X-CSE-ConnectionGUID: Glyl1poFR028g0v9w17tTw==
X-CSE-MsgGUID: 3ssmJoaHR3mKFJMbXT9ixQ==
X-ExtLoop1: 1
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 22:18:56 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>, peter.senna@intel.com
Subject: [PATCH 2/3] drm/xe/oa: Disallow 0 OA property values
Date: Thu, 11 Dec 2025 22:18:49 -0800
Message-ID: <20251212061850.1565459-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251212061850.1565459-1-ashutosh.dixit@intel.com>
References: <20251212061850.1565459-1-ashutosh.dixit@intel.com>
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

An OA property value of 0 is invalid and will cause a NPD.

Reported-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6452
Fixes: cc4e6994d5a2 ("drm/xe/oa: Move functions up so they can be reused for config ioctl")
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 46a79b60585b8..bba7bfbdd78b7 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1343,7 +1343,7 @@ static int xe_oa_user_ext_set_property(struct xe_oa *oa, enum xe_oa_user_extn_fr
 		     ARRAY_SIZE(xe_oa_set_property_funcs_config));
 
 	if (XE_IOCTL_DBG(oa->xe, ext.property >= ARRAY_SIZE(xe_oa_set_property_funcs_open)) ||
-	    XE_IOCTL_DBG(oa->xe, ext.pad))
+	    XE_IOCTL_DBG(oa->xe, !ext.property) || XE_IOCTL_DBG(oa->xe, ext.pad))
 		return -EINVAL;
 
 	idx = array_index_nospec(ext.property, ARRAY_SIZE(xe_oa_set_property_funcs_open));
-- 
2.48.1

