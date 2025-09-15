Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CD5CAC592
	for <intel-xe@archiver.kernel.org>; Mon, 15 Sep 2025 14:06:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB4A810E4CB;
	Mon, 15 Sep 2025 14:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YZd8OwdB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF1310E4CB
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Sep 2025 14:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757945190; x=1789481190;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J+krGipjJVshyeeNiiAuFcV4z0gfI/lXk5VjYbydJTU=;
 b=YZd8OwdBPWeusNzajfiCnkxka4X6iFxNAsFFbehQHpVlVGBx0oPW89rU
 OHnRbPQFV4zQ7ymZV1hKddkDF/a2epFSYEyaiFBduE7Zh9Xdqm3rOygCq
 fVIb40UCm+ClQqDrv5/6zEoYp6DuMWdJGSO6hQXz8xWG0nVRSJPgZW+AJ
 SLP+JJj8zG/r7dUixj6sdQsbhDTw3oywQ3gM9p9KWnuxq7LPOxLcshdx8
 RGE8Q/Z3x+H8y7wDMWEwswphhdPwyk/CLYwaOAeO4LHdsTGrXAcOnR56V
 7bkl8otq59qYMuLvM4az6rx3bNdHSPwGssRM3TdbIt1DqmuXFlU1iSpuA g==;
X-CSE-ConnectionGUID: wT0IW9v2SguyS7snlLiQGg==
X-CSE-MsgGUID: TNmFlg9kSDyimLzJNdnFgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="63832755"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="63832755"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 07:06:30 -0700
X-CSE-ConnectionGUID: uQFWdHNYRg+F/R09W4MjVw==
X-CSE-MsgGUID: S8f7BCjrTdCGUq6/K0BGKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="174188863"
Received: from egore-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.116.1])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 07:06:29 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH 2/2] drm/xe/vf: Don't expose sysfs attributes not applicable
 for VFs
Date: Mon, 15 Sep 2025 16:06:14 +0200
Message-ID: <20250915140614.2076-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250915140614.2076-1-michal.wajdeczko@intel.com>
References: <20250915140614.2076-1-michal.wajdeczko@intel.com>
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

VFs can't read BMG_PCIE_CAP(0x138340) register nor access PCODE
(already guarded by the info.skip_pcode flag) so we shouldn't
expose attributes that require any of them to avoid errors like:

 [] xe 0000:03:00.1: [drm] Tile0: GT0: VF is trying to read an \
                     inaccessible register 0x138340+0x0
 [] RIP: 0010:xe_gt_sriov_vf_read32+0x6c2/0x9a0 [xe]
 [] Call Trace:
 []  xe_mmio_read32+0x110/0x280 [xe]
 []  auto_link_downgrade_capable_show+0x2e/0x70 [xe]
 []  dev_attr_show+0x1a/0x70
 []  sysfs_kf_seq_show+0xaa/0x120
 []  kernfs_seq_show+0x41/0x60

Fixes: 0e414bf7ad01 ("drm/xe: Expose PCIe link downgrade attributes")
Fixes: cdc36b66cd41 ("drm/xe: Expose fan control and voltage regulator version")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_device_sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index 5b0b98ac9b17..c5151c86a98a 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -290,7 +290,7 @@ int xe_device_sysfs_init(struct xe_device *xe)
 			return ret;
 	}
 
-	if (xe->info.platform == XE_BATTLEMAGE) {
+	if (xe->info.platform == XE_BATTLEMAGE && !IS_SRIOV_VF(xe)) {
 		ret = devm_device_add_group(dev, &auto_link_downgrade_attr_group);
 		if (ret)
 			return ret;
-- 
2.47.1

