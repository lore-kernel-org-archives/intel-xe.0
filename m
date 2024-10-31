Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F68D767D8
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 15:37:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22FCB10E8D2;
	Thu, 31 Oct 2024 15:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X9WHRB5W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 962E310E8D2
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Oct 2024 15:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730389067; x=1761925067;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uCF3ZPMvptUeOY5juxz2InrvvCaROyR/sumlwacTo/A=;
 b=X9WHRB5WWDMVcEPdNLuXj51TGAAaSZipU376iDTZz/6eePr4l/GSUwtg
 xvZV81DeAvekTUWRiHp2JxxX8LTadNU+OqxhWl6wxIqu7PJd9ohrmW3Zv
 zQJCx3A0umGzl7/1nR9wDYMNu+Va91AbgFXKH6Lm6yQ2/W8Pk4DDRgq9b
 Bgk77e6CWYcdGb0yK26rX4jXt3dYdz7G4eJjqaEKr9pPZLrshQam8SLvy
 OgAAVsX/UTUjWMsIIPnjex6VQyI+TOJ8t7zgajFmqPpbFJPaQBuXojPxj
 BzGzIJrFP9ge2hb51wc84JwCWsj6JWfB1n89wUiToY2/L8gpmgqVJmema w==;
X-CSE-ConnectionGUID: 62qriroWS0ac+lBnGF62ug==
X-CSE-MsgGUID: RB15VImUQLSzVEX628kdnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30089084"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30089084"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 08:37:47 -0700
X-CSE-ConnectionGUID: lrFGZ6QHTNW07w/GiuyQ0A==
X-CSE-MsgGUID: tn21VkZ8QzCeg3+kIJ3mXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="87446048"
Received: from carterle-desk.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.213])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 08:37:46 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 2/2] drm/xe: Don't unnecessarily invoke the OOM killer on
 multiple binds
Date: Thu, 31 Oct 2024 16:37:32 +0100
Message-ID: <20241031153732.164995-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241031153732.164995-1-thomas.hellstrom@linux.intel.com>
References: <20241031153732.164995-1-thomas.hellstrom@linux.intel.com>
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

v2:
- Add __GFP_NOWARN to __GFP_RETRY_MAYFAIL allocations to avoid
  spamming the kernel log if a recoverable allocation fails.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2701
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v1
---
 drivers/gpu/drm/xe/xe_vm.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index c99380271de6..624133fae5f5 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -733,7 +733,7 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
 		vops->pt_update_ops[i].ops =
 			kmalloc_array(vops->pt_update_ops[i].num_ops,
 				      sizeof(*vops->pt_update_ops[i].ops),
-				      GFP_KERNEL);
+				      GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
 		if (!vops->pt_update_ops[i].ops)
 			return array_of_binds ? -ENOBUFS : -ENOMEM;
 	}
@@ -2733,7 +2733,8 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 
 		*bind_ops = kvmalloc_array(args->num_binds,
 					   sizeof(struct drm_xe_vm_bind_op),
-					   GFP_KERNEL | __GFP_ACCOUNT);
+					   GFP_KERNEL | __GFP_ACCOUNT |
+					   __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
 		if (!*bind_ops)
 			return args->num_binds > 1 ? -ENOBUFS : -ENOMEM;
 
@@ -2973,14 +2974,16 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 	if (args->num_binds) {
 		bos = kvcalloc(args->num_binds, sizeof(*bos),
-			       GFP_KERNEL | __GFP_ACCOUNT);
+			       GFP_KERNEL | __GFP_ACCOUNT |
+			       __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
 		if (!bos) {
 			err = -ENOMEM;
 			goto release_vm_lock;
 		}
 
 		ops = kvcalloc(args->num_binds, sizeof(*ops),
-			       GFP_KERNEL | __GFP_ACCOUNT);
+			       GFP_KERNEL | __GFP_ACCOUNT |
+			       __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
 		if (!ops) {
 			err = -ENOMEM;
 			goto release_vm_lock;
-- 
2.46.2

