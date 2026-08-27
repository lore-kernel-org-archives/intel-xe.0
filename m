Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10299C61DB9
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 14:40:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07BF10F0B5;
	Thu, 27 Aug 2026 14:40:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FCKT+sdE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E1B10F0B5
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 14:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787841657; x=1819377657;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=c4lNZhrkJJzb/O0in83hbmk9v/Dd8TunTOXQRfagVUI=;
 b=FCKT+sdEsbNsKGeb2EN6a74DNhhQ6ewMY9KCvHf2RJcK4Udmo1vm43zK
 Tm9Upg4/u+4tC6U7wXP6ak1/F9rdT9ckm3bvXqJ5IoZwmJllFuNPrvVUw
 ewaq6k3eRQ9AmTfecYxnjHGkyCLfoKrNI8dmgRoKpnHfWNE4ib5hWU7Xx
 kkMPwEBXVJBYo20xro8tXU2Bsdn9SUNjzP8kpP+DeF5Ae+ZXpBxClorOu
 en4+fNrYE9NDvdEoxNYa5ysW1n1v9hw6jED/J+hM70Rv9AiuiLR3N6SF4
 s2DgYiSXX6TFFXuBjxkKJ5mp3mYX/+7gQ5+wHfJ8RH56olqOJrHlNXh0W Q==;
X-CSE-ConnectionGUID: wUtU3wZVRCOEI67+uxVz8w==
X-CSE-MsgGUID: 8NqD42N+RV+flx10QENfDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="92201795"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="92201795"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 07:40:57 -0700
X-CSE-ConnectionGUID: OFCumZlSSiu9PtniAroJqA==
X-CSE-MsgGUID: nTvK1TJISfiC2FI/6+B5KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="306098683"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 07:40:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 07:40:56 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 07:40:56 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.52) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 07:40:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JlOlV6iqFxAPhhd+MkJzD1/85MHGFm7lHhOMRx7Xuydg30/66sZ7x5JKEJHqx8Dkxs2ezT0/VIe+FMH7a9eH1iasFvGiaYLYqEyJomqr6OdWxJDG+k+iiZU7rX+ffTTzOVn972wHZTrjHEO1+G57SQT4QxUTBz2LHtX0u00NR00uao6SZhs+vafukKh/WBaeazpdMDtPOxZnqL4jWrKaRJm8/tzL0aGg1QtPgRlLCmFIjPO15Mq6wJmb/LB3zM9ZrG2plzd2tKsJAxGfbxZwzC0bq7ZlKZxvCWOHPZ6SdpUX7R23V59HjUeUx6adv+ARI7+umdnx5UcezsgShg6Z7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUFD31WHPB42TCZv6broIwypnLPnYmovX0n/DJA7N1Y=;
 b=HwmEYvUi2sYMMUsSngDulxu/NGEGZzx/8kwtTFNWDHwyZlOpGWT0wNyhKcEJzTbySAFZhsEidp7Wfp9ni50Hfw59fMcD/rCtR8P592L6Mvmc0eQGQCTODC1AMDv6vmAaNrzqbXtRlMMzklWTc73AiStGTqQkt75V4ohJMCQ3OPwsdKXbGM4ftoRrlCHKT7iF+//eh1B/2HGkBTx9i40uvmla7NRq7r7ZJr9RZckejwfd7h+MCwQV7hBulidx9xw48rsSn28RmKECQYnxllPlIdpgMWZOx9wXSpDc8UUJyaLuGeo6dvmH83VSgwPOHXVYFwyJCE3Jvc0sRezmNQh4wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH8PR11MB9535.namprd11.prod.outlook.com (2603:10b6:510:39f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Thu, 27 Aug
 2026 14:40:53 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 14:40:52 +0000
