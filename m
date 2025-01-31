Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA42C0218F
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 19:10:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C6110E430;
	Fri, 31 Jan 2025 19:10:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fo6vrE7/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1370610E430
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 19:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738350637; x=1769886637;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dbe9BIrmMhjUZT5WCpmLsIiVYZ7EDtkiDN8mN2slRU4=;
 b=Fo6vrE7/eDxk6IxfruBzzVlrCybGGfbEnr7sdforSNSLi//Nvi4t0AaU
 DQDAQYAoWdDwxuB/2UQ8gHQk9+3AKIcpC6hER01HOddphhkGxQ/UUvpbI
 myR7qfWST9lkOqS4RioUCLJUKePiJs7eaLMJoa+h86vk5lasU2guC+UXa
 39meZkMBD2MJUu+GEC2nmeWcnG3fzpq84QT+5KJtJzmbvtWRXzgtXEJQy
 ctjgISNOLefl0xWpJu1VlxSQSHz53Iyc35aiBQsl6A9bIIG/fvYCo2V2B
 aMfp5CIvVk4E/w5jVMLXDxG4WdEYa+BU9qkAFNTH9WdiXPg0RocTFktsb w==;
X-CSE-ConnectionGUID: op2tEGKJTDywld/m+MMgfw==
X-CSE-MsgGUID: /1MA32guT7qYQTVwTIR3nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38631921"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; d="scan'208";a="38631921"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 11:10:37 -0800
X-CSE-ConnectionGUID: t3+7EC5CS/qn1ptzerGI2A==
X-CSE-MsgGUID: YpL0XElSQtSSg/OH088Jsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110587263"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2025 11:10:37 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 31 Jan 2025 11:10:36 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 31 Jan 2025 11:10:36 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 31 Jan 2025 11:10:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZCQS4831QrWKMn5OVrEddM1iUjxCUzGE11pdsia8BiUwXLhplIFSQ1pRggX44dKtHHpDyKrgJIofb8hqLeDK4WxVn5SViXRJ9t+2zH4knP4NoK51vB5/oEsUevL3/+u8CmBtS071FfOvA8AQUxwgj6kNGVDYz+BpzfrhH2GH8R8mMTn5UKi+CJJQYjdh/81WF4UAHvTfEW0t0B/hZKyiJE2hu4/IzPo8crHjdoD0+WsxsseIrPrLesunmPy5TNRP97WpWwu9hh/vOL2ju2WjemEJU3K8T2onePuhUnCCyhYQoYwZ4EWgwFzuQN+TT+SBytBnVs6m5G/WSDfhq8SfPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MuuBY72MSSes1fBs06AS7T2pl/TEJB7d0E/Zu1kuXsI=;
 b=mm9p6dJDCGFOE1gGRIiU9M6dK0wouT6SqgYR/qFb0O8Hmi2yPYTeuveZ4vrbhwTNko+q6GG6opHkLPH3pKpB5jV9aiRkncVL+tQ0Rx6Ifb9ywW3v2WmgCf/+cAedrU+IDGhgw3+tH8PSDLZaSt+mocfSdhr4sHrF3SkXqK6iGObmFDpzFyHlJJdFLsJSIytbsoXesCY2J6GV1leXGYbMhmY99olobbPIC7qeZ7d69EPK5vtHzq6CHjo3LBm6DMqwKs8ixDtGMzYdkiX1k0d4MBDpq6JewiQBQobX0yslni1n1gjgAZL4kRdoy95tSkUvS4XaBLvItdpfGznkzUNFxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by BY1PR11MB8006.namprd11.prod.outlook.com (2603:10b6:a03:52d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.21; Fri, 31 Jan
 2025 19:10:33 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 19:10:33 +0000
Message-ID: <05938b67-c481-4717-9e7f-4bedb19631f6@intel.com>
Date: Fri, 31 Jan 2025 11:10:32 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/13] drm/xe/pxp: Enable PXP for MTL and LNL
To: Tvrtko Ursulin <tursulin@ursulin.net>, <intel-xe@lists.freedesktop.org>
CC: John Harrison <John.C.Harrison@Intel.com>
References: <20250116001110.4158032-1-daniele.ceraolospurio@intel.com>
 <20250116001110.4158032-14-daniele.ceraolospurio@intel.com>
 <77eee325-21dd-42cc-b6e8-44e41d0f5044@ursulin.net>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <77eee325-21dd-42cc-b6e8-44e41d0f5044@ursulin.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0121.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::6) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|BY1PR11MB8006:EE_
