Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6898C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 19:36:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 707E610E65C;
	Wed, 29 Nov 2023 19:36:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B8310E65C
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 19:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701286570; x=1732822570;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l+aqQABkkDN91re8R5/wv87kS3SmvPqrRFQjF1GjVsk=;
 b=nTatGq/0Lubulzu+2bCIByKz7BDT+90FIH893b8sChT1W+dM5DrzJo4O
 lHJqCdz+pIEiIHnH7yib8z1FTuDwSPvg7nRpRD3IysHySjs7TjOwOz+l1
 HOYMZNAb/g3ZNzQE9wUerDjHo+5vONSAwM527YQyWvnsYbpPBrA4zWNsR
 79QavZXSlc1VQPl1M9Tyf+pV5Sn5r4HXXjvUvbUV/4xlVlnY+iCeoWZe4
 2cZ+eryeU5fnQqmlA1NuogcjRNO8mx8NBls+9XvCMQcsuLVbvDGryilUS
 UGcAabC1/XDKLMdl0L0r2V7Zdo9RbJE1nUci5WcTjs/AuGamBJOEON2oV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="11915542"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="11915542"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 11:36:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="892554404"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="892554404"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 11:36:09 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 11:36:08 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 11:36:08 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 11:36:08 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 11:36:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQhaFkjZPYZU1ojj2aocvSzrsWcf7PzVMdGYvwHjvCjRPniunAipZ55dkncOfbLFGOrIKpQbMVZuTnUReqr+yl2QmSdqfhA6ZQMqpdP/wsWZCnSPQIjKmf9rfg7MJ4yzbmVH2f87NEqU9mY8dIsbJ9WihAfbTD1QzlATRv5Cv91OBBBM/o0MBwjQbrXCN/97NY/cc9lkOhcLsmy6Cnhk81lZJakPh24lS8zHENFQWnUHPFRPyXTY1/JLgw7OR1LzvpTTOggKGv8J24vez126efz+WvNe5jSenzDQTRw/0nHiMvX40srHAPvafKO0oor6ROPEg0OHOnZ2vtzTgv+1mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jz+CrSMCgTfwfLKue87DB2NbzNVAX5Y8oDOUlWCFNbU=;
 b=EVZOgUCBMhCdVXUCssDe95yh9h1Ln10wTH83zbpdW0bv+JaQnbNENIWWwHPqBqt6qcwOKg//IJNfXbdW6qGW0In8GrEiomOtSJguIZp06W2WIyamZ1VKy7P5+pxOGqX9VM68rXDCKhSGeuiktjxdJTKen37vTWZYS/Ik0jWtrXyGeCAoAShTtM3sM97Fmi8PHI6nJ/m4qie8vaFzMdmJpfcmySFxE8ZhqPtB0v1vVoX+xwnrWRfGlI9dq0DFL/ITY/QcbdboqRKG+YntYId+fFGju+Gk8GJC3k9zA9NpYg/Ep4vQh7rj/FyhjBmzdRygtqrh6jHSFSFnxDDRwG/Ubg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by MW5PR11MB5884.namprd11.prod.outlook.com (2603:10b6:303:1a0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 19:36:05 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c947:cbd4:3870:c36e]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c947:cbd4:3870:c36e%7]) with mapi id 15.20.7046.023; Wed, 29 Nov 2023
 19:36:05 +0000
Message-ID: <f8d95d48-74f9-44f4-8eac-ff4d925f51fe@intel.com>
Date: Wed, 29 Nov 2023 11:36:03 -0800
User-Agent: Mozilla Thunderbird
To: Francois Dugast <francois.dugast@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231122143833.7-1-francois.dugast@intel.com>
 <20231122143833.7-3-francois.dugast@intel.com>
Content-Language: en-US
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20231122143833.7-3-francois.dugast@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0050.namprd08.prod.outlook.com
 (2603:10b6:a03:117::27) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|MW5PR11MB5884:EE_
