Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A20CA550B
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 08:38:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7267310E485;
	Wed, 13 Sep 2023 08:38:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B0D610E485
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 08:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694594316; x=1726130316;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=Of5egw3I8vjyZ8aK0LRDGj+BRQBKrOSbKxDBf8afFmk=;
 b=AjQ6l8XkGvn0b85Oswutzr6dtHFV77LFnYPLo4/OkStTK4iXR/d17Kzx
 YO834Bd1LnolCD3XsKpKJXnALb6p+fN+5EaFctUClz/uikEOLT3R3vLyo
 f61wKwH2PRDhXM3gq/Tj0XUuAyDby9nFJFGnDZzbycOaT/w/bVhd38Db9
 hH+gLfpEQwCUyD3gxxcPTY+g3Zt8oRxQx7f+qluV2d7b0hemkjGivLzwT
 quYV2dxFci61oj3EXhp5U7grGEY+1+/3rwwMzewKjzHtxwvQsNhNri9Xh
 qHZGWVM4dCWrO+luOWJAD+VOxeovwGsCJdCypc8/01SvT2wsKa2hqPulD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="445039920"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
 d="scan'208,217";a="445039920"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 01:38:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="917749617"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
 d="scan'208,217";a="917749617"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2023 01:38:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 01:38:28 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 13 Sep 2023 01:38:28 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 13 Sep 2023 01:38:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W4x+TTJPiAFX5x/5vNg4IBq0tZeCcbydLPnEZ58Mvmi1SVrRvTh8PcomqBqCsO02JWCx1S2i1bzeZRfQEUU1N4n4o+qqh4QfA7sZceM8iHuYWn0e09icVog6T+D1l9iXsuO1fYL+lp7pVf6P0DV5ScIni28Csubx7WfXDSaYCvethT9N9KVvFDIk4nqGg21qDwXmaW0zw+AEL/Oj4bcMn4F70w8l8nk/HiCkjbtBcaGQMC/DhXW3Q9ly51h/g+Ia06SiZOl+8w0mlAqSUIyaztHaeU3dWTLe+qoTxMsCu9iMRTjy+DR80sTQIPf0DCyjnqYDxi/foNiQG67KaItX+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5IDewiZEh3oQ1p1W7xbN+PiYyM3H6UEMMeB9uXIrS6s=;
 b=AkyIdr8QqieUscIFTXtvZy2UjxK/nHYHNhdmr3qV6lS86eeP8hX3cy7Xobo0GubqmeqxF7a7VMpKNg9wHaOjmRx7jAujPy6yp2kio++MsOqHna31AjbXSlRMbbJ5RAIgjyohQUMChLr59IWnfO4YQmLyZ+3OTR7UGROltCRdl35pcwHIuhxipCdcZkjOlqaq5o0S7D10ORWMdM0b1+klWXoBa5DQwdR/XOE1PkNQVDvUHe27ytyxsQk/H2UCLauA47kzQ5zmYcrt2M98gkmpMuwpnZO3y3kGQtiUG/Mxl2tQNQFxwgMWM00RwFgSdpMKHBs1rEejijc4U+r2ea1g4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS7PR11MB6248.namprd11.prod.outlook.com (2603:10b6:8:97::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.35; Wed, 13 Sep
 2023 08:38:21 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::1ed2:437d:1d6c:da25%6]) with mapi id 15.20.6768.029; Wed, 13 Sep 2023
 08:38:21 +0000
Content-Type: multipart/alternative;
 boundary="------------efWx6EY0KqmPtychMy14UgyP"
Message-ID: <fbc9cf24-d842-4a2b-97b4-0a8dc6f92a4b@intel.com>
Date: Wed, 13 Sep 2023 14:08:12 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230912115239.3554341-1-tejas.upadhyay@intel.com>
 <20230912115239.3554341-6-tejas.upadhyay@intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230912115239.3554341-6-tejas.upadhyay@intel.com>
