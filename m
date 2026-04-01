Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD3710F6FD6
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 15:53:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F3B210E5F9;
	Wed,  1 Apr 2026 15:53:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZrVrTcto";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A11910E5F9
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 15:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775058794; x=1806594794;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dUWBvWxTerV6L/nOJFdu4Jfu2+k94Jhb6Ccc/GSmtBk=;
 b=ZrVrTctoIaxHf5DmzoXHDU2JnjsCsJJUcNeQmsztmL0y9JcfvaSi9XqC
 Ti3nW4zFXmttBjVkjvmKeKZJVYcK0MQmyBk0lTgnrw2yxKeumyHzbGGBA
 KWJBwDFQySjrCWfCZ/9TO0Fn8yi1SGlMW4wr1SzSj1nVC0jJiZ9uW4s2A
 ZwF1nc1OvWksBCZhlu9Bj/yFQB+wPbSGs6qHF0w52D+QxSJ1GaP8TsHdx
 ctg0felzoftMUbWAQoeNifFvseGbjILbt3rxOXI6vAy/h38W/vDz5FKaO
 r/z0VRIBoGAc+WW8mdTN46r5vbg+oJ6s+o/apUv35DA/ZmwKMJ4qTN+Du Q==;
X-CSE-ConnectionGUID: sr+WLwFBSFqrqu3dXgtPfw==
X-CSE-MsgGUID: j5+GQVnoTLyaSw92A6BCkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76164437"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="76164437"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 08:53:14 -0700
X-CSE-ConnectionGUID: pYfd0AdVSVKWc9O3HH7Mtw==
X-CSE-MsgGUID: kmh/Opc0Tm2thikh8s/5qg==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.182])
 ([10.245.244.182])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 08:53:13 -0700
Message-ID: <eb862036-67a7-4d3c-b4ad-f876e2da6a39@intel.com>
Date: Wed, 1 Apr 2026 16:53:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/vm: Add missing pad and extensions check
To: Jonathan Cavitt <jonathan.cavitt@intel.com>, intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com
References: <20260331181216.37775-2-jonathan.cavitt@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260331181216.37775-2-jonathan.cavitt@intel.com>
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

On 31/03/2026 19:12, Jonathan Cavitt wrote:
> Add missing pad and extensions check to xe_vm_get_property_ioctl
> 
> v2:
> - Combine with other check (Auld)
> 
> Fixes: 50c577eab051 ("drm/xe/xe_vm: Implement xe_vm_get_property_ioctl")
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

Pushed now. Thanks.

> ---
>   drivers/gpu/drm/xe/xe_vm.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 56e2db50bb36..1720205c09ca 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -4156,7 +4156,8 @@ int xe_vm_get_property_ioctl(struct drm_device *drm, void *data,
>   	int ret = 0;
>   
>   	if (XE_IOCTL_DBG(xe, (args->reserved[0] || args->reserved[1] ||
> -			      args->reserved[2])))
> +			      args->reserved[2] || args->extensions ||
> +			      args->pad)))
>   		return -EINVAL;
>   
>   	vm = xe_vm_lookup(xef, args->vm_id);

