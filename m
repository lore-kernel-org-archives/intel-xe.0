Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A469A10F92E3
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 16:48:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638D210E238;
	Tue, 31 Mar 2026 16:48:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ityoXxWo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978B110E238
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Mar 2026 16:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774975727; x=1806511727;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1mf7A5WARp74DDFw8b2+q3dVb5tjb0idUaFG6BOfM+I=;
 b=ityoXxWotT7MZdakK8P5u7mTC6uDx7dkk5NXpuJScpZo1aVkH/3+7Ouu
 9s6PBt8MmOFZN7aQTXgjgL7kdhh6CV12A05VmuF+k47WRB3YSNunwyIg0
 xQqS8rrm4hQ1+mTet95CwazorvtiK7EkW02vbCcXhsZjr31wCbDPzktYQ
 tFwRheS7snKr4xR5NFlaeM86JCLzvCl23WoapXPH1jMq3mxQ61JTyI7rf
 gPKxEZnKwxTtb8Vy5vThW8mYIOMw/+3IbH4uugvtTp2hmLk5SgE8Z8+HY
 dWQf78bH6+CaU8y6cFHVNwan4q2T1QaGsCSXxP+/TREjyKpQTpYAkPuqN A==;
X-CSE-ConnectionGUID: Rf/qC150Sp2vDMP5h3jQdA==
X-CSE-MsgGUID: nIS3a4vCQHaLyIXsVJ4T8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="93387525"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="93387525"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 09:48:47 -0700
X-CSE-ConnectionGUID: 6JCeQxUvQXevDlAipiY26A==
X-CSE-MsgGUID: VfadKWmIRUedZUeVWjwGEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="230480579"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.244.19])
 ([10.245.244.19])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 09:48:47 -0700
Message-ID: <36f7b5a5-0878-4ecb-a338-c589eb0e607d@intel.com>
Date: Tue, 31 Mar 2026 17:48:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/vm: Add missing pad and extensions check
To: Jonathan Cavitt <jonathan.cavitt@intel.com>, intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com
References: <20260331164403.11687-2-jonathan.cavitt@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260331164403.11687-2-jonathan.cavitt@intel.com>
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

On 31/03/2026 17:44, Jonathan Cavitt wrote:
> Add missing pad and extensions check to xe_vm_get_property_ioctl
> 
> Fixes: 50c577eab051 ("drm/xe/xe_vm: Implement xe_vm_get_property_ioctl")
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

Would it make sense to combine this with the other reserved checks?

Either way:
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_vm.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 56e2db50bb36..03f129927b0f 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -4159,6 +4159,9 @@ int xe_vm_get_property_ioctl(struct drm_device *drm, void *data,
>   			      args->reserved[2])))
>   		return -EINVAL;
>   
> +	if (XE_IOCTL_DBG(xe, args->pad || args->extensions))
> +		return -EINVAL;
> +
>   	vm = xe_vm_lookup(xef, args->vm_id);
>   	if (XE_IOCTL_DBG(xe, !vm))
>   		return -ENOENT;

