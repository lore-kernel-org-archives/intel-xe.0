Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 210BEC44501
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 10:00:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B5210E762;
	Thu, 16 Jul 2026 10:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UnfDscHf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40FE210E31E;
 Thu, 16 Jul 2026 10:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784196053; x=1815732053;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zQ2VpVr4jevuDKYSMtbPcalFzm0uONqLaZydd79DVJ0=;
 b=UnfDscHf5y5HPXY8H19L38I6DRgXKR2N7nNpJHInqsi3ZvlcXgro9aXC
 KzudVIXwzlNRcMcliWUZZUnEXBF7qR6q3eJEzblzSnpE6g/mYf/rHdwAG
 Q5e1fWTD87wLe+S2jcI0rUZBNLDnPpWA2KjvOrF28ao7t1Rv3730qih23
 yAIRMj558b59tuDR0GkfpiaPBXJ+oVTBl5ieBqvH7sN6ekMSTWNgcZLD7
 KAAMMLiQqg/TP8/bF6SOZ42Y7FaeZXmIaCB+49RaLiowVn/5eyd3AgADp
 lBVIcDpi1LddRa0CL5IgUs3siR7QNcKw3LDMmXKF8s40ZitkVOQmDmL+N w==;
X-CSE-ConnectionGUID: 9HeYgaObTaaITAeBQZ3hig==
X-CSE-MsgGUID: RJ495auDR2ypLjt7i7dlww==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="83834234"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="83834234"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 03:00:53 -0700
X-CSE-ConnectionGUID: jW7+KuS5Qu6Nq0NpvaUQHg==
X-CSE-MsgGUID: RMJL+AYbQh27DUu9xYOvoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="280903092"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 03:00:53 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 03:00:52 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 03:00:52 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.68) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 03:00:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NgL6j+mXlvAHyV5oi7fS6xSWx0wpKxZ3pMVn+czReRVUljTJiXDxBRq6xjF0DqOrCNW8x+fITP2IWmkNBF+ak/9MAFRRp5VSwzlmHuhVAKgrwabb3I2SN3Wm5dP9fsSMFFyOy7Aaj/2NlZ+gI8vcF+9IqejkrQmUaVjSFQhksHKR2PxExcMTKxzXJu8vZt0S2VW4obEaXNY4JGkoY7FfDe7mTiqbNmeELFRUHKsmNrfIGjXaJ4cnBb7xMCwBTJ3vW5XxKDulwcusRZ+MEuMZnbyevL4iogw04pnmkkOWe+DVMjvfFqYIGUbAvoCo+VqTivT/ZIaSjQsxReaDVH14rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65rIuENslHJxxabTiTu68Mm2aSYWOO/+Vl/SV9Ws7pw=;
 b=MKKv8e8vmzn6alkXYGM6SatB8Ja2oSgVT7QmVLeDC+uZdJjrALFsB5sQLJ9I3GqHt0hGFpw6/dqbwfVF70uFwetFfWR/CuHBYB0RtMnP1IOX2PxsG1xYn7d229VsuAHwvPhU1qfSFeQT2FCmPIs8d3BfNRQwGbH81aQUEQOzeO1txeatkCh2AOOw0rQif5UUTxzm0jdFjvXWb0/YMBQqttaJLe/fHUV0AzxZBkKP1oTrY89QBkB5BQXWFBwiRttSNUPrgIgA7ahJrU4vpSXuIJFAL3xwz/79Yyd/kL3ePzsy7TPJrnonXuEVv4iatxXuBzpuj1yOlm2dLe7/pRm9Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by SA1PR11MB9851.namprd11.prod.outlook.com (2603:10b6:806:4d8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Thu, 16 Jul
 2026 10:00:49 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 10:00:49 +0000
Message-ID: <0a455c35-0815-47f6-844b-e546dc73a6d6@intel.com>
Date: Thu, 16 Jul 2026 15:30:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/display: expose blend mode on alpha-capable
 planes
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, "Uma
 Shankar" <uma.shankar@intel.com>, Leandro Ribeiro
 <leandro.ribeiro@collabora.com>
References: <20260715054221.451421-1-chaitanya.kumar.borah@intel.com>
 <ald2qKro09WTer7_@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <ald2qKro09WTer7_@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0192.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::10) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|SA1PR11MB9851:EE_
