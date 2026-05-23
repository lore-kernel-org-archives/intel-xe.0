Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972FDCD5BB8
	for <intel-xe@archiver.kernel.org>; Sat, 23 May 2026 01:04:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D4610E027;
	Sat, 23 May 2026 01:04:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fgp1YRQ1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A205910E027
 for <intel-xe@lists.freedesktop.org>; Sat, 23 May 2026 01:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779498250; x=1811034250;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6bZrH+H8Z4od6iCyPPvpef65vCagRjhJA8kUutWV5j0=;
 b=fgp1YRQ1aBp2nCON3+SiI2eiY6jlAB1SnHF4XyUbaq/eNgJo8XTbRuIb
 Rkau3LVXyFr6yd/ScndNKQ+vb0mIGdXsQpWmHJkELGhMiqpc+txahzHwf
 G1YWde0vxeUB9CSLZ3SLW5I0t966T+CXT0xwwmQOYdPbZhEhX3OqUu0i0
 sLaR6VuyQdY77UUJWw9w1SpLljvDYh7iEgviKbtd6YqMVCDy1UHfVUtfM
 dEt4dxvgEwdSXm34HA85ShHQJYIdJJvhG65kHgDzjtu5r4javUuLaI/Jf
 B/QUZSdpp5Bd9b8d/EgC4YGy+UsfBCvy9AvX+jeUt708bU/v9nicjlexM w==;
X-CSE-ConnectionGUID: HUAayRw5T9uJaCLEaUoWYQ==
X-CSE-MsgGUID: rgOMpeTGQUm3bPfdSo7www==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="91000894"
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; d="scan'208";a="91000894"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 18:04:10 -0700
X-CSE-ConnectionGUID: C9j2PSbVRc6Ial2k8+VBPA==
X-CSE-MsgGUID: Q+FpPx1HRzikFO+LmtW3wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; d="scan'208";a="242868001"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 18:04:10 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 22 May 2026 18:04:03 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 22 May 2026 18:04:03 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.22) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 22 May 2026 18:03:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NaYa66inLKniP1lx3wPO/uDB+oqK2h6ktjmfvIzWknyfS1eR9XHQxYbwiJKIEJ1b+EMFAVHof/6UAi10GUu2q4W0O0ezjGHOodTm2SMyy3BncCpOZiv2ZUfERULEbitOK86k8tFRK2ljO7V70K3xJK5tdHBv8gPxGBJB3e5RH/ULHyghH0lCr7y6ER7k5lnX1XGOvqXo61bdhDidOkjcyXoCFDVRfnpd42waBcY5Pmj4Kqc+w+Nr3ezL9S/z2qMCdmZSYSjtBcmf9GclSC1gyV9b5+lrSu+kZS1x0ewm3YERlwXm/JhfXZ0858tXoXfFVdnIskSvo2QIlKs2kG73wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gimdM9bGeQJXCutB6ydR+qKJx5Dh0cKucRRkWAS88oI=;
 b=T4qAKotTBCXyq0DpZx7r9MMxY8UllH67AsbZU1ZiWx4hZoKkAxOhdrpjrCQ4Pe2BraLnKlH8N0LOU54sLOXEQO89h0VHdIeW3155ps36dP0xDLWx1aXZj2lhkTxKsL+g6uocl+jc000uA51I3SIuunG64g9I5raU0I7SGh0igXDznif6w/dneTEocCN551nsjCNyyoOoUIzJ6zJdtaQdYA1rlPOfYpmYXetBaUDAxuUHdJ4ic0ePnF/t7jrXLC38CWvzbVAF256XDeQ6UrvcSDM6sKVXENSX4WuXhXKmukzNHbenH7g4lja4fxdd9djfLffkJ7TMriEOATmYVrSRrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by IA1PR11MB6123.namprd11.prod.outlook.com (2603:10b6:208:3ed::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Sat, 23 May
 2026 01:03:36 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.21.0048.016; Sat, 23 May 2026
 01:03:36 +0000
Message-ID: <4676b0be-4cfa-424e-858f-9346d633ea0e@intel.com>
Date: Fri, 22 May 2026 18:03:36 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] drm/xe/guc: refactor ads to use guc_class
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260522123720.39656-12-matthew.auld@intel.com>
 <20260522123720.39656-13-matthew.auld@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260522123720.39656-13-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0115.namprd05.prod.outlook.com
 (2603:10b6:a03:334::30) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|IA1PR11MB6123:EE_
