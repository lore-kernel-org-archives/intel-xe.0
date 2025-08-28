Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441E5CA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 10:22:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0876D10E96E;
	Thu, 28 Aug 2025 10:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BruLcp3p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F359D10E96E
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 10:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756376532; x=1787912532;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2SY+1cAXCmP4Ua/DISXWsvj2Bidzf5XeMXKajbRitug=;
 b=BruLcp3pk1eq8zr7U6qEPVYWCtry1X1Yfht2NeAPgVxjG8RgXdSXlIVv
 ZEd9abI44qF5UPObOxsz9ORV0Jvn3w1hY7HMZ/8dXELnNCRoMGPPsowyX
 xHM9eU0hHQbaBPFW9ZIhDB9bV+QnA5/oc/wuKLi/IbQ36lTRMZsXXRPvm
 6F8c4LOxRIxD0IZZ8tRRg3CMcGG4W3imzkGbAIAEm8C90uIYbkgaeRodT
 V4+qe8se/J7iea9z/J08E8S8NjJedj5iOLoAzFKVffWqOI9rJNXBt6SYD
 4kiSlq2fAwvmavzBrgPh1ilhLQu06tqH1IXoc/aMGcArYrRViGPMwl7ap A==;
X-CSE-ConnectionGUID: cg2ezWrdRxeP3HL946vsew==
X-CSE-MsgGUID: 5lG+xQAATDypRi3cfs5rzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58741882"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58741882"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 03:22:11 -0700
X-CSE-ConnectionGUID: WIvQfx5MS4SM5KKUY3zvvg==
X-CSE-MsgGUID: 2ePhBjbfShuPF51HurybNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="201040295"
Received: from himal-super-server.iind.intel.com ([10.190.239.34])
 by orviesa002.jf.intel.com with ESMTP; 28 Aug 2025 03:22:11 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH 2/2] drm/xe/vm: Fix error handling in
 xe_vm_query_vmas_attrs_ioctl()
Date: Thu, 28 Aug 2025 16:19:33 +0530
Message-Id: <20250828104933.3839825-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250828104933.3839825-1-himal.prasad.ghimiray@intel.com>
References: <20250828104933.3839825-1-himal.prasad.ghimiray@intel.com>
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

copy_to_user() returns the number of bytes not copied on failure, not a
negative error code. Update the logic to return -EFAULT instead of the
number of bytes to correctly signal the error.

Fixes: 418807860e94 ("drm/xe/uapi: Add UAPI for querying VMA count and memory attributes")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e913efa2057b..5a9dde9dd722 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2288,6 +2288,8 @@ int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, struct drm_
 
 	err = copy_to_user(attrs_user, mem_attrs,
 			   args->sizeof_mem_range_attr * args->num_mem_ranges);
+	if (err)
+		err = -EFAULT;
 
 free_mem_attrs:
 	kvfree(mem_attrs);
-- 
2.34.1

