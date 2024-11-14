Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE197D68B33
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 16:16:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AADA810E81E;
	Thu, 14 Nov 2024 16:16:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k7Xdi5cV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D3F10E81E
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 16:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731601006; x=1763137006;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HUE50b2/oJveuc+QYFRiomeodNFBdc29dnzRdSJnA3M=;
 b=k7Xdi5cV/XCQD3t+NwN78WHqmyxFDJx8FhYxw74fuarbvBlfmuqtDTy/
 stqQgAJEv78+UzKNKGfiEwI6bucGfjJx2B7v9JtIJc3FOq8Gk9w0XbPb5
 pERknQcbNtYA3kv2fTkmgHP7EE1qc55L2Ybqqt9T4tMgrebGmlNkUvwpQ
 CTs2bvjlb4JRGLrbuJMt3jiNB3AIjdOwq3QL4FD/jps2AfpVuR1wHby+m
 SsIgT08uv5xgpVKprlGWXkxmZYipN0RznfTuWVJypLWa6bzX0dM7Nmvm7
 ZpO4w6P92EdBtzhEEQX/QfUZjlCic0vWfOSsJe9XeZ4UQRkU4nxA/eAuh A==;
X-CSE-ConnectionGUID: OYGuI1N9Q9u4HiaIEQ5WJg==
X-CSE-MsgGUID: yUN7pgw2TEa310O3HdC1PQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="30967958"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="30967958"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 08:16:45 -0800
X-CSE-ConnectionGUID: 6yEAQw1fTn6w1YnY59PSdw==
X-CSE-MsgGUID: HPRITyrYRGu0+gvt8H17dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="88672617"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 08:16:45 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 08:16:45 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 08:16:45 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 08:16:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tJgxaBIJf1QO637Ms9czwo0pWfCheRCgiYTIYse5xR0X9uUJG8KA6jFREJ5KdFZIOOSLBGmfszh7QP1akMlUMUcVnqNTvVNQMWep6nzyWQiVP3Ioc/0LZm02fiyb5KWSzhUkwIZtro69exm/8ApSw/q364h4aUuMe1SyiPLgqoLMc9Jkh7EIBl5zsZpFYP+Bg9RjWw/zF9xu2jOxjspglxEY2dCL8z+4QKLE+Owj4x3XTpGw+qqwLQicVngJFKi9E6s7kF1w8hxIOxgZ4DGvXS3VBLAE/E+qwARZuR743bPkM79FPqmXNhq5PUGVbe7XkcCx5t4FkAs9wpPTsmtNpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AsW9Mx4RAY3ZqZ2kOTERRsvgzbj9KbRybVJFTY+9/24=;
 b=Gmg1V3loMG3LH+KqcWnOzYU2qpTY/61DUb7uHxmao6IKVMoZk9JNsB8yfZcIHYfHfsnR7WxaiZ3SQnx6YobnO/TZx2d+e3TnLx/8SLl7LIKSElr+9+voKs2pwTdWT7n5WsUsgdGfhvkhV9teAX/mDppDe4TKbLZZMdvPDHZqP4+3UQenDAHK8iNA2mE4WTCi/emVivKV8VDie9EWM/6hbZjtdIU6NhLMwgIhrVsETPKzSyup2Ol878tAz1wy+aN2toK1cpF6sG9BRxvjrI+uANGstRyUj6m8v7Vd11WdQgalMuei5XPJtUOdjBcDP5209gMy0rlQ3VeGsF9DqTd7Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM4PR11MB6237.namprd11.prod.outlook.com (2603:10b6:8:a9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Thu, 14 Nov
 2024 16:16:42 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 16:16:41 +0000
Date: Thu, 14 Nov 2024 08:17:15 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/ufence: Wake up waiters after setting
 ufence->signalled
Message-ID: <ZzYii99fHXfiWQ/L@lstrano-desk.jf.intel.com>
References: <20241114150537.4161573-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241114150537.4161573-1-nirmoy.das@intel.com>
X-ClientProxiedBy: MW4PR04CA0081.namprd04.prod.outlook.com
 (2603:10b6:303:6b::26) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM4PR11MB6237:EE_
X-MS-Office365-Filtering-Correlation-Id: 83408d60-c4bc-44b1-83b3-08dd04c7b99d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eOXxXaUBRnHT21+PHu9TYV56UWKGZyoxacv7d+TMujSt6ZvhPMu+auR16ZA3?=
 =?us-ascii?Q?AT9/Opx1bOKWtR0TZSjzzmn0FKTGYpm6Ob9edUlc1olduEGBPIX+GYYYk+IQ?=
 =?us-ascii?Q?cQsLEh95PMBIbwamkq481z3Noc3WKoQ1TcHXBkl3wCq04G1gClfyLt9n6/Hs?=
 =?us-ascii?Q?lexAsJrKhGi7zouJPnVX4+lKtnCo3ULTwXNQAb6TZD4he1gpyz4lUIc9pFDV?=
 =?us-ascii?Q?tsgYErtRPAyGz1u+YH1KUbGAju4l7IGcbUM1Lz5rfpWOBTsJUIgTOH1MDswe?=
 =?us-ascii?Q?XCV80LadTrU7+b4k646jEcSA0cNX5hR/EEKZ1kAfQd/dcqMIsae5GMJ6jUn6?=
 =?us-ascii?Q?2IMpAR9poIGMNHGP+lRL9lfJ17SFqOMx6HYbV6Iupq82aWwFmpSzJZ2LdTgq?=
 =?us-ascii?Q?yTl/GxudqKg0eZ5XwjczfSGk8ZYGcXaaptk74bnyGkAGBYA2yjsD0mdMPDaZ?=
 =?us-ascii?Q?EobzVkMyhEX8faSRHy7XYSGbI7JjsLI0IiaB5vO/Mpws8WofqDz3fP5ywwZc?=
 =?us-ascii?Q?rmD1Lr+nh4/kgAIs4iN74FxY8qsX8u9DDTsFqV4KxhZY/+guoBlSUY2f7vTu?=
 =?us-ascii?Q?ALbvPBF95upIQX3H/yvEfrz1aQDTfXfN8towqn7x2KPTJB6qUCRoKJ5qR803?=
 =?us-ascii?Q?2tVdSfTHZp66go2v4uun/LlwSKKDd5BSQAXOVya7eKdXk38MTnVgcHvYWx6B?=
 =?us-ascii?Q?PklriUO9LtizqWkZZtYFzvIwmUBJH1SlUugBWl84wGFBEYvTS3J+a2+dOpKF?=
 =?us-ascii?Q?ZP7t6zTmF++3Iu8OstU+qqSwUk8PwviN1fdxAfEJiPkim7mlW4oW+O4X1FG6?=
 =?us-ascii?Q?YOwlGL3Y4ysfrsWmNiO6HxzNbvOrztgG4dCugv6B5PujhHjj6VMCMZxfE9Dn?=
 =?us-ascii?Q?/aJ8V5oAfsbRLiSzVQHMWhIfo8lMRmQq3AhtMvnQcyHRIG71q2RnTKzzCu95?=
 =?us-ascii?Q?hVHMej91aBJL9mX6sLNCEcyUPG44oxITjo6VFtC769ln14Ty5B6yqPcbK7pP?=
 =?us-ascii?Q?elzWx9NYlizsu3k6NaYKAyOqic41EVDtVCKHvELYa4ObAaYGztCLvKB5yV+I?=
 =?us-ascii?Q?39vRY0b3vV9IHlntB4OyXYCVsUFVoNIaqe39YwFFlLDHSX1HpLm9pNwQjCHU?=
 =?us-ascii?Q?rL75YrBfWCGDcyMYp4lFiLEeaL4lxyckomaaG4f0u3f0WghSfiYQEVecNjpt?=
 =?us-ascii?Q?AWkQUXsUAi2Xi0qureOtpMZVwfRgG7OeV5GDGKkfTdqq05W0Vc0FRXb8jneC?=
 =?us-ascii?Q?iiENfW0ypXKxDncp68m0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FAeo+lTXJ78RFrcCtur2htE95gX9HmL9ZIE2MjlLzWNPgGsaxITK7jg+S69l?=
 =?us-ascii?Q?On5GyzEntbLIjNTuN1yfWbaXW9Kk7HjEuCMEEkjc3XZGiccEvU8ToZQ5OrWu?=
 =?us-ascii?Q?zbuVLx8BWr/EeXngmJcqEM/sLqA3iU8jtMm8AZTM2TMX/u+Wn0EnU+NKETs2?=
 =?us-ascii?Q?iu0f/5aRuBEmMmmzQPxVlUGHwO25NyiFXSbSLHxJwClPhfRePF7M6HTEE9o7?=
 =?us-ascii?Q?KfnrkKr8qZOxWHN9Mrh+Z0xRjmoIJNwz5hFuvy5P8ri5rZ6xSGc0sp6Qs2u3?=
 =?us-ascii?Q?r2bxEvFRFwc6wFEXIIAiywidub8iYHesIl9kmf1Ri2KPJvxyVjvZtEU/r+wY?=
 =?us-ascii?Q?UxwXWG8GQvBeZhTAXLhLwfKCGg2dwUoZ/5IJsGZeExCQbKr35iH9AkEykAQu?=
 =?us-ascii?Q?/SqOV6Q7tBeBG7tRowuec3ZoeYfbER40jpUUtjQ/FM2QT0vTfebZ4qKdX/rA?=
 =?us-ascii?Q?rOZldWf0WCee+AcDRR72KE4uFExNKj2JAERHJTcHgYu7Q6y69pQSFZGYI3Zv?=
 =?us-ascii?Q?OOy/QI3NXbdcflS5qoYM1t2g8of9uDkUlnnIAVKXBx2swjtnFJweOuNk7vl/?=
 =?us-ascii?Q?VPVZUaZR+wLgOgE5FnvDcwwWSmSZLhK75KFR0Xe0RFW4Qp23DRcJCxoMSVsJ?=
 =?us-ascii?Q?8Zg9BCgQ9FlY2KGra31zpH0iJ9q/gJ19eC0aKhJ+vHQeuV4PrOrwj60GwabH?=
 =?us-ascii?Q?m5FnzIUGxzIegObcUU3hWT7hFbCZ7Tj5ITBlgw9kUH+WYGN9fAIRIhWzXLZq?=
 =?us-ascii?Q?eoE+IZkQEEuOU9QJ1eGygiC1mf9PNd4xjsEMlA9Eumdmk+0ZQvunjjSvQ1vJ?=
 =?us-ascii?Q?Kd1TYwmsNTZaeTgFc1fYsKD8+gbVXpFqebjzw5T7iPzovrvTUmY2J8tb5he6?=
 =?us-ascii?Q?D7+YRNkqk3B1yVfJ5l2XP2L6EDXA4rYwIPNZ/p9p8ZUctHlTjicxhn7AX6O+?=
 =?us-ascii?Q?drTIc/elamWlOkHX+cHngYgkM16VqjS3N8aGB5q3mkzEY9GL20GkYe6tKPKx?=
 =?us-ascii?Q?MXbXNYA2CsZltPaXsr5MGzywGBmxcdaglQpH+/EtocNHTAOtnVTDqcCanjwg?=
 =?us-ascii?Q?b8UC61g/FUss2DneDX7jAuM2VhIrd/h/WLycnI0SEV+jNOWGsZoPxZN/9iIV?=
 =?us-ascii?Q?SCE1PtfjED+T5YRe8sIb1DaAFI+rbvoahvaPW1rBFYX4k7ZOvYKfaYQte7j9?=
 =?us-ascii?Q?67pFK3UZjuQXuYji7qbTQePLtFOFt0b6Ipwr8uTeEvjJpqeO5UHeScK0yxhy?=
 =?us-ascii?Q?OPzp1mHY05e2yfZl2mg4UtuNpoK3Yk/Yc5xIEsGU7JgXl3oztfKPRINAvSlM?=
 =?us-ascii?Q?vW9yLgzwGq4LaNHzLYVvTyrqefSTdhixq7vY6x7+qmIGsW/WHxMwuoKQdm7O?=
 =?us-ascii?Q?KHEypekfXofH3ijH1g5X+5g9rGTkg/ZXWd3IXKXIBG8MlyZX32iIO6xzRffD?=
 =?us-ascii?Q?ocvziNw2OeeFkBWm4Lh30dOBjMvNADeFC7fjp2+AmKjDOJ4jorLEZMbBkBsY?=
 =?us-ascii?Q?aeSDUNrsCu0vCFJNoHOxF0ROqE3QdLy23Igsf8bmma0owjYDl9eTp+1Wh++B?=
 =?us-ascii?Q?hGpNqcH3S/nw/lKoao9pE5ZGQUeDzlFtO5pwMKgIDK/sF+A4C6LUq8VG61l6?=
 =?us-ascii?Q?AA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83408d60-c4bc-44b1-83b3-08dd04c7b99d
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 16:16:41.8507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tmH21YyVRkddiifJyiOuVQeR7uBi9+IDl+V2vGTp38mHjNdHNkNYq213zrRGPo607fbO1ZKuNyZpSLjcjhmrHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6237
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

On Thu, Nov 14, 2024 at 04:05:37PM +0100, Nirmoy Das wrote:
> If a previous ufence is not signalled, vm_bind will return -EBUSY.
> Delaying the modification of ufence->signalled can cause issues if the
> UMD reuses the same ufence so update ufence->signalled before waking up
> waiters.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3233

Do we need a fixes tag?

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sync.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index a90480c6aecf..42f5bebd09e5 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -87,8 +87,12 @@ static void user_fence_worker(struct work_struct *w)
>  		drm_dbg(&ufence->xe->drm, "mmget_not_zero() failed, ufence wasn't signaled\n");
>  	}
>  
> -	wake_up_all(&ufence->xe->ufence_wq);
> +	/*
> +	 * Wake up waiters only after updating the ufence state, allowing the UMD
> +	 * to safely reuse the same ufence without encountering -EBUSY errors.
> +	 */
>  	WRITE_ONCE(ufence->signalled, 1);
> +	wake_up_all(&ufence->xe->ufence_wq);
>  	user_fence_put(ufence);
>  }
>  
> -- 
> 2.46.0
> 
