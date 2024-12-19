Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D032BE77184
	for <intel-xe@archiver.kernel.org>; Thu, 19 Dec 2024 21:06:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8596A10E2AB;
	Thu, 19 Dec 2024 21:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CVplkZmO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C4010E2AB
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Dec 2024 21:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734642407; x=1766178407;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wZS3Px0nkkY2Fcn1Wr6J7MXKiaBLadwhqvVnGOJ4jYw=;
 b=CVplkZmOENndRE9waCIMu3MXQBXnTBkWQ+5+KZKMSeJklOTIKxPtcV1T
 XOChiW6T1Vj8zTpFxl9i/6nblrQqQaRk/qV/VHxkXEgo8DQo5HI+/+YS4
 S2EVMReqjBF5T/wUhFwRignp/QcfQFDByAgp+hABFCitZ+CPMP0EAUmjO
 jc4ld52oqb1zxiNGQFKvHzT1ZJjzcDXwW5gFoqD1WDXsDIBauHnEGWAKy
 ZMTHNqS9g+o/ADHpX4n/EVDuykdVfPXwbVb4cpxVecMAxz/wXU9HhMAOy
 j7D6/Zic4jC5XB8PV7CToCPLY2rUyQmvWHwsGyJiUAHgeWFvq4EIKdesW w==;
X-CSE-ConnectionGUID: EZCYGk0URMGy+lg0YAEN4g==
X-CSE-MsgGUID: oBvqGH3jSP+mHthdZ5g0gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="52587430"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="52587430"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 13:06:47 -0800
X-CSE-ConnectionGUID: 0P0UHl/0TmasjqFo0vSIQg==
X-CSE-MsgGUID: vox5uKKRTu6i2s8Q03r2RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="98709985"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2024 13:06:47 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 13:06:46 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 13:06:46 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 13:06:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=atw0Hm4yijlg0zhXJA0OEe/SbsocRWl8aCvNP5FAToCK2UuS7+Qw7QrTX2DEYWvsg6p3M9I/zeZNrHHedfhDHIrGXLqyPSYnLSQc+KBCgpzivspqvIaT3pjHqUdP3fVDBSt3RpqSxmszdWjTSLilQ8Jy1jCnM+HacOUlarlZXBPCDmd8jM4ejSod84Z/jvYSGFoTfoe25J1Fr7nUqfvrFTLolwt+3mXLQIn8w/8frSv7+ecwaZOlr4f8UZJIjQMFwJxH9ZI/M/i5lvBppSnrKNPm7fhnCxLcaU76qlh1aJrOYQyDd5LAKFhU0IGg1euXfITGS83ejI+t3gtOCxO8tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YENsj4iwaCXKy+4YwBWebTWDz9/WYHBAMmDIJZo+qV8=;
 b=uo3GqAquVe4tjWE8cRooC3jnFVWkCEJALrTeKIRErldBsEhn5cggvwjRFVNRKsE8Rb5R9zgIXBI/lsUU+wNbQymoKTredl/utL/D+9FQjLH0HDWD0h3Er7pQrjkPh5rR9kxdGI4ZhavlbMhfIuiZLOM52LKLMH28sx0yIrRuJ0sd4eFFfZh47H+aiGDIVZNLm8qx7Uho4tE3hGazgGqgyMQ6Usc1u+gXfc4riHuVF2cA2yshljcsofL3ISPvd6faJC/J40xQYvHElIGZLTMPgJBdWCZNKfjhrtkYFWwFBcwdsaCSRcUQjt+Cx6NaZg1Nagee0cUgKA31PiiFOf6ZLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH7PR11MB6500.namprd11.prod.outlook.com (2603:10b6:510:213::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 21:06:30 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 21:06:30 +0000
Message-ID: <3b515ac4-9404-458d-a734-831d84accff2@intel.com>
Date: Thu, 19 Dec 2024 13:06:28 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/gsc: Make GSCCS disabling message less alarming
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Eero Tamminen <eero.t.tamminen@intel.com>
References: <20241219010924.2466333-1-daniele.ceraolospurio@intel.com>
 <d7eca832-4b1d-4622-894d-c8d99e0dd39f@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <d7eca832-4b1d-4622-894d-c8d99e0dd39f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::22) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH7PR11MB6500:EE_
