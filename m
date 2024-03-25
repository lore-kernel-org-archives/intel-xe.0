Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129DCC54E64
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 21:17:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37BA10E9E8;
	Mon, 25 Mar 2024 21:17:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wgakc4QW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F41610E9E8
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 21:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711401435; x=1742937435;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CcCsB2jQRjX1KApGYHKKlKUQ0g7doHxyj2TpU7iLhi0=;
 b=Wgakc4QWR9OmnLYeRpAgbx0cQloHhud6YAeVRgBIWuhRbBRlteXg6Fiu
 q2/WQcBUMAznKbhQjxzMG6FZoS+UbVb4o3G0CAACBv0Lafz+xKXZprRrW
 qEXyXGIQQvU7Z3uSZaeNoVJVoPV3e3JaqYpJutGE478gZdZbMWHbOFP24
 R6lJVAaqIctf2MEnRx129vuqQAaV5FxmkNDEhCnFGNMvqltoNsrphnAF6
 I2tZS9Iy9ET6agX0LYtTlj4RXNOpHu/uXxZG6E/VhVMy4QJ1K/U31jhR5
 giyMCgxt9EQWooA+bKzyN1a1RqaZ7gksXCcI9LWK9YKgkkfE+FuPZ2IEq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="17569397"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="17569397"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 14:17:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="20401525"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 14:17:13 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 14:17:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 14:17:13 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 14:17:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kDWDg0UmFmm03PioRROMYacTQyaKjC7wORAXTZkzXylrj13qKQ/IuhnQ2GaTLkK++qMLvi4dMcWgMbwAmt5exDb83YFpv45P5sOvvIofO3zCw8zhNlpOWiY0usXGelNjzaAjuQF2om9x2MLvThu3oC23xw0vwrBYKt4pTayUo04UKeWAPbiBjN9Z1mnwwKR8le2UtdHXe7XnUVMoFRQQiHYH4bauxFb3BLfwj6vOYSMqamdYkUWqFSXkhC0GAPlXbYGEGjkKhoJ+2MOqPgvgEDg45cqbNBe4ewpld9e6dEalY9BSBi6MKDaiaifFpiGfqyNCctNJtFJH+FyFnD7Q7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FsbP9Zs8RWiDNucLFpNb8SmUP0efOBOuXndr+uHKfrQ=;
 b=MklanJq0kCzXF5MBdYTXf6uEPdJFI+MjRxFNPbawWV9FvVZFSu3yYXkJ4jwo3dr9I1IV0zrWyL7gbUMPSU2hOcs2iTBHfiMYCFP0LIHZ3Jc2REWG6/E+A78NfVKox4uFHVOnsTEHAw/vE3SCTXyzR0r4++cRegnRRPmUxTPY4pTGN4BNU+mxqcbVwf5FDnOv9hWd4VdAaBKMD5bBYTyxSaAYjTfgp4A+f1X0BihGiMsEh2E3/cnEj0Xtunc+Lwwd083qG7tD9TCMGd7KQDYXsbLmrrXScsn1ZWsIy5gwB7YpT6jX1oWWZCfgDKMJqa7a72K3TSfT6pH6iDI2hpUPQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Mon, 25 Mar
 2024 21:17:11 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::8778:d67d:55f9:f68a]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::8778:d67d:55f9:f68a%7]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 21:17:11 +0000
