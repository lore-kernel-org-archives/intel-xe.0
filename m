Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75639CD3430
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 08:27:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365A210E9DE;
	Tue,  5 May 2026 08:27:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ybwyp/zh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37DCD10E9DE
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 08:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777969671; x=1809505671;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/ZjOtxwMqooKgVoiq1tB+RlZbgy596Ljso1VgNXWLsY=;
 b=Ybwyp/zhSR459g3yYAKXE7d14QxTLlrmNfNqp/T4LN0M8GZIlRsbBs5S
 Nt0PZoLNy72Khk4k+WTYOTjgtskvAceD5n6IlLqmPvx6vMFwm8QaUcDNP
 SiWZaZE4FvAl4MkvKN38GvCpGyfbSTaGU/ccs2p7SnHQcdwf25Pc6UW+Q
 0q5d5IykqgSnwoH0E8F4pB8thsRtYElEXdaEgKvEo++FktdGZht5gfbmq
 sXjxUb4lrWKKWf/RECCaUTdPgdzfpA1UfeuftTPLhs6hr6cZlIDKEovw/
 GqI/esCOPaPxcEWaseLWDnhMTtpV3cxuFmA8Y4DME8RAIuQv+E2cGgKce A==;
X-CSE-ConnectionGUID: PalUG0BmQyeDCE0W1wxwPQ==
X-CSE-MsgGUID: R5MkK6EIRY+wx0dyVVpP9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="89937886"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="89937886"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 01:27:51 -0700
X-CSE-ConnectionGUID: JgI7FtArQRywC5dUQT47Gw==
X-CSE-MsgGUID: GEW5cnqVTJarM06GNdhEjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="231174498"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 01:27:50 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 01:27:50 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 01:27:50 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.60) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 01:27:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FXx2AREpZy3Oxz/F1wtlqZFUys8R2RRrQWekz8hKBySjOeBuF3w94lSUWe1zu3Y25CttzXMcOfpDQ/Tlp7G9SkxufFK+n9eVvXHiIiqJyvJogV1vwx6TP6hSZaAwVigBB2hC6sDDtM0pC0IJO/xo0VrvlTHRfhmJHYVarZffIK5OxRcFH8wcy9Y4QM/a6gYrQQXZ19FONTSgvpp19OD6qh12zMWO3NF8P0xQFmgrC5EbO++s8lfFQVinp4H153CUKYPgyG4OIWVr8g9PlmUh+wS2dsLuS0lj7gIYla+smv9EY8qR/opP1cb30CUSfcvtS1ewjPjAJ4SAoHIQTkDH3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CqUx2Yk4dZihmb9/v+YD4wnISE9/Z7WABw/d5sTWbOs=;
 b=kwhXsDITYPLazVx3PE1S7z1xVhcC6efFUUsSYHnzc8vj9H+td0U7XbUoTOnetHV4GRFJ5s1gUQ/1HMjtX3qrfbI4Fr5PSg5mZk+noPOeUKfRIzllbac5RJE5h0Oy1grn3/o8O56hQGveAIWF1VJEEQbXvgmRHMuWl3feousOh9I4uc4YWGXoZ3adH+JjpDsdxjooD3NqJYC0KMZeiEphp/R6dXKGqz41gDr9zxB8NoZVkrF35uw04LKs3R/SyzfpTcmsk7YYDdNvSrFyUKCPMmlAZ1VeUTRwZyr9N5kBe25w6fxaXRQidB2KQAi7X1+d9ToEp85gw180CFPIzO72bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by PH0PR11MB5062.namprd11.prod.outlook.com (2603:10b6:510:3e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 08:27:46 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563%5]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 08:27:46 +0000
Message-ID: <42f77733-e8f9-452e-89cf-e5597f6154da@intel.com>
Date: Tue, 5 May 2026 11:27:41 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] drm/xe/memirq: Introduce helper to calculate source
 page offset
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260428142722.582-1-michal.wajdeczko@intel.com>
 <20260428142722.582-10-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <20260428142722.582-10-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL0P290CA0001.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::15) To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|PH0PR11MB5062:EE_
