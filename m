Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7E5C3DA5D
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 23:10:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CAA810E495;
	Wed, 17 Jul 2024 23:10:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K3yxqZ4N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABAD610E495
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 23:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721257836; x=1752793836;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=P7p+V2lhcf6EhyeozuNTHxUS2xLyP85foZAaq0tqN74=;
 b=K3yxqZ4NF4dDDVn/DAqPNCKVJ+tL6+Bx3hUGnYiR5HTm/RMQvE+gaWGK
 O8HZXjjhwF0elQaIUtVIgLGN/xjpMEYJxLelViNVgRW6REZTjszvR/kvQ
 i57UevkLyX6ccUMFNC3r7kfR7jV7daa9lEK5tMajHPykc8C2M3fP5KTh6
 SHbKA2cOQZrD/iewtmK14MMRel+Ft2TeLzYAeQxSXb/LmF45x4dnGyJW9
 wR7ZhiAH73CxqZbgj8CAqUfZvo+1tg79/HRvq/YstBeN1zgHqgRxLk4RL
 8QHqdj7pHNPmo+sTEM7+IQQSbA7gxDwXuF1FYK362TZr6DQ07f2p6/mKO Q==;
X-CSE-ConnectionGUID: 5AImj0esTWC3KZMY1LZ+kg==
X-CSE-MsgGUID: g+ilgzt8RCOd/zsLJCgZqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18662595"
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; d="scan'208";a="18662595"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 16:10:36 -0700
X-CSE-ConnectionGUID: Sx3kQ3euSzmNSRlcY5onJw==
X-CSE-MsgGUID: cMmGbe0PSvi7iPCfqMUo4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; d="scan'208";a="73800432"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 16:10:36 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 16:10:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 16:10:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 16:10:35 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 16:10:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rn88t7bJIeewYg/RZg12AOQzlRx7FGoXhWNxk7TduICxmYZBuA/RrhRaxbMZUfCrG7dYY37hHCuGqZ/5pOQWFaL9/McqwoDeFKU79ctUbk7i8oqbcNeENh/ooDJneaFtvDV1NNoKu5af9hVM2rCRAnGmJRzDBuXX9KgKzwKnjssveZhgCswMiSj9buouMYpMEbX1XhNP7oUq8tVIIULwxOp3KFUQXkT/6G8TKpXAbf/raFEHrXidPjv24KsUAemJbL6jjHnL5zCpjSbFYeKNoKRh550Pt9BCd3+nEEsCeqStmN3SIe0RjIWvc+yLN7kKg1ol673dsvxj8RndroZkkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dz6qlrYOSWcGJauxNYsjdxkXPzvCoEy2rOcGcfJJ0LA=;
 b=wA3Me8IbLs7WuJSNyr9fqSdcPAa6LSZx7jdwaGSZNW6WQlsMq/JY/Eok6XJTnak2K7Oc0so9Wx+5/3sH98R4Ma99VDpSu2qgvMqyaxi/sm6VfldgrMrHUBPsKOob/BFfmtc+xNzVImR3F5hTPEzyAdDgDr6YSlY05jSkBFoEHVFzPSCKKf5D+dzFLWjYz+IUTNWxEWMmnQKShy68l7r2UymLJIFu35IgBtV6il5mY7ynMiFp0HslJX6LKoIYlBxiPhtjWGf59flyYfYrGDdbXSa9/EALhF4Ir5jfCMyr1DZeXHQKL+YifErbBjfDWqfctQQFJ+LDnteK2Kc09Nn6iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7487.namprd11.prod.outlook.com (2603:10b6:806:317::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Wed, 17 Jul
 2024 23:10:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Wed, 17 Jul 2024
 23:10:28 +0000
Date: Wed, 17 Jul 2024 23:09:37 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC v1 4/9] drm/xe/hw_engine_group: Add helper to suspend LR jobs
Message-ID: <ZphPMczgBXa5Me5J@DUT025-TGLU.fm.intel.com>
References: <20240717130821.1073379-1-francois.dugast@intel.com>
 <20240717130821.1073379-5-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240717130821.1073379-5-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR01CA0050.prod.exchangelabs.com (2603:10b6:a03:94::27)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7487:EE_
