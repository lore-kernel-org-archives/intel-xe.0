Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325CDCCF9F8
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 13:39:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E98E410EB41;
	Fri, 31 Oct 2025 13:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HKWvJz4A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C359C10EB5A
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 13:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761917948; x=1793453948;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=KGgxnOEUdI1Y9CCdFHtyeH1AssoUrRZoqrDt1hXcyxk=;
 b=HKWvJz4AQJVFw/SUDK5GUDjox2CYu869UQZHlRTqnbMg338lxa+EaOM0
 J7WgWsCMSUIOFJqZ+Uf1ad3mT6AtFBCNHpBEJN5KiBEN7ao9K/13cOoGK
 VjbNUByMh05KVrHJvqsRDSfHLiHqYmwmFsGBTkWvJSX3Tg84YgfM5HhnC
 r8NM4Dq6WIiVPczJDwb8uj8o/qaKR7igOr/jl0FByJwsMFeom7LHo3IJO
 OP6vAuPK5Z5io8pUbbJoQCdHgB3WnrETWONJH+gBRH3rI67Wbj2b0cVGQ
 4Ox58YCRmpeMssqaZRizNLfpVQUvX7jpxE9+ydObT7CohmK0OfVmaS8ma w==;
X-CSE-ConnectionGUID: qVNp9iKaSUiEuFXNDCh10g==
X-CSE-MsgGUID: iRC2FyiUSq+HPIMr9Zc6rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="66691561"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="66691561"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 06:39:07 -0700
X-CSE-ConnectionGUID: ZqUuhtf2SSiMqlIatgY8iQ==
X-CSE-MsgGUID: X5q6+Sr/QaKF6UkBs8DrTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="186115139"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 06:39:07 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 06:39:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 06:39:07 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.24) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 06:39:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t3ItEHyEOO9VudHjrlNQ5kfXt22NZUAVmCpHCOKlVVTfueEJRuwJykNur6LLXAghCN7l6wo2+V9ViaGoHcyOdvVbriN5zFRtrhYKa5gYsBQeX5TaJdM/PcMQE5Sal2YvrxUknswPLnv5W2ganG6MtMnyaoHQnqBQ8eEd0p9yCBFSHMoBj58wHFRysta4RhiZe7T3JK5YczW4+/omkNoGT6GD/F4GDjJHqSS3395QdVlhIJ2fr1xuIFetEMKGF0TLAtxuYb67Jeajrvjs5+Iqa1kml7ETG/sfaGWEmfJ8xT/kR6Wv/JOJh52iiY4jURn9/uqmiFRH0oihVfCjYw/yzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nqOIwfS8M7a2wl6RsnVvhIfevL7uVJzxrvwZE2j+2Q4=;
 b=gNK8Ype4My+jWUJElyFgR/3q9XlN+t8na4V0vuB5IB0wvUV2iVqiMHc+bM0E0CEdbOTtncqn/LJwsrfihJOG1+Q/nwVjnYCwewYAImtLCnWMsKfOuvnpMJ4+yseYWbwOsmgRx8R/1FHPxBwOjKLpnkE7zIPrIyJRPF0aLhnT5QtLsyBkGp/QYHwsBPYuqKPpPzBlQ/94/Q093o5oty6d+fJK2v2l+hH9U7wSCHcMbhwCXlAxhZQ6xKs7sMGrld5kqm3dhxkN5PW5q0fXFcHTWcqCxDsA07bnulSBsPin9XZ8DOXQxTK3sRI79MdyC7kh61/S3Wzm3PznL53M1F2v7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA2PR11MB5114.namprd11.prod.outlook.com (2603:10b6:806:114::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 13:39:04 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 13:39:04 +0000
Message-ID: <8ed51e33-5ec6-4f48-bd34-902ca456bcb0@intel.com>
Date: Fri, 31 Oct 2025 14:39:00 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGUvcGY6?=
 =?UTF-8?Q?_Allow_to_lockdown_the_PF_using_custom_guard?=
To: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
References: <20251030223031.186685-1-michal.wajdeczko@intel.com>
 <176191747289.5608.5328448566064456121@10055242dc62>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <176191747289.5608.5328448566064456121@10055242dc62>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR10CA0120.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::49) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA2PR11MB5114:EE_