X-MS-Office365-Filtering-Correlation-Id: bf5bd24f-0b88-4adb-1ac4-08dbf1126d99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1T2d9jIys+PS6uqygmBie/rV3raQJ9o/rLL/FgwrzqeVMAVkXxnnUj0odVK5RixpKyjzLNXrw7WFhnNtTbgwP6Ol+/4BiGxknSQzGREHD/zqlGeKLp6PJNrwUm/08ayuHzmpiHJH79geqdn4Ee5yVIV7D35rmNYcg7eOBnbWctHOl5RuN1mEc5wuGrCNsaTjIBU1QfBT70CraYmq9Lv1ayAuEj3AZ8N51QCfGdrMu4OJPrH/XOdMJV6uLW8EgaGOkYpb1lphsDeKjTiiBL/dfEBsEYoVsjfdYQ+fwsJGqJFJORdhbNHOjgN3HmnF+2LtW+PGE0OIexz0UgqzEkZGyk0OEWuFeUh9Oh3lkQ2yy8PEF6cRcc3/kzHoGcheHcDQEJJbnfmt+QOUs4IerD/BRZnHPZ/mxQrrriKUpYz/vh9/BlA9l+OULwao9k6u0/1vSK+up8+I19ZTGuOp4gFu9xvI72xKIlOG6r2mEiOksr1Bt676Yw3blF4Tt+lPx2hEaLHaId/6EiXs2kSgMY37qvuzsetJyW+ZaArGZhnXUqKqeosaWazORLQm5m+RMK9nr8A5010PTpXHAGmBhcoqYUlGkY3ZamFQzUPjzExSJQqtEbAkK+OFXNy0pA1Pt8WiCHwrYg2mzqCWlt2PAy8L/724/SHoZABNf4qnbxgBwfdzIKZc0Y3x9xkbasKT89Ql
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(39860400002)(346002)(366004)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(4326008)(31686004)(2906002)(8676002)(8936002)(41300700001)(66556008)(66476007)(66946007)(26005)(6506007)(5660300002)(107886003)(6512007)(53546011)(2616005)(83380400001)(202311291699002)(31696002)(86362001)(316002)(38100700002)(82960400001)(6486002)(478600001)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2VyMmFvMzlhUDNadGc4OS9mZFNweTZlTG45SWZKc2ZDbUQrRW5obU9wUzhn?=
 =?utf-8?B?UzJvZzdjZExJb0l0R0dZQ3RES1lBZXlnOGkvTlNSV202MTJId2ZvOXljTCt2?=
 =?utf-8?B?WloyUWZwZXJ4ZCsyU3BKRUk1UURxSVdqMmIrcDMxcTltYVJXNlYxV0tsTmpN?=
 =?utf-8?B?REpzM3ZYb3A3K3ArV0I0M1hjT04yV09OUys2ZU1mSUxqL0d0dGpPT2hPRTN1?=
 =?utf-8?B?T3hNOWxtU2pyc2E4ZUVINjZTeDJ6S1BWL3JsMnVyNG5HbTJCRFZTTUVkRU9i?=
 =?utf-8?B?QVZrNFc3OU1Fbk1wYTRiSmFZODJvYkpqRnZMK0E2Z1UvdHdaVFh5UzBJRDJR?=
 =?utf-8?B?cHRqTkJGOVAxWEhQWEc1ZUNiZ0hycExrSXY3SW4rWEMrdnBveU5abVp2RHhG?=
 =?utf-8?B?M2tvS2c5YzRyREY0ZVdyMktrdVdLWklrdElkaFR5MUJZSlBWZnNxZDRRWjl1?=
 =?utf-8?B?MXB5dHd1Q1dHOGJ2Z2p4aW9kRjFxdGhuVkdQQzd0aFdRQThSaGZXNkgxTlcw?=
 =?utf-8?B?aGZpemJqVnB5RlNQRnV4SW5XUjhTL2I2Nk1xT2hrUVN4bEhyaUNrNitPZW9t?=
 =?utf-8?B?QTNPY1BuMjdDRys0MlZpTFIvTHROaFVJRGoyb0tNbEpmVDFrREJnZ0pPWHNQ?=
 =?utf-8?B?RUNicjZRa1hCY284N3IxSFRkUUVOVnpYWTBtcFcyMEo4WHhaV2lteVlOeE9L?=
 =?utf-8?B?VVIwclYvcVMwNXUrY3l2cHJFemNYL3JzVllnck9Ub1JRdlJwUFBHRHNKUkZN?=
 =?utf-8?B?K3FOQXpjMlhiUXFVZS84eWYxTTM2eTFpT1JJaE5Bb28zckhlWGVkSVBBb0cx?=
 =?utf-8?B?MlZWVEg4c2w2MDlHckI3ZFg1MFNCZDdaMkRiYlFyYUhQYVNMRkc2dlNrSmds?=
 =?utf-8?B?WTZrLzI4ZzRxTnBqY0RscUFWTXlvZklKNjlhSWZvUTFCd3V2TnVST0w0K3Mz?=
 =?utf-8?B?T0xkL3Jmak45TlFnNzdwenpEV3FzZ0pXRDh5dldnQnJiTXRQZGlGUlVIZGha?=
 =?utf-8?B?L05iUHNGT1ZZSlFNdlgzOXhSOXowbzJvc3FPQmJxTHdZdGt1SUJyTHpzbEEv?=
 =?utf-8?B?NWJORGJXMjVnWGhtNXZkVFJqbkZhM3QvQ1RrRGRrdzdYUDFuRTQ0cTNMN00v?=
 =?utf-8?B?OGd0UTd0MEQwRjY4Z0tjK3BVVmZDRHpNUDZDZnlGNzdKQVpPQ1ZVcnROajE2?=
 =?utf-8?B?Rll4K2RPaDFReTNJeEtHeCt6ZWxKZWFtNlRVY3ZUZlBjVHhmZlBFdUpscFF0?=
 =?utf-8?B?d2VqOU5kMHA0a0cra1ZNSHA5ZXpVakhaY2RGRTMyTkhyck9wMXlscGRwcDlK?=
 =?utf-8?B?QUJSUkdOUmpSUzRIaG5RYXlvbXZ1N2c0K0lzaVBya3hvREM2MEt4Q3NaZCtB?=
 =?utf-8?B?L2FlRlNsMDNNYUo5dE1WZklmWXErY0J5QWxqUzh4eXFIbHFDcERCeVFyYnBX?=
 =?utf-8?B?Yk1sTnVBVlhKY0lIa0h4NU9xWEZNUlVFSVZQa3BjY01kdDloZ2g2SWUxTWtX?=
 =?utf-8?B?QVZrOTFkOS9mVHRwMkU5aEJwWS93K3QvVUwyT1U3R3A5SlBNSUJ4enpUdmhE?=
 =?utf-8?B?TmlLeDluK2ZDcktGNjluejYvaEhsR1NTNjlqd1hiOUhXVjRmWTkwZ09lVWJW?=
 =?utf-8?B?cllYRnpQdUlsN1A4ZVp2UnVpOGRyaE1vSzkwNENmcE51UEVUV1ZKWm5KL2hY?=
 =?utf-8?B?MUlsWmhvdTVDVW9Ia2dmbFRMWmxmbGZnMTZORzNEamdld0wreWJpSm1Gc20y?=
 =?utf-8?B?T2tsbjEvMkZqZ1FrQmxzVFFnOFlLclRIaHVjT3FCTE1ncGFJdkExZGd0ZGhL?=
 =?utf-8?B?cFlNVEpYemJiSFhkUmJOZ05FdUFIUnA4bTBNaW1RenZwcWFGZENxS3hUVTZa?=
 =?utf-8?B?N1ZOZnNoT3RZZ2ZEb1gyME84L0JrVjRtYnpvSy8vaGR1NFBoS0ZUWHZFdXNG?=
 =?utf-8?B?bVZGVXorVHpRaUM1QVN5OElkeUdtUVVKemtCdmkyS3JINDBQOENKaWYzZmJN?=
 =?utf-8?B?MW9sa2N3VGh0L3F5bmR4N2g5bmRJazIxWEN1NkcxKzc4a3ZWK0Q0U3pKQmg0?=
 =?utf-8?B?Q01CdTB5L2JZakVaenNQQit0MEkyL0VWY3lVdWFDa0xSRFNkZm1qazZMVDA4?=
 =?utf-8?Q?5x5q/TplWgv4T81bWWkL4TSae?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5bd24f-0b88-4adb-1ac4-08dbf1126d99
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 19:36:05.4730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KMGic1Iiio8fNnjJnpvUPAwUThyYV53/PFnCBPnnRxK/X8nwDDPVzFC/zgwvhSxa2vlqq32KLnzCq7aTh7jmaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5884
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 02/14] drm/xe/uapi: Separate bo_create
 placement from flags
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 11/22/2023 6:38 AM, Francois Dugast wrote:
> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Although the flags are about the creation, the memory placement
> of the BO deserves a proper dedicated field in the uapi.
> 
> Besides getting more clear, it also allows to remove the
> 'magic' shifts from the flags that was a concern during the
> uapi reviews.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c | 15 +++++++--------
>   include/uapi/drm/xe_drm.h  | 12 ++++++------
>   2 files changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 4305f5cbc2ab..bbce4cd80f7e 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1799,19 +1799,18 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>   	u32 handle;
>   	int err;
>   
> -	if (XE_IOCTL_DBG(xe, args->extensions) || XE_IOCTL_DBG(xe, args->pad) ||
> +	if (XE_IOCTL_DBG(xe, args->extensions) ||
>   	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>   		return -EINVAL;
>   
> +	/* at least one valid memory placement must be specified */
> +	if (XE_IOCTL_DBG(xe, !(args->placement & xe->info.mem_region_mask)))
> +		return -EINVAL;

I think you are missing to test that args->placement is *only* a mask of 
regions.   Looks like you allow other bits to be included and those will
get slammed into bo_flags below.

Probably:

   if (XE_IOCTL_DBG(xe, (args->placement & ~xe->info.mem_region_mask) || 
!args->placement))
      return -EINVAL;


-Brian


> +
>   	if (XE_IOCTL_DBG(xe, args->flags &
>   			 ~(DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING |
>   			   DRM_XE_GEM_CREATE_FLAG_SCANOUT |
> -			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM |
> -			   xe->info.mem_region_mask)))
> -		return -EINVAL;
> -
> -	/* at least one memory type must be specified */
> -	if (XE_IOCTL_DBG(xe, !(args->flags & xe->info.mem_region_mask)))
> +			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)))
>   		return -EINVAL;
>   
>   	if (XE_IOCTL_DBG(xe, args->handle))
> @@ -1832,7 +1831,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>   	if (args->flags & DRM_XE_GEM_CREATE_FLAG_SCANOUT)
>   		bo_flags |= XE_BO_SCANOUT_BIT;
>   
> -	bo_flags |= args->flags << (ffs(XE_BO_CREATE_SYSTEM_BIT) - 1);
> +	bo_flags |= args->placement << (ffs(XE_BO_CREATE_SYSTEM_BIT) - 1);
>   
>   	if (args->flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM) {
>   		if (XE_IOCTL_DBG(xe, !(bo_flags & XE_BO_CREATE_VRAM_MASK)))
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index b0d13bc6d9cf..1bdd20d3c4a8 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -500,8 +500,11 @@ struct drm_xe_gem_create {
>   	 */
>   	__u64 size;
>   
> -#define DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING		(0x1 << 24)
> -#define DRM_XE_GEM_CREATE_FLAG_SCANOUT			(0x1 << 25)
> +	/** @placement: A mask of memory instances of where BO can be placed. */
> +	__u32 placement;
> +
> +#define DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING		(1 << 0)
> +#define DRM_XE_GEM_CREATE_FLAG_SCANOUT			(1 << 1)
>   /*
>    * When using VRAM as a possible placement, ensure that the corresponding VRAM
>    * allocation will always use the CPU accessible part of VRAM. This is important
> @@ -517,7 +520,7 @@ struct drm_xe_gem_create {
>    * display surfaces, therefore the kernel requires setting this flag for such
>    * objects, otherwise an error is thrown on small-bar systems.
>    */
> -#define DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(0x1 << 26)
> +#define DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(1 << 2)
>   	/**
>   	 * @flags: Flags, currently a mask of memory instances of where BO can
>   	 * be placed
> @@ -541,9 +544,6 @@ struct drm_xe_gem_create {
>   	 */
>   	__u32 handle;
>   
> -	/** @pad: MBZ */
> -	__u32 pad;
> -
>   	/** @reserved: Reserved */
>   	__u64 reserved[2];
>   };