Message-ID: <b71b1992-22f0-480c-ac42-e5b5223d3ada@intel.com>
Date: Thu, 27 Aug 2026 16:40:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/7] drm/xe/sysctrl: Improve firmware response error
 logging
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, <anoop.c.vijay@intel.com>
References: <20260825110542.1359776-9-mallesh.koujalagi@intel.com>
 <20260825110542.1359776-14-mallesh.koujalagi@intel.com>
 <d24a07b8-3977-40d8-a7ca-35eeed9c6f9b@intel.com>
 <1b5b9d19-75bf-4c7c-86da-d7f8434f4695@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <1b5b9d19-75bf-4c7c-86da-d7f8434f4695@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0148.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::15) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH8PR11MB9535:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a30d4a1-723e-4aaa-1b69-08df044931aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: JmfmHoToMkOs60f6C6xBUHVuVqlNDB2UlU2x6VFv8PUUCLK3Q50y3S7g4oyycC0KUoK8quihBuxd1Z+HOnhjpV/mh8Y8XlDn9tpwP6ZNnVHRIQOF7GyNe8HKp5xIG0dFwDIPuuocemqaJExc8HE8DJMWf0zZ5/mnbo+BeMXAV33hUqMUt1KrLNd3k89/hK5W93NmPOHcpDlQoMP58F7PA4U65ZTLo6wWJy3CMqE9z2ojCHsCDEw0TVZBbo9hLApaGnEkkXcqDtacRLEs/w4CbodB2fegOCHkmA1fThEDYI9J99a8MOmv9Q94tRRpTzsssDevqJ6W1xIfB2KgowZ1lOHbeK5XKU/13Y1MaalX7+DsdVysFrbNQ8v2JppYmQco51Ozl8EmDOiafF1gTPLSZd2wiw4mq7fNsHa6bUV2H/Vp0rF7ViKbBC+Ed5n8MTuPN8qsab8A8duRLKJNqs7wzUSs9GqhBXfTQBiisYpi/3A+1QjEEKmdtp2eptlNydcj4mcmHzFVZcsbcEvfbP2UgUKsCP5ZmTT/DNQKgw9G4KQbdhILs+2fQ1o6F2HejInwhp76YVnV0ApTkaQ9j76e53VNbvQG4f2VONGgkEZkW4gzcRNyHEfe8szuiw1EsW+NvYqpvY6KVQD/69PzOiUEJfbgW5PX5XI+vrSiegfCWwc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aCs4WGhPbldGNkVMTmtFMklscDh5MVh6L1c5L2RFZitYckJyN2JqNzNvd0Iz?=
 =?utf-8?B?azN0djAwZmxUZDRnUUJQeVhGaXM4Q3QrODcrcWZyMHprM3R0cVBwWHZrdmYx?=
 =?utf-8?B?Z2FCRjEvYVk5Zzk5TG8ySUtSSGRtazVmSFVNb09rdVFXQUV6THRZbHFrdFFx?=
 =?utf-8?B?WVhON250alIyU3BHcW5yaGNxNnNkcXlxVjE3R0dVZy9wV2hkSzdEUXJnR0x6?=
 =?utf-8?B?ZElYZFhlZUF1dUdsMHpjeXZWN2VaOGtrZ3pqWlVhbjR4c3FWbWZWMGNUN0wr?=
 =?utf-8?B?d0pXNVJua0dES3hIaVJhakZWRGMyczdGWEpMYzVTanlUbms4Tk5kRHNLbVFk?=
 =?utf-8?B?VXcxL0hqMzFvNHgyKzdzOVBPL0hyalk0R1F1Wlhlb2pQMDN4MVhEcjF3VXJ0?=
 =?utf-8?B?NHpva0JLbDlWVjVYN3lQbUgxWGkrZ05HUkNMN0c3d0E1UGFhTGw1bFpJSXZr?=
 =?utf-8?B?K21Yampma3hrOVFvTUtNaVhnM1RWS0xIOHQyU3dVaUxPbG1wRHBtMVVib01H?=
 =?utf-8?B?N3pjd25PVjYwUzZ3QTB0NU5kTDVhbDRTbGRlZkVNbUZmcG52YjZ1U2h6eGFn?=
 =?utf-8?B?dEd6OWY5RXZxZEkvaVpDaGRxS0tRUmpOY1FVVkh0U3Q3clBUSXkzZGp1SEZT?=
 =?utf-8?B?Q0EwRkpNVE8zZjBpUlgvYzJEUFlVODAxSjhiNXl4dFB1UVZlV05WOVVuR25Z?=
 =?utf-8?B?aUZzYXA2YVE4WUJrTEJ4d1N6L2xGVi9QMFMwMnhyRzVOWTZUSkt1a0M4cUVa?=
 =?utf-8?B?NlJvMDIrd1ZkSVpER0p2N0xWS1RMRWFJRmVQZ3JuQXd4NWhKSENoWnhhVk5r?=
 =?utf-8?B?UDdwWmtub05nYjZ1VG54bHEzNC96ZnBLc2FlNzh0eUpaU3BYMnBLRTlDQ2dS?=
 =?utf-8?B?YklOMCtvYit1UGdyTkE4ZUc0WEt3RGR1THVYT1hHc3NyMzFqVFRGQzQ5ZVcr?=
 =?utf-8?B?S0ZvNi9BUE9raTVNZmpzNm5VMEhsN00vb3hzRUYzQ0hzc0dPY2s4YjEyUEpX?=
 =?utf-8?B?ZzRpYVl5aEM2WkJTRlFxTVMvZktFdDkvN3BITlQvaTVUbUducy93L1BVNTMz?=
 =?utf-8?B?WVY1UVIycU9HbnltZmd3amNKeDhKUlhyNDd5bTZQQ0ZPL1cxRGRLUUpJQzAz?=
 =?utf-8?B?QXdTczI1aG9VcjVSNjJVT2RjempuK3k4NXN5Z3ZMcTJPRFBRM1RScWtwbkgv?=
 =?utf-8?B?R2tlR3kvVFB5Rk9PeVJkQnlkc045UCtkaFJac2ZVMTY4L0FsRHMvSTcrK3JV?=
 =?utf-8?B?Wm9yaW1EYk1Kc1AxT0Y2TmxmWWZkSWgwb2EydUxHZWNmYlA1cHlPcEx6bXBy?=
 =?utf-8?B?MjVNUklXQUFpemFMd20wS2t5WmZWZjRuL1VuQ0RMQ2h3ZGd0bGpySll3eWZ2?=
 =?utf-8?B?RUVVUXphNTRxVDlnUWxYcW5CQ1IwTmNwRGN6T3VCRmV3SmkreGNQS1FxeXIy?=
 =?utf-8?B?bzBlSDFIWGFrRmk3NVRwMVVSbER1WDljc2kxaU03ZDdiRmJxdlhYaEdRbE1M?=
 =?utf-8?B?bmpXcisxeEw0dDRyYVF2NE1WNG5lSUJJbS9PSGNGQzVFckFYTTFTU2VBSXN0?=
 =?utf-8?B?aVRNUUJnSWdlNFpUek40YUNEa1lFUk8rRVVFVW1SUFdNdStzNFR1bjhTaGZq?=
 =?utf-8?B?YWY3S1FzbzhLVE1BeGJIZEoyOVNwTGJOdGNsekExR0oxU0I4MmE1dGxuWW45?=
 =?utf-8?B?d2pLcjZRR2p4Wmx4WmltYXpmbHczOGVsMjlSMFB2QTJFcEY4cjNEZVAwWFhT?=
 =?utf-8?B?QnBZdVNaWXVOSTRvaDlrOVZBOVBRV25pS3M1M1VYanJVaC9VdzFLYVc2ZVFH?=
 =?utf-8?B?cnZmM0Q3Ni85YWtkc0pwRHpUa0R4dFlGNjd0eXlCUUxlQi9UMndVdXJZYnBt?=
 =?utf-8?B?ZlV2cG5Gb29hMytTaHoyL3c3b0Ewdlh2K09yRk5hNWozdVlZVWZ3Y2Fua29j?=
 =?utf-8?B?dHlJM2o0QnFFWFd1TGZDUllsOVdERi9ld0tMZjVNRndCUE9WSFQzM3YzOFRq?=
 =?utf-8?B?RFV4Smp2NE5qeXdwZG44ZUVYbFBPdmlxUDBmalRIMkh3YVhibnhEUi8yV2kx?=
 =?utf-8?B?aEc5L1R3a2toOXk4YW1IeTZUZHlNcGRVV0Y5YkJYdVNOVmkrUVVRVWI1akU5?=
 =?utf-8?B?T004SDROZ0pCTXlxYXpmZjBUMlFYQ0d3K3dCSXZ6a0ZGK1pTUkQvL2VwVTdv?=
 =?utf-8?B?Rzk5VkxBQ0FhSUFGUXFzU0I0UUJqV2dYdHZVODJ6VTgxT3ZreThkNThMUXZY?=
 =?utf-8?B?TGN5VmNkVGJrUnlUeENMaG11alJoTFdRWktDRXNNTEV0eEFDNG9aUklybVFv?=
 =?utf-8?B?bVhxVzNnK0JIeFlYWllsc0VwMEU5ZmZMSjZ0RzFoeWpuZ3laQnBSZC9EQ0JU?=
 =?utf-8?Q?ChZ+RAShn0xVaQ/s=3D?=
