Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F58C79FBD
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 15:48:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C22B310F1E5;
	Wed,  9 Sep 2026 15:48:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cQLstupB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60BC610F1DD
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 15:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788968878; x=1820504878;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=YlljUlfYK6ql8aglTP+s8zYB492b5ToRyyIJDOqB8ts=;
 b=cQLstupBh6M735tRolzKe8sptJGzzEGtfa7sxk3hqWbL1DXGO+mKz2Q3
 jwl4VKK6qCKKZ2Qsw4HQm8fjmf11RvFlSJ3xYeDk4jJ2rJHgJO0bVcPT7
 Ua8eDqOZnY9ycQhqa2favRcSMX8mJXfOfK1EYjTnPB19gKBY81LICbO2W
 botQCuPSZZEoTz72TcFJwPh3OcQhKt7YOynWEWCUBtZXt5+g04whr68Ny
 Z/Hfc0OhO5DCjDGA2n1ZfrPY6okyzb31/zS8fhc53mKcYHOSrLlDuT5HQ
 +XwrQcTeY9CsepPxccOyMLMvzk7f6RgLSXaZpyUVSpwI8zlG2wvC21VXq A==;
X-CSE-ConnectionGUID: fTr10lCdREiIttFEqMGlrQ==
X-CSE-MsgGUID: cTy7zcQ1SwOfUYjCZAipCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93091819"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208,146";a="93091819"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 08:47:57 -0700
X-CSE-ConnectionGUID: huoj6TIwQ0WMGj6Uy+FVbQ==
X-CSE-MsgGUID: d4s8wDldTbSVFolXIa3b4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
 d="scan'208,146";a="268102508"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 08:47:57 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: [PATCH v7 06/20] drm/xe/vsec: Do not register BMG PMT for VF
Date: Wed,  9 Sep 2026 08:47:45 -0700
Message-ID: <20260909154739.1515514-28-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909154739.1515514-22-michael.j.ruhl@intel.com>
References: <20260909154739.1515514-22-michael.j.ruhl@intel.com>
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

BMG PMT is not supported for VF nodes.

If IS_SRIOV_VF() is true, do NOT register with PMT.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index a9baf0bfe572..71bc359b2ad1 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -149,6 +149,9 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 	u32 offset;
 	int ret;
 
+	if (IS_SRIOV_VF(xe))
+		return -EINVAL;
+
 	ret = xe_guid_decode(guid, &mem_region, &offset);
 	if (ret)
 		return ret;
@@ -157,9 +160,6 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 
 	guard(mutex)(&xe->pmt.lock);
 
-	if (!xe->soc_remapper.set_telem_region)
-		return -ENODEV;
-
 	/* indicate that we are not at an appropriate power level */
 	if (!xe_pm_runtime_get_if_active(xe))
 		return -ENODATA;
@@ -210,6 +210,8 @@ void xe_vsec_init(struct xe_device *xe)
 
 	switch (platform) {
 	case XE_VSEC_BMG:
+		if (IS_SRIOV_VF(xe))
+			return;
 		info->priv_data = &xe_pmt_cb;
 		break;
 	default:
-- 
2.43.0