X-ClientProxiedBy: PN2PR01CA0070.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::15) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DS7PR11MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e01adc8-3cc7-4287-b4e4-08dbb434c901
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E8Z8nZjhqL9TwSREOn5K73XjaDOsonBLZFqO+Q+8qMesli1qX6+W+kf4FSduLDeOS8WCPl0WH0tkHi6WGpsyUheB/9vk+hBneRzDv9l3ovtig41bEn3WTswJfsKIsgL/uA8bAgLe10ECA32zb2xR2fFdc/I76Cw6g6rz1N5iLFcTAZjVBfLO7UaBMH38ZkBRGJ1KxH7J4rvd/BUqxEwkq4w2BBf6b6I5hmjicrsvEqOrYJsbC/juwZPXuA2pdEw8QBqtURkNOvTxbdabSYMzbUGqmbfd4pIqdAOA276cplxI7WH8Fwg0Doi8rLdZXsTDZbQYtQeMGvGIDz7drCBZDb5IDiBm+fVHRr+ybEnDKMIfTQlo0+9/MCRubRHqpAs27HSiSGqrpVIhhZr0dUll+tjFugy0wakpflEjr0SDVXXJTCThA3MjTRpJoxWcLH9ByX1BOjrayFTguLenT3Q78R6Mw0wO+U46TlBIbwHjDWiCapTD6yycidItt2mAdNJFrU07894CdX5MolNaXsTatw2hJgVhy8O9exC+JIw4xu61MT3nZTbMjBkYydTkBqXNODxIye2sOQzL/HtFsSQU29WdcnvKbheYiDcyxm3FIgss5sMV2w4HYGb2gLs0N1n3ynIzK8jDEK+0+aL4KRhI1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(366004)(376002)(136003)(346002)(1800799009)(186009)(451199024)(478600001)(53546011)(2616005)(107886003)(6512007)(31686004)(82960400001)(38100700002)(36756003)(316002)(41300700001)(66946007)(66476007)(66556008)(6506007)(6666004)(83380400001)(6486002)(33964004)(26005)(8676002)(4326008)(8936002)(31696002)(86362001)(5660300002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S05ETlg0MUxMRU1YM0VPbmcwT1c1UWw1T3VtTTJUQVRWYnllKy9vOFVScW9D?=
 =?utf-8?B?aDh0K2tGS3I5Y3NaRDdxK2NsY28zd2J6OGJNME93R1dSa0U0UDg2Q0V6Znkw?=
 =?utf-8?B?bHFHdXRrRmpEL08vTCtrR2tZOEsrck9oZlFmYzZkTHdJd0ROUmpMcG5NSjdm?=
 =?utf-8?B?V1QxSzUrMllEUEtWZGVKdkRNdGJqUkN4QW9aRUcxOFdNVjdyTlNSdVRvVlZw?=
 =?utf-8?B?aHhRT3dGbGkxdkM2SGw0TmhwdnlwTXNzVXVESERwbjFuTnJxaTQ1VVlYOGJ0?=
 =?utf-8?B?ZDNFM0R4d1ZuMG1CUzRxSFlsbmtucFd6aS9DNkZNaTAxY1Y3Vis4cTRxbnNY?=
 =?utf-8?B?YWhwcU15L1V0cDBXVUY3Qit2eWxTY3hObFZ0aGNybSsydWk2cXhYS1p6K0to?=
 =?utf-8?B?R0Y5QWIwQ25KM25vRHBBaER4QWNYUGE4YmhsK2NKUmMzMmc5bFVRNWZISzlW?=
 =?utf-8?B?NUZCTUJNTTgrQXg3YUF4SVVQV2FlZkJDeVdJSHNsbTFWeTFiVjVxVXM2bDda?=
 =?utf-8?B?SFZzUzVmV0cxOGJSU0FUbFVmbWIvOS9KQ3hpTUxxL01LbS82dFZvZ0FJSGNO?=
 =?utf-8?B?dW5nQmtKb2dXL0tKMnord0dFdS9TK0gxQVVPZnRjNW1LV3crc3N1RE50Q0hO?=
 =?utf-8?B?azk0K2w5MjhMUUpCQlU5N3Vxdk9vMnF6NE02d3pKTzFkMk00UHQ1dnNYN1NH?=
 =?utf-8?B?QU9aSkFwZjNtYTd6SW5EblYrNElFamlDSG9JblNuQUwvZ0FDSnUvcXpyOFNI?=
 =?utf-8?B?MDh3MXpHRDhaRyt6TVBNMnNnVlF3VWVPRStHWXlXQ1gzcXBCUGtWOUNucUlz?=
 =?utf-8?B?WmYwSVdUeTdUN1RJRTNoMS9qZEJneTlWSUlDdS9TL21VeG5SRFN1bFZyY1Fu?=
 =?utf-8?B?R0VtWEpBbGoyU0o0VVFwOHliTy9ieDV6U0hIVS9lTFJZcWVsK0o5U3Q5KzU0?=
 =?utf-8?B?TWhkYjdYU1AyVGdOMXB3Ui9palUveUZGeGwwMEo1dW1iL1M1Um9NQzRPaEk1?=
 =?utf-8?B?OE4vS3JTNXgzb1p2MmJmTk1JMW85WHp4Vk43TXQyUEhFUmdIWUJJVU5hd2Fs?=
 =?utf-8?B?cHcvQmlTZkxRK01Cc1p4d2dYWjdBN0d2UVhQak84UzEyNnRuMGwxMUgwaFlr?=
 =?utf-8?B?bXZEYS85dFhUcEZXOGxHNUNqWjdIUVVwdmtSS0pKMWFKSzk2bUtZcGVtNUt0?=
 =?utf-8?B?V0pFRVYyck0vWWxiZDV6T0hubE5DS05QVVQ0YnhhaTdRVXpQNU1LNWNGcGdC?=
 =?utf-8?B?UFc0TCtGMmRRbXBuSjRwSDFNbldZMlEwMWpKd0QyUkp4U2x3VHlwc1lLQ0xr?=
 =?utf-8?B?dEVrUk5QV0RYUWlSYXlNMzE5NCtuT2dhNllEYlJVMHFSVnI5Mk81VXo3L0E1?=
 =?utf-8?B?Qmt6aXU5a1ZlazFxWldlcTZNTkh1NmNwT1dNS1REVWM3VGxFeVF6VUJGUmIz?=
 =?utf-8?B?QlFmR0JDYzA4c2xwckJlMHdXVTRrL1BwME54czE2NkJtNkJFdEdKL2d2a2oz?=
 =?utf-8?B?MENrUExraEVDSTkvM0kzY0VlL0lUSmI0R1Ewb2dZVlFzT0F5ZUlCV2h5QXBD?=
 =?utf-8?B?NUVsUVlNcm54bHFyZ21SL1RJTnNSeGlWSWJ5aEtxekt0bmZGREJxZ21aOVhU?=
 =?utf-8?B?cVd0N1N2NnhIUURJNi9DcVE3VE1jUkpDSFVCOGF0ZGRyaGNEaUJIeEh6NjFo?=
 =?utf-8?B?K011SkRDSlNqNzNQM1RldThHaG14NDM4c0syWXRJaXpLaXMzY2hDSi9MU2xm?=
 =?utf-8?B?Rk5uaGp6UmdweFJLTUpEeWZXbUhMbmlsNHkrL1hIY3Z1aHN5ZlJZVTNjMXRE?=
 =?utf-8?B?QkVNQkZYMUIwRDlhdDhRNGVYMTFyaUhRbU0zK3M0dEMvalJPckM5TDJOdXQ4?=
 =?utf-8?B?Um40dnVQN3NubnE4MTdhVkxueW5TL3F3MDBCa3BVZSs5c0dleXBZem00VjE5?=
 =?utf-8?B?U1IzbUdmNENnSnk3dS9FZVdkY0hqNnhJQW5rVCtVTUJhV2l0N2JzWkpmdmtw?=
 =?utf-8?B?T0g0QUIzZ2VSL0tiUDVCMy9QTWhlV3ZaWXgyVDliNlZockd0ME1MMm5PWCs4?=
 =?utf-8?B?YTlsN0src2NRRVhEWU1Za3ZnSEVBS1VuK1gwem0wNU52MzJQMUdmQ2JlZGNo?=
 =?utf-8?B?R2hDazg5TlQ5SXBtdlRrTlQ5eUloTW12UEcwT1crdCtwWkJIZ2dlT2YzdW9r?=
 =?utf-8?Q?Hv0py0Uv/ibVrdHUhwFwXo8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e01adc8-3cc7-4287-b4e4-08dbb434c901
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 08:38:20.9932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G18p+43+kluofZL6N17j2mspHIcYyE+uCh3k4g9RQCz0UT+ih+e66UUZqQGeEjje26i84I3MNHNXMe/myBkjBC246P4uRofN696JLdELtvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6248
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V2 5/7] drm/xe: Track page table memory usage
 for client
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

