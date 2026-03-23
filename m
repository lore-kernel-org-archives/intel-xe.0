Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C512EC01A6
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 08:54:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A0010E489;
	Mon, 23 Mar 2026 08:54:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OWMAoXx2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A695810E487
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 08:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774256046; x=1805792046;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ShtJl5fK1zN4IGs/4qL8XFwuZVCMnYjGkDg7HYRXoE8=;
 b=OWMAoXx24VXXDmvqq+JQLUWggKrKaan3/CP679u5NHi82kLMHcQDYFj4
 fXm/UHMAB5FymFql+DGjodP+HpyZzX6HXnPNxM/7deFjo7MviEcTkfczg
 Y8KVryHWPCCym6cgbFP0PAW9Kh+HkCvN4ZP0g0BOt93RJ2AB9I8mLxUHA
 Z0kfzm7p3KYC7MjxIHXDVQNmqy9JY7kIWt8FSu/x5pFsVL8Pl6msJQkX3
 sEsYylGw/Jri13zZu3i409xwcj52wFAJ24e1CabHIMmdo5ZczkDZYom5J
 bbzhF9GZDdjeGCg0h8k7l50FcqsblGE8Hi3FDo8u0LLjjAtwjDO/goaXP w==;
X-CSE-ConnectionGUID: RwkO9WnkQsy4WvAgTFa/sQ==
X-CSE-MsgGUID: vFnSRPk1SOmk31eBiJyOLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="78846136"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="78846136"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 01:54:05 -0700
X-CSE-ConnectionGUID: V1OMG5GET5i9AB28u4CH4w==
X-CSE-MsgGUID: W60BV8/bRHqIAQ/3kH+c0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="247763256"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 01:54:05 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 01:54:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 01:54:04 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.30)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 01:54:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NKOpj6g1emyNSMvlwsBGl8zzC+uHx8/MwAAkphoZEz3igyrhYGuhi6+UIH/WT33d97WfX3pG2LcdktY7js+5tkIGWHuuPoaniUr0h/h2Ch6oB40zWBTqr9B1oaMt//abflXhq9zRl3ifaqtujbyFM1grCMRIgrlXS7wXIbAe+U/a+gzzk2cvu3hZdNPAOckMKEF2eLdLyB9VR/S/D2ZRyZcMzWipzDgM8F9hWLEWMmC2v4J+qBOzRl4mV1vWySpnovWGLhU78sNfuBTPL1s0v/bnpeUg7xSrEzqBtvYy+DPG6TOnMzM8yxr3vg02ZqoS7Idxjo+jQL7xGXLBIE7y2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVBLLbDpnsT0jvSDOov/rIMNlGqtMMYOjZsDn5QlQk0=;
 b=T+P5KQfPQsKGol41WQRRQXeT2hxhddhLAgvXu0/KfjqkZbM6SJavz9kVuJqhuyxEZnQbCawIIKbF2ZzwH52Rels9kOANRaHaZKutHdSb6GJA4s60ga9MmSuJ06PUxifwMOZKj+dRE21FvQJQzcmM0/AigyWdNKLMS6REXcFL0VpDS2I/W7LM4bHMO3N6nl3DN6ozmDxRUCvTpjdBFi972hRrSKe0+kp6iw/rR3CUs9BEkYutX9tjzzwSzMd6IvjA75+jVKTbqONf90XMdbBGrT0bz7nuruivq0U/6HUdxmaA71A7Tf1k/7F0YtJ2LLgU+MFpJzUPUhooipt2Gsmcuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13)
 by CY8PR11MB7172.namprd11.prod.outlook.com (2603:10b6:930:93::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 08:54:02 +0000
Received: from DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac]) by DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac%3]) with mapi id 15.20.9745.012; Mon, 23 Mar 2026
 08:54:02 +0000
