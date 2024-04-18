Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D3FC4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 05:06:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 662EC1139CB;
	Thu, 18 Apr 2024 05:06:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wo2ZR+Uf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82EF01139CB
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 05:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713416809; x=1744952809;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=rpdVI7IgrBpD++ni70Vkl3U3ogdZJaRXgfXA6WqB2EY=;
 b=Wo2ZR+UfPnEh/wJBpUOPscyD/SesqmvBCIR+VJbP4tYTkayhgJWoVu2e
 MzIhBenKBp+lssDuMObLXO1Z7kSeWmEsNHObJF+UjyaqP3VLvcZJ35bOH
 zv5+DgY/Y6dRv0+kA9wg95IKrfL02HXUa6uklbByu+15YtOlIJ51uBgn1
 L/xxprLQXZxkUmKFE/D2a3jIquX9mEVgaaYoXHA+EniX8GrrtSbsz5x/p
 vg1BEaVddkdfkjIrtsh8M7x052e6Taxt2KQptN9IaRC1rkJK5wndKaiCQ
 NfffJYrqGmcHTm69DwM3U6IYOTQJXk9HOUgsS0EmvIvWI0iBfuc78Simm A==;
X-CSE-ConnectionGUID: ljEc+lM8SvGl/7y6hXbtcA==
X-CSE-MsgGUID: aSpovV7CSY+jMo4vVe7pYQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9489560"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208,217";a="9489560"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 22:06:48 -0700
X-CSE-ConnectionGUID: YR0f+7PNTdmVLL0V1qBEuQ==
X-CSE-MsgGUID: HmnBuCohQ0iSnLNvt6pOPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208,217";a="27514718"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 22:06:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 22:06:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 22:06:47 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 22:06:47 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 22:06:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h4u4AAM9ZvNC1mH008oQcBJKZdrVgCLkXFXE3iB2l7h1SpDaixqM5WTsOeNrc4cjZO3YbAD4l2JB2KtpTIUcVGm8aq/ewROmqgRPaKcgI7+TdV5JUU0YRVRLFwyMMm9bCYJM4uMBbdv3PfxpXv0SLox9RYzz98cz2Pv5POOiphcJA40fEK6rB/CssZlRd9Ue+hfn7AUXG+hQHzCGGGyrkvJCsh8mbPQbll+qRKt/BBpIahdagX1WO/+r30Y1IJQEUPDVd5xS+uyfPukGrNtNK/hWBlYYow+0OT8ae7ZQnYwyJEHoVllMmJrwwtnVi/j4RAQzBdGzn6fuoNCn9+42jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=irjyqME/G5S99Ie7d0NdKPNGwyjESZJ7TDzh/O+8WB0=;
 b=nC8USxJK/l6Tsg6YHVM7hJFpm5aTpm9zwCd/ToQh0CoYJpdB5NjBEXQGU3ZJ4qiz/p9B54EAS8eFoqy/YIMOWz1OeWN63tih3OlcPi0Wabi/9IoG4ALkdzct5naucg9Bv14HrC2TC/BE22PyMC2gwRqVIfIvWK7lzybdbD+egnjG30EaB8qOYdP7n2xdi8ZIh4K0NIELleUpK22MIqJAiwO+DdbJekhyJHb+3LIysUOdKVG/ARX8dyuzkZyQ9Cl8k+4nxRN83QhaPNAm6qpcmuggX5BoP2Dz7sKD6+yhgg2fmWvjlqJ+mFu1SnGsfnhnat6qsaVoZBN2Af43Nw5J0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by SA1PR11MB8574.namprd11.prod.outlook.com (2603:10b6:806:3b1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Thu, 18 Apr
 2024 05:06:45 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::cea4:315b:52ce:11f2]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::cea4:315b:52ce:11f2%3]) with mapi id 15.20.7472.027; Thu, 18 Apr 2024
 05:06:45 +0000
Content-Type: multipart/alternative;
 boundary="------------wmJcvw0THGyy88aj0X71fOQm"
Message-ID: <631354ff-db80-4b39-bee3-bf63896ed4f5@intel.com>
Date: Thu, 18 Apr 2024 10:36:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe2lpg: Extend Wa_14020338487
To: Matt Roper <matthew.d.roper@intel.com>, Gustavo Sousa
 <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.de.marchi@gmail.com>
