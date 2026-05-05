Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9146CD3427
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 12:47:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B97F10E420;
	Tue,  5 May 2026 12:47:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X6c+Ry0Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E8010E420
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 12:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777985228; x=1809521228;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=NP8J5zVfz1oULU5p+5ynXpTBcphSTgijFdgL1FDQ2nk=;
 b=X6c+Ry0Y7vq3Vyu5m06y9+FlLwEjAjcy26b4+iUpCf68LechhqXvsCp/
 TI2tB71vJZvol3hsJbwtJcCCrNa6ag4KkCcgEbkKTgoyd8ww6Il3AaM7k
 /5rOSmLqyQSZdbNUhcHCOumfuEeo4OQz1inZdnfEfk8rrMIPF2sutY3HU
 o28aTQm+YCIObnLKWfzrqCA+yzVgw+OEE0H38lq339jH+a5fhbYNxynww
 QAPfEEDVjq4yVcz1brjiL3DOBZn46COlPWDnmFfz4OJxkBcIgzCGAFJoX
 Z6CiTTHm9B4X+e5IeWq2EYswwlfS1HIb1h3nmV8La7cmBbC4hk2eKp3JC A==;
X-CSE-ConnectionGUID: 8NBbQdytRKy66Snmo16YQg==
X-CSE-MsgGUID: buUd1da2TYmj43LGh6F8SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78951935"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="78951935"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 05:47:07 -0700
X-CSE-ConnectionGUID: 3+iZm93HT5mBvAN6Bv/SVQ==
X-CSE-MsgGUID: typEjauiQb2uNf+TYiFKQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="259478791"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 05:47:07 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 05:47:07 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 05:47:07 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.10) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 05:47:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dN3Soudk5C44PXt5/r0GwhH3iMJR237rsoRBGhFnNf4SdU6umKX/gPsrRz1iazFD6aMUFG+GgxbIIyojAkv0hxpa47+CSBXkdsK6oDaaOWOKO+w3DD61Y1EQD3NSzMbiGaRFE72wvaGiMk+WzoLpHG9J7La3JKS9LaDAmaLi/SjtqIXiDc8MBkHh8jlQW1bRfbFRP3Mygqqna/wLDezM+UklisrsPvZlo7aCtIbCHPbN0FCJnXZVKhBIBV/lZ7Dhsx7ty7nHS8Cq/ExyLhj9d/0eds5MWlUVgaN1oRwdQppoHiFpCNWc00TBYgtP3ij2IwKOGt//kbZlno8iCgPWig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MoEVqx73diHPOvCYkGr+TFZpmkvFfcTP0XfGPZIbJ2g=;
 b=ksxUBO/RWPClqjjbVdwJA03vqYJcz5qpli5EH6kIagY/+x8fiKcHjLNi5/CYYtatfzMObo7wSMK2jFxedjyFkXRJCWXsgoHeMkvjQzdh1Uwc2m8Hnk4UCT5BEgir6VjQcO63PPHZvh7aWIkWzpNl36KiRLSjNbq4I/JSQFpBm0VZq6tuc2M89gWtzxhFENb7RNvif7L1TYjjjziu9AjDrL9B9JSU/hvhKTTyRHLk7k071LBEC0tFKzPQd/kXJWt98PdgEjCIKgDLfZsW6agQ2w3LAABb3BdPa6Oa0JfeddXcKj63Q5JxJDXQDNUY9aU4hKK2xv+Tt3NZzuZ7R13uuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by CY8PR11MB7686.namprd11.prod.outlook.com (2603:10b6:930:70::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 12:46:59 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563%5]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 12:46:59 +0000
Message-ID: <2579fd9e-4eda-4870-a4d8-6b973bc760d3@intel.com>
Date: Tue, 5 May 2026 15:46:54 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] drm/xe/memirq: Refactor xe_memirq_hwe_handler
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260428142722.582-1-michal.wajdeczko@intel.com>
 <20260428142722.582-12-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <20260428142722.582-12-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL0P290CA0011.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::13) To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|CY8PR11MB7686:EE_
