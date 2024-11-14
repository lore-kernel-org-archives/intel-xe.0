Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE46D68B34
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 15:47:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DFCD10E0D2;
	Thu, 14 Nov 2024 15:47:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dS/SxVgc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE21410E0D2
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 15:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731599268; x=1763135268;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uBhoMnWABTmNIndZxhbV8fDzaYzXLspxXHkE7RrvUm0=;
 b=dS/SxVgcpEVktq66gq82PL6/SvazOaDBgbOrXXc4ELUyVnvqUWTSPPbS
 kBUbmCnZss4vwJUcQqxS3x9ghXx9nfoEw7fjQHcsl/Rjnal8Bvpqag2vH
 dpWbmwYsPvZQMI1VjQeg2trwRUHwDUy4MemNq9Q6DiTXwDqTKnwzzV871
 YIZ7IQKcUHnVoz65UZQaRJ8ViVfe9u4k/PQ+fNM0bkp9Wr4N05mBkxJiW
 HZdbnuCBPkUCBx2RtCkAOfzlgkR4BwPIEMYVgPoNxA5dVy9Ko8IgEm3Ir
 zcMV5FeFa4wX1FzzYHRmcLrJ7EY0y4pH47CxaDGikFMBHuzCX9w6WBxQB g==;
X-CSE-ConnectionGUID: MecZCslhTvq6/6MrTf5eTQ==
X-CSE-MsgGUID: wszYHpBURmKKZxelqzCU9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31452332"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="31452332"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 07:47:47 -0800
X-CSE-ConnectionGUID: 8lVEHJb1TBqc0iCuYFf07A==
X-CSE-MsgGUID: KoS6bT2HSIKeOduztjaD7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="125762143"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 07:47:46 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/ufence: Wake up waiters after setting ufence->signalled
Date: Thu, 14 Nov 2024 16:05:37 +0100
Message-ID: <20241114150537.4161573-1-nirmoy.das@intel.com>
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

If a previous ufence is not signalled, vm_bind will return -EBUSY.
Delaying the modification of ufence->signalled can cause issues if the
UMD reuses the same ufence so update ufence->signalled before waking up
waiters.

Cc: Matthew Brost <matthew.brost@intel.com>
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3233
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index a90480c6aecf..42f5bebd09e5 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -87,8 +87,12 @@ static void user_fence_worker(struct work_struct *w)
 		drm_dbg(&ufence->xe->drm, "mmget_not_zero() failed, ufence wasn't signaled\n");
 	}
 
-	wake_up_all(&ufence->xe->ufence_wq);
+	/*
+	 * Wake up waiters only after updating the ufence state, allowing the UMD
+	 * to safely reuse the same ufence without encountering -EBUSY errors.
+	 */
 	WRITE_ONCE(ufence->signalled, 1);
+	wake_up_all(&ufence->xe->ufence_wq);
 	user_fence_put(ufence);
 }
 
-- 
2.46.0

