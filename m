Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67241D64085
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 20:20:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3266288D18;
	Fri,  8 Nov 2024 20:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ko7cN3dL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D4E10EA39
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 20:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731097214; x=1762633214;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uqVJx4w6xbG8GmuHbGzKfOF/BKGueMuyc80S+XS93vA=;
 b=ko7cN3dL+hU+4ydHyY15focPWxHNb0po9/AVqh7jMT1yoR+R7QOMmpNK
 gHF+doLfWn0ohCG3gY2geyPqk+jI+vRTOQpd12pOVVPTK9Uh7XxAPFPYj
 kS08H53kjENmksNZ0XsMfES78M93O1TrPU6z/sPxjtmF5PWXjVbl2FuqS
 8oJ+ZB0bywaNlENsB1X42JfcGKU5ilSs3psObamPbo7e+vCldJ22ZEsGm
 Q5S2Y1GSRV9bHvd1i2b+r+SCaCw68+UWsWsS/N62tJG4QgJM68EcGLJxV
 DRwK/hpwsAnL4bI7h14WV5EqoXUUjw+/aAWNJlsYATIArgXAOGqcJKGFf A==;
X-CSE-ConnectionGUID: 3yMc5bZjR2uuZIxVDsUFUA==
X-CSE-MsgGUID: HL6sevyjQuSFGc/hg+2hvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="31097796"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="31097796"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 12:20:14 -0800
X-CSE-ConnectionGUID: TXJlvwvrQHGP2F3UE0W2Vg==
X-CSE-MsgGUID: VsXok8z1RfSLFHRCGbGZ3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="123245972"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 12:20:13 -0800
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 david.e.box@linux.intel.com, ilpo.jarvinen@linux.intel.com,
 andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
 rodrigo.vivi@intel.com, lucas.demarchi@intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH 1/2] platform/x86/intel/pmt: allow user offset for PMT
 callbacks
Date: Fri,  8 Nov 2024 15:19:53 -0500
Message-ID: <20241108201955.2048085-1-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
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

Usage of the telem sysfs file allows for partial reads at
an offset.

The current callback method returns the buffer starting
from offset 0 only.

Include the requested offset in the callback.
Update the necsessary address calculations with the offset.

Fixes: e92affc74cd8 ("platform/x86/intel/vsec: Add PMT read callbacks")
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/class.c     | 10 +++++-----
 drivers/platform/x86/intel/pmt/class.h     |  2 +-
 drivers/platform/x86/intel/pmt/telemetry.c |  2 +-
 include/linux/intel_vsec.h                 |  3 ++-
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
index c04bb7f97a4d..657d72b9e675 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -59,16 +59,16 @@ pmt_memcpy64_fromio(void *to, const u64 __iomem *from, size_t count)
 }
 
 int pmt_telem_read_mmio(struct pci_dev *pdev, struct pmt_callbacks *cb, u32 guid, void *buf,
-			void __iomem *addr, u32 count)
+			void __iomem *addr, loff_t off, u32 count)
 {
 	if (cb && cb->read_telem)
-		return cb->read_telem(pdev, guid, buf, count);
+		return cb->read_telem(pdev, guid, buf, off, count);
 
 	if (guid == GUID_SPR_PUNIT)
 		/* PUNIT on SPR only supports aligned 64-bit read */
-		return pmt_memcpy64_fromio(buf, addr, count);
+		return pmt_memcpy64_fromio(buf, addr + off, count);
 
-	memcpy_fromio(buf, addr, count);
+	memcpy_fromio(buf, addr + off, count);
 
 	return count;
 }
@@ -96,7 +96,7 @@ intel_pmt_read(struct file *filp, struct kobject *kobj,
 		count = entry->size - off;
 
 	count = pmt_telem_read_mmio(entry->ep->pcidev, entry->cb, entry->header.guid, buf,
-				    entry->base + off, count);
+				    entry->base, off, count);
 
 	return count;
 }
diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
index a267ac964423..b2006d57779d 100644
--- a/drivers/platform/x86/intel/pmt/class.h
+++ b/drivers/platform/x86/intel/pmt/class.h
@@ -62,7 +62,7 @@ struct intel_pmt_namespace {
 };
 
 int pmt_telem_read_mmio(struct pci_dev *pdev, struct pmt_callbacks *cb, u32 guid, void *buf,
-			void __iomem *addr, u32 count);
+			void __iomem *addr, loff_t off, u32 count);
 bool intel_pmt_is_early_client_hw(struct device *dev);
 int intel_pmt_dev_create(struct intel_pmt_entry *entry,
 			 struct intel_pmt_namespace *ns,
diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/x86/intel/pmt/telemetry.c
index c9feac859e57..0cea617c6c2e 100644
--- a/drivers/platform/x86/intel/pmt/telemetry.c
+++ b/drivers/platform/x86/intel/pmt/telemetry.c
@@ -219,7 +219,7 @@ int pmt_telem_read(struct telem_endpoint *ep, u32 id, u64 *data, u32 count)
 	if (offset + NUM_BYTES_QWORD(count) > size)
 		return -EINVAL;
 
-	pmt_telem_read_mmio(ep->pcidev, ep->cb, ep->header.guid, data, ep->base + offset,
+	pmt_telem_read_mmio(ep->pcidev, ep->cb, ep->header.guid, data, ep->base, offset,
 			    NUM_BYTES_QWORD(count));
 
 	return ep->present ? 0 : -EPIPE;
diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index 11ee185566c3..b94beab64610 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -74,10 +74,11 @@ enum intel_vsec_quirks {
  * @pdev:  PCI device reference for the callback's use
  * @guid:  ID of data to acccss
  * @data:  buffer for the data to be copied
+ * @off:   offset into the requested buffer
  * @count: size of buffer
  */
 struct pmt_callbacks {
-	int (*read_telem)(struct pci_dev *pdev, u32 guid, u64 *data, u32 count);
+	int (*read_telem)(struct pci_dev *pdev, u32 guid, u64 *data, loff_t off, u32 count);
 };
 
 /**
-- 
2.44.0

