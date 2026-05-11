Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D872CD484E
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 20:43:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E9410E8B3;
	Mon, 11 May 2026 20:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PnMVRgmQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B8F010E8B3
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 20:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778532188; x=1810068188;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vzDQFfjEBOkAONv0thJOefwIlrB2aQ4J5FZC7GBmjZM=;
 b=PnMVRgmQFKhpl/a9Es9yZPMPh/KXnr2Bf3KyiJdpwvWUHGlABPvXpJ4S
 WyCmoYaqyXUp+PIn801P/Bec1tXp1eUUZztmb3l/qN/+wQz7fl4JHDwbl
 Lsuxvx0TkIXM1P+4FWOiuHHocgd5T0E1w5eXn0GDgYuPnwI5Qc/Kbi68s
 bNs9YBHL6sLAJtpTPzO97vzuUR7ozBemff8GSZXu+R8NjlGf6xLWqwY3G
 9PKnh9SABUgm7vEhtBMB3QX5hcjScdSHQ/4/gmASnczNthyH995zKIjqI
 K+vyJlTclNvMK9XamI8/WglvmkaEXtupXs/1vZG6nLjy8PSBSrgRRbzME w==;
X-CSE-ConnectionGUID: 9aqkUcqVQMGuRWWT1+YUkw==
X-CSE-MsgGUID: OavTy7OUTc2AdNEbOGLuDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79461140"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="79461140"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 13:43:08 -0700
X-CSE-ConnectionGUID: S+X+xKmWRPC8FWq36JL9qA==
X-CSE-MsgGUID: Z4+yYgAXSh2epHBup6/G9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="275689936"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 13:43:07 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 13:43:05 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 11 May 2026 13:43:05 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.57) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 13:43:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PCRt8XsedCiVH5hAtotXkLKnAwMb5/dKMjosb7eoM5W7qSb5so4p0fzZ6fSU9eKieXjCVcQd9xQ6PFuUFIPDdugYwl6Kodbs4HN/LRTXXjp3fX3YixhRseWejuFruSCLTcZFTklW2H7KF7pf/gEXM+hJhNmeYcj7ms/rTNNyBDL7ArvlMZ3S+GhZxk2L9e3RhlBK6WDBQmFOYHPkhrI51BQWGSs007Po/PtTxaDCDWRLoYxap546qMzXN2wShc/lK4yHZfhPIpFr7ttrg5VHR8lo0hcSIPNCC0OkR9A3P8bAx5Q2rfFaNZuoTSLkAGeBJBYS0TJL2dHrMZvcBKy5Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3Gb5VsRca+/CQ5uZg6RIW1L96r6KzxBUqGApdCEV8Y=;
 b=W2SW2OeDIyy4GEbf1PQjyRsJPZJ+CKxlap/YQ7sFqoJzbO/sIc9wK1vzJYx6d1dCLvys68LdabgEHEqXNddk/u8/Qvw0RHI2qlMLGO/mZ+IS3lkvmyuUEIsAhoc3WCSWYQAJsHkQTFS4GL0nYrCpfVEiDH7CartEYsZqSp5OJfczFHwEDJFYaaZjx/wZvFMdeXWTcvp2+MIU9bI15UMhouUYcwmN2vdjZXhTE5JH9lJLxgiDqUYw3Vz40kD0KF6YwDjBy8a09BV6UQIDXGIzbabAPPugHzleWJ6GsYKeKsOTzlCe+RyqNcgJiAzcCYz33Vdb/vHfmcIpTV0YAIVWcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA1PR11MB6918.namprd11.prod.outlook.com (2603:10b6:806:2bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.16; Mon, 11 May
 2026 20:43:01 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%4]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 20:43:01 +0000
Date: Mon, 11 May 2026 13:42:59 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 0/4] More MERTOA WA's
Message-ID: <agI/U8qNKU6Qlo+I@soc-5CG1426VCC.clients.intel.com>
References: <20260430161459.2892545-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260430161459.2892545-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0341.namprd04.prod.outlook.com
 (2603:10b6:303:8a::16) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA1PR11MB6918:EE_
