Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD935C61DA4
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 09:39:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F4F10E9D7;
	Wed, 15 Mar 2023 09:39:03 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A4A10E9D7
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Mar 2023 09:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678873141; x=1710409141;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding:sender;
 bh=ZvUU1hvOzUykvSxzlDzVXFwC3WbJ1CcoS8gaDKe4lfk=;
 b=nZgRQm5mt8kEHKNL8ARzsj1UPxHcGi8N9UanKvJOrSr8YExyOyKKgxiC
 nMmuzNz9x1alCDqVEPpv2iCZnVkUDoYM66ExeMqS8jygwtvvSICmXTWdD
 VmEq2b9BYwcsSH4Ecq1itmqUwwCYH23C4I5bmy61UAsRoMdqciW4zHcVI
 TFt/p1UVMZDT8sCWh4TO72byLXzeyawG9+1CdaRENOUEzon+lNUYk8HB6
 3KX5ztTT9r+rxmc7ygvy+3TwTxe8eYTKWmUniJN/HmtMU+BhMY7Abh0Wj
 vKVxBWFElfS2qjH3jwEIcjwXKPJx4pzPVwmz5sP+frOEgV3cR5TXte68Y A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="336345880"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="336345880"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 02:39:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="711857874"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="711857874"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga001.jf.intel.com with ESMTP; 15 Mar 2023 02:39:00 -0700
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.26.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 3BC0658047E;
 Wed, 15 Mar 2023 02:39:00 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pcNaz-0036q4-37;
 Wed, 15 Mar 2023 10:38:57 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Mar 2023 10:38:55 +0100
Message-Id: <25959b6c92cae10f414e3fcbc881c4b2e272f3d8.1678873128.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/xe-pci: print a message when probing a
 device
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

On devices with multiple GPUs, like:

	GPU device: ADLS, PCI ID: 8086:4680
	GPU device: DG2 (DG2_G12), PCI ID: 8086:56a3

Using force_probe parameter with a value different than "*" gives
a warning for the other GPU, like:

[  448.991536] xe 0000:00:02.0: Your graphics device 4680 is not officially supported
               by xe driver in this kernel version. To force Xe probe,
               use xe.force_probe='4680' and i915.force_probe='!4680'
               module parameters or CONFIG_DRM_XE_FORCE_PROBE='4680' and
               CONFIG_DRM_I915_FORCE_PROBE='!4680' configuration options.

This is confusing, as the subsequent messages refer to the
other probe attempt:

	[  448.991843] xe 0000:03:00.0: vgaarb: deactivate vga console
	[  449.007744] GT topology dss mask (geometry): 00000000,00ffff00
	[  449.007750] GT topology dss mask (compute):  00000000,00ffff00
	[  449.007752] GT topology EU mask per DSS:     0000ffff
	[  449.008846] xe 0000:03:00.0: [drm] vram_size: 0x180000000 usable_size: 0x17c800000
	[  449.008880] xe 0000:03:00.0: BAR 2: releasing [mem 0x6000000000-0x600fffffff 64bit pref]

Ok, one might infere from the PCI bus that it is for a different
card, but it is better to state so, as it helps debugging
issues and to check if the probe was really to the expected device.

So, prints the PCI ID of the GPU it will be about to probe.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 drivers/gpu/drm/xe/xe_pci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index c4d9fd2e7b2b..5aa594e92ff0 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -394,6 +394,9 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return -ENODEV;
 	}
 
+        dev_info(&pdev->dev, "Probing device [%04x:%04x].\n",
+                pdev->vendor, pdev->device);
+
 	xe = xe_device_create(pdev, ent);
 	if (IS_ERR(xe))
 		return PTR_ERR(xe);
-- 
2.39.2

