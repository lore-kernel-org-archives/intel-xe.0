Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A954D35149
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 06:47:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3E310ED56;
	Wed,  1 Apr 2026 06:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="asbOuszk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2575310ED56
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 06:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775026050; x=1806562050;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UP/L1etgHY4k0c09lWHfIZCARPEUJ1pFbXHHNXDZz34=;
 b=asbOuszkkP3ln2JQIIObpHMvuREwYvepDVghN+N2xMJ+3wMXSiLF824X
 FIgSkVgfGlXmYjA2TtazgtRoLrjl2kbha/cD77R0zsyJKPMFiTQCgMLco
 XkwXwj/6hPCpr7u99F5aoyRus7pv7iB2KMy0BL1MNz6I+oKNOGogGM+D+
 8NOXZGf6PJRrrQ1KaGPZwbEurvBYPa1l8hKsy+rO5eI7nqQ8Ta0LtexZu
 4i6DpBFyVo4XxnCuWx+znp5Uo4nkVJSRsUMn2enKHmBdZt27wtWGdC5xb
 1hy67UOCn9+PbOicmiU4KWCDK8P2gC52FY/0rJn8xJmM5lgKMmgw1JnG5 Q==;
X-CSE-ConnectionGUID: TBtUvwmnTtakbiM0r9INlw==
X-CSE-MsgGUID: w5WFP2ecQGCS67GR+pNicw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="87514942"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="87514942"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 23:47:29 -0700
X-CSE-ConnectionGUID: 9yUcO76ySayWLxiPqv2oRg==
X-CSE-MsgGUID: K5t+acO/S4OXrzHRXuC+Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="249807174"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 23:47:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 23:47:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 31 Mar 2026 23:47:26 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 23:47:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FNzrFc99GoHmUD3c3BOxgPVShOUoFHzknDBzp+QyYs7c/ROvg2SfjZSYVMKSv6Os2sA/HB8BUHNfzKeGoXdgaecS6ndvu27yV9bxWAX0tTO8Z8hSD6XeipYyhVOrtCb9VUbOtlw2LaJzg/oq+OxEck0GbvB9tdjdBRX/HbUdxEG+V+tQWCkRBeeClF3FN6I1Vy4CittpgPlg31PBbwvbmoglYkUUxcMGWYChkt/JGO04R/DNRq8FQaQCK4xEpWADSNoQwwnpCD87rbVNU09hflJ0HqkhlHrRDVxACri02OQy7zB5upwDDQUaCmeiFu6Xjf0V1Njl4J8JItP1os14Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vfuiw3wev68teZgDoakiuHoEB3hixSAkVmdwQb/Kgsk=;
 b=X5y/oSX85uvmjER60HMfHOG3mt2jfwlTXOppEf51tbgkr744ukbIYaqfQwYowPKnoxBjal8Qin9o9xkcbXc4TU8ii4GS7yVuoz0amaJKutCKnyjOR80hQrWYFHAsLOE4WVCpeE4V1uwp9njPFql8KlpwgahMoW270ZdNnVh9HtrYnY3IJXIVEUdaA0/XZgP0Fn/KUNlafb1f8YhAeug5BbxFbPbKjAXOBjmpRfXpiwGzoXELsGMkK1MfHNOyzRSc+btTNkfy1KL2rloDzrYl16nptQMOFZNIoJED5b1VujYLcOmW6bpCzaVb8eAf9ycYgsKxrJHhYVQyIvlF2KTOGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 LV8PR11MB8605.namprd11.prod.outlook.com (2603:10b6:408:1e5::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17; Wed, 1 Apr 2026 06:47:18 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9769.015; Wed, 1 Apr 2026
 06:47:18 +0000
Message-ID: <faed4590-6408-4c3e-a2ec-52c68c47650a@intel.com>
Date: Wed, 1 Apr 2026 12:17:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] drm/xe/xe_ras: Add support for Uncorrectable
 Core-Compute errors
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>
References: <20260302102155.4074630-13-riana.tauro@intel.com>
 <20260302102155.4074630-21-riana.tauro@intel.com>
 <aahjUV9VPkT11a85@black.igk.intel.com>
 <cbdfde54-2625-4c9b-bd48-2c1c0b63cb24@intel.com>
 <acy8XXWwxbpLrFsL@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <acy8XXWwxbpLrFsL@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::30) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|LV8PR11MB8605:EE_
