Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A51C3DA62
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 19:30:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D1E10E357;
	Wed, 17 Jul 2024 19:30:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GrUTyKdB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFCC610E350
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 19:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721244601; x=1752780601;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DIrk7HL2lRkaOSdLUg+7UVlRsoz6qoq8edKeGICsOng=;
 b=GrUTyKdBEJt3iTnA/Hi70dO9lXMoDYdHHXdruYwA4vbcmSHuUV0Cve3m
 1lD2cgt5qy7ClzxCKPnzzRGu6HxK4xklWm9p4U4bnCO04oZjdX6FbOquH
 DXBGvsjpQ9cCzy7OVLiRlM+kRux/dHC1jB9vtG21LX+dc3FXxgdrbyZHJ
 EB8UagZmF3nnWAYo4t886c6TnOaBKCJDrFnUT7GLOqMFAA++mjohZbldw
 JcCpdg3fXZ8+U3exxLrMh3zBoJbHquapx+c8gW6bwcX9B0N2f2E0lolFv
 iEjrukCWoRgf06AvWUMCdLcwOpMI7LryR7AenTGFMaR8MsweS+alayXLJ Q==;
X-CSE-ConnectionGUID: qH82ddcHRI2famEDYA7R5Q==
X-CSE-MsgGUID: FiSAMA15RTiDEPhFSHejGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="29442870"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="29442870"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 12:30:01 -0700
X-CSE-ConnectionGUID: DJm5wA9oQ36qitBo6q+cAQ==
X-CSE-MsgGUID: YMFFy9czTu+9esPPsaitdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="81542626"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 12:30:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 12:30:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 12:29:59 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 12:29:59 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 12:29:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ifI3dElqWoVEMb4TkjZ6gFweYYq+4GrCX93lmfS5BKwSvKfrEJXgNkz0S4H0vWHyzb1c6rmI/HFPyZmEB7dOPxj3TC0w3cu2bWwdL3N1a6yloyBhoKBlR7RQqsIM8/4dSK4l2FeAogINqRf+GgD7SM+QIbp8u5rtG6LkWILOjVCSdlXVhIk2aNk8eTon9NQmZWiqGjYcGT9lT/0WMAV36BPThU+X75taoz8EBdK/fgxMdVm/uUbe4N2j6xZAjAMU9YB6z/MuHWUyXogLGD41QMY46csiWDgxdTjC1FnlcynyEfkDz29azS3WHQrOwSWV+yzzbnOjOvEnm02zH1WoUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rGen9Hf8IGoz74OZw7nwrHq5mZOFpYqLKVrMI0K0+NE=;
 b=I8RN59IcZI8bDL7cPhQ4AmP9Rz3ZjKdZo9DEm57ZkNObKOCkNn6xPtuygiP0BcPePxZh5Do+UH/bklWOaKwsWkTFmMAk+CUu/r6Pu297ha0vK+W3pfEwWLJ46oqAKWAvwu5wzbgalrJ7qJCerObtG2dHrHHVdgMt51k9oWoYTvatlN0JfmUpgqqQKpThCpNXSAof90PWsnrbDyXVziz3fl7dCRnYrHxm+3YPn1XVCsY5aGtKp8PIhFp2Sl4Aloe0L7KJP2EHk75TK8O+E8xHArRRuI5VQcAsM3EKb92gbHb1SFtwD18S5TWYS2eT21pRnqiqjyIWmoI0YPnSpqcpYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4952.namprd11.prod.outlook.com (2603:10b6:510:40::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Wed, 17 Jul
 2024 19:29:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Wed, 17 Jul 2024
 19:29:57 +0000
Date: Wed, 17 Jul 2024 19:29:07 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC v1 1/9] drm/xe/hw_engine_group: Introduce xe_hw_engine_group
Message-ID: <Zpgbg9B06Wdbwirn@DUT025-TGLU.fm.intel.com>
References: <20240717130821.1073379-1-francois.dugast@intel.com>
 <20240717130821.1073379-2-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240717130821.1073379-2-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR02CA0010.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4952:EE_