X-MS-Office365-Filtering-Correlation-Id: 322d26e3-629a-40ca-4a70-08dd2071025a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmxHTk1PYzY2NUFPakNldDQ5bE1ubXlZMnh0YUQ3MU9aYU45VTRPYmh4OVl2?=
 =?utf-8?B?T1BuanByTmsxWjIraEkrZ05WQ3MybmE2cndWay9ITHlpbTlYRWMrOHNScCtr?=
 =?utf-8?B?NW9MaVdsWWpNazA0TUZGay9sTyt4L2NtZjNUQWdGQk9qdGE1ZlNJVXVlZHF1?=
 =?utf-8?B?N0huY3AyNU5qbWRWSFhIQ1Z4clQ1clhsT2drSjdRVHNXNTF1ZHhxZWQrSU1p?=
 =?utf-8?B?TUVhcW0rL0MyRTcvM0hYOWNpeE5pZzVKbjhnT0t0Y3h3eXJjOGRGVWgrQk4w?=
 =?utf-8?B?L0VlTEw3eStiWnhyY1JuR2lwa05IMllmTEJFZnVFMm1oQTdKL2ZNMjFLRFkr?=
 =?utf-8?B?TTBuSzdONllQRTkyemQwWnRSMytuM2ZuUjJHN3FLa1k2QzdFeHVZa0JQYXkw?=
 =?utf-8?B?ZnlKbWR4WXQyaGR3aHFhTDJiZFpyRGoxMHpnOGttY2c2UWNuWXk5NDZyejFt?=
 =?utf-8?B?dTJObVlDd2YrWHk2cmtFQXlDUDVJcUQ5WTcweThYMFF5WDEvVHhIOStzTW5p?=
 =?utf-8?B?aDJva3ZTaVd3K3FLbjFyU21lc3V1SFZsT1VjdXgzcHQxb05taS85am9FSm5U?=
 =?utf-8?B?bkY5a3ByOFUycWFiNW1Kb0xWZ085bFRYTjZHZFRNVGhoWjA0YVVKa2JhTjdZ?=
 =?utf-8?B?bWdIckVwaVZONW9jVERpcml2SEZtQ3ZoRE5DZk5nSXBodlB0bDJhckRNd1gy?=
 =?utf-8?B?eW9veGwwd21adXhEK2JFNTZnVHdYcUc0aU1yaDJVVzJ2bGMxOTdHaUJzRGMz?=
 =?utf-8?B?cm0wQkt5UDZScC9iTjVyRlhERnQ0cXdrV2pBaHVHTTlpZmtROCtvWlhjam1s?=
 =?utf-8?B?eUVxK2hXaHViTmV1SW9GMTcwZklkUXFSNiswUm5nWGxFaG5zTmN1UHZGMjU5?=
 =?utf-8?B?TTlEWTVaaFJGUm1IRTJvTmhsRXNWRmZsWi9acUJlRUVhSlRzQ1BJRFF6dmt0?=
 =?utf-8?B?a0JLa1B6OE9RQW0zR1FBMlJmSk1VUVBvRlU0SUlTSVkyQ1g3bldXZG0wUHAx?=
 =?utf-8?B?NkUrbWV3MnJkQzZlSFRDTFdwcXVjMFJUUDdBU3F4RWxUZWRVMjNiWjV4RGRN?=
 =?utf-8?B?R3c1TWR1SHQySUFodERRUVZIYXFEWWEyV1dpUlVqU0xOZkoyYmhnU1g2d3VK?=
 =?utf-8?B?Vlk3UXNoMVNXaDdLUkZXOHhDUlZqSlFSVDF6SGRVb2JNSG1MNWVnR2VEaDUx?=
 =?utf-8?B?bXMwQzNmRFFldHlpZERwTXdoZGVDSjIzUG5CRHFsTTdWV3pnSzdRa054NnhB?=
 =?utf-8?B?Y0twdVo5TTRFaWY3QUxJOUExMDFZeTloV2NZWTcvZmU0Y1k2bXd4S2RDV2JH?=
 =?utf-8?B?MGJzNFlTdW1HL24rbU1FL2FjSk81UmlFZGppUFo3ZmVJYzVmSW5vb2ZJMXRQ?=
 =?utf-8?B?ZzFJeDczYUpOZ3lqZTRZSitvdUdwUXgremZBMlo5dTErZERPMjdTdk5OUk5R?=
 =?utf-8?B?MmZ4ZVVvNFZkSWpXY01SMGFSYWovbG9BMkQrOEVxN0haV1Rtam5MQVdoK1FE?=
 =?utf-8?B?M1cwSUExMjFaUWp6KzZCYURWZ1k1Z054aWRXZWFJaDh6YjV6bmhTQmkxSGYv?=
 =?utf-8?B?dklrOEo5OTgzRjdyeWowOTBpVENVS0hFbjQrYWw0ckFiWVcvb3ZWWklzSHZC?=
 =?utf-8?B?VEtweUlMZlB1T3BBVTY1NEhCRFI2UWlxR0JWWCsvNFpSLzA2MTJqaGVQaUI0?=
 =?utf-8?B?MXBoVXJobHM4S21sMlFZbXFNZVQ4SU5lRmo2Qkg3LzZncm5FeTk2cFE0NlF4?=
 =?utf-8?B?WXdmREJlTktPd09PZmp3RmY1VmVOQ3lqVHczbzJRZUhnQTR6WE5PRU9LeFBC?=
 =?utf-8?B?MVVPQk9mK0ZmQzByZ2lLUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmlPSCtYSU9CdVYvK2oyVndYa2RTWThkbnJrRHkxYmpHMjZBb3VCbFVvcVR4?=
 =?utf-8?B?d0pmYWVGYU9mQ2lBZUlqYXB0djdhYVR6dzliUVFDWXo5R2pJWWRpdDQ5R0Z0?=
 =?utf-8?B?WkhKS28zcGtTemh1ZUM3bExGRHFiZzRNQWVUSDBGZE1FUi9La3lSOEVvR1R4?=
 =?utf-8?B?dzdDQ09JSEM2NXZ0T0VRQ051TmZnSmJLM09QUzNpN0U1ekZ0VWxvTW9xbUJy?=
 =?utf-8?B?QjlNbCtNTElvWVhEdndlRjZYeStUcTBQRm9nRDZmaDZVYWt5OThrdDdzWjJD?=
 =?utf-8?B?dTB0TEdCcjA3MkZwZzl0VDdIWE5ReWRYbkNpUTJSMm5obVgvOHpDZkZUTXpD?=
 =?utf-8?B?NmxYcGVlSlRhNThEVzVmUDU1a1BRMkJnSzhaTnZRaGJHcm53VVRXajM2cndu?=
 =?utf-8?B?c3FNT2dkelQrWG51dEhFVmdVN0dxdmV4a0ljSVRXR04yZkNmTmxFTnhkYlRZ?=
 =?utf-8?B?WFlHL1ZWUThTUThVUEVWTFlPRW8xam1VMWNQajI5NWJIUk9tY0Y2YmltQTdZ?=
 =?utf-8?B?bUEwS1JBdXBkYUdxMDRJWmsyUlJoWmIxaUdxM1czeDB3dVRhOTBScFQ1S0xm?=
 =?utf-8?B?bWJhTmc4Y21NUFRFM1kzR1hKaGNKK1hYMkllQ2RPNE91eUJCUFJSWk11eUtJ?=
 =?utf-8?B?ZEtTU2ZJcFM3QTJhNXNGWGJudVcvNjg2QVV6dDBvejFVVzZBWDRWOFJVRWxr?=
 =?utf-8?B?aEwySDFmNHU5WEZ6amZhWXFpc3BZZWdUY051b0V2bTFLek5XZHM1MkxTeTRF?=
 =?utf-8?B?UmlPVlFINFlJK25TNkxOenlXb2JyRjZIZjFDR0w1RG1EUnVzUlROWHU5WlVB?=
 =?utf-8?B?QU4zcXBZVjRLSlAwQ2Zoc0g3OEpzR2F1S0lTZHBzNXRQa29mZXduanl0S1JY?=
 =?utf-8?B?V25iT3d5SGtJeHhOb0krckorVkhMSUsvYWNWRVZ3N3l5QXhhVnlvQzFtTzRW?=
 =?utf-8?B?NGQvbEdJd1lKNDk1ekZ3eCtadElPQmhwMytwOTh1OTFMRTZwMUVqU1RPeDFN?=
 =?utf-8?B?VXY1a1BRL3IwdmRXNGtzRzdWOTZ5dnNveVQrQS9hc2J6UTVvaS82Tzhqak55?=
 =?utf-8?B?VEY0SXdMb2hEazNNbVdYWWVnSGozclpFWjhad3FyTmNCQWpHNmFaTFdTY0I5?=
 =?utf-8?B?OXlrNlJCWllDZ0xxdSs3MFZpT3dMQnJHTUJpay9lM3lTZnVaRDNNbGxVMGdL?=
 =?utf-8?B?djBIOGdMQ2h4RVBoWEhCYWZsOU1GNVUyWG5sSkZlay9CY3VEalBjU0RUZ3Jt?=
 =?utf-8?B?RXRiSWgzbWF4S0RPQ045ekp6TkJ5YXcrbFNXZlc0ZitEcEVvd2ZXbkE1eXdF?=
 =?utf-8?B?bkhwZzNuQ0xjRGpjQ005Ulk5aUpyeEF5RU5yeGpyeUdBL2lGL3NPcTc4bEZX?=
 =?utf-8?B?ZHh1Z3l6aGR3RUlhZy9CKzFQZ1hPVFFFbUpWZXJzdU44SnQyWkZYemhpTDhX?=
 =?utf-8?B?RzVmL3J2RG0vZkw2bDNnNzRGRk1jdkw5ZjFPek56S3hYTXo3cHB1Wnp3TVJD?=
 =?utf-8?B?RE8yU0grUTQ5eTFTWlJUNU1KeDlpUHkzVVJiN3A1cm8vZjNITFBmcVZVdzhK?=
 =?utf-8?B?aWJBNHRsSHJSdVFiZUFnQXE3OXJJOSt5bUd3ZFVTZTBZM2JrQ1FYOEc1eDhI?=
 =?utf-8?B?c0V6NHRHZ0gxYTVhSVJhZ3Zkb2Z0em1xaWNHenRjdEptdUFnRGd5OUZPeEtT?=
 =?utf-8?B?VHRCOGtwRHJXWVpacFphTm1ZYTZ4RmY4Vk94ZFhHSW92UmthWVRGVk95ZUVT?=
 =?utf-8?B?V1Rkc3BRdW9OTHZUNE0xMzFMeDUvZ1YvakhuOFQzOHZYRGFHVkVtb2p2N0pO?=
 =?utf-8?B?Um9TNXc4bWMrNDUwQUlUZi9kQ2lrRFdYUlZjbnhSV2dmR1FOODhVMXg4SytX?=
 =?utf-8?B?TitxSUd6UHRTNHBMYlhSU281ZkFEOEd3LzA0aXNjQ0pYM1lEU1lQdXFKTU1u?=
 =?utf-8?B?M2M4amVlM3QyalBlOHFKbExOUi9wNlBzNTNGL2F4aW4za2txVmY0dkE2THM4?=
 =?utf-8?B?R2hHRWFiUi9BTnhnU3BQZWVEaTdBSFNlbktsUmxiejVEOS93R3lmc0NReVV6?=
 =?utf-8?B?L0I2V0l0OGQzd3g2M1JyVGZpZkU3dGsxTmhwMnB6cW02VUMrTWhQMGJXNTJx?=
 =?utf-8?B?Rk9uSENqSy96M1pWZUZ0TXJtSExsTkJTRXZsb0FJc0ZtbUVLS1hVNkNTbUpq?=
 =?utf-8?Q?vBFBrm41YcMOGYx61rsX7fI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 322d26e3-629a-40ca-4a70-08dd2071025a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 21:06:30.0728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8RmdzEFbqaqzPkKFlvtHusecihlQCf1rfhKuJtcdHGGIKzNhNuNQVKosnRYCLWxOqPgEgIOFwOnFeE5CMafmeoWJlUhjLjii925qbjz74Fo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6500
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




