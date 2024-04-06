Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A0BBCD1284
	for <intel-xe@archiver.kernel.org>; Sat,  6 Apr 2024 14:47:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C3EC10F1BD;
	Sat,  6 Apr 2024 14:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C7xc2r6x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9241F10F2AA
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Apr 2024 14:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712414819; x=1743950819;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=EVFYYULkG6mBd+t98+w7mVIeS/VpDdEzBtpetEdv4/s=;
 b=C7xc2r6xduH73djqx72d8evUYgusCobSo+ow0rWzFOQmS2XrR3o5q1jB
 kVT0p3IaW10rIyvaqvbQMp45R5Pc5aOI8vVX1b2G/o7XLmSOWMoaqRYYn
 HXs6o13DBefvdOEajcsCIDe19fXou3xI+q6G8c44KIlIUYgjySMxCW33t
 1RgMGZdIK8Nsmi9fBID0PnLLUXhqdJpCjAU1OxGySMkxeODWjNr0DfEY0
 lNUqotFHUR6bXRCalkHRXj68e66iOISCKSk2U09DN3v4femSN5TcPp+1M
 W/o4ZzttvP3mpNn0jXhfkqCfM7Zz11TBkxFd2XeIUb5Ln7loirZZdtSdy A==;
X-CSE-ConnectionGUID: 2Z3a/lmQRDWN6R9nd6GjoA==
X-CSE-MsgGUID: DvXlsc+FR/iTQA9TJC+pOw==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="7593777"
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; 
   d="scan'208";a="7593777"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2024 07:46:58 -0700
X-CSE-ConnectionGUID: O7NfHBVkRG+QIb0vdE3uig==
X-CSE-MsgGUID: Jxodj0xJQr+ZSJ7deNMGJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; d="scan'208";a="19877743"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa007.jf.intel.com with ESMTP; 06 Apr 2024 07:46:57 -0700
Received: from [10.249.143.192] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.143.192])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 0BC6C33EB0;
 Sat,  6 Apr 2024 15:46:51 +0100 (IST)
Message-ID: <d9b2af11-26a4-404c-9696-aa75e3a1d7ee@intel.com>
Date: Sat, 6 Apr 2024 16:46:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Initialize GuC ID mgr before registering
 guc_submit_fini
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20240405212747.226263-1-matthew.brost@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240405212747.226263-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 05.04.2024 23:27, Matthew Brost wrote:
> It reasonable to assume that guc_submit_fini may rely on GuC ID mgr
> being available. With that, register guc_submit_fini after initializing
> the GuC ID mgr. This will ensure the GuC ID mgr is available in
> guc_submit_fini due the reverse execution order of
> drmm_add_action_or_reset.

that wont fly right now as GuC ID manager expects submission_state.lock
mutex being still available during it's cleanup, but now it will be
destroyed in __guc_submit_fini() called prior to __fini_idm()

please take a look at [1] which should solve all the problems

[1] https://patchwork.freedesktop.org/series/132118/

> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 9c30bd9ac8c0..148c5dc2c1ac 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -232,15 +232,20 @@ static struct workqueue_struct *get_submit_wq(struct xe_guc *guc)
>  }
>  #endif
>  
> -static void guc_submit_fini(struct drm_device *drm, void *arg)
> +static void __guc_submit_fini(struct xe_guc *guc)
>  {
> -	struct xe_guc *guc = arg;
> -
>  	xa_destroy(&guc->submission_state.exec_queue_lookup);
>  	free_submit_wq(guc);
>  	mutex_destroy(&guc->submission_state.lock);
>  }
>  
> +static void guc_submit_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_guc *guc = arg;
> +
> +	__guc_submit_fini(guc);
> +}
> +
>  static const struct xe_exec_queue_ops guc_exec_queue_ops;
>  
>  static void primelockdep(struct xe_guc *guc)
> @@ -277,11 +282,13 @@ int xe_guc_submit_init(struct xe_guc *guc)
>  
>  	primelockdep(guc);
>  
> -	err = drmm_add_action_or_reset(&xe->drm, guc_submit_fini, guc);
> -	if (err)
> +	err = xe_guc_id_mgr_init(&guc->submission_state.idm, ~0);
> +	if (err) {
> +		__guc_submit_fini(guc);
>  		return err;
> +	}
>  
> -	err = xe_guc_id_mgr_init(&guc->submission_state.idm, ~0);
> +	err = drmm_add_action_or_reset(&xe->drm, guc_submit_fini, guc);
>  	if (err)
>  		return err;
>  
