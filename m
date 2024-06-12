Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC68EC27C75
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 10:12:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF3310E815;
	Wed, 12 Jun 2024 10:12:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k0+t+434";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C537910E80C
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 10:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718187136; x=1749723136;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=u2iXN59V48twlYGTzPYTm8i8lDvVuSjFo6UX/X0+yl0=;
 b=k0+t+434oHV/oWKMNWP8uVpDOuAQIhnanGAbAINKAxN15xc+z32ZqGUi
 QJcrXBSSNijYDn6ZFfMByrc/HbgQ5eVOcc9W0pofbdryNX2IBD6TpMaON
 +HAQyY3JyeQ/cJ/fBsw4xc4BMVVOp0PH6vMee7gqIkAdxUbOr3vaa57mx
 aDH89WjBBYXRSrv+vgcOF1sNYly/WxR4Jpk3jc4wuIOEcLJfW+Q40z3IW
 AdFsI0wUtVKm1FsC0cie1jicjz8BqmjMjavCY8pgKRwnYr+zuTlWEq+ep
 eokhSkBq8N6nVv+hfFLEMwaJMfI+48Iqqc/n3sag2MRsKuC+C4lJUDsqH w==;
X-CSE-ConnectionGUID: j/WTPXI1TjylIpkV4lo+ww==
X-CSE-MsgGUID: OD0CK9PeROqcy8LFY5CQ5A==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14775947"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="14775947"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 03:12:16 -0700
X-CSE-ConnectionGUID: oMaiFAf0QL+Wx/torcwDmA==
X-CSE-MsgGUID: bmBuMjD8TF+n3u1wd/FwFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="39630056"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.248.192])
 ([10.94.248.192])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 03:12:14 -0700
Message-ID: <a083b2d9-24be-4337-abfe-47536c7e9aea@linux.intel.com>
Date: Wed, 12 Jun 2024 12:12:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] drm/xe: Kill fw_to_gt() helper
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240611163537.1944-1-michal.wajdeczko@intel.com>
 <20240611163537.1944-3-michal.wajdeczko@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240611163537.1944-3-michal.wajdeczko@intel.com>
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


On 6/11/2024 6:35 PM, Michal Wajdeczko wrote:
> It's too simple to deserve separate helper.
>
> Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_force_wake.c | 10 ++--------
>   1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index 13ddabd90eed..8799a2544648 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -15,12 +15,6 @@
>   
>   #define XE_FORCE_WAKE_ACK_TIMEOUT_MS	50
>   
> -static struct xe_gt *
> -fw_to_gt(struct xe_force_wake *fw)
> -{
> -	return fw->gt;
> -}
> -
>   static void domain_init(struct xe_force_wake_domain *domain,
>   			enum xe_force_wake_domain_id id,
>   			struct xe_reg reg, struct xe_reg ack)
> @@ -130,7 +124,7 @@ static int domain_sleep_wait(struct xe_gt *gt,
>   int xe_force_wake_get(struct xe_force_wake *fw,
>   		      enum xe_force_wake_domains domains)
>   {
> -	struct xe_gt *gt = fw_to_gt(fw);
> +	struct xe_gt *gt = fw->gt;
>   	struct xe_force_wake_domain *domain;
>   	enum xe_force_wake_domains tmp, woken = 0;
>   	unsigned long flags;
> @@ -159,7 +153,7 @@ int xe_force_wake_get(struct xe_force_wake *fw,
>   int xe_force_wake_put(struct xe_force_wake *fw,
>   		      enum xe_force_wake_domains domains)
>   {
> -	struct xe_gt *gt = fw_to_gt(fw);
> +	struct xe_gt *gt = fw->gt;
>   	struct xe_force_wake_domain *domain;
>   	enum xe_force_wake_domains tmp, sleep = 0;
>   	unsigned long flags;