Message-ID: <4c208572-2d94-4946-a798-40037caa65da@intel.com>
Date: Mon, 25 Mar 2024 17:17:07 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe: Add INSTDONE registers to devcoredump
Content-Language: en-US
To: =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
References: <20240325190643.150648-1-jose.souza@intel.com>
 <20240325190643.150648-3-jose.souza@intel.com>
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20240325190643.150648-3-jose.souza@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0045.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::20) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SA3PR11MB8118:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aJTZBqJXaxIjWBcTDxdwljhERXUafGpWNzrw3C7JMLt/T3kzxQme2Dh8eVjJYFjndbLOvM7hdrm+iRnwqMbgKbsQczpyrMv4PBfs2TpiRwMMMDYNd9f3yS+uncOkdxTxc+BHHiHjeBGEnYuEIQID3+apVKqUgj6pBMobU8RSqD/+8YmgEKbAI0+Padmc5jG4EwtmgezbR/0GeRXzCueAmIusTWMGTEy/gwPARtIrQdD2pqNgBtncXm4rTDedKtnPTX+Vp8N1nY4DL8Ai4mWjJKt51dC5JIorY7HJzP+jPO4B9sRyL6dBuy4xX+/MlCTH33jSbFlxk8hKmFabtsCpRtUYxf2HVB2QQynTdanVQBhqkSW4+Bvok7cZ8fuSy7hYQm5EYxflFkXqM4RNeU9DIBjqCKUpmcYIEqPnv2b684uvkPvEvUk/UZ5PX7P+8OqEHPIS5laH8rCmWE8I12o2QRFGR2+Zrl/GiomPr3wz6Ogk+kWjc8afN2UwalX2xNaYCqS2Nh+ALWMDbW7tGRsqjJCbrZbzr+UGN86Fs5o2q/8KKGwBRRL2vfPal7+xtEsrAa7DlPIakgGRx+SFChrPJiEzmJNu2i3JYj7OJTbugbF2tBmspxmaWzWqBH9hFTroO/dlRVw+MmNNDcni7mpZZNsI8zfugNVbuvJXyoEd+tk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tytwd2ZkQ2pNbHJkdmdaWkVQSGxvTitWOWlQZFFBUkVrbE1iUjFRbTlvbWQ5?=
 =?utf-8?B?aWxFTmRYZlRtUy9heHN1RVQ0MUJtZHBOZjZQVUNyN0NFd2tSTHpTZmcyRWc2?=
 =?utf-8?B?ck82MFNyeWZscmRWTmhIYldLeC9XcGxJWnRWRkJEVmR3WjVaS1pJN1V1U0N4?=
 =?utf-8?B?NmlaRmh0L0tZSklFVk05T3BTcHdSSU1GTTVSQWVScFBVZTl1WVVmbno2VjBo?=
 =?utf-8?B?aUxnaVpaMkE2TkprQmpudURGL1BPcVhTaEk5MzdWZVVIN0ErT0xrcVF2TGV4?=
 =?utf-8?B?T0JOWWNKZHVBcWY4QW9EV3Nhclp1TFY3bjR0MlFuNWg4S0dQRVRXcnIyeEpr?=
 =?utf-8?B?bTFkOFBnVzQrVitQVTU5NGo3RnpaTzU3OFQ4L0hVS0lnUTVpeU5tcW9FL1BY?=
 =?utf-8?B?R3d1ZC9MQ2tiK2grRm9hYzZ4VlpMZDBuMm14eGh2SnhxajBCZEJhT3BOS0Vq?=
 =?utf-8?B?Nm4vNzlKcHlkV29SR3NxeGJKb2ZDR21ReXd6R0lvSHN0RTBSOW9FbStPRmwv?=
 =?utf-8?B?NWtnTXgrYk9HVjI3dEFiTXFXZjlleGFGVXkrbjM0MWQ3MUpTcVF2NkhZVllp?=
 =?utf-8?B?ZVc0NE9tU2tySDJkUjA4ZkNROG9TUDVWdStKSWNyOFJmZDJwOUdSa2tCNkNC?=
 =?utf-8?B?Q2laRWZySUVKelhqZUNYOWR0V0JuK0JMVjN0bkdPbXlrWEF3RkZGTmxxY1dB?=
 =?utf-8?B?RHcyNGMwaW9HZU5zcWMzaFJFcDcwdUxDbkc3SWRBM1l3UDlQd0tNVGZaQlJm?=
 =?utf-8?B?dXZFZFhTdVFXekw4K2JGZlZUbFhYRHgxSTV5Ry8xc1V0SVpQRzZHNFJDNEw2?=
 =?utf-8?B?eUZSYVRHQVpEWjBQWlVISzA2YkN1azdsaFIzcVo5VnhQU1M1cVlZUHA2NU9C?=
 =?utf-8?B?ZFE0TVBuNnpkdzVidlZqTFhHV3JHaStTU3NWOUU1WVJ3Q0tKM015Q08yZi9R?=
 =?utf-8?B?eVQxQ2JVSDhKMUVwZ2tjbmVMWWRrd1lISk5tVW4zVnI4c3d2RDAxRXp4MWdT?=
 =?utf-8?B?SGFSWXpWaFRScnM2U0RxV0FrRHdzdnk0M1M4aVVlK0pNenpVVEJiRGRCSWt5?=
 =?utf-8?B?T3lTb1YxN3J1ZEV0UVNkdzlrRVZlOVdCTml5RDRuZjJQMTNUMHVvbXFtbUZK?=
 =?utf-8?B?VEs4OHd0U29kcGhNRlB1d3RQZDc2M3FEUGlZMDlFMnNrYi9KRitHQ24wRU8z?=
 =?utf-8?B?OWUvdHZsYlNkVlY5dGYxZ2FSTGlkSjZOSVhrL2hYVTgvTGZwdDd4VU5MWmJN?=
 =?utf-8?B?RTRWZEliMzkxUU53TWx6WUNPMmdWUnEwUE5zajI5WHF2MW1Zak1vMXhnSm5q?=
 =?utf-8?B?Ynd3R1gzUFg4QnJnMVMxVjRvR1RaSFM4SnBjeWhWVnI0OVJRSEJHMTlzRmU1?=
 =?utf-8?B?SU1WSW16VVoxbjRvK09RdFR3MnRtcHhySGZlOXhVYlVVejBvTVVwUUlXRWhX?=
 =?utf-8?B?QzYrWDJHejBZOVBveERIam9Hdkx0eFJobHNhamY0amFtVG5LMUVZbVBPRklB?=
 =?utf-8?B?UEdnMWFJZW1kOHJ6ZC9KRWlUTEdkYnAvbDVoVXhkK0x2a3I1bERYRnRWRVRV?=
 =?utf-8?B?QlVtd0c4a3Z6SlZIRXozTFpDblY1T2d3OGJWV0hKR1NFRjhvQkJRRjZlT1BG?=
 =?utf-8?B?Ri8weE95TlJwUEtBVDZZOHIxUC9sVERDQkpaMjRLNWdDYVNmdndZbkV4VUdQ?=
 =?utf-8?B?RVRzUDRXeXE0dTFjWEJoUEZaK0pQb3Fvd0puWkJSeVljU3pJMlMzMW9Wc1lQ?=
 =?utf-8?B?UXJUL3A4QlhJeENXVXlEMzFXemVJa20wZHRjUzFwRHJUL2J0SVVSNURHK0tI?=
 =?utf-8?B?VW9wSk9qZXpwZFhpTjJaK3VNQXdGczcvZUlRRWVNdzRqandqQUozWFUxcldv?=
 =?utf-8?B?V2RtREFGaWllOG10WnFGTXRqTURpV09EdGlDQWY1WXRLSXQzbHdYdVowWVda?=
 =?utf-8?B?SlpNSGpMRExOblc4MkttWTk1UUt2MmZkMTdsN2VaK1o0MFZ2V3RJSjkzNlpN?=
 =?utf-8?B?dHBRSy9QaVYwajZzbGNuaXVzbFUyc09ZK1U5OXcxNDAzUHJNTnQyNG10QWth?=
 =?utf-8?B?YWlicDBNUm1UcE9GRmZZSmh3Y0NPZ0x6Z2R3emJnU2ltRW9mYzE1TUhPVmZF?=
 =?utf-8?B?ZWVrbHhBa1Eyd1R0cWFXaERLOHVOcmVUMTBIclUzL0Fhc3BrUU5mWWM1QitY?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c38efcd-be9e-45fe-1647-08dc4d10ef57
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 21:17:11.1863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iTgnA2mD6iqA7oB1QMDBkrUk61VSzo5vP51k6b3/fAX8Tp8noxD99u9Dw14vv65dvUZbvcqL4DuVed6VJ1sL2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8118
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

