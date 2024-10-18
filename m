Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CEC1D3000C
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 13:41:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5187F10E930;
	Fri, 18 Oct 2024 13:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Woo35HwT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4453110E930
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Oct 2024 13:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729258883; x=1760794883;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cikVrvslshfBmfJl+/0v+ndPWD9fe62+7ZWsp4yIDy8=;
 b=Woo35HwTEPfxg73RYp15eU4lKCtmQ4vt57CeOyoMbDiR1CyB3n/K1FUB
 PZFK9GRg4wVAJDjDMTdyMEuTwXKyrBLnh7JBNJF6a/MSQf8pY0zeVx/am
 dDkxv3CGsAboNjhmG42oJfh67Omd4bAJ1S/o/Ug7DvNS4rxV9uVnSVqUA
 MF7nGgNy51OrvxL5La5qvOqSqi4VBR5s99gKvklQ10fmK5kem+6cCmm+w
 qsYqLofhKPZatfpyJxrN/2J2gj/CM8Mcfpej254z+K+IlGWfK/pUyumC0
 f//8AWl8iDajwq302py9FlUiUyeSRr6AHkrSAr8QN74VZJ/L/UR9YvnEv A==;
X-CSE-ConnectionGUID: yoW8ri6vRAu8JBPBfXswHQ==
X-CSE-MsgGUID: c80lUfmxRC6pfAtUdtiNfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39331554"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="39331554"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 06:41:23 -0700
X-CSE-ConnectionGUID: yCtCLa41QHqTESuV1KdOQA==
X-CSE-MsgGUID: O4RuGA6KTZ2uAuQXFUZ8HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; d="scan'208";a="83455285"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.162.46])
 ([10.245.162.46])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 06:41:19 -0700
Message-ID: <8f873b94-ac9a-430c-901b-30bc47a6ccd2@linux.intel.com>
Date: Fri, 18 Oct 2024 15:41:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe/ufence: Warn if mmget_not_zero() fails
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20241016082304.66009-1-nirmoy.das@intel.com>
 <20241016082304.66009-3-nirmoy.das@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241016082304.66009-3-nirmoy.das@intel.com>
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

Hi Francois,

On 10/16/2024 10:23 AM, Nirmoy Das wrote:
> This shouldn't happen but seen this while debugging ufence timeout
> issue time to time so log it to isolate this particular case.
>
> v2: s/XE_WARN_ON/drm_dbg(Maarten)
>
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Francois Dugast <francois.dugast@intel.com> #v1


is your r-b valid for v2 as well ?


Regards,

Nirmoy

> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sync.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index 2e72c06fd40d..a90480c6aecf 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -83,6 +83,8 @@ static void user_fence_worker(struct work_struct *w)
>  			XE_WARN_ON("Copy to user failed");
>  		kthread_unuse_mm(ufence->mm);
>  		mmput(ufence->mm);
> +	} else {
> +		drm_dbg(&ufence->xe->drm, "mmget_not_zero() failed, ufence wasn't signaled\n");
>  	}
>  
>  	wake_up_all(&ufence->xe->ufence_wq);