X-MS-Office365-Filtering-Correlation-Id: 67fd7e79-33e7-4cea-f649-08dca696d7e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KEMnzod6YRYj3O+9ihkyBX2vt5CQMWVTVNBnZ2rITbatFtjfbL6KqiP3g81t?=
 =?us-ascii?Q?ZANgU4S11IrA/+/JeftbvAvR8cRA74GM00FBLx+7yk58cVzWfAwSvQlYt/il?=
 =?us-ascii?Q?uEGstKOsHTJV+TfomaKL33HF6G1C3U/7ycnAT/d91+dhVEbEma8CkMyLSTaC?=
 =?us-ascii?Q?YyCBgcE2x7Vs65+8XT2t23Kk5SscSCWjK1vDCFl+p96shJjWC643OHz4bYz8?=
 =?us-ascii?Q?PnUP5imjgmysRIKO8IKlEuZECqUhnAA7ickc5ohdMnWdjxJoweVj9W7YlvX3?=
 =?us-ascii?Q?aoWrRelDW5oTK2abTys14gaaiAa4flJl2jLPl/qfvJVRWpaT5+4Sbwmq7RSK?=
 =?us-ascii?Q?9rYysD16BPfXam8QrPrmHFhjwCW1RpmneR8pansrqI5/aPMC1Us1OhjLN9wq?=
 =?us-ascii?Q?p2wZp6t4EXZ1eyedWDvgI0FOCZ6zvu7DTHVEgl0shkf+UTtNJrhOcBKZoASg?=
 =?us-ascii?Q?Aj9YeOSA3jUmF1g0uWWqZDqJevgff4GiCmx93FWFaPkYTBuoFmpQZiF3xzZy?=
 =?us-ascii?Q?ndQbjbXIk/VTBqjS2yKVMZpuFR+y4Qxag9KK4yMuk2WG1P41KqA4KCIFXWrH?=
 =?us-ascii?Q?q2Oa0ESfyA5uVI2E869x/kBU1lwbLrLqXa9xrQeYEbdDKcC6ui/iV+afooAQ?=
 =?us-ascii?Q?QHrkufy5TETjCPST4/q9CGZmN3nNHaOrFTezxe6w61NmVZMjzA3QWC8ALS+0?=
 =?us-ascii?Q?WGoDUK+erPneTHjF5tAkvG/WP3m21CGSxPNG2cyD+b2yb/1eXX1vfOt7rXsT?=
 =?us-ascii?Q?Uw5mLmoNrHST8EYfH6pJSqW7eqCti7HcKfAQK6cya4OljuneCR/YHNQqdB6U?=
 =?us-ascii?Q?LoyaXEOD34FqbEymL8cKx4as60vJYvi36H6jqqhqQSNrWrlTkCnlbHbaSCQz?=
 =?us-ascii?Q?6ovRnD3a7wUyjlcE6AxIYgfdHs3NdoAEepBAGLmx/4PtoZAYxCJQJMtsSCwS?=
 =?us-ascii?Q?uKD3SCEz3A7il+yp1rL0ieKKO2WSVwVVwu8pD92wBoSY+4TGA8j0mL4P2W4G?=
 =?us-ascii?Q?7OC+GKd3JJywdNcM2v9DfRu87sjck99TaznjNbFgPdyfqT2W72xSprRfIL7x?=
 =?us-ascii?Q?bZKiCwkCyAmvwOdpE5XdtzT/RYa359/Z4r1vgwzz1nWTAfP/W5YxPrLYwt2h?=
 =?us-ascii?Q?jTncjcEkOKw/yFx7Hh+Ogi4i/D8QZ0fxu17DVXdwEdqngnyhWJcD48rs9AzB?=
 =?us-ascii?Q?LJSiYS5Eq8SI51mSBprCf9viIiFjO9Nq/LTgRsLDp0bd8PT1ZotXmGQypvKU?=
 =?us-ascii?Q?kA1vwQ6N1mLRMGL1ZyL7DiMnTFb6332AMR4gQFDdS+qq6YcKAB7IahY1kGmG?=
 =?us-ascii?Q?D7NR0nnGMmLhA8009isEGmYrUwcaG0KGJ/WbkmUYsDqUaQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?be4otquF9zbWRibthJ+fahjo/0jZgwATaRG8yxzgZrgwqFNRhMvaNTtSr2t/?=
 =?us-ascii?Q?cx6AFkcocmKEJaYfFg2w8kaucCMCJeR/4fboM4HLP31G3TBYVsR0+TTDCikQ?=
 =?us-ascii?Q?xleaM1T9s3IfMCq1t0pCn80eoyI1Ato6IKMcRysqunFe5TaMjhqs5SMn8D1f?=
 =?us-ascii?Q?92cK0NvNm8tfOYdo0Z/fmatRTi6/xch6nfgzhakGINf77BaEIjlg++IZ2pkp?=
 =?us-ascii?Q?uNTG7oeMY7/1uyKBx8psGPnBK70SqnT66W621Z8lZki35QjdoLV7Vrwy8bgs?=
 =?us-ascii?Q?jfs4kgAR2n1+mCkLkV+XgxZRGFyPrCdv+bO5WXhFJwtEiDEph1+TfYXhMUmZ?=
 =?us-ascii?Q?T50knvMVKs8jt3eNJqaWKFpOyBpjz9/FGGVM+GGFgSjkM1ye6bpJQnxHecO2?=
 =?us-ascii?Q?6PV/1vEGLRz4N6+tHyWtwOtzWEghaGNENfforaMml87ARn2kClBO2Lh1lJ5P?=
 =?us-ascii?Q?JkuUhbykwIIcipD5MJBxf7UZlQ4eFw3OSFkcdtUEa/TrLay8a7zKjdbfybsF?=
 =?us-ascii?Q?4OhALCFrRV3DE201XOmCdcmE5C/wwws3yn2JazVjN+jKDXxk01fklaYvmYVn?=
 =?us-ascii?Q?YvVqwgY06EAelFOTV1Mpf/3jMWBJtIkvO7xwTxx692OWi7PvM68/E2dWJXH2?=
 =?us-ascii?Q?auE+UhTmr0mmYuz5bepLMRrqOCa4n6Xo0CCuE8wlTlJwTgKG4g3+PjbXNbct?=
 =?us-ascii?Q?hJ1KVsge+Z4x4eaLJC1U523slpDhCdMIWO5FwnC8t4bHRd6w5BJQGb8RcRBh?=
 =?us-ascii?Q?GoslKATaLI/bM3OC6gGXKZKFood74Z5FU5kxNsoZIq3xL3ryPkwAWinD7Yc5?=
 =?us-ascii?Q?z8A/u9VAsO8sp/2prrq6NJBVCyEgbOStziDrZWra+n3aj/8Ge2vdUhLl1GRg?=
 =?us-ascii?Q?Ke7sSU7bKmYuaBaQU5EazGdZC1Ov2/s1wWyuYeUu5sapF1EkQiEQS5dAKT+/?=
 =?us-ascii?Q?NCII7mBsXx3Os8T5z94YIAOJHtxfeMSYAr/B+spDFuagDxGHe8AV/TfoCFmw?=
 =?us-ascii?Q?kZjpaFSqdFRUPYtCt3LNx2WFKtxoZQC7L0zCBZTigVuwo4Hm5a0gnt6yrYn0?=
 =?us-ascii?Q?Dr2X2MGatJ8l39wIL5Iyg7rUt5q/ithDwQXSVgcAS5ajI62lzCvSfhBWP9Bz?=
 =?us-ascii?Q?qYTq9W4k913Ii5/BEFZHmvBfYMmM6f7j3wXvmZymYCRK6sWaxyy/rbHsf/h6?=
 =?us-ascii?Q?voOu+wy7BXeg3vdliXsBeqPsWKiX6+eLExiZWmocdiXIG0JGxigctUMjPJ0O?=
 =?us-ascii?Q?3FToxkRH7L8LcMvZnJaQ/ytkqSk6lZoNmkiDYpAs41YCIx4Sc2PAs+4PcEI8?=
 =?us-ascii?Q?34Vkxp+U3KDpJwtP5Bmcpv3ax5319gTipcctFGR2HHy2HhbH85T9ObhRasfK?=
 =?us-ascii?Q?uUdVdRfuCfD61hY2j5mfa4p3YofhJ5BQtevsjepQLIkJjEqvw/qZji8/slMJ?=
 =?us-ascii?Q?mPovTZtlZJPBi5qFPKLhHrvQYEW+EnwuJ/389cXcO0OgzeKb+ntU/LuTu52e?=
 =?us-ascii?Q?7weYypk6oUde3rMa5NBfWK/5HZr3OYtC81vrfbWx2A1YVznb0cmjgUPnys7t?=
 =?us-ascii?Q?iOpBFvkN4xv82V1uUv4F6srfqHTBY+jKZ7+TL3T+XiVu0jKWxAf1XAxOhfmH?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67fd7e79-33e7-4cea-f649-08dca696d7e4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 19:29:57.8276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WZWbOSCItgUFBn2qNvkEkkcLcJogNGY0ZyoT0Sw5gBqEcy2XmHqvOdO3RlobZlaRkSUlEAgvKl2aOEk8lgKc5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4952
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