X-MS-Office365-Filtering-Correlation-Id: 45c621b1-82c5-452a-aaa8-08deaa802fbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: VSnJD4GhA3SO34bTPSwS5EOEMvSE5uiNzMs2NeGeP0vUrG1ES0/o9/MPGlU8XY5oI0NzezkOAu3kF6KIVRGWfFJrgNoVU8SfstoFmsGPcW8dHc9Z0JG668yYWVFqZKlnHpjRP/pu9ZQjCttF432hXtVUcY5HLNV5uNZTXe6BRvcPSrtOS5rrMwE59daSz4Uk5yu4MHTaXtlUbfvPiwOI751oVrIlrSRtwYTNywKjRZkEZeONJ8/1m8b7qaRnmOdHIRlD1Yabrc4Q29L7BNJvlXcqiK/uKDY0SM7CaTdEocNAUvMWa2jnnQ0BbDVG6jaCiWXVlvZLhLAJBx5ah9ex5Oy+oeDO9pk6XQ+oVh7mxPEllXzH2syaDdXbDKye38kcf4J5hNjAoS7xOVwFk8eMBft0eQGORoNLa2odO0K6sTMQOrfQaKcGsls3lpZrbnq0VZ+hShyz3J9pkD4aSCKqB00TYjx5N+vFOwjRQqAZxuiaq3wCY6KwGVsHHQseoxMl2dgQvqEL2JQlXreb3DiwjH7zuofbWIvV5lbHttb2BcOpITIF1x7A0ofizw7lznI+2TFDX07lxfZgcyEoiylJzXEVKqiPW6Qy/ltP5XwW2viSVnaL52CIvSdsLmZc2I5VjFTdyLkz6BNekMQzuCJFuIroAx+tlbrYdAiZOrO1q3qWMpJp5jyAJueFCe+VFulc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXViTTF1OUJPWmJYRnNpUjFVdldiUkIvMFNieXdJZ3dmTFdlUzNBd3ZVUkdv?=
 =?utf-8?B?cmRoYm0wNnMzMmpYOXhQdnBDc0ZteDRnSnEzTmhyZCtXQjhFZzVMV0NZeXR4?=
 =?utf-8?B?Mks0dkdqT0NnNmV2ZU5aeVdWNVFqSkphSVZ3NnFsMURKSWhWeTFtODBJU2Vl?=
 =?utf-8?B?a2J2MU1VMWYvWlZTdHdxYVpQVEJlb3hVRlR5VDJoSlltTlJJUjFqWC9NTmVC?=
 =?utf-8?B?THVjVEl1ZFo3QytaY3FURVo3N1h5WjlRcVQvcm1HazhGdlRjN1lpWHM4dHVF?=
 =?utf-8?B?NFh1S2x3VVoxZGd6YUhLNDhjZ1dnSng2N2tIcHRKZjBjUURYbVlWdzQyVmw2?=
 =?utf-8?B?Ry8rV0FMeTh1T3owQ3NYdWlaUW04Tk8vZmdJOVp6akM2aWJBTjFzUnRhMnVk?=
 =?utf-8?B?cEd4ZkljT2FsTUo0THFlcFRqSXowa2x1QjNSd2x4SUdmZ0ZldlNzQ1hsbmFG?=
 =?utf-8?B?TnZORzdnemJmZWZHZmVBVGZUdWljQ3AvZXNvM0pRMjVQQkNBRk1DRi9YQ1Q5?=
 =?utf-8?B?VzBSMWx3aVN4cmkrOWUyYVJVZG94bFJoR2hnNlZmNEduRGlyd2FkUFlpdm1Q?=
 =?utf-8?B?Skw0TGNiTlhub0dyVkNGRnVKRXBzV0h1SWlsdnFmVTJ0eVo4YklMT051QTJL?=
 =?utf-8?B?R2lUQ3NKUnlEOXM4dk44eHhDeXBhWW41eFlCWEcvOE84SFJZeFBRWXVrZ21x?=
 =?utf-8?B?OGx6OGIxdm9rN0lMY25qQ2hQVXlva3gyUmpxOUxJU3NrNG0rM1J5NXNQa2Y2?=
 =?utf-8?B?YTdtdjI2UzlLdmdGV09JaU9zR2FNZzZxMVdSY2ZYTUtRMFU4d0hxbUZwT29p?=
 =?utf-8?B?dXhHalg2bWZsaCtoR1pxUVdtWjk1dzIyRHZUaXFmM3FKSDdYVTByelBIS0gv?=
 =?utf-8?B?QkU1bVY3d0FyU1l0S3NGY1REVnd1SlRmRGh4UEszT3p4Z2I3T25kNTFzc01B?=
 =?utf-8?B?UXFiZHl1M1JkY0lhaHlBd0FHYTZob0l0eWU3MTluS1JDc1I5OVdNbHF1WnFW?=
 =?utf-8?B?N0tNclVyWjQ1eEFJNElOM0FKS1RsV0tlcWFBOGtjbnFUZFZNNEtob1BjS0JS?=
 =?utf-8?B?allWRElyNkYzcnMzSW8xazErbGQxOFpyejRBNjd4MFlsWU9vQ0gzdFhkQ0Jp?=
 =?utf-8?B?cEhiY2lnRC9UWU9nd3hyY2xBZE9rcEJTUExmeVh0bit4QlV0Tk55bFU0c3lE?=
 =?utf-8?B?bXcwNHBHU3VlZlJ0Z0hhOVI0aWVWZ1orMlI2TFI1OWNMNDQ0bW5ROTdlbFZy?=
 =?utf-8?B?OVoxV2FUclcrSHVabGNZWFAxSkhaVW5mN3pLWURYd0JGRWVPOVc3cjUvTkd6?=
 =?utf-8?B?MnZxa0UvSW5lK1dnZzV4YVZtdzdlakZMVU9VTHN4TDVKLzQ1M2tKQUdVNzJQ?=
 =?utf-8?B?TlY3Yld4Y2RBc0R5ZWhoT2R1cmJ6YUplYW5QU1ZSczJ3RGVGZ0dmUGx2ZVZE?=
 =?utf-8?B?cTZyUEsrWjJIK0xLejVCTWNNNE5wSHQ4SXZ6c0hNTmlzY0g3WE5vcHdjbVBr?=
 =?utf-8?B?RUJ0REc4SmdjOEEyZVhXSy9tK0x6My9DZmlORWFPZC9HczhIai9sRnVBVDEw?=
 =?utf-8?B?REhrMVJuM2x0ZWpBODJ6WWsxcGZ1R3JwUmdKMnc4dXk5UGx5VkRBS1piQjRq?=
 =?utf-8?B?SFBQMnVORG5yem1RQXJGMEpuYUZFTnY5UWlRNmUwZ2ZKb1ZFcFU5QmNwNEd6?=
 =?utf-8?B?c0RyRUNmV1RjTjhDc0FMMmJ3WDBIYUZkVHFwQVFtZUcvUmd3K3ZqWkVDcC8x?=
 =?utf-8?B?a1ZhVlJEcmF6SnIyLzAyd0EwVDI1ME9kQlYvTW9WT2xFWXhOZDZma2diNDdx?=
 =?utf-8?B?bEhxS0dnQXVOUVZxRXRoUTFZUzdJTDdxRnVYRXM1eGlZdEdNY0ZBT1l2MGo4?=
 =?utf-8?B?V1VGTSttUTZyUUlGWG9WM0xuZXh1WndNRzIvcXFWYmJZODU0aXFleHZpS2RD?=
 =?utf-8?B?OTc3QXZ4T2E3b08yOFJtRmFxYXJxZWVXdEhGUXZmS25VSFY2VTJLUnNheEFC?=
 =?utf-8?B?YVJWTjNVMXFhUWNjQkhDeUZjVkYxbExxbVZ1VDBiRVQxRXcxTy8xUXBqbW4z?=
 =?utf-8?B?U1pGRWt1cTVvUFhOaElMSEZpV0xHREVubnZlUzJKbXpRVWVBTmV5TUVWMzgv?=
 =?utf-8?B?UkJCbjRlMXRnTFRQRjlPbWRXcW5oSDJBbHVVSHQ1aU1ubk15eGc2bDIxWG1V?=
 =?utf-8?B?UFVwZ2tKK1JyQjQwa2RQSXozRWxTVUtVbjFoOTlzQ2ExMUZPcDErWmNXMkRz?=
 =?utf-8?B?aGFmdm0vVXNzaVF3c1h6Z1k3VUJhUXRIRjN6cHhXcHdaejEvZDFOT21NcFpi?=
 =?utf-8?B?cEc3M0czQytjTWxZNURyYlFaek1qSjU1Tm82MENVRkxYdndtOG9XZz09?=
