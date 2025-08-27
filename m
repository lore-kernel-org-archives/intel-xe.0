Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83FC3CA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 18:26:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 445FB10E0A0;
	Wed, 27 Aug 2025 18:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aj9c+o1o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B664E10E886
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 18:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756319176; x=1787855176;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QmccpycQb5xcNczuweNU8+bPfJ4aPAf0BXrIhjK6rxQ=;
 b=aj9c+o1oXXuCqq8VXAh3yod8zP6FqV/rOCI5HYcLYJRGINUUfyMEl/2P
 ROq8szTmw+JAg1RY3wbqnaUF7NtBwzKF0pyi48WXaXCVXfjyqQGuljCu/
 Ub6wIQKiMPCQaRvrbUhNqZI5B9DRIbdcRKeznBwP8xQ4tLTOOaDydOGyT
 56ctc+TklJSDuJ0VJUciPkx3xBKhnWGEithqm75yQ0ZFzp8yp8jvPIKLd
 lS0nD45VeXcjCMyPDfM24YjtO8ICEoSrXLPN/DDcwW+ISHfVWw3Ni9nJO
 zIX45UkoIJ5srMss0+xsskY1C2uZGCO7oKJjeAwpkMUacHQjZQNWsy2qU Q==;
X-CSE-ConnectionGUID: RtBKVhXuTUqmG3/pRAVy0Q==
X-CSE-MsgGUID: SkASOjGnRBiTrqRI35HFvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="69949636"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="69949636"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 11:26:16 -0700
X-CSE-ConnectionGUID: 2jMq9EMqSJun28g3wm2fNg==
X-CSE-MsgGUID: q5gYLEoiQcCkafAbSOO4ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="169158809"
Received: from dut4086lnl.fm.intel.com ([10.105.10.138])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 11:26:16 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 john.c.harrison@intel.com, matthew.brost@intel.com,
 michal.wajdeczko@intel.com
Subject: [PATCH v4 3/3] drm/xe/xe_vm: Add error injection support to lock and
 prep
Date: Wed, 27 Aug 2025 18:26:16 +0000
Message-ID: <20250827182612.106364-8-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827182612.106364-5-jonathan.cavitt@intel.com>
References: <20250827182612.106364-5-jonathan.cavitt@intel.com>
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

Add error injection support to the function
vm_bind_ioctl_ops_lock_and_prep.  This necessitates marking the function
as noinline.

v2: Only noinline vm_bind_ioctl_ops_lock_and_prep when function error
injection is enabled (Brost)

v3: Use error_injectable to apply v2 change (Brost, Harrison)

v4: Move error_injectable function attribute (Brost)

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f2c900b4125d..477a4be9569f 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3205,6 +3205,7 @@ static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops
 	return 0;
 }
 
+error_injectable
 static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
 					   struct xe_vm *vm,
 					   struct xe_vma_ops *vops)
@@ -3224,6 +3225,7 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
 
 	return 0;
 }
+ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_lock_and_prep, ERRNO);
 
 static void op_trace(struct xe_vma_op *op)
 {
-- 
2.43.0

