Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97CA4C61DB9
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 05:16:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1580C10E09A;
	Thu, 27 Aug 2026 05:16:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EU+1P+eq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F88510E09A
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 05:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787807811; x=1819343811;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H6F6jj6mFLsabfPRn2gGx8JjXsBYT6p0j0ues04cT64=;
 b=EU+1P+eqqinjBB5sW/Nu2RWQv8TpiPzSXjgb4zL2MG4r01GpwTbW7YWw
 rJ/TNrmMRiWbWGA55rbUbsIRcrcao2+RPNU5OsQMdJR8iFUWFkvEE0brB
 iHww50KC8wU131RUN7hbDCyM/JxPUXGCn+GcP9SjFUpZjpxAki5tRVdtV
 IF5b4nbH12oDE9KQ0fYuIfIhNhl6abLO0JUB86iQEzODTGP38ZYBtet0v
 NlNPGetb2jVkBM14eQiGzxCTg7kKq9Im+x1hiWEJHIFLTQJUmVsjiQhbP
 CuwyhdkzbBNVN/XDJZsmxtD71Sjjo+i61CckjfDkUlxTav+aq4lHa7R9y g==;
X-CSE-ConnectionGUID: JYSJ6ARsR6u5aW6Newtzaw==
X-CSE-MsgGUID: dVzluSNnSEqZ//iigUyreg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="75841304"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="75841304"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 22:16:50 -0700
X-CSE-ConnectionGUID: +QacxWTVR4WkPMsLw42S+g==
X-CSE-MsgGUID: 1cl0/sw6SharC3uggO0RMA==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 22:16:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 22:16:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 22:16:49 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.39) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 22:16:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yvdImAmhEaLAIzHvveL2L15dHWn+GiIsbJOLKKnNOxax1QnqV/DjdkEnUQ2ngGOL/sXITNcBEUskn+ViHEvM1+5zQi4zyfOEmwq57qSPEhzJytEzGUKL/oobhKylXEoq9SA3/n1MMGzvPBZZIY7qdZEnJDMTxVjq5cnydC78HVv+IfluCcSGbQEyFjMMdQeJPHDDfnHp6FbeDGXoBkOeyQpm6dhcJoIazrTSICYmHkaEsi/lgZqv9ppH7m+em5ayPyCQTOl5nSlavGQuQz5n/2F2oovYWwdbRY/YF62czgSCxkc96HV7fkibDxi10ppDZmUzZeRsq0YrI+IDVOyU8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkOXqwHX2orJ1/7teOTZQe7J0dmkyMHEKJf182qm6U4=;
 b=lZa5XShAyt5hzhTM63GVgscOoUk/Hk728/Jc9Ryo9XDo8+vnOoB1DauAslqJWSsel/F4i1tXC1EWbIKebvVd/5jOoeio4XrKcyBb1ULZZcevHChMo1Xa59NZ3wM20ImKsvdMleCjBX4nxUen09LKHwpfLY7mjLj8yu1fhogPSVwEIJtoOnPZK9Y/i64+ZFqee6Zcyq05XFsilsIF3FVLTr2Q0nvgXiRnH1v9quF9HA4n7GNvTrDAsgvzeoe1ilUufOFIrSSzSd0gFnD0Lq28+Lx07kq6HXDHxOXGFaS/rOD/PG6JbijcJAB3hT9SVthTSsscAg/WydqyzJzj7lkH2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by BL4PR11MB8822.namprd11.prod.outlook.com (2603:10b6:208:5aa::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Thu, 27 Aug
 2026 05:16:44 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%5]) with mapi id 15.21.0339.012; Thu, 27 Aug 2026
 05:16:44 +0000
Message-ID: <34a0f5f1-f995-430d-912a-8e571be4089e@intel.com>
Date: Thu, 27 Aug 2026 10:46:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/hwmon: Detect unavailable temperature sensors
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <raag.jadav@intel.com>, <riana.tauro@intel.com>, <sk.anirban@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260824184137.2164727-1-karthik.poosa@intel.com>
 <20260824184137.2164727-2-karthik.poosa@intel.com>
 <16092cf0-2d78-49a8-a7a2-a333ed9c7e73@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <16092cf0-2d78-49a8-a7a2-a333ed9c7e73@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0241.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::6) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|BL4PR11MB8822:EE_