X-MS-Office365-Filtering-Correlation-Id: fb65f2f1-03c1-4b8f-e53e-08dee3211cd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|6133799003|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 0q7BMUbSEw0otDn0akAKi0c9f9aZxizxZ0IsKqP6mrkH5PHYAZWIpW+bfEfrKQa7doGpm3dPxBmGj8zTZ+hkqOXRQe9ze7PDLJyCz0uP8wPFTLmF9Bdd32ay9lbPXSz1mdns/8QBq9CeI4YENDdTfIEaXr3sn7BGiekeFbrP495jl4+tVP5Kc9a71Yi86lk4+8DaT2WKKnrNJ2AbT/bUPGxS6xwzBzn9VGxnTWYxdxfkigUumaE6BIjYhR52Z+tEj0Jj97YbMBgyFPalZQPqE91hk/Bi6SJH2kkUxyHlB2B1LeKitYLwFHM4C5/lWW7YTpIfM8BwxzSKclLCxidq1lq/kqTNDG93YgxDtoVXrm2mV+N9gGoLR7S3f/BevFGSd/zrmM4ZQCLPNF3EJxV8RYSfwFu9V2kt52/E+mlE8RlC1f5ggZ6H8kROMQaAWliZpSrU0zLKhKqa979H+xlvo/PPERw0GffhX4z9DXXcvYRoZ+5h6Na5CIG64KOLyUbGjrBskcFJDa85+2zN1FeGFKejzEAJA/INaNDcFfR5BKSv1/9BWYw4tBX2OUgqO6poBeTCebRs212N6En9eC07OHlr0uDNlSYn3AlveIhEvAconXgLgZLOjYBdMpQ+ZY5M
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkJCR1pNRTZWMkIrL3lNd01ibStMdUVYQ0hKNlBERyt6SjBQUE1Tc2FLVmJ1?=
 =?utf-8?B?Z3EvTUFrYWRyV2hGYmF2WDlPRzBRQytIUnNCdGFmZGxNRHMyb0Qwc0wxNzJJ?=
 =?utf-8?B?ZzdPVnhhUGlpTEtVRFVpeFZVTzhIbDdrb1JZMGMyV3UzcGd5enIvdXMvbjlC?=
 =?utf-8?B?QU5aeFVTTVV4K1UzcVQyNUVTVWNJTGZDeUxqcDhHektaMFlDTld5TzJvRW1s?=
 =?utf-8?B?R1ozVUs5NjlVWUJoSVUvRW1iN2ZSYzgybEdZU2p4U1hnMWNPck8xTkpsME52?=
 =?utf-8?B?NERId1BiTjd3UFlRcTQ4MnU1a2FXV01vOWdUZ2tlc3hBNzVPamlKRnRpUlVs?=
 =?utf-8?B?alg3Rjh4YkFEalk4S1Z5Q3N4VXh4bTdsT1J6T0RLOVlMUkR1SGdqY3dlR2ow?=
 =?utf-8?B?NU5ocEpZWHpsRU8vRVBGRTQ2V0xVOXZMeEZ0ekVkRTYrTHJ5MlBaeWlaNyt0?=
 =?utf-8?B?UGF0ajFuVnpuclpHNzJPNjRCYnpHNTBoaHlxK2s1RHoxcy85NUZVK1dpVTBo?=
 =?utf-8?B?emJUcUF5RG5FSkhxbjVmWFRUd3M5K1JnVC9UN0FTWlZCYzkrelYwc0pqRDUz?=
 =?utf-8?B?V1JJeHFXNUNUNDlPMjhxNUhoaXR2SmVRZEdRcWYyZDlpZEgrcDR3S1ByZ2dv?=
 =?utf-8?B?UXoxUGNRdmpkcHBpY3puTVJOZ3dSOVpFcHc4cG5PZmlyNUJhUXNEaVZFSjla?=
 =?utf-8?B?Z2VSSndNY0N0SnRJUTA4cnB0dm9KQ1lQRnBIRm56dHlENXVBb0pEYllrRVZw?=
 =?utf-8?B?WjZyeEhLUzF5Z2hobVZWQ0FlWDMxWTUxWjJwQThXYzNWQXFLYVNHWkFiTjE0?=
 =?utf-8?B?VEVxY3RUTnYzRU5qU0Zoc1JWVXRieUpwR0k3UUUxMW84ZjdPbU1EQXdpWWpP?=
 =?utf-8?B?OFVQVklkY05rSTlsOFh1YUUvV2trb1Nvb3BlNDd0MjR1T2ZvdW15Y2xxY1kv?=
 =?utf-8?B?RjAxZGxjMzNPb3RYTzBndkxVNGZ3VzVsb0xvTjgzTXYyT0k0dzZxNEhvY3kx?=
 =?utf-8?B?NUhlUHZrRWtiMjZkN0V6bWFaVE9LMVNCRXJtcUZUeHo1UC9zVWVwSzNJdmJ2?=
 =?utf-8?B?Y2xCa3ZNdnZyOWhIek1jdndhWnJhaGVIcjNqZjEvUnBGMUtVVU04ejNja2NE?=
 =?utf-8?B?eTNUTnY5VkxXajhNOWVldHFhUkR3NFEwQ2NPOHplTmhCbWtnTjFSYWk4MnRt?=
 =?utf-8?B?cnpGcGxyOGNkQjFGSkRKV2l2b3FocmM4TXFoVmhiWU1CWUtMck45RitqY3lU?=
 =?utf-8?B?NndtdXVnWlNsbFoxUkNiRk92WDFRcWtXZjZMMUhaRXZlYlZQNFlMeGtrOTl4?=
 =?utf-8?B?K2J1MkJFR1JoQUNmVExqYitIR2dkUG1hMDBhZktPaVZMZmx5UjBpa005ay93?=
 =?utf-8?B?aUxVVExMVXp0Z0piZ25EVmZUMTg4WFFaRXk5NndPRk9CbnVpTVZHbC9MUlFQ?=
 =?utf-8?B?dXBJeG81TTluTnJVc3pCTm41djBqeU9LUFdWSlBzMTBMUXpKOVBOMEZmRjV2?=
 =?utf-8?B?amZvRFFrOWtJck9MWFdXQ2hnSDF4aDBueUhpbUtaL3VMK0tpbjRieGJtMlVB?=
 =?utf-8?B?anNWQllzbG5rWHJ3WjJyWEpUZkduM3RTVCtlTFU5S2crOC9UeDJZa2htV1dj?=
 =?utf-8?B?NTNUaWt1bEpOR1FuM29OMXJvaWxnUlM2UnFjdmQrL2k3N2FZRUphQ0ZodklU?=
 =?utf-8?B?aUxSYUxmQmVVRlEyb24wRXVGVlVQOW5QbGVqOC83a3c2V2JneGhLK1F4UFlr?=
 =?utf-8?B?ajJFUXZqVUxVdmRIL2VRd0lDSGVFOFRydTJXUjdyMVFwTXA5NkgrTmxIdGVt?=
 =?utf-8?B?RkoxdGx4RUVOM1pGK3Q1VEZEK2RnYjVFMXB6ZGFUSjd4YzdsZE1nT0E3OEtE?=
 =?utf-8?B?ZUdJdnlkWWdGSklyeGdYUURzZkxHbFE2eFB5S3lkV0RlUlBpeGNINGc3a3NY?=
 =?utf-8?B?QVQ2QmU4anEwRGN4MkJwY2VheTBVc0c4eC9xYmc5SklPV0h6OERxS1NlYyts?=
 =?utf-8?B?SE9peFFaVTNEWW4rRlBzUmRrclR1SVZXZStkYnFMcEh3Q0pncUhGQUFQc3BM?=
 =?utf-8?B?N3ZyblU4R282N0U3Qmp2VFJ3aU1Uc1lzaVM1RmtGT294VzZZbkpJbzBNaDVa?=
 =?utf-8?B?ajBMYWtITGRnVDBrR1FxeEN1OU5Ub2VpOWVlSExOZGJ1S3MzL3NtdVJiU3JQ?=
 =?utf-8?B?Zy81RWlYbnJvOGpGSEg3WmdzcVZFNmE2YVZGbjd1MzliTTA4UEVveXpsSS92?=
 =?utf-8?B?Y2RkcHZJQTZ6ays3UGUvMm0yc2hvVUpwRkZKQVo0SHRLaHFUVnYrM3VSNGw2?=
 =?utf-8?B?dFpGWFdxT2pQU1dnaVhwcXRDVm43UFNuMnFYeExjSDhGUUU2eUpKL0tBK2xq?=
 =?utf-8?Q?1v0GtKv20mo4d5Io=3D?=