X-MS-Office365-Filtering-Correlation-Id: feb49593-0fd9-47df-38d3-08deb8671e5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|4143699003|11063799006|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: VqCV3PD28b9UKhNQlubvrvCr0G7C6i9MR/rtazI+vZEi/tOqiABnowmsgABnPDcRuclXyZB+5QRZQ312l/rEwEZcN7ct3RvnTy9gcIAMzPjSfkSlQvW2gD9XVgD8B+xk4TK0Kks5lIM2sErNUlkFAKXaoFbB3XYwJQ/w1D9T0Q5A9Y2yhLu0wC6I029kCHWPBHzhCDGVKykERkX8gJzlNkAj/LM1AsO7ffreZK1Gb4WJYabKox+0+kB+WYfZYKizdZXmFo1wPkb0tvQSvi1BPPxl5aIjgA5u8zPCcN+nrICmnSSLy34nAoosvcrXondAdiITCe6hUl/0KJYqZOZsu4Bd9wT7q4pGP4vi0jbbfX57ioHSsXs/NyqvUNsYJ1lfeAZB9XhHyyeVGWWAEDW8MbRFr70CrJJedJuWPrVqNBuJDSb0XOKZR+9u03tSRMono5OREUs+GZydECVo4HhpUYnbk/gHaSUOo5PBlRsG4ofBZI93MqGgIviPBLlm/RS9+0hBxi+IW24TGAaqCKq/dfthw2fzX3hA6ytZ4ia8fgshTvfvA5lZM6UIm0Q6bD+do+6SF4LaSZlENMvZ3ig7AiAVcLDK7P1NX8NipDO/85Yrn5+0htAmF2JW+kZ3F1NM/XPWkCB9ISH3HIS6EzNOU8aJZ8qU1EMUGMxndJDnR5Zzk5o3Cjc6oVFEwaNsdVxB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(4143699003)(11063799006)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzhNYTlYU0ZRK0doY3MwTVVWQys2Uk1YdCtPM1k3UGVCZUxhSVZ1OGNIbXpO?=
 =?utf-8?B?dS9vZ25QVWR0Q2t2Y2JkdW8veVdrYnd3UFdodE8xbHRuOGNYa2NFaHp1UHRC?=
 =?utf-8?B?eFpaU0o5MzcyQVF6MWhHQzVxMHg1OXVRRmQzTlJUUDlYMkdTSDZld2tpZTFI?=
 =?utf-8?B?d1d5dnVMcXg2MUZYUGFGcjF2VS9LNHZuZ2lDcEpnRm5xdnFpRFRoamg2dkZs?=
 =?utf-8?B?N3laNEVKNE9FSFFhQXVzWkF3SE8zTmo5dHpkLzBUb0dKcCtMU3hYWiszcDdF?=
 =?utf-8?B?Ulo1NnlDSVhqRFFWTHc1eFc4WElPM2F2WDdvNFU3L3VYbkE3VWEyeWFiZnFO?=
 =?utf-8?B?NEs2TWl3ZHF6QVFUc0J1bjlzZ01vVDZKQWhHcThtdzJNVU1KR0RKTTVzQU9C?=
 =?utf-8?B?Ymk1S3hRUGw5S2tyaloxcmo0N3ovR0hDYmh0YWpWNDlzYWZUQTd6K2NKYzZq?=
 =?utf-8?B?Zm1ISDBxb3Vsc1FFSEJ4ZG13UXRRS1Qrd1NEQmt4ZGtuNlVXVVk4b3JWcDB3?=
 =?utf-8?B?b1hRY1pNNkJSVjhBNDI4c2ZhOUtiRTM4alhXc1NlR0VqdHFlTkZXaW5CdjVS?=
 =?utf-8?B?QzkraFlReHExWDV6V2d0Zk5iRmlSQkw1Y2NTUHlLRXJwc3AzSlBXaWptM0tT?=
 =?utf-8?B?dkpaZGxBU3BXTkh4TDVQanpxTVhYMzU2Zi9qQVNQdXVqaDVMUG9OUDdhSnh1?=
 =?utf-8?B?NjFjWkQ0TFpQaDdKTzEyaGZpaE02M1VENkNOWU1WSWdHUjVSekZQTXdnYjNq?=
 =?utf-8?B?VGx6SHBUSWdvOWFUWnZsU0dFQzFTSFV4eGpOelRGN3pnQkFidUwyNUFGaXIz?=
 =?utf-8?B?QkhEbXI3dERuTFNpUVZmRm5zOUJmb1ROeG9GR0NaYVp4SmpCeHl3MkdKRFpr?=
 =?utf-8?B?K1BrSE92SnJxRUlWKy9lZkRDU2hiWFVlR1RYN0xzcEoxZkxtOHg5ZWtDSk50?=
 =?utf-8?B?QUR6OXhhbEpFR3dBaTR0bi9aZW5IQllSMnVHMy9yY1pudDlZSk1zalA1MDRI?=
 =?utf-8?B?Ym9Pd3BjUmlkb3R2STRhcU9sK1g1Q041UEYyMld3Z3ZkaUlMbUxabFlSOGhD?=
 =?utf-8?B?OFZkcjZMN3RyNkhOVCtlM2k2cURJVnl5VExNYWhYUC9WYk1wSzMwc0hUZDV1?=
 =?utf-8?B?bEViUGxhUVdmOEh6ZjVpT3VBNjBMemU5NWhaWGdra3pLWVZBeGRTOElkREpv?=
 =?utf-8?B?MHhPdSt0K2pOU240TTlSZkZGZy9RaS9jVDFySUdHWWpEQjBBTE1WOHVmeE8w?=
 =?utf-8?B?c2I2YXpNY2NxbU15T1VINnZzM0VFZ0tabnVkNllEWXNXcGtNL3NJNTQzdnpo?=
 =?utf-8?B?dE9CbW1IN2RERDV3VTRxT2JKajlRTWdnVVNTNzJ3N2tHaWg2WVNTeTlOWTNV?=
 =?utf-8?B?Nk1MdzNGUTJOaGRpUEVRM21NeE9rbTNXckt6dG9URThUWlZGa2JqUmtvWjJq?=
 =?utf-8?B?RTNOWjVVclMzcmFXUytGQ0kvQTRiRnJPeUN1TW92bmcxeExWaCtveEdORkJQ?=
 =?utf-8?B?YU05Z1l1cDZ6MUcyL2Z1SHErYzdUSHJ4L0Q2QTdoeG1oUjRreUtiMkl0eDMr?=
 =?utf-8?B?Rlg0am9lUmZwRnM4clNpRS9hbldUcFJpSTBEQ0Y1QTljVlI1UzFVVGNGNVpW?=
 =?utf-8?B?bTQzSXdodWFSZXV5cEhJU2NGN3IzM0Q2Tk1IR1pmUmtqM3JLOEFDWkwvOHla?=
 =?utf-8?B?eWxjbjRNVmVwQ2Y2a0FLbC9zMm4xSlZmZ1dTdkYrWU94RlJBKy90aHppY01j?=
 =?utf-8?B?M3lvTENSdW10TUxVTzJXdnorbU4zQjFDSCtrTEFBbWNvSzFOZ0dXVmdpNUJr?=
 =?utf-8?B?VXhUeWdhWnMwMjRsVGoraklMTGRVQ1hKancrUW1MRmNyMlc4OHNqeDBBTTZL?=
 =?utf-8?B?dEQvUnkxR1E0ejl6TmYwTnlWbFBoaVVrQzljdkdORjV4VmxkaUI5ZXliUkJx?=
 =?utf-8?B?YWdlTVdzempjd0pVTDRVRW1qL1hNbHYyQS9uNG85UWZ6MW1BRXlRZ2ZsNG1r?=
 =?utf-8?B?U2Nhd0hYa1VUQmpOWUFmOW5xL1Z5SnJyMFBnUEVydlcwM21Yb2VWbWRwRGNl?=
 =?utf-8?B?RVlvVDdJbUk4ZW43dGFMRmdOell3TW1Ia0VPRjEvelZEUWxncnF2NlFJc1dS?=
 =?utf-8?B?VzZiN0VBYUFhdU14QWZlRmZZVGh2bEdPSWlua0Z4aytHU2VzbXlPY2RTanIx?=
 =?utf-8?B?YVoyU1VJMm1PUGRYbitzNm9rTW1BbGFEUGxpaHgxdWVqSWVKd0kwblJzdllE?=
 =?utf-8?B?MS8zQXMxeXk0RnVtZkhxY2R4elViREkyaWp5Z0NnVGIzT0tDOU42aytMT3RT?=
 =?utf-8?B?WEFISzEzcDBLWnRpTGFsY2FpRDRnRElxRGUyQXoveUk0VUZLeVFkQkt6SWFW?=
 =?utf-8?Q?qJtfBdGvyxNKNEdU=3D?=
