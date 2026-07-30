Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6EEC55160
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 13:27:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5488B10E674;
	Thu, 30 Jul 2026 13:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BZey1g4k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664F710E674
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 13:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785418019; x=1816954019;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=9e36Da5+KXLNzErBv0YDw1MwpYmrp6g4I1I+/bDc/0k=;
 b=BZey1g4kpWl9cPDuVJX8BdjUmyZLu1sME9ss4twgajRwtkYe8znQ6ra1
 Jc0qmtBZh3Ftn/Wqjhn8nE3raB9ws45/Wa2jJUXcCI2jF3JEzkm+WW4Oh
 5mE95Sj8237xxzu4MzJwd2+MXfjFJwtZQ4LwRxaRhBR/F5JPYjNvEZiFo
 1NTYtI6KBEdQySEBQAOxZjVKOnFfUvbg+CvVGcIUD2i9ZtR3XEZyN14jP
 pkWFA8yJFsebqXBrcVUqYXlpDAIZQzlrjltKH1d8ibGGPkobUgasmj6Vx
 FHuB6XkyPmD0doC95iqiGmu4gITAmC9n+r5s3eS+6VHkUAu70cqOefgUK A==;
X-CSE-ConnectionGUID: ztu2/U/cRAmLj7Rp5Yd/Dg==
X-CSE-MsgGUID: uzvCo3jaQS6GWMoXr05UaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103573660"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
 d="scan'208,217";a="103573660"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 06:26:58 -0700
