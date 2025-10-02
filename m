Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAAFCCD193
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 05:54:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E720F10E7A5;
	Thu,  2 Oct 2025 05:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JkHw/g3/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E11010E79F
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 05:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759384449; x=1790920449;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=KU2iDu1dMNhPjSiz1wTV4Dz6CGhLkM5XZ+cAqr+5ZBY=;
 b=JkHw/g3/0+859g+/pe0tk7za4NUepFrcCDQxFKySJpQYsyOezHnHdOaF
 75Z6nCLAnKLvVSzrX4HpDwHK76JnQ2OQowHIZOkfa2YBKP71B9K3xUPg7
 BpaAk9LnPr5AiaQvg5ijmmmKPCzGrZYwnch7XlYcNczYHV3Gd0A0XrBLi
 6Yb5czSzhoTl7y2ZC5TfndzCrYc+YjYfSox/PjefY7fZgTldyglWVMgxC
 DdGH/p7huV3Pbd/nPfk4sPE7OdteqdLDfEU7+i37xDyyd1euvh5jcNdtg
 ulGJbcZzwRcItEw47ixAx8ogz9pT3oARlKgkFP0khZUB4K2P4h0DKnxYF w==;
X-CSE-ConnectionGUID: V3Ts0myuTty25pqR0eSC6w==
X-CSE-MsgGUID: Xl/SlIBlSk+3APleGXuW/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65304523"
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="65304523"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 22:54:07 -0700
X-CSE-ConnectionGUID: rFHlbo+zTZ2CcWb3/dxGMg==
X-CSE-MsgGUID: 5Zh6YYgRTte4AVi8j2omRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="216083555"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 22:54:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 29/34] drm/xe/vf: Workaround for race condition in GuC
 firmware during VF pause
Date: Wed,  1 Oct 2025 22:53:57 -0700
Message-Id: <20251002055402.1865880-30-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002055402.1865880-1-matthew.brost@intel.com>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
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

A race condition exists where a paused VF's H2G request can be processed
and subsequently rejected. This rejection results in a FAST_REQ failure
being delivered to the KMD, which then terminates the CT via a dead
worker and triggers a GT reset—an undesirable outcome.

This workaround mitigates the issue by checking if a VF post-migration
recovery is in progress and aborting these adverse actions accordingly.
The GuC firmware will address this bug in an upcoming release. Once that
version is available and VF migration depends on it, this workaround can
be safely removed.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 92822d131612..6673576b096b 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1395,6 +1395,10 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 
 		fast_req_report(ct, fence);
 
+		/* FIXME: W/A race in the GuC, will get in firmware soon */
+		if (xe_gt_recovery_inprogress(gt))
+			return 0;
+
 		CT_DEAD(ct, NULL, PARSE_G2H_RESPONSE);
 
 		return -EPROTO;
-- 
2.34.1

