Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7017C55184
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 08:59:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56DC610E4A6;
	Mon,  3 Aug 2026 08:59:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AbC9lejb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05A010E4A6
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Aug 2026 08:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785747549; x=1817283549;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gk+93W9EJ3q3J3UFBh+aothplSCg8XD8hlKZe9ryxjo=;
 b=AbC9lejbftbOIiRLUmu0v0/pBHV4ijH6PA8Nx158k0jp1YM3X2Otb+gJ
 6LmYvlmJB8yGfKKLLKeT2VAR1WvK+BgYYGfAAttZctkpDR9IhcbFgMiAL
 8O1HZLozs9BbCWGLl3XZ/As8x5QqOeJg0Hc/m+Gec49NOUDxsRAFPyBqc
 btzAjFiTRvP+rXZHWJ1SKyvboWwnvlQXYul4rDMwQf5rZPuw78dIsUxuJ
 W18bHPPMcZUzbbf7PZ8D8OQYlziGKw0JVwy+RXXoQQJRc8pdveWvt6z7p
 3VyP1Ei/En3dJvHu/5YTXLO0qAJFFltAe8uTWrkrm4gPWmuX3Cn1KqiUr A==;
X-CSE-ConnectionGUID: y4nIkyaNSoOYkU68E+unLQ==
X-CSE-MsgGUID: +dAjY+nZQqqitS5ok5efMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="86313083"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="86313083"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 01:59:09 -0700
X-CSE-ConnectionGUID: rXDjYH5qQUKBTSZKRQfSyw==
X-CSE-MsgGUID: mK5F2gIOQ1yLkiopzr4HRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="257260140"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 01:59:08 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 01:59:08 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 01:59:08 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.69) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 01:59:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZnLUXOyK/HlnBhjuUcPSFkXQZPw2m21NiLj3Qef/pYcMbwt90vgxr0bluzRAXpAm45s3lWCGfzJtpp7hJl5wlngGOj+R32jHGvPdr9HzWe7V9K8pfNsvVgutgOHpx53v1rJx0IMn6HUuI4eeU441suwnr+Kdn9AQm1IQlgegeS9rpg93ncbuwhLi/b32vt62JoC/DxHd952EgZVXSp7U6YNx62ESuPfSrUTyFocpOlUtgDCXNlfH6+ijbwhfXN4fBv5dwVgzH+3cNJkgtt5a5IfZ/YwMs7nVsnC9IL2YiyiRASGT0ou+3giXxKLGsCRKbbJeAGzG4lvtirtzbsfyiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BbKqec5ck4CqZC7/fS3CJ/8nFx7vLc89B489z0Og4vg=;
 b=vByKQeQR2WE/c6DisHANN7RiKfYTl839ySGwlBguJDWllqaHrupKqPihID/r0y4nicv/0yJofMXJdbwggk0R7EWw7tOtgFgvLSkR+nZzKQKCG6AOAH4RLS8OLOmKxdR+S7Js07AoxaEb4k2DZ0Led6fSm3iDSE2sCz9AbLXaCaZ4UDxWm/66Kah72V5r8XiLgJEkFPQ18NXH1KvM3ndjeR3wIaP9okytFPMfMUjNaq/J+LuGXodE5i5Axaebi7z9xR7O5PrQoM+63HAg3XGRWshmb2rdt6ym6JiZPN9PAWp4LSOtIkEKUS6vSlv32wCNwjc0qm7XtySTDeOp8hIZxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SAVPR11MB9551.namprd11.prod.outlook.com (2603:10b6:806:4e9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 08:59:06 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 08:59:06 +0000
Message-ID: <77c2c19d-d950-4bbb-b1f3-5014429f8efd@intel.com>
Date: Mon, 3 Aug 2026 14:28:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/23] drm/xe/log: Add SIGID log helpers for location &
 severity
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-8-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260730152121.576-8-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::14) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SAVPR11MB9551:EE_
X-MS-Office365-Filtering-Correlation-Id: da22ac9b-86e8-4253-059a-08def13d78f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|10067099003|56012099006|4143699003|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: /wjUWfvVH/jDIUFGU6wibRj6PNQTLgvzE3/iHm7viiETXfHVopOUhhviL2aXoWOdeE3z2MfgGis+ZD5l3RZA3mgrHOd1JIPNXMiawtb7mWIieBPG4g1DQnvHQQpHYCNF9dd6Tr+fNQThbjZBVWhyF/6IBQlMdJpoiT8IUOo5UCnt3sG5vWHh2rAIiCigdA2H5F47xh8Ma/mmu4c/phYbsIJQtBgqwWBMnnB2XstjYlCPVQwNb0Zxe4U1S00aDsVjWQvQ9vuXIECd1hif6SXOjqCzRhN248hgZRQihlsN8ZYy2HcuJasSoVII+QXyroA5T/f4/EDQolEX9wjR0nUSZIr5iPHgVy48Sl69+BXyrY5a50KXn9Re0vn2DJ56guvAYBjBJhipJBxx+fwe/Vwr06CAiYu6KR6v8ffV/sQIjldmR1OJ0pIebtgvwgKOJ7Vg46UXYxF2qCLvTY0y2UbCpIh7mo+q8sc0xstYo9aFQnMyIbPFFeFVKH1SM1kHwM9SX9JYFdOTj+iTOlcjkelnHPDLiQjBQv4UvjQArmrtb1tKiMxfsZMS5DpheNKx+1JdwGiNF5U0Dg1dmYx7Fmouo42HLlVyNtBOpSJAy4IHxea/X1MQEj24vQXMgdUipC/IDXm5I0y5VQwxZ95Cuz6ZY9Q+w9Vy3MMd9xcveRrGT7k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(4143699003)(11063799006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDhZZ1lVSWc4SXZUSnM5dzluVXVYbVhGam1reDJ0TjY1eCtwN3lkSGNiTzJn?=
 =?utf-8?B?dzlWT3JiMDRaUUZkWUpSZy9naUF1bjRFQm1TOUNtbmhBb2xrWWw4NDVVb2NL?=
 =?utf-8?B?WmhVQ1IzQjlBZDR5MnVsamtMdjM0YktQaHZmOGg2ZlAyeEs0QndMbS9jNGxu?=
 =?utf-8?B?ZWUrNVdWRmcwd1FnS2RtYU5XcXQxb1hTMmUyVUsrMjB0VTZnYk1tWm43QU9D?=
 =?utf-8?B?bVAza200Q0VmM0sxSURDZ0JjaWllMzJvY1puT2gwOUdwZ1VUMzRxQ040QmRL?=
 =?utf-8?B?eHFJT0JHUEw5RzlpUGpuOVI3TkttRy9SclcvZVl1bjIvb0R6ZWVyc25Hdm52?=
 =?utf-8?B?b2x2YnFXV0Vic0ZJVE9CYW4wM0xEZ1B3dXNpWmdObk1YaWUwVlRvVktRNFFN?=
 =?utf-8?B?bE5XZ21LamJpMEJNdU16bXBrWFdqRXg0ZjhwU29DT21kZkpHcGpUYTkrWk9r?=
 =?utf-8?B?ckU0NVlQVWMvV0hWdmk1M2NoRUVUcENCa0hnNzdxWnplM3llTnFRa05BQ2FL?=
 =?utf-8?B?RGQydkFEQWhRVm9IVUR6RjJoM2l6b1RDdkV4eDNtL2ZNQ0QzWUdBQ1lJMHJB?=
 =?utf-8?B?a0FuZ3F4eWRuQUNjM0NxRXdJSkNyaDBLbEgxWERkQ3h1NDVSUlJsRjNhVDhL?=
 =?utf-8?B?NE1QbEJwaitHRVIwYW5qVEhRKzFnV0hQMWJOV1FSL2tMcCtWZWVIVmlMNjVS?=
 =?utf-8?B?RGFFTjZNdG5ZUS9HeGxtcFJsdGNPNmg2b2tsdkJ3NXkvSzVtODRCN1k5S1Bo?=
 =?utf-8?B?VHRuMkFDUjZqbEN1MzJHZFRuRlhxRHpzT3J5WklyQlVGUnVKRmRMdVR1S0JC?=
 =?utf-8?B?bVFxUzA1dGZqMS9SQ1ZYbkNOWXBxUVhwL04rRkpyU1dDY2FTbjljT3oyNzlQ?=
 =?utf-8?B?NUc4ZCt4OE9VTVJYdHFUY3F6QXlvc0lDdFNGM1h4QUcyL0VlQk9CeTB3djR2?=
 =?utf-8?B?RzhuNFRaQmNyOHlsTTdyemZIWXU1dEpxcGpxVWZyNzNJMmFPNGNuZjNkYlZj?=
 =?utf-8?B?MlJwZ3YyT2hLMFNXbWk1YVNCR1RPdFA1SnFHSElObkcxbVpPQ1U5U0ZkdUZY?=
 =?utf-8?B?bWdiYUNIZmNLRVZ0NjRFcnZkc01LSGk1ZHg5SE02UVR5VS9wdENTWklWdTZ1?=
 =?utf-8?B?dm83TVlqZ0FMQVdMdE1HSmpPSE5rd0J0aGE4QXlOamVWZW10bDZsT3J2VTVz?=
 =?utf-8?B?S3hDWkxCSEgvQ1I3VWpDTHhTWHVacFQ0VlZDWTl4SXc4ZWY1cXRQb2pYbkVj?=
 =?utf-8?B?dFgwL204bFUwenIvdzR0VldrMWptWXlQakxiS1BMZlE3YThocDVNWFJjckE0?=
 =?utf-8?B?VUM3N21zYmovVFdKN2xGa0g0aXJXbTRCWDlrUGFsUXE0TGIydnRKRzRoVEx4?=
 =?utf-8?B?aUx4MjlPOWRQN09hMm9xNTE4WkxYRDFWS044Rm8yMGx2Rjd4K1Nmd2M1U1RZ?=
 =?utf-8?B?WUVIdWFna2NHOHA4Y2Q0RFRRU3FuOTJBckpObmEwTjhraFJzeVdyZE03QWdF?=
 =?utf-8?B?RGdwbnRNQWoyZ3U1cE1oUit4WlBCYytYblVxb0NKbWkzaGNhUjRZS05MbHFi?=
 =?utf-8?B?bzVjeldkMzZDTExieGltYUtTZmVoelBoamN5Z0xVMVR4Q3NoenhrU3ZpRk9r?=
 =?utf-8?B?YjJGRG0vaXcwZmdTUnFiMWw0WE1ybmtYQ0d6eGR6V2FmZC9BdVUvTmJlbzhS?=
 =?utf-8?B?cUpMTG5HQlZxTlBkdC9DTzVrYmFmeTdGZ0ovakV4YmphSkRjUmtIWC8yeFVR?=
 =?utf-8?B?S2ZKTDVPL1dsSE80M3JZRE91UGVORWwrSWlhVEJOQk1RNkhFUGJZcTc0QmZl?=
 =?utf-8?B?aEorUHlad0Z0bGpOaDR3T0lLR2tTbkdSWHZPb1pzUC9FV1dKZFViUE9iUGRl?=
 =?utf-8?B?WkFkVmZlTkFzK1JqNzA3MkVzd2pNUDFNcGpGMVpDTnFyQnNEaWY1LzJ3R0xB?=
 =?utf-8?B?Wkd4cC9MdzdnR2hKYnlIaloyd25peFEyZXNPN3B2L1p3NGh2Zm5naG02ZzJS?=
 =?utf-8?B?MmI5MHArZ3V2R3JXZktkQlU1WFhJai9MZk1EazM4YkhLcnBZQWJ0YlJaMFJ4?=
 =?utf-8?B?Sk9pYnBIZUFkUlN6TStCMVY0SFEyNGxBZ1lFTmlLaXl6RVVZT1dhc0FZTCtX?=
 =?utf-8?B?RkJGdkk1bE80MWRrTzQrRy9hVlJYc0hRblBOa0pSWG9ialRzM1ppbUZ5SE84?=
 =?utf-8?B?SURtQlR5d3Q2Q0E3STc1YjUxNm1aS3l2SitGYm11NXdHa0ZGbFVuSDR4WkQ4?=
 =?utf-8?B?allKUktyVmQ3RG82Nk85MWc1d2hiNlptbS9vcjh0ODQ5djM0eWtSSitkNW5w?=
 =?utf-8?B?YklCK3pJakMvYzFLTk83MTZZaldaRkRMdFluZFNzOTUzdU9WQ25sUlFDbzc5?=
 =?utf-8?Q?vp5jhuhFaqG37JFQ=3D?=
X-Exchange-RoutingPolicyChecked: QCGuX6zoc3pAQjZYeefdNKfLX7pnVJyX1G/Kprp/1UYCuAMD5lztc3T0VBwqdKhF0xPLghy+C+o0BEC4p8dUiTJBeobELRccI1IxkIkteCP7cK+FfdnS+LQMBBhtOiVySMfHDru5PNR6uft0iLhp5942jFYwJ9tInLbsdvUlMvib2PL7andURlVeSKjYwcO5gBNAHr8aWFgmSVXM/3hIS5XVzDNi4giVGGTS7CH9ocKQBKyIUFcPz8mP9Swf8d/qbAfak7EN5PSvzMHfpcFjJn98Zwbo950h1elH4+6SedW8ih2rBv2QTxGluapTW11wwtyGjW3gb1NDhXVomsk1CA==
X-MS-Exchange-CrossTenant-Network-Message-Id: da22ac9b-86e8-4253-059a-08def13d78f7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 08:59:05.9765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OR8l+K0p0vJmpRnUNiY8SI0MvZvIHNvLn+4x4IJaHMpVnr2MqYWsbRgDmYk1T+lVioS96ICdXq8lQ270zwoUjs68lQyxLseOaFs/lJTSSR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR11MB9551
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


On 30-07-2026 08:51 pm, Michal Wajdeczko wrote:
> There are only few CPER severity levels defined, add more helpers
> to avoid forcing developers to write full CPER severity name in
> every function call.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> v2: fix argument list (Sashiko)
> ---
>   drivers/gpu/drm/xe/xe_log.h | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
> index 510cedae6e14..916218560297 100644
> --- a/drivers/gpu/drm/xe/xe_log.h
> +++ b/drivers/gpu/drm/xe/xe_log.h
> @@ -69,4 +69,20 @@ void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>   		    xe_log_location(___any), (data), (len), fmt, ##args);		\
>   } while (0)
>   
> +#define xe_log_from_fatal(any, sig, comp, data, len, fmt, args...) \
> +	xe_log_from((any), CPER_SEV_FATAL, (sig), (comp), \
> +		    (data), (len), fmt, ##args)
> +
> +#define xe_log_from_recoverable(any, sig, comp, data, len, fmt, args...) \
> +	xe_log_from((any), CPER_SEV_RECOVERABLE, (sig), (comp), \
> +		    (data), (len), fmt, ##args)
> +
> +#define xe_log_from_corrected(any, sig, comp, data, len, fmt, args...) \
> +	xe_log_from((any), CPER_SEV_CORRECTED, (sig), (comp), \
> +		    (data), (len), fmt, ##args)
> +
> +#define xe_log_from_info(any, sig, comp, data, len, fmt, args...) \
> +	xe_log_from((any), CPER_SEV_INFORMATIONAL, (sig), (comp), \
> +		    (data), (len), fmt, ##args)
> +
>   #endif