X-MS-Office365-Filtering-Correlation-Id: a787b629-2174-45e5-5378-08dd422aef5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUVlQ0kzdkJ0RXRJT04rV3lNenhPbW9BWXloaWlNK1pGRk4rYzhZVk9kMXdy?=
 =?utf-8?B?VUVtSTFVQmdFM2I1YmxjaXdSTzB2ZXNxN09xUFBQUnNSclgwNTVJekw4YkF6?=
 =?utf-8?B?Q3dxL3FMTHY3VUd3WTVURkswendWS2g2WUxicUxJNkY0N210OXg2YWc5OHEy?=
 =?utf-8?B?QUJaME9XU0pvV29mTmFxYTE3Z1V3cUhhVUZ1QXBncTI3czFlbTlrckRwQWY0?=
 =?utf-8?B?dnk5VCtmczcwTmdLTU1uT2RzWXRxbE9NNmJLclQ5MXNVb0hGSEFCRXM1anU1?=
 =?utf-8?B?MlQxMFEweGU0ZEdNZFVaRHR0ajFvUFZZWE9LRmd1Y25PTHIwd0hHMkVsc3RD?=
 =?utf-8?B?S2FpVHRsRVUzN25uNUM1a1B0eHpKM0lUbHkwcVRId0lEeUNEeDVLTlJGendj?=
 =?utf-8?B?MEVkZ255SUFidU1OWk9FRmQ3cjhqdXBPU2cyWkdPWUxEVWxLSmpYZCt4SGhK?=
 =?utf-8?B?YTBBYzdtdGFzaDUxRDV4VUo2TlltNUFDbkUwYzJhbStwbXArV1ZOaDE0ZENI?=
 =?utf-8?B?OEh6ZTQySXYreWFxcm9XZGhCd05oRnhsZXg1Vy9EVTBkOElhbGR1NUMzd09G?=
 =?utf-8?B?L0hoTEFORXdFaTJIV3lwelVuN3M4NTl3SElZNWk3amNMbGsxY3EyMnlva2dP?=
 =?utf-8?B?VG1NUjUzbld5a0tSYVQ5TVRaZHg0cUNFdmI0aXhSU0F4NVdtVlNIQVZHM0tW?=
 =?utf-8?B?VUMzRk5YL1IrZmFWelpsa0NMcFE2NWdjUTF5QzI4aDNodUxrbXlwc3BpV09U?=
 =?utf-8?B?NWZrY0QxZnQxSUJzeGlSM09aMk9KUVRFTHVTZGcydFRpbVR4Rml3bVVheG5y?=
 =?utf-8?B?N1VkcEFodzFMT2JyZWwzaTVseUt1ZzlGRzhCWmJxM1krWFZsMXpaNTN4WE5x?=
 =?utf-8?B?OTJkaUtsR01lRnZqanRXRUY2UStYWk1weXFUdVVVdEVTT21vTDZFZnlDSk5X?=
 =?utf-8?B?MkNmaW1BWlNxRlRzVnM5RmJucFhJNDA1VVlIWDEwRWJkSThzRm1vYy82a3Nq?=
 =?utf-8?B?NTRBMXNkT2tMSCtEazFLZkpKK0ZjK0FvMFE0ekFqNUhobWVUMm54MHdTUUZJ?=
 =?utf-8?B?WXdUT0REWm1oRVB6UkpINHJUZE1WbnhaY3E4NWZBN0pVOTVnamZWcTV0aVBU?=
 =?utf-8?B?L2R2REt6cXhLSlRSajl5ZnBqcjVqWGF5U2RxVHVmUWVVSnhlbUNMTFdTcFd2?=
 =?utf-8?B?OVBqQS80M1FDOWN0SkRRZnlTdVpRazZDMHNMNytZMDB0anhDbTdjZnR3OUVG?=
 =?utf-8?B?d0FndmJwOVNrK3FDS1dTUDVHdStXYmsxNUJkSjQzdGZpcitkNHA0MGloWU5a?=
 =?utf-8?B?NHF1dTFQNjRMZ3IxL2I3ZzRjMnhlL1Q1SUhsOTZvd3BJRTFFcFNab2dIMkpC?=
 =?utf-8?B?ZjMrQWQvNmRVdjdqMlZzV1JQVjZLeUgwTTNDSGhFbHVCS29CTFVxSURFU3oy?=
 =?utf-8?B?U3p4S2VVZ3RoUnJZaUFGVUs3N3M4L0R1emdMYkYxYnp4dERIQXdqenhzT0tH?=
 =?utf-8?B?eHMvZzBqa0psMzBhK2pyd0pRKzNaRUQ5UXZOZy9IV1Z2ZENSYktWZkpmSlBM?=
 =?utf-8?B?WnlMSlA5RnZpK0lCMXI3RFo3Yzh4NXJIMWlVR1lFM3M4Q2xXLzIwdElTK1ZE?=
 =?utf-8?B?d1piSldDUmZjMFArbmhpRCtNV0NFKzFPZ2xvVWxVaklOZkZEMC9aSG5aTDFR?=
 =?utf-8?B?b3hTTmlUZ2JFK0IxUVpzR3F2cVJvTkZ3R2hldEFXdlgxQ3hHTGthS3pCTTA3?=
 =?utf-8?B?cmVPVG01QVhsVEd5RlFxUnAwRUJGZmR1MlZ3Q0Z0dlpVenhNWkRJOVkrdVAz?=
 =?utf-8?B?SkxTdU1FQ1dibWNsOHJEa3l1R0JWazU1R01Pb1RreTRMSjIyMnhGTkRWRDVh?=
 =?utf-8?Q?wiRldkzDqnOkM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVNtWTF3T2Y1WlJzcVRYOUs3TlAzRmhYZUJtTy9ueG5JMHFMT2tQUHBVZjFB?=
 =?utf-8?B?bngyZUVQbjZPTEUwbWdDUEt1ZFZCbzlFWU56QjRXYXc1WXhxdm1EOFQvK1k4?=
 =?utf-8?B?cW1oa3NFVTRMS09DcVhLR2NmckJFVkhKVTFjc2lrTDd6TWxqNitrY09hWHFM?=
 =?utf-8?B?TmVHQW9QTE1HRi9yRVltQlU0Q3lUQlhac2UvR2NNTnRYNk9GMDZTSUl1ak9I?=
 =?utf-8?B?UUJsL213ZFhuU2ZxaC93VHJ0RTd3NXNXb1VnUktIRC96ckRHejJWSDdjQUVt?=
 =?utf-8?B?UW0ybUcxdU1oeFpvZEkxdzE2OE56eGFhcTZJVFhpdytrVlpPaHEzdk0vY2NM?=
 =?utf-8?B?Ukh1QXZPQUhhTy9JS2VWZ0gwbHYxMjYrYldrdmVxa3orYjVuWTZzZ0tydGV3?=
 =?utf-8?B?WjNqdE96bVhEYmxya0tyb0FuQVZ1Vms5aExwbXpwZmo0Y08yWmwzRHdSVHQw?=
 =?utf-8?B?S3JuWjYvTDd6Wno5NmdZYTl0aTFMdTVGR3hncXNWelE0ejRkdXkyaUZkNHp3?=
 =?utf-8?B?b1NZNXRrWXB6TVNQdTB0ZnJYQnMzNUdOcmw3RlMwVmY1WUdkWmFSS0RWMnor?=
 =?utf-8?B?RDMyMGNxSGR6NkxyVk8yT3MzUHUyZ0lzbjNud2ZSUTNBRXBHckhwM3QzQUhm?=
 =?utf-8?B?RUlOZjF2NEFFRDB0bU9sWDV1aERuOTFYT0hDSVBNZkNRaS9mK2FBdVFOalA1?=
 =?utf-8?B?VG1hR3ZaZ1J6TC81NnRHZnZ0RGlmRXNhQW1YT0ljd0dhSDlBSnhlVUEzM0xj?=
 =?utf-8?B?b0F5YjhkWTVIM2NDLzNhTmk4WEtqdGFYNkxlTkMrT0N3a0cwZFJIZERmQk9I?=
 =?utf-8?B?cGh4V0htS2RIeUZ0NkJLYmNXWWFJSFpwRUQyYllSUitXL0RnZXFCYnZLdVZl?=
 =?utf-8?B?dlpqR05DM0xWekM2eVZMeUVTZkFJRDdiZktwWktCVHU3Z1BvM1hnRnUvMytV?=
 =?utf-8?B?SUJaR3U5RWxYM1JPS2huaUFIeUVRd1pSL2p6Z2dKVFVjcmRRZUdIQVVWS1o4?=
 =?utf-8?B?SnpKMUFQd05zOU1WY2VhRlphRm1UUHpObUNhZndRVXFFQjB5M1JjRk12NHI5?=
 =?utf-8?B?UHFweEg5ZWZLV3pSN24vbzFVL3NtMzZQamU2RFBEM2luRFJvTjE1cmsxQURG?=
 =?utf-8?B?YXNKaTZTejBqRUVKdVk1YkhOUEU0K25LNlFRckFXWVRvR0hjS2pHZVROM2tK?=
 =?utf-8?B?UHhHM2xvNFhwclZPczczNVNtaWpiWncvZW9zU3BpR3d6K2w4NTNONWdzWVJS?=
 =?utf-8?B?eVYwdEU3TlBZeU1HSlA1dTM4ekZrQjlLMXZvZ3pTRE5sODF6TGt6bDFCUFdn?=
 =?utf-8?B?N1cyZzVuaC82WlB4WE1tQjhEZHhQMnhoeTk0Zzd1M2dNNHFyUnRHSUlrek1j?=
 =?utf-8?B?RFpRQ1pXU0ExRGwzSmpNNmVRcXFQMWswL2RjNHR5Wm12Qm92MndSNkh1eWw1?=
 =?utf-8?B?dVNlaGs5S01yb09MYUFLZFkraWZCT3hVRmJLOWxyMUo5SXZpUkhjMFRGSkQ2?=
 =?utf-8?B?Y290RjREVXhxaVRyTTlES2RENVJMYnVUdXN4OFM0R282bEhIY3pBS1hPaFJ1?=
 =?utf-8?B?WG5NeTcraUtLcUgrazFTWXJDYmpncW4rcFlhR25GMElub1JOd1pSZERzSGJ1?=
 =?utf-8?B?dVZvLzVYalNjeUt0UWJXSndrYzJwalI2VzBQVFJHMDhmQlYyeThUYTlpbUE0?=
 =?utf-8?B?RXFXbXh0Skp0dEFFcXJETFlUQ1lGTkc5VzhMYmdPVmp2bjdwUVZDQjdIR0N3?=
 =?utf-8?B?cFhENTlkdDNDbEJoVEtiSHcyQkN5S2lwNExVUTFTVGc2dTk0b0tublpwM2ZN?=
 =?utf-8?B?S1JVdU8wTGpoZlB6QmpHTUd6Qzc2L3JKWE04OXRWODdVVFB1Rkl3c0RZaDhY?=
 =?utf-8?B?Y0R6VU9LVG14dTJZbFU3ZEFqemh6bGxaa1lseXBodTdzYWJyNE1BK0VVZU11?=
 =?utf-8?B?QnFTTXlkNUpPY3pseld6UFpHOE1UOGFpelFLY25XOHJTc0VEZkZHd0N4dUE2?=
 =?utf-8?B?YVpzZS9WWWZnUEdQUXBTNDJwMDNQZ2hNaUk4MDNHYjlqODluVXkxQ090Sitq?=
 =?utf-8?B?M3ZES3NMK2lJRkFNVGhBZnZiZDFBdCtrd3pQSkpIdXp5aGtrcmVRci9Ibkox?=
 =?utf-8?B?NDROODhBZXdjSnB6RlUvSXZkU0puNE80QW5GMFZNc3ZWRGc1enFWblFWN1FQ?=
 =?utf-8?Q?DqRX5Zt1whWUVeeufuxDDpY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a787b629-2174-45e5-5378-08dd422aef5f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 19:10:33.1090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EB7XYpIDEG2yPAKTGSmhR9VgsasJhOma/5Ji6MymQqMSB3W+TKe9cpcC0c6zepnekCAdFgPdNXba6PzqHwU66xS8b/ncqYadrvn4sKhRfXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8006
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



On 1/31/2025 4:08 AM, Tvrtko Ursulin wrote:
>
> Hi,
>
> On 16/01/2025 00:11, Daniele Ceraolo Spurio wrote:
>> Now that are the pieces are there, we can turn the feature on.
>
> Would it be possible to have this on Aderlake too?

Not easily, because the pre-MTL PXP back-end is quite different due to 
the GSC not being there (need to go to CSME via MEI instead) and due to 
it using a different PXP version (4.2 instead of 4.3).
We're currently not planning on implementing PXP support for ADL in Xe, 
but full support is there in i915.

Daniele

>
> Regards,
>
> Tvrtko
>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pci.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 44f59af94652..c9c88a818b2d 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -336,11 +336,13 @@ static const struct xe_device_desc mtl_desc = {
>>       .require_force_probe = true,
>>       PLATFORM(METEORLAKE),
>>       .has_display = true,
>> +    .has_pxp = true,
>>   };
>>     static const struct xe_device_desc lnl_desc = {
>>       PLATFORM(LUNARLAKE),
>>       .has_display = true,
>> +    .has_pxp = true,
>>   };
>>     static const struct xe_device_desc bmg_desc = {

