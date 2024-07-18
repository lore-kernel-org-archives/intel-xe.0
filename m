Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15270C3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 20:32:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7AC410EB09;
	Thu, 18 Jul 2024 20:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R/w+HPcT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D1910EB07
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 20:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721334718; x=1752870718;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=DtdfRjhpfs46Vsn2bp6+zoye8ee9u37VOWrhpstNCIE=;
 b=R/w+HPcTCLf7/frZBvxaOErNIIUJgUXBhoTWFGYYFXElEkucLT9g5hDH
 Ww10ioNkz05cR+UjjqKOSVYTS2mugLX2VSBP1/hm3GST407QcNxCtc1FB
 Zaw2MO/x6Z2pepA4AZH2hLiYAoCxgMDT6FKrPlDX30MRmW5Rs492jB63s
 +rzlKDOrtWq86jHdb7W20QL78RI8I+skcrMUIqqX7Fi4lzI2VzjxuQTOC
 Ajah53jDFEbBaLd4xP0+CvIGxRLhXkxfn6RIv8cpPbkflHK7zEL90u2V9
 U926Vyv4uJkGzRS9HHiBh11pEr+vqtfftLaAoyiO2+JZ2mXKm4rOlIDwL A==;
X-CSE-ConnectionGUID: tC+mCK0mTRydLrfiBdBOUw==
X-CSE-MsgGUID: CfUyzJDwQzyTzUvFuN2bKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="19059946"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="19059946"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 13:31:57 -0700
X-CSE-ConnectionGUID: w/Q3y2oVQpq7q3BzxvP+iA==
X-CSE-MsgGUID: WEBngpLKQmir4XZ82U2+ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="81520624"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 13:31:57 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 3/4] drm/xe: Take a ref to xe file when user creates a VM
Date: Thu, 18 Jul 2024 13:31:51 -0700
Message-Id: <20240718203152.3566929-4-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20240718203152.3566929-1-umesh.nerlige.ramappa@intel.com>
References: <20240718203152.3566929-1-umesh.nerlige.ramappa@intel.com>
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
index cf3aea5d8cdc..6adb0ff09d40 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1670,6 +1670,10 @@ static void vm_destroy_work_func(struct work_struct *w)
 		XE_WARN_ON(vm->pt_root[id]);
 
 	trace_xe_vm_free(vm);
+
+	if (vm->xef)
+		xe_file_put(vm->xef);
+
 	kfree(vm);
 }
 
@@ -1802,7 +1806,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	}
 
 	args->vm_id = id;
-	vm->xef = xef;
+	vm->xef = xe_file_get(xef);
 
 	/* Record BO memory for VM pagetable created against client */
 	for_each_tile(tile, xe, id)
-- 
2.38.1

