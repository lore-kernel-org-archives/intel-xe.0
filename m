Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79AC7C54E64
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 14:43:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2C610E3B5;
	Mon, 25 Mar 2024 14:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MmOwjR/s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE85F10E93A
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 14:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711377828; x=1742913828;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TPTh/pATFo9xtv116Zk5XeFexOySEVxvBw0G7R8/KmE=;
 b=MmOwjR/sq9IHyHeUxZDugwme4QY/vwHUjNZig1LwiemrnqsulD/U0dt7
 gDcd/hpV/e63cgbvnYcptrVtTzFzgSZ5OhtklRlVubdYX6UJ9ZsulJSJJ
 Q5FxmOI9BHMVyIicSo2mEcRM84/6WCPDj50kvR/9hMH++BxVOZrhfDPON
 2zm1vFIZz6Cdph8iJz1/xj0rfRy4M8C22QhUSjWaPmbwyFmFSwlS3AHYs
 9sYbszL47WsEl5njgqoEhzSyIQXJDKDWgnUaW4S6jxv0dICf+aNBdpcVe
 KXKnCtFZbMXr4bpOk01ctvNTLwMRPQR3GkdSTqaZ68mgIQaylm87c+Uqo g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6245799"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="6245799"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 07:35:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="20319146"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 07:35:17 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 07:35:15 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 07:35:15 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 07:35:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPxHfuxs4sR8PQi0uHMKCnCRhTB0GxwkQKppRVOb3HOj2AFS7tAb6C/Zb0c9/VCZM4xCxdPPGwv6/q+lo3aPjC/Zl0/OFWRJjmgt8PtCw1ah/urraAPB6oHWIeEnFsCyIZiXx5I8e7vzAKSY5vy1P0iBLuULm1qkxCQfNrB4pJhtrvL0LXLG2U9r3cyWjju8DuEQk52K/S8TertllLnEOfxOH98z06JluIAZ7qD7xt+c3Q5FVvpbP17aBT76/rh5cVHERulRer7DVrO2cyItgsPwo/K0lKD/kRF/lsasS5JbsucEKtcAuOLb6UBP3WT2BCYZDo6rSB3UZ/eQriJuyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7fAKlT6sQ8LodhK0ta2AsubLZzHCiqfrYYwg+PCqUo=;
 b=bN9Sr5gbwvVd6gjt/2zr/LglV4JRQUKR/r1abQ54Cp+d6qsgLdv0t3mjcimLqWJkCyW8BCrKPsV/4rsX8Txd8T0mYLSwtOiXX0H5vxEDUS6wbBQTdnQ+xVf0CMCuwXQbT2rWK6Ptl1MQpWGleVD//LlYKG/rLrjw7fGM+Puh0WPiOJxpf9d/1Oj82tU3ZYGryb81HS9JfaDA88C31u6iztBSTiztCOiFa0vfWqAMfX9FY+UG4gJscVJoGuMDztC8Ux1LU6wdpxJzXJDnYq6V1zanCd4KiSWCXYiwgXerH723w0ChY2qA7VRJ2cCWi7mK+GpAalqjeVQPY0/ZegtCyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CO1PR11MB4803.namprd11.prod.outlook.com (2603:10b6:303:95::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 14:35:13 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::eb80:5333:fa3e:cb6c]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::eb80:5333:fa3e:cb6c%4]) with mapi id 15.20.7409.031; Mon, 25 Mar 2024
 14:35:13 +0000
Message-ID: <120645f3-1eb6-49bd-aed6-25c31d01981a@intel.com>
Date: Mon, 25 Mar 2024 20:05:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe/guc: Add support for w/a KLVs
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, John Harrison
 <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <matthew.d.roper@intel.com>
References: <20240319160859.2672825-1-badal.nilawar@intel.com>
 <20240319160859.2672825-2-badal.nilawar@intel.com>
 <c4637cc6-307f-42d3-859c-15b9c304b44f@intel.com>
 <fdd66cb9-eea1-4e70-9498-ad1b48c94717@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <fdd66cb9-eea1-4e70-9498-ad1b48c94717@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::10) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CO1PR11MB4803:EE_
