Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE46FC021A8
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 19:36:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E99110E979;
	Wed, 12 Feb 2025 19:36:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fuShD48m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CFD910E21F
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Feb 2025 19:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739388995; x=1770924995;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AyojSpxwTLg7vbyEoIpqT9NQWbQOfZ3V1GWGz2WGlaI=;
 b=fuShD48mBweuo0TT93ZW+ppi7hq/s0fEH/ExbLk/qd8i3284lie2taYf
 PIGH32BPsgW9XUG0tfuUqs233DtIurr0hJCkY4sqonqVP4ybhuFVnwCHk
 +eM93NSdguQ3g6OY8wtdm7sIa4AL2cIMAv3mUQk+wqLZyk8dGFJlI02i0
 d8dMkhWn/c8qDNov6faMcxHzTjxBYsItr8p2OMOQm5g9PAy+n3b5iC4bh
 OxzWY5VxjMthH/rceAdz9Vr2ThifdYcTF1nnxKJtsqIxqvt3sP1HKbz37
 0IJ3M3Lh20LL3cVwxzkqn+sM9mAuPPghJ22+oYB3gL8rLlzeYqFyUozy2 A==;
X-CSE-ConnectionGUID: smivxbGzRFiCyYAnmWYnZQ==
X-CSE-MsgGUID: vCBRqvPJRPWQALMzD5xtJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40184243"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40184243"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 11:36:35 -0800
X-CSE-ConnectionGUID: pXbrU9SfRXWrPBWxrVBn2A==
X-CSE-MsgGUID: MOUGEVTPRh+jyrG0iYzIEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="113437870"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 11:36:35 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 06/13] drm/xe: Remove leftover pxp comment
Date: Wed, 12 Feb 2025 11:35:53 -0800
Message-ID: <20250212193600.475089-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212193600.475089-1-lucas.demarchi@intel.com>
References: <20250212193600.475089-1-lucas.demarchi@intel.com>
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

Not being able to initialize pxp is fatal if the platform is expected to
have it. Update comment after commit 9c9dc9ba4a00 ("drm/xe/pxp: Fail the
load if PXP fails to initialize").

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index c8d0a100200c9..37bac39d74ba6 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -878,7 +878,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_fini_oa;
 
-	/* A PXP init failure is not fatal */
 	err = xe_pxp_init(xe);
 	if (err)
 		goto err_fini_display;
-- 
2.48.1

