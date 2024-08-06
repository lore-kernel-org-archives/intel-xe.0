Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6827DC3DA64
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 11:23:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35CAF10E32D;
	Tue,  6 Aug 2024 11:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D11Wkt0C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E9F10E32D
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Aug 2024 11:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722943398; x=1754479398;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1bLIynyeD5u1FI4hVHB0aevVmYTJuRPBtjWrKyZy/2s=;
 b=D11Wkt0CnO5U612eB1OU4Tlj6hDVJphEkYMtVznngu8k6r0yJqPTHVAN
 e4/6gZ2mze/9SYZfiuaa/ozRQo6LU4WN9e3kWJNFSH69w98PGGKJYsKVt
 bNLAXzfRUJ0EJcexgVIhzC1ZZPRSknGjC+mGG3lmdZtdlJaFlGOD50N7E
 3btzFasBlbXygn6cClYhPbEp0FNMO6GFAfyB0QXaV7DGILTdIu6m+FKXq
 SUsPTW8JAQ4UB8ZXCJdAYNLyn1DbU1Rg/jMOPq27eceycosxO6Ev2iMgv
 x0KN0w6ZyWtv2TKrK8uMrtP7m32+Hs4kutWUT/ZpE6HXSxciu2WZW4jum w==;
X-CSE-ConnectionGUID: 8zYEeumFQC2FBFGlI8iUEQ==
X-CSE-MsgGUID: lG4lcnLtTJiqC6AZ50fLkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="21094235"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; d="scan'208";a="21094235"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 04:23:18 -0700
X-CSE-ConnectionGUID: koZ92EQUQuuENFaL3RQykw==
X-CSE-MsgGUID: dbk8YW0jTSOhZZ64dlbSLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; d="scan'208";a="61303061"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 04:23:17 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, kernel test robot <lkp@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Fix access_ok check in user_fence_create
Date: Tue,  6 Aug 2024 13:07:22 +0200
Message-ID: <20240806110722.28661-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
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

Check size of the data not size of the pointer.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202407300421.IBkAja96-lkp@intel.com/
Fixes: 0fde907da2d5 ("drm/xe: Validate user fence during creation")
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 3aa6270e5dd7..ca826aeb41ea 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -55,7 +55,7 @@ static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
 	struct xe_user_fence *ufence;
 	u64 __user *ptr = u64_to_user_ptr(addr);
 
-	if (!access_ok(ptr, sizeof(ptr)))
+	if (!access_ok(ptr, sizeof(*ptr)))
 		return ERR_PTR(-EFAULT);
 
 	ufence = kmalloc(sizeof(*ufence), GFP_KERNEL);
-- 
2.42.0

