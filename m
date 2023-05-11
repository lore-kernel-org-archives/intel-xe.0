Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36EB0C77B7F
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 20:38:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E976010E0EE;
	Thu, 11 May 2023 20:38:23 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DEC2891A3
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 20:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683837502; x=1715373502;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=v+xkRQGlrRkWvKJxjmaQyQM7b84PXvXM3SZAUb9Jx4A=;
 b=K+vw1tJQQZFm83SR8KhJB44ybjxi68/VI5LeWi0WldekuaBaHSKIe2XZ
 luzxrByGBjxPexe1h/eeJP9/h6R6Ef4OqgghAXZPV6X/mrO+mIzIOaq/4
 cF5J4qxPPb98bXmTDzKZOd9jDieKmgI5k7nzNFZIE0ykI/ZCym2ImYTNm
 2QcmnRKquZx9WoekIyI2iEiD4awIfVQW22eNLqRFMvCkvgLdpdK7AZWws
 skgRBnFwEKrO70Iw+01mh4LKE4PuBh5iXLt9JHc07uQSE7mJLyxauikI6
 y5M2FQXx3mF42KhyyYcqp4wQhSYOUJnKg8pFmozpS7i+ZBslaSaKFdwgJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="335137108"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="335137108"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 13:38:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="789529057"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="789529057"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 11 May 2023 13:38:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 13:38:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 11 May 2023 13:38:18 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 11 May 2023 13:38:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7HdG1xKVe42UQvBNFHSOe1JeTojHmDZOcQrtI5nqHy+e/OIuFpvszcWs9Ntzngj2z1oFgolpf+H+1QUlfFTzXFxqUcB7Um4y1hiHYPXBrtb/HzcNlvMtZXc1/k2nMUnFVSYr/3LSQDX3EDib4fnsZEQUxLyLCsRwb++oPCCeqfC/Ehz5X9sx0EHeFsuAkKyqm2emXRWXl1bJQX7AR+Ff/kkX0QG4FPhB172ofolVlV2VWoOJ7ZMhqykhIJhJEmsiQsQz7lFmp/O4HPwfb4/ZWa4PxvAe+do+AKvSrsmrp0jnuw8bhDF7jaFhOCazKkIbHUVkmaLVSYiOnOtqJ0Qgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j5y8RvbC6foQf1vd3Sh+v3ZLE9ITPdNz0hk2LRWUWJY=;
 b=IPKVf5XTvmEn8HFizdkjOERl2lPRj9VTH8SpI3UwVx3Qi2LF8zjn5VchOnsXUCq33APhj5CxwrFRqEmgpnsUPQaeJJ/gW1kjgzD6+nTMJOAMAvsp8ug0hzxZb/arGy5olSJ6LlZuu/udrArCBbGNqsGtDyl2obPfe0u2L/JQWLHhtc8ekbTcT/KgCKXx54zntvSatMFtRILlnP+EAoBEvU2pOyrNujPHZUbCS0ciAcyirZaYGMlZHK3q/rFYy5yHWF5bKpmv+0AuhAk7pIauadLICBd2M05UOC4QrhjRNwH0PCwR3yM9kP8WlvzOmoqdx4gTdJi/cV4OdMsTnzyMeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB4239.namprd11.prod.outlook.com (2603:10b6:208:192::20)
 by SA1PR11MB6734.namprd11.prod.outlook.com (2603:10b6:806:25d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20; Thu, 11 May
 2023 20:38:16 +0000
Received: from MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::e585:1863:208d:7e7b]) by MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::e585:1863:208d:7e7b%4]) with mapi id 15.20.6387.019; Thu, 11 May 2023
 20:38:16 +0000
Date: Thu, 11 May 2023 13:38:12 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <jani.nikula@intel.com>
Message-ID: <ZF1SNF0cpcj7B6OH@msatwood-mobl>
References: <20230511194822.626036-1-gustavo.sousa@intel.com>
 <20230511194822.626036-3-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230511194822.626036-3-gustavo.sousa@intel.com>