X-Exchange-RoutingPolicyChecked: cH19P0kX90Vfm0MEP+/6Jks7hlwQ3ckclUsMDqqwui6txip5XYHfM8gFcGAvC2zE/WJq/+o4MRtViLWyg/YIzoAj5EmEEUFHesNAPrkNv1YKCW6STYJZxBozH4f3eMN+I+oSZXm0Ah/3TTEfJ/1UhC17RCBEJB7bheJDR8+Yk9VJTkbmV1CVK7U9MHX8MbeBh4/BWBtl6LugdeQya3wxn8Wd7UyM98sBojsNSKxxLboFNINICLtn8IpYUJHzjBi8Kmh5H6ZodTlSzaYx6axENSUvnePodF20PxwO4KAHWwwDLYkwdGUgzp+y6BS8AWcBun30einumkFFBiYDvzORcA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a30d4a1-723e-4aaa-1b69-08df044931aa
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 14:40:52.5199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lMTY0vhQGPbp07PH6YPqtWlfA4efLzTEVVIgnfaF7MmwcJ1P+c/IIe8/q1w2zTq8XfylD8qWw9r9BZvi5KHdA5BKBCElC40VfSU4pkgPrY8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9535
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



On 8/27/2026 2:50 PM, Mallesh, Koujalagi wrote:
> 
> On 27-08-2026 04:27 pm, Michal Wajdeczko wrote:
>>
>> On 8/25/2026 1:05 PM, Mallesh Koujalagi wrote:
>>> Use xe_log_err() helper and include additional details when a
>>> response header mismatch occurs.
>>>
>>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>> ---
>>> v5:
>>> - Use %#x after REG_FIELD_GET change. (Michal)
>>> ---
>>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 18 +++++++++++-------
>>>   1 file changed, 11 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>> index f8b518dcafa2..5032d766b314 100644
>>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>> @@ -24,16 +24,16 @@ struct xe_sysctrl_mailbox_msg_hdr {
>>>   } __packed;
>>>     #define XE_SYSCTRL_HDR_GROUP_ID(hdr) \
>>> -    FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
>>> +    REG_FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
>>>     #define XE_SYSCTRL_HDR_COMMAND(hdr) \
>>> -    FIELD_GET(SYSCTRL_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
>>> +    REG_FIELD_GET(SYSCTRL_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
>>>     #define XE_SYSCTRL_HDR_IS_RESPONSE(hdr) \
>>> -    FIELD_GET(SYSCTRL_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
>>> +    REG_FIELD_GET(SYSCTRL_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
>>>     #define XE_SYSCTRL_HDR_RESULT(hdr) \
>>> -    FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
>>> +    REG_FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
>> this should be mentioned in this commit message
>>
>> nit: or maybe above changes should be done in its own patch?
> Sure! will make different patch for that.
>>
>>>     static int sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
>>>                     unsigned int timeout_ms)
>>> @@ -237,13 +237,17 @@ static int sysctrl_receive_frames(struct xe_sysctrl *sc,
>>>       if (!XE_SYSCTRL_HDR_IS_RESPONSE(hdr) ||
>>>           XE_SYSCTRL_HDR_GROUP_ID(hdr) != XE_SYSCTRL_HDR_GROUP_ID(req) ||
>>>           XE_SYSCTRL_HDR_COMMAND(hdr) != XE_SYSCTRL_HDR_COMMAND(req)) {
>>> -        xe_err(xe, "sysctrl: Response header mismatch\n");
>>> +        xe_log_err(xe, SYSCTRL, -EPROTO,
>>> +               "Response header mismatch: got group=%#x cmd=%#x is_resp=%u, expected group=%#x cmd=%#x\n",
>>> +               XE_SYSCTRL_HDR_GROUP_ID(hdr), XE_SYSCTRL_HDR_COMMAND(hdr),
>>> +               XE_SYSCTRL_HDR_IS_RESPONSE(hdr),
>>> +               XE_SYSCTRL_HDR_GROUP_ID(req), XE_SYSCTRL_HDR_COMMAND(req));
>> nit: as admin may not know what is "group" "cmd" "resp"
>> maybe we can just log raw hdr value?
>>
>>     "Response header mismatch: %#x\n", hdr
> 
> "Response header mismatch: got=%#x expected=%#x\n", le32_to_cpu(hdr->data), le32_to_cpu(req->data)); please let me know, is this fine?

looks fine, but it could be even simpler:

     "Response header mismatch: %#x != %#x\n"

> 
> Thanks,
> 
> -/Mallesh
> 
>>>           return -EPROTO;
>>>       }
>>>         if (XE_SYSCTRL_HDR_RESULT(hdr) != 0) {
>>> -        xe_err(xe, "sysctrl: Firmware error: 0x%02lx\n",
>>> -               XE_SYSCTRL_HDR_RESULT(hdr));
>>> +        xe_log_err(xe, SYSCTRL, -EIO, "Firmware error: %#04x\n",
>>> +               XE_SYSCTRL_HDR_RESULT(hdr));
>>>           return -EIO;
>>>       }
>>>   

