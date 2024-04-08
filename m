Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC5CCD1292
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 19:10:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE9D10E2F8;
	Mon,  8 Apr 2024 19:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b6iODv/g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F0211290E
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 19:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712603412; x=1744139412;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=i46zhRSNx2TNjWyq+3oazzS5FuKuA2vkzKziqvvHS78=;
 b=b6iODv/gzkRkjVhxxaZdGb4C7tgPi4hpzxQCUSIp9PORcJYGVPnHWDmh
 fpOxtxYU+1rpFaPoGymCymL9eLbX+rfpRZDRWbkC4dWasyvEd7b0NsC11
 X3cp1QYshjDH6KUZUpDqvryImmovBqyK9Hty7r7+TmlGr1c/zKrQ7uKnT
 F6fP8tmw9rXbJJGCjwrHtcJfl9EvM0j4GdiSrc5MZJuX0rlwRLVBB53aE
 cG3hYwueU2EQmuksP13K2E3yJQmEekBXO9ltYP1TBBLdwCi2ykjrU8hr5
 OMO1eDAQugyb/0Y2H2qeWcJMuz9/BvWkXIXBqDA8DOLiO9t9FGiS4JOe0 Q==;
X-CSE-ConnectionGUID: WtwOBg2OTES8aTKWKaiPmA==
X-CSE-MsgGUID: GqIuDkxPSLm67183LUQKog==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="11737214"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208,217";a="11737214"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 12:10:08 -0700
X-CSE-ConnectionGUID: 15JKZgMcSAeFJejYSSvZMw==
X-CSE-MsgGUID: MUqkJwJ2Q6+96yviB29DLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208,217";a="50977002"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Apr 2024 12:10:08 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Apr 2024 12:10:07 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Apr 2024 12:10:07 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Apr 2024 12:10:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJACVrLI1CELAJEQUydzB054ckXJZUFi1WonJ+3AgeAwHNcFrkzJ6xEpCjIpGQPq6/S31HkfzuWECi80UiHUPSFSXSEWMLkIZMy+QVu+rlZgt/HQamKdDqxqBEfU+3jQ0CzzdwePQyUKoKzWCchHsDaB0Qh0OwMWWZQpH5N6/Dap4He7yv/YlsSB3b5hFPE9RmxO2NiXpesRp1x2wVjU/KD3Fv6Hfj26OiL0U1qokBsj1NTMugQ3YkTRYAwuNRim9pT14hBwf2N3zXIXv1NQaC6TWXMFn6Wf5n3rdzK9pfNMlecTYllBKip+5k9YqX1Mx5xFcjTInNfgEf2wGol8gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LtmWmn+OhuKw8nsV5Uv7hnrTMr8ZQ19+WYIM02wbCbM=;
 b=Imsy1SWkFpxuRXAATTUlvEEps3XtCjU9EXKbf4+oBimUb+IISofTMppTP2KyuCZmViTv/Oke8VCYGkd9dufucG2fAF8J0uZHG0vqTAPwFKzxorH3CZdejj+dXcuT23g8KHzTybtYM0HeIC6G93lVMOy6KPS9C2mJRdjcyNKOnVnP9WF1V+++sIi9yoWmgthR0oR0SVBQpK7l/fNLZKciRPhECAq/xBKX2oZa/wglTZch8fWgNcIYjZxM7Dk/0fRSgsqvUiWVk3Yn//um7ixmBuu7rECNy1m5Lq57JBnP9nzOk7kK7hr1blM7OoZjS6i1ZhFAUWrQkFwSSP21iI60iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA1PR11MB8318.namprd11.prod.outlook.com (2603:10b6:806:373::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.24; Mon, 8 Apr
 2024 19:10:05 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7452.019; Mon, 8 Apr 2024
 19:10:05 +0000
Content-Type: multipart/alternative;
 boundary="------------vC10paCslYGUvpyah0l7uuEQ"
