Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3120C54E67
	for <intel-xe@archiver.kernel.org>; Sat, 23 Mar 2024 05:07:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767FD112AC8;
	Sat, 23 Mar 2024 05:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b+LhNKoW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F78A112AC8
 for <intel-xe@lists.freedesktop.org>; Sat, 23 Mar 2024 05:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711170436; x=1742706436;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EIBqZ0NfSBa7Z9fJFoXphf3r6UKN7LrQwlvY1tW7QdY=;
 b=b+LhNKoWf3bJaFaWxhUV4Ew9AQ3gowrR69rnnl0kWGv+Ar2lWQQOvKns
 F7gLZG6jwAUVAtxAdWuJu2uirAcwziIMn7U4tFYD/AVw3h6aNEolKzERG
 FJkAdxH8n1zjKXU1vEn1NHQ+/haBcu0/ei7iDY0WYpoc9TjP5zl6WHhsw
 kWls7oYomLxSy/zKM58Pyygw2VHQKyESpt2DCceDkQ557avYofjvgtC2h
 mXmpyhrIunTiJl68P8LkGs2+XdoF9QoLAtAEHiq/idQx8p2Wo+APKOFHR
 4qKXHEDPIFzR3/d3L1QdhHj/s+iSDi+0ZYikcHahSaFjwQWW3fetNyJoc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="23686248"
X-IronPort-AV: E=Sophos;i="6.07,148,1708416000"; d="scan'208";a="23686248"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 22:07:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,148,1708416000"; d="scan'208";a="46249101"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 22:07:14 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 22:07:14 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 22:07:14 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 22:07:14 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 22:07:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1Gg+g2ry0KDSd9fe7LveSyfnnkA3lpeFzE+vLrGpUthjJFy7Hy/hhtmu8zYgbdRcNiXa3XUtITwZc/q16M8l3nmUw39t0dqLYnMZQvN/VjUFSqOEZSkpvccT5VxyFGqFoeU2U1aSBs6rRE4Rm6STdq7w/9FE1zBNAQn6rgjaQ+AQ9/lT9upwP6ObZugG/dY3sb4NeOOXG4cgG1btg0agb+zAkKx/YmHgjmTIWxkYOHivwXyi0GFy1LSVXY9DqdSENAyzyccRM77EWWeoK6DWXvIrgNyPiQM7dVJkOP1H4pXvF5vdrNByIPd5Ujl3xmeVdvTjZEyvMuRuWf4In520A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGdVpejlIaCbrlb/SvwkP3cNhDL8B3yUEcjjOK+hO6E=;
 b=RXA5w1RV9IEI4hKNOwWKbjErhIWcG1p4SYNltW5Qg67LmBKG+4CgfeqhHlT0RI5oOpCmRST/0hEBDy7OFZ9UFtQJTYajf3bv0utvG32qYrN29qlk+E+eaUqAgPH8BZTCbi6ydsJAnItZP1KiKU3mg52yBxB4F17sLjkba4xjkM/3SXAjSfsZ+VG4tBONwBbxFGHfeg09KjirNWkpWFr34auvD5JOK+EY2IM9YMf+iR7c6nHmw1yBzzdaGshvL1tTd2baHHERIeVARjb46I1OpgJsyLJiw93672w5jrDJqCZasA0YxCRk2GtMdpX9EawuX+EeZFgPmWrXvEZva52dmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH7PR11MB7123.namprd11.prod.outlook.com (2603:10b6:510:20e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.26; Sat, 23 Mar
 2024 05:07:09 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::eb80:5333:fa3e:cb6c]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::eb80:5333:fa3e:cb6c%4]) with mapi id 15.20.7409.026; Sat, 23 Mar 2024
 05:07:09 +0000
