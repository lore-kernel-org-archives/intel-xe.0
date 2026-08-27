Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79478C61DC7
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 09:46:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 031DB10EF8A;
	Thu, 27 Aug 2026 09:46:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m3h5gJSN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4591410EF80;
 Thu, 27 Aug 2026 09:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787823991; x=1819359991;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=SNJOvjOD6wZuQ8UpP3fRQG32Wlvd7QfsEnF7tVPSdYA=;
 b=m3h5gJSNjuqWy06VjrtqV6NAsRHih0X2axue2BaIFJ6ixrzf79pXkxS5
 sfjv/6BhZvVdDgZWVtWw6gUkkEqsLu7/VMOxC6vPAzP16CFqmS3vAym3w
 kEZ8W7Qsi9O7StTZRIF7bBECnzpbgS4SalFeIpEoeGkgCt/w7ITBmIuKa
 PDpTKjvuAIx73IB7UNoe5+1rXOy5PeZZ9q4OMz3yv0cqJsWTPhFXtg8t4
 m4RG7e1JSOu9RPPkvir+lcQZcpkaegbQ9Cn8pZHej1zt90+RC0OuBh+aD
 nhnCRAoM18wsmdJ1eMou5Lc17EhepA9rfuOj8eu/ftGBedc2/XtPQ1WFR g==;
X-CSE-ConnectionGUID: 8vMUBbKORR2aiHHv+2MV7g==
X-CSE-MsgGUID: G0swB4hORKOY6fxsQG9SHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88346584"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="88346584"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 02:46:30 -0700
X-CSE-ConnectionGUID: LOtQvWrsQS29awaES2un2w==
X-CSE-MsgGUID: F9P23w61TNuHcZ6gIQCcuw==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 02:46:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 02:46:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 02:46:29 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 02:46:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xR9C/4/oQt465Jke0dzEMUgNwzMAHCvgbWbg+gww6cEizRclhiTUrXzT0RoxO2Q5t+p+pQKcB2MY/uZjuwrEYOO7309C3g3RyT4kjNiChtTo2YszTlHA/nTzV96Qkp0Atd8HH8n/c8GpC6kMpKPmztcb9ipC09Pe/Sfjelm43KlhWkD5hMkYXQJZ3sb1H9o59Nixxdxx3uOhbvPhyI1QFlMb5PDloMF/dh2N9xNIu6uP/Ph6yRzrOB38iLuolxs60d170YANPaLwzSRf11BUOIeztW6+09hAEPQlW85gbELJ+N1ktMnCd7NBOPoeNHliKYTmFTDjcNpNtI3j22gSVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntWHu77xGRnTZXIfhOWUNPIeQDLeK5IzjLL6ZnSVb9M=;
 b=b3J6oz7oFYE5mt1xzdKjyzAX21bA2luw+HlpsJcnCj2A7kuvS0DKbLnUKxjd6ov8lT9+wNchWe6UyBFsgHatBLf+h7xjhDjjJNFIj/P4tecL021eM/Ngbbk67EG5cZh8TtkIeyTWx+MbXWtpznJV34LoKqZSJ73oSk1HcZHl2FANzM+6PJ9W/FULSMK5gLJEBIkIrKxjPv7ACBpR91pyRYC3W0Cr3eNRYvaPnY1h73mNudUxrFDs+ydNDub0RSDczoIThY5tud1aAs+/enpaCMKyNZyjpK0vRRrK7O8U3OFa0550s8CU6JC4GHeacCPmk3wsMK3DOJ6Hr84zIEVTiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by IA4PR11MB9129.namprd11.prod.outlook.com (2603:10b6:208:55e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 27 Aug
 2026 09:46:26 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0360.005; Thu, 27 Aug 2026
 09:46:26 +0000
Message-ID: <b98de383-e076-47d4-ad67-c1c241dac687@intel.com>
Date: Thu, 27 Aug 2026 15:16:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] drm/i915/cursor: Program secondary cursor planes
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
References: <20260821044755.2234490-1-nemesa.garg@intel.com>
 <20260821044755.2234490-5-nemesa.garg@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260821044755.2234490-5-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0054.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::19) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|IA4PR11MB9129:EE_
