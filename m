Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2D4C2BD09
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jul 2024 08:21:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20EF610E2B4;
	Mon, 15 Jul 2024 08:21:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T6V9NpJT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBDF210E2B4
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jul 2024 08:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721031683; x=1752567683;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ehYiEocaNnQmnlOf/e7ylfUUjVBRjlewuj20SvtetgM=;
 b=T6V9NpJT+jlP1raDju8/sJe2Kp/kIREWP701/gZsg15iTS5uHCzRd389
 +xn2c8KqIJMqj4EPCgI3FTEFQHQBAkIJMozzxftRrNyCo2sBz5jfH0zkx
 goobrr8ngBFOCzWVphPfHD0hzWmgK2katTi4wOvS02ssts8k1eKsu7sVT
 w/wslHPKhdygTtZkPEblFO+OsOAX8IHj9USB85YUn7XXgx5+dY7YqpJnC
 9JCQRKI6trr7aWhLdkI8DXTRKitH2UXSt7c/x54NTyjuQGpJXE2NAHJmd
 ACJbX8bVBzZGukslEGYPR7ulKCvywW6k6V8fASnORiJsYx9MQ/HXZBrRo w==;
X-CSE-ConnectionGUID: dcsTSb90RMKQbbtoXJedGg==
X-CSE-MsgGUID: oZOUE9J5SK+/3i+eJmuNNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="35937264"
X-IronPort-AV: E=Sophos;i="6.09,209,1716274800"; d="scan'208";a="35937264"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 01:21:22 -0700
X-CSE-ConnectionGUID: UJC0WVcYSguTH8SAIlERDA==
X-CSE-MsgGUID: l0vVsRs5RUONVD4qv3JP6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,209,1716274800"; d="scan'208";a="49515470"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jul 2024 01:21:22 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 15 Jul 2024 01:21:21 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 15 Jul 2024 01:21:21 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 15 Jul 2024 01:21:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pi7duNqAxea+Beb9HmPC0yRjy1KhO36sD8TLHWa0uXLvOtfXngw+E+aO7F8LBRYvCPzAsSY9M6UosZngh22sCmKD6lbNoD+D16a3W/TYBgOH70qN+HkJ9hTIk4Ub3smAfRZsxcNFHlGAI/7x24DerHykYHWnrJFsySEY73F25LfetyJi9mM86bKuET36nHhsFD4JVLnEcONUsZd07ulce5Sq7RUKjSbxYliCLie2llzITyNYILxZBOSt69co8Z9kXnZATsim8/7CzmbU9/wLdkvo97DaA4nkPGh6/hbVnIi2/KNW4RbReItF6g2Nt76vu1xSrb+GlU3RcYL+SHwO+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5rl69drP4bK3uv37LC0z4YtIDidSGEROjbAlTV/XgWM=;
 b=H9vE5rEwjTKljjnvi5Sxab+IIrf0iqL5U0KmdunFxaWU0F+Tk8k537mFo6cvWzRWB1QsEL1mCFqGDPvJaJW7paK9CF3xNZxveojFOp5GN2bCe+8A146CjGFUciNwx4xwJymwEzJvVvF5N5lHTW0XSMpyPmiL4qj0S38dblNrPxfg1yfEcYBuXsLcSXO6My6iCEUasUM3VUfVFhGThSOv0nw7AyBvgCiGECro7qG4Aoja/ay1e803Llh77GrREW0Oi07Hk4okSbQGV+zWmVgIUtwLYXQlDP7UktJtztsAgOdKFeKTnfLjU+Yh8zToXD5RovOGcWNmQAVW4KMOULvbuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 LV8PR11MB8559.namprd11.prod.outlook.com (2603:10b6:408:1e6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Mon, 15 Jul
 2024 08:21:19 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.7762.027; Mon, 15 Jul 2024
 08:21:19 +0000
Message-ID: <eaca3c8c-88b6-4edc-9308-92308fac62b2@intel.com>
Date: Mon, 15 Jul 2024 10:21:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] drm/xe/uapi: Expose wmtp as engine capability
To: Francois Dugast <francois.dugast@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <joonas.lahtinen@linux.intel.com>, <mateusz.jablonski@intel.com>
References: <20240203060534.6839-1-nirmoy.das@intel.com>
 <20240203060534.6839-2-nirmoy.das@intel.com>
 <20240216195254.GL718896@mdroper-desk1.amr.corp.intel.com>
 <f44d6246-e172-4036-9d5c-fc059a0e352f@intel.com>
 <ZpFVZT-OHmcIsm9j@fdugast-desk>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <ZpFVZT-OHmcIsm9j@fdugast-desk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0004.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::13) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|LV8PR11MB8559:EE_
