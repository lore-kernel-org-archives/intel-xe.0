Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C729FC54E67
	for <intel-xe@archiver.kernel.org>; Wed, 27 Mar 2024 20:47:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6888E10F089;
	Wed, 27 Mar 2024 20:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dLWdYYKi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0697010F089
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Mar 2024 20:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711572458; x=1743108458;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6YvmYwU723QaYF2rMm4N6egKsXPpCQdcMQdkRI6CDsc=;
 b=dLWdYYKiZeZ84CC3BBwMuyAYB5giMWFceHACafsL8bLcUYOvISX2J2o7
 e++9NKmzKaHU2aTqGGcYTkipVOrI/1vK3n3Gq6mcWDUjkv8OvijuHXkLI
 D6kMGnzSasGuVU1pjjOvBi+ncBgaiZSDj1Xk8WDYlgH61ojjru9m83Dvo
 lwYJ3fhToTt5n8e1JV5wtQy4eRYyQd4FT+10G3IUbPxjt2h+CqwUscGiP
 kJDI6wbYW7RMEg4lbtzo+Hdz+qMT7ozh7q/i51ldJwlYP0AFzduYUuyVz
 xPZX2uZS6uEn9s/38U96DqmyMBow/M9yoyrDKOVGQzGc99c2PWwqXOj1M A==;
