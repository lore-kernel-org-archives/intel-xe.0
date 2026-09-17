Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83CFC88E72
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 09:56:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B48E10E47C;
	Thu, 17 Sep 2026 09:56:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SACdOh7g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81DC510E47C
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Sep 2026 09:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789638980; x=1821174980;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=XHthUUBv8aC4b/pOgdLB0Pd5CfyRHYHmbdtCdn80mHo=;
 b=SACdOh7gWYUBxuVlwfu0tPRXBqdckotqWmgjwohj4nSyCOlWhIy92g4H
 js7NAmXpoJy4KN4x6isgcq4gDXfjHWypKOYk7Yck/scsozLeFJ20pJnes
 q6Mx1peWOexmbbcEbq452FfJdXFDYniWApKphzzEKINoMbDzk7JkP+UYh
 EiKM7joKBxoKtFsC0ktUcuSIA/W80woErL8oeRLEHrCGnBU1rkgxnzHMI
 KzfS89jnGsVRwey6rXAz+2zoBVvD+2NIH6qGk0nbpqYUxS+Yv2CD0q6GJ
 qd5IzW7bxfSgJwNBob51iyeBeCHIbcCi90FT4yZR2v4rRK6sMySUWlGX1 g==;
X-CSE-ConnectionGUID: VoxwWJBCSjOCWETYdIzIWw==
X-CSE-MsgGUID: bHpNL02DSkuP5yxAPhaMOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100641919"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100641919"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 02:56:19 -0700
X-CSE-ConnectionGUID: OzEt0MIyRt+NVButa3HVuQ==
X-CSE-MsgGUID: mEDQHYl5RMezoZMlXQgllQ==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.62])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 02:56:14 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 17 Sep 2026 12:56:09 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 Hans de Goede <hansg@kernel.org>, matthew.brost@intel.com, 
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com, 
 anoop.c.vijay@intel.com, badal.nilawar@intel.com, 
 matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v9 09/20] drm/xe/vsec: Add DOC text for VSEC
In-Reply-To: <20260916201139.2374531-31-michael.j.ruhl@intel.com>
Message-ID: <9f6b61e5-a100-a27d-d8e8-b7327608721f@linux.intel.com>
References: <20260916201139.2374531-22-michael.j.ruhl@intel.com>
 <20260916201139.2374531-31-michael.j.ruhl@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed, 16 Sep 2026, Michael J. Ruhl wrote:

> Add the necessary files and text to use the DOC system.
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  Documentation/gpu/xe/index.rst   |  1 +
>  Documentation/gpu/xe/xe_vsec.rst | 14 ++++++++++++++
>  drivers/gpu/drm/xe/xe_vsec.c     | 23 +++++++++++++++++++++++
>  3 files changed, 38 insertions(+)
>  create mode 100644 Documentation/gpu/xe/xe_vsec.rst
> 
> diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
> index 0247a255f7e6..89f013418cf5 100644
> --- a/Documentation/gpu/xe/index.rst
> +++ b/Documentation/gpu/xe/index.rst
> @@ -36,3 +36,4 @@ The display, or :ref:`drm-kms`, support for drm/xe is provided by
>     xe_configfs
>     xe_gt_stats
>     xe_sigid
> +   xe_vsec
> diff --git a/Documentation/gpu/xe/xe_vsec.rst b/Documentation/gpu/xe/xe_vsec.rst
> new file mode 100644
> index 000000000000..1a87548489ea
> --- /dev/null
> +++ b/Documentation/gpu/xe/xe_vsec.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +=====
> +VSEC
> +=====
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_vsec.c
> +   :doc: VSEC
> +
> +Internal API
> +============
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_vsec.c
> +   :internal:
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 1cb9a78ee0ef..ca5d02dce818 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -19,6 +19,17 @@
>  
>  #include "regs/xe_pmt.h"
>  
> +/**
> + * DOC: VSEC
> + *
> + * Some GPUs support the PMT feature.  For those that do, this API provides
> + * probe, discovery and usage (control and access) for GPUs that have PMT.
> + *
> + * PMT is usually accessed through a PCI function.  However, that is not always
> + * available, so the PMT intel_vsec_register() function can be used to setup up

Wrong grammar: "setup up"

(Found by sashiko.)

> + * PMT usage.
> + */
> +
>  /* PMT GUID value for BMG devices.  NOTE: this is NOT a PCI id */
>  #define BMG_DEVICE_ID 0xE2F8
>  
> @@ -140,6 +151,18 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
>  	return 0;
>  }
>  
> +/**
> + * xe_pmt_telem_read - Given a device and a PMT GUID, read data into a buffer
> + * @dev: valid Xe device
> + * @guid: PMT GUID (from the PMT discovery struct)
> + * @data: buffer to place data in
> + * @user_offset: a user offset relative to the beginning of the data to read
> + * @count: bytes to read
> + *
> + * Return:
> + * * -EINVAL for VF and PMT WATCHER requests
> + * * count   number of bytes read on success
> + */
>  int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset,
>  		      u32 count)
>  {
> 

-- 
 i.