X-CSE-ConnectionGUID: 7s1laP/6Tw2jZ7TwCN50Jw==
X-CSE-MsgGUID: kzl3TaBwQYqXZEcrC2ZMQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
 d="scan'208,217";a="260363446"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 06:26:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 06:26:58 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 30 Jul 2026 06:26:58 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.34)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 06:26:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PxV0rtWOMmc9eKz6LQLYs9mipHCTtHfRZa/yrCWdO3JiFumsDf5pbIak/JvseUL5IJn6y4Db8swxRxEBaNLIM64aBxkVHeroka72yBWhOcnGXEktw/C/dJYVWosSxibejxoycYIlSlOKtDIZBEtSoJrjfK27FgMHdGyQHrZCrrsXfvTE+vXs7WOdD3fWRlpvdiz+88JchXzIze7EJOlqSiuAizpMHI+RFUB7UUfi3j87B6zolR/9xvTeyb9gIpRfUGi6qwMrXG7b290JlZwa5H/NoGfBIzkuFIvPrHeTrYiuRkKUGasXbYxfPZ3Oy++ujiMGwn/J/qZrUrRUBZmpLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GafoujLDLqiZ5o8zz/ixADl6sLzzMzWBDuDLKrA0FzA=;
 b=kMf2TWjqJmOTP+HGtt9qw19nY0EDVxuTDK1svbLCP424IOxGpuGVUVMn3coiz6Q/jqJKXNJb4Tr0VJdwlPQsRbOe/ubGnApbXYAZY+l5JwhxKv4FQIPDLKtK6JVy6pTOdakh8x/Iilxq+msfu505rWlO9YupsWvjvLxF3uQxdnqWaEo6kgsxgMHPeY/m8E6uXIZemQcL00F1hfOm/kMnskrl9EMJVA5ttCPxOupRMvpvwosUGTv1sXxxc8LDbRDi28+3qTHaJphfi4/1OelZJ61ufnymm9ENDmtv0YXLUmYFubaY3n5R6JEoTy33zrPFhiiAtph9G0p9Z2EHb+9kLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by BL1PR11MB5319.namprd11.prod.outlook.com (2603:10b6:208:31b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 13:26:50 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0270.009; Thu, 30 Jul 2026
 13:26:50 +0000
Content-Type: multipart/alternative;
 boundary="------------bwHHFQ3VKaWYaoFO9BWxnHz5"
Message-ID: <251045b9-5dfc-4450-9a90-b763388d7f0e@intel.com>
Date: Thu, 30 Jul 2026 18:56:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/ras: Fix boot-time ras error processing
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <riana.tauro@intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>
References: <20260730110635.925537-1-raag.jadav@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260730110635.925537-1-raag.jadav@intel.com>
X-ClientProxiedBy: MA5P287CA0358.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::17) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|BL1PR11MB5319:EE_
X-MS-Office365-Filtering-Correlation-Id: f1155b0f-6f56-403c-6dff-08deee3e3649
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|11063799006|56012099006|8096899003|10067099003;
X-Microsoft-Antispam-Message-Info: WlkKqn84jG7eVupvWetVWu6qVIAqwen59HDTmB9B7ZB1lnyxVbtbzYEPu6ckFzmBXhg5TuKVgx5F0yTwZE4UO7qjQqSC51kuU1x0ZXLZ1689X6wYYZoG7OAFpPNIfGP+9bAO8B/iXIhDUr20nJhw3x1bCgSA5MY0ig5P2O0ewciuXMtHIsb3pkWzukGZP0TbJdGXkoIASbL5HX6KMv5iZUN4Tt1hK9dyCiyhqZUJrgloriJCIlvER9oI93S4Vqox1JPPMn5xOOKjFnaxZKOKNHD3CfhpiDV4q+gmB7YdS8YlQRzqk9RyroTrAu2khpmt51S2+XTFZi1fQOGf3niT7J5kZNGGnWD2OpEBBgMyIbNMNOMIh8/Vm/+JhMDPPsN+u0nsPmMn7hdXmvY/tZr0nSe4WXnFdE7XLWJxw2qI+ARiv+Bu/t9Jq1ZywF+OsvkAwx0OMvNUR1Sw9SgKYJsSoSQIBWRUKAh73bnAv/EbH3fV/XgzsMXyyGu+ZiYxqY32kINjBmEgc5UO5EksrpeJq7CM9fKVhcLtzFbbB1kqPtlSN6ojxI9rXtx09m0Yk/8WxeFlJ00aL8pyGtVjM/M20RDby//DfzpwMT7+VHK+tmHSVnrSopBNO7F0LnksHZBJTSwEVryRC9cRzyyjY1DbNlhvYqXH6BCVmnLMAjCHUeA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(8096899003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3JpZ1NycGxSY2N4RmFSTHZ6TzhmWFpPYXZWMTBTd0Y3ems3dTJpWGJlQ0Rj?=
 =?utf-8?B?Q3NxN1p2VzZiWjcrbVdZd3dnbW9ycE5aaW9JOC9vcFNzcHNKbk1FUjUzem5v?=
 =?utf-8?B?aVVYYUNUcHVKZ2FFcnhSRzBBclIwTlMrY0JZVVcvOHhId2ozLzE0NlVRM1VE?=
 =?utf-8?B?Z1cxTHBKM1JubnlITW5Yc2pZd1QvVUoyaTVUM2NSZGhFMldab0x3QkQ5ZjFz?=
 =?utf-8?B?ajM2TC8rN1NTSFRySDZKem1jUEUzQjBzUHpIejhRRHVMbGhRZ1JheEtmelNX?=
 =?utf-8?B?OUxKZzU0d0VRTHQ5SnV3aWhsL0NMVEZmeHJkVU5CN2h0cnp3WGMxY0d3MGp0?=
 =?utf-8?B?MG53R3B1N1pQMnVJTjVob3hTdWxlUzYvV3pvUTJVaGRYdGJMZlovWjExSVNV?=
 =?utf-8?B?ZUV2QXo5eUZnVEFiNC9rVm9NTTZDY04rOUpkMFFYWmYrbXBEaWJhNkgrdWZh?=
 =?utf-8?B?QjArQm53Y21KdnJYZXNPY09UUEtkMUp4SnNReVRudk42NFQxemhjWlIyN1V6?=
 =?utf-8?B?OWVpU1ZBdzIzQlNINlJ3ZDJGbks2WDFCU1JreVJWaXAyd3RwWWxlWUJJVkl1?=
 =?utf-8?B?TllOZEtrTm1HbExOTnVjYXg3ZVgrR1FyTFdMd2tlVTFFb3dsQTFiOTg2YlZr?=
 =?utf-8?B?TjAxaGtSbURYT3h5Nnh4R0ZyWm4xblNZTzlKeHRRN0VFWXlhRS9KOWRXR0Ru?=
 =?utf-8?B?MUxBU1ByQmcwMUE0ZGM5SDcrdlZ0WHpLVG15Z1RwQzhRK1ZTSU85RytIamls?=
 =?utf-8?B?NnZ2UUlXemhteEFOYTFOb3ZWOC9iNjkreVdkdmJqbk41azBOeTAzRmIrZHdF?=
 =?utf-8?B?d2pkMkg0NkJQNGxXZ055MWZRMVVJdjJSQTZIbGlwdTl0VG1JeHpKUDZySUJL?=
 =?utf-8?B?TkhRVlhscjFGNEdzam9JZDVwVFl3THlkQlZla2ZHY0VJY0cxUHU4YjNab3ZK?=
 =?utf-8?B?MXJLNVNBWnprZnpkOFhuVGRuemN3Q202NllHbWEza0FXaExmeWFJS2U2emxa?=
 =?utf-8?B?SGtoUXdWOVp4SHNwREZCRWs4MytEUWRiQXphT1NJWmxiSkZFemplODBnK0NZ?=
 =?utf-8?B?czFjSjFZTGM2MCtKWHdETzV4dkJCZ0xFMWhGM2NXRmtSV2kxZWJiTHQ0bytP?=
 =?utf-8?B?RVE0UGgwNW9pRElSSG9PdGRuN1VSbDl4ZzA4L0JTOERCK1p3WnVreHhIN3pM?=
 =?utf-8?B?RmJPZFJ1ek1ORFVjWEdNU3U0L21Yb283VDg3S3VEUmZjdmhjL21EZ0h1ZmQ1?=
 =?utf-8?B?c0owME16dGV6bElRb2lXWXJHR2VMeVBWTUZmYThqSVJINWtlSUZiT1h0WURD?=
 =?utf-8?B?QXZEajdBV2VvVDBrSDFES0FjWldNRnVYZjNpTHhPblE0Q0hxSjNQc1FSWENh?=
 =?utf-8?B?clNVNmovTU50K0Fpa3lJNW9rUXFiWlI4VTA1b3VrZ1lyRFJnWUpUUHdGeUFN?=
 =?utf-8?B?eVA2ek1Gbk40ZDhvckNHaTVWYldlQ2ZUdE1iTGRmYjRkL0dYNkJ6TDY5ZCt2?=
 =?utf-8?B?dEkxeCtHL25XU2tqb0tmQjhCRnZnQ3I5a05INjdDd1lPa3FvZVBuNWFkaUJC?=
 =?utf-8?B?aTc3Y2orK2FFM1h4MHRWUHBHUFA0UFdpK3F3ckM5NkdGaEJTM1VuWDltU2Y0?=
 =?utf-8?B?OG5sbzQ0M0VjYmVsYytnU2ZhQ1A2WGFpL1NsQVdwVTRmdTRWanNoem85THN4?=
 =?utf-8?B?aWhSK28yUEJLZUFPNmNJQm1VWWZrVFdkWEdKTHdqaXV3eW9IZlJVQkF4VytM?=
 =?utf-8?B?dkZlTzBXcXRVYlVTalV1VExMdVpQVGJQbHBvQUdGL2RhQUVoOEtLWkFGL081?=
 =?utf-8?B?c1ozUkxnOXpmWks5MEtOMEE1T3Azd2dRdm5YZWZmZ3RTSG0zOUxTTkNCYXhO?=
 =?utf-8?B?clRVaE5wQ1EvajBJTkdNVFV3Y0ZYdHNnY2hGc0FQU3BWSUtST0FyNDRINGNh?=
 =?utf-8?B?R2FKd1lUa09aRmZESFp4c2t6N2dINzRQaXRua0JWWVV4RDdQendhS0lBcStL?=
 =?utf-8?B?ZzN4SWxGam1MeDFsYnA1MDZXa3U2ZGozcWs1OXNUbUVIOVNidE0veHgvS0Fl?=
 =?utf-8?B?eXByOERySG1LZWxwQ0RJRng3WUhhV3VQdk91a1lHZ1pTU01ab2xibFVMMk9k?=
 =?utf-8?B?UzZRYWlFbjRJamVaazk5cGp6OGpGVzlLVGhFSEVvVG9BbmN4dUFQVWx4SWJ5?=
 =?utf-8?B?N0g4aEM5enFHZ016UnFhZXU2VEh6RHVVbUlNV3E5dkVLUDJ4VU1XUnpoTlhj?=
 =?utf-8?B?VmJWUDdMVEtxVGVsUjBrdm5kakRrMnJBV1IyK0dTb3RUcEZFZis0VWtOaHdW?=
 =?utf-8?B?TGlrYWJPcDFGdlFMdmdlMDhGYXREelp2cG51MnJSeE1wZFp1QmVnNi9WL2Js?=
 =?utf-8?Q?j0QqBsdLHaz7/KpA=3D?=