References: <20240417212501.312346-1-gustavo.sousa@intel.com>
 <171339034765.54602.16408540374552896913@gjsousa-mobl2>
 <20240417222747.GN6571@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
In-Reply-To: <20240417222747.GN6571@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: PN2PR01CA0019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::24) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|SA1PR11MB8574:EE_
X-MS-Office365-Filtering-Correlation-Id: 23aa002d-27a6-4303-842a-08dc5f6557e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0oxs4+/SNQsQsWRidLf7Va1sUJWZ8t+Ntxnl6EQC0LyFvwiyWV8DnNyi8k6AmzoGB8qpSc81IGEtVi0TKS8YgFkhtowrP8PHBHmTgm2KwZNR1AMXiZFcAIcZxYNwZRVtVTo4H74JjYeYWf64ZWzNJXba7fxVJnIEQQxHi9JNdVGcQ1Eru12sNL7iJx99u+jBNcOM0SNFQF60HhPQr7L74lywn/9AbpdpCh/s0B3itfE436+rwUVN7201/NmQ2ZbhBbmsE32WWFNfQminBFu2OtCKCvRt3pX4SydiH5Dxj9rz+kic9lc0JCOUKi1qsCejcsKLpAVAhc94Zkz+07aGICBu10AOz8zRPeLufcAT+3PVHiDXP4d84STIF9denekGOeSxL7bDWZy+CXrHxqtbq7xmy4tNE5EY3JPMCTIHqLiA1ddN0HeGStYy/Xrz7BdxgH48UuVDREHvyebMLU8G8inF66/hLzP/5PUNfXEzc4x6thOtyeZeXZzBUNQWqurM9n2+YaqYkKeaF8Hr09TKOOGGTQkFaNe0SWKWF9ASqF1rtqrcqq3NpS0onFwkmQToSti2oOWPqj+OM3gVsrQ3N/4rbxbPD0XB7gILSst9u9qg3ZQZKFLdcC44BJfhnUUZrmIeUxYunol1NnGgoPZIL+eZZ/Sz6NegMh/xXCQ3FjI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjQzcFdOVHBTWEZWTjdvNkhPWEJ0cVVibjNTNEhqTldBRUdWMytuMCtEdmhq?=
 =?utf-8?B?QnRLSDI3cGpsWXhEa3J3TUMyTGEvcnVRWjlDVTJEcmRPSnZmSis2cXYrTlhu?=
 =?utf-8?B?U2crR1M0VkYxOWZ3RDhOVVIyU1VTK3U2VzVRNWFBREFQdUZpSGQrN2NLSlFw?=
 =?utf-8?B?SytNSlZhYmpnT0tSNG9jYTdOWUJmSE9qQWo0bm9rUjhDNVlqMEVvVExBU0VE?=
 =?utf-8?B?QU5HSWRtcUloNW9kVXpIM0Ftc0kzRHFDK1NKQkF6VDBsQzhHeC9NRVA5K3Vy?=
 =?utf-8?B?NDVPdGxuQ0tLUmpzMFIwaGpJd0NCeFBpMUNZd0Zwelhob1hybTM1MGd1OUNQ?=
 =?utf-8?B?Q1puNHRyVFRTVTN1YlByRnJCczFuNXBDZ1FrMW0xN3FwY21hS3paeThWWkZ6?=
 =?utf-8?B?SmtXWGRyckJtdERqclpQQS9yZFZkZjlBdjZYeGdkRXBpYTF5ZUwwdHhBS1lX?=
 =?utf-8?B?N3ZrZlo0Y0crcUloOXFJTW1MQjRWK2VyR2pxa1FZRFZWQlZCVUJpeW45ajla?=
 =?utf-8?B?NkR1Qm9wenRwb0NOZUFyOS9xQ3hZSWM5RnlrTHdMayttWTl5Um5oeUd0Vy9k?=
 =?utf-8?B?YU1kUndRaHRhOHRmaG5yRU41VXRZbnU1WWJvdTYxUWFLbmV3NnF3LzNnVFdN?=
 =?utf-8?B?bEJGVEhSQmdOa0dIaE9GMWJwYXZNTXBETEc3bG94a0ZqUzcvOVkwY2FmMnU4?=
 =?utf-8?B?a2dPTko4M0lMSHVSYkxEUU1idEptNkpSdm1MT3J3ZVMycXZUdWRIVW04enVL?=
 =?utf-8?B?UlVzK2ptY1QxNW1tWmlUUDk0VzIydjFvVy9wdTVzdHVuOGp4S1ZxQ2tzQk9Q?=
 =?utf-8?B?K25xQ1NITGRvb000Ykk4YUdMKzNENG4yN0YrdmFLdVBEa1NTZlQyUDlXVUw0?=
 =?utf-8?B?ZmwwRzZ5djdEb3lIR1hja09jMXlqczh5cEhtS01tZjdFbm1UZXNQQjRDMXc0?=
 =?utf-8?B?MFoyTEVvOVZ0Q2RYeHVGZllnY2IwRU1YQS9YSitFbzVRL2NwSjBYMFhCZ25Q?=
 =?utf-8?B?eVB4N01oc2NOYnZ5eUsxY25ZY2dEUGhxL3E5MXR5RTN6WkcxMVhvSXBGc2lV?=
 =?utf-8?B?TnM0WnJyRlNvZGQ5VHJxV3lQTDBraXRBeGgvRWZjaStqK0wzTlZJM3AzbE9O?=
 =?utf-8?B?VTNXS2FUdURIcWduZGowNG9RVWt6K1lkamQ2WTJGSUlwZU5ReHVJUzdFaVVO?=
 =?utf-8?B?eFJ3bUpOWTBvNWgzWUMrdWlPaHVqM0Zrb2Y0MU1BR3g0MnFmSURoYnpzOThs?=
 =?utf-8?B?ZWZWMVBKRVRPNitydXRCNEhCQWltaVVEMG5GcGplTjdjT1I0S05hZTU2dXBG?=
 =?utf-8?B?T3VqVTExZHZJUGc3NzZqcE45dGJRalpUb1hLamtBNEtSVXFUNURtTUpRVlAx?=
 =?utf-8?B?TWNudEVtN3EvZDB6NEpSQldsVTVHdjgwVGs1N2hTNWkrUUR4VjYyUnFscTZU?=
 =?utf-8?B?ZHd6NUZnZEQwdVpkQUNnZ2FJeUZCRjZwdk90SU41clRlNU9uRmdXRG5qMTRo?=
 =?utf-8?B?UUxvQjdkbGwyTmtjOHF2K25JRmJzYllvcU5tSlJEQWFoTUFsRU1HZzYzSElD?=
 =?utf-8?B?TWZ4LzFGUTRKRm81cFU4U1RBaFlick8vdWxIZnk2aSs5MUV3U0p0c2YxajdS?=
 =?utf-8?B?TFJuWnMzWVh3MUlDLzB6dFBXakhVcWY5aWlCVDRpU0NKSDA3L1ZZeTRRbVM3?=
 =?utf-8?B?YUZzV01vSHluQ05WRXJIUGhVR2lYd0RMZGtTTjRvVDJvY1E1V0N6KzYwRXNF?=
 =?utf-8?B?QkxxVkRlUzV0WFIrQklsUnhZaHRHQm9XMExwUXhnV1lYZEo3Mk12VmVRdzM4?=
 =?utf-8?B?K2Fzd0xFR2lSaUUwbDlTMDJ6akNxQWxQdFZhL0ZXZzVYZVV6UG53WHMyL09O?=
 =?utf-8?B?M1A1eUVXNmVlR0wzd3BDZzIwVVhOVWt5bzVmeDIwQjRjT1I2SGl2MHk3dXNZ?=
 =?utf-8?B?ZDdwUm5HRkFKZ1kzSHRjaE8rNXorQlNBRVAzSEtSaWRzNGhLdzAvdDQyQTFR?=
 =?utf-8?B?QnlaS04wQ0NKWnZVbEVwRHhLUlhBakpocU5yMHg3ZUEwbC9lMUhkNFBoR0Zj?=
 =?utf-8?B?WnFNUTYwZURURUFtMzY2ejVHdENLWmh2YU5mdDJ4eENBTlVmVVhweC9sdU9X?=
 =?utf-8?B?S0wwMjVhTnowZ1lTNkd0UDcweVRGQUsvck9rQTFJYmFMM25qTjR5aUF2dk9X?=
 =?utf-8?B?Tnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23aa002d-27a6-4303-842a-08dc5f6557e8
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 05:06:45.3639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nRqOw1kaXGyvI06mSjE9dhebqySJqcrsKFxeegS6x4eXL4b1gzZUdcjrn089+qE2tNJ/8z3JFpUDptW57Le0NmiVx6rMebJn0r5Fob3ASU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8574
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