X-Exchange-RoutingPolicyChecked: mfh53IwtvTb49LmOcbgWK9yZ9h4I2yiB1yYyNXUOcr+HaEjTRu/RFALHxgbCYa/hTaE6a31uu0qpFebbOZc0gi7emiV8S18reIbzfasFcOTCSMMyuBTLYgv2SKTagKNZn/ZfduIuzMVZ8rXsmfoKXYqf1f+Q20Nmt/sRge4nZp9Jr5yVG2Nud+pwYgcWIxwNghDQsdAe6I5cnIsuXygaioTc2ngXdQXfvbeLGZZSMBNphJ+JDrWcvVMTb5eUQPNVrXKzpmmu7+9hACY1sRjoN4iIln6zdz3FhGjEzyNyuFc+QGAn9I9qZxkCa/SxOOmabDR/NPB36wGy6jVYtKNPag==
X-MS-Exchange-CrossTenant-Network-Message-Id: 45c621b1-82c5-452a-aaa8-08deaa802fbd
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 08:27:46.8730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ccexujCjvdBJTKALeyd/AZcC+GRtY679RSefutyx2fYfAPgzz9oRv9WCM4Eg58eFiKnqNpvhG30ov9X/c9y3kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5062
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

On 4/28/2026 5:27 PM, Michal Wajdeczko wrote:
> We already have XE_MEMIRQ_SOURCE_OFFSET() macro, but it expects
> that instance parameter will separately prepared based on the
> MSI-X usage. Add memirq_source_page_offset() helper function that
> will take care of this.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


