Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A16EC01A9
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 09:31:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC4610E3E3;
	Mon, 23 Mar 2026 09:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BGhRU5r7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1BC10E48F
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 09:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774258298; x=1805794298;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tUGwE2avk7ffF2EjM0SftbBdKBVDvQU3Yzq/Ok5a//4=;
 b=BGhRU5r7AngxSADzAA8E8wiXH78qUEPY+UTX/fzErWPXJP/il1fPmzUs
 nQQjMMYWSde9Jv9WY2+C/+YdnddeQ6VvGzp1L6p5GKlPYpnGnfQchYu5T
 FWFN+ovkkhuU78Ueod8G9EhGbhkU77RHCGsyzRsvJ/bOY88wQC0qeENr+
 AwKbPiu09OvbNl3ooUyPE5LdvaoQO2VIMneN+Bvd6vHlrd1eqV6Y4mgLG
 1wrOCaRldDqE4x4vid/2PUrcq+ck6BG8hzE1UAMU29TnoA4d4ocX9D+BC
 64FPQY84aED6IFtFdW1lqVmKnaIkO9INRNpl8wcPawTjHUoronRiqznjJ g==;
X-CSE-ConnectionGUID: ZV45wjD0Roy8h8Xz7YSMSg==
X-CSE-MsgGUID: gUWvilYKR4qcVPi76HLEOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75221772"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="75221772"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:31:36 -0700
X-CSE-ConnectionGUID: QvyZrS/vSxSLrm/wB8Xu3g==
X-CSE-MsgGUID: LqeA8/ZnQFyCFTTbT0z1Mg==
X-ExtLoop1: 1
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:31:34 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [PATCH v7 12/12] drm/xe/madvise: Accept canonical GPU addresses in
 xe_vm_madvise_ioctl
Date: Mon, 23 Mar 2026 15:01:01 +0530
Message-ID: <20260323093106.2986900-13-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323093106.2986900-1-arvind.yadav@intel.com>
References: <20260323093106.2986900-1-arvind.yadav@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_madvise.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 4a19da5e86d4..2d03676ee595 100644
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
 	struct xe_vm *vm;
 	struct drm_exec exec;
@@ -724,7 +731,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 	if (err)
 		goto unlock_vm;
 
-	err = xe_vm_alloc_madvise_vma(vm, args->start, args->range);
+	err = xe_vm_alloc_madvise_vma(vm, madvise_range.addr, args->range);
 	if (err)
 		goto madv_fini;
 
@@ -774,7 +781,8 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 	madvise_funcs[attr_type](xe, vm, madvise_range.vmas, madvise_range.num_vmas, args,
 				 &details);
 
-	err = xe_vm_invalidate_madvise_range(vm, args->start, args->start + args->range);
+	err = xe_vm_invalidate_madvise_range(vm, madvise_range.addr,
+					     madvise_range.addr + args->range);
 
 	if (madvise_range.has_svm_userptr_vmas)
 		xe_svm_notifier_unlock(vm);
-- 
2.43.0

