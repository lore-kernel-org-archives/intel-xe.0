Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE25CF044B
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 10:36:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6022410E6DF;
	Wed,  9 Oct 2024 10:36:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dIHw5E+s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B758B10E6CD
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 10:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728470186; x=1760006186;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/jR4yuxYLkIZp8P19gU0WB4j7GqsbmtP3TeX9Qe6zYQ=;
 b=dIHw5E+sOfFidLnba1rsNXHwHf7y8N05NQk76LEAPVs5V1jaDJrrhz7N
 +Ftl1e3eZC2JH7fMoV2eoJiRBjksly4f1c3zEcGzxi3Xf7Xdw3nz02m5i
 cG98jeqnamxLqI1sqIQQz4vzazXmGcC/dYMlLQxH3cWIxQH+5LEm4lyDN
 X+WasKtwYmc8a8KGRbmapiZvBjdP0KPCKEKSQH2f7o2cWz+claxgRG0UB
 YfD/pGRXt7JrUPknfdGXgYu/sr1KaXEKoTXnByI+mWp0A8C+/5T5kMPZy
 dOu8BTzhcQIB9UUUvmyA77gTmN/jpRP8uAB6gfbpXxfMqs7eg08Q60VYu Q==;
X-CSE-ConnectionGUID: Ma9yH+LZQPOUFwD1emFHoQ==
X-CSE-MsgGUID: JJFAgMQdR8S6XzdsK/UrnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="39152333"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="39152333"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 03:36:26 -0700
X-CSE-ConnectionGUID: JOAPHI8WTPqS6A5henc7NQ==
X-CSE-MsgGUID: vX7YkE6wSTilxjW3zQdy2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="80191512"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.59])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 03:36:23 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, john.c.harrison@intel.com,
 rodrigo.vivi@intel.com, matthew.brost@intel.com, matthew.auld@intel.com
Subject: [PATCH 2/3] drm/xe/guc/ct: Increase wait timeout for g2h response
Date: Wed,  9 Oct 2024 16:26:44 +0530
Message-Id: <20241009105645.1416588-3-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241009105645.1416588-1-badal.nilawar@intel.com>
References: <20241009105645.1416588-1-badal.nilawar@intel.com>
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

Occasionally, the G2H worker starts running after a delay of more than
a second even after being queued and activated by the Linux workqueue
subsystem.
To prevent G2H timeout errors, the wait timeout is being increased.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2902
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index b93b2821e4e8..dcc95c01b6f0 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1019,7 +1019,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		return ret;
 	}
 
-	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
+	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ * 3);
 
 	/*
 	 * It is possible that the g2h request may be cancelled while waiting for a response due
-- 
2.34.1

