Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8932CE7B13
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 14:05:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FBAB10EA77;
	Fri, 14 Nov 2025 14:05:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PLNfVX52";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3FF110EA77
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 14:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763129115; x=1794665115;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PQszCpf/77jd/myDNzNExlDVeGv2LjpI5PKDDM++TGk=;
 b=PLNfVX527XwFbAagJfJGx8iVXFXqVG95ulsKj7TrugXl7RDP0ZWTkWIA
 8GsWXEp47ateO8A+r2IJaspsIzScd+H+jpJ7WUGLeagkpHTkhQ99dIlMZ
 8l4Zp4CwRBQLzRf9HskP67svMk8CjSr8yENXQp4kANWo6L5heLz29+O5H
 h8Jwtw3r8A2rIabZowUyLq/rj6tWeVSvt5w7KXDZOrZp4SOXXtFM5oGve
 0TnnSfcEzSZTfVbiqvGK1dso2QKjWASLlzurbIpyDrAGHbGBSDXv36TQ8
 /0u+1bctm2KLhVK6f+Nh02TCnhcSVliTGRMFe5zfacpVUE0PwR3XX0g9m Q==;
X-CSE-ConnectionGUID: RS0fNpjWQoiRZSmnnOpmdA==
X-CSE-MsgGUID: AkH2tnSBQoCVAo+mQgCLcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="76569451"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="76569451"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 06:05:15 -0800
X-CSE-ConnectionGUID: hwyWzw3OTser45lcqEaXqg==
X-CSE-MsgGUID: uoZLd03+Q9SnNpfVrN65MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="190031087"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.26])
 ([10.245.244.26])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 06:05:13 -0800
Message-ID: <d2ddc2b2-e22a-4cfb-aa27-9332b03ecbc3@intel.com>
Date: Fri, 14 Nov 2025 14:05:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Prevent BIT() overflow when handling invalid
 prefetch region
To: Shuicheng Lin <shuicheng.lin@intel.com>, intel-xe@lists.freedesktop.org
Cc: stable@vger.kernel.org
References: <20251112181005.2120521-2-shuicheng.lin@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20251112181005.2120521-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 12/11/2025 18:10, Shuicheng Lin wrote:
> If user provides a large value (such as 0x80) for parameter
> prefetch_mem_region_instance in vm_bind ioctl, it will cause
> BIT(prefetch_region) overflow as below:
> "
>   ------------[ cut here ]------------
>   UBSAN: shift-out-of-bounds in drivers/gpu/drm/xe/xe_vm.c:3414:7
>   shift exponent 128 is too large for 64-bit type 'long unsigned int'
>   CPU: 8 UID: 0 PID: 53120 Comm: xe_exec_system_ Tainted: G        W           6.18.0-rc1-lgci-xe-kernel+ #200 PREEMPT(voluntary)
>   Tainted: [W]=WARN
>   Hardware name: ASUS System Product Name/PRIME Z790-P WIFI, BIOS 0812 02/24/2023
>   Call Trace:
>    <TASK>
>    dump_stack_lvl+0xa0/0xc0
>    dump_stack+0x10/0x20
>    ubsan_epilogue+0x9/0x40
>    __ubsan_handle_shift_out_of_bounds+0x10e/0x170
>    ? mutex_unlock+0x12/0x20
>    xe_vm_bind_ioctl.cold+0x20/0x3c [xe]
>   ...
> "
> Fix it by validating prefetch_region before the BIT() usage.
> 
> v2: Add Closes and Cc stable kernels. (Matt)
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6478
> Cc: <stable@vger.kernel.org> # v6.8+
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Pushed with added:

Reported-by: Koen Koning <koen.koning@intel.com>
Reported-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

Thanks for the fix.

> ---
>   drivers/gpu/drm/xe/xe_vm.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 8fb5cc6a69ec..7cac646bdf1c 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3411,8 +3411,10 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>   				 op == DRM_XE_VM_BIND_OP_PREFETCH) ||
>   		    XE_IOCTL_DBG(xe, prefetch_region &&
>   				 op != DRM_XE_VM_BIND_OP_PREFETCH) ||
> -		    XE_IOCTL_DBG(xe,  (prefetch_region != DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC &&
> -				       !(BIT(prefetch_region) & xe->info.mem_region_mask))) ||
> +		    XE_IOCTL_DBG(xe, (prefetch_region != DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC &&
> +				      /* Guard against undefined shift in BIT(prefetch_region) */
> +				      (prefetch_region >= (sizeof(xe->info.mem_region_mask) * 8) ||
> +				      !(BIT(prefetch_region) & xe->info.mem_region_mask)))) ||
>   		    XE_IOCTL_DBG(xe, obj &&
>   				 op == DRM_XE_VM_BIND_OP_UNMAP) ||
>   		    XE_IOCTL_DBG(xe, (flags & DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET) &&

