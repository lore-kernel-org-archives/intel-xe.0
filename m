Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792A4FB5178
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 23:45:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF3089C69;
	Mon,  6 Apr 2026 23:45:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RkJw5j96";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C2B10E306
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 23:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775519115; x=1807055115;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RGvREJzDEWlN7otZczr9H1WNj/m0445tbk9GG72Hva8=;
 b=RkJw5j96jByFTiLfHat/rD1PiTKF6T65+xy52R1b2TDN0505EyeAZK5K
 Qacj/ZWRAxN0dU23/sLd90wGJGkkjWATXaz4PUv18XvrFmeo2Lhc6OU2g
 +3hqmcjiGwOKuWWoliJSVOIw0y9+dFXqvgBnGx0Na5Nhalp1kILcyiG5T
 a9upMlgzhLXUiGO/YGFV7wDTE+ZXw4StseX44I6JYu630RawQ2WPiutyl
 6xGpmEUzfUwK2dgwa3rG0wFfL43IXD1MSNJrAbD7OsgPHvIwAHlD5pKEP
 X4esdY06l8j1E2zZm8nCVhjMsz7ok9Ni4Obi47WgxZcUT6D/buvf/ylYN g==;
X-CSE-ConnectionGUID: lMfxYsS0QFacHK2f3XtuEw==
X-CSE-MsgGUID: 0X+7vm38TZaWicESfFCKRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="93862873"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="93862873"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 16:45:14 -0700
X-CSE-ConnectionGUID: EIynxr5CRvyP+Y3hwpyLWQ==
X-CSE-MsgGUID: dA0qj89VS26OIv6mi5QWjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="223707579"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 16:45:15 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 16:45:14 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 16:45:14 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.55) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 16:45:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P5VLa1qmUOUAVd98UEP/xVS7kV5tdW97ukCcwQUpJ42XFwWPrfF/Onk2Guql2q5Wl7Gom/FM20mW4NQFVV1rSjlUh1G1M8N9ZdHtCyz2kOf2GfMnt4/i/4kIK7SmZwPkQ/DSuxyP1/+RmSg1gj/JZbtiRkQg4cPZrvV+T7/zEnsbxMfNx22Dl6o17HPevLL4RGbyKrxfkdt29dCjU6s3JmarY6okiMZVt9iyK98e8lFXrsDbo+9P3XjCAzWRxXrgB1Gfxi3LSITL5ctXJTtoxuGQfM89RvMtfGwb/glOZjIoEnCJT6PLdUA7lL9qCrIUVF/ZWmNObg/gAokCp/LyOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MSRkzeu+IM7gXpRBd5VJhtFbB+HiWccHCBBV2E+z4kY=;
 b=hk1WtjLbcbMdBFwkeRXA39yoPaKRkbipMBwCOq3zYbu743wq81R60KKJLZbzvsbFQT4eHYckVlbIbdycJyFG1okHDL4Ipsc14JI3RKath6x48jsN7WRm2cLzuFhCxnTCEmkjFIXCgqa++nt9xToyC9+Y76L4gzYTBqtk0lQClMDiuF8+u8MIHlWJAH51pl15hgV+tsJTr+UXaKCbav/woFYGKUyu3nIVtAFbsa2DsEssxBf9lXEJkLgoK+AotlOqDzq5zJljNdHUQuBKWJpmNofVjqHhUsvYk3pMsZEMoEZn1E7nqyR+B5AfljFdi3xsSzekp8oxwSkIROdauF/gFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH3PPFD9C09B4A7.namprd11.prod.outlook.com (2603:10b6:518:1::d54)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Mon, 6 Apr
 2026 23:45:11 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9769.016; Mon, 6 Apr 2026
 23:45:10 +0000
Message-ID: <28d40ef8-4c2f-4fc0-97b9-0c09bcee6f3d@intel.com>
Date: Mon, 6 Apr 2026 16:45:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Add support for NPK as a GuC log target
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "John.C.Harrison@Intel.com" <John.C.Harrison@Intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>
References: <20260226232648.675128-1-stuart.summers@intel.com>
 <920e4c7b-42ad-479a-a15f-9a871e85f0d0@intel.com>
 <a31189edf73f1cc4660db61a9220ec0e0e2b86de.camel@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <a31189edf73f1cc4660db61a9220ec0e0e2b86de.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0043.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::18) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH3PPFD9C09B4A7:EE_
