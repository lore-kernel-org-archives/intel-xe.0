Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE891C3DA5D
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jul 2024 15:05:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 736EB10E135;
	Mon, 22 Jul 2024 15:05:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mCYe9aPP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1BD410E127
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jul 2024 15:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721660709; x=1753196709;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7VlYcAynq46XZV5hAdqyKcWKmIT4smWu63ChJBoXz1A=;
 b=mCYe9aPPc9r2XW+OZRVFNsD3LMV4CwK0A7rGFafToz8WbwXJK94fQ/hN
 k2NiUoCvwVGzSEo9Q4AJJ2CvrTB8CQPV3q68+hL0JTBicoZmL0YKJb+9W
 ijYdiv+wwpCEU/w/EyaSSexzl3WMwOyL2doHBz1ZURL1GY0FLg31rXp1D
 hB8M8JMPnpiArQgTJsCbRy4r9dWkRimM24KzgmsCa6daLdZDpu9Fl3ccI
 I01ehbl7cc3NlDWAJbtag0lYpx7g5ZvF8Gh4OqQCMJ7oFh/P0c/aQpPZM
 xXQCGlGLpQaRhxV2dloEGVimjDzC51G0r/C4SHrDIk68+IFcF6Ef1sr8h w==;
X-CSE-ConnectionGUID: wADtb8OqTra/kyQdeLjRYQ==
X-CSE-MsgGUID: GUkDaEQZTR61zFjwvQ1fyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="36680190"
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; d="scan'208";a="36680190"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 08:05:08 -0700
X-CSE-ConnectionGUID: Tm3dlGDaRD2Xa9zcrMJcvQ==
X-CSE-MsgGUID: yLgiJVg8RdC0ch0oVU2nzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; d="scan'208";a="57034614"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jul 2024 08:05:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 22 Jul 2024 08:05:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 22 Jul 2024 08:05:07 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 22 Jul 2024 08:05:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EOYx/br+4FNJVViZmBIRGN9wm/Fh3xzHEZRRpDN32p+QIFfeF/TPgIyxzEDSdYYAYMmOYVGp+16xAb8WHwZgAy8GgwZBvHNhHLwmKf97KwL9GXIW2QNJKc57V7Md8mQTpXq5an4vb16d8wgavAu9IX3JyG5qaf7Y/G9XUS1pkCTMJu5pTFkWpV+dIPuS5xPNA5f7gQ26BJ4AekEfggQgCMpik4HltnSQgKnwG5SfX9/NfOD9wld61CwwZ/MQ/Hjnqx6oaAOJbQ2+b6p654ZD94ycZBgrifdKKpei02+j0PeoBwVpnfC/jXjqbQJhfXEC3cm3bo5DhifKAlH4Fw62aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+5S6VuX2Ayoki/OMYHvDXR0VETT9LqPLe3FdTpzEiM=;
 b=Au5Tledfn1QLPlCvTorjvc5QUM9oQlML7fAZUlEzqzm2apfprg6Ij+V8/wE/+KJiBcX73vM8aV4K9jDciHbGTPftcixtf8m23fjWoAk4x9Y1KNy95lWBkGZDDW2bDExWgdMHMLlAj3SU9AM5Skv5uQj3WKNXZ34TwIeuuMWc/H84uvb41RUE9DD3yQo1ku4q2TRZKrPgr+yxhz7tT4P+C3rZZcFGaaQ5YYFukww/tsnvlKX59ScOa2ESlmUG3MFgMXzOyaAG6dg8c3mgrLNQM0YEgsKJth9mOpoDwJI5yeAuGP5nuGEFsu5imIvGtL9vnruLC7BXX/CbJj5YvH8dXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB8009.namprd11.prod.outlook.com (2603:10b6:510:248::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Mon, 22 Jul
 2024 15:05:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Mon, 22 Jul 2024
 15:05:03 +0000
Date: Mon, 22 Jul 2024 10:05:00 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Add assert for XE_WA() usage
Message-ID: <lvuog22nqjbp4d6uyzf5yzgm3kvddgwpbad5sjeizvuvdg47vj@w62sdcsg6ffy>
References: <20240716143720.2790982-1-lucas.demarchi@intel.com>
 <SJ1PR11MB6204F828B9BB8DC6E18886CD81A32@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6204F828B9BB8DC6E18886CD81A32@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0368.namprd04.prod.outlook.com
 (2603:10b6:303:81::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB8009:EE_
X-MS-Office365-Filtering-Correlation-Id: 58254025-0670-4713-e0d3-08dcaa5faa0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xv+oQCPn9/ubmyM83sa6JnwtXQRkGaoobGX9lZ92f2Ri213CdgHAud2zzy0y?=
 =?us-ascii?Q?q8MjXIrxodQd082/XT+RFGnKtwnMJIZgcupiXseqqM0p4vwFB2G64S7i+FBW?=
 =?us-ascii?Q?F4nsitOclPutEyEvltPLILvIam4mXURISLXI5qyZWKwDFo5Sx5fXFDV0cNUm?=
 =?us-ascii?Q?yMyaHI+vUhQX03pef0raVUmI3tXfU4AYCvtFGbVL2WgZuWOrOWA/O7GvOrzj?=
 =?us-ascii?Q?4kaSUXkvTrdlhk3dSQEEBWAiH4893gcdkRf+mUtdB+IMMyA7l4nNHWgllxFP?=
 =?us-ascii?Q?V/FtSS5d+IoAgAAFEDMKmevj00n8te4AkCMLjvpoJnXpXxhPI5Ri7UWmj6EO?=
 =?us-ascii?Q?wo1AjK9qEJQrcmsFlYt/QJWYXxbz2NNgHgqYCbLFph0ncrYWYXuOvWFPAj51?=
 =?us-ascii?Q?FvxLpNTg5UeAJxAN16tpFWNXSW8O21o1Md+s3YEssocEYmu42cREXoH92XBR?=
 =?us-ascii?Q?oyacSjWt3GXh4OZts9ku9BWGLZ/5GaxcS3937gMm6+sxXc+AbiTVOsedHoB4?=
 =?us-ascii?Q?Ld9FGrimdI3ZHl2uVBXKtcNoh1Mv5H/9jfpmfNg3F+leyPS1O9DJchBvdAde?=
 =?us-ascii?Q?iu6uNPP3EtmZfTwmxzAi477EKUNVBUCW4BXgy/I/kMYiN9rrV7XJG0gerGhS?=
 =?us-ascii?Q?gyirMcbF/sjuP2lSZPa3onMmdf5I4vXYMSgpaBerD6UqbFR0D4XD19OW7EZc?=
 =?us-ascii?Q?XP5kOAchMcz7AqACfJ1Km/HPXQdVyfE6M/P1zpQoG21qAk5aOx1Kcz6aqwI5?=
 =?us-ascii?Q?X8CUO/UWWtBexxyjl4BqnoOeYJ5OK4lTLBYsNpn8bmwpaDQUl33qtaJzzAZY?=
 =?us-ascii?Q?zNN9/YSF90iWA5V/xB0SIuMD9O/Q7Fv0dxEIvUNLWq5gs7pjands//buagE6?=
 =?us-ascii?Q?7WgSQ25PZC5YFSoqCS6xLGvegjHd6luagseHcmxIRtX6wxMGsa31aN24WosJ?=
 =?us-ascii?Q?1MLUEk7VqAPUOTvgzQeq3QvDHeEuJVBFpej3Pbv1xTrhHtpWf5wA/RAkUP4F?=
 =?us-ascii?Q?8XgrQj9oHkDgyG3ahJEPfx5xyUC42UFoMsdty2ka/ZbL1LTT9I5km1DiEcby?=
 =?us-ascii?Q?/nnb7BgpDtBgON4mKsj6bgRWvUXFJ9Oq8+VsWs9FJWT4Rf9D1Qn3sHvQcnDN?=
 =?us-ascii?Q?4o9V6FN5daoxJlU29cMIqd5+yymRNmeUjUkctQK+n7sJO23dKsV2h/YJ5Yk9?=
 =?us-ascii?Q?CnHi9lGlQvWuNLFchvt5y6K0h6IcEGcr83tQjLWZeKg4x4qBMBa+rdmt2sB2?=
 =?us-ascii?Q?TfQNhIDpAPdDQpnjQuvbamfpi/jO4LAGiq/0JRxsDv9XBikB02UUJc/hFFrS?=
 =?us-ascii?Q?mbreEGf2GgqTgSSS+7icZzaAsU7Pz1dct/VeyoCa7ozvEA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pFWEuZ42IEa32G2y4yh/lwfUPgNaH5HqNOEVwpIVIyTKpbRuSbmj1kcAypUM?=
 =?us-ascii?Q?jPgskmiTsNZz5mjGN6vMvkSWOePWz8qUjjKRHTKYzBPJYfMMbd5fC7+BrSah?=
 =?us-ascii?Q?ajLvl+2lqQVfDB3AVyRdEkmk4CTyFCaQ3KyE4ea294CcnFwtT6/MCdG2kx4U?=
 =?us-ascii?Q?xuZA7bpFyu2CNVFKLbBCCEI/+SK1748zFdngIrDlXRCKUAd05gxqaCcqSDHz?=
 =?us-ascii?Q?8EyRp/mIuHrMAP+mOP+5eAeTT2fC+Ti8Vq96qI4rtF5feFDrKQ9pskCM3ETS?=
 =?us-ascii?Q?rSEgoH7HAOK8PDlUXgXbUNyEmrr7fmEu+uNx0DHS4ULICR7u7CRSnnNB172M?=
 =?us-ascii?Q?mpWdV8t3U3uLIQeTmZnVvJGsXqNVqcQw1laPN5d/hgvbOXc6j5eWgIOC2FST?=
 =?us-ascii?Q?7FWqMLO2ZwFXmb1NemKbGXd7vDjFYowkuXll/e3+fBYrZft0P91imSR2Lj2h?=
 =?us-ascii?Q?/oAUZQwQiHT2fzzhjTO5tlPCAgH4+3+M0hM1zFusC4fk/nbH1lB7Z8saTQzT?=
 =?us-ascii?Q?4CcGYyixtx4OUN4dwMtzPYGq+2Snyr/0SzAFDhV0YLrYUDiIh88CX89GUFZD?=
 =?us-ascii?Q?K+V5eAqJmtFFyn1YnFY9HQTgDW7kTeL+pFs2mQ8SjfglUKyKH9gd0jlchjFY?=
 =?us-ascii?Q?X96day4mRpZZHFdB5cu4KFPDNdmJS/B0kyE6IAsIZIcVzDLW/h3plb5jBRR1?=
 =?us-ascii?Q?b3ZnwdwDzhwKZsJzhF/QwMVoOKZSSOx2Q3+4a2KGxiZz9uOhTwLCq3W+eqDm?=
 =?us-ascii?Q?rt3rhaw1rSvVDA+pr9V+N/E5BDFEUZYqEeEFe6eG3+NV6Eu2JhgzG8z5ooeO?=
 =?us-ascii?Q?4t0ZKVVdOVE7XhsKHhqqE/F0TYL/LJolilBwIGG2xJMmLJtRgLINqf1vpDI8?=
 =?us-ascii?Q?5zCj0YjcpZoMdFII6b3rZum/f7opwCXNR5zkgAI8u2Lie5T3ZmQh//XnPDNn?=
 =?us-ascii?Q?NpoKlrNShmR0pB838Hvudj+HwLOMWaof/VWcYXPoUOO8MlS/T+F9UBwYfmWJ?=
 =?us-ascii?Q?dmmLzhCRn/8AzHfhQBpxpq6uLReXoWfC0ouqsdlyDctJXj30Q3iuBSvlMcMe?=
 =?us-ascii?Q?qQtQl1mccIIBHCa3Ee9DZP8NGEqyIPgQBM+l3eFviQBbXGRwVgCRy3aonIOa?=
 =?us-ascii?Q?G/qc6ffhdbrooZdgS06eTJWka0nwuSymT4+RYOGb/6ETOsd48feNLF7xrJ1h?=
 =?us-ascii?Q?ygxO6a3l1PkjLBiumN+qvL+ZNq1YK/pKtodfg1sPxXW10F5KAH9V2jrZvbGO?=
 =?us-ascii?Q?/abbNHDyw3wl/fTYgX7NDV8Hakjn3rowinJi3w53Qz71Kqkn062K/VKYGaan?=
 =?us-ascii?Q?2oc09std2g2IB5QnghBFcFhMK7vY4VIIm9amD7cpvU4KZAe+uljKRF9E7kea?=
 =?us-ascii?Q?W5zfJlHzvWkp5ROX4I9phvsRCdnX9iJHI/be8Z1wDtEWPRoaVWGjf5Y4u1zi?=
 =?us-ascii?Q?suvan2N1pf6SY2D8FUjXWDzwuQ0n1KWJTNmGlEcRQuZ1grDea8Sag913mdwz?=
 =?us-ascii?Q?P5digRy5WGVInNr5R67Psw/3HONN+hnDVEyJvCNu7ilpxTM7gnw5cjnGj0uc?=
 =?us-ascii?Q?NS0gUbvohhrn05UUcWlOFMB75eXR/LmdXL8viYRGHuOkQEHYjUhLVNGyndW0?=
 =?us-ascii?Q?MQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58254025-0670-4713-e0d3-08dcaa5faa0c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 15:05:03.3244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LDpra3YpeUGB4MfW5bT7dYMitJABx560i/9Qrt6WknDR2vkBHWL9k355XxjpXH45Lo8NeEAAev+q+bi9nynZ/HTS87T9tltvQUreZRMt69M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8009
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

On Wed, Jul 17, 2024 at 08:24:55AM GMT, Upadhyay, Tejas wrote:
>
>
>> -----Original Message-----
>> From: De Marchi, Lucas <lucas.demarchi@intel.com>
>> Sent: Tuesday, July 16, 2024 8:07 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; De Marchi, Lucas
>> <lucas.demarchi@intel.com>
>> Subject: [PATCH] drm/xe: Add assert for XE_WA() usage
>>
>> It's not always safe to call XE_WA() in the driver initialization. Add a
>> xe_gt_assert() so this doesn't go unnoticed.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_types.h | 6 ++++++
>>  drivers/gpu/drm/xe/xe_wa.c       | 2 ++
>>  drivers/gpu/drm/xe/xe_wa.h       | 7 ++++++-
>>  3 files changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
>> b/drivers/gpu/drm/xe/xe_gt_types.h
>> index 38a0d0e178c8..1e790ca0be43 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -378,6 +378,12 @@ struct xe_gt {
>>  		unsigned long *lrc;
>>  		/** @wa_active.oob: bitmap with active OOB workaroudns
>> */
>>  		unsigned long *oob;
>> +		/**
>> +		 * @wa_active.oob: mark oob as initialized to help detecting
>
>s/ wa_active.oob /wa_active.oob_initialized

thanks for catching that

>
>> +		 * misuse of XE_WA() - it can only be called on initialization
>> +		 * after OOB WAs have being processed
>> +		 */
>> +		bool oob_initialized;
>>  	} wa_active;
>>
>>  	/** @user_engines: engines present in GT and available to userspace
>> */ diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> index fd009b2c68fa..de356c024d5d 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.c
>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>> @@ -755,6 +755,7 @@ void xe_wa_process_oob(struct xe_gt *gt)
>>
>>  	xe_rtp_process_ctx_enable_active_tracking(&ctx, gt->wa_active.oob,
>>  						  ARRAY_SIZE(oob_was));
>> +	gt->wa_active.oob_initialized = true;
>>  	xe_rtp_process(&ctx, oob_was);
>>  }
>>
>> @@ -838,6 +839,7 @@ int xe_wa_init(struct xe_gt *gt)
>>  	gt->wa_active.lrc = p;
>>  	p += n_lrc;
>>  	gt->wa_active.oob = p;
>> +	gt->wa_active.oob_initialized = false;
>
>Before this init, mmio read in xe_mmio_probe_tiles() will hit in some case, right?

actually it's before the hunk above, when setting it to true.

> I think gt->wa_active.oob_initialized automatically default to false by kzalloc, do will need to set here?

true... I was just not very confortable assuming the allocation is done
elsewhere and with this it should be more contained on behavior changes.
But I think it's ok to just remove this line, will do.

thanks
Lucas De Marchi
