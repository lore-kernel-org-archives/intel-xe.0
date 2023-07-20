Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B83BEB64DA
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 09:11:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F7B10E583;
	Thu, 20 Jul 2023 09:11:05 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606D010E583
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jul 2023 09:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689844264; x=1721380264;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=kHnq1t/1WEM0C872SOql/i8DQ0BALlFo74TawJhMikw=;
 b=TdElvp9cXNRg+6kFjHEk/x0bzmlPEATi0LMUp9TTisYvnv2nQ9GSiJJT
 GI/LYENF1O8FdNBJqbouKUzcyEyl6tZVZEUl/Vjb/jFAszkUmnRCkTZmZ
 sYPs3IyTfovdvy81rrKWCQRPCA2yiud9EyxHEs1udUVt602Fkq/xrnnHJ
 FouQ8RQGQMxRtcIEH+5etuSAuP4xhYHwVu5tLParmuTXFOrJQKQBlxwns
 rWlYJUGnjFVL0U+VMRqxZHugz+w2T4zg6Lznmxi6IRyyWyIG3dK2ET7Y0
 yZfNskLrGbvJatyZDEzaH979icbFigSpZAjlkNepB8+nHdO3ysjMpV6mS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="346272788"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; d="scan'208";a="346272788"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 02:11:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="794387770"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; d="scan'208";a="794387770"
Received: from mwilczax-mobl.ger.corp.intel.com (HELO [10.252.29.41])
 ([10.252.29.41])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 02:11:03 -0700
Message-ID: <2ed513ec-3a3f-1795-2761-ad1d39bb6a09@intel.com>
Date: Thu, 20 Jul 2023 10:11:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20230719192726.172056-1-rodrigo.vivi@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20230719192726.172056-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix an invalid locking wait context
 bug
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

On 19/07/2023 20:27, Rodrigo Vivi wrote:
> xe_irq_{suspend,resume} were incorrectly using the xe->irq.lock.
> 
> The lock was created to protect the gt irq handlers, and not
> the irq.enabled. Since suspend/resume and other places touching
> irq.enabled are already serialized they don't need protection.
> (see other irq.enabled accesses).
> 
> Then with this spin lock around xe_irq_reset, we will end up
> calling the intel_display_power_is_enabled() function, and
> that needs a mutex lock. Hence causing the undesired
> "[ BUG: Invalid wait context ]"
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_irq.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index eae190cb0969..df01af780a57 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -574,10 +574,8 @@ void xe_irq_shutdown(struct xe_device *xe)
>   
>   void xe_irq_suspend(struct xe_device *xe)
>   {
> -	spin_lock_irq(&xe->irq.lock);
>   	xe->irq.enabled = false;
>   	xe_irq_reset(xe);
> -	spin_unlock_irq(&xe->irq.lock);

Do we not need something like:

spin_lock_irq(&xe->irq.lock);
xe->irq.enabled = false; /* no new irqs */
spin_unlock_irq(&xe->irq.lock);

synchronize_irq(...); /* flush irqs */
xe_irq_reset(); /* turn off irqs */
....

And then at the start of the irq handler:

spin_lock_irq(&xe->irq.lock);
if (!xe->irq.enabled) {
     spin_unlock_irq(&xe->irq.lock);
     return ....;
}

Or did something happen prior to xe_irq_suspend() to ensure proper 
serialisation with irq and the above steps are not really needed?

>   }
>   
>   void xe_irq_resume(struct xe_device *xe)
> @@ -585,13 +583,10 @@ void xe_irq_resume(struct xe_device *xe)
>   	struct xe_gt *gt;
>   	int id;
>   
> -	spin_lock_irq(&xe->irq.lock);
>   	xe->irq.enabled = true;
>   	xe_irq_reset(xe);
>   	xe_irq_postinstall(xe);
>   
>   	for_each_gt(gt, xe, id)
>   		xe_irq_enable_hwe(gt);
> -
> -	spin_unlock_irq(&xe->irq.lock);
>   }
