Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CE4C982D2
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 03:32:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA50A10E080;
	Fri, 18 Sep 2026 03:32:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dOj9qs5g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB5510E077
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 03:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789702361; x=1821238361;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SMw3AMn8Ii6ImivJxACYPQ2ZUVbVa7biE95FPq5VDAc=;
 b=dOj9qs5gzY9mRiuSbA/Nq3z+h0BTLlWBYkZpReYm1XGjGajmIaq9IqN0
 uqXA/JMrKnHR6ObPIM7sJNyId2iILm3L4j1aDJhl3aneXjxR9GhEP/3Ev
 p61GZrHhoULV2m/J8ZnXNkUDnLLuphN6MEJVe9+R+fvMpo4I66T+mQnmY
 PtiSz1+ioOb0ECbH/fKj7AbUbeoGtTp90zUGdyZbumJaqE35cw7LmmhO0
 2pmR0mFwWxXNYSI+3eb/1uodW3wUpszYAPpjMs/DrpnIgIVD0H/95cRbo
 B0u7ka+m0AcwxSf6pNjREkkRs+rRAslOlW1gzIs6ZZls9zGHZyeWiUzP6 g==;
X-CSE-ConnectionGUID: SsnFLpmIQsWQzpkPKcScZg==
X-CSE-MsgGUID: Nf6KwPDsRxy/wlHPffTx/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100843630"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100843630"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 20:32:41 -0700
X-CSE-ConnectionGUID: wAa3fGS9SJCr4IaWdT1lmg==
X-CSE-MsgGUID: mG2ArhE9QuS1LHYvprsu7Q==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 20:32:40 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 20:32:40 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 20:32:40 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.7) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 20:32:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CTOoG+3QmQ16ncbdYF/pfx4uh32WF0PSZSOMzrQE86NbW2XCcHmy2S+q3BFvABuIjgZ4AiaAl32rkkSLZKCHeHcrguz5lXKUEevOtVzGGM3ukStT69i0mQaMFO8JqcuX+GsenzMYbT2sWUh9FPdmH3qIYTm/4XVA9DDL7U3+ucC88sa5yZmg+PqMhHHp0hvknmFHg20EGYA65c62AJ4OjjUVJrUjcQljW3G6O1538HNPDqrpMogi9d/dlFDRqKmg2sfIxmOPUcJ8dKlOMRKBga+pDIAQ7ziOT3ujPUahbXjTi9q/rkEZODvxlf0QIEzZqj5Cd67zMueiT8aSBO+b3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjqEHIkOM4XkVFrm70edR9szUp61TbAEsqcBBL8vvyA=;
 b=DlbNes5ban8b6Me0+MeZn67QPe0wev/2Vw+zZW3wVlWy3tUqfBTjK8MoVAm/JnYuBNpyKHDkt85U0fVEB9C2ZAz97LIgAPoa/aMAxFsIjGn9y1Gre3fMbEHU/BqWQ5NPbZkAvxOc/kwJoTM4PhX9sFlN0C+YrFA0NMrgRPpWBKKyERDat46HBXk6M3XcyzvRx3huPYA9A8KnlEyf2SCypJsQiXpSBYXaMkPFgRGEJq6NovA4eifYgH+CjmgZQ4jXxtEDxJrd1ENY737eSyWenU224PQ9DWMGTLeyb5TnwkRMERSWL5NCiTPcCfbydG7g4siE3cpN1YFf24QwTiCdXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Fri, 18 Sep
 2026 03:32:19 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 03:32:19 +0000
Message-ID: <cbba61d1-144d-44aa-9883-2808b0538437@intel.com>
Date: Fri, 18 Sep 2026 09:02:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/guc: Demote uncorrectable local error log to
 info
