Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B26CD128A
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 17:47:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE37410E923;
	Tue,  9 Apr 2024 17:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MKznN4Tf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F0810E923
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 17:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712684864; x=1744220864;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aUSQ7UHAD3Yi5b0hQSc7oaK532u2lOe1yVGGMoU/HHM=;
 b=MKznN4Tf6DTbfon9tEEnTN4Ujq7M+Pw/CnP92XyVFipxHoz6YA5vr2iR
 +3suHcmc+lqJon88VBysk7ni3/d7Ix+qfYoqyWEDcGP319fpw+cOOnZXx
 yVMbaRX8cKyHEzH9xjaCA06ZD8W0/gy/aFKg0u3Zum/VVxOOtrqRIrsFH
 5UmZTPGw+3PnazCXaNbNUfYHJO9VZstRCnv4LEwJg25IIvTeIzb5+soC9
 fWTw2CN4dL5t7YUvm2nqRNl9GWIPtCci2ZjOn7uT53eTmfnogYOdETTbH
 oebJQEgD1spOZQCETQMFYb1zmCJYzB0CKoB0ykzKVbpJbXIStffM5qAid Q==;
X-CSE-ConnectionGUID: xixL1ILaRAeeLjs6eQcUpw==
X-CSE-MsgGUID: jl3fc4OzQs+xvEwv67Loww==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7862062"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7862062"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 10:47:43 -0700
X-CSE-ConnectionGUID: HpRAXYBURI+2lQ4iiK60qw==
X-CSE-MsgGUID: hOsrqKQITpqUUI4F9Ita6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20172170"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 10:47:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 10:47:42 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 10:47:42 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 10:47:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hP4CdffA/5Drsf82tbv3c3zv3B1ftW2DXkBUsOMWb4K/ckOTEehfaFLGq5oCaZaSHz2341A+igkhCwt2zMS8CdtOTzFUHo196G9r/QAHo9ik9lPnywjscRhCdeszgNGnj9wnxssWOtSzMcrZXtxwLzazJYR+bfMpvJBMESTyTdxRuOABN2IFTVPAfP9YEowwAGRJQ77W33ZedUdt8RmQ6YRgn4Ubf6u9jIpcM/IyeH6x7F6L+uFFz6b0wr9hAcitGi3ZMPqEGJFouELXsORXzyiuQGthyDi8N/QWVk1yttTu1D9T02OqTvI2+WHYqqeZnEF+qSYZDgd56Om9PxnmaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PdwkU85AjA8NrG/AEyMeMt1Zdvur9GFtUO/k0xr+Y0w=;
 b=XMRXVqJLP1UtPwzS9I4KGfytMk1A0a7n/g0TXz1NdfXr99PJH0GGOeLnGz+1nTVQ3hBNB6QQxJ9qgpih9PGOj/1StY3GcgA7Q9UC4gzMwSiQMPrHQVYUmiIbamk+hMm1rC3yAsbouvb2EgrqKCAHHd9Hz01w1hC43FS7V97SJEFqTu9Os1vCBuNKOU1Wf/bEVgl0Pil8xl/6iTnQU42tS+iEd8CTJw5ryJlVFn2WZBJGGSi/oXAYdEVnvSWTGq3Q3BPeR3TqMs7tDT4Pe2gKWTcuYTJutfpNCKRhysyA2zPVEoY4NL0pDAGTaFJjD572sacJpr6t2Q4N9BM9PXvsog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB4847.namprd11.prod.outlook.com (2603:10b6:a03:2d9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Tue, 9 Apr
 2024 17:47:40 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Tue, 9 Apr 2024
 17:47:40 +0000
Date: Tue, 9 Apr 2024 13:47:36 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe: Add max_vfs module parameter
Message-ID: <ZhV_OAyd4fqQuO9S@intel.com>
References: <20240404154431.583-1-michal.wajdeczko@intel.com>
 <20240404154431.583-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240404154431.583-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0141.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB4847:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RG1UOBQJxnLcYjVZAHhHemiQfmaUuqROca2OzRHDo3oUq4G3kuY1vb82qs5kPDzXpyyN4af0WSldpl4WTOOYQq5G4GkcROqqxs1aZAFwBsueb2Q7Z57tvAcBKMztgaqBrrXAGT2YWvX1I6zh2MFLnWj/BwMmsO1CsnMqpGNN0VVRfZt19+kbTJ/HaSBfqUNmw19ExATfhs2KQ8T0GDMtYp5TCJ8iCtb/acc95wyzJlvkoVRqmhxiX1BUi+JY4P8CiKR65jsSV0g6H57j6Sg3bC5co4VZhZTNYmUcZP7eyVBkhcfPUcTqqxw2QE70krAs18grApOulSpnvPuHg5zucSaVzRr/dNWuJo/OH2xWWREmrCA+DAXPvfPXq3P5Gj6Wq7OmGDB8F8b2T5nrNLsgxOcYHUPNvcKGNL7WK88VZOS6Ny/BrAafSFRvN4/r3XnWz8y6ieHsY4F9kFsj1q2hSfI2cckZepkQVkhrFlbhta1BYtHEfcLWR0E4wOTwZ0Xe+e3f6PNCDG0e7nIdhx8iXsB7g33bk3LxwSM40Fz8jhcLsY4ZY+dv/NbBpGJj1gWsIjSEo/8uTFoc40jWyq/2Xi/V1E8pphq0huQDNc3p2drv5FA7Lvka4BonHRKvCQgOLU92WpR2KoKwcMlrQskEi5SDdgimBuvvRXfvyO70ClI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h0t4Wu0sw+0NjPR2W8JXkf4Dbzsw9VZ9Fr7PmCJTsufr7bTbeR5U7ijRIJ73?=
 =?us-ascii?Q?rMqqUeWCIUhINrN5RL8bSwfncQuTiz6yr7WYQmzdY8cDWBp9hYjp/9w3RE1b?=
 =?us-ascii?Q?HYAySdX2RD9wj19mNfA2EoO1gxk3lXyAqQmc98BsjsKOQRvSpmfnXipKtHKn?=
 =?us-ascii?Q?V94xL4Jszru0lDhQw+Gksyc3GB5bM3g7LJXrDmKvfngfv58wMzWtX160gN0q?=
 =?us-ascii?Q?tQ5R4RwSyS7HFmAkvKYpknT/ervs45NdMe99IZ4IM7e8812X9AtgtHWHVz5/?=
 =?us-ascii?Q?IGGfN0IkN3GVTZynE5u+TPOvXLWqEU6RD1r6kv0Vr3BePzATuPHh8EyN0Lv7?=
 =?us-ascii?Q?liBuoBg+Gdl9axX3B3be539OGAwBf+PFUR2MmTXRv6ej3X+fk8jUUl/QaqyS?=
 =?us-ascii?Q?xaRHJR1nTXcF3tZZ6U/aKVfbG06Qe1ucS2C6U3d31fpdO/PT/9G/TYZiXWV5?=
 =?us-ascii?Q?OT9SmYJfXA2ttTJ9vWAVX2IQJ6LZXerCnNfi0H8uONb7m7kzsQpP4U1oUu3W?=
 =?us-ascii?Q?a/VSmoFsY6TBXZsTezakASINwzzz/7ib6CV8iDxkxF7DD+KelZnlo3ienhmX?=
 =?us-ascii?Q?0ZZBDS16gQS/JUysDP56AePGFczCSNOV07DjpxVFMeYYoar0lYs9Rtt4nb6/?=
 =?us-ascii?Q?sBXQRL6CMShWY8b4yFSk8S8nG3F0JhY76flH8VPC6H/pTTnRkuNSMl4sdLg+?=
 =?us-ascii?Q?ZKWlsp8jo4UMIx2mFaW1f2vW6eAGyifQRl39nMgeTnNuu5wRyKqEKmjDfkjp?=
 =?us-ascii?Q?a27zueZXOiiXW4FDgm33al33jHR0HhBfk6Wb7PVVl4HXovl1++EFnmKjeUt/?=
 =?us-ascii?Q?uZj7TnZIgnx9XbufpXWXbWGmk0A3qmBl1OKvB14LyNyBklTc3bQwtinG3LlC?=
 =?us-ascii?Q?sZKkbVSdw5FLwA7QnZegITeSDwWo8lfWciTPbZf/EYZUvRN4tR7dor1NkG7n?=
 =?us-ascii?Q?Rh89MZw2+EX4+NK4kcXAhoMz4PuRcuK/oHswNEFzOHj6z73brWvFoNxwnn6w?=
 =?us-ascii?Q?CR5NAitPJS1mAlLLj/0hpNcskbaRn5kjw50BeeyNWsrrUrsOlnRYzodTrQb8?=
 =?us-ascii?Q?xPxJJi30S53h8XfMScoSCJ3W8p6L+GUV92DVWQWgTzIk0DWEv4WtNaxFu7cP?=
 =?us-ascii?Q?ldNnno+/ZGbFCMTk1h/Wz5CRXuvGEYouFbmM6tYhIzh4k9PNVHv1+UeWKFgU?=
 =?us-ascii?Q?HPbgCV8HwDUlhXODAy3C8rSs9QK8AEvcyQZihVbKR3ePhxm74XujsyR5FFlR?=
 =?us-ascii?Q?SBKy34vttzZg0IQW2ufqe2BFWnH6DX/dLXi1tzcx+Cyuc30DvjaiedYI8PKZ?=
 =?us-ascii?Q?vr09U1ubTdxPqUZbqE24aiSFY1oF7YQ52SRHL0lSns7H1L0ALobKVakN5W4h?=
 =?us-ascii?Q?USKsLb3yVoIV+ELPfU24MAA9zo44RvRMNClWgqviMfWEtX7RRAqBFCGHrJZc?=
 =?us-ascii?Q?r7hijjrpo9LXTRduzQBLZWccA/U1be2qFkT2rxM1V0Ee1wHkeOLr1cX9iFrC?=
 =?us-ascii?Q?Jy0BbtwNB8K4uDhjfYU+Wyu1Vb2TrSIxdUHXPf1zjUpcEWD8nPWmDR0qKJZq?=
 =?us-ascii?Q?L9KEo71N+ZkesNN5FwOhDarPNBGOy3ZZAtWNjlR5it0o1yA3n2B48mVA4bOg?=
 =?us-ascii?Q?sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a151a1fd-237e-40da-4789-08dc58bd26c5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 17:47:40.5229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SR6t174J/wWFRXDI+3LyQIh26gpF9C1IyJC1icbrBvr7kwsM2PjLq2H59+1sCD9LarShz4M6YNJxTNfTXQ0SIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4847
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

On Thu, Apr 04, 2024 at 05:44:29PM +0200, Michal Wajdeczko wrote:
> We want to have an option to limit the number of the VFs that the
> PF driver will be able to manage.  With this limit set to zero we
> will also have a way to completely disable the PF functionality.
> 
> Since we currently don't support SR-IOV on any platform, we start
> with this limit set to zero by default.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_module.c | 7 +++++++
>  drivers/gpu/drm/xe/xe_module.h | 3 +++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 110b69864656..ceb8345cbca6 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -48,6 +48,13 @@ module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
>  MODULE_PARM_DESC(force_probe,
>  		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
>  
> +#ifdef CONFIG_PCI_IOV
> +module_param_named(max_vfs, xe_modparam.max_vfs, uint, 0400);
> +MODULE_PARM_DESC(max_vfs,
> +		 "Limit number of Virtual Functions (VFs) that could be managed. "
> +		 "(0 = no VFs [default]; N = allow up to N VFs)");
> +#endif
> +
>  struct init_funcs {
>  	int (*init)(void);
>  	void (*exit)(void);
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index 88ef0e8b2bfd..b369984f08ec 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -18,6 +18,9 @@ struct xe_modparam {
>  	char *huc_firmware_path;
>  	char *gsc_firmware_path;
>  	char *force_probe;
> +#ifdef CONFIG_PCI_IOV
> +	unsigned int max_vfs;
> +#endif
>  };
>  
>  extern struct xe_modparam xe_modparam;
> -- 
> 2.43.0
> 
