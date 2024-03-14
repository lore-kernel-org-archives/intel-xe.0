Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2319DC54E5D
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 17:19:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C7710FC2B;
	Thu, 14 Mar 2024 17:19:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MqCnlWaz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF7110FC2B
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 17:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710436767; x=1741972767;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yPm9ngX2m7okKuOtZ0H8uK6ySK0k5L/rkX4vIrO9Nf8=;
 b=MqCnlWazkd6ZKFYmuqI/+DUPn2Ss3y9xlhodu/4BHuz5W2NmC5gKy4CM
 jfA5Sawa6pVBfs+5URQFhDdvhUHO0zcr7QtyMhF0HHMVd1P4GEjzJhxBr
 rReUYG2xG2s5RJ1v7Nuij9IZZWpU+tOFQLw6FF2PU10ke0Q6RmNzDbf3V
 fqhkBk8+bq5DJ35rGqkX+BdAXmBtg5RE78rYLKsU+M91uBrw+4toY7One
 W6Zuws8IKkRii7F7OsxaFrVKK8xMnBfN/gdxFFii0HMbVT3umql//t/WA
 15plXXbpOB8LTUosNc7ntR/sg5YBuFo2Zyxmy4mlWdNeaDuLQejBbiFZo g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5472672"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="5472672"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 10:19:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="17029268"
Received: from unknown (HELO [10.245.244.240]) ([10.245.244.240])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 10:19:14 -0700
Message-ID: <f9c143a9-694c-4a15-93f5-1e3a5f2d12e6@intel.com>
Date: Thu, 14 Mar 2024 17:19:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Normalize bo flags macros
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
References: <20240314052619.2628396-1-lucas.demarchi@intel.com>
 <20240314052619.2628396-3-lucas.demarchi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240314052619.2628396-3-lucas.demarchi@intel.com>
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

On 14/03/2024 05:26, Lucas De Marchi wrote:
> The flags stored in the BO grew over time without following
> much a naming pattern. First of all, get rid of the _BIT suffix that was
> banned from everywhere else due to the guideline in
> drivers/gpu/drm/i915/i915_reg.h that xe kind of follows:
> 
> 	Define bits using ``REG_BIT(N)``. Do **not** add ``_BIT`` suffix to the name.
> 
> Here the flags aren't for a register, but it's good practice to keep it
> consistent.
> 
> Second divergence on names is the use or not of "CREATE". This is
> because most of the flags are passed to xe_bo_create*() family of
> functions, changing its behavior. However, since the flags are also
> stored in the bo itself and checked elsewhere in the code, it seems
> better to just omit the CREATE part.
> 
> With those 2 guidelines, all the flags are given the form
> XE_BO_FLAG_<FLAG_NAME> with the following commands:
> 
> 	git grep -le "XE_BO_" -- drivers/gpu/drm/xe | xargs sed -i \
> 		-e "s/XE_BO_\([_A-Z0-9]*\)_BIT/XE_BO_\1/g" \
> 		-e 's/XE_BO_CREATE_/XE_BO_FLAG_/g'
> 	git grep -le "XE_BO_" -- drivers/gpu/drm/xe | xargs sed -i -r \
> 		-e 's/XE_BO_(DEFER_BACKING|SCANOUT|FIXED_PLACEMENT|PAGETABLE|NEEDS_CPU_ACCESS|NEEDS_UC|INTERNAL_TEST|INTERNAL_64k)/XE_BO_FLAG_\1/g'
> 
> And then the defines in drivers/gpu/drm/xe/xe_bo.h are adjusted to
> follow the coding style.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Looks like a nice cleanup to me,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
