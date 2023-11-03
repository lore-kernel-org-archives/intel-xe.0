Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08EEAC4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 15:32:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C914410E16F;
	Fri,  3 Nov 2023 15:32:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6269D10E16D
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 15:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699025573; x=1730561573;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=II2gyFmnH4dMbk00kiWVDJ91cmTwwKOWZiwDgDmzSM4=;
 b=eWTpv3cETaJWJbMOYJxxlTurZoTPiZ+WRG9+dY0KnPzuJNzZTKztZnOy
 piCx/NYbB4opkk4I0laeUESYSBNwF2leuICxFwG8/VHZ4XMb4rxs+2HD7
 Is1WPsL3nZxYdoekm9frZmvbrnzbclCqB2aLgfivFuSEe3Z2VOEssFIcn
 bqdfBLn/kMCP9qQirjdo+emX4r4m1M4WBHqyl9MmVHSWxDM8Y4d82Gtqr
 WB0A0Quu25YBWj251+xs0pcxNR6g5zQwKdDzEJTzMqBbifC/VmK+5zCKo
 6pzNY8eHjmb9JJgCFNW3u/YDhIpxuMHcK9l99m5dzHglinjMxeJIbzPU6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387853730"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387853730"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 08:32:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="765272640"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="765272640"
Received: from shouweis-mobl1.ccr.corp.intel.com (HELO fedora..)
 ([10.249.254.68])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 08:32:51 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 16:32:19 +0100
Message-ID: <20231103153234.30407-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231103153234.30407-1-thomas.hellstrom@linux.intel.com>
References: <20231103153234.30407-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI v8 03/18] drm/gpuvm: export drm_gpuvm_range_valid()
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

Drivers may use this function to validate userspace requests in advance,
hence export it.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 14 +++++++++++++-
 include/drm/drm_gpuvm.h     |  1 +
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 1cbeb4169f9c..dd46d14fd3e6 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -649,7 +649,18 @@ drm_gpuvm_in_kernel_node(struct drm_gpuvm *gpuvm, u64 addr, u64 range)
 	return krange && addr < kend && kstart < end;
 }
 
-static bool
+/**
+ * drm_gpuvm_range_valid() - checks whether the given range is valid for the
+ * given &drm_gpuvm
+ * @gpuvm: the GPUVM to check the range for
+ * @addr: the base address
+ * @range: the range starting from the base address
+ *
+ * Checks whether the range is within the GPUVM's managed boundaries.
+ *
+ * Returns: true for a valid range, false otherwise
+ */
+bool
 drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
 		      u64 addr, u64 range)
 {
@@ -657,6 +668,7 @@ drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
 	       drm_gpuvm_in_mm_range(gpuvm, addr, range) &&
 	       !drm_gpuvm_in_kernel_node(gpuvm, addr, range);
 }
+EXPORT_SYMBOL_GPL(drm_gpuvm_range_valid);
 
 /**
  * drm_gpuvm_init() - initialize a &drm_gpuvm
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index baa1a96c038c..ed766dd9d96b 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -253,6 +253,7 @@ void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 		    const struct drm_gpuvm_ops *ops);
 void drm_gpuvm_destroy(struct drm_gpuvm *gpuvm);
 
+bool drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
 bool drm_gpuvm_interval_empty(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
 
 static inline struct drm_gpuva *
-- 
2.41.0

