Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59326C77B75
	for <intel-xe@archiver.kernel.org>; Fri, 12 May 2023 17:56:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 074D210E00D;
	Fri, 12 May 2023 17:56:06 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFFDF10E00D
 for <intel-xe@lists.freedesktop.org>; Fri, 12 May 2023 17:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683914162; x=1715450162;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OvbTg/2ynYNNUJB/RCdQZDvV0q/VXngACaMKSTdVLwI=;
 b=N+J/FdhsDaEltY24u7p3W5gCOxb4OfIUl5jn1/QO70c9obgZO+hqp0rW
 hPPUiTKbEsaeaxPt7H+lHMiC2sM+F7/OF0pymPVfnHRLkTrJyOn4b2Z9I
 YPuTuLbiyZjfNtTy/jkCLJEuogMWRg1gOZDHNPK0bEpY/d2CrfMw8kFpz
 UVaMUGTSH1CNW+JAYNpWssapkvQVCIfLSXxziiw/LWROkg8KbCbiA8vDg
 xquMQm55amKQaihk5dlqbM4Bqnm7Cqm8JJo9gA010CHeOQRilkHr0YVBG
 NXvRjrQpPaK8YeX6clQ1ucxjxPH8G575JMi3BbSuq8wtwpm1quHS2RRxA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="437190289"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="437190289"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 10:56:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="844515862"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="844515862"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 12 May 2023 10:56:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 10:56:01 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 12 May 2023 10:56:01 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 12 May 2023 10:56:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrd2PEYR/5n9p+4VlHb8F4Ws/l5PFdX6TtPDGdcxSu/vJImmkn9+nQqVeHfZIJCTchuQf8EakwKFErbE5SB1Gf/NJeGBIw/aAt9+93rdON1PuvoR/SocO37B5kJShE1SR6QMyW3VUgEeC/HUpZ+jidh5nzFpZfmUjctLB2jgzVdmCp+En5UTrFkmyqVvrI/9PKMbIlLsEI1zG8BShQKI5PYBu1w0AaYF7XKMyG9Yk3qmiO0TLudWhCTta7XYuso2hG9v/gbubo5cWZnqCDqL0BOpUfyyo9ExQmnPwaCMdmCQpQ7GZp7kAVVteAKz4CU743C9TNcAEaRDQ6xC8n6W+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fMFNDC5cONgCcyfA/FzUPhRdZ+BXX2NPWx1Kp56RuqM=;
 b=OHfmhcuFljvAgapsT6Ido39Zq7CUWhcLLWHzpFT5zdxGi3nilNNqU+6Xi8H+fFd1izWSlTdVq7CP+/O24c7IR91fq9xnxZE2Q2ryhbM2xY/KXGttlaLgf5iaRarQuof2fhxPsU3Egs0eOsRpGbCc3x/LXIn7DZZfkMEoK3WLbbtfwGc60+Dq8aXrQ6DVhpJi85xCZNTfh5dnZZMBjBBaKoVTQTMRTawqk2L1CBPherhWOpUquL5h6Txkq44rZZsIVEwbHVYdDKH03Bkl2uHFUlEtSESZA/y8V6/6r8Ccvq8jaljee8R6QYZ1QnEFayRQDMmkrIlB/YkwRSsjuanmRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB4239.namprd11.prod.outlook.com (2603:10b6:208:192::20)
 by DM6PR11MB4692.namprd11.prod.outlook.com (2603:10b6:5:2aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.22; Fri, 12 May
 2023 17:55:59 +0000
Received: from MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::e585:1863:208d:7e7b]) by MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::e585:1863:208d:7e7b%4]) with mapi id 15.20.6387.019; Fri, 12 May 2023
 17:55:59 +0000
Date: Fri, 12 May 2023 10:55:54 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Francois Dugast <francois.dugast@intel.com>,
 <intel-xe@lists.freedesktop.org>
