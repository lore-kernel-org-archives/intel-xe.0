Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BCBC5DF9D
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 16:23:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3898C10E579;
	Mon, 24 Aug 2026 16:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ajzOAekA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E080610E579
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 16:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787588613; x=1819124613;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=IDb6Ixz9/y5Puin5GHNA6oNcgYp9d0JoawAmDv8Dzak=;
 b=ajzOAekAV+oQhDhVNCmhtLMIvtTZEyG4gKcDq2k+bbQ14lRqVQVrKwTH
 ffVha/fBKo4+GEuV62a4sbiPoOIJKn31KRg3zdBsSzV3296BLAMOQRLy4
 lDT/eufNjBk6bewKezHlH8s2tUYhOMQZMgULL7bb7ZXHRY4XUw+/d/mr3
 8DekzWVbh3V08V5fRpwWGbe9UiXXtcQPNO2xEfKyTxFnUgaYwaaZpqw/9
 rrc2+E2EtPJFyE5lMsTUzDb1dHjfjku82n17hDzRH/8sE9BBDmXs/YY9x
 xGiFaHSd3JOImFen+ZurvaUP/tsJ2gW4aM0loKOxw1eQQTSwnWcjBAdmI Q==;
X-CSE-ConnectionGUID: obLKIU5DSVSh9yheheG2MQ==
X-CSE-MsgGUID: IZ6pATxbTZ+Li3mpoTUUZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="91858068"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208";a="91858068"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 09:23:32 -0700
X-CSE-ConnectionGUID: YA6uzOXcTX2/aWRrMu7DoA==
X-CSE-MsgGUID: KX0AGs2uTFqE2n9DrJ3bxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208";a="267088131"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 09:23:33 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: [PATCH v3 03/10] drm/xe/vsec: Protect against missing config
Date: Mon, 24 Aug 2026 09:23:19 -0700
Message-ID: <20260824162317.2450380-15-michael.j.ruhl@intel.com>
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

Some init paths (VF) will not provide soc-remapper
callbacks.

BMG PMT access requires the soc-remapper.

If the soc-remapper is not configured, do not register for
PMT, and block read access.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index a9baf0bfe572..bd83a33aef6c 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -149,6 +149,9 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 	u32 offset;
 	int ret;
 
+	if (!xe->soc_remapper.set_telem_region)
+		return -ENODEV;
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
+		if (!xe->soc_remapper.set_telem_region)
+			return;
 		info->priv_data = &xe_pmt_cb;
 		break;
 	default:
-- 
2.43.0

