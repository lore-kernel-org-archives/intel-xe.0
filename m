Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F55C87FD3
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 15:23:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 062E710E7A1;
	Wed,  6 Aug 2025 15:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NhIns1+S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC2410E7A1
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 15:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754493825; x=1786029825;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=u8Tvr77hZj/zAHWlsSsYQ+6BtF2T5ZbLNkCj++G0nj4=;
 b=NhIns1+SSJWNmKCB21iBbR50ryy8yXzCJzFeUYiy/2GXA7Vt6XJEH+id
 aZEAND2MijwtSac+HeOAuj7gz8ue618AaLWK/qT1DAEF9oM1uY+UFvlOV
 qrnKTuH3Du/KoPcDob4NynqRiz9gfAQxucYtirnOhAvOpyVI3jFjX6FHO
 Tc5IrwI8d5sLkuvW1OP3Qrz+foatlOofnORpbCIYGgBjAZIdthNU7GPaR
 QRTlUkBRx3cFsgfEiQSNr3fRsq7v/Qj/a5wUDvKChdOjVdsoFZO28PBSC
 TEdNq7M/pacZ2J6DhccHRALsOQsAnlQkwUcEedftk1g64MRkaGj8JqmRr A==;
X-CSE-ConnectionGUID: EiQn4cQLSpaEf5ZgmvKlZA==
X-CSE-MsgGUID: /FuqUSQbSS6NhaYoMzxH1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="44405957"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="44405957"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 08:23:44 -0700
X-CSE-ConnectionGUID: 3GyU7RXcRy+/7y+SwpeIzw==
X-CSE-MsgGUID: ZlfMOOWpRa2rixWDebPCIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="201966072"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa001.jf.intel.com with ESMTP; 06 Aug 2025 08:23:42 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, stuart.summers@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2] drm/xe: Don't expose mailbox attributes for skip_pcode
 cases
Date: Wed,  6 Aug 2025 20:52:56 +0530
Message-Id: <20250806152256.748057-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
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

Commit a7f87deac229 ("drm/xe: Default auto_link_downgrade status to false")
tried to fix the side effect of xe_pcode_read() returning successfully
without valid data-out value. Since this is true for cases where skip_pcode
flag is set, a much robust fix would be to not expose mailbox attributes
at all for such cases.

v2: Check against skip_pcode (Stuart)

Fixes: a7f87deac229 ("drm/xe: Default auto_link_downgrade status to false")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device_sysfs.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index bd9015761aa0..75b6cd816fa8 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -264,8 +264,7 @@ auto_link_downgrade_status_show(struct device *dev, struct device_attribute *att
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct xe_device *xe = pdev_to_xe_device(pdev);
-	/* default the auto_link_downgrade status to 0 */
-	u32 val = 0;
+	u32 val;
 	int ret;
 
 	xe_pm_runtime_get(xe);
@@ -291,7 +290,7 @@ static void xe_device_sysfs_fini(void *arg)
 	if (xe->d3cold.capable)
 		sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
 
-	if (xe->info.platform == XE_BATTLEMAGE) {
+	if (xe->info.platform == XE_BATTLEMAGE && !xe->info.skip_pcode) {
 		sysfs_remove_files(&xe->drm.dev->kobj, auto_link_downgrade_attrs);
 		late_bind_remove_files(xe->drm.dev);
 	}
@@ -308,7 +307,7 @@ int xe_device_sysfs_init(struct xe_device *xe)
 			return ret;
 	}
 
-	if (xe->info.platform == XE_BATTLEMAGE) {
+	if (xe->info.platform == XE_BATTLEMAGE && !xe->info.skip_pcode) {
 		ret = sysfs_create_files(&dev->kobj, auto_link_downgrade_attrs);
 		if (ret)
 			return ret;
-- 
2.34.1

