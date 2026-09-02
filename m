Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C036FC61DFD
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 07:15:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670D410F031;
	Wed,  2 Sep 2026 07:15:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GTgWUout";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FFEF10F02E
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 07:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788333318; x=1819869318;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3jyySJ50LWRdTnfJzr5c9sGJM9yi8JhWuqOCwveCFuY=;
 b=GTgWUoutOCgzQexUOqpE3uTCPe0kZ0Rh6C0baAX/pVw3shlI5L+idEeu
 6c+xfUZIguQF0s/ymPf2XXmw+hn4h81kwQS7Z37Sm19OtyjTGjN15Vb/K
 PWXmyD4M1dGZOM3FWGul/0hALk0JNxWYdqpUmdevnzVsaStDViWUpWh3Y
 cptkkHQzLT4NG4ihQbnZ9SXxB8bBn9MmpGVoSL07jZSj06ScYKeNUe1nC
 OaRKVHXyW8ilOe2u/tBNXfREPAIMY2cylwL5w3Cm3p/0DaTA8VaNfd7zr
 67rHvWB6uXkzOuyCSVnIgqbCdwwgZzVx12uabyYMxhQKxa7wO61AABPpA g==;
X-CSE-ConnectionGUID: a6KXllFnSmyl+juihRxETA==
X-CSE-MsgGUID: cNqqUKyPTHy8APaTXyLKdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="114324338"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="114324338"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 00:15:17 -0700
X-CSE-ConnectionGUID: kPjlPiwzQ/O6yGlwjiSk1A==
X-CSE-MsgGUID: 7vkGEOsFRUCeSpi/vpyqtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="266724531"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 00:15:18 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 00:15:17 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 00:15:17 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.43) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 00:15:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kv2B7/7OtDjfvpQMi/j0N6Lk9/u0GdwBBRZjEu+ZehuEykKmfOeNiaiWEg97n/kepqZ4fo4T6rjpugMSrfcNsDiDUe5ExcqtnDEMpsDvND/bZ42/eSK5Q7LQ6lhnDqIeiNj2wsL73Tv2eSvSXa8NZ9+Gn1YrsU94OdzqAwP653iMU7C9BGnCGweZteyp0l1tsJPRamZ3H2GrA708NI4Cxy8H92eMERqbc84+HG8aq38fRtUStRIXegbr3dD8MUGX4NhKj40sOvxP5NnWZcltf8HRX9EoCPjHzwxx5+VG/9hKeqdWzRI+9H4xmPfMirhtJ2s2/Peq1OGbgUQQDzZ2/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8h0c62S/mzlrBBQNrFjFuyspOHwPHEpIiEpHs+V98tY=;
 b=yIAAhmsX9rYMMdzbxJjurY1joioQ9BCZaHi5hFP4gCh5+nm9C+roSq9tY3EEq4vH9JktImlIouR0wTVYO0yhZBmnBYrGfZgnd5ZZjwx87SdiQl3QDS8f/d0TjaKgzIXuXS+HHcWlh5S/ZTuyy/22rp/fhsY9q3/XDAZiEkj1ldfwxZFsnNlzwbrdo4fmgaqc/KnjOiqSo1bdpVLHa/TPHt540Evdel7VjMPczsB09xsU4mfM3gp6EdsiEGPQ1f8RPpiV+FZ/gJRS7rahtMkFVIa92KML3LXQxey1c2Yoy5Cbi1zD6ooeR+ggoR4KCYw9+hVjGFKSz3IT460+jWVukA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by SJ0PR11MB4989.namprd11.prod.outlook.com (2603:10b6:a03:2d9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 07:15:07 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%6]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 07:15:07 +0000
Message-ID: <d71f2cd8-e1bf-42ea-bd20-654b0224e613@intel.com>
Date: Wed, 2 Sep 2026 12:44:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] drm/xe/hwmon: expose pwm[1-3]
To: "Purkait, Soham" <soham.purkait@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>
References: <20260717041757.2759084-1-karthik.poosa@intel.com>
 <20260717041757.2759084-5-karthik.poosa@intel.com>
 <b106d161-a6b9-4742-a447-be786619252c@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <b106d161-a6b9-4742-a447-be786619252c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0101.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::15) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|SJ0PR11MB4989:EE_