X-MS-Office365-Filtering-Correlation-Id: b9ebed4d-6611-42a4-2042-08deaaa4657e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: hvx4Kvfg660MrkI5ZoxnPrV6rKit7ZmOkINxJP59aEyhtoFqCrl05iRtGDVyuvuwtakOmFEYq0/7WvtfXvUwC5LOJYzN5lCN9aEZwWlADac1JRhrjSr0DYF1ytEoQc4t4VGAPDSp7IG3+FnkgfLGocXxAQdD2Z+5q21neN917N2PnJP1mIiomQMoQZnmCL1Ocvs8nfAdQYAPN7PBmchP3VcHl5AMAKgQC1KLdaQqE60Qx82n1qkTjeRxxglnfMs7MZDoEo6PTEN03zuh7BzVgb1YccdAAPF3JQJ6PhJypDUlZAFB6676z+BrxhNHETsdR2xYSwvVMH088JgBrwJH0uIqns8yYJTnqefXejxdNKtbS1ycSeY2/IFPBmLBbj11Ayf0m9wYmeE2FEIdDkSxNZHgksKGA9vK2axMY3sqoqI6m+o2sCl888KmSx/UI/cr384GkMuU5pvR7T5f+61pTsuAHI21n/BnUHMpaNAXINAiFcZMyohNPaOC/MBfvaGJZT3NJqSkExxjoCvKZ6yDHaYEfP25LmlfwKgczYc7398upIn73pR+oUE9dZ1HTs4a4BrRkF8eospEyuAXIsTsW10Q7v6aQzpFi5+EfdL3vMyFbjrwcwpWD4EDv8FRolH2eBSMmWTQghwubUi+LMh0bJANsBtPpE6H3qOKsreIE2dvCDbhsBWYG7iUPHz9BhAI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1lmSVV0dC8vL2lqVEdmTytxR1hQcjlsK2ZGd3g4NDVJZlBQYVZDRTgzVW1K?=
 =?utf-8?B?Wk5BWkhneEtDZXFSVndYbnRaQTlyZXh3WHBvTnNMTVdWWnNHdDV6USszQjJ3?=
 =?utf-8?B?TVVIZE1Nb0RZYk1tTWNoRjRGUjdreDJzL3NCckZudDBZbldwWGROQ0dtVzFP?=
 =?utf-8?B?MzkvWFc0Sm84TlZLcUVSeUlIT2U0Y1JlYzVDVzhINVVuSDEvVkVLbmdrREk0?=
 =?utf-8?B?c1NNelMwTzl6NTRSK0g5Y0YwTnA1ZXJMZkZIUTd5NXRTOEI3YVlwSU9IbWRB?=
 =?utf-8?B?UVZUaENjV3RoTE5KQXRSbnlxNkQvNUI4M29DUis3RnpRV01sQU9OSDlScWhi?=
 =?utf-8?B?OFhEbjNDMjZQaUNWdHlIbW1leDdkWmt1S2RrSlI4Z0Z2OFhQL01LQ3pyY0tn?=
 =?utf-8?B?clBTS0pRcmU5aHlwTzhFeTErQnZIMFNxVENZdFR6OTRGOURwS0lCcG5OUUVV?=
 =?utf-8?B?SXNzd3NYQ2VsaHI1WS9Na1dCcm1SSXdJRGZoMFZJR3BCNzlCWUphU3o3WUFD?=
 =?utf-8?B?SnY1UGlXR1ZJdndmQnVDWGEySnJteEdMY0Y0NklOVjcvK3FYSHdmMWU5aVZS?=
 =?utf-8?B?YjdUZ2JVN1ZHT1hwdkpqQUhOSEJ4eUQwbDFuUDY5VUJpRkt0TXdUeC9PcWhm?=
 =?utf-8?B?NktSd1R6T0ZNdFZrRVUzMkpHeE5RVnhka1o1VVdka1dHVFBMaEQyOW04akk0?=
 =?utf-8?B?UW55eURXamFPV0FIWlhZakdIdjlUM2hOM3ZEZkg2VUZTamcwWmdLTGpYcnpv?=
 =?utf-8?B?eCtuWHZpOE14OTFYQ01xemw4OFBnVmVRU2djYnNwTEJwejVFZ0VDbzRRTzlO?=
 =?utf-8?B?WjBXNTV3Q3RmNndwOFoyenJ4TytjNjBCNHNVelgyVTNJeEVvRSs4M3JXRGI1?=
 =?utf-8?B?aHBFalZXNGt5a2NkbGxxcmpidUNnSHd1TW9oN3dQRFNsVWptYUVSMW9PSkFh?=
 =?utf-8?B?aVpnOTdFdUJ6Wmx2ekhCNVFmSVlmRktZcHpFYjcwcDV4TkdUNzd3TzV6bmk0?=
 =?utf-8?B?N0xWb3IxcXRMRDFRQk9yR3daQnJ3TmQ0Yi9BQW9tSDNzZXdoSlFxRmdOeFlF?=
 =?utf-8?B?aVdoTmRLUktSOWtZcjQwcFA2SWR5MllhS1ZGY0NKZzVNcnJIaDI1b3FkdDFq?=
 =?utf-8?B?WXg0Z0dyb090a0ZkY21iaFM2VHZJTU9ZbVd6NUV1aXJ1UkR5V2NQeG9KMTBX?=
 =?utf-8?B?cVB6WnFGbGtCQjBWdmJhZCtGYlBMa2xtVHJjeHpCenpYbFc5bXNVUUJValBo?=
 =?utf-8?B?MUVPbjE5ZERNbU1TVHc3WWlYQ2JSK2dBOVNXSTU1eDY4WXpvUGVxTjU0N1cr?=
 =?utf-8?B?Z0Fqd2lJbWdrWUU2bjFqdktYN0dadEhJWTMvY25LOHMxYkx6Q2hORDQ0dlFh?=
 =?utf-8?B?V1F5b3BQVmRucWtaNENRdXR6eUc3L2IvSlljWVNldEZGS2tVNENvUlJVODdZ?=
 =?utf-8?B?dFo0WHZoMFpreHJEVjcrZkwwVFRJU1JUR3pDZE9LN1dUbVZESjFQZjZ1U01B?=
 =?utf-8?B?Ly83VDdNWkFKcGw2cnJYN1F6NHUrYi83LzB0d0xhUGRrY2h6SHZNOGg3RDZR?=
 =?utf-8?B?bmRLdnkyU2tLN1B1bEZQOVZmNndiZG5XUCtHMStkdkZRTnFIU0xIOGdVa0xT?=
 =?utf-8?B?YmwvWWJzTDd0eVJNWFNCMGRnYldpaGVmQ2NmU1l6NmxENTQzTDZWNS9vL3Bw?=
 =?utf-8?B?TXB4aE9Ib1VUWjdhbU1pcjB2S0NDS29pbWw4Zkh5Yy9YdkJlTUpkSEdjWWk0?=
 =?utf-8?B?VlBOUlZkSjc4aFprTzh0SDY3YWdOMVc4SEhhT2xxcGxlejhVVnJpaStJZHZq?=
 =?utf-8?B?Ykc3VXZUSzl3MmEzVUFsckFLbmVqa1pwQjY5aUN0N0JlWXFtaFFGbk1pOHRR?=
 =?utf-8?B?cE4zd2JHM1NpQUFLNGYvRE1NNmMrZkVWeDJoNkZtQzNOWmZnWW5Tak5QNXJp?=
 =?utf-8?B?czhMdHRFY2xZWEVDS3BpbDNkbk9PNDdJdWl4b1ZGQVRTaGlxMXNLSUk3RTZK?=
 =?utf-8?B?aVJtZGtvRS8yTVhHTHhmMjFMcU5Od1BieDFkaVVseE5pQ01RcHVXMU1LVjM2?=
 =?utf-8?B?ZWFRNTZzMzU1enZybkdTeG1YMXJhNDR6OFQyRGJ0ZHlEM3JndEkyOEhHY1Y1?=
 =?utf-8?B?ai9aaXE5eHRYd3NwWCtRTFZXL09xWGIrYWRreVBkajhHS1lSbG5UMy8wSDFR?=
 =?utf-8?B?eThJcTJqRi92ejYyVUFOMVMvNnNPaHNYY0FPZjhiQ3QzVmNXQVIvdGxRQkIy?=
 =?utf-8?B?QzZmVWxWSEdGeW9kbys2am1ha2p2bmtnTkZUbnpsbUxFYlBZVXBuOHZudGRr?=
 =?utf-8?B?UFZmZWd3N2xzeERUbWtIUUVjSk4vOEdlRERqTmJRS1BlTFRuRW1EUT09?=
