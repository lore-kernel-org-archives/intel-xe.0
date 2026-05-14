Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC42CD4851
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 12:52:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D69610E3B0;
	Thu, 14 May 2026 12:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BrqDMEcN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4671F10E3B0
 for <intel-xe@lists.freedesktop.org>; Thu, 14 May 2026 12:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778763126; x=1810299126;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ePHxJ3JvV7WZMtxHHsRn1kHgD++AziDmIhbioz0V/us=;
 b=BrqDMEcNuWCC+XyZ4DUa232X/aIkKIIIQLp+/N68FqekJnZh3i9Qaby0
 Vk6dHxbcNeKvVxZKYhMeKfXp1WWSJXt536tTP2K/8QxUq4LsiSkDE/Xfq
 fMHPIpA9KWA2kdNA7dJ7gYR3SnKUx7FxqV5okcgRLMAITo+Ron+QRSUhV
 7U45M/d69JNv1io8+T48jzNJEIbkS0QRH1RsGFTCr/9XxmQKM/Go/83sG
 3OM+PW5YkIxTqc4P7WqG/zGFudRjvKh3gynPkGBccHdirFSgNxNihw2Eu
 2xl6symrYZnqbnQsPrvzCTQ8CD3rkhHK5DMF1k1/pPw6uDKqQj5Lf2xes g==;
X-CSE-ConnectionGUID: I3GV/wGTT7qib4HQx1+iaA==
X-CSE-MsgGUID: 9RRXvlz9RUaVyThi+/riYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="90807078"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="90807078"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 05:52:05 -0700
X-CSE-ConnectionGUID: THhb/moOR3ibAqxtPBV8jQ==
X-CSE-MsgGUID: Q3ls6zeJQeqeVUxf+lhfKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="234098843"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 05:52:04 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 05:52:03 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 14 May 2026 05:52:03 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.14)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 05:52:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kDxfVxIgeeoiZP93E695o1i08oS5ZOp3IMVlqGDvVP9j9I/ZEOb2fvrVkChvCD5S8UYwKiegbzFGBTh+c4fZ5XEsCQ+er5Dvy83aIEyue3cTMwFTd9XH0qwsrgQNbo9eUvI+hQDaeobzhMhJf/TXC2wGxgGRDqt/9b0Q85tUzYjflRzOVer3VZ63IBj1jHlLsxnACqUmfhRh7zY6msTqNXupmTVuzb/iG83MU6M9Cdarzu1dqLA6tlaZ1Yd2ZSlQkHPWEV9L6s7vTZgmz+S5D836PcuX2QYK7jpiHRGOn4HHU8Yw7gQblfWYCaxESC4E+TfPf0oVi0i+OuTKhh7lmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AvdWre+7eCsdNo7fY2mlTCRu7hRc0OVmSJ2VN5HO+CM=;
 b=bTY3TPlCqpUfBoSdvWSJsp1cP3zb+SCa5xrLi5RyCX3kQo0HlgMaOFgnbiyWs+DdZfMY5qjcV6FGRJSsQfdfCl+c4ZtzdtkJDi9vfhBWz7UyKVT5lhY6NwvyndCgbJ5nOBdICZx27zsGdJCVVpy5QHU0B5P8tZ+Z1qdrtmm04KWTP5UvYTzIidCX/iek/if0V6ETUuGpW2XfkBLpVz16gVqzhIJBzg54hcFZhKAxR5RDsMYJR56C1M1rasFncBervKL6wGSf3pmZrPfrM4mMvr02EbycA5oHFRKsLtwadBedL5eleWF3BJJkpQsS+8czLJznTaaHKlkdcKgLb0xRqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by IA0PR11MB7742.namprd11.prod.outlook.com (2603:10b6:208:403::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 12:52:00 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 12:52:00 +0000
Message-ID: <bd5ea64f-f088-4903-9f68-5f041304c300@intel.com>
Date: Thu, 14 May 2026 18:21:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/14] drm/xe/xe_sysctrl: Make sysctrl flood limit
 reusable
To: Riana Tauro <riana.tauro@intel.com>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260511172908.1122252-16-riana.tauro@intel.com>
 <20260511172908.1122252-18-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260511172908.1122252-18-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0231.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::7) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|IA0PR11MB7742:EE_
