Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD458F54ACE
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 15:37:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DE4210E70E;
	Tue, 24 Mar 2026 15:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lpnNLhxY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FBD710E70E
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 15:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774366661; x=1805902661;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BBQP0UfY9xRmnhydrim+S+W7w7WEP7dQVhZ32j0BdkM=;
 b=lpnNLhxYogppvVvtndBJ5T14Ew5FULol0SWlXRmwSDVz3Rfyh13u8w5h
 tmolgovpz7vmh32+jhJ6nj0gxPsEkYjUgsL/BnP3Mq+J4t6nn1Kx8xCRb
 vER4MAMyr7obhnLg29S34ZVqxJUmpWckLETvH4Fe9dLg6DaWFwPYiP/tP
 DZBNCnq/21s38WKCSabqZ66gBrjCgRKgPQP8y52Lse2Ng74jqUY9l+lod
 nczwuadxKKIcPLWffi+VQVX12PaTKEAPONngi41sEBVjsmI7uRCC0Y9Aa
 y17JfQlEILDjmpkkzXiJI0nEaMIC77pOK1KVl+9zbhD2rzlX8jabO6SaQ g==;
X-CSE-ConnectionGUID: zNYuHMyiQZeUpr9kHj9DPw==
X-CSE-MsgGUID: XQAMkBz5TS6fnAq2y1g2qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75102402"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="75102402"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 08:37:41 -0700
X-CSE-ConnectionGUID: DN3laIIXQ6C9uctb4hO3KA==
X-CSE-MsgGUID: +vxHGzS6STiigofGYokxcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="228863591"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 08:37:40 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v2 4/4] drm/xe/pxp: Don't allow PXP on older PTL GSC FWs
Date: Tue, 24 Mar 2026 08:37:23 -0700
Message-ID: <20260324153718.3155504-10-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324153718.3155504-6-daniele.ceraolospurio@intel.com>
References: <20260324153718.3155504-6-daniele.ceraolospurio@intel.com>
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

On PTL, older GSC FWs have a bug that can cause them to crash during
PXP invalidation events, which leads to a complete loss of power
management on the media GT. Therefore, we can't use PXP on FWs that
have this bug, which was fixed in PTL GSC build 1396.

Fixes: b1dcec9bd8a1 ("drm/xe/ptl: Enable PXP for PTL")
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
---
The current image in linux-firmware is still 1301, but 1397 is already
available in the intel-staging public branch and in it is going to
replace it once testing is done.
---
 drivers/gpu/drm/xe/xe_pxp.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
index aad3dfa3156e..7244090b0782 100644
--- a/drivers/gpu/drm/xe/xe_pxp.c
+++ b/drivers/gpu/drm/xe/xe_pxp.c
@@ -380,6 +380,18 @@ int xe_pxp_init(struct xe_device *xe)
 		return 0;
 	}
 
+	/*
+	 * On PTL, older GSC FWs have a bug that can cause them to crash during
+	 * PXP invalidation events, which leads to a complete loss of power
+	 * management on the media GT. Therefore, we can't use PXP on FWs that
+	 * have this bug, which was fixed in PTL GSC build 1396.
+	 */
+	if (xe->info.platform == XE_PANTHERLAKE &&
+	    gt->uc.gsc.fw.versions.found[XE_UC_FW_VER_RELEASE].build < 1396) {
+		drm_info(&xe->drm, "PXP requires PTL GSC build 1396 or newer\n");
+		return 0;
+	}
+
 	pxp = drmm_kzalloc(&xe->drm, sizeof(struct xe_pxp), GFP_KERNEL);
 	if (!pxp) {
 		err = -ENOMEM;
-- 
2.43.0

