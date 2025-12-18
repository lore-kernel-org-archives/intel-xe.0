Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63503D6E2AC
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 15:35:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D048810E975;
	Thu, 18 Dec 2025 15:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TGKm7Zvb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7793C10E950
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 15:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766072130; x=1797608130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=38B0ffl2fh6GcW0HoNJEUachOdhp0Nzl2jXW8v6f4O0=;
 b=TGKm7Zvbo3HahjPHF1dHbbiL52xp0uhWwJsvcMeu/AEHFm1vx2lwouc5
 TZYe6NURubMFgwuORz1wyHwedA03wtFbFkJupRVlofW4N2+HO8eIxXC93
 USzsNwJHcZ1bd77gPg70FmPZ25T0PfFionl/FPRGzCxXhwBjc8CVbCxEL
 4r/XhvP6e223nAWAg4O4BVFNLeM4MBU4Z2/39Bn+hjb0StWImHe9QnNQr
 A6Tp1lGOG9Iw4mPF1rpep7mj+e3gaYPKenwXLkZKZ7tCOfup0vF5TKSCf
 RF6PlP3s6cFacRWmnYu4cfm3utoBTxeSwkB3Oy2/oz0sSjb5FepnlYos8 Q==;
X-CSE-ConnectionGUID: 31DH7GNkR8GGOaaV8V6J8Q==
X-CSE-MsgGUID: nb+uWdpqR6aOsyHgAjUKNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67906271"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="67906271"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 07:35:30 -0800
X-CSE-ConnectionGUID: pUfMCXb3Svi2KEdgkHwm5w==
X-CSE-MsgGUID: gCfGI6lBTSeX+kiepOPwsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="236042220"
Received: from dut4086lnl.fm.intel.com ([10.105.10.207])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 07:35:29 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com, daniele.ceraolospurio@intel.com,
 rodrigo.vivi@intel.com, michal.wajdeczko@intel.com
Subject: [PATCH 1/6] drm/xe/xe_guc_ct: WRITE_ONCE g2h_fence done in
 g2h_fence_cancel
Date: Thu, 18 Dec 2025 15:35:29 +0000
Message-ID: <20251218153527.6436-9-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218153527.6436-8-jonathan.cavitt@intel.com>
References: <20251218153527.6436-8-jonathan.cavitt@intel.com>
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

Use WRITE_ONCE when operating on g2h_fence->done in g2h_fence_cancel to
prevent the compiler from ignoring this operation.

Fixes: 94de94d24ea8 ("drm/xe/guc: Cancel ongoing H2G requests when stopping CT")
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index c3df9b3f1b4d..d177df166d2a 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -206,7 +206,9 @@ static void g2h_fence_cancel(struct g2h_fence *g2h_fence)
 {
 	g2h_fence->cancel = true;
 	g2h_fence->fail = true;
-	g2h_fence->done = true;
+
+	/* WRITE_ONCE pairs with wait_event_timeout in guc_ct_send_recv */
+	WRITE_ONCE(g2h_fence->done, true);
 }
 
 static bool g2h_fence_needs_alloc(struct g2h_fence *g2h_fence)
-- 
2.43.0

