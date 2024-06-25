Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC27C3064D
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 00:43:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C10510E2A2;
	Tue, 25 Jun 2024 00:43:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n1uJX1oN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D08B210E2A2
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 00:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719276204; x=1750812204;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Dn6Qp6pytsfZPrxHUEKw6OEztPf5JU/FtdVseYNWldg=;
 b=n1uJX1oNHEIiNfgW7bmAU4IvxrRAYCXSjAtkJk0WwaS+6abMbOBVzxf1
 RQj8yn2t+mBsL68JdIbCv46B6irIO3SV5WnAnlz6aqANgxMiOEuIORkir
 xth+UpxGOBYedLJ7F0gN4U5b+ARzE8iAvpNZE/tJI301OHqUNtV6I4aOT
 VzRFAwGFDJARLnhBCYrJyXcPnYeTXUm80C91hA6alOWtkxrKrZJ++pDDR
 AP7VsI67qvEgll6C7y0pY8mPhK2qlhuBsTxYgx65AjynEE5xIKTgHDjdf
 oSCxpPniQyoo5RP2stKbWu+iHmyPfcDRjVj+8M8WwW+izR5pXYsF7MIVX g==;
X-CSE-ConnectionGUID: W7j2m7ASS7unRsys5EY58Q==
X-CSE-MsgGUID: FPzik4GhSqa2hBNVlxrwig==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16149513"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="16149513"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 17:43:23 -0700
X-CSE-ConnectionGUID: UlSPopjWRvaEfgFLEOhjag==
X-CSE-MsgGUID: HdZUBW2BT7+C0v6asXXNgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="74676413"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jun 2024 17:43:23 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 17:43:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 17:43:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 24 Jun 2024 17:43:22 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 24 Jun 2024 17:43:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b23HnWqGlr/K6qJNWDjVKnc62KvRnWXc1fapGOihPbXpHAsnD86AOsSADbGsYU6TEPRLJXxk4rVzSzIfhJzSJLEmt1GyJzrQj0D0u9nh5mbN73k0FNKRDYqTh5e6hPURMg6bCsa+P9dSofBKu5xiPbpuGMO1q6L3Z4JbiALCUFooWTKaX10OjJC26qXXql4W7OB1KwbhXhWlPGg4UDbG0Ytm8lipJdLqbd8W6errbcDU83WEDbA+pWutyHz6INKy7EgttMcquQ2XYlrqC5Te6XPrF4VyaOAFt4WSyTuTT8KV3VW2saVlrY1hL4OTc7v2ijFCBKo4XckdZwr9I3AhlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUE2hwDJnVOO77uiJjK7QU53Q3WkQE+8+DI5GkfPdV4=;
 b=gttRq3fVYYaGe8cAlwOWOCCLfeFjV3i6u2NKznwWTzKk6yO1F2HFovPtt+Y7PvPu1p6xGpFdmf3PtRSTGFgNuG8LP0nbHb5ZHjjYz441zpjMpue9GkYA/12OtmY3w7IJ4ZqBIdmowgRZOnACTxhzY+qmr8Hc2BpQJNkVVDkVHcgTShRvlhsz6DkdSeKo+RKQrZ1UIV6Rkkt/Ylv41WSRmH01Amy3uLUZEbRMzoIk8FeyghkSZTXzUUW+bCU8dzFNNn147lxkLH1zZ9BeMMAOgjyIoaJWbxdJxr5068msm89ravpfuMBHhyuh+brx1pndEwLXVF8FWKIbVxZZU0ODng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CY8PR11MB7947.namprd11.prod.outlook.com (2603:10b6:930:7a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Tue, 25 Jun
 2024 00:43:14 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 00:43:14 +0000
Date: Mon, 24 Jun 2024 17:43:11 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Get XE_FORCEWAKE_ALL to read RING_TIMESTAMP
Message-ID: <ZnoSnxbRiQm+rGWk@orsosgc001>
References: <20240621192325.227230-1-umesh.nerlige.ramappa@intel.com>
 <yolllanxh5neppqhi5whzwsdxetbqfkzurfsbaf5x63s72tppn@e7c6xhqf46eb>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <yolllanxh5neppqhi5whzwsdxetbqfkzurfsbaf5x63s72tppn@e7c6xhqf46eb>
X-ClientProxiedBy: SJ0PR13CA0022.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::27) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CY8PR11MB7947:EE_
X-MS-Office365-Filtering-Correlation-Id: 7682e0af-095d-4cc3-6315-08dc94afcbee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnlEZjByd1V6UllpQXBacTdvWmt4S0FlY1FjRkZqQk5hOWdrSEI1ZDJ0VUpF?=
 =?utf-8?B?bVBsSEJYUEtyaHpYREc0Y25pQnV5b2g4NEc3Z2Y5Zk1md2FTN0FqWlgrVnpI?=
 =?utf-8?B?QnVlcXFJYjErN3Zac1dxblloV2FTTGl5ZXJSS1VFemJHWW1RVVJKeWllWTJj?=
 =?utf-8?B?VDNBblVLQitiai9CakxxQmJPNVdaa1FEVndJZ2h6YkMzTEYwelFrT3FIQzRq?=
 =?utf-8?B?NWxucXRWSU9xR216dERDSlRjWGV6cUlCdkQwOURjaURvRlNEZWVKb3NiQ0pp?=
 =?utf-8?B?cXl5WWk3SGxHYXI4UWJzdU9VTVM1Qld2bDVjZktXNzV0L3dNdmJCUUR5S2x4?=
 =?utf-8?B?NHVIOHhXcWlXeCtxbXdxVThwcDN2NElsTVVJTS83ZWpwM1M2VmQ1RGxITGsr?=
 =?utf-8?B?Z0V1SHBxdHlOSnVvRDVSVEJKc0pQVUFvR3VoMy9XQWJ6QkprN2pJZ3lpMU00?=
 =?utf-8?B?aVR2ZWl3UlMwek1GUHcvRnFIejdmdDI4eXBkRGE3MTVTeFFBN1BPeU16VmJ4?=
 =?utf-8?B?aHFqUWEvb3RENVFzQnBHOHRhV2lpYk4xMVdETC8veDlxeXYvTlk1eldzYlM1?=
 =?utf-8?B?Slp2NHJvWWxBazA3enVrdzYzeG5iODJJRGpOR0dDMHJXeGlBbEZSZTZZbkZo?=
 =?utf-8?B?a29mbkNnN2d1SUV4VUlhOGFhWWRzbGxON3NZQVZQNVNjRXNWOWoxalRCc0Vp?=
 =?utf-8?B?UG5EYURWMnA5anZUU0lTd2gyTGl5eURMVmQrd0tMUmRSR2NKMDZiaTRnQnkw?=
 =?utf-8?B?Szc0ZENJVlBFT255UW5FcmErenVTRVdsN0p0bFhtYlZGSEdqeFdHOVVYdjdG?=
 =?utf-8?B?OHVsRTZESzYxNVpDNnR2SkUrd2UyVDR4cHdVNTJtRHdWTW9pUlgrSEJMWUtn?=
 =?utf-8?B?R0xleTlaczErazl4VXEwL005M1FtT2FPRlJ3U296V2RSaXNUSy9IaXNUbFJH?=
 =?utf-8?B?VHBPWFUydzdkVC81aWk0MGhwZ1lhcW9zNkFUTDRkL0xxOS9ZYmdkWVBjSjJu?=
 =?utf-8?B?M0FnQ1hKem82djN2ZnRFWXJVdlJJcDBmN3dTWkE3OFh2d0l2ZjJEaWJhLy84?=
 =?utf-8?B?OEM5MExsTVdITEN5aWF5ZUN6N1c2UkVjbFYxcFhmUVV5RWFxVFg4em9WRGNL?=
 =?utf-8?B?VUJUU3dNZms1VktzSDl6WVo5MWpQYUw3OVFLSC9mSm1JR2FEMHpmcWtDOUVF?=
 =?utf-8?B?UWtKMFh5bmkvOXJSQjRHclZ4UlYvVEdIaks4eFRFWVdiU0ZwU3JEOS9iQnFk?=
 =?utf-8?B?S1FvL052NnFlaEtzMjZoYk5rMk9uNUhxbWZxamtKMDRqd1Y5UjhYai9BTzlx?=
 =?utf-8?B?MHljaXpoTnltSTRyeVJTdkRxZ3dCenFDOHBINTYwTFp4SE56c1VkZXNjS2Y1?=
 =?utf-8?B?MUJZekZwRTN4TkZ4Q0FGb2xLbkFyZnJCUEVueEQzZ2RXVzZoSXRqUjNSWk9S?=
 =?utf-8?B?ejlEREo5UGhiZ3hqRDA0Y3BtZ2ZKMDJKek5kM212ajVPTkFWeUljcmxoUXR6?=
 =?utf-8?B?bllSWFZXUEl0UXhMdzErUVdlejdLa1MrWTNpZDlxT3dRVnNxUDUwbVNUd3Nn?=
 =?utf-8?B?VGowMmYrQXRTTW43OUZReE9rb1F1ZlMwZEU1cjdHTWJyU0VoZGV5cE9ROE4x?=
 =?utf-8?B?WFdkRERQUGNaSWhxdHU0cjdiWHVOS0l2Y2RRNDJnelVXbHhiOVZpTXhWSDBa?=
 =?utf-8?Q?b3i/65GA5RGzhNuP7i0F?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzNGV2Z6bXhEUzAwVW45R09CSkRHMnhZYW9jQjhSd2NaYW5yUUliYWtHT2NL?=
 =?utf-8?B?MUNreXZvMUczYUhBVUJVNit3TlZ6VDFBZFJ6VnZ2QWlQazVUVjFPWDYzRzRh?=
 =?utf-8?B?RnBEOFIwWWNMaStSK2VibUFkQVlSc2dVZk5nNkxXZ21hbE1rL2RwZWJ5YlM0?=
 =?utf-8?B?SjNNejk1Sk5tWkRFblBKTkMrYmRsaHROQXE1RnVuMnF0ZFBrbjA2Q0dMUG13?=
 =?utf-8?B?Y3cvVVN6R2dnL1hPbWFkWXpWQzQxREVWWisyVWVsZ2F2cWJtQ3dFd0w0STJY?=
 =?utf-8?B?eEVIZUFiTXFqZzl4czhvNnY0WWlpRFpGZWIxTDVpaVd2ODh5VWw4bUVYNjJB?=
 =?utf-8?B?TTFMK2VOVDVvMEhoNHQxYXJGZGpNVDhuaHJ2VmZMeUpRT3pOV2pDb2M1WTc1?=
 =?utf-8?B?aTNFdHp3aDZvaTBJKzgwQ0FMSmdPU29nOFhERGlHeUUrSVJTWWVvV25lV25o?=
 =?utf-8?B?ZktDdzE5ZzFwSmE4ZlNVeXJscFZnNXVrcmJXRjRMTWg1cHA1S0NuWTdZMHIx?=
 =?utf-8?B?WXhvczFIWk14a3VzeXZVWGNFem91OTFXUVd6K3FtaDZtU3JEc0xjUGczT1Vh?=
 =?utf-8?B?dWVkbWx6OEgrc2NKUWo4R1hNSGF6UzlvQnhFOHU0NFR1eWNvZ2lQSTZCU2U1?=
 =?utf-8?B?QVJKM1dCbllUS2xyK3FEK1oxeEpGRXpVa2ZnY3pqM1NCZEtLQ2VVeXJhbGlx?=
 =?utf-8?B?eVdMRlRKRWNXYVBEazJwenZmQUYrNVd6ZU51SDMreEZZQzc0VzlYZUpLQStD?=
 =?utf-8?B?WGNLTjZVaERkWnI2Nkw5MkUxdjNzaE9mTGRRTmp0bnBXZUlpWHRqTkdaWkZ5?=
 =?utf-8?B?S2V6S1Z2ZGhhUmo2blF0dVlySlpadnByalEvUXdTUmRaM1FvSFFIRVVEdU9m?=
 =?utf-8?B?b3d6TXZRNHRvejFhcnRSeW5YajFQVVk5dTdtSE1WUUx5eWlZbnlFZGdkS0pv?=
 =?utf-8?B?Ykc3Tzh6Z2hUU1NyeWZYbXVPTGRPcE9BcHhXSTNpRi9abVZuYXJPcXRWaVRk?=
 =?utf-8?B?SXVuVkZPQnF1ZFFieUhUN0NYREw1ZGp3VXAzZnJla2tTb0hzTlJ4T1U2WWJx?=
 =?utf-8?B?MDhsSC9mUUdvVVNYcVJHTG4rQkFlUEUxUFZjRmF0YjRSU21ZcFZhQ0NFeWUw?=
 =?utf-8?B?Y2tOd2VIaHoweDdHYUJCZzNkdlFGMjdKL2QzWk15a0h4bG1zdHpsVHljT2xv?=
 =?utf-8?B?aHdiYkY3QlRFWEhiV0VLZHd4ajVucHE5QWlpWktCWEF2YzJPU0M4QUQ4Sit2?=
 =?utf-8?B?OWJMcXBXKzEvVVlkN0dCcXlEb2lMclBPSTAzTXBkMXFBUkxEY2syQUl2ZGFB?=
 =?utf-8?B?UUhPNlpvL0ZrM3JlcWIxK0l0Unk5Y0VzSXJYNThuc2I3d1hOQ1pmYmRVYks4?=
 =?utf-8?B?UWxqenRBTG1ybitvT09TUkplQ29FeXpQS0UydEVwS09NR2duclVmNGw0d2Rw?=
 =?utf-8?B?R1V6cVhUcURtdXBQY2NFb1g2SWVhb1lpckRDUGI3a2JPc3JUVXVPaGxESFdP?=
 =?utf-8?B?WHJsR3ZRYTJteDNQWUZlNExqVUxKWlphbVY3MTA2YWNYNnp1NFpwWVhSTnY2?=
 =?utf-8?B?N2JXbG52SUNxaFcrU3FVUnJHSk9SSmZpb2owVWcvSnB2ajl3R0VHSkpKUnpi?=
 =?utf-8?B?eW56Y1JndVJWeWlFa3hZTVNhT2FUN1JWODk5RVhxLythemN6Vk5NRHJaMDI4?=
 =?utf-8?B?MVdYOENQL1lQWkdrdTRxaVlXSVlieGNpVkZUUnhkTjRHN3FEVjkwYjJoaExY?=
 =?utf-8?B?QWpxTTN4TW93SzJqREhKZXp1emlzS21SdFp0ckhEOHNzak5jbmVqR2VkdHR1?=
 =?utf-8?B?MGt5VXM2Y1RnVHIrMHhMNXJKQ3hIL0FTOHRrRjNTOHQzR1Z2TFVVTCtFcnpH?=
 =?utf-8?B?M25iZnJNbzRFZ28vUFIyOTduVWxPS2RadW1LdHYxR3ZmbkZDdGwxK2NPTng2?=
 =?utf-8?B?dkRUdlZjbnJFODJra0xTSVlaSlhVYjRQVnJkbDFMU0VRc09mOW14Q3Z6aWVJ?=
 =?utf-8?B?bkdCV2xUTDl0T0xTYUtjWGM3MExPSG9wNGYzWVpQOFRYS1B0dGQrUWhiWGxX?=
 =?utf-8?B?WGljd0ZDcUNFa1NPd3JyTkJpV09WVTh5emN4cmI3ZjBYRklvMExhTTBnRS9W?=
 =?utf-8?B?bDc2YlJqV0dsR0grTXBuTnBSY056QWU0ZWZ3b1hyNjNic0ZlRWg1YUFyWUdz?=
 =?utf-8?Q?Z9FQq/HvHt9Ldr3zgEW3yrY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7682e0af-095d-4cc3-6315-08dc94afcbee
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 00:43:14.2509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lMFDCsG4iFrcKCfcYzr4nstrEhEmdUnog3zj0cCI6U8X+/tX/x5rPKutdHIKetl3FjjVwKJAdCtiRk6YW+CUy94zCKsR1HEGjqWWnW7QdxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7947
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

