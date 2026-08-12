Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC41C5AD5A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 19:45:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CBF710E44B;
	Wed, 12 Aug 2026 19:45:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZFijQJWv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F60010E44B
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786563949; x=1818099949;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MkAYik4J+8otFUtW/n3m1WnWNxFPPK3GszLzeI9TrQs=;
 b=ZFijQJWvzDWvb2blAt1tNdJegdpRC4+/kvyViWf5VbfZ8KBoPI82oLqp
 UHFY3DLvZ+eDDpUzjCGHgN7h0KTctBcy3XL8/YM0LwwpySER3P1laN3mi
 StDMzsLg4fKhIeWtbhVmqI5MyM7FgtaF/+YWuIdse2F7tVvoUrZmYsJt3
 RV4uGpSK6ox9mSCmr8ExUIyHhRIXjD7JmDVx1Tla8URCiu4zPTevDUNZs
 ejnBnv4+dX1HxHWddfGwD/miDm/3/ud7tbWWrxCPl7OPAu+5s7eK+OXMJ
 aQJjnI+NFaXkize3RALpTWXBOiAi769drxGOcChl4pp7tbp1458qt+94H Q==;
X-CSE-ConnectionGUID: saDi9RIzSCOzCCnH+9esWQ==
X-CSE-MsgGUID: 53XkglPGQQKMfUUzBut/yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="109918771"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="109918771"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:45:49 -0700
X-CSE-ConnectionGUID: Jn63heIqQ8KBjj6sZqXP+Q==
X-CSE-MsgGUID: PuMVIxrGQmezR1ci/gLDhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="263269387"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:45:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 12:45:48 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 12:45:48 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.1) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 12:45:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FjqgGthrTPrYNo/l0zm25pbOFK7JzADFVie1g/4Of2sZlaWCgSryaO44dpZJiKZA1E+kjbvoNTIhLlqQ6gw/2ED5YRstx4MW68n+2zNWQCyUImOqRtywL+/oc8BvPvjEuIDtnnwo7h9Sc72orrr0YUz4cNMdkfi19H0M1gJutKXQgyFOCMwiTP1/kbP5zsay66Ztwk5b97sspM+9t857VOvQ7OHwBwkvLoEJGsmKrOuYNpPfVEsKuqpBTbUl1inmLxPFg2Td0wAD1CGvOD2M4L02o8AltrUEtCG6C+evpn7SaQOio8fQPVuejYLzi1IXojDOzBzvPKqr+7LMTDytFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3T5EmeZ/p/BH+mcGun777kP3SEFexQJgUMnMQefgXzc=;
 b=gfWRmuh1ahQWlOag/AlGLjlW68bUEnk29L8BqV20d+YlgmWLRlJyVUUdM6hCuGSynhEKjpGRkc2bamVegrtgCusambgymbtDolK2UXlfuu1Tdv2iFp13JrMa2lVjxdJ6dnty7znF3/XOlSXjOQGOlngJi/p5+aUT8e1DTJXO7WOfEiIoYdjVCV+oxqHiuj+UldcuUJrPQyMQVNmhAMDdBMZ/hrNG93+yieG5y6njTS3GRS+6xt9WQIhJ+Won09sFcBbm9VA02rgDpbN46rxqDgOTGGhkwzGhHwalescQ+BR1Ck/740YCCy2B3mX8WnPO7oHx74XXPZOiEhMPU91gGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS3PR11MB9647.namprd11.prod.outlook.com (2603:10b6:8:38e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Wed, 12 Aug
 2026 19:45:45 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0315.011; Wed, 12 Aug 2026
 19:45:45 +0000
Message-ID: <1ffbb6ac-dfba-4873-8a47-76a5b6e66bb8@intel.com>
Date: Wed, 12 Aug 2026 21:45:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/xe/pcode: Report pcode errors using SIGID
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <riana.tauro@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <mallesh.koujalagi@intel.com>
References: <20260811235254.153783-6-umesh.nerlige.ramappa@intel.com>
 <20260811235254.153783-9-umesh.nerlige.ramappa@intel.com>
 <a0ba4234-5767-4c63-a0e8-1d05540faf99@intel.com>
 <any2bd4cNnfwj0O5@soc-5CG1426VCC.clients.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <any2bd4cNnfwj0O5@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1PEPF00005B92.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::63a) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS3PR11MB9647:EE_
