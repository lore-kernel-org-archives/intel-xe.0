Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AA9C4167B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 07:26:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A7C310E6BC;
	Thu, 30 Nov 2023 07:26:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE6310E6BC
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 07:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701329214; x=1732865214;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dVAE7DhaXvcq+FrjKFVG8x8B88aJM0UWfNl7CiSz1Ck=;
 b=IsSG1s6uGE5PRc8ZIpAUaa9Q1e7GPwyJl3x/jce9MnBpSCmqFIIm3vnl
 Q+Vi7xv0WWe48DcMfWxAe7+BCcETaYfWEjXlN27lNpvF/mGm9A6XVeW/K
 ek2B3j2xrId5hRI3cXa2XuKZ6T4xRXaZ7qqtZBzn39NMYFHO1QihB9eTH
 TvRcev0OLilqUkz7fdb8xqdSYTsdCvxczsCcDT8GUVeiQI4qEKv9Hen1F
 40X+1VmouMa+8Uh94+wfVn9p+3ymQOMwx79UNClnWF8N8F8iiDHB9JuFc
 FzhBa4mGvMoM9An852r1VRWaPVRosw82ZCO53VssRmyDpYcHK126qmvoc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="390442149"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="390442149"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 23:26:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="17290778"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa001.jf.intel.com with ESMTP; 29 Nov 2023 23:26:53 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 30 Nov 2023 12:44:03 +0530
Message-Id: <20231130071407.606176-3-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20231130071407.606176-1-animesh.manna@intel.com>
References: <20231130071407.606176-1-animesh.manna@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/6] drm/i915/dsb: Allocate command buffer
 from local memory
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Using system memory for the DSB command buffer doesn't appear to work.
On DG2 it seems like the hardware internally replaces the actual memory
reads with zeroes, and so we end up executing a bunch of NOOPs instead
of whatever commands we put in the buffer. To determine that I measured
the time it takes to execute the instructions, and the results are
always more or less consistent with executing a buffer full of NOOPs
from local memory.

Another theory I considered was some kind of cache coherency issue.
Looks like i915_gem_object_pin_map_unlocked() will in fact give you a
WB mapping for system memory on DGFX regardless of what mapping mode
was requested (WC in case of the DSB code). But clflush did not
change the behaviour at all, so that theory seems moot.

On DG1 it looks like the hardware might actually be fetching data from
system memory as the logs indicate that we just get underruns. But that
is equally bad, so doesn't look like we can really use system memory on
DG1 either.

Thus always allocate the DSB command buffer from local memory on
discrete GPUs.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231009132204.15098-1-ville.syrjala@linux.intel.com
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
(cherry picked from commit bcdcae63274047dea5acf27432bbceb8191d012e)
---
 drivers/gpu/drm/i915/display/intel_dsb.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
index 3e32aa49b8eb..7410ba3126f9 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@ -5,6 +5,7 @@
  */
 
 #include "gem/i915_gem_internal.h"
+#include "gem/i915_gem_lmem.h"
 
 #include "i915_drv.h"
 #include "i915_irq.h"
@@ -461,7 +462,11 @@ struct intel_dsb *intel_dsb_prepare(const struct intel_crtc_state *crtc_state,
 	/* ~1 qword per instruction, full cachelines */
 	size = ALIGN(max_cmds * 8, CACHELINE_BYTES);
 
-	obj = i915_gem_object_create_internal(i915, PAGE_ALIGN(size));
+	if (HAS_LMEM(i915))
+		obj = i915_gem_object_create_lmem(i915, PAGE_ALIGN(size),
+						  I915_BO_ALLOC_CONTIGUOUS);
+	else
+		obj = i915_gem_object_create_internal(i915, PAGE_ALIGN(size));
 	if (IS_ERR(obj))
 		goto out_put_rpm;
 
-- 
2.29.0

