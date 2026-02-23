Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04584EC1106
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 16:28:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA79010E3EA;
	Mon, 23 Feb 2026 16:28:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z926GavQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CFB10E3EA
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 16:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771864121; x=1803400121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f8UpJnED8buh68qEiHWsAE22pA50eL46B6u0+KTBlV4=;
 b=Z926GavQHMT4Aks2N+G79z19qoIJCvIZLUA0msqoLdkWHkcFrBiRjmmF
 6Rj8aYX5fTtm4KD4bzeL80ikbXKbfLqad1/MukkFMLzdsSoVtyQruvsO6
 3vEHI6uHrFJCV16EiPv+IXCLp10+MBW+bnU5rPjhHKCsYPh/VtC4pgq+q
 YOAjj8UYZZtjz/+QZE3V9uGBeh9lcISXdAbR7Xk5wJ94wC14XB0Wz+8iD
 mft3qg07G6v8gNKfXlOGxrj9Q9VZF3uxVAz6J+bqBqf9VgL4wsLINoNzY
 VeFmp5UIScFGzqXaf6MjrmzhZKosb6CmSxLQcne2yAiz7KZ3fnuw1A1EJ Q==;
X-CSE-ConnectionGUID: 36hUpO+WTlySUjHAPtpRoQ==
X-CSE-MsgGUID: 7XspTh5dTZ+C1hFhMLBoHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72073326"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72073326"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 08:28:41 -0800
X-CSE-ConnectionGUID: k9Qz5Dy6SzaWu1+ysAY1yw==
X-CSE-MsgGUID: cCNpPFF6ShWlSXHwH6DWLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="220609630"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa005.jf.intel.com with ESMTP; 23 Feb 2026 08:28:39 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/2] drm/xe/guc: Accumulate CT H2G retry sleep budget
Date: Mon, 23 Feb 2026 16:23:52 +0000
Message-ID: <20260223162350.3205364-5-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260223162350.3205364-4-shuicheng.lin@intel.com>
References: <20260223162350.3205364-4-shuicheng.lin@intel.com>
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

guc_ct_send_wait_for_retry() introduced sleep_total_ms as a
budget guard, but never incremented it. As a result, the
"about 1 second" bailout condition never triggers in the H2G
backpressure path.

Accumulate the delay returned by xe_sleep_exponential_ms() into
sleep_total_ms so the timeout logic works as intended.

Fixes: 943c4d0637cf ("drm/xe/guc: Limit sleep while waiting for H2G credits")
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 8a45573f8812..1c37813d2ccd 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1124,7 +1124,7 @@ static bool guc_ct_send_wait_for_retry(struct xe_guc_ct *ct, u32 len,
 						 h2g->info.size,
 						 h2g->info.space,
 						 len + GUC_CTB_HDR_LEN);
-		xe_sleep_exponential_ms(sleep_period_ms, 64);
+		*sleep_total_ms += xe_sleep_exponential_ms(sleep_period_ms, 64);
 	} else {
 		struct xe_device *xe = ct_to_xe(ct);
 		struct guc_ctb *g2h = &ct->ctbs.g2h;
-- 
2.50.1