NIT: will _be_ separately prepared? I would change it slightly to something like: "but it expects the caller to pass instance 0 when not using MSI-X."

Reviewed-by: Ilia Levi <ilia.levi@intel.com>


> ---
>  drivers/gpu/drm/xe/xe_memirq.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> index 519b36ce2020..113b792d373e 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -256,13 +256,20 @@ int xe_memirq_init(struct xe_memirq *memirq)
>  	return 0;
>  }
>  
> +/* Return: offset to the source page used by engines' nth @instance */
> +static u32 memirq_source_page_offset(struct xe_memirq *memirq, u16 instance)
> +{
> +	memirq_assert(memirq, instance <= XE_HW_ENGINE_MAX_INSTANCE);
> +
> +	instance = hw_reports_to_instance_zero(memirq) ? instance : 0;
> +	return XE_MEMIRQ_SOURCE_OFFSET(instance);
> +}
> +
>  static u32 __memirq_source_page(struct xe_memirq *memirq, u16 instance)
>  {
> -	memirq_assert(memirq, instance <= XE_HW_ENGINE_MAX_INSTANCE);
>  	memirq_assert(memirq, memirq->bo);
>  
> -	instance = hw_reports_to_instance_zero(memirq) ? instance : 0;
> -	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_SOURCE_OFFSET(instance);
> +	return xe_bo_ggtt_addr(memirq->bo) + memirq_source_page_offset(memirq, instance);
>  }
>  
>  /**