X-MS-Office365-Filtering-Correlation-Id: f7955b51-45c9-4121-b0ca-08de94368a9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 2loAX5G9tOdr70QIvTTR5AYzzUhIZNAqlqgkJkPm6akArsc/DhQSyBBJatejVCWXk5YLs0A2Z3fXSMSbFWhrf2Sx/0XDxAk4wXhv9NOzmqdVUIjM/cPrtD7FDNXb21RCDRxHTH6iUq2n2ZdQDgMpnf2l6vFs+lJSOuIz57mtNYZ0nMfsNa+fsJ3gGNn7mvv5fP5oSkkNs85ABPWI3pBD7g25WkS1rxK1nbkavo6YYX0MDOTtyt8b3FDk7Pu8IXdqiqPKMrDbsjOHSbqY0vHEujpucNAiFWBrRy9CUf2/6S3l33cBHy00yjerrqCkCIt967FxSNkLyUDiXTkCqrbAZ/ZTiEXMI8+722EJ4p79lg4hgQRPCal696wLkjeBQ/hdZ9DxE2ms2NHeRA2X540p0ugeOlUWYhtwobu1LIATm11cAFkwZqEh+WrV1LJVdmQ8bSOdws8TDnKYssQvXXnrGd1bUTBuaXavCdduFEuvkLoVHUGH4qcRNgQ3rh4tT3fPqCpbcjywOjmiL5VmBYwefblbLkKzsizDLgnLp3KcpW6Dz4jG3Ijn+lmjNHD2BINzuANv47+bWxvs14DU9iHKULehFCVIL75kMywR3LelEmboBdafej8VLtQE6MC7uVHsM7L1aaAfLfeNnr5pkQ9rfPJMrBW15aX0rJ8CuDzJ/ZD5PyU6m+5R+MZUcaK0BFm5s3tep6mHhjPfNdGk3RMMUSU5B4CVKPBGL1+cZvkCDi0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUJuZ3Q4WnBrV3pCUmpIdEhNRzJJUmQxT0h3WXJGTHptSEZQWlMvMEZQZjBw?=
 =?utf-8?B?NFVNcUtuQjVIQzF6OS93T2lZa1NrTUppNk1nRDFiQWJPUXVGeEVHOGQ4dWR1?=
 =?utf-8?B?Y2NBdTdmb3ZMd1FpU1NLUUE4WHNybUg2RExLaDZ3Ty9YU0NjMWhDdTBQcFpL?=
 =?utf-8?B?cHFReVhwNjltWTR2bTNoMkg0QVZ6U21udTFiVUx2enlBL0Znc1JrZjBIOUMx?=
 =?utf-8?B?aDRZL0J4QlpDcllFMXBabVh4T0tGbk1zOW12eXFNdUM5d01UOFFWY2RMdTJ2?=
 =?utf-8?B?Sm9RMW1JS3RTWDZmUEtiQjR6WHcvOTBJRkpuR1BxNXVwVDdaQTAwQVVvNy9U?=
 =?utf-8?B?YVVOQmp3bXV2ekgxeHdiTThSZmhBSjRWcVhPYVN1ME5UQ1lObWQrZGpZdUY1?=
 =?utf-8?B?cEJYdWpod0xtYjNuOXM4czlkV1U2WVVxdmpGeGgwRHdTeWlsd2srMzNlM3J5?=
 =?utf-8?B?REduL1VVUkNEaUdJUWRqNGdQM0d4N2RjS3g2YmFsNzdCd1YySjZyblhSM1hM?=
 =?utf-8?B?c1pQRlZLbUtBcytyNW5PYkYwaENwdTRWcTRwZzI5MDJyK2NVbnhEWlZlYk1D?=
 =?utf-8?B?LzBuR1hpZEF1bXNhWWpLejJVY3N2b2FmNzlzTXNJWmVwRkhrNEE5QVBDbEF3?=
 =?utf-8?B?b1NGV1ozck1VWEFxVVFuVGx0MlhjMTdpekMwMjJaK2lab2FhTStZVTdzTngz?=
 =?utf-8?B?dTUxbVpZWW44UnE4UnEzYXFYa0NwZDM0bWlkTG9XUkN0TXVZMHNqbG9UL1c2?=
 =?utf-8?B?elJzVEdlakVTUHBHdFliM2FZVy9NUkorMGVPb2xTUkkyUWI1S0djN3hadlRr?=
 =?utf-8?B?aS9kRW1ZNHVQaTRQZTlXRFRvdG9QaDVNS1VJei9JRDcrdFh3cmdsU1lMd2Vw?=
 =?utf-8?B?aGp3U3o1enFPeXpXbzBqbzRXZTNrUlZmaWh0a0hxZHQ5RUY5WlVVblpRZDJO?=
 =?utf-8?B?TXRJcjNYWGxyVUNkZ1hBNWYvekJNaG5RYTZ0cU1PVTdHTFhpNkFlYnU5NjZ0?=
 =?utf-8?B?NDh3Q0tuSXM1bnFYc081azV0OW15WldpOEgwNmM4T2sxeVFUYktrN1VhelFG?=
 =?utf-8?B?WnVLeXpLWUgzTjlyNW1PZTJIa2dzNElNeFFFR04yb2dZRWVyZXVXS0NVWkp2?=
 =?utf-8?B?UGdoeWxlSlM0RVlVNjhFT2lTa20wanBTL1NseDkwQnBJSFBNQkhjTEtSVTho?=
 =?utf-8?B?TDB2Smp0d1JZb2l3aFZzRDRrNEs2SVMycWlmRnJYb0N0RWpFMWx2Ty9LTXg4?=
 =?utf-8?B?MUtnTWp1RFVyZm90SDExYnhCNGtEWnkvT3R2ZVFacFVwWFpXYys2UWpUejZh?=
 =?utf-8?B?aWhNbktzMlFRV1R0L3VPeE9pajVLSWdXKy82TS9IWHVXZzdjMFl1MmZaaWtk?=
 =?utf-8?B?bmRNL1hqcHl6VG5PMy9JSkQycnRRUE1JOFlkK3Z3c0QvQjdHTkRZdGtmYWNZ?=
 =?utf-8?B?WFlRcys4WXNONnVxQmFPRjhCdDdTQ1U5TUJHcTVZT3l1MlhpZ01mUG1pMk82?=
 =?utf-8?B?TVZhanRpUUZFVlVqTWdWNkxVUklKODJXSHVTNldPTitjeGNwUEt3Ylo5MCtL?=
 =?utf-8?B?MWhVcjJHTHByclRsTlN2dEZVMS90ZkNBUkhWOHNxNUJpMmdjSkIybzd5aHFR?=
 =?utf-8?B?WFEwZFo4TGxNV0wwSWQ3ZG1nVFBQcjFMSlh5UXVJalVyTE54N3YvV2UyeThK?=
 =?utf-8?B?TmZlekE4eFczUnprNHhMSDV0SjdzbU90QjU5cEVNZ3orc0xqSEtQc0x1b0dW?=
 =?utf-8?B?cHlDN084TE4xSjM5Z09PbjJDTTA0d0dZK1hNYTNVcDN0dmljK3hSOXdEazhP?=
 =?utf-8?B?d0YvVFhpNG5zdlpCajYvNmVzangwVWdJQzRweXNENXJ5OTQzU08vdDZXUFcr?=
 =?utf-8?B?YitYVStRU2xBc0JxK3prNlFVYzBUWDNYR1pSVG04ZlpGNUI3bjdqNnc5SEZQ?=
 =?utf-8?B?NmdjUzcyZVFwTTJndlpTZEFEUW9YKzdBRDd1TThMUHdReExGQlRlaDNaRXJi?=
 =?utf-8?B?RW1idE1RbEE2TG1uYm1FMkJjUzZNTXJpQ2xFaGpWZ0FIVytVYjR3SHBnYm9Q?=
 =?utf-8?B?UmtWREk4VTFXUHBqUHVTZ28veUpkN1lSeEV0SXRIN1hLL0Fqa0tJRTZ0NXpj?=
 =?utf-8?B?NW5LVkJzY1gwQU9GMWk1b2VGekF2WTFrdi9lZVNaa2puTTdaUVF5S2NJekNu?=
 =?utf-8?B?dmJxNFJSZGVNTEpSZlliY2pzc2hwaEE2YldvY2hkWDRTS21KSk5SdjZ1OVRH?=
 =?utf-8?B?TWFkVW5hUmxTTXFScFdFMnhBZDVmM01XTS9lS0NQWXZqZlQ5eEtZNFJ6U2Zk?=
 =?utf-8?B?QmhGc3NTd21Ua2pPczFYNHJQcXA2Y01iaTM1bkVacitzUGg1Mkkva3hIeVh3?=
 =?utf-8?Q?5Dm3uVDCsQyZVgdM=3D?=