X-Exchange-RoutingPolicyChecked: MA4escHq7o6dILjEj1dEipMQBHw7PUIjHgLf8q4o2G7AEHoTaxLZ/PiSlhyQ4pzznzwTMQKVejMsXDglWj6LztX+UTXGeSi2AXi4gDadygeshB6vxxHFGZtV/d3J70Uly0+dqXGo0lrqg4Ie/ozUiYlw4D4A4bkdeF6GaTWP/9aNe4Ocx/eZwXa4bRd0ripgZk/qGo6gC9r2lIRNIpjm++Ki+OiGePTB3WRcFYKMUcpdUBKKDr4xqJE0y7jcffErmfXrskpjGY4DsLBTldDst/ilHXm3cLbJVbjA3PEDpNAj649G5+SbYj849kfX89uR1f8OTIAuLCzyyJY24C6j5A==
X-MS-Exchange-CrossTenant-Network-Message-Id: feb49593-0fd9-47df-38d3-08deb8671e5e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2026 01:03:36.5517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ZTgvEW+XuJwx6xLSrI7XsMaSp+LjV/TERthcEYi8AHRzCfkCkvQwQYf6WYx4u8BwBliRqvReew0tzSZWZllpJfwr3Izw9kum3hUNgUECeg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6123
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



On 5/22/2026 5:37 AM, Matthew Auld wrote:
> Currently in the lrc init flow on the ads side, we loop through each
> generic engine class and convert that to the respective guc engine
> class. However, with some upcoming changes, it will be better to go the
> opposite way and loop through every guc engine class, and convert that
> to the generic engine class.
>
> This also reworks engine_enable_mask to operate on the guc_class, that
> way we can easily filter out the PAGING vs normal BSC, when applicable.