On Wed, Jul 17, 2024 at 03:07:22PM +0200, Francois Dugast wrote:
> A xe_hw_engine_group is a group of hw engines. Two hw engines belong
> to the same xe_hw_engine_group if one hw engine cannot make progress
> while the other is stuck on a page fault.
> 
> Typically, hw engines of the same group share some resources such as
> EUs. This depends on the hardware configuration of the platforms.
> 
> Currently all engines share EUs so for now only one group is created
> and assigned to all hw engines.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c       | 48 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine_types.h | 31 ++++++++++++++++
>  2 files changed, 79 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 78b50d3a6501..f8df85d25617 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -431,6 +431,53 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
>  	xe_rtp_process_to_sr(&ctx, engine_entries, &hwe->reg_sr);
>  }
>  
> +static struct xe_hw_engine_group *
> +hw_engine_group_alloc(struct xe_device *xe)
> +{
> +	struct xe_hw_engine_group *group;
> +
> +	group = kzalloc(sizeof(*group), GFP_KERNEL);

Need to handle kzalloc failing here, e.g.

if (!group)
	return ERR_PTR(-ENOMEM);

> +	init_rwsem(&group->mode_sem);
> +	INIT_LIST_HEAD(&group->exec_queue_list);
> +
> +	return group;
> +}
> +
> +static void