X-MS-Office365-Filtering-Correlation-Id: a0de0b48-fa53-4d5a-adbd-08def8aa4ca4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|4143699003|56012099006|11063799006|10067099003|18002099003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info: CYDU82ul4P46cm1S4xPHQqv83LtdllPyv2+W7/oXGY3tt1Ac0G/Ur0bWb35SDKVtOJwnZqtBZV1PawX6RlpyBl99xeye83jMvLEd/9qEFV2USQ69L92NQ7VEVWLwdJT+7EM79DMCfuWs8DuXU/t8CW15atEO4sAQKQqGuDmakU1BTFWCPS4UdPThxVy4Z1JisQN+Gh1XwSXwGN/yfzNAir9psgwofrjvOxJYmY3QFZq9X0/5e36zA+du9JMf597/gggXZ8F3uzFJ6zPKQwLW/+kR/yhzxtXL804nmHhsOkUcTsMkJVosSxECy9c1/I/pYTrbYA63fCQBw6Ewf3FBbUpXAgVrb5FS79eVpyYbMFGHZJv/ebdhWuoJP4G0Ye/QqEwlHVbpalj40iRkhpk+sN5K5h+dM9t1Ci9CoywkPmV7ynVRp1TC4uzFRmJmbyTCNhfxr+goKk87hSisKXir55OPDlvZ/utfPBxH/qtrV3mFbPyB39hav6zhaoPCMZGu69/lZkesTOd4e0h5vYV4Zv9Bup2J3fMv6F5v3vqDH93UzJHsxBJyEBjFJ0KDPnwmghLJyLvxc4LeehHu1IStEgpsc/jOa/Oej53odl72UQo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(4143699003)(56012099006)(11063799006)(10067099003)(18002099003)(6133799003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjNpY05xK25ndmprUFE1ZmNiK1hrTzQ1TkRMSGhnWXBQVDJIeXZhVFlnUk5G?=
 =?utf-8?B?bHNtalVQUmlDVlhCT1g3VWdqS0Ntdm9vUDVwMzFuTTJjWUM1bXh6Zms0NjFS?=
 =?utf-8?B?VWVtb3ZiTjQzM0RlOWNpYlpKd3BHemwyL1Y5UGg3cDlpdnUyT3AyNjVIYlEz?=
 =?utf-8?B?eUJUTER5c3BFSkJlV0xiejQ5emFRVXI1b1F5ZTQ2RVBWcDNOcWl5WjAvQnAv?=
 =?utf-8?B?ZUZzbGxROFVPb25IV1BVTmZXdzFDdXNtV1VISFk3MnVFbVdtRTh1VnlKZ0p2?=
 =?utf-8?B?c1M3Y1RaSE5vUVFxdnBZOTEydHFQSlh3SUp1VHIrdFFkYmduR3phdzZ3b1RS?=
 =?utf-8?B?d2NmdFQxQmxZSlZiZ29YNVhlU091RFZMVGZsVUlxRTRCNnN5UTVmRnBiTHlS?=
 =?utf-8?B?Sm0xTVRobThpZ2NzaEplUGozS1dBK29ocXh1Z256cDFHYUYwNDJxM3YyMDNr?=
 =?utf-8?B?SkpUdCtJOVczdG5TZldVUFN4Q0xDbU8vOExrOHJmUnhUdk1veUYrU2ZwTDh5?=
 =?utf-8?B?NlBwc3ZRQXBCR3BYNkNJZmF5QWozT0lHQVRMb2tmWGVYMmtMc0t5VE1xY1RV?=
 =?utf-8?B?QkdTOVk3ZzEzSUpWcitUWFhwSTZobWczZlhmYXRtOEJHU2hlak94VGU0UGpQ?=
 =?utf-8?B?cUJWUWRvQzdtODlTcmtzcTBSYUxaaGlFNVBoZkdEUXF6eU5XL3pEUDQwclh2?=
 =?utf-8?B?OFdQOFBHckFxZDVlSjNJRnN6NXFZS05PWHNnQTFYVU51SWxPWWpyT2VSVWI4?=
 =?utf-8?B?cFVDVEFRS3JIaUZoQXpHd0Z1d0wwRncvdENjdmVtNitkcEFReTFmcDFjRUtT?=
 =?utf-8?B?dU1hc29LUExVajJCZFZSbGw1NGpiZk1ZaHFqOUNJb1UyUGYydlVRNmlzOWlM?=
 =?utf-8?B?R2Mzd0hMNVo2d3ZIa3Y1VXhGRnNqbjVZams2Snl2SHd5dUNvUElPN0JnVk9y?=
 =?utf-8?B?Qk10cUdibkpmRjd2NWxSNkxqbGg0UTZyalQzbCtPdEgrcWMxbi9wUDBhYTV4?=
 =?utf-8?B?SFFYaGVYc20xSjEwWld6NTYzRW10bUMwV1djMU5BbGZFMDdFbEtHTGZSNTF3?=
 =?utf-8?B?SGJnK1phdmlYNmZTWUExaWxSaG9ScHZYMWowUDhUVThoaTVTdWVGR1FUWGxK?=
 =?utf-8?B?MHRobnhHVjZOZHZneTZXeFNIU0t3THlOK2FadHJSaEJqT1pXeU1vWVkzZlo1?=
 =?utf-8?B?d0J5RmhmRmhEd2ZmY1lHV0ZhRlh4MmlaSWVPTEFadGVEMU43WEpoS3ZOMW01?=
 =?utf-8?B?ZVJWTS9mV3c2RHhuSHhERW56aGw3MjJiaEF0NUtsbFEzSDNCWUttTWpXK1cv?=
 =?utf-8?B?MmFsOG1oeHEvcjBXZWd0dE9XYnRnV21WSlJhV1NhYktrUjU2ZTlYTlZuZlF4?=
 =?utf-8?B?YUxxTVE4TDU0Q3YrL1BxMitIaWJaK1lNYlh1ekcvNkpuLzhuSW1MQVkrakll?=
 =?utf-8?B?cU0xV2IyVEdDUzB3NC9WWFBIK3dJQmIrMWFleUIyTTJNSGdaQ2M5S3R5QkFx?=
 =?utf-8?B?czFDbXJETVpNL2JTSmFoeHVmb2xJdXcrcmcya0dlUXY0L2FuSHhYVVMvNlQr?=
 =?utf-8?B?aHVkZ3ViMmNKVXRDUE01NVV3V3JmdElpOU5CYmhPdEVFeUlOWU04a1ZQeXlK?=
 =?utf-8?B?YXdBdUU5S1pKbEY3VjJoTktMVG9VM0RtY3dsaVVGTThDSDFGR3pCcHM2dnhO?=
 =?utf-8?B?Y2VBeUtibFROakhxVGtwK01ZY1RTcDNhbStEQ1dRMm9valZTVmVQcCs3WUly?=
 =?utf-8?B?aWhMSkR0UUg4RFhERWtOcWlZOUw3YWF5ZXVGdEFyblVCL00yYldUNmhLdWI1?=
 =?utf-8?B?ZzF4aE5tOWs1Y0R0NXhpRmlvMGZzdXFhcmZNSitKNlB4YU9MZmdQTmg1RGo0?=
 =?utf-8?B?ZXlQZUYyZXAydXBZSlVhSWk0M1BaSWRkbGU0RUdpbWc1RVdVdDJicE1tNFJC?=
 =?utf-8?B?b2JKSFI1MFdPV0ZuU2dRU0tlSE0xcHk1a3R3NEp0YmFJZlBEYlRTRllHNGtk?=
 =?utf-8?B?elRZK3ZLQnZkTTNXQkdXVGo2eDZIZk1QcGpQeGREcno0RUNoUXEzQVA3VEYy?=
 =?utf-8?B?TXFZNWZMc1RUWkpIQkZDdTBqT0FoZi9WSm9zUmpra3RjQkxaR1RIYTl3SWVt?=
 =?utf-8?B?dnJ1c0tvVUhrK0huV0gwVnhyNTFGWGlLL3Q0N0pVV0lVQVRNaE1vcWVqY1Bp?=
 =?utf-8?B?WThISjdRZk52UHlWbmtVcjZwRGtLSUgxZGVMaDZlMEZqNm16YXRNcjdURTZ5?=
 =?utf-8?B?dmtxYmtsTlVRWnhpb3VXWXhmdytuZmw4M1lvd0NzYVM0WERIUlpJZ0ZHQlBG?=
 =?utf-8?B?TlU3NzY2eGQ2bVJnYks2aDc4THJQd0c5bnVNcjB3d2FteGFZNzN3QXBXY3NB?=
 =?utf-8?Q?pidTVmaDknHvDfII=3D?=
X-Exchange-RoutingPolicyChecked: fFpeNs8h/QJqyPRaCnh1gu6IvjYNiSoaow4TlB0MFLf959tjVUHcID/RHfRcQ5BKSualiY3LAJjx1f3o0RUsXX6vCD3gji4i1dc7/bZNuTYtbr96njsC/vrGg43q7mf0klikogvbNNYppRV0hiehIaEwKlRXReKMgqCp8h5nGfgTC769D7aCrKURfe3Va8C7P4IRiHnnJp2Z4LPgFjboyvNr19+/pMG1VY5ID0AEiYNjyXEe8FkR3A7r6uyCyE/OO8srXWw5TbQ4HMTvUeFYovk2B9xlPnhThwUBmd2XNM5V0zeJvZraXq4b7jCmsC5lfu14p5pDfrrgyDFRUSGsOw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a0de0b48-fa53-4d5a-adbd-08def8aa4ca4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 19:45:44.9276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QnlsLoTcZAnaJ398yDXnG/LN6LpzYJzJef/aTuKS0shREMK0sMaEHxxbCShXajVuo3cUItBgfw5XoKr72U1T42Mw4omLOr2e2u51PaIcta0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9647
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



On 8/12/2026 8:07 PM, Umesh Nerlige Ramappa wrote:
> On Wed, Aug 12, 2026 at 07:05:35PM +0530, Nilawar, Badal wrote:
>> Hi Umesh,
>>
>> On 12-08-2026 05:22, Umesh Nerlige Ramappa wrote:
>>> Use xe_log_err() to report pcode errors using SIGID.

hmm, it looks that there is overlap with my series [1]

I guess we should hold on with adding more SIGID usages until
we complete review of the infrastructure patches and first set
of SIGID usages that will act as 'golden' examples

[1] https://patchwork.freedesktop.org/series/171022/#rev4

>>>
>>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_pcode.c | 12 +++++++-----
>>>  1 file changed, 7 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
>>> index e9125341481b..b35c1a77effd 100644
>>> --- a/drivers/gpu/drm/xe/xe_pcode.c
>>> +++ b/drivers/gpu/drm/xe/xe_pcode.c
>>> @@ -14,6 +14,7 @@
>>>  #include "regs/xe_pmt.h"
>>>  #include "xe_assert.h"
>>>  #include "xe_device.h"
>>> +#include "xe_log.h"
>>>  #include "xe_mmio.h"
>>>  #include "xe_pcode_api.h"
>>>  #include "xe_pm.h"
>>> @@ -61,9 +62,7 @@ static int pcode_mailbox_status(struct xe_tile *tile)
>>>      }
>>>      if (err) {
>>> -        drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s",
>>> -            err_decode, err_str);
>>> -
>>> +        xe_log_err(tile, PCODE, err_decode, "Mailbox failed: %s\n", err_str);
>>>          return err_decode;
>>>      }
>>> @@ -225,6 +224,9 @@ int xe_pcode_request(struct xe_tile *tile, u32 mbox, u32 request,
>>>                  true, 50 * 1000, true);
>>>      preempt_enable();
>>> +    if (!status && ret)
>>> +        xe_log_err(tile, PCODE, ret, "Request timed out on retry");
>>> +
>>>  out:
>>>      mutex_unlock(&tile->pcode.lock);
>>>      return status ? status : ret;
>>> @@ -319,8 +321,8 @@ int xe_pcode_ready(struct xe_device *xe, bool locked)
>>>          mutex_unlock(&tile->pcode.lock);
>>>      if (ret)
>>> -        drm_err(&xe->drm,
>>> -            "PCODE initialization timedout after: 3 min\n");
>>> +        xe_log_err(xe, PCODE, -ret,
>>> +            "Initialization timed out after: %d min\n", timeout_us / 60000000);
>>
>> Is a SIGID needed here? My understanding is that this failure is translated into survivability mode, at least during probe.

IMO yes, it's a FW error, for which there is SIGID, so we have to report it
what will come next (wedge/survivability) is not to be decided here
we should report per site, not per condition

>> Also is it correct to log CPER_SEV_RECOVERABLE for this error?

initial documentation was reserving FATAL only for real PROBE errors
or for SURVIVABILITY mode, but at least for the latter it is no longer true ;)

> 
> I thought all FW errors should be reported based on this conversation:
> https://patchwork.freedesktop.org/patch/744654/?series=171725&rev=1

that's also my understanding

> 
> fwiu, the chain of errors leading to the eventual failure is still useful, but not entirely clear on what's needed and what's not.

IMO if for given error case there is a matching SIGID we should use xe_log to report it

but we should still check if existing error makes sense ...

that's why in my series I'm splitting almost each new SIGID
usage addition to new patch to have proper discussion

> 
> @Mallesh, thoughts?
> 
> Thanks,
> Umesh
> 
>>
>> Thanks,
>> Badal
>>
>>>      return ret;
>>>  }

