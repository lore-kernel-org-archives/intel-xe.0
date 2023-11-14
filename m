Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256A6C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 22:09:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E3910E4E1;
	Tue, 14 Nov 2023 22:09:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5BEA10E4DD
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 22:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699999782; x=1731535782;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=00+Qk2NQ1O0qgQOvqtGpHcJheZSCq0g34bXXKHUcufw=;
 b=i0lEuayYV0j7H242lKizvG278S+bemKvTtQ7586ySojGncUzW/QNU5Co
 wGSNEshA6izAhRsE35eu5WrlPR9FljuFjgS9yYUG3HW6aZ9kvcxnXtZdd
 PjTQ6OOCSr+JCadjX+F31z3AP8EM4NQaIzefYSx5L+7rhn9cKQ1da3W6b
 ulMhNyHZqHblahATHsVC5U800P4Tox6/mW8FyE7aaZuWOXBol4FWySWUT
 YYLRahYhbbaInjfBGWw8R3XigNJvEVqhfkIlI2A+B8Q9rz/yhEaomkFH1
 SX2ar6keOi2p1EIVLWAYrNs45Zt6p/CiRGnzgBgSJqwvTCQbZmpgV0O4j w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="3864883"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; 
   d="scan'208";a="3864883"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 14:09:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="768383147"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; d="scan'208";a="768383147"
Received: from nnabavi-mobl.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.92.32.82])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 14:09:40 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 14 Nov 2023 19:09:22 -0300
Message-ID: <20231114220922.88268-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/mmio: Make xe_mmio_wait32() aware of
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

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

To fix the issue, ensure that we call ktime_get_raw() to get the current
time before we check the register value. This allows for a last check
after a timeout and covers the case where the it is caused by some
preemption/interrupt.

This change was tested with the aforementioned PLL unlocking code path.
Experiments showed that, before this change, we observed reported
timeouts in 54 of 5000 runs; and, after this change, no timeouts were
reported in 5000 runs.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index ae09f777d711..4d0e816a81ac 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -98,13 +98,22 @@ static inline int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask,
 	u32 read;
 
 	for (;;) {
+		cur = ktime_get_raw();
+
+		/*
+		 * Keep the compiler from re-ordering calls to ktime_get_raw()
+		 * and xe_mmio_read32(): reading the current time after reading
+		 * register has the potential for "fake timeouts" due to
+		 * preemption/interrupts in between the two.
+		 */
+		barrier();
+
 		read = xe_mmio_read32(gt, reg);
 		if ((read & mask) == val) {
 			ret = 0;
 			break;
 		}
 
-		cur = ktime_get_raw();
 		if (!ktime_before(cur, end))
 			break;
 
-- 
2.42.0

