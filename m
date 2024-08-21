Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3061AC52D7C
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 15:51:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D9510E473;
	Wed, 21 Aug 2024 15:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KB4AYDE8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E89110E473
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Aug 2024 15:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724255463; x=1755791463;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pXwJ8yRGNp1JuhKVgS+Sw2NV0AV24z3L2tbhhewSr2E=;
 b=KB4AYDE8y+yD9r5a9/KCLYF1aLxFRtaNVlrjTlzYsWFZcpb8dVkrPmd/
 xTLOgzJozJ/iQiEA5ZnBkzA8+YExa5E9MqoNMVmP+ErSULYRKeZZyiwYw
 eJ5V4SEtYPb7A/fLuzEKUiXQqQ9WeaNUS08apc1s7aHyryntLlzSNL3iB
 IlnODUdc5YgugbxkUbs5EYhxLrQ/WNVsw28rtH14FO+bNvI5gxxzHmbK7
 vajMVP/DguhGzi+0A91w7uzgBiirWA8B6fJRLuvCdPnMhgIP9d02XwgFj
 Nuqry8VA6Z4fXZFqvw/itGjUxoQn7TbgRfbIIZSh4mIbU1x89D8bfxZNR Q==;
X-CSE-ConnectionGUID: at5HwDRaTO+8qVSYGmdX8A==
X-CSE-MsgGUID: Aalc2lAESmuCtyJa1Wbrgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="33285165"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="33285165"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 08:51:03 -0700
X-CSE-ConnectionGUID: 1G6iXD0URjKasujem2i3WQ==
X-CSE-MsgGUID: vxWQMKpaT/y1mEvvRh1Qsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="91917298"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Aug 2024 08:51:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 08:51:02 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 08:51:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 08:51:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W0Z0geNTPimo6apywsFSYTW7Xhl6J7/BKr7K3SqQtxgRnZ0ry7BeaXErLqKxvxMgW2Gn6TJqoQ02b/V1xpLqgW+K2tQzAxhs9axmQA5d7HjNI+7gPgXcBsLWqeLaWA0BNPAxHwJSTOI3VHj9UdKfuwElORN0RTRt7zuBalUU5ipmlBbbgDCp8twYxztbVkOuvo6FQhfkJFu0G4NtuL8uPhJp5JTVkZKQ89Bymldy1bDbjMPsbabKOU+gRpaGbVk6Vv/0Q61NCm9SgbmStbwmmYgmF/Ai6KRRP301oWyrdnSIduW0JgLt+5/drpU18AlbfkWDgVn3xJP57tdT6fGhVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=noXUTiBU3qaz2aCOMw4MhmlryJkgtIKPILq53A9EqhU=;
 b=dLRSxYhvovrDYy6yUiVNYdX/0x+iLYrwI8jN2Weh7q8iILz5eXjN3Zr6X3/6IwNN0rtkJDBN2EbhcYS0BCC6mBIcJDm4WL4iseZrFwV/tnkAyse/syS0yh+8Tm2LDMyKU7J3e9s9CPd1SOCY907sG7m/Uc78iFT8Dqv/Cctbh5PA10O0hQzvYydqvJA+1da2X8+H0ffWO1B26Z1Zg4dwRkgiT5l3jgrNuIq1ILAu6XnFrYnaGk9R9Ctza78JT1SgKbhEjhbZjqocVFlxwDfaT5FsmoFrVpckf3QFIQJ45ye8dOodCim6xw4oo4sjAOOb2EVZTY3/dDEve+LL6hpHmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7386.namprd11.prod.outlook.com (2603:10b6:208:422::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Wed, 21 Aug
 2024 15:50:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Wed, 21 Aug 2024
 15:50:58 +0000
Date: Wed, 21 Aug 2024 15:49:53 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jose Souza <jose.souza@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 4/7] drm/xe/oa: Signal output fences
Message-ID: <ZsYMoY5rSVssYclX@DUT025-TGLU.fm.intel.com>
References: <20240821152830.1495276-1-ashutosh.dixit@intel.com>
 <20240821152830.1495276-5-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240821152830.1495276-5-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ2PR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:a03:505::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7386:EE_
