Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60D5C53219
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 10:13:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C42B10E396;
	Tue, 28 Jul 2026 10:13:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y+RrZFr1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB2410E396;
 Tue, 28 Jul 2026 10:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785233582; x=1816769582;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=z43X+DvEf85xYsiN5Lj9A0VWKwjy2I9KNqKhZ5jUoD4=;
 b=Y+RrZFr1CAuetb/CqZIY6CHiXlRRpmWckOzntcTLnFDPtDOh9LOf7LwV
 skNYFHgv7NHZ+8NWI8s1dqng6NAOGF06HsRoEWBcO19AA/UwXJVdz2xR3
 HfXO0NWTlpknMybU5vtHCpPF/DM9AvKk+I8uPH/LnP1j45jqIV2hPBojl
 5tirxyYrD/Yc8hiOECteJF6NIpAAMzckIgGf0vhZd0SXXn2ENMu4Z5DKA
 4nemSaWjfMb91BOdpZ8U/pGybqLZcfuGsGoR5GEBbp2mSPUiVPBs/0eOR
 Obose8p3bTNC9KRSiZzxQMwf+1vvDPiVA4t/pe8OsQvHPr4CND1SULgM1 A==;
X-CSE-ConnectionGUID: pLgdm3BvThioCLw/M0mG+w==
X-CSE-MsgGUID: 9sQYd7laTFODKsxYYsM45g==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="73350144"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="73350144"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 03:13:01 -0700
X-CSE-ConnectionGUID: 1xpLedAsTju3UUJsIx09Ag==
X-CSE-MsgGUID: S0vPbQVtSCapDv8ROMkBhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="259096703"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 03:13:02 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 03:13:00 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 28 Jul 2026 03:13:00 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 03:13:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ebXTfCgvwv429muunDte7fEW9/YYh98nwNwDUeWX0RdUgtL4bKgBAtHoIzJ9Jwi0LjeQa4sKNWACkOaYgJMFZsmSCkUi7FzxdNAEMHuGh+pbQ5axgaILKjiYXXSFB9/M8xscz+7uBAMlWVl9odw2/bqece/JYwhiajaCb40kSeWRCY+GdscrBKO5keqECkud+QNZQST+RogfQqIcx+HDdNq6S5spHYo5hXgjQ1zzFe/4jwParbsTMu2jzMUf+63Q9cD77yXRAcrK6vMi2e89OxK9C7nuBIHLm4pHBKZQugokOYYhfyXns+rc1padRWXKo2gsAUZeHH6EahJSMxBfTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qvkB0FrDLduisk7oGM7ZuLkb4hDyFN6aryJcIta3iac=;
 b=uqW0cCitwc6dO7YfPeWw61FlW7r/IIn1NW24ppY630M59ccl/1pNPFDrT4/sd/zFfIV/i0go63qoJqzy+nsuo/BLNVUrffpxTCj6hQAQzXAvdIrwOtOMQgXau7SbhqAB1tdEWwaUUwBJHCqEsxhYLdKkuewckH31sueaP/ulzuGRI83Vxx5xGSvrcwfnYlhBlwmOlfkgIuW3P5jjWFOlGIYdsxOMeWiCYsQCZRU4WwAgaQ+r1P7lGfGNLL5QhgKdCrfEEIypeiWFB0njr3r3t16VIMIfJcnNTxtu27wcVzj1uMIMiWCCb7O9Dgxg4EpxU45rQQiPB01hi7vkejGBww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by SJ2PR11MB7574.namprd11.prod.outlook.com (2603:10b6:a03:4ca::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 10:12:59 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 10:12:58 +0000
Message-ID: <65907733-0663-456f-b5e3-86683cd34a9c@intel.com>
Date: Tue, 28 Jul 2026 15:42:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/i915/dp: set VSC_SDP MSA delegation only for
 capable sinks
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
References: <20260709113951.3557968-1-chaitanya.kumar.borah@intel.com>
 <20260709113951.3557968-3-chaitanya.kumar.borah@intel.com>
 <2f89bdd9ac273191ea28665bc48314eb36444d27@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <2f89bdd9ac273191ea28665bc48314eb36444d27@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0080.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::7) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|SJ2PR11MB7574:EE_
