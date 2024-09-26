Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67899CCF9E9
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 11:11:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE8510E2E2;
	Thu, 26 Sep 2024 11:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KE/F0gzz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362A910E2E2
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Sep 2024 11:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727349082; x=1758885082;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nQVuTkbPivbevpW2c+ir47EOsFWUycSzcW2dy4FBGkY=;
 b=KE/F0gzz57NosNHc4iliq2jGpX6+/3CSAVu56Va2cPFZKCnOp+Gh5K70
 BTGh1L05PXfzXU4psjPCv5wPvv9NyI11YwqW3k2M2BGsUbZqU1j8OnaqJ
 RoSG5wl21ITuE+rW0GNCnBjmQU7Zghj+XuAVTnjF+pom8GgjkwdjKwGNn
 b2YW7byVrqvNjreHonYYCzQyA+jwa/yOOfDShDL2PwufYmpGfQlIyrXXA
 B8yprzgAkiDURDZdlUfDM7DvsYoLH/4BfX7/3OR5okSyh3Tm0Cbl0R+ua
 EVpOVhDWOrkl7TubTQV01E45Mexh1JlFRrtlL21pabYMsakNFwoueFjQa w==;
X-CSE-ConnectionGUID: dEsEKbIPQROrhPcZlNjZnw==
X-CSE-MsgGUID: aPNPziIRQB+bL25dmDA3ZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="43951253"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="43951253"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 04:11:21 -0700
X-CSE-ConnectionGUID: j4obuYwJRVWBzf2W5UQNhg==
X-CSE-MsgGUID: KkOj954MR6GW1mpflO+gxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="77032543"
Received: from apaszkie-mobl2.apaszkie-mobl2 (HELO [10.245.245.207])
 ([10.245.245.207])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 04:11:20 -0700
Message-ID: <51d67f36-5acd-493f-b81e-5381af3884a5@linux.intel.com>
Date: Thu, 26 Sep 2024 13:11:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Check return values of functions in
 xe_gt_shutdown()
To: apoorva.singh@intel.com, intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com
References: <20240926110026.407383-1-apoorva.singh@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240926110026.407383-1-apoorva.singh@intel.com>
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

Hey,

Den 2024-09-26 kl. 13:00, skrev apoorva.singh@intel.com:
> From: Apoorva Singh <apoorva.singh@intel.com>
> 
> Check the return values of the functions xe_force_wake_get()
> and xe_force_wake_put() to prevent mistakenly treating them as
> void returns.
> 
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 274737417b0f..317640554310 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -890,9 +890,12 @@ int xe_gt_suspend(struct xe_gt *gt)
>  
>  void xe_gt_shutdown(struct xe_gt *gt)
>  {
> -	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	int err;
> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	xe_gt_WARN(gt, err, "Acknowledgment for domain awake timedout");
>  	do_gt_reset(gt);
> -	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	xe_gt_WARN(gt, err, "Acknowledgment for domain sleep timedout");
>  }

There's absolutely nothing we can do with xe_force_wake_put, the only thing you can do here is:

int ret = xe_force_wake_get(..);
do_gt_reset;
if (!ret)
xe_force_wake_put

Also no point in complaining, the hardware may already be hosed. :)

I believe that xe_force_wake_put should return void, there's nothing we can do except log the error here.

Cheers,
Maarten
