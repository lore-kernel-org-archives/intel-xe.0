Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74515C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 05:52:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FAF010E9D1;
	Fri,  8 Dec 2023 05:52:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA9810E9D1
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 05:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702014746; x=1733550746;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ir9igZ2Q+9LatS+0MLCWlcSP48Zqdi5RJtxTU0YXyAo=;
 b=kuoy0hQLDw/2R1SkDaVON4QTrKbm2K7+ijm8KECqI0cpv4C/egp68Aw4
 3rB/qW8CXM2HeIp/qW5d11ImsZEXVpgaEdLIWfdRueJFZBAiaojCAFh8T
 opZ4O9NRjy70qecdym/yNX6cvtkB+8GnIWKPCvzaneNtDSDfW1wXv508e
 QlZk5wox8BdHjXC7F72zrqmtgkoHgcvY+eZ8U+kbYmnyvEseAuCLXsVur
 KdgLkt9ghyb9M3976R/mdvWb5TTpG88sFlDvgS1v8NCu5KmViW2SJCMXa
 f7d8VvxaCs/l/6z+dR6RibY5+LyX5Imjpt4x+TthRwGBM+cptC7hqkpsE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1185387"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; 
   d="scan'208";a="1185387"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 21:52:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="748227075"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="748227075"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 21:52:19 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 21:52:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 21:52:19 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 21:52:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fuo22s2kE6c5E6Tb4AqD7ZHU6GdErIfxXbToDxKk9xuFWDTGoYUvL1Nov7VZSnOGyeVju9VNDhUDpq5oKxsT2YvISSFoTSy33YBRCEORz2+QYBum4NMmxeKu8gDmr0v8yykz4eV6KpUsZZblOIix7r4H5uFDw2JnfBMtPhLIaEu+8GVrtp5VCsewY5KuOA1LKya0+0EU9jkuz5dUxsbNV/moR6MhPN2jWnyNuPmjzPa9je/4NVxW4RxG5ryWu7/Im20dm7ak1tfxZnGmKGMb3qcRkpMHLfj7qnONPtgCs9Itmjg0fOq/edxbR9SHjra9+xXkPdMx64SImie+QhcLXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QANpvXZGr3uAJJtGQKMqMwmGIIcz4FmylG4dBDwIGYo=;
 b=ZRC/b/+Tl/qZpJVsbeWfowTBO1gIB4CgDwTGJ1VhJVpVDih0sKJSczD99d+5dPniGrR0pWA8VSMcwyZNHFt2ICKw7GmZ2DF5WqEz1nho7TMIBUfYhdECRfFOwSc9+t6u59W9XexpwlVgr+l2SJ5OKIWvWt+jW1VVIQb4HR9D2lDmrr6UxZDKm4wSAQcg/I2MqFneKolx13ZebOewK4f02p4bUrXLqxqU4rPe/h2waECK954BGY1TSfLIuLaVXSigaRoD0sfQLioAhj+teS+7E/tJmjvmpI/8atieYVFik5AMEaul2TNIL4Zf2dam597Oyq1259vrjfqM4P2aO8w1eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA3PR11MB7555.namprd11.prod.outlook.com (2603:10b6:806:311::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 05:52:17 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6%7]) with mapi id 15.20.7068.028; Fri, 8 Dec 2023
 05:52:17 +0000