X-MS-Office365-Filtering-Correlation-Id: efff564b-060a-424e-d3e8-08deec90cca5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|56012099006|11063799006|4143699003|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: jJwu+GsjU1Rmc1Jzj7LiZytDUllnZpOkFu7ng6gy/H/0gtV2LFyKhwQ8TcIv2Ewy7UYbuO6NtlPQXUVn4B5vD0xgHpHw2k15Q+xU4BBLPqwJT8B25pItpk4z+9pfMt/B7kNCpL+Za2uWhzwkKp2+wS+m+qaISRgJsZbv+NOHTIba+Dh2dcbV+N81o1PRWiqh3qbnAk81rRQugBBTCYGLE1BglVhKYty1/dh85oD7A5bh4cAOjYG0U/49OfS7CwDHBFQ4dLxeREFCtsO2ycUm3WbcnwFuqETc83LxwcOMwXJfYDOuUiQGELrC4tiIepQRN1JTPByGWlmpSQ6CmrEIQKCjSrIuf/xMcXLbWpnx9NrO1eq8Yt2LedFC9QQzIayKWEDGuHDAeosfszbVZylX6huGZLLnZDwsVQhpbDfkiLO8XNln+vIRHvgtOFF5rQNSF+0mTkFLgGuMTjo8cP/yE7DgqHKX/rxvU4Vvu7uoYCAO8rHaKQRKkg01uD6qIEpJCX6An059x3BX4TiRkori/D5vyDHaKk2R0RrHEvQm87k3TfJjC9Oms78CUR0Hc+v3zU+vOO4Fx//MmNX3wIt9+8KkctIQr7gzrcYlMXt1sg1nj3QLgB7M9JS9ydRxeJzHE3PqrfjQp6ESCH9PCw9MGj1dOwnfbLTsTQjhFJEooc8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(11063799006)(4143699003)(10067099003)(3023799007)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFFlV2dBRjRrRmM4Z0NDeU82UnBENm8xU2FnL2NLcFM4NlNCY1lQNFBFSU53?=
 =?utf-8?B?NkdVTGlYb09BUTk1SW9ObVJzQytWc29PV3JxbXZtbXlzMkMwRXZ5WlplL1hi?=
 =?utf-8?B?Y0czRFAxZDlzUXRHUm5pZldxdElZMEZYenZKa3VrRHhxYWFwcFRONnNUOSs2?=
 =?utf-8?B?a1RZWmdLR1BycEJlUXBBTWtmSzhrUDlVdUZkTi9vaUkxb3VQckVkTE9qRVRS?=
 =?utf-8?B?WVRXTlozSjJsaE4yS2RDa3BYdjM0MDV1K2t2UTlRS2V5aFpveGRwblV3U2ZR?=
 =?utf-8?B?Z2NRRnFkNUw2Y0xNQWlYaGVaSEZQWk9OQzN0K0xFbFU1VUZkNWZtalUyblQ5?=
 =?utf-8?B?V2tYQmx1VzkxNzc5dlZlV0tNVVp1UEszWkN2N0d4SXJjSVQvbk43ZlVlTzVS?=
 =?utf-8?B?YnZTcVNERDB3VUNVTFlnWjJUUElRNnBuZktPWERybzIzOW43YktPYXpQeUtj?=
 =?utf-8?B?NkZIVldHcGsrMnVZNmpwZFpqTlJaUnVIRkFTZmJ3QkszTWpSUjBPdy8zY2RY?=
 =?utf-8?B?UU54elpRRUNrRU5HdXBRaTBhRjhoa1kwckVyemRCTnVORWNIclRhaVZJR0Zt?=
 =?utf-8?B?QlBpUjRoenVEMHV2RFJSUnJnYXBvbVdiWWdjK3ZPeWtqSDhtOXU5TVFwaFdZ?=
 =?utf-8?B?RnpKb29OL3E2NSs3ZXpWWkhYYVljWnNHRUtGUFh4MFkyVUFYVm1kQlVHRUEx?=
 =?utf-8?B?dTJRejNJSEd5djdlalYrbElkalZBMHJEK0pkdExjQ3BHa0IxM240TExWbStX?=
 =?utf-8?B?akxoK21Sc0diYU9wdWNraVl2RHhFZGxWa3VUem8rV0I4UVFHd21mcmdncTBC?=
 =?utf-8?B?eTNQWGg5MUJRa2pNdGZlN2dGcjFhbWs0UjRZUmRQbTVaR0M0bWlZR3RVdXNL?=
 =?utf-8?B?eWNJOTBWRlBSYmlPb2JkSHViSndVdzBaclM1cGNxTHRtbHdiQmJDWHNPMk1v?=
 =?utf-8?B?N2t0STNCeko1dFhRaWxha2NUVW13QWRxUHM4MTJqd2VpQnJKeEdFZ2hBajdq?=
 =?utf-8?B?L3BZT003d1M0SjlqdEpTenF2REVwQmZwN0hVT1VqclJyaVQwc25FY2lueVBN?=
 =?utf-8?B?ZEdFMnVCK1pFZHV4NFRnTDc3Sk9jaUQ1cWNLR3pXWXZmeWN6MW9HS29hVEdy?=
 =?utf-8?B?cGt1TnROODlwUVBBa3dhU3paNlBvSlh1MUhvUUl4SXZweHFQc29kMEdydkZ1?=
 =?utf-8?B?clU3aC9HQjhocU05RGxkaGE3UVluYnU2S2M0aTlqNDI4R3h3OEc0aXRiVVpq?=
 =?utf-8?B?RUxuWmpTYXVvMDZYUll4ZDI1VFBWOHJEdDRsNUp5MzB2S0xYRUN5eHM2d3R3?=
 =?utf-8?B?a25rTkdEQUdJZWVqMG4rcmlJVFh6eUd0bDZUaWs4VSs4Sm81bUFmNEg0aThw?=
 =?utf-8?B?R04veTVyeE5XR2dzb0NpMkR2RFBZdXhXbkxMb256MXE3b0ZMN2tLWFBBYlJy?=
 =?utf-8?B?dkJLY21CVmJUaFJ1L3BlSXQ4cVQ2aFBiL2UvN2dYdi8rVWJwY3hFb1liOEpw?=
 =?utf-8?B?UzJlLzdzdm9Lazdic25jL3FrRkxFTUFxMytibW9NVG10ZStVa3h0ZWh2aVNR?=
 =?utf-8?B?TytyU3A4OVlndEVTaFBRaEh2cUNUNllRMHZDL0JaWE5MdE9OTTlqWG1GOWFC?=
 =?utf-8?B?VHV5NEhHeUxpbi82R3lQbjd5QmZFWUJQY1QrSU9UTW9FOHZ6d2VtTXUwZlFX?=
 =?utf-8?B?TXZxc3lReU43ckwrUzNoOVIvS0dYR0lTS2RkVHBKTHJ6NzMvYmEvSnAyL3p3?=
 =?utf-8?B?R0RkeVJsdHpMendoR1lhZiszYjh4QVVSUENIajF1VzV3RFVmejV0Mnk5NmVH?=
 =?utf-8?B?dGppY2ZkYXZqZXphYURNUUlSQWxnZjd2ZTRwSU12YXE5MVBZdTFLMGo2NHdU?=
 =?utf-8?B?d0hZVzBUa0Y5QnZvMUxJU3RLNmhVQXcwNEtRYlE1MThZMEM3UndDVGo1MU5t?=
 =?utf-8?B?T1NocFVrdCtaS2VoR2dDdUZ2Q092M3BKTExIWW8wcGR0emxVOFNwMFpWbXJy?=
 =?utf-8?B?bHFQM2k0SlBGZVVNVXdPK2ZubEFrNlB1SlF0cDhvMUNOb0g3N1J5K0V2cHRk?=
 =?utf-8?B?VEVOWEFUMVVnbTYvR3I0SVR3RUNnenNZbEM0c29DQU9aUmR0cjNLeG9LZ3dE?=
 =?utf-8?B?TEJjdVk3RC80VGVDNzJuN3ViYlQwWlRLWWo0a3dsVzU5QW5vSEsrN1IyaUtR?=
 =?utf-8?B?NXdwRkxIYUlNRUtwWlFQZnE5b21yTFVlQ1pibk9wbXJ3Q1gvWUVhWDJKTlMz?=
 =?utf-8?B?NE91cFQ1Vk5VaW8yNUY3UnVqbTlRQWYrK0hlaE5MKzN0aStRa1JjZEM2QURl?=
 =?utf-8?B?bTF0R3BHZEoxMTF5WnVMUkxnb3NLRW5vTk83aWdFVnB2SC9tbWhUSmFMcm1W?=
 =?utf-8?Q?+b3hN38BWkSCkPV4=3D?=
