Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA25DC54751
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 08:51:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A389410E40F;
	Wed, 28 Aug 2024 08:51:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ju4Aie5f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E6E10E42D
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 08:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724835100; x=1756371100;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EpFP9FfyfVD+oUQipcT713zAXMgMX29Dgru/1fv09Zo=;
 b=ju4Aie5fUsktCZ8ycCAkHHi9b12+UOXDJLKMvWUs9rxWd2mioYD/Liu9
 3bEEgvqvolLc4kca3cnuGPmye3sW4eKxM+FykaHs+Ql3YYwdeo6IrhmDO
 jbM6gNIeUlrJl/v7lYFxOSQfXyPVmwaMQ0x7YgqAUvgqmoKGIjQ1cWlEt
 ksXEM5xlDD9fMDExjFqwswRc7eqBg9JIzS4uzFvvYkJhgTPctCiylXtnr
 +x4gUBj1TXk+i+yC7z9lbJa8rl/SN1m5yrC0b0OqQpr6cKw2dxq1dagHk
 hhGCPwaAo4F0Xx63xkl7GjAGC/TzZwrQwRXLhHYvDEWuu8Tzv2xBjf1II Q==;
X-CSE-ConnectionGUID: 6xUtDrPeQeen0csLED3J+g==
X-CSE-MsgGUID: QeKPkjcHQI2uacRUGiOXhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="22934205"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="22934205"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 01:51:40 -0700
X-CSE-ConnectionGUID: i92kPPMWTIOL+ddj/N1OOQ==
X-CSE-MsgGUID: ripzikEuSIelhQKSBqfVSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="62999317"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Aug 2024 01:51:40 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 01:51:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 01:51:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 28 Aug 2024 01:51:39 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 28 Aug 2024 01:51:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zBYe8Q619TpQOs2shARadDEXK8TSWLPl5wB9q0eOwdByeqVdJ9vCPkDYGiqkgcLgT4Iq7eoVT6ArNX8EVGM0ss/Z1oNDmE8ygXWTOPDY0XOTC6FB44DJQAV2EFQ/CuHWwjPzbDnj9L37PIwRT3yjFQhm7NEoUL34/+fhSrcqObL3WzZTbyu6otdGg7KR1KfHQfrzCx3MYJ8eO+oEUFJMzw118RtGVbOERqQMqeaVQWnXkTGvo71Ji5U02VXvnE5CfXWRZn/8ctWYeECyWNY8XNwnbMRdtg4DWVA4lPk18lB3XSyQEWYOZcSwL3/U2baaHXNf7v0cQ0GMp6dpiWD8Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/acMPzUxwlYOoTH2YZ99htaABQAEI8Bp3S7hiyRpZpo=;
 b=QyVtC4D7Aw6HewAl9neVelEgxS73DBHXSbGtGkK6lL36/MOf4MEN73mBbL7ndBe8zm534LbQiChSC8llVseVUOKEkImtQIFu6LdvdNF9MelB6OsN3Q/65/MK0zj33gj8uZh063rRywCXsoEcxYvTN1Xnqc2c/Mb/YTqpA6dGPx/j/cXM0OpRtX6Ae2VSldiWtkQRNiNb+of3ADHy+rcyzJTXvTcIy1VcIIfE+3pqRaVNn790u91FIVPxsRolb4DWSPTgIxHW5Yj0cOQoD+EM6RdUTZWrDLh35/lxEdthc/+1YTBTnmJT2rcPR9Ip+ZoNCoSAAz7EAg8tSaUbj+fj+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by LV8PR11MB8487.namprd11.prod.outlook.com (2603:10b6:408:1ed::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Wed, 28 Aug
 2024 08:51:35 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%6]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 08:51:35 +0000