nit: this sentence looks like it should go after the next one, because 
here you mention PAGING directly but below you introduce the "new engine 
class".

>
> This will be needed in an upcoming patch where we have a new guc engine
> class that just matches up to the existing blitter/copy class, but needs
> to be treated as separate entity from the normal copy lrc, when setting
> up the ADS.
>
> As a bonus this also gets rid of two xe_engine_class_to_guc_class()
> users which will be helpful for the next patch.
>
> No functional changes.
>
> Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_ads.c | 67 ++++++++++++++++++++++-----------
>   1 file changed, 45 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index b9bca6084a4f..ffe60d77b713 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -251,15 +251,37 @@ static size_t calculate_regset_size(struct xe_gt *gt)
>   	return count * sizeof(struct guc_mmio_reg);
>   }
>   
> -static u32 engine_enable_mask(struct xe_gt *gt, enum xe_engine_class class)
> +static inline enum xe_engine_class guc_class_to_engine_class(u16 guc_class)
> +{
> +	switch (guc_class) {
> +	case GUC_RENDER_CLASS:
> +		return XE_ENGINE_CLASS_RENDER;
> +	case GUC_VIDEO_CLASS:
> +		return XE_ENGINE_CLASS_VIDEO_DECODE;
> +	case GUC_VIDEOENHANCE_CLASS:
> +		return XE_ENGINE_CLASS_VIDEO_ENHANCE;
> +	case GUC_BLITTER_CLASS:
> +		return XE_ENGINE_CLASS_COPY;
> +	case GUC_COMPUTE_CLASS:
> +		return XE_ENGINE_CLASS_COMPUTE;
> +	case GUC_GSC_OTHER_CLASS:
> +		return XE_ENGINE_CLASS_OTHER;
> +	default:
> +		XE_WARN_ON(guc_class);
> +		return -1;
> +	}
> +}
> +
> +static u32 engine_enable_mask(struct xe_gt *gt, u16 guc_class)
>   {
>   	struct xe_hw_engine *hwe;
>   	enum xe_hw_engine_id id;
>   	u32 mask = 0;
>   
> -	for_each_hw_engine(hwe, gt, id)
> -		if (hwe->class == class)
> +	for_each_hw_engine(hwe, gt, id) {
> +		if (xe_engine_class_to_guc_class(hwe->class) == guc_class)
>   			mask |= BIT(hwe->instance);
> +	}

nit: the brackets aren't really needed here.

>   
>   	return mask;
>   }
> @@ -268,10 +290,13 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
>   {
>   	struct xe_gt *gt = ads_to_gt(ads);
>   	size_t total_size = 0, alloc_size, real_size;
> -	int class;
> +	u16 guc_class;
>   
> -	for (class = 0; class < XE_ENGINE_CLASS_MAX; ++class) {
> -		if (!engine_enable_mask(gt, class))
> +	for (guc_class = 0; guc_class <= GUC_LAST_ENGINE_CLASS; ++guc_class) {
> +		enum xe_engine_class class =
> +			guc_class_to_engine_class(guc_class);
> +
> +		if (!engine_enable_mask(gt, guc_class))
>   			continue;
>   
>   		real_size = xe_gt_lrc_size(gt, class);
> @@ -465,18 +490,18 @@ static void fill_engine_enable_masks(struct xe_gt *gt,
>   	struct xe_device *xe = gt_to_xe(gt);
>   
>   	info_map_write(xe, info_map, engine_enabled_masks[GUC_RENDER_CLASS],
> -		       engine_enable_mask(gt, XE_ENGINE_CLASS_RENDER));
> +		       engine_enable_mask(gt, GUC_RENDER_CLASS));
>   	info_map_write(xe, info_map, engine_enabled_masks[GUC_BLITTER_CLASS],
> -		       engine_enable_mask(gt, XE_ENGINE_CLASS_COPY));
> +		       engine_enable_mask(gt, GUC_BLITTER_CLASS));
>   	info_map_write(xe, info_map, engine_enabled_masks[GUC_VIDEO_CLASS],
> -		       engine_enable_mask(gt, XE_ENGINE_CLASS_VIDEO_DECODE));
> +		       engine_enable_mask(gt, GUC_VIDEO_CLASS));
>   	info_map_write(xe, info_map,
>   		       engine_enabled_masks[GUC_VIDEOENHANCE_CLASS],
> -		       engine_enable_mask(gt, XE_ENGINE_CLASS_VIDEO_ENHANCE));
> +		       engine_enable_mask(gt, GUC_VIDEOENHANCE_CLASS));
>   	info_map_write(xe, info_map, engine_enabled_masks[GUC_COMPUTE_CLASS],
> -		       engine_enable_mask(gt, XE_ENGINE_CLASS_COMPUTE));
> +		       engine_enable_mask(gt, GUC_COMPUTE_CLASS));
>   	info_map_write(xe, info_map, engine_enabled_masks[GUC_GSC_OTHER_CLASS],
> -		       engine_enable_mask(gt, XE_ENGINE_CLASS_OTHER));
> +		       engine_enable_mask(gt, GUC_GSC_OTHER_CLASS));