X-MS-Office365-Filtering-Correlation-Id: 47463315-de95-478f-c73c-08df04200ff5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|22082099003|56012099006|18002099003|11063799006|4143699003|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: grmW06pqOIgIKZ8sLYNGetpl8X5wmPyVOEJ0770oyTMOF2+nOde43zJQP6eiLMZf1afizbeh7r4S6aqdNYY2xi1KNLQYBDTyCG0ZtSm1p6fStOr1lZq6bWc1xscPcQEvqhvMTq2tnQLOUmWEF2QH9vzAJSglHFm3gehUQIEt8+U5Xl+MQ+607qBbko8EYPGi1tMdrgyPdDvzTr5klwilnB/vJNtvfRuPrj4ncmatlg6/36scaMnNjblZgB947/ktFiTuPOpOJNb/NOPu+n/K6BwiWP4xG4pdpyUjWEXbP1E3GfKOsRohvSlFuliLC/OPrCujH4P87bD/5q9t0dylEcI4DWEYoaPZgYgaX3rEYiFIR5MnfYONvJ3Ayrk7ym+e9N8W/yhGJ+X4K72CKfbPHt107h16sMZ4jsoyAbbbOtnY0mV/vksjbty70ASx5pDFncX6Ht7lHybyFfqUGkKXbnv6h+7xE2T53rSD/7ZY7NFc95sEuLw73e8ZFiyKigxa7IdgMRyWxE+mxWq1VffIHKpDKH8NZ44Pnb14g2mBnyMsptoill7jzRKADE5chLyhPHxL4B4ht4KLzq1aE3Iy4IakUT7cTIhHA//qvlZfO+fWQxgof9octaBlJ1Mg4fqmcVjmcS/uyq6hBLK1A2SgD00VnYleSuDGXzZBvL22Nx8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(22082099003)(56012099006)(18002099003)(11063799006)(4143699003)(10067099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0J1R1VxVXg4OUF6WUlidFJKbVlxNXFIb3Z3bk9yTkpvMnBOTUVycVZGWTVC?=
 =?utf-8?B?aDA0R3RJL3VaRjlNM1gvbTlOS0w2OWVHakh5ZUNJRDFtNjNxenN3UTFPekRS?=
 =?utf-8?B?TkNrTEJYS1hXNGQvU0Joa0xhK2pydldUbjdNQndXYldqYUpQdS81bkg5ZmpU?=
 =?utf-8?B?d3RZaU9jdXpnQ2g0OEQ3M2JrZWJTZjVBNWpKRDZkN25wYWw3ZVVzMmFVSWNH?=
 =?utf-8?B?ZDRmNll5c2g4WWR3dCt6clFXUlNmSVpVNGlaNjBGR1EzMXF6NXVXNFZhNDB0?=
 =?utf-8?B?V1pkRmwwQS9kdzZSZmFRU3JvZHVaNWdtVlBGRSs5UDlyYTkwR1h5cVlRNHdB?=
 =?utf-8?B?OEdtd0RiUG5JNEg3SzZSYjNaQlVXckVUMU9DTzhTWG5TUnJ0dldBOFhmR25C?=
 =?utf-8?B?UGRMczh1bG1kTFg1OXh0Y29wVU0xMUttamxDM2t1WUpqTi9QOXN3b1ZJKzV0?=
 =?utf-8?B?VmUrTVZEc0NPODJmNXIvc3NYWEdBamdnaFZJbXNGd2FPUEZ3dUc4a1E0Szhl?=
 =?utf-8?B?N3Z6bFlaNkFPYjl1cnlzRmtUeVQwcjhENnRHOG83SW1sTG5iWFFZUDBPTmFF?=
 =?utf-8?B?Y2xYWjdKejVtWEVmbmxsc1kvQnUwZFNlSUg5b3FQV3h3enJzczJ0KzlLdjhP?=
 =?utf-8?B?NEVSaHdjK3dNWThJMkdCRHZHYzJNVkdoUGsyY3orR2ZRc2RqY1Fkc3h1aUdV?=
 =?utf-8?B?YndiRGx5ejRRcnMxaTBhYjR3QUpXU0ZZSkJtTnppekRkUVhqVHVoQ21NQXAx?=
 =?utf-8?B?VHU2cGpSNUY4ZXM4NFpDZFBtTDRHY2pocG12VXlaWlN0dCtoTFNqTFZmNWNY?=
 =?utf-8?B?akNKczJ3NkhQd0ZJQy9EcTdjeG9XZDFUQktWUmtnY1YrOVBReThEV3RJM1Ev?=
 =?utf-8?B?NkZTWit5MDhvRXYzQW1FMk5HV25ZcmxxZWw4NXpuMHF2cWx1OXAzc01HY1lk?=
 =?utf-8?B?RHFvYmxSU0pOZU52S1N5MzNjajFCWkhXL3Z1dkdzV2lZVEN6NTkyV2NibWY1?=
 =?utf-8?B?L1ZLOGQ5eW1lSDJ1dkV0NDdXdWJQcnk1V0NNVEJhUnhuUUdRVzRnUjdBTzJP?=
 =?utf-8?B?SkRQd0ZsejJZeXgxWllmdVZlS3BpY2dWdDg4TmF1WFM2SmZER2Y2TnNaV0RB?=
 =?utf-8?B?Z3cwRzlVaURtZjdkVWFKdUl4b2JnYXJsd1JzNDNseGVKdTRWbG1DSXUxT0Fs?=
 =?utf-8?B?WGF0Wk1zaytkRlk1SnVjemZmR0ZtUFRielp2WXd1bGFQVFllR1FuVVVYaTJN?=
 =?utf-8?B?Zm5uTmV5YWE1Z0dQOUdITzh4OGs1OFRRL2tsc0xEN2ZVTnBGNDhIQ0xTbHI3?=
 =?utf-8?B?UC8ydjNHaVlYbFA3VXovME5OUEJpNUtMelJ3T3E4bWlrMmV4Rjc1NVBVVGVR?=
 =?utf-8?B?Zy9PWVBzWm1zNlVtcExwOGwxWEhlU3BwQURON0cvZkRVL3dHZ2VGZGN0L3lJ?=
 =?utf-8?B?a2k5c00xbTlzVUR2ODFRTUFiaWpFckhvT2tVak5nWjlMUXlhU3FBbDhmQlYz?=
 =?utf-8?B?cEZrL1UxL2l0bDY3NzlBcXhIbEN1cTNmc2U1Qkg5MS9PMmFvZXAwcWswTjgy?=
 =?utf-8?B?cjNDQWZrb2xiamJjTis5RWFSaWM0VDl6RitXUFFQYzlBQW1FOGhQaDdPOHZO?=
 =?utf-8?B?SWZlTDJONUJXUnlpdnFCd1lmRjRza1RpRFRHVGxqR25LaEJJVHpuL1c4VE96?=
 =?utf-8?B?YXJBWFdhei82UVUyZ3Z6Y01QRGM0QzJ2SHRUWndydmlXajhnb1FpeVpYVXBt?=
 =?utf-8?B?RGhRdGl5elRVNzBEWnNiSFZMV0ZFakFodXlaN0FWRm5ZaTBDNFhUVyttWE5V?=
 =?utf-8?B?czE4Q2RBTW1EQ0ZiTDF3Q1IxdzRCSTd2QlBWeFAvS2hURDBnY2ExTm5QTnBv?=
 =?utf-8?B?ZGFQYjlGaXRmNC90bTgxdFFYSUVVTHpYMkVTUWhjbXBHUWZJZnFid0k4Znc1?=
 =?utf-8?B?ankyaUhWUVZRdDZUeU4ycWoySG9xZjBaUWxOZjJBUmw3d2hsN0R2ZFQyNzR3?=
 =?utf-8?B?N0JBeE9IWVhMaFdDTTEyREZBblJVVW1Ub0Myc1FYRTdZSzRpbmMyM2dCMjZu?=
 =?utf-8?B?RlNsRFpTaFNKVEpSZGluelJuUzlTTHZ6ZGMwTlpweXZOZG5neTFNNWFyazlj?=
 =?utf-8?B?ekFsNGllRndndWIwQzM1VkYzRmdKVEhIODNMTUdwSmpNMTdabXVSeDlacEtX?=
 =?utf-8?B?cmw1eU1zMU5KVTRwTWQ3NXMyemxmRzdTdWM3TmFQMU01NW9WM0srYmgzcXYy?=
 =?utf-8?B?QkEvRXdqQjM2S1lUaTl0VW0zVjBXc2FYNnB2SjI1QWhJbUpIUlQ1bm9tN1R0?=
 =?utf-8?B?WFFjNUZ3ZXlSUUFJK1liMFhwdE9jTXNsclNyWGJSdk56TTd6QkNiSXRYNFVC?=
 =?utf-8?Q?IV5+6CptsA+FN33T2lnaYIzLdLrBSn6Qion0d?=
