Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF7EC55822
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 04:57:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B152710E0ED;
	Tue,  4 Aug 2026 04:57:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SMngcGvF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ADE510E0E8
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Aug 2026 04:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785819421; x=1817355421;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OtvU/u3esLzDj2DAmajPFM/Psf5S5lHqh2cWbZuAs0k=;
 b=SMngcGvFJQjl8mdsMldnJeUyhR7bDA6OvGQEr39QPk5F4j6FIxjl26F1
 c9DVoX5JNVWHh58d4et44vzUeeG7CtHKLtoYgweHnymnxU1PDnyKjvb0q
 nSfmkUBxvMz4dLeJSratX9rgS85U6nbMtMmhBFmRNb0psk4AZgU5GU17d
 E5EQ4BFOZ2IAAEviRQGYrKiuhd93y6CDusE4vRaMXk80Cm7SOQIknPncu
 bEgrTz6aLGUq0wraorHn76SV2OfC9SRsyvgtolgOi1wEqqxBPT8w1Vu7d
 A+bm+NCCrgfikzH1cCL+77waGSQFoAnfKx8LEHqQyVzUyfyGBGaXpnLXu w==;
X-CSE-ConnectionGUID: 8mn+VH/XRgqmzfNYOYSs9A==
X-CSE-MsgGUID: JnRqL1fYQiGsyOFgOBpnFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="103901059"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="103901059"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 21:57:01 -0700
X-CSE-ConnectionGUID: pdy0MhSlRMmTBnAKid78MA==
X-CSE-MsgGUID: /DpkSMUeRuCCTdzWbz6k9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="255109808"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 21:57:01 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 21:57:00 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 21:57:00 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.36)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 21:57:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QYvFEhlWhQYwOLgF7xaago5KPvGJiUC51cttp2nCC268U2K1ZmUkGpIAUWi87cSgXZDBqb8n54vpJPChbKVbArWucmMGXjE6ZHS4dNAfIDM6NqhypxABzDtyyMpBEv9I8EwlcBokCgUEy7D0N6Dt/3D+rJRCDLbXHfFgK/tA5Xj3qqDTvdHjMyJLbu/SLXcuLIYtBVPhoaP3AxZ9VpljhQL5K5XqRlb0WbIek7sGxM64xYlvDKjlW6eO95K7LSPdAIIKG9MmvPDx6+EX7mnvvzo/tnEgEyxPzUa/flFxwnAYITLYDd4vcJ7eztri2KGCz7+hYtKVrcOdEmFsg24qOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2idveQmIeKs7ZXaASY2os6S/M5fzZ2Vk5i3DYifo3o=;
 b=bXbCUU7hq/Ds+s+R9IrW+yQSfqOJE60gGdu/A9fW+gKKb356ybfevI724D8L4ywvb+TUGuIHg8hi8UBcG5y7p4hop1gTkxPS0AmsWITBYh/M93L0tU4wPy6PMoWguqhX/vk/7/upS9vmUNWaopVMuuUA8xxHfoWcfQrZbEtQsgxAb0FXx0v+r0juUKb0OVtbUdl3hP1PRcoW4Wj9Bw56q885NzUlB0VEGh/1IMQMkO9t462WgQfSzT23QGF9r1xzP61YqQyFrsLOTCta/A31eG0CL3sRF7/atRgc25B5LllFASi1hFFU+ELkKmVZ4U2DLYdcTw0/dQRSUCDp5DXn9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by BL1PR11MB5254.namprd11.prod.outlook.com (2603:10b6:208:313::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 04:56:58 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0270.016; Tue, 4 Aug 2026
 04:56:58 +0000
Message-ID: <e408c860-6f57-48c8-8b9a-43683642c1c3@intel.com>
Date: Tue, 4 Aug 2026 10:26:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/23] drm/xe/log: Add SIGID log helpers for errno-only
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-10-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260730152121.576-10-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0291.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21b::18) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|BL1PR11MB5254:EE_
X-MS-Office365-Filtering-Correlation-Id: 59e841a7-62c8-498a-de77-08def1e4d053
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|56012099006|10067099003|11063799006|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: /n0MgCjmtiOl2zOYlnJMe39oUKMSs4ADcthVLHRdiaEZBPJ5Q/wdH+rWWIAvzBRNjztqQbq+yKR3/6R6oXw2CkIJ+jNyvMwahB8gVXSwf8h1obF8/9GWUsV6MUC6Q8615N3mZ3QWcCEGWdMHV/uAXLtp66k+plBMPzzmH7+5EygiMT1M8ygzy5iIIK2BN54Q60RGVh7l8aMMRLzC08SlZBF7irvqeWFrwiGMl5u3E08oHSN2hjiwHGC5qoA4qfk9sf/n9uDpgN0DbieNgG6hU0Pa6iHv54jxZsZrB30DCybyyKPaUB29k0YsDhNvBIoKBy/gMXRmLs8LzpYEFChgEcDOwH83Mlgby/+yAF4sE8P5adAY6+Wsl2XSopFJVfhxe1HS2QD+44BoZSW6yjy+xlxCSQF9ZudxRwjblsMZdfUrP6yVT3qcYaq5f8j9HUYjkNbJxJZ4vrsLgXiaE5zpBBoGp2Fq0Mm/oFbRICPYsrVv5vm8aH1txzv180EjVAscrRp2187A7icxVotaKDFePsLz/VmIiQ/HT1DPVl7ZIXXwcKZIKVujG4m75IeU63/L2uVlbe+3mniQofzgEPmsH1OSvMsddXMy5a0aigWAjYMazyqklAnHbp6ne5DBXGq5xeCC+6YzF29VdaR3tb1z3R0RE5t4qNDdRcKmF2UDr8Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(10067099003)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0ltL0lHL2JLbzc3RE4yZnV3ek5xNW03YlU0WG85ckFOVlI3ajd3cGRxb2tN?=
 =?utf-8?B?cVoxZ0xkUUxuN0J5WG9oQmlJOWtEa2xTeEZnU2V6KzJRMUk3WWFmSEhDUWNM?=
 =?utf-8?B?Z2lHOTBxbUhJcWdyWnJtQ29rcGFzMUVzUWpSKyt3ZE8rVEF3eXM0dGc4NVpM?=
 =?utf-8?B?S1pIVHZPSW13bHNCaG1OcmxmTkJxT3JvZStWMExhLzZBcUxhYkJkV2JvL3Fv?=
 =?utf-8?B?aWpKSlNsOCtrRnVNOS9YakVnd1J0T1h1MDRna3dMcW1IaHUrR1M5QXhNa0tj?=
 =?utf-8?B?Rm1WVHJFeDVlOFFBZHI4SnQ3T3BTQ0txbWFFSWFqVlBZWGVkNStVLysrSFBo?=
 =?utf-8?B?d2VmWFVpWW5NemY2MGYrVUpwMHZoUTZiRWdVNDBGOWwyL1lYbGd1NTZ3cEpt?=
 =?utf-8?B?VnpOcGxsWmFEM1BteUtrQXFLNDVMM2FuT1ByRXZYdVI5MHhVR3BTTFc2ZWIz?=
 =?utf-8?B?TzlJa1FObGNIUEdETEM3NWNveE1YYlVRcjdXckFGeG5OY1lnY3V6b3RxcjdC?=
 =?utf-8?B?aXpPa1Z0Nk9ha0ZqQjFSR0s4c2loRkJocUt4d2NCOTJGc212S01MNTZiWU9m?=
 =?utf-8?B?NDJxZjByWDR5M0ZISzJkSm1HandaV1lxRzhMLzVHelNHZVlFM1ZGTDNXWHBv?=
 =?utf-8?B?N2c0VkVMQXJEVGtvYlVtaXNlM0F2Z2RWdU9JMHN3WDNCZVNKNUlyUWhzeE92?=
 =?utf-8?B?Uk9BRzdYbjhhc1phc0c3WU1DK29LcXl0NWdpL0VUeVh2QlNLYllmRDNaeC9N?=
 =?utf-8?B?YmZIV0dOWHFOOWYzU0tCdk5jVE1mbkNCTDdiT0dBMkdrL0lKVkZpcGdMRCs5?=
 =?utf-8?B?UXdrSVZ5NFJwd1Btd2pxbWxyNnlhNTFjYXB1VWZzWWt0L3ZxcSs0K2g0UDdi?=
 =?utf-8?B?bTlSZWo5cEVnUXY5M04zWmxGQmFiVG96RDAxa25MamNQa1N1clBoZmk1cXE3?=
 =?utf-8?B?bk96OU51YUxuUVQvQzQwSjA0WGdDNHg2LzZOaEwyTkhrUkJuZVhpSVl5d1lJ?=
 =?utf-8?B?UzdNUHFHUGN4QlErbW9ZeDRPTExBZjZiUW5SSyt5VCtFRjd5MkhIK0hReWgx?=
 =?utf-8?B?RVhuZGJUamkrZEIxWjBmdnkxTEhUQzRBNUNqeDIvM1ljVHU1NHNuaVd6KzJF?=
 =?utf-8?B?NWgzNngxb2E5TmwrY0VXQk92MnBFVzhydmNXbkZhL1U5QWVDem1CZ0h5U0tO?=
 =?utf-8?B?WEkwNG5HTmFseU8wc0hTb3UwMWc5c1RHbWw3MFo0SUIwNWY5WXVaazJjNmp5?=
 =?utf-8?B?MVp5bjdJWjgwM1VIOW9hNUxNdXFYcE8vTE1WN01oSWJXRGRuL1I0dGdKaHdM?=
 =?utf-8?B?akRXd1FDTkRxeFFwVEFHRDBSdGxHMDRRdVF6am5rbGJoc0QrRlNKOW90TEdm?=
 =?utf-8?B?dzQrd25MQ1dFbzVSRjYzaDZqby9rUG1qbW5TK2x3R3BZVHVMYzMxTTJUdDZF?=
 =?utf-8?B?SHBBVmNNR25xTTU1V3VzNTZ1S0VPSVVtS1pQV0h2ZEpGYVhvbTUzU2xoQ01I?=
 =?utf-8?B?cjd5bjdHeDU3SlFWRjFZN2xkbTV2T21mSHNhMFVJMi9WL3A4Vno3VEtERmI5?=
 =?utf-8?B?SkxwZGN2bWhuM2VHYkJsclJ4ZldlVDVnQjQ5TS92MVVocG9JTnBrYXF1clRx?=
 =?utf-8?B?dU1TQ0lFNUZickVEVFhxYzMrRnkzcHVqeXRTRkxYTlEwM21iMXVvaGQ1NHht?=
 =?utf-8?B?RmtDWDVsa3ZlN3hzWTEwdUR3QzhVZ3pqL1orVWlyZm5PUDVPNUlhbnR3T3BY?=
 =?utf-8?B?QnhIMzlzZTZDRkU2czVZSzlOUG01N1dFZGx3N3NlYURpVXdsU0R5K25ScmVs?=
 =?utf-8?B?MlFIZ29zWVFqT3ZwT3hlZWF1Y0dlTlZKdjMvMTl0OW5FUWNCZmMvSnc5RjMz?=
 =?utf-8?B?cU9oZzFXWVJYNDEvODZZNWlTYm1yeUUwY3Vla0h5Y3RaMXFVZEVEdkVjZEZU?=
 =?utf-8?B?cTBKWGxwaGlRK3lhd2JOOWFXQjluRFpGcmZhT21TalIyL1lDcmNyanYyY3JN?=
 =?utf-8?B?M3hiWjkrN2RoQlBWN1d3MWVTMGlnb3RIU3RzTEZkM21YLzFmQitkUXhLNG1H?=
 =?utf-8?B?RlhZWHd2ZndYcUhZbWExc2JLay9tK2tDWkZ2d0RmVEVpTkVCanJIRjlqQVcr?=
 =?utf-8?B?SXJTYS96bFV4MzRwOXNwUlRXU3RjeDYzK3ZaN2NCTHR1aUxSMExTTHlYUXJw?=
 =?utf-8?B?MkVYcFp3Q3hqSURiTHZoRE1nL0lRYkhQVys2SXpFQS9PMXEwampoY3cxWDMz?=
 =?utf-8?B?N01lYzNuamJqa2dieDlkR2xxSnF1SHRxaUJkd1czZDhLa1V2eWdGaUNVUDZa?=
 =?utf-8?B?TWlEMDU0OG81WC9iOW1yZmtJZjdNb2lQRzVqYnEwZmh5Tm9xSktNcmNEN0xO?=
 =?utf-8?Q?aPmvhrIj3V1VPkjg=3D?=
