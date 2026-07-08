Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B95C43458
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 18:09:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B34710F20E;
	Wed,  8 Jul 2026 18:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CIl76rXj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446C810F20E
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jul 2026 18:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783534150; x=1815070150;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=20sn8bRuB7ppArx+PcIo5JskX1Y/FH6xZ5CsRof4Z94=;
 b=CIl76rXjjqV97PTpTkIKAy7Uw6/a3f9lTdCHqXSCXbssbw3KwCA2IM8R
 wD7pVkodD33b3+y1H+imvrP81orbw6TQ1yJLrSAaNI2QBni8UrijwSC9m
 3HS/BleoW1lrSHdIv/KEvOspjZzwCDMfmQAADLznKQJOzxj0R2Zcs9xYD
 4JDhMWqvxOFx8Oa1xNClU40LVVyN3nZZLCCVnXhmJIDMf5sVVVyM5FO4N
 BWQp6j9XRnh06R94qJm8sFOOoKBYhKClVxNKM9EGjsW41ywR4hBiyqqeL
 pIZF30kjBYsgHi+CXDM8Ym2S/nDVK1QlMhOPyufQq8x+i9I9jcUhMRneY w==;
X-CSE-ConnectionGUID: 77ciFEBaTC2tVKLwx8sGUQ==
X-CSE-MsgGUID: PMwGGkxQQqWJBgedYUI7iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101752556"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="101752556"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 11:09:10 -0700
X-CSE-ConnectionGUID: 2UnawsNxSR6H8ZFj253hqg==
X-CSE-MsgGUID: vJqt6n1WTFmsfO0KJHUddQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="251002275"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by fmviesa007.fm.intel.com with ESMTP; 08 Jul 2026 11:09:09 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH] drm/xe/madvise: Remove unreachable madvise_funcs NULL check
Date: Wed,  8 Jul 2026 18:09:03 +0000
Message-Id: <20260708180903.3248889-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
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

The NULL check on madvise_funcs[attr_type] in xe_vm_madvise_ioctl()
is unreachable. madvise_args_are_sane() already validates args->type
via a switch statement whose default case rejects any type not present
in madvise_funcs[]. Every type that passes the sanity check has a
corresponding entry in the table.

Beyond being dead code, the check's error path (goto err_fini) would
also skip xe_svm_notifier_unlock() if it were somehow reached with
has_svm_userptr_vmas set, since err_fini only tears down the drm_exec.
Removing the check eliminates both the redundancy and the latent
unwind hazard.

No functional change.

Assisted-by: Claude:claude-opus-4.7
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_madvise.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 9e343f9aa44d..38f8321bda10 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -713,12 +713,6 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 
 	attr_type = array_index_nospec(args->type, ARRAY_SIZE(madvise_funcs));
 
-	/* Ensure the madvise function exists for this type */
-	if (!madvise_funcs[attr_type]) {
-		err = -EINVAL;
-		goto err_fini;
-	}
-
 	madvise_funcs[attr_type](xe, vm, madvise_range.vmas, madvise_range.num_vmas, args,
 				 &details);
 
-- 
2.43.0

