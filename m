Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF710CA5FD2
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 22:04:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87CD210E453;
	Thu,  1 Oct 2026 22:04:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KC9ijlXX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E9510E453
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 22:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790892242; x=1822428242;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=im0MF/77O/DWBGe4Ej0EtpWL8k5fyxg1MRI4XahN/9s=;
 b=KC9ijlXXoqqFOOpbFuXRPcenq/Y+Ro9/g6gtwqORsXvEAaVlS1A4hg9J
 Eugpp31E2YlBwdx9iq60HfxpGuc4zZZVQ4YqV1O42REINzBl0ScKa/C0j
 UqTzD8i6IuZBr8Rlc+k5NXKYjaF2J16ggADCzi91OHKJ8KbJaBIq7KHe1
 QBWTJ9R/Rd52/wNwEgo/5sNV8MCLshiOKcw92Puu/a+uO6GlOQCrF156t
 TWskSBrMX261QgbQaHe3kzEsGcYILOiruohypO0XWWKBKspNl4wVNLicy
 1g8ARiH0wqG8V5G3hxepN8jFRJrLK6kN+0f1D0xQzZ/KJkFHf9EsM/nxE Q==;
X-CSE-ConnectionGUID: ruwfTdiHQKC5P7wxbq72Qg==
X-CSE-MsgGUID: 7eb1CdpvRp6Yla/XMjAJgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="91684105"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; d="scan'208";a="91684105"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 15:04:02 -0700
X-CSE-ConnectionGUID: MBsmCVIvRxGTzsnp19PgPw==
X-CSE-MsgGUID: DA+WT403QJGQQEe2mvFy7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; d="scan'208";a="276206244"
Received: from debox1-desk4.jf.intel.com ([10.54.77.98])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 15:04:01 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: ilpo.jarvinen@linux.intel.com, david.e.box@linux.intel.com,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 rodrigo.vivi@intel.com, michael.j.ruhl@intel.com, ayaz.siddiqui@intel.com,
 syed.abdul.muqthyar.ahmed@intel.com, intel-xe@lists.freedesktop.org,
 hansg@kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 1/3] platform/x86/intel/pmt: Fix NULL dereference when reading
 crashlog data
Date: Thu,  1 Oct 2026 15:03:46 -0700
Message-ID: <20261001220351.1592138-2-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001220351.1592138-1-david.e.box@linux.intel.com>
References: <20261001220351.1592138-1-david.e.box@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

Commit 353042d54d82 ("platform/x86/intel/vsec: Switch exported helpers from
pci_dev to device") changed intel_pmt_read() to pass entry->ep->dev to
pmt_telem_read_mmio() in place of entry->pcidev. entry->ep is only
allocated by the telemetry namespace's pmt_add_endpoint() hook. Crashlog
entries never get one, so any read() of a crashlog sysfs data file
dereferences a NULL pointer.

Use the intel_vsec_device parent device instead. The PMT class device is a
child of the auxiliary device, so derive it the same way
intel_pmt_attr_visible() does. This is the same device telemetry stored in
ep->dev, so behavior for telemetry and any read_telem() callback is
unchanged.

Fixes: 353042d54d82 ("platform/x86/intel/vsec: Switch exported helpers from=
 pci_dev to device")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/platform/x86/intel/pmt/class.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/=
intel/pmt/class.c
index d0ab8e33c62a..b69c79785d9c 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -90,6 +90,8 @@ intel_pmt_read(struct file *filp, struct kobject *kobj,
 	struct intel_pmt_entry *entry =3D container_of(attr,
 						     struct intel_pmt_entry,
 						     pmt_bin_attr);
+	struct device *dev =3D kobj_to_dev(kobj);
+	struct intel_vsec_device *ivdev =3D auxdev_to_ivdev(to_auxiliary_dev(dev-=
>parent));
=20
 	if (off < 0)
 		return -EINVAL;
@@ -100,7 +102,7 @@ intel_pmt_read(struct file *filp, struct kobject *kobj,
 	if (count > entry->size - off)
 		count =3D entry->size - off;
=20
-	count =3D pmt_telem_read_mmio(entry->ep->dev, entry->cb, entry->header.gu=
id, buf,
+	count =3D pmt_telem_read_mmio(ivdev->dev, entry->cb, entry->header.guid, =
buf,
 				    entry->base, off, count);
=20
 	return count;
--=20
2.43.0