X-Exchange-RoutingPolicyChecked: MZ8dM4xZ+Pz/gt+EN588MVjWYqkBoB1K0LfvALkGrL1g889GV43ND4fTlbNE5nY0mL8mnNW+j1hXT6zkwq6hHDriCXE+7JF7QLFCiczzhY/5ofXByrCulj4J6qFjdx/5g5WgrfpazHVb02HqUGEFggU/ZflPH60+5yu29a2UgWFqHGKHTBpk7B7uiKyQOnRUPI71g70aa1tAhOJNGXSLXF7iZMT9NGi9xv1LZtNX3YYQ5ZJgLtfufiwPdx9Gw8+x49LTvdqktrlFeNjf6HM6sfmDS4fnnGy07CDw2osBFf9bkhCDDXbyluCf9bqDsjM+urkXlDjF61nupCOM654kqQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 59e841a7-62c8-498a-de77-08def1e4d053
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 04:56:58.4522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WHKKC2JG1UCpAavn19ZWDSdxmh5OeYTAoOwo+8Bj9fdBXTYd0mRWy9b6YeR65bxiiultBh/XZIgSkOdalpaZSpQfNPBl98P9504FD3tzwls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5254
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
> For the software based SIGID errors, we will usually want to pass
> only the errno value as the data to be logged in the dmesg line or
> the CPER record. Add simple wrappers for that.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2: include linux/err.h (Sashiko)
>      add xe_log_err_corrected (Michal)
> ---
>   drivers/gpu/drm/xe/xe_log.h | 52 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 52 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
> index c30db02950b0..5716fb7eeb31 100644
> --- a/drivers/gpu/drm/xe/xe_log.h
> +++ b/drivers/gpu/drm/xe/xe_log.h
> @@ -7,6 +7,7 @@
>   #define _XE_LOG_H_
>   
>   #include <linux/cper.h>
> +#include <linux/err.h>
>   
>   #include "abi/xe_log_abi.h"
>   #include "abi/xe_sigid_abi.h"
> @@ -103,4 +104,55 @@ void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>   	xe_log_from((any), (cper_sev), (int)XE_LOG_COMPONENT_##TAG##_SIGID, \
>   		    XE_LOG_COMPONENT_##TAG, (data), (len), fmt, ##args)
>   
> +/**
> + * xe_log_err() - Emit a structured SIGID error log entry on the component behalf.
> + * @any: the &xe_device or &xe_tile or &xe_gt pointer this report relates to
> + * @TAG: the component tag to use
> + * @err: negative errno for the failing operation, or 0 if not applicable
> + * @fmt: printf-style free text format string (not a stable interface)
> + * @args: arguments for the @fmt format string
> + *
> + * The log entry will be emitted with @CPER_SEV_RECOVERABLE severity.
> + */
> +#define xe_log_err(any, TAG, err, fmt, args...) \
> +	xe_log_comp((any), CPER_SEV_RECOVERABLE, TAG, ERR_PTR(err), 0, fmt, ##args)
> +
> +/**
> + * xe_log_err_fatal() - Emit a structured SIGID error log entry on the component behalf.
> + * @any: the &xe_device or &xe_tile or &xe_gt pointer this report relates to
> + * @TAG: the component tag to use
> + * @err: negative errno for the failing operation, or 0 if not applicable
> + * @fmt: printf-style free text format string (not a stable interface)
> + * @args: arguments for the @fmt format string
> + *
> + * The log entry will be emitted with @CPER_SEV_FATAL severity.
> + */
> +#define xe_log_err_fatal(any, TAG, err, fmt, args...) \
> +	xe_log_comp((any), CPER_SEV_FATAL, TAG, ERR_PTR(err), 0, fmt, ##args)
> +
> +/**
> + * xe_log_err_corrected() - Emit a structured SIGID error log entry on the component behalf.
> + * @any: the &xe_device or &xe_tile or &xe_gt pointer this report relates to
> + * @TAG: the component tag to use
> + * @err: negative errno for the failing operation, or 0 if not applicable
> + * @fmt: printf-style free text format string (not a stable interface)
> + * @args: arguments for the @fmt format string
> + *
> + * The log entry will be emitted with @CPER_SEV_CORRECTED severity.
> + */
> +#define xe_log_err_corrected(any, TAG, err, fmt, args...) \
> +	xe_log_comp((any), CPER_SEV_CORRECTED, TAG, ERR_PTR(err), 0, fmt, ##args)
> +
> +/**
> + * xe_log_info() - Emit a structured SIGID information log entry on the component behalf.
> + * @any: the &xe_device or &xe_tile or &xe_gt pointer this report relates to
> + * @TAG: the component tag to use
> + * @fmt: printf-style free text format string (not a stable interface)
> + * @args: arguments for the @fmt format string
> + *
> + * The log entry will be emitted with @CPER_SEV_INFORMATIONAL severity.
> + */
> +#define xe_log_info(any, TAG, fmt, args...) \
> +	xe_log_comp((any), CPER_SEV_INFORMATIONAL, TAG, NULL, 0, fmt, ##args)
> +
Please add severity based helper function such as xe_log_comp_fatal(any, 
TAG, ...) etc.

Since we've severity based helper function for (xe_log_emit_*, 
xe_log_from_*) for consistency (1:1 mapping).

With that

Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

>   #endif