X-MS-Office365-Filtering-Correlation-Id: 0379014b-d341-499a-6372-08df03fa6291
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|6133799003|22082099003|18002099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: DimXwzQ22y364KYkEiS9F50MzVAwBF9PPHmoTnlNS4sO2pcIWtHe9T8uK5Nd+MjJjaJVTNmbJcLa8pJX5mUxSPf0TLrK+Gl2vKmPIlWJp8+W0+kqjC+mcTEs0yR+ZnDD0MM2fjcLO5K2I1mzYpJXC8zqj8ksiBjqHLB4IOuh7uMQu54okmEMlEI4LDNH7KtA196jCoujtQJLhvw5mMfMkoZH9e+2S+vYJXuAJJnFMyiv6+cObK/hM6n1bCH2eTcoN6Ri58Y5wW5Mvp7A0tugtVs4Fk1cJU9nM0yiytTbmEXu2YDmX0eZCBJIo4YeKOLY3XuUeZUt5MxpF4HWYJIHPpWvMwtCjPkQtBmTyHaAuFRvcF9xX1M6f51bdB9GgcZl7iC0/9U4euI5UP6PPcbU8t0ieGP6EuTi1AY+dXeSjviy+NysiIFism0ZjLiz3RekPn3BrAgxan3B37XEbwClRi3TG7lTCKKfMzq6d8uLCF3TSsQ5mUE8XUqulX80r9gmsQs0okT1ph+VARPlr6ZcZ8sGLhik7CRoY/2OElgkYNk5ie5t7tpI5j/krzP23y03WV5oKRgL66GAxo9euHE30yzAO+HzAayHYf+kmZYIibISStELJy1pAroZxxUuLPAftO0CaqFE0uq2rRfSdMonb/p1LLOxFyN4gIslWVbWez4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWhyRlFDbThJOGlEQkdwTzNsRk1MMEtYSS9ERVNWWStzelZ3ekplZm05eUlS?=
 =?utf-8?B?dFVTZm1mNGFvTmRNNVp4QTRITDZTSCtmWmFsVEJyMElMMS81TTR0MS9jVGVl?=
 =?utf-8?B?NHRQSEhtMzk2TG15L2FiSXVlRFFGbE1RT2xtN3RwUTM0bFhpZlpheEhOMjI5?=
 =?utf-8?B?RnEva0F6MEQycnM0cnAyQ2E4UktYUHBpakdsbWpXYmZGVnJKc2dqM0dDa3o0?=
 =?utf-8?B?S0xMck93TlEyR2tBemo2MHJrYTlGTkQ0RUZNSTRicGlVQjMzYnNkVUQwOVk0?=
 =?utf-8?B?RUs0VitlODk3c2RsL1pVM1NLeUZpR2VBYWt6dlRpQ3hKYWFIdG5qQzRGc3hS?=
 =?utf-8?B?cDhWaUlRdzB5NmViZVdORG80aXBieTQydUVLamNUeXZLL0FkQkNMNDVyTzB2?=
 =?utf-8?B?NlM1WUp3SmV6L0ZoYzF1V29kSFUxZXM3TGhpay9vNEZVb0t1ZU9Ub0lRd0Jk?=
 =?utf-8?B?ZU5tMVJTTW5MMGJmQ3VleEk1R0pabW9IdG5vai9iMUlaaEl3cENsSjRCb0d2?=
 =?utf-8?B?cjdJRGEzRkZiTDBPMWhTZHQxL1RUaHRnY09NTUFNdU1iU0R3Tm9kRGJqVlJj?=
 =?utf-8?B?UlFFMnFRaDVCWjBzUDNFV3UyVkx1ZWxTdmZFNThoMkZXSVNEVG9pdllZV1p6?=
 =?utf-8?B?M2ZQSmk3a2ZsK0ZISlVEVHI4dFprUGIraXo1bnVCV3ZDMWd3b1lwOVZvZlAv?=
 =?utf-8?B?RWM3ZlY5NU1zS29RNFBnNjdDQnp4cU9FQnByK1doWENUZFkrbncvdTZETjZV?=
 =?utf-8?B?Q1h4RWQxazlsUmxBeVVhcE0rRFNYb0tZWmJ1aXNNOUhaZ3VwM0hsa3Q2bXBR?=
 =?utf-8?B?MVFieUtLd0lPcVVVdTNaMU5uUUcydTByQ3BjTk9uZ3FZZmNQeTRYeCt6Yytx?=
 =?utf-8?B?TjhYdVZSRm9LUURXV2NlZXRVSkptK3JCN3hWU2FnNElycnc0elR5czlsajl6?=
 =?utf-8?B?WjBOL2NEaXRvbGdWQTZMVWFWUmIzYUl1SUNuYkZqY1pQb3Rqa1ZYSERTcFlh?=
 =?utf-8?B?QlR2L2J2ZXNmME80YlFNZHlHdXpyaERqSEprZ1diV21NS0U2Z29pclJGcmNB?=
 =?utf-8?B?S1M3K1lRa2hMa00wdVR1WG5FR21EUXV4d0ptNFVmYnp6aWhGOG91TWgxazly?=
 =?utf-8?B?NkdMRnlpdytnUW44VDNhQTNsOVBIdFdZZSszZVMrOHZvN0JQd0d6NXl2L05P?=
 =?utf-8?B?M2dqMjZlTEpDK0NxQnRWK2JzOHNMWm9HYWlVblRxSUpTTGNmeTVTck1EMVhy?=
 =?utf-8?B?czFGaFY0MUdKTFgxYWJHT2o0YnBBVEIxc2JwNS9TMHdzdVB4bHhEQmpuSk5k?=
 =?utf-8?B?bE5KeGVTZjFWaWI5SXdHejAvbTR4MEUydlhvTWRRNk1QaU94Rzd0Qm9jMzBk?=
 =?utf-8?B?UkZSazd6YnJraVRrNjRCSG9oU1VjeEJ2d1NrL1pid01nNTlQbTFJaVdwQ2hN?=
 =?utf-8?B?anRtN3dXOGJiTlczVmtHR0FTdFNMZFFVSnM1TXQvcEpsaG03RFQ5SnROeGRk?=
 =?utf-8?B?NU9ETkt3WjZmVUlTTmFwVGNNNHB0dndnQld4WjdmNlN6NTZtaFB5U1MwSWRS?=
 =?utf-8?B?MWhNWTVsRERsemN5SE5UM2tpVVdlaVRpMXYzQ1VHVFRPUTJnUktOYjgyb3Jj?=
 =?utf-8?B?Yi8rMENERUpkdU9WdWlGTE4yNmR3RUgvZlhMY1NFa2hzNjh1eHVMaDdYNFpv?=
 =?utf-8?B?YjVld09pdDk3WElJN3FoWktpTENLaGl1ME1pQkdpb1RORllNV0RyWTZ5STg3?=
 =?utf-8?B?Yzh3UjM3RGhLTWdES0dqVW9GeWo2T3RGS05YV01JWE9LLzV5ZEN5MkdHQ09F?=
 =?utf-8?B?bVVWbEpVTmpSd1hxUHNrM1lycnFsYWQvaHFPNDJkSGduZmZZTDNZSlV5UWta?=
 =?utf-8?B?S1hMakVSTEIzb1VsR2Z1azBZaTk1V1B2dDVXNGFRNjJrTTE4dElWcFZQTVZT?=
 =?utf-8?B?WG0xWWJhTjVQVUwvMEJoRDF5Q3VlZFc3SjBLWEViMFR3anFCMzdYYWZBT0JI?=
 =?utf-8?B?YjQzcnFicjNzZ2syZ1dxZkM0b2J1aHppQUJPNEtiTWlyZXROMGJIN2kySC9M?=
 =?utf-8?B?YUl3dUI2NDVmcWladlB2dU5hWXZPa1ppTFBrNCsvRUVSZXRHWjNKTjJEVW05?=
 =?utf-8?B?NVUzWjIreEpRMUNKdG1QblRxM0JRNVY2RlJVcG12TUdURzBjQlB4Y2M5Y2c5?=
 =?utf-8?B?UEsvTkhGMStlTWxqS2xVdTRZSGJnVVljWGNXY2dGb2NBcGpIZDJXSTB0ZnRV?=
 =?utf-8?B?Mmh6ZEpIcVhmczJIY0JPVldXckw0L2paelRPZ0tEM3dKOVdiR00zY2ZkbW1V?=
 =?utf-8?B?amxmWUR5OGFPZjdoNmFpVGlOeSs4aHptb1F2aHRhV0ZwbUhTTTJvdz09?=
