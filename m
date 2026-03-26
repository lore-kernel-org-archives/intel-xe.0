Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C524F10A62CB
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 13:09:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8540910E92A;
	Thu, 26 Mar 2026 13:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JS0jIe52";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B475410E92B
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 13:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774530559; x=1806066559;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z3+hIEpe/bgtM8ydU4JIIIct8xWll9TAaF8uYGZowoc=;
 b=JS0jIe525uBQKP/HLEK4RyOtWCzAY/yr9soV1RnbQQuf9ecU5qnc8pIx
 QIQzYBnmpfFVKpxz9PT14Ks5PYR788MDfSPmzG/aSblx0K5Kjtg0i8P+j
 +1vqlRsYjHbABjpcFQdLeFBHR7E7UHr9mgyFvttj4D6riomVQdnhc3T4g
 w97DRipygL+S05bl5bNTIlA+SRCFPqtHiKQipqWYDcxGiH6d4yte28vtu
 bpBLQMmVPvzxWlSMo0jdC34AHzLhgb63N/9Qty+hsYv/v6YwfglKjP/xz
 QgBW4dz1Nc8zKBvu8/jMKRdMfCNsjna6yjEa8E2b0665P2JmqI2i9ocKe A==;
X-CSE-ConnectionGUID: ILxIdiL4R/qhKI9fERkB1A==
X-CSE-MsgGUID: WLc76oDERHmNBsLr4p4D+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75784792"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="75784792"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 06:09:19 -0700
X-CSE-ConnectionGUID: 1Fs9F/1GTRaLWcGxsRX+Mw==
X-CSE-MsgGUID: +Wd0RsbwQra2AP01eB0e/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="224070592"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 06:09:17 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [PATCH v9 12/12] drm/xe/madvise: Accept canonical GPU addresses in
 xe_vm_madvise_ioctl
Date: Thu, 26 Mar 2026 18:38:38 +0530
Message-ID: <20260326130843.3545241-13-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326130843.3545241-1-arvind.yadav@intel.com>
References: <20260326130843.3545241-1-arvind.yadav@intel.com>
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

Userspace passes canonical (sign-extended) GPU addresses where bits 63:48
mirror bit 47. The internal GPUVM uses non-canonical form (upper bits
zeroed), so passing raw canonical addresses into GPUVM lookups causes
mismatches for addresses above 128TiB.

Strip the sign extension with xe_device_uncanonicalize_addr() at the
top of xe_vm_madvise_ioctl(). Non-canonical addresses are unaffected.

Fixes: ada7486c5668 ("drm/xe: Implement madvise ioctl for xe")

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_madvise.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 33786a5d62a6..1a4e436210de 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -673,8 +673,15 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 	struct xe_device *xe = to_xe_device(dev);
 	struct xe_file *xef = to_xe_file(file);
 	struct drm_xe_madvise *args = data;
-	struct xe_vmas_in_madvise_range madvise_range = {.addr = args->start,
-							 .range =  args->range, };
+	struct xe_vmas_in_madvise_range madvise_range = {
+		/*
+		 * Userspace may pass canonical (sign-extended) addresses.
+		 * Strip the sign extension to get the internal non-canonical
+		 * form used by the GPUVM, matching xe_vm_bind_ioctl() behavior.
+		 */
+		.addr = xe_device_uncanonicalize_addr(xe, args->start),
+		.range = args->range,
+	};
 	struct xe_madvise_details details;
 	u16 pat_index, coh_mode;
 	struct xe_vm *vm;
@@ -725,7 +732,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 	if (err)
 		goto unlock_vm;
 
-	err = xe_vm_alloc_madvise_vma(vm, args->start, args->range);
+	err = xe_vm_alloc_madvise_vma(vm, madvise_range.addr, args->range);
 	if (err)
 		goto madv_fini;
 
@@ -797,7 +804,8 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 	madvise_funcs[attr_type](xe, vm, madvise_range.vmas, madvise_range.num_vmas, args,
 				 &details);
 
-	err = xe_vm_invalidate_madvise_range(vm, args->start, args->start + args->range);
+	err = xe_vm_invalidate_madvise_range(vm, madvise_range.addr,
+					     madvise_range.addr + args->range);
 
 	if (madvise_range.has_svm_userptr_vmas)
 		xe_svm_notifier_unlock(vm);
-- 
2.43.0

