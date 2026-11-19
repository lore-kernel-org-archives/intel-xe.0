Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDED7606A32C
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 00:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Unb/g4gZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 803781120EA;
	Thu, 19 Nov 2026 00:29:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961661120E6
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 00:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795048156; x=1826584156;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pRnMG8XRsUaNK9gGoD/lIXPxvGGd6nWVkkcF1gNyeIw=;
 b=Unb/g4gZocQuoNmO0qKr3Fg46jhZ8udaL7UnyanOgaylC/c0RBG3xZ39
 VZEFnYpR/xzpGX2eGm6RRoopEXH/p8ysF2dqkW0BWVL7X7XcpoS++OXjq
 9vTibbJ4H+zWd/nVdjFkWjn0GUZYtUMfninU3fMSIImoayGPEYJnyve7V
 mcoOztpSzSHvns747wAyr44564H8iwsxKgDaPsQ9dghqmRxvbOyH6mRWo
 LH25F68jB30phnxlVhn525NMC4qEbkIvzBzs56EgU2DdY6d3L69P9w5NF
 M+kvxoXo8pYGKEkscI38pYx1EHoQ0hIwAcmnE1fp+5s++Q2vRNMb9XXxc A==;
X-CSE-ConnectionGUID: 2b6suvKTTg2AaQI+CBTlNQ==
X-CSE-MsgGUID: pD7pWcDTSdKemK0QaAi/Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3876667"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3876667"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 16:29:01 -0800
X-CSE-ConnectionGUID: ihfp5KwoQq2ixDvGPpMFFQ==
X-CSE-MsgGUID: l3ZORbTdSby2w+1d6kQZJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10081561"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 16:29:01 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, shekhar.chauhan@intel.com,
 harish.chegondi@intel.com
Cc: matthew.brost@intel.com
Subject: [PATCH v8 6/8] drm/xe/oa: Take the runtime PM reference in
 xe_oa_destroy_locked()
Date: Wed, 18 Nov 2026 16:27:44 -0800
Message-ID: <20261119002737.3899877-16-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261119002737.3899877-10-umesh.nerlige.ramappa@intel.com>
References: <20261119002737.3899877-10-umesh.nerlige.ramappa@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Move the runtime PM get/put around stream destruction from
xe_oa_release() into xe_oa_destroy_locked(), the only caller, so the
reference is held just around the code that needs the device awake.

This lets a following patch free a stream of a removed device without
taking a runtime PM reference on it. No functional change.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 72f173fb23cd..f3eceeb34e7b 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1760,6 +1760,8 @@ static long xe_oa_ioctl(struct file *file,
 
 static void xe_oa_destroy_locked(struct xe_oa_stream *stream)
 {
+	xe_pm_runtime_get(gt_to_xe(stream->gt));
+
 	if (stream->enabled)
 		xe_oa_disable_locked(stream);
 
@@ -1769,6 +1771,7 @@ static void xe_oa_destroy_locked(struct xe_oa_stream *stream)
 		xe_exec_queue_put(stream->exec_q);
 
 	drm_syncobj_put(stream->ufence_syncobj);
+	xe_pm_runtime_put(gt_to_xe(stream->gt));
 	kfree(stream);
 }
 
@@ -1777,11 +1780,9 @@ static int xe_oa_release(struct inode *inode, struct file *file)
 	struct xe_oa_stream *stream = file->private_data;
 	struct xe_gt *gt = stream->gt;
 
-	xe_pm_runtime_get(gt_to_xe(gt));
 	mutex_lock(&gt->oa.gt_lock);
 	xe_oa_destroy_locked(stream);
 	mutex_unlock(&gt->oa.gt_lock);
-	xe_pm_runtime_put(gt_to_xe(gt));
 
 	/* Release the reference the OA stream kept on the driver */
 	drm_dev_put(&gt_to_xe(gt)->drm);
-- 
2.55.0