--------------efWx6EY0KqmPtychMy14UgyP
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 12-09-2023 17:22, Tejas Upadhyay wrote:
> Account page table memory usage in the owning client
> memory usage stats.
>
> V2:
>    - Minor tweak to if (vm->pt_root[id]) check - Himal
>
> Signed-off-by: Tejas Upadhyay<tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pt.c | 4 +++-
>   drivers/gpu/drm/xe/xe_vm.c | 7 ++++++-
>   2 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 5709518e314b..8df83241c5fe 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -7,6 +7,7 @@
>   
>   #include "xe_bo.h"
>   #include "xe_device.h"
> +#include "xe_drm_client.h"
>   #include "xe_gt.h"
>   #include "xe_gt_tlb_invalidation.h"
>   #include "xe_migrate.h"
> @@ -195,7 +196,8 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
>   	pt->bo = bo;
>   	pt->level = level;
>   	pt->base.dir = level ? &as_xe_pt_dir(pt)->dir : NULL;
> -
> +	if (vm->xef)
> +		xe_drm_client_add_bo(vm->xef->client, pt->bo);
>   	XE_WARN_ON(level > XE_VM_MAX_LEVEL);
>   
>   	return pt;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 92d8c78c9284..4eae641fc79f 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -19,6 +19,7 @@
>   
>   #include "xe_bo.h"
>   #include "xe_device.h"
> +#include "xe_drm_client.h"
>   #include "xe_exec_queue.h"
>   #include "xe_gt.h"
>   #include "xe_gt_pagefault.h"
> @@ -1974,6 +1975,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>   	struct xe_device *xe = to_xe_device(dev);
>   	struct xe_file *xef = to_xe_file(file);
>   	struct drm_xe_vm_create *args = data;
> +	struct xe_tile *tile;
>   	struct xe_vm *vm;
>   	u32 id, asid;
>   	int err;
> @@ -2052,7 +2054,10 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>   
>   	args->vm_id = id;
>   	vm->xef = xef;
> -
> +	/* Record BO memory for VM pagetable create against client */
> +	for_each_tile(tile, xe, id)
> +		if (vm->pt_root[id])
> +			xe_drm_client_add_bo(vm->xef->client, vm->pt_root[id]->bo);
LGTM. Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>   #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
>   	/* Warning: Security issue - never enable by default */
>   	args->reserved[0] = xe_bo_main_addr(vm->pt_root[0]->bo, XE_PAGE_SIZE);
--------------efWx6EY0KqmPtychMy14UgyP
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12-09-2023 17:22, Tejas Upadhyay
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20230912115239.3554341-6-tejas.upadhyay@intel.com">
      <pre class="moz-quote-pre" wrap="">Account page table memory usage in the owning client
