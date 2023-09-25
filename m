Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9E5CE79A7
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 22:41:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A3B810E082;
	Mon, 25 Sep 2023 22:41:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD6510E082
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 22:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695681676; x=1727217676;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dfPv/Kyy22c3lvCaD7NtnCZlWK1McMq4WIWj/pvKPFQ=;
 b=JpvJMWJI1UTjKBV+azC7Z61cb9nuNWLX/e4Dr80KhV8J38yo3R0dyeyu
 lRPlXIw1Cw90cd4A+Z/b8XsnH/qQtX+RV4gg5drLT2F7zVdPSjc3DcC8j
 To5as0SsQs+yBptNKnPXNEhkZy5d+RR3ST64WDK+YY1jLupSxkO7wFi+n
 iLeYPhjc8gC0WJ0mF70+lXeEzIx38/h7wqRzUVfycl/XQWaK/qJpZXPIP
 st6U/4fWSRE6oZ6xZzEpP/n0X5MaW8OZ4ziLHplCBrtgzFWL+lvzcuJdA
 cW2lYI6/Q8cQF9YS4dqk57tjjQv05roKMCl+69J53LJ6HuoAm0I5yyGaE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="384204145"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="384204145"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 15:32:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="1079447819"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="1079447819"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2023 15:32:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 15:32:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 15:32:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 15:32:00 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 15:31:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l2uEtIkhYHmnsI5pVXlaHf/Juz03dprjfbPq/72kFbuzR10CewU2gbkWjSAKsYAKxs+QNRZQqSu6tOe6C14E+5hpAS723HWR42iWRmgRLGvJs66X1/+wyrJYoZ1D5LHa+p12pchRU9KsUvr47kcOzXss9NIXJlENQ54qAR5CgtjFo0NlbtfjfLz8XdkuSaL635JEFrI8l1jByodbDfhq6PzAmtmk+Mz+LcvDNXKnKZsIPORE27g0x/3reMvIqtZ3G6pe+0qwhUvFMVnwg07Za37rvZ3kV9ohT7vKyVcc1cLXX2tB2kCd2ppMFz48+LJY+2svTEGUdjPKScnmJzEXUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tAXkRK8EQurYWhT0BspT6FB+DjyY7leM7eTj34Fo1kI=;
 b=CLzBmkvk83zp1gOGOAhAP6xoIbYjpPel2DxrQ2hZfbBNzdBFT5Fk5D6k/Un2ahISZRFzfqT21EA+hsMeb3lNvPz6i+WOYofVCzmRATNhfRrGJCbDsEY8tV5Ol2PAcOc/IcZF1jjfgdiCbC5jR56ShxtJfEto8X0qxjFwnrBQSXs/6Ev5LnG9vYWhS1B8WTKd92JdLZzpXFoFrSKI8hufVtWw/H96CblZYwtr6+xD/bWpI7XYmWUm42i6Yzp8AS4SRpMW2ukxJRlwHPkG5kbWMTyba7nOMUivQVMMbfLnPmkZTyF92QZOoQQSbOsozSWlHVMYgQA3DVi/acPJgALGmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM4PR11MB5969.namprd11.prod.outlook.com (2603:10b6:8:5c::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.23; Mon, 25 Sep 2023 22:31:22 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Mon, 25 Sep 2023
 22:31:22 +0000
Date: Mon, 25 Sep 2023 15:31:19 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230925223119.GY2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230925221049.2681491-1-lucas.demarchi@intel.com>
 <20230925221049.2681491-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230925221049.2681491-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR17CA0039.namprd17.prod.outlook.com
 (2603:10b6:a03:167::16) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM4PR11MB5969:EE_
X-MS-Office365-Filtering-Correlation-Id: 274526db-56b3-425a-b5f8-08dbbe172566
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cwDJ/DUpR9KTVRzyMDa1j1Gj4ylNdCDWMdBDFyoMR6VZA03/V5g7IEX9fRHzgPRzUmhNsXBaDqYBKkUptoTeSVNgCrmsG64hfD5HFI1AtatPa3zjBKx69aUkaUfHh9tYRoWKRLMaYScjTbq+r0+3bx8MMA0ze8wiPiCxhY2bc8k39MgNsTnxMea2HqN1bgS/vw50R1vburH/amcRkoVdO7JhYxzrCxUBCaXQqsJkOMp5fR5XOvRVeNb0k9WehidwW/jJ3ymCmlfwtaWm2j4CdA6+bHn1HE74n+mlmSuzrZ1FMJOroZ3JyfDIipsO6U79LIeEdoRheRtXeXDJ375kCvnO42wJ+jnJyoaDx3viLPyRbTRRaYAWCUb8Y4CjQ57Dd5tMhySJsN7fBj88qccjXZorKrapxPRQfur5LKga9TlrMWQKVl58s0Hl5F/bz5LCyWw0nma747n3Af7pmB4ZOZyTlIhwQnQvY/oo8noUUU4cHdoZu8mXdCATEfE7R6UzyO7CZqpZYDEw1CLf3wDDdqD+ejrW3JZx+fwWpp7INxNo5w9CDtTi5n/+wOkpiaw8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(396003)(346002)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(6512007)(33656002)(6486002)(2906002)(6506007)(86362001)(6666004)(478600001)(8676002)(6862004)(8936002)(4326008)(82960400001)(41300700001)(83380400001)(38100700002)(5660300002)(1076003)(316002)(26005)(66476007)(66556008)(6636002)(66946007)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JhrO6D2OOapSta8lgX05W1/o08yITOl9GbSvDLXLaN2rdwwX0gdExkmxFX8q?=
 =?us-ascii?Q?hylwkQgyh72m/Qwtw4xxZfmQifnGfuG9+NPTELodqzGiY5v3jWndmnfKalDo?=
 =?us-ascii?Q?4YK5qrGPF0PFrgqoLkDowjky+RHxJU4BZ22aUzp2oTxTbg+SC3xmzfcTGGs4?=
 =?us-ascii?Q?USkaLFun5SscA+OnUsnJ4kW2MGdWptmIu4dpuw+6pcV22ggPrmZ6gWlILZxy?=
 =?us-ascii?Q?RJdav5gghhULrat2NRqmz07oEgpQp9slaV4xOTZZCbgyfQ7EmM9/ZYxhtOoK?=
 =?us-ascii?Q?+WmTH4wxJ94XS3XomHs/7ysiRzyOSzYi7/dUNErB3m+JIs2MJs8FqKdc0qVS?=
 =?us-ascii?Q?uYaMmWMP7EY3quvR5u3VzaH+2bpqe4Qu6Q7EOFomOsUIT0dejfYbEr8PXUeP?=
 =?us-ascii?Q?O9faIrV3SgkC4zkJQfJFmO1vtykfjz2etO1j3A9a9FSuk7momTfs1bDDAaQy?=
 =?us-ascii?Q?VcFANpCZvCe90eVavXJ0+5CgnKphh51MUxuh1y3De5bM5neSk5jRg9RJOJ7Q?=
 =?us-ascii?Q?xmbNM1BKy9eu09KdIe+3VIj/edF4FIkbGcTNdUVxkXAoBL51uSKXHbZtZEBx?=
 =?us-ascii?Q?nFM4aP9PS5StQQRJpP8IQRjdGEYsYI3pF9g4BUKhB1obiCQpnZQlwkX+QvGX?=
 =?us-ascii?Q?7pbXx72te3jcvt6O9nmFlMnD7RwZiZj4x6UZkI76EqMaxdHvsmGKVWn2PwiR?=
 =?us-ascii?Q?A9Ihr9dOcRGAPpFOsVRcVfnPGO6S85/25gDPRgQBoTSvalBIzkhB6NBRaeFs?=
 =?us-ascii?Q?gGvcxSCV49aNBvChQo3i/GtgOsE3N/wyX38LYwLPjmnhiFY057dP1m443eE6?=
 =?us-ascii?Q?mziZpWTQ/k3MJlVh8mirlZIB1bUEl6XiChdinkd67MWMZI7+kDhfNbl4L4Zs?=
 =?us-ascii?Q?gZgRoQZdvy2oKLmTvfkxQ+UaVlMcgWqKORlPJIjdTbVOnib13otmpHkvSjKp?=
 =?us-ascii?Q?jyPgVgWn7CLbnzSC0ix0aHt9xd7fnf1Xj4bBv4ZL5jN2XU+KNYAxqDOThf25?=
 =?us-ascii?Q?6NvJ6tCSIVrvffu2fJszxwXQgaOUd5c9c7tFMMvxEgy9APoX8RfXZ1ioS6Bo?=
 =?us-ascii?Q?OUO0/XHH0vCRWH4x/a0iRXIsDtp64uYJD2t3B9qySuDmjCe72Dqb3g2Vxukb?=
 =?us-ascii?Q?FLodNsoraZuVEqEE954oQZCD9gtZTiCl7oj4J3pZYh1kiZDnuUxJHeKu9FKo?=
 =?us-ascii?Q?cYHXnLfKAhLXYSMJNyPriPc/msSnJk7RyhKhLxijxHllg8ZwkO+JDwGMu/97?=
 =?us-ascii?Q?69zPNVBoiZHQd/k2cgAZeP6MSBNIMSWVfOaocJDlKZe+MqAIlNPr1QM90fPB?=
 =?us-ascii?Q?ye3hnTeTiIQFILwbv4xJqss7AF5HLrgcf1svL+DAh7DMDj1OZ7quGKd+bsiS?=
 =?us-ascii?Q?DcofLhUgosuAz5xy4SYWBRTSA+FUdXWjHAmxED6p5JSrgNKohpzXNxSSdEw7?=
 =?us-ascii?Q?HlMQcP5zIIAjh6omfo1HoNrXpK4RxBYnVmONw/Z+B/zRalY8XD2iedNPVh02?=
 =?us-ascii?Q?NCd1VijtfaaurRE4PPQ92hqQXmkz/SAcCDgZjYHN6cx/lUVDP4Lew1BAoT3b?=
 =?us-ascii?Q?6v3PGTVJ/4PYvFXzuoVHLu0isj0geXtcU3YYDFv9WAZoAcOPtK7pllQGu2p0?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 274526db-56b3-425a-b5f8-08dbbe172566
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 22:31:22.5626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3BI3nXDmpEd57vG9WKuInIA7Mq0cPdCXvYp1N7oXDwftPbdvAe52puqprXH8pfaXLIhZD1FLBT52ZzFC0c/SCoLolDDtlOg5lo1LAZgOrvw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5969
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/9] drm/xe: Remove check for vma == NULL
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
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Sep 25, 2023 at 03:10:42PM -0700, Lucas De Marchi wrote:
> vma at this point can never be NULL as otherwise it would crash earlier
> in the only caller, xe_pt_stage_bind_entry(). Remove the extra check and
> avoid adding and removing the bits from the pte.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Okay, this takes care of my comment on the previous patch too; I guess I
should have read ahead...

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pt.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index afadd399684c..0b8a45609e83 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -136,14 +136,15 @@ u64 xe_pte_encode(struct xe_bo *bo, u64 bo_offset, enum xe_cache_level cache,
>  static u64 __vma_pte_encode(u64 pte, struct xe_vma *vma,
>  			    enum xe_cache_level cache, u32 pt_level)
>  {
> -	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
> +	pte |= XE_PAGE_PRESENT;
> +
> +	if (likely(!xe_vma_read_only(vma)))
> +		pte |= XE_PAGE_RW;
> +
>  	pte |= pte_encode_cache(cache);
>  	pte |= pte_encode_ps(pt_level);
>  
> -	if (unlikely(vma && xe_vma_read_only(vma)))
> -		pte &= ~XE_PAGE_RW;
> -
> -	if (unlikely(vma && xe_vma_is_null(vma)))
> +	if (unlikely(xe_vma_is_null(vma)))
>  		pte |= XE_PTE_NULL;
>  
>  	return pte;
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