On 12/18/2024 5:51 PM, John Harrison wrote:
> On 12/18/2024 17:09, Daniele Ceraolo Spurio wrote:
>> The GSCCS is only used to transport messages from the driver to the GSC
>> FW; therefore, we can disable it if we're not using the FW, which is
>> the case on both BMG and PTL. However, the current wording of the logged
>> message could be interpreted as a problem, so reword to make it clearer
>> it is not an error and lower it debug verbosity as users don't really
>> need to know about it.
>>
>> Reported-by: Eero Tamminen <eero.t.tamminen@intel.com>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3866
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_hw_engine.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c 
>> b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index 4294aa600192..ac9c666a9652 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -775,7 +775,7 @@ static void check_gsc_availability(struct xe_gt *gt)
>>           xe_mmio_write32(&gt->mmio, GUNIT_GSC_INTR_ENABLE, 0);
>>           xe_mmio_write32(&gt->mmio, GUNIT_GSC_INTR_MASK, ~0);
>>   -        drm_info(&xe->drm, "gsccs disabled due to lack of FW\n");
>> +        drm_dbg(&xe->drm, "GSC FW not used, disabling gsccs\n");
> This message would also be hit in the case where the firmware is 
> supposed to be present but isn't. E.g. on a LNL but without the right 
> firmware package installed? But presumably in that case, there would 
> already have been an earlier message about missing firmware files?

Right now if the firmware is missing we abort the driver load, so we 
don't even get this far. If that were to change (and the code here does 
for this purpose support the case where the FW is defined but missing) 
I'd expect we'd get an earlier error about the missing blob.

Daniele

>
> John.
>
>>       }
>>   }
>