See my comments inline below.

Regards,
Zhanjun Dong

On 2024-03-25 3:06 p.m., José Roberto de Souza wrote:
> This registers contains important information that can help with debug
> of GPU hangs.
> 
> While at it also fixing the double line jump at the end of engine
> registers for CCS engines.
> 
> v2:
> - print other INSTDONE registers
> 
> v3:
> - add for_each_geometry/compute_dss()
> 
> v4:
> - print one slice_common_instdone per glice in DG2+
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Zhanjun Dong <zhanjun.dong@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_engine_regs.h |   1 +
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  13 +++
>   drivers/gpu/drm/xe/xe_hw_engine.c        | 128 +++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_hw_engine_types.h  |  16 +++
>   4 files changed, 158 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index a08528d9c76b2..98d830013e96b 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -65,6 +65,7 @@
>   #define RING_ACTHD_UDW(base)			XE_REG((base) + 0x5c)
>   #define RING_DMA_FADD_UDW(base)			XE_REG((base) + 0x60)
>   #define RING_IPEHR(base)			XE_REG((base) + 0x68)
> +#define RING_INSTDONE(base)			XE_REG((base) + 0x6c)
>   #define RING_ACTHD(base)			XE_REG((base) + 0x74)
>   #define RING_DMA_FADD(base)			XE_REG((base) + 0x78)
>   #define RING_HWS_PGA(base)			XE_REG((base) + 0x80)
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 65af9fe95db5b..8bef88d6ab4e2 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -94,6 +94,8 @@
>   #define   FF_MODE2_TDS_TIMER_MASK		REG_GENMASK(23, 16)
>   #define   FF_MODE2_TDS_TIMER_128		REG_FIELD_PREP(FF_MODE2_TDS_TIMER_MASK, 4)
>   
> +#define DG2_INSTDONE_GEOM_SVGUNIT		XE_REG_MCR(0x666c)
> +
>   #define CACHE_MODE_1				XE_REG(0x7004, XE_REG_OPTION_MASKED)
>   #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
>   
> @@ -110,6 +112,14 @@
>   #define   FLSH_IGNORES_PSD			REG_BIT(10)
>   #define   FD_END_COLLECT			REG_BIT(5)
>   
> +#define SC_INSTDONE				XE_REG(0x7100)
> +#define SC_INSTDONE_EXTRA			XE_REG(0x7104)
> +#define SC_INSTDONE_EXTRA2			XE_REG(0x7108)
> +
> +#define DG2_SC_INSTDONE				XE_REG_MCR(0x7100)
> +#define DG2_SC_INSTDONE_EXTRA			XE_REG_MCR(0x7104)
> +#define DG2_SC_INSTDONE_EXTRA2			XE_REG_MCR(0x7108)
> +
>   #define COMMON_SLICE_CHICKEN4			XE_REG(0x7300, XE_REG_OPTION_MASKED)
>   #define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
>   
> @@ -326,6 +336,9 @@
>   #define HALF_SLICE_CHICKEN5			XE_REG_MCR(0xe188, XE_REG_OPTION_MASKED)
>   #define   DISABLE_SAMPLE_G_PERFORMANCE		REG_BIT(0)
>   
> +#define SAMPLER_INSTDONE			XE_REG_MCR(0xe160)
> +#define ROW_INSTDONE				XE_REG_MCR(0xe164)
> +
>   #define SAMPLER_MODE				XE_REG_MCR(0xe18c, XE_REG_OPTION_MASKED)
>   #define   ENABLE_SMALLPL			REG_BIT(15)
>   #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 6e75803c963ae..0720f779fa574 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -18,6 +18,7 @@
>   #include "xe_gt.h"
>   #include "xe_gt_ccs_mode.h"
>   #include "xe_gt_printk.h"
> +#include "xe_gt_mcr.h"
>   #include "xe_gt_topology.h"
>   #include "xe_hw_fence.h"
>   #include "xe_irq.h"
> @@ -770,6 +771,57 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
>   		xe_hw_fence_irq_run(hwe->fence_irq);
>   }
>   
> +static bool
> +is_slice_common_per_gslice(struct xe_device *xe)
> +{
> +	return GRAPHICS_VERx100(xe) >= 1255;
> +}
> +
> +static void
> +xe_he_engine_snapshot_instdone_capture(struct xe_hw_engine *hwe,
> +				       struct xe_hw_engine_snapshot *snapshot)
> +{
> +	struct xe_gt *gt = hwe->gt;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int dss;
> +	u16 group, instance;
> +
> +	snapshot->reg.instdone.ring = hw_engine_mmio_read32(hwe, RING_INSTDONE(0));
> +
> +	if (snapshot->hwe->class != XE_ENGINE_CLASS_RENDER)
> +		return;
> +
> +	if (is_slice_common_per_gslice(xe) == false) {
> +		snapshot->reg.instdone.slice_common[0] =
> +			xe_mmio_read32(gt, SC_INSTDONE);
> +		snapshot->reg.instdone.slice_common_extra[0] =
> +			xe_mmio_read32(gt, SC_INSTDONE_EXTRA);
> +		snapshot->reg.instdone.slice_common_extra2[0] =
> +			xe_mmio_read32(gt, SC_INSTDONE_EXTRA2);
> +	} else {
> +		for_each_geometry_dss(dss, gt, group, instance) {
> +			snapshot->reg.instdone.slice_common[dss] =
> +				xe_gt_mcr_unicast_read(gt, DG2_SC_INSTDONE, group, instance);
> +			snapshot->reg.instdone.slice_common_extra[dss] =
> +				xe_gt_mcr_unicast_read(gt, DG2_SC_INSTDONE_EXTRA, group, instance);
> +			snapshot->reg.instdone.slice_common_extra2[dss] =
> +				xe_gt_mcr_unicast_read(gt, DG2_SC_INSTDONE_EXTRA2, group, instance);
> +		}
> +	}
> +
> +	for_each_geometry_dss(dss, gt, group, instance) {
> +		snapshot->reg.instdone.sampler[dss] =
> +			xe_gt_mcr_unicast_read(gt, SAMPLER_INSTDONE, group, instance);
> +		snapshot->reg.instdone.row[dss] =
> +			xe_gt_mcr_unicast_read(gt, ROW_INSTDONE, group, instance);
> +
> +		if (GRAPHICS_VERx100(xe) >= 1255)
> +			snapshot->reg.instdone.geom_svg[dss] =
> +				xe_gt_mcr_unicast_read(gt, DG2_INSTDONE_GEOM_SVGUNIT,
> +						       group, instance);
> +	}
> +}
> +
>   /**
>    * xe_hw_engine_snapshot_capture - Take a quick snapshot of the HW Engine.
>    * @hwe: Xe HW Engine.
> @@ -784,6 +836,7 @@ struct xe_hw_engine_snapshot *
>   xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>   {
>   	struct xe_hw_engine_snapshot *snapshot;
> +	size_t len;
>   	u64 val;
>   
>   	if (!xe_hw_engine_is_valid(hwe))
> @@ -794,6 +847,28 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>   	if (!snapshot)
>   		return NULL;
>   
> +	/* Because XE_MAX_DSS_FUSE_BITS is defined in xe_gt_types.h and it
> +	 * includes xe_hw_engine_types.h the length of this 3 registers can't be
> +	 * set in struct xe_hw_engine_snapshot, so here doing additional
> +	 * allocations.
> +	 */
> +	len = (XE_MAX_DSS_FUSE_BITS * sizeof(u32));
> +	snapshot->reg.instdone.slice_common = kzalloc(len, GFP_ATOMIC);