X-MS-Office365-Filtering-Correlation-Id: fac4504a-1dfc-4be9-a03f-08de1882dbb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vk9xMFRRckVaTWxUdDVMY2FEazRJc3dyeXV4Qk80bTVKVzMxRy9uTWRoNm5I?=
 =?utf-8?B?c2xoVzRpbkZXRjhGVHNxR3BmRnhJdlU1R0hjbXZTV1Z0d2ZPNjIvZ2F3SHhP?=
 =?utf-8?B?U1lmRjdBTTYrN1hNbHZFTzJZWFo3MjFyRjlBc0xxa2VQVVk3Vm5ucTRrNWJy?=
 =?utf-8?B?UzhPbWJWd2VaZG9lQ0tsQVJGNFpjZkJsVnZkcXJzZ1RRbmtyQXBiVWYxWE5I?=
 =?utf-8?B?bWgxODRRWGVaU2hhcEpBVTlTSXQwL29ma2tnZEtRMGViaDBSM2xhR2QvRzBn?=
 =?utf-8?B?d1Y5Tzd0M0toU1FJUkc0TU1VMldKOWh5K053TkJnTzJnOFlrdFoyZ2Q5Q1hv?=
 =?utf-8?B?MG1sRzNXVUpFQjVEVEk0TGllNFpJelEvZC9RTVBVZXdURTdaeVdTUXJkU1dX?=
 =?utf-8?B?Smtvc0ZyaS9UL3c0ZDFSVHJiYWtmVmJlRzdyTCtwOFVxTG5RNHJMS2s3TEZa?=
 =?utf-8?B?a3F4c25JWWpzUlF0TVZ1dXFCNnIxZU9rdjZRZExDdlgva1VGcmZJa2hpbWRE?=
 =?utf-8?B?MGNnMVA3N1drZmFZUGtMNHZSWGhJVnB4aEZDaHU0R2ZPQnB5Z05XZkhWcS9P?=
 =?utf-8?B?ZjBLRmduanJOcHEzRGhnL3h4NU9pY0tPY2FjNmhuMCsyKzg3RmRDSm0xQnFV?=
 =?utf-8?B?Z2cwV3Vmb2Yyd0F4OUY0QUIyZm52REJwSEZzOUJJUGMyRnBWMnJBejVDT0Fv?=
 =?utf-8?B?aUZyYmRTdjROTUhVVzNNV01Gb0hwQnAySjdYZVZFUlZGaUk5SHEwRHFjVUJL?=
 =?utf-8?B?eTlPWW1aNDB0Sk5kZ2FoeG1maFQzWUF6VWhQVW96Y2YxSHpHblhPN0ErODVs?=
 =?utf-8?B?WERNL29MODFjbzl4ZDk1NFkrYzg3MFNFcVE5MDFvQ2c2RnpKdDZ1Vy8vZXQv?=
 =?utf-8?B?VHpkOGZlYUxvTlNiUWg1d1ZXaGhBS0RXSWNwcFJ2MWZTZG4wdWovOTFoREVp?=
 =?utf-8?B?YS9MUEN1WEJYOTdkRUZlcUpXd3JmRjMvNEhyTmVleWhQK1RzTHR4OEdDVVJa?=
 =?utf-8?B?ajYrcUdqQUZQZ1JQWjN1dVF3L1lnSWx5cFRiTUt4MzJHQWJrS09DaUdDcGVM?=
 =?utf-8?B?enkvTlFCU0xLTm1iTDJWUDNEeDFsRDM4cHZqRnZ5Mkd2YVRkWGJidGZJSWsz?=
 =?utf-8?B?cW1LMlFER0lwN2JVeVYvU3J1NWVSK0piUW1Lc2lXUVRTckRIc2RGbm1XN2tw?=
 =?utf-8?B?aHdSbC95Y1pJeEhSK0Ezd0piTUxHUFBVbUJURzVYSWhEYVRFS3FiaGlsQWk0?=
 =?utf-8?B?amtOZWpvREVPSEZVdlNYcFFNVWY2SExnYzNFT2FqZkpQRk9kOWkySmp6VWdP?=
 =?utf-8?B?bU5GSEIvUFNMV1dwOGl0SU4yOTlnNStOUkF6Z1h0OS9wY1g5clNvbld4Qm9n?=
 =?utf-8?B?NEhZTVBVTGdBZDBsSnhKb3V1NXZkRmJybDhNdTJCMWlGeFd5aXZ3Vi90RVAz?=
 =?utf-8?B?M3JaYy8zSGcycEhGanVES3NTb3F1R01WRC90cGRwUnliS2VrM1lUZDFNR2E1?=
 =?utf-8?B?dnhCVkxCVE9jY1hMQW96MndHZThlR1g0SzZHZTlXSTdVQ1A5OXd3OHQxbXNz?=
 =?utf-8?B?ZURNaThOL216ZEo3TUFpbUxWRDAvTFFKclpwZUUxNkd5T1Y3cXBxK2VVTmti?=
 =?utf-8?B?SHhiUXVZeHFuMXdYeEwxVnVHbzlPSlI4TWVXRURZSjBuWGF6ZmU4Y0dOU21U?=
 =?utf-8?B?aU5hNVFlMFZMclBsTlNVU1VrODFWdERUeUNwck91aXh1VjVOb2J4dzNxbldZ?=
 =?utf-8?B?RU5sbWVYcGJ1ekwvamFoSGNmaTAvZG10SUFmUWZMa3ZZL0Rja3lSa2dQQ01V?=
 =?utf-8?B?QmJmQjRwOEZLb2ZKNnhNSHZzL1FScURrKzlueUhnaUlxWnM2SnNLR0R1TXht?=
 =?utf-8?B?dWU2UTU3VVRlOVYxNGViTWlicXJKZVFEUDZ4UGtpNGhhS1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eW43SGxqZ3RjL1hLdVMwUFI5TVMyK21WWVlFSk8yaFFremRRcGZWcHl4dWxJ?=
 =?utf-8?B?bUwxTkw1YmdYUUtGaHBKQ1YrN0lGOEU3UW1MM2l1c3FrUWdDY0lUajgrMUtx?=
 =?utf-8?B?MmZIQkJZZHhFV3U0LzhVUXJHODBHTVVtUnI3a3d6SnRCTjZ6eTU2anpoc0J1?=
 =?utf-8?B?NVRJNVMvaHUyd2VRdGY0WE5NYW40dzhaM3E2NklxSE93MzZKOVJxVGtLZVlZ?=
 =?utf-8?B?cHI3V292VzR0b2VtUHBEamVza2lqTHk2Yi9Nd1lvdC9UTExxNXNacmUwTnhV?=
 =?utf-8?B?bkZiQkVaalo0aCtHYUxlR253M3hjODlaSUpxakJ0R1pPZGM3R09pM2p5cEFo?=
 =?utf-8?B?WERXemxTQ3RROXVKM2tjYldaM0crU3VsSWZWNXNibWlNeVdjb1RzRmU3TVdI?=
 =?utf-8?B?NW5UckViZ1p0WTh3ejFEWG4rM2RrYTNRVjN3ZnJTZlpINy9FUFJwdlRxbEYr?=
 =?utf-8?B?amRpeHdOR1FWOEZ3MDRXMytvc01GZTJxbTdsN25ybWVmWWtaWWIwZDdEN29P?=
 =?utf-8?B?QjJsaVNEbnJ0eFZRRHdSWkRoZTcxTzc2VTBIOHF6M0NNOGRpNWRCSGVEaG1r?=
 =?utf-8?B?YlpLTkZzUGFvWC9PWWhwUkFIRmttZmw3K3ZFSXFnLzczS3YyVnAvK1I4a1cw?=
 =?utf-8?B?QU9aS0dScGxZUkdhdnl3UGxaSXdad2RUMjNRam9JbFpKN3FEa2pZVE0rMzU1?=
 =?utf-8?B?QldRQld3OG1tNHg0WXVRb2UxTG5jc3FXbnJTYzVGZ2hKdU0wUDFSOUJYanF2?=
 =?utf-8?B?SEVsdU1VSXFSQ0M5T0d4UnVWVERvUXpxbXlQemZ4a3BmcGljWTQ3YXNBQkpF?=
 =?utf-8?B?T3BCWHRMVDVRbFBCclNoOEZybzZ2aTNXVWF6MkdHZGR3eUxFaHp2bTUzZmY2?=
 =?utf-8?B?cmhBZStQc3R4NHpydUFOSDJ6U3NVdGZWZU9WWlpxd202SlZ4T3Iybkp5NFFP?=
 =?utf-8?B?N0hBYTIrcG96VTNoU0FCKyt0YjVNOFUxSW50ZkZwU1lDOWpMWlpjQ3dHR1F2?=
 =?utf-8?B?RWlYdjlhSkNYNGNCcDF1eXZsM0lQUFdUT0J0ZnhYR1JVb1AzdmhmM2I5aERm?=
 =?utf-8?B?UmRjRXRBTnJ2eXB4aWtOdEV3K0lMRG9tYUl4Q0FyRDZJTW54ZTU5WVZLSUVH?=
 =?utf-8?B?VkhJV0xlVk80VWRWVXVzeDNMb3lVZnlZNEN0VkZjS2lrWHg4RkJHSzlobmsr?=
 =?utf-8?B?ZUljQzVFYWM2RW5US29YZmVzL1lBZEUzYTcvVnpmWm5OUFk5YmZqZWVib0c4?=
 =?utf-8?B?dGZRcm0xVDhOOFE0MWRuMWRicElQMmlhUU1uc3QrWStJcE00V0ErOFN4MHFF?=
 =?utf-8?B?eURTRW5jK1FqNitxVllSMk9Fc3FuYXhBam92MUxHT0h3S0srbHR1VXIzNi9Z?=
 =?utf-8?B?TklzWnd3dkVhUUlmL1lNZWxyT0x0UWZRQm5RUHNyMmJvcEMyOU9WdFpmV0V3?=
 =?utf-8?B?S3ExbzdOYlQ5ZW1hTU1lQ016cStsSkFSQndpc3BUK1I4bUZEYU4zMGQ0S2J3?=
 =?utf-8?B?UVdZMFdyd3QzWFBCcVl6L3o2ZVp5L25KQ0xkbDVnZ3oxWlVDLzVmUHZrbHF0?=
 =?utf-8?B?YlBYakhCdzU4WmsrTDZBUXpVbEdPVC9sclBFK1pGM083eUQ5bnFkdEp4Y2Zj?=
 =?utf-8?B?eVU4aUphMHJ4MjJxZ1dmTFlETjJ0OXlNT0E1ZmFuYjVsbHo0cWZROXRDeFpT?=
 =?utf-8?B?UjQybTl2Zy8xM2VRdEF0SmJiNGZyWlcrZDhzbURmWXRzcGQxYkdPd1Nia0lQ?=
 =?utf-8?B?VEJqMEErL2twSElVR1pwYkN2NDNMZ3BZamxySzd0VEhmejVaRXM1TE8ybldC?=
 =?utf-8?B?dXdMaVROMnY4Y0tKNDFwd0ZKSjJGaFlRUkI3KytTUHp0eEJKWEhDODJIVlRZ?=
 =?utf-8?B?Z2p4S3J3bytva1FDbzlNd0trSTV0MW5NN1NJUFpyNlJOSE1XbnFNNFcvTDZq?=
 =?utf-8?B?NG1QdU5iYUVCc3hicXI4dXFjNXpEL3NyL0l2R2owNm1oOWt3TlJuVklBNFBV?=
 =?utf-8?B?YVVPNFlUTERsbHpXdkh2MjhMVmVNMkdsSGlKeWNJTlhlNWNwSGNLYncyWWNC?=
 =?utf-8?B?U0VNKy9FZ29QdnVSZGkzL2VSc3JBcUc5OUllelNGVDF2cm1vMWlyOEkvYUh4?=
 =?utf-8?B?TmxpYnNXNmJOTkJobTFxUVBLQUc1RGNoUkNqcHZOcGxacVkwemNLc2dlcUpk?=
 =?utf-8?B?Ync9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fac4504a-1dfc-4be9-a03f-08de1882dbb6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 13:39:04.6468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aAnaJc+NsdXRBEw7sZPXJTN6AHv5elSmktPV476BQ9r5YMWOqE0UW4U1PLcAO8CoRPwmZh3v6SbYBAv9LKUXIL8MPMYh8TUuy3EOXjJimd0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5114
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