X-MS-Office365-Filtering-Correlation-Id: 916207b4-56ec-4603-9958-08de8fba8453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: ZoB6rSGJoPbDqJDzpR6M48tdsAnNfKnbKe81V+bCfLuUPms3XxN1gWfnbrAZgcPHhp00eHppsiJDjgO5k7cMY7dLTN9hQ/AinGYCaAwq0kw0kwGpQswq+9aQfguaNjx7xGXVw5o95jE6ihP7KTetPKK6gnRWSdLvlCtH6CcUAxQ06qekps7t8E5YVrqL+scI0pkFMI0TDCyjMmSBc0JXqMi5jsN01tZhFW2FIjzaoUoG1CHGl4UjLZ/kgYUNlDZuR7zlK1lNcPOGWkIGOY2Ndez/koaZBA8HXlCjn9ubSqzTuY1DvaG5Wutw+HS5DGL9HzSqdfqCYyN/2LOVg+GND7w0qkOkPnLfyGuHMHXPNjpc58jRAIAQbKlW9y0FYxOq4r3tmGu1N0vhnBHYJQx+qf6URp6GVmdFJHn+P4YLyhpx34AL676Erpj/e3GwTMHPyFdLzqXOmgfIwG07fe+MstOiNLQJ080mLNgs/u7tbRqOhLjQJ7R5YDf3t5xzh5uG3Hhby/PKkXh84XcA4Gr7ifU0D6ETgOjj4EbWWND26yINpD9+POn/RGx6iiMmjfak8dJduvcA1AXVyOzasU5lHZ7qszktgRFGlP8neY07mWsTrAKKg0ilFW3ol8rh3z+QzEI4D3aByTrdpXafa88Hl5ykI79jyxg8fOwwGbfl4gbLr7/4r1rr5w442i0Fwi+XevqLiKO19hZpsqGN5nRFSIkkKauEF79vsczisN4siu0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzcvVDFmbHcxQmpFOTlOV3E4Qlo4R2FqNEY5WE8zUUlsU3V0L0dPbzI1YTV1?=
 =?utf-8?B?U0dYWU01cVl4UXdnZEZwTUxqTlFEdnZMc05OREhnQ2lRR3F5M2pscjVlamI3?=
 =?utf-8?B?Wks2dkozaGNJMnhrMEhtT3ZsTXFKQ0FzU1RobDMxN0Y2aFB1WmFRTElHRnEv?=
 =?utf-8?B?L096VDVqNTBMZy9KMlJqbDBnaGpiY0lEZEdCSGd4T0lBMnd3eFZXd1E0ZVZS?=
 =?utf-8?B?YUVMWjFEMndNaWhzQXgyTmIvb1BoTzRJUzZrdGtCZ3FiUGhFMmRLNjhEN2Rp?=
 =?utf-8?B?emxzc2FmNjR5R3dvLytidVJFS1c3MWVZaUMyeFlCK0NmcUl2eDFHQ2dWSHNH?=
 =?utf-8?B?LzZ1OXhHRENZZ3k5WCsyQ3ZuWjltRjNtK2tQd00vaXdPdWYyNll6dlFIMzFy?=
 =?utf-8?B?cUpoMmZuWUxoZmRmMDdsdXJPSUJ6NjVScnNaOVBYekU5dmh1NnplUW1iUFVP?=
 =?utf-8?B?b1FRZk54VTVxMjR0Z1FubVQvWExjcS9pZk9STCt2cW83WTJ1amtGcjVleFpu?=
 =?utf-8?B?RDVZc2wzb1lNY1NlMFRndXd0VzVYS3F1bmlJbUdiRFVmZURDWWZrVmJlNVU2?=
 =?utf-8?B?QzhIcHpqS2lNSGc2cUxNZnQzL1R2S1pjeWZwbkpuREEwNTdBekpvTTlPT0Jw?=
 =?utf-8?B?OFNsWXloYXhtZjROUnBEc2hISjRCZXVlUjcrL1VGZ1NGRWIvMjA4YzNUT0Vi?=
 =?utf-8?B?NVk5OFFWM21nYno1elJVNkY3YW9wd1FGZHFQR3Q4bkRxdTl4S2tVR2U2OWpN?=
 =?utf-8?B?cjJNS2NBck5OQzdkNnkzTHpQY0RaNnVmN3dJNFg5RDNZUkpMbXFvYS9tMnk1?=
 =?utf-8?B?T2FYZkZNV3RteEs5aWZ6Si82T2hFQWphVDBMSG8rdS9WWjhzeDRIbXh6Z1c3?=
 =?utf-8?B?Znd5TEFBRUVLTmRuOGlSd3RoWVdwU2xCNGlCRkMwZ2RTRGtTVzcyK1VEejVS?=
 =?utf-8?B?eElJTTFIRUM0aGtKdnFsaFVCTUNycVBPcnRGVCtja0JvTEJHQ0ZRYmJ3dmZB?=
 =?utf-8?B?K21rSDRIbU0xaUdocm5HVjhuemVLL2pWUFBUNFhkNnVSV3BiNE5GdlFGcHds?=
 =?utf-8?B?ZC9IOGNKU3gzeDNMZ1Vnbmp2Lzh5L0h1UCtJT0syVmpwSDVPUklRTm5ORUl0?=
 =?utf-8?B?M1FpeTZSUzZkSFFyMktkazhjTUo1VENrVWpaaGJTZ0JickVrcUs0MCtYVEZF?=
 =?utf-8?B?ZnI0c2RFRmpTbFc4Z2hRRlJJVjFyTGZaMTZKdjR5VkxGR0RFMFNiZ2dXMGJl?=
 =?utf-8?B?TUNRbnRHMXRsQW1pSmp5VE1qQWh5bnFXb201VDFBVkFFSXRPeCsycktGWFdq?=
 =?utf-8?B?L05hM1lYRGVsV3NHbzlJVXR6NmIvZElsK21DUXFUOWtDZytpOTZEdVFKOXl5?=
 =?utf-8?B?Qll2VzdMNmg2a21YQnFoUXAvanJWNXE3U0dnNVY0MlVYMG5FSko0SGRnbDc0?=
 =?utf-8?B?a0plUWR4OXJGT3ViYWJ2Uzc5OHMrUU1EdWorRUMyVkVydURtSGFrZVhEZE9u?=
 =?utf-8?B?eS90RWxEdHRSTkFhUTN2VmdPa2hNUjJDUjI2aFJVQ1lEU2NhcHRlcGJOV01J?=
 =?utf-8?B?Qk5iaGU5UnRraHhJZ2Y0Q0Nqbm1sRWhQQ0lRMnErUHlyZUFSZTYxUktkSTNL?=
 =?utf-8?B?T1FpckkrL1BFbUhkR2NwN1loeHlWeEMyOWtmWkI0Z2M2Tm1SVTJMSVJOd1RK?=
 =?utf-8?B?NERDalNvRUdHaHFFZlhkVXRxVUlCNERzM21wRkU5WjN2OXlZdmdkZzk3d3VE?=
 =?utf-8?B?amt3Q05wNFhET25zMmlTdmEwMEtHMzVyUFFXalNiSFBOWU5nVEQrT0xPVGhn?=
 =?utf-8?B?ZnhFaVZxRkw1L2Y0UEFReExaYXA0RWo3Z1NVM2pnVG1GQ0dVSjNKOVJyWXpG?=
 =?utf-8?B?OVNMY05Qbm9zcGZwdmFSSU1OSHY5ZldyYlBUQ0E2K24venVza3RwUWNRT1hN?=
 =?utf-8?B?TXhFK3FhVVNJNHpPQ3pyZWRYTlkya09XdmJMUXZxYXdpNUtsUGMyT0FKOTZq?=
 =?utf-8?B?Wm5IY1N2c2tVT0k1dXFtaHgzWDdWQ0tkTXRBZjAwVC9FQmIvN3pUSU16elR6?=
 =?utf-8?B?b1JKdnpmRVFwRzExRGlhbnNDV1o0ZklYNDkydXdLVENoMUVzVndmaXhOS3FV?=
 =?utf-8?B?RGlHUWVNTlliN05hVWNmbGs5cjNYYzJQVHB2QnZBTnAyTnE1dGswYlRlS1BH?=
 =?utf-8?B?WUkvbkZ6YlZ3dXVzZVBpOU14VGxmUS9jWXJkeXllY0tZT1VKNHRZK1pIQlpW?=
 =?utf-8?B?cGlOQ3lyMGRvUkVqcGhqWGFwQk5jVlJSRDdqMHhncS9hTitKM2pBd0E4bStU?=
 =?utf-8?B?V0lWTG11UHlacHc5ZmtFVkZweXZuNmlQaXRWck5GTS91eE9ndmpjdz09?=
