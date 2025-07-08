Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C50AC83F0F
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 07:41:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4088810E5AD;
	Tue,  8 Jul 2025 07:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gEo30DKJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B20110E5AD
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Jul 2025 07:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751960459; x=1783496459;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0JevqoLVUAw3dkX1wAGunSfO/Xy7qWUREq8EZI5ciDU=;
 b=gEo30DKJN8VKHZQ4yF6Lx2en50WhiKTqusVoPcZPaVT+Vu4YYB3oko06
 MVnfrJgD1G+izx86PA9szx/fDIduFfE8JS5ef5013BkMSAb4jigK4wTUd
 sAF+O5wcz7m9g5yYbBTQ/jp3KbQaTTSjlbGpz6DQX712zoLf//RruyQoF
 7u4Pi3zpIpIdACkqVuI+nPVzuu30RmTRvzCidVLMrYXGqbgI+LWgQC+C+
 8jfRpN9aKEcTgUqUZvJJadtgQRXIBfHw2NH8Jrskh2czzz8zc0sO0mKf+
 a7EO9Lp8Sq92WuT4O0vb66iW6YggbZGuf5+HH8bTKOvyWfkhZihgpRN9p Q==;
X-CSE-ConnectionGUID: AhB3rboSQpqFJhADxY3qKQ==
X-CSE-MsgGUID: ipTOmZ0YQtqPyUEMdbsvhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="53905589"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="53905589"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 00:40:58 -0700
X-CSE-ConnectionGUID: xRQW0Zo7Tv+VoYDn1jk94A==
X-CSE-MsgGUID: mqXthvPBQtOy1oC20ahA2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="156010337"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 00:40:57 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 00:40:56 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 00:40:56 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.89)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 00:40:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SMQ4UDA4c4VQh/OKWwcpuquIB7Ot6SRO3RSMsDctpu41/ORln+H8rt/wwoeUkdjZx16DrwYv09qSJfIPRUTbWU852uKrr3DQ4R5iq3Bd5yrBIAHi0geUBZAMyW+8sOufayfBU6X6p64z12/Si9WBxa+Z4QiSqP/TXO9XQLmR5TJQHqmZMV4FBcWjgoMwroQZn9VJ7J+alVgxL8NMGyIQvZFdW24+XOc2bjWPa47r+EVupeH98+A6hKVQkuris4rk2qqw/nRLxVtw1tK0AWi+hx7MVqiwlbI6KUZge25vxdPP4aSJDNHzwE95wpZSN3KoLtmdAjgVEXzjcb0Sg2obkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5V/2zljUq4AN5oBx5lu52KHl68PDG8GFPasSBWCK0cA=;
 b=QVhSaUewG2yEpV886A0VzyyFay7KHcWamATZgC5KKxIsVN7qRWT6hMMDKm6D/YPJGbK5bHT3Xb7Hy08wnFQu0VOogOOerl7eeQAtcIFtmkOZLi6F7OBjw8KNdRGi0TxjSdJRpldzN/QX8pPAvzrikABHdS64LGBk7Vfo9vLVmwPajf4vfmMRkKxOgLkGfITyn/tCUTcQmpv0ge317SX4g4abO2/nw1sJIkcOFgVABlQ6riydWx1cJgZ7oAelzvZs3PHbBiBXFElHcMzKlv5qDJQXCq4/UTqwEUvlXF5sb1abn5/M5t7QZxWi/oHH42J37D215ao3zokdQ497HJePTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4553.namprd11.prod.outlook.com (2603:10b6:303:2c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Tue, 8 Jul
 2025 07:40:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.018; Tue, 8 Jul 2025
 07:40:49 +0000
Date: Tue, 8 Jul 2025 00:42:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Piotr =?iso-8859-1?Q?Pi=F3rkowski?= <piotr.piorkowski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jani Nikula <jani.nikula@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: Re: [PATCH v9 3/4] drm/xe: Move struct xe_vram_region to a dedicated
 header
Message-ID: <aGzL6KeQ7lb2EQ4k@lstrano-desk.jf.intel.com>
References: <20250707145609.3857467-1-piotr.piorkowski@intel.com>
 <20250707145609.3857467-4-piotr.piorkowski@intel.com>
 <aGv390JjsB0tlBn0@lstrano-desk.jf.intel.com>
 <20250708070346.ldtrj4qb2yxjvs42@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250708070346.ldtrj4qb2yxjvs42@intel.com>
X-ClientProxiedBy: MW4PR03CA0198.namprd03.prod.outlook.com
 (2603:10b6:303:b8::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4553:EE_
X-MS-Office365-Filtering-Correlation-Id: 4096d598-4f34-411b-dad5-08ddbdf2c1c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elhoQUFFdDhoZmlESCtETUhZRXFMVHlIKzdJZEJaTjF4Ymh6dHlza2NiYUhV?=
 =?utf-8?B?ODVwV1F0UmRHcmpvRjNyVE85b0ozNzFMWU8rYnUrVG5oQ0Y1T0xuZlptaVlO?=
 =?utf-8?B?RUJkd2JXVkFPNmlDcmh1REtkS3YzbmRXOXA4RlVoZG94YU1ML1lWSmhObnJX?=
 =?utf-8?B?dXJTb0J0Yi9KdjJmYngwOHhvdk9YakpvS1pHNGdzZkFKcGRTTld2aVhLYlV2?=
 =?utf-8?B?K080alBuMlJNcU5LT1pLQ2dndUNXemdzdFliZUdpYk5NTDlXOUlvMVVnTmhC?=
 =?utf-8?B?UFZZYnFQMFFHSVdxSnlkTW1JK0xPSkw4OHU0ZlNIRkEvMkxKMEJDMkpCeElG?=
 =?utf-8?B?RE5VMU1WTUZSSmVnSVpCZXR0UTJoWldYb2d5QWxUdzd0aURRREx5QzIzUGUr?=
 =?utf-8?B?SUYvMEc0emJFQmViK1dGUjQrZHc3Z0NmYW1wbnJoTW54UjVQQk4zVkc1QzhF?=
 =?utf-8?B?UTRiQXg5ZG5sRTFkNkVlOU14Z1gxQUxkcisxRnRpV2xOT2ZZeklEU2ZSVDV5?=
 =?utf-8?B?bVRjUm5vRjkwb3hXSGErR3NybG53b2hSU3VMUnJkZFZNMzNCb2NRVDZjY1My?=
 =?utf-8?B?M3BJSEE1R3ZMUUd0WmpZM3RsaWlnVDczcXBLd2tLWjI4bktwdnlnZ2FFUlBP?=
 =?utf-8?B?ZGZxaGo1N2xpZTZEa1RFekhmaGFOb0lVYVg3N3ZCZi9IelYyQ2hPdWhELysv?=
 =?utf-8?B?Lzh6bm5jc0wvSVJwTkF4NUdVbm5BM0lCVU4rWmU2ZlV6V3dvZ3JNdW5wc09Q?=
 =?utf-8?B?RGVITHJPK0dZbTVPdEVqcmxPSUxzWER1Q2NZT0RnNm5Ld2ZXcWtsSDNuOWZS?=
 =?utf-8?B?TWZwdHdDWUFKRGxOTFE3Y25rRG12TG9UbklmcmZhaTRnYlkrajNHRFhHbEhm?=
 =?utf-8?B?bmphYmZES0w4VmdmWExoRVlJd0xHS3BadHNMY3pmc3VIbzEzc05oSDJMeWdB?=
 =?utf-8?B?RTBsZ2EzVGQ0dmo3SmcyYlpuR3g4L050S2gycDc2cFlkRE5QUjZQYUdIWmNQ?=
 =?utf-8?B?N00vaTEzZ3E1Znhlb3M0Y1dqYitYS0dnR1RCSjc4ZVhCYWF0VjlhSDdmT054?=
 =?utf-8?B?dE5CZHB5aVB2ZGl2UGRibm1sSWZRWjdMNWQyMHRlUUUyL3FZMXhsNi85SVdy?=
 =?utf-8?B?VTEyM0JIZXA1M1NOOHVDdjhzc21Ccllya1NwL1R4N0owR2NreStwWTQ3aVpy?=
 =?utf-8?B?WnpBanhiNWpoMm9WNW5sblFZYUtmSlRsR0NoenlacmZ4MkZUUzhveEJ6RmMy?=
 =?utf-8?B?UnNZV080LzhBZHVmVWpiaDhHVzhLZGJ6RjBqK2laUGR3NTZUTUg5Y0FXQUJE?=
 =?utf-8?B?Z3orWE4vME0wcTllNTYzMldrUWVPNy9PYjJpUVMwZ1ZTeWZKNG1kdkQrbjNB?=
 =?utf-8?B?UzhWZGVSeklvbm9ZaTgrb2RjL2pUZkFFVkdQV245NDFwRFhDWkQ5UHhsZkhN?=
 =?utf-8?B?eGpDaVJraWhuK1NuVnRybDU4WjVTUU01amQ1Mmt0cUMvWC8vUk5yd29YSzRo?=
 =?utf-8?B?c1IrOXk4cE4wOW1UWDRTM21kcXY2bWFyT1orTHA0V1BkOHVHNVU3Y01BOE5s?=
 =?utf-8?B?QmJqTFFCTHJsSjY5cExnQkp4b0p2OFZyZDhiZDZEMGllQi9UeGtURXJSQ2dT?=
 =?utf-8?B?REV2SGRqUXlGR3R2Wk5ON1hHK05jN0pOa3Roc2F2VFVucFYzaFFIQUZaTFVH?=
 =?utf-8?B?OGoyNEwvcTdlUlBHaWtjMkVlVjZseVpCenBWRnZxUnJ2TEJzZTAvYWJTMCtB?=
 =?utf-8?B?VVBUTHdsa3UrSGhUYlZEMFpjRE5pVWkxa2F0MVllZWRaSG5YTEpjZUk3cGlT?=
 =?utf-8?Q?umFqCHk8vjLr2XI8pMn6gdBHAhODSDMBwL0Uc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N05kZXo0c25TSnhuNjFsSkNrSldmSnU2Yit2YmFreHFiK0pWSlo5Z0tod2Rl?=
 =?utf-8?B?Zk45ektiZHRBWmFxMzRNbEhkL0czTkFKVStqUFJWZVp3MVJrR280UWMwMWRy?=
 =?utf-8?B?Q1dmVjNhcGhvTFA0SzAxN2NraTdSVURIVFJkUVhOL1d4RE1uU2xPdWtsU0Rr?=
 =?utf-8?B?WFltMlhwdGQyWkNpOEl2NWM4cmlpOHNKd1lGVk9oVXJqRE9YZExRdjY0Q29t?=
 =?utf-8?B?dzZvam5DZ3pSRWFWNmZiMElzanBuQnVyOExDR2hKWmV3RkhRNTIyWmIrR3Bo?=
 =?utf-8?B?Tkg4ajhIeDM0TUU1M0JNRElIN0xPMFRrMmNtOHRqbmM0amlQSFVsYi94YVJE?=
 =?utf-8?B?QmZBYmZibndCUzdHcWgzTG90RDc2YTNPb2RaaFdPR0JBeCtlVlZPSElEeFlY?=
 =?utf-8?B?Q2lhLzdtZlF2ajMyQXVwQTNyaW13dnBPdmRTR1dHTDdRUXE3UzNVd0UvUlZq?=
 =?utf-8?B?aTlqRWdrOXFYOC9yNmZqRW1ZOHNPOWlmLzBXeElsZ1dwMmx4NmxjNnNOOS82?=
 =?utf-8?B?dDZ0dGZWbWRKc1JqM3BBNlYvYktsQklsYVJDaXlMMGhoaW5Bc3Q3UXlpdWx0?=
 =?utf-8?B?T3lMN0JRNGIwWlFPRks0TGV3ajBYb1NjaTJIdEtieFBWV0xqOW9XZ0E4NG1w?=
 =?utf-8?B?R0VGcy9wOXl6WThkRUVCdUp6a3F2TnNXTFJoOXFURjd4a3Mzb2l5ZFcvL2l6?=
 =?utf-8?B?a256cXl6bEd1NkdiZFNxcitYN3Q4ZUxENVN4L1o5UlF5YXNIL3lQK09objNX?=
 =?utf-8?B?K1IyRnE4QVUvT0xXTmN2VHhXRVZDN3daQ1UwL2dtSnQvNEQ4N0w5Rk1UUTdq?=
 =?utf-8?B?M3YwVEhWR05RRVFNWHZ5WWpCMFdlYjVRcU9CUUlMVE5UN0NualdqWllwNzRU?=
 =?utf-8?B?ZktFdVhmOEo3VGlCV0JKcHBjSHpRVVZvTjhzdEN6K2Y5YUtJRjdmRTNNamZs?=
 =?utf-8?B?UTEwdXNZKzZvQi9UenBZZVJTeFE3Rld1QTVvSk56OGpJT245YUpvenJHbUZW?=
 =?utf-8?B?bE44QVdYbW9hem0wRjJPckhVN1dpMlgvNHpmOW9jTWJKTWpxY21SaGlDVEdH?=
 =?utf-8?B?ZnhQcFk5d2VwVFUwSDNkNGdKK1ZMY2lzQk1RRis2RmV5OEpIa0dDVTdTdTF0?=
 =?utf-8?B?emhIeUJBVWFXOGUvUlYwNmx5Ymx2Z2p6aFlxTU1lTDhEV1NmS3hJV3cwU0s5?=
 =?utf-8?B?MzhlLzNVT3liWE1mdnMxZC9vc1p6TmtpbDFsa0xhVDZYcHhKMGtFMGNkbHBp?=
 =?utf-8?B?cjZlN1RXNy9sb0hRcE1ERlRZMFdsMEhyV2czZ1l6ZGFyUGhBanIyQWZzRDBO?=
 =?utf-8?B?VzNMdUIweXdjK29od3c4TUJkdmxlZXY4T2lJWGVadUVKT3M1TGVLcnN2eHpI?=
 =?utf-8?B?d0swZ1JNN2F6MmU5aFB6NGNsWDBNaTIySGR2YVlIZ3J2VkYxcW50RWVkU1hv?=
 =?utf-8?B?YnE4ZmJpWU9oU3VjeG55T1VwaVZ1eTJnWW9GRlR0TG9SOU5ieldwQklhczZw?=
 =?utf-8?B?UzA4OUhOUGh1aFY4d2ZiS0dCWStFZDh2Sk8xZGVwS0wxNUkrNXAzbU1wWUwy?=
 =?utf-8?B?alptcWxrUTRiOHFDaTVJVDh5aS9ET3VycTZYSmQ2Nkk1WExWUTJCdDRaQVB6?=
 =?utf-8?B?R3lkQU43WWxDb01tai94NDR3ZjdkRGVhZzFjQ3NPdHJUNlVSZ0E0SWZJRUs1?=
 =?utf-8?B?bldiSEc5VGxFVjl0OWkxc0krM1RqSXFQbWE5VkxUdkFyTW1rK0pzbFdNVlVK?=
 =?utf-8?B?cTdvZWp5alZIOERjNmdPWXlkQ2gyRHpzVUxjRHMySXpuMCtzMDYyN25CWEV3?=
 =?utf-8?B?aHFaaVBDbjZBN2dvc0JKMHZzV3ZiZzA3TzVSTDRNTnliYldMZ1lKMXJ6Ymg5?=
 =?utf-8?B?MGVxeENBVlpISWdqOXZINU9TZlpYRlZuZ1FkTmRDU2ZvN1NpQjVsclZFa05O?=
 =?utf-8?B?S2x5RUNVeFA3YWhXVHo1NTlLMTVadkI5R3oxUVJaSVVLMXRwNkR2TDVTSFUw?=
 =?utf-8?B?dk1KWTFRaUZ4ZStZUk9XckpEQmNQcDM3OTNKL3kzWko2NytNVEdEaytDQ0NO?=
 =?utf-8?B?VDFmT29qK1pzRUZwSEl1Yy9Xb1NuVFkxc0F0MlpyVGFXUE9Zb1lXWHo3aDY1?=
 =?utf-8?B?Uys1RVRLcmE5SHVFVnYxSm9vNVRnR3Y3WTJrRDBDbG1JTi9IVXBnVnA1VWI4?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4096d598-4f34-411b-dad5-08ddbdf2c1c4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 07:40:48.9038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CZzai9nZavP//S1Mk7SfyblFhPOIfXVWqk5P0FvFcmBkyHdTzwhIk4ATq0qP+GPYh1nZwCAmwCNNNWBjGwF2JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4553
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

On Tue, Jul 08, 2025 at 09:03:46AM +0200, Piotr Piórkowski wrote:
> Matthew Brost <matthew.brost@intel.com> wrote on pon [2025-lip-07 09:38:15 -0700]:
> > On Mon, Jul 07, 2025 at 04:56:08PM +0200, Piórkowski, Piotr wrote:
> > > From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > > 
> > > Let's move the xe_vram_region structure to a new header dedicated to VRAM
> > > to improve modularity and avoid unnecessary dependencies when only
> > > VRAM-related structures are needed.
> > > 
> > > v2: Fix build if CONFIG_DRM_XE_DEVMEM_MIRROR is enabled
> > > v3: Fix build if CONFIG_DRM_XE_DISPLAY is enabled
> > > 
> > > Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > > Suggested-by: Jani Nikula <jani.nikula@intel.com>
> > > Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/display/xe_fb_pin.c        |  1 +
> > >  drivers/gpu/drm/xe/display/xe_plane_initial.c |  1 +
> > >  drivers/gpu/drm/xe/xe_bo.c                    |  1 +
> > >  drivers/gpu/drm/xe/xe_bo_types.h              |  1 +
> > >  drivers/gpu/drm/xe/xe_device.c                |  1 +
> > >  drivers/gpu/drm/xe/xe_device_types.h          | 60 +--------------
> > >  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  1 +
> > >  drivers/gpu/drm/xe/xe_svm.c                   |  3 +-
> > >  drivers/gpu/drm/xe/xe_tile.c                  |  1 +
> > >  drivers/gpu/drm/xe/xe_tile.h                  | 11 ---
> > >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  1 +
> > >  drivers/gpu/drm/xe/xe_vram.c                  |  1 +
> > >  drivers/gpu/drm/xe/xe_vram_types.h            | 74 +++++++++++++++++++
> > >  13 files changed, 86 insertions(+), 71 deletions(-)
> > >  create mode 100644 drivers/gpu/drm/xe/xe_vram_types.h
> > > 
> > > diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > > index 2187b2de64e1..f2cfba674899 100644
> > > --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > > +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > > @@ -16,6 +16,7 @@
> > >  #include "xe_device.h"
> > >  #include "xe_ggtt.h"
> > >  #include "xe_pm.h"
> > > +#include "xe_vram_types.h"
> > >  
> > >  static void
> > >  write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_ofs,
> > > diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> > > index 873f4e18cb2a..11591c7cdc70 100644
> > > --- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
> > > +++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> > > @@ -21,6 +21,7 @@
> > >  #include "intel_plane.h"
> > >  #include "intel_plane_initial.h"
> > >  #include "xe_bo.h"
> > > +#include "xe_vram_types.h"
> > >  #include "xe_wa.h"
> > >  
> > >  #include <generated/xe_wa_oob.h>
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > index 7f8470b22dc9..a35a9e0dbfae 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -34,6 +34,7 @@
> > >  #include "xe_trace_bo.h"
> > >  #include "xe_ttm_stolen_mgr.h"
> > >  #include "xe_vm.h"
> > > +#include "xe_vram_types.h"
> > >  
> > >  const char *const xe_mem_type_to_name[TTM_NUM_MEM_TYPES]  = {
> > >  	[XE_PL_SYSTEM] = "system",
> > > diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> > > index ff560d82496f..57d34698139e 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > > @@ -9,6 +9,7 @@
> > >  #include <linux/iosys-map.h>
> > >  
> > >  #include <drm/drm_gpusvm.h>
> > > +#include <drm/drm_pagemap.h>
> > >  #include <drm/ttm/ttm_bo.h>
> > >  #include <drm/ttm/ttm_device.h>
> > >  #include <drm/ttm/ttm_placement.h>
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > index 19019b032c78..4bd0619574ff 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -63,6 +63,7 @@
> > >  #include "xe_ttm_sys_mgr.h"
> > >  #include "xe_vm.h"
> > >  #include "xe_vram.h"
> > > +#include "xe_vram_types.h"
> > >  #include "xe_vsec.h"
> > >  #include "xe_wait_user_fence.h"
> > >  #include "xe_wa.h"
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > index ece4bfcde477..55b068183f8c 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -10,7 +10,6 @@
> > >  
> > >  #include <drm/drm_device.h>
> > >  #include <drm/drm_file.h>
> > > -#include <drm/drm_pagemap.h>
> > >  #include <drm/ttm/ttm_device.h>
> > >  
> > >  #include "xe_devcoredump_types.h"
> > > @@ -24,7 +23,6 @@
> > >  #include "xe_sriov_types.h"
> > >  #include "xe_step_types.h"
> > >  #include "xe_survivability_mode_types.h"
> > > -#include "xe_ttm_vram_mgr_types.h"
> > >  
> > >  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > >  #define TEST_VM_OPS_ERROR
> > > @@ -36,6 +34,7 @@ struct intel_dg_nvm_dev;
> > >  struct xe_ggtt;
> > >  struct xe_pat_ops;
> > >  struct xe_pxp;
> > > +struct xe_vram;
> > >  
> > >  #define XE_BO_INVALID_OFFSET	LONG_MAX
> > >  
> > > @@ -68,63 +67,6 @@ struct xe_pxp;
> > >  		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
> > >  		 struct xe_tile * : (tile__)->xe)
> > >  
> > > -/**
> > > - * struct xe_vram_region - memory region structure
> > > - * This is used to describe a memory region in xe
> > > - * device, such as HBM memory or CXL extension memory.
> > > - */
> > > -struct xe_vram_region {
> > > -	/** @tile: Back pointer to tile */
> > > -	struct xe_tile *tile;
> > > -	/** @io_start: IO start address of this VRAM instance */
> > > -	resource_size_t io_start;
> > > -	/**
> > > -	 * @io_size: IO size of this VRAM instance
> > > -	 *
> > > -	 * This represents how much of this VRAM we can access
> > > -	 * via the CPU through the VRAM BAR. This can be smaller
> > > -	 * than @usable_size, in which case only part of VRAM is CPU
> > > -	 * accessible (typically the first 256M). This
> > > -	 * configuration is known as small-bar.
> > > -	 */
> > > -	resource_size_t io_size;
> > > -	/** @dpa_base: This memory regions's DPA (device physical address) base */
> > > -	resource_size_t dpa_base;
> > > -	/**
> > > -	 * @usable_size: usable size of VRAM
> > > -	 *
> > > -	 * Usable size of VRAM excluding reserved portions
> > > -	 * (e.g stolen mem)
> > > -	 */
> > > -	resource_size_t usable_size;
> > > -	/**
> > > -	 * @actual_physical_size: Actual VRAM size
> > > -	 *
> > > -	 * Actual VRAM size including reserved portions
> > > -	 * (e.g stolen mem)
> > > -	 */
> > > -	resource_size_t actual_physical_size;
> > > -	/** @mapping: pointer to VRAM mappable space */
> > > -	void __iomem *mapping;
> > > -	/** @ttm: VRAM TTM manager */
> > > -	struct xe_ttm_vram_mgr ttm;
> > > -#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> > > -	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
> > > -	struct dev_pagemap pagemap;
> > > -	/**
> > > -	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
> > > -	 * pages of this tile.
> > > -	 */
> > > -	struct drm_pagemap dpagemap;
> > > -	/**
> > > -	 * @hpa_base: base host physical address
> > > -	 *
> > > -	 * This is generated when remap device memory as ZONE_DEVICE
> > > -	 */
> > > -	resource_size_t hpa_base;
> > > -#endif
> > > -};
> > > -
> > >  /**
> > >   * struct xe_mmio - register mmio structure
> > >   *
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > > index e69a05126dae..275ab5f03291 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> > > @@ -33,6 +33,7 @@
> > >  #include "xe_migrate.h"
> > >  #include "xe_sriov.h"
> > >  #include "xe_ttm_vram_mgr.h"
> > > +#include "xe_vram_types.h"
> > >  #include "xe_wopcm.h"
> > >  
> > >  #define make_u64_from_u32(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > > index e6871734ffa9..ee015e3f5d9e 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > @@ -17,6 +17,7 @@
> > >  #include "xe_ttm_vram_mgr.h"
> > >  #include "xe_vm.h"
> > >  #include "xe_vm_types.h"
> > > +#include "xe_vram_types.h"
> > >  
> > >  static bool xe_svm_range_in_vram(struct xe_svm_range *range)
> > >  {
> > > @@ -1006,7 +1007,7 @@ int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
> > >  	xe_assert(tile_to_xe(tile), range->base.flags.migrate_devmem);
> > >  	range_debug(range, "ALLOCATE VRAM");
> > >  
> > > -	dpagemap = xe_tile_local_pagemap(tile);
> > > +	dpagemap = &tile->mem.vram->dpagemap;
> > 
> > I'd leave the helper here and move 'tile->mem.vram->dpagemap' to the
> > helper.
> 
> I removed this helper with full premeditation and after consulting with the author of the code.
> I decided that since we only use it in this one place and we can avoid adding include
> xe_vram_types.h to xe_tile.h, it should be done.
> 

Ok. I prefer layering, as the compiler figures it all out anyway and it
makes for more maintainable code. See [1] if you don't believe me—I
removed one member in that patch.

[1] https://patchwork.freedesktop.org/patch/660681/?series=150710&rev=4

> > 
> > >  	return drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
> > >  				       xe_svm_range_end(range),
> > >  				       range->base.gpusvm->mm,
> > > diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> > > index 858ce0183aaa..bd2ff91a7d1c 100644
> > > --- a/drivers/gpu/drm/xe/xe_tile.c
> > > +++ b/drivers/gpu/drm/xe/xe_tile.c
> > > @@ -20,6 +20,7 @@
> > >  #include "xe_ttm_vram_mgr.h"
> > >  #include "xe_wa.h"
> > >  #include "xe_vram.h"
> > > +#include "xe_vram_types.h"
> > >  
> > >  /**
> > >   * DOC: Multi-tile Design
> > > diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
> > > index fb0473fa9098..8dd87ccb2aca 100644
> > > --- a/drivers/gpu/drm/xe/xe_tile.h
> > > +++ b/drivers/gpu/drm/xe/xe_tile.h
> > > @@ -18,15 +18,4 @@ int xe_tile_alloc_vram(struct xe_tile *tile);
> > >  
> > >  void xe_tile_migrate_wait(struct xe_tile *tile);
> > >  
> > > -#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> > > -static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
> > > -{
> > > -	return &tile->mem.vram->dpagemap;
> > > -}
> > > -#else
> > > -static inline struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
> > > -{
> > > -	return NULL;
> > > -}
> > > -#endif
> > >  #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > index 3de2df47959b..8f9b8a1d2c05 100644
> > > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > @@ -15,6 +15,7 @@
> > >  #include "xe_gt.h"
> > >  #include "xe_res_cursor.h"
> > >  #include "xe_ttm_vram_mgr.h"
> > > +#include "xe_vram_types.h"
> > >  
> > >  static inline struct drm_buddy_block *
> > >  xe_ttm_vram_mgr_first_block(struct list_head *list)
> > > diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> > > index 71f463f2c3be..35fd7f5d7cff 100644
> > > --- a/drivers/gpu/drm/xe/xe_vram.c
> > > +++ b/drivers/gpu/drm/xe/xe_vram.c
> > > @@ -20,6 +20,7 @@
> > >  #include "xe_module.h"
> > >  #include "xe_sriov.h"
> > >  #include "xe_vram.h"
> > > +#include "xe_vram_types.h"
> > >  
> > >  #define BAR_SIZE_SHIFT 20
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
> > > new file mode 100644
> > > index 000000000000..a01838236036
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_vram_types.h
> > > @@ -0,0 +1,74 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright © 2025 Intel Corporation
> > > + */
> > > +
> > > +#ifndef _XE_VRAM_TYPES_H_
> > > +#define _XE_VRAM_TYPES_H_
> > > +
> > > +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> > > +#include <drm/drm_pagemap.h>
> > > +#endif
> > > +
> > > +#include "xe_ttm_vram_mgr_types.h"
> > > +
> > > +struct xe_tile;
> > > +
> > > +/**
> > > + * struct xe_vram_region - memory region structure
> > > + * This is used to describe a memory region in xe
> > > + * device, such as HBM memory or CXL extension memory.
> > > + */
> > > +struct xe_vram_region {
> > > +	/** @tile: Back pointer to tile */
> > > +	struct xe_tile *tile;
> > 
> > If the goal is share one xe_vram_region among several tiles, doesn't
> > having a back pointer to some extent break this? It would be better to
> > only have a 1 way relationship here: tile -> VRAM but VRAM cannot lookup
> > the tile. I haven't look through the entire series, but in what cases is
> > this backpointer needed?
> > 
> > Matt
> 
> I have mixed feelings about this back pointer.
> But let me start from the beginning:
> My goal is to make vram_region independent of structures such as xe_device or xe_tile.
> In the future, I would like this object to be dynamically assigned to these objects,
> creating a many-to-many relationship where one tile can have several vram regions
> and one vram region can be shared by many tiles. From a logical point of view,
> this back pointer actually breaks the one vram region to many tiles relationship.
> Currently, from what I can see, this back pointer is only used in the SVM code:
> 
> drivers/gpu/drm/xe/xe_svm.c: In function ‘xe_vram_region_page_to_dpa’:
> drivers/gpu/drm/xe/xe_svm.c:314:34: error: ‘struct xe_vram_region’ has no member named ‘tile’
>   314 |         struct xe_tile *tile = vr->tile;
>       |                                  ^~
> drivers/gpu/drm/xe/xe_svm.c: In function ‘xe_svm_copy’:
> drivers/gpu/drm/xe/xe_svm.c:369:34: error: ‘struct xe_vram_region’ has no member named ‘tile’
>   369 |                         tile = vr->tile;
>       |                                  ^~
> drivers/gpu/drm/xe/xe_svm.c: In function ‘xe_svm_populate_devmem_pfn’:
> drivers/gpu/drm/xe/xe_svm.c:521:42: error: ‘struct xe_vram_region’ has no member named ‘tile’
>   521 |                 struct xe_tile *tile = vr->tile;
>       |                                          ^~
> drivers/gpu/drm/xe/xe_svm.c: In function ‘xe_drm_pagemap_populate_mm’:
> drivers/gpu/drm/xe/xe_svm.c:688:34: error: ‘struct xe_vram_region’ has no member named ‘tile’
>   688 |         struct xe_tile *tile = vr->tile;
>       |                                  ^~
> 
> - I think this is your code, so you should know best if we can actually drop of it there.
> From what I can see, removing of this back pointer will also cause a problem with getting
> the xe pointer, which can sometimes be useful.

If the Xe pointer is useful, store it in VRAM.

I see three cases in xe_svm.c:

1. xe_vram_region_page_to_dpa: used for asserts. I think we can convert
these to Xe device–based asserts.

2. xe_svm_copy: used during migration. This is likely a case where we do
need some kind of backpointer. I'd say store xe_migrate in the VRAM,
storing xe_migrate of the first tile which contains the VRAM.

3. xe_svm_populate_devmem_pfn: this goes from VR → tile → buddy. While this
relationship is needed, the implementation is fairly roundabout. I think
we can go directly from VR → buddy without using the tile backpointer.  

Matt

> 
> Let me know what you think, or if you have any ideas. I'm open to getting rid of it.> 
> 
> Thanks,
> Piotr
> 
> > > +	/** @io_start: IO start address of this VRAM instance */
> > > +	resource_size_t io_start;
> > > +	/**
> > > +	 * @io_size: IO size of this VRAM instance
> > > +	 *
> > > +	 * This represents how much of this VRAM we can access
> > > +	 * via the CPU through the VRAM BAR. This can be smaller
> > > +	 * than @usable_size, in which case only part of VRAM is CPU
> > > +	 * accessible (typically the first 256M). This
> > > +	 * configuration is known as small-bar.
> > > +	 */
> > > +	resource_size_t io_size;
> > > +	/** @dpa_base: This memory regions's DPA (device physical address) base */
> > > +	resource_size_t dpa_base;
> > > +	/**
> > > +	 * @usable_size: usable size of VRAM
> > > +	 *
> > > +	 * Usable size of VRAM excluding reserved portions
> > > +	 * (e.g stolen mem)
> > > +	 */
> > > +	resource_size_t usable_size;
> > > +	/**
> > > +	 * @actual_physical_size: Actual VRAM size
> > > +	 *
> > > +	 * Actual VRAM size including reserved portions
> > > +	 * (e.g stolen mem)
> > > +	 */
> > > +	resource_size_t actual_physical_size;
> > > +	/** @mapping: pointer to VRAM mappable space */
> > > +	void __iomem *mapping;
> > > +	/** @ttm: VRAM TTM manager */
> > > +	struct xe_ttm_vram_mgr ttm;
> > > +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> > > +	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
> > > +	struct dev_pagemap pagemap;
> > > +	/**
> > > +	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
> > > +	 * pages of this tile.
> > > +	 */
> > > +	struct drm_pagemap dpagemap;
> > > +	/**
> > > +	 * @hpa_base: base host physical address
> > > +	 *
> > > +	 * This is generated when remap device memory as ZONE_DEVICE
> > > +	 */
> > > +	resource_size_t hpa_base;
> > > +#endif
> > > +};
> > > +
> > > +#endif
> > > -- 
> > > 2.34.1
> > > 
> 
> -- 