X-ClientProxiedBy: BYAPR11CA0083.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::24) To MN2PR11MB4239.namprd11.prod.outlook.com
 (2603:10b6:208:192::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4239:EE_|SA1PR11MB6734:EE_
X-MS-Office365-Filtering-Correlation-Id: c702148d-828d-47fa-62c2-08db525fa5ee
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N7iz5WzvtWykDwvxC8S+FdOkOx6ZVul0nngKxO1EADfX7H72hMnlfgxKJGEv/ljIRVqJniSP6yuQK6MfjmvHnj70Ff7ks1urYaCzAfH0J5dzSbQU1Tzyx6iIgwsqFH3UmhSdlroTJcoU++VruX/qw5bC3phtghuodhrZpCFFNOQlQi8Ztzc4YQGHDSLdDRZkoRDZH5d627Y9msWNTxXuoSk2lVq9a3gj54CtydC7Kx8wEFCH7OQOgSs5H2sf9bMwJFogTaNsyugsUvYlEBJYZ72acZ+GViZIEPl/PZdjA6p+OresEb7ooD4P7q8v9HAvyLPGX8BzZ6MwyeTNnVqSSBwbYNE6unGEZv+Ke8m6o4ZiBk7u4LeZNUAjupK0TmmT78ARZQLluOg9f2HsscXoBc1lwALJ8mNA7SOk1YLg/RO0wySkympiGD3PZOuAd3R8o5sCDjLbFJdidmA+nFKCRbAmBui/Xx/afTkJn1R9AfSwteq96TpyNJ9ac77sZUFKW5XQPZ/BXMELbHm8IiDCv1Nha8ILbCgWA6Z3IwRNMfzurX1/D4Hh74G8bTKzWZRY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4239.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(376002)(396003)(136003)(39860400002)(346002)(451199021)(5660300002)(478600001)(6486002)(6666004)(41300700001)(8936002)(8676002)(316002)(9686003)(26005)(6506007)(6512007)(66946007)(66476007)(4326008)(66556008)(6636002)(107886003)(82960400001)(2906002)(83380400001)(186003)(33716001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2tlcm1wVXZKNlNpR2U3cGl1WjdoMlkyYVlIMkpBWUdPQjRaQ1NSdDBkUkVX?=
 =?utf-8?B?YWV3N01Jb0d4Y1FYbG92ejRVTisxa1Z3Ti9tMFV3NGNhVHhmNUswRjBNWFQ1?=
 =?utf-8?B?Y2ZaY3A1dDUzcFZKS3Jab21BTEFqRmF5NFBFRWhRaWRzSjJNUUlpOU5yN2I0?=
 =?utf-8?B?MHNtcHBNWW91d3FIQ0JrL2F2MlluN04ydTJoWWMrbldYMWxpK0wxVDhQSVJi?=
 =?utf-8?B?UGJzZktibmFmblhlS3o1dlB5R01IWDc5cUYvcUx2Y0RnU0UrSFZBRXgvejlp?=
 =?utf-8?B?Y2ZPL1B5a2Z2NDNKeEdGc2Rtemw3VEZMWjNhRXN6NzhTUTFRNGhjVDlTdkgx?=
 =?utf-8?B?dHdMWHJzRXRTSUhhUUFEbEVZRHFZOTYyaG93TlB2MEZlcWRWbm01NSsycnZV?=
 =?utf-8?B?ejlOaDJWS296bXpITGFPdklEQ2tQdi83TWRxVVplRXNtWmtvZU1jaVhBV3l1?=
 =?utf-8?B?VmppcXdUZHdKTzhCUGRYaGt2Wm9PV2U2QUxOeHhMUjR3VytualZCVzBuN2hz?=
 =?utf-8?B?cGc1NG9HaGJQRWNBbHpoWHVaU01FRElEYXU3UCtQUENHbk81akhCclpZRWEw?=
 =?utf-8?B?TXE1aTFUWDFPdzZSVHRtTzFuWlc3U0xTQ3I0dHR3aWtxN3FmQkNhdU04WHUw?=
 =?utf-8?B?M0NJUkxQdzVvWUhhMFExWHIzcSt0YytwNXFmSCtDR2dBcElnTlQ3VTlRY2RD?=
 =?utf-8?B?M1dpSXVQcFJtdi91b3NqdGVuQVpOYkFNM3kxWlRVU2NuUFl5eHczM0JJSFE1?=
 =?utf-8?B?WDZOT3YrQTJCWm5JZVhpM3lLamZJWmZGOXlIN1hlWHdEY1BRN2NSbi94ZjBl?=
 =?utf-8?B?c0IrQTZjRzNscmZwQXB3WGR1Y1BPd0FVQnlJNDJHVTREYWdZLzFTQkpSSVFL?=
 =?utf-8?B?cXljM21QQlpVeVZZWHREczVuTnRFaE1HVWFwTE44R3lYcjNMRjloTGpqMDdI?=
 =?utf-8?B?bEpVc2c3KzhMQkRRejIxU0hZUTF2dDNMV0dUUExSQnBHL0lUcHF2d21haXVH?=
 =?utf-8?B?aVZoZ3FvTzM3bGVJd0dHRmRTSGROV1U0UjUyRytjYm54a0Ntdkh1WkJNWmlm?=
 =?utf-8?B?M1BjOEp1TFVOblJqRTBQd2QzNGk2VUtscGdzalVNRXdKdXhhcUMvcWkyRGFJ?=
 =?utf-8?B?YkVuSVJnM2NLQ1N1L0lVclorQ3NuZUN5ZjVsRnpJZ3RYdGdTci92WFkzRGw1?=
 =?utf-8?B?UWxGWU8vWjRmUVNZclNvNW9IYmh5UFBOSDQzWlBUeFlYbFRSOVRNb1ZrNS9S?=
 =?utf-8?B?MUpvekJDdkFNL1NNb3BDYjRHTmFORWo5YmdvQ2ZhQTBJZFUveUpvY0EzeEhG?=
 =?utf-8?B?SXEwTG5lMG1NQmhkU1BSQ1A4YnpPZ0txVFovb1hzMVpCWW1SMTlHdUpGUjBH?=
 =?utf-8?B?bzRLWXdmNFUrbFF6d29vWmFTMVAwU1lBbW5MVlNkSTI5aW5LUWZVL0lZWTUv?=
 =?utf-8?B?TDE4VzRJdnhQek02eGdpUGhhSlVybTZLbVV1NjMyVmNpWXNhU0t1RWpiNDRH?=
 =?utf-8?B?Z1hDVERWZjduajR4SUZNTG82TU9xZ2hrRmFHWEhGK09nWUV1RXBUVGkyUGoz?=
 =?utf-8?B?aUtreGxySUFuV0YzM1NaazhEV0NzMXlkTlY3bmFaVTJ2M2JKTDBhdUdnajRi?=
 =?utf-8?B?VVplVkpEWUtPb2pTOURacGdGSW94OFZTdEkwa3EweHZNUndmS0xpbjNJSHJT?=
 =?utf-8?B?QkltTnJBUWh5eHhqZk1oYSthMDBWUFdiaCtBdVB6Ny9QZ05TdncyV2FDaFN0?=
 =?utf-8?B?U29CSU5nZlBKNHM2ZlViVnBwV0FuU21zZHNJUUhTWEJCeGo5YUpZWlZMRTBK?=
 =?utf-8?B?UFArMXRFbTM2V1lKZ3ZYWC8zUjJnSG9ORkF3WFhNMWpVR3NKR0xxa0lkbUJY?=
 =?utf-8?B?azdTSDU2UlJZQllMUkNRN0xkTHpTU0Z0b0VtQndYV3loNC9UeTI1VXg4NWwz?=
 =?utf-8?B?em5CWER5UnQxZm1LZ29xbWF5bGpIR2J5R0prVGs0M2lOVVl2YTNTVWF1STIw?=
 =?utf-8?B?S2g4YXpFd29uNWxQTzFmQnBLVmZudUxpZU9SUkc2dW1US2hBeEZ2V1FFa0FX?=
 =?utf-8?B?NDhjSmVBKzJ3Q01TYUFLdjdIVTJhTGFaTkpqSmUxWnpIRkt5MlIrQkNra1pu?=
 =?utf-8?B?NXVmYmE4KzBsaXNkcmlOV3FUbERNYjZ4WmUzdVZ5aTVYZEN5Z2o0RzlXQTIv?=
 =?utf-8?B?Z3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c702148d-828d-47fa-62c2-08db525fa5ee
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4239.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 20:38:16.3843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lyaEv3ukIB/D+/WarJOlPkGV9RGAZumXLZUk1cQpFLIH5Bh9OhbOHa3vqqJICblg9gLI9xTGJxCksQ4cJ7ACQ9mMki2C8w7lB8tUQ7/9bO0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6734
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe: Call exit functions when
 xe_register_pci_driver() fails
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, May 11, 2023 at 04:48:22PM -0300, Gustavo Sousa wrote:
> Move xe_register_pci_driver() and xe_unregister_pci_driver() to
> init_funcs to make sure that exit functions are also called when
> xe_register_pci_driver() fails.
> 
> Note that this also allows adding init functions to be run after
> xe_register_pci_driver().
> 
> v2:
>  - Move functions to init_funcs instead of having a special case for
>    xe_register_pci_driver(). (Jani)
> 
> Cc: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_module.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 0b4541639bd1..75e5be939f53 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -49,6 +49,10 @@ static const struct init_funcs init_funcs[] = {
>  		.init = xe_sched_job_module_init,
>  		.exit = xe_sched_job_module_exit,
>  	},
> +	{
> +		.init = xe_register_pci_driver,
> +		.exit = xe_unregister_pci_driver,
> +	},
>  };
>  
>  static int __init xe_init(void)
> @@ -64,15 +68,13 @@ static int __init xe_init(void)
>  		}
>  	}
>  
> -	return xe_register_pci_driver();
> +	return 0;
>  }
>  
>  static void __exit xe_exit(void)
>  {
>  	int i;
>  
> -	xe_unregister_pci_driver();
> -
>  	for (i = ARRAY_SIZE(init_funcs) - 1; i >= 0; i--)
>  		init_funcs[i].exit();
>  }
> -- 
> 2.40.1
> 