X-Exchange-RoutingPolicyChecked: c5BmlZ7FilEB21DNg996MyJW2EOJ3s7KPuu57n7bOxNl+fq9ypXRlr1Vrrg/LusKVVGjPuKGmMy22qjJF+apdvxMYdY78q8YLKyFDhL6XrVfLsCFBST80mlQ1f7xjjm4WkrzQVFScVpbpPeHUjNSSbt4yM/BUcdeR7GN+fjLlPd817D2QpDqqFwogoAkF8hG/B/Klba2uA6G1/twCyu8ltEbeTQwAtJERAzS1VxRPKlYOu+ZZICsHjYUV999go0nZqGJUFMe7wbaojFlnOQCOJZzsVF/WF9Q8IGci4SXMKA6/2zZQjeXWEUwUl20/hfvMQVmoY9fp/u4xImryPC0uA==
X-MS-Exchange-CrossTenant-Network-Message-Id: fb65f2f1-03c1-4b8f-e53e-08dee3211cd2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 10:00:49.3439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ux1BrGLj3RgX6h8VAbVnA+4lSLqIa8s0ITMJvRBKpKt0ACpXc/pmscmCRonY3ioJQtMTehMX4BxjIKT1/dKQ65PCFcFe3Ei47VBmBviA5oc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9851
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



