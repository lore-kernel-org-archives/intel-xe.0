Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1BBC5CFDB
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 13:20:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB6610E564;
	Fri, 14 Aug 2026 13:20:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JhTAElOD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A631A10E142
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 13:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786713616; x=1818249616;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yGwh1BA9yPxq8DJadPWNFvo6ylYR52fbqGZGC7SA/4A=;
 b=JhTAElOD6rYI4LKisjqDWXvQWHktzfE+XtQLR4XPN6wLhlb2hnd3J0M4
 TRRCLFSGTWaTDOCeXRzQZO/H8iQtC/X61mxggZ82ot9snH2USl+A8BWPJ
 bKuEr2GABNbliBkZUHzZnYwL7Ljm4NfSpI6j+C/wx+yDLB+sMGqID+Eli
 GOT4eZODI8jrP8uJcCk44q7s+277B8gXkgEgEtT3eOvuLFDo4qBMTU7EK
 g2aIfrk6yv5dZI3OkkIu7PtXDqKky8OjV0wOBCl9vilvXjY6w2Od5mfUU
 uovEWzGUbmdNrwA5w1diPxn3cIvo0MoyXgHZ/8gSkqTd4WUrmYBobIOh3 A==;
X-CSE-ConnectionGUID: pCH9bhUzQlyg/xzd0IN+cg==
X-CSE-MsgGUID: xhlJh3SIQT+ryFKAyFetHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="104824666"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="104824666"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 06:20:16 -0700
X-CSE-ConnectionGUID: muTcMnhJRHyREpok8/2TJw==
X-CSE-MsgGUID: STDNmaY6Q86pC1cJVvnWuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="267712862"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 06:20:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 06:20:16 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 06:20:16 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.28) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 06:20:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ba4oAF5X3BnnPMT4nR68SGGwQPFiKrM+oZb7uF7c0PyIn59ycTk+OBXzz/DDtZdMekDw7LPvAEUxptbQfGzNXM7/3yn6tq+QYTLEQ//vGowBsmXS0RtBlXq7nrb8xWlrZh0OhTY7GOMZFTOVoJx+PNBn6PixXqrExrJKllrNfnLdnJnSdcoL4omd5d6GNLHMYy62GOY4HgeZIbYrPizK+Y/D42FeboZsdq7yWrAesZZYg8rI/OwlHDC7XMZrTcqC8c9jB9GO1bLTjMRiFRE0xYPWdeI27GOvWdEvyE5ZhlMxLJPxrMzj7eNO1L/jkgtgLK5K7gbSuoyQ+75HJSuJFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qc1VaajFy8emzfyISsVo4KlfZ6Pn4e4Z60xGLhoWTSg=;
 b=YYgFvExbV8zpGeVMgB51o7nhw5oi+KlrbzOcMH69Uv5vtPYzy6UXuFyj47VUi26/9x9lyUe+cOZQtBZzr7W65aCDraWWjkV2flRVGr5FofwkYHmAOKwBizGcpzsZ4DfYuE8WJacq3tP4KTRloyu+5XuI8mBWf9OItJ/3K19S5dwHzzFJwfS61nvGYPtjXUb/g8qqiqAIrGAvpH4LNJIvesWF3A7zRqFsaSMYd3HYo3fiDCjSDSQtliSOa7OAIckj+oJnVYJH+avsHaEUNsQiycVSnrgX9bQHReDAGKT2nnAYUaJCvQCyyqgTEEFwMTHtm+v5M8AbAXL9PBPCNu3Qxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by DS0PR11MB6328.namprd11.prod.outlook.com (2603:10b6:8:cc::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.15; Fri, 14 Aug 2026 13:20:06 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 13:20:06 +0000
Message-ID: <668c12d0-4a81-4882-9b91-b6fbc08d8dd1@intel.com>
Date: Fri, 14 Aug 2026 18:49:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/32] drm/xe/log: Add structured SIGID error logging
 infrastructure
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Mallesh Koujalagi <mallesh.koujalagi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Riana Tauro <riana.tauro@intel.com>, Stuart Summers
 <stuart.summers@intel.com>, Yoni Levitt <yoni.levitt@intel.com>, "Aravind
 Iddamsetty" <aravind.iddamsetty@intel.com>, Raag Jadav <raag.jadav@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-3-michal.wajdeczko@intel.com>
 <f617645d-69c6-4fa0-8176-1837b982ab7a@intel.com>
 <7991e3b1-bd3c-459e-b033-29e27e8a4cb0@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <7991e3b1-bd3c-459e-b033-29e27e8a4cb0@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0267.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::16) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|DS0PR11MB6328:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ad7d894-9701-4563-3880-08defa06c1f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|6133799003|3023799007|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: sV8+SXj6yEjWsfBx3a/86bZRZfjxjp/T9USOGCaDfI8O64WY0lAQrl3sZZAtz7R0Uofe63leuhpJzWTS6CAUN0onL06vWYxOZjq0v5FMH2f+4geZ9Ckvaho5n7ugHyv/7MbC/iwntO7CqZ+Cg59TMHm5paGsXWYXju5xU8tIf9CblAqVfQ63Esr34K17z4w0+phVMWLkPhYkHgnAqBOB7n6lEY0AhQ3B81rmVYJHaQlVLxELrP0KX4z84EW7TK7V8oKN45is0tJ7xYoRYBvrGT6eGJMHA/Y1dz+1e5WylTtpVub4zJWr0dMIJkoPJwDRRRSGvUC8BDDMlu5UsemMm4x81EXmliyvYaKpdYLcWPl7js/nmL3Bp+dDPtTXQitWbBSIcgMOWxkPXGcTHmmE1L9fEINMeKDNU8+Ly0IR8OQAdui5dRF7OBCp1q7j6IXaUKJOApKgBf/t1YTjWycJCwFWD+tiazNrvhf6Og9E1AZ3BNCfm3s2YPIICD5z2yUNpKaf4KeMsw3dcpVo1WHPSpZnGwB5ET0ikcC19hBqY+C5DmkqptFnTiL9Te+5dwoPiPt6jOz3H/P+vmY2iOWP48U9Iwjd5iA8ZPyoNfZzct4yAqouVUvirLlMBIslU6XhASmLGraJzzFjKx4ks2VAOGq8ENaEeb26qs1g8ik9dYk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1dlNzlpeWRxNzI3c01uZ1JFTWFJVkxtb0k0UHp2MjRCZnAwMEZpMkxicnJw?=
 =?utf-8?B?d3VDeThNZHpEd2FrZDNOQmlEM0xoemNyS2dDZHFQaDFTVFBrZmlSTUlBb2d1?=
 =?utf-8?B?WVFxbGxRRUYrTTJDWGhaR2lCVFNIMEhpeHVuenVTZzFkSGF6MlUvRkFkNXVJ?=
 =?utf-8?B?T3pSWCtJVThvcG1ZUTBaWjYzUWVjRlFQK3pENUFSZXVjN3ZlVnppVE4zWElK?=
 =?utf-8?B?VGRJbVE4ZGJFNC9aNGZqY1FudmxOa2J5Zk1XSjFKVGtsa0phbVdrL2xkOWtn?=
 =?utf-8?B?MDZid0tyZjRZY01sU3hnQks0V3dnTmVxM2RSZzVQUU1aMFBEMDFYanZ0R0VP?=
 =?utf-8?B?MkMrQTkzQjhUcW0weHd2K0xRdjkwVGNva2wwSnFsbDBpSGtMZHRKQVlOTjh3?=
 =?utf-8?B?bmE5OVNXeVV5R3pFSVp2eWwxc2dPY0RXNXg1RVh3KzcybUtTajNCUFk1ZUxJ?=
 =?utf-8?B?eWVnQm5vSXgrTTRkVUM4aXppNS90Z0ZKYWp6dWlSYnBicURQYTROTnFWb0FT?=
 =?utf-8?B?YXBsOHJvV3BWL2ExTlo2a2Vtenk3bllpVmJ3WkI3RTNzcUxwc0RGeHJzdll1?=
 =?utf-8?B?bHVXSmFOS0tLamQyZXdsUk5TbEROeXFHbkdJUTVTeVowcC92ajdrbEZsWTFa?=
 =?utf-8?B?MlBGMVZUSnMwa2dlT1hzYWFsVHJhNlhmaUoydVJ4bi82Z1cxZU52aFhkelZ2?=
 =?utf-8?B?N2hpZGcybnNJamI2L0pnNzdaMmNBczJkTXA0UzUzM293QXdPZmhrcUI4eFhU?=
 =?utf-8?B?alNXVWpFTWc4S0Z1Y24rUC9EalJtMFV1YjdGQytUUEcwaXRncnVnUjZERmcw?=
 =?utf-8?B?S3EwRTlvclRJdWlJeGtZVEhXMEI1K3puMnFldEV6dDRFQzA1cGM3MnBiOVRO?=
 =?utf-8?B?cVNRZ2ZHdXAzMm1GakMzRmNnazJjaExTZGY5d0ptMzN0WFhmRitaL3hheWpo?=
 =?utf-8?B?SDZvU1ZyRENMTmFnc2xpM25lMitNU3RkMmM4TUwxY2pkVzQ3cUx4N3BTeHVv?=
 =?utf-8?B?UG1peTdvbUg1QkFmTmliaUJvT1UvNi9GQTZremwwRk9mVW5YdC9ETXR0YWZy?=
 =?utf-8?B?dWsrbmt1dGxhM0NQMEdzYWQ5cWtLS0pVZHVWc1I4ZU5vbk9CVEpvNDZIMDVB?=
 =?utf-8?B?bks5djFGWHFheUhmY0RKRXBObXV2RjNML0xRZnBPV3MrYmdwUUJ1VWRsMmVR?=
 =?utf-8?B?N3ZUQlkvZlMwWTl3L21XNktjbFAyN2U2bE92ZGRiZ1RRcllSYkN2YmpZR01F?=
 =?utf-8?B?dU4xN0dRZjAzYm9TYVZtMXJhZHl6QnFBL1dJbHpxcld5OXpKMEsvRVRjTFZI?=
 =?utf-8?B?eSsxNCtDWlUwdHJMUVphcXA0UXF6R0VqS2JpN0V1YzNIU2IzOFRUQ2dhRC91?=
 =?utf-8?B?VkM2MXpBN1AzNEFOMTdYbGJNWWNWWjJMYlV0KzFOdlREUkphUGlocTdPc0JP?=
 =?utf-8?B?d1lQSnhWOGxYTFhKMTNnOVZhK0pudjhCaFkzcm4rb3JMbjRsSk5UQW5kQi81?=
 =?utf-8?B?YXhYdnpNVTNRNFVEMXhqNURQVnRuR0pyVHo5N2hmeWZ6K3U0N2I3OWF4TndH?=
 =?utf-8?B?aXNkVFVyckgyVUljeTRwTTFZMzNIdHkrQlR5dWwxenorc2I1Q3RwYTcxOEdB?=
 =?utf-8?B?WHZiSjRaN1hTeVpYOWwvczlXM1hQSkxUUDBWbmllR085MWtKTDlTYTNUSGtm?=
 =?utf-8?B?OW1IenlsU1ovY0lUcjBqOHBRUi9uTHA1V09ZNUpiZWZTbHloYUh3TlZUeFZ2?=
 =?utf-8?B?YnFVWHh2QzZRK0lJUmdabWRBOFVySk93emZiRTB2WFg2K1dlRjhhNDRkZ2FP?=
 =?utf-8?B?T0c4dG5pRkxEME1FTFpPVzBqdnM2cDRvZ2tmMkE2dG9qUTN4dWdDSHQxdmF2?=
 =?utf-8?B?cHFNWjdRZXd3ZWhDVjgwc1lxWWlmNDJwS1M5TWVmaldMUGNaWXJRWWZSQTBz?=
 =?utf-8?B?WG5hYXkzdzFOangrSmNUb1MxZGwvOEhnREsvenNLUTFPTy9IcnhTVG1sQVBq?=
 =?utf-8?B?VE5TUWlTRHRtY3ovZ01iM3Y5dWpZZTNiem9HcnBiR0ZlVWZCaXM0S1NPVUxD?=
 =?utf-8?B?UXdlWlk5Z1RlSzJMbDE2Uk40TXVySzNnb3gwbmRuZC85c1VqMzFjNTI0V3lU?=
 =?utf-8?B?U09WNjd2L2NCNTM0cnFXVVJKL1l6ampuZTJzQjVDc0dCS3dmSUFTYmQ0NklS?=
 =?utf-8?B?Q3F1Y2g1bnBtaFdBcDNadTcza3kvZ1JKa2tTNk9FOFczNEcreEtkTldIYXpn?=
 =?utf-8?B?THRaUzVCZitpUDRGYTZwZ2dkQ1FpYTZUa0RjMW9UZ1poT0daZVJRYkFUaURr?=
 =?utf-8?B?dUU5Qjk5em94SWg3c1p3SXV0K2FrSTRzckN0UXRBdE5ESVZpRlRHQT09?=
