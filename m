Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56D2C2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 14:13:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5601610E67F;
	Tue, 25 Jun 2024 14:13:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AJFi+XKC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7185810E667
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 14:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719324794; x=1750860794;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pUwFfOjY4IcoHbNp8HRXzLegnE9Wk7AKcU+bCiFeB68=;
 b=AJFi+XKC5dsLFFTz6lNKLD03x3RytbwOCG/+kp8tPzE+WZj9vKyZCOBH
 SkR0YSVavecYjK9rUOgJQnce/yC+hEYNCvqQQ8YuDzeOhisvPKocZiL6H
 tyRXHZn1fLYxNcr7aEZj2yC86OCNDSqMmWzcusXS00HL4ijhuJ0+JLUh8
 bc+/Y/Za8u9N1u/5bgmSSOBczifJyvtGhn4byeGfHAwPJlvfpbcfNTkJ1
 XuWAhw1dmBV0MJcFYZKnuR5pCoMgP1A9xrNnQFv4LnvQfHEpNK5wKP8hh
 QeeYtd4oYt9U9WEg9UrbbCerRjrb9ciwiVZsTKDxvTvqK7pQOIYF13QqM Q==;
X-CSE-ConnectionGUID: 2Xl108rIS86UQzUrspU2hw==
X-CSE-MsgGUID: xcdbCd4KRZei7XxutI/bdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16477100"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="16477100"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 07:13:14 -0700
X-CSE-ConnectionGUID: dm/dl7LCRkWMQclKTG32VQ==
X-CSE-MsgGUID: INDzHER5SZi0J822kdACRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="44319349"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.34.68])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 07:13:12 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/3] drm/xe/guc: Demote the H2G retry log message to debug
Date: Tue, 25 Jun 2024 16:12:56 +0200
Message-Id: <20240625141258.1257-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240625141258.1257-1-michal.wajdeczko@intel.com>
References: <20240625141258.1257-1-michal.wajdeczko@intel.com>
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

The G2H RETRY message sent by the GuC does not necessary indicate
any serious problem and can be a part of the normal communication
flow. Switch the log level from warning to more appropriate debug.
This will also let the CI ignore these logs which were seen in few
SR-IOV scenarios.

While at it, use hex to print the reason and add missing \n.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index b4137fe195a4..91a8a969a6ad 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -877,8 +877,8 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	}
 
 	if (g2h_fence.retry) {
-		xe_gt_warn(gt, "H2G retry, action 0x%04x, reason %u",
-			   action[0], g2h_fence.reason);
+		xe_gt_dbg(gt, "H2G action %#x retrying: reason %#x\n",
+			  action[0], g2h_fence.reason);
 		goto retry;
 	}
 	if (g2h_fence.fail) {
-- 
2.43.0