X-MS-Office365-Filtering-Correlation-Id: a0802f0c-3534-47e0-d3c8-08df08c1ea95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|4143699003|11063799006|6133799003|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: WcHKar2aIY0pniRz+p2qjc99pNZJcDfIElbGVqCisCOktzLcE3//uaD9J0N9Nub1GlUzmY/z+Yr/RfFigZ+Fy50ByZgIiX1ClySiZ+xLvMiNo8Nm8d9SwWNeyvRbkK1YybVlCt3mZewPAjitXHEE7Z3oRkhAcxvPJlAtFvKP+aqmmJLMfVJ30TRo1jDc4CZQ2nYOepEeG9wYl9vhccP2pSbS4Vo2z0diZLd9YuWjLmrp4NK10VgbcLBKOjfWxssAQnq+r7CVNG4RO/KcLqQz5B/a1NDA3EXtHmcb7hJzbBpmrFl9OwbbFDwG6ic6M/aFgUqx9463/zxBn2WYhYYy7AJThQZYmLSdcrhhPgDfxdPwUsr98mvrBrJU31MaE9/00JgwjIcR9nMMCnI/7v+9VV96reLSd4JOAVfmLjtAXQ5JvHP7xx1p/35JSyxR2izHWcXonPmO5EtGGOLQn/a3OvWkJ5stosoLy/OnO7e27tJnFPMMN65+f//J4hNu3QYu1lgEJ9mLQ0lZA6pm5pQ2T7sD/X1YJW0h4vcT3s8xuhOk7CfMmI06RTDhSvajYYQjado3eGUP6GYCnqG1aK4ELT6AT9yMT2pCf4xe7AVGffS+l27CVGX+0RS8kFiJ8N2iAmS5ECSNkddcY66aZ+EnXja3+Po0ot0PCwZncZHmdig=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(4143699003)(11063799006)(6133799003)(18002099003)(22082099003)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUE2ZHFKc2h6WU9veVJQdURlYURkS2I5SUtkMElPMnNheWZScytzWGZ1VGYr?=
 =?utf-8?B?aVR1RTVaVkFCa01VSWxDR0ozREdaUVE0UDJ5Ynp6amhEVXN1TG1QMys2MzJj?=
 =?utf-8?B?c2Q0cFkrVCs4b2lPN1RsdE53QTNCSXFYZSsrdnA3UVR1djh5WW8rSEtnK1Zv?=
 =?utf-8?B?VVZubUdLS2pSVFNsZCtNeXVoZ0V6NlI5VmliSXFXcFdQYUxVUnFIZ2NDNXB5?=
 =?utf-8?B?N2JuMExSUFNSVGJhcmZielphd1YzZExYNERXUlE0MFRaMW9CdldncWt0cVVW?=
 =?utf-8?B?UGtjeVJvamZHY2hWdjQ5N08zTHNmS28wQ245bmtkYWliRmtyQ0tPQ29NdlhG?=
 =?utf-8?B?MnA1YWI1b0d3dmxOaktCZm95d0RKQkR3WEw2UW9RN3hUVHZ1bjB4MWw1a3Ny?=
 =?utf-8?B?T2QvbGNxYlRHRWtmeElSdWcvVGNKaXJwRnk5aEpqbzlBbUxGdnc0WjdCTEFC?=
 =?utf-8?B?bHNrK0JTd1JUbW5YdTBEMG5hc08vblhJU3grMjlYRDBTeW1Oc0gzOVhHTlQz?=
 =?utf-8?B?aUVBVEh6aDk2akR3Wk5hbmo2dlBQc1pyUEl1dG55ZWM3VXhyeWI4Y01Lb1hl?=
 =?utf-8?B?cXN6blR1SUltQ3lwcjgzYmN4TTJGY0laT2JUTDJHTjBBc1RKWUVkaWxueUk5?=
 =?utf-8?B?QXZueGZmMCtwbDJ2aWo4WWRZT2hIWm93VzcvWEM3NFBKQ2M1K2VhQWgySXhk?=
 =?utf-8?B?b3V4L3FNck5QNWxaOGowV0IvL1V3UmV0MHZqR2FJOUFVSTRETy90dmU4bitY?=
 =?utf-8?B?WEtkQmc4MS9GMGRtN1RKYnpUd1ExK1BsYlhZcVZ6bWRNQitUaE8yVFhxTmo2?=
 =?utf-8?B?dFhadFFyTW1XeTJvTEgrZFIvNWhabExLVjhGK1lQaVhNTGNybVdrWlZoVGpi?=
 =?utf-8?B?VzcwZno5bDZtaFlGTE5qeDBFTG45T0RTVVc5ODdBTDk4L2VNUXFCSWVhRFNy?=
 =?utf-8?B?S3lEZFhzelhLc29Bd2JCWVFDb3BmamNZaUkyQ21xcWlnNElscUthYUNFR2Fy?=
 =?utf-8?B?ZUJ4aW9wMlk0dHNKWHJNeEg1TWlkSFgrVU5qUTVIRUZUdDZDcmZXV1RWM2dJ?=
 =?utf-8?B?Ym8zbHNmOWh6RzNzdk83eDE4cDdPaDZkeUFjdFBnbzIycktIaEhteFlWSURk?=
 =?utf-8?B?Y1lWeXEzSXc1dGg4MUt2Y2RNTjN1YU1EWEhmc1pER3NiNGRVc3h4dWtyRTM0?=
 =?utf-8?B?MUVuRDFXNVhPUDRnQ3ZKYnBSaVFUWGFHTjdYVENGOVoyT0lNSzVzVnJIcW00?=
 =?utf-8?B?SnBuaGU0bkJ4YjZ1MVdxRDJNQnFpUFd2cm9neEYxUkZ0c093OXdlR0tkenJr?=
 =?utf-8?B?cStPRWpaS0tDNUdlcUlzMnZETzZvdTBFRHRpWHBoSUZ0VjRrT1JYb0tZc3Vn?=
 =?utf-8?B?TStpZllRSHp5K0xpbUVOK0FTRmlpT054VFdDQng0bzFCTGorOC9SMFBFeUFN?=
 =?utf-8?B?ay9wVUNma1BYR1J1OEZhYWRhM0llTHFSL0h6Qm5yRW4ra1k4V0lmVUg4dUdx?=
 =?utf-8?B?MjVxa2hBanNqWmlockZFL2RmY3pzcDlScUIzeCtuT2dJZVJ6c1NIdmFKVmtG?=
 =?utf-8?B?TlQrLzdERzFGMWtMU29aTjlJNENublVIOTNWVmNGVE5wdlpvQlRuMmg1QkRp?=
 =?utf-8?B?Qllpd1JQVDdQZml0OG5Yc3BMVEVWbUVPTmMyVVFTWndEZW5JZTBHRWVET2tO?=
 =?utf-8?B?THl3YnpPcGZ6eE1zbnlmQzE4VFFsdzhPSW5uYXYrLzNmeXlZTGFaZHBwTlFw?=
 =?utf-8?B?cFZpdFFsUndtZkpmZTFiN0JoMjJYQURaeU1uaEhJVDVKdXNYM3ZCL0hjZml3?=
 =?utf-8?B?WUZFNjdmcFFQLzlja0I0UHhERVZCWUZiU0R2UGV0T3dRR3RJZ0kvVjJBdktI?=
 =?utf-8?B?RkJhNkw0QnpzNk9zNkh3YWZmOGhUWG9oUjlHZk9BZ3ExZ2pMTlREMXVrbitI?=
 =?utf-8?B?aXEvamRlYXlMNDd4SmNaWjYxd0JwdjYrbCtXUmhHb25ZTmN3WExaVCs2VUFY?=
 =?utf-8?B?LzVidHBZc1RNaythTCtXakhxYUE0dlBhM21oOXRQUHN2VmtWMW4wYlQ5Ritv?=
 =?utf-8?B?aVJKSFo4cjF5UzFpejRVSlNBNTFIWEhST1pHbDBxdmxkU0Q4Ymx1VDYza0Y1?=
 =?utf-8?B?cmNzK0hpUmFMaURUcEhzTURHeXV6bzJBOTdySVgrUEdmc2xkZGhsVDVoTzJL?=
 =?utf-8?B?WElhSkxpdXNWeUF0eWZ6VUJiUnlOYmU2TzJKZlpSNHN6NEdPZ0sxS25HNGFY?=
 =?utf-8?B?bWw4SnVPTm5rUUlpMHRMb3FpVkg4dXZiZGQrWjhWa0dZU0hudmJFRTRvY3gr?=
 =?utf-8?B?UXNlcHZ0Y1BUbUNUaldBRlhERjRkWkEySTNScncrdW44YTFja3I4UT09?=
