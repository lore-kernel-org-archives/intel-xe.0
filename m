Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C43C83F14
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 21:14:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3822C10E5D5;
	Wed, 30 Aug 2023 21:14:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7500F10E5D5
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Aug 2023 21:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693430074; x=1724966074;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BfoaZEFx8Z8jgXaXNocM26aKDVBkfc2eMh+otnGclGQ=;
 b=B8NC1ID0E/dIuWe6vBkOpJTswtOoOKqrw/gkXzFV3/lWR+31boawcRwt
 YRhPM9HevS/Tp1vuCYc1P+K/xuZq8twDoy752QtMy/lFhwY36dUDofL7S
 aaeM1KyNVCklq042bDk/w9xkuNiLyAaixaatsdLdI6SQJjKzHNBhqEdvO
 XLD42t9K+548A5M77z4Umixc7RnRX3ybay5Ap5bzQtCXiHh9+EGUQaSAO
 cEsvUpuW6zOXZngATsqBrvjzVH7+3n7CJyHOtLwJFtVm6nP5/lHKAH+tC
 kZyD2hlXAmiYSdcNROg0Tn9ZZvy6qB6ioNHQHRfeFJkQSi4uSxwNm3VV9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="378467719"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; d="scan'208";a="378467719"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 14:14:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="853874377"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; d="scan'208";a="853874377"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 30 Aug 2023 14:14:32 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 14:14:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 14:14:28 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 30 Aug 2023 14:14:28 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 30 Aug 2023 14:14:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nwxRDKVufgRV8OovPtebGZauP7XOMDW4wWjB12YzO3GBuykB+2cyhqfGe0fjgWnj+xuZhjHT2xXF2gIWtoJ0AWJs4UzIu8RJO7sJVEXk9fvQcCzQwlRKcFxViZrMxny0tDiRgOsB1tgcfAFBOxHMcQuqS3uNFaZfdRu61TAIEu59w4ten8NCcvVW1joA4p9pj6rt3ZXbW9IQw9zb5YJrUpB4J0NsXQo4W3IoGb8YkWsVq0VZDIGM5jSuNlaQGNvFLna/QGeN1F676VhlqSFDQrN3byoJpdOPkMDQbxGNicBSFD3m/Qji59WCHeGasj5wHvcUgcr8MhWONOgjERhnGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wd/cgaBJYW6V6w70rqqZIW+qdJwN3wM815Gw1d1O6DI=;
 b=aupX4oQtMq8cxBMp3+pdhYQS83bsux47VyR7b6GXbxJzWS5fxQCFu/iTaB8gSzGNs4DYne0TM1itq1CKecCBFDkDMlnAeThSo89bpSDf9RNVNKV7CRiehUxoxzWQBSxNbEb7X/lxddfaUjZGBh0MlAmBmmxAJ0HkPDLoQRi5ENiGIDy/9leFCQRFE0NOP3MPd+kw/dVJ01Fz1D0PlqajNhdPb9uyz9xnUJQiXrJI/x7K3IFh65zuNxdF5Zq32DrfA93XXxvShdtI0ypgzOrebDGCIjN6kvhz0cMU9qI9d6QFWiEioXUv5HjnscxOTeN1Swr7Pyuenfz1rkak/ks2ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6323.namprd11.prod.outlook.com (2603:10b6:208:389::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Wed, 30 Aug
 2023 21:14:26 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.020; Wed, 30 Aug 2023
 21:14:26 +0000
Date: Wed, 30 Aug 2023 17:14:22 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZO+xLmXJ4pyrm2Ky@intel.com>
References: <20230823091020.7-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230823091020.7-1-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:40::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6323:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dcc23a2-9259-40b1-cc18-08dba99e1738
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lZuh0XXGiJD5692b4+FIOH608x2bTctQkLyfcPqUJU08Ke4HcDNVkpok5ES4PoRPJpfK99/cQqeR9mNqJMu4K0DxZplzpS7f5eRaCupPRDjON9pDfMUXLmWyOif51J4c9OXffJM18r7wUmUF72JQrGypPhyNIfj/UObjcJ4Y/COoSlSRzYCfUk40i7VEMSGFA9jN6r4SOS/oa64KcQatS6L2u7MPrnRVNiYjRm0MENx86hQK2g6E73nDTi5XIPrW363F+DlyCg69/9C4HnwOVdkvqepQxUHVmwYMEhxI4kOw36DTuK809/lnlq/Afsn+fKR3ehOtV49/gwfgNeCIejxiFCli5LGLZlZlk2n7Lcom3SWcy1bJwXO5rVGAby/hXgUVkyXl2mDJuqG3fLalDGr2en1Sw0lqyuSI3Lq+68D3lxmmSsFHMsAUhKe5mCPHLSGJFoVn7Gox4iMO4QeLT422k8UhzuC8DwTaUrGqvZmnBs97w55MkQG9CeHDl+Yij9M8PB6mzpXJDO7vF8B5KoLfFQblcgrPoDKLe68oltQmjBC1K4f4gtmrjC2n94WgzE8TjgD0ZZrFGOOl+Fski2hBTq7VGa5K7p7DGLVfg78=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(346002)(39860400002)(396003)(366004)(1800799009)(451199024)(186009)(6512007)(6666004)(6486002)(6506007)(86362001)(36756003)(38100700002)(82960400001)(2616005)(478600001)(83380400001)(26005)(4326008)(8936002)(5660300002)(66476007)(66946007)(44832011)(2906002)(6862004)(6636002)(41300700001)(37006003)(66556008)(8676002)(316002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AFusdCNoFojo1ncjOBzhXj10Ox3A12rLzoFryr5/KejYKuv2vf49CstkRb7S?=
 =?us-ascii?Q?jR5e7isgHEnM77Xbi6I9aT87106F0yifaRRhUt5fm93Pc4Lp1cIxFfKZgppt?=
 =?us-ascii?Q?lsaTv1WIrpSN0R1MV9ZEzf/XbXnSUwDGvYrtl8n302eT60Uu9Z8GSQ8n54cc?=
 =?us-ascii?Q?NNcWVhU1t8lDWRvk/lenzpS/v/aBwLpe7ZdXiEBWR9SpO/Loc12xWl/cLcB9?=
 =?us-ascii?Q?sYKnrXh56eTbhEuQ0IFuVeghFUjUutodes4Wgy2PhWW6d8wBvvIQl/+fUepp?=
 =?us-ascii?Q?gph/Svt+DOch0adMiMcn8B7Mte1GAJZF9pyhlV46fZxL6kXsV3MwFHT6lNrf?=
 =?us-ascii?Q?vtLvg5qYJTpYAyOH5fVFHg0drKL4kEOU9qTONLKTQfqJcoTZ8lmu+bqroH/b?=
 =?us-ascii?Q?4E97YcQzSTOo3em93ahPK3+5/CHz2kHdcM9GY7kQow9F1pG6jIwI3OR6p/Fz?=
 =?us-ascii?Q?ReM7fEeb6d8WALStI7ce4yR65cXJMxgP9FYncHVJkU4Q5wS0hzJ+krtmiGtN?=
 =?us-ascii?Q?0YTI8sW2vllqp9DaRyRA/KZQtFcu305rWdDdpM3rOt8+fq6oxFkiufrB5BJQ?=
 =?us-ascii?Q?S5OFyV/lEbbVleaN7pEcWtNhvwr7r98M4vQ1+SuQ0ldVzqMDMoGadjU3KdXP?=
 =?us-ascii?Q?6A8BUy57rOsGRNUPnSw6WaY5rtDAUjgh6BhEWpnJ0XrYYmausoIxM7f6zwvC?=
 =?us-ascii?Q?EePREiHkPR9IG+NmV7agE78lkbaLvgd2lZ93qKGFnuRqnhYp7yrLMUntLy5J?=
 =?us-ascii?Q?JqK0yfRfvCQrOp5xzkT04ON34s0LigR0JllsG/312x5BPD16xrG5wlvzH/vv?=
 =?us-ascii?Q?1+G6btNEo2Oe5gnBV7VAaFdWVGVw5fWzrSyAen0dUHS5V8Yd62f27ZlHSp0X?=
 =?us-ascii?Q?4tEfKYSOt37JiPZNTVUo3hU3oK+XhUa5PJhFnpeiJ98WegXChiIai78i3bX8?=
 =?us-ascii?Q?MAzNKcCEOEFjgPa9lwj7SdeQWEIwS2FgWurCyaOrkzKZu7XxMKQP4KyFmCWi?=
 =?us-ascii?Q?lC3oxC3yfGD3PYX8uUjkuvVX0U/NEtoFM85a6Kg7Y7OwV0yihGvsRSbok35p?=
 =?us-ascii?Q?jkYCDUCLT6vV/uqzG/xiKpdYRWK3VGFJ+QHsMR7hjY+pVGKM1qBUmHvAd4Ol?=
 =?us-ascii?Q?uouNpsaz08zn+MQ5vsyKXz/yx1M2PmUXwRpNZraWHOmXI4y8fjTbBBZYMvb8?=
 =?us-ascii?Q?fer3EnGMZLLrX0Kh/ymgIOMs58vQX8z3B9SDgmOb7JJEfEsg0FXs1vw38WXm?=
 =?us-ascii?Q?7BiPKitu/u5QDICXgTgfGVsaSoT4NW8SWzPuzYi15wykAhdzdk2vTkAnaETr?=
 =?us-ascii?Q?YgSi3/wnJpNUh+lBLTGRfStHLWHpsU4+FRVlzseivSZFFZtGIyov3I2Bq8+/?=
 =?us-ascii?Q?r6E6CNCLvDcHD2vFW6PRgCULm0vXR6WLhJyM+sonEHi8dBXIErMOpSzYmlOI?=
 =?us-ascii?Q?+h/OxbI8tZZxlchaD7rSI+Ff4IBTs+SWHLBpi/UfnJR7BBpTIx/TJ2xfQWW/?=
 =?us-ascii?Q?tzlxqyqUOOsOMYF/8rNOflOW6pcnlTQRohN09WNhrOzoro6yPIRTF1ZAgRUD?=
 =?us-ascii?Q?F++IHLW2ZjcuQYvVd9/nQwjSOqfx99Sdl9w5p75m0RULhDUAWTGOoUv/Go7N?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dcc23a2-9259-40b1-cc18-08dba99e1738
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 21:14:26.6704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yay9vMT0ZxpOQu1tQXBoCXfgL25UbizPvFo5VFPBcMdg5nmnHW+aTuFRJF4+YnLdUzt6Fnswbw4jObcDcUpLzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6323
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/pm: Use PM functions only if
 CONFIG_PM_SLEEP is enabled
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Aug 23, 2023 at 09:10:20AM +0000, Francois Dugast wrote:
> This fixes the build without CONFIG_PM_SLEEP such as for riscv.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pci.c | 48 +++++++++++++++++++------------------
>  1 file changed, 25 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index f6bc6ae1c920..066bd12bf7b3 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -31,28 +31,6 @@ enum toggle_d3cold {
>  	D3COLD_ENABLE,
>  };
>  
> -static void d3cold_toggle(struct pci_dev *pdev, enum toggle_d3cold toggle)
> -{
> -	struct xe_device *xe = pdev_to_xe_device(pdev);
> -	struct pci_dev *root_pdev;
> -
> -	if (!xe->d3cold.capable)
> -		return;
> -
> -	root_pdev = pcie_find_root_port(pdev);
> -	if (!root_pdev)
> -		return;
> -
> -	switch (toggle) {
> -	case D3COLD_DISABLE:
> -		pci_d3cold_disable(root_pdev);
> -		break;
> -	case D3COLD_ENABLE:
> -		pci_d3cold_enable(root_pdev);
> -		break;
> -	}
> -}
> -
>  struct xe_subplatform_desc {
>  	enum xe_subplatform subplatform;
>  	const char *name;
> @@ -730,6 +708,28 @@ static void xe_pci_shutdown(struct pci_dev *pdev)
>  }
>  
>  #ifdef CONFIG_PM_SLEEP
> +static void d3cold_toggle(struct pci_dev *pdev, enum toggle_d3cold toggle)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	struct pci_dev *root_pdev;
> +
> +	if (!xe->d3cold.capable)
> +		return;
> +
> +	root_pdev = pcie_find_root_port(pdev);
> +	if (!root_pdev)
> +		return;
> +
> +	switch (toggle) {
> +	case D3COLD_DISABLE:
> +		pci_d3cold_disable(root_pdev);
> +		break;
> +	case D3COLD_ENABLE:
> +		pci_d3cold_enable(root_pdev);
> +		break;
> +	}
> +}
> +
>  static int xe_pci_suspend(struct device *dev)
>  {
>  	struct pci_dev *pdev = to_pci_dev(dev);
> @@ -834,12 +834,12 @@ static int xe_pci_runtime_idle(struct device *dev)
>  
>  	return 0;
>  }
> -#endif
>  
>  static const struct dev_pm_ops xe_pm_ops = {
>  	SET_SYSTEM_SLEEP_PM_OPS(xe_pci_suspend, xe_pci_resume)
>  	SET_RUNTIME_PM_OPS(xe_pci_runtime_suspend, xe_pci_runtime_resume, xe_pci_runtime_idle)
>  };
> +#endif
>  
>  static struct pci_driver xe_pci_driver = {
>  	.name = DRIVER_NAME,
> @@ -847,7 +847,9 @@ static struct pci_driver xe_pci_driver = {
>  	.probe = xe_pci_probe,
>  	.remove = xe_pci_remove,
>  	.shutdown = xe_pci_shutdown,
> +#ifdef CONFIG_PM_SLEEP
>  	.driver.pm = &xe_pm_ops,
> +#endif
>  };
>  
>  int xe_register_pci_driver(void)
> -- 
> 2.34.1
> 