X-MS-Office365-Filtering-Correlation-Id: d2593dd9-0b94-4418-aa18-08dc4cd8c828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oyNnVZP+sCDWGrgQmO6aGtOn/Ngxn99IqFC6qCHmtrBlk0u5ZcStNFrdfqaY6/N6pVcyM0TZkDDxYAf1o/ZVEZutrbeTk+Wkn86KTA/yowW6DN+w7MdMPRKuRn9yLzXmn16KzdSZUfdqiR9ENkq3xND0TjOt0NnvTMD2EzVO/WIdKiSx2J+TBA1UXgHRtFQS/qBBWV9Np003e/jSvSOz9cQrfu9GrWdf5pFHEUh4imsGJm2ua8dZODgskjJYudIbdjjp659EyOCGtgbvjU22TLLPXyOXzJmROY8T6Y3N5LVQksLY5Db/SrPx133e4M4ij1SwImCTR0wKZbUdMaRAD9qgw00K88FwKz6jxx1J3DjLwRJKzDqc+m2zmBnXGNAUyJgYF3uzFU1me+vZjt7hjctmwzClgvEnbNGtgSvSu8DebskjgisLgDE8tvmgpCXU5NiWj20x2txgV1JSp3F8+HP6rtJzuZC6eaOfoAPLUwODg+h+V2mWfzJnp3qxQQ/vTTzkh9PfhRNb1XnByYyydh0PrOHK7vgUaaB/J/74v+bP/GlOaQVorV4KWfSGXnwCjGUWcH2xSSPnaqhLqHIfkHaznUIvGM5SVocVag3Kl5M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUttMlpTOFdkUkhSdEdja3l4d2VtUWZVb0Z6amVlMHpuVEJ3dlcxK0FmbWFM?=
 =?utf-8?B?ZlJGR21oTmI0czJjcjlPL0UwTVc4bjY1bmRHWnVnZlNWZDYxMGhQUnNBSFo0?=
 =?utf-8?B?NW0zMGJFT0VOMXdiWDlLU3NNVnJmd2tnK2MyWWZ5SGVqSzBnNHE2RzdXallu?=
 =?utf-8?B?TFptSkJQRVVxU2lMb3JpV3VOMk1CalFwNGhtQXFwdmpBYjhlZEVDUmFJbW1v?=
 =?utf-8?B?NGxSU01IRkhpUGRWTjZMbk1tbDFqa3V3WTlDdVBIYUZVd2dNZWRJazFjSXd3?=
 =?utf-8?B?OG1VOU9HTndVa2NDY2NkT20vYmxHNlRZVnAzUllvbzBZWXpXWlFwQ3p5VGx6?=
 =?utf-8?B?LzlGWm1mK052REN4TFQ0VVdOZ1NLUzhGZ3N6UlM4bk5zNjdpc0owWVdwbFc1?=
 =?utf-8?B?YVpNMTZ2d2VZTXB4RDdBVVZrWGVGZFhxRHlDSXJkejFMNTdwQVhCdWptOG9I?=
 =?utf-8?B?aXlKeDUzQ3A2SU01NzFFZGJVVTAyalB3S2pid0lraTUvUy9FanluZ016eVFL?=
 =?utf-8?B?NkoyTnE1ZjBqSlFzdXFuQVlHR2x1UjZMb1BlM2Y3SGVPQUpERHAzbWV4eXZ1?=
 =?utf-8?B?L1Z0TkljcTBWcjNzemx6TE5JL1JZOGRpNGYzc3pMMVl0QXNIRzBDc2UzU1lU?=
 =?utf-8?B?SmQ1Sk1IcFp3MFliSTNtSFd4ay9UdS9EanV6WHhhQ0lTYUZ5MEQwU3l0RnVz?=
 =?utf-8?B?NWd4YXFrNU44QnFKLzlXaytvTGgrK2luVDBidExOUW1kR2dMSG5POFM5WUVF?=
 =?utf-8?B?d3NtSGp6RjZKYkQ3K094QjJVTS9mOUhUbU1ZZis0VjI5bnZHTFVDUWFYQ2pp?=
 =?utf-8?B?eWYweUZpaExjOU9Ka0Vvby9ac0xRWjVHdDFRVlpSQjJ2a0MxRmZuV0hOVEUv?=
 =?utf-8?B?VFppVjJHbTdVYlZiUnVXU1dyMmdRczBuajMzQVdrWStGYzA1N3ZBbHAxOXlN?=
 =?utf-8?B?UW9BbUI1THJVT05ZYXFQVnhYRll6YkRTQnQ5QnZxeHUvbVRpUEZMT2Rycy9R?=
 =?utf-8?B?YldSeDdKNDlsUWlvK1lXdktiTW9RRE1iMHJwNUlreDFwdkZEK1RvZkNKdVJM?=
 =?utf-8?B?eVpLU1p6d1lVZFZ3Zm9IemdNSVhSbW9odWMzWUdWVmZZYXdKcDUya3puMzB6?=
 =?utf-8?B?bnU2L0VicHJwNTNveUVDZTdCdXAvQXlNdW1yMC9mRjM3NTh2aTRoeitpckov?=
 =?utf-8?B?WEJ2MFYzeEZEWU5UZ0xFMWh6MjhCMWwvKzdmbjdEYlBDNWVnS2x5eDhlc3N0?=
 =?utf-8?B?ZkpGV3BGV3FPZ0UwcGtKY21vMXY0M1VQRGxDOHRPNlorN29PZGJIdGs5R2h0?=
 =?utf-8?B?Y2FJdGVkTDFvZ080dWc5dHdtSnlERHpIZUI5VXBCU3p5ZTlid0p6TmlRMU9z?=
 =?utf-8?B?YUpxNkltTWlObU16amlxdm05dUIxUUxrdVBzV09WYUZYSHc0QVprNGdjeWZZ?=
 =?utf-8?B?MUthZFEwKytFRElGN3E4S1dPWFZmbjlkMytjTEZFcE5mMHdUUXAzdGpDM1dV?=
 =?utf-8?B?bWFPR045L2RVZERQNHFJMVh1ZVZEV2FSTGtraGQzWFk3KzQyTis3Uzd3ekJL?=
 =?utf-8?B?VzhmTmxjcTI3SUJEZVBtQVNDZWtnVHR3a3h1UVVXbzM3T2pSeDdVbVA4Wnhh?=
 =?utf-8?B?SkUra2FnT0N6dE1qSStDSjU4dno3eHAvOU5QRE4wVW40K0VnS3NvTmtWeU16?=
 =?utf-8?B?Z3daU1BMYzdLeWtHRmUweW4zS2dOdFhpbmNUSVBDSGY5WVh4bUgzZmp0Um16?=
 =?utf-8?B?RTNEanczYlovd0xHK1hnc0QyYkdxV3BqSFFqTGl1UFBrczE0UEo0ZTBmV3k2?=
 =?utf-8?B?L29GZVZjYXQ1MElRdXhBTzBtWlFPTFk2R1dlbmhoWnJmVUtxU0NNQkZoZ1Vy?=
 =?utf-8?B?eWdoa3d4WDFJZUNlZFF5N1F6MnYxR0ZCTlZOZ2h3SDJHWkIyOUdwZXZJSm8w?=
 =?utf-8?B?U2xjMXFBemVGUWNBVnJCM2lYZDdwRmowdU9veExNREdUU0s3T1didjgvZEpV?=
 =?utf-8?B?Ri9NU21XaWMrUzlrdFlzS3VreDh3aUFUT0NRa2pzTldycHM0UFptL1FrZjdn?=
 =?utf-8?B?NVZMMlNHVll2RlFRQkVQNC9uclR2OHpLY0VPMndkTUZuSnU1NDFrUjhBRlBI?=
 =?utf-8?Q?V33HXZjWJ3iBC3dzDNQSYnhSO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2593dd9-0b94-4418-aa18-08dc4cd8c828
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 14:35:13.6004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 30H1415wgjnTTWWtFy193aO9w1xLUU7sRG5tseSbxDr99InpaHppUyp0Y3QmjCSgKQ28i/7JvTTrDRNBd55uyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4803
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



