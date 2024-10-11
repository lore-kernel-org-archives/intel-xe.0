Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCCFD0D791
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 14:07:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E02BE10E154;
	Fri, 11 Oct 2024 14:07:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f/hsSPMP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA95A10E154
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Oct 2024 14:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728655660; x=1760191660;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lyKD+2N1e3w7ZDehh3RYOxh6saqANnxHCe0vh0jkPRA=;
 b=f/hsSPMPEmMdSSTjj0MAI1B65y8CuJJPMcsf0WS8dRGd+0oCyxsRS3Jo
 63BlVpkRudEAa2nB/7cCbrowzlLvRSp4sVnGIM016LtL1qLSyKxwp4Yyj
 yTUQh79IEdLYnC7+rfNdZEEXQEU18ajTC55ZBv4m+y+gawVr18w08g0RH
 Zgmwl1/IR7BR8EB/6Xh3RI9cOrSRRKmJZzWoVxikT9aTAAOaqp4vYnVV4
 YJkXqD6K/uEpibQEA9IBXdQiY4ZJuteaTpI0PFds5sdDwoYx7goB1qjrp
 r5vwLhupQMVuKjbegZa5E5ePUBWXSaoa9J84czwh9Za8Ys0qA5xJz+LXG w==;
X-CSE-ConnectionGUID: KI4FY9gCQhCP6B6zMrURig==
X-CSE-MsgGUID: hgF42yh1QOOhZ57KuTJLBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28213910"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="28213910"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 07:07:39 -0700
X-CSE-ConnectionGUID: LNtUFH2eQaKHmhzqXGMEpA==
X-CSE-MsgGUID: 5YY7U31bTISZ/v700fFZuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="77387576"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 07:07:37 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, stable@vger.kernel.org,
 Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/ufence: ufence can be signaled right after wait_woken
Date: Fri, 11 Oct 2024 15:25:32 +0200
Message-ID: <20241011132532.3845488-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

do_comapre() can return success after wait_woken() which is treated as
-ETIME here.

Fixes: e670f0b4ef24 ("drm/xe/uapi: Return correct error code for xe_wait_user_fence_ioctl")
Cc: <stable@vger.kernel.org> # v6.8+
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_wait_user_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index d46fa8374980..d532283d4aa3 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -169,7 +169,7 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 			args->timeout = 0;
 	}
 
-	if (!timeout && !(err < 0))
+	if (!timeout && err < 0)
 		err = -ETIME;
 
 	if (q)
-- 
2.46.0

