Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5D9F9D0D5
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 14:35:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E484C10E31E;
	Tue, 14 Apr 2026 14:35:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="akCMTeNO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D037A10E31E
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Apr 2026 14:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776177342; x=1807713342;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9/ZXlfSTCuOGl2ZXJaaFfedotmoFi2UIHbDGwbbauVY=;
 b=akCMTeNOTaRyeRDxSM4rPpzjGqHmjrmm/SmFvsp314NDQwBVjANKuUa/
 /kzO9HPoWPVT9RvhaW0R7v0OeyoX//os4BYB5l2o86RGEoxdYUDwXNGAC
 bFZGnSVFU2BuRlsPn61s+qkR24UkP4+X/IWzHAUP22f8wgLlZzxSVBznf
 VgbDJ3CZHoMG0sMl0Lqq4gDef76/JVYRINPdupx+7IURiheI42VFbzspT
 JK/3Kf9pyR2u0ylC7BuhWcR9LKja99dMplbwtFjZDCz3ZPRQKPurdQFA8
 Ta19iBD/4FogkQAhkqtuwBdy992sNxDHNbhpSLr2c9FK7w1242Ko/VTFN g==;
X-CSE-ConnectionGUID: nHhyW5RJRv2/47c5k/kctw==
X-CSE-MsgGUID: RpgFvX8qSwSfRIkR22y6aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77160988"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="77160988"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 07:35:27 -0700
X-CSE-ConnectionGUID: EEPAB3f9QR+Xehpu+7TupA==
X-CSE-MsgGUID: P5GITOwyQBO3ToUYMYXhvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="235069450"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 07:35:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 07:35:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 14 Apr 2026 07:35:28 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.15) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 07:35:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L4c83DYHd3af71TkJojhs6+7Mv1BXlQsetMJi4hzNyko6o0tsffWnTdFcTbs0Wza66E56226Vu+mt1IlLFHAVHLSIbLLnNxTrPPVQM9scqRLrbZLU/4JYbiW+Pn+CsCuqZfbj8IFGjLLN38cvXzUmct+hvLdPoL6dk0ZgzSYCyVYMuuLnLGTJ9aWEByhBnJDQlEBo0f6HPTJyYXy4RSN7UNIP4kFnSYDLykzbSS5xZC/saDl0us7V3D8LeSXbeOJcs1LPJIz/PUbV10fMLyDOQMwhAc8Z8/B4PkdMlafrwO+5V5IO22RZmbITLbLa4JHEdYa1Btwx9RlSxxJp1AyFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=31QZ8Qq0HqOkAzFbF7DQrDeDXyNRR5OQSdh2xYBloMQ=;
 b=jc1J7vBOfroGQf2s2/4IrRar9XQx7w5hf6FF1cCRuO76vpflq+J/NLXcDdCMWsy3PuunPrP5mVtEOAUv/3pLynwcx1coWrb/nipOCGXUTHm319h0/qiKGUe3eiy0s/bJ5bZ7SceWxQB+it70AK3jLO8+9aNhMPOFxICt0TTrEQFUp+cMeNO43bxn8EpaoSEF0zbS/V+bFcijMW6HiDGin0CnzQsrpDEc756IIGVtJIUVZSNCO0DhXy87PR1brUHzmGmI3AMh6EUjkpuDatea6v2+yJZIJZ2pChMP5gceF7EVuahb4Mgu+BBXrBOA2jaLP5odsDcfj8g+Jg7ntukbRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MN2PR11MB4598.namprd11.prod.outlook.com (2603:10b6:208:26f::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9818.20; Tue, 14 Apr 2026 14:35:26 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 14:35:26 +0000
Message-ID: <c3bfef08-37b4-47c2-bfad-6084d16c54c1@intel.com>
Date: Tue, 14 Apr 2026 20:05:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe_survivability: Fix runtime survivability error
 handling
To: Raag Jadav <raag.jadav@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>
References: <20260414124426.566929-2-mallesh.koujalagi@intel.com>
 <ad5H-nLmkCbze65f@intel.com> <ad5K96woeG-_19SY@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <ad5K96woeG-_19SY@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0125.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MN2PR11MB4598:EE_
X-MS-Office365-Filtering-Correlation-Id: 9981c443-6575-4fbd-6a1b-08de9a33119f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: kxH+TtuzeQNE8vDo2EBY4J/D26bd0UCo/jGQXqFMJPLtgT5I7aCz1CEplNeN9lCwSd/3rss29lEdANSGFDqH/Mnl28CVDATJDOHcs5G+oCONZvGUyAgrpcdyVUkkJjBsR6q3xUNJXFqfITT9u0WkT1hzxq8V0Zs264CgAbzmLlsJCxaVRYq6E8UBVjzZmbDMSDhTpaml2+9F8tMxsLc1PlYzYamoWhfMdUYOwsGCfsuf2Oy//sCAwQEbx1hV+gI+lYHtB3T1rCNGnRg1vh8GQKRljYBOCliK63gtulmFB02cbYZTwV9Q2Xo9HTZ64BSvddvUc7CxMeugKt0AztRwhrF/NnBVDOsCrnutk3n+oLdoqkjnFAA5oFV01ehUcr36ZFdWpHvO/ff1Cf+yHZqyXXKJ8cA1TVoV6gWItAx6PlAf5kFslhj0svTnwEvqLy2yLwrk64rxTT4eV+rLveFHK+t3+YSGDzrXKYTYWXOko7HWKDMLxloX3jKJohoZlfimO6MU6dlqVR6mkkHg1KiwhGqAv5rTJ2uuHBXk61Cn1ceBFEij3fkH1BwbuxwamL/HMkqvbXzNv5dqVqyVHPrehbH2iet/+0ZY3XAfI0LVfqXUHWiCja/lcgapaaez3b5jBBWkKz0E6WELM1QMsocINDkW57aKLznBCf477xskmoTPB+XeGOitTGZvqH5v/0qgx0OxzxUSyosmcFY4n9R4WSrQRrraA0CZWcD+ciiJR2AdAtM/fgfwYc9Tio1mnV5w
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ME9uS2tHdWRxQ25IdEZJc05MZlVGN1FNeXZwSlVsUGwvVjlFV3ZYSUtiQnkr?=
 =?utf-8?B?dXNxekMxQXViUWZBYTlpdXIvMHpLQUQwdjZkS21ZOWcyclRqTysrS1FRYUFy?=
 =?utf-8?B?Qzd3Y25ZR1VIYkJtQXJQL0QvcEFCV3hERGdKRXlGREtQRjRZclBrM2NhdkZE?=
 =?utf-8?B?VzVaRkNPZXNQMjNBNVhPbm9jcHZPQ2FZVzdlMzBwb0ttZHBwZnVMM2hpemtD?=
 =?utf-8?B?eXRudU9CcGdTMllQaEJFS0NqbmgwQUh1Q0Q5ajFycFo4NDVGZXYzcW4xRFg2?=
 =?utf-8?B?bGZWNTRDVG5TM2dwWjRjU3g3TE5kNms4TFdjcWhDRjVnUXVnZW50dHJJNGds?=
 =?utf-8?B?M295elI4Q0VsTHNncEZjM1VWa1NHWGJCZEF6YXdxMXIzQ1U1SFRlRVU5b3Ba?=
 =?utf-8?B?MmFIbTZ4TkdVaTNDbFM3bHdJdFZIMzZ2YnN2UGhmSFFjVXl6VE5aalc4NXF2?=
 =?utf-8?B?L0Z3RFZBbHBCV3lucEhleW9Hdm5XSk5BTjdnTzBoZjBmLzNGcFRBMEIyZlB3?=
 =?utf-8?B?OXQ2emo4M0QzVDMwY2JJOWQxNERhWit4L1ZMV080STlKOTJSN1lnM3hBMDZr?=
 =?utf-8?B?L1JjYUZnVXE4UzFEa1hBUWxGMktKTXhvRU5ZSWdYWWlzS1gyQ0NsZXE4MjBh?=
 =?utf-8?B?V1Qxck5aOTJZajZVODRJRnFPTytQT3VXd3N0eXlrVnhoRHJMdmVoV1RSMTBh?=
 =?utf-8?B?VnlQekQrR2M3VHNidHdFZVA0SlNDTUJPK3RiL0NwSUFaQnQwMnVhQ1RtWEJu?=
 =?utf-8?B?VlRSME13cjVkWVh3Wnl2ZnlWQXpsT1dwTUpiZEVKNDFpTGE0dXhrTXVEbEw4?=
 =?utf-8?B?T0h3UjE3djZUYkswckRBek5ucG4rZXlpWC9SZjhKNlYzRlRTdVA5dFlYU3V0?=
 =?utf-8?B?WW05L3ExcGdadlFqVmM5TzVpNVlvK1B6NFNUaWppN3NNNGQvdU0vVU41VzY1?=
 =?utf-8?B?ZHlRa1d0MUVUbW1TSm1ZbWFiclQzL3lzS0ZTTGdMVWpSR0czMS8zdGkycVpv?=
 =?utf-8?B?Tk5hQWMxRUFkd0psV1BxTlI4YkdvZzdJa0J6U1NIc2l4Z1U2TjFyak9YZ2c2?=
 =?utf-8?B?V0FNdGJTbVN1ZVJ0R21qK2o3OGM1UGdtdlRzc2ZvMzZ4YmpUd09aU2hwak5U?=
 =?utf-8?B?MllmZzYrMjA1WDZiTHF4Wmd6YTlGWEIzRG9vQ0YyeXdPd3RLWHFMZ1hLVDEy?=
 =?utf-8?B?UG1sMUJoSkVkZVVQd2Jyc2NFcDdudUNMcDRicSt5ZE8wMWxXT0IwNDh1TUh5?=
 =?utf-8?B?bWNldnJhNHJQOXN6WlZYanZOdTlMcVVSYjhkK0dGM09wWHVrUDMzUlg3ZTZh?=
 =?utf-8?B?V2VFelNyU3lHZ1E4czdGaklGZE5WaURlOUdzNmZkMjZiRWd6eGFISmU2L3NB?=
 =?utf-8?B?R0VFbEcya1ZSTVdMS0IzSXowVlF6WDlSM2N0OVUzQ2kzQmRDSnd0RGlnaHQx?=
 =?utf-8?B?cE5VclkxY2dwVFdwalF0dDI0VHdETVFzOWtrY2J5WVBtT0IvVDN1LzY4b0Nr?=
 =?utf-8?B?V2dzOGRWVXlxZGp2M2txWWVsYWh6emlYZ002aEhtL2ExVkd3RVFtQXpVcktz?=
 =?utf-8?B?YmJFQmtqZWRoTnU4QWZKOGdBL0xNaEoybkdEckNRVlhjNFhtNVJPRDh6dThN?=
 =?utf-8?B?TVhMTUlrU1JXZFhFSzlkZXhaYkdIUTdST3V2NU4zTlMrdy9WK1B1cmxLSVNT?=
 =?utf-8?B?RlJmcnVKN3hEWHgrT2xnMDN0YmYrckJ3ZENVL3BaMTJyL0lyeGxhOWtEUTA5?=
 =?utf-8?B?ZHJ5RTk2d3FTUkF2SnNUZWNKdWhwaWVsM2ZobUR5SFIzQzhpQngyZWxiR1M3?=
 =?utf-8?B?STJWRDdjK2Q5L2s4Mlc0Mm85MnFKaDMvZUdOL1VtNTdVYzVmdVhCRFNaMXlL?=
 =?utf-8?B?T0FneC9Rbnk0WGx1cVhaWE1VRWFHeFRrUm9aOTMwS2dCK3owOTNPdUxweCtz?=
 =?utf-8?B?eWpkTmtab011L3RnVS9MQkhLK2U4cGVrUnVWRnp5bWw0dG5NbzVKSlFCMDln?=
 =?utf-8?B?UXNlK0dHdlgvWTFVQ05JOXV2OHUyNUZlaXdvK0xFR3FJb0hzNzI1ZU9BSGNm?=
 =?utf-8?B?eWVBcVdoN09xNFJaWGJGdmVOOE5SN2cxcER1RGJiRENncVZ1dmtKRUE2OUVv?=
 =?utf-8?B?NzFFLzhaOUlaaXBvcjJQUUx3aWUzYSt6RFZlOWFrZFJPbzg5V1huZ25YYWkv?=
 =?utf-8?B?dnF2eUVMK1B4YjRJaG14N2N0MWFkTllnVDRTVzlNaHZiLzVQMWg2ZkZTZ25y?=
 =?utf-8?B?Rm0zSkRqYmJjZXBlRnUrOXRtK2dncE8zSjdUTzM4eHpXY0lMVW9jUmh0czZI?=
 =?utf-8?B?MjJ6VmNwckpTakNxeCtDVDBoN2R5dkZTUkVzTk4wMnJpNmlmUVFwQT09?=
X-Exchange-RoutingPolicyChecked: H7vyYgrAOp2Yr9o2q6J4SnnhyDl0Jibr7C3Dt8vGZagjwdSTRw/h198FijKpKMULAN51PzG5CsmdSxCz2+A/8AaetIa88D6Wpy+QIATR0y6ZV9SGi++Xp69Cu/wnVE77qMYaIMt8xT9txUCR1I2RvXJ6knWw8+zsZBbnBSqRiT4EfdyEz6SBO+mpwllOh7VddDAdQpOZSR9I9Af5hDnogmxpRcqGZWjS8PNsjxEJG/imh7MZuIa7ITcWWbhCM71xcHan6RWjrUbVk+jhA2a7h9yCdgel5B0hTRbTno98iZ8jDjxLRZ2iw8WI3wPP0zOOg5DL8d/NyctwyxpII3GOYQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9981c443-6575-4fbd-6a1b-08de9a33119f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 14:35:26.4544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AQaHivBm5bDGa8NJ+S84sGMsUTN3XS9aStUGCQ2rkiDjZzRbQzUmoaDiY2aabtnwS47ZG83AsCH/cdqSixqjJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4598
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


On 4/14/2026 7:41 PM, Raag Jadav wrote:
> On Tue, Apr 14, 2026 at 09:58:18AM -0400, Rodrigo Vivi wrote:
>> On Tue, Apr 14, 2026 at 06:14:27PM +0530, Mallesh Koujalagi wrote:
>>> When enabling survivability mode at runtime, the code tries to create
>>> a sysfs entry. If that step fails, the error is only logged, but the
>>> function still reports success. This makes it look like survivability
>>> mode was enabled even though part of it failed.
>>>
>>> Fixes: a2ca0633a0fe ("drm/xe/xe_survivability: Add support for Runtime survivability mode")
>>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_survivability_mode.c | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>> index db64cac39c94..c2dfc7ea7b83 100644
>>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>> @@ -413,8 +413,10 @@ int xe_survivability_mode_runtime_enable(struct xe_device *xe)
>>>   	populate_survivability_info(xe);
>>>   
>>>   	ret = create_survivability_sysfs(pdev);
>>> -	if (ret)
>>> +	if (ret) {
>>>   		dev_err(&pdev->dev, "Failed to create survivability mode sysfs\n");
>>> +		return ret;
>> Perhaps this is intentional?
>> But if so, this function needs to be changed to void and
>> the extra msg removed from csc_hw_error_work()
>>
>> Riana, Raag?

Yeah, this was intentional. Even though the sysfs creation fails. The 
device needs to be wedged because
there is a critical CSC error  and firmware needs to updated and device 
shouldn't be used

Currently runtime survivability mode is indicated with a combination of 
uevent+sysfs and dmesg
Returning here will remove all indications on how to recover the card.

Yeah the error message in csc worker can be removed. Will RB [1].

Thanks
Riana

> I've done[1] it already, but perhaps a separate fix is also harmless.
>
> [1] https://lore.kernel.org/intel-xe/20260402174229.1062874-4-raag.jadav@intel.com/
>
> Raag
>
>>>   	survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
>>>   	dev_err(&pdev->dev, "Runtime Survivability mode enabled\n");
>>> -- 
>>> 2.34.1
>>>