X-Exchange-RoutingPolicyChecked: iTzEeEkr2diXWeX+3Xi+zkpzbFl/61K4zA9zn26k9OxskJmvN1dAij2C2YZ6I3UzYrm/MYU8z3WQzkUDvgJwF2Jeq4bSZoR7y7sTe+BO5Hmupya64+DCxNWKXdsIDwTLZCT5iUmEYsEvrmGeTr8eQ5VE5lmiDTRuuezQx02IKtTz+Y4/wj4xpdc7enOCFBIBMe0yMsI4O1i2kpc29onXMv/EDjIsn6GbuKi8h/VYHlrMdD583KMTZZ98j2XQhhjQDP5r5qaN6kr2SltlJAdFHDxTLsSvIM+N2QcwuwPfyYsraiXh5LVBLXKAUmKRWXFeumEMrF5CFByqHjnJ9pq34Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 47463315-de95-478f-c73c-08df04200ff5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 09:46:26.4846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8TDM5xpkAdM1K5BS+tXATg7d47qaOL2C+LEc/dox2yRz1LXqRuh6ep78nh6cPVen+cFzKLuGOnakfCl4Hmif0CGQsKq/jNlyGwL4oxUKq2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9129
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



On 8/21/2026 10:17 AM, Nemesa Garg wrote:
> Iterate over all joined pipes when arming/disabling the cursor plane so
> secondary pipes are updated together with the primary. The pin, check
> and state duplication for secondary pipes was already prepared in the
> previous commit; this converts the update_arm pass to a loop over the
> joined_pipe_state[] array.
> 
> Because the whole loop runs inside a single primary vblank-evade,
> sample intel_crtc_get_vblank_counter() per pipe around each arm and
> emit a drm_err() if the counter ticks during that pipe's own
> programming.
> 
> v2: Check primary and secondary pipe together. [Ville]
> v3: Use struct intel_cursor_joiner_state. [Ville]
> v4: Add per-pipe vblank straddle detection around the arm loop. [Chaitanya]
> v5: Move straddle check outside the loop to cover all pipes together.
>      Sample vblank counter from primary pipe only.
>      Move drm_err() after local_irq_enable(). [Chaitnaya]
> 