Can we move XE_MAX_DSS_FUSE_BITS to a .h like "xe_reg_sr_types.h"? Might 
need Matthew to comment on this.

then we can avoid dynamic mem allocation and define it like:

u32 slice_common[XE_MAX_DSS_FUSE_BITS / sizeof(u32)];

Beaware that I guess you define the u32 arrary to hold 
XE_MAX_DSS_FUSE_BITS bit info, then it might be:

	XE_MAX_DSS_FUSE_BITS / sizeof(u32)
rather than:
	XE_MAX_DSS_FUSE_BITS * sizeof(u32)


> +	snapshot->reg.instdone.slice_common_extra = kzalloc(len, GFP_ATOMIC);
> +	snapshot->reg.instdone.slice_common_extra2 = kzalloc(len, GFP_ATOMIC);
> +	snapshot->reg.instdone.sampler = kzalloc(len, GFP_ATOMIC);
> +	snapshot->reg.instdone.row = kzalloc(len, GFP_ATOMIC);
> +	snapshot->reg.instdone.geom_svg = kzalloc(len, GFP_ATOMIC);
> +	if (!snapshot->reg.instdone.slice_common ||
> +	    !snapshot->reg.instdone.slice_common_extra ||
> +	    !snapshot->reg.instdone.slice_common_extra2 ||
> +	    !snapshot->reg.instdone.sampler ||
> +	    !snapshot->reg.instdone.row ||
> +	    !snapshot->reg.instdone.geom_svg) {
> +		xe_hw_engine_snapshot_free(snapshot);
> +		return NULL;
> +	}
> +
>   	snapshot->name = kstrdup(hwe->name, GFP_ATOMIC);
>   	snapshot->hwe = hwe;
>   	snapshot->logical_instance = hwe->logical_instance;
> @@ -845,6 +920,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>   	snapshot->reg.ring_emr = hw_engine_mmio_read32(hwe, RING_EMR(0));
>   	snapshot->reg.ring_eir = hw_engine_mmio_read32(hwe, RING_EIR(0));
>   	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, RING_IPEHR(0));
> +	xe_he_engine_snapshot_instdone_capture(hwe, snapshot);
>   
>   	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
>   		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
> @@ -852,6 +928,49 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>   	return snapshot;
>   }
>   
> +static void
> +xe_hw_engine_snapshot_instdone_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p)
> +{
> +	struct xe_gt *gt = snapshot->hwe->gt;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u16 group, instance;
> +	unsigned int dss;
> +
> +	drm_printf(p, "\tRING_INSTDONE: 0x%08x\n", snapshot->reg.instdone.ring);
> +
> +	if (snapshot->hwe->class != XE_ENGINE_CLASS_RENDER)
> +		return;
> +
> +	if (is_slice_common_per_gslice(xe) == false) {
> +		drm_printf(p, "\tSC_INSTDONE[0]: 0x%08x\n",
> +			   snapshot->reg.instdone.slice_common[0]);
> +		drm_printf(p, "\tSC_INSTDONE_EXTRA[0]: 0x%08x\n",
> +			   snapshot->reg.instdone.slice_common_extra[0]);
> +		drm_printf(p, "\tSC_INSTDONE_EXTRA2[0]: 0x%08x\n",
> +			   snapshot->reg.instdone.slice_common_extra2[0]);
> +	} else {
> +		for_each_geometry_dss(dss, gt, group, instance) {
> +			drm_printf(p, "\tSC_INSTDONE[%u]: 0x%08x\n", dss,
> +				   snapshot->reg.instdone.slice_common[dss]);
> +			drm_printf(p, "\tSC_INSTDONE_EXTRA[%u]: 0x%08x\n", dss,
> +				   snapshot->reg.instdone.slice_common_extra[dss]);
> +			drm_printf(p, "\tSC_INSTDONE_EXTRA2[%u]: 0x%08x\n", dss,
> +				   snapshot->reg.instdone.slice_common_extra2[dss]);
> +		}
> +	}
> +
> +	for_each_geometry_dss(dss, gt, group, instance) {
> +		drm_printf(p, "\tSAMPLER_INSTDONE[%u]: 0x%08x\n", dss,
> +			   snapshot->reg.instdone.sampler[dss]);
> +		drm_printf(p, "\tROW_INSTDONE[%u]: 0x%08x\n", dss,
> +			   snapshot->reg.instdone.row[dss]);
> +
> +		if (GRAPHICS_VERx100(xe) >= 1255)
> +			drm_printf(p, "\tINSTDONE_GEOM_SVGUNIT[%u]: 0x%08x\n",
> +				   dss, snapshot->reg.instdone.geom_svg[dss]);
> +	}
> +}
> +
>   /**
>    * xe_hw_engine_snapshot_print - Print out a given Xe HW Engine snapshot.
>    * @snapshot: Xe HW Engine snapshot object.
> @@ -891,9 +1010,12 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
>   	drm_printf(p, "\tBBADDR: 0x%016llx\n", snapshot->reg.ring_bbaddr);
>   	drm_printf(p, "\tDMA_FADDR: 0x%016llx\n", snapshot->reg.ring_dma_fadd);
>   	drm_printf(p, "\tIPEHR: 0x%08x\n", snapshot->reg.ipehr);
> +	xe_hw_engine_snapshot_instdone_print(snapshot, p);
> +
>   	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
>   		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
>   			   snapshot->reg.rcu_mode);
> +	drm_puts(p, "\n");
>   }
>   
>   /**
> @@ -908,6 +1030,12 @@ void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot)
>   	if (!snapshot)
>   		return;
>   
> +	kfree(snapshot->reg.instdone.slice_common);
> +	kfree(snapshot->reg.instdone.slice_common_extra);
> +	kfree(snapshot->reg.instdone.slice_common_extra2);
> +	kfree(snapshot->reg.instdone.sampler);
> +	kfree(snapshot->reg.instdone.row);
> +	kfree(snapshot->reg.instdone.geom_svg);
>   	kfree(snapshot->name);
>   	kfree(snapshot);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index 27deaa31efd31..9f9755e31b9fe 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -211,6 +211,22 @@ struct xe_hw_engine_snapshot {
>   		u32 ipehr;
>   		/** @reg.rcu_mode: RCU_MODE */
>   		u32 rcu_mode;
> +		struct {
> +			/** @reg.instdone.ring: RING_INSTDONE */
> +			u32 ring;
> +			/** @reg.instdone.slice_common: SC_INSTDONE */
> +			u32 *slice_common;
> +			/** @reg.instdone.slice_common_extra: SC_INSTDONE_EXTRA */
> +			u32 *slice_common_extra;
> +			/** @reg.instdone.slice_common_extra2: SC_INSTDONE_EXTRA2 */
> +			u32 *slice_common_extra2;
> +			/** @reg.instdone.sampler: SAMPLER_INSTDONE */
> +			u32 *sampler;
> +			/** @reg.instdone.row: ROW_INSTDONE */
> +			u32 *row;
> +			/** @reg.instdone.geom_svg: INSTDONE_GEOM_SVGUNIT */
> +			u32 *geom_svg;
> +		} instdone;
>   	} reg;
>   };
>   
