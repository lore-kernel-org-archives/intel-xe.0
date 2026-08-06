Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9DAC55ABF
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 13:58:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC9A710F1FC;
	Thu,  6 Aug 2026 13:58:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X3O+tXjd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013C010E285
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 13:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786024719; x=1817560719;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=KpYGypVcX7t8XC6+1QVIAwWNj4o+z4lwVgGGwmxqbKo=;
 b=X3O+tXjdIICKFalzeron445MIDbl/9l+TGFNIlt/LxqNnkoxYacXP/tY
 Rhy5I/0bpo1tw8dqT0lQTIr/rYqx0Ae94Ay7RMXMDysBBFnaVBjO/g+YC
 /HU00qciypC9nY08ke0vSH88REmS4p/vlrimaO1XuCquEnl6lZ2eBfuJk
 L22iEGp6HycFql5k2+lpSzZH6GIYcM9xaFCWIehKy3uB6MlgOc/a/ytzy
 p8qIHx3apnRGPgw5T/s8EF5J8LnclApYoAtfVSAaWovA4jo6449JV1iOa
 QAR45X0CGVcPdztvIfQmS5Vuh+YwvuxkcP4tdfxlSqCy0dZe6sL2voXnC w==;
X-CSE-ConnectionGUID: aZLCnFYXQ46Pjn5LGT02AQ==
X-CSE-MsgGUID: AV4MVhahSni0l+25fkqN/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="89141338"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="89141338"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 06:58:39 -0700
X-CSE-ConnectionGUID: jIuOG3+hStS2dt8BQ0uj6g==
X-CSE-MsgGUID: pQ8Tz6MZSAWgWqIFVLH8/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="265594936"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 06:58:38 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com
Subject: [PATCH 3/7] drm/xe/vsec: Use correct pm state get
Date: Thu,  6 Aug 2026 06:58:23 -0700
Message-ID: <20260806135820.1422040-12-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806135820.1422040-9-michael.j.ruhl@intel.com>
References: <20260806135820.1422040-9-michael.j.ruhl@intel.com>
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
 drivers/gpu/drm/xe/xe_vsec.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index a9baf0bfe572..f9b519f2b91f 100644
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
@@ -160,9 +161,18 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 	if (!xe->soc_remapper.set_telem_region)
 		return -ENODEV;
 
-	/* indicate that we are not at an appropriate power level */
-	if (!xe_pm_runtime_get_if_active(xe))
-		return -ENODATA;
+	/* make sure that we are not at an inappropriate power level */
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
 
 	/* set SoC re-mapper index register based on GUID memory region */
 	xe->soc_remapper.set_telem_region(xe, mem_region);
-- 
2.43.0