Date: Mon, 23 Mar 2026 09:53:59 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe: Add MI_SEMAPHORE_WAIT command definition
Message-ID: <acD_ihF75hjxBX0U@nostramo>
References: <20260303201354.17948-1-michal.wajdeczko@intel.com>
 <20260303201354.17948-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260303201354.17948-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BE1P281CA0197.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:89::10) To DM4PR11MB8132.namprd11.prod.outlook.com
 (2603:10b6:8:17e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8132:EE_|CY8PR11MB7172:EE_
X-MS-Office365-Filtering-Correlation-Id: 13e7f4e7-e482-43a9-e6d0-08de88b9bb10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: mn4oceFlimccb9kBWce3PuACJ7rDOSBCoUGt6zYex/3TBPP5vC00P1cXqQS9pflm1EFRPrW6ss66Diq9p90zUPJlu8yEsEWud2vrsd0z3I00rcBWKrsByza+JBjCTB6yDNSnACDurpTB0uYy9dSXHa9i3ynhpj4OeyFkG2Qm9p0dQxLLJGCKyA9+BqLdmVX2K1Oz4ARHCk6OPn8OvKHrFgflCxMD3ZVe0z74G95CFCYKfB084mvzdtKp8PB0Ca8w/zs6GH0XPFVOZ5rXQqX0z/0PeHkbnKGHfonL4DIeF6lXMv4+WeC3Vjco+BTUnGd7vWWs1mQUjkwVGig4eRgmpX5Pln2eY8pKvlHXwJFPJgOi9SMgsL7n8jlR+QEsi+btHkZtX4boB9EDpSnTdInT3ueO9CipWp1wY4HOTrLzKC3INyptZQDnpcKZ2cLaiXYaw4CDQylgcSXNm9C7d2StZPSbOpw26LvCkGv8EsL7ZVpVd3+EuduxypEKqkxcdziIHTMrRz7KXDRkt+MEz7PKluievV3DtTTupr3NTu3h4cnJZxlXsJxncI4Sgk3xXIQK4asjpXCMm7gj/pTTpFiHQB9B4ztN53UuklEVXLEbM5ULEJPy4ICzeV48IaJZv/88kAst05vj53+yraR0HJTQC3Wg/Hf/aMR5/nIpTOeBzU9bDZZwZRX3TBbmRVnD1Bs5HE7Nh+Musix8krjShNSgpaniUTFSnkAuTvFU5IrzHic=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clhpZGlwc1JBczIzT2doNU9FQXBSbk15QVpCeXBiZHNPVEU1L016RitYUnRY?=
 =?utf-8?B?TFgrcU9aYWtMNW84R2NsNEViR2VGT283Vk9hRnUwd09CMHAzS2NadFlQUGw5?=
 =?utf-8?B?QUljd0wxNCtXV25leWJaL0RtOUlEaEV6N2h0S0ZBUXFueEZQNFJjcU1oUS9Z?=
 =?utf-8?B?NVFqR0diNVZoUFZZK2dNMnZ6WGswak8rRDdyMVR3UFludmZaY1hEbldaY00r?=
 =?utf-8?B?ai9qbmlrUk0xeEhiVGtrUVprUWppdDkxNktvczlicEplcGlUVUF1aFlIUUZu?=
 =?utf-8?B?SUI0VHVGa1RHaGJIRzVOSlpQTUZsa2dacS90WDRKWjV1NGtVN0dMeGRyWmJw?=
 =?utf-8?B?WDJmQWdId3U5dXFYNk9LYnl6RkpBemJiZjlqRWJDY2FHclluaHVRZkx5dER2?=
 =?utf-8?B?WEFMVkpiY3duYVB4Nk1LVi9ka1Z4NThBZ3BscXNqc3ZSNnRsWi8zU0hPS0lP?=
 =?utf-8?B?MjgvUkkwaWNoSnBwSGRhSThoUklLQ0dCUUtsYVc0ZndxZWU0ejVLYW9BaER4?=
 =?utf-8?B?T1NIc296QlBSNWpadmlNMzdLTEhMWmRNK1JIdWltTkI1dFlUTHN0eFlTNXVw?=
 =?utf-8?B?czZQSEJpYVM1NGthL0VoSEdlRGFVak5Zcmx2cTM5MWV3WW5HcjNqR0d2MFp0?=
 =?utf-8?B?a3dKUFd1S0ZCY09xcFdyVWZHTzFYQlh2WEhVbW9WRmNnUDdLaFBOei8xM1NJ?=
 =?utf-8?B?TTlEQVpBL2JiQUdxczVHd3MvWjN0Q2h3UW1oRzZXYVpXYkZsdXRDaE1pWEtF?=
 =?utf-8?B?RmkvekMrNWtWNlpaNUVTREVjZWpoTitpaHErYWVKTld5V2M2Y2lxbk1oMXpL?=
 =?utf-8?B?S2xybll0blB2K2ZBellTcWw1UVZQelRhZlcxcEFiNWdHeHF2UDdZY3NVN1BY?=
 =?utf-8?B?eENwRmZMVGVkM0RXUEJPMEJXcGJBU3pDUWRWSHdxdUg4NXovMlg4dm9tU1Y1?=
 =?utf-8?B?WGV5bXBwdHhyWTAwOHgzbFA5bjMwU1QzQWFuOVBRTDdaZUx0RVZwcEplWVp4?=
 =?utf-8?B?Q0JGK2szSEhKYUYxelJaRmtaTG9VUXhKbG80cG5JWC82RGRrL3ZyV2JXVTh4?=
 =?utf-8?B?Z2tYZlRWWkthUmZ4b0pLZWJiMWlCRWJoWEFnaTJxZXMvRjA5dXFGNGpMSGJY?=
 =?utf-8?B?NWRlYlNndmRmK2VsV3FlUy9uemxNMHpGMldpaGw5WnROcmZINVVadmZlWDk1?=
 =?utf-8?B?TnlacHBnWCtLdGNZc2kwUzVkdElqUklvVGxsMGxMZWNsSWlHYllkS0xsdFl3?=
 =?utf-8?B?TFRHbVBkamluQzZySHZjcTFzbEhJMGxUNWl1MG44Rk53Rm1ZYy9yaUZOM3h6?=
 =?utf-8?B?Y2xZMFczR2VnWTYxL2hvWkFQU1NzQWlkZEdEWmNtWXZXQlJZdHFjcS9hcGpO?=
 =?utf-8?B?elU0dTNCNjMyMk1oU1VkUTBJYnlFNUxrYnlld3I4VWlOcE53Q09KeU5UaTUr?=
 =?utf-8?B?bVprdXpNa0gyR2hJUXgzeHJBK1BCcXR2NlU2QVljYXBzWkczWEg5WWdScEoz?=
 =?utf-8?B?Z2d6LzZpeW4zMXI5UGFrb2xIVVk3QUxHRHNRd0huLzJocjIvY2toRkRVYzI1?=
 =?utf-8?B?bG13dHZqMzdCNHM4YlpVQkxMWTY1NW02YVZFWnF5SjZmajErUVBtWHk2dkEw?=
 =?utf-8?B?Q29xTUVmSEQ4Z2lrUHcvMm4vK1A0bEtOcDI0NUY1VDhpbk83VkJkcjZrRkNp?=
 =?utf-8?B?Q3B5R1d1NUh0UG1uTXU1cmMramNkc2ZjZUJ3K3BpSWNqWG4xc3N6Y1ByZHIx?=
 =?utf-8?B?eXRWeVpNSmlTaW5zTFAyM1V3cnU4RzFsbGVwMXgxb3AwU1MvTnhRMG5RTHcx?=
 =?utf-8?B?cDMxQ3BSbjJ2dndqNk5WVXlWVTlFazJMZGZoZFZPZ0RKd0dzL25mdU9YcUkx?=
 =?utf-8?B?bC9rcnNGTE5rUzJUdno1WUt2dSthSTdnTHl1eGcvQ2hCbWpOdTJEbEN1WUUz?=
 =?utf-8?B?Ky9sWjZ3Yit4bG00SUNVZU9aeFdIVDhBT01qdTJsTzJ6K2dXYnRnWENzazdR?=
 =?utf-8?B?S081RzlTcTh0Um4zc1hjKzhuWFgrRFdOWU5ucG1DUm9oNFpoem1JaURZdzFj?=
 =?utf-8?B?aXFQOCtWMzRsTXZmUzNGVWZYNTBhdlhFTlpTZ1J2K0d5QmZXZ3dUaGV0dk1O?=
 =?utf-8?B?YlJHSExpdjN0UDFwQmd3Y0RuTEQrdnRVdG5UMXN5OFdlNURGUUNEVzllTVZl?=
 =?utf-8?B?UkpFajdLVWU4dk5nY2VNV2kveEt5UXVmejJKc0R0YWFEdE9sK2NmN2I1MVNX?=
 =?utf-8?B?U3JseWx5T0o3NlZXK3ZzQWFkYjRGZkVFNExKWEVUUnVFMlQzcVlWZE9Wa1Bi?=
 =?utf-8?B?SWhRaEl1SWUwbzNrdlhPYSsvUzhuN0dabmJUekIxZ2drOFRrWi9qUnQxTURD?=
 =?utf-8?Q?+WHJQrh5vkDWJFfs=3D?=
X-Exchange-RoutingPolicyChecked: Ht247pRyMjKc0U5Ez6i/3cujF8atIZZipy9sQFYLOANAXnDxsapb/0N8x+wbte7sUF4YUcINc5r2I9J+TgSTvhrgm2lhjnzS7Ne0rP4LYRvRZx9+xBYF9PpQpphBe6fRsVmtHIbPhdyep+luY2ZOP5Tw78xsWx3qt2OIwSJH8a5FuT6aMHrwvobDVH+3wUYZagOkaqY6PYeLrYzXvYbmkxGSfJbzJ2UkRr3zViSkKLIoah1uh68v58/bReLBQQFTw796q0QimCIOYGJu7mtUg2ECnOLQfz/2i3Ud9+h65b9dpTbtLX6JECZ7drBJfvf6o48SNQc8iNtd5DlE6xKBfQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e7f4e7-e482-43a9-e6d0-08de88b9bb10
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8132.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 08:54:02.3564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TTVBTv6TiKnvguNTh5L9HPOfj9aFI9/DUiWi+blYfj6I04D9I+NSBAJAHtFSnD58dtCeQSA6K0MZqtQMVT+kO7CDPqpkMH2pzpauv3HLfG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7172
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

On Tue, Mar 03, 2026 at 09:13:53PM +0100, Michal Wajdeczko wrote:
> This command supports memory based Semaphore WAIT. Memory based
> semaphores will be used for synchronization between the Producer
> and the Consumer contexts. Producer and Consumer Contexts could
> be running on different engines or on the same engine inside GT.
> 
> Bspec: 45749, 60244
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks,
-Michał

> ---
>  drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> index c47b290e0e9f..29569eff1af3 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> @@ -34,6 +34,19 @@
>  #define MI_FORCE_WAKEUP			__MI_INSTR(0x1D)
>  #define MI_MATH(n)			(__MI_INSTR(0x1A) | XE_INSTR_NUM_DW((n) + 1))
>  
> +#define MI_SEMAPHORE_WAIT		(__MI_INSTR(0x1c) | XE_INSTR_NUM_DW(5))
> +#define   MI_SEMW_GGTT			REG_BIT(22)
> +#define   MI_SEMW_POLL			REG_BIT(15)
> +#define   MI_SEMW_COMPARE_OP_MASK	REG_GENMASK(14, 12)
> +#define     COMPARE_OP_SAD_GT_SDD	0
> +#define     COMPARE_OP_SAD_GTE_SDD	1
> +#define     COMPARE_OP_SAD_LT_SDD	2
> +#define     COMPARE_OP_SAD_LTE_SDD	3
> +#define     COMPARE_OP_SAD_EQ_SDD	4
> +#define     COMPARE_OP_SAD_NEQ_SDD	5
> +#define   MI_SEMW_COMPARE(OP)		REG_FIELD_PREP(MI_SEMW_COMPARE_OP_MASK, COMPARE_OP_##OP)
> +#define   MI_SEMW_TOKEN(token)		REG_FIELD_PREP(REG_GENMASK(9, 2), (token))
> +
>  #define MI_STORE_DATA_IMM		__MI_INSTR(0x20)
>  #define   MI_SDI_GGTT			REG_BIT(22)
>  #define   MI_SDI_LEN_DW			GENMASK(9, 0)
> -- 
> 2.47.1
> 
