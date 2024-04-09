Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD80CD1284
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 13:09:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31E3F10E97F;
	Tue,  9 Apr 2024 13:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ajAZoRYe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A15010E97F
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 13:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712668181; x=1744204181;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=C2rEqhdnX1iif7tts1x/fY0pyW/YvAvHuIVOCzYPWbw=;
 b=ajAZoRYeMT9PCR6ic6wIgZezhzggYNQpIHulLr07tWlbnanOGGfnuFZr
 d2ITXkIR3mnyakbaBwfLBcaeRUQ+5m++mjr29fzLyAR0KbZuN+dHdThRz
 BrpzFB5c87By+Rfu9JVp8ltq1e8ORLF2blsruHcKGxdgHVodhTyr2ijH/
 /ovcXLs8AAq6UMKhWGuxi99KGshDTKsxh/n0GemYfaSmQlFmLnPAKWY6M
 p5/VM5NaMUzlobsffhQewnd07m6oa6ppd7xPfuLp0y46RALTIqaQxt9IV
 9uhZZTAjsLHQ2ZtRinE7k3/++EmcfTERoPm/zVX7Jf4KlTMkNkWPh8X3y w==;
X-CSE-ConnectionGUID: GQJFADuSTheN/7qQFdIYtA==
X-CSE-MsgGUID: Z0M/9SYGQUeIdsBKMm9YVg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="8553743"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="8553743"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 06:09:40 -0700
X-CSE-ConnectionGUID: u/BZcprRRQinPrG32/5Zaw==
X-CSE-MsgGUID: XvV1GkBtTIqTpyXNKh9FdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="51216751"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 06:09:41 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 06:09:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 06:09:39 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 06:09:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nq6DAFYb9mMlNNDP7Y6sr/jbrnpqoeWDqsDfHGGy5NxUIhX8jtwj4n4huYbzCj7eKKG104gFTMXphCz/cA4fRmFcWcYllJP/meI/1Yv/3Ye/jWd6v52bENUj1in8cNDzWdkKjW2E29eOCB1UyCnQXVj2pmh83N8LbDcXNhwyPaxu6j/lHiwfOODc2MHBz+9QjfqsqnmAJJ0jn69i8UuUeWZNKtfRkLHK6A7hf0/Y6wLxZHHocPkSKFHD7g1RarZj+/Ymw+g4l3gEZI48TQ8MuwIxBf1dGxYUaU7YjXdhHcF4YjmcWLC4Vy58kJPJG7SOO/9AjJ4DF4A+CPn4xSda1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWgR5FoaDhRGWDNjXGEA2elcgs35WR8l81oF1djwG7k=;
 b=ZSjod2lbSafISQrjI3m4LSUh6+uTb12TamYnRTGDSAaIge8Ff9NbOOt11Aku31cypI9FOU2sGFOFvvBz3SfwwKBrja2dQbF2+fWjvoVDawgA18lme0jyCtNrd0A6lFENz/QM3Gekb5uplFqAr05sbcW0sONJrl14oXad5FKUhKd+s5x5ooQvbFIovx+nY125NlmofB03DBaZkHwEKgug6FbDM5JNcY/dUfAMLInf448Ahhrkuoh5xMnlo6nGb2F5O8BmUFPVMgZ+I/ltOCddxqsAb+WwjTQUhktYnzCWPH8oDc+qEHaA/Li26hg0vRX0devSmpRI+CHWOz2bgxJuaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS7PR11MB6128.namprd11.prod.outlook.com (2603:10b6:8:9c::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.26; Tue, 9 Apr 2024 13:09:36 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7452.019; Tue, 9 Apr 2024
 13:09:36 +0000
Date: Tue, 9 Apr 2024 15:09:34 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Assert pat.ops function pointers
Message-ID: <20240409130934.fsvt33zm3jskemm7@intel.com>
References: <20240409105106.1067-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240409105106.1067-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: WA1P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::10) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS7PR11MB6128:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h9NTEhq2n5iB4NlaczzbVijp4z1vTcWYBhsDqnTVE2TtQlW1EZyr/jZV6T5Q0NhzRtVDAAEYMD5/ZhVnUxYBXpp1sU9AygHaWZb3BznbHwXpl7hwR8as3mZ+V0vM4G2uqp1WRjvg7HiH4Z5/GEBcZoDr3vlFXQ4T0CCSyGd7YbiLiUdKK3NxN2WxNhkkrdY24/bhO8dExLjl0sb4qBWAaSQ04jpNq65zjdmwNzOkSqyuJgAS6rM5BTnIv3OEf2z+OJKeYalJOqsaQS52J5Bf49vRtOJSIa10zHt+p/McxIIz+3YyFMNHc+MvpYmYsXIsGFOExzlLGpNBpr7imubBFQpSmJCf4NnH723IzA0POfARezVGQ2appziQhKjiwg4UNqVEsV4PZdBpc+Ul9ShOwksIeR9ToQAj7J5M4cKcgFq+wnM6r1froDvhb6c8gkAg9QRI5CsY90ytHWlQ1jFnsNlKswP30d4aD/ZY4zYC3j2DRKiOvT7gIdVnZ+0XcutmvSxMwCzigj1Q7AMreuuixqngb1885CS+fRrITX2lZM8xUkrDfi4od0YOVEI6ApoIxDsIIk9dmfpRXTLhMJ8sRiUL+YRKmoWjtLRAMZWSNj3aCH+BF8iCAFVmctV6JZG0mI3h6GTfR2C/OzK9s7iQk1P4aC3BVGiMW+56rQ5ncqc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHVaTEV2cFpEWGlrS1UreDUzNHgzM0RvNmZqNjRPVENYNWRWRG9yOWJ1OWtV?=
 =?utf-8?B?TTlsSGl3MjhVT3krcHQ3U0E1eEg3Z0ovOEkxaTU4am1vaGFGTlhKT0xsaGtv?=
 =?utf-8?B?ZU04M2dyQndBWEdlUUpKUkpGckdDNjg4V2dMY09odjlHNGhxWVlhK2V3a2JV?=
 =?utf-8?B?cE9sUng3VTR4OWdiT3Y5REd5TVZMaG5pdFJIbW5GeGg5SEVrRlQ5MjVoUC9y?=
 =?utf-8?B?YzBHMmxYY0pDc1M4amhjd2VxUDFZS2kyaGc0NlBXZ3M0clFPU3VkalVQbFlu?=
 =?utf-8?B?WTdkV1loR3oybGlUQjJiOTRCdUp4RlhJTkVJQytLZ1hnODZrWHNaU3U3SE1i?=
 =?utf-8?B?OGpCeFV0K3V0Smgwa1oyeG1zZVVBQXRhWmNGRmR6QnVCRzVsZzY0M0tNNmpG?=
 =?utf-8?B?Q0VUQUx1TkkvU0pIWHpWQ2Z3N085UGZIS09yczhlZGlEN0kwZ3lGcnE3bHAy?=
 =?utf-8?B?RWZsVk9GeVhLS1ZlZHRsaEhBeFF3TVZ1bUxiSEtobmprVmpoTnVGM1djeHFD?=
 =?utf-8?B?UlcvUTdHUnNZWEpTbFkzMS9JbjNSSTJpeXRNMHhaUnZaNzkyc29lL3JWTllG?=
 =?utf-8?B?cmxXYlhMRzJqNmdPcnZZYjU0bEJCU1lETVB2MUJXMmpIbGVpamJDMjhObGpO?=
 =?utf-8?B?cGVtWDkwcGZiVEFRNlZ4Vk9GN1Vnd0dHaEdWc0k5a0JCcEtMakcrMXh2bG9I?=
 =?utf-8?B?emVMbjdNOTU2NHV5ZFR5dlBlYnVZY2V6d1BUSEMvdUlSM1ZnUGtwNFZlQWFI?=
 =?utf-8?B?NXZLMUw1OXJTdjBWeVYvSU1tKzA1WGMzZXBVZ055QWlMQmE4MjRyL2FWQ0Jm?=
 =?utf-8?B?dERwT3kwVWRrdEMyZjgwcG42aGNWQ3V1SHhFU2FEMS9XQmZWemdjUDdjYjNJ?=
 =?utf-8?B?K1B2TE0xWHYxWnFFR2ZSc3pRSUcvcnNzdHVrOWpzR0tqdXVSNDB4OWRsdjJD?=
 =?utf-8?B?R20rVlVtbWZJM3phREdpQUlxZXdBYmozY3NHL0pRMzZteEp5c0R3OTF1VmFI?=
 =?utf-8?B?QUpHeUVZMjZMWC8xUVFYMUQrcURYS1hsNHFMeFZMcVZTUnRIdGlNNUxUOG5y?=
 =?utf-8?B?ekVQellDaU80RGs5Ujdvd1orbm95OXFwRU9Qc0NmMTJEd2lWdm45TUh2ZWda?=
 =?utf-8?B?RVU4MHVObm9EMmtibnFGYU41WWRKTXFDSXpEM08vMWJmdllhY1p3a0JZdll5?=
 =?utf-8?B?aWRHcFBkVEk1ak9iOFBSUWluNWdhUDBlaHR2L2xqRkxwWGZkY2JYK1BRT1A2?=
 =?utf-8?B?TWExemVjSVYzanlubiszMUU0eVd5NVgvNE1EVFRoRnp1eHcyWndoV0E0dDM2?=
 =?utf-8?B?RmRNRlUvN3VxNkt5T25FaVZNWUpKVjV2UEhocGdqMEZtTkZIZXNKSEJXMy81?=
 =?utf-8?B?eFJvSEFVMGxMYm51WXZoQ0RwSXlIVDg1SS9SRHdJOGlpeU1ueStUQmVXak5K?=
 =?utf-8?B?M2s4eitSbkVUVkRMR3M4bUtVRWtJaVFCaEdMd3lZVGQ2MTVJVjhMbFEyNlZE?=
 =?utf-8?B?RUR3NzY4eVZpem5VU3hsMzMzaVRzMHI5TEFRNU5SaXN0Z3kzeTRwT3dIRUtH?=
 =?utf-8?B?K0Q3MVZrbWQ0bExKUHdlaXNrY3kzNDdlTkJSVVpCanhLOUNLODNuY2RpUEl4?=
 =?utf-8?B?NEdsazdMdFBkQWx4MU9xdFhtdjRWRkxOc3lsUkJUUERvQWN1dDZ4V29uMGVq?=
 =?utf-8?B?UFl2VGVyTks3WnhjaEU4blQ1dGNtVWhiYUJ5b1hCL015Zk9hYkxjdjg2aE16?=
 =?utf-8?B?RS9SeHc1NmsyMkxsT1NlNTg4RGNEazJNUGNxK3hKMG0rRjFQTjZ3N2hMUFBI?=
 =?utf-8?B?dC9LWDZISVZDVzJjaWRVbGNrN3hFeWwvWTZrdGd4bHBTYXJDMURyNUZZbmdQ?=
 =?utf-8?B?aWtSWEFiTnB1VkxPUURQQlVVMzFwR3lScjlxdUQxOVo4blhOYlVMSDVPbFdX?=
 =?utf-8?B?aXRnSmd5K0ZuZlBHT3owek1kOVBjdHprTVFmTWMwY1dIeWhBb3I5QnJRNFph?=
 =?utf-8?B?Ynd0ZmNUcHFZWlJiMVVNbHpweFlBaitnMW9mQXVTTkJJREY2UjdZUnhQeTZF?=
 =?utf-8?B?azR5ZnQyTHZLOWltN2pkSENtSHRwOXZtWVVvYTBjTkhqNmtTVFlvODJ0bk9n?=
 =?utf-8?B?SnU0Vjl6NEdGTmNHYk9aS00yWW9PbjErZkxSR2NneVpOM3VPeFdNUFN2N240?=
 =?utf-8?B?QVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d16987fd-fa04-45e3-b899-08dc58964e9e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 13:09:36.8232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GI9y8+mXk2P6SiSYomxlR1Yd7E3ETjRai4RXtaV8dvV2vhRXD7lgK6auM8KwMB3yoAzHY77aO7Xo+gGWkcO/hSIVcGSqOW6+sfYXPly7Siw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6128
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on wto [2024-kwi-09 12:51:05 +0200]:
> Make sure that pat.ops (if selected) has all required function
> pointers setup. Only .program_media may be omitted if we have
> older media version.
> 
> This should help avoid late runtime checks against individual
> function pointers.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pat.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 66d8e3dd8237..026e4a9fe124 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -428,6 +428,10 @@ void xe_pat_init_early(struct xe_device *xe)
>  	/* VFs can't program nor dump PAT settings */
>  	if (IS_SRIOV_VF(xe))
>  		xe->pat.ops = NULL;
> +
> +	xe_assert(xe, !xe->pat.ops || xe->pat.ops->dump);
> +	xe_assert(xe, !xe->pat.ops || xe->pat.ops->program_graphics);
> +	xe_assert(xe, !xe->pat.ops || MEDIA_VER(xe) < 13 || xe->pat.ops->program_media);

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

>  }
>  
>  void xe_pat_init(struct xe_gt *gt)
> -- 
> 2.43.0
> 

-- 