Would it be worth making this a loop now that we use the GuC class 
everywhere?
Something like:

for (guc_class = 0; guc_class <= GUC_LAST_ENGINE_CLASS; ++guc_class)
	info_map_write(xe, info_map,
		       engine_enabled_masks[guc_class],
		       engine_enable_mask(gt, guc_class));


Not a blocker.

Apart from the nits this LGTM, so:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>   }
>   
>   /*
> @@ -491,15 +516,14 @@ static void guc_golden_lrc_init(struct xe_guc_ads *ads)
>   			offsetof(struct __guc_ads_blob, system_info));
>   	size_t alloc_size, real_size;
>   	u32 addr_ggtt, offset;
> -	int class;
> +	u16 guc_class;
>   
>   	offset = guc_ads_golden_lrc_offset(ads);
>   	addr_ggtt = xe_bo_ggtt_addr(ads->bo) + offset;
>   
> -	for (class = 0; class < XE_ENGINE_CLASS_MAX; ++class) {
> -		u8 guc_class;
> -
> -		guc_class = xe_engine_class_to_guc_class(class);
> +	for (guc_class = 0; guc_class <= GUC_LAST_ENGINE_CLASS; ++guc_class) {
> +		enum xe_engine_class class =
> +			guc_class_to_engine_class(guc_class);
>   
>   		if (!info_map_read(xe, &info_map,
>   				   engine_enabled_masks[guc_class]))
> @@ -943,14 +967,13 @@ static void guc_golden_lrc_populate(struct xe_guc_ads *ads)
>   			offsetof(struct __guc_ads_blob, system_info));
>   	size_t total_size = 0, alloc_size, real_size;
>   	u32 offset;
> -	int class;
> +	u16 guc_class;
>   
>   	offset = guc_ads_golden_lrc_offset(ads);
>   
> -	for (class = 0; class < XE_ENGINE_CLASS_MAX; ++class) {
> -		u8 guc_class;
> -
> -		guc_class = xe_engine_class_to_guc_class(class);
> +	for (guc_class = 0; guc_class <= GUC_LAST_ENGINE_CLASS; ++guc_class) {
> +		enum xe_engine_class class =
> +			guc_class_to_engine_class(guc_class);
>   
>   		if (!info_map_read(xe, &info_map,
>   				   engine_enabled_masks[guc_class]))