X-Exchange-RoutingPolicyChecked: bW5gpggJQCVZEeRPrOaK5js2cDW/HzJlgwHVHgFPcdVnAhzdav4QCeAF5MzXkHvrukKk0LbEp2KGUFcmxgP2t9n20pgomx34jzW7MPFzv7fS570bskHSZlaCOMP60OXHf2h0wdVwfOhv7I0cx/dgqYGrmU6DZS/hEkKFJlEtTsy/gP6KovOkmZoYewazA4KL+SHHPcJc8QGxcFSzspmkBCFqH1D92xfhJGl8x8e0W8aiV2QkL6YrlCdl9VyXa91vjxkOyJZgoTub8Ptly/+wY6BlR6TnIFhFTRizP4krnjKzU9y/Vd5CtE9Kzshs1zEqtDDsIYNrd4XYmHFuEiKK2A==
X-MS-Exchange-CrossTenant-Network-Message-Id: f7955b51-45c9-4121-b0ca-08de94368a9e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 23:45:10.8996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q5+HRQFPyVzgyIi1VD7mDsXo+LHCEYfueTSLCyXwik5Zqls4Pjz0rpKDCkKQPv07JPz/ePNXEImVgTZPlFxYFQaxlPe1bauY5jxmt1+7CmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFD9C09B4A7
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



