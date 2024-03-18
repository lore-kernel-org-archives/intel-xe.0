Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA79C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 18:42:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1876910F67C;
	Mon, 18 Mar 2024 18:42:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kfr+XmlX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17FC710FD90
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 18:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710787355; x=1742323355;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=jLyk4FGz9kuJXUvaMca/rsefMPgjzS6JnKTiS8ITaj8=;
 b=kfr+XmlXOYXkP/vg/3DzIOC1geVhxbb1Lp04hCk04hzo9/dNagWqkXPp
 ozkYkQzb4i8hz75sf+B/XqFiqq6gekH8MFOmXynHZZPWHazp/tSg74z5y
 uKqO5j1KKsAwvqvQbiH/O+otI/hQC2ygPJwfRkn1i7hCbBtZLQFsc+9Ec
 Jn2FjNxDZO493vWARpIrf/SziTdJZlmlEJhTqRjN8h21r5/fz4YbCuAxO
 4or0wdlUMlh9TDgz2LGSB+8JddQjV8qyU/m5A/fyueybRpnVOZ9GXe9tR
 hDuftBwQDqlcJmUean5iZOGnbuFzNydKN03rlzSUVLY62QvQvx7jthvU2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="23132709"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208,217";a="23132709"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 11:42:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208,217";a="13531871"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 11:42:34 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 11:42:33 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 11:42:33 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 11:42:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ejwKEMlu4XnIt1Lv6VYwAZ7PkREsM6iM8BJen3YP3o/8gLMGgRQZuGG6FKhGBV+ePghe5GzA2H7CX93Vm0LxQia00LLI2sKLa4BeccfRKz2KjKBo7grJYKxB1BLgV70tBdhyMzmUPd6aPYGfnx1P3xQi7QG2VRUF11mSI8MyM2OsddtqJ18GXAIEcZEuqIElVCJBQXrNkOx/hgXOseDhatvROMdyANqerB+LBpjQ2hhM2h5mQuJoVZWHcie1pyCnMCdAh0vgq5BIzeAliqWud6Ezje2v/sP4WIdbMqdan72zjz/zGpqjcGEuvbAgWTuzhEH81qHxU5vqO1QaH1cc1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJ/UUJbZVrCXj67VHJ1SxEgZaZd2TUl0gYTvV+/UeEA=;
 b=hy9kDoLR6G1zx19O83FkP4vArXTkcw+YT0u1TG4xbah7PR6K8kz1YDsSPux3xU7FwhLAgONUOgPSfwYqCULK548CJtdwvUPvFNo9T81lUn+fDE4Tk5LAldEVvx1Uw8OvjwfLL2dOyTYyeVoB1HxHCeImQBcpx1iRGiB3dFb9cFCU/mdnO1tVO7P0h5JP1QGHokA16IFTQ4MElJOxuvcf5S1jXu3fktCT7BpdqYyGT3/Q0hhpuRsaF+wZNEc2LWYL+Rcow/VRkYJgVnJkZe6RSSdlixR6q9BXTdViT8NNLJwOk+z/pWLl2AFQC0wmd2098jw1PMiWiv6fFHA4wsoIgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 MW3PR11MB4522.namprd11.prod.outlook.com (2603:10b6:303:2d::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.12; Mon, 18 Mar 2024 18:42:31 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e%7]) with mapi id 15.20.7386.015; Mon, 18 Mar 2024
 18:42:31 +0000
Content-Type: multipart/alternative;
 boundary="------------9IQhONLrPDAcrH0hBQ9P6Leg"
