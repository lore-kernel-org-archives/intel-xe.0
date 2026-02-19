Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE46C531E4
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 21:39:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E4310E75E;
	Thu, 19 Feb 2026 21:39:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TxqgpX1x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE6D10E75C;
 Thu, 19 Feb 2026 21:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771537162; x=1803073162;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J3wqUnhxgRS2rtgAzsaqWlWzoEIPlmSwGBjU5lxnwAM=;
 b=TxqgpX1x6+hhs58teHA8+mXELAPuUk0ASITRxNSSTLQJ9/wwq1rvmaHe
 JHeymez3SvLDz9/ScwdNOrfOahaAquo2cTNlnWQ7xYAwalOxWbJwzNdKk
 BiCTCLEoV/ZkovBokYF2YHFXPU5RSRIjSSu1g2iA6f0ouP4lQSsbS/FNi
 deUml3psUEILrhNcCd/9KGYHTgWLmsA8E9mTo7nC4T/kFIZa2SxXhvPa4
 E8xQVPx+hifVTN3P2/stzi1Yqd0G/eC8aAOyfUlrdJAn5ab4v4NnCkOYt
 KfFYe6IGWkJ4RbnzKBCEYM6wzKl2dkoPZhemlfFbke+NaU9nAhR0WWhPn w==;
X-CSE-ConnectionGUID: BSNqPokyTQeMf4BnjhJ9zQ==
X-CSE-MsgGUID: qWddM43nQAqzsXz57BLF9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="90044701"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="90044701"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 13:39:21 -0800
X-CSE-ConnectionGUID: vCfZLI4WTnWu+VhONT8EXQ==
X-CSE-MsgGUID: hrt+txn6SmurklkFGMKqig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="212526348"
Received: from vpanait-mobl.ger.corp.intel.com (HELO
 kkoning-desktop.intel.com) ([10.245.244.197])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 13:39:13 -0800
From: Koen Koning <koen.koning@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Joel Fernandes <joelagnelf@nvidia.com>,
 Matthew Auld <matthew.auld@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Koen Koning <koen.koning@linux.intel.com>,
 Chunming Zhou <david1.zhou@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 stable@vger.kernel.org
Subject: [PATCH v3 2/3] drm/sched: fix module_init() usage
Date: Thu, 19 Feb 2026 22:38:57 +0100
Message-ID: <20260219213858.370675-3-koen.koning@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260219213858.370675-1-koen.koning@linux.intel.com>
References: <20260216111902.110286-1-koen.koning@linux.intel.com>
 <20260219213858.370675-1-koen.koning@linux.intel.com>
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

Use subsys_initcall() instead of module_init() (which compiles to
device_initcall() for built-ins) for sched_fence, so its initialization
code always runs before any (built-in) drivers.
This happened to work correctly so far due to the order of linking in
the Makefiles, but this should not be relied upon.

Fixes: 4983e48c85392 ("drm/sched: move fence slab handling to module init/exit")
Cc: Chunming Zhou <david1.zhou@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Philipp Stanner <phasta@kernel.org>
Cc: "Christian König" <ckoenig.leichtzumerken@gmail.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: stable@vger.kernel.org
Signed-off-by: Koen Koning <koen.koning@linux.intel.com>
---
 drivers/gpu/drm/scheduler/sched_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index 9391d6f0dc01..d10c1163719f 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -235,7 +235,7 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
 		       &fence->lock, entity->fence_context + 1, seq);
 }

-module_init(drm_sched_fence_slab_init);
+subsys_initcall(drm_sched_fence_slab_init);
 module_exit(drm_sched_fence_slab_fini);

 MODULE_DESCRIPTION("DRM GPU scheduler");
--
2.48.1

