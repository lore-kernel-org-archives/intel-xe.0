Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB407E83EF5
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 08:38:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C79510E55F;
	Wed,  4 Feb 2026 08:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q4RvHVby";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CB110E55F
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Feb 2026 08:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770194308; x=1801730308;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=kZ8l7YpwWkGkAXvqA7UxqMiOYFIRdwuu9ZNT6manyFg=;
 b=Q4RvHVbyYcb88EDIX+ClEItvz7+XAR+6sJCpo73pJe1rGhw2k79s/kKo
 Rp6vghwxYbt8PAvIHbYhRgYofQ6VfUjZyz26VseQpr7zvyeoxL4fj8AWx
 8hbJTNJaZqqFL7u67PTRugasGMJe9XxwGRIDdEEIjF7v5GRlWCsyDDk0Y
 GEQeTHN0nHUywX8zoa/+R+8r5iCOa2WuB6xUtKNnIEqrKXddEufDy+3gN
 cQpgoHPg4hf3yXeq3VMOsVuPZahZB0NOSZGvcpdu7IetYvSXWxUcH9R+T
 9BgiQmzgMWZdlaydqBlghrf0dQhx6AzspRKL5zT/+KxN2QcWTTVVODLIx Q==;
X-CSE-ConnectionGUID: KPmKUFHGTIm0bhemVdzuQg==
X-CSE-MsgGUID: n/bicgi5SiOE9BUzozrybA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82486317"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208,217";a="82486317"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 00:38:27 -0800
X-CSE-ConnectionGUID: uGVGXNy9S5iiR/A6EIkuVw==
X-CSE-MsgGUID: LKmGCaOcTVuYjoHFizSrIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
 d="scan'208,217";a="210149209"
Received: from aiddamse-mobl3.gar.corp.intel.com (HELO [10.247.210.125])
 ([10.247.210.125])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 00:38:25 -0800
Content-Type: multipart/alternative;
 boundary="------------mi8aZIOq0AFUFu0NdW9UhA6C"
Message-ID: <1b3f2913-36fa-4028-ae9d-36e19f8047e4@linux.intel.com>
Date: Wed, 4 Feb 2026 14:08:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] drm/xe/xe_ras: Initialize Uncorrectable AER Registers
To: Riana Tauro <riana.tauro@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com
References: <20260122100613.3631582-10-riana.tauro@intel.com>
 <20260122100613.3631582-15-riana.tauro@intel.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20260122100613.3631582-15-riana.tauro@intel.com>
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

This is a multi-part message in MIME format.
--------------mi8aZIOq0AFUFu0NdW9UhA6C
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Riana,