X-Exchange-RoutingPolicyChecked: l+iQB/66TF0PzPX8q2IQgabORcwvGp3jvqgaq0wYozrfXIJGHytfR8SWmyW8WWPxgczsO6CsZF+HfT5art2Dfia3LJjlRb0WnMfEV146sw7bkUXVV0APcBOJ6g60sicME90qvCdqZ62gn5hDVNln7GZJMTqY/MOsBRuDf9KZrxWhIqTtGaVKKrcZg+vvMyoI+/W+Kj7AuK0k15WLBkpa6dERsEhXFgMhy4p2P3pAEZAOGoiqtig2vzKzqBPjFXtLkDcLZoEcQz2ZrSUUP/dc8of5dquv9FrnjDV2RE2NPGMyOTRW9bZ8EJAHVBOYpnVK7RFdiTA4eE1avJCA4URwfg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 916207b4-56ec-4603-9958-08de8fba8453
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 06:47:18.3396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K25A6GMCUKEc4fjXDCKHoJ0mkEh+maZBhkdpt3lR8atmw3dnHDUAdH7XOtuaeEsw1O1378dkqzwmVBgIGqS+WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8605
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


On 4/1/2026 12:04 PM, Raag Jadav wrote:
> On Tue, Mar 31, 2026 at 09:54:32PM +0530, Tauro, Riana wrote:
>> On 3/4/2026 10:22 PM, Raag Jadav wrote:
>>> On Mon, Mar 02, 2026 at 03:52:03PM +0530, Riana Tauro wrote:
>>>> Uncorrectable Core-Compute errors are classified into Global and Local
>>>> errors.
> ...
>
>>>> +	} while (response.additional_errors);
>>> I know we're not NASA but I'd try to have some timeout instead of blindly
>>> trusting the hardware.
>> additional_errors is a indication. So will be 0/1.
>> Timeout is already present in sysctrl_send_command. So unnecessary here
>> again.
>>
>> Also before every sysctrl command we are setting response to 0.
> If the firmware returns the same values repeatedly, we'll be stuck here
> indefinitely. I know it's extreme corner case and probably a firmware
> bug, but that's not an excuse for the driver to not handle it.
>
> I've handled it[1] as flooding, not ideal but convenient for now.

In your case you do have a max count as 16. But for this command there 
is no such count.
Let me check with fw and add some check.

Thanks
Riana

>
> [1] https://lore.kernel.org/intel-xe/20260331102346.1034100-3-raag.jadav@intel.com/
>
> Raag
