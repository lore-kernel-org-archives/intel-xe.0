Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93998F436B9
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 16:19:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4658C10E097;
	Fri, 17 Apr 2026 16:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WI0kn7Ad";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3000E10EA87
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Apr 2026 16:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776442759; x=1807978759;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pJm7YMPuYGLT9hBnKzmqcB3kahT5ZAo/7qIQv/6KILg=;
 b=WI0kn7AdgkdbuW7YBIZqR0H4xaJ5RpjFvksJIXbOzl9xYX9jIIvL/y9m
 genk9Rl0jUIN13MwBSQ6xJ18PFMziS9WX/kBdMh27sU9dx9W3mDeCpjA9
 cSO1h79TpRdY4F1P67kFYiRNU4gfBNG1+MxU4CZ1z5Tib8bs/pMHmhn4H
 D7WcxXPFP6c5+gihGjtj0/FkZ3Ia3HSKcFYgJcnNuLF0OejgtIT4EQVqI
 7Nt2VwBDUDUhg3em0EkirKFuDpfezF3HdJhj3ItG4KV7NSb3j54tz/Bbc
 p36j9hqeX2RyJASnLkq3lKeFM332SZ3m+jS4AQUp7yUibax5Punf3DXtH A==;
X-CSE-ConnectionGUID: ESHsZLf7TdqTAfhViTjbjg==
X-CSE-MsgGUID: YBPvyD7pS+C8egDLwcvQ2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="87760138"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="87760138"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 09:19:19 -0700
X-CSE-ConnectionGUID: cJoFMfK0S0CAaNfocamu+Q==
X-CSE-MsgGUID: sEhDBs3RRymZYor7QVjJ6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="230222173"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by orviesa010.jf.intel.com with ESMTP; 17 Apr 2026 09:19:18 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH 2/2] drm/xe/hw_engine: Fix double-free of managed BO in error
 path
Date: Fri, 17 Apr 2026 16:19:01 +0000
Message-Id: <20260417161901.3416021-3-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260417161901.3416021-1-shuicheng.lin@intel.com>
References: <20260417161901.3416021-1-shuicheng.lin@intel.com>
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

The error path in hw_engine_init() explicitly frees a BO allocated
with xe_managed_bo_create_pin_map() via xe_bo_unpin_map_no_vm().
Since the managed BO already has a devm cleanup action registered,
this causes a double-free when devm unwinds during probe failure.

Remove the explicit free and let devm handle it, consistent with
all other xe_managed_bo_create_pin_map() callers.

Fixes: 23e939bc8f56 ("drm/xe: Add a helper for DRM device-lifetime BO create")
Cc: Michał Winiarski <michal.winiarski@intel.com>
Assisted-by: Claude:claude-opus-4.6
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 2f9c1c063f16..b69e6c9e534e 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -629,7 +629,7 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 		hwe->exl_port = xe_execlist_port_create(xe, hwe);
 		if (IS_ERR(hwe->exl_port)) {
 			err = PTR_ERR(hwe->exl_port);
-			goto err_hwsp;
+			goto err_name;
 		}
 	} else {
 		/* GSCCS has a special interrupt for reset */
@@ -649,8 +649,6 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 
 	return devm_add_action_or_reset(xe->drm.dev, hw_engine_fini, hwe);
 
-err_hwsp:
-	xe_bo_unpin_map_no_vm(hwe->hwsp);
 err_name:
 	hwe->name = NULL;
 
-- 
2.43.0

