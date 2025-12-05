Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E08D37485
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 19:08:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA83B10EBA0;
	Fri,  5 Dec 2025 19:08:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LcK3E/X5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F18F310EB9F
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 19:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764961710; x=1796497710;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u42wK1az0gCoHe9aH0PjWo1sXXSoVFANde/vGryaKEM=;
 b=LcK3E/X5n25XxASOLlDZES+/mGiKmUbZi5YUXNgIVSNTatQCLy1m6b8n
 9hxnLOScFz5rqdzLwIumCNsq3yPgvXa1EExzg74ctymlh6jMi8ZD44p9q
 EcqR/G04uCjdXDeK4hU2YhaZaXBwLoSWQmR659T9Wym5vyORSFzFvS+wn
 /sOR1e9nAWZAkv1VRDFgIOEgbFfk06iqi/FxZ1FwBJTppmp0vzICDQHrD
 13tHkvcNL6y+QJvsjH85tTIP3sYQiPx3YRZyxwBjW64JDeFRcAfD1e3et
 C2IPQlIbe8pz6Q3ZByBW5vImb/MUIp3s7kU6dy0Anu6TCHY6XKRkBMP/z A==;
X-CSE-ConnectionGUID: q40yXTkPRtOrTir7D+1FJQ==
X-CSE-MsgGUID: Pk/rdUQ2SCicaNcVbbiWyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66188652"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="66188652"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 11:08:29 -0800
X-CSE-ConnectionGUID: YNjFN725SJKQj4nBXfYSNQ==
X-CSE-MsgGUID: su5TX8CYTVyFduF5/gD/tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="226013764"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa002.jf.intel.com with ESMTP; 05 Dec 2025 11:08:27 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>, stable@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>, Carl Zhang <carl.zhang@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Ivan Briano <ivan.briano@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 2/3] drm/xe/vm: Limit num_syncs to prevent oversized
 allocations
Date: Fri,  5 Dec 2025 19:05:09 +0000
Message-ID: <20251205190506.2426471-7-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251205190506.2426471-5-shuicheng.lin@intel.com>
References: <20251205190506.2426471-5-shuicheng.lin@intel.com>
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

The VM_BIND ioctl did not validate args->num_syncs, allowing userspace
to pass excessively large values that could lead to oversized allocations
or other unexpected behavior.

Add a check to ensure num_syncs does not exceed XE_MAX_SYNCS,
returning -EINVAL when the limit is violated.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: <stable@vger.kernel.org> # v6.12+
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Mrozek <michal.mrozek@intel.com>
Cc: Carl Zhang <carl.zhang@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Ivan Briano <ivan.briano@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index c2012d20faa6..2ada14ed1f3c 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3341,6 +3341,9 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 	if (XE_IOCTL_DBG(xe, args->extensions))
 		return -EINVAL;
 
+	if (XE_IOCTL_DBG(xe, args->num_syncs > XE_MAX_SYNCS))
+		return -EINVAL;
+
 	if (args->num_binds > 1) {
 		u64 __user *bind_user =
 			u64_to_user_ptr(args->vector_of_binds);
-- 
2.50.1