Message-ID: <0de99ad1-7493-4393-a766-c1cc9575beb6@intel.com>
Date: Wed, 28 Aug 2024 14:21:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/xe: Fix NPD in ggtt_node_remove()
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
References: <20240828085436.3604257-1-himal.prasad.ghimiray@intel.com>
 <SJ1PR11MB620461E80EF9E12B4181E06781952@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <SJ1PR11MB6204CE8A6DECEAFB066E08FC81952@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <SJ1PR11MB6204CE8A6DECEAFB066E08FC81952@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0036.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::12) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|LV8PR11MB8487:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c97fc55-6405-4cfd-ef76-08dcc73e9ed7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjhiV1VKRjRzZDdBY0JBWkdqTlhJWnQzcTIwWDljQm41cG9GUzExdVZwK25L?=
 =?utf-8?B?dVBXUGU0R2FxK3lOWTRlcFhkUnVNZXBJSitScGp4RENZYjZ0eHNMdHl0Z0RT?=
 =?utf-8?B?ZVNiNlo1aXh0Zmw1U0dicXQvcXZackt1K0laSTJOTVJFcWo4ZVJOYnBVeC9S?=
 =?utf-8?B?bmFmak53QndCT1NCbmlDZmpsLzdzbGRLekVFeU95M0t3OEFVZWVDRFk4K2hC?=
 =?utf-8?B?Vll6NW11a1ZlbnpCRWNHM3hFMUNjT3pQbWVWL3dVWTk0aUIxYmFmK1JXbEVi?=
 =?utf-8?B?NTJxWDNIb3hzQzlGNUVOMkNDdlgrbm11UnlTRjF1R0N1SGVhRkphZVJFQzla?=
 =?utf-8?B?Vm5LN3A5OTZoZVovcUJodzJEY3ZUbVg5cXVLKzZnaHBualV5SDVhRmJaUnND?=
 =?utf-8?B?emtkRS9xVFZrVTlTZG1QalZPQnZBcmJqNVdvUmNPYWcxbFRXMXh4SFd6Q0E3?=
 =?utf-8?B?UFZpcjFoWm1tWkhPdlBVNTErVHFDNDA2N1piWTJoZXB3RzJLQzh6aGxsRWcy?=
 =?utf-8?B?VXdNa09veFZFZWRPSGlObU1VV1JGeWdlTnZ2ODV3QlRtT1laQ2pPUnFET0Ev?=
 =?utf-8?B?M0lCeEYrMDRMdHp2UnByUVNJSEpyYVJHN1lLSlozdjFHZitneEV1YXhBN2RZ?=
 =?utf-8?B?QmxZYk40N1dWSkNuaDNCN3p4OWJHUCtFMUg4U1JKWVUvRjBRUHdlVlYwc2JR?=
 =?utf-8?B?OTZIbUFxdkpKdHNOMWZtekE2Uk9jWTlyQmJoVDhiRWlCS2RpNEFuU3MxY2c3?=
 =?utf-8?B?MVRRc2gwaXFka05oa0xTalQvWHplbC9QN3dZZmNNa3loVlRVUDluM0dnUHdz?=
 =?utf-8?B?Q3BOMjRqOFpKWUNzRkVlV2FiS2FHQTBWcEpJQWdtOXdVOWsyZXlaN1BEUnIz?=
 =?utf-8?B?QVZ4RFVpMWxsZktkYk5QZjJKZlVMZGc0L2paK2FXUC9mbDdZUlNreEdkcGpD?=
 =?utf-8?B?Rk9KZHk5OGdzZkZRWlNDdkJyYkE3ZThNdTliUEpmaE9FTUdHRUIrSi9Cdno3?=
 =?utf-8?B?V0FOS0lMYk5WV0xkdVh5UWc0TjRoK1Z2Vy85cU9FVUxzT2lKckdFWTlZcVJY?=
 =?utf-8?B?MTNmN1pCZEJ6aE5JZEVtSkxwOURPYmJ2R0Fsd3h2VzBIbzhGV09ydldudHFM?=
 =?utf-8?B?SWlJNjMyaEQvS0RRU2g3RnRCYkNZYlpnRFRESk8yTndmUGZZb3VPUlRIQ3pt?=
 =?utf-8?B?eS8yN2tKNjdHa1kvcm1kc3FNSXhmZmFZcHFvRHRJUWI0SkxvN1EwV3liOHFG?=
 =?utf-8?B?N0wrQUoxVjA2cStjNTVrUmN4Y0pNTTBQbkc5eWtyaG1YalF6dFJJNXlqZ25L?=
 =?utf-8?B?MnVBWXFsbyt6N1FGSjBSTU8yYTFSRDNDWElJbTQ3NE00WFNNM0J3MnFYQ1N2?=
 =?utf-8?B?czhybFUxaUpIY1djSWpSVVJxMXptOGxIYXZmQTNSLzRNT0pwc2RzckN1elVs?=
 =?utf-8?B?Y20yYnVOK2YyQWJPckFKN0RLUFFCREdzZGlvcVMrazJ0dHVqNENVc01ndVFM?=
 =?utf-8?B?U3k5cm5GcThoN3U3M2dXRUJUbHZoT1kzbzlsQ3NVKzNMRjlJUHhEUzNFU0N4?=
 =?utf-8?B?MSszRWpHTWRZcEQ4NlI0TnRQREltdG9QZGJIUDlSVjhyeUdCUGVJMkRaZEU0?=
 =?utf-8?B?ZlhBY2t0cXJYTlVGY21rRlBLOXZBUnluUXJIUGxMTnF6S0tQbWRjY3ppcExP?=
 =?utf-8?B?Tm9iSkV2WFc4OUJpR3YyOWJ4cUVwU0RzMXFBT2oxQUhKbnRmSkZuK0R5dUxV?=
 =?utf-8?B?cTBTVW1leUpWWVZ4VkpmdnEyTkpkbmZiYUpjUW84NFJhRGx4N01oSVBkZVVl?=
 =?utf-8?B?WFBjMDhac1dQUlJZbEtyQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjJtWDMvM3RzVy93U2lQZ213R3p6VTI1eEpJdU9KY2VhTEpSL2JjMEUwWEVz?=
 =?utf-8?B?ODlwNEx5eHlXUERHYlJvSmFLVzlpY2ZORVNCZlNhNm95cXlyaEs1bHREMGZN?=
 =?utf-8?B?ZTA1cmtZZ3BhOVpabTRpaEk5SW1kQkx6bWdHdlFlVEpSUXRwenBUaG1UVVkz?=
 =?utf-8?B?MjJoVnI1ZS9nTDhONlFueXlDdUZzOE1WOGN1ckNhZDhtdHdxOUVQNzhTUWJr?=
 =?utf-8?B?bm5mQ0JsZWY3Z3Z5OE5FVlNKajFabG1IMHZ4bjNsNVphSkJiWFBMeGQ3NkMr?=
 =?utf-8?B?SS9mMXlsTFZTZUlJNzBjWEZCRWhpL3JhNDdZQjNHTmdrakdpQlhDSlpOemVh?=
 =?utf-8?B?SXhRWnVwa05pNkU2clY3SDR5R0lKbllGcUV4dDk0aEYvQSttd0hEYmVaSXlL?=
 =?utf-8?B?YkdaRm0zS3hvWndwd3JUZmpSVDFvWGVQb2poVC9IMDhnaFc5S2hIVjdGVVg0?=
 =?utf-8?B?VjlQajkyUHhaN05ROStrZDUxeHlieUxEN3MrcXkyQTd2ZHovb3V1ckhpT0Qx?=
 =?utf-8?B?LzhCY01jK2c2SEVtcS9SeTZFcERpR0dRT0lZSWFwNllKYzNyS2Zsa3BBRXdV?=
 =?utf-8?B?cE5JVS9NdEZ0NUdGMzVUNmd5STBLbkl1UnpROU50RnlyQWJ6VmN1cTVyQW02?=
 =?utf-8?B?am9sY21kNFpPQ01meEphUVFZVk1QV1BHWisxMExjT2pUSS9aRzliNUwxOWlC?=
 =?utf-8?B?VjhaV2ZFZVhSSGRIY3hKTmI2UDJPRjU2Y1YvaDFtNnhzSEd6NXBLcjJ1cFZ0?=
 =?utf-8?B?bERPenVjbTdJQVAvdUhYNGo5T3I2K0h6cWVtc2Z3Vlp0bnFIZDZOeTA5TVF6?=
 =?utf-8?B?QUF0NlYxYW9ncGpFdGYxUEthWlBTZWgrdnBRWXpWSzFiN1A1d25vVENhWGZE?=
 =?utf-8?B?QXdRMVdWVWFJZnRveWE1d1RHVVJDZmRjRE9PL2ZmRjliZmErdWtTT0xFektL?=
 =?utf-8?B?ckdKalcvenUydkJ1UjNteUxzelhkWGtwMUltakVmbktCUGE1eWF4WEl1QXYr?=
 =?utf-8?B?OVdqRllSazFBbU9XTW8zRU9qU2JXWnRhL0ozdzBGQUt6VS82bFdyOHNLLzdj?=
 =?utf-8?B?aDR5RzdYR2pOQ3E2dE5Kbk9XVXg3dm5YQk5EOGRqSUh6ZGhUWFNiS0V1REdZ?=
 =?utf-8?B?ZGRlZ2NtYmc0YmtHSCtZVTZrbnM5SGNleTg5a25RV21uVVFkcnVIQ1dlMzZS?=
 =?utf-8?B?dVI3NnhMcDFOQVNwV1FMY2ZvZnp0aFBVdkhyNzVlalhRQTljcXdHOUh5RzJT?=
 =?utf-8?B?YlNrcXZoNUlWSndDazZJWVBjbzYwNXJIWVFMNkVqbDdsNGpvUkdMOGljUUV0?=
 =?utf-8?B?Y0I4YjZvczJpRUgzVHl6elBDOUI4VlMreDMvN1RQaEI3M090eUQxbTl3MWMy?=
 =?utf-8?B?bEwrZkh0cWI0dmJETTlvV3hKRWsvNUZvTm91VkFUUWVsaVpvdzBTbXBhZVdy?=
 =?utf-8?B?b2JVSHlKT0NzNjYwdmlySDd3U2pnSkgvM3lQVjVDb3l6cnFtT29zdCtzYmhs?=
 =?utf-8?B?ejBOdmZsQmdCY0s2cExjQTZlRHU0a0xVbUhiamlmR0JKbk5xRHZqSExXUmkv?=
 =?utf-8?B?Y3k5Uk5tUndOYlF4YXpWQjhOZWhMcGNmcE1OemdVTUdYa09ETTFQd3grLzVJ?=
 =?utf-8?B?MnNlb1NnempFbVAzWDNHdzNER3laUG5VYS9uUTU2T0l6UnlZUmRDaW1XR0Zj?=
 =?utf-8?B?UC91MjV0a3c3dTBQOGpvaFBiZ000MUlVbnF3ci80SnBRVnpueHo1QzdscVBq?=
 =?utf-8?B?YnpLcGpDWURabEEwMURmbjVMcDRxYWlyc0JLMWhZTVpaSzdVNk9hNHFCQ2xk?=
 =?utf-8?B?cnVVN2h6QTRWRkI1ekxFc3BjYlcxTVJEWUQ1K0ZrRjRHMkJveTNnV0k1UXlz?=
 =?utf-8?B?STAxVFFaK1Y1dVAyNkh4dlFLVDl6Wk5RUkkxM1VHTG9qdGlFWE1uYTAvQjVC?=
 =?utf-8?B?dVhRRDU3L1lWVEN1ZkFSZFRmemxQM0Iybk90YkhyK1dFbjRVOXRTZkNKOEs3?=
 =?utf-8?B?YWR0Si81VmFSeXlaYlpPWi9JWEVFTS9ubFJBZXd6T3dNOHV3WWlpQ1pzZ0M5?=
 =?utf-8?B?bUhEMDJpYi9ORHhhYW9NbWt0dUkwbGhENlVac0tGT0p4QlBmcWs1UXdlYnFo?=
 =?utf-8?B?eW92bTB6UmpyeVoydDlQWE9YN1k0eXNWMkZpTS9zazR1empVMVlOVDdvQzhF?=
 =?utf-8?Q?DWkBLGrHPCpBpDWxXWo/O4Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c97fc55-6405-4cfd-ef76-08dcc73e9ed7
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 08:51:34.9432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FHfC9k7orofnDB+m2qqakgJW9boJL1JXKnWkc0LcP17qGUK91Yk5a/G3W+p+OfJ2bEqScGchWhdAQxGhyvndTmSsvlfdrHN9LXxVLkoBSes=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8487
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