X-Exchange-RoutingPolicyChecked: FEj90e+huS5/FZg5mJSzaDu3MOz3UD1TNIP+LJW52hn1RPBqyqRWpLaqtxv8PUecT5Ml35Z/aC2/l16JBb920hOqtAepAJS22AFcq/opniCl2lQG5IKzZDpP6e/0gsXmjGk0l8BeTV26CSOjPbEoeBis0sC76LOV6f/+NUJ2shF/ncWFRbf+wAZvaZ3ExyFjNIhydaprkLTCh/yt+Xp1veSXqi+r05pHCPXECuyouCU/omHDmqJbm23dBI0GM7Nc+T5iV3bAdoCrVEHzV9W399OQjAwE8BMDuDXWF9mP0TAPXPHsm6TRXtSEwbyjGRGtZh7DP9SysEpe54m92l4jHw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f1155b0f-6f56-403c-6dff-08deee3e3649
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 13:26:50.2896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cu8MOJma+EpUi1mixH+wY8fV7U1j9J5WhzfgTqnXJeoOwRVuBvnwIknMky5jO6qdHw7WFv5/c39lbFaxSt29Z6BQmXhke9Y0OjZAFtfOnkQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5319
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

--------------bwHHFQ3VKaWYaoFO9BWxnHz5
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 30-07-2026 04:36 pm, Raag Jadav wrote:
> Currently, we xe_ras_process_errors() inside xe_ras_init() to handle boot
Please add we "call" xe_ras_process_errors().
> time errors. But this can potentially result in declaring the device as
> wedged quite early in the driver load sequence, which is problematic due to
> the lack of registered drm device or required wedged cleanup hooks at this
> point.
>
> Call xe_ras_process_errors() only after the prerequisites are available.
>
> Fixes: d9732e498f5f ("drm/xe/xe_ras: Query errors from system controller on probe")
> Signed-off-by: Raag Jadav<raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c | 6 ++++++
>   drivers/gpu/drm/xe/xe_ras.c    | 6 ------
>   2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 03e6177a1d4c..47e1638d2ab3 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1149,6 +1149,12 @@ int xe_device_probe(struct xe_device *xe)
>   	if (err)
>   		goto err_unregister_display;
>   
> +	/*
> +	 * Process and log any errors detected by hardware. Possible results can
> +	 * include declaring the device as wedged, which must be done only after
> +	 * xe_device_wedged_fini() is registered.
> +	 */
> +	xe_ras_process_errors(xe);

