Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09559C197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 15:39:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD8E510E622;
	Thu, 16 Nov 2023 15:39:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E6FA10E621
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 15:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700149188; x=1731685188;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3w2LoSnu1h+2bA2i8LpLSquoPD+mOqr76Bk/cWEOe8o=;
 b=FHZWPIO95q9J3IJVODSNAuLI+t6bjiSvjNGRqBEO5Ga/uIJUsnefcVGC
 FM5umwHU4ypvURqWzcibBMPgOZStaae2v7lHpWtGcUese5sPhAT1nUMSP
 Eg2nmc6rTrCJ1zUN05zr4Soao6dvZciaE6JcTXB6oZcoaF1iOiYz1dk52
 VRlGDLr7fRfVbJofRafnOz6B2prfogxbEMIFw+HwlxPoBqK2w1biJ9pg2
 2mKomntjpg6Eslz0EPymu8NZ7x7mjIWBKok3+8CTCfe9ySXFXDo3xXLu5
 TLEQUxnJbnXQsxutgcNUHx9wQMoBobfbn27OyNvzFau95Zxhhk9nxlSN/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="393963172"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="393963172"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 07:39:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; 
   d="scan'208";a="6745436"
Received: from tjlunife-mobl3.amr.corp.intel.com (HELO
 gjsousa-mobl2.intel.com) ([10.255.34.202])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 07:39:29 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Nov 2023 12:39:02 -0300
Message-ID: <20231116153901.31941-4-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231116153901.31941-2-gustavo.sousa@intel.com>
References: <20231116153901.31941-2-gustavo.sousa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/2] drm/xe/mmio: Make xe_mmio_wait32() aware
 of interrupts
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

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 12df698f6764..16b3ca97f7b4 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -536,6 +536,12 @@ int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 t
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
2.42.0

