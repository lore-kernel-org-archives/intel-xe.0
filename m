Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77ADDEB64DA
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jul 2023 21:57:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370DA10E076;
	Wed, 12 Jul 2023 21:57:53 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CADE10E076
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jul 2023 21:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689199070; x=1720735070;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ybas4kHHTiyJxRl/UkAH0ODtbsKJ8r5GwAsrd/EktKA=;
 b=i3gP1UQlRfw01kkKI4QPShrW32riQFaJ+KybQy+iepojt8cVpOHvpJMP
 w2X1g6BGR/Q/KqsaSHjqqb6fvf2nwxUUnHrKpmkCYyp+MWUn9Woe3MZGy
 wheHQ0FGjyr4wUmHnk2yv9u2dfxlF2oRXtqdJD5CmResxibUigkcSUdww
 Bf6QykXIriYTURuOUvhvJHPLuydAl+7ldoxthoktX4t3CVYFc55U1BWZh
 t/UCgRfzawhd8WPHZ5hyRRadr9MlmHZ1VxbW0JZ1bmm9QpWBdi8jI+/QJ
 4fPKOTMnqqCvimg4Y+fYMvvGJvel2HpQjFGzvwo57BKqwENv+hwSNcg2V g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="395818714"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; d="scan'208";a="395818714"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 14:57:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="699013219"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; d="scan'208";a="699013219"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 12 Jul 2023 14:57:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 12 Jul 2023 14:57:36 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 12 Jul 2023 14:57:36 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 12 Jul 2023 14:57:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BUmuP93tXLi2qaQLQ6W/mRlrzQuNTR5l8Gd6mT12BjgGD84z9DYgPPo5HdooTbQb2lT39AHfpmdszB3dbZo0mo97D34B1hNPd/jtXKSw3xiPjae6/RiAVSwU8GQ30Xzaz1q6HUJRyWpw23tiwlWGZLgEtzDZPF/fZMFznxyBjV9FgyNzAABZLIO5o1YnIhzLhZOjpGuVjiCZc9NWCAPlO1lkjiyTMuulTAFNJVbPRpEPWwPwhJotrKm3cVarIX3krgyos5TmUWz3fVQDjP7N1/WD9EFvZxgeQby+14Kk73pGmmMvQMXyLra7ilUcJUvL+jbJS8s2ZqnXvCUjNFWGpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Abc4BltSdQgW1OBT/AakO7348mMOAUnBlxgERfGqONU=;
 b=MahxJYSyYnAL5aMQJva4e32BdpDgmRKYpliYRWGfUBh0iq6IeNb6eXvprDE3wCjeAQTCeKOn9EHN2HzAPngj2iFYSovhYvILwPG4GX3FCUr3szEBsrPttljew8jTm88habNWb1RAZc1iAFrqA/hAWHowtCAhujxPKanB7Pal8lw0T0XJ/G2NEBf00bMydzkCMl6Qr1CNs8tbUTbb0cL/fdpB9ursu3smMMGKdkYl8ejo83goBRXZx7N7nsdWsv/gdKqprSPSIHnJjdFCWlK3XDbAQ8tMaH1dXKurz+8WACY46QTUkqBTRK8//DDUchrRizgl1anzV+WgjHaAzePGuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB5277.namprd11.prod.outlook.com (2603:10b6:5:388::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.22; Wed, 12 Jul
 2023 21:57:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 21:57:28 +0000
Date: Wed, 12 Jul 2023 21:56:44 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZK8hnHOlA+ObXfmQ@DUT025-TGLU.fm.intel.com>
References: <20230712163740.7-1-francois.dugast@intel.com>
 <20230712163740.7-3-francois.dugast@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230712163740.7-3-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR11CA0108.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::49) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB5277:EE_
