Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D649D0D788
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 12:39:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A9F910EADB;
	Fri, 11 Oct 2024 12:39:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LknPRI6C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6789E10EAD6
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Oct 2024 12:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728650362; x=1760186362;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QnwraeRBQwLmpM0ZhIyjjhTj3WuBUCC0rTCXV+udk2U=;
 b=LknPRI6C/8T+15/poR+TtrjooIOkVp5Rdw2M1qVJzPHw2xr4tjTpqqmB
 3DCQJAF3u7ECXjNf9dbf4Abrx03sTiW6N72iZ/9MLXAcZIlRZD6eOtFGY
 IVWciYY+ixXmnPLqVx7G7WkrqN/x3IoVS9BMGeZ1JJ79ish3EzXxnYXKe
 2OGvZ5MY01Gq/pvweVk4yi8ttT0EVpoRcTGxqEaR1+KMJaNHznRhQFPsD
 pIj+B09sGgTw3xNWLLYut15NadyArdCAL4iT1O0O2Q2Or6Lhyz5GnK5ua
 IczkZmf3xn5PeK9wf+a2eTxHp1kF8RBU2ROjdDTEGcjtPkJeUjAL2h34T Q==;
X-CSE-ConnectionGUID: DadeSNtCQ2S1hwfBtFJawg==
X-CSE-MsgGUID: iDO09lEQTSKTMMj3ADl2Lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="50589555"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="50589555"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 05:39:22 -0700
X-CSE-ConnectionGUID: c12HmPmRQa2kRc+p5jH4Bg==
X-CSE-MsgGUID: 6Lh2q8iXRhiY9f7rimopTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="80911074"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 05:39:20 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/2] drm/xe/ufence: Prefetch ufence addr to catch bogus address
Date: Fri, 11 Oct 2024 13:57:14 +0200
Message-ID: <20241011115715.3486872-1-nirmoy.das@intel.com>
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

access_ok() only checks for addr overflow so also try to read the addr
to catch invalid addr sent from userspace.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index bb3c2a830362..6a2e4dd41d56 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -54,8 +54,9 @@ static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
 {
 	struct xe_user_fence *ufence;
 	u64 __user *ptr = u64_to_user_ptr(addr);
+	u64 __maybe_unused prefetch_val;
 
-	if (!access_ok(ptr, sizeof(*ptr)))
+	if (get_user(prefetch_val, ptr))
 		return ERR_PTR(-EFAULT);
 
 	ufence = kmalloc(sizeof(*ufence), GFP_KERNEL);
-- 
2.46.0

