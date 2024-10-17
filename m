Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92ABED374A8
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 15:18:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513C210E860;
	Thu, 17 Oct 2024 15:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iv3IPRf1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EBBB10E860
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Oct 2024 15:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729178282; x=1760714282;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rYBAeJdVwPHM76YhoektsAzouWnZaePvXlUt5C/ik5I=;
 b=iv3IPRf1AuRZzQIuVqlz/BAlw4JucNETdrkwmMlr3VKBuglxwUJ104S+
 PIZborXWsp9Fh5UpESqFoNUwJANiEWx862sQilmzA3URUeiIQnJ1BGChd
 nkbSGVBzCKjAesuxOsbgjMTqSU5WKxYqYfeOSg/428Q6BuxfDkZtP0eOE
 6pyX1gnRCjc5S2AdaD954qMCrJFowgbtBZ+TzQUHPXRjlzZRT8Mmeke3e
 CZXDDD2cLo8023Zmjq/BCJfY19f5bAEk/ckTkDel++r4ppLp/PjDNUEgf
 ce+BMKBkAqNocSpKowwIU58apYt6PHvBJRHl+PZX3PW2ziIbH2vwPaTda w==;
X-CSE-ConnectionGUID: oNkmQwlQRyanNC3bxAIsJw==
X-CSE-MsgGUID: GdL3jjzKRfawMcDT6qTILg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28768742"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28768742"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 08:18:02 -0700
X-CSE-ConnectionGUID: S6fXWX0FTg2NwgOtRnVdiw==
X-CSE-MsgGUID: ELAvkXtYR3GC8rYQBr0c1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="83405165"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2024 08:18:00 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 08:17:58 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 08:17:58 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 08:17:58 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 08:17:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oRGuegBol2TDf9+7vuwbgYIZxoluqEUe24Kpe7CGcyrSYuBjynjrpsRIdfKccmO2XmsLpuXHaiXn0wipQSzXsiqUvSm6bur9zNrhG8WzTpMHWl+ErOD2w6nO/YEvdiGrRXikVf4L+pCRQjO4lRd5W9oR38cRNBQddueLQfrjRbsHD8BC+z9l3+vIqwficFrM+cV7lz2455NxOh7Zcw7Pgnhm7Q57Fq17kkVuAUK94CKQxZ8OQKm4VTYn7vvAIYO8g0XKc9vkM3cIi1ApIi5ObfbcgFskZGbMs8YDH+XYUsQVrEBEImObpwtBb+f43PwLlNzQb2Q3iupRd+UPLBGrHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QsVsNMh1MWVhGKJOdmsSLGPP5BVEHjXkfs9yfODcFUc=;
 b=Y+DwoTx5470OvaTSBrwhdEvnkHi9Glrtuf2yf7q8yjMvVlvZuKPCCQ/mk2v2K2CqlV4EZY3PJuggqzFkufvLXB257Y/HCHqbxWSyoxcwEIGxko6zkANyLwihJBNVTwUadYDxxSkdhmLehwsiQRY7QJ1vSRSKVQ5cNaSFPKty3LPwlOusbyHhpYYv4AISwDy9PT7SyPI6ZKF/pD/H8kCesmhenVGk/1GVs+BI6oZ6fvkT8HeWlMr8gOdKQqa//CcAUaifa7wyUdfOrNM2BL/ls+Z5ugj38j4pGOduh1D4zISduvbxL/pz4khWCcEKx4kGvU2CGLHDYdPomQ4Ns4t5xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8154.namprd11.prod.outlook.com (2603:10b6:610:15f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 15:17:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 15:17:55 +0000
Date: Thu, 17 Oct 2024 15:17:06 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <john.c.harrison@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <rodrigo.vivi@intel.com>, <matthew.auld@intel.com>
Subject: Re: [PATCH v3 1/1] drm/xe/guc/ct: Flush g2h worker in case of g2h
 response timeout
Message-ID: <ZxEqcndONyuZp6+l@DUT025-TGLU.fm.intel.com>
References: <20241017111410.2553784-1-badal.nilawar@intel.com>
 <20241017111410.2553784-2-badal.nilawar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241017111410.2553784-2-badal.nilawar@intel.com>
X-ClientProxiedBy: MN2PR04CA0031.namprd04.prod.outlook.com
 (2603:10b6:208:d4::44) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8154:EE_
