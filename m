Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD584606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 02:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P+hDNaF+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA8010E3DA;
	Wed, 18 Nov 2026 02:52:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE8910E4D8
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 02:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794970322; x=1826506322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rr0OdeZsdQ38QdXkFg8Llx5LUFH0N4LKMkyN7aXbd4Y=;
 b=P+hDNaF+EYqra3D+DxWoGU8P1YO5CVtLcj6cws5h672lZOysonBNt2x6
 GoCdh8KHJZRzVP86bisNL80NX9xXxFmpa/kblFWo/U0JPJOzJ6jBV/s9m
 7H+IgrZDTr703CqXC0sYsaNoIx89Hv/ZiGU5W+GjRxpGwKqaX6HkIOu9+
 l5Op1/uaokymvufLWdsHZsL7u1OR3wevVesEHumgllV5uqKvu51uyrELE
 Jc4YPdJqB5h/2t9bYWCS+cg04v9GxtE2EDWMX9YxkB650x6zIyxSPGDWa
 bSKcPTiweJkqb06kc9t/akAByMZNmzVqloFqRDSO4Kx7HbnxX6ImrSCnR w==;
X-CSE-ConnectionGUID: vmldSCIOQa6frdJSt6cvEg==
X-CSE-MsgGUID: 8+zpp8rWTiWSoGByop0Kjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3614555"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3614555"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 18:51:51 -0800
X-CSE-ConnectionGUID: yruWINOURnehmY3LRIXjUA==
X-CSE-MsgGUID: oo6hZLDhQoaFLW7RmgP7Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="9888999"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 18:51:51 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: shekhar.chauhan@intel.com, harish.chegondi@intel.com,
 intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH v7 3/7] drm/xe/oa: Take the runtime PM reference in
 xe_oa_destroy_locked()
Date: Tue, 17 Nov 2026 18:51:44 -0800
Message-ID: <20261118025140.3782678-12-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261118025140.3782678-9-umesh.nerlige.ramappa@intel.com>
References: <20261118025140.3782678-9-umesh.nerlige.ramappa@intel.com>
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
index b527c6258cd5..3ddccc7e6f90 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1702,6 +1702,8 @@ static long xe_oa_ioctl(struct file *file,
 
 static void xe_oa_destroy_locked(struct xe_oa_stream *stream)
 {
+	xe_pm_runtime_get(gt_to_xe(stream->gt));
+
 	if (stream->enabled)
 		xe_oa_disable_locked(stream);
 
@@ -1711,6 +1713,7 @@ static void xe_oa_destroy_locked(struct xe_oa_stream *stream)
 		xe_exec_queue_put(stream->exec_q);
 
 	drm_syncobj_put(stream->ufence_syncobj);
+	xe_pm_runtime_put(gt_to_xe(stream->gt));
 	kfree(stream);
 }
 
@@ -1719,11 +1722,9 @@ static int xe_oa_release(struct inode *inode, struct file *file)
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

