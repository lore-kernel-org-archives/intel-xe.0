Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C8BCAC592
	for <intel-xe@archiver.kernel.org>; Tue, 16 Sep 2025 17:01:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 861C210E7AC;
	Tue, 16 Sep 2025 17:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EmO3enaF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF7A10E3AF
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Sep 2025 17:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758042072; x=1789578072;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OoF4IzIZHouTGM0pKWW3twOV03pjPh4QA3QhLZp2MQE=;
 b=EmO3enaFF9sop7iXCbLgaIjQbXSuqsw3wHwZvBn3j6TtkwcQXwdCmAme
 4sBl/bG36b+UaW0YmB4e5x3eEU26QnorXmlgz8yYy3WFCJiDXWVUAQrvl
 wSxdcNeImS/MY4jaJtiUv7amZm7QZyOIeZvsZW3huX9t+c1QUbHNWw+hr
 ktK2wsFQUUzGULoXjN6F7OvHT9FXV+Ruzr+vhxISuthgmxFlDvEOmW4rZ
 KlCyURzHr07h5W7rsFrmUhqDszKkJvPJo8kI3R1nHIdSBJ6A5+SnxfWfY
 KlPCrJE60EcMFolcCiA3mwOyOmACjK55K0EiFk7GL3QIP528WDw/5p1Ta A==;
X-CSE-ConnectionGUID: U5aXpRY5QRGn/o2dbhYmZg==
X-CSE-MsgGUID: fMPSAkn0RuiiR0bafRYpag==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="47906946"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="47906946"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 10:00:55 -0700
X-CSE-ConnectionGUID: ZotLzOrzSUyE584+qOvbZw==
X-CSE-MsgGUID: c1a0UpbRTPWWBlRnbRVSAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="180128311"
Received: from rjayathi-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.43])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 10:00:54 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 1/2] drm/xe/vf: Don't expose sysfs attributes not
 applicable for VFs
Date: Tue, 16 Sep 2025 19:00:28 +0200
Message-ID: <20250916170029.3313-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916170029.3313-1-michal.wajdeczko@intel.com>
References: <20250916170029.3313-1-michal.wajdeczko@intel.com>
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
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
---
v2: rebased, reordered in series
---
 drivers/gpu/drm/xe/xe_device_sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index b7f8fcfed8d8..896484c8fbcc 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -308,7 +308,7 @@ int xe_device_sysfs_init(struct xe_device *xe)
 			return ret;
 	}
 
-	if (xe->info.platform == XE_BATTLEMAGE) {
+	if (xe->info.platform == XE_BATTLEMAGE && !IS_SRIOV_VF(xe)) {
 		ret = sysfs_create_files(&dev->kobj, auto_link_downgrade_attrs);
 		if (ret)
 			goto cleanup;
-- 
2.47.1