X-MS-Office365-Filtering-Correlation-Id: ddb587ee-cd7d-460c-85a2-08dca4a71a9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TlpXL1U5NVlqQkg4eFlWVmZoYTVKYktnTGpablFBMFpMU1VxU0V3OVQ1S2lV?=
 =?utf-8?B?dldzTGYwY1pBWSt6cE04RXd2MW0vWVZ4WXZnL2lid0FzTnVHZm5RRHNHblRa?=
 =?utf-8?B?ZVpRNnMzc1ZsYnVtR0tmTnREckZubjNzRiswZjRiaFd5K2psSkhjQWVTOW0w?=
 =?utf-8?B?a0xnS0k4SUg2VU5GRjlIQXp3Z2ZYeldUamIrbTNBd1hNTTRGMEtlTWduVGc1?=
 =?utf-8?B?Qit0THNhQkgyOTlrNEFTd1FOelpZTFo1TXR1dXRlT3ZGczNydmM5QTh1ek9l?=
 =?utf-8?B?QVdRTzE1ay9RVXN6RHFiREhSc3NUMUIyYjAvd3Z0QUZHT2VpWXVoUkllK2l0?=
 =?utf-8?B?MHBlc1BzbWVTcjh2VGszV2NkODFFTTNBNjZJbmJ6WldQOWQwZHg0Q1ZFNUEv?=
 =?utf-8?B?ZDZyU3JwVldrOFpUWng3Q2ozbUFUTHBSU3FFK2VCZXFQMjNGVVRVb3piKzZt?=
 =?utf-8?B?Zmd5bUZkSW9uU2VBdTlVQWxqeWNBcHQ1MjlUNHZYU0RUM25Mb2tYYkxPdVhC?=
 =?utf-8?B?b3c1T3F6SFFERnNOekRuNExwMGl1MmNhSHdTcWxWSkw1eVc5YkJPekUvSXdL?=
 =?utf-8?B?L3FYRHpULzdOSTZsTEZOckVEb2tRcVJUY3BVbHlOcGlsV3kzOWVqRFVWd1U4?=
 =?utf-8?B?YituV2J6a01wRnpKbUl0cFlZM21aSENPMnR6UzlpZnlQMlZzOXptbVhFdVVG?=
 =?utf-8?B?ZEY0YmVjQ09YdTBtTTRsRGxOckNFV0h0SFB3YXBBL3R2U1J4NmxCZEJ5K3FP?=
 =?utf-8?B?K29TZWtGQlIwRVUvOTlUc0tVc3hscExYVTFxejlkYXpjZUlBcldxUWRrNXJC?=
 =?utf-8?B?c1JUSllZalF1dmI3TDRlUVlpNXNnWEZRb0U3MUhodXByUENmRG9hYmQvZlRJ?=
 =?utf-8?B?alV3b1NVdWZnZGV2KzRCdlZpOWFwcUc5ZEZlRUtyZmFUWkw2cUZCVmkrNUVL?=
 =?utf-8?B?V040WlRUcFl1V2V4aWRNaDBsbHFKRXk0SkdVaXVkR3hRbHJYYU56YjBmdVIz?=
 =?utf-8?B?N2pualFVTnd6Rk1KTlIxWTRYUTJQZTNNZkNuODh2a0wzUy8vZ0prZjFGa0RC?=
 =?utf-8?B?ckYxUkNpd29xUmR6ZFljb1NyL29xTzVucGlsNzRYeG5SQUVCZ0FtM2paOGg4?=
 =?utf-8?B?YmN1Wi9UbFBGVGNMQ2VKWWViMGt4eFZaVVlDYm5sS0w2SFBicVhpRzIzK3Vy?=
 =?utf-8?B?WlFqMEpvNVB5YklTQVJJMlRuRnpJQUtDYTVsbmVSbGxUOXg3QnArYzdhdTZa?=
 =?utf-8?B?YVFWdHFKU2tVN3IyYlgzYXVvbWtRWTNLN0I4TkxVSHFGSVAvR0dLOXFPbDZM?=
 =?utf-8?B?c0E1ZjlIb1FUaWZEUFBCNE5ERnlSVmVYTitKcEVPSDhzNEdvejdvakVhVldR?=
 =?utf-8?B?cG5mSW5icG5FYW1jY3JWTlNWQkMwSHJFbW9BNzVPaGxZQmo5dVc5ZEJzdTdV?=
 =?utf-8?B?WVBLNWc5N3NHZHB4OGNhTEViNWJBbjVubDQ5aW1wK3pvT0Q5L29qZFFoUzQ0?=
 =?utf-8?B?bU1rM0NXN1JLNXQ2WlZySmdhME96a0dxZmYxK08ra0RLOVdPQzVQQ1hlL2Zk?=
 =?utf-8?B?YUVVQTREK2tGcjNsRzlrNWZ4c20xajd3U2dQMC9hbmgxdGptZjExSElIbG1p?=
 =?utf-8?B?S2M2YzhjTWk2M2ZERGIxS0tQRHpjMEJCL3FpNTRVWUhuOUZNWWtCcC82RE8v?=
 =?utf-8?B?S2o1bjAwbHVJZ3VWMExOb3pKUmFWS2ZrZ3dFcVlnUFRTNkVBRGtzMXIyZjE4?=
 =?utf-8?B?UDVGb2hGS2dJalpJMXZoZDhpb28zQXZqQTRac2pBRVVkbkxXeW1kOUJ4bGFu?=
 =?utf-8?B?NEVIZC92Sk1XUXBKUzlDdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q21MT2xUc0RsRCtyRmZUMmdKaHhSdFNHS0RnVGw1UjJLbTVVRWV4N2dROUNq?=
 =?utf-8?B?MGdZeTNzeCtvOXo2cFphbEcxdjVjV29ueWdtUkdpSTM1NExtQnhCSFlvcFVX?=
 =?utf-8?B?Tit1bTNDUVRxMVBCMnRqaUtWdlJiWUJvQmtaMlQrb3ozQytXbmh5M2EyMXFC?=
 =?utf-8?B?RnBXQkVnblhOM2hQTS9iR0tzLy9JT3JlbkJZWUdWMVdPTUkzMkI2cGd2YmhX?=
 =?utf-8?B?Qm1xek5aQ1RHSlFZaTZrOUVuMUlLNjdqSE41MWNHcXpuWVVraEwzcStRYnZz?=
 =?utf-8?B?QjNkT3pPeFVvVHFQRW5UZnRmZktXMXFaWU9MUEFQSkRNSzlmMEFpMFEyUzVv?=
 =?utf-8?B?V0JNZkpjSktUblpKTjYzQkhERHBZaFVkQnJESlIzbFhoQ25WRzZ0WXhtbjRm?=
 =?utf-8?B?U3pFS2hhbnlKNnBCRGtYcHNGelhJbytBckRYTTBLbWl4QnZwL1FjdmI5d0tw?=
 =?utf-8?B?Qk5EUkZvZTVSRjhreitsWXJENkxVYm1JRUJuc1VNOWthM1M1UHMxMm9reFk3?=
 =?utf-8?B?ZFNFTVN1OFVDUTJqZHJ4eVdCRnhIa3U4RkFkUkZUMGZ0aE5CWUdtNmJkT3lv?=
 =?utf-8?B?cktYRlBXUGRwWUd2dGx0MnZGWmY1ZGVmb0x2T0Z3WnEvbDZtMTlRTW40eEl4?=
 =?utf-8?B?WXE4MGtJaDdDNVBWZXZFYlhUR2ozMXJKTkI3SjAvRVllbjQ0dndzZjh4NG8x?=
 =?utf-8?B?YUtkTjlzL0piTnJLa0VLYzk3azl4RTVuMXBpTUtETlV2NVJ6Qkt2NFdUT2ty?=
 =?utf-8?B?WmFwSGZNdVpqQ0x2cUVLNHhSWVVKVnJvd3dUc01mN3U5ZnVqeWc4V2s4Y1k0?=
 =?utf-8?B?SEIrYThNaWI5RjBYaWhoYmQ1dlZ2L1NXQzlrT25maVNWZjZTOEVzVGQ5Y1RK?=
 =?utf-8?B?U2NlaC9rejdSc25TV1ZIRmhjVzRNSHRCZVZNZWZ0WDdBQjcyT3B3YkJic2hZ?=
 =?utf-8?B?cVU0dG1pTFpTOE1tMTA3MFRiMzNTUEV2RkF2V0NBNSs2SjNRcC9vZk8xVnNh?=
 =?utf-8?B?VVUzWjd5S3RmSE1sYXhRaVd6eUs0ek5WemlBOW1RK25YL3lPd3dUZm1LUzNu?=
 =?utf-8?B?WmdobGVaeXU1VjhuUWVXNk5SZ3pCb2VFUS9EWWVtS1NhcHZGVEZNWWRQYitq?=
 =?utf-8?B?aXUvUjhXT1V1ZkJydzZodkNLcUxHeUxCaVlVaEFLTUVDTWc2UXhqZ3RpRHFQ?=
 =?utf-8?B?NVpQZG80YUtrRDF1bi82TFhtTHdtV08rVnlWbTFBdXBpdWc5a0h6aHhHZUR2?=
 =?utf-8?B?U083SEVnSndyVlJZMXBNaEFxK1dnblY1M2tEVVp6SWRKc3psT0lYTFlFa2Qw?=
 =?utf-8?B?aDJabGphUmtlQXRMTDByUkdMSUw4c085S2dKUHNBWE82TlJwcmhtb3g5R2Ux?=
 =?utf-8?B?Y2d2ako0L2pTbkZkcFFwaFhuMENUeUlabE1JdW0reDAydVl3R1ZEUDg5MmIr?=
 =?utf-8?B?TmFvWmpoOGYxVldVUlV2YUM1eG5VOUxTMXpXV29XcDg2VmxTTVlSOGMza0FK?=
 =?utf-8?B?SCt3ek01UWVDSGVkZkhIWExVaHJ6MGVHcEZvMTlLdit0M3RHc29aVDVReWs2?=
 =?utf-8?B?d2YwUTF4aVVLdjNCcElhMi9iT2VDR0wvTWZna0hvL29ZTU9hK29ETjF6NnNM?=
 =?utf-8?B?TU5pYi9vMHdPSWQzTGdlN21BT2FjRU1CUmhuNzNUcFROK2pZeU1QS0E1aElu?=
 =?utf-8?B?Sks0dzF5YUZCWUNVMnRlRWhYaVVLaE5abmxVY3NnWm5Ba3VkaVFNTHE0bTFR?=
 =?utf-8?B?dmRQTU95REVyYnIzeFFRTU0xb2dwbjJkVDdJODJZWHRWd05CNFpzOGJJSHdV?=
 =?utf-8?B?clRHbnZsSWgvM1EvYVI2RFZaZExKNG9KYzgybFloU0NXQlEwNTFlcjlJdThE?=
 =?utf-8?B?cE1DWlU1OEZJR0RvM1ZqMkw0em5kT0tCQ2QyN0Rhdk13Vm9aUW9obWR1Vkd0?=
 =?utf-8?B?RXlhQ0ZPSFh5c1EvdE1UOGhrSHJmVFdReHJOZFErQk5JRmJMS1hqZWh1YzN2?=
 =?utf-8?B?MXJHYStleUhjWGs5bzNPMzROTmNuc1cvbXBWRVRJMEhjVmZWZTcrYkYycmxB?=
 =?utf-8?B?SnRxK0VnWGhhWUFzWFBCUTgzVlVzYTZQUVBwL293UTU1WG9wanp6c1J5aS9S?=
 =?utf-8?Q?7w2xInIpenUnFkOMpAECy4TfR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ddb587ee-cd7d-460c-85a2-08dca4a71a9d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 08:21:19.5633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u0mwNDVMqz9IYscdncejDi6i3N8L9O9aYmILEkbXdYsshcYwfeRUqUarA5LPIaLKA/Yk/QyD2KV/WFUyTpkTBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8559
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


