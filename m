Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B835CC6B0F
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 21:47:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC2B10F1E0;
	Tue, 13 Oct 2026 21:47:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB15710EA29
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 21:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791928039; x=1823464039;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=j0BnPlxq7JEVz6/6T9RbZkc1vLTA9xc7qG1Pv5i3+VE=;
 b=Zx8vRs4+M6UUkNtbXfFAxzx6CVOr5ejdD/ILXGFAbWqdJZlXcaWQS5WD
 a/EKvcW0kM29D6jGss//G519ztvoD3l24gq2ygI6jpDSZz5w9C/0ZBN3S
 CRTHTf00RJW3FyxLmOCuynekEyx64Bu1ohotaehIrSkX5sx+UTIvYqzzn
 vGFl1E2tmV4R8hK20wTxu9m+qty7ah8IkJrjZJzEPZdIyW5BtEi3XQelD
 NBukNFhXlpXOsgFMOAwpVKp6i1iyDmP4rtbTtbhAH8DW17tbxWMCrI6wz
 OKJaJkl8hZhVzbIIeWnpPgMHfscXDKQjNs3J8WWTfPoK3/Qi01/1Kz/D+ A==;
X-CSE-ConnectionGUID: M3K92BvwQR+7r/lW3XrD8A==
X-CSE-MsgGUID: qWn4LVYdQD6UIbvD70zC5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="565913"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; d="scan'208,146";a="565913"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 14:47:07 -0700
X-CSE-ConnectionGUID: lVduypw6R+WyAd9+EHQvLw==
X-CSE-MsgGUID: BE//KoNSSIGFToH2Rqmebg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; d="scan'208,146";a="1629838"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 14:47:08 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: [PATCH v12 06/21] drm/xe/vsec: Do not register BMG PMT for VF
Date: Tue, 13 Oct 2026 14:46:59 -0700
Message-ID: <20261013214655.3502964-29-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013214655.3502964-23-michael.j.ruhl@intel.com>
References: <20261013214655.3502964-23-michael.j.ruhl@intel.com>
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

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index a9baf0bfe572..178f22db4046 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -149,6 +149,8 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 	u32 offset;
 	int ret;
 
+	xe_assert(xe, !IS_SRIOV_VF(xe));
+
 	ret = xe_guid_decode(guid, &mem_region, &offset);
 	if (ret)
 		return ret;
@@ -157,9 +159,6 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
 
 	guard(mutex)(&xe->pmt.lock);
 
-	if (!xe->soc_remapper.set_telem_region)
-		return -ENODEV;
-
 	/* indicate that we are not at an appropriate power level */
 	if (!xe_pm_runtime_get_if_active(xe))
 		return -ENODATA;
@@ -186,6 +185,9 @@ static enum xe_vsec get_platform_info(struct xe_device *xe)
 	if (xe->info.platform > XE_BATTLEMAGE)
 		return XE_VSEC_UNKNOWN;
 
+	if (IS_SRIOV_VF(xe) && xe->info.platform == XE_BATTLEMAGE)
+		return XE_VSEC_UNKNOWN;
+
 	return vsec_platforms[xe->info.platform];
 }
 
-- 
2.43.0

