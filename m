Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F8CC54E67
	for <intel-xe@archiver.kernel.org>; Wed, 27 Mar 2024 04:49:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4B710EEB0;
	Wed, 27 Mar 2024 04:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZdSQF8sA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 417BB10EEB0
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Mar 2024 04:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711514969; x=1743050969;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CM6wc+51/VwQ4cCsiEUHNpaDmSF9AZmB6Bdvcq+zmSw=;
 b=ZdSQF8sAMtJaBu1DZqVwwRINAVzI1DeJi0xYm1zjVuHIY9A7anMU6r1V
 y/qEo+1TWSVfBaUY13GPuay0QZ2N8MTZF5+cjG0mLE1dRqX+UQzE8za3F
 7XVJQeTWwJJNsaNDp+rHPIOIIDumDgiRvp9vyNt4QmKoSR3hDmRxveQZL
 xwvZLu9KxrK9legCbENCQiFaY7KXG9Ko8grYJ85DzPPw7u3k/vOM0wFsS
 EKCBBwvi7SDYfPgEU+WSFyjWIjbzK81MNfhf8+NxTRp/KrfvsER5tR7IY
 KBgydSvf6Zh8EX5xfXRX/2DqQJa+8oKCwajKLLHeUFRxfSGW13FyK7rvD A==;
X-CSE-ConnectionGUID: vJCSr3z0QeyCYqLS49/+mA==
X-CSE-MsgGUID: uV0y3TxJQpCAAIsKDHvcCg==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6727448"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="6727448"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 21:49:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; d="scan'208";a="53641095"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 21:49:29 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 21:49:27 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 21:49:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 21:49:27 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 21:49:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PcyhEkehQCyCxN5OwmZNyRYvhvRo9db058J9ajN4/y9p6RbzgV4MciKBvYFad5byKo8iU/5Szq7CUiqjltWO/hW7gvVeFx4q89YnfuPJoqSVCuL+Xw84vGaNjOJELy0vNGQx6AYXmnYzW701Y/nomG28o435vufIKDx4kh4nkyRx+/xmvxeDqAKytRtWRGUcEZ3B+ZqMg7mna6gWs0l9mOY+scakZCO2nedkr01HZ3WoU8hj6CCRQczvxWWocD/ExzFkmayugU700UmCd+NJUkCBg/ReMgCaumQ2XGjm0hLzSXWZvJRBpfxupADt68M+58ovQfXu5WSirqHzyfrRxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35eilVuVIDWC0q4yL1aZawHrA7qzNd08Fd2rAWoC310=;
 b=nz9iPdSwI2ftWxVvQlcJG2NkNNsRKCmckqELMFjjytKaHQgXedNrV0hYGxGuXGCsl+tr/2TMr7hD/G6znDYhR8TeGNaUAZyEpeatphtqxQaI6sN1tpp2l3eShaC1OEYEICNiF1aEHG/ZsL2kCqRik79n+Fa8begG+rxAwQ6vB97jj6aHGi6NngV4hS3uZgp41fQdTPGuQF/iNCYtvjgxYNW7BJ7MYV7qrwWPSDDtbCr2fRYmiqYk0Cm55KGKgRaQ1hm/XBTx32yffSQkd9LYMkXcB0Iw3GCNOiGt2dKWA6auRkc1+9PAA/ABKCmBSatEDQI8CRjMMcDtPqoeKjpr/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CH0PR11MB8085.namprd11.prod.outlook.com (2603:10b6:610:183::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Wed, 27 Mar
 2024 04:49:25 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::eb80:5333:fa3e:cb6c]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::eb80:5333:fa3e:cb6c%4]) with mapi id 15.20.7409.031; Wed, 27 Mar 2024
 04:49:24 +0000
Message-ID: <21b400d6-234a-4ee3-a3d0-5975b51e48c9@intel.com>
Date: Wed, 27 Mar 2024 10:19:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/xe/guc: Add support for w/a KLVs
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, John Harrison
 <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <matthew.d.roper@intel.com>, <daniele.ceraolospurio@intel.com>