--------------wmJcvw0THGyy88aj0X71fOQm
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 4/18/2024 03:57, Matt Roper wrote:
> On Wed, Apr 17, 2024 at 06:45:47PM -0300, Gustavo Sousa wrote:
>> Quoting Gustavo Sousa (2024-04-17 18:25:01-03:00)
>>> Wa_14020338487 also applies to Xe2_LPG. Replicate the existing entry to
>>> one specific for Xe2_LPG.
>> I would also like to take this as an opportunity to discuss the way we
>> are currently arranging the RTP entries for the workaround. Using this
>> one as example, created a copy of the entry and edited the argument of
>> GRAPHICS_VERSION() to match Xe2_LPG. There are multiple cases already
>> following the same pattern, mainly because we are grouping entries by
>> IP release.
>>
>> Do we want to continue following that pattern and keep the code
>> duplication? Or should we think of a way to avoid code duplication here?
>>
>> A very simple approach that I think of is having a single entry for each
>> lineage. But I guess that's not really feasible today because I guess we
>> do not have a way of expressing logical disjunction in XE_RTP_RULES().
> Yeah, there are basically two options here:
>   - Keep them separate for now and combine some of them down the road
>     once we're sure no additional SKUs or refresh platforms are going to
>     show up with versions 20.02 and 20.03
>   - Combine them as "general Xe2" workarounds now with a version range of
>     20.01 - 20.04, and then split them back appart in the future if/when
>     some new SKU/platform that doesn't need the workaround shows up to
>     take the currently unused version numbers.
>
> I think we've been going with the first approach because during early
> enablement of the platform it makes it slightly easier to quickly
> compare the driver's workaround list against the workaround database's
> list for a specific platform.  But we can also get a runtime list (i.e.,
> what's _actually_ applied) from debugfs, so maybe that's not very
> important.
>
> As long as we do it consistently and put in a comment warning about
> future changes, I don't see a problem with grouping some of these shared
> workarounds into a new "All Xe2" category with the understanding that
> some of them may need to be separated back out into individual entries
> if/when 20.02 or 20.03 platforms show up in the future.
But would this really solve the current problem we're talking about? 
When the new platforms arrive, we'll be again segregating them based off 
their IP versions and then again combine them as we're talking right now 
{under a range 20.01 to 20.04 (assuming 20.02 and 20.03 doesn't show 
up)}. This would result in redundant work, implementing the w/a and then 
later on, grouping it again under the list of platforms currently at our 
disposal. Instead, can we brainstorm on something within XE_RTP_RULES, 
so that, at least for the same IP version, we can group all of the 
workarounds available? Based off of what Gustavo said, about having to 
change the IP version to match Xe2_LPG, I see a couple (maybe more) of 
workarounds, which have the same IP, same ENGINE_CLASS and yet having 
multiple entries.
An example:

/* Xe2_LPM */{ XE_RTP_NAME("14017421178"), 
XE_RTP_RULES(MEDIA_VERSION(2000), ENGINE_CLASS(VIDEO_DECODE)), 
XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)), 
XE_RTP_ENTRY_FLAG(FOREACH_ENGINE), }, { XE_RTP_NAME("16021867713"), 
XE_RTP_RULES(MEDIA_VERSION(2000), ENGINE_CLASS(VIDEO_DECODE)), 
XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)), 
XE_RTP_ENTRY_FLAG(FOREACH_ENGINE), }, { XE_RTP_NAME("14019449301"), 
XE_RTP_RULES(MEDIA_VERSION(2000), ENGINE_CLASS(VIDEO_DECODE)), 
XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F08(0), CG3DDISHRS_CLKGATE_DIS)), 
XE_RTP_ENTRY_FLAG(FOREACH_ENGINE), },