X-MS-Office365-Filtering-Correlation-Id: bfd5c2f8-0964-49cf-2609-08dcc1f90c90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1UyJhte1BnWE/hqKQmCXQYExd9CclpOij6AOZs+gUQtKxH7Ylww7/yTi5n+O?=
 =?us-ascii?Q?XzqG+SN61kgi5FbDuDZ5EiHUGfFlUHlyc0nFPIGccRIiaI+pEKk9fK4+689h?=
 =?us-ascii?Q?KyQ6KER3hBpoyXyjUuVW89xc/7zJ+oIRxhRe8Wj4Qnb/Ij2FfFZTK51VGr+K?=
 =?us-ascii?Q?G05lQlJqz4QzKskw/neNcFatdQQacGD9g83F2NGq8e207JJnj3df4DMEkX8d?=
 =?us-ascii?Q?G3kvds/eSYjagMWrDTNS3erU6dNcGCsZccrLU545GvkqF4mKAb6kitpsXGJ8?=
 =?us-ascii?Q?GzeYOSArP989l6ha4IE3ulzzg7T6zDZBHbUwaKQaPUa9wv0HbSlyIMWT758O?=
 =?us-ascii?Q?67pVQuQsgz9IPOTMO9J0AFYLwbrzVZ2xIjmKIsL8NPKSnPddU1ScKeGbu5Yo?=
 =?us-ascii?Q?mKzA8sy8B+2m4XZM6o5tjHbsgLF8qCpu3KV0oYEY2Z4l7COxYNgRsCzymlTd?=
 =?us-ascii?Q?iAy6XjQOtqcxX28w6sco1HcUyRXLkG09DD0TwiQGsAAi+VoRqCGlTWw+uJXJ?=
 =?us-ascii?Q?pGWZ1PLflGth5IGPhpIYR/48aKlTb+A7CXpoCK6PZsyT2h3tI8uQI7VI1Y/y?=
 =?us-ascii?Q?XS5SexsRjUoEDiA8vSJQmV4NvXNqJ0ApW4hch8PCllopmQctbU29XgwN4gyP?=
 =?us-ascii?Q?6+8cSudsg+y3E1UuK1JTj7mzZrsPg7HKysymncUbC7MzTg4pEzpg+FE7Ud3c?=
 =?us-ascii?Q?2Jc3sW8hVZfLQ0hy0xhBbUYoPPXb40RYA98uHMtgwxlJYhjgbIw6vlgshqB/?=
 =?us-ascii?Q?yUXHNNl/ce8UaqfgjmHSYcsFdVItInFT0v2rGdkRDNzdEyQCuaXZM7Pw5Ao2?=
 =?us-ascii?Q?obJ9NGU3jmu4maEmy+cmRVeNldfoyk/4eRrvn4LCDUusZIh7amH3+S8kb+KW?=
 =?us-ascii?Q?2/pFv+zYflp3TVQ6LQF4GwP07Tsukmj1Xe17AInD4aFH7+NZlXLisKQ73P/T?=
 =?us-ascii?Q?ex786k/uY/wLQGbIdPdZEj514Mkv3UMi2KxVAdVupGuEkp+OIV4oLI40JcZ5?=
 =?us-ascii?Q?HquYYYfJFDQNmNTeOp+bdfBxAnwIoq4jiZCrqygIn+Mzm9n60sDYQkAD2vqo?=
 =?us-ascii?Q?X1lGI0ZkCH6h/CwUjR4p+U0gHx9SdOso3MkbudLJO+1QfNlls8muGaLbWxB0?=
 =?us-ascii?Q?onq2slWWkBl3tYZQh/tiT+g4vFcPTSuFSArtyKAVRYu1VUnxtVd/Pj+IbhHn?=
 =?us-ascii?Q?PESdvorVhq4gjSqDyothrYI8hVS7JJfXKWcHDpPOE5tovO1KRgJmi9FYZQo8?=
 =?us-ascii?Q?ZEzY5booAAXCZUmHpug7cCtsn/Pl9gyAebITvUkfM8OQkUY/Bwk7e/tlxrrH?=
 =?us-ascii?Q?1qIJAD3hv2oN9RjFUBEiJPHeAPSmlYgfFPgNoLttjUPtOg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5Jjvnht9b805vJWWeMVBmZL9GW7nckv6sh/jcGbcUYH3uPYCVmdR3APkGqge?=
 =?us-ascii?Q?cor+NKD32JZNjhSRg3jya27QlqEVoZiSafI9Aei8f/7KAgBQF9KZOpROFUrt?=
 =?us-ascii?Q?VnRCk08VWKk16bC25UWwLviUFlDwiFg62kdSHUOPUzxemX40OZQ6H6+ZQkA8?=
 =?us-ascii?Q?Yth+1NbL8y10S59s9XuTWd7P62taIUH30la4hnYOSGXJ+CKMxoP/YFfue1lP?=
 =?us-ascii?Q?+iOgYCA+bl1qJtBsgEKpUK2S4AoEa2FLkPE8fWYBmbzeFm+UuOki4cl/WxCn?=
 =?us-ascii?Q?XeljbQmJWRVfd0D5g0/0TCO2hfyRif3TPNalvO7qlG+nVrNTbrKcHU+FoZTV?=
 =?us-ascii?Q?Wj43iaLNHGrVlHWoycOSPSSgtfjQsoLtRtOsBPkpNWR2OYXRwlHeGbpdX5ij?=
 =?us-ascii?Q?scOacpnsC0szuU+/Y3T8+bUkWzQ/zhGIiLvbLKJpmWw7Mn3VPwcCRuJm7oFQ?=
 =?us-ascii?Q?2dOaF+jL/2peEmguYA+/9rdvWT6ax1aDJnYFuEo1wDX1HCKeqrgoWCG8OPF3?=
 =?us-ascii?Q?mTOygjyr80CTN9Vz/R1Y89pV7WDjEi+IbH4m+Kd9EEonWnLMcqEZ+yhYwWft?=
 =?us-ascii?Q?HRvG+KESC/j63eIrpHystQ+gjP9hJTVwkZCyAd90TDQCouAcu1/1RxNuyAJY?=
 =?us-ascii?Q?yPEGgVn94Q5qw3BI1toRe+osI6BVpdwnB1fPVhDR1lLpl4XY2nrWXb21Nf7A?=
 =?us-ascii?Q?zwhLRVGrRGv9g604oXmjh1KUlYto21NdOBuXPC21W4tDLRhl7VaHM6IFo35S?=
 =?us-ascii?Q?Zq4vEALiTXSEIviHHrV0vmQQJWiCPodW++YFiDGeEzdGdye5LBpnroMFddOr?=
 =?us-ascii?Q?w/2jRfXSD5VaVmiTo8+YS2ItdnqR856VazGGjEdEhLZGLrxfsIqRq3h83+Wt?=
 =?us-ascii?Q?kYdXk8UzzzUr/AjhfTYTQ01eBDdFi9iUYo6L78qq0A0XvrHXXHO2pxsi4l89?=
 =?us-ascii?Q?mVwG8A/k0kUch67F2oEimpORwOY/ilwxOP510NWFUEsr5vjQNOIH7heANuyi?=
 =?us-ascii?Q?Qdtw4T83KN5XFVb+Gi1RpcsoDjnbKPxj3xs5G5zq0CzewD3TiW392LgOBgji?=
 =?us-ascii?Q?zDhAdktlou5zCzDhlSs+7ccPZYKZVL0/8D+kgdLwQdPiIc7bV4AXZ6uSP+fr?=
 =?us-ascii?Q?JvA8uAvIqwPW2No2r/5djH0oGSdX4dL9MzB+bFSjGcFRvA+mk4Kui5oCOV90?=
 =?us-ascii?Q?GEsltKKLozy8aooCQgf4+FQ3Pv7IwgsocrODI0VmCaVm6RoA6knvRs9AUwjt?=
 =?us-ascii?Q?PkaYEOl51TZ+FJSSoqDo13NfOkFHjKSCY98Hwf18uGBvMPUJWuq+Czpm42el?=
 =?us-ascii?Q?7X6l+Y6o/eOGKLv2L/NNVsT/6ecppHImGZFusdqPwskpfg0M4p67H4OF2AUY?=
 =?us-ascii?Q?4kV6AEgft0uHPya+O2S1c9aS+uX58kuV87gIL9gmrK/ubIM+POjUMU4Q4th+?=
 =?us-ascii?Q?rn7r6Hq1eAsJNLi6sIUGU/fBV49V9zR17o2Em73Fg8iajpUbu3hAZIaAu4RS?=
 =?us-ascii?Q?udqKpaUHNZb8Sl9uE9UA8Abm1C5rwZ9hsXUVSZ5uejw6MtuZAiu4ndaCUd8K?=
 =?us-ascii?Q?v1WJ0qsuUB/D2o0UqFTp0QqDmVGbATD+EJV9a2SjUJpeMJ1Ny+dnsGGHxPnO?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bfd5c2f8-0964-49cf-2609-08dcc1f90c90
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 15:50:58.6296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JRcqvROLrZqUwF5teakR+9ex35no2k803G7xYriCh4XRHqh7j19RjQFJXoa7rPkyfIHGQ6yNJyUmlDxVR0zl2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7386
X-OriginatorOrg: intel.com
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