References: <20240325150435.2967536-1-badal.nilawar@intel.com>
 <20240325150435.2967536-2-badal.nilawar@intel.com>
 <b772d2dc-25d6-48de-b745-e61b2c218460@intel.com>
 <d218bc8f-f1cb-4ddd-a587-5d41cd7a9432@intel.com>
 <9a9bfee1-c4c4-4307-a2e7-e6f496f48cc2@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <9a9bfee1-c4c4-4307-a2e7-e6f496f48cc2@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0234.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::6) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CH0PR11MB8085:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iDq9YS2QAg04Z92D5ZvehWquwc7htnouohSLlMNX6GzpayV2AWtbG1SRjBeCKgvdJlTTRabmBKlQBiySnShw3yir0JPXNYki89QTsalFyED01TCbBM2BcE+z2HGBiiWZzAs6VeVGyjNCTfcJEX2S/5mChBnpZB8P9OykZcBeyeYPI3o6d4eErVABaEyK7CjDzz3dxXG6qiMYXTRDtJp7LhFIdIJbsaSngxBi8L5t3L6PZH/2I9ctk7fIdFGBuOfwZEUge2lpAzpX6rOzL+2BKCViCaXHeVwMXZ/xZSqJWRW5weKomF8BmPHPiwwU60PAjd3xfpYLsk94BlqALnEGzdtUj4O9zCi76eZsU6Lsiqesh2JcvgwoSkm3cPzoOw8VP/4qOBsWgfkWXSEYamsEoINYXxFeWFEoqQP/rAt9GQGLm7XPoKcFrlaNFpC4DU8qKxMedLayavt26ZLy0l4X4sG7d9SwlWP0RxRNnOE1NZslaaeiDuzQEn4b60D1K5+3ofzpn1UpfRs1Jau463Bi8ORk8HiKqX8HYLy39YRxG/TPWiACOre1lLmkwjr83PhJMtwg/ybYAlIOZRL5lnQEOFTq1c7z/Lxdb+H5Q1w4xlI8WBPqJRl4oFK0dXHdGRA/+exQ/oJ9YEpBgOjIs4ohDcBYTnTxZjKSKSPS28mINbs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eW1vaXdSS3labEc3WUNzSVg5YnJQUmFCNE9jbUZlVVg3cXdOblBvajBCcUZ4?=
 =?utf-8?B?M3FxUyt3akNOWUsvbG1WUjd6RzNFeU1OMS81SXBBSWVFcFgrQkNQZzUwSHZN?=
 =?utf-8?B?bEk2a3Y2UVp1Vy9zTll6UWQ2U29aNkhqVG5Idk1zeXlHZnlGK0ozWEpub2Rw?=
 =?utf-8?B?V05CbEhZb3d2Q2xXdkZWbCtaL3lpUnZpOStFTUs3RUQzMmtObHFHM1R3R0xK?=
 =?utf-8?B?UUMzcnBXWlZCOTZzekd1YS8rd2hReFh2eXFHaW5FZUdRWTBvQldGRHBNd0M2?=
 =?utf-8?B?cW0xbW1BY3hBdmhJSlZ0K25FRjhaRlV2VU1wYmt1a3dwVzhrVjZhUFVKYTNI?=
 =?utf-8?B?aDl3b3NjVW9pcytuN0Vjb3UvRHZpQ05nOEtTaHVSa0R5YTBKTCt2aEhMNmZk?=
 =?utf-8?B?NU0rT09odXZhajJaWlBNSitIazdTRVdsblFMWWp1Q2x2dXRzRVFMaGZlV3p1?=
 =?utf-8?B?VktoeUx4MzhGSEM4dDVWVG93b0Rkbm5TZHZlMVRyLytpaDZ5cEJCQnpSc3Nl?=
 =?utf-8?B?MWJYZE80czN5c0MzUzV6RExDNzR4Z1NzaEsvT2RDTkhaOXA5Ump1djZoV2NH?=
 =?utf-8?B?UHlYalZhRm50azVSTkltdW9LejFOMVk3WUdmVDNpODBzc0ZwWVFINXFPNUlT?=
 =?utf-8?B?QVhieWRFa1ZFUmUzN0RtOXBLY0EyTVF4SWFMVldaQW80Ry9WMlNlZjZBMmt5?=
 =?utf-8?B?eGdVWmw3MjBuaVB0ZHVpamNwalZXeUlKTGNzTlJ2QkFnYjJvdGlkY3YyUmJY?=
 =?utf-8?B?eWtGbHlHOUNBZDJFOWVMQzlLaXRFODRhRnc1c0xJajZuck1qeFNhT0NkTHpS?=
 =?utf-8?B?NjdIajdFSjNLOE9TSWFMOUh5akYvZGZjWDBFRW50eVBxNHp5MFhPVjgzM1N5?=
 =?utf-8?B?dHFWUGNSN0dZWm9hM3hlUjdkM0lVLzVxQkhLLzhJLytpRHlhb1Z4MzNLalM5?=
 =?utf-8?B?ZzFnMGZrN2hYLzFFa1VlUlAxZkplRmRZOFhXZnZWOUQ0MGZIaENva3AzQWRo?=
 =?utf-8?B?V2x3bnVENVlXejRxWUhwNUVUQ1plU0xaSDUzU280TTA0L08wTXBpMFZmdFFM?=
 =?utf-8?B?Sko2Y1JJNVAxc0dSejRYSDQ0WHNQK2t6bHcwUDgvdHJqZXdjOWc5Y0xvcmFa?=
 =?utf-8?B?VHViUHlteGVFQ1hGakI0b3NJeWR5M21qZlZkWmJ6SHB2RTJkL0M1L0U3UUN2?=
 =?utf-8?B?bFhsT0k2cjBMZFlZc3VjZk5rNlpoejVTeENhSzhpYVhXTXJUQS9LTm50QThs?=
 =?utf-8?B?NUdhaUVkWStoQURsNTJseVRXZDhUZm5Xa2x3T3R5VlZVbEtkaTR3M3hsTElI?=
 =?utf-8?B?R3l6dGtZOVBzaFpDQ2lDa2V5QnlvTWVMUG9WcDRsRnhZL0JxeUdvRlg1Zk1a?=
 =?utf-8?B?R2oxd01nbm5KYnZZOHltZkNqTzVpay9QeGdnZ1RYUWtUR1p3aXlpalV2d2h2?=
 =?utf-8?B?OERyck44Z1FCL2hxZkQ0bDY0OEN1K3NrNUZDK0cxWml2YkRRTVcxcnRYblBH?=
 =?utf-8?B?eUkyZlBCcmlVWlhlcGkrWFg5SExWZEJ3TUpINHc1ODY4TU5sWHowcTJxWkZv?=
 =?utf-8?B?U2pYNDlBYnF5Y0NTWVF0b0YzWk9Dd0EveUxTNG8zbUxmdUZXV2dmeXZSbHpa?=
 =?utf-8?B?RTBKZU1lU1VuZ3hLQ2o3bDR6NWJ0bHp0cm1RVEx5RWV2TE9Jd2FJUE1NL0Zm?=
 =?utf-8?B?bkdQZUdvaWhhRllpdEF0S01pdWhKa2J3WVZIR0g2RHJlV2U5cUF1cDN2TkYz?=
 =?utf-8?B?R0YwTG5pVTlEVFNzelZhZjl3dklsTVB0NjVhaTcybkJVR3pRaWNnblUxYXlP?=
 =?utf-8?B?WTB5UnFrTXRuTVVFaVBCYzZsTEtqNElXcERWU1owMXdKbmNxVDdiRWJ6eWNL?=
 =?utf-8?B?cHFzeGhoSVhjUUwyWW5MUzFvVExBaGJ1L3RSVW1UOXNqZ2pKNm5mcmZwWFF3?=
 =?utf-8?B?THJ1VjRmeTJOUXlaSFVXWnorTnBDeFhpRVYrMFJqQVFrdzVsT3RTVEdpa3lj?=
 =?utf-8?B?VFdmNVdXbWFmd0hyZXpTUEoyRmFRZFdlaFdJWTBvL0N0c2o4YUdlOVJDVmlN?=
 =?utf-8?B?SVMzYnoyZGdwTjFsTUFmTmltbFBKVGo0dWlaY0V2RWRpSGJYZjByZng0Titx?=
 =?utf-8?B?MXh6SzdJOEd0T2J4dEdyWDVVbHUyMGtHZllWd0Y2WFJYU1p2TjlHM3NMeVlo?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27af0695-0f79-4cca-dd88-08dc4e194693
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 04:49:24.8106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sJ81FCypTo1or+jVcpLXrJUWohx/lM7bdwm8B8WRWTiqA/ifrzirglX3fI4qiob4DVoS/AO/CP2DzqXjhN/wLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8085
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



