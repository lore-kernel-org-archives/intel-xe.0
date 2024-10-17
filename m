Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C635D374A4
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 14:53:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 166D710E866;
	Thu, 17 Oct 2024 14:53:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JCtMTY7d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2410510E204
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Oct 2024 14:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729176813; x=1760712813;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZVx98UVuXHYMHDu19MxPBUFUajGugRDyIS6Hfuq09sM=;
 b=JCtMTY7dE4p9laYxhd0URaeashrhWgSEv5IM0hhLcioJbYq52xlchlyG
 tsPZFR5NzsS8eODv9A/pTAq4zTWgqYil7mtJkgoiWWnBhYtpD1qsBywaT
 2EMziHTvTv2TYJVqO+6iS3mRLq2aUBdyZ9PvEwFgHe4NHAeV+UiY4elOX
 Ro4T7nVJTY1twNnMcOQQb3NmShEcrNBkMQK7W8QAs0uGiGEnozsRz5bbu
 IXHJxviVe7PmMfFLd8V+jvFZo1T4QXuUg/tXio0wObYiZxmu0hmc6/+3j
 eAU+eyNDpGxcJSXOQKEA1nscN7P0k1n+Nf2MLxaC70OXRYP8v1KF6+E4b g==;
X-CSE-ConnectionGUID: 1m6QYfLiQna/p6TtqvV+NQ==
X-CSE-MsgGUID: HlcUIRnJRGeTfNK+nQ9Duw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28548429"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28548429"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 07:53:33 -0700
X-CSE-ConnectionGUID: 4YxXfYMxTJSF+P+7EcClcQ==
X-CSE-MsgGUID: lGEeiOTNRXWsK9CHBHPTCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="109314749"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2024 07:53:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 07:53:26 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 07:53:26 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 07:53:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=leA99WrY9UmucBcYJCEuPHQz4vLyKIeNsbHCxsW5UYZDbvrFByKK5pZKmxC4osSVr7NBqfrIgiwR8XCuUB4omD7PvT09d00KcDoPVKqJv6aKLHpYi16tWT5xXLxiPh+fqfKF92qPCoz8NVKkmd++moOLy3eG+daj+rDVyX5A/X8BHLZTTcj6321bTUrgcBZZXk2ijoy7mDWR15fFzcqhR38NdCxQll6cjdWaPBHPA4HqKxv89rL1dfcndMMRj1HV8sfguRy39pOk2zoJFopTDjnI5fDzxU9rvNO6pWXphK1xUvrAOfoylHoGclC4QIdfKGLJskmlPd5fw9M+oM8iog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ysuvKA9hp1KLkc9dL/qS2bLmn62RWkBV0PTCeStBsY4=;
 b=ciLGvWaRGWedjCyjuQGgBDaR7f6J6KJc/jSDDXW+4cM9m+iA81e5W+4iNzRtd2tMmEf2gMD1Jsp8gY12dPZTG6mCftzTD5SVa+qaZYvWi8RVQIAqoCPutL3Cf4rQcIPUu9GuurSYc1KXO6mMU3APiulvYF3wTZqthIzLbr4ZMrPzVa2/TrbBHGUodtVDJ0hT5AWilhbAcvhG9vum0k2xmma9rVyb3R/59ttRBk8ZkfzIKc7hAFNUIJhLuK2FE23gGYDCNMDhksVagF1plrR7Vz8Cl1u2hmrgWJgObBGvzhv7kCwJw1MHJB9Iysh6smIgEnC0KUO3f1OBiJ7a9yhPtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4639.namprd11.prod.outlook.com (2603:10b6:806:70::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 14:53:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 14:53:23 +0000
Date: Thu, 17 Oct 2024 14:52:36 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Don't unnecessarily invoke the OOM killer on
 multiple binds
Message-ID: <ZxEktC+9Tb8u+91t@DUT025-TGLU.fm.intel.com>
References: <20241017144407.91919-1-thomas.hellstrom@linux.intel.com>
 <20241017144407.91919-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241017144407.91919-3-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR07CA0083.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4639:EE_
X-MS-Office365-Filtering-Correlation-Id: c85640b5-0096-4aa3-8f01-08dceebb72ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?LBTW7zmzn9Ym7Hyb9OY0ltyCQQ+BI7G0wqOGsNlpgUeVTj/UnrME/mD7mR?=
 =?iso-8859-1?Q?FkwfP/2J+yKleWlMpcv45IVwFxH+bjWT52EBwdeiIJZCGSjGPl9RvnLEQ1?=
 =?iso-8859-1?Q?3w1pMZNF7eImAE6mOYFYbgBmPhOqKSxT0tyMVIj3FXNk4mk8t3Zz7d7fps?=
 =?iso-8859-1?Q?hNWRAc3Br9/Nf/tc5noEsz7QIYwYQ/u15hjXyv/g5+C+XDyxcgHI3H4O+t?=
 =?iso-8859-1?Q?e3xDDweHRlXAkP6KHYniygiKHyL1y5b855lpcRj9QnrEzws9YfdZe/r9zF?=
 =?iso-8859-1?Q?CEQzi9GqD8O7OzZcteTMu+SvDBupdJVnf1/ZMtKo7Yw+UBoo6wXA1rmjHg?=
 =?iso-8859-1?Q?xQggyIcxuzIwNYxxmDmxcRRCdv/hc7pnQAOzNNEg+I1oO8RUusJqeR+XzE?=
 =?iso-8859-1?Q?8sP7RcMfwwZx10mrOUAn1hV8AAB60/ApiNeRdfT3usIZo1J/F8CtLiCArc?=
 =?iso-8859-1?Q?/zCYJiDya8vGnULWvarxs48HxjLzkcUQviFJZFdeNm42G2Fqz2smOJzRSX?=
 =?iso-8859-1?Q?GL0cas1FCgui9xkwxbuGG1CBvbLRzXBgjyR97P/GFtJFRL4mUv9vXSIMgF?=
 =?iso-8859-1?Q?r+mRtD3ZLYWtOYUctD6atJRbRYuP1hEUfpLBxvcaogyeZnKzONJ+xCF2eL?=
 =?iso-8859-1?Q?vfGBYR04Eubv7C06e3ICZxakf27aJhtKua7tGW+Ca779eTL6WXB66n8b/r?=
 =?iso-8859-1?Q?R012xACiUVsNcGQAseSkskTCU4s5uLSfui5zzqgiZYf/lYgFrcffV3cCVh?=
 =?iso-8859-1?Q?28djwxBAcEqYSr5CuM4wwuJ/mtXj6uH9U1CNcNCf0IBo8zuV1+KrLfj/BJ?=
 =?iso-8859-1?Q?uKzesOvK6aIGc6SBwNlGUJ7kNfKftxEvLkBgkdfW3Thbs4rs7N9hbUxNu5?=
 =?iso-8859-1?Q?LEc6FmZA/F3tIvuZlSTNOCZO+VYf9h3ekIpOZ4qAOiQXbY43bZYZ6hlR/s?=
 =?iso-8859-1?Q?rGwLqQobyV0uwED7RzEa34Na01VTw76FljmdITCVHvg9Q91q2YigcuJHRF?=
 =?iso-8859-1?Q?fQZTOkMq3mOCQ+6MQxmHVN7KfraWy/bQvwnIhVPhbmnZWguFmKHJ11D+zY?=
 =?iso-8859-1?Q?yvpkAdM5SHodIYtQJvHUKPyzl73wq7roVTrEwPG1MOqXWDjy1CMtjDCw3N?=
 =?iso-8859-1?Q?DE2IpgfM3aEcd5XKv14iwt+LUNvGmO47AKpJ5y3FF4LBERTSAUMxBaVT3R?=
 =?iso-8859-1?Q?Vp/RrmWOBD/mWpNmInNKLUm6wQap22iZsRxKdaFQRQpIX6dH5KDfjVwruA?=
 =?iso-8859-1?Q?Rx6UTT2alrfu/WY9+9v5yCzjzoYhFdCoRg40Pwbojan1BPNUaE+3fKcZcX?=
 =?iso-8859-1?Q?/Uex?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?I208TvOug+0z/dEc+U44Q4cYdjnUkp3CdRtFER3a1EW5X45T3KYUHTpL73?=
 =?iso-8859-1?Q?YJ494/gHFs3i0uPSTn0IhM2f3olTQE7qYP2qJN3ks2PBooKoOyg5UwmDR6?=
 =?iso-8859-1?Q?grLqnV6f9+VgY8jU1jZHGjE111y8AxZ3XHgWCPX4QgsfRA63CKLEI7W8lF?=
 =?iso-8859-1?Q?aArCZl/sGQzniTUKCoOUnf3nelQJA+cfqsSkpIFr0W70SaspS2wmQCr2fb?=
 =?iso-8859-1?Q?+Ywa3uah49aWyTFCYtD7NeTRaGA2k1jeJUYGp0B3blYmJw29HTFR/FDKjv?=
 =?iso-8859-1?Q?us6epI1r40iqM4hksZ0AaT1imlB6OWzbAqmAqsXwQm8pywaFLwV/k9ywKA?=
 =?iso-8859-1?Q?ZK0J815wCSIJZapat66mMlrpFKWCvWm4YWzmB0pOMWsUxkdO5+W2O5MxDm?=
 =?iso-8859-1?Q?jLKni4u0mSW5lyZf+R0WIqt7yqh8tInevwe2fHnPkMr2cr87bIZtyMl9Xd?=
 =?iso-8859-1?Q?pOuRZUKr49XB/Vw99EFN31BAGrNgRmfz/CMvMctm6axh3SnANQgc9CibcP?=
 =?iso-8859-1?Q?lAfsKXV6zlsuWCTG2dwBxt5yChlNFqJMp82yV0YnJ9iKOGv5xeunxiFobQ?=
 =?iso-8859-1?Q?oVoE6JKJv36J4wFy0oQq66VaCzadO72N7hmM4MtBlky+h9cQh9DGrfOhce?=
 =?iso-8859-1?Q?8M2EnQsDjYWKDhsTjW11cNsvzlSG78mq61rGwusIUmm0hgQXvlrZHsTzGl?=
 =?iso-8859-1?Q?2wXigx00A+AHHgncIaf5wJJUFg87EdbM9WFImdnk4ReLN5OkrrC7Advcdy?=
 =?iso-8859-1?Q?6t2pVsyZRMIYOb8DUR2Fa/C+YyXp1XPQsodwnpUapKtXwQKGgw+3j4mACf?=
 =?iso-8859-1?Q?2KJxWcIR3ZR0d1Rm5mriHFIvAjYt0xRJvROBDtIBk7OQJ2NyG3eutMMyvz?=
 =?iso-8859-1?Q?njuIpcevjPNQoWCXQtwEB4qEtWOBC9D0iQRruSW89xfjLJLlGmFJgQLAq5?=
 =?iso-8859-1?Q?ontk50SEz8zeSsPV99OoxKblwVjsQ9mm4RZ3NFldsH08W2KlfzNHNzXp6r?=
 =?iso-8859-1?Q?6be7oOrVDiQEZWY+ae9zaMh4K63XGQmqfW+MWvjjKNQZcm5HgJIAAgs3YN?=
 =?iso-8859-1?Q?ZtuDPTqBwTzSeLjcWDUbj6M9hwLr69Yt+00xVVgHqhJvu0TSpQrrEBC3U1?=
 =?iso-8859-1?Q?5f1uGjsIQJM9+Sc6lpMgATS47+XRHoY99EwImyywKk4hgBmBhMkH9vSFpN?=
 =?iso-8859-1?Q?bD3HoFUA0ftMVICqLn91fpmjNNEHHjR2HysCpGnf6GtoJskRQbo9qDls9h?=
 =?iso-8859-1?Q?lEsST1KHp3CkYenEgVzki+iaFyScOYe64rvd8PRkkZorR4iMKR9zvhXS4g?=
 =?iso-8859-1?Q?/Wwq5bbRNSPaHGC59dtezNBrbM647pPTWTL4Dt35hVJmCnzUifwIbFidNw?=
 =?iso-8859-1?Q?sES2245i31VwgQKGx+mVH3CBXzOy/bcZ3G6ac8kGi5t7qFJTN39OIkgo1f?=
 =?iso-8859-1?Q?NqOinFkdXz0RCtKt6YM6BRjTu6E2hJzJW+5SPGZBpIypswt7E5xEmWg+IZ?=
 =?iso-8859-1?Q?ez/6FEmmnfaxYt+ZEu76gxYs84IUh0cMuUwzfnsBJbzaYOFXuan2Fpa6yx?=
 =?iso-8859-1?Q?PhRGCAhchPsC586RbAeabfg66pfmcajtl1PtYihAbHGlf4sLBnYmDEyA9O?=
 =?iso-8859-1?Q?lO5mOTHrYbX6MtxWm0ypuMdS76lDJQ1SHg7hHoyOrVk4lQuQvtxvTSbA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c85640b5-0096-4aa3-8f01-08dceebb72ad
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 14:53:23.1276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQ5KnoqcTlzrnhNzGHJisPs492AM9bTrugDFhqQKeB15wgsEjH5RQMvAzrlhsFLrngxwntQJHe4Ugr3R7YZM8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4639
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

On Thu, Oct 17, 2024 at 04:44:07PM +0200, Thomas Hellström wrote:
> Multiple single-ioctl binds can be split up into multiple bind
> ioctls, reducing the memory required to hold the bind array.
> 
> So rather than allowing the OOM killer to be invoked, return
> -ENOMEM or -ENOBUFS to user-space to take corrective action.
> 
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2701
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index c99380271de6..0142b4daf714 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -733,7 +733,7 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
>  		vops->pt_update_ops[i].ops =
>  			kmalloc_array(vops->pt_update_ops[i].num_ops,
>  				      sizeof(*vops->pt_update_ops[i].ops),
> -				      GFP_KERNEL);
> +				      GFP_KERNEL | __GFP_RETRY_MAYFAIL);
>  		if (!vops->pt_update_ops[i].ops)
>  			return array_of_binds ? -ENOBUFS : -ENOMEM;
>  	}
> @@ -2733,7 +2733,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
>  
>  		*bind_ops = kvmalloc_array(args->num_binds,
>  					   sizeof(struct drm_xe_vm_bind_op),
> -					   GFP_KERNEL | __GFP_ACCOUNT);
> +					   GFP_KERNEL | __GFP_ACCOUNT | __GFP_RETRY_MAYFAIL);
>  		if (!*bind_ops)
>  			return args->num_binds > 1 ? -ENOBUFS : -ENOMEM;
>  
> @@ -2973,14 +2973,14 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  
>  	if (args->num_binds) {
>  		bos = kvcalloc(args->num_binds, sizeof(*bos),
> -			       GFP_KERNEL | __GFP_ACCOUNT);
> +			       GFP_KERNEL | __GFP_ACCOUNT | __GFP_RETRY_MAYFAIL);
>  		if (!bos) {
>  			err = -ENOMEM;
>  			goto release_vm_lock;
>  		}
>  
>  		ops = kvcalloc(args->num_binds, sizeof(*ops),
> -			       GFP_KERNEL | __GFP_ACCOUNT);
> +			       GFP_KERNEL | __GFP_ACCOUNT | __GFP_RETRY_MAYFAIL);
>  		if (!ops) {
>  			err = -ENOMEM;
>  			goto release_vm_lock;
> -- 
> 2.46.0
> 