This can fail, so:

static int

> +hw_engine_setup_groups(struct xe_gt *gt)
> +{
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +	struct xe_hw_engine_group *group_rcs_ccs, *group_bcs, *group_vcs_vecs;
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	/*
> +	 * Current partitioning implies all engines share EUs therefore
> +	 * belong to the same group, so create this group and assign it
> +	 * to all engines.
> +	 */
> +	group_rcs_ccs = hw_engine_group_alloc(xe);

if (IS_ERR(group_rcs_ccs))
	return PTR_ERR(group_rcs_ccs);

Also you will need to cleanup these allocations on failures and on
driver unload. For driver unload cleanup use drmm_add_action_or_reset, I
suggest adding that below.

> +	group_bcs = hw_engine_group_alloc(xe);
> +	group_vcs_vecs = hw_engine_group_alloc(xe);
> +	for_each_hw_engine(hwe, gt, id) {
> +		switch (hwe->class) {
> +		case XE_ENGINE_CLASS_COPY:
> +			hwe->hw_engine_group = group_bcs;
> +			break;
> +		case XE_ENGINE_CLASS_RENDER:
> +		case XE_ENGINE_CLASS_COMPUTE:
> +			hwe->hw_engine_group = group_rcs_ccs;
> +			break;
> +		case XE_ENGINE_CLASS_VIDEO_DECODE:
> +		case XE_ENGINE_CLASS_VIDEO_ENHANCE:
> +			hwe->hw_engine_group = group_vcs_vecs;
> +			break;
> +		default:
> +			drm_warn(&xe->drm, "hw engine class not handled");

I don't think this is a warn as the GSC (XE_ENGINE_CLASS_OTHER) doesn't
need a group as it is not exposed to user space but pretty sure shows up
in the for_each_hw_engine loop.

> +		}
> +	}
> +}
> +
>  static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  				 enum xe_hw_engine_id id)
>  {
> @@ -761,6 +808,7 @@ int xe_hw_engines_init(struct xe_gt *gt)
>  	}
>  
>  	hw_engine_setup_logical_mapping(gt);
> +	hw_engine_setup_groups(gt);

err = hw_engine_setup_groups(gt);
if (err)
	return err;

>  
>  	return 0;

return drmm_add_action_or_reset(..., function_to_kfree_groups);

>  }
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index 70e6434f150d..c6f7bbcb2a41 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -100,6 +100,35 @@ struct xe_hw_engine_class_intf {
>  	} sched_props, defaults;
>  };
>  
> +/** enum xe_hw_engine_group_execution_mode - possible execution modes of a hw engine group */
> +enum xe_hw_engine_group_execution_mode {
> +	EXEC_MODE_LR,
> +	EXEC_MODE_DMA_FENCE,
> +};
> +
> +/**
> + * struct xe_hw_engine_group - Hardware engine group
> + *
> + * hw engines belong to the same group if they share hardware resources in
> + * a way that prevents them from making progress when one is stuck on a
> + * page fault.
> + */
> +struct xe_hw_engine_group {
> +	/** @exec_queue_list: list of exec queues attached to this xe_hw_engine_group */
> +	struct list_head exec_queue_list;
> +	/** @resume_work: worker to resume LR exec queues */
> +	struct work_struct resume_work;
> +	/** @resume_wq: workqueue to resume LR exec queues */
> +	struct workqueue_struct *resume_wq;

Assume these two members (resume_*) are setup later in the series?

> +	/** @mode_sem: used to protect this group's hardware resources and
> +	 * ensure mutual exclusion between execution only in LR mode
> +	 * and execution only in DMA_FENCE mode
> +	 */

Prefer this style for multi line kernel doc:

/**
 * @foo: some description...
 */

Matt

> +	struct rw_semaphore mode_sem;
> +	/** @cur_mode: current execution mode of this hw engine group */
> +	enum xe_hw_engine_group_execution_mode cur_mode;
> +};
> +
>  /**
>   * struct xe_hw_engine - Hardware engine
>   *
> @@ -150,6 +179,8 @@ struct xe_hw_engine {
>  	struct xe_hw_engine_class_intf *eclass;
>  	/** @oa_unit: oa unit for this hw engine */
>  	struct xe_oa_unit *oa_unit;
> +	/** @hw_engine_group: the group of hw engines this one belongs to */
> +	struct xe_hw_engine_group *hw_engine_group;
>  };
>  
>  /**
> -- 
> 2.43.0
> 
