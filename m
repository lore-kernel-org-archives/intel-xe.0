Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB11AC02194
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 12:05:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9887510E83A;
	Thu,  6 Feb 2025 12:05:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l6DqMXzI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA1D10E83A
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 12:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738843519; x=1770379519;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QNFOFIbCMEkU0cfQtPngNEBpg+NjSgljXDCSpFlCs58=;
 b=l6DqMXzIBVFwixJM5X7Zfje3XVIznghLTuZlvtVoAZazA3SIds3rzQpG
 Bwy4zyw/L5MJxuSBB3lS0LhS75abhhlUPAz/cvDaXy7ZDFNZgUb6+4jCX
 urwfKxTbZdCJMbIh+EUVPfl15NLZMeHfQusmtTmo3KwgyZ/EhuBe7DMRm
 z/dqbTCWrC1jOKybSkklKt1eGHBMR+3+moxwiIz0tZg9X76+8OU+y8vqA
 oIMXkwpRqDZ/bwehWew+IoyC9F87+y6phisrI6ThL/E31uLvBwvKnhz3S
 B+YDWHiNbPyggMWc4icJ6BKE6gZZ8ga7xeZHzNr9OjIIcg820lBElyjXN w==;
X-CSE-ConnectionGUID: 7YtzIx+gRCmxPY19ugQ94A==
X-CSE-MsgGUID: 6PPy8oLXTGKAcY/JRcZsiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39137471"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="39137471"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 04:05:19 -0800
X-CSE-ConnectionGUID: +38Z1UcSRPmTyB8Zpbpmaw==
X-CSE-MsgGUID: US19Fvh6SG2Gyqi7I5grYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115277579"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.246.3.119])
 ([10.246.3.119])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 04:05:17 -0800
Message-ID: <f6fecda7-4783-4b1d-9e20-cee034be24fb@linux.intel.com>
Date: Thu, 6 Feb 2025 13:05:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Don't treat SR-IOV platforms as reclaim unsafe
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20250205120150.896-1-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250205120150.896-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 2/5/2025 1:01 PM, Michal Wajdeczko wrote:
> Since commit a4d1c5d0b99b ("drm/xe/pf: Move VFs reprovisioning
> to worker") and commit 78d5d1e20d1d ("drm/xe/relay: Don't use
> GFP_KERNEL for new transactions") we should have no more lockdep
> dependencies on the reclaim path when running in the SRIOV mode
> so we believe that we can now mark SRIOV driver as reclaim safe.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 35dd1757b40b..12200be7b43d 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -91,7 +91,7 @@ static struct lockdep_map xe_pm_runtime_nod3cold_map = {
>    */
>   bool xe_rpm_reclaim_safe(const struct xe_device *xe)
>   {
> -	return !xe->d3cold.capable && !xe->info.has_sriov;
> +	return !xe->d3cold.capable;
>   }

LGTM

Tested-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

>   
>   static void xe_rpm_lockmap_acquire(const struct xe_device *xe)

