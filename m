Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F68C98310
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 06:54:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B5CB10F33A;
	Thu, 24 Sep 2026 06:54:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FI5rLm39";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9630A10F339
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 06:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790232876; x=1821768876;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kakVUZ4s8jpXioGzJzuy71XKhmVQughWzUNy81Ehe0c=;
 b=FI5rLm39IZrws4ldciuD9N5Z5upuicjltWll0JTGCNsQYLpwa9b4cG92
 aav6J7AEvWVCIPVxdGDK8z75XXkrQfhZslsO7k8fDFXacSf8vawZ9AE/D
 sUvxF5Laaf+56ckmHDwBz21B0qjTswsn04JHvLW0X3CajU0V4wz1fUMnh
 i5cN1XQ45prsOviIrFSstnQoD8Q2h+0WeVssnhCRe0pwfmnrlOr6At1T3
 feEG582hTsPKiRlSnjB+CPV/rzjnaAMNyie9VkAI9csAleI+oaT4HMSHk
 UfDlzf3CWkLuv0cwS49l+Vxb6m4BliFpkM7iUEX0P0mK+Ls5pjxdCNrUE A==;
X-CSE-ConnectionGUID: GHdBw8FxQ6q0ZdMd4ZKqBg==
X-CSE-MsgGUID: 2+f4yAtxR/y+OWVqoprm/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="1488559"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="1488559"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 23:54:36 -0700
X-CSE-ConnectionGUID: MT+cARq7T56KjbuJ9b+2eA==
X-CSE-MsgGUID: 0iaC8BttTJel7f8uGDRUuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="272530635"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 23:54:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 23:54:34 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 23:54:34 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.43) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 23:54:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SrVqPDt9f5699Z06Ef3O6jNRlJEjs/Q2nrThOPUDYCcdzaPK05XV/SeB4blxehe0wlCfNtVscNa4au54x4l1y6B46bIzsEXKGStSVt1lX1DwFMIBeVKgVXJyjNXiTSVAQ8NXSNxQlPoUEC4DyB2iYf6md0rZJXjFSvQCDE7NXqzLrG3DnS8iynULvPcKa4raVKrECl9WX+5sI77s2M/Z4P59hgMFQyqkJrzAdRfAMR05zSOAc2ZlPPvIrx37JuEe5j5W9c4OBEtjuIcNr1OW8Rx9YfWM6tkKNU7LPCRrN2AjB3kkUXeFZzxudKbQ3BftXlge7ADXNuJ1PoAjmo5GZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aPCoZVoHsoWJgbOYJ+V+IohZrfhSN6QwvZZjZkcKxCc=;
 b=SJuj0TQZZL/ENodNEBg5DhYxR3w8rENoWsupiovrkqVnp0hBktCdYNImWgEpnuUCK1BEnPwTGitFeimvxg/0oZwjq4OVlAz0c1aW7n3M36lF4fK3HlTc6TlZAbi+hnh9sgBWwr4Ub1SpsIly/d0Dq6SZG+45JMRrQZCboX9qeezG5yjCi4yFQQSssgFg5GCxbqbhTUYeOwf7hLhAVJdNWV1zsH6vfgGORc3A79TDMgQHomhgRhODmHTe1cdodG26ysQG+AmKYPOjghHFeoiz8dHNQbONjhLGH9t+xRGG0hqLFhFZQ53ffXxCiz699o7lJt3GmEB13CpTswTaRESjxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by SAWPR11MB9921.namprd11.prod.outlook.com (2603:10b6:806:54a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 06:54:14 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 06:54:12 +0000
Message-ID: <92ab8d6d-7460-43f4-8c04-925689f9e598@intel.com>
Date: Thu, 24 Sep 2026 12:24:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] drm/xe/hwmon: Decode CRI temperature registers as
 IEEE-754
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
References: <20260910182756.638830-1-karthik.poosa@intel.com>
 <20260910182756.638830-5-karthik.poosa@intel.com>
 <aq0Ot9mwpR9LgUzs@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <aq0Ot9mwpR9LgUzs@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0323.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:222::13) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|SAWPR11MB9921:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bce0712-64be-4dcd-f7ed-08df1a08a40a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: g/YxLNBtEgt2K4eHZ4egPLO7PJS3fChdMQYwrqef4t1c3GFD06TM1cUYNdsA/uru+HSjPvyXcIbOGOJ5MX0MCv128asgmI2Y2kF08REtO0BqMM0WbLTg1IZS45GnbLqvddvm9EutgbbdugXcIqPyWMzWd3nCvjkpMxXmtSEEkfMKzpVKnlZ3ZXddM5rMJM2mJjWAHRv5Qjqlzr5vLRyOJUyikKyAf43gVSl+etvmtA8tvQ3KdtpTZqBMI96cued4MO1o0vvypkxPxSFJHlZ3eLB5ZeHKswUpLcRcXVWuPDMDbRFJ+HwLZrCoNDCfJcxmBWE/pRzll/U/7mMmEEgHQXdkiCTXCB88cVMY9iu0QUAIWkXFH5OTKP9K4nQO1SWsxJxBLtNlS0R0/JPbTld3ASdWjWEuq/E3O1U2iZi6OQ0c7OE3I7AuY9EREdbvVYK4DU/NnCxBLn/5Q/TonhdKRehdAw8o7aSnpifzmgMwuv2mztHzJe7HcC2fsTLs4EnY/hxOl8YFBXcXaRcC1H3gO2793OneCY5DAKXuE/gkbZrgrco+NdMWRoj+3JI9TCw3/V0hcdhDVlE+Nk955F8sMETP25lJgc+3/0HYEIqdIi+1fBRO805FshEyPYB4zvJPe6EOC0/aReZJZlx7JYydqE3sWkkVj3fv+po6gvGL5oo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3lhU1hCcnU2djUwdk90TkJ2azFYZ2JoNndVemJhbk1GRTBFcll3cW5jeUJW?=
 =?utf-8?B?TmdxbERxRm9KczVhVUx5R055OE1YVmh0dTQweVBZSmprc0V2Q3p4TU0vbHN5?=
 =?utf-8?B?SExOaUJNTkdxY3pTeTRSKzYvRDdaNWRTTENwUTd3ckpKcEFOZjYzMkNlVHpM?=
 =?utf-8?B?TU5iMkZGU0hCbndJZGx2Q1RqMU44REkrb1BwSlRXbTNBK0ZaMGpBN2EyZ1hq?=
 =?utf-8?B?d0o0UUg4Y29aTWw4WjRud2NJcTVnRjFpbithZmVLVUxtdzIwVGFBS2xsZS9Q?=
 =?utf-8?B?STE5d0NSbUZaMlA2bEliWjl2YWdCWkVnT2t0QVg0cWxnb1ZrQ29BRUxHRUY2?=
 =?utf-8?B?LzBpZ1dtQlI5emMxbzFJUittY2I4RHF6QWdDb0taQ1QxM2FyU2xielA4aVd1?=
 =?utf-8?B?Y0VNY2IrVFljbTJQeDFYcndPekdpaExlVUU3alFCNUlRWDFBTDV6U25kM2Zl?=
 =?utf-8?B?TFRjaXl1dDdoTHRTWGdFaUJUQ0dKeDNjNHJUMXNQVGoxaWsvbTkyZXhNTUFq?=
 =?utf-8?B?djYrTjdEcTNZMW1ZbUl6TFJQVkRsNm9wRVVNb01rWUlqb0haM3VSd0IvWk5R?=
 =?utf-8?B?bUdJdk9jZzQvTU5YNk11aWU4clQwYjVpQ1hWdjV5WEpwYnl3djdLL1ZQUGNM?=
 =?utf-8?B?VE8vblZ4eG5yMUF4anFVaExmMWZMSUt3alg1bVhkYnJZbWdrNzlCV2NYNXIv?=
 =?utf-8?B?YjBVWHNVV3JHSk84L1NtajRxOHpDenFGVVRPT3FNRnZ3a3V3dG5sSjZiV1Z4?=
 =?utf-8?B?UTVSZkNXZDlVS0VBdjRKcVlLZmJnbFlrMjhUVFVOcmVHK2hJbHZNY1BLUTFm?=
 =?utf-8?B?bXlMU212VWFORHVYUTVpR3R3aWUzRkZ1bXVZOEQ2ZnYrVHJoKzkzZGdhQTZw?=
 =?utf-8?B?c0psV2tRK1duaG1raTF0ZTFHQUJzQldZditzNVNDcFJ5K3F6d0Y1U2hJY0dF?=
 =?utf-8?B?MGRoaWhXbFNaYnNiY2Vqbkd1b0dPWXVYYy8xSHNhOUs0eUFadmN2VGhTVktr?=
 =?utf-8?B?YzV0clJkR2xRZ3F3Tlg1cnZJY05SeU9ZT29CcmZ6TFR5blpmYWlZSkpQUHB4?=
 =?utf-8?B?SHpUS3FVazIrdHpkOHhOVEwzNDF4SkY4ZDg1SEo4bFFyMEZFbmEwbnAyaDN3?=
 =?utf-8?B?cXF2d05wZjVObGllTllCSmx2NmNjdTFlQ0M3dVk1ZUg4bTAwdG1vWjFWeW0r?=
 =?utf-8?B?QmZhRTlyc1JTdDA4MHRjQ3FsVjBQdU8wZisyR01WNEdtV0FqTEV4TzJEV1I1?=
 =?utf-8?B?SmUraUNsczZobnRVY05MZ0FadEl5VE83Y2hMQmQrMS91NTF0UlR1US9xeFFo?=
 =?utf-8?B?Q0w2bHlzL2pJWUVQRHhLdWdWNVl0VTVCTWp4T2o2a09MWDhGLzBUMUxOOHow?=
 =?utf-8?B?ZGZWY2JFdmFNTm5FZnhBZi9ZYmRNWStBclVheG5lcVlmM2NLNnpOSUtha3J2?=
 =?utf-8?B?dkxrNGZKMTJIcUJINC9PbDV4N2psVi9CWklMSjd5MmJTK0N6ZWZZcHJxTlND?=
 =?utf-8?B?Y0Y1VE1JYU5pNHFmVlNBQ1kyMnIwWjRSbHBvQ044MEZkMnlrV0Q1dEcvNGt1?=
 =?utf-8?B?VkIzRU1DVzBLcU5PbVViRS9kdzBCRG9QeENaZzJPcFgxNWs0ZFpKUDFyaERF?=
 =?utf-8?B?UVN3c2N1REI3SkNJSjlUQlZjdG4ycnpkRGxOcXFJRGpta1ZQNnRmY2R2KzNK?=
 =?utf-8?B?WDlwcDdFZlZTaHU1emt5ZkVhQ3FoNWNuVWZRMXBoQi94VVRybnFyckJiUlB2?=
 =?utf-8?B?RnlpZ0pPbDhkVGZYOEhXTlRIQWlFaCtOSVMxa3ZxOW41dnpCd05GSFNpQ3cy?=
 =?utf-8?B?RkhZMW10cmhmaVl4ZTh4REZsaWg2VENiOFA0eW1PYnF6OGxuYWJER1NSSWpl?=
 =?utf-8?B?c2YwdWtaVnM4NDlwOEd0MHNIYVpZSDhrMndRZWk3VmlkN3A3V0JLSnMvK2I1?=
 =?utf-8?B?TjhpVkpOQlJqOWtrSUR2VWJGNHVHcktWQWNJRFhMRGFBMmt1dTJwRzYzSHNs?=
 =?utf-8?B?NE5Cai94SjloUEhjWGl1MkFWZXV5bkxSUFFYWkord3dndEtQdjBPeFZ6SGVL?=
 =?utf-8?B?NHlwQ0prSlJzeEpJWUVRV0NNRUdDQmFiY2J3VzYwdmxyZlVmU01yZE9ETVAx?=
 =?utf-8?B?VmFqRjFZZnhBTytHRGdVbWtyamgrZDB0MWRyWWx6dGZWbU41RCtubVNKcjd3?=
 =?utf-8?B?V1JWUFVPc0xLbmgxdFRCOG16OHlaVHc4QnplL3NuN0plMU0rS1ZaZ2QycUFm?=
 =?utf-8?B?QmY2M3VOQ0c4cHVLUUVhV1hycndIR1BJaEtJK0FpdGEzYVYyOG9odno0UzZi?=
 =?utf-8?B?Mml6aFBRVDdOTS9UcG1NNHRyem5iMjNNdWluZzBzVTNMZDM5d05Mdz09?=