On 22-01-2026 15:36, Riana Tauro wrote:
> Uncorrectable errors from different endpoints in the device are steered to
> the USP which is a PCI Advanced Error Reporting (AER) Compliant device.
> Downgrade all the errors to non-fatal to prevent PCIe bus driver
> from triggering a Secondary Bus Reset (SBR). This allows error
> detection, containment and recovery in the driver.
>
> The Uncorrectable Error Severity Register has the 'Uncorrectable
> Internal Error Severity' set to fatal by default. Set this to
> non-fatal and unmask the error.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile    |  1 +
>  drivers/gpu/drm/xe/xe_device.c |  3 ++
>  drivers/gpu/drm/xe/xe_ras.c    | 71 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ras.h    | 13 +++++++
>  4 files changed, 88 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_ras.c
>  create mode 100644 drivers/gpu/drm/xe/xe_ras.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 5581f2180b5c..85ec53eb0b62 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -110,6 +110,7 @@ xe-y += xe_bb.o \
>  	xe_pxp_debugfs.o \
>  	xe_pxp_submit.o \
>  	xe_query.o \
> +	xe_ras.o \
>  	xe_range_fence.o \
>  	xe_reg_sr.o \
>  	xe_reg_whitelist.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index f418ebf04f0f..be89ffc9eade 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -59,6 +59,7 @@
>  #include "xe_psmi.h"
>  #include "xe_pxp.h"
>  #include "xe_query.h"
> +#include "xe_ras.h"
>  #include "xe_shrinker.h"
>  #include "xe_soc_remapper.h"
>  #include "xe_survivability_mode.h"
> @@ -1019,6 +1020,8 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_vsec_init(xe);
>  
> +	xe_ras_init(xe);
> +
>  	err = xe_sriov_init_late(xe);
>  	if (err)
>  		goto err_unregister_display;
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> new file mode 100644
> index 000000000000..ba5ed37aed28
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -0,0 +1,71 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +#include <linux/pci.h>
> +
> +#include "xe_device_types.h"
> +#include "xe_ras.h"
> +
> +#ifdef CONFIG_PCIEAER
> +static void unmask_and_downgrade_internal_error(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	struct pci_dev *vsp, *usp;
> +	u32 aer_uncorr_sev, aer_uncorr_mask;
> +	u16 aer_cap;
> +
> +	 /* Gfx Device Hierarchy: USP-->VSP-->SGunit */
> +	vsp = pci_upstream_bridge(pdev);
> +	if (!vsp)
> +		return;
> +
> +	usp = pci_upstream_bridge(vsp);
> +	if (!usp)
> +		return;
> +
> +	aer_cap = usp->aer_cap;
> +
> +	if (!aer_cap)
> +		return;
> +
> +	/*
> +	 * All errors are steered to USP which is a PCIe AER Complaint device.
> +	 * Downgrade all the errors to non-fatal to prevent PCIe bus driver
> +	 * from triggering a Secondary Bus Reset (SBR). This allows error
> +	 * detection, containment and recovery in the driver.
> +	 *
> +	 * The Uncorrectable Error Severity Register has the 'Uncorrectable
> +	 * Internal Error Severity' set to fatal by default. Set this to
> +	 * non-fatal and unmask the error.
> +	 */
> +

Before unmasking the PCI_ERR_UNC_INTN bit, we shall clear stale event in
PCI_ERR_UNCOR_STATUS register that would be signaled once we unmask the
bit. (Assuming the bit wasn't unmasked already.)

There is a pci_aer_unmask_internal_errors() helper declared in
drivers/pci/pcie/aer.c which we could probably use by exporting it.

Also do you think it makes more sense to move this to pci quirks,
because in virtualized environment the XeKMD might be in VM(passthrough
model) and USP in host then this might not work.

> +	/* Initialize Uncorrectable Error Severity Register */
> +	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_SEVER, &aer_uncorr_sev);
> +	aer_uncorr_sev &= ~PCI_ERR_UNC_INTN;
> +	pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_SEVER, aer_uncorr_sev);
> +
> +	/* Initialize Uncorrectable Error Mask Register */
> +	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_MASK, &aer_uncorr_mask);
> +	aer_uncorr_mask &= ~PCI_ERR_UNC_INTN;
> +	pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_MASK, aer_uncorr_mask);
> +
> +	pci_save_state(usp);
> +}
> +#endif
> +
> +/**
> + * xe_ras_init - Initialize Xe RAS
> + * @xe: xe device instance
> + *
> + * Initialize Xe RAS
> + */
> +void xe_ras_init(struct xe_device *xe)
> +{
> +	if (!xe->info.has_sysctrl)
> +		return;
> +
> +#ifdef CONFIG_PCIEAER
> +	unmask_and_downgrade_internal_error(xe);
> +#endif
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> new file mode 100644
> index 000000000000..14cb973603e7
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_RAS_H_
> +#define _XE_RAS_H_
> +
> +struct xe_device;
> +
> +void xe_ras_init(struct xe_device *xe);
> +
> +#endif
Thanks,
Aravind.
--------------mi8aZIOq0AFUFu0NdW9UhA6C
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Riana,</p>
    <div class="moz-cite-prefix">On 22-01-2026 15:36, Riana Tauro wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20260122100613.3631582-15-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">Uncorrectable errors from different endpoints in the device are steered to
the USP which is a PCI Advanced Error Reporting (AER) Compliant device.
Downgrade all the errors to non-fatal to prevent PCIe bus driver
from triggering a Secondary Bus Reset (SBR). This allows error
detection, containment and recovery in the driver.

The Uncorrectable Error Severity Register has the 'Uncorrectable
Internal Error Severity' set to fatal by default. Set this to
non-fatal and unmask the error.

Signed-off-by: Riana Tauro <a class="moz-txt-link-rfc2396E" href="mailto:riana.tauro@intel.com">&lt;riana.tauro@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/Makefile    |  1 +
 drivers/gpu/drm/xe/xe_device.c |  3 ++
 drivers/gpu/drm/xe/xe_ras.c    | 71 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h    | 13 +++++++
 4 files changed, 88 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_ras.c
 create mode 100644 drivers/gpu/drm/xe/xe_ras.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 5581f2180b5c..85ec53eb0b62 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -110,6 +110,7 @@ xe-y += xe_bb.o \
 	xe_pxp_debugfs.o \
 	xe_pxp_submit.o \
 	xe_query.o \
+	xe_ras.o \
 	xe_range_fence.o \
 	xe_reg_sr.o \
 	xe_reg_whitelist.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index f418ebf04f0f..be89ffc9eade 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -59,6 +59,7 @@
 #include "xe_psmi.h"
 #include "xe_pxp.h"
 #include "xe_query.h"
+#include "xe_ras.h"
 #include "xe_shrinker.h"
 #include "xe_soc_remapper.h"
 #include "xe_survivability_mode.h"
@@ -1019,6 +1020,8 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_vsec_init(xe);
 
+	xe_ras_init(xe);
+
 	err = xe_sriov_init_late(xe);
 	if (err)
 		goto err_unregister_display;
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
new file mode 100644
index 000000000000..ba5ed37aed28
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+#include &lt;linux/pci.h&gt;
+
+#include "xe_device_types.h"
+#include "xe_ras.h"
+
+#ifdef CONFIG_PCIEAER
+static void unmask_and_downgrade_internal_error(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe-&gt;drm.dev);
+	struct pci_dev *vsp, *usp;
+	u32 aer_uncorr_sev, aer_uncorr_mask;
+	u16 aer_cap;
+
+	 /* Gfx Device Hierarchy: USP--&gt;VSP--&gt;SGunit */
+	vsp = pci_upstream_bridge(pdev);
+	if (!vsp)
+		return;
+
+	usp = pci_upstream_bridge(vsp);
+	if (!usp)
+		return;
+
+	aer_cap = usp-&gt;aer_cap;
+
+	if (!aer_cap)
+		return;
+
+	/*
+	 * All errors are steered to USP which is a PCIe AER Complaint device.
+	 * Downgrade all the errors to non-fatal to prevent PCIe bus driver
+	 * from triggering a Secondary Bus Reset (SBR). This allows error
+	 * detection, containment and recovery in the driver.
+	 *
+	 * The Uncorrectable Error Severity Register has the 'Uncorrectable
+	 * Internal Error Severity' set to fatal by default. Set this to
+	 * non-fatal and unmask the error.
+	 */
+</pre>
    </blockquote>
    <p><span data-teams="true">Before unmasking the PCI_ERR_UNC_INTN
        bit, we shall clear stale event in PCI_ERR_UNCOR_STATUS register
        that would be signaled once we unmask the bit. (Assuming the bit
        wasn't unmasked already.)</span></p>
    <p>T<span data-teams="true">here is a <span
          style="font-size: inherit;">pci_aer_unmask_internal_errors()
          helper declared in drivers/pci/pcie/aer.c which we could
          probably use by exporting it.</span></span></p>
    <p><span data-teams="true"><span style="font-size: inherit;">Also do
          you think it makes more sense to move this to pci quirks,
          because in virtualized environment the XeKMD might be in
          VM(passthrough model) and USP in host then this might not
          work.</span></span></p>
    <blockquote type="cite"
      cite="mid:20260122100613.3631582-15-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	/* Initialize Uncorrectable Error Severity Register */
+	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_SEVER, &amp;aer_uncorr_sev);
+	aer_uncorr_sev &amp;= ~PCI_ERR_UNC_INTN;
+	pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_SEVER, aer_uncorr_sev);
+
+	/* Initialize Uncorrectable Error Mask Register */
+	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_MASK, &amp;aer_uncorr_mask);
+	aer_uncorr_mask &amp;= ~PCI_ERR_UNC_INTN;
+	pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_MASK, aer_uncorr_mask);
+
+	pci_save_state(usp);
+}
+#endif
+
+/**
+ * xe_ras_init - Initialize Xe RAS
+ * @xe: xe device instance
+ *
+ * Initialize Xe RAS
+ */
+void xe_ras_init(struct xe_device *xe)
+{
+	if (!xe-&gt;info.has_sysctrl)
+		return;
+
+#ifdef CONFIG_PCIEAER
+	unmask_and_downgrade_internal_error(xe);
+#endif
+}
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
new file mode 100644
index 000000000000..14cb973603e7
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_RAS_H_
+#define _XE_RAS_H_
+
+struct xe_device;
+
+void xe_ras_init(struct xe_device *xe);
+
+#endif</pre>
    </blockquote>
    Thanks,<br>
    Aravind.
    <blockquote type="cite"
      cite="mid:20260122100613.3631582-15-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------mi8aZIOq0AFUFu0NdW9UhA6C--
