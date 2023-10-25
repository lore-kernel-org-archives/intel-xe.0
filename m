Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F5EC07545
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 13:03:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A95610E65B;
	Wed, 25 Oct 2023 13:03:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE6610E5B4
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 13:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698238995; x=1729774995;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=1zUYUypVhfH0J8tnGzEqQ8W1dxYxxskzJVpT5OEdNUk=;
 b=fd5z2XwrO5cEOJ1XnCzNkk8D78Pfo6mMd8tP596LyZGkSkbXAWXpwjyQ
 kpdOpjfQ8QF37n2iCSJTa8ry5rKwYUta9LMuQTxmkl1n3l0yldgj5RdDy
 Wjlj9zGFz48F1rn3RVwSxfUAaxcjNPVj1l7jmCOwDtOcOS9e3SSfBHOGQ
 ABHtmKsoI829/64wrU2MtxauEvL+72mxN7POvV/8yel1L4yJN1OwVqXOF
 3v9mCO5Rm5wHJXX4gUyymJk+pow1zYLxIApdJTQ9wHl7TXS/bmUGsOFjn
 8KwQH692MplCvvDcpPckjaF1Sf5eJO7iBIjk0C5/hq44nLkxQs1W1v6Pe g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="91286"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="91286"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 05:56:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="86747"
Received: from skofoed-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.29])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 05:55:58 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 25 Oct 2023 14:55:48 +0200
Message-ID: <20231025125553.2335-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025125553.2335-1-thomas.hellstrom@linux.intel.com>
References: <20231025125553.2335-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 05/10] drm/xe: Adjust to commit "drm/gpuvm: add
 drm_gpuvm_flags to drm_gpuvm"
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

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 89f81f199d94..16ac77b67fe1 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1385,8 +1385,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		goto err_no_resv;
 	}
 
-	drm_gpuvm_init(&vm->gpuvm, "Xe VM", &xe->drm, vm_resv_obj, 0, vm->size,
-		       0, 0, &gpuvm_ops);
+	drm_gpuvm_init(&vm->gpuvm, "Xe VM", 0, &xe->drm, vm_resv_obj,
+		       0, vm->size, 0, 0, &gpuvm_ops);
 
 	drm_gem_object_put(vm_resv_obj);
 
-- 
2.41.0