On Mon, Jun 24, 2024 at 09:44:03AM -0500, Lucas De Marchi wrote:
>On Sat, Jun 22, 2024 at 03:23:25AM GMT, Umesh Nerlige Ramappa wrote:
>>Per client engine utilization uses RING_TIMESTAMP to return
>>drm-total-cycles to the user. We read only the rcs RING_TIMESTAMP in
>>platforms that have render. While this works for rcs and
>>ccs, it is observed that this value is 0 when running work on bcs, vcs
>>and vecs. Ideally we should read the engine specific RING_TIMESTAMP, but
>
>what do you mean by engine specific RING_TIMESTAMP? We are already
>reading the engine specific copy of the same timestamp.

We read RING_TIMESTAMP from the first available engine which in my case 
was rcs (DG2).

> AFAIR just getting the gt fw was working for reading this register 
> from vcs, vecs, bcs.

Well, issue could be DG2 specific, haven't tried other platforms. Which 
platforms did you run it on? I will try to use the same.

>Can you demonstrate the failure with a bug open or a series of
>intel_reg invocations showing otherwise?

This was found while running tests in this series, so I don't see any 
open bugs.

https://patchwork.freedesktop.org/series/135204/

xe_drm_fdinfo --r drm-busy-idle --debug 

>
>I think the simplest way to show it doesn't work is to call
>`intel_reg write` to get a GT forcewake, then `intel_reg read` to read
>this register.