Message-ID: <5d411e4c-4b00-4b19-8415-0a6e57eac060@intel.com>
Date: Sat, 23 Mar 2024 10:37:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix static analysis tool reported errors
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>
References: <20240323044822.2632787-1-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240323044822.2632787-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0048.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::23) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH7PR11MB7123:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c5f67ac-dc7f-45d9-195e-08dc4af71795
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eojB50SpCwg+JsSEoeFIk8hzwOc3thcELMKqA6c2o1TzCfPyIWpuahOHs59Jzpm2svWFXD7jzYxm9u2ppF2BDPODJsx3ymmfGY9SbcGWkSC0BaiOMdByeQI4+ZADEG8MAcDo4k9aYJLK5zg+iemPCwRMvD2GBoclkwp2nRy8y7zX34wi3rwEkbJmHZJ7gskWxAjjUyCAxpcldHvwQzTMRoyRpvF/6QHZbAJ+sGDLmo/hPaM6OdJeAmy928doeBYCqho9GtFjbfXJdu8Hr/LTfZFsIfINO8fM3bx9Xjala/0hXyhDh3LinPBTCYFSUIg4jU77zxZRH7dpXP6y52F3EnceOV0j/sgcvnaKvSpjiZGAXicfdlM0L0swQaDIvjpJGXQYMirzx5ngnjxjqLaGn9NJSUqwP2yDZPn4CbWRTQWp0VEDj4NK60FQmQmBeu82REGdSFWEpY2Pj31Vr4ZJf800NqEhPyklj5EQoJoCEjRYbfnuDaoHQCtp5mLil5w+Rw3a4tYJTh4S6lC+C7fe6GBtJv9hAzpCfk1YtEsmzqVv0mRHPolwYXoiDzvqT93FAgdQAdOxbaA/plLKLrFXl7NGWJjwGkkZIxm/Tim4LaD7uL8Es1LR5cDZKFxQEdX1rnCJ5chMIy57URtlYVyDnY8CC7mg7oagr83lvD5nka4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUdZUjI5MDdoeTRzR3d3bGJ0YTdFU2tnQUVXdDVaM1JDakRkRzlPRjNpdEVS?=
 =?utf-8?B?NkRKeTZ6UHlYTlFvVnpIVm5KUmt1Y3VXM2M0c3VQYXgzWHErYURRR3RrVUMx?=
 =?utf-8?B?ZVdVbFNzT1lUdzNNc1VMdGVnY09Cb3R5WDBHb3JKMHFSL0NkK1orTUhkcXpy?=
 =?utf-8?B?ZC9SUlRacDhveEpGbTJSUk1UMXRjY3Awd05sMmw5U3R1MzRqbnM4MEMzcWoy?=
 =?utf-8?B?RDlLOExhMDcvQ2hqbEd4c2puNGg3UXh2bTJOWjd4U2thL1RHVWJtU1VSOVly?=
 =?utf-8?B?SVBwZ01ERnpXY0Z1VlUwemQxTk1YRENtL0NWY1hSRlc5Sy9GVkVQakVvM2Vn?=
 =?utf-8?B?cW5XcG5DbVRmdVZtRHMzVnJJc09rSE5CUE1VSVkweDdvY2lLaFRicC9mTWJX?=
 =?utf-8?B?clJ2UUdlWUlNY29XekQwT1BJSGtsMU5JdDM0cmphMmNJekdQSCtuUkZKYlI1?=
 =?utf-8?B?ZEEvcXY1Y1dQS2RWbHFwY05iSzJ5S0E5WUxGTDI5RmpYcVl0Si9uSng4ZmxB?=
 =?utf-8?B?SEhSWXJHNW9sZEV4SzI2K3RFdldlamhqb09rKzVpZ2JvdGVSeDE2MTlYMExO?=
 =?utf-8?B?cXJlYjdiOGZYc3lQYk9HdzF5cEp2VjR0cHJGc3lIZ1ptYmU0RHFVREpIMHJV?=
 =?utf-8?B?MTFFdTBCYlhadWZzWlZUOTVlRjlqbUNpN0hUeVQxdjFxUXRHR3l6N0MybXZu?=
 =?utf-8?B?aWtMa3B4NDhzSkY1Q2RTT1pBbUxFTlg3WnFpSDJER2M0RU1yOVVNekNCRDNW?=
 =?utf-8?B?dFJYY2IvTWdKYWZFcFNsL0NpanhIeFFjd3M3d2JHMGp1Nk5qUm93bFBTVTB4?=
 =?utf-8?B?WXR3M3Jhbi9FZGRkUGJsWmNBZnRyN3AweGtVSWhaSnlJV3JPUDhYUzdVUFRI?=
 =?utf-8?B?QWZhSDdtWkRXVmt2QVVycGw5VzdOQ21SaFplc3A2K2lteE1mS2RVNnNLVGl0?=
 =?utf-8?B?UnB5NjNVVDJzclRsUkprVVk3V24zMGxjMWtFbzVtWHJXT3VGeFVWRGo5K1BN?=
 =?utf-8?B?ai9oSWdYVmRRMVFXYTZYU2hOZjBoaGZLUkEvZ05EV3ZhcndwakxSNjFxOXY4?=
 =?utf-8?B?YTZEcVdLTXVBVk1Kc3lScW1xb2R5cFVmL2tIWWlXbnFaeTA1SzQ2WHI5cjI5?=
 =?utf-8?B?bzJiYnpyUzFnUGFVbTJ3M2I3TDYzMnZ3Q3lIQ3ZrVUczRExsSkVvQU9wRUtT?=
 =?utf-8?B?WkVKRmU2enoxbFVFWEt0azB4bk5xOUFIekhkK1dsTWMwUlhkOGdFeEFtSzdm?=
 =?utf-8?B?MGNadHQ1cjM3bm82QWZqNjMyUkZ6Z2xwdmw4SWtER0Z0R1B1ZS9MQjVoSmZz?=
 =?utf-8?B?RExZVmVPS3IwR2FPZktkRkhnL1lMZlhZLzVJSytMYXVmQ0dVcmpjRE5wQkJS?=
 =?utf-8?B?dXJlRW1NSGpYUVp4bmpmY3dSV3Y2YXpUUlJPd2trZ3djbTVJOC9OU1htbnZ1?=
 =?utf-8?B?T2w4ZjErYkt0c01FT08wc2tBZXNlQUJUUWZPdENTRjhpaE9SVWw1bXRqN3pG?=
 =?utf-8?B?cWVocnkxWmgvVkp1UUJSdnlqZWprMnRkWC9WMXM2UnBPNE4zY3o2TDJiWjYr?=
 =?utf-8?B?YU9GRlpkdXBiankraW9iOVFMN0xXYk9xai9mclNpb1YyeUIzUlhSMlg3ZWUy?=
 =?utf-8?B?bnJNUDZlcGg2UC9vSVg0L2NSanRwak4va0U3ekFJWmp3TXJNUGdHRHVCc20w?=
 =?utf-8?B?NE15eWQwanZrUUlKaTAvZngxTjFjNVZOdGZ3U21pUERiZmt0RlJiZk12UWl0?=
 =?utf-8?B?RmVDVUpyWUJwZHQrSFVmTHlXRkdJN0VsUk1LQW1aNG0xN3RIRkhaMnphUVpN?=
 =?utf-8?B?QjlDc0lrL1Z6MHN0UnBlQll2OHkzZ1BzZElTd3Z1SDlrNEQ5SmdrYXBweW9z?=
 =?utf-8?B?eW5SY1FkQW5wTTVNV0VjVFNleXdaR2ZJNU9ybWNXRXdFdGtaUndNeDVHSmo2?=
 =?utf-8?B?ZWF3REJzd2lhS0dXWkNqUVdWTm44bVExQ2NtcEh6K05BTFZWcldaSHdVdmRh?=
 =?utf-8?B?VGRORlZpblNGL29ibmJhUU1lT0gxN1ZvQk5CT00xQUtPWGV0QkdiamVWS0lo?=
 =?utf-8?B?L1VOZlhUbS85RzdPYytXaGp3bFc1RmVGbnlHam93NysxTzdoTFNGdjl3ekds?=
 =?utf-8?B?ai9kbnVKOW82OUdZMngzWkI2SmdtMHFCb3pXQnhVVUk0TExRcWdhalV4em1M?=
 =?utf-8?B?QlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c5f67ac-dc7f-45d9-195e-08dc4af71795
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2024 05:07:09.5826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uEdhjmrnkaw4xpX5eJ346vq4nBuueiXRm1s1BB9byeVmhqA41Bxlq4KVGYo0AwSvK6ur/r1pXCgcu9ll1lKCjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7123
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



On 23-03-2024 10:18, Karthik Poosa wrote:
> Add a NULL pointer check.
> Release resources before returning error. (Riana).
Put this as v2: Release resources before returning error. (Riana).
> 
> Fixes: 09d88e3beb64 ("drm/xe/pm: Init pcode and restore vram on power lost")
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pm.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index cc650a92c2fc..46abf63bc37b 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -383,6 +383,12 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   	 * really lost power. Detecting primary Gt power is sufficient.
>   	 */
>   	gt = xe_device_get_gt(xe, 0);
> +	if (!gt) {
> +		drm_err(&xe->drm, "xe_gt pointer NULL in xe_device\n");
> +		err = -ENXIO;
> +		goto out;
> +	}
> +
>   	xe->d3cold.power_lost = xe_guc_in_reset(&gt->uc.guc);
>   
>   	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
With a comment this is
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