On 10/31/2025 2:31 PM, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/pf: Allow to lockdown the PF using custom guard
> *URL:*	https://patchwork.freedesktop.org/series/156795/ <https://patchwork.freedesktop.org/series/156795/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156795v1/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156795v1/index.html>
> 
> 
>   CI Bug Log - changes from xe-4017-31f6cf867833cb67c289427c7cfe00d35d0fd340_FULL -> xe-pw-156795v1_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-156795v1_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-156795v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-156795v1_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_plane_multiple@2x-tiling-none@pipe-c-dp-4-pipe-d-hdmi-a-6:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4017-31f6cf867833cb67c289427c7cfe00d35d0fd340/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-none@pipe-c-dp-4-pipe-d-hdmi-a-6.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156795v1/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-none@pipe-c-dp-4-pipe-d-hdmi-a-6.html>

must be unrelated, new code was not even used

>   *
> 
>     igt@xe_exec_reset@cm-gt-reset:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4017-31f6cf867833cb67c289427c7cfe00d35d0fd340/shard-bmg-8/igt@xe_exec_reset@cm-gt-reset.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156795v1/shard-bmg-1/igt@xe_exec_reset@cm-gt-reset.html>

serious but unrelated

FYI @Matthew

<4> [52.277660] Oops: general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b6b: 0000 [#1] SMP NOPTI
<4> [52.277747] RIP: 0010:xe_guc_exec_queue_lr_cleanup+0x39/0xce0 [xe]
<4> [52.277855] Call Trace:
<4> [52.277857]  <TASK>
<4> [52.277859]  ? lock_acquire+0xc4/0x2e0
<4> [52.277864]  ? process_one_work+0x1ee/0x6f0
<4> [52.277868]  ? lock_release+0xce/0x2a0
<4> [52.277872]  process_one_work+0x22e/0x6f0
<4> [52.277876]  worker_thread+0x1e8/0x3d0
<4> [52.277879]  ? __pfx_worker_thread+0x10/0x10
<4> [52.277882]  kthread+0x11f/0x250