On Wed, Aug 21, 2024 at 08:28:27AM -0700, Ashutosh Dixit wrote:
> Introduce 'struct xe_oa_fence' which includes the dma_fence used to signal
> output fences in the xe_sync array. The fences are signaled
> asynchronously. When there are no output fences to signal, the OA
> configuration wait is synchronously re-introduced into the ioctl.
> 
> v2: Don't wait in the work, use callback + delayed work (Matt B)
>     Use a single, not a per-fence spinlock (Matt Brost)
> v3: Move ofence alloc before job submission (Matt)
>     Assert, don't fail, from dma_fence_add_callback (Matt)
>     Additional dma_fence_get for dma_fence_wait (Matt)
>     Change dma_fence_wait to non-interruptible (Matt)
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_oa.c       | 101 ++++++++++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_oa_types.h |   3 +
>  2 files changed, 90 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index cad8f54500a10..0c55c1b577f70 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -100,6 +100,15 @@ struct xe_oa_config_bo {
>  	struct xe_bb *bb;
>  };
>  
> +struct xe_oa_fence {
> +	/* @base: dma fence base */
> +	struct dma_fence base;
> +	/* @work: work to signal @base */
> +	struct delayed_work work;
> +	/* @cb: callback to schedule @work */
> +	struct dma_fence_cb cb;
> +};
> +
>  #define DRM_FMT(x) DRM_XE_OA_FMT_TYPE_##x
>  
>  static const struct xe_oa_format oa_formats[] = {
> @@ -945,40 +954,103 @@ xe_oa_alloc_config_buffer(struct xe_oa_stream *stream, struct xe_oa_config *oa_c
>  	return oa_bo;
>  }
>  
> +static void xe_oa_fence_work_fn(struct work_struct *w)
> +{
> +	struct xe_oa_fence *ofence = container_of(w, typeof(*ofence), work.work);
> +
> +	/* Signal fence to indicate new OA configuration is active */
> +	dma_fence_signal(&ofence->base);
> +	dma_fence_put(&ofence->base);
> +}
> +
> +static void xe_oa_config_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
> +{
> +	/* Additional empirical delay needed for NOA programming after registers are written */
> +#define NOA_PROGRAM_ADDITIONAL_DELAY_US 500
> +
> +	struct xe_oa_fence *ofence = container_of(cb, typeof(*ofence), cb);
> +
> +	INIT_DELAYED_WORK(&ofence->work, xe_oa_fence_work_fn);
> +	queue_delayed_work(system_unbound_wq, &ofence->work,
> +			   usecs_to_jiffies(NOA_PROGRAM_ADDITIONAL_DELAY_US));
> +	dma_fence_put(fence);
> +}
> +
> +static const char *xe_oa_get_driver_name(struct dma_fence *fence)
> +{
> +	return "xe_oa";
> +}
> +
> +static const char *xe_oa_get_timeline_name(struct dma_fence *fence)
> +{
> +	return "unbound";
> +}
> +
> +static const struct dma_fence_ops xe_oa_fence_ops = {
> +	.get_driver_name = xe_oa_get_driver_name,
> +	.get_timeline_name = xe_oa_get_timeline_name,
> +};
> +
>  static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config *config)
>  {
>  #define NOA_PROGRAM_ADDITIONAL_DELAY_US 500
>  	struct xe_oa_config_bo *oa_bo;
> -	int err = 0, us = NOA_PROGRAM_ADDITIONAL_DELAY_US;
> +	struct xe_oa_fence *ofence;
> +	int i, err, num_signal = 0;
>  	struct dma_fence *fence;
> -	long timeout;
>  
> -	/* Emit OA configuration batch */
> +	ofence = kzalloc(sizeof(*ofence), GFP_KERNEL);
> +	if (!ofence) {
> +		err = -ENOMEM;
> +		goto exit;
> +	}
> +
>  	oa_bo = xe_oa_alloc_config_buffer(stream, config);
>  	if (IS_ERR(oa_bo)) {
>  		err = PTR_ERR(oa_bo);
>  		goto exit;
>  	}
>  
> +	/* Emit OA configuration batch */
>  	fence = xe_oa_submit_bb(stream, XE_OA_SUBMIT_ADD_DEPS, oa_bo->bb);
>  	if (IS_ERR(fence)) {
>  		err = PTR_ERR(fence);
>  		goto exit;
>  	}
>  
> -	/* Wait till all previous batches have executed */
> -	timeout = dma_fence_wait_timeout(fence, false, 5 * HZ);
> -	dma_fence_put(fence);
> -	if (timeout < 0)
> -		err = timeout;
> -	else if (!timeout)
> -		err = -ETIME;
> -	if (err)
> -		drm_dbg(&stream->oa->xe->drm, "dma_fence_wait_timeout err %d\n", err);
> +	/* Point of no return: initialize and set fence to signal */
> +	dma_fence_init(&ofence->base, &xe_oa_fence_ops, &stream->oa_fence_lock, 0, 0);
>  
> -	/* Additional empirical delay needed for NOA programming after registers are written */
> -	usleep_range(us, 2 * us);
> +	for (i = 0; i < stream->num_syncs; i++) {
> +		if (stream->syncs[i].flags & DRM_XE_SYNC_FLAG_SIGNAL)
> +			num_signal++;
> +		xe_sync_entry_signal(&stream->syncs[i], &ofence->base);
> +	}
> +
> +	/* Additional dma_fence_get in case we dma_fence_wait */
> +	if (!num_signal)
> +		dma_fence_get(&ofence->base);
> +
> +	/* Add job fence callback to schedule work to signal ofence->base */
> +	err = dma_fence_add_callback(fence, &ofence->cb, xe_oa_config_cb);
> +	xe_gt_assert(stream->gt, !err || err == -ENOENT);
> +	if (err == -ENOENT)
> +		xe_oa_config_cb(fence, &ofence->cb);
> +
> +	/* If nothing needs to be signaled we wait synchronously */
> +	if (!num_signal) {
> +		dma_fence_wait(&ofence->base, false);
> +		dma_fence_put(&ofence->base);
> +	}
> +
> +	/* Done with syncs */
> +	for (i = 0; i < stream->num_syncs; i++)
> +		xe_sync_entry_cleanup(&stream->syncs[i]);
> +	kfree(stream->syncs);
> +
> +	return 0;
>  exit:
> +	kfree(ofence);
>  	return err;
>  }
>  
> @@ -1480,6 +1552,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>  		goto err_free_oa_buf;
>  	}
>  
> +	spin_lock_init(&stream->oa_fence_lock);
>  	ret = xe_oa_enable_metric_set(stream);
>  	if (ret) {
>  		drm_dbg(&stream->oa->xe->drm, "Unable to enable metric set\n");
> diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
> index c1ca960af9305..412f1460c1437 100644
> --- a/drivers/gpu/drm/xe/xe_oa_types.h
> +++ b/drivers/gpu/drm/xe/xe_oa_types.h
> @@ -239,6 +239,9 @@ struct xe_oa_stream {
>  	/** @no_preempt: Whether preemption and timeslicing is disabled for stream exec_q */
>  	u32 no_preempt;
>  
> +	/** @oa_fence_lock: Lock for struct xe_oa_fence */
> +	spinlock_t oa_fence_lock;
> +
>  	/** @num_syncs: size of @syncs array */
>  	u32 num_syncs;
>  
> -- 
> 2.41.0
> 