On 22-03-2024 22:45, Daniele Ceraolo Spurio wrote:
> 
> 
> On 3/20/2024 1:40 PM, John Harrison wrote:
>> On 3/19/2024 09:08, Badal Nilawar wrote:
>>> To prevent running out of bits, new w/a enable flags are being added
>>> via a KLV system instead of a 32 bit flags word.
>>>
>>> v2: GuC version check > 70.10 is not needed as xe will not be supporting
>>>      anything below < 70.19 (John Harrison)
>>>
>>> Cc: John Harrison <John.C.Harrison@intel.com>
>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_guc_ads.c       | 61 ++++++++++++++++++++++++++-
>>>   drivers/gpu/drm/xe/xe_guc_ads_types.h |  2 +
>>>   drivers/gpu/drm/xe/xe_guc_fwif.h      |  5 ++-
>>>   3 files changed, 65 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c 
>>> b/drivers/gpu/drm/xe/xe_guc_ads.c
>>> index 6ad4c1a90a78..506f0be35763 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>>> @@ -80,6 +80,10 @@ ads_to_map(struct xe_guc_ads *ads)
>>>    *      +---------------------------------------+
>>>    *      | padding                               |
>>>    *      +---------------------------------------+ <== 4K aligned
>>> + *      | w/a KLVs                              |
>>> + *      +---------------------------------------+
>>> + *      | padding                               |
>>> + *      +---------------------------------------+ <== 4K aligned
>>>    *      | capture lists                         |
>>>    *      +---------------------------------------+
>>>    *      | padding                               |
>>> @@ -131,6 +135,11 @@ static size_t guc_ads_golden_lrc_size(struct 
>>> xe_guc_ads *ads)
>>>       return PAGE_ALIGN(ads->golden_lrc_size);
>>>   }
>>>   +static u32 guc_ads_waklv_size(struct xe_guc_ads *ads)
>>> +{
>>> +    return PAGE_ALIGN(ads->ads_waklv_size);
>>> +}
>>> +
>>>   static size_t guc_ads_capture_size(struct xe_guc_ads *ads)
>>>   {
>>>       /* FIXME: Allocate a proper capture list */
>>> @@ -167,12 +176,22 @@ static size_t guc_ads_golden_lrc_offset(struct 
>>> xe_guc_ads *ads)
>>>       return PAGE_ALIGN(offset);
>>>   }
>>>   +static size_t guc_ads_waklv_offset(struct xe_guc_ads *ads)
>>> +{
>>> +    u32 offset;
>>> +
>>> +    offset = guc_ads_golden_lrc_offset(ads) +
>>> +         guc_ads_golden_lrc_size(ads);
>>> +
>>> +    return PAGE_ALIGN(offset);
>>> +}
>>> +
>>>   static size_t guc_ads_capture_offset(struct xe_guc_ads *ads)
>>>   {
>>>       size_t offset;
>>>   -    offset = guc_ads_golden_lrc_offset(ads) +
>>> -        guc_ads_golden_lrc_size(ads);
>>> +    offset = guc_ads_waklv_offset(ads) +
>>> +         guc_ads_waklv_size(ads);
>>>         return PAGE_ALIGN(offset);
>>>   }
>>> @@ -260,6 +279,41 @@ static size_t calculate_golden_lrc_size(struct 
>>> xe_guc_ads *ads)
>>>       return total_size;
>>>   }
>>>   +static void guc_waklv_init(struct xe_guc_ads *ads)
>>> +{
>>> +    u32 addr_ggtt, offset, remain, size;
>>> +
>>> +    offset = guc_ads_waklv_offset(ads);
>>> +    remain = guc_ads_waklv_size(ads);
>>> +
>>> +    /*
>>> +     * Add workarounds here:
>>> +     *
>>> +     * if (want_wa_<name>) {
>>> +     *      size = guc_waklv_<name>(guc, offset, remain);
>>> +     *      offset += size;
>>> +     *      remain -= size;
>>> +     * }
>>> +     */
>>> +
>>> +    size = guc_ads_waklv_size(ads) - remain;
>>> +    if (!size)
>>> +        return;
>>> +
>>> +    offset = guc_ads_waklv_offset(ads);
>>> +    addr_ggtt = xe_bo_ggtt_addr(ads->bo) + offset;
>>> +
>>> +    ads_blob_write(ads, ads.wa_klv_addr_lo, addr_ggtt);
>>> +    ads_blob_write(ads, ads.wa_klv_addr_hi, 0);
>> @Daniele is pushing a change for supporting 64bit addresses (for 
>> future compatibility) - https://patchwork.freedesktop.org/series/131282/
>>
>> Is there any value to changing this address to 64bit as well and 
>> changing the hard 0 to upper_32(addr) instead?
> 
> For consistency it'd be nice to do so, but I'm ok with just hard-coding 
> a zero in the upper bits if the variable is a u32; the compiler should 
> warn us if we ever switch xe_bo_ggtt_addr to return u64 so we can change 
> it up at that point if needed. The things I want to avoid are either 
> using upper_32_bits() on a u32 or hard-coding a 0 in the upper bits if 
> the variable is a u64, and this patch does none of those things.

Thanks @John, @Daniele for your comments. Although this change not 
needed for now but for future compatibility I will do this change.

Badal  >
> Daniele
> 
>>
>> John.
>>
>>
>>> +    ads_blob_write(ads, ads.wa_klv_size, size);
>>> +}
>>> +
>>> +static int calculate_waklv_size(struct xe_guc_ads *ads)
>>> +{
>>> +    /* Fudge something chunky for now: */
>>> +    return PAGE_SIZE;
>>> +}
>>> +
>>>   #define MAX_GOLDEN_LRC_SIZE    (SZ_4K * 64)
>>>     int xe_guc_ads_init(struct xe_guc_ads *ads)
>>> @@ -271,6 +325,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
>>>         ads->golden_lrc_size = calculate_golden_lrc_size(ads);
>>>       ads->regset_size = calculate_regset_size(gt);
>>> +    ads->ads_waklv_size = calculate_waklv_size(ads);
>>>         bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads) 
>>> + MAX_GOLDEN_LRC_SIZE,
>>>                         XE_BO_CREATE_SYSTEM_BIT |
>>> @@ -597,6 +652,8 @@ void xe_guc_ads_populate(struct xe_guc_ads *ads)
>>>       guc_mapping_table_init(gt, &info_map);
>>>       guc_capture_list_init(ads);
>>>       guc_doorbell_init(ads);
>>> +    /* Workaround KLV list */
>>> +    guc_waklv_init(ads);
>>>         if (xe->info.has_usm) {
>>>           guc_um_init_params(ads);
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads_types.h 
>>> b/drivers/gpu/drm/xe/xe_guc_ads_types.h
>>> index 4afe44bece4b..62235b2a6fe3 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ads_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ads_types.h
>>> @@ -20,6 +20,8 @@ struct xe_guc_ads {
>>>       size_t golden_lrc_size;
>>>       /** @regset_size: size of register set passed to GuC for 
>>> save/restore */
>>>       u32 regset_size;
>>> +    /** @ads_waklv_size: waklv size */
>>> +    u32 ads_waklv_size;
>>>   };
>>>     #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h 
>>> b/drivers/gpu/drm/xe/xe_guc_fwif.h
>>> index c281fdbfd2d6..52503719d2aa 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>>> @@ -207,7 +207,10 @@ struct guc_ads {
>>>       u32 
>>> capture_instance[GUC_CAPTURE_LIST_INDEX_MAX][GUC_MAX_ENGINE_CLASSES];
>>>       u32 
>>> capture_class[GUC_CAPTURE_LIST_INDEX_MAX][GUC_MAX_ENGINE_CLASSES];
>>>       u32 capture_global[GUC_CAPTURE_LIST_INDEX_MAX];
>>> -    u32 reserved[14];
>>> +    u32 wa_klv_addr_lo;
>>> +    u32 wa_klv_addr_hi;
>>> +    u32 wa_klv_size;
>>> +    u32 reserved[11];
>>>   } __packed;
>>>     /* Engine usage stats */
>>
> 