Message-ID: <df51d8ab-abbe-4847-9b47-565583ba6aae@intel.com>
Date: Tue, 9 Apr 2024 00:39:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] drm/xe/bmg: Add BMG platform definition
To: <intel-xe@lists.freedesktop.org>
References: <20240408170545.3769566-1-balasubramani.vivekanandan@intel.com>
 <20240408170545.3769566-4-balasubramani.vivekanandan@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240408170545.3769566-4-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: PN3PR01CA0178.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::12) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SA1PR11MB8318:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: feiw8U3ah0EOUZGyuLnmAAIh3TyQXg5RmpRBWNqa7vChe2d0PZwMlLe6mlEV/Pu3H3aYSHes6+8HFgp94Wf8gj+feJPj/KwvASfdLXhpRJfrCXW5/t8EVaKf/KV2YJMXrD8EfSgUnTRA6HvHwMIVJQ8NMV3utOJOGRuIhrE5DtFSSey2DkA7N7aqsL3FgGmFtCrN6B7C4jaoE3dGevusEGq2injYI69HGSfQkldQ/ZWlHxCQ2CchP2WpvG7H/93rdO/2fbAPpufHCN/MnjWHBy2FFAPyb5e/zJEkd/DF68W/MsoNtMeN3iLntemjydWdWS4eg3BM0TjyGmzYvijs2X0pmzL16aj4UJvdhpSPvwFsRNH9/dsXmRKZflU157beJJw2nTF4Y4pZYkkhQWnI4jFqW7F3OENxNM/gtG+unNd6bkXvrUr4L6EJ8ThqBdS3XIgPV/Bez0qsuWlmRlv0fLcq1+SrR0PE9LqTgLUR9bho3nBa8ENQXl43hWfw3UCaFaOzruq5Ae8LOW6Z6TOnWXe6RGLrIfQpNEzeA3xwVlzS6epeyDh6FHR58vzwaqHaxwCVLMFM1UQGiAcgOXSXuElW2OmnSxX1tbRXLwLJ2esPNN745fNos9+GKAggKmr0VLeOiFNqP/nvxu80EJNgqc4NOlJ+fCrsVRmS1vjplo8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWNmUXJEYlEzTUN5WURJUUQvYzhkQ2NqaU5VR01BRWpnNVUxYmZPMzNOaTdy?=
 =?utf-8?B?cTRmbWNZU0VxZTRQWmQ2YlQ1TFNINGpSa2d6OTVaTjU0Z2FrS0dET2dkellu?=
 =?utf-8?B?RVNLSVNYMXhWWEZaczN0WXNxMU1tQ0dRSDl1UXFpWjh3dTlNTXM5WnVRckdl?=
 =?utf-8?B?RlpGN2dzYnBGMEZVS3ZaaCtRcFFKUW9JOGlCNlpvTTdueXZEUE9lU1JkQ0Fr?=
 =?utf-8?B?UjJTTGsrVXF0Y3JieVl5SEVGd3pSQnpFTDlpQ2NwbVJ3SnREZlBLQmpEZmtm?=
 =?utf-8?B?VEFyM3Byc21wU2RNZE1GNmk4SWQrYWJlbE5NR3Z4NW55MTNQQThNZDc2R01p?=
 =?utf-8?B?WWltSTE2dmdTNHpSbVNHOU03bW5sQXBZaXNCT1pNdFhzRUp5cFZLN1hmWXo2?=
 =?utf-8?B?YmNXQ3picVM0S3BrRmY3aTV4aWRqeGFUOUhPanRKMERKUDJTTVZ2WHVtSE5F?=
 =?utf-8?B?Mk9RWVBzMzB6YWpFLy9oNkxyYjgwd21XbzloZVNnOTBFOFVXY25uUnJicStD?=
 =?utf-8?B?bzB6RjB2THpSTzNrMVNMTWZaQXdGcnBVWlBEVElQTzYvVk1SaXlWdlB5cXph?=
 =?utf-8?B?THJWaXhnZGF2bHpaSmd3dGxJN3JSdTJNYjhKcDFGZndDWHlUeEJjcWpwcUVx?=
 =?utf-8?B?Tk82em4vNlNhVXRWT3RyQi9SeTFyN2I1aXRFWnZaSWFKZ2xWNDJPd2FsSm42?=
 =?utf-8?B?SDd2ZGU5RnQxcjgxWnczOUNyK1dkTzJURmdNbjcvRnQ2a0NINHQ4WlRFZnRv?=
 =?utf-8?B?eEJFNE5rVVdsQnZPaHpFRVViem4rQm1ibEEreUJVSnBQMDR2NFRMQ3Y5Sy9R?=
 =?utf-8?B?dWdQdGpEMlNQSFZyZmJIUitJRkN2M3NZazlMaXdCbjRnTnRsbHY4cDVHZWNj?=
 =?utf-8?B?bmszU0FjU3VWNWJqYjRhWFFLMC9tdjFpU0FXUXk1c3dJdDBmcy83VExjdkow?=
 =?utf-8?B?YjFpZll5bVlZZWR4SUFVQlFEV3JVY3NiV29IeUZoYU8yZG9zcWcrUkRSUnJy?=
 =?utf-8?B?OCtveXZqZEpZSjlWeENZUExidTJUYjNrVWJGZ2NxL1NaS1pIZ2Y1Nm16N2tp?=
 =?utf-8?B?a0J2Uk9BdlZ5bWVYOEJRWnVCRFl4MjI5WU41cC9SelhsWCtudjAyK0NEd2hI?=
 =?utf-8?B?MGRET1NDQmlNcldVNlJLQlpiZnZMeTlscERkdWJmSTRXcWM4UmtJdXRXOVVF?=
 =?utf-8?B?WHZ6cjFUR2JQZklFVEhtMkxiNFkwNXN5ZkdTdldRWFBzSTBwN2lPanpKZFZt?=
 =?utf-8?B?WGFLdVg1ZUxwOHA5RmRVdGV4cDNnY1E1NmdkYU52ZThwY0hwNWRxWTFVUnMr?=
 =?utf-8?B?QjJGQU85Z3RUT2xOQUNKVElJVU9QUHdBOWY4b3Z6eEdIY1drczFWSklmYlJw?=
 =?utf-8?B?VnFNdUNDdzF0NEcvYXROeFM1bU9VRUdxcHBKTnRwZ2RscVBQbmZhVXlYaE5X?=
 =?utf-8?B?ZGdUTE1mYTlYdTRCMmdXbXVXTW1ZR01MR0IvUDdNVUhUNjBQcURlU29aTVFV?=
 =?utf-8?B?TVprMEMrZWlsa1lkdTZtbWR2eERIMlI2UnloRnhEVTBJcXRvd3M5QnlNWEts?=
 =?utf-8?B?azNhd2VoSFpjWERuNjZYeElLQjFrUlBEdkRhN1k1WThXTjFWa3czM1VNb0ZF?=
 =?utf-8?B?TkpaYTdGcW12VGsxOWRMQXdSTzJwU2I0MUZPUGVESC9wSTFzNmcyekdUQU9X?=
 =?utf-8?B?VkZrdUlodzdEcjJrcnJLQktqY3IrdGtlUDQwS2c3M1ZwRzhDRlY3WXgzTmRm?=
 =?utf-8?B?NCtJMVd5TFZkb3J5dGk5QnpxMEdoWTVHcUVVd1VPNmFpakxOSlB5NXlTWE5N?=
 =?utf-8?B?QzQzMGxZY1AxQllBQlJWMjlWTEliZkNGcHkyY3Nab1pOR2dhUUJ6cTFValBJ?=
 =?utf-8?B?S1RNQnRBZGMyczU4NVVNZ0g1anNlVTFhWXRNeTlxVWI3bHdxbitYbDBsU0o5?=
 =?utf-8?B?VE02M3IwNVlUN2o0bDZ1RWo5bnN4cktpSTZHbXduOEVsUlNHWjVVUlFvZGVp?=
 =?utf-8?B?aWswd1drNmJlb3JSK25rR003SnVRVUQ4M1Fic0JGVFZ0RVlXS1NVSFRIZDVU?=
 =?utf-8?B?VmM0MU9XYlcxZWU1ekRDVzRBdFpCdGdabHRjQ1c0OGRmOTUzRHJNeDVSTWhz?=
 =?utf-8?B?OUxjR2syaDdWS3ZyRDZCNGRSL1JwOVNuUmNEdUh1MjVjYUhPWU80ZVBkRGVX?=
 =?utf-8?B?b0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3247e69c-5e67-46c4-7c47-08dc57ff7f79
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 19:10:04.9650 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TLtC7MMYucmqIPA54P6B3yOyIISJKUhkZf+pfLJdww3yWBdQdivVdeSBHErZsawWzD4ATC/H+MJpgenni+Ae/vKaT1zVZJWNmYgVtTEms3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8318
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

