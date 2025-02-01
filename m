Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F33C0218A
	for <intel-xe@archiver.kernel.org>; Sat,  1 Feb 2025 06:24:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1207310E233;
	Sat,  1 Feb 2025 06:24:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kcSjb2LB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC2810E233
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Feb 2025 06:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738391096; x=1769927096;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=C08zOqw1l3+zF/99fUDMoK+IWI0DknFat7Apm2fTpb0=;
 b=kcSjb2LBCJjnXdVSrMVggspNOANC3NyN402mmhByNx3eXHawbvDQalC2
 tQiaEVqQeN/hUjzBnHcDcaftq1KZLPU9yY+vAytRD8CtIN+zKqMbiOhDq
 0S/0wj+xTqIXvHgoSfh3gnTfr05DSH9ekmeOStr8pA63Qp7y7BWocGVSh
 G7Ugod5O6/VjB/PY9yI1N6T/rMNyXGg/E3tMjaJM0wnkKdkpRvcayi/zE
 bqC0on9GHA4Xm8ifRl8LWAmMJv5VvIr5eqw1UOw0CN+Q4gJqUSVMrra67
 QKpTCMTnlNTboFqh4t9aJUcBTkoB4JuBSpJAkHrNBG3M6aBsl5rn61kQw A==;
X-CSE-ConnectionGUID: tvW0TjUjTwynPOs+dZVRJQ==
X-CSE-MsgGUID: P3boi0WYRAC71oseoO2AWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="39119681"
X-IronPort-AV: E=Sophos;i="6.13,250,1732608000"; d="scan'208";a="39119681"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 22:24:55 -0800
X-CSE-ConnectionGUID: MxOLxyWdSw2TJda95V8j4A==
X-CSE-MsgGUID: 2+kcguHCQCKniO3G1B24Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114958990"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 22:24:54 -0800
Date: Sat, 1 Feb 2025 08:24:50 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [PATCH 5/7] drm/xe: Cleanup unwind of gt initialization
Message-ID: <Z52-Mp78y2jELsmp@black.fi.intel.com>
References: <20250131223140.4144292-1-lucas.demarchi@intel.com>
 <20250131223140.4144292-6-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131223140.4144292-6-lucas.demarchi@intel.com>
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

On Fri, Jan 31, 2025 at 02:31:38PM -0800, Lucas De Marchi wrote:
> Move the xe_gt_remove() to be handled by xe_gt.c itself so the caller,
> xe_device_probe() doesn't have to unwind the gt loop. It's also more in
> line with the xe_device_probe() style.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 21 ++-----------------
>  drivers/gpu/drm/xe/xe_gt.c     | 37 ++++++++++++++++------------------
>  drivers/gpu/drm/xe/xe_gt.h     |  1 -
>  3 files changed, 19 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index e519f435b1606..bea626f6b4cbf 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -743,7 +743,6 @@ int xe_device_probe(struct xe_device *xe)
>  	struct xe_tile *tile;
>  	struct xe_gt *gt;
>  	int err;
> -	u8 last_gt;
>  	u8 id;
>  
>  	xe_pat_init_early(xe);
> @@ -851,18 +850,16 @@ int xe_device_probe(struct xe_device *xe)
>  		return err;
>  
>  	for_each_gt(gt, xe, id) {
> -		last_gt = id;
> -
>  		err = xe_gt_init(gt);
>  		if (err)
> -			goto err_fini_gt;
> +			return err;

So it's either all or nothing? Can't we operate with atleast what we have?

Raag