Message-ID: <0095da18-7d6a-4f89-a394-39c853925896@intel.com>
Date: Fri, 8 Dec 2023 11:22:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe: Change the name of frequency sysfs attributes
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231208051153.664055-1-rodrigo.vivi@intel.com>
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20231208051153.664055-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0142.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::27) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA3PR11MB7555:EE_
X-MS-Office365-Filtering-Correlation-Id: f561b3d0-4ad7-4a29-6b19-08dbf7b1d58d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rqxrg8v/mFzZ+iJB7reDhsvEBNBPAQQA5YtADLBO1ARjR0I+bFFT3asf7pdwvyS53YVzdiHBjAELxH025CbaycB5TJ1LuFHw117enjJzD0TafkRg8z2NsLswQK5V7LTfOane72g6M4lxrKd6xmTdzmPWr6sycPaM+Rq473MuFP0wweGwe/gWwAAKqiQvq/FhXXodGTLt8dnjSg1Vcn258pkQz8nYSYwLj8vnmPOb3Ih4eIczC1GK529GSl4OAZ1YXFoYeFG22pbDTxVr8MRDpmO9lDkAtodG8H9qWxw+r812c0ITB7T+4t8fB+BTCFXWVf3N/tc3oT8JNWexfZne8fLECr3v15JO5lIeWEP9fgk6dYHMaXXhiNVV/z1cZJa2bsw+zgBsOnlFQdp8ti3EV9lCMh4+pKVwAdsFXGQyx0tGGgtFVqRyNIG3CYeCSWJsVyUVdJGlM1kto7if44GQUbPOMZg7m6n3Dt05uNKrufVfOXaPOscXj1iqnZuCdS9rrwUSHWlmD8/5DoXhXFBR9DbfLQQi6hN7UnHXeSegIpnG32s06te9M0/e83sDippINrkpvx19aCcWCsXu8hYNAqQqFNS4pF0h55mPRt5Vvr4jVsNmul1QqtR6JenGQjglLgWjbYylRrNpS69ILba97w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(346002)(39860400002)(396003)(136003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(31686004)(38100700002)(41300700001)(5660300002)(2906002)(36756003)(8676002)(4326008)(316002)(6512007)(6666004)(478600001)(53546011)(6506007)(2616005)(66476007)(8936002)(31696002)(86362001)(82960400001)(26005)(66946007)(107886003)(44832011)(66556008)(83380400001)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WU4yOS9wOE5nSXpmVktaZGUxT0VxWjlBTW01ek5zU3hWNHJzTTFKd2hUaXRm?=
 =?utf-8?B?WEZkWWxyMmprajZkaHRkeU5TZHpwb1VBekFJT1pZZ2JsSWtNZ3VwVUtBdlBT?=
 =?utf-8?B?anBWMzFHOW9mVkpWZnVoRUlXb0tpM3dzTVZKYlR5ZnVNM0FRcWlQaEtmT1hk?=
 =?utf-8?B?eXlhY2FLMU5wMk42dWl0S01kMFREcDZmVlNSUlVQK3pKM1EyQkx4dmhjaXZS?=
 =?utf-8?B?ZlBBdHZWbms0Y2syUXdtaE9tRGR6NXhvRElHVzJqZjh2TkV5eDZORWNkdkor?=
 =?utf-8?B?NUM0b1pyZEI4cUVBZTlVOWxsMjI3S2Y0SURqK1JBaTQzQ095T3JmMFc4a1NF?=
 =?utf-8?B?N3Y2cVF4YmYyMjJ3bm5JcXhMN0x5SFdha0NFNWRKV0lEOTN0b1M2UWpzbmJh?=
 =?utf-8?B?cUVKc0RzYlRXL3g4L09YR1ZXYlNRTVVGcVdZWTRVMEtaNTJKOWh3ajZXY2Np?=
 =?utf-8?B?SzJmV3ZTUmY4SHVmUit0UEU1ckVZSXoxYzhZQUVJOGppYmp0Yi9SNE5uQjRX?=
 =?utf-8?B?WTlzcnBQQTRJWVUzV2d2N0Z0a1kvWmNvQlVPRFhNbCtDUnpNZ3daMVhFbHNG?=
 =?utf-8?B?eHVSUGhOTkJDcDd3eGFLNFdWQitodzVnYzE1Q2kwWEhxTWpFU3hnaGNmNG9D?=
 =?utf-8?B?SEVGcmtJQmR5c3pJTXBoeTZmMklrNTM5QUlwUzhlbGRKUmhvbkZRTXNJMzdn?=
 =?utf-8?B?L29WbTl1dmxWeDJxSk93Vk16L0dNOVhRaUZuR3F3TVhLU3Aya2FEZ1pQbnBz?=
 =?utf-8?B?SGRlcTdZZGpDTkZyeUUvdy9KeW1NZ1JId1pEU0ZSS3I2S3NZTnh1UjJiVEU3?=
 =?utf-8?B?aWhQUlY0MkI3dG9vZ2Q2bDNBODduNUFNYkF5cE5NRUNTM2l2RE5PSVNCK0JM?=
 =?utf-8?B?WjQ2YWswV0NaZ1BiTFl3d2NMQUF5VmU0Q1hOMWltRzVudTRLakpvZlMwc2Vt?=
 =?utf-8?B?eWcyQVZ5NncrWVlOV0R1aFlFQldWM3hmQndmazNaNG5WMEJ2bkUwcDZ5K3lU?=
 =?utf-8?B?cU85UytnZjFBbFZKQnpZSytkODY1UHpOUVpuQUJ1bVVqYjJwRHRwY3hCc2hk?=
 =?utf-8?B?WWIvbE1WTmd1OXdTUWRZYVFRT09UYUlST29mcWRWVmhZUWN3WVhHT05mYUhG?=
 =?utf-8?B?MWxadVlmRzgxOHlPa3AxRVMwRnJIdyt1bVltdHdaRFF2MTA0TkRreXhralFs?=
 =?utf-8?B?TDViMHEycFdnMFI3SXZQSFljODNLTjErZlZlTGdnVitFTHhvSEFBSEdpeGdG?=
 =?utf-8?B?di9meVNnZVBlaWE2QUhSTUdyQTRqdlRIM2haNVloVlM2amFiSFozcURieUlt?=
 =?utf-8?B?cUJQMFlIcWhYMEo2eWRRNWc5T3poamo4WkN2a3c5NHVQRC9OTk1tZ1lQdyt6?=
 =?utf-8?B?VjdlaHhqamFzY1EzUE5sQWV4ZHpHZGJURmtWSDdkQlFRSDFpSmNNVmx3K3N5?=
 =?utf-8?B?RjFmK2RYWjVRYlpiV1VJYjV1RkFVcEl2US9RK1RkbjNid0dZbSsvRU81SW9p?=
 =?utf-8?B?QW4rTlUvVm5tMjVJZXJtUDF0TmZIZzU0S2lHdHFDbWViaDlRVGxEQWdzdmJl?=
 =?utf-8?B?MUdpTHNpUDZVRHVQaEFDZVhYcjVSdmsxTzFodTE1RDYwOXhlNTFKQU5yZzB0?=
 =?utf-8?B?UUVMNTVjSWZpQ2ErZ2N5VSt3bjhnR0kvUjFCdzdGUkNQR1MwYUJlbzF1SldB?=
 =?utf-8?B?YU16RHdMbmpBVXFSWGcwMWFWZEpGdmxQN3Z4ajZtWEo4MTIrWlEwYVRZREk0?=
 =?utf-8?B?U3c4VEVhcHJDdVRsazVwV2h0WnJqK1hQOEdGVGxwZHhOWEJBSWxySURIZTNl?=
 =?utf-8?B?WTJRUFhDUGRpUFVPbnlVQXlIazBHSHNadEZkbHFuV1lHR3p3K21zVDRKL0Zn?=
 =?utf-8?B?dDhGSVBWOU16SjF1NFlza1FoT1BybjN3ZzRJd0lSSHRIZFIrVDZCZXNHZW92?=
 =?utf-8?B?a1RMUVdvSEFadFBhcDlicWxNOCtuTTJHTDBFSFpXbmdnbVh5azhBTDcxTlQ2?=
 =?utf-8?B?TGU4L2NtSTBPcUxqQlc1cGRFakh4YTdQdmUwaEJjcnp4YkhmOVZ3Umw5Ui9S?=
 =?utf-8?B?VlZXZHREUklCQjd4d2pKczJqT25aMFUrRUpNSnVzekt6VWRiY0JYUnhpT2d4?=
 =?utf-8?Q?O5T81iHC2nV6nrbHNKMR48AXt?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f561b3d0-4ad7-4a29-6b19-08dbf7b1d58d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 05:52:17.0404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: epFGfYApAa2AMHAEjo+6+WfUxK/xwUzMKYLmoojYHuxjVxZKCSrQgAOdm+Nsyp+yHA/ppwXc4mqT9v0GcH6bAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7555
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 12/8/2023 10:41 AM, Rodrigo Vivi wrote:
> From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> 
> Switching the names of frequency sysfs attrbutes to align with
> required devfreq changes. The name changes are as below;
> 
> -freq_act -> act_freq
> -freq_cur -> cur_freq
> -freq_rpn -> rpn_freq
> -freq_rpe -> rpe_freq
> -freq_rp0 -> rp0_freq
> -freq_min -> min_freq
> -freq_max -> max_freq
> 
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Based on the discussion on rev1, looks good to me
Reviewed-by: Riana Tauro <riana.tauro@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_guc_pc.c | 60 +++++++++++++++++-----------------
>   1 file changed, 30 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index d2605a684b1c..b1876fbea669 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -60,15 +60,15 @@
>    * Xe's GuC PC provides a sysfs API for frequency management:
>    *
>    * device/gt#/freq_* *read-only* files:
> - * - freq_act: The actual resolved frequency decided by PCODE.
> - * - freq_cur: The current one requested by GuC PC to the Hardware.
> - * - freq_rpn: The Render Performance (RP) N level, which is the minimal one.
> - * - freq_rpe: The Render Performance (RP) E level, which is the efficient one.
> - * - freq_rp0: The Render Performance (RP) 0 level, which is the maximum one.
> + * - act_freq: The actual resolved frequency decided by PCODE.
> + * - cur_freq: The current one requested by GuC PC to the Hardware.
> + * - rpn_freq: The Render Performance (RP) N level, which is the minimal one.
> + * - rpe_freq: The Render Performance (RP) E level, which is the efficient one.
> + * - rp0_freq: The Render Performance (RP) 0 level, which is the maximum one.
>    *
>    * device/gt#/freq_* *read-write* files:
> - * - freq_min: GuC PC min request.
> - * - freq_max: GuC PC max request.
> + * - min_freq: GuC PC min request.
> + * - max_freq: GuC PC max request.
>    *             If max <= min, then freq_min becomes a fixed frequency request.
>    *
>    * Render-C States:
> @@ -388,7 +388,7 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
>   	pc->rpn_freq = min(pc->rpn_freq, pc->rpe_freq);
>   }
>   
> -static ssize_t freq_act_show(struct device *dev,
> +static ssize_t act_freq_show(struct device *dev,
>   			     struct device_attribute *attr, char *buf)
>   {
>   	struct kobject *kobj = &dev->kobj;
> @@ -413,9 +413,9 @@ static ssize_t freq_act_show(struct device *dev,
>   	xe_device_mem_access_put(gt_to_xe(gt));
>   	return ret;
>   }
> -static DEVICE_ATTR_RO(freq_act);
> +static DEVICE_ATTR_RO(act_freq);
>   
> -static ssize_t freq_cur_show(struct device *dev,
> +static ssize_t cur_freq_show(struct device *dev,
>   			     struct device_attribute *attr, char *buf)
>   {
>   	struct kobject *kobj = &dev->kobj;
> @@ -442,18 +442,18 @@ static ssize_t freq_cur_show(struct device *dev,
>   	xe_device_mem_access_put(gt_to_xe(gt));
>   	return ret;
>   }
> -static DEVICE_ATTR_RO(freq_cur);
> +static DEVICE_ATTR_RO(cur_freq);
>   
> -static ssize_t freq_rp0_show(struct device *dev,
> +static ssize_t rp0_freq_show(struct device *dev,
>   			     struct device_attribute *attr, char *buf)
>   {
>   	struct xe_guc_pc *pc = dev_to_pc(dev);
>   
>   	return sysfs_emit(buf, "%d\n", pc->rp0_freq);
>   }
> -static DEVICE_ATTR_RO(freq_rp0);
> +static DEVICE_ATTR_RO(rp0_freq);
>   
> -static ssize_t freq_rpe_show(struct device *dev,
> +static ssize_t rpe_freq_show(struct device *dev,
>   			     struct device_attribute *attr, char *buf)
>   {
>   	struct xe_guc_pc *pc = dev_to_pc(dev);
> @@ -465,18 +465,18 @@ static ssize_t freq_rpe_show(struct device *dev,
>   	xe_device_mem_access_put(xe);
>   	return sysfs_emit(buf, "%d\n", pc->rpe_freq);
>   }
> -static DEVICE_ATTR_RO(freq_rpe);
> +static DEVICE_ATTR_RO(rpe_freq);
>   
> -static ssize_t freq_rpn_show(struct device *dev,
> +static ssize_t rpn_freq_show(struct device *dev,
>   			     struct device_attribute *attr, char *buf)
>   {
>   	struct xe_guc_pc *pc = dev_to_pc(dev);
>   
>   	return sysfs_emit(buf, "%d\n", pc->rpn_freq);
>   }
> -static DEVICE_ATTR_RO(freq_rpn);
> +static DEVICE_ATTR_RO(rpn_freq);
>   
> -static ssize_t freq_min_show(struct device *dev,
> +static ssize_t min_freq_show(struct device *dev,
>   			     struct device_attribute *attr, char *buf)
>   {
>   	struct xe_guc_pc *pc = dev_to_pc(dev);
> @@ -513,7 +513,7 @@ static ssize_t freq_min_show(struct device *dev,
>   	return ret;
>   }
>   
> -static ssize_t freq_min_store(struct device *dev, struct device_attribute *attr,
> +static ssize_t min_freq_store(struct device *dev, struct device_attribute *attr,
>   			      const char *buff, size_t count)
>   {
>   	struct xe_guc_pc *pc = dev_to_pc(dev);
> @@ -543,9 +543,9 @@ static ssize_t freq_min_store(struct device *dev, struct device_attribute *attr,
>   	xe_device_mem_access_put(pc_to_xe(pc));
>   	return ret ?: count;
>   }
> -static DEVICE_ATTR_RW(freq_min);
> +static DEVICE_ATTR_RW(min_freq);
>   
> -static ssize_t freq_max_show(struct device *dev,
> +static ssize_t max_freq_show(struct device *dev,
>   			     struct device_attribute *attr, char *buf)
>   {
>   	struct xe_guc_pc *pc = dev_to_pc(dev);
> @@ -571,7 +571,7 @@ static ssize_t freq_max_show(struct device *dev,
>   	return ret;
>   }
>   
> -static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
> +static ssize_t max_freq_store(struct device *dev, struct device_attribute *attr,
>   			      const char *buff, size_t count)
>   {
>   	struct xe_guc_pc *pc = dev_to_pc(dev);
> @@ -601,7 +601,7 @@ static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
>   	xe_device_mem_access_put(pc_to_xe(pc));
>   	return ret ?: count;
>   }
> -static DEVICE_ATTR_RW(freq_max);
> +static DEVICE_ATTR_RW(max_freq);
>   
>   /**
>    * xe_guc_pc_c_status - get the current GT C state
> @@ -667,13 +667,13 @@ u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc)
>   }
>   
>   static const struct attribute *pc_attrs[] = {
> -	&dev_attr_freq_act.attr,
> -	&dev_attr_freq_cur.attr,
> -	&dev_attr_freq_rp0.attr,
> -	&dev_attr_freq_rpe.attr,
> -	&dev_attr_freq_rpn.attr,
> -	&dev_attr_freq_min.attr,
> -	&dev_attr_freq_max.attr,
> +	&dev_attr_act_freq.attr,
> +	&dev_attr_cur_freq.attr,
> +	&dev_attr_rp0_freq.attr,
> +	&dev_attr_rpe_freq.attr,
> +	&dev_attr_rpn_freq.attr,
> +	&dev_attr_min_freq.attr,
> +	&dev_attr_max_freq.attr,
>   	NULL
>   };
>   