memory usage stats.

V2:
  - Minor tweak to if (vm-&gt;pt_root[id]) check - Himal

Signed-off-by: Tejas Upadhyay <a class="moz-txt-link-rfc2396E" href="mailto:tejas.upadhyay@intel.com">&lt;tejas.upadhyay@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_pt.c | 4 +++-
 drivers/gpu/drm/xe/xe_vm.c | 7 ++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 5709518e314b..8df83241c5fe 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -7,6 +7,7 @@
 
 #include &quot;xe_bo.h&quot;
 #include &quot;xe_device.h&quot;
+#include &quot;xe_drm_client.h&quot;
 #include &quot;xe_gt.h&quot;
 #include &quot;xe_gt_tlb_invalidation.h&quot;
 #include &quot;xe_migrate.h&quot;
@@ -195,7 +196,8 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
 	pt-&gt;bo = bo;
 	pt-&gt;level = level;
 	pt-&gt;base.dir = level ? &amp;as_xe_pt_dir(pt)-&gt;dir : NULL;
-
+	if (vm-&gt;xef)
+		xe_drm_client_add_bo(vm-&gt;xef-&gt;client, pt-&gt;bo);
 	XE_WARN_ON(level &gt; XE_VM_MAX_LEVEL);
 
 	return pt;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 92d8c78c9284..4eae641fc79f 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -19,6 +19,7 @@
 
 #include &quot;xe_bo.h&quot;
 #include &quot;xe_device.h&quot;
+#include &quot;xe_drm_client.h&quot;
 #include &quot;xe_exec_queue.h&quot;
 #include &quot;xe_gt.h&quot;
 #include &quot;xe_gt_pagefault.h&quot;
@@ -1974,6 +1975,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	struct xe_device *xe = to_xe_device(dev);
 	struct xe_file *xef = to_xe_file(file);
 	struct drm_xe_vm_create *args = data;
+	struct xe_tile *tile;
 	struct xe_vm *vm;
 	u32 id, asid;
 	int err;
@@ -2052,7 +2054,10 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 
 	args-&gt;vm_id = id;
 	vm-&gt;xef = xef;
-
+	/* Record BO memory for VM pagetable create against client */
+	for_each_tile(tile, xe, id)
+		if (vm-&gt;pt_root[id])
+			xe_drm_client_add_bo(vm-&gt;xef-&gt;client, vm-&gt;pt_root[id]-&gt;bo);</pre>
    </blockquote>
    LGTM.&nbsp; <span class="reviewed-by" style="box-sizing: border-box;">Reviewed-by:
      Himal Prasad Ghimiray <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a></span>
    <blockquote type="cite" cite="mid:20230912115239.3554341-6-tejas.upadhyay@intel.com">
      <pre class="moz-quote-pre" wrap="">
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
 	/* Warning: Security issue - never enable by default */
 	args-&gt;reserved[0] = xe_bo_main_addr(vm-&gt;pt_root[0]-&gt;bo, XE_PAGE_SIZE);
</pre>
    </blockquote>
  </body>
</html>

--------------efWx6EY0KqmPtychMy14UgyP--