LGTM, except my name ;)
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> Assisted-by: Claude:claude-sonnet-4.6
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_cursor.c | 33 +++++++++++++++++----
>   1 file changed, 28 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
> index 9cb8b0a8537c..f5625dabc8f6 100644
> --- a/drivers/gpu/drm/i915/display/intel_cursor.c
> +++ b/drivers/gpu/drm/i915/display/intel_cursor.c
> @@ -13,6 +13,7 @@
>   #include <drm/drm_vblank.h>
>   
>   #include "intel_atomic.h"
> +#include "intel_crtc.h"
>   #include "intel_cursor.h"
>   #include "intel_cursor_regs.h"
>   #include "intel_de.h"
> @@ -900,6 +901,7 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
>   	struct intel_cursor_joiner_state joined_pipe_state[I915_MAX_PIPES] = {};
>   	struct intel_crtc *pipe_crtc;
>   	int num_pipes = 0;
> +	u32 start_vbl_count, end_vbl_count;
>   	int ret;
>   
>   	/*
> @@ -1040,15 +1042,36 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
>   		local_irq_disable();
>   	}
>   
> -	if (new_plane_state->uapi.visible) {
> -		intel_plane_update_noarm(NULL, plane, crtc_state, new_plane_state);
> -		intel_plane_update_arm(NULL, plane, crtc_state, new_plane_state);
> -	} else {
> -		intel_plane_disable_arm(NULL, plane, crtc_state);
> +	/*
> +	 * Joiner pipes are vblank-synchronized, so sampling only the primary
> +	 * pipe is sufficient to detect a straddle across all joined pipes.
> +	 * The vblank evasion above also operates on the primary pipe only.
> +	 */
> +	start_vbl_count = intel_crtc_get_vblank_counter(joined_pipe_state[0].crtc);
> +
> +	for (int i = 0; i < num_pipes; i++) {
> +		if (joined_pipe_state[i].new_plane_state->uapi.visible) {
> +			intel_plane_update_noarm(NULL, joined_pipe_state[i].plane,
> +						 joined_pipe_state[i].crtc_state,
> +						 joined_pipe_state[i].new_plane_state);
> +			intel_plane_update_arm(NULL, joined_pipe_state[i].plane,
> +					       joined_pipe_state[i].crtc_state,
> +					       joined_pipe_state[i].new_plane_state);
> +		} else {
> +			intel_plane_disable_arm(NULL, joined_pipe_state[i].plane, joined_pipe_state[i].crtc_state);
> +		}
>   	}
>   
> +	end_vbl_count = intel_crtc_get_vblank_counter(joined_pipe_state[0].crtc);
> +
>   	local_irq_enable();
>   
> +	if (start_vbl_count != end_vbl_count)
> +		drm_err(display->drm,
> +			"Atomic update failure on pipe %c (start=%u end=%u)\n",
> +			pipe_name(joined_pipe_state[0].crtc->pipe),
> +			start_vbl_count, end_vbl_count);
> +
>   	intel_psr_unlock(crtc_state);
>   
>   	/*

