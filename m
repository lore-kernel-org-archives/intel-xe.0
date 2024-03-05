Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7A2C54798
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 11:14:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7298112A35;
	Tue,  5 Mar 2024 11:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FHwk38/a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A2F112A35
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 11:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709637289; x=1741173289;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=JKSEMAopHbl0LfAZ6kP7KZd0SYXxENQbIOxdkIglMEk=;
 b=FHwk38/aKpDbPp3NcJMfwbP6g9qY7oas/2ukO5Jgxg//tepVx5+2oy40
 qDBOTci6Kh9FY9RWXO9MSVltZ38mbl9Tm+UjIEBF8AuJtPTmUGzjHyPJb
 N1lVYf4HJx7+1MfY+rgS+lYbTIdz/XK8leUqDP6+YJpsC0fekiFgbRNWm
 fnWBdVLodoE+sgpD8FUqaoICeYRQ/fN4TmW2L+5azxdZzNCQxepumjAk2
 BVpePucNxXW7K54K8P19GacENKp9oRt490MeGA7b6Oa72wyG8WKcm6s2E
 oxNw32dvKrHMEvkyhp3Qovv8yg3qp07put3xXO09H8tTZ8Xa5HR22ZW5k Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="14762947"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="14762947"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 03:14:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="14003953"
Received: from pkunieck-mobl.ger.corp.intel.com (HELO [10.249.140.91])
 ([10.249.140.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 03:14:46 -0800
Message-ID: <d5fe6037-d592-4998-a2d2-fdec17996b34@intel.com>
Date: Tue, 5 Mar 2024 11:14:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] drm/xe: Ensure all the inner access are using the
 _noresume variant
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240304182154.42611-1-rodrigo.vivi@intel.com>
 <20240304182154.42611-8-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240304182154.42611-8-rodrigo.vivi@intel.com>
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

On 04/03/2024 18:21, Rodrigo Vivi wrote:
> At this point mem_access references should be only used as inner
> points of the execution and a get with synchronous resume previously
> called at an outer point.
> 
> So, before killing mem_acces in favor of direct accsess, let's
> ensure that we first convert them towards the new _noresume
> variant that will WARN us if no inner caller happened.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

I guess let's see what CI says.
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_device.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 6c7850dd70b5..58815e9bf242 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -671,7 +671,7 @@ void xe_device_mem_access_get(struct xe_device *xe)
>   	if (xe_pm_read_callback_task(xe) == current)
>   		return;
>   
> -	xe_pm_runtime_get(xe);
> +	xe_pm_runtime_get_noresume(xe);
>   	ref = atomic_inc_return(&xe->mem_access.ref);
>   
>   	xe_assert(xe, ref != S32_MAX);
