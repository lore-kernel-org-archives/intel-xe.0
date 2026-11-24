Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE403606A321
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 00:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UODyuFUi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824DC10F2AD;
	Tue, 24 Nov 2026 00:39:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF8D10F2AE
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 00:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795480753; x=1827016753;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=j0BnPlxq7JEVz6/6T9RbZkc1vLTA9xc7qG1Pv5i3+VE=;
 b=UODyuFUifI0HPXTVqMk6bIRRxaz1D8rNDxWNkM9lgRaV4AVTVIKwWAZg
 nj1LKKcQMeyE8X7rs1GR3zCIyOhVq6pXf2KfDg+8i+0RDBSRCmMa7Qq3S
 blUN3rKz8OZUeNe2ijR/CrhKkQj39q4Rrl2G1M1olHTRww5Xm/O/8cii6
 Oiecomwxk/v8g1Rt6mQH+NgxgRgw1ZMpje87f+IDnd9AFy7fUn6akgPVv
 Izt6EL1wpNTLrWkPVTyUrDLE2L1QQkfBpFZJMni27gdDVjDvkl+zKEmXv
 FeEJecWvCFsi3Om3D72DZpDEQCsS9wpX6DWL2/RmuNGVFBEu9SEcUTC0I A==;
X-CSE-ConnectionGUID: 6gtCA6jMQv64h9JBgnWznA==
X-CSE-MsgGUID: SmmjfWYSTLG79bb1VmmgXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4332841"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208,146";a="4332841"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 16:39:05 -0800
X-CSE-ConnectionGUID: P3SIuDA1RmWME7nQWW8Zkg==
X-CSE-MsgGUID: gRPrbOpXRlSRw2iB0Ahc9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208,146";a="11805739"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 16:39:06 -0800
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com
Subject: [PATCH v22 04/19] drm/xe/vsec: Do not register BMG PMT for VF
Date: Mon, 23 Nov 2026 16:39:00 -0800
Message-ID: <20261124003856.4145635-25-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124003856.4145635-21-michael.j.ruhl@intel.com>
References: <20261124003856.4145635-21-michael.j.ruhl@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