--------------vC10paCslYGUvpyah0l7uuEQ
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 08-04-2024 22:35, Balasubramani Vivekanandan wrote:
> From: Matt Roper<matthew.d.roper@intel.com>
>
> BMG is a discrete GPU based on the Xe2 architecture.
> No device ids are bound to the BMG platform descriptor yet.
> BMG device ids will be added once we have all the basic required
> platform enabling patches landed.
>
> v2: Removed device ids, deferring it to a later patch
>
> Bspec: 68090
Since device IDs are no longer included in this patch, it's appropriate 
to remove the Bspec information, as it doesn't provide any relevant 
details regarding the patch.
> Signed-off-by: Matt Roper<matthew.d.roper@intel.com>
> Signed-off-by: Balasubramani Vivekanandan<balasubramani.vivekanandan@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci.c            | 6 ++++++
>   drivers/gpu/drm/xe/xe_platform_types.h | 1 +
>   2 files changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 2d3b18d6404e..3b30353dbc09 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -337,6 +337,12 @@ static const struct xe_device_desc lnl_desc = {
>   	.require_force_probe = true,
>   };
>   
> +static const struct xe_device_desc bmg_desc __maybe_unused = {
> +	DGFX_FEATURES,
> +	PLATFORM(XE_BATTLEMAGE),
> +	.require_force_probe = true,
> +};
> +
>   #undef PLATFORM
>   __diag_pop();
>   
> diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
> index 553f53dbd093..79b7042c4534 100644
> --- a/drivers/gpu/drm/xe/xe_platform_types.h
> +++ b/drivers/gpu/drm/xe/xe_platform_types.h
> @@ -22,6 +22,7 @@ enum xe_platform {
>   	XE_PVC,
>   	XE_METEORLAKE,
>   	XE_LUNARLAKE,
> +	XE_BATTLEMAGE,
>   };
>   
>   enum xe_subplatform {
--------------vC10paCslYGUvpyah0l7uuEQ
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 08-04-2024 22:35, Balasubramani
      Vivekanandan wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240408170545.3769566-4-balasubramani.vivekanandan@intel.com">
      <pre class="moz-quote-pre" wrap="">From: Matt Roper <a class="moz-txt-link-rfc2396E" href="mailto:matthew.d.roper@intel.com">&lt;matthew.d.roper@intel.com&gt;</a>

BMG is a discrete GPU based on the Xe2 architecture.
No device ids are bound to the BMG platform descriptor yet.
BMG device ids will be added once we have all the basic required
platform enabling patches landed.

v2: Removed device ids, deferring it to a later patch

Bspec: 68090</pre>
    </blockquote>
    <span style="color: rgb(13, 13, 13); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Since device IDs are no longer included in this patch, it's appropriate to remove the Bspec information, as it doesn't provide any relevant details regarding the patch.</span>
    <br>
    <blockquote type="cite" cite="mid:20240408170545.3769566-4-balasubramani.vivekanandan@intel.com">
      <pre class="moz-quote-pre" wrap="">
Signed-off-by: Matt Roper <a class="moz-txt-link-rfc2396E" href="mailto:matthew.d.roper@intel.com">&lt;matthew.d.roper@intel.com&gt;</a>
Signed-off-by: Balasubramani Vivekanandan <a class="moz-txt-link-rfc2396E" href="mailto:balasubramani.vivekanandan@intel.com">&lt;balasubramani.vivekanandan@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_pci.c            | 6 ++++++
 drivers/gpu/drm/xe/xe_platform_types.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 2d3b18d6404e..3b30353dbc09 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -337,6 +337,12 @@ static const struct xe_device_desc lnl_desc = {
 	.require_force_probe = true,
 };
 
+static const struct xe_device_desc bmg_desc __maybe_unused = {
+	DGFX_FEATURES,
+	PLATFORM(XE_BATTLEMAGE),
+	.require_force_probe = true,
+};
+
 #undef PLATFORM
 __diag_pop();
 
diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
index 553f53dbd093..79b7042c4534 100644
--- a/drivers/gpu/drm/xe/xe_platform_types.h
+++ b/drivers/gpu/drm/xe/xe_platform_types.h
@@ -22,6 +22,7 @@ enum xe_platform {
 	XE_PVC,
 	XE_METEORLAKE,
 	XE_LUNARLAKE,
+	XE_BATTLEMAGE,
 };
 
 enum xe_subplatform {
</pre>
    </blockquote>
  </body>
</html>

--------------vC10paCslYGUvpyah0l7uuEQ--
