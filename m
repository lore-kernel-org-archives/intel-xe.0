Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9FA606A320
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 13:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mRs7XPe/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4519310E878;
	Fri, 20 Nov 2026 13:03:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B16DF112A1B
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 13:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795179803; x=1826715803;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=ho81QqQiEOIz7xzkxD61vlh46t7pquCmVvfbgawj9ek=;
 b=mRs7XPe/Nafw5Nt8pHliPSSngMgCSle9uv/lQlhOBu/vRpyKgETAXs/M
 RygWnhdyX7wCbKbByuHES8TL5r0BbIBKwT3r9JPaTNtuG/6YrL+VKsEUE
 ywOQPFXkz2jN8oYPC+nyAFZlL+vdXUYvVN/IXA/o2oGddtnR+o2isxS+l
 FSc1aJiAInMH/ryF2HI7DiZgMjsSDwInKv+3g7H82G8RbK3RzXFOEwPDp
 UOVb6225ctgPiyGyqa1DRtc5PT1K2FE6kRP2rmWVjWGpdRgrG2JPATEwk
 676f2eMY0SgvcsJaXjhoWpA1xP5O1kDM+py1YaU7J4/v274Mey8CeWzto w==;
X-CSE-ConnectionGUID: 7/qDlrhfTQ6MXpXuCp9tfg==
X-CSE-MsgGUID: 3jf4CNdsSwy2NIblJukFfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4072683"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4072683"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 05:03:23 -0800
X-CSE-ConnectionGUID: J0H0k7fXS7KJQd42igptyg==
X-CSE-MsgGUID: TlZjC1pjScSsqBbcK6Lidg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="10639241"
Received: from slindbla-desk.ger.corp.intel.com (HELO [192.168.0.182])
 ([10.245.244.23])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 05:03:21 -0800
From: Matthew Auld <matthew.auld@intel.com>
Date: Fri, 20 Nov 2026 13:02:17 +0000
Subject: [PATCH v2 2/6] drm/xe/vf: Free preempt fences on rebind worker retry
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261120-userptr-repin-v2-2-65e1f6e582ef@intel.com>
References: <20261120-userptr-repin-v2-0-65e1f6e582ef@intel.com>
In-Reply-To: <20261120-userptr-repin-v2-0-65e1f6e582ef@intel.com>
To: Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, 
 Stuart Summers <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
X-Mailer: b4 0.14.3
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

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

When preempt_rebind_work_func() hits -EAGAIN after
alloc_preempt_fences(), the SR-IOV VF migration path requeues the worker
and returns without freeing the local preempt_fences list or emitting
trace_xe_vm_rebind_worker_exit().

Free preempt_fences and emit the exit tracepoint before returning.

Fixes: 1faeeea056ab ("drm/xe/vf: Avoid indefinite blocking in preempt rebind worker for VFs supporting migration")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org> # v6.19+
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 75be5e5329bd..82e716b12b49 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -649,7 +649,9 @@ static void preempt_rebind_work_func(struct work_struct *w)
 		if (IS_SRIOV_VF(vm->xe) &&
 		    xe_sriov_vf_migration_supported(vm->xe)) {
 			up_write(&vm->lock);
+			free_preempt_fences(&preempt_fences);
 			xe_vm_queue_rebind_worker(vm);
+			trace_xe_vm_rebind_worker_exit(vm);
 			return;
 		}
 

-- 
2.56.1