X-Exchange-RoutingPolicyChecked: j95EaNadmRMytmFMLRSa/JLpIsshIjwo56zoZ1L9sDpGqshh/tbE11hrKJO9w7NJNG8Qx5zwR5c43uD8lnr6MeNWa3WEcOF9ysh6UbPP1SZkiUxg70/74dKoZbx00uV9cqueFj+oanSgt9I4rBbRNbKukjZj9dt2WHFhXQsoS1Z6u/msRFHBEmiRURdEtj4BWXBqVGsNf1YmjmkICa+nEhAHtHy1RODkz6esqsJrqmibNH4p7dc2aLS13VA1qgnWk7PTjnVH5WYUi54qAJtkmiNz1tCSZ+U3kJYIYPFp0kcihSz0KTYg0YVCMlzQC7AcaKc4GmoNzA08oz1pD8MBvA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0379014b-d341-499a-6372-08df03fa6291
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 05:16:44.4458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gVv2YH85+nLBQCrSQPSzBoZ/67u7qRSXsxf4KYloeAR95KOA1y3kbcyPYDbID7L/VioE3GqkVTPH6lHxYBmAKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8822
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


On 26-08-2026 17:20, Nilawar, Badal wrote:
>
> On 25-08-2026 00:11, Karthik Poosa wrote:
>> Add is_temp_valid() to validate sensor presence.
>> A temperature reading of 0xFF on CRI platforms indicates that the
>> corresponding sensor is not present and should be treated as 
>> unavailable.
>>
>> Use this check from xe_hwmon_temp_is_visible() callback so that 
>> attributes
>> for unavailable sensors are not exposed during hwmon device 
>> registration.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_hwmon.c | 79 +++++++++++++++++++++++++++++------
>>   1 file changed, 66 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 5284cab6703d..2c4eba4b8f8f 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -813,12 +813,21 @@ static int 
>> xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>>       return ret;
>>   }
>>   +static inline bool is_temp_valid(const struct xe_hwmon *hwmon, u8 
>> value)
>> +{
>> +    /* Value of 0xFF indicates unavailable sensor for platforms from 
>> CRI. */
>> +    if (hwmon->xe->info.platform >= XE_CRESCENTISLAND)
>> +        return value != U8_MAX;
>> +    else
>> +        return value != 0;
>
> How about returning true here?
for BMG value 0 will be there if temperature sensor is not there, which 
is why we are checking this way.
>
>> +}
>> +
>>   static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>>   {
>>       struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>>       u32 *dword = (u32 *)hwmon->temp.value;
>> +    int ret, i, count = 0;
>>       s32 average = 0;
>> -    int ret, i;
>>         for (i = 0; i < DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32)); 
>> i++) {
>>           ret = xe_pcode_read(root_tile, 
>> PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
>> @@ -828,11 +837,25 @@ static int get_mc_temp(struct xe_hwmon *hwmon, 
>> long *val)
>>           drm_dbg(&hwmon->xe->drm, "thermal data for group %d val 
>> 0x%x\n", i, dword[i]);
>>       }
>>   -    for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++)
>> -        average += hwmon->temp.value[i];
>> +    for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++) {
>> +        if (is_temp_valid(hwmon, hwmon->temp.value[i])) {
>> +            average += hwmon->temp.value[i];
>> +            count++;
>> +        } else {
>> +            drm_dbg(&hwmon->xe->drm, "mc temp sensor %d not 
>> available, val 0x%x\n",
>> +                i, hwmon->temp.value[i]);
> Is this required?
i think we can have this debug log to know which memory controller 
channel is available, of the available count
>> +        }
>> +    }
>> +
>> +    if (!count) {
>> +        drm_warn(&hwmon->xe->drm, "no memory temp sensors 
>> available!\n");
>> +        return -ENXIO;
> Why warning? If sensors are not available then its fine. This will any 
> way avoid exposing attribute.
agree, sashiko also pointed to that, removing this is in next revision
>> +    }
>> +
>> +    average /= count;
>> +    if (val)
>> +        *val = average * MILLIDEGREE_PER_DEGREE;
>>   -    average /= (hwmon->temp.count - TEMP_INDEX_MCTRL - 1);
>> -    *val = average * MILLIDEGREE_PER_DEGREE;
>>       return 0;
>>   }
>>   @@ -852,7 +875,13 @@ static int get_pcie_temp(struct xe_hwmon 
>> *hwmon, long *val)
>>           data = REG_FIELD_GET(PCIE_SENSOR_MASK, data);
>>         data = REG_FIELD_GET(TEMP_MASK, data);
>> -    *val = (s8)data * MILLIDEGREE_PER_DEGREE;
>> +    if (!is_temp_valid(hwmon, data)) {
>> +        drm_warn(&hwmon->xe->drm, "pcie temp sensor not available, 
>> val 0x%x\n", data);
>> +        return -ENXIO;
> Ditto.
I shall remove this.
>> +    }
>> +
>> +    if (val)
>> +        *val = (s8)data * MILLIDEGREE_PER_DEGREE;
>>         return 0;
>>   }
>> @@ -956,11 +985,21 @@ static inline bool is_vram_ch_available(struct 
>> xe_hwmon *hwmon, int channel)
>>       struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>>       int vram_id = channel - CHANNEL_VRAM_N;
>>       struct xe_reg vram_reg;
>> +    u32 reg_val;
>> +    u8 temp;
>>         vram_reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
>> -    if (!xe_reg_is_valid(vram_reg) || !xe_mmio_read32(mmio, vram_reg))
>> +    if (!xe_reg_is_valid(vram_reg))
>>           return false;
>>   +    reg_val = xe_mmio_read32(mmio, vram_reg);
>> +    temp = REG_FIELD_GET(TEMP_MASK, reg_val);
>
> There is sashiko-bot warning on this. Need to fix.
>
> Thanks,
> Badal
agree, next revision will have the fix.
>
>> +    if (!is_temp_valid(hwmon, temp)) {
>> +        drm_dbg(&hwmon->xe->drm, "vram channel %d unavailable, val 
>> 0x%x\n", vram_id,
>> +            reg_val);
>> +        return false;
>> +    }
>> +
>>       /* Create label only for available vram channel */
>>       sprintf(hwmon->temp.vram_label[vram_id], "vram_ch_%d", vram_id);
>>       return true;
>> @@ -977,8 +1016,9 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, 
>> u32 attr, int channel)
>>           case CHANNEL_VRAM:
>>               return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 
>> 0444 : 0;
>>           case CHANNEL_MCTRL:
>> +            return !get_mc_temp(hwmon, NULL) && hwmon->temp.count ? 
>> 0444 : 0;
>>           case CHANNEL_PCIE:
>> -            return hwmon->temp.count ? 0444 : 0;
>> +            return !get_pcie_temp(hwmon, NULL) && hwmon->temp.count 
>> ? 0444 : 0;
>>           case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>>               return (is_vram_ch_available(hwmon, channel) &&
>>                   hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN]) ? 0444 
>> : 0;
>> @@ -992,8 +1032,9 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, 
>> u32 attr, int channel)
>>           case CHANNEL_VRAM:
>>               return hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT] ? 0444 : 0;
>>           case CHANNEL_MCTRL:
>> +            return !get_mc_temp(hwmon, NULL) && hwmon->temp.count ? 
>> 0444 : 0;
>>           case CHANNEL_PCIE:
>> -            return hwmon->temp.count ? 0444 : 0;
>> +            return !get_pcie_temp(hwmon, NULL) && hwmon->temp.count 
>> ? 0444 : 0;
>>           case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>>               return (is_vram_ch_available(hwmon, channel) &&
>>                   hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT]) ? 0444 : 0;
>> @@ -1011,12 +1052,24 @@ xe_hwmon_temp_is_visible(struct xe_hwmon 
>> *hwmon, u32 attr, int channel)
>>       case hwmon_temp_label:
>>           switch (channel) {
>>           case CHANNEL_PKG:
>> -        case CHANNEL_VRAM:
>> -            return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP,
>> -                                channel)) ? 0444 : 0;
>> +        case CHANNEL_VRAM: {
>> +            struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>> +            struct xe_reg reg = xe_hwmon_get_reg(hwmon, REG_TEMP, 
>> channel);
>> +            u32 reg_val;
>> +            u8 temp;
>> +
>> +            if (!xe_reg_is_valid(reg))
>> +                return 0;
>> +
>> +            reg_val = xe_mmio_read32(mmio, reg);
>> +            temp = REG_FIELD_GET(TEMP_MASK, reg_val);
>> +
>> +            return is_temp_valid(hwmon, temp) ? 0444 : 0;
>> +        }
>>           case CHANNEL_MCTRL:
>> +            return !get_mc_temp(hwmon, NULL) && hwmon->temp.count ? 
>> 0444 : 0;
>>           case CHANNEL_PCIE:
>> -            return hwmon->temp.count ? 0444 : 0;
>> +            return !get_pcie_temp(hwmon, NULL) && hwmon->temp.count 
>> ? 0444 : 0;
>>           case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
>>               return is_vram_ch_available(hwmon, channel) ? 0444 : 0;
>>           default:
