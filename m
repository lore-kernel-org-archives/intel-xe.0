Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09390C98304
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 05:34:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB1310E702;
	Thu, 24 Sep 2026 05:34:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z5JHX2CZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD5F10E702
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 05:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790228093; x=1821764093;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6kqSY5fyH6e+Sw0VdFXlYpm9Zwo53GjWzewckq90rvg=;
 b=Z5JHX2CZQewWNrvOSoDBOQas7/yVU3HXonwxURm/ZKrV//7O/gj2UUAH
 Li1/ou4uifBeeUsnwJZurcR4X1Hm5qjR662d3BIOOdb1MzVPHpvolUmzs
 TCMMP1auZz49yC9spsuO2++SIAIqhuL+nX81VSdViJrODQ5JeAyEtGaEz
 qPWVzzUkoyGxpuUot2qCLxt5RfXf5v4++/R6l43bVEOxJNHACqRfWPER3
 Um4POdOYWVYruUVyObJ8KRVXywm/tuCh4IQt1iqZidHJcL1IOHB9Wzqh1
 8EVLfWTIi39EgBmwQ2XRCr00RUcyx09THqpvGAfYZEEN8Zt63FljT0y9d g==;
X-CSE-ConnectionGUID: c/4ZLxScQ3ubtVts8QA23Q==
X-CSE-MsgGUID: qX5qTG3FT8uRHuEqJn0bKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="89895158"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="89895158"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 22:34:53 -0700
X-CSE-ConnectionGUID: PQkDKBFlSfqs95A0OoMeMw==
X-CSE-MsgGUID: KTEWPmUKQSyueAojpi/zEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="311818983"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 22:34:52 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 22:34:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 22:34:51 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.48) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 22:34:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P5f1gKmlmBSwhK3+8/93S95tXW5R5fLRml8wXheqRtCEUnHgPzQtbJdh34s0nOKw241PR6R3wl479JhRA1RzoZLe2s9b/ojccm8wMO0U3pNL5HsfFZu4Opb54SqitAc6kKZbKQ4AonjjaAwQ++4hDmO5WfRGhRIAUnTOhjmf4KNHX/tkXFfyfvaxjpZIed9S5MmboLP/b8kIa3pPn/u54lr/0UUnmV5mKA6F89m4NjlVuwW8Qr+XOO5dU9+njNi3n1wXsLyBgjZ6l2zU8Nt36nwPesdLgGCQSiYgc5lyiZOs6xYfvZc0ilh/DPIPSHdhGSmUa9cCur4tKnR4PEs3hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WrcLvUXQ2GoKATzycHjwYYr2P+YMRDu8Iv1CA7NqocM=;
 b=ovub8kJRJgPYrXV0cQAVIUuUeS8uYdoFeCKjHV93wJ6jSV04Esb8p2CIrJeO51jRde1Dvt6x+JO8s8FEXXXZqcFhhWt0qkH1Se34mHFPQy+CToKy2y88dkFo9gyGgSmNHe6G09nr8PlexUWIE59hf9C0j/z4nNuDjg0ae6dXTvpesY+/nqmW2VkFRq5rjvUTOzv8d1ZtjtW7mSV9Gj80sYQ2XQMwV7idDBypCd/dQpqu4FkD5RmlRh2VfLD7ssAX1CpA+tAQUOt6qaCZHF7O09hn6/N1HTE1unXviKpc0HXus0ywQOFKi8liDIqHNLxRL7832kJEcxUEoMpQFr4MUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7556.namprd11.prod.outlook.com (2603:10b6:806:31f::21)
 by SA0PR11MB4704.namprd11.prod.outlook.com (2603:10b6:806:9b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 05:34:48 +0000
Received: from SA3PR11MB7556.namprd11.prod.outlook.com
 ([fe80::3b95:cfb:be21:788c]) by SA3PR11MB7556.namprd11.prod.outlook.com
 ([fe80::3b95:cfb:be21:788c%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 05:34:47 +0000
Message-ID: <63ae6d67-ead3-4880-9d90-f2cef2cec03a@intel.com>
Date: Thu, 24 Sep 2026 11:04:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 06/10] drm/xe/sysctrl: simplify mailbox header handling
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <rodrigo.vivi@intel.com>, <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <dnyaneshwar.bhadane@intel.com>
References: <20260921133927.128281-12-mallesh.koujalagi@intel.com>
 <20260921133927.128281-18-mallesh.koujalagi@intel.com>
 <6911aced-7d9b-4ff1-adf2-a5d9b62f92af@intel.com>
Content-Language: en-US
From: Anoop Vijay <anoop.c.vijay@intel.com>
In-Reply-To: <6911aced-7d9b-4ff1-adf2-a5d9b62f92af@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0299.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:220::11) To SA3PR11MB7556.namprd11.prod.outlook.com
 (2603:10b6:806:31f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7556:EE_|SA0PR11MB4704:EE_
X-MS-Office365-Filtering-Correlation-Id: e91f420a-2dff-4769-cd57-08df19fd8c05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|10067099003|56012099006|6133799003|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: n5YT/4AfzPvFUcFQkOuufYMw2JjktLi8g/g4c6Iv2TzBJixGTLYiT1+qBsPDE89wY5kfl5F8xQ2GkcSKBw/YKLaXczHsmrxBR1xGmR8XVWCuUyLX6D9qWy39nAbo0kPOR1fIHqAL20VcwhSeGrbh28cUJPaLko8sNIQy2ZBBqveTUIqkx8RzcKAu6x6WyOWZIDrl9P+Auw0Yjx9M3+ssPHiJv61vd44j7PFZ3UrDqyMEDFGSFnsH/lBYttQaKNEJWITtkFDn3aicA6oM0uVN1qq+v/eY3vmu18o68VBHyl6Lze6CcrAUCiBGY/JAbaYn/WcSFWzhSi5yu/eGd+MIgoVWOeVeFmtN4lB9M3TWfIWHe0Ohj6VZgy89StxOW12mjNLCabkgxw1Y5EviLs54xbDlwsSRxf4ii/6Try/jks9l1lxP11LF6ZiyS40AhxrJd4HmDhKS9OZZ1RQjV8IQbuJ/aaUUt9L++Fl5nMjcUEiLkTKWrsZmE/lNUcaaZz+QsD6JwMqrKbpbIPw0yEi0L/ImFfkMqSd4RqrDrQqehXVi+UUtfh1Vp012OhYqtuFkKByZFLQflGwRB6NsuIJ8dZ0sBaBXFe7w7yVea87wIliniEbE0RM5jlSYxadN5gCSHjy8C2ndOjkdvdGqaSSkK5aDwgO1gOXNn/RyKSzDJjw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1R0WWl1ZElKRHpIL3k0YnRHb3BnYXBSdUljcGtOM2xGS0ZaWTl5Y1hyaTA3?=
 =?utf-8?B?cnZheERsRXRtYXFEQXNraG9NVWIxMDQxL1Y5QmVtdHNsSStOTXl0WjZYYW04?=
 =?utf-8?B?NkpJM1F1c2FXYVJySytjRXdRckcrRlFSeXp4MFpZa2J4NmxVbTlaSEhpYllU?=
 =?utf-8?B?RDhvdDlYbFhvcjV4YXUxSzFzM01xYyswZUM1S1ZnVGlTdi9WSlZWcmhrOVR6?=
 =?utf-8?B?ZVhLM0tHMWpxZmltN3JVYVRvNExlaG15Y0dDdVRCb2pmUEFGYXh1akZBdVhW?=
 =?utf-8?B?V1hESEVHcWtrSklTRldhMmdBSk45ZlU1MXBPNDBIT0xVZHFuWExVcW5lMWdv?=
 =?utf-8?B?S0MzMUtQWWhPME5RL2ZaNkZiNkRma3NQUkJFSGhUa2VKeWh4U1ZOd2JLYXZ2?=
 =?utf-8?B?cmVtWk9oQ1E1bkI3RmhzK3JacXU2UVBpUE13czZweGtKQXBJUDhqYTk4L2R6?=
 =?utf-8?B?eXo5allsT1RObXdsRExTWkFaS0pLRStrd0FURldMK21TTmdQOXhyU1VXb0F0?=
 =?utf-8?B?SW0xaytES2xxK3ZxYjhmNkpscFJsbUdodGJlcCtvMERLSXllbHJQM0RsTnU3?=
 =?utf-8?B?NlFvZk0rSzV0ZlU2Y3d2RjBDZmUvRkVESmU3V21zeG52NDBzMGZxM1d6SHYv?=
 =?utf-8?B?ckdmdGRwbVlpbzlGWllRYlpQNHhSaGNYeG1aNkxmZExuUFBqTk85RGdqTThl?=
 =?utf-8?B?Y1kvZzdSblM3ZWUwMVNITkRYRjJDOG5qakFGM3lkOUJ0V0k4cjNXZlQ5RGFF?=
 =?utf-8?B?cSsyOXJQU1FWNXJnZ0c5N0h4RnU1QmwxRHR6M0ZSTlMrZjcvRjhPUGcvejZY?=
 =?utf-8?B?Z3Z4MXR0WEZCdU1BTTZyVE5jcXRBQjNCaFNHYUQ4VzlRWWpoK01ucW15MkJo?=
 =?utf-8?B?OE9LWHljTHFMTEYwVzVUWDhEQ00yc0doZHo3U29LOS9yc1lLM2k4a1ZQTktI?=
 =?utf-8?B?MmRPaXU1K0RSMjE3NE1FaWtkaEJ2bGk0OVovbk1CM1A4aUM4a3dWdUl4cUhr?=
 =?utf-8?B?TWRYcDIzSlRsYXJOWDF4ZitYbkZTaUxYUXk3VlNFVitjVW9xVWVzZ2l3a1pG?=
 =?utf-8?B?NnI1dk4zSDAwUTNGQ1NvOS8waGRkZ3NTVjNsK2FlSlJhY3RFWHlFMldlZmRI?=
 =?utf-8?B?LzBjRzZzOThyczRkVUVvVlkyK0JWSS9UQzZjL21ad0F6R3FuSHVOT2JZSU4y?=
 =?utf-8?B?Ukp6dGp0TDZZRytIelJkNElzbStrakNpYVArZWQxRnBzTHhoM3BwdHdNT3pL?=
 =?utf-8?B?NkRQbEwwYTlGWFdFcTNIM0hVa2dXT0M4NnFobUFTZEZlbCtiQ1NhTnZQc0cx?=
 =?utf-8?B?aWNGS3pFazVkU01RMWdZQjlJTTFGMUxvTW9JQ1JweWVaN3BZblFyNTM5MXpL?=
 =?utf-8?B?MjQrTEZtcFYxdlVPY3QrZXZreDY0SkRsUnkrOEtLT3phaWQyb3daSWwyRDJp?=
 =?utf-8?B?ZURFazN6SmxRcllEWHZockZpeHlZWTg1ZHZKMmV4WVUvWldzam81dTVvb2Ri?=
 =?utf-8?B?eDA5NGNLRmJ1VjhBK0FYdEZRcE00QzFVY2ZGQWx0bkhMdTRLeGJPOUgvdE9m?=
 =?utf-8?B?US9aTDRJdEVaa2tOd0NqU0VWbUVyK0VlZGZNSHVZTG0xcEpPOU41TDhKdFM5?=
 =?utf-8?B?L3ZTcUFiazhSb3ZaSFJyazB4dXMwZ1VYOGRkOVZna2JwckhHUHlOMjRSRXEy?=
 =?utf-8?B?K0c4RkdqNzYreHZHZEFab3ppNUYyenUxbm1LT25Xa0trMTYrZjM5MFhCdEJP?=
 =?utf-8?B?c0VvcFJvVnFaS2V6dGhjdHFBc1orQ1A2akd4V1BEdXg3U3hZRGw5UEVCZUda?=
 =?utf-8?B?ZFBlbjlrbFkxR0ZCS3R5c1Eza3l1UW8xcS9oU2FVYm5tQkRTbytiOXpsazVh?=
 =?utf-8?B?Z0toRit2SzNIaG5sTEZZUkplbHVYN0pVVVE0Mno2QnlKUGlPM2VJMzdFMmlU?=
 =?utf-8?B?dmpTbHBuWDZGekFIcWVUem9xdmZFbGhQRG93TEZ0MEZIcTIvNjB4dDRYOTRk?=
 =?utf-8?B?b1ZOcks1WUdwWUR6TlRraVI1YytoallNRUMwa2xzSnorbDc4Q2VHMkNyQlNP?=
 =?utf-8?B?a3pJTVNVUDdUVHg3RzhVY2Q2SU40TDVlMTB6YTBUVVNGdGF3c29wVVR2dlh2?=
 =?utf-8?B?SGVWaHI5cVlFR2d3cTV3b0lzOHMwbTNNR0NzbUMvUnlUaFNINE83Y2hkRGw4?=
 =?utf-8?B?Ty80UDNJNEdnOElXRTVZb05JU0t0OUY4MGwzVUliNUl4MHZkd2RqVm9ESHZa?=
 =?utf-8?B?bjV2QThML2taM2V4WEZGOVRVQjM3aW54VnRpZW80WGtHS3RlSWIzSGNKN1RZ?=
 =?utf-8?B?Z2hXRE5sL1RoR0NkZU1RYlVXb2JXaUVqNEdJQzlTa3NQeFE5VGdtT0JQZzU0?=
 =?utf-8?Q?g+rgPsx1Ldat5byI=3D?=
X-Exchange-RoutingPolicyChecked: F/weaFCrppCQR9wvBHUcbeuQ4hbjxr8BiSuemZWR5/5F+fhd5bbw4BevhYWPcBqsUiVG/CXxG37E9I/yYwFYkPNQb78ITTemNM6NAgLtedXpPTw3K6M79lCLBEfhy+C7qRXEkxmXToia6434czJXcBqfDCi4DYxG7R/CaH7skkwGFD1lSXrUAICNbzS195ORE/Xcc4YVwKR9mBw2uyXENXBMsLpqNFf6U1HAXD9T4gTHhAxc6kElXZtsTLzMdDQ65b0ZYk8bH0H+9Q+heJshhsir8/e9YsalsyPC4xKDUy0/0kxp+ZcN/C7oF/l0AbrJqvy+fScxTKu04ZWnTsHVjg==
X-MS-Exchange-CrossTenant-Network-Message-Id: e91f420a-2dff-4769-cd57-08df19fd8c05
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 05:34:47.8294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8HrXgd1+zeD1pnkORb9cCYshsN6bos39Lzgno/Blav5fKifI6XMfNdqCVcnbnCDoiQAimqC8bADMb+kuKbVeBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4704
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


On 22-09-2026 16:47, Michal Wajdeczko wrote:
>
> On 9/21/2026 3:39 PM, Mallesh Koujalagi wrote:
>> Use u32 for the mailbox header data field and remove unnecessary
>> cpu_to_le32()/le32_to_cpu() conversions when encoding and decoding
>> header bitfields.
> you still need to add the "why" parts:
> why it is safe to remove those conversions now, or
> why it was wrong/redundant in the past
__le32 was added because the header is genuine little-endian wire data,
but xe_mmio_write32()/xe_mmio_read32() already do the
host<->LE conversion at the MMIO boundary. So the extra
cpu_to_le32()/le32_to_cpu() was redundant, and on BE hosts that redundant
conversion doubles up and corrupts the value - safe to remove

Thanks,
Anoop
>> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> Tested-by: Anoop Vijay <anoop.c.vijay@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 14 +++++++-------
>>   1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> index 50bbdab072de..750178a0974b 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> @@ -20,20 +20,20 @@
>>   #include "xe_sysctrl_mailbox_types.h"
>>   
>>   struct xe_sysctrl_mailbox_msg_hdr {
>> -	__le32 data;
>> +	u32 data;
>>   } __packed;
>>   
>>   #define XE_SYSCTRL_HDR_GROUP_ID(hdr) \
>> -	FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
>> +	FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, (hdr)->data)
>>   
>>   #define XE_SYSCTRL_HDR_COMMAND(hdr) \
>> -	FIELD_GET(SYSCTRL_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
>> +	FIELD_GET(SYSCTRL_HDR_COMMAND_MASK, (hdr)->data)
>>   
>>   #define XE_SYSCTRL_HDR_IS_RESPONSE(hdr) \
>> -	FIELD_GET(SYSCTRL_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
>> +	FIELD_GET(SYSCTRL_HDR_IS_RESPONSE, (hdr)->data)
>>   
>>   #define XE_SYSCTRL_HDR_RESULT(hdr) \
>> -	FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
>> +	FIELD_GET(SYSCTRL_HDR_RESULT_MASK, (hdr)->data)
>>   
>>   static int sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
>>   				  unsigned int timeout_ms)
>> @@ -112,8 +112,8 @@ static int sysctrl_prepare_command(struct xe_device *xe,
>>   		return -ENOMEM;
>>   
>>   	hdr = (struct xe_sysctrl_mailbox_msg_hdr *)buffer;
>> -	hdr->data = cpu_to_le32(FIELD_PREP(SYSCTRL_HDR_GROUP_ID_MASK, group_id) |
>> -				     FIELD_PREP(SYSCTRL_HDR_COMMAND_MASK, command));
>> +	hdr->data = FIELD_PREP(SYSCTRL_HDR_GROUP_ID_MASK, group_id) |
>> +		    FIELD_PREP(SYSCTRL_HDR_COMMAND_MASK, command);
>>   
>>   	if (data_in && data_in_len)
>>   		memcpy(buffer + sizeof(*hdr), data_in, data_in_len);
