Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38981C5AE59
	for <intel-xe@archiver.kernel.org>; Sat, 31 May 2025 05:36:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD0110E036;
	Sat, 31 May 2025 05:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I3PwGKsW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A1C10E036
 for <intel-xe@lists.freedesktop.org>; Sat, 31 May 2025 05:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748669799; x=1780205799;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=Rof3TEP/ecFnk03IekFOjv1pBRVg7EcYnBlYGoyK79A=;
 b=I3PwGKsWa5BpSDpeQStViGFkogZgU/GLdp6ogT2CEWBwffQ/QV5ueY+V
 EqNbff+GJUaOqF9GlOc4mPYe4adRb5YnyuwXlPQmKFn13NnV4rWWLwA51
 yR+76ZRSEypsVP950yn5lR8BFImPfFlPR9PCRWJnn6uI7U2lFntUI1sc1
 GsHMNjyW8YafBbmi02bq+FivBeVpQy5TCregtME7STzCueCv79yKLddhK
 FLIRHwzdN6jWSLi9haRVqmBtt9yCRe4dLDWRwodKT9dH/FKCAnYgpSsyG
 R8BG2wk50Qj0X1Vh3wiO8pWYaYXFs7N2TyY9Im4hNbBFQoyjdHqL9iKZC g==;
X-CSE-ConnectionGUID: qfGh4jlaSim0eTjUSIvIXg==
X-CSE-MsgGUID: h+d6In5hQ2GJBdpaIZyH0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50455434"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; d="scan'208";a="50455434"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 22:36:38 -0700
X-CSE-ConnectionGUID: OX8hq8GSSR+vSkQ6Weu2EA==
X-CSE-MsgGUID: eLBBfjlVTImPr66SXQEk7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; d="scan'208";a="147943028"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.71])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 22:36:35 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Sat, 31 May 2025 08:36:31 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 Hans de Goede <hdegoede@redhat.com>, lucas.demarchi@intel.com, 
 rodrigo.vivi@intel.com
Subject: Re: [PATCH 05/10] platform/x86/intel/pmt: crashlog binary file
 endpoint
In-Reply-To: <20250530203356.190234-5-michael.j.ruhl@intel.com>
Message-ID: <3d2a4585-92c7-f2b4-5f48-20e6abd3255d@linux.intel.com>
References: <20250530203356.190234-1-michael.j.ruhl@intel.com>
 <20250530203356.190234-5-michael.j.ruhl@intel.com>
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

On Fri, 30 May 2025, Michael J. Ruhl wrote:

> Usage of the intel_pmt_read() for binary sysfs, requires an
> allocated endpoint struct. The crashlog driver does not
> allocate the endpoint.
> 
> Without the ep, the crashlog usage causes the following NULL
> pointer exception:
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
> Add the endpoint information to the crashlog driver to avoid
> the NULL pointer exception.
> 
> Fixes: 416eeb2e1fc7 ("platform/x86/intel/pmt: telemetry: Export API to read telemetry")

Add Cc: <stable@vger.kernel.org> and as this is going to stable so you 
should mrk the patches this one depends on with the stable Cc as well,
this is explained in Documentation/process/stable-kernel-rules.rst.

As a general rule, it would be useful to put the patches going to stable
as first and refactor and feature changes only after that (you had some 
whitespace and guard() changes before this patch).

> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/crashlog.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
> index c6d8a7a61d39..94858bfb52f8 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -250,6 +250,7 @@ static struct intel_pmt_namespace pmt_crashlog_ns = {
>  	.xa = &crashlog_array,
>  	.attr_grp = &pmt_crashlog_group,
>  	.pmt_header_decode = pmt_crashlog_header_decode,
> +	.pmt_add_endpoint = intel_pmt_add_endpoint,
>  };
>  
>  /*
> @@ -260,8 +261,12 @@ static void pmt_crashlog_remove(struct auxiliary_device *auxdev)
>  	struct pmt_crashlog_priv *priv = auxiliary_get_drvdata(auxdev);
>  	int i;
>  
> -	for (i = 0; i < priv->num_entries; i++)
> -		intel_pmt_dev_destroy(&priv->entry[i].entry, &pmt_crashlog_ns);
> +	for (i = 0; i < priv->num_entries; i++) {
> +		struct intel_pmt_entry *entry = &priv->entry[i].entry;
> +
> +		intel_pmt_release_endpoint(entry->ep);
> +		intel_pmt_dev_destroy(entry, &pmt_crashlog_ns);
> +	}
>  }
>  
>  static int pmt_crashlog_probe(struct auxiliary_device *auxdev,
> 

-- 
 i.

