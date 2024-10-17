Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A37DD374A4
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 14:44:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FDA10E337;
	Thu, 17 Oct 2024 14:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G7GuaN29";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7701110E337
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Oct 2024 14:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729176274; x=1760712274;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jj9Kvyxoxi34x3R7spgUrEIQFsWZwHOvZ81II6NkVWM=;
 b=G7GuaN29NeN8KVvewdlze5yhJykGxz9llTKTHIRM1B/nJCa2F239zeRe
 7dPNUGfCqe6MmPS6EZnA5vF4uJChDAdFxKLqeLNQoBL2GHfOnVHSWfLzl
 VvRfj65CPclGVSMowUyas0nCTJNwaGyoVaiarnNDmuHgHBEiWiqFE6DQs
 iqLa8K3d88mSfMkLO+a/ETNO5OkSZ7cjQFK/+60VnIDSxcriFVxPNQ0VR
 E0A1UeDOerCZHyXrjLHUuNJWyJ0nO45oFUJS184piK2Bp4BUMhcY9Xr4T
 b9gHOibmvZZqopnQPOHmdT1XVJOwburPdbYjvJb/gnKdV6F3XzUtbViKV w==;
X-CSE-ConnectionGUID: Q5u3yVWBQKGf1JqjmgsZow==
X-CSE-MsgGUID: xFtHQUZKS2+njeL2g0GsGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="28547048"
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="28547048"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 07:44:34 -0700
X-CSE-ConnectionGUID: XCh70tEVTvOLRmbQhTWIww==
X-CSE-MsgGUID: 8115T+6cSPSWuPX4WMpcKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="82522962"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.150])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 07:44:33 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 2/2] drm/xe: Don't unnecessarily invoke the OOM killer on
 multiple binds
Date: Thu, 17 Oct 2024 16:44:07 +0200
Message-ID: <20241017144407.91919-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241017144407.91919-1-thomas.hellstrom@linux.intel.com>
References: <20241017144407.91919-1-thomas.hellstrom@linux.intel.com>
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

Multiple single-ioctl binds can be split up into multiple bind
ioctls, reducing the memory required to hold the bind array.

So rather than allowing the OOM killer to be invoked, return
-ENOMEM or -ENOBUFS to user-space to take corrective action.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2701
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index c99380271de6..0142b4daf714 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -733,7 +733,7 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
 		vops->pt_update_ops[i].ops =
 			kmalloc_array(vops->pt_update_ops[i].num_ops,
 				      sizeof(*vops->pt_update_ops[i].ops),
-				      GFP_KERNEL);
+				      GFP_KERNEL | __GFP_RETRY_MAYFAIL);
 		if (!vops->pt_update_ops[i].ops)
 			return array_of_binds ? -ENOBUFS : -ENOMEM;
 	}
@@ -2733,7 +2733,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 
 		*bind_ops = kvmalloc_array(args->num_binds,
 					   sizeof(struct drm_xe_vm_bind_op),
-					   GFP_KERNEL | __GFP_ACCOUNT);
+					   GFP_KERNEL | __GFP_ACCOUNT | __GFP_RETRY_MAYFAIL);
 		if (!*bind_ops)
 			return args->num_binds > 1 ? -ENOBUFS : -ENOMEM;
 
@@ -2973,14 +2973,14 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 	if (args->num_binds) {
 		bos = kvcalloc(args->num_binds, sizeof(*bos),
-			       GFP_KERNEL | __GFP_ACCOUNT);
+			       GFP_KERNEL | __GFP_ACCOUNT | __GFP_RETRY_MAYFAIL);
 		if (!bos) {
 			err = -ENOMEM;
 			goto release_vm_lock;
 		}
 
 		ops = kvcalloc(args->num_binds, sizeof(*ops),
-			       GFP_KERNEL | __GFP_ACCOUNT);
+			       GFP_KERNEL | __GFP_ACCOUNT | __GFP_RETRY_MAYFAIL);
 		if (!ops) {
 			err = -ENOMEM;
 			goto release_vm_lock;
-- 
2.46.0