X-MS-Office365-Filtering-Correlation-Id: d66494be-e4a3-45b2-d324-08dca6b5a611
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EOHhxVBNrlYZuzteel0IoLCepASNo8LiCrsZWBl6mqRhkRP0sytpgVRSb13D?=
 =?us-ascii?Q?2TFRp55NOUpSMnY8PZ90EkqHFxsPPA2DWznPUN/IpEikjrzOjSbxqFNm0ITY?=
 =?us-ascii?Q?68S1qDt6tfh5TGILQn/mXXCx3VsL6sWNBNUDO34NmE7WpClUczpH9MomghZC?=
 =?us-ascii?Q?mde2NdVH4ZOKKat9JPlhwB0R9FoB0U9EIUVYynY7FksDtxXUmRkiCCdGAKWg?=
 =?us-ascii?Q?dj1UaKG6mJMbZb1zGbX5nH3jdpicVmyrF40mjArwHKq3/fLF2vAz0OGe8uSd?=
 =?us-ascii?Q?kZV7SeChevR9jSFBocEm2HMItCKX2HfJeqhqF5M8igfkQOGZTyv1QzVUbdTS?=
 =?us-ascii?Q?UeU0OrqlHMYZHYIn7UxZKsNKPF+elSII3OSyfckgFj/daJRxseWM/25OJFXX?=
 =?us-ascii?Q?+AZNpt3kmdnAu47e/TddZeDnXG4Nd+5pFhETzN+LfacDtTM4HsIJPrt8HAKJ?=
 =?us-ascii?Q?0rRX9maXgcv5qeSmcmtrSDH38AEj3Fe05mDsS1+IzZsK6Yi2z/+yjxt/IhDR?=
 =?us-ascii?Q?0fdGUDFDW4JSkK7VhvdIBGPHku8INauUUMOSScQpG6lnx4u5KvJKg3eFvdlX?=
 =?us-ascii?Q?7bUXvF5Ovw/qyBpbyNir93AKzrmhVt0V3tofLFiulAvXYpsDaqM/m4bgGKii?=
 =?us-ascii?Q?zq/N2m+5Iqu1LTN/N07dBdBoC8ErvBnLC4JVvABMalbRHslpXifW8ITpIS5I?=
 =?us-ascii?Q?1skJiGAYcg/Sd5gGtvedQt4F7QtRA/BlSiWtEiHQ9U7kvhgoi50ZuyTHn4h5?=
 =?us-ascii?Q?Fa6QObIgdeWlbFhOqFOYN0HAEs0Jmd2FB/Z3bd1wV9bZGDIs49/J1HOFhRRC?=
 =?us-ascii?Q?ds/JMh41B0gJPbhVPoGdBCzAqNA9AoJ427buI1nnfVjW3ob69g0ebOA3sCST?=
 =?us-ascii?Q?EcLviBDPu5i2b9SUT7gAVXSiEygIH249xm5P+/N8zdFLkRPsDxEYBW/ho3Nl?=
 =?us-ascii?Q?+xzDolJX9OzrOVDj3lSxXv1Fcn/VLoz1QIjak5I81CVezQgoKkzfumkLdJUC?=
 =?us-ascii?Q?aETGXzESKwIPujmk3pTVhiBWzqO8K2FWmY8o28pi+L97wS/f8K/18QE7qRbI?=
 =?us-ascii?Q?08sq5VlcEuCFDMCGYziBpDQDu3urtmb+C3SAW2B5UU01BZEhfjP+rFIIES57?=
 =?us-ascii?Q?/t3pvD1yIY9cryZ+dbtgSo2x6CxvDzkBG8qrQkTiy3HOgoqaJLM/P66oa513?=
 =?us-ascii?Q?u+unR4M/eYczNNZGONGzTgG6RWf+WW8fF9QZbrbHDl0fX0o9JtugmuuFZmDR?=
 =?us-ascii?Q?S3pP0TsvudiC9A/uT+JaBm6M+8I2xFA1K6709/s4W/ewL/H1emAsQKeg/+JE?=
 =?us-ascii?Q?wmthbhGJSzyleNliEoM06S/rO+pKXfChruLeesAGCEeTDA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QFUpOt78IqOZ4Bdvt9RAAkgXZHa6VlSaUG7ZLnu2L7nFWonxmriL+08U4gS8?=
 =?us-ascii?Q?R1ZfklICxj36oW91qPc5fWyDBWcF/mdjy4n7hgm83N1MvnlR5bEJa7OjmEps?=
 =?us-ascii?Q?W7p3nuRGpYGkYj6ULPkUYq3Ec/Fa2+0CTA++9kxJXU/C3BOdpqfrPHXgxrfm?=
 =?us-ascii?Q?Y30LIoXPBLDUdOuJDmUYGK9bd2DubHDjiOaZ/eoIxGEXGB9dGZ0PFNCPprcF?=
 =?us-ascii?Q?MsFnAwgjgLObiFHDM499xWe1rjTw+fQ2JtH5BTqQ51Ck4yeP8Rtyd+Kq5Vw4?=
 =?us-ascii?Q?U1yELjl+4m0xXGNyo31C3bN1xx0XWSO1+w1iLwr+BmtsGm/0i4l1lkYowGNG?=
 =?us-ascii?Q?mXEhuVawFHE5D30xVHH/i2bPWG04/T32itYvCjZeLCjvFJKVnW3tM8Ym+ckk?=
 =?us-ascii?Q?QgT5hLeR3sbSDCgOECIwvdkp2zojO2RyD/H5H2wbJNcnma+djGA06deJsoY6?=
 =?us-ascii?Q?gF29dPR2x220esYA2uBy0tjLfjn7M9WbjJWR/R3kG3MoAUtcJQ1gj7xgZc34?=
 =?us-ascii?Q?h6t0ZyrqMcBlPuQtTXJZ98cazRWwk2RskVAWfUXNPVYBTT6p1f2sGfiz8V/b?=
 =?us-ascii?Q?Iq2Ia5no2I+mgnkAJMPYj9iyG4Oi4eFvQPwjTB5gQ4xswuiDVyZay6+aCEDc?=
 =?us-ascii?Q?bDeVw+vfa8sDIWjnhuiAfgV/Bg2elZwsZNA6qgvZHCQtkGZns6HRhMEndp6g?=
 =?us-ascii?Q?xOmnbHmRiy8oPMMNT8RYOwDYJWTaxSjncpptuzzRpIjORUUvYKyXjpYHuqTC?=
 =?us-ascii?Q?KfysRt+dA/KPz7g2nTwh0iqkKexqgImm3aZm8e2EHL7MF69+xHL7KmceT34v?=
 =?us-ascii?Q?1QQoE6qqLu+KRJeb0ro9KiDpCbPLqJHoGFAj4OXm4IKbFkflrfOmcp7IqQmk?=
 =?us-ascii?Q?z8SXgwg2kAm8Poigw126mmtYG7SkzPgNxU3ppQXPsKb09jqt2nxAYrlZTURz?=
 =?us-ascii?Q?BkJiwmlClMAEYCTDx8ULW4NBWIY+li6v/x3HYjtv8+mtOp6PmDBAJZeyXrD9?=
 =?us-ascii?Q?V3pqkv100Kb9fwVIAschPwY2D4sqwyyY21ktCJScLksHV0kl+lpYwoZdbVke?=
 =?us-ascii?Q?0WjXH0mfNFlIAR6Bn36yioFYgsi8Gta8lkLwyOl7/sHjPTeilcxmPHfh/8l0?=
 =?us-ascii?Q?/kG9C1nC4/1/b7LKvCQzOAZVaFvdn+ja87HjqGbCz8tIFhsCQcLE2N5neRNM?=
 =?us-ascii?Q?Amn7jpIz4XSORAl+sBtFnpOUf/y9oBXcDOw3rEt2K7XJcb+7Ni/Lv3pKdOPI?=
 =?us-ascii?Q?hehsStJh7wnAfTDdEY9Ps7xAMRfLalSn4CVYUt67nBTwJomkwFnuBQleVtih?=
 =?us-ascii?Q?ITThHi2n0Ch71OONewug/c+DDUA6P9wwHO++fHiSFfsMN/3/2zhaTzZuDah7?=
 =?us-ascii?Q?lkxRxi4mcfBVxoyOPCcNd48kd9ID+2Bfo5A/54Iu0E+VJHySVx4MyN5X2j2I?=
 =?us-ascii?Q?iosPr38DgTtl5pU2tPsqgB45hMCpntqz6l91pMDVVR8GFpZeHKE6P8iq8I7v?=
 =?us-ascii?Q?pUPXFVTEK06UlqAfLxYzQZMAVRCmS1ijvYdjIO0s9ffk+CtP72waKUEdX/p+?=
 =?us-ascii?Q?/TEzSkZxUsZI2T1kbfQW2cFvdUKbb50EYWv4iA5dE0znLHy8KEccDGkTXWQc?=
 =?us-ascii?Q?lQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d66494be-e4a3-45b2-d324-08dca6b5a611
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 23:10:28.5994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fkVL9JeVY1TCcZlvBkEofGbBijFIXAFkVxK09vu9hJpsPmVTY1/g1s4Ja44EHHXWbGNVzMVoNkUY3K6U3Zndag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7487
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