On 7/12/2024 6:10 PM, Francois Dugast wrote:
> Hi,
>
> On Mon, Feb 19, 2024 at 11:09:13AM +0100, Nirmoy Das wrote:
>> On 2/16/2024 8:52 PM, Matt Roper wrote:
>>> On Sat, Feb 03, 2024 at 07:05:34AM +0100, Nirmoy Das wrote:
>>>> Add capabilities to engine struct which can be used to
>>>> expose various capabilities of each engines.
>>>>
>>>> Add wmtp as engine capability which is retrieve from
>>>> GT info.
>>>>
>>>> Take a field from the reserved for that purpose.
>>>>
>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>> We'll need a userspace consumer for the uapi and some simple IGT tests
>>> (e.g., making sure this flag never shows up on the wrong engine types or
>>> platforms), but once those are available,
>> Thanks Matt, I wanted to get initial feedback.  I will now sync up with UMD
>> friends to create a pull request for this, and also work on  IGT tests.
>>
>>
>>>           Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>>>
>>>
>>> Matt
>>>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_query.c | 5 +++++
>>>>    include/uapi/drm/xe_drm.h     | 6 ++++--
>>>>    2 files changed, 9 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>>>> index 7e924faeeea0..10981b46c56f 100644
>>>> --- a/drivers/gpu/drm/xe/xe_query.c
>>>> +++ b/drivers/gpu/drm/xe/xe_query.c
>>>> @@ -215,6 +215,11 @@ static int query_engines(struct xe_device *xe,
>>>>    			engines->engines[i].instance.pad = 0;
>>>>    			memset(engines->engines[i].reserved, 0,
>>>>    			       sizeof(engines->engines[i].reserved));
>>>> +			if (gt->info.has_wmtp &&
>>>> +			    (hwe->class == XE_ENGINE_CLASS_COMPUTE ||
>>>> +			     hwe->class == XE_ENGINE_CLASS_RENDER))
>>>> +				engines->engines[i].capabilities |=
>>>> +					DRM_XE_ENGINE_CAPABILITY_WMTP;
>>>>    			i++;
>>>>    		}
>>>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>>> index 50bbea0992d9..5dac079e64de 100644
>>>> --- a/include/uapi/drm/xe_drm.h
>>>> +++ b/include/uapi/drm/xe_drm.h
>>>> @@ -247,9 +247,11 @@ struct drm_xe_engine_class_instance {
>>>>    struct drm_xe_engine {
>>>>    	/** @instance: The @drm_xe_engine_class_instance */
>>>>    	struct drm_xe_engine_class_instance instance;
>>>> -
>>>> +#define DRM_XE_ENGINE_CAPABILITY_WMTP		BIT(0)
> Where does user space get the BIT() macro definition from? We should
> probably use an explicit value for this constant, as it is done in
> the rest of this header.

I was unaware of it. I will remove the BIT macro.


Thanks,

Nirmoy

>
>>>> +	/** @capabilities: Capabilities of this engine. */
>>>> +	__u64 capabilities;
>>>>    	/** @reserved: Reserved */
>>>> -	__u64 reserved[3];
>>>> +	__u64 reserved[2];
>>>>    };
>>>>    /**
>>>> -- 
>>>> 2.42.0
>>>>
