Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DC7C677C4
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 10:42:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5714C10E029;
	Wed, 11 Jun 2025 10:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DiqgFzEn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074E210E029
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Jun 2025 10:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749638537; x=1781174537;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=h08gi4WLI6tcGkAwrH+Thpr07BPoSnIzkPWpfLw/hfY=;
 b=DiqgFzEnx0ymFeN6IuT9Ju7aKAvGtJxyHfB7ljZA/0RR7XWo1tqiA/LE
 SdLz0/Pclvuc2IkyGadmc1mIbj94/GBZVcMpNygrpHBwJNMr+DohW76+D
 NynlSEvCK+cSqTjwQVqaOcXslg7IeewmDtU0z4RMav2SQWYjeP3lt/olz
 3/CQG6VQIdnMop3nvGDqsdSeRkYuadhUMyMUIaBwVkQLSHRSxwGO9DRxo
 xUIehBcLFjBmwRd7cscmAlPHTEt0rK8pu4Ojhu8Gfm6T+j65t3tA1M6kv
 X3VnicFeIuprCSpCuqdh9fGdo7ia5ExfkEt6Z+wi55hPusEQel0HuFQel Q==;
X-CSE-ConnectionGUID: 34RbiC33QP2/arkFV3PxPA==
X-CSE-MsgGUID: SFg/TJqkRHS9CuFsNbSE8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="55579940"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="55579940"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 03:42:16 -0700
X-CSE-ConnectionGUID: j9wcgsUQTH6sMQgM6O0/oA==
X-CSE-MsgGUID: maI4rBXCRCqFr7C+RSwyzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="147515911"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.183])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 03:42:12 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 11 Jun 2025 13:42:08 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 Hans de Goede <hdegoede@redhat.com>, lucas.demarchi@intel.com, 
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com, 
 stable@vger.kernel.org
Subject: Re: [PATCH v4 01/10] platform/x86/intel/pmt: fix a crashlog NULL
 pointer access
In-Reply-To: <20250610211225.1085901-2-michael.j.ruhl@intel.com>
Message-ID: <e4f3a1e0-5332-212d-6ad0-8a72dcaf554a@linux.intel.com>
References: <20250610211225.1085901-1-michael.j.ruhl@intel.com>
 <20250610211225.1085901-2-michael.j.ruhl@intel.com>
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

On Tue, 10 Jun 2025, Michael J. Ruhl wrote:

> Usage of the intel_pmt_read() for binary sysfs, requires a pcidev.  The
> current use of the endpoint value is only valid for telemetry endpoint
> usage.
> 
> Without the ep, the crashlog usage causes the following NULL pointer
> exception:
> 
> BUG: kernel NULL pointer dereference, address: 0000000000000000
> Oops: Oops: 0000 [#1] SMP NOPTI
> RIP: 0010:intel_pmt_read+0x3b/0x70 [pmt_class]
> Code:
> Call Trace:
>  <TASK>
>  ? sysfs_kf_bin_read+0xc0/0xe0
>  kernfs_fop_read_iter+0xac/0x1a0
>  vfs_read+0x26d/0x350
>  ksys_read+0x6b/0xe0
>  __x64_sys_read+0x1d/0x30
>  x64_sys_call+0x1bc8/0x1d70
>  do_syscall_64+0x6d/0x110
> 
> Augment the inte_pmt_entry to include the pcidev to allow for access to

intel_pmt_entry

> the pcidev and avoid the NULL pointer exception.
> 
> Fixes: 416eeb2e1fc7 ("platform/x86/intel/pmt: telemetry: Export API to read telemetry")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/class.c | 3 ++-
>  drivers/platform/x86/intel/pmt/class.h | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
> index 7233b654bbad..d046e8752173 100644
> --- a/drivers/platform/x86/intel/pmt/class.c
> +++ b/drivers/platform/x86/intel/pmt/class.c
> @@ -97,7 +97,7 @@ intel_pmt_read(struct file *filp, struct kobject *kobj,
>  	if (count > entry->size - off)
>  		count = entry->size - off;
>  
> -	count = pmt_telem_read_mmio(entry->ep->pcidev, entry->cb, entry->header.guid, buf,
> +	count = pmt_telem_read_mmio(entry->pcidev, entry->cb, entry->header.guid, buf,
>  				    entry->base, off, count);
>  
>  	return count;
> @@ -252,6 +252,7 @@ static int intel_pmt_populate_entry(struct intel_pmt_entry *entry,
>  		return -EINVAL;
>  	}
>  
> +	entry->pcidev = pci_dev;
>  	entry->guid = header->guid;
>  	entry->size = header->size;
>  	entry->cb = ivdev->priv_data;
> diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
> index b2006d57779d..f6ce80c4e051 100644
> --- a/drivers/platform/x86/intel/pmt/class.h
> +++ b/drivers/platform/x86/intel/pmt/class.h
> @@ -39,6 +39,7 @@ struct intel_pmt_header {
>  
>  struct intel_pmt_entry {
>  	struct telem_endpoint	*ep;
> +	struct pci_dev		*pcidev;
>  	struct intel_pmt_header	header;
>  	struct bin_attribute	pmt_bin_attr;
>  	struct kobject		*kobj;
> 

-- 
 i.