Message-ID: <ZF59qsmR6hwyDw7y@msatwood-mobl>
References: <20230512121004.4145523-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230512121004.4145523-1-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR05CA0086.namprd05.prod.outlook.com
 (2603:10b6:a03:332::31) To MN2PR11MB4239.namprd11.prod.outlook.com
 (2603:10b6:208:192::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4239:EE_|DM6PR11MB4692:EE_
X-MS-Office365-Filtering-Correlation-Id: 45a200de-74ca-48fa-228e-08db53122475
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bhjHSa1A1VTC6reDiVYVpymQZVzY6JklWMTo3CNH5IJuPyxgza27Bo39805vyPL469AReIMoqvGmS5Xg9kxgMZ/d5i/SvtI38FBzpiMys6qaETgFpocuq7zmOnx4ugioAYRVw6ZyPHU6t58T/dZqUdE63wtVa+Pp6rajqgNzcrCFz2UAY/QfzYD1JJINg1pFLMUgDmUdbYtVcB1MW/Gv/XqTdtlJciF6/njQlFSroYo5S+V+YcccwaICyMd9fxQdry2n+omunqBMpZTQfb1uP2OuP3XG5LCrq8INlSmsKYer+I7HD3y3dEuHFfY+FnPQKrGfIw6rPslfoHd2QJJ2OZj5VHdysqCWqCUglQcxsHAqThBQ2x8OKpo2U6hmjDE/wOuhiVZduvEVk1mHhEK2EbAAaRM2VAzYFQEXojZgojA2Pe+oNL9w9sYLbf4kIaW/PSr6tjaoYMu9QaVTC5G8QkGS5JV2Df+fWs7fTGf5Z2vygOrrDFw6URIuecewrhybLxadLYK814BDRPTbw3UxzI+MgPcroR4CqDSua2PwmjoePtszjVbCk6mNFe+VQJiq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4239.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(396003)(346002)(136003)(376002)(39860400002)(451199021)(66556008)(316002)(66476007)(4326008)(66946007)(478600001)(6486002)(86362001)(83380400001)(6512007)(6506007)(9686003)(186003)(8676002)(8936002)(38100700002)(5660300002)(6666004)(2906002)(4744005)(33716001)(82960400001)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0xWdjBGcE5vcTVKZFhYTnZyOGR0eGtlY3kzY3VlMjVYRDdoaXRZcFN2SG91?=
 =?utf-8?B?c2p2Q1hIemZNN280b2JEK0RaUlBQWXFIeno1OXBLOXN4N2pGNWFSOEdDeEpQ?=
 =?utf-8?B?SkR5NnMydEVjc1RSbkhTcStSeEJYaDVaelVibS9mRm1yUTJhQWFTa3BSRUgw?=
 =?utf-8?B?UEYxQnB6cEhrVzJHSEx1Y3dNQ2NUYVlBKzlmVjV5Rjh1L0grL1l4UXFyS2lD?=
 =?utf-8?B?T2JiM2tIcldWcU5mSkdiMWRicFYrVldNL2ZsbUZCVUhBdmk5NUhLanhpZmUw?=
 =?utf-8?B?cXQ5clZ1eWJKeUJaemxjR1Fxdk9aNWROMFV3TklEVUZEYWFSUDN1aDRCL3V4?=
 =?utf-8?B?VmpBN1dmMy90ektnQllSNDJRVGZwVk5xcks4QmdvZ2VjSzRuaC9RMDRBMEZi?=
 =?utf-8?B?aXh3NVNHR0lCSUMwU0c0azBmM0N6SEM4MHZKNWV6NHlNdVhoQ3pjaG5NRndI?=
 =?utf-8?B?dHdZNnB3dWhhMnFSbXRGNDRWSDhSM0liZnRzS1c3MS9rZDNkUTY3L3h5eVFp?=
 =?utf-8?B?KzgxREtQUS9VMjZlWlJMejA1Z0ZLSjI5U1dwUW9tZlh1czdwTGlNTGc0OW9m?=
 =?utf-8?B?MXVhQXZIR0k1ZUJwT3FlT21weC9tazZPN1hpMGNLVmRaQXBORG0xdUI4aVZG?=
 =?utf-8?B?VURrT212Vy9yQmpLc3FUZXNuTEJOUjZTT1JSVDluTTZNNy8yTTkzclN0WjNH?=
 =?utf-8?B?bEdMbC91TTJ6STloOFZTd2NVdkc0VitJSUxXRExSbGZIR2xsT1hoY2dlODQ4?=
 =?utf-8?B?RWEvTmdTSStkQzVGeGRqa3lZSUsycldTS2J4M1YwY0pZdUVYcUdvSHpqNnJw?=
 =?utf-8?B?Yzh3UzN4bk1iWENaTGVtbmg2T3lzSmxPSUJrZy9EL1Z2RU5mVHJya00wamEy?=
 =?utf-8?B?UlUwVDJxT1g0dWlONzNOVythcy9Zc1B0RUd6dE8rU2R2MXRwRW1qWWZlOUYy?=
 =?utf-8?B?YTV5K25TMENTakM4SUZwa3FHMHhNNDh0YjRWa2l4MGtXaWVDeUFrWEJsb1Rk?=
 =?utf-8?B?U242cDE5VzJDU1pSeCt4OHY1OU1CVUROZVVtMW9RZVJ1cTd4UjNhL1oxT2FP?=
 =?utf-8?B?OWhFcHFqYWs1K1NPRjRkZUNCTlQ2S1RJbzNHdUJiaXpxUGdXak91c2lwSU80?=
 =?utf-8?B?cXJKQklDZ1E1K0lNQ3NVUnpWNTlWVVdQanRtc0FIeHlLOFdBNXE4NzlKWUQx?=
 =?utf-8?B?Wlk2dmtUemFkcis3VlFMa0JwMmtUZVppZ0xERUZEUWJJVmZxdVE4SHl2dGVm?=
 =?utf-8?B?NUJyRENMMlZhUWFsdWltbXpNeVV3RTV4TzZCMGtsZzBqb1JVbFBXdzVKUnIz?=
 =?utf-8?B?Q0VEZWRqMTdaaHg1TnBTUE9ld2s0ZU1qeWF2a0ErVDl3SnE3RFd0cGt6T1Fh?=
 =?utf-8?B?QUhFbFUrMFlxU0x3eFI5Y1ViU3FxUkFzZUdCRHNFeUNQMk54cU1HL0FITDEz?=
 =?utf-8?B?RWNReTl1N1UrOE9iREo1aS9kR0ZHcW9FdG5FQmNtelg1UC9iVkJYcHBkcXFL?=
 =?utf-8?B?MXd1Mis3TERXVU9xTkZVajdhZ3dSYnZxL3ZweDJzSFdIZFoyalRZMjVabC94?=
 =?utf-8?B?dEw0YmxJWnlSNkM0dUZzTkl4TVExcG1XNUtScG1saUFHV29jMmZlYlRrdTN1?=
 =?utf-8?B?NkVaWnBya2Riam1DcHpYMyt2dmdiMkRBbzZuelIxdTgxWUtIUHJ3ZmJ3NzN0?=
 =?utf-8?B?TkVqbURYdFdadU1kVnBnZHhXTmE0VmZrdXh6bGdFeVNJOWFjV1hwU2QvRXpm?=
 =?utf-8?B?V1hUOElBMmFJakdReGMzaFhBZEVBdzUwM2NUenczYVhNNjduTWZ5TnU3L09t?=
 =?utf-8?B?NFhQaHI3eFY1UjdGUTRlMDlEdk9WcWoycUZ1eHJtRmZISEdiYnVUTDVuczFU?=
 =?utf-8?B?V29RWGVudzRvSzRTcUdKMkVTTFhGOXdlM0ZuUURjOC9vd1JYZUNFTHFtMjNY?=
 =?utf-8?B?MWJqaUFPTGt4NWtnQWxCN0FkR1FLY25UUFh6WXlSZGZiT3d2enprWnhMeUtW?=
 =?utf-8?B?ckF5dlpORlU2TkM3dFl2K2VhL0VqZTFkK1RzMTZGOFhVQXJuWWl3dzFzU001?=
 =?utf-8?B?MmZTa2k5UzNaR1JNN1FwdVJCNjBpYmxGRHYrQllUZy90U1dlRC9PSjY5UGxG?=
 =?utf-8?B?YlBFcURhNVpKM1lCL2NaRHRrcG9ZS1YvbStaelIwNnFRSHFmcG10VEdmY3cx?=
 =?utf-8?Q?y2MScuIkFDdhKblQnSgR55E=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45a200de-74ca-48fa-228e-08db53122475
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4239.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 17:55:59.2633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zXV1AWC42rAvvL+pt/BU2GNWiiIkPKFJ54wAk/Jxt7joabHsaKRAI4aNSszmPkY91P4MDPNPGkZf6TMn/iBHiWOSd8wP7UduN1lzbMbK71k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4692
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Remove unused define
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

On Fri, May 12, 2023 at 02:10:04PM +0200, Francois Dugast wrote:
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_drv.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_drv.h b/drivers/gpu/drm/xe/xe_drv.h
> index 0377e5e4e35f..d45b71426cc8 100644
> --- a/drivers/gpu/drm/xe/xe_drv.h
> +++ b/drivers/gpu/drm/xe/xe_drv.h
> @@ -11,7 +11,6 @@
>  #define DRIVER_NAME		"xe"
>  #define DRIVER_DESC		"Intel Xe Graphics"
>  #define DRIVER_DATE		"20201103"
> -#define DRIVER_TIMESTAMP	1604406085
>  
>  /* Interface history:
>   *
> -- 
> 2.25.1
> 