X-Exchange-RoutingPolicyChecked: SaufZQZjQ73ZEyjCpjFUFs/zV30l5ETukARTwPrB3fdIWT6bOOK+UHGdroId8Xnm50uMUFyx0U04xh+x9DOveO+8smDRTApLErsD6mDhBm4hT8Y5ncJl/7YxSBXqDBghbYihCv/DNQn6oGkCsSDZaqrd/SPetv92Qm7wOuiKLr3BuKb+WcO/IQ97oCaLAH6uijMadwfBk+KynkCmk4s2WORI0VyNvnoo29PVURRmI8kbso23qejsKfPaXDn4zF526UJgjyTDEBa3Uls5/pPBfyiSxf+oNrFpGwDequ6ZvToyuax9IRRaRIamHWDYGhQo0DOYvEWeS/Z0nPRfFoB7Wg==
X-MS-Exchange-CrossTenant-Network-Message-Id: efff564b-060a-424e-d3e8-08deec90cca5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 10:12:58.8833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQg+HBguRQza1GJaVyWW+sgEqHOZvD3+Rj5LC5O+WsZ/xUJQbZGiR7oLFrkHjL4Ou+TyJNWQcyqHe1zvdY+48ht++tYjyrADrMJqqblz8R0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7574
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


Hi Jani,

