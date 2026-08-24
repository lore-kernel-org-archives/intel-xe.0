Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE7DC5DF9C
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 16:23:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E5610E57C;
	Mon, 24 Aug 2026 16:23:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DXn6hb98";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C9C10E57C
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 16:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787588616; x=1819124616;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=iC3F1+unad+8lP/Q5JnOD0GFaB3o6KPxqsxPcskIobA=;
 b=DXn6hb98EyMlgXfsW73rVfwKBbI3vtnb54QCvGXPTtAM7DU3bvHnjeGE
 UwQ/UirFHjc2MmUmcPDZUsq5WqwjlrDAGnjTbW4dqeAOzMEGbquhe8RzO
 wwm9Fe1uYRUBrK9R3DsdV9+4t+BQ7Q43awS79MORHGW1AYnbO6Sj7daZ0
 AitHBBdaqqsOyGJQqCvo1D3SG4eeJhTWGi9hQmyCNjQnCrvh4RDl0flMt
 XzpggSE3G4dZ3bN1zqGLctJjVoWG84Qhft0q3puiyQDpaGo1XEYJZu1KM
 OD45p0CA/bWwL0aj87BPYHevob3tD2V/dF4UdQQhR19EVHRNqPgDAUeO4 Q==;
X-CSE-ConnectionGUID: kPJLBM/MRti0VDFCd+GJMg==
X-CSE-MsgGUID: pC0VNValQFuRjKEvsQevrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="91858074"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208";a="91858074"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 09:23:36 -0700
X-CSE-ConnectionGUID: oWRYPV7iSAO65SeDbJeTVA==
X-CSE-MsgGUID: uAEmVt2pRVqpYgmJp/rwKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208";a="267088135"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 09:23:37 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: [PATCH v3 04/10] drm/xe/vsec: Use correct pm state get
Date: Mon, 24 Aug 2026 09:23:20 -0700
Message-ID: <20260824162317.2450380-16-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824162317.2450380-12-michael.j.ruhl@intel.com>
References: <20260824162317.2450380-12-michael.j.ruhl@intel.com>
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

Crashlog needs to be collected at all times.  The current pm
check assumes telemetry only.

Update read path to enable device for crashlog instances.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Fixes: 2c402a801c19 ("platform/x86/intel/pmt: support BMG crashlog")
---
 drivers/gpu/drm/xe/xe_vsec.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index bd83a33aef6c..8d99a3770b5a 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -145,6 +145,7 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 {
 	struct xe_device *xe = kdev_to_xe_device(dev);
 	void __iomem *telem_addr = xe->mmio.regs + BMG_TELEMETRY_OFFSET;
+	u32 cap_type = FIELD_GET(GUID_CAP_TYPE, guid);
 	u32 mem_region;
 	u32 offset;
 	int ret;
@@ -158,16 +159,28 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 
 	telem_addr += offset + user_offset;
 
-	guard(mutex)(&xe->pmt.lock);
+	/* Always allow crashlog. Telemetry, only when powered */
+	switch (cap_type) {
+	case CRASHLOG:
+		xe_pm_runtime_get(xe);
+		break;
+	case TELEMETRY:
+		if (!xe_pm_runtime_get_if_active(xe))
+			return -ENODATA;
+		break;
+	case WATCHER:
+		return -EINVAL;
+	}
 
-	/* indicate that we are not at an appropriate power level */
-	if (!xe_pm_runtime_get_if_active(xe))
-		return -ENODATA;
+	mutex_lock(&xe->pmt.lock);
 
 	/* set SoC re-mapper index register based on GUID memory region */
 	xe->soc_remapper.set_telem_region(xe, mem_region);
 
 	memcpy_fromio(data, telem_addr, count);
+
+	mutex_unlock(&xe->pmt.lock);
+
 	xe_pm_runtime_put(xe);
 
 	return count;
-- 
2.43.0