To: Varun Gupta <varun.gupta@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <zhanjun.dong@intel.com>, <daniele.ceraolospurio@intel.com>
References: <20260917135310.3590412-2-varun.gupta@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260917135310.3590412-2-varun.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0177.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::15) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DM4PR11MB5309:EE_
X-MS-Office365-Filtering-Correlation-Id: f243e2ad-0c78-4191-6c0c-08df1535713b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|6133799003|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 4ML17TUnPBCWXIoJj42h02wHRzYzhroGrY7l1de/DltNokwjPc0y6CEt2ba/xWO4BkEzEabjCw/iecjyGzNA275RQu6/gJgUC/IquwX9Paw0nRzl+f8ZPoGYlu+Fy52XY9AmQhkL3FpT3AxrK+unkuDAHU0WgZtB/eSYjAThez4hXUBxGF3jPwSy674+kmNIQZn8sEUp9BW2bKZRy0L6s5OQvCRsLOjQ+1bBtyfbmTmg+JyRWsz52y1CJFN8sDgq+kw9sQNkw96mJY/Aly7eEF0SYKw92/rnjNaP7DblKAxq5nOwP5KZlli8ygDQqIQD6t0fhFtbZnd2st0MKLbzRueeHWeu4AqXYTh+t45zaSg/r8qrcbbxQP0Z/CIQyC/jjXj9jVmlqAYeMEeZUrRoHkt6UCJbsZ8GdOubmt+6nokWk5qhOYL+tm9jriumBcbY201TYJEHJ1gW7sNhMWy++PPtcWPSybT20xLIvWl+z5BDg+Jn0IJDFtXY4geMOwy3lVS1I8pKPAZD7rUKjfcWUEBeXIVbjAXcQKOi9jISnfi+gYIVS0wuTNZWamxYnLf8N2WdAHSf/yBa/C5y/tr+xxBRX63yn2kdp4C+hOtjnRSJ1gQnyTlbtx+UPpXnTGq17F6kwJdiAE4U5rBKXUd6/Dflmocwhpc4UUsqecCcCOs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(6133799003)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDlidkZIaVVWWmhpVkkza2hZazI0MlkydkhqbkdHYmxBY0orTEh2K1ExNHpa?=
 =?utf-8?B?YktyZlRmUm9CRDhCMG5zSElNZm01S24vZDUzRzRkamFBYkNVRDhCQStQeTZ5?=
 =?utf-8?B?OHIzUWdvMzhXbHg5ejUrMmlmYXRiUjcycTBGazhTOHZMWWtLcWRZK2czM3Q4?=
 =?utf-8?B?Rnp5ZCtBZldRVjhpcGF0OHV5YmtZOFJmUFZTQ3JRa0tFakgvVmFrOFIxN2p2?=
 =?utf-8?B?RlVpL3FjSnNiVjVWVys0RXYzTGF2dWtLWEQ3ZTdZd3RXL1ZxeXRPUXBWakpl?=
 =?utf-8?B?WHhwcWV6dWo4MUw0RnBDYWIwd2JWZXUxWGZad1NhZnJwUVZlVkZ2Wm5oQkNn?=
 =?utf-8?B?RW5HQlV0eWdKSEVqWjhhc2pOL3BVeURTb0JOVDdIMk4weTlHQ3ROU1RIOUdV?=
 =?utf-8?B?Qy9pKzN0MDJLZ2JNblZhdk9tTVNMeFZRQVlCUXR3cVNlSDc2UVdPZEY5ek5t?=
 =?utf-8?B?aE9WV1RSMDkwckNkTVhEYzdjTlN5OUtoWG5uaitzeFIrMG1SZEduM2pLVkVp?=
 =?utf-8?B?WGl6SmJna0lVSWw4KzJubjZ2dU4zMUt6MXNFcnFhb09LRU5aRWNaQmdhRmhK?=
 =?utf-8?B?WnhxNlNpdm4vSGFMdWk3VENVOHFTUGlxNlN5RVkvTGN4TWcxSFlOOElzZXdj?=
 =?utf-8?B?em1jV050L1piN2NrTWVjbVk1RGdxM2FyRUwraHBsOGlYSSs5cGhXVGRReGZ3?=
 =?utf-8?B?bW9BRXovYWZsU3ZJQUpzZVhhWDl5MU9OcytTWG9GK1BzRnFIQTJWUVdsYjVE?=
 =?utf-8?B?dURIYWxBbTNGd0I3ZFZJbW52YjVsRkNTYkxQM24wb3hnRE5kYjFmWnhReTh1?=
 =?utf-8?B?Y0R6anVydEZJVEU0dFZPd21nUFYwNUhRSiszejVWelYrbHhEUjZnaCttejgx?=
 =?utf-8?B?V0Roc2p6QWRmWEFURTVKR1RxWFdFcmZYbnVhQnVrUWlkOGgrb3ZLc2RtSERM?=
 =?utf-8?B?azVoMVRzWUxnZ3lmVXRPcFNBK1ZJTmlXMEV1UUpOMnJ3anBUYmdMK1NMQlYr?=
 =?utf-8?B?Y0RVOXNhSm5tYmtFMUJ4cGRXMnhjellhQ05EMGJQbXNndEZWeFBOS2kxMU9t?=
 =?utf-8?B?dlpBbmJzTks5UXpVdTNxSmp6UTRXMDBxUXc2ZlNicVVpOXJobjdTaFYxNHdK?=
 =?utf-8?B?TUNLWHZtemppR2l6QzFCbjlHTjlWaTFUVXBUR1l6SENKTG51Y3cvOTF6RHpT?=
 =?utf-8?B?c0dsWFdyWC9mTWFtdmw1UFFxdG9PcFpNVnhLdENkWm80Q0lyTnYyRTdXWFJl?=
 =?utf-8?B?T2Vvd1J6U20vSUVROVU5VXluYVJkM0QyQlB1L2R0Nkx3M0FvYTJBd0dDdVVa?=
 =?utf-8?B?blpRVUdJR3FsNEppSzdRZGpoN2tYZ2ZWTG1VR3dUdTA2QStiUVdWWDN4KzRM?=
 =?utf-8?B?dGlEK2kyRXZCSFd4QURTQ2J0U0FaenRka1ZSVGs1Y0gxcWpwNy9ISldyWlJG?=
 =?utf-8?B?a044RTJVb1FuYVkrN25ZbGx0eDJadlBKcnExNFphUWUwMGpVd0lzM0VFSmVE?=
 =?utf-8?B?WExzaFZJbHZxQko0b2h0RHhreFk2ZU9ocG5PY0t1UHlZSXZ3NVVzMVJSN3dk?=
 =?utf-8?B?TXBranZscUV4eGlvdSt3YzR3bWVVSXd5cFM4b0xjNjkveG1nM1lleXJNdWxT?=
 =?utf-8?B?dHlXdTdjN3NweGFYQ2h4Q2lFbUFvUERINDh5OFJsaTV6ZXc5MnA1Tm53SURU?=
 =?utf-8?B?WDR0aFNuZ2h0WUpYYnNCbUh6eVh6azVMNFB2MFpKNjVSOEFRNVJCRy9UTHhv?=
 =?utf-8?B?TFlUaUNNdm5FeTZpY0lXamdBVDN4Sm1URGppc2tjbDJjb2tVRmRaTmlMQ2xk?=
 =?utf-8?B?TGEvbGJGa3ArWVVLOGdNSTkxeVA1RnkyQno5TENaSjhaR3U2NDVqNXprWHFu?=
 =?utf-8?B?Y2xJWjlIdWsxLzBRcTVvM2hPV3RyV0h1SG9iSjFDRTFxTUZjdUtFWnVaK2xT?=
 =?utf-8?B?cUM2RHVJSkh0YUY0aVIrOERseXhNc0MwcjNNaVZXN1N3dWRDRld2MXhtQ2pt?=
 =?utf-8?B?RjhOdlA3cTZWZi9Zd3l5NEJxcm9NSXRpRWhzeDZaRStJdytsM1h0UUwyckhU?=
 =?utf-8?B?N29wZjhQak9OU2dHLzBYNHNOZ0MxTGlYMFh1eGR6eVBBQ09wcWhXQ1JXUXNw?=
 =?utf-8?B?ZWpLWVQwd0RKemhkL0pDYzRIL3AyMVljYnB4NjE0cXN1eFBHNWVCUWxrdnkr?=
 =?utf-8?B?R25kS2RPUWF4SXlaZjJqSlZiQ1lRM2Z4NVBMQllsYkR5SDJBejhrM2hnKzhr?=
 =?utf-8?B?MHdmZ2ZITFI3TDZKcFpQWERvZnZMazVMR2VzaW5UcnYxWk1wSkxPaDlSclcr?=
 =?utf-8?B?WjMvdXlRY04zbGNsVlBxeGpOb0dxR25relpPSVVCcDNQczRSU0VEM0F1bFcr?=
 =?utf-8?Q?hXOUXekpN+cPeQ3g=3D?=