X-MS-Office365-Filtering-Correlation-Id: a4e0422f-6c14-4b69-20a5-08deb1b796b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|3023799003|4143699003|18002099003|56012099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info: gp+mC+QnaF23HxvudcwLkVTDPGV1nHL1y1xsGX0m7jE+C+dyMbpx4b8BnAKP0Vr5p5NNFoBXa0xh1yoSe38h6mjqLbTyxljQmr4Av202EkCWlMGVc41hJEfqY1PqltixuN0QmZ6dgwl8FE1qsabg0RXm9pokb2thjuX7givrDAd92vZu1KbR2JKqSG8KImeGbAwt9iYJ/K1SuoFIZao3wQna/ST4yGT1FqdFHUvXGlu+8kQZJ5HI12amh+GZ3WHIbBkiRFkWj2HKYsE8pkDhf+hMiPOjWeIomgcVXfDtAloUmJlNfxUdrYTOaVm65vjPRP4sr+MwwVFoIA3WhsRQMDVYiCADt1d4E9x3NrlrbiE6Sn07H+7ZojaEjwrusVpiQ04+7cksI/6k1D7/2v/elLPZJhzGlOxekqnlgAZdH2+MwYOOmy32l9kGQbosppJkpiRaJDPAsG5dRQXRx6MTLsf2cLVzGR5cWExDQbrPO5196EeeyZ34VJeNyacVw2aqtS8rIqt89o7jjCjd/I1mFxHTMHdUX5hQzU6GNrosF62KywrLyYRyF8toBbVyZOxkrh/8eYapf2hhWLRitgOe4IwTR3YW48+ozcCsHd3ASEtlq36opzyAlyj9EvuDbiUepvsY6cV4QYZSEMbPEnmULa5lhlPxnvTJnPDDJl/zw1tE2jMb2vCdDRVKHVxC4SRi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(3023799003)(4143699003)(18002099003)(56012099003)(22082099003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1QyeW9UTnlTWnJSNlphdFpSNFpqWDZJR3BEZTR0aEpJTDZXUHk5N29lYmFs?=
 =?utf-8?B?UERiS3NpWUxTcHF2RU9ET2pXWGVCbXlabFNIbEE4Rk0yVFRHUW10R1N4cGxk?=
 =?utf-8?B?Q2NweEY1ck04RzlRWDlraU56b2JmbXE1UGxPZktDVU5TZTZoUVJFTCtudHMx?=
 =?utf-8?B?aW1RUEk4cm0yK2l2UXdWWFBDRzJSU3dudk03RUtxdDRWZm1ua1BpL2tyT1VB?=
 =?utf-8?B?N3dtQWthdXh3TkFJZkJvSU0yZUtLaUxXOUdLK1BrNHBWSjlYOXhSb3B2N0VC?=
 =?utf-8?B?VmFyTHVZMS9nd1pDSUNWaDgydUN0UnRJelBoSTh4S0IwQVJYRkFUTmh1aUFL?=
 =?utf-8?B?Mnk4Q1gyaWdXWFoyWVBUNUpJMFk5ZThxa2FyYk9KdFQxeGkvdlY0blZJQkdj?=
 =?utf-8?B?cnFqT0lBWjRJUlN0dEZQaGFBV1ZtYjNhWmtyZnVKYlpJSjFveld1bWpWbmpV?=
 =?utf-8?B?Z0hoSlp1YnlwWG5rRzBXUnpWVG1QM0toK2I0VVlqRG9JbjBObW9vc1lxd015?=
 =?utf-8?B?djc5WTl1UmJCN2FoWVhOU3FvSVlZQXVnK0RsYjVkK3djMDE2WHNNS0JTS1U4?=
 =?utf-8?B?RS9OenVqaUFPT1BUdUZKVEZ4Qm1HYVVVSy9hVjRWUWpoSzBRejhNWlpISVdy?=
 =?utf-8?B?NTNDUVpHWFpnclFwTDhaMkhLaHM2OGtPQUVHUW5WSXhGTVdDYXVyZGl6RHBx?=
 =?utf-8?B?NCt0YTYrRHhqbTUxK2xZeWxsOHZod3RXcXJvVkY0SmxlQlMveU1RYzhlREJv?=
 =?utf-8?B?dlViOHE0NEdmRkNRUWxPOFAwekZDenR6Q0NhNG9LTWdPaW40SHBzdkZINTgy?=
 =?utf-8?B?bkF1bGRYZU5TNFdBK25yTjg1UlAyOHBGS2FSMWN0QWhKMGovTWJBQkl5UFov?=
 =?utf-8?B?NnJMT0trRm1tTDh2MHY0K1NUQkx6akRPSnBubi9ZeHc3azBXODZCT3R3Nngz?=
 =?utf-8?B?V0tKU04vQTIwU3FTamg2UGRpVktOQWRFS1pLa0ZVdXc4RTlQMXJhd1lhYW1T?=
 =?utf-8?B?dzFMbUFqbDE2MTJiaHpNMndtTDhrZXJqRFd1UjdjOE1GNlJJd3c1VG9TQS8r?=
 =?utf-8?B?cmN1NTdQUU1mV2NOajlxbWRxZXowYWh6WjJxeWRzZHhlR2FzUEJqZ1d1Z2li?=
 =?utf-8?B?MmIvd3FzRmpJL2pQUGY1Y0NleEN4eWFuM2p5Um9UWWZrR3VTT1VaN045Z0Fl?=
 =?utf-8?B?Tjd4NFRoU29uN2dib1dCY2pTNWRaTkw1WHhrR3JrYTN2WjhUSCs3d0JkcXY5?=
 =?utf-8?B?V1NhbG1yVmhJd2ovanRnNmhYQ3AwSFRLT2x2b2lzdm44M2RBcEdkR3E0cTRG?=
 =?utf-8?B?ckNKOTYydjFVUTdDSVFKS2xFK0pyM21zQnp2QmF0d1VmTWNhaE16NkRHT1hC?=
 =?utf-8?B?Q0hyaDNiYjZlT3U1YStqUXp0UjFEUkVYdG5yeEg4RnpuZklvdm1MTFJINytQ?=
 =?utf-8?B?bDZqRmpMUjd1TDZrSVhNMTdabXJodlBwNWRLcyt4TEx6SGlmMDlMdUhlRm80?=
 =?utf-8?B?YXBXR05wWGtsVkFmOVQ2MjB0bitEUFJyTWdyOVBQbUVuMUM2N1MzMUNaZzR1?=
 =?utf-8?B?Vk1PaUpWVi8zYlpIRDFaNGplQlIrOWdJWFhxMFF2Q2dSSzJ4OXlVbjZVZnF5?=
 =?utf-8?B?NTZQeTN6N2VNdEd6NEtKYWN4NVNId2QvK3p3cEx3bkRqWnBDeE5Ed1pRRnhx?=
 =?utf-8?B?RDRoNEh6anhBM2lvVS9PMnBBRHFNVnAyVjFCalFKU1FkT051dlBTc0V5eG9t?=
 =?utf-8?B?Zzd0MTQyRVBDU1ZQeWptTkNJc3JBUGF2bng1cGp5TWhJUkpCNXBPbUVYNjhw?=
 =?utf-8?B?LzZwSUt1NG5oNG5ZcXU2WEIvb1NVR1NXWll0WStKaEpjTW9xYzAzaG5zVSs0?=
 =?utf-8?B?WUtaRDd1VlZBbkdBWlBvRURua3R5a09zc1N6aFZ6TkhtTU1TUEdhdXZmb0g5?=
 =?utf-8?B?RGRHQkpBWVlKeWdYVmVrdGlEZEJ2SDhEMDJFUWxoMjRUNmcrRlAzQlVKVHFI?=
 =?utf-8?B?ZksyYTkwelN4RlBNeTRxbnFQa0h4cVNCUEw5OGR2T1VGMktRLzdsRVh5cGtz?=
 =?utf-8?B?TXdzdVUvRkNHVU1IVkYwY3F4WTBKZFJiRkZCMFora3J3aXJhQ0VDcjFXMVpo?=
 =?utf-8?B?OGwrMUhSTnNsVU5tYWtSSys4dVN6Vm8zT3k3L0QxazNuWU1IRU9SWWluc0xB?=
 =?utf-8?B?RndKMjQreWcrdnlqRVQxNzRKUHhTeEpGUGc4YWVDVGVuUDFqaHo0ekI0dGdS?=
 =?utf-8?B?a1IvbytJTzhaamlLTnJJTi9SSUtIcWhtb0t5ajVLbFg1bXNLVlBBQk9LRDlp?=
 =?utf-8?B?L0RRTXVmeUZDeWt6alBzWXQ0L1dGWUhIMU4wNnZCVlhFZFl0emU2RlJOZElp?=
 =?utf-8?Q?mm53C0TF9lUwffB0=3D?=
X-Exchange-RoutingPolicyChecked: VtWrhQCjgUB9oFzBYYsF3WYMKY8ayj8wW2QBZ0UCaqX5rgOA36Cix6acKwj3Vk3PZ4OmtD+niPGgTxp/3bLf9++lmnaVbTlcJjx+WJ1vWQZ7kXrcjx7nl0OlACNwGyNmtcKufic7ArIeuS3gJQWndHbyR6Q+9B0NEl+I/PMUUQb8Q8pUnJCNSdCYfoy3uxEyMdr1c6owMQGLcKiM3/hEx/nuC04mahAoGAnM+veXxWqG6CL2jVTWqzzWKAPWsxz0bLWcGRZu1oYCvTuUKo/UARzME45ihmniKR+stqgyi45ja6JZHvOxMTpXtivzSCe3F9oDWPnD1ffdc8uQWyspIA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a4e0422f-6c14-4b69-20a5-08deb1b796b5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 12:52:00.2597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x9i3mm+kE33MEaWsfWc1SwuNbhyG1PFUxbiu8LEeJv3rY97V1jJP9O4C9TJ2ovjjTv1Vt5j1SqiMxSwzo6lEevMC/KjKnNLg7vSer6REmRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7742
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

Hi Riana,

On 11-05-2026 10:59 pm, Riana Tauro wrote:
> The sysctrl command flood limit was defined in an event specific header,
> restricting its usage to event handling. Move it to the shared header
> with a generic name so it can be re-used across all files
> using system controller commands.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_sysctrl_event.c         | 2 +-
>   drivers/gpu/drm/xe/xe_sysctrl_event_types.h   | 2 +-
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 3 +++
>   3 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> index b4d17329af6c..faf6ba89ce98 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> @@ -16,7 +16,7 @@ static void get_pending_event(struct xe_sysctrl *sc, struct xe_sysctrl_mailbox_c
>   {
>   	struct xe_sysctrl_event_response *response = command->data_out;
>   	struct xe_device *xe = sc_to_xe(sc);
> -	u32 count = XE_SYSCTRL_EVENT_FLOOD;
> +	u32 count = XE_SYSCTRL_FLOOD;
>   	size_t len;
>   	int ret;
>   
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event_types.h b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
> index c16c66b9fa7f..d236e22fe9dd 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
> @@ -11,7 +11,7 @@
>   #define XE_SYSCTRL_EVENT_DATA_LEN		59
>   
>   /* Modify as needed */
> -#define XE_SYSCTRL_EVENT_FLOOD			16
> +#define XE_SYSCTRL_FLOOD			16
>   
>   /**
>    * enum xe_sysctrl_event - Events reported by System Controller
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index 84d7c647e743..0fa786a9e8c8 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -48,6 +48,9 @@ struct xe_sysctrl_mailbox_command {
>   	size_t data_out_len;
>   };
>   
> +/* Modify as needed */
> +#define XE_SYSCTRL_FLOOD			16

The XE_SYSCTRL_FLOOD definition appears in two files. This is like keeping
two copies of the same information - if we need to change it later, we might
forget to update both places and cause problems. Let's move it to one shared
location so there's only one place to maintain it.

Thanks,
-/Mallesh

> +
>   #define XE_SYSCTRL_MB_FRAME_SIZE	16
>   #define XE_SYSCTRL_MB_MAX_FRAMES	64
>   #define XE_SYSCTRL_MB_MAX_MESSAGE_SIZE	\