X-Exchange-RoutingPolicyChecked: oFzAHgFSKxJBxTOKR0UL3WhRzLam04fdrUd3YogbQmjX80NZ+9Ha9qQcn2+oSeMkTPkGrA8YiYARji6jz8thhPXgL49my1L3sCk4LcYnUlknocGqZlIeGkI09dhialytxgZ0lyxLJMz6LogIj680KO5XoXIMIgAm4ZOlPC0eJr0G2ey8kDJmwKQqF+o4k/w5ZB2+0y+9WtZSZzvcwlngDC2s4wnG6HbY/jCV4tsw1uEKMyNvwZIFTnHdcpze8VBfQeinVoPk+2fGB/rR549jI+jveegg+WxjrtqS6pNfbBuAQ2U19exoPUpD9YRXfdaRGdldjg6Wl4C4Ioc1jqiq3g==
X-MS-Exchange-CrossTenant-Network-Message-Id: b9ebed4d-6611-42a4-2042-08deaaa4657e
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 12:46:59.3121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: txsnSqEcSSF52lzFpnfW5nuUymBCuID+u+IiRWNyfKGDokD5wd1qmx5fUTsJWBgpztOB/il5Ia3W6IQNCSNtbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7686
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
> We can use helper functions that take care of adjusting source
> and status vector offsets based on the MSI-X support, no need
> to duplicate logic here.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_memirq.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> index f5e139f4525b..30266b258087 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -493,16 +493,18 @@ static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *stat
>   */
>  void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
>  {
> -	u16 offset = hwe->irq_offset;
> -	u16 instance = hw_reports_to_instance_zero(memirq) ? hwe->instance : 0;


A slight disadvantage of this is that hw_reports_to_instance_zero() check is now called twice in this path (in each helper). Per my comment in the previous patch: computing the irq_page in hw_engine_init_early() can alleviate this need. - Ilia

> -	struct iosys_map src_offset = IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
> -							    XE_MEMIRQ_SOURCE_OFFSET(instance));
> +	struct iosys_map source_map =
> +		IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
> +				      memirq_source_page_offset(memirq, hwe->instance));
>  
> -	if (memirq_received(memirq, &src_offset, offset, "SRC")) {
> -		struct iosys_map status_offset =
> +	if (memirq_received(memirq, &source_map, hwe->irq_offset, "SRC")) {
> +		struct iosys_map status_map =
>  			IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
> -					      XE_MEMIRQ_STATUS_OFFSET(instance) + offset * SZ_16);
> -		memirq_dispatch_engine(memirq, &status_offset, hwe);
> +					      memirq_status_vector_offset(memirq,
> +									  hwe->irq_offset,
> +									  hwe->instance));
> +
> +		memirq_dispatch_engine(memirq, &status_map, hwe);
>  	}
>  }
>  