On 7/15/2026 5:31 PM, Ville Syrjälä wrote:
> On Wed, Jul 15, 2026 at 11:12:21AM +0530, Chaitanya Kumar Borah wrote:
>> Since commit 860e748bddcc ("drm: ensure blend mode supported if pixel
>> format with alpha exposed"), drm_mode_config_validate() warns when a
>> plane exposes an alpha pixel format but not the "pixel blend mode"
>> property. The cursor (ARGB8888, all platforms) and the VLV/CHV primary
>> and sprite planes trip this.
>>
>> Userspace has historically assumed premultiplied blending when the
>> property is not attached, so it is safe to assume that planes that
>> did not expose the property already blended with fixed pre-multiplied
>> alpha in hardware. Therefore, expose a "pixel blend mode" property
>> advertising only DRM_MODE_BLEND_PREMULTI to match that assumption and
>> silence the warning. The cursor call is unconditional; the primary and
>> sprite calls are gated to VLV/CHV, the only platforms whose format lists
>> include alpha formats.
>>
>> Assisted-by: Claude:claude-opus-4-8
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Cc: Uma Shankar <uma.shankar@intel.com>
>> Cc: Leandro Ribeiro <leandro.ribeiro@collabora.com>
>> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16623
>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> 
> https://lore.kernel.org/intel-gfx/20260522194935.27411-1-ville.syrjala@linux.intel.com/
> 

Sorry Ville, I missed it. This patch got fast tracked to unblock CI.

==
Chaitanya

>> ---
>>   drivers/gpu/drm/i915/display/i9xx_plane.c   | 4 ++++
>>   drivers/gpu/drm/i915/display/intel_cursor.c | 3 +++
>>   drivers/gpu/drm/i915/display/intel_sprite.c | 4 ++++
>>   3 files changed, 11 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
>> index 70734d32a409..490908f59141 100644
>> --- a/drivers/gpu/drm/i915/display/i9xx_plane.c
>> +++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
>> @@ -1108,6 +1108,10 @@ intel_primary_plane_create(struct intel_display *display, enum pipe pipe)
>>   						   DRM_MODE_ROTATE_0,
>>   						   supported_rotations);
>>   
>> +	if (display->platform.valleyview || display->platform.cherryview)
>> +		drm_plane_create_blend_mode_property(&plane->base,
>> +						     BIT(DRM_MODE_BLEND_PREMULTI));
>> +
>>   	zpos = 0;
>>   	drm_plane_create_zpos_immutable_property(&plane->base, zpos);
>>   
>> diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
>> index 88384dea868b..0673f16f6fd0 100644
>> --- a/drivers/gpu/drm/i915/display/intel_cursor.c
>> +++ b/drivers/gpu/drm/i915/display/intel_cursor.c
>> @@ -1078,6 +1078,9 @@ intel_cursor_plane_create(struct intel_display *display,
>>   
>>   	intel_cursor_add_size_hints_property(cursor);
>>   
>> +	drm_plane_create_blend_mode_property(&cursor->base,
>> +					     BIT(DRM_MODE_BLEND_PREMULTI));
>> +
>>   	zpos = DISPLAY_RUNTIME_INFO(display)->num_sprites[pipe] + 1;
>>   	drm_plane_create_zpos_immutable_property(&cursor->base, zpos);
>>   
>> diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
>> index 6a65f92e8a03..3e38960bbbd8 100644
>> --- a/drivers/gpu/drm/i915/display/intel_sprite.c
>> +++ b/drivers/gpu/drm/i915/display/intel_sprite.c
>> @@ -1722,6 +1722,10 @@ intel_sprite_plane_create(struct intel_display *display,
>>   					  DRM_COLOR_YCBCR_BT709,
>>   					  DRM_COLOR_YCBCR_LIMITED_RANGE);
>>   
>> +	if (display->platform.valleyview || display->platform.cherryview)
>> +		drm_plane_create_blend_mode_property(&plane->base,
>> +						     BIT(DRM_MODE_BLEND_PREMULTI));
>> +
>>   	zpos = sprite + 1;
>>   	drm_plane_create_zpos_immutable_property(&plane->base, zpos);
>>   
>> -- 
>> 2.25.1
> 