X-MS-Office365-Filtering-Correlation-Id: 88ff3fa8-7c7a-48b6-8c81-08db8322fbd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X7CrEAPUaBrWNTSqVkaxrAQ/LV/JpyeId90gQHpuPFkY9tQK8zAzy+CDl9U2EEMSeyCxdrVjaV4ldICOc98gmlVMOZPKFCWB/LZryMqO/R5ioYgBVT/vChQyMbyEUCkKs5EauxXmC58Mq/hfxKjNTm9EuijiitBCn/DGl2oB284jEJAyYwYvO0pUMdHYhfETwZb9UQv4hosPVBmplnuVJBXEsSKzVukUxUiQISE+OcXjtLJ7RbM3H1FCNQlF1OxgGrbZ1BmV5rVpok7M0UjgMTGs3+jeiZBUG/n7OyEkfww6Yhr2nA/5KlnDtR3+wPb+i8eBqE/Xtk9pUzudFpKNKkBWLYbJ6zi2/7ia2Ws2dbJ70YD9Elbp8bn8fMhszKlHCxQ9SaKQqrMoHB0tmPoIWZA+/U/VKNKArUPqZ8vvA+39i2SeVti0xwnLo1kDxHzQoTZ5XM+/+ZxmCMnI5SAcxBxLHmy6bHpA0twoVidNxsXz/7rkDDW46XPSjMWb54nLDkzFe/7AZROB9T+QhmTmt6ZayLwYwThfjGPnsrhb/TThEEiclGKcOpNqJzVIqA3ebGi5LDWxNoiiB88flYKciAklRjG34k2p+Qi0RqXgTP1I6+d/4YUEVzapJAc7xeZu32QkE+AWngsrVxnC3XA6qfCeWzZu1NvwIsIW9JhOgfk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199021)(30864003)(2906002)(41300700001)(83380400001)(5660300002)(26005)(6506007)(186003)(44832011)(8936002)(6862004)(8676002)(82960400001)(6486002)(66476007)(66946007)(66556008)(6636002)(4326008)(6666004)(86362001)(478600001)(38100700002)(316002)(6512007)(21314003)(67856001)(579004)(559001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ba78UV9LR1ddnkyzzzKAbQIVfrWhl/WBHg+R5eVH7oMZgE3LAYP8NQVpTR?=
 =?iso-8859-1?Q?Vq3ShmuLyT4M/HC1DV8CAW+vvQJ0VPJ28y9DVBn/13fapJPiGszWQo6GcN?=
 =?iso-8859-1?Q?Eaa6YjtReQTFVXfcc/x+q4MsL/4sOLKSajoS5jO+FRdc696QTXZTwIR8/w?=
 =?iso-8859-1?Q?vVQH7AVxn2x1hqSIvcvosKFFRWOLXhUAJfJtDUmrt0DXzgheJD5yg9cPwP?=
 =?iso-8859-1?Q?Xt96chpE3JL+Z+/pOzJ3Ovp2rw6naGhTH+TP1DcaStgaMfN5olvyZ62/fr?=
 =?iso-8859-1?Q?+/U8IKTP3BnrroEc4dffRv9cE5nX9iaKeljN2wxI3yCVwME44heWYDDZUG?=
 =?iso-8859-1?Q?LINXGQGJQeOGQVB9E0O2+gIRWWMoBZ64ye4iID0CnA3SWMKdYGhksRNG+Y?=
 =?iso-8859-1?Q?uC8dOp2u4QbqMfN4/9k0TlU35/SbyLHyEkRqVcc8DEEJMn2DAayqZr2z91?=
 =?iso-8859-1?Q?Y9WX5csmffV7I9wDW640OAAInY1Z1lJKUP5ZthZsI9JCyiVGywn5gkNFZQ?=
 =?iso-8859-1?Q?KtvkZVrv7lv6WcbhDY++kSch2ZyDgaMVAdtFYX5aVpWOWCQWn26hlk+ZiE?=
 =?iso-8859-1?Q?IDcDAIcWbo+a9pSeHdbO0CduOSadXU9o7aiAI0Dc+WJubW8SAFoQzjy+Q5?=
 =?iso-8859-1?Q?yPJIroRc7ynWX+k91aPT44KBh1JLJXz160bdfCs9/gAgPgsbphrcNLra4m?=
 =?iso-8859-1?Q?/92femOB86RgvYOID0ujvw8n/kl5BnRQv+/lT1ydm78OL7cOUqu7YVOTVe?=
 =?iso-8859-1?Q?lsUJfWZFMHCNcYpmC7y3CjY3Guf6CM6tEaw7qnYNmYHDp1Vx3jP80s9tAi?=
 =?iso-8859-1?Q?Z5EL+MBVt/lOVSnTj4Vj2eJxXB6hnP32hBuoSBeFoPnyfutMR09ViSGCF8?=
 =?iso-8859-1?Q?oXubon3Fl9xBsHKVZ1AId9BzSe3QBfHDMaxbR8iCMTGo3I1WvXUggQlNm5?=
 =?iso-8859-1?Q?rBFM5A91XzFSgGz0VrGNvzQ6WFSmeLX8BtHOd57F6I0QJrvimw68jMEvy2?=
 =?iso-8859-1?Q?MnBOnVe90qp95CXyvKzV0CQpQq53zzhIMSXSjz4GCQcCPzbCqFcfnYztg4?=
 =?iso-8859-1?Q?C56TI/pi6fQVicvBBtAKUQuUDjxe6v78IZhI8Cl6Fe3LPW3lZe+kQfWRbx?=
 =?iso-8859-1?Q?INU2Xgh/Jf7VPBVWvdjSwGzlIbLN1DmibAUJwgD1S2LL7JtKOtCvn0TZoZ?=
 =?iso-8859-1?Q?Bio2/LvIvw/uNRywQqdp7C52rdY/CJxYkp1fnm+Z/3dWoZ3JlFTGnGvNuw?=
 =?iso-8859-1?Q?irzMBBk9LMffIY274uSimM19FlHBjn8743NzHHpDfMsciC4grnjGAOCEh4?=
 =?iso-8859-1?Q?It2f91U66UuVkDmRFGrlhmPEoQyncapzlI/hvrKrIgqrrpSDTPI2WmkoGG?=
 =?iso-8859-1?Q?Zih1m2NP+qYTRhYaiTv/mcfHcwwZWO+KeVdr40TScex5Q30Vs92i8ktfmf?=
 =?iso-8859-1?Q?36dJZ03QwnNkc742lw2WTEdUJ9fmjWZW8XHYPWtV9cD5TMC1hfBBG0LfT4?=
 =?iso-8859-1?Q?GKyalfv4XiclCws0VeYXCo2WO4Ts8ehsc/Ma9MnS2wUbi4ZpgRsxfz91IX?=
 =?iso-8859-1?Q?s3rPMZgDFrgEXN34Ikwcx4dTMg3IGeyal3ssohorI6G12sPJLqCcgKKIDm?=
 =?iso-8859-1?Q?gM2peB4F9pNCKAziRmoz+CnfvUTzyzhl9kMlI4uUiYlmPP4Tbd+PweAA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88ff3fa8-7c7a-48b6-8c81-08db8322fbd0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 21:57:28.1959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Beu+rXzliirSEYYSD98DQRBWAHRsLIfCDx8A5zZ3Jm5YPqD/uCIURHMPBaaKLQp4PB4pFxQEJthScFpZR5XGbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5277
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: switch to using drm_exec
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
Cc: intel-xe@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jul 12, 2023 at 04:37:40PM +0000, Francois Dugast wrote:
> Replace the use of ttm_execbuf_util helpers with the drm_exec helpers.
> 

Hmm, I noticed a problem and I believe it was my suggestion, my mistake.

The xe_bo_lock/xe_vm_lock functions previously could only fail if the
user interrupted the call so we only had to check the return of this
functions in user call paths. This is no longer the case as I believe
drm exec does a malloc on the lock. We probably just need to call the
dma-resv locking functions directly in the aformentioned functions.

> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c |   7 +-
>  drivers/gpu/drm/xe/Kconfig                   |   1 +
>  drivers/gpu/drm/xe/tests/xe_bo.c             |  26 +-
>  drivers/gpu/drm/xe/tests/xe_migrate.c        |   6 +-
>  drivers/gpu/drm/xe/xe_bo.c                   |  41 +--
>  drivers/gpu/drm/xe/xe_bo.h                   |   6 +-
>  drivers/gpu/drm/xe/xe_bo_evict.c             |  24 +-
>  drivers/gpu/drm/xe/xe_bo_types.h             |   1 -
>  drivers/gpu/drm/xe/xe_engine.c               |   7 +-
>  drivers/gpu/drm/xe/xe_exec.c                 |  30 +-
>  drivers/gpu/drm/xe/xe_gt_pagefault.c         |  55 +---
>  drivers/gpu/drm/xe/xe_lrc.c                  |   8 +-
>  drivers/gpu/drm/xe/xe_migrate.c              |  13 +-
>  drivers/gpu/drm/xe/xe_vm.c                   | 292 +++++++++----------
>  drivers/gpu/drm/xe/xe_vm.h                   |  32 +-
>  drivers/gpu/drm/xe/xe_vm_madvise.c           |  37 +--
>  16 files changed, 264 insertions(+), 322 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 9087ca723f1b..8397a29c8409 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -38,6 +38,7 @@
>  #include <drm/drm_atomic_uapi.h>
>  #include <drm/drm_damage_helper.h>
>  #include <drm/drm_edid.h>
> +#include <drm/drm_exec.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_rect.h>
> @@ -6939,11 +6940,11 @@ static int i915_gem_object_read_from_page(struct xe_bo *bo,
>  	void *virtual;
>  	bool is_iomem;
>  	int ret;
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>  
>  	XE_BUG_ON(size != 8);
>  
> -	ret = xe_bo_lock(bo, &ww, 0, true);
> +	ret = xe_bo_lock(bo, &exec, 0, true);
>  	if (ret)
>  		return ret;
>  
> @@ -6960,7 +6961,7 @@ static int i915_gem_object_read_from_page(struct xe_bo *bo,
>  
>  	ttm_bo_kunmap(&map);
>  out_unlock:
> -	xe_bo_unlock(bo, &ww);
> +	xe_bo_unlock(bo, &exec);
>  	return ret;
>  }
>  #endif
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index d44794f99338..b739faa401d3 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -8,6 +8,7 @@ config DRM_XE
>  	select SHMEM
>  	select TMPFS
>  	select DRM_BUDDY
> +	select DRM_EXEC
>  	select DRM_KMS_HELPER
>  	select DRM_PANEL
>  	select DRM_SUBALLOC_HELPER
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> index 5309204d8d1b..153da2a0270c 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -175,17 +175,17 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
>  	unsigned int bo_flags = XE_BO_CREATE_USER_BIT |
>  		XE_BO_CREATE_VRAM_IF_DGFX(gt_to_tile(gt));
>  	struct xe_vm *vm = xe_migrate_get_vm(xe_device_get_root_tile(xe)->migrate);
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>  	int err, i;
>  
>  	kunit_info(test, "Testing device %s gt id %u vram id %u\n",
>  		   dev_name(xe->drm.dev), gt->info.id, gt_to_tile(gt)->id);
>  
>  	for (i = 0; i < 2; ++i) {
> -		xe_vm_lock(vm, &ww, 0, false);
> +		xe_vm_lock(vm, &exec, 0, false);
>  		bo = xe_bo_create(xe, NULL, vm, 0x10000, ttm_bo_type_device,
>  				  bo_flags);
> -		xe_vm_unlock(vm, &ww);
> +		xe_vm_unlock(vm, &exec);
>  		if (IS_ERR(bo)) {
>  			KUNIT_FAIL(test, "bo create err=%pe\n", bo);
>  			break;
> @@ -198,9 +198,9 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
>  			goto cleanup_bo;
>  		}
>  
> -		xe_bo_lock(external, &ww, 0, false);
> +		xe_bo_lock(external, &exec, 0, false);
>  		err = xe_bo_pin_external(external);
> -		xe_bo_unlock(external, &ww);
> +		xe_bo_unlock(external, &exec);
>  		if (err) {
>  			KUNIT_FAIL(test, "external bo pin err=%pe\n",
>  				   ERR_PTR(err));
> @@ -240,18 +240,18 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
>  
>  		if (i) {
>  			down_read(&vm->lock);
> -			xe_vm_lock(vm, &ww, 0, false);
> +			xe_vm_lock(vm, &exec, 0, false);
>  			err = xe_bo_validate(bo, bo->vm, false);
> -			xe_vm_unlock(vm, &ww);
> +			xe_vm_unlock(vm, &exec);
>  			up_read(&vm->lock);
>  			if (err) {
>  				KUNIT_FAIL(test, "bo valid err=%pe\n",
>  					   ERR_PTR(err));
>  				goto cleanup_all;
>  			}
> -			xe_bo_lock(external, &ww, 0, false);
> +			xe_bo_lock(external, &exec, 0, false);
>  			err = xe_bo_validate(external, NULL, false);
> -			xe_bo_unlock(external, &ww);
> +			xe_bo_unlock(external, &exec);
>  			if (err) {
>  				KUNIT_FAIL(test, "external bo valid err=%pe\n",
>  					   ERR_PTR(err));
> @@ -259,18 +259,18 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
>  			}
>  		}
>  
> -		xe_bo_lock(external, &ww, 0, false);
> +		xe_bo_lock(external, &exec, 0, false);
>  		xe_bo_unpin_external(external);
> -		xe_bo_unlock(external, &ww);
> +		xe_bo_unlock(external, &exec);
>  
>  		xe_bo_put(external);
>  		xe_bo_put(bo);
>  		continue;
>  
>  cleanup_all:
> -		xe_bo_lock(external, &ww, 0, false);
> +		xe_bo_lock(external, &exec, 0, false);
>  		xe_bo_unpin_external(external);
> -		xe_bo_unlock(external, &ww);
> +		xe_bo_unlock(external, &exec);
>  cleanup_external:
>  		xe_bo_put(external);
>  cleanup_bo:
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index aedfb3dd559e..377374ab63e4 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -395,14 +395,14 @@ static int migrate_test_run_device(struct xe_device *xe)
>  
>  	for_each_tile(tile, xe, id) {
>  		struct xe_migrate *m = tile->migrate;
> -		struct ww_acquire_ctx ww;
> +		struct drm_exec exec;
>  
>  		kunit_info(test, "Testing tile id %d.\n", id);
> -		xe_vm_lock(m->eng->vm, &ww, 0, true);
> +		xe_vm_lock(m->eng->vm, &exec, 0, true);
>  		xe_device_mem_access_get(xe);
>  		xe_migrate_sanity_test(m, test);
>  		xe_device_mem_access_put(xe);
> -		xe_vm_unlock(m->eng->vm, &ww);
> +		xe_vm_unlock(m->eng->vm, &exec);
>  	}
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 6353afa8d846..e212a3e997b6 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -8,6 +8,7 @@
>  #include <linux/dma-buf.h>
>  
>  #include <drm/drm_drv.h>
> +#include <drm/drm_exec.h>
>  #include <drm/drm_gem_ttm_helper.h>
>  #include <drm/ttm/ttm_device.h>
>  #include <drm/ttm/ttm_placement.h>
> @@ -1038,13 +1039,13 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
>  	struct xe_bo *bo = gem_to_xe_bo(obj);
>  
>  	if (bo->vm && !xe_vm_in_fault_mode(bo->vm)) {
> -		struct ww_acquire_ctx ww;
> +		struct drm_exec exec;
>  
>  		XE_WARN_ON(!xe_bo_is_user(bo));
>  
> -		xe_bo_lock(bo, &ww, 0, false);
> +		xe_bo_lock(bo, &exec, 0, false);
>  		ttm_bo_set_bulk_move(&bo->ttm, NULL);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo, &exec);
>  	}
>  }
>  
> @@ -1707,7 +1708,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>  	struct xe_device *xe = to_xe_device(dev);
>  	struct xe_file *xef = to_xe_file(file);
>  	struct drm_xe_gem_create *args = data;
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>  	struct xe_vm *vm = NULL;
>  	struct xe_bo *bo;
>  	unsigned bo_flags = XE_BO_CREATE_USER_BIT;
> @@ -1744,7 +1745,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>  		vm = xe_vm_lookup(xef, args->vm_id);
>  		if (XE_IOCTL_ERR(xe, !vm))
>  			return -ENOENT;
> -		err = xe_vm_lock(vm, &ww, 0, true);
> +		err = xe_vm_lock(vm, &exec, 0, true);
>  		if (err) {
>  			xe_vm_put(vm);
>  			return err;
> @@ -1761,7 +1762,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>  	bo = xe_bo_create(xe, NULL, vm, args->size, ttm_bo_type_device,
>  			  bo_flags);
>  	if (vm) {
> -		xe_vm_unlock(vm, &ww);
> +		xe_vm_unlock(vm, &exec);
>  		xe_vm_put(vm);
>  	}
>  
> @@ -1803,26 +1804,30 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>  	return 0;
>  }
>  
> -int xe_bo_lock(struct xe_bo *bo, struct ww_acquire_ctx *ww,
> +int xe_bo_lock(struct xe_bo *bo, struct drm_exec *exec,
>  	       int num_resv, bool intr)
>  {
> -	struct ttm_validate_buffer tv_bo;
> -	LIST_HEAD(objs);
> -	LIST_HEAD(dups);
> +	int err;
>  
> -	XE_BUG_ON(!ww);
> +	drm_exec_init(exec, intr);
> +	drm_exec_until_all_locked(exec) {
> +		err = drm_exec_prepare_obj(exec, &bo->ttm.base,
> +					   num_resv);
> +		drm_exec_retry_on_contention(exec);
> +		if (err && err != -EALREADY)
> +			goto out_err;
> +	}
>  
> -	tv_bo.num_shared = num_resv;
> -	tv_bo.bo = &bo->ttm;;
> -	list_add_tail(&tv_bo.head, &objs);
> +	return 0;
>  
> -	return ttm_eu_reserve_buffers(ww, &objs, intr, &dups);
> +out_err:
> +	drm_exec_fini(exec);
> +	return err;
>  }
>  
> -void xe_bo_unlock(struct xe_bo *bo, struct ww_acquire_ctx *ww)
> +void xe_bo_unlock(struct xe_bo *bo, struct drm_exec *exec)
>  {
> -	dma_resv_unlock(bo->ttm.base.resv);
> -	ww_acquire_fini(ww);
> +	drm_exec_fini(exec);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 08ca1d06bf77..171cb97fe006 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -74,6 +74,7 @@
>  
>  #define XE_BO_PROPS_INVALID	(-1)
>  
> +struct drm_exec;
>  struct sg_table;
>  
>  struct xe_bo *xe_bo_alloc(void);
> @@ -141,10 +142,9 @@ static inline void xe_bo_assert_held(struct xe_bo *bo)
>  		dma_resv_assert_held((bo)->ttm.base.resv);
>  }
>  
> -int xe_bo_lock(struct xe_bo *bo, struct ww_acquire_ctx *ww,
> +int xe_bo_lock(struct xe_bo *bo, struct drm_exec *exec,
>  	       int num_resv, bool intr);
> -
> -void xe_bo_unlock(struct xe_bo *bo, struct ww_acquire_ctx *ww);
> +void xe_bo_unlock(struct xe_bo *bo, struct drm_exec *exec);
>  
>  static inline void xe_bo_unlock_vm_held(struct xe_bo *bo)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
> index f559a7f3eb3e..973439aeb2b1 100644
> --- a/drivers/gpu/drm/xe/xe_bo_evict.c
> +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
> @@ -3,6 +3,8 @@
>   * Copyright © 2022 Intel Corporation
>   */
>  
> +#include <drm/drm_exec.h>
> +
>  #include "xe_bo_evict.h"
>  
>  #include "xe_bo.h"
> @@ -27,7 +29,7 @@
>  int xe_bo_evict_all(struct xe_device *xe)
>  {
>  	struct ttm_device *bdev = &xe->ttm;
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>  	struct xe_bo *bo;
>  	struct xe_tile *tile;
>  	struct list_head still_in_list;
> @@ -62,9 +64,9 @@ int xe_bo_evict_all(struct xe_device *xe)
>  		list_move_tail(&bo->pinned_link, &still_in_list);
>  		spin_unlock(&xe->pinned.lock);
>  
> -		xe_bo_lock(bo, &ww, 0, false);
> +		xe_bo_lock(bo, &exec, 0, false);
>  		ret = xe_bo_evict_pinned(bo);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo, &exec);
>  		xe_bo_put(bo);
>  		if (ret) {
>  			spin_lock(&xe->pinned.lock);
> @@ -96,9 +98,9 @@ int xe_bo_evict_all(struct xe_device *xe)
>  		list_move_tail(&bo->pinned_link, &xe->pinned.evicted);
>  		spin_unlock(&xe->pinned.lock);
>  
> -		xe_bo_lock(bo, &ww, 0, false);
> +		xe_bo_lock(bo, &exec, 0, false);
>  		ret = xe_bo_evict_pinned(bo);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo, &exec);
>  		xe_bo_put(bo);
>  		if (ret)
>  			return ret;
> @@ -123,7 +125,7 @@ int xe_bo_evict_all(struct xe_device *xe)
>   */
>  int xe_bo_restore_kernel(struct xe_device *xe)
>  {
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>  	struct xe_bo *bo;
>  	int ret;
>  
> @@ -140,9 +142,9 @@ int xe_bo_restore_kernel(struct xe_device *xe)
>  		list_move_tail(&bo->pinned_link, &xe->pinned.kernel_bo_present);
>  		spin_unlock(&xe->pinned.lock);
>  
> -		xe_bo_lock(bo, &ww, 0, false);
> +		xe_bo_lock(bo, &exec, 0, false);
>  		ret = xe_bo_restore_pinned(bo);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo, &exec);
>  		if (ret) {
>  			xe_bo_put(bo);
>  			return ret;
> @@ -184,7 +186,7 @@ int xe_bo_restore_kernel(struct xe_device *xe)
>   */
>  int xe_bo_restore_user(struct xe_device *xe)
>  {
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>  	struct xe_bo *bo;
>  	struct xe_tile *tile;
>  	struct list_head still_in_list;
> @@ -206,9 +208,9 @@ int xe_bo_restore_user(struct xe_device *xe)
>  		xe_bo_get(bo);
>  		spin_unlock(&xe->pinned.lock);
>  
> -		xe_bo_lock(bo, &ww, 0, false);
> +		xe_bo_lock(bo, &exec, 0, false);
>  		ret = xe_bo_restore_pinned(bo);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo, &exec);
>  		xe_bo_put(bo);
>  		if (ret) {
>  			spin_lock(&xe->pinned.lock);
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index f6ee920303af..bc67263c6713 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -11,7 +11,6 @@
>  #include <drm/drm_mm.h>
>  #include <drm/ttm/ttm_bo.h>
>  #include <drm/ttm/ttm_device.h>
> -#include <drm/ttm/ttm_execbuf_util.h>
>  #include <drm/ttm/ttm_placement.h>
>  
>  struct xe_device;
> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> index 3831c5f82773..2e0d447b0a21 100644
> --- a/drivers/gpu/drm/xe/xe_engine.c
> +++ b/drivers/gpu/drm/xe/xe_engine.c
> @@ -8,6 +8,7 @@
>  #include <linux/nospec.h>
>  
>  #include <drm/drm_device.h>
> +#include <drm/drm_exec.h>
>  #include <drm/drm_file.h>
>  #include <drm/xe_drm.h>
>  
> @@ -89,18 +90,18 @@ struct xe_engine *xe_engine_create(struct xe_device *xe, struct xe_vm *vm,
>  				   u32 logical_mask, u16 width,
>  				   struct xe_hw_engine *hwe, u32 flags)
>  {
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>  	struct xe_engine *e;
>  	int err;
>  
>  	if (vm) {
> -		err = xe_vm_lock(vm, &ww, 0, true);
> +		err = xe_vm_lock(vm, &exec, 0, true);
>  		if (err)
>  			return ERR_PTR(err);
>  	}
>  	e = __xe_engine_create(xe, vm, logical_mask, width, hwe, flags);
>  	if (vm)
> -		xe_vm_unlock(vm, &ww);
> +		xe_vm_unlock(vm, &exec);
>  
>  	return e;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index ba13d20ed348..32a6e16ec177 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -6,6 +6,7 @@
>  #include "xe_exec.h"
>  
>  #include <drm/drm_device.h>
> +#include <drm/drm_exec.h>
>  #include <drm/drm_file.h>
>  #include <drm/xe_drm.h>
>  #include <linux/delay.h>
> @@ -95,23 +96,18 @@
>  
>  #define XE_EXEC_BIND_RETRY_TIMEOUT_MS 1000
>  
> -static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
> -			 struct ttm_validate_buffer tv_onstack[],
> -			 struct ttm_validate_buffer **tv,
> -			 struct list_head *objs)
> +static int xe_exec_begin(struct xe_engine *e, struct drm_exec *exec)
>  {
>  	struct xe_vm *vm = e->vm;
>  	struct xe_vma *vma;
> -	LIST_HEAD(dups);
>  	ktime_t end = 0;
>  	int err = 0;
>  
> -	*tv = NULL;
>  	if (xe_vm_no_dma_fences(e->vm))
>  		return 0;
>  
>  retry:
> -	err = xe_vm_lock_dma_resv(vm, ww, tv_onstack, tv, objs, true, 1);
> +	err = xe_vm_lock_dma_resv(vm, exec, true, 1);
>  	if (err)
>  		return err;
>  
> @@ -128,8 +124,7 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
>  
>  		err = xe_bo_validate(xe_vma_bo(vma), vm, false);
>  		if (err) {
> -			xe_vm_unlock_dma_resv(vm, tv_onstack, *tv, ww, objs);
> -			*tv = NULL;
> +			xe_vm_unlock_dma_resv(vm, exec);
>  			break;
>  		}
>  	}
> @@ -153,14 +148,10 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
>  	return err;
>  }
>  
> -static void xe_exec_end(struct xe_engine *e,
> -			struct ttm_validate_buffer *tv_onstack,
> -			struct ttm_validate_buffer *tv,
> -			struct ww_acquire_ctx *ww,
> -			struct list_head *objs)
> +static void xe_exec_end(struct xe_engine *e, struct drm_exec *exec)
>  {
>  	if (!xe_vm_no_dma_fences(e->vm))
> -		xe_vm_unlock_dma_resv(e->vm, tv_onstack, tv, ww, objs);
> +		xe_vm_unlock_dma_resv(e->vm, exec);
>  }
>  
>  int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> @@ -173,14 +164,11 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	struct xe_engine *engine;
>  	struct xe_sync_entry *syncs = NULL;
>  	u64 addresses[XE_HW_ENGINE_MAX_INSTANCE];
> -	struct ttm_validate_buffer tv_onstack[XE_ONSTACK_TV];
> -	struct ttm_validate_buffer *tv = NULL;
>  	u32 i, num_syncs = 0;
>  	struct xe_sched_job *job;
>  	struct dma_fence *rebind_fence;
>  	struct xe_vm *vm;
> -	struct ww_acquire_ctx ww;
> -	struct list_head objs;
> +	struct drm_exec exec;
>  	bool write_locked;
>  	int err = 0;
>  
> @@ -293,7 +281,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  			goto err_unlock_list;
>  	}
>  
> -	err = xe_exec_begin(engine, &ww, tv_onstack, &tv, &objs);
> +	err = xe_exec_begin(engine, &exec);
>  	if (err)
>  		goto err_unlock_list;
>  
> @@ -412,7 +400,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	if (err)
>  		xe_sched_job_put(job);
>  err_engine_end:
> -	xe_exec_end(engine, tv_onstack, tv, &ww, &objs);
> +	xe_exec_end(engine, &exec);
>  err_unlock_list:
>  	if (write_locked)
>  		up_write(&vm->lock);
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 125e4744fa38..94f59c29ba9b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -8,8 +8,8 @@
>  #include <linux/bitfield.h>
>  #include <linux/circ_buf.h>
>  
> +#include <drm/drm_exec.h>
>  #include <drm/drm_managed.h>
> -#include <drm/ttm/ttm_execbuf_util.h>
>  
>  #include "xe_bo.h"
>  #include "xe_gt.h"
> @@ -84,11 +84,6 @@ static bool vma_matches(struct xe_vma *vma, u64 page_addr)
>  	return true;
>  }
>  
> -static bool only_needs_bo_lock(struct xe_bo *bo)
> -{
> -	return bo && bo->vm;
> -}
> -
>  static struct xe_vma *lookup_vma(struct xe_vm *vm, u64 page_addr)
>  {
>  	struct xe_vma *vma = NULL;
> @@ -110,10 +105,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  	struct xe_vm *vm;
>  	struct xe_vma *vma = NULL;
>  	struct xe_bo *bo;
> -	LIST_HEAD(objs);
> -	LIST_HEAD(dups);
> -	struct ttm_validate_buffer tv_bo, tv_vm;
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>  	struct dma_fence *fence;
>  	bool write_locked;
>  	int ret = 0;
> @@ -171,20 +163,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  
>  	/* Lock VM and BOs dma-resv */
>  	bo = xe_vma_bo(vma);
> -	if (only_needs_bo_lock(bo)) {
> -		/* This path ensures the BO's LRU is updated */
> -		ret = xe_bo_lock(bo, &ww, xe->info.tile_count, false);
> -	} else {
> -		tv_vm.num_shared = xe->info.tile_count;
> -		tv_vm.bo = xe_vm_ttm_bo(vm);
> -		list_add(&tv_vm.head, &objs);
> -		if (bo) {
> -			tv_bo.bo = &bo->ttm;
> -			tv_bo.num_shared = xe->info.tile_count;
> -			list_add(&tv_bo.head, &objs);
> -		}
> -		ret = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
> -	}
> +	ret = xe_vm_bo_lock(vm, bo, &exec, xe->info.tile_count, false);
>  	if (ret)
>  		goto unlock_vm;
>  
> @@ -227,10 +206,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  	vma->usm.tile_invalidated &= ~BIT(gt_to_tile(gt)->id);
>  
>  unlock_dma_resv:
> -	if (only_needs_bo_lock(bo))
> -		xe_bo_unlock(bo, &ww);
> -	else
> -		ttm_eu_backoff_reservation(&ww, &objs);
> +	xe_vm_bo_unlock(vm, bo, &exec, true);
>  unlock_vm:
>  	if (!ret)
>  		vm->usm.last_fault_vma = vma;
> @@ -498,10 +474,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
>  	struct xe_vm *vm;
>  	struct xe_vma *vma;
>  	struct xe_bo *bo;
> -	LIST_HEAD(objs);
> -	LIST_HEAD(dups);
> -	struct ttm_validate_buffer tv_bo, tv_vm;
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>  	int ret = 0;
>  
>  	/* We only support ACC_TRIGGER at the moment */
> @@ -534,28 +507,14 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
>  
>  	/* Lock VM and BOs dma-resv */
>  	bo = xe_vma_bo(vma);
> -	if (only_needs_bo_lock(bo)) {
> -		/* This path ensures the BO's LRU is updated */
> -		ret = xe_bo_lock(bo, &ww, xe->info.tile_count, false);
> -	} else {
> -		tv_vm.num_shared = xe->info.tile_count;
> -		tv_vm.bo = xe_vm_ttm_bo(vm);
> -		list_add(&tv_vm.head, &objs);
> -		tv_bo.bo = &bo->ttm;
> -		tv_bo.num_shared = xe->info.tile_count;
> -		list_add(&tv_bo.head, &objs);
> -		ret = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
> -	}
> +	ret = xe_vm_bo_lock(vm, bo, &exec, xe->info.tile_count, false);
>  	if (ret)
>  		goto unlock_vm;
>  
>  	/* Migrate to VRAM, move should invalidate the VMA first */
>  	ret = xe_bo_migrate(bo, XE_PL_VRAM0 + tile->id);
>  
> -	if (only_needs_bo_lock(bo))
> -		xe_bo_unlock(bo, &ww);
> -	else
> -		ttm_eu_backoff_reservation(&ww, &objs);
> +	xe_vm_bo_unlock(vm, bo, &exec, true);
>  unlock_vm:
>  	up_read(&vm->lock);
>  	xe_vm_put(vm);
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 8f25a38f36a5..0386a290b067 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -3,6 +3,8 @@
>   * Copyright © 2021 Intel Corporation
>   */
>  
> +#include <drm/drm_exec.h>
> +
>  #include "xe_lrc.h"
>  
>  #include "regs/xe_engine_regs.h"
> @@ -709,16 +711,16 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  
>  void xe_lrc_finish(struct xe_lrc *lrc)
>  {
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>  
>  	xe_hw_fence_ctx_finish(&lrc->fence_ctx);
>  	if (lrc->bo->vm)
> -		xe_vm_lock(lrc->bo->vm, &ww, 0, false);
> +		xe_vm_lock(lrc->bo->vm, &exec, 0, false);
>  	else
>  		xe_bo_lock_no_vm(lrc->bo, NULL);
>  	xe_bo_unpin(lrc->bo);
>  	if (lrc->bo->vm)
> -		xe_vm_unlock(lrc->bo->vm, &ww);
> +		xe_vm_unlock(lrc->bo->vm, &exec);
>  	else
>  		xe_bo_unlock_no_vm(lrc->bo);
>  	xe_bo_put(lrc->bo);
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 47addcd3e78f..9b414c36e554 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -8,6 +8,7 @@
>  #include <linux/bitfield.h>
>  #include <linux/sizes.h>
>  
> +#include <drm/drm_exec.h>
>  #include <drm/drm_managed.h>
>  #include <drm/ttm/ttm_tt.h>
>  #include <drm/xe_drm.h>
> @@ -86,13 +87,13 @@ struct xe_engine *xe_tile_migrate_engine(struct xe_tile *tile)
>  static void xe_migrate_fini(struct drm_device *dev, void *arg)
>  {
>  	struct xe_migrate *m = arg;
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>  
> -	xe_vm_lock(m->eng->vm, &ww, 0, false);
> +	xe_vm_lock(m->eng->vm, &exec, 0, false);
>  	xe_bo_unpin(m->pt_bo);
>  	if (m->cleared_bo)
>  		xe_bo_unpin(m->cleared_bo);
> -	xe_vm_unlock(m->eng->vm, &ww);
> +	xe_vm_unlock(m->eng->vm, &exec);
>  
>  	dma_fence_put(m->fence);
>  	if (m->cleared_bo)
> @@ -316,7 +317,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  	struct xe_gt *primary_gt = tile->primary_gt;
>  	struct xe_migrate *m;
>  	struct xe_vm *vm;
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>  	int err;
>  
>  	m = drmm_kzalloc(&xe->drm, sizeof(*m), GFP_KERNEL);
> @@ -331,9 +332,9 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  	if (IS_ERR(vm))
>  		return ERR_CAST(vm);
>  
> -	xe_vm_lock(vm, &ww, 0, false);
> +	xe_vm_lock(vm, &exec, 0, false);
>  	err = xe_migrate_prepare_vm(tile, m, vm);
> -	xe_vm_unlock(vm, &ww);
> +	xe_vm_unlock(vm, &exec);
>  	if (err) {
>  		xe_vm_close_and_put(vm);
>  		return ERR_PTR(err);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 6c216350084b..589e9510840a 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -7,8 +7,8 @@
>  
>  #include <linux/dma-fence-array.h>
>  
> +#include <drm/drm_exec.h>
>  #include <drm/drm_print.h>
> -#include <drm/ttm/ttm_execbuf_util.h>
>  #include <drm/ttm/ttm_tt.h>
>  #include <drm/xe_drm.h>
>  #include <linux/delay.h>
> @@ -265,10 +265,10 @@ static void arm_preempt_fences(struct xe_vm *vm, struct list_head *list)
>  static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
>  {
>  	struct xe_engine *e;
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>  	int err;
>  
> -	err = xe_bo_lock(bo, &ww, vm->preempt.num_engines, true);
> +	err = xe_bo_lock(bo, &exec, vm->preempt.num_engines, true);
>  	if (err)
>  		return err;
>  
> @@ -279,7 +279,7 @@ static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
>  					   DMA_RESV_USAGE_BOOKKEEP);
>  		}
>  
> -	xe_bo_unlock(bo, &ww);
> +	xe_bo_unlock(bo, &exec);
>  	return 0;
>  }
>  
> @@ -321,11 +321,8 @@ static void resume_and_reinstall_preempt_fences(struct xe_vm *vm)
>  
>  int xe_vm_add_compute_engine(struct xe_vm *vm, struct xe_engine *e)
>  {
> -	struct ttm_validate_buffer tv_onstack[XE_ONSTACK_TV];
> -	struct ttm_validate_buffer *tv;
> -	struct ww_acquire_ctx ww;
> -	struct list_head objs;
>  	struct dma_fence *pfence;
> +	struct drm_exec exec;
>  	int err;
>  	bool wait;
>  
> @@ -333,7 +330,7 @@ int xe_vm_add_compute_engine(struct xe_vm *vm, struct xe_engine *e)
>  
>  	down_write(&vm->lock);
>  
> -	err = xe_vm_lock_dma_resv(vm, &ww, tv_onstack, &tv, &objs, true, 1);
> +	err = xe_vm_lock_dma_resv(vm, &exec, true, 1);
>  	if (err)
>  		goto out_unlock_outer;
>  
> @@ -367,7 +364,7 @@ int xe_vm_add_compute_engine(struct xe_vm *vm, struct xe_engine *e)
>  	up_read(&vm->userptr.notifier_lock);
>  
>  out_unlock:
> -	xe_vm_unlock_dma_resv(vm, tv_onstack, tv, &ww, &objs);
> +	xe_vm_unlock_dma_resv(vm, &exec);
>  out_unlock_outer:
>  	up_write(&vm->lock);
>  
> @@ -393,72 +390,56 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
>  		list_empty(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
>  }
>  
> +static struct drm_gem_object *xe_vm_gem(struct xe_vm *vm)
> +{
> +	int idx = vm->flags & XE_VM_FLAG_MIGRATION ?
> +		XE_VM_FLAG_GT_ID(vm->flags) : 0;
> +
> +	/* Safe to use index 0 as all BO in the VM share a single dma-resv lock */
> +	return &vm->pt_root[idx]->bo->ttm.base;
> +}
> +
>  /**
>   * xe_vm_lock_dma_resv() - Lock the vm dma_resv object and the dma_resv
>   * objects of the vm's external buffer objects.
>   * @vm: The vm.
> - * @ww: Pointer to a struct ww_acquire_ctx locking context.
> - * @tv_onstack: Array size XE_ONSTACK_TV of storage for the struct
> - * ttm_validate_buffers used for locking.
> - * @tv: Pointer to a pointer that on output contains the actual storage used.
> - * @objs: List head for the buffer objects locked.
> + * @exec: Pointer to a struct drm_exec execution context.
>   * @intr: Whether to lock interruptible.
>   * @num_shared: Number of dma-fence slots to reserve in the locked objects.
>   *
>   * Locks the vm dma-resv objects and all the dma-resv objects of the
> - * buffer objects on the vm external object list. The TTM utilities require
> - * a list of struct ttm_validate_buffers pointing to the actual buffer
> - * objects to lock. Storage for those struct ttm_validate_buffers should
> - * be provided in @tv_onstack, and is typically reserved on the stack
> - * of the caller. If the size of @tv_onstack isn't sufficient, then
> - * storage will be allocated internally using kvmalloc().
> + * buffer objects on the vm external object list using helpers provided
> + * by drm_exec.
>   *
>   * The function performs deadlock handling internally, and after a
>   * successful return the ww locking transaction should be considered
>   * sealed.
>   *
> - * Return: 0 on success, Negative error code on error. In particular if
> - * @intr is set to true, -EINTR or -ERESTARTSYS may be returned. In case
> - * of error, any locking performed has been reverted.
> + * Return: 0 on success, Negative error code on error.
>   */
> -int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
> -			struct ttm_validate_buffer *tv_onstack,
> -			struct ttm_validate_buffer **tv,
> -			struct list_head *objs,
> -			bool intr,
> -			unsigned int num_shared)
> -{
> -	struct ttm_validate_buffer *tv_vm, *tv_bo;
> +int xe_vm_lock_dma_resv(struct xe_vm *vm, struct drm_exec *exec,
> +			bool intr, unsigned int num_shared)
> +{
>  	struct xe_vma *vma, *next;
> -	LIST_HEAD(dups);
> +	struct drm_gem_object *obj;
>  	int err;
>  
>  	lockdep_assert_held(&vm->lock);
>  
> -	if (vm->extobj.entries < XE_ONSTACK_TV) {
> -		tv_vm = tv_onstack;
> -	} else {
> -		tv_vm = kvmalloc_array(vm->extobj.entries + 1, sizeof(*tv_vm),
> -				       GFP_KERNEL);
> -		if (!tv_vm)
> -			return -ENOMEM;
> -	}
> -	tv_bo = tv_vm + 1;
> -
> -	INIT_LIST_HEAD(objs);
> -	list_for_each_entry(vma, &vm->extobj.list, extobj.link) {
> -		tv_bo->num_shared = num_shared;
> -		tv_bo->bo = &xe_vma_bo(vma)->ttm;
> -
> -		list_add_tail(&tv_bo->head, objs);
> -		tv_bo++;
> +	drm_exec_init(exec, intr);
> +	drm_exec_until_all_locked(exec) {
> +		err = drm_exec_prepare_obj(exec, xe_vm_gem(vm), num_shared);
> +		drm_exec_retry_on_contention(exec);
> +		if (unlikely(err) && err != -EALREADY)
> +			goto out_err;
> +		list_for_each_entry(vma, &vm->extobj.list, extobj.link) {
> +			obj = &xe_vma_bo(vma)->ttm.base;
> +			err = drm_exec_prepare_obj(exec, obj, num_shared);
> +			drm_exec_retry_on_contention(exec);
> +			if (unlikely(err) && err != -EALREADY)
> +				goto out_err;
> +		}
>  	}
> -	tv_vm->num_shared = num_shared;
> -	tv_vm->bo = xe_vm_ttm_bo(vm);
> -	list_add_tail(&tv_vm->head, objs);
> -	err = ttm_eu_reserve_buffers(ww, objs, intr, &dups);
> -	if (err)
> -		goto out_err;
>  
>  	spin_lock(&vm->notifier.list_lock);
>  	list_for_each_entry_safe(vma, next, &vm->notifier.rebind_list,
> @@ -470,14 +451,10 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
>  			list_move_tail(&vma->rebind_link, &vm->rebind_list);
>  	}
>  	spin_unlock(&vm->notifier.list_lock);
> -
> -	*tv = tv_vm;
>  	return 0;
>  
>  out_err:
> -	if (tv_vm != tv_onstack)
> -		kvfree(tv_vm);
> -
> +	drm_exec_fini(exec);
>  	return err;
>  }
>  
> @@ -485,20 +462,16 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
>   * xe_vm_unlock_dma_resv() - Unlock reservation objects locked by
>   * xe_vm_lock_dma_resv()
>   * @vm: The vm.
> - * @tv_onstack: The @tv_onstack array given to xe_vm_lock_dma_resv().
> - * @tv: The value of *@tv given by xe_vm_lock_dma_resv().
> - * @ww: The ww_acquire_context used for locking.
> - * @objs: The list returned from xe_vm_lock_dma_resv().
> + * @exec: The @drm_exec given to xe_vm_lock_dma_resv().
>   *
>   * Unlocks the reservation objects and frees any memory allocated by
>   * xe_vm_lock_dma_resv().
>   */
> -void xe_vm_unlock_dma_resv(struct xe_vm *vm,
> -			   struct ttm_validate_buffer *tv_onstack,
> -			   struct ttm_validate_buffer *tv,
> -			   struct ww_acquire_ctx *ww,
> -			   struct list_head *objs)
> +void xe_vm_unlock_dma_resv(struct xe_vm *vm, struct drm_exec *exec)
>  {
> +	struct drm_gem_object *obj, *skip = xe_vm_gem(vm);
> +	unsigned long index;
> +
>  	/*
>  	 * Nothing should've been able to enter the list while we were locked,
>  	 * since we've held the dma-resvs of all the vm's external objects,
> @@ -507,27 +480,31 @@ void xe_vm_unlock_dma_resv(struct xe_vm *vm,
>  	 */
>  	XE_WARN_ON(!list_empty(&vm->notifier.rebind_list));
>  
> -	ttm_eu_backoff_reservation(ww, objs);
> -	if (tv && tv != tv_onstack)
> -		kvfree(tv);
> +	drm_exec_for_each_locked_object(exec, index, obj) {
> +		struct xe_bo *bo = gem_to_xe_bo(obj);
> +
> +		if (obj != skip)
> +			ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
> +	}
> +	drm_exec_fini(exec);
>  }
>  
>  #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
>  
>  static void xe_vm_kill(struct xe_vm *vm)
>  {
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>  	struct xe_engine *e;
>  
>  	lockdep_assert_held(&vm->lock);
>  
> -	xe_vm_lock(vm, &ww, 0, false);
> +	xe_vm_lock(vm, &exec, 0, false);
>  	vm->flags |= XE_VM_FLAG_BANNED;
>  	trace_xe_vm_kill(vm);
>  
>  	list_for_each_entry(e, &vm->preempt.engines, compute.link)
>  		e->ops->kill(e);
> -	xe_vm_unlock(vm, &ww);
> +	xe_vm_unlock(vm, &exec);
>  
>  	/* TODO: Inform user the VM is banned */
>  }
> @@ -536,10 +513,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
>  {
>  	struct xe_vm *vm = container_of(w, struct xe_vm, preempt.rebind_work);
>  	struct xe_vma *vma;
> -	struct ttm_validate_buffer tv_onstack[XE_ONSTACK_TV];
> -	struct ttm_validate_buffer *tv;
> -	struct ww_acquire_ctx ww;
> -	struct list_head objs;
> +	struct drm_exec exec;
>  	struct dma_fence *rebind_fence;
>  	unsigned int fence_count = 0;
>  	LIST_HEAD(preempt_fences);
> @@ -582,8 +556,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
>  			goto out_unlock_outer;
>  	}
>  
> -	err = xe_vm_lock_dma_resv(vm, &ww, tv_onstack, &tv, &objs,
> -				  false, vm->preempt.num_engines);
> +	err = xe_vm_lock_dma_resv(vm, &exec, false, vm->preempt.num_engines);
>  	if (err)
>  		goto out_unlock_outer;
>  
> @@ -662,7 +635,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
>  	up_read(&vm->userptr.notifier_lock);
>  
>  out_unlock:
> -	xe_vm_unlock_dma_resv(vm, tv_onstack, tv, &ww, &objs);
> +	xe_vm_unlock_dma_resv(vm, &exec);
>  out_unlock_outer:
>  	if (err == -EAGAIN) {
>  		trace_xe_vm_rebind_worker_retry(vm);
> @@ -1014,12 +987,12 @@ bo_has_vm_references_locked(struct xe_bo *bo, struct xe_vm *vm,
>  static bool bo_has_vm_references(struct xe_bo *bo, struct xe_vm *vm,
>  				 struct xe_vma *ignore)
>  {
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>  	bool ret;
>  
> -	xe_bo_lock(bo, &ww, 0, false);
> +	xe_bo_lock(bo, &exec, 0, false);
>  	ret = !!bo_has_vm_references_locked(bo, vm, ignore);
> -	xe_bo_unlock(bo, &ww);
> +	xe_bo_unlock(bo, &exec);
>  
>  	return ret;
>  }
> @@ -1105,27 +1078,17 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>  
>  static void xe_vma_destroy_unlocked(struct xe_vma *vma)
>  {
> -	struct ttm_validate_buffer tv[2];
> -	struct ww_acquire_ctx ww;
> +	struct xe_vm *vm = xe_vma_vm(vma);
>  	struct xe_bo *bo = xe_vma_bo(vma);
> -	LIST_HEAD(objs);
> -	LIST_HEAD(dups);
> +	struct drm_exec exec;
>  	int err;
>  
> -	memset(tv, 0, sizeof(tv));
> -	tv[0].bo = xe_vm_ttm_bo(xe_vma_vm(vma));
> -	list_add(&tv[0].head, &objs);
> -
> -	if (bo) {
> -		tv[1].bo = &xe_bo_get(bo)->ttm;
> -		list_add(&tv[1].head, &objs);
> -	}
> -	err = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
> +	err = xe_vm_bo_lock(vm, xe_bo_get(bo), &exec, 0, false);
>  	XE_WARN_ON(err);
>  
>  	xe_vma_destroy(vma, NULL);
>  
> -	ttm_eu_backoff_reservation(&ww, &objs);
> +	xe_vm_bo_unlock(vm, bo, &exec, false);
>  	if (bo)
>  		xe_bo_put(bo);
>  }
> @@ -1406,7 +1369,7 @@ static void xe_vm_close(struct xe_vm *vm)
>  void xe_vm_close_and_put(struct xe_vm *vm)
>  {
>  	LIST_HEAD(contested);
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>  	struct xe_device *xe = vm->xe;
>  	struct xe_tile *tile;
>  	struct xe_vma *vma, *next_vma;
> @@ -1429,7 +1392,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  	}
>  
>  	down_write(&vm->lock);
> -	xe_vm_lock(vm, &ww, 0, false);
> +	xe_vm_lock(vm, &exec, 0, false);
>  	drm_gpuva_for_each_va_safe(gpuva, next, &vm->mgr) {
>  		vma = gpuva_to_vma(gpuva);
>  
> @@ -1468,7 +1431,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  					      NULL);
>  		}
>  	}
> -	xe_vm_unlock(vm, &ww);
> +	xe_vm_unlock(vm, &exec);
>  
>  	/*
>  	 * VM is now dead, cannot re-add nodes to vm->vmas if it's NULL
> @@ -1502,7 +1465,7 @@ static void vm_destroy_work_func(struct work_struct *w)
>  {
>  	struct xe_vm *vm =
>  		container_of(w, struct xe_vm, destroy_work);
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>  	struct xe_device *xe = vm->xe;
>  	struct xe_tile *tile;
>  	u8 id;
> @@ -1528,14 +1491,14 @@ static void vm_destroy_work_func(struct work_struct *w)
>  	 * is needed for xe_vm_lock to work. If we remove that dependency this
>  	 * can be moved to xe_vm_close_and_put.
>  	 */
> -	xe_vm_lock(vm, &ww, 0, false);
> +	xe_vm_lock(vm, &exec, 0, false);
>  	for_each_tile(tile, xe, id) {
>  		if (vm->pt_root[id]) {
>  			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
>  			vm->pt_root[id] = NULL;
>  		}
>  	}
> -	xe_vm_unlock(vm, &ww);
> +	xe_vm_unlock(vm, &exec);
>  
>  	trace_xe_vm_free(vm);
>  	dma_fence_put(vm->rebind_fence);
> @@ -2125,21 +2088,6 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
>  
>  #define VM_BIND_OP(op)	(op & 0xffff)
>  
> -struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm)
> -{
> -	int idx = vm->flags & XE_VM_FLAG_MIGRATION ?
> -		XE_VM_FLAG_GT_ID(vm->flags) : 0;
> -
> -	/* Safe to use index 0 as all BO in the VM share a single dma-resv lock */
> -	return &vm->pt_root[idx]->bo->ttm;
> -}
> -
> -static void xe_vm_tv_populate(struct xe_vm *vm, struct ttm_validate_buffer *tv)
> -{
> -	tv->num_shared = 1;
> -	tv->bo = xe_vm_ttm_bo(vm);
> -}
> -
>  static void vm_set_async_error(struct xe_vm *vm, int err)
>  {
>  	lockdep_assert_held(&vm->lock);
> @@ -2250,7 +2198,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  			 u32 operation, u64 tile_mask, u32 region)
>  {
>  	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>  	struct drm_gpuva_ops *ops;
>  	struct drm_gpuva_op *__op;
>  	struct xe_vma_op *op;
> @@ -2308,11 +2256,11 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  	case XE_VM_BIND_OP_UNMAP_ALL:
>  		XE_BUG_ON(!bo);
>  
> -		err = xe_bo_lock(bo, &ww, 0, true);
> +		err = xe_bo_lock(bo, &exec, 0, true);
>  		if (err)
>  			return ERR_PTR(err);
>  		ops = drm_gpuva_gem_unmap_ops_create(&vm->mgr, obj);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo, &exec);
>  		if (IS_ERR(ops))
>  			return ops;
>  
> @@ -2348,13 +2296,13 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>  {
>  	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
>  	struct xe_vma *vma;
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>  	int err;
>  
>  	lockdep_assert_held_write(&vm->lock);
>  
>  	if (bo) {
> -		err = xe_bo_lock(bo, &ww, 0, true);
> +		err = xe_bo_lock(bo, &exec, 0, true);
>  		if (err)
>  			return ERR_PTR(err);
>  	}
> @@ -2363,7 +2311,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>  			    op->va.range - 1, read_only, is_null,
>  			    tile_mask);
>  	if (bo)
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo, &exec);
>  
>  	if (xe_vma_is_userptr(vma)) {
>  		err = xe_vma_userptr_pin_pages(vma);
> @@ -2577,17 +2525,12 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
>  static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
>  			       struct xe_vma_op *op)
>  {
> -	LIST_HEAD(objs);
> -	LIST_HEAD(dups);
> -	struct ttm_validate_buffer tv_bo, tv_vm;
> -	struct ww_acquire_ctx ww;
>  	struct xe_bo *vbo;
> +	struct drm_exec exec;
>  	int err;
>  
>  	lockdep_assert_held_write(&vm->lock);
>  
> -	xe_vm_tv_populate(vm, &tv_vm);
> -	list_add_tail(&tv_vm.head, &objs);
>  	vbo = xe_vma_bo(vma);
>  	if (vbo) {
>  		/*
> @@ -2596,16 +2539,10 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
>  		 * take a reference here.
>  		 */
>  		xe_bo_get(vbo);
> -
> -		if (!vbo->vm) {
> -			tv_bo.bo = &vbo->ttm;
> -			tv_bo.num_shared = 1;
> -			list_add(&tv_bo.head, &objs);
> -		}
>  	}
>  
>  again:
> -	err = ttm_eu_reserve_buffers(&ww, &objs, true, &dups);
> +	err = xe_vm_bo_lock(vm, vbo, &exec, 1, true);
>  	if (err) {
>  		xe_bo_put(vbo);
>  		return err;
> @@ -2687,7 +2624,7 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
>  		XE_BUG_ON("NOT POSSIBLE");
>  	}
>  
> -	ttm_eu_backoff_reservation(&ww, &objs);
> +	xe_vm_bo_unlock(vm, vbo, &exec, false);
>  	if (err == -EAGAIN && xe_vma_is_userptr(vma)) {
>  		lockdep_assert_held_write(&vm->lock);
>  		err = xe_vma_userptr_pin_pages(vma);
> @@ -3342,28 +3279,83 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   * XXX: Using the TTM wrappers for now, likely can call into dma-resv code
>   * directly to optimize. Also this likely should be an inline function.
>   */
> -int xe_vm_lock(struct xe_vm *vm, struct ww_acquire_ctx *ww,
> +int xe_vm_lock(struct xe_vm *vm, struct drm_exec *exec,
>  	       int num_resv, bool intr)
>  {
> -	struct ttm_validate_buffer tv_vm;
> -	LIST_HEAD(objs);
> -	LIST_HEAD(dups);
> +	struct dma_resv *obj;
> +	struct ww_acquire_ctx *ww = &exec->ticket;
> +	int err;
>  
>  	XE_BUG_ON(!ww);
>  
> -	tv_vm.num_shared = num_resv;
> -	tv_vm.bo = xe_vm_ttm_bo(vm);;
> -	list_add_tail(&tv_vm.head, &objs);
> +	obj = xe_vm_gem(vm)->resv;
> +	ww_acquire_init(ww, &reservation_ww_class);
> +
> +	if (intr)
> +		err = dma_resv_lock_interruptible(obj, ww);
> +	else
> +		err = dma_resv_lock(obj, ww);
> +
> +	if (unlikely(err))
> +		return err;
> +
> +	num_resv = max(num_resv, 1);
> +	err = dma_resv_reserve_fences(obj, num_resv);
> +	if (err)
> +		goto out_err;
> +
> +	return 0;
>  
> -	return ttm_eu_reserve_buffers(ww, &objs, intr, &dups);
> +out_err:
> +	dma_resv_unlock(&vm->resv);
> +	return err;
>  }
>  
> -void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww)
> +void xe_vm_unlock(struct xe_vm *vm, struct drm_exec *exec)
>  {
> +	struct ww_acquire_ctx *ww = &exec->ticket;
> +
>  	dma_resv_unlock(&vm->resv);
>  	ww_acquire_fini(ww);

You'd wanna call drm exec fini but per my comment above, the exec should
go away.

Matt

>  }
>  
> +int xe_vm_bo_lock(struct xe_vm *vm, struct xe_bo *bo, struct drm_exec *exec,
> +		  int num_resv, bool intr)
> +{
> +	int err;
> +
> +	drm_exec_init(exec, intr);
> +	drm_exec_until_all_locked(exec) {
> +		err = drm_exec_prepare_obj(exec, xe_vm_gem(vm),
> +					   num_resv);
> +		drm_exec_retry_on_contention(exec);
> +		if (err && err != -EALREADY)
> +			goto out_err;
> +
> +		if (bo && !bo->vm) {
> +			err = drm_exec_prepare_obj(exec, &bo->ttm.base,
> +						   num_resv);
> +			drm_exec_retry_on_contention(exec);
> +			if (err && err != -EALREADY)
> +				goto out_err;
> +		}
> +	}
> +
> +	return 0;
> +
> +out_err:
> +	drm_exec_fini(exec);
> +	return err;
> +}
> +
> +void xe_vm_bo_unlock(struct xe_vm *vm, struct xe_bo *bo, struct drm_exec *exec,
> +		     bool lru_update)
> +{
> +	if (lru_update && bo && (!bo->vm || xe_vm_no_dma_fences(vm)))
> +		ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
> +	drm_exec_fini(exec);
> +}
> +
>  /**
>   * xe_vm_invalidate_vma - invalidate GPU mappings for VMA without a lock
>   * @vma: VMA to invalidate
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index eaf11ac8ff51..3157390f2c8d 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -12,6 +12,7 @@
>  #include "xe_vm_types.h"
>  
>  struct drm_device;
> +struct drm_exec;
>  struct drm_printer;
>  struct drm_file;
>  
> @@ -39,10 +40,14 @@ static inline void xe_vm_put(struct xe_vm *vm)
>  	kref_put(&vm->refcount, xe_vm_free);
>  }
>  
> -int xe_vm_lock(struct xe_vm *vm, struct ww_acquire_ctx *ww,
> +int xe_vm_lock(struct xe_vm *vm, struct drm_exec *exec,
>  	       int num_resv, bool intr);
> +void xe_vm_unlock(struct xe_vm *vm, struct drm_exec *exec);
>  
> -void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww);
> +int xe_vm_bo_lock(struct xe_vm *vm, struct xe_bo *bo, struct drm_exec *exec,
> +		  int num_resv, bool intr);
> +void xe_vm_bo_unlock(struct xe_vm *vm, struct xe_bo *bo, struct drm_exec *exec,
> +		     bool lru_update);
>  
>  static inline bool xe_vm_is_closed(struct xe_vm *vm)
>  {
> @@ -183,8 +188,6 @@ int xe_vm_async_fence_wait_start(struct dma_fence *fence);
>  
>  extern struct ttm_device_funcs xe_ttm_funcs;
>  
> -struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm);
> -
>  /**
>   * xe_vm_reactivate_rebind() - Reactivate the rebind functionality on compute
>   * vms.
> @@ -212,23 +215,10 @@ static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
>  	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
>  }
>  
> -/*
> - * XE_ONSTACK_TV is used to size the tv_onstack array that is input
> - * to xe_vm_lock_dma_resv() and xe_vm_unlock_dma_resv().
> - */
> -#define XE_ONSTACK_TV 20
> -int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
> -			struct ttm_validate_buffer *tv_onstack,
> -			struct ttm_validate_buffer **tv,
> -			struct list_head *objs,
> -			bool intr,
> -			unsigned int num_shared);
> -
> -void xe_vm_unlock_dma_resv(struct xe_vm *vm,
> -			   struct ttm_validate_buffer *tv_onstack,
> -			   struct ttm_validate_buffer *tv,
> -			   struct ww_acquire_ctx *ww,
> -			   struct list_head *objs);
> +int xe_vm_lock_dma_resv(struct xe_vm *vm, struct drm_exec *exec,
> +			bool intr, unsigned int num_shared);
> +
> +void xe_vm_unlock_dma_resv(struct xe_vm *vm, struct drm_exec *exec);
>  
>  void xe_vm_fence_all_extobjs(struct xe_vm *vm, struct dma_fence *fence,
>  			     enum dma_resv_usage usage);
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index d6e3b76bf590..4f29e4947323 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -7,6 +7,7 @@
>  
>  #include <linux/nospec.h>
>  
> +#include <drm/drm_exec.h>
>  #include <drm/ttm/ttm_tt.h>
>  #include <drm/xe_drm.h>
>  
> @@ -28,16 +29,16 @@ static int madvise_preferred_mem_class(struct xe_device *xe, struct xe_vm *vm,
>  
>  	for (i = 0; i < num_vmas; ++i) {
>  		struct xe_bo *bo;
> -		struct ww_acquire_ctx ww;
> +		struct drm_exec exec;
>  
>  		bo = xe_vma_bo(vmas[i]);
>  
> -		err = xe_bo_lock(bo, &ww, 0, true);
> +		err = xe_bo_lock(bo, &exec, 0, true);
>  		if (err)
>  			return err;
>  		bo->props.preferred_mem_class = value;
>  		xe_bo_placement_for_flags(xe, bo, bo->flags);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo, &exec);
>  	}
>  
>  	return 0;
> @@ -53,16 +54,16 @@ static int madvise_preferred_gt(struct xe_device *xe, struct xe_vm *vm,
>  
>  	for (i = 0; i < num_vmas; ++i) {
>  		struct xe_bo *bo;
> -		struct ww_acquire_ctx ww;
> +		struct drm_exec exec;
>  
>  		bo = xe_vma_bo(vmas[i]);
>  
> -		err = xe_bo_lock(bo, &ww, 0, true);
> +		err = xe_bo_lock(bo, &exec, 0, true);
>  		if (err)
>  			return err;
>  		bo->props.preferred_gt = value;
>  		xe_bo_placement_for_flags(xe, bo, bo->flags);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo, &exec);
>  	}
>  
>  	return 0;
> @@ -89,17 +90,17 @@ static int madvise_preferred_mem_class_gt(struct xe_device *xe,
>  
>  	for (i = 0; i < num_vmas; ++i) {
>  		struct xe_bo *bo;
> -		struct ww_acquire_ctx ww;
> +		struct drm_exec exec;
>  
>  		bo = xe_vma_bo(vmas[i]);
>  
> -		err = xe_bo_lock(bo, &ww, 0, true);
> +		err = xe_bo_lock(bo, &exec, 0, true);
>  		if (err)
>  			return err;
>  		bo->props.preferred_mem_class = mem_class;
>  		bo->props.preferred_gt = gt_id;
>  		xe_bo_placement_for_flags(xe, bo, bo->flags);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo, &exec);
>  	}
>  
>  	return 0;
> @@ -112,13 +113,13 @@ static int madvise_cpu_atomic(struct xe_device *xe, struct xe_vm *vm,
>  
>  	for (i = 0; i < num_vmas; ++i) {
>  		struct xe_bo *bo;
> -		struct ww_acquire_ctx ww;
> +		struct drm_exec exec;
>  
>  		bo = xe_vma_bo(vmas[i]);
>  		if (XE_IOCTL_ERR(xe, !(bo->flags & XE_BO_CREATE_SYSTEM_BIT)))
>  			return -EINVAL;
>  
> -		err = xe_bo_lock(bo, &ww, 0, true);
> +		err = xe_bo_lock(bo, &exec, 0, true);
>  		if (err)
>  			return err;
>  		bo->props.cpu_atomic = !!value;
> @@ -130,7 +131,7 @@ static int madvise_cpu_atomic(struct xe_device *xe, struct xe_vm *vm,
>  		 */
>  		if (bo->props.cpu_atomic)
>  			ttm_bo_unmap_virtual(&bo->ttm);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo, &exec);
>  	}
>  
>  	return 0;
> @@ -143,18 +144,18 @@ static int madvise_device_atomic(struct xe_device *xe, struct xe_vm *vm,
>  
>  	for (i = 0; i < num_vmas; ++i) {
>  		struct xe_bo *bo;
> -		struct ww_acquire_ctx ww;
> +		struct drm_exec exec;
>  
>  		bo = xe_vma_bo(vmas[i]);
>  		if (XE_IOCTL_ERR(xe, !(bo->flags & XE_BO_CREATE_VRAM0_BIT) &&
>  				 !(bo->flags & XE_BO_CREATE_VRAM1_BIT)))
>  			return -EINVAL;
>  
> -		err = xe_bo_lock(bo, &ww, 0, true);
> +		err = xe_bo_lock(bo, &exec, 0, true);
>  		if (err)
>  			return err;
>  		bo->props.device_atomic = !!value;
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo, &exec);
>  	}
>  
>  	return 0;
> @@ -174,16 +175,16 @@ static int madvise_priority(struct xe_device *xe, struct xe_vm *vm,
>  
>  	for (i = 0; i < num_vmas; ++i) {
>  		struct xe_bo *bo;
> -		struct ww_acquire_ctx ww;
> +		struct drm_exec exec;
>  
>  		bo = xe_vma_bo(vmas[i]);
>  
> -		err = xe_bo_lock(bo, &ww, 0, true);
> +		err = xe_bo_lock(bo, &exec, 0, true);
>  		if (err)
>  			return err;
>  		bo->ttm.priority = value;
>  		ttm_bo_move_to_lru_tail(&bo->ttm);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo, &exec);
>  	}
>  
>  	return 0;
> -- 
> 2.34.1
> 
