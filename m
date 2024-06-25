Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB21AC2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 14:13:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A25A110E655;
	Tue, 25 Jun 2024 14:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WZ+ozW6h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8097E10E655
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 14:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719324797; x=1750860797;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a9mBzk9iN2m4EaxNuGtbOu4MsSQopJBznsv3luXhcsU=;
 b=WZ+ozW6hnQAlihM3GbQBTfDVz6T2mbHgjKz9tSe7i/D+HE9nU8clOmuk
 XQVZyaF/fQcFbdFd8O3jjqONsmYCqRkq2XtLLvi03idpnMslXo1dGQqrB
 oHlpAw6J1ZqADQZR079K9S0jJkhe9OXaHADUQGAgZl3aq1SBAMoWBN3GI
 bOaSZGeS1nb9tCe3zrGAf+VdBIgXCEIvGltEdnsddFjaTpKiTl84SC2Fu
 MxMlj6ezGWIsH7Ik7lPfuHmMGCaE9ydeRSZIpuNnSiFO/9QtfGYF7QGta
 IMlJYxuGdW0anPMR/rrLwW3Qugx1GJon1YNoAs+ZzLcL5tF+uLL1QyVhb A==;
X-CSE-ConnectionGUID: YF4yAd5uQLOi9zE0yKqvLA==
X-CSE-MsgGUID: cMt6ui8KReibmEdATeIPCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16477111"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="16477111"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 07:13:17 -0700
X-CSE-ConnectionGUID: UrIViS2dRo2FV1KodbS6EA==
X-CSE-MsgGUID: z8yUNx+jStSscinUPeBmWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="44319370"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.34.68])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 07:13:15 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 3/3] drm/xe/guc: Print GuC error codes as hex value
Date: Tue, 25 Jun 2024 16:12:58 +0200
Message-Id: <20240625141258.1257-4-michal.wajdeczko@intel.com>
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

We maintain GuC error code values in hex format. Also print them
in that format for easier matching.

While at it, slightly reformat the log and add missing \n.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 91a8a969a6ad..873d1bcbedd7 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -882,7 +882,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		goto retry;
 	}
 	if (g2h_fence.fail) {
-		xe_gt_err(gt, "H2G send failed, action 0x%04x, error %d, hint %u",
+		xe_gt_err(gt, "H2G request %#x failed: error %#x hint %#x\n",
 			  action[0], g2h_fence.error, g2h_fence.hint);
 		ret = -EIO;
 	}
-- 
2.43.0