On 26-03-2024 16:36, Michal Wajdeczko wrote:
> 
> 
> On 25.03.2024 19:55, John Harrison wrote:
>> On 3/25/2024 08:19, Michal Wajdeczko wrote:
>>> On 25.03.2024 16:04, Badal Nilawar wrote:
>>>> To prevent running out of bits, new w/a enable flags are being added
>>> nit: shouldn't we spell out "workaround" or use "W/A" as acronym ?
>>
>> On the i915 side, we always used 'w/a'. It is more abbreviation than
>> acronym, certainly it is not an acronym for a proper noun. But yes, the
>> first instance in any description or comment should be written out in
>> full and only after that should abbreviations be used.
>>
>>>
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
> 
> this array of KLVs may look like this:
> 
> static const struct {
> 	bool (*need_wa)(struct xe_gt*);
> 	u32 (*add_klv)(struct xe_gt*, u32 offset);
> }
> 
> but maybe leave it until we will have more than one W/A to handle
Ok,
> 
>>
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
> 
> still, if GuC always expects 4K "page size" why we insist to use host
> PAGE_SIZE that could be a different size ? even if it will be multiple
> of 4K and it will eventually work on GuC side, why do we want to waste a
> GGTT space for unnecessary padding ?
> 
> anyway, just an idea, not a blockerOk, also through out xe_guc_ads.c PAGE_SIZE is being used so will stick 
to PAGE_SIZE as of now.
> 
>>
>>>
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
> 
> this still sounds more like an 'estimate' than 'calculate' but let it be
> 
>>
>>>
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
> 
> ok, I missed series that sets baseline version for xe, but maybe still
> worth to add some comment to the commit message that this is already
> supported by all our baseline GuC firmwares ?
It is already mentioned in commit message
v2: GuC version check > 70.10 is not needed as xe will not be supporting
     anything below < 70.19 (John Harrison)
> 
>>
>> John.
>>
>>>
>>>> +    u32 reserved[11];
>>>>    } __packed;
>>>>      /* Engine usage stats */
>>