X-CSE-ConnectionGUID: DFoe/63JQSesAcgs2j378Q==
X-CSE-MsgGUID: W9sX7gcPTkuILHDAyAfL5g==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6832316"
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="6832316"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 13:47:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; d="scan'208";a="16433436"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2024 13:47:37 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 13:47:36 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Mar 2024 13:47:36 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Mar 2024 13:47:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WoApTq4MFxja/EmhzmlTULnvnMQ7Jtv10ZB2bV47f9C1jTCb25g7yGA2EKR9c3njDQ0dYhVeDe1EYClylKYdcy8l+J8yJvOIBUe5iGwao2llRUBgtzLby469z0VowOkssM8P9PRLrssJ80fiizdoVbpx/z+SVn1fc8n89eyZi39mcygNPgz1BzcvZkHv6g8JOr+s8r5k2hGNLy+UmnLGq0x4aJfaLcYrqyZdSC+UNsRXc4+Y9OMMZ/gw9qwjY7GZrZaOg0A8s3B6yXvSxdeVR8lDqWLxeSRbakVT4Vo1vk+NcOJRgOiPMsAQfsjtN+z0OyUT5wBteCG7ehzqKV0LlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WpAecEjUgThqxr9Y7YUn0a45VMq6FOZI1MHQW3L5CBQ=;
 b=H1+ZNUz10cjqlIBSYQr+7pFXv3o2WqSxZPfpj6t4RYfexDaBmQkLWOagfZuyXLgX+06ltvxbLV6hvyhOHCtyInE6Ej80qmwhsR1+lpbwrJUeem2v1EbkrOCWSMAITyZ/F+oehpAuLeY4CV9snwSrVOWYJB1kZ1xNvnJafRS4viESOH6Au2ot0gRu8RlQ7Nnev07wGLLx3+aLHz4mBCKYC5mO0oz0edTYnOKZFBpNhIhrQpA0sIOwkLx8lhZv0wJbdkh2k16AwZmc5GOA5WSJvKFM0A+2PGqCipmxvUr+lHRpVrxu0HkXn8nk9fxEI1wer1YVk+AgWLp8dYfqBI9TsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SA0PR11MB4672.namprd11.prod.outlook.com (2603:10b6:806:96::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Wed, 27 Mar
 2024 20:47:34 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7409.031; Wed, 27 Mar 2024
 20:47:34 +0000
Message-ID: <8c5f5fcd-d93c-4598-822d-06b94879dafa@intel.com>
Date: Wed, 27 Mar 2024 13:47:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/xe/guc: Add support for w/a KLVs
Content-Language: en-GB
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <matthew.d.roper@intel.com>, <daniele.ceraolospurio@intel.com>
References: <20240325150435.2967536-1-badal.nilawar@intel.com>
 <20240325150435.2967536-2-badal.nilawar@intel.com>
 <b772d2dc-25d6-48de-b745-e61b2c218460@intel.com>
 <d218bc8f-f1cb-4ddd-a587-5d41cd7a9432@intel.com>
 <9a9bfee1-c4c4-4307-a2e7-e6f496f48cc2@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <9a9bfee1-c4c4-4307-a2e7-e6f496f48cc2@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0079.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::20) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SA0PR11MB4672:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ce12208-f497-432b-6292-08dc4e9f2127
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hnex7bsJLJZ9jBu65ND1/puNszsPc+5T9sqDr4rYZpnROzcN9VscQDlS6qf1k0QW8g4BlVf+zXi6nVWvKH++ZthU2goTqI3WZgULYjtcWG6lgDrxeDK+ZbM/nfvQ6Tewh+7d1uxe+d2kLqHmqubMy9JaoEeFDyhv1v1HGKoeP3hysFGjIH4ijeYOMgBa81qXRhwMXr0ee5XKY21l7qnuOQhVDDshpaYiw6EYRTtjETQtiq8vXxbcEJxxSOxvR3JvQlr2x880fktzymVGvR73urpcT6T23/Icwq3rRSthr9pTr2dqOPyjIyomUWLGw7754IFs+ZlwzMXNNu7djrfXUWCWVkmJZ7zdLupGprDpHaR7IH6H63tfjj9iEwUVGpItKQyTvOnuQgkSDPHW2Ietre/liXtVviwFltWdM0+l9yUs7bqlGt+BVugnJZypcBeqEXKyO4Ur/cC2uRKGtRWTeir6DLuH9hQRQt5ENliPdY1sW5hdzWKNfDBVQUqytYY3UkVsWSoOtZ6c+35bVm747Ai1MNEr8JgpQoYdTm/iHhgmX0Ndc1jfl5MaTtH361VO+qC422y4FbtLcr2cPWPf9I6NtjHNwYn7aW5cIsxvtuDKvPlDlmb4u1LyvxT/VSNaen2cIcgdgKvA9iPI+hCnq+pssuM+ZVQ+urDY0tP68SY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUN4UzhzdEc1U1JVRlZGcWFlWkE1eEwxbmNOemdwR3ZyQllkYTN2S2ZCWUEz?=
 =?utf-8?B?dmhuMEozUWF4NW52aEVpRW1ZejM5QW9hS1pnV2tZVDdRbXM0VFhzcTJleDBx?=
 =?utf-8?B?cXZtS0Q0aDhHZ0s0WC8zaHROSXNtbUlVSysrRWtscWdyb04vb2xieGI2Ykpw?=
 =?utf-8?B?S3R0clRXbGIxZFA5SWh2cW4rNWhLblhYNm5FT2RvTEwybzA5VGZjMUR5ZUha?=
 =?utf-8?B?QjQwQ1FLTkwzenBWc3FqTTlvRlMxWnp4TDBpZGlHTFkwNUw3UFhSWUpUVG5C?=
 =?utf-8?B?M3p6cjlWVmdEYnRPajZZcFJ1dVhpTldTa2JxNUlaNmNncXpYbGJxOXU4b3cv?=
 =?utf-8?B?V0xvb0x1VXhUMmVrM0ZTcDdUNHp2WmI3bnRVb2pBU3FWbG1WRmxDOFJLS0lp?=
 =?utf-8?B?K1QrLzFTbFFERUxpTEo0TnVieHM5VkxDcFczNlpydnRDTDh3ZGdHSDBxT3JP?=
 =?utf-8?B?dFpEeUhKeXYwQ2lWMEozOEI2MWJCQVY0YVZDSENDMStqcU1ZajlLT1FZTzAx?=
 =?utf-8?B?Y1JtSVBLWnQ5LzFjUUNIZU5LWjZTYmdJbmpIaVlUVjFWREorb2pIS3N1Q3d3?=
 =?utf-8?B?cGJyN1VBZ0NrbkhGZHRXQ2JyZzlVWGRCSmJ6YU00aFBrUHVpWkJWcG04S3N3?=
 =?utf-8?B?OHNQc1FXRm1RMU9ZaDUzMWEwZmNSUCtrcG52eDNHUCtGM2FqQ1dJUUVmaWJ4?=
 =?utf-8?B?WGpjSzVqemYxd1RBRFNMbHBaZmFTYTR0M1ExRXJENml2aXBzVkR1UytaVkFx?=
 =?utf-8?B?a1ZTV2ViQkQ1N1c4ekpCZFJwenh2SXR5VVRuT24waFNVa3MxYWxtUDcyK2dx?=
 =?utf-8?B?QmpJLzFYV0lRaDE2Y29XbXY3MGhJNDFOanRuVlg5WGJxdXh0b2NQTkpXR2x5?=
 =?utf-8?B?MzlrSWhnV1paeFdheGtnd3JZOEpHeFJ6RkFkdXg3ZjFIZjFGNkpWQU9JakRP?=
 =?utf-8?B?ckFadlRENWFQbjVvM2JpTFRSWTd1bWNyUGRhZW9hUHdONDg4SUNSRkFWa2pP?=
 =?utf-8?B?aVkyQVMvT3BNMGJ0RXpZYW1QZXVZMlpacnRVdVlyYUlhcHp3MVFuUXVoV0Rr?=
 =?utf-8?B?aWRNVTd3VzR4MVU3MEtWSGp3SkxOWUVHMVRlTUJUQmpWTTg3ZU12dWdIcUFo?=
 =?utf-8?B?ZTdHSDVNNmtZSTVzWWF6Q2NPam4zMnBlRDBMdHdjQy9vU2xxTER5NmxQMnpG?=
 =?utf-8?B?NXNkQkpXQ2xLaFpBQUI1TkVHajRnK0pRckt1UzFKOFhtNVpmeDhMaGdwejgr?=
 =?utf-8?B?NURNN3U0YUd4RGMvNFd4VE1QQ2pkVXhZdFVOL1FON1ZQS1pqZE5sZ0tSc2g1?=
 =?utf-8?B?azZFM2pGcVIrb3dRaFdPSTNxdmZZZG5jb0FQdEZpZHpFNWV4eXNTUzk3Q2F0?=
 =?utf-8?B?Z0l5MVlpYzY1M3gwK2g0SVg3bUpWTWdQMlJIdExwRkxlVkxkVDU5ZnpvL3Rm?=
 =?utf-8?B?ZzFxTlNoRXdzWU02b3dXMUpQSDdzV1BIeFM4SFVYanRkNE9TZzEvYXNldk5l?=
 =?utf-8?B?eVNXOUdhRlFvUXFTc0J2aEhPS2MrWFlTQ2FGYU1YclAvUmthcmE5R0xVdGZS?=
 =?utf-8?B?Rk1obVB1M09JVVV4UHFiUk9sWXV0M3o0QTdGYWs3MWN2R2lSNjRBTXczbHFZ?=
 =?utf-8?B?VS9mWmFMTzFPMkZzb1RuWVU4dkVpMU5wejVGZStlMVQwV2lyaktNalFyNmcx?=
 =?utf-8?B?cUxLUE1kSGlyVzJndURZZHdUTkZqYWgreTd0d1llMzdvaVllR0RvMGwvc0dT?=
 =?utf-8?B?U045Mmo2WTl6cnllSDNhYlVyWFNWeDNiVmpuZFIxS1BjZmQyWDFDSnNHc1Jn?=
 =?utf-8?B?ZkF2eVEzSTkyVUJKekF1TW5HNkRtblQ1N3AxVmZWUWx0UjNiVTNza1lvREtR?=
 =?utf-8?B?WmdzZ1dGRFk0VmY2TDcreGJESmRKSklMeU85UkVFclMrbVlxMEIwalN1M2Nl?=
 =?utf-8?B?TDFSWFE2b1VHT1Q4aWtIekg5Z3IvSUQ4eWRsMTd4dmxPMmJNUU9iQW5tZE9P?=
 =?utf-8?B?YzA0UWVRK3FmV2xLODJ3K3ZmTUovREk2V3UvNkl1SFlHZUQxaVorOUpmclFt?=
 =?utf-8?B?aHJmbFB2eXdkaHVnd2R1MlZudGR5UUVFRWp6azJiWHp6S2VVVjNydE1pM0Rm?=
 =?utf-8?B?cWpzT3ZTYnJoQzl3RUdmRW5waWlFQ2hTbVlMaUdScGdDOEc2bUlXUzFBaCsy?=
 =?utf-8?B?aWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ce12208-f497-432b-6292-08dc4e9f2127
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 20:47:34.4622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X4qRYE0r9h48WxlVBZyq9kb1B1P+H8n5zl1L8udQvdbrucUurE3qkXOUyp6x95wwxmL5L54WzngxjAqyr4wlxlHWhi0VIdbWBlwmaQ+VC20=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4672
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