Don't know how to use this on Xe, I get a sigsegv.

sudo ./intel_reg write 0x2358 0x00c0ffee
Received signal SIGSEGV.
Stack trace:
  #0 [fatal_sig_handler+0x175]
  #1 [__sigaction+0x50]
  #2 [intel_reg_write+0x589]
  #3 [main+0x339]
  #4 [__libc_init_first+0x90]
  #5 [__libc_start_main+0x80]
  #6 [_start+0x25]
Segmentation fault (core dumped)

Regards,
Umesh

>
>Lucas De Marchi
>
>>to keep the logic simple, just get XE_FORCEWAKE_ALL instead of XE_GT_FW.
>>
>>This should work fine on multi-gt platforms as well since the
>>gt_timestamp is in sync on all GTs.
>>
>>Fixes: 188ced1e0ff8 ("drm/xe/client: Print runtime to fdinfo")
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>---
>>drivers/gpu/drm/xe/xe_drm_client.c | 4 ++--
>>1 file changed, 2 insertions(+), 2 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>>index 4a19b771e3a0..74f2244679f3 100644
>>--- a/drivers/gpu/drm/xe/xe_drm_client.c
>>+++ b/drivers/gpu/drm/xe/xe_drm_client.c
>>@@ -264,9 +264,9 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>>		if (!hwe)
>>			continue;
>>
>>-		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>+		xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>>-		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>+		xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>		break;
>>	}
>>
>>-- 
>>2.34.1
>>
