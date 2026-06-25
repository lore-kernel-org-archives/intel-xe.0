Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BA3CDE00C
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 22:45:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F9210F3A8;
	Thu, 25 Jun 2026 22:45:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZKK+wbzg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB5B10F3A8
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 22:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782427507; x=1813963507;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=izzg1pJlPG7CPXi/UyEZsEnyeDc3jtEU+CS2iKz2lGU=;
 b=ZKK+wbzgQJN5Pv7wYqXDhDCa6AiuDPx/4xRf3zKDIdqZnpCVKrvNSDsA
 Zkm0NVBDnDfc/WVvKO3Gub9DDK7p6Yl8xx9wrIEecsUWQHhhjdbiTcKa5
 YO2ohYWPg+g1AVsgNDCBhmo9Y1A182AHfZaW9fa2kTDd7lhZNoZxb1TWf
 iqTeykA/PiW4GDNtgFMWp0mwdIUqFFvfjX6Hx65KimbeZzPCIfYC7iB4z
 Fr25hZTsQXsIwWSwfTl9/9QkdM167ER66bcn1RMPuYmmeGg/gilEcSIJA
 jh3W0AA7l57Cg8SxECMW3oEC0/qq9UXkIw9MkZEkaqcvAr8uw3oTR22iW A==;
X-CSE-ConnectionGUID: bb8YHxeGQ3GghNatToatxA==
X-CSE-MsgGUID: YwvbmENNS5a4efFvxX8OBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83099309"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="83099309"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 15:45:06 -0700
X-CSE-ConnectionGUID: kRcic4XWQDmnwCd/+dXT6w==
X-CSE-MsgGUID: 9WNePfLfR7ew9Jm2H4gDMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="255121906"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by orviesa004.jf.intel.com with ESMTP; 25 Jun 2026 15:45:06 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/userptr: Drop bogus static from finish in
 force_invalidate
Date: Thu, 25 Jun 2026 22:44:52 +0000
Message-Id: <20260625224452.3243231-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
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

The local "finish" pointer in xe_vma_userptr_force_invalidate() is
unconditionally written before each read, so the static storage class
serves no purpose. Worse, it makes the variable a process-wide shared
slot: the function's per-VM asserts do not exclude concurrent callers
on different VMs, so two such callers can race on the slot and take
the wrong if (finish) branch.

The function is gated by CONFIG_DRM_XE_USERPTR_INVAL_INJECT
(developer/test option, default n), so production builds are
unaffected.

Drop the static.

Fixes: 18c4e536959e ("drm/xe/userptr: Convert invalidation to two-pass MMU notifier")
Assisted-by: Claude:claude-opus-4.7
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_userptr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
index 6761005c0b90..6f71bc66b14e 100644
--- a/drivers/gpu/drm/xe/xe_userptr.c
+++ b/drivers/gpu/drm/xe/xe_userptr.c
@@ -269,7 +269,7 @@ static const struct mmu_interval_notifier_ops vma_userptr_notifier_ops = {
  */
 void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)
 {
-	static struct mmu_interval_notifier_finish *finish;
+	struct mmu_interval_notifier_finish *finish;
 	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
 
 	/* Protect against concurrent userptr pinning */
-- 
2.43.0

