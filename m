Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264A1C25B76
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 08:43:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C84010E05A;
	Wed,  5 Jun 2024 08:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MmgpiyMd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A0C710E05A
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 08:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717577024; x=1749113024;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bBkXuZbWNrmPcout+qpTkYoCTYQbBh8AL5/+PUMvpvI=;
 b=MmgpiyMdNtoc1s3ERrEgI21Y0VMuWS8UuI3HVWbtLYkfdNGWvj1tm/X3
 8pxTKPR92nnrG+UG/BwRaWaBMHuIs3IkF4osXO4LT3j/KbnJqY4/LOIBA
 mGgMCvT2P0jDxQOwb14WDSbRofg2+NqL/Qd0do4a/dpNodtLqfPWRkf6G
 tOAS/lK95MtST1tV/u9Q6w8gFiZIaXwBJcFW7cJjfoMUEOl8BQAG1GBdm
 p2pcoJ+F+3rBwodJI7YEMgc+M2YhjIaUVr6O58xdrjMGRAMb5kl7vjn8X
 T0YA+KZ6vZ6vWdz376LKMtrtyxOelvA5FM2rDpawdkQOMrMd5dz3HpH5k A==;
X-CSE-ConnectionGUID: yhW61qh1RJ22L+Hxg8oG/Q==
X-CSE-MsgGUID: JmpEYlXbRpOk5bIsH7FCMw==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="14010986"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="14010986"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 01:43:44 -0700
X-CSE-ConnectionGUID: 3YGV0F/MTXij5yFBu0Vjfw==
X-CSE-MsgGUID: fjWp1VmBTpqr2/yzs8hTrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="60702886"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.33.194])
 ([10.246.33.194])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 01:43:42 -0700
Message-ID: <40e1ff44-2a54-4d99-bbc9-83738821c1f0@linux.intel.com>
Date: Wed, 5 Jun 2024 10:43:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] drm/xe: Access port only after lock acquired
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
References: <20240604104516.766058-1-tejas.upadhyay@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240604104516.766058-1-tejas.upadhyay@intel.com>
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

Hi Tejas,

On 6/4/2024 12:45 PM, Tejas Upadhyay wrote:
> Currently, port is accessed before lock of port is acquired.
> As followed at other places, lets acquire lock before accessing
> for even better sync up.

The lock is for protecting port->active list so think the code here is 
fine.


Regards,

Nirmoy

> V2:
>    - Add port->active check under lock
>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_execlist.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index db906117db6d..fcbc3bac1ebe 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -210,15 +210,16 @@ static void xe_execlist_port_wake_locked(struct xe_execlist_port *port,
>   
>   static void xe_execlist_make_active(struct xe_execlist_exec_queue *exl)
>   {
> -	struct xe_execlist_port *port = exl->port;
> +	struct xe_execlist_port *port;
>   	enum xe_exec_queue_priority priority = exl->q->sched_props.priority;
>   
>   	XE_WARN_ON(priority == XE_EXEC_QUEUE_PRIORITY_UNSET);
>   	XE_WARN_ON(priority < 0);
> -	XE_WARN_ON(priority >= ARRAY_SIZE(exl->port->active));
>   
> -	spin_lock_irq(&port->lock);
> +	spin_lock_irq(&exl->port->lock);
>   
> +	XE_WARN_ON(priority >= ARRAY_SIZE(exl->port->active));
> +	port = exl->port;
>   	if (exl->active_priority != priority &&
>   	    exl->active_priority != XE_EXEC_QUEUE_PRIORITY_UNSET) {
>   		/* Priority changed, move it to the right list */