X-MS-Office365-Filtering-Correlation-Id: 514064f2-2147-4189-5919-08dceebee009
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FSwoNJ0Q01653erAf42mtwcM50/T1F7TL9quriTKgDFHKwEGTSJy8ssN8mIV?=
 =?us-ascii?Q?zITa54hghd5Db6dDUP5seiQU/2x3soON+5JDR+cs0g2hn2wWgyCSfSm54Y6X?=
 =?us-ascii?Q?N4FrQ8rwm8JR7wQbFkH2qyVj/GGGfYoShQBsOLIoXW17caLKJy81gdtKOmcj?=
 =?us-ascii?Q?0IZA/BCzoYDmC2YgbFOlao6MUNQRTZ+4Dmo4yHn0kfkrfc/Ub+BZVi6MMlvh?=
 =?us-ascii?Q?cicx3mMl11+YlC1o5s9U3ybEq3GUFQEm6VwYnrWx0eIvADX0eMcIkAj2/JlE?=
 =?us-ascii?Q?y2XGvf2U9SZi+K1/SLsXVHEgy7sOAHdrT5mYxGLXAnJ6Uon1HIxEi63gW675?=
 =?us-ascii?Q?a3S8igyxBCRQ0voZ3lXgYOSl1Ccd0HGp8ndBjDzCq86soabMdRHimBIQnYWA?=
 =?us-ascii?Q?8zmyrJSfnkYM9cseSxcoaL0ovGbCoDoamQjtuJWG3EYhW0TVyApP4uNJH3qx?=
 =?us-ascii?Q?KaHUlLDwl6WI2zLqSnLdNO5nHEptAgb1318EspOzYlzkg7lTJB8Wq5QxY3IX?=
 =?us-ascii?Q?qdDI6xXIbgdtk30oflyFsXgWV3fKTLosEOJiy9qclJLwm3vPvGor4k+HkC7K?=
 =?us-ascii?Q?Ldn+X/7esh97VFtTaVmpDKKcj8YCzvVJbNTc8gQXxgXUsP+MAw5Al/hr/Ay6?=
 =?us-ascii?Q?zc1PhMC9Zkvw291aJSGhT08s3MO6qbS1CXK4+LELh3tAsBigxEL575KehrXE?=
 =?us-ascii?Q?PvHks9YuZTK/H5+YzNKBRk2wOZUXIUBmOGi2cwfvPXy2nsgV+zGXPX6hlbFz?=
 =?us-ascii?Q?DutWzYVeQ9CqLv0SMs3zrFW1GuqYNG0X7jOh0yuXdbK4VPV/KjzfUM14nOZr?=
 =?us-ascii?Q?kr2opn7y+FH9aSAsoi6gqVK9Y+Z2j855756oBdMvpCEt8yaTYGqJBw7iuyYC?=
 =?us-ascii?Q?/OlMOEuzDMwrdlmHw2VwR9hsxrCHZ+3WHQOU1Oi8sHmbU9hNTfSfHe3hCvZN?=
 =?us-ascii?Q?g/SxONaZ+rCN9kXEap75MEnoD2rUJxtOUgbpGXbpjONUZYTgmS61JOcVZdRW?=
 =?us-ascii?Q?0mqOMc2e+5ZRASPhGlLIXPEnGxYCAMqp8/d0A/ThTVt1MROqHlbHlV2BJ942?=
 =?us-ascii?Q?GANufCEL9qZZRWNTSlIqMcqsmTt/PRKN2zpJMsz6X1dhCJ7+c+I4jl/vzhlO?=
 =?us-ascii?Q?W18XGF24WVygtQVAmZQfAiSGwJLjavJfwJTLoO3e3diGJp0jfbU/TNkupb3T?=
 =?us-ascii?Q?V44Ur3ko7oIrIuIySO5nTb/nJtuXhSdyTTCpn+hiT3/EZZ92mNdTJ4b82aJM?=
 =?us-ascii?Q?J61oCOgl+fztuuPIiH7OB16HdHW6T8KF2ttAtAD8PQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cplx6CuWTjFRMb+XmvapwnLtXyr50eqdAPgKnvtCdwlqMmy45uj1/hwdC6hl?=
 =?us-ascii?Q?GEnwX+S6HGwNlOMNhTH8jcxLxXrZxVOwfomPxwhjbI/LjCFhS+yayYC4LRBg?=
 =?us-ascii?Q?dkkZVOreK4AlHHyb6cElrIG/bWZK6AjDduWgO8nkvZ5WJiGGRsb8AT/XWrj7?=
 =?us-ascii?Q?rS5GvdhpzfKGvzBrK7eCHNaZXj+Lw3+GshXLysmihDKVRYVstcFKC2AY/xg1?=
 =?us-ascii?Q?3Owlb4hwAgU5JDBVG1zhidz/sI70HxkxpYiBODM3L98+N37PBduVN3yTGbKo?=
 =?us-ascii?Q?36xAZjY4ObJEjWBVJSAHhzFM3p9JMTuuuH9kadKtwAN1o5lf0QX8ofiYMERy?=
 =?us-ascii?Q?pVQCivJrWj9olPa2N5pqz5J/7lhkGI5JF8Dt2j5rnZfWjJ0C+VuI9rLSyWS8?=
 =?us-ascii?Q?M7vKn5Ys053+yoM6tAwE79gXEnGEXNl3pcwLe0kKukdIs2S5lQsPAMNCHw3b?=
 =?us-ascii?Q?5Rsa2vYlEKdTAy89u42SLceIWr5U1OBNDl6UyvGZMDsDclQ0yVok1RszXXjB?=
 =?us-ascii?Q?AosmeIeKU7gR8ceEo4gr23kdMy0EyD8F0R0jHTNXbyBMCOc811TJnMX9Z3Yg?=
 =?us-ascii?Q?zSdnN3+Kt8JoijeFLuphXEUyjtWY//hqGcQU7HXqrISDAD0Yx8er/88NhqsT?=
 =?us-ascii?Q?FMgGwLltsSFfifYuQhoKAeAnXxqh9lFq1dlUEwvkUthSrT23KLmdenWCdJ8k?=
 =?us-ascii?Q?Bj6ivX59CCXlrq6UM79LYyAmgHSPgISMa1kmuNMWRMoKjEp3a9kVTOWDaaEk?=
 =?us-ascii?Q?/vfrOmmgZD+9uc5auNU0erDq7bpGteb00gJqM8Wy8Hg5vxPGao2FrXQNlBhO?=
 =?us-ascii?Q?GxNPsweMgmUc9B1G3+kKFo6jPEnXLuI2DzU0bmGxXLAeCQfruk2c285QhXUb?=
 =?us-ascii?Q?TfQXR2ODktDMYDHThsirzGmCBfpwhYS5U6XVYrJEfcGvLcTDqP/PVCL8PuOV?=
 =?us-ascii?Q?X5ExKiz3fZyRh5rtbVINBN9rQTwk7Qu346kkF0XWZmMtyv5PxY3ybpPjYL8u?=
 =?us-ascii?Q?qd9agSngcOSQNuRzqBgIdnchIKnJ+d7gpP7/wwG2U6u70qbXOyIW50twzNO2?=
 =?us-ascii?Q?LIXoWWbjpUGooCWqElSwPpupeDO1K+BIwRExLsFbTb39S6dMEEjNsQbn4BS0?=
 =?us-ascii?Q?GVoSdrxabyr3YtsJ5IBpEnnu9PnAOsa8cVsWHpFOtnubfnrglsp7bhvheWl4?=
 =?us-ascii?Q?QeTZ21D6DO0zHcGF6I5hrnfmGW9VgPlBtZusyTLh1HCmfVw3t0vO191cqMOb?=
 =?us-ascii?Q?tnYGmu8Qymv3Y0AOORTu3o+tOPoOHKjIT6dlrNSB00/Gi82iC/o781Ffu8uc?=
 =?us-ascii?Q?KBMJLjmbPa1gsyYOCvINBk6xVC1UF96QQntvOYAd5X8kW/OvLpjKoxvxrvF3?=
 =?us-ascii?Q?JzjlVgDQ0dINMFLXf7N+VbCByDU4ydtaWZs4FNjKoVJ7kFQdVlX6NtuI6LKe?=
 =?us-ascii?Q?4vB+fe5eheqY8t9LfoFQnAo+c3tWXrINsX/d7sSCooNtvIni8yIoNlAbZLqZ?=
 =?us-ascii?Q?Ao0UO0p0Dt6wQMmlj7xnfCTnt2Dlyz1chiOLvrg6gDN29ow5JwLEUIE72n8D?=
 =?us-ascii?Q?9OPHP5q6CudNYMkM9+g3/N7PhvT+FrWjXpIc8cC5LQv850qomo24LNJYYiSW?=
 =?us-ascii?Q?lQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 514064f2-2147-4189-5919-08dceebee009
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 15:17:55.1158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l0eARv3zBo5ybfaBbRLLF0HDZcnJYy4a1JlEx9ka7x+jBra1bW4MBaaV6bJYhyb0zkcbnFsYdI/j0kZ2seeCXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8154
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