On 28-08-2024 14:20, Upadhyay, Tejas wrote:
> 
> 
>> -----Original Message-----
>> From: Upadhyay, Tejas
>> Sent: Wednesday, August 28, 2024 2:13 PM
>> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; De Marchi, Lucas
>> <lucas.demarchi@intel.com>
>> Subject: RE: [PATCH 1/1] drm/xe: Fix NPD in ggtt_node_remove()
>>
>>
>>
>>> -----Original Message-----
>>> From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
>>> Sent: Wednesday, August 28, 2024 2:25 PM
>>> To: intel-xe@lists.freedesktop.org
>>> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Vivi,
>>> Rodrigo <rodrigo.vivi@intel.com>; De Marchi, Lucas
>>> <lucas.demarchi@intel.com>; Upadhyay, Tejas <tejas.upadhyay@intel.com>
>>> Subject: [PATCH 1/1] drm/xe: Fix NPD in ggtt_node_remove()
>>>
>>> Make sure that ggtt_node_remove() is invoked only if both node and
>>> ggtt are not null. Move the null checks to the caller function
>> xe_ggtt_node_remove().
>>>
>>> Fixes: 919bb54e989c ("drm/xe: Fix missing runtime outer protection for
>>> ggtt_remove_node")
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_ggtt.c | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c
>>> b/drivers/gpu/drm/xe/xe_ggtt.c index 86fc6afa43bd..2fa8a22ebbf9 100644
>>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>>> @@ -286,9 +286,6 @@ static void ggtt_node_remove(struct xe_ggtt_node
>>> *node)
>>>   	bool bound;
>>>   	int idx;
>>>
>>> -	if (!node || !node->ggtt)
>>> -		return;
>>> -
>>>   	bound = drm_dev_enter(&xe->drm, &idx);
>>>
>>>   	mutex_lock(&ggtt->lock);
>>> @@ -328,6 +325,9 @@ static void ggtt_node_remove_work_func(struct
>>> work_struct *work)
>>>    */
>>>   void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate)
>>> {
>>> +	if (!node || !node->ggtt)
>>> +		return;
>>> +
>>
>> I think better to declare and assign after NULL check. Something like below,
>> struct xe_ggtt *ggtt; struct xe_device *xe; ....
>> ....
>> if (!node || !node->ggtt)
>>           return;
>> ggtt = node->ggtt;
>> xe = tile_to_xe(ggtt->tile);

Sure.

>>
> 
> With that,
> Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> 
>> Thanks,
>> Tejas
>>>   	struct xe_ggtt *ggtt = node->ggtt;
>>>   	struct xe_device *xe = tile_to_xe(ggtt->tile);
>>>
>>> --
>>> 2.34.1
> 