On 7/28/2026 3:11 PM, Jani Nikula wrote:
> On Thu, 09 Jul 2026, Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com> wrote:
>> Per DP 1.4a section 2.2.4.3, the MSA MISC1 VSC_SDP bit signals that
>> the sink should defer colorimetry to the VSC SDP. It should only be set
>> when the sink advertises DP_VSC_SDP_EXT_FOR_COLORIMETRY_SUPPORTED and a
>> VSC SDP with pixel encoding/colorimetry payload will actually be sent.
>>
>> Fold the colorimetry_support check into intel_dp_needs_vsc_colorimetry()
>> so both intel_ddi_set_dp_msa() and intel_dp_compute_vsc_sdp() share a
>> single consistent gate.
>>
>> Assisted-by: GitHub_Copilot:claude-sonnet-4.6
> 
> Who would teach Claude to add proper Fixes: and Cc: stable tags so
> important fixes actually propagate to users in a timely fashion?
> 

I would have to take the fall for this one instead of Claude. I 
intentionally did not cc: stable here because this is a pre-emptive 
defensive change - only necessary if the user space is acting dumb which 
has not been the case in the wild (only a internal ticket). Therefore, 
there was no Fixes: tag either.

==
Chaitanya


> BR,
> Jani.
> 
>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_ddi.c |  2 ++
>>   drivers/gpu/drm/i915/display/intel_dp.c  | 14 ++++++++++----
>>   2 files changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
>> index c764472bd69a..13010375e21b 100644
>> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
>> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
>> @@ -469,6 +469,8 @@ void intel_ddi_set_dp_msa(const struct intel_crtc_state *crtc_state,
>>   	 * of Color Encoding Format and Content Color Gamut] while sending
>>   	 * YCBCR 420, HDR BT.2020 signals we should program MSA MISC1 fields
>>   	 * which indicate VSC SDP for the Pixel Encoding/Colorimetry Format.
>> +	 * Only set the delegation bit when the content needs it and
>> +	 * the sink advertises support.
>>   	 */
>>   	if (intel_dp_needs_vsc_colorimetry(crtc_state, conn_state))
>>   		temp |= DP_MSA_MISC_COLOR_VSC_SDP;
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
>> index 93282694c29b..53688c5bef74 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -3163,8 +3163,7 @@ static void intel_dp_compute_vsc_sdp(struct intel_dp *intel_dp,
>>   {
>>   	struct drm_dp_vsc_sdp *vsc;
>>   
>> -	if ((!intel_dp->colorimetry_support ||
>> -	     !intel_dp_needs_vsc_colorimetry(crtc_state, conn_state)) &&
>> +	if (!intel_dp_needs_vsc_colorimetry(crtc_state, conn_state) &&
>>   	    !crtc_state->has_psr)
>>   		return;
>>   
>> @@ -3173,7 +3172,6 @@ static void intel_dp_compute_vsc_sdp(struct intel_dp *intel_dp,
>>   	crtc_state->infoframes.enable |= intel_hdmi_infoframe_enable(DP_SDP_VSC);
>>   	vsc->sdp_type = DP_SDP_VSC;
>>   
>> -	/* Needs colorimetry */
>>   	if (intel_dp_needs_vsc_colorimetry(crtc_state, conn_state)) {
>>   		intel_dp_compute_vsc_colorimetry(crtc_state, conn_state,
>>   						 vsc);
>> @@ -5103,11 +5101,19 @@ bool
>>   intel_dp_needs_vsc_colorimetry(const struct intel_crtc_state *crtc_state,
>>   			       const struct drm_connector_state *conn_state)
>>   {
>> +	struct intel_dp *intel_dp =
>> +		enc_to_intel_dp(to_intel_encoder(conn_state->best_encoder));
>> +
>>   	/*
>>   	 * As per DP 1.4a spec section 2.2.4.3 [MSA Field for Indication
>>   	 * of Color Encoding Format and Content Color Gamut], in order to
>> -	 * sending YCBCR 420 or HDR BT.2020 signals we should use DP VSC SDP.
>> +	 * send YCBCR 420 or HDR BT.2020 signals we should use DP VSC SDP.
>> +	 * Only signal this when the sink advertises VSC SDP colorimetry
>> +	 * support.
>>   	 */
>> +	if (!intel_dp->colorimetry_support)
>> +		return false;
>> +
>>   	if (crtc_state->output_format == INTEL_OUTPUT_FORMAT_YCBCR420)
>>   		return true;
> 

