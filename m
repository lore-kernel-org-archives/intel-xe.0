Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55614C25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 10:42:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2ED10EAC8;
	Tue, 21 May 2024 10:42:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O11VX2Pk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24BF910EAB9
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 10:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716288126; x=1747824126;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4deB6sFq1oGibE0WH1iushejVJ7IydWeUKg+1hMCymw=;
 b=O11VX2PkDyF+aBrFjqNfUmsA+MCld8e0JsMp13hqOHjbmokxQzoRy2Ud
 HPOEhPeFwL2SEqEofCgsBQBAkHKk5EqUVsggJDVQ1z0aoesaEs3j1jHTf
 xf2lRgZoyxA7yVLDEct0dri8rdC3WJeerinDwBo9dkWHQ0+othOKKJ6Hl
 4tErzR626c/OOiL0sHQqWEe+AplPjNArQEUttS91zZhQ7/gtg0y2aEO/W
 5TgEm/pjfzu94LD4dDEf7xK+RDZOyfQ+rmk5EgmpsQVK6BRWtjhc2Y0uk
 L93shrsuhbZAFirreDpcqKKcE1OanRuWANKPkHinlFcyGlozcY3+AAdA6 w==;
X-CSE-ConnectionGUID: dWtvFzarQtuGp/Js0zc2XA==
X-CSE-MsgGUID: 4s61MeD/TWOHbWjVNe1hCw==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="16309712"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="16309712"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 03:42:00 -0700
X-CSE-ConnectionGUID: AmmH66g0S/OI7sizq7QqWg==
X-CSE-MsgGUID: YvExy2tcT2y4hkUPgV7rYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="37650249"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 03:41:58 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
	Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/xe/tests: Use uninterruptible VM lock
Date: Tue, 21 May 2024 12:27:15 +0200
Message-ID: <20240521102715.22700-1-nirmoy.das@intel.com>
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

Interruptible lock can return error and needed a return value
check. This test should finish quick enough so use a uninterruptible
lock instead.

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index b6e7f80c3774..962f6438e219 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -344,7 +344,7 @@ static int migrate_test_run_device(struct xe_device *xe)
 		struct xe_migrate *m = tile->migrate;
 
 		kunit_info(test, "Testing tile id %d.\n", id);
-		xe_vm_lock(m->q->vm, true);
+		xe_vm_lock(m->q->vm, false);
 		xe_migrate_sanity_test(m, test);
 		xe_vm_unlock(m->q->vm);
 	}
-- 
2.42.0