On 4/6/2026 3:37 PM, Summers, Stuart wrote:
> On Mon, 2026-04-06 at 14:28 -0700, Daniele Ceraolo Spurio wrote:
>>
>> On 2/26/2026 3:26 PM, Stuart Summers wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> GuC provides the ability to gather logs through a hardware
>>> interface
>>> called NPK. For certain debugging scenarios this can be
>>> advantageous
>>> over getting logs from memory (or in addition to).
>>>
>>> Add a hook for this alternate debugging mode via a configfs. This
>>> translates into a parameter passed to GuC during load time.
>>>
>>> v2: Convert to configfs from modparam (Matt)
>>>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_configfs.c | 60
>>> ++++++++++++++++++++++++++++++++
>>>    drivers/gpu/drm/xe/xe_configfs.h |  5 +++
>>>    drivers/gpu/drm/xe/xe_defaults.h |  1 +
>>>    drivers/gpu/drm/xe/xe_guc.c      |  7 +++-
>>>    4 files changed, 72 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c
>>> b/drivers/gpu/drm/xe/xe_configfs.c
>>> index 078dee985d24..e0c21328af75 100644
>>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>>> @@ -83,6 +83,16 @@
>>>     *
>>>     * This attribute can only be set before binding to the device.
>>>     *
>>> + * GuC log target:
>>> + * -------------
>>> + *
>>> + * Set the destination for the GuC log. 0 - memory only (default),
>>> + * 1 - NPK only, 2 - memory + NPK.
>>> + *
>>> + *     # echo 2 >
>>> /sys/kernel/config/xe/0000:03:00.0/guc_log_target
>>> + *
>>> + * This attribute can only be set before binding to the device.
>>> + *
>>>     * Allowed GT types:
>>>     * -----------------
>>>     *
>>> @@ -256,6 +266,7 @@ struct xe_config_group_device {
>>>          struct config_group sriov;
>>>    
>>>          struct xe_config_device {
>>> +               u8 guc_log_target;
>>>                  u64 gt_types_allowed;
>>>                  u64 engines_allowed;
>>>                  struct wa_bb
>>> ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
>>> @@ -277,6 +288,7 @@ struct xe_config_group_device {
>>>    };
>>>    
>>>    static const struct xe_config_device device_defaults = {
>>> +       .guc_log_target = XE_DEFAULT_GUC_LOG_TARGET,
>>>          .gt_types_allowed = U64_MAX,
>>>          .engines_allowed = U64_MAX,
>>>          .survivability_mode = false,
>>> @@ -357,6 +369,37 @@ static bool is_bound(struct
>>> xe_config_group_device *dev)
>>>          return ret;
>>>    }
>>>    
>>> +static ssize_t guc_log_target_show(struct config_item *item, char
>>> *page)
>>> +{
>>> +       struct xe_config_device *dev = to_xe_config_device(item);
>>> +
>>> +       return sprintf(page, "%d\n", dev->guc_log_target);
>>> +}
>>> +
>>> +static ssize_t guc_log_target_store(struct config_item *item,
>>> const char *page, size_t len)
>>> +{
>>> +       struct xe_config_group_device *dev =
>>> to_xe_config_group_device(item);
>>> +       u8 guc_log_target;
>>> +       int ret;
>>> +
>>> +       ret = kstrtou8(page, 0, &guc_log_target);
>>> +       if (ret)
>>> +               return ret;
>>> +
>>> +#define GUC_LOG_TARGET_MAX     2
>> IMO better to define this with XE_DEFAULT_GUC_LOG_TARGET. Maybe also
>> add
>> a comment to explain that the modes are set directly by the user and
>> therefore we don't need individual defines.
> Hm.. it feels weird to add the max define in the defaults header which
> is one reason I kept that here. I could put both of them in
> xe_configfs.h or xe_guc_log_types.h?

Not sure why but I thought XE_DEFAULT_GUC_LOG_TARGET was in one of the 
GuC ABI files. We usually try to keep all the defines related to the GuC 
interface in one of the abi files (in this case it would be 
abi/guc_log_abi.h). Might be worth defining all 3 modes in that file and 
having something like:

in guc_log_abi.h:

enum guc_log_target {
     GUC_LOG_TARGET_MEM = 0,
     GUC_LOG_TARGET_NPK,
     GUC_LOG_TARGET_MEM_AND_NPK,
}

in the configfs files:

#define XE_DEFAULT_GUC_LOG_TARGET    GUC_LOG_TARGET_MEM
#define GUC_LOG_TARGET_MAX    GUC_LOG_TARGET_MEM_AND_NPK

Although this might be overkill, so I won't block the current approach.

Daniele

>
> Comment you suggested makes sense. I'll add that in the next rev.
>
>>> +       if (guc_log_target > GUC_LOG_TARGET_MAX)
>>> +               return -EINVAL;
>>> +#undef GUC_LOG_TARGET_MAX
>>> +
>>> +       guard(mutex)(&dev->lock);
>>> +       if (is_bound(dev))
>>> +               return -EBUSY;
>>> +
>>> +       dev->config.guc_log_target = guc_log_target;
>>> +
>>> +       return len;
>>> +}
>>> +
>>>    static ssize_t survivability_mode_show(struct config_item *item,
>>> char *page)
>>>    {
>>>          struct xe_config_device *dev = to_xe_config_device(item);
>>> @@ -814,6 +857,7 @@ CONFIGFS_ATTR(, ctx_restore_mid_bb);
>>>    CONFIGFS_ATTR(, ctx_restore_post_bb);
>>>    CONFIGFS_ATTR(, enable_psmi);
>>>    CONFIGFS_ATTR(, engines_allowed);
>>> +CONFIGFS_ATTR(, guc_log_target);
>> This should go after gt_types if we want to keep the alphabetical
>> order.
> Makes sense.
>
>>>    CONFIGFS_ATTR(, gt_types_allowed);
>>>    CONFIGFS_ATTR(, survivability_mode);
>>>    
>>> @@ -822,6 +866,7 @@ static struct configfs_attribute
>>> *xe_config_device_attrs[] = {
>>>          &attr_ctx_restore_post_bb,
>>>          &attr_enable_psmi,
>>>          &attr_engines_allowed,
>>> +       &attr_guc_log_target,
>> here as well
>>
>>>          &attr_gt_types_allowed,
>>>          &attr_survivability_mode,
>>>          NULL,
>>> @@ -1094,6 +1139,7 @@ static void dump_custom_dev_config(struct
>>> pci_dev *pdev,
>>>                                   dev->config.attr_); \
>>>          } while (0)
>>>    
>>> +       PRI_CUSTOM_ATTR("%d", guc_log_target);
>>>          PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
>>>          PRI_CUSTOM_ATTR("%llx", engines_allowed);
>>>          PRI_CUSTOM_ATTR("%d", enable_psmi);
>>> @@ -1146,6 +1192,20 @@ bool
>>> xe_configfs_get_survivability_mode(struct pci_dev *pdev)
>>>          return mode;
>>>    }
>>>    
>>> +u8 xe_configfs_get_guc_log_target(struct pci_dev *pdev)
>> This function needs documentation
> Ok.
>
>>> +{
>>> +       struct xe_config_group_device *dev =
>>> find_xe_config_group_device(pdev);
>>> +       u8 target;
>>> +
>>> +       if (!dev)
>>> +               return device_defaults.guc_log_target;
>>> +
>>> +       target = dev->config.guc_log_target;
>>> +       config_group_put(&dev->group);
>>> +
>>> +       return target;
>>> +}
>>> +
>>>    static u64 get_gt_types_allowed(struct pci_dev *pdev)
>>>    {
>>>          struct xe_config_group_device *dev =
>>> find_xe_config_group_device(pdev);
>>> diff --git a/drivers/gpu/drm/xe/xe_configfs.h
>>> b/drivers/gpu/drm/xe/xe_configfs.h
>>> index 07d62bf0c152..fb5cb7c57e75 100644
>>> --- a/drivers/gpu/drm/xe/xe_configfs.h
>>> +++ b/drivers/gpu/drm/xe/xe_configfs.h
>>> @@ -19,6 +19,7 @@ int xe_configfs_init(void);
>>>    void xe_configfs_exit(void);
>>>    void xe_configfs_check_device(struct pci_dev *pdev);
>>>    bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
>>> +u8 xe_configfs_get_guc_log_target(struct pci_dev *pdev);
>>>    bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
>>>    bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
>>>    u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
>>> @@ -38,6 +39,10 @@ static inline int xe_configfs_init(void) {
>>> return 0; }
>>>    static inline void xe_configfs_exit(void) { }
>>>    static inline void xe_configfs_check_device(struct pci_dev *pdev)
>>> { }
>>>    static inline bool xe_configfs_get_survivability_mode(struct
>>> pci_dev *pdev) { return false; }
>>> +static inline u8 xe_configfs_get_guc_log_target(struct pci_dev
>>> *pdev)
>>> +{
>>> +       return XE_DEFAULT_GUC_LOG_TARGET;
>>> +}
>>>    static inline bool xe_configfs_primary_gt_allowed(struct pci_dev
>>> *pdev) { return true; }
>>>    static inline bool xe_configfs_media_gt_allowed(struct pci_dev
>>> *pdev) { return true; }
>>>    static inline u64 xe_configfs_get_engines_allowed(struct pci_dev
>>> *pdev) { return U64_MAX; }
>>> diff --git a/drivers/gpu/drm/xe/xe_defaults.h
>>> b/drivers/gpu/drm/xe/xe_defaults.h
>>> index c8ae1d5f3d60..fbe670668a04 100644
>>> --- a/drivers/gpu/drm/xe/xe_defaults.h
>>> +++ b/drivers/gpu/drm/xe/xe_defaults.h
>>> @@ -12,6 +12,7 @@
>>>    #else
>>>    #define XE_DEFAULT_GUC_LOG_LEVEL              1
>>>    #endif
>>> +#define XE_DEFAULT_GUC_LOG_TARGET              0
>>>    
>>>    #define
>>> XE_DEFAULT_PROBE_DISPLAY              IS_ENABLED(CONFIG_DRM_XE_DISP
>>> LAY)
>>>    #define XE_DEFAULT_VRAM_BAR_SIZE              0
>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c
>>> b/drivers/gpu/drm/xe/xe_guc.c
>>> index 54d2fc780127..d98d5d051f1b 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>> @@ -73,13 +73,18 @@ static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
>>>    
>>>    static u32 guc_ctl_debug_flags(struct xe_guc *guc)
>>>    {
>>> +       struct pci_dev *pdev = to_pci_dev(guc_to_xe(guc)->drm.dev);
>>>          u32 level = xe_guc_log_get_level(&guc->log);
>>>          u32 flags = 0;
>>>    
>>>          if (!GUC_LOG_LEVEL_IS_VERBOSE(level))
>>>                  flags |= GUC_LOG_DISABLED;
>>>          else
>>> -               flags |= FIELD_PREP(GUC_LOG_VERBOSITY,
>>> GUC_LOG_LEVEL_TO_VERBOSITY(level));
>>> +               flags |= FIELD_PREP(GUC_LOG_VERBOSITY,
>>> +
>>> GUC_LOG_LEVEL_TO_VERBOSITY(level));
>>> +
>>> +       flags |= FIELD_PREP(GUC_LOG_DESTINATION,
>>> +                           xe_configfs_get_guc_log_target(pdev));
>> nit: Should this be part of the else case above? the specs don't say
>> that it is an error to set this with the logs disabled but it does
>> seem
>> weird to do so. not a blocker, so I'm ok it you want to keep it here.
> Yeah makes sense to me and I agree with your reasoning. I'll make the
> change and repost.
>
> Thanks!
> Stuart
>
>> Daniele
>>
>>>    
>>>          return flags;
>>>    }