By the way, while we're at it, can someone explain me the use of XE_RTP_ENTRY_FLAG(FOREACH_ENGINE)?

/shekhar/

>
>
> Matt
>
>> --
>> Gustavo Sousa
>>
>>> Signed-off-by: Gustavo Sousa<gustavo.sousa@intel.com>
>>> ---
>>> drivers/gpu/drm/xe/xe_wa.c | 4 ++++
>>> 1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>>> index 632bd9066f8d..dcf7ed51757c 100644
>>> --- a/drivers/gpu/drm/xe/xe_wa.c
>>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>>> @@ -445,6 +445,10 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>>>                         FUNC(xe_rtp_match_first_render_or_compute)),
>>>            XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN5, DISABLE_SAMPLE_G_PERFORMANCE))
>>>          },
>>> +        { XE_RTP_NAME("14020338487"),
>>> +          XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
>>> +          XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
>>> +        },
>>>          { XE_RTP_NAME("16021540221"),
>>>            XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
>>>                         FUNC(xe_rtp_match_first_render_or_compute)),
>>> -- 
>>> 2.44.0
>>>
-- 
-shekhar

--------------wmJcvw0THGyy88aj0X71fOQm
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/18/2024 03:57, Matt Roper wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240417222747.GN6571@mdroper-desk1.amr.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">On Wed, Apr 17, 2024 at 06:45:47PM -0300, Gustavo Sousa wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Quoting Gustavo Sousa (2024-04-17 18:25:01-03:00)
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Wa_14020338487 also applies to Xe2_LPG. Replicate the existing entry to
one specific for Xe2_LPG.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
I would also like to take this as an opportunity to discuss the way we
are currently arranging the RTP entries for the workaround. Using this
one as example, created a copy of the entry and edited the argument of
GRAPHICS_VERSION() to match Xe2_LPG. There are multiple cases already
following the same pattern, mainly because we are grouping entries by
IP release.