X-Exchange-RoutingPolicyChecked: rPTBkBtxosvdDJ5zWRzjDmjhZhuYZcb+N1cZDNW9nQZwKbc04qIpsTrlYSDXs0y0jYkcA9MxNN8W0A4VkEGgbaTY0/O81WQprxEwYkiYdDzTtU9qlD9egg53zx+5GGxloyReF/SVEDDNeGR6p9JShwe+YJCI2J0QrW9qDA3c+KEVvxInL28YH8KcIR33g/9wjjUMjJgdnJiS0g6iyFWY/1tGBcX5eA3khlRNo3oSVWIKVz2BHnQgeSqCSAslJ3/LSYMiIAXs6JLtukvHMeYpNtuj4xDRNRao48MBGThkR552eJbeTFi09yTb1EhsoXOQKj1ZSw2ImaBglaDlUfQ6jw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ad7d894-9701-4563-3880-08defa06c1f1
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 13:20:06.4306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6lZwH0LocmvMV/MXuFerbdcqrZT0G0RGzxneidCTPDMLz9meHu6i5+k4MLWsKH0nR+uN7oWqm9uVtCR1uUkPQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6328
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


On 14-08-2026 02:08, Michal Wajdeczko wrote:
>
> On 8/13/2026 3:42 PM, Nilawar, Badal wrote:
>> Hi Michal,
> ...
>
>>  From kunit example I got this output for hardware errors.
>> drm-kunit-mock-device demo_dmesg.drm-kunit-mock-device: [drm] *ERROR* SIGID=204 (0102030405060708090a0b0c) [Hardware Error]: testing HARDWARE signature
>> drm-kunit-mock-device demo_dmesg.drm-kunit-mock-device: [drm] *ERROR* SIGID=202 CORRECTED (0102030405060708090a0b0c) [Hardware Error]: Tile1: testing HARDWARE signature
>>
>> SIGIDs 202 and 204 correspond to the XE_RAS_COMP_DEVICE_MEMORY and XE_RAS_COMP_FABRIC components returned by firmware via xe_ras_error_class.
>> If we want the component name to be included in the error message, what should be passed to the logging helper? The current KUnit test uses XE_LOG_COMPONENT_NONE, so no component information is being emitted.
> if you want HW component name to be explicitly included like
> we do for SW errors, use xe_log_comp_xxx() macros:
>
> -       xe_log_emit_recoverable(pdev, XE_SIGID_FABRIC,
> -                               XE_LOG_COMPONENT_NONE, XE_LOG_LOCATION_NONE,
> +       xe_log_comp_recoverable(pdev, FABRIC,
>                                  blob, sizeof(blob), "testing %s signature\n", "HARDWARE");
> -       xe_log_from_corrected(tile, XE_SIGID_DEVICE_MEMORY, XE_LOG_COMPONENT_NONE,
> +       xe_log_comp_corrected(tile, DEVICE_MEMORY,
>                                blob, sizeof(blob), "testing %s signature\n", "HARDWARE");
>
> then you will get:
>
> .. [drm] *ERROR* SIGID=204 (0102030405060708090a0b0c) [Hardware Error]: FABRIC: testing HARDWARE signature

CORRECTABLE should also be printed, as for hardware errors it represents 
uncorrected errors.

> .. [drm] *ERROR* SIGID=202 CORRECTED (0102030405060708090a0b0c) [Hardware Error]: Tile1: DEVICE_MEMORY: testing HARDWARE signature
>
>
> and btw, I will ask again, whether we want LOCATION/COMPONENT
> decoration as here:
>
> 	Tile1: GT1: PROBE: testing software signature
> 	Tile1: DEVICE_MEMORY: testing HARDWARE signature

I am aligned with this, we should print location/component.

Thanks,
Badal

>
> or maybe in COMPONENT/LOCATION order:
>
> 	PROBE: Tile1: GT1: testing software signature
> 	DEVICE_MEMORY: Tile1: testing HARDWARE signature
>
> if latter, then please comment patch 4/32
>
>> Thanks,
>> Badal
>>