X-Exchange-RoutingPolicyChecked: VPPPyt3WkH53peq8AvbLgMnHa5jW1f+a2RSz9BUN4tmPGIge7bg/yjbgosX+neLQYdE75Mo8pPNz40fRS0Bfie8FWkTqnWwnntXZ+IID2SpjVbV/agcswzhPv6vwW7jo1tUGwMV98zfihVL3g3CNUVOtxK7+Lt+txFn7LNexSM0B0qRtecYj78bd1ES1W67z7XHFO3Zx0ohXQVizbJ2Il2Q37qpkSUgKjyYLtqyIOHAPl1f44ojFwjdo5+YPv9bh6qGNlukbDOI0aBT/QBdKr4RpD9caTMl+mrO4ys1onkQxj5C5qFB06bBXw7HP4NKiEsuK7mEeAB9/qVv/gzfpaw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f243e2ad-0c78-4191-6c0c-08df1535713b
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 03:32:19.0974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8M1HCUs0aorGQSgwfVtoJMIKdkyDb6FD/n69Heth+L+Ovy6sZBaLYi2Ztp9V7d6q9UU1OHLtirqDi2FQp2RuFV6Ps2KdPRKwnoOs+s4zMF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5309
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



On 17-09-2026 19:23, Varun Gupta wrote:
> The UNCORRECTABLE_LOCAL_ERROR notification sent by the GuC indicates a
> local, queue-level context termination rather than a global device or
> driver failure. This can be triggered as part of expected recovery flows,
> including intentional fault-injection tests.
> 
> Printing this at ERROR level is too noisy and causes false-positive
> dmesg-warn failures in CI. Switch the log level to INFO, matching the
> adjacent CAT error handler.
> 
> v2:
>    - Also ratelimit the GUC_ID_UNKNOWN to match the CAT error handler.
>      (Himal)
> 
> Fixes: 4e57574fa3a3 ("drm/xe/guc: Handle GuC local uncorrectable error notifications")
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index f3ba8abfc228..6144a1767f10 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -3487,7 +3487,7 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
>   	guc_id = msg[0];
>   
>   	if (guc_id == GUC_ID_UNKNOWN) {
> -		xe_gt_err(gt, "GuC: Uncorrectable local error with unknown GuC id\n");
> +		xe_gt_err_ratelimited(gt, "GuC: Uncorrectable local error with unknown GuC id\n");
>   		return 0;
>   	}
>   
> @@ -3495,9 +3495,9 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
>   	if (unlikely(!q))
>   		return -EPROTO;
>   
> -	xe_gt_err(gt,
> -		  "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
> -		  guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
> +	xe_gt_info(gt,
> +		   "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
> +		   guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
>   

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   	trace_xe_guc_uncorrectable_error(q);
>   