Do we want to continue following that pattern and keep the code
duplication? Or should we think of a way to avoid code duplication here?

A very simple approach that I think of is having a single entry for each
lineage. But I guess that's not really feasible today because I guess we
do not have a way of expressing logical disjunction in XE_RTP_RULES().
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yeah, there are basically two options here:
 - Keep them separate for now and combine some of them down the road
   once we're sure no additional SKUs or refresh platforms are going to
   show up with versions 20.02 and 20.03
 - Combine them as &quot;general Xe2&quot; workarounds now with a version range of
   20.01 - 20.04, and then split them back appart in the future if/when
   some new SKU/platform that doesn't need the workaround shows up to
   take the currently unused version numbers.

I think we've been going with the first approach because during early
enablement of the platform it makes it slightly easier to quickly
compare the driver's workaround list against the workaround database's
list for a specific platform.  But we can also get a runtime list (i.e.,
what's _actually_ applied) from debugfs, so maybe that's not very
important.

As long as we do it consistently and put in a comment warning about
future changes, I don't see a problem with grouping some of these shared
workarounds into a new &quot;All Xe2&quot; category with the understanding that
some of them may need to be separated back out into individual entries
if/when 20.02 or 20.03 platforms show up in the future.</pre>
    </blockquote>
    But would this really solve the current problem we're talking about?
    When the new platforms arrive, we'll be again segregating them based
    off their IP versions and then again combine them as we're talking
    right now {under a range 20.01 to 20.04 (assuming 20.02 and 20.03
    doesn't show up)}. This would result in redundant work, implementing
    the w/a and then later on, grouping it again under the list of
    platforms currently at our disposal. Instead, can we brainstorm on
    something within XE_RTP_RULES, so that, at least for the same IP
    version, we can group all of the workarounds available? Based off of
    what Gustavo said, about having to change the IP version to match
    Xe2_LPG, I see a couple (maybe more) of workarounds, which have the
    same IP, same ENGINE_CLASS and yet having multiple entries. <br>
    An example: <br>
    <pre class="code highlight" lang="c"><font face="Courier New, Courier, monospace"><span><span class="">	</span><font size="2"><span class="hljs-comment">/* Xe2_LPM */</span><span class=""></span></font></span><font size="2">
<span><span class=""></span></span>
<span><span class="">	{ XE_RTP_NAME</span><span class="">(</span><span class="hljs-string">&quot;14017421178&quot;</span><span class="">)</span><span class="">,</span></span>
<span><span class="">	  XE_RTP_RULES</span><span class="">(MEDIA_VERSION</span><span class="">(</span><span class="hljs-number">2000</span><span class="">)</span><span class="">,</span></span>
<span><span class="">		       ENGINE_CLASS</span><span class="">(VIDEO_DECODE)</span><span class="">)</span><span class="">,</span></span>
<span><span class="">	  XE_RTP_ACTIONS</span><span class="">(SET</span><span class="">(VDBOX_CGCTL3F10</span><span class="">(</span><span class="hljs-number">0</span><span class="">)</span><span class="">, IECPUNIT_CLKGATE_DIS)</span><span class="">)</span><span class="">,</span></span>
<span><span class="">	  XE_RTP_ENTRY_FLAG</span><span class="">(FOREACH_ENGINE)</span><span class="">,</span></span>
<span><span class="">	},</span></span>
<span><span class="">	{ XE_RTP_NAME</span><span class="">(</span><span class="hljs-string">&quot;16021867713&quot;</span><span class="">)</span><span class="">,</span></span>
<span><span class="">	  XE_RTP_RULES</span><span class="">(MEDIA_VERSION</span><span class="">(</span><span class="hljs-number">2000</span><span class="">)</span><span class="">,</span></span>
<span><span class="">		       ENGINE_CLASS</span><span class="">(VIDEO_DECODE)</span><span class="">)</span><span class="">,</span></span>
<span><span class="">	  XE_RTP_ACTIONS</span><span class="">(SET</span><span class="">(VDBOX_CGCTL3F1C</span><span class="">(</span><span class="hljs-number">0</span><span class="">)</span><span class="">, MFXPIPE_CLKGATE_DIS)</span><span class="">)</span><span class="">,</span></span>
<span><span class="">	  XE_RTP_ENTRY_FLAG</span><span class="">(FOREACH_ENGINE)</span><span class="">,</span></span>
<span><span class="">	},</span></span>
<span><span class="">	{ XE_RTP_NAME</span><span class="">(</span><span class="hljs-string">&quot;14019449301&quot;</span><span class="">)</span><span class="">,</span></span>
<span><span class="">	  XE_RTP_RULES</span><span class="">(MEDIA_VERSION</span><span class="">(</span><span class="hljs-number">2000</span><span class="">)</span><span class="">, ENGINE_CLASS</span><span class="">(VIDEO_DECODE)</span><span class="">)</span><span class="">,</span></span>
<span><span class="">	  XE_RTP_ACTIONS</span><span class="">(SET</span><span class="">(VDBOX_CGCTL3F08</span><span class="">(</span><span class="hljs-number">0</span><span class="">)</span><span class="">, CG3DDISHRS_CLKGATE_DIS)</span><span class="">)</span><span class="">,</span></span>
<span><span class="">	  XE_RTP_ENTRY_FLAG</span><span class="">(FOREACH_ENGINE)</span><span class="">,</span></span>
<span><span class="">	},</span></span></font></font>

By the way, while we're at it, can someone explain me the use of XE_RTP_ENTRY_FLAG(FOREACH_ENGINE)?

<i>shekhar</i>
</pre>
    <blockquote type="cite" cite="mid:20240417222747.GN6571@mdroper-desk1.amr.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">


Matt

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
--
Gustavo Sousa

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Signed-off-by: Gustavo Sousa <a class="moz-txt-link-rfc2396E" href="mailto:gustavo.sousa@intel.com">&lt;gustavo.sousa@intel.com&gt;</a>
---
drivers/gpu/drm/xe/xe_wa.c | 4 ++++
1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 632bd9066f8d..dcf7ed51757c 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -445,6 +445,10 @@ static const struct xe_rtp_entry_sr engine_was[] = {
                       FUNC(xe_rtp_match_first_render_or_compute)),
          XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN5, DISABLE_SAMPLE_G_PERFORMANCE))
        },
+        { XE_RTP_NAME(&quot;14020338487&quot;),
+          XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
+          XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
+        },
        { XE_RTP_NAME(&quot;16021540221&quot;),
          XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
                       FUNC(xe_rtp_match_first_render_or_compute)),
-- 
2.44.0

</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
-shekhar</pre>
  </body>
</html>

--------------wmJcvw0THGyy88aj0X71fOQm--