On Wed, Jul 17, 2024 at 03:07:25PM +0200, Francois Dugast wrote:
> This is a required feature for dma fence jobs to preempt long running
> jobs in order to ensure mutual exclusion on a given hw engine group.
> 

Sorry, keep on missing things.

> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 4dcc885a55c8..850f7b15b154 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -1223,3 +1223,31 @@ int xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct x
>  
>  	return 0;
>  }
> +
> +/**
> + * xe_hw_engine_group_suspend_lr_jobs() - Suspend the long running jobs of this hw engine group
> + * @group: The hw engine group
> + *
> + * Return: 0 on success,
> + *	   -EINVAL if one jobs could not be suspended
> + */
> +static int xe_hw_engine_group_suspend_lr_jobs(struct xe_hw_engine_group *group)
> +{
> +	int err;
> +	struct xe_exec_queue *q;
> +
> +	lockdep_assert_held(&group->mode_sem);
> +
> +	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
> +		if (!xe_vm_in_lr_mode(q->vm))

if (!xe_vm_in_fault_mode(q->vm))
	continue;

We don't need to suspend LR mode /w preempt fences as the scheduler +
dma-resv + preempt fences does this for us.

Matt

> +			continue;
> +
> +		err = q->ops->suspend(q);
> +		if (err)
> +			return err;
> +
> +		q->ops->suspend_wait(q);
> +	}
> +
> +	return 0;
> +}
> -- 
> 2.43.0
> 