X-MS-Office365-Filtering-Correlation-Id: a0eb6faa-5630-41a5-d9c2-08deaf9de46f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|11063799003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: Tvoq4Gh5kiDPibQdTzC7hkdVDI3lpXQMQbu3l6nuECNAcy4iZO9MCkPFd1Q4epRTeQaYCAGKH2pwzcOyftBUN372J+TsUVVTspNroyZFn09IQyjpXwJ2llQNAUWRdFKMseQKb0mSZwi7NynTCp+tmnkevrPSnlyzuPGC9wzwQzzjcz3iS8cuLPqKw0oGS18KV4bGOgD3MXFNQeEht/hBZxi/Kow/8zWEdVd+ZRBP5s6rJ/qVKYOT/OV8MDkZ+0Ff/9zgjheht3r/3vqFPUb0eYQ18gNU1Xfg1PzpI+3meuOSt62TAEADjs4wmS4eJUaF5C3102cUDYoG9e2Mz5aeooONHraF4NiDkGt5pkMM6ROKIM4WuJFraIS7JlRuZQKfCHACljvehCz37ownFu8J7HTqEEBjGollAAcucKx61xDktyNa/Pa2KlOUR6GEaVlRaOYtnevXwhMyuFaVtV/4PReRcYy+NdV1RvJHsJBbdx/0sX8cDFhjRzfnDaLAdsXbJNTEYFJYPaAS/kQ6kDcJG+w1pNGAmPZWIY5INe9zu5+ij5kHJBpKWJfADSA51fHYsOQKVD7lfJNOEv18GlEvHcQ12brCOL5rdh3JPUewHmVhu2WHTkFdowtkF+OFmsjYS4RheiI0tSbicIKwwf3b92jQy+NL7zff6qP7OfnVJI4pwa9cIAEYly+k9Y/H0vDx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(11063799003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUNwWFdsL2pDY2JySXhjNHpxSURYT0lkN1RBUWJPTFg0NVF4Vi9mY1V0Nm1B?=
 =?utf-8?B?TDU2VVpCNFlvRCtoNnpWcHUycVNXbkREQTFZVm9ML1YzL3ErOTBoQVVzbWxz?=
 =?utf-8?B?L01zNTdIc2liYlpMQjUrZXExTUxJT1g1M3hodWI2WTBSekJYUm92OEJITW0r?=
 =?utf-8?B?WmZzazdwbTVKYU1WTFdhNGh2SUE5V0ZUbzZ2Ti8rTzU5RFJ1VXdiMDhHVVZZ?=
 =?utf-8?B?UlJhNndpN0ZreUgwS1pGRFFtMFZSck95UEhuVE1VM3RRbFJKc2RKeXVoaFJK?=
 =?utf-8?B?K0FkWjNsRjZxODRKNEk0SEFORGwxVWpYT2lZQlpMa1V4YkQ4NlRRZldkVURq?=
 =?utf-8?B?Tjc1Y2pDLzMyTjdlMjZIaFJFN1JZV2NVQVExWE5nV2w1azltU0J6MHhBYVNG?=
 =?utf-8?B?SFZFYXBSaVpsZVNOSmtlZlplRjhHV0k0MFhNMnNpSW1BQThMQnQ4R2ZTWVlO?=
 =?utf-8?B?b05qV1FtUURWR2RINGxYL3RueUhTNmswcFE5WGkrc084Mld6clhoVW5NSmpN?=
 =?utf-8?B?L3dMWGI2Tzc2SDFyUjc4SmZNOFo5dnRZTmNNYWY2Tyt4WkZkdGtNTTZpbks5?=
 =?utf-8?B?bmFWelhpNExhSHBacmorV280VWFYc0Jqd1hoa3pmazY5U1VucTU4NmMwQVdU?=
 =?utf-8?B?SkwzMHMwTkY1cThoM0crR0xleU1TYlpmcmZDVFlsMm9IOHdiOERrVVpXRlRi?=
 =?utf-8?B?eGpNdXZYSHBIUkdPVy85QzlRN1VzUlpubFhpZFNaeTVHZ0VlUDRIeFpKRk1R?=
 =?utf-8?B?SlpYV2hkK3pHOUkyTDFiVlhQOUEzMjcvamJLbzQvZm1WNE1FRWNpUDZhblph?=
 =?utf-8?B?YWZIQjVFbEgwNGlVeXN4Y05la3R0UmRWckpNSDJDYW04TmlNOTZsekI1am4y?=
 =?utf-8?B?MUprdEJNYkZ1NmtGbkdoMlczSU1vUU5xMjRFUkNTRmUvVHFtZG1adkU0VVZ2?=
 =?utf-8?B?ZFl2K3V4b1VIby9GRHQwRENtYjZoR05LZ3ZMYjJkMGlrc3Zrekt5TkNMUnJK?=
 =?utf-8?B?RENkSFpuWUxrVWZ6a0VMdXZCd01aNStjZ0hVa3JUQlFzNHdmaFFmZkhDZmNx?=
 =?utf-8?B?bU1YbTRWUXZsN2o4bWx5VWRVUzlQbklUVGFVVk1FZ2xsNlJudGFrQXNqU3NT?=
 =?utf-8?B?TUNlWmtQRFEzMmUySkpVRWUraWdRRXZBRXJpZWVLV3k3di9Qb3dTbFhrQlFa?=
 =?utf-8?B?QlJtbWxmZE1YMGpnZEY1RFZXWHF3QTlxN3NUMDdQNHh0M2pEN0ZudGUwNkhW?=
 =?utf-8?B?dWFMSHcwbWtGM0laVjREb1NOK0Z3WkdhUEViVkdFUWhQTVJabDFmM3dTOHNS?=
 =?utf-8?B?Um5CRmxDVWtQdmExNjlBa1lBeWdxcnhvMDRDYVB0eHN5aVJHRTVLeTgzVkVQ?=
 =?utf-8?B?Wnd3dHZOcDA5eFJnOURoTllhcXF6eW0wc3lQODVTYTVpU2NMaGx4VXpCclRl?=
 =?utf-8?B?eGlqNmFxM2JyMmg4YXVwZytFZE5QUXNNY1Mrb013VklXU0lGMGxXamxLalMr?=
 =?utf-8?B?UnBkSjdiclpkUTdiTnkyWi9RL1B6VUR2T2NGSTNweUVXVk0zdkVrb0F3L2pa?=
 =?utf-8?B?aXlqL3FHSkE2NVNscUdUZHM2Z3BDbTBpNTNhTkJ4YnFjUG4zc3hlNEt0cER5?=
 =?utf-8?B?Sk1mWkRHem5IOTNXS1k0ZkdWOXVuMjVUTGNSUHRkT1FnaWtIVkJNbkZwMXM1?=
 =?utf-8?B?TWh2QTZ0U3ZkSFo2ZUllQ0hVbGN6aHBvb2dNWVBKaElxK25qOEtwQW0vNC9Y?=
 =?utf-8?B?VkNITUxDem9KZ1l4STJNamZZbVVYc0kxRWU4Rnl3a0dCejVlZm53VkpBK1RE?=
 =?utf-8?B?TFhqUUk0bzJXMmdIekI2aWp5aDRGU3ZobG1PRFF3UFpvd2o1TGpUa1VYZ2NW?=
 =?utf-8?B?bndNL2djbzZ3VDFnN3ZWQ3c2K0hjVitDaHRUelB2SFlsbWY4YUNCS2FIazJ1?=
 =?utf-8?B?L0xWZjhwTEkwOUtZK083eWtHbVNZVncraEpNNVVKUVNxNE5aL0VnRVp6SUNS?=
 =?utf-8?B?ZTlpN1RmKzlBN1lMS3pDeFB0dUhvN1FzZVlYMjhFZG5GdG5icVRzY3BkZnBw?=
 =?utf-8?B?QUt5ZE5Od3ZTVW43MjR3SkN4WmJaZjdJWDIwQnpMcVdOcGpWMjlGTVFCNUdj?=
 =?utf-8?B?dWZWY0czOEZLUURoZFpxL2ZwSHJJa2E5VFR5eUNWV254bS8yYjExYi90Y0to?=
 =?utf-8?B?ZWYvZU1xTVloZzUxbUp4YlZqK0dYcGxGNVR4bUR3QkdGUFQzV3NZMDA2SlVo?=
 =?utf-8?B?UjlFZXdOYTB0SXB6S1ZXaGpNYUdFTVRXMW8rdXhOQTA0eHl3MXpvSTVITm5J?=
 =?utf-8?B?d1VSK1J3cVZUMERHbkdoRzBNeVlEbitEZ3lLVlFMZ09DZVZMYVBzaEJIbit0?=
 =?utf-8?Q?oU7ITJFImsKyjIFdKZeIFzu7WWRxLVOGYNlhj?=
X-Exchange-RoutingPolicyChecked: iuqnmge2j7LbuLXXzw2kbU0WK41VsLBw6eoLuaCFAz3CoqC3dfZz6LCe+7RHL2ugM5VdtkQL+u9+8WW5Np1TVdqVYQeG6e0kTKpSnTQLv5SObGB9vEv2/VPP9ee9LjVWUhOR+XQcQbn/+vx0ZuIseNoi2s3gkdtfp8hitKfd9RcCZs5RkLcFPe0C1TcBt3QPXJ3ZiwomwjOKq18JGRLvMr7b4hnKvieb66BKsxveXWtJt/Ouwkp6v/xbh27mPrrwEGhsAgXbYhMCbBkjkmvsUHFwXvmsHi5+GnoeNPyVlaiUznb4YKoZPFyc6WzIiQbj+IFHqTCmPxKkL4DqtXeZjA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a0eb6faa-5630-41a5-d9c2-08deaf9de46f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 20:43:01.2329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X6hM1vsyVWVPgmfrT6bWwL4AIxoVxUYM6m3tBv32bzU65R2IEOitt/xVSiG/O2R3k4GzHyfhn27gY86TTPB+U+usvraJSoy4BQ5XuC9LvuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6918
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

Hi Ashutosh,

The WA states need to be updated. With that, the series is

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh

On Thu, Apr 30, 2026 at 09:14:55AM -0700, Ashutosh Dixit wrote:
>Ashutosh Dixit (4):
>  drm/xe/oa: Refactor oa_unit_supports_oa_format
>  drm/xe/oa: MERTOA Wa_14026746987
>  drm/xe/oa: Add val arg to xe_oa_is_valid_config_reg
>  drm/xe/oa: MERTOA Wa_14026779378
>
> drivers/gpu/drm/xe/regs/xe_oa_regs.h      |  3 ++
> drivers/gpu/drm/xe/xe_device_wa_oob.rules |  2 ++
> drivers/gpu/drm/xe/xe_oa.c                | 40 ++++++++++++++---------
> 3 files changed, 29 insertions(+), 16 deletions(-)
>
>-- 
>2.54.0
>