On Thu, Oct 17, 2024 at 04:44:10PM +0530, Badal Nilawar wrote:
> In case if g2h worker doesn't get opportunity to within specified
> timeout delay then flush the g2h worker explicitly.
> 
> v2:
>   - Describe change in the comment and add TODO (Matt B/John H)
>   - Add xe_gt_warn on fence done after G2H flush (John H)
> v3:
>   - Updated the comment with root cause
>   - Clean up xe_gt_warn message (John H)
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2902
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Acked-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index c7673f56d413..c260d8840990 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1018,6 +1018,24 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  
>  	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
>  
> +	/*
> +	 * Occasionally it is seen that the G2H worker starts running after a delay of more than
> +	 * a second even after being queued and activated by the Linux workqueue subsystem. This
> +	 * leads to G2H timeout error. The root cause of issue lies with scheduling latency of
> +	 * Lunarlake Hybrid CPU. Issue dissappears if we disable Lunarlake atom cores from BIOS
> +	 * and this is beyond xe kmd.
> +	 *
> +	 * TODO: Drop this change once workqueue scheduling delay issue is fixed on LNL Hybrid CPU.
> +	 */
> +	if (!ret) {
> +		flush_work(&ct->g2h_worker);
> +		if (g2h_fence.done) {
> +			xe_gt_warn(gt, "G2H fence %u, action %04x, done\n",
> +				   g2h_fence.seqno, action[0]);
> +			ret = 1;
> +		}
> +	}
> +
>  	/*
>  	 * Ensure we serialize with completion side to prevent UAF with fence going out of scope on
>  	 * the stack, since we have no clue if it will fire after the timeout before we can erase
> -- 
> 2.34.1
> 