X-Exchange-RoutingPolicyChecked: Ouk7NWJH6Uaz3sDJj8pHyD2RRn2UUN1BjTUmKjDzFt8HnJ6QE2sy1KPNjJWGYfUK0+95+jkKWuIItwQPXDpdCzOHq2gkwT732DHrVjxx4eFPtpzyvHy02rGDZNeh0PtA4rd4HcQRtvkF6vySLtmSv9WqKifp3wYwW0CHJunofHPCSY/nyezXBpmv+6EEtJoLvzCG3obnqWOnJ5TWZ8PkbCQaWu5lQs5OFgbZKEKCiEJsBlaVNwNYrEUm4Ki6yTfvnRIFDM4j5Is8PtRNHGTHfeletY98QUl7xSazZJCxu+XVLIXb1v1sJGbTxAcEuJ1/AY+asVOw2OF6axPk00Djyg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a0802f0c-3534-47e0-d3c8-08df08c1ea95
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 07:15:07.1730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8HxZk5A2r3d6W4tUCdPZhUB+ud/Vrdrn2oj5zTaQN1OfZOFAcgJU4vwKFVvXX8manx4anUD7GHaYcb+EliyjDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4989
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


On 01-09-2026 11:36, Purkait, Soham wrote:
> Hi Karthik,
>
> On 17-07-2026 09:47, Karthik Poosa wrote:
>> Expose pwm[1-3] fan duty attributes through hwmon.
>>
>> This enables reading and writing user PWM values (0..255) for each
>> available fan channel.
>>
>> Update Xe hwmon ABI documentation for pwm[1-3].
>>
>> This sysfs node can be used for manual control of fan speed,
>> irrespective of fan curve.
>>
>> v2:
>>   - Use xe helpers for dmesg logs.
>>   - Avoid use hwmon->num_fans to get fan count in 
>> xe_hwmon_pwm_is_visible().
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> Assisted-by: Codex:gpt-5-4
>> ---
>>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |   9 +
>>   drivers/gpu/drm/xe/xe_hwmon.c                 | 230 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pcode_api.h             |   3 +
>>   3 files changed, 242 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon 
>> b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> index ec0b94d76e22..7383898890aa 100644
>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> @@ -321,3 +321,12 @@ Description:    RW. Package burst power limit 
>> interval (Tau in PL2/Tau) in
>>           milliseconds over which sustained power is averaged.
>>             Only supported for particular Intel Xe graphics platforms.
>> +
>> +What: /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/pwm[1-3]
>> +Date:           July 2026
>> +KernelVersion:  7.2
>> +Contact:        intel-xe@lists.freedesktop.org
>> +Description:    RW. Target fan PWM duty value in the range 0..255. 0 
>> is zero
>> +                fan speed and 255 is 100% fan speed.
>
> Does zero fan speed means complete stop ? Or will it clamped up to the 
> firmware-reported min_pwm ?