Message-ID: <1f111bef-8f84-4ccb-a97b-a2645ad95e07@intel.com>
Date: Mon, 18 Mar 2024 19:42:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/queue: fix engine_class bounds check
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240318180532.57522-4-matthew.auld@intel.com>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20240318180532.57522-4-matthew.auld@intel.com>
X-ClientProxiedBy: MI0P293CA0013.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::18) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|MW3PR11MB4522:EE_
X-MS-Office365-Filtering-Correlation-Id: ed9a6629-4e26-4beb-7cfc-08dc477b2b63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ug13BUKhWJzR7GwVS15yq932zT5r16PzDd51lcGksophcORwnmwwoaClcWsM5dCQq1MtCO4s3dyXV5tW3BPVpNvI4Obe9RWdQUCJr0cCcmaCF55vaXrFkvW5D2j8dygFax0mtY1cg00TTPamDuR1KNLrniyWJZWTnSZ+0r1fmyj8fk/tQvKVqTlcdBU7Dw35v5QNMuDmtXSipWI+vYwOWyPtZ01IO6L1kPUasC08MMl42U1YtIShO8N9l+83fN0i4lgBTiXnic/8nUlspv0QOer7HCKlEkb3+EMZ/0axju0sY1UPFwGsNzIl1dZ6JlBUTgeDy5SonM9Urf5XYyIzKpXjgCsb9ik/zgzMmQX5FFjnR4kOdelKzdBT0JlnlSLVm5ATlRIjfoDdWt+2TVMBokt/FkdJ8FEwVv2KuzvITqvZ1rDbfD+3wZ30cMCduChteBgu0VEb/bH17o/3ZTWW+IWe4eSsalZSEkh4YrDwh9ba+UMsS6HX43QdYd2hj7vdKvwlCte7R4qTbDmgcX0QzYLmyd56nyQVClrpTu08LH6Cw7dHiR/2NeS5l29uQvbnllwgEjC/fkNm0qAqg8NQ5p3gZoJTrrwhm9G+ZlodP+MxS269DQZFpuLBAfeYzqAfxFwBaKvEn/vYckYhYWAXaE6muKIx8Ezj3NQvyiiezhw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SExCNnd0U3hXVWlBaVZHSTFudUVKNXRSK3lIOE4zWE5KSFFqRGppZlFuc3ov?=
 =?utf-8?B?NDRLcllzNEJJQlE3ZVUxbUREVUZXUjg2QUxxZzVWOThtd2RXOGNZTTdHR1hj?=
 =?utf-8?B?V1RiczBuZ0llUTFUNDJjL1YyUmRWUERNb0V0c0V2UEltTUtxaldXenoxbVVw?=
 =?utf-8?B?ZU1EVW1hUzdkWU42Z0ZRS3luaCs0UkVGbkpyZDA4T0I1QXBPTGxuYzFNM1BS?=
 =?utf-8?B?LzVhSjFQejBvRXB5ZEFGWG5uK1F5MEtNZlpNU0dqcEdLR1BXSFFrTnpPRTBM?=
 =?utf-8?B?RUVyM3I0MlJLS1V3RFp4WmpWUFYxNW91MlNuUSsxNkZNclNWZ0IwU2lpWGVT?=
 =?utf-8?B?U3FrUWpoSGNXRGQwWGtHYm5DZlNaQ2kvZ1ZGZG8zbUdxSW90KzI2WEs0VmM3?=
 =?utf-8?B?WjQ0ZE1VT1ZHeUlYSDU3R0ZzWW1HdUV5WkFKdGh0MzZ3TnpBWnJkbC9yY2ZZ?=
 =?utf-8?B?RUtVUXZuRHZRK1lhcnNnaFdkbVM5ZmFFS3ovZFpqT1lqYTBCanc1UHhFS05p?=
 =?utf-8?B?aVE0d05salJZRWM0QU16ek5FcFpOcGxudmhjbmh5bXovUElzVk1nRkxWMXZl?=
 =?utf-8?B?d1kyekgxR0hZanN2aFUyZS9EbXJmQ3oxbm11WWp2bE5hY0xPWjBZZ1gxNGxY?=
 =?utf-8?B?VzF1VU1vU3R6YVVwNzlYZlhvSWZCNmRZWk1kTFh2YnNHZkphRnRyZGVDRHYy?=
 =?utf-8?B?Tm9MMzBkZGplckpIYkNaNEFvOThjaU90RFJEalEyWjBDSjFxKzY0dVRZbk81?=
 =?utf-8?B?NWlHL0NaMlZTd043V0x4T2YyUDdYTXJOUk9XbGFvMFVsUFp0Y0RHZ0QydmQw?=
 =?utf-8?B?NVZZWHQybnJvT2VtaG1QelcvcXd2c3RFZVVUZU93U3lQVkkvc1ljdXc1TmlI?=
 =?utf-8?B?VWZYcmVwa3hkWXVYdEJnTk0xNnVSUnV1NHNGdWlUbkFPZnd4N2MzZUtWVHRF?=
 =?utf-8?B?STA5SkgraXA1eDNRcE1DcG5VSDZNSmhIRld2TmZYSEpJOFJMUk9WQStCU2FW?=
 =?utf-8?B?QThHWldPcXJwT0s3Ukp1eDI3dnp5LzUvMWdCLzlaWTRwYjVmSjc0UzUzTmhp?=
 =?utf-8?B?eXdmK0NZeHdCUmlxalZ1Zll6ZUhhVGFTKzhkQk9HMzZqQkpzd3l3STJkVDRy?=
 =?utf-8?B?M2N3MVZObjJLRktzcG5FTXYzUFJGRW1NZkI5VjFiMDRKWGNQR3h5Z0U1RWE5?=
 =?utf-8?B?NSsvRU43WmVVaDU1eUVtdHpCU1QxU1FCVC9IdmJjeFFlK0FOTUxLbGQvOGhk?=
 =?utf-8?B?MGVwT2hvclZOZkxUVXl4Q3ROc1RPM1VseUNlS2xIbm1SNklOeHp2VTdNZTBR?=
 =?utf-8?B?enhoTXJRZFFpeUhWL29PYnFvenpaOUZyRHhqK3JYbWRuUmxTNmJlUVE3L2h6?=
 =?utf-8?B?cDRpNVZZUXk1dS9yYVdOUENqaFdrL0FmL2RVa3k3Q1lpbHAxQWEyYklrKzFE?=
 =?utf-8?B?ampjUGN3VmJtWWl5TFZuR3NtanU2Ums1OWhZWEZLcXRBM2hKclNCcGplMkdy?=
 =?utf-8?B?NmxSbzRLU2NYSVJCZGl0eUJleXFCQnA1N05VQTlqSjRicUF1aytaZkRiWTBU?=
 =?utf-8?B?ckp4eXRKZU5uaTB6ck1wQW9TcjRMN0FlMmpqSUNPVUpyRFY5d28raS9PQXZw?=
 =?utf-8?B?U2NLRGQ1UFprZ2xVQzNCcCtndVk0clJwSkNNZm9yRlc5bUJkeDlGSExWMmVF?=
 =?utf-8?B?ZVJ6dkhnZDhRcENuVURoaVgzSW5udGg1eVlkQ3V2UlFFWHBhbVp3OEdqOFpB?=
 =?utf-8?B?M01GVlhselFkanpIRVNNdDBxMk9YMnBTSE5PcVBtTTgrOUlKWFRPd1htQUhW?=
 =?utf-8?B?NDdwSzNwbktvaFhkRHZ2NGM2KzhNSHlIdFFoSEVDTnE3ZmxIQ0lhOTRYRlBG?=
 =?utf-8?B?QzJiaCtaR0xVc1FFaXhzTmpPLyt3WmNtdytMSUxOVWpObzV6NWVlUitnV3BP?=
 =?utf-8?B?QmtQWnBtWVpMV1F1dndUREgxakQyZE1Md29jYldibHNFRHcyRENYZERaMUxr?=
 =?utf-8?B?Vy9HNHVXUG1yTHh5UE9hVHgxd0lXRTlYUlRDV1hjbU5INmhvd2JoanE0SFR0?=
 =?utf-8?B?dXgySHo3UTJpQXJMQndyUHZvT3hpTXIwMXFwc2phd0FOWDNBb25DZ2Y3MXNS?=
 =?utf-8?Q?bNgxNIHKI1lAB+Tu2YFAyvz5j?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed9a6629-4e26-4beb-7cfc-08dc477b2b63
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 18:42:31.6528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: irs3I1+XWxRu1GwYJC6OiTRZaup8h9DtHRXNY9qnNuA1XoLkR6fMv0/FA6A7RjNVl+nH2voGrsAjI+SGm7Endg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4522
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

--------------9IQhONLrPDAcrH0hBQ9P6Leg
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 3/18/2024 7:05 PM, Matthew Auld wrote:
> The engine_class is the index into the user_to_xe_engine_class,
> therefore it needs to be less than.
>
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Matthew Auld<matthew.auld@intel.com>
> Cc: Nirmoy Das<nirmoy.das@intel.com>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_exec_queue.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 6a83bc57826a..2016c1af9633 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -440,7 +440,7 @@ find_hw_engine(struct xe_device *xe,
>   {
>   	u32 idx;
>   
> -	if (eci.engine_class > ARRAY_SIZE(user_to_xe_engine_class))
> +	if (eci.engine_class >= ARRAY_SIZE(user_to_xe_engine_class))
>   		return NULL;
>   
>   	if (eci.gt_id >= xe->info.gt_count)
--------------9IQhONLrPDAcrH0hBQ9P6Leg
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/18/2024 7:05 PM, Matthew Auld
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240318180532.57522-4-matthew.auld@intel.com">
      <pre class="moz-quote-pre" wrap="">The engine_class is the index into the user_to_xe_engine_class,
therefore it needs to be less than.

Fixes: dd08ebf6c352 (&quot;drm/xe: Introduce a new DRM driver for Intel GPUs&quot;)
Signed-off-by: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Cc: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a></pre>
    </blockquote>
    <br>
    <pre class="moz-quote-pre" wrap=""><span style="padding: 0px; tab-size: 8;" class="hljs diff colorediffs language-diff">Reviewed-by: Nirmoy Das </span><a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a><span style="padding: 0px; tab-size: 8;" class="hljs diff colorediffs language-diff"></span></pre>
    <blockquote type="cite" cite="mid:20240318180532.57522-4-matthew.auld@intel.com">
      <pre class="moz-quote-pre" wrap="">
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 6a83bc57826a..2016c1af9633 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -440,7 +440,7 @@ find_hw_engine(struct xe_device *xe,
 {
 	u32 idx;
 
-	if (eci.engine_class &gt; ARRAY_SIZE(user_to_xe_engine_class))
+	if (eci.engine_class &gt;= ARRAY_SIZE(user_to_xe_engine_class))
 		return NULL;
 
 	if (eci.gt_id &gt;= xe-&gt;info.gt_count)
</pre>
    </blockquote>
  </body>
</html>

--------------9IQhONLrPDAcrH0hBQ9P6Leg--
