Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F6CD0EE05
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 15:52:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9951D10E114;
	Fri, 11 Oct 2024 15:52:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l8ijF4Qt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28EAE10E114
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Oct 2024 15:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728661957; x=1760197957;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WDrjCudsvxf46qeev48SGKCNR7uWGLHMWOLnwSUkFeM=;
 b=l8ijF4QtacdpoletcgO+jBHXg0XpgzQZ+NihvYXHNESgs9JGBVtuTWsr
 7+N0XkmgDLC7qpXm/RC8lMcG/CXbuB01Ahdua7AKv7eqZ+MixK8XT+Nk/
 +v7Jc8yu5/RNI/GMYsJ52Fk1hET1lWHejS1SqmxK0dVGS4HJ1fMFv4gIz
 hptnFZsdAfQK9DYHY3fTaobooOIiB5ycrSvIcFloMoMZ1E4CT/smi4w5d
 K3VXI9bbXlbrSXwMhLd2kH4kHWoLGerWrnzc0oXhK1bABD9oXKp6KW6CO
 r17mufOBo1f3ysyShsNCsqFrcOZlQgij69hWgnCC1xG42KLsBciTyO70A w==;
X-CSE-ConnectionGUID: z1G6OsAOQfmDMYczWR0Tuw==
X-CSE-MsgGUID: ISqfftbLRVijTbKszlIS9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28172868"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="28172868"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 08:52:37 -0700
X-CSE-ConnectionGUID: ptkkBB/GT7GnCxqa2saVSQ==
X-CSE-MsgGUID: 3SX2yvYITcmeS20ncgYRhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="77762091"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 08:52:35 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, stable@vger.kernel.org,
 Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2] drm/xe/ufence: ufence can be signaled right after
 wait_woken
Date: Fri, 11 Oct 2024 17:10:29 +0200
Message-ID: <20241011151029.4160630-1-nirmoy.das@intel.com>
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

do_comapre() can return success after a timedout wait_woken() which was
treated as -ETIME. The loop calling wait_woken() sets correct err so
there is no need to re-evaluate err.

v2: Remove entire check that reevaluate err at the end(Matt)

Fixes: e670f0b4ef24 ("drm/xe/uapi: Return correct error code for xe_wait_user_fence_ioctl")
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
Cc: <stable@vger.kernel.org> # v6.8+
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_wait_user_fence.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index d46fa8374980..f5deb81eba01 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -169,9 +169,6 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 			args->timeout = 0;
 	}
 
-	if (!timeout && !(err < 0))
-		err = -ETIME;
-
 	if (q)
 		xe_exec_queue_put(q);
 
-- 
2.46.0

