Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17749C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 14:12:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD4D10E1D6;
	Thu,  7 Dec 2023 14:12:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F3410E1D6
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 14:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701958330; x=1733494330;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ipa1MoNRPQ8w7nlqMhheGSjamUpPqq0mHJGja6ihYoM=;
 b=ZTLsArgwu6EW1yGu0krhH0HQvyZYIz3xepLYRWA+RXpKd/ffs99+1arC
 WisYdcYCsEzJB9LgzdE1WpsAEmdwqlBb/8UzxW7CpSaVGfH9K3Q+sidel
 H/gUv8SXwE3Oj5Wmi0Y1njVkl7nW2FoHZE+t69m641YrTftSWsFqc0JX2
 wwK1qbW2Efd75kSWcnMMlr4jUaN8lKqFcdmftVl0PCIbs9f3Gtv6TVsJ3
 adBDACaXxbo1yD9JguWGvsYDc7UKoMP4KSTHifyjBSRcpYAdMC66pew+6
 4L6EIQ7fYIyPXVg35iiPrL/Twn7/0e6wrhcaxSQ3SPxK5f5U/vo8jxCEb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="12947504"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="12947504"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 06:12:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="721479738"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="721479738"
Received: from jpoulsen-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.234])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 06:12:08 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 02/16] drm/gpuvm: don't always WARN in
 drm_gpuvm_check_overflow()
Date: Thu,  7 Dec 2023 15:11:42 +0100
Message-ID: <20231207141157.26014-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231207141157.26014-1-thomas.hellstrom@linux.intel.com>
References: <20231207141157.26014-1-thomas.hellstrom@linux.intel.com>
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

From: Danilo Krummrich <dakr@redhat.com>

Don't always WARN in drm_gpuvm_check_overflow() and separate it into a
drm_gpuvm_check_overflow() and a dedicated
drm_gpuvm_warn_check_overflow() variant.

This avoids printing warnings due to invalid userspace requests.

Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231108001259.15123-3-dakr@redhat.com
(cherry picked from commit d1adea27d0c8a08031b075f1bf4c5ce6f135ad7c)
---
 drivers/gpu/drm/drm_gpuvm.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index b378554b81ac..1cbeb4169f9c 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -614,12 +614,18 @@ static int __drm_gpuva_insert(struct drm_gpuvm *gpuvm,
 static void __drm_gpuva_remove(struct drm_gpuva *va);
 
 static bool
-drm_gpuvm_check_overflow(struct drm_gpuvm *gpuvm, u64 addr, u64 range)
+drm_gpuvm_check_overflow(u64 addr, u64 range)
 {
 	u64 end;
 
-	return drm_WARN(gpuvm->drm, check_add_overflow(addr, range, &end),
-			"GPUVA address limited to %zu bytes.\n", sizeof(end));
+	return check_add_overflow(addr, range, &end);
+}
+
+static bool
+drm_gpuvm_warn_check_overflow(struct drm_gpuvm *gpuvm, u64 addr, u64 range)
+{
+	return drm_WARN(gpuvm->drm, drm_gpuvm_check_overflow(addr, range),
+			"GPUVA address limited to %zu bytes.\n", sizeof(addr));
 }
 
 static bool
@@ -647,7 +653,7 @@ static bool
 drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
 		      u64 addr, u64 range)
 {
-	return !drm_gpuvm_check_overflow(gpuvm, addr, range) &&
+	return !drm_gpuvm_check_overflow(addr, range) &&
 	       drm_gpuvm_in_mm_range(gpuvm, addr, range) &&
 	       !drm_gpuvm_in_kernel_node(gpuvm, addr, range);
 }
@@ -682,7 +688,7 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 	gpuvm->ops = ops;
 	gpuvm->drm = drm;
 
-	drm_gpuvm_check_overflow(gpuvm, start_offset, range);
+	drm_gpuvm_warn_check_overflow(gpuvm, start_offset, range);
 	gpuvm->mm_start = start_offset;
 	gpuvm->mm_range = range;
 
@@ -691,8 +697,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 		gpuvm->kernel_alloc_node.va.addr = reserve_offset;
 		gpuvm->kernel_alloc_node.va.range = reserve_range;
 
-		if (likely(!drm_gpuvm_check_overflow(gpuvm, reserve_offset,
-						     reserve_range)))
+		if (likely(!drm_gpuvm_warn_check_overflow(gpuvm, reserve_offset,
+							  reserve_range)))
 			__drm_gpuva_insert(gpuvm, &gpuvm->kernel_alloc_node);
 	}
 }
-- 
2.42.0

