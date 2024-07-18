Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B61AC3DA7E
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 21:05:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B8310EB22;
	Thu, 18 Jul 2024 21:05:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CChjy5lL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A180210EB1E
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 21:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721336752; x=1752872752;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Wfpn5oGxeO3etX5YFekO7u5OSprqUrx7Yum3LJn4/Qo=;
 b=CChjy5lLAJPFT30ZZ1PvlRtDgYx8bxlMRELJr7uHp+4Y+jiXbrOPRiF/
 G8RZPo4DJMPzG2U/8AijSfBNpHcfe2MCa//O+3U+18WQzmsuStxWbqviS
 tA0qR3A2MvsUD8iSWtID7tFxEGv7j2+9c1BlEeI6qABHjkp5JiUYKwvGb
 1ymYRHFEFQKL1W6puvz/44jCYUsq1L5Iw/jtAnQy3WIgoT+rmpcJ3dRJg
 T4QKDfLhIhvpidRfn9hQgmDTT1FQ+29KMSLrE1k+m32ymc2dillg9tmqU
 M/kn6oiyuvoB5mlGM/Nve+9ndNddHCMafWJuXpSz8eKb0qBFwDB9oLJLd g==;
X-CSE-ConnectionGUID: MI/p4WgxRByHz2Vu5Svr5w==
X-CSE-MsgGUID: Vquxa2AFRjeeCF0SyyqO7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="30349948"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="30349948"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 14:05:52 -0700
X-CSE-ConnectionGUID: 9RCxdBo0S9CNC7zNnJl3BA==
X-CSE-MsgGUID: FUWSxyN1Rx6KLfMTWWhldQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="88385253"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 14:05:52 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 3/4] drm/xe: Take a ref to xe file when user creates a VM
Date: Thu, 18 Jul 2024 14:05:47 -0700
Message-Id: <20240718210548.3580382-4-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20240718210548.3580382-1-umesh.nerlige.ramappa@intel.com>
References: <20240718210548.3580382-1-umesh.nerlige.ramappa@intel.com>
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

Take a reference to xef when user creates the VM and put the reference
when user destroys the VM.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index b6932cc98ff9..d9aadb8ec737 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1674,6 +1674,10 @@ static void vm_destroy_work_func(struct work_struct *w)
 
 	trace_xe_vm_free(vm);
 	ttm_lru_bulk_move_fini(&xe->ttm, &vm->lru_bulk_move);
+
+	if (vm->xef)
+		xe_file_put(vm->xef);
+
 	kfree(vm);
 }
 
@@ -1806,7 +1810,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	}
 
 	args->vm_id = id;
-	vm->xef = xef;
+	vm->xef = xe_file_get(xef);
 
 	/* Record BO memory for VM pagetable created against client */
 	for_each_tile(tile, xe, id)
-- 
2.38.1

