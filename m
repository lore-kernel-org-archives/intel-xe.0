Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39AABC197A0
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 16:02:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC29010E439;
	Mon, 20 Nov 2023 16:02:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21AD610E439
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 16:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700496167; x=1732032167;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zNkwQG87xw3+Grc+ywJ6efGUIsrDnqmbj2gf6MQfCNg=;
 b=D4uPrWfWSxauslf9NvodY02fTVasnArsbWpfIbNVABQCzpt0PlKX4vru
 4TsBstdEemr1nivaPnxB7mUsR65cs74Wmzjccpp+CJvClFspNLKJPAJvY
 Bu0OGHj3qlPchuJSLe7DgJy2JBsQtNGD5fAhenyNlP+Knu2WEzqlWagWi
 1uov1RrPyRZojBB0r8c/kxpzEO/fGCW5tTDZ0zGyew+t/k4RQ9JDfYbRY
 Q86AKQqPBc0GKdZWFWgI83c422rYtlQw0RMTkA7draoxGPZXqDFr4qDc3
 iYehuZw0mJdrzjhxFN4YMmhkVFnjwvK7yS70LmrPcQWI5nocuKn8x+kLR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="13193737"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="13193737"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 08:02:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="716256512"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="716256512"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 08:02:26 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 20 Nov 2023 08:02:05 -0800
Message-Id: <20231120160205.669295-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231120160205.669295-1-lucas.demarchi@intel.com>
References: <20231120160205.669295-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 2/2] drm/xe/mmio: Make xe_mmio_wait32() aware of
 interrupts
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Gustavo Sousa <gustavo.sousa@intel.com>

With the current implementation, a preemption or other kind of interrupt
might happen between xe_mmio_read32() and ktime_get_raw(). Such an
interruption (specially in the case of preemption) might be long enough
to cause a timeout without giving a chance of a new check on the
register value on a next iteration, which would have happened otherwise.

This issue causes some sporadic timeouts in some code paths. As an
example, we were experiencing some rare timeouts when waiting for PLL
unlock for C10/C20 PHYs (see intel_cx0pll_disable()). After debugging,
we found out that the PLL unlock was happening within the expected time
period (20us), which suggested a bug in xe_mmio_wait32().

To fix the issue, ensure that we do a last check out of the loop if
necessary.

This change was tested with the aforementioned PLL unlocking code path.
Experiments showed that, before this change, we observed reported
timeouts in 54 of 5000 runs; and, after this change, no timeouts were
reported in 5000 runs.

v2:
  - Prefer an implementation without a barrier (v1 switched the order of
    xe_mmio_read32() and ktime_get_raw() calls and added a barrier() in
    between). (Lucas, Rodrigo)

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 5d58f55348f4..ac3299e5ad86 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -538,6 +538,12 @@ int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 t
 		wait <<= 1;
 	}
 
+	if (ret != 0) {
+		read = xe_mmio_read32(gt, reg);
+		if ((read & mask) == val)
+			ret = 0;
+	}
+
 	if (out_val)
 		*out_val = read;
 
-- 
2.40.1