What happens when 
xe_device_declared_wedged()-->xe_pm_runtime_get_noresume called before 
xe_pm_init()? Is it good to call xe_ras_process_errors

function after xe_pm_init()? any thoughts.

Thanks,

-/Mallesh

>   	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>   
>   err_unregister_display:
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 28123f08e513..db8bd19ad28b 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -827,12 +827,6 @@ void xe_ras_init(struct xe_device *xe)
>   	if (IS_ENABLED(CONFIG_PCIEAER))
>   		ras_usp_aer_init(xe);
>   
> -	/*
> -	 * During probe, process and log any errors detected by firmware while the driver was not
> -	 * loaded. Critical errors such as Punit and CSC are reported through Pcode init failure,
> -	 * causing the driver to enter survivability mode.
> -	 */
> -	xe_ras_process_errors(xe);
>   	ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
>   	if (ret)
>   		xe_err(xe, "Failed to create GPU health sysfs, err=%d\n", ret);
--------------bwHHFQ3VKaWYaoFO9BWxnHz5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 30-07-2026 04:36 pm, Raag Jadav
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260730110635.925537-1-raag.jadav@intel.com">
      <pre wrap="" class="moz-quote-pre">Currently, we xe_ras_process_errors() inside xe_ras_init() to handle boot</pre>
    </blockquote>
    Please add we &quot;call&quot;&nbsp;<span style="white-space: pre-wrap">xe_ras_process_errors().</span>
    <blockquote type="cite" cite="mid:20260730110635.925537-1-raag.jadav@intel.com">
      <pre wrap="" class="moz-quote-pre">