On 3/26/2024 04:06, Michal Wajdeczko wrote:
> On 25.03.2024 19:55, John Harrison wrote:
>> On 3/25/2024 08:19, Michal Wajdeczko wrote:
>>> On 25.03.2024 16:04, Badal Nilawar wrote:
>>>> To prevent running out of bits, new w/a enable flags are being added
>>> nit: shouldn't we spell out "workaround" or use "W/A" as acronym ?
>> On the i915 side, we always used 'w/a'. It is more abbreviation than
>> acronym, certainly it is not an acronym for a proper noun. But yes, the
>> first instance in any description or comment should be written out in
>> full and only after that should abbreviations be used.
>>
>>>> via a KLV system instead of a 32 bit flags word.
>>>>
>>>> v2: GuC version check > 70.10 is not needed as xe will not be supporting
>>>>       anything below < 70.19 (John Harrison)
>>>> v3: Use 64 bit ggtt address for future
>>>>       compatibility (John Harrison/Daniele)
>>>>
>>>> Cc: John Harrison <John.C.Harrison@intel.com>
>>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_guc_ads.c       | 62 ++++++++++++++++++++++++++-
>>>>    drivers/gpu/drm/xe/xe_guc_ads_types.h |  2 +
>>>>    drivers/gpu/drm/xe/xe_guc_fwif.h      |  5 ++-
>>>>    3 files changed, 66 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c
>>>> b/drivers/gpu/drm/xe/xe_guc_ads.c
>>>> index df2bffb7e220..a98344a0ff4b 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>>>> @@ -80,6 +80,10 @@ ads_to_map(struct xe_guc_ads *ads)
>>>>     *      +---------------------------------------+
>>>>     *      | padding                               |
>>>>     *      +---------------------------------------+ <== 4K aligned
>>>> + *      | w/a KLVs                              |
>>>> + *      +---------------------------------------+
>>>> + *      | padding                               |
>>>> + *      +---------------------------------------+ <== 4K aligned
>>>>     *      | capture lists                         |
>>>>     *      +---------------------------------------+
>>>>     *      | padding                               |
>>>> @@ -131,6 +135,11 @@ static size_t guc_ads_golden_lrc_size(struct
>>>> xe_guc_ads *ads)
>>>>        return PAGE_ALIGN(ads->golden_lrc_size);
>>>>    }
>>>>    +static u32 guc_ads_waklv_size(struct xe_guc_ads *ads)
>>>> +{
>>>> +    return PAGE_ALIGN(ads->ads_waklv_size);
>>> btw, shouldn't we start using ALIGN(xx, SZ_4K)
>>>
>>>> +}
>>>> +
>>>>    static size_t guc_ads_capture_size(struct xe_guc_ads *ads)
>>>>    {
>>>>        /* FIXME: Allocate a proper capture list */
>>>> @@ -167,12 +176,22 @@ static size_t guc_ads_golden_lrc_offset(struct
>>>> xe_guc_ads *ads)
>>>>        return PAGE_ALIGN(offset);
>>>>    }
>>>>    +static size_t guc_ads_waklv_offset(struct xe_guc_ads *ads)
>>>> +{
>>>> +    u32 offset;
>>>> +
>>>> +    offset = guc_ads_golden_lrc_offset(ads) +
>>>> +         guc_ads_golden_lrc_size(ads);
>>>> +
>>>> +    return PAGE_ALIGN(offset);
>>>> +}
>>>> +
>>>>    static size_t guc_ads_capture_offset(struct xe_guc_ads *ads)
>>>>    {
>>>>        size_t offset;
>>>>    -    offset = guc_ads_golden_lrc_offset(ads) +
>>>> -        guc_ads_golden_lrc_size(ads);
>>>> +    offset = guc_ads_waklv_offset(ads) +
>>>> +         guc_ads_waklv_size(ads);
>>>>          return PAGE_ALIGN(offset);
>>>>    }
>>>> @@ -260,6 +279,42 @@ static size_t calculate_golden_lrc_size(struct
>>>> xe_guc_ads *ads)
>>>>        return total_size;
>>>>    }
>>>>    +static void guc_waklv_init(struct xe_guc_ads *ads)
>>>> +{
>>>> +    u64 addr_ggtt;
>>>> +    u32 offset, remain, size;
>>>> +
>>>> +    offset = guc_ads_waklv_offset(ads);
>>>> +    remain = guc_ads_waklv_size(ads);
>>>> +
>>>> +    /*
>>>> +     * Add workarounds here:
>>>> +     *
>>>> +     * if (want_wa_<name>) {
>>>> +     *      size = guc_waklv_<name>(guc, offset, remain);
>>>> +     *      offset += size;
>>>> +     *      remain -= size;
>>> maybe just asserting the used size will work ?
>>>
>>>          used += guc_waklv_NAME(guc, offset + used);
>>>          xe_gt_assert(gt, used <= guc_ads_waklv_size(ads));
>>>
>>>> +     * }
>>>> +     */
>>>> +
>>>> +    size = guc_ads_waklv_size(ads) - remain;
>>>> +    if (!size)
>>>> +        return;
>> Hmm. This test would be much more obvious as to its purpose if it was
>> simply "if(!used)". Not sure if the rest of the code is overall simpler
>> or more complex, though?
>>
>> It would be nice if the "used += ...; xe_asert(used < size);" could be
>> done in a loop that just takes an array of all the KLV ids. Not sure how
>> to achieve that with the w/a enable test, though. At least not without
>> the code just getting overly complicated. I guess it's not that much of
>> an issue to replicate the assert line for each w/a entry.
>>
> this array of KLVs may look like this:
>
> static const struct {
> 	bool (*need_wa)(struct xe_gt*);
> 	u32 (*add_klv)(struct xe_gt*, u32 offset);
> }
Like I said, it seems overly complex. Two mostly replicated lines versus 
a new structure with new function wrappers around the XE_WA test, ...  
Doesn't really seem to be a net win.

The simpler option would be to pass "offset, used" instead of "offset + 
used". The helper then does the addition internally together with the 
assert. It still returns 'size', so the external call just becomes "used 
+= simple(guc, KLV_ID, offset, used);".

>
> but maybe leave it until we will have more than one W/A to handle
We have all of these waiting for this patch to land:
+       if (XE_WA(gt, 14019882105))
+               guc_waklv_enable_simple(ads,
+ GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
+                                       &offset, &remain);
+       if (XE_WA(gt, 14019991076))
+               guc_waklv_enable_simple(ads,
+ GUC_WORKAROUND_KLV_ID_GAMCTRL_TLB_BIND_ON_CTX_TEARDOWN,
+                                       &offset, &remain);
+       if (XE_WA(gt, 14020001231))
+               guc_waklv_enable_simple(ads,
+ GUC_WORKAROUND_KLV_ID_DISABLE_PSMI_INTERRUPTS_AT_C6_ENTRY_RESTORE_AT_EXIT,
+                                       &offset, &remain);
+       if (XE_WA(gt, 18024947630))
+               guc_waklv_enable_simple(ads,
+ GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING,
+                                       &offset, &remain);
+       if (XE_WA(gt, 16022287689))
+               guc_waklv_enable_simple(ads,
+ GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE,
+                                       &offset, &remain);

Plus 13011645652 but that one actually takes a data value.

So we definitely have more KLVs waiting to be sent.

>
>>>> +
>>>> +    offset = guc_ads_waklv_offset(ads);
>>>> +    addr_ggtt = xe_bo_ggtt_addr(ads->bo) + offset;
>>>> +
>>>> +    ads_blob_write(ads, ads.wa_klv_addr_lo, lower_32_bits(addr_ggtt));
>>>> +    ads_blob_write(ads, ads.wa_klv_addr_hi, upper_32_bits(addr_ggtt));
>>>> +    ads_blob_write(ads, ads.wa_klv_size, size);
>>>> +}
>>>> +
>>>> +static int calculate_waklv_size(struct xe_guc_ads *ads)
>>>> +{
>>>> +    /* Fudge something chunky for now: */
>>>> +    return PAGE_SIZE;
>>> maybe SZ_4K ?
>> Technically, it is specifically a page not an arbitrary size that
>> happens to be page. However, it is really the GuC page size rather than
>> the host page size. At least, there is a requirement for the address
>> given to GuC to be page aligned as the lower bits are discarded. Whether
>> there is also any requirement on the host side for allocations to be
>> page aligned because they are going to be rounded up anyway by the
>> internal allocation mechanism is another matter. I believe that was the
>> case on i915 but not sure about Xe? So maybe it is both GT page size and
>> host page size?
>>
>> Is there any host architecture which has a page size that is not a
>> multiple of 4KB? If so, then maybe we need some fancy calculation that
>> is the lowest common factor of host page size and GT page size. But that
>> seems unlikely. In which the host page size seems the simplest valid
>> definition. If you want to be really paranoid, you could maybe add a
>> global compile time assert somewhere that PAGE_SIZE is a multiple of 4K?
> still, if GuC always expects 4K "page size" why we insist to use host
> PAGE_SIZE that could be a different size ? even if it will be multiple
> of 4K and it will eventually work on GuC side, why do we want to waste a
> GGTT space for unnecessary padding ?
My point is that the host allocator also has a minimum granularity. If 
it always rounds up to a host page (which it certainly did on i915, not 
sure if the rules are the same on Xe), then there is no point to 
allocate less than that because it will be wasted space.

> anyway, just an idea, not a blocker
Likewise. I'm not sure there is a perfect answer here.

I guess wasting GPU address space is worse than wasting system memory. 
So maybe just go with SZ_4K given that we don't (so far as I know) have 
a specific define for the GPU page size?

John.

>
>>> and is it really a 'calculate' helper ?
>>>
>>> if so then maybe add template comment how this will be calculated using
>>> want_wa_<name> and guc_waklv_<name> tuples
>> I suspect the calculation will be more like "if(IPVER >= 100) size =
>> PAGE * 10; else if(IPVER >= 50) size = PAGE * 2; else size = PAGE;". So
>> yes it is a calculation, but for the foreseeable future the calculation
>> is trivial. A single page is both the minimum size possible and is
>> sufficiently large enough for all current platforms. It may be worth
>> using that last sentence as the comment instead?
> this still sounds more like an 'estimate' than 'calculate' but let it be
>
>>>> +}
>>>> +
>>>>    #define MAX_GOLDEN_LRC_SIZE    (SZ_4K * 64)
>>>>      int xe_guc_ads_init(struct xe_guc_ads *ads)
>>>> @@ -271,6 +326,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
>>>>          ads->golden_lrc_size = calculate_golden_lrc_size(ads);
>>>>        ads->regset_size = calculate_regset_size(gt);
>>>> +    ads->ads_waklv_size = calculate_waklv_size(ads);
>>>>          bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads)
>>>> + MAX_GOLDEN_LRC_SIZE,
>>>>                          XE_BO_CREATE_SYSTEM_BIT |
>>>> @@ -598,6 +654,8 @@ void xe_guc_ads_populate(struct xe_guc_ads *ads)
>>>>        guc_mapping_table_init(gt, &info_map);
>>>>        guc_capture_list_init(ads);
>>>>        guc_doorbell_init(ads);
>>>> +    /* Workaround KLV list */
>>> drop useless comment ...
>>>
>>>> +    guc_waklv_init(ads);
>>>>          if (xe->info.has_usm) {
>>>>            guc_um_init_params(ads);
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads_types.h
>>>> b/drivers/gpu/drm/xe/xe_guc_ads_types.h
>>>> index 4afe44bece4b..62235b2a6fe3 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_ads_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ads_types.h
>>>> @@ -20,6 +20,8 @@ struct xe_guc_ads {
>>>>        size_t golden_lrc_size;
>>>>        /** @regset_size: size of register set passed to GuC for
>>>> save/restore */
>>>>        u32 regset_size;
>>>> +    /** @ads_waklv_size: waklv size */
>>> ... instead improve comment here
>>>
>>>> +    u32 ads_waklv_size;
>>>>    };
>>>>      #endif
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h
>>>> b/drivers/gpu/drm/xe/xe_guc_fwif.h
>>>> index c281fdbfd2d6..52503719d2aa 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>>>> @@ -207,7 +207,10 @@ struct guc_ads {
>>>>        u32
>>>> capture_instance[GUC_CAPTURE_LIST_INDEX_MAX][GUC_MAX_ENGINE_CLASSES];
>>>>        u32
>>>> capture_class[GUC_CAPTURE_LIST_INDEX_MAX][GUC_MAX_ENGINE_CLASSES];
>>>>        u32 capture_global[GUC_CAPTURE_LIST_INDEX_MAX];
>>>> -    u32 reserved[14];
>>>> +    u32 wa_klv_addr_lo;
>>>> +    u32 wa_klv_addr_hi;
>>>> +    u32 wa_klv_size;
>>> maybe it's worth to add a comment from which GuC version these new
>>> fields are redefined
>> Not necessary. Xe does not support any GuC version which does not
>> support a w/a KLV. Therefore this is simply baseline support same as all
>> the other fields here.
> ok, I missed series that sets baseline version for xe, but maybe still
> worth to add some comment to the commit message that this is already
> supported by all our baseline GuC firmwares ?
>
>> John.
>>
>>>> +    u32 reserved[11];
>>>>    } __packed;
>>>>      /* Engine usage stats */