X-Exchange-RoutingPolicyChecked: yXKlwlv+gWMtOJthdE+c46D6A6Wi390uHdjHWgElM505UIbETb3WCJmyrfJpnZlyHaWwpV1oyKwqbTW/bRK0vFJwTFSzFlo7+2ZUS7CUfX6wZ9VgfNKpNunMReex7leqIab0N0tKSxCYzEQVeJYwWe4sfQI2+TRjhRu/2ZF8gnl80W7iHdP24HZhY4+rIzSanUKIlpqNT39Efzt4ej1XTDlQHdcF37VVkZdr/VxkvcuxXujtrCwaNpJN/J0Qm3zvs/L7mvLFoY7T2DRbziD1QBbxQw/B+KaeTfoDd+GRIEsmfYPPgJ+2vYXWSJTFQXfGzd+rq9UJeg04OemVtQFBmA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bce0712-64be-4dcd-f7ed-08df1a08a40a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 06:54:12.5875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ik1gtTaIlhYq7FcKtDJt79Quv4Hk1vtRYllSWsE0tIbjd4Lrt7H2ve6alaw09iGVYhyeIzzn0mShXRiAETpnQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9921
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


On 18-09-2026 15:43, Rodrigo Vivi wrote:
> On Thu, Sep 10, 2026 at 11:57:55PM +0530, Karthik Poosa wrote:
>> CRI temperature registers encode package and VRAM temperatures as
>> IEEE-754 floating-point values. Decode these values before exposing
>> them through hwmon.
>>   
>> Use integer-based IEEE-754 decoding since kernel code does not use
>> floating-point operations and hwmon reports integer temperatures.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> Assisted-by: GitHub Copilot; Model: MAI-Code-1.1-Flash
> nowadays 'Assisted-by: LLM' should be enough.
> And this one here was not the previous style anyway.
>
>> ---
>>
>> v2: Reject temperatures that overflow long on 32-bit (Sashiko).
>>
>>   drivers/gpu/drm/xe/xe_hwmon.c | 85 +++++++++++++++++++++++++++++------
>>   1 file changed, 71 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index c682c5a33650..e4a210916df2 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -1159,6 +1159,62 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   	}
>>   }
>>   
>> +/**
>> + * xe_hwmon_temperature_decode - Decode an IEEE-754 temperature register value
>> + * @reg_val: The raw register value to decode
>> + *
>> + * IEEE-754 single-precision format:
>> + *
>> + *  31 30                         23 22                         0
>> + * +--+-----------------------------+----------------------------+
>> + * | S|          exponent           |          fraction          |
>> + * +--+-----------------------------+----------------------------+
>> + *
>> + * value = (-1)^S * 1.fraction * 2^(exponent - 127)
>> + *
>> + * Return: 0 on success or an error if @reg_val is non-finite or cannot be
>> + * represented in millidegrees Celsius.
>> + */
>> +static int xe_hwmon_temperature_decode(u32 reg_val, long *temperature)
>> +{
>> +	u32 exponent = (reg_val >> 23) & 0xff;
>> +	u32 mantissa = reg_val & 0x7fffff;
> Perhaps all of these deserves some define somewhere?!
I shall define here itself, as it not used anywhere else.
>
> Perhaps something like LLM suggested:
>
>          #define IEEE754_SIGN            BIT(31)
>          #define IEEE754_EXP_MASK        GENMASK(30, 23)
>          #define IEEE754_MANTISSA_MASK   GENMASK(22, 0)
>          #define IEEE754_EXP_BIAS        127
>          #define IEEE754_MANTISSA_BITS   23
>          #define IEEE754_EXP_SPECIAL     0xff    /* Inf / NaN */
>
> and use FIELD_GET() for the extraction
>
>> +	s64 value;
>> +	int shift;
>> +
>> +	/* Exponent 0xff encodes infinity or NaN. */
>> +	if (exponent == 0xff)
>> +		return -EINVAL;
>> +
>> +	/* Subnormal values are smaller than one millidegree Celsius. */
>> +	if (!exponent) {
>> +		*temperature = 0;
>> +		return 0;
>> +	}
>> +
>> +	value = (s64)(mantissa | BIT(23)) * MILLIDEGREE_PER_DEGREE;
>> +	shift = exponent - 150;
>> +	if (shift >= 0) {
>> +		if (shift >= BITS_PER_LONG || value > (LONG_MAX >> shift))
>> +			return -ERANGE;
>> +		value <<= shift;
>> +	} else if (shift > -64) {
>> +		value >>= -shift;
>> +	} else {
>> +		value = 0;
>> +	}
>> +
>> +	/* Ensure the magnitude fits in long, which is 32-bit on some arches. */
>> +	if (value > LONG_MAX)
>> +		return -ERANGE;
>> +
>> +	if (reg_val & BIT(31))
>> +		value = -value;
>> +
>> +	*temperature = value;
>> +	return 0;
>> +}
>> +
>>   static int
>>   xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>   {
>> @@ -1168,26 +1224,27 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>   	switch (attr) {
>>   	case hwmon_temp_input:
>>   		switch (channel) {
>> -		case CHANNEL_PKG:
>> -		case CHANNEL_VRAM:
>> -			reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
>> -
>> -			/* HW register value is in degrees Celsius, convert to millidegrees. */
>> -			*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
>> -			return 0;
>>   		case CHANNEL_MCTRL:
>>   			return get_mc_temp(hwmon, val);
>>   		case CHANNEL_PCIE:
>>   			return get_pcie_temp(hwmon, val);
>> +		case CHANNEL_PKG:
>> +		case CHANNEL_VRAM:
>>   		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>>   			reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
>> -			/*
>> -			 * This temperature format is 24 bit [31:8] signed integer and 8 bit
>> -			 * [7:0] fraction.
>> -			 */
>> -			*val = (s32)(REG_FIELD_GET(TEMP_MASK_VRAM_N, reg_val)) *
>> -				(REG_FIELD_GET(TEMP_SIGN_MASK, reg_val) ? -1 : 1) *
>> -				 MILLIDEGREE_PER_DEGREE;
>> +			if (hwmon->xe->info.platform >= XE_CRESCENTISLAND) {
>> +				return xe_hwmon_temperature_decode((u32)reg_val, val);
>> +			} else if (channel >= CHANNEL_VRAM_N) {
>> +				/*
>> +				 * This temperature format is 24 bit [31:8] signed integer and 8 bit
>> +				 * [7:0] fraction for platforms before CRI.
>> +				 */
>> +				*val = (s32)REG_FIELD_GET(TEMP_MASK_VRAM_N, reg_val) *
>> +					(REG_FIELD_GET(TEMP_SIGN_MASK, reg_val) ? -1 : 1) *
>> +					MILLIDEGREE_PER_DEGREE;
>> +			} else {
>> +				*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
>> +			}
>>   			return 0;
>>   		default:
>>   			return -EOPNOTSUPP;
>> -- 
>> 2.25.1
>>
