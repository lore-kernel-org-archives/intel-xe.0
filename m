Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CCDD64086
	for <intel-xe@archiver.kernel.org>; Sat,  9 Nov 2024 03:20:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8480710E06A;
	Sat,  9 Nov 2024 03:20:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kvOIooTl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA53010E06A
 for <intel-xe@lists.freedesktop.org>; Sat,  9 Nov 2024 03:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731122408; x=1762658408;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1VDyoJXMJv8SRwiEYBNThdM3j8+9RVR6ooEm81ogAx4=;
 b=kvOIooTlBRYE8lxcuC1zTwzX2uW1jMPXyQr6qDQli8oObQBXkOWxuuXV
 9jPVY18j/BtChpwi4OkxPquiMEAUu/5nLIz7F1LP57X6rN7kxwLw1O5bB
 n/yechbLJ9s7BD2287dgRndp+bzJQArHf2KYbZzGyS4gEnKNbVBk5+S5T
 D7teZfzidmmsRvkm/Ccm19m7aPW04IBgdZ1ASsLeiGBUH6r1SnJU2fb9K
 2EFRO0M2yEe847Z8DZM1Gn2o0W0/JQGjWtkn51s37BTIJ5Qkoxa42p+86
 sQ7Iu+C7ba5slVQ0/an9eiHBF6oQKUce1+kmbIt8LFh9XTIN463ALKFn1 w==;
X-CSE-ConnectionGUID: apWdE4N4TV+pwm9SjSfXtQ==
X-CSE-MsgGUID: pnpHTbHlRuWm3FDL+9LM3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31173108"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31173108"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 19:20:08 -0800
X-CSE-ConnectionGUID: YkilOGvkQmGUYDGaXunU+Q==
X-CSE-MsgGUID: 9KTvUt+aRduDajl70Hr/ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="86117897"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 19:20:07 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 John Harrison <john.c.harrison@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/oa: Fix "Missing outer runtime PM protection" warning
Date: Fri,  8 Nov 2024 19:20:03 -0800
Message-ID: <20241109032003.3093811-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

Fix the following drm_WARN:

[953.586396] xe 0000:00:02.0: [drm] Missing outer runtime PM protection
...
<4> [953.587090]  ? xe_pm_runtime_get_noresume+0x8d/0xa0 [xe]
<4> [953.587208]  guc_exec_queue_add_msg+0x28/0x130 [xe]
<4> [953.587319]  guc_exec_queue_fini+0x3a/0x40 [xe]
<4> [953.587425]  xe_exec_queue_destroy+0xb3/0xf0 [xe]
<4> [953.587515]  xe_oa_release+0x9c/0xc0 [xe]

Suggested-by: John Harrison <john.c.harrison@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Fixes: e936f885f1e9 ("drm/xe/oa/uapi: Expose OA stream fd")
Cc: stable@vger.kernel.org
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 53d2946ea3052..b0928daf2f308 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1615,9 +1615,11 @@ static int xe_oa_release(struct inode *inode, struct file *file)
 	struct xe_oa_stream *stream = file->private_data;
 	struct xe_gt *gt = stream->gt;
 
+	xe_pm_runtime_get(gt_to_xe(gt));
 	mutex_lock(&gt->oa.gt_lock);
 	xe_oa_destroy_locked(stream);
 	mutex_unlock(&gt->oa.gt_lock);
+	xe_pm_runtime_put(gt_to_xe(gt));
 
 	/* Release the reference the OA stream kept on the driver */
 	drm_dev_put(&gt_to_xe(gt)->drm);
-- 
2.41.0