If the platform supports min pwm of 0, driver will set pwm to 0 in the 
hardware,

else it will be clamped to min_pwm.

>
> And does the write only succeeds when pwm_enable == 1 ? if so, kindly 
> also mention the same in the doc.
Yes we can write to pwmX only in manual mode i.e pwm_enable=1
I shall update this in the doc.
>
> Thanks,
> Soham
>
>> +
>> +                Only supported for particular Intel Xe graphics 
>> platforms.
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 769f4d1da83e..d3379727b1a9 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -803,6 +803,7 @@ static const struct hwmon_channel_info * const 
>> hwmon_info[] = {
>>       HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, 
>> HWMON_E_INPUT | HWMON_E_LABEL),
>>       HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_MAX, 
>> HWMON_F_INPUT | HWMON_F_MAX,
>>                  HWMON_F_INPUT | HWMON_F_MAX),
>> +    HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT, HWMON_PWM_INPUT, 
>> HWMON_PWM_INPUT),
>>       NULL
>>   };
>>   @@ -928,6 +929,158 @@ static int xe_hwmon_get_num_fans(const struct 
>> xe_hwmon *hwmon, u32 *num_fans)
>>       return 0;
>>   }
>>   +static int xe_hwmon_get_fan_point_count(struct xe_hwmon *hwmon, u8 
>> fan, u32 *point_count,
>> +                    int table_type)
>> +{
>> +    int ret;
>> +
>> +    ret = xe_hwmon_pcode_read_fan_control(hwmon,
>> +                          (table_type == USER_FAN_TABLE) ?
>> +                          FSC_READ_USER_FAN_CONTROL_POINTS :
>> +                          FSC_READ_STOCK_FAN_CONTROL_POINTS,
>> +                          fan, point_count);
>> +    if (ret) {
>> +        xe_err(hwmon->xe, "failed to read fan %d %s point count, 
>> ret=%d\n", fan,
>> +               (table_type == USER_FAN_TABLE) ? "user" : "stock", ret);
>> +        return ret;
>> +    }
>> +
>> +    xe_dbg(hwmon->xe, "fan %d %s point count read as %u\n", fan,
>> +           (table_type == USER_FAN_TABLE) ? "user" : "stock", 
>> *point_count);
>> +
>> +    return 0;
>> +}
>> +
>> +static int xe_hwmon_write_user_fan_point(struct xe_hwmon *hwmon, u8 
>> fan, u8 point, u8 temp,
>> +                     u8 speed)
>> +{
>> +    struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> +    u16 user_fcp_raw = FIELD_PREP(FAN_CONTROL_POINT_TEMP_MASK, temp) |
>> +             FIELD_PREP(FAN_CONTROL_POINT_SPEED_MASK, speed);
>> +    int ret;
>> +
>> +    ret = xe_pcode_write_timeout(root_tile,
>> +                     PCODE_MBOX(FAN_SPEED_CONTROL, 
>> FSC_WRITE_FAN_TABLE, fan),
>> +                    (u32)user_fcp_raw, 
>> XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
>> +    if (ret)
>> +        xe_dbg(hwmon->xe,
>> +               "failed to write fan %d user point %d temp %u, speed 
>> %u %%, ret=%d\n",
>> +               fan, point, temp, speed, ret);
>> +
>> +    return ret;
>> +}
>> +
>> +static int xe_hwmon_activate_user_fan_table(struct xe_hwmon *hwmon, 
>> u8 fan,
>> +                        bool is_full_speed, enum fan_table_type 
>> table_source)
>> +{
>> +    struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> +    struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
>> +    u32 point_count;
>> +    int ret;
>> +    int point;
>> +    struct fan_table *source_table = &fi->fan_table[table_source];
>> +
>> +    xe_dbg(hwmon->xe, "activating fan %d user table from %s 
>> table\n", fan,
>> +           (table_source == USER_FAN_TABLE) ? "user" : "stock");
>> +
>> +    point_count = source_table->fan_control_point_count;
>> +
>> +    if (!point_count) {
>> +        xe_err(hwmon->xe,
>> +               "fan %d %s table point count is 0, cannot activate 
>> user table\n", fan,
>> +               (table_source == USER_FAN_TABLE) ? "user" : "stock");
>> +        return -ENODATA;
>> +    }
>> +
>> +    for (point = 0; point < point_count; point++) {
>> +        u8 temp = source_table->fcp[point].temp;
>> +        u8 speed = is_full_speed ? 100 : max_t(u8, 
>> source_table->fcp[point].speed,
>> +                        min_t(u32, fi->min_pwm, U8_MAX));
>> +
>> +        ret = xe_hwmon_write_user_fan_point(hwmon, fan, point, temp, 
>> speed);
>> +        if (ret)
>> +            return ret;
>> +
>> +        if (table_source == STOCK_FAN_TABLE) {
>> +            /* Update user table cache with stock table values */
>> +            fi->fan_table[USER_FAN_TABLE].fcp[point].temp = temp;
>> +            fi->fan_table[USER_FAN_TABLE].fcp[point].speed = speed;
>> +        }
>> +        if (is_full_speed)
>> +            fi->fan_table[USER_FAN_TABLE].fcp[point].speed = speed;
>> +    }
>> +
>> +    ret = xe_pcode_write_timeout(root_tile,
>> +                     PCODE_MBOX(FAN_SPEED_CONTROL,
>> +                        FSC_WRITE_NUM_FAN_CONTROL_POINTS, fan),
>> +                     point_count, XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
>> +    if (ret) {
>> +        xe_dbg(hwmon->xe, "failed to write fan %d user table, 
>> ret=%d\n", fan, ret);
>> +        return ret;
>> +    }
>> +
>> +    /* Verify if all the user points are set */
>> +    ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, 
>> USER_FAN_TABLE);
>> +    if (ret) {
>> +        xe_err(hwmon->xe,
>> +               "failed to read fan %d user table point count, 
>> ret=%d\n", fan, ret);
>> +        return ret;
>> +    }
>> +    if (point_count != source_table->fan_control_point_count) {
>> +        xe_err(hwmon->xe, "fan %d user table point count mismatch, 
>> expected %u, got %u\n",
>> +               fan, source_table->fan_control_point_count, 
>> point_count);
>> +        return -EIO;
>> +    }
>> +
>> +    fi->fan_table[USER_FAN_TABLE].fan_control_point_count = 
>> point_count;
>> +
>> +    return 0;
>> +}
>> +
>> +static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, 
>> u8 pwm)
>> +{
>> +    struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> +    struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
>> +    u32 point_count = 
>> fi->fan_table[USER_FAN_TABLE].fan_control_point_count;
>> +    u8 clamped_pwm;
>> +    int ret;
>> +    int point;
>> +
>> +    /* Read user table fan point count, if it is not set, activate 
>> the user table */
>> +    ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, 
>> USER_FAN_TABLE);
>> +    if (ret)
>> +        return ret;
>> +
>> +    if (!point_count) {
>> +        xe_dbg(hwmon->xe, "fan %d user table not set, activating 
>> it\n", fan);
>> +        ret = xe_hwmon_activate_user_fan_table(hwmon, fan, false, 
>> STOCK_FAN_TABLE);
>> +        if (ret)
>> +            return ret;
>> +    }
>> +
>> +    pwm = DIV_ROUND_CLOSEST(pwm * 100, U8_MAX);
>> +    clamped_pwm = max_t(u8, pwm, min_t(u32, fi->min_pwm, U8_MAX));
>> +
>> +    for (point = 0; point < point_count; point++) {
>> +        u8 temp = fi->fan_table[USER_FAN_TABLE].fcp[point].temp;
>> +
>> +        ret = xe_hwmon_write_user_fan_point(hwmon, fan, point, temp, 
>> clamped_pwm);
>> +        if (ret)
>> +            return ret;
>> +
>> +        fi->fan_table[USER_FAN_TABLE].fcp[point].speed = clamped_pwm;
>> +    }
>> +
>> +    ret = xe_pcode_write(root_tile,
>> +                 PCODE_MBOX(FAN_SPEED_CONTROL, 
>> FSC_WRITE_NUM_FAN_CONTROL_POINTS, fan),
>> +                 point_count);
>> +    if (ret) {
>> +        xe_dbg(hwmon->xe, "failed to update fan %d user table count, 
>> ret=%d\n", fan, ret);
>> +        return ret;
>> +    }
>> +    return 0;
>> +}
>> +
>>   static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
>>   {
>>       struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> @@ -1424,6 +1577,20 @@ xe_hwmon_fan_is_visible(struct xe_hwmon 
>> *hwmon, u32 attr, int channel)
>>       }
>>   }
>>   +static umode_t
>> +xe_hwmon_pwm_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>> +{
>> +    if (!hwmon->xe->info.has_fan_control || channel >= hwmon->num_fans)
>> +        return 0;
>> +
>> +    switch (attr) {
>> +    case hwmon_pwm_input:
>> +        return 0644;
>> +    default:
>> +        return 0;
>> +    }
>> +}
>> +
>>   static int
>>   xe_hwmon_fan_input_read(struct xe_hwmon *hwmon, int channel, long 
>> *val)
>>   {
>> @@ -1478,6 +1645,62 @@ xe_hwmon_fan_read(struct xe_hwmon *hwmon, u32 
>> attr, int channel, long *val)
>>       }
>>   }
>>   +static int
>> +xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr, int channel, 
>> long *val)
>> +{
>> +    struct xe_hwmon_fan_info *fi;
>> +    int ret = 0;
>> +
>> +    if (channel < 0 || channel >= FAN_MAX)
>> +        return -EINVAL;
>> +
>> +    fi = &hwmon->fi[channel];
>> +
>> +    switch (attr) {
>> +    case hwmon_pwm_input:
>> +        /* Check if user fan table is set else activate it.*/
>> +        if (!fi->fan_table[USER_FAN_TABLE].fan_control_point_count) {
>> +            xe_dbg(hwmon->xe, "fan %d user table not set, activating 
>> it\n", channel);
>> +            ret = xe_hwmon_activate_user_fan_table(hwmon, channel, 
>> false,
>> +                                   STOCK_FAN_TABLE);
>> +            if (ret)
>> +                return ret;
>> +        }
>> +        *val = 
>> DIV_ROUND_CLOSEST(fi->fan_table[USER_FAN_TABLE].fcp[0].speed *
>> +                        U8_MAX,    100);
>> +        return 0;
>> +    default:
>> +        return -EOPNOTSUPP;
>> +    }
>> +}
>> +
>> +static int
>> +xe_hwmon_pwm_write(struct xe_hwmon *hwmon, u32 attr, int channel, 
>> long val)
>> +{
>> +    int ret = 0;
>> +
>> +    if (channel < 0 || channel >= FAN_MAX)
>> +        return -EINVAL;
>> +
>> +    mutex_lock(&hwmon->hwmon_lock);
>> +
>> +    switch (attr) {
>> +    case hwmon_pwm_input:
>> +        if (val < 0 || val > U8_MAX) {
>> +            ret = -EINVAL;
>> +            break;
>> +        }
>> +        ret = xe_hwmon_set_user_fan_pwm(hwmon, channel, (u8)val);
>> +        break;
>> +    default:
>> +        ret = -EOPNOTSUPP;
>> +        break;
>> +    }
>> +    mutex_unlock(&hwmon->hwmon_lock);
>> +
>> +    return ret;
>> +}
>> +
>>   static umode_t
>>   xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>>               u32 attr, int channel)
>> @@ -1504,6 +1727,9 @@ xe_hwmon_is_visible(const void *drvdata, enum 
>> hwmon_sensor_types type,
>>       case hwmon_fan:
>>           ret = xe_hwmon_fan_is_visible(hwmon, attr, channel);
>>           break;
>> +    case hwmon_pwm:
>> +        ret = xe_hwmon_pwm_is_visible(hwmon, attr, channel);
>> +        break;
>>       default:
>>           ret = 0;
>>           break;
>> @@ -1533,6 +1759,8 @@ xe_hwmon_read(struct device *dev, enum 
>> hwmon_sensor_types type, u32 attr,
>>           return xe_hwmon_energy_read(hwmon, attr, channel, val);
>>       case hwmon_fan:
>>           return xe_hwmon_fan_read(hwmon, attr, channel, val);
>> +    case hwmon_pwm:
>> +        return xe_hwmon_pwm_read(hwmon, attr, channel, val);
>>       default:
>>           return -EOPNOTSUPP;
>>       }
>> @@ -1551,6 +1779,8 @@ xe_hwmon_write(struct device *dev, enum 
>> hwmon_sensor_types type, u32 attr,
>>           return xe_hwmon_power_write(hwmon, attr, channel, val);
>>       case hwmon_curr:
>>           return xe_hwmon_curr_write(hwmon, attr, channel, val);
>> +    case hwmon_pwm:
>> +        return xe_hwmon_pwm_write(hwmon, attr, channel, val);
>>       default:
>>           return -EOPNOTSUPP;
>>       }
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h 
>> b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index 419ab4f416fa..5c5fdc650a97 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -84,9 +84,12 @@
>>   #define     PCODE_MBOX_DOMAIN_HBM        0x2
>>     #define   FAN_SPEED_CONTROL            0x7D
>> +#define     FSC_WRITE_NUM_FAN_CONTROL_POINTS    0x0
>> +#define     FSC_WRITE_FAN_TABLE            0x1
>>   #define     FSC_READ_MAX_FAN_RPS        0x3
>>   #define     FSC_READ_NUM_FANS            0x4
>>   #define     FSC_READ_STOCK_FAN_CONTROL_POINTS    0x5
>> +#define     FSC_READ_USER_FAN_CONTROL_POINTS    0x6
>>   #define     FSC_READ_FAN_TABLE            0x7
>>   #define     FAN_CONTROL_POINT_TEMP_MASK        REG_GENMASK(7, 0)
>>   #define     FAN_CONTROL_POINT_SPEED_MASK    REG_GENMASK(15, 8)