time errors. But this can potentially result in declaring the device as
wedged quite early in the driver load sequence, which is problematic due to
the lack of registered drm device or required wedged cleanup hooks at this
point.

Call xe_ras_process_errors() only after the prerequisites are available.

Fixes: d9732e498f5f (&quot;drm/xe/xe_ras: Query errors from system controller on probe&quot;)
Signed-off-by: Raag Jadav <a class="moz-txt-link-rfc2396E" href="mailto:raag.jadav@intel.com">&lt;raag.jadav@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_device.c | 6 ++++++
 drivers/gpu/drm/xe/xe_ras.c    | 6 ------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 03e6177a1d4c..47e1638d2ab3 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1149,6 +1149,12 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
+	/*
+	 * Process and log any errors detected by hardware. Possible results can
+	 * include declaring the device as wedged, which must be done only after
+	 * xe_device_wedged_fini() is registered.
+	 */
+	xe_ras_process_errors(xe);</pre>
    </blockquote>
    <p>What happens when
      xe_device_declared_wedged()--&gt;xe_pm_runtime_get_noresume called
      before xe_pm_init()? Is it good to call&nbsp;<span style="white-space: pre-wrap">xe_ras_process_errors</span></p>
    <p>function after xe_pm_init()? any thoughts.</p>
    <p>Thanks,</p>
    <p>-/Mallesh</p>
    <blockquote type="cite" cite="mid:20260730110635.925537-1-raag.jadav@intel.com">
      <pre wrap="" class="moz-quote-pre">
 	return devm_add_action_or_reset(xe-&gt;drm.dev, xe_device_sanitize, xe);
 
 err_unregister_display:
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 28123f08e513..db8bd19ad28b 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -827,12 +827,6 @@ void xe_ras_init(struct xe_device *xe)
 	if (IS_ENABLED(CONFIG_PCIEAER))
 		ras_usp_aer_init(xe);
 
-	/*
-	 * During probe, process and log any errors detected by firmware while the driver was not
-	 * loaded. Critical errors such as Punit and CSC are reported through Pcode init failure,
-	 * causing the driver to enter survivability mode.
-	 */
-	xe_ras_process_errors(xe);
 	ret = devm_device_add_group(xe-&gt;drm.dev, &amp;gpu_health_group);
 	if (ret)
 		xe_err(xe, &quot;Failed to create GPU health sysfs, err=%d\n&quot;, ret);
</pre>
    </blockquote>
  </body>
</html>

--------------bwHHFQ3VKaWYaoFO9BWxnHz5--
