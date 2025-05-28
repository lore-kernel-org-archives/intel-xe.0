Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA374C3ABB2
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 10:45:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7424910E5A7;
	Wed, 28 May 2025 10:45:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fjLpSozH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58FF810E5A7
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 10:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748429149; x=1779965149;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/yfqJTDVeQOl/e8Bscq+mYP/2uFXehJvYcgzLrr9ABY=;
 b=fjLpSozHbwnOgcO5lZRFRAzn4OKS7qF0u6wHRqEViVN8w76na+LqXJwx
 pvtXle5w99okN1c0CZTtz2oXq6cKyEGLpa9At3Snrz/Nd0wpdz6KO0R8B
 J7QofZA4RYRuMj8d8Vn1QMfLuqWZlDzuLDczldWpydKGVNsK/dzG/7ai1
 5iVQQOkVarU99QoQMQydP3V1EiwcjMrEDnftv0jm6nceiPTmjx7pviEYH
 /WTPR0+LOfx7dBPuBAQfGSvRZ53Kv2Eaz0GjR1XOTa1N/mNtcDVqnicLG
 GzDVSf3SPXZoTGkwxPQsHmKiLtZH/hP+Ogt3GwIMrOT1Me7ejv8PqQ+9d g==;
X-CSE-ConnectionGUID: n5OqdCZMSgOPTfVOXgM/Qw==
X-CSE-MsgGUID: p+L+lZRPQwOEaWywDaqA8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="54252619"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="54252619"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 03:45:49 -0700
X-CSE-ConnectionGUID: q6gtA437T6KIJz+Y/mMK8w==
X-CSE-MsgGUID: 1yRsJdbAQGaNrkC+CmzXsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="143655138"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 03:45:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 03:45:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 03:45:48 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.86)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 03:45:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SD5F708bH+5ATfyjxBjJUj7VqQi6sbpoPoOddi3pFHwouAJ+Rrcggkguq1RHkwA8gj/4Tha6dL0o3yGII7BnuMAIsYi7KG0BVP3kPWMiABv+d3nWv0Apol6ttE+UBlf+W8iVS0AGeoj+2TyMDuhNlrk7VUoR/MSPLbDV1c0J6/Pm6vEwepDosyJcJ3c/9isdR89/8LWzcpQNSRtxcasISEDDzZPmsY5PYrV7w/3FUPbxmgObnkFw90vo0CeGQE8lfgD7wgKK95Sl+ZEwjMMDKBo9pnxrM4/2LzmrUCz8//NB+CKkdcNKV8Cd4vGXfvXRLbv6MXLQu/MquIV0BVG4fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CbtutTJTnqhy9kkYOr4pzxm01tfnYx0kVc/vw/yALtI=;
 b=W3SXFPrS+Bp5ZGB89hRNPaahKtVZ66leflwLeZXt+Zh8hteIwDuWKJJPaaaE5A33J/GVPH92kHkq9NQ42lNpGTOBL7l6i/H5/fSkeIquDzgE81F11WCIwo2tqxVwBGColW7g0OjScDqQvdbx7efqbQMNRuy9yQrqqsVCbYw+Y9f9PJ42UgqIa7ooigyi4qQOyL47JIqH2N17HyAWDpdD3Yc63rtj4GrdlhDZlzssse4ROmfYXNGWJR/uXwEpLcYiZf1bbd+OjtmbjDG9om3ILM4Maqtvyv7/u2lj2iElB4GN/pIa8QMKF8M+IqPg6i9bfdhkqmgofB5WcMPcMT/Yrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ0PR11MB4893.namprd11.prod.outlook.com (2603:10b6:a03:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Wed, 28 May
 2025 10:44:59 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 10:44:59 +0000
Date: Wed, 28 May 2025 12:44:55 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Tomasz Lis <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?utf-8?Q?Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>
Subject: Re: [PATCH v3 6/7] drm/xe/vf: Rebase MEMIRQ structures for all
 contexts after migration
Message-ID: <jsmkqmq2m2uh2kee6dyxzklq3g3nm3htbskxf5zobpenchn3tm@mptopuryvmw3>
References: <20250519231925.3196154-1-tomasz.lis@intel.com>
 <20250519231925.3196154-7-tomasz.lis@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250519231925.3196154-7-tomasz.lis@intel.com>
X-ClientProxiedBy: VI1PR0902CA0029.eurprd09.prod.outlook.com
 (2603:10a6:802:1::18) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ0PR11MB4893:EE_
X-MS-Office365-Filtering-Correlation-Id: 94fc4bf1-36ca-452d-f7cc-08dd9dd4b138
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bXZQZTNJMnplODRaL2tiUDBab2NDeTAwUG1wTXM0NFVoUWhRSTNVU3paR25Y?=
 =?utf-8?B?WlFyQUprVkpzY3YzZWlSUDE2QUJPaUs2WWNXSnFHc2lUK0EwY2lteXVHNWc5?=
 =?utf-8?B?YXdXbk5oVW1uNkxkQ2FZNlZJeVFXSkJCSUlpZmJKanc2dXZrQlJ2YUp6czdz?=
 =?utf-8?B?dEExUnZXTlQ4Ly9PRTBxYTVrcEdpUHp3aEZBU1F5dEJNdnE0czVPeVFPeVpC?=
 =?utf-8?B?M0NCSFZ1Q2pyTlVQb3p3alNMbXRKVnNUYUwyV3B0djZJUmh1Z0RHS0xvU3BE?=
 =?utf-8?B?YmM5em5SRXJEQ2xSaUYyUDRzbXdQUmlZbjhxY01XS1JOM1V5RUJBWU1ObmQ2?=
 =?utf-8?B?VEZwUithb2dlTVRSNlFzTWFxYVN2QUxlRWxoUVY5SGN0eERzWVg3YjZLdGo1?=
 =?utf-8?B?cUYvTnZ2S1JCQXF4TTF3ZUVpNmsyeXpiRGd1WjZualJjWkNJeWJqZDQvNDBa?=
 =?utf-8?B?dktJUGNxL29WeTg0cXNRMU51eVdLb3VLcno0aW0za0ZsbE1YS1dXYVU5OHpP?=
 =?utf-8?B?SFJuVjBvQ2FLMW9keEZFcS9Eb3pnTUlXcGpNNFNBYkZ0N0RBV1lITTI5djQ1?=
 =?utf-8?B?ajFlTW1ITDkrMm9nUi92NjcxbkxNdXNyZisva3U4b3F3YmtLRllOWW91UWFw?=
 =?utf-8?B?UVRVS2pibng5anhEWENEMFF3ZHVsZGYvcjhnUERpdjdsVmt0S1M0NDUyQ01X?=
 =?utf-8?B?WEgyL1RUNnlSSEFIbnppbEs0azRoY3RLV3drNkFlTHNiTGRST2lqMHdka045?=
 =?utf-8?B?WVFnQ0h3NXQ0T2JTQmx0eGtuc0dRaDZMU3IxWUU0NzF6eklEM0xEQVNGNTVl?=
 =?utf-8?B?R00vYkFJQXI0NmUvVkZOdkgxRDdqZ2RJaVZPRWQyQmpvM0tUbldzWjNSUkcv?=
 =?utf-8?B?b3BmUFZNbjJLTHBneC9USkRwSEJRMnpkMHBsalloWjhRdE51MnhzcXh3cGJP?=
 =?utf-8?B?cm9oTjhCdldTaDdEdTlrYTl6aElGdi9qVFJDUGJSTW9qSTVTTUhEa1NmL0hp?=
 =?utf-8?B?azhaWG5uS282bGx5K2JIZ0ZmTmY3K1k1UlA2MzE0ZkIwSTJtNzZtRlZjT3Ro?=
 =?utf-8?B?b3JuNEF1VnlGK1p5T1FuTzNCK0ppWDYrdzRqbVJxdEc3cHVRSnRRdyszZnhX?=
 =?utf-8?B?eUZ0YzBkSk4zZ0hwTWFGUkR1V1lqYnpCNGJQWFc0S1B0QzQwVTJxRmhrRHM2?=
 =?utf-8?B?Q1R2RndpN3B3ZUQ3TW1IS0d1VlBEbHRkbG1ocnZrQzkzaUc2N1A5U2FGdDE4?=
 =?utf-8?B?aGVCd0FYZkp0aStsd0ZJdGttNWJnN1dmZUhzTSt4bWhFeFJFT1lCZUhrNTJa?=
 =?utf-8?B?NG1WN0VEVVZmUDczUVkzRFdvemlWT05vK0lFY1hIdGE4SllLRWpVTWNtVWY4?=
 =?utf-8?B?SzU5OFBKSXp1TW5BSWM2MjBES0l0bVY3dE5DMXV4VHZYYk1VT1M1NkErekV6?=
 =?utf-8?B?VXhFYVdPWHU5ZW1hNkdKS2hJR0xHMzBWdWk2elZKbVVxU0xlNDF4d1oyM2t0?=
 =?utf-8?B?YmV2dWhqOVBUUmpldlg1aHNIeVBwNlVFNmNEQVV6OXAwMUVtak9rQmVzcUdQ?=
 =?utf-8?B?amJqWTAzSTFzcXc3Q0pYeCtLSnduc2M5dEhWWDVvb1d2dDZDZlhwWUtUUTNu?=
 =?utf-8?B?aGUrS1JjeXlEbkM2U3l6N2dRQXNrUFBMSllFRDcwcSsxSnFaRjljWXZHSmtk?=
 =?utf-8?B?R0dZMWJuRFUzbE9abGZ6RHEzZU56WFk1UXZlU1VvZW9XR2I2cldoTUlSL3F2?=
 =?utf-8?B?R0dzNzFwQ0Q4OCtRaVVKV1N5Q3YrdS9nTHlMVDZJdkt6WVErVnRhbWFyQThl?=
 =?utf-8?B?QkhabGRDTk5lN21sc2IxNjg3bzhUZ2lRYWYydy90SE0wOFIwWGx4d1duNFlm?=
 =?utf-8?B?Y1VSYzViZm1lN3JodDhxSysxM2Y5Zy9VSHUva0Y2UU5HSlFRZElZUk0wMzlU?=
 =?utf-8?Q?I4kre0Xzcxg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWRJczRWTTJNd3NEZDZkY1hCNU5nVWNPRlEvUDJGODN3UUFIZlVITm5RMFJ3?=
 =?utf-8?B?WVJMbHFGbXlic2JsdDBCQ0x1LzRQREM0U3VtWHVHT2lGTi8xdzI5TXBkY3Ar?=
 =?utf-8?B?MS9RUER3U0RDaktoTVdjYVZQVEhQaHNpdHVoSzliMkVUNWdEdTdzQXU2UDZj?=
 =?utf-8?B?VjFibUNiTldFSmcvaVl5VS84NDlrUTN5aXhtcy9wRVRRTkpITFFuazZlQnNh?=
 =?utf-8?B?ZzRWa3Y0ZURoWDBDa244d25jKzJhUVJubzdWTVdHTFhjMjVCaFUxNnhTUjZy?=
 =?utf-8?B?OXNucE9DL3VsbWtFajFBT2lydDU4SGdEUWw2eExQNm51SXp6OTB5VWhDNDBn?=
 =?utf-8?B?bVJvTFZkSFNIUUlQNGFZQksrZzg4T3ZZaFJxenlTcEtGOVEyYTRYNDlsaUVQ?=
 =?utf-8?B?ODlJUWJFTld5L1NyUXJlaTVvY2lmaGNiNU9JNHFoc3ZjWllpY2ovQWhTeEI0?=
 =?utf-8?B?YUk0OHExSHpMaXRlcXpHUHc2Tkh1bkNZTjczMjJlQ1Q4MTB6ZXZLTXBSaXA3?=
 =?utf-8?B?L2sxMVNuZ2t1MmJqV2VVMHJXRlNSZnEyME1Db2xYTytHTU5XVnRwaFZEaHE5?=
 =?utf-8?B?SDZHUGtaYlRlbFIxeHdkQWhjMndlaUQzYzQ3cGxwSG42UWdpMDNTK01aZmZO?=
 =?utf-8?B?bHNnNU9QVlQ4MHh4WEJVWWZ3bU5TM0pxRVc2ekM5bXhzN1grOGZROWNhWlBT?=
 =?utf-8?B?Q2pKWnd3dmtJVFl6R1RucUxsSXdUUE4zRDBDWFNjWmtkK2drTUNxYUVES1Jy?=
 =?utf-8?B?dGhBZENyaTBJbUZLNU1jMkFISTZvbE1UWmFLWUt1NDZ2WWZMeHVvcGJIU1BI?=
 =?utf-8?B?MmdMQlNWUkcxTEdUYURkcVc1MU9UUzUxOGdtdjhzVUM4WmZqbUZrYVZYclFn?=
 =?utf-8?B?aEI1ZkJsbFVFMXpxS1JrZGFiakpHSUpSS29EZjhXMk5nZ24vV3lmZU9ZTUx6?=
 =?utf-8?B?NHFFaUFCNThNY0EvU0lHNkVEQ3lxWWxVUzFpUHZCeUg0WHZFMlhEUnFuNEpy?=
 =?utf-8?B?VXhZb0NJN2k3YnUwbGJQZkd1cUxZU0ZrcXE4VHBvbGNiejRaWlNwK2hkbzRN?=
 =?utf-8?B?VXh5MDNHT3lrMno5dUZ5MXRpTHJEWHFpV25WK0pOU2d2MXFpMGRVTWhzUFdw?=
 =?utf-8?B?VkR1N2MxaFNodWtGN3djc0RCZ01sQlhQenc0WGcwZ0ZNcXU3YXhDclBNdHo1?=
 =?utf-8?B?bEx5cUVPZ01SeU1Oa3BhRFVxdTBuVkNsN0ZZdFkwcFpPZ3YxQXdzajRxdVpI?=
 =?utf-8?B?eHpLczRPb0Y3dkNmNUtFS3lEalR3YmFKRFU1anMraThLZ0NvZ0RWQkxIOXhL?=
 =?utf-8?B?ekJ1UktJUjdXUVZGb2kvNFFFWFJ3YnhWMndPYy9MT2I1ZTJybEh5NmZCV0Vt?=
 =?utf-8?B?REZzMFlqNDgvTm5rcStGMndOOFU2aGkrQVJnVml0SFI5MWRxZVlydVNKTVlw?=
 =?utf-8?B?TmU1WUhhN3BUUVFXV1ZGK2NQRGl0Zk1lTzFKY0NURk16cEtKZXhuMW9IT0Yy?=
 =?utf-8?B?dmZLQXl6TFptZWlLRUEwRlBBV0F4SmdPZ1gxd2FUMmxjYytud2tqUlpYYUNN?=
 =?utf-8?B?M2FYMExvQzJ2UU51czFGNkVRUkluTURyVEhBalRPcXYvVElDbXEyUndWZzN5?=
 =?utf-8?B?RFhVdnQ4NW5YSE5OR1U3SW5jc1BTSHF1OUp2TWZTY3JGSjRZcHo1aTlVMmlE?=
 =?utf-8?B?QUlzZWhGSlNPMDVyUTlrai9LaUx0aHRWV1pzbTZuR24vQi9BTHdUcUxNMmlN?=
 =?utf-8?B?QjhDdmo0T3RhTFI0UngwanFNakUrN0V3NWZwZFNGRUxNVVRsMklIa1FaUVFH?=
 =?utf-8?B?WEp4NHc5aWpzL2FlbWlWKzBkWG43TUxjTVFFY1YvR2tIRENxdjdkSktkU2pX?=
 =?utf-8?B?cGRwczJTSkJrNzR4S2V0alhZQkRYdXp4L3VMQkFSbVdzWG01TGhiaEZVTG4y?=
 =?utf-8?B?Ujk3cHU5UUg0SGlhRXZkdFRVZUhiT2lFMVppaW5FdFIvd3BEeFEwQzNvdXZP?=
 =?utf-8?B?UDhCNWV0WmdtWWg4L3Y1VWErUEkydVB0Rk9OTEJMRXozbXVvOWFFR093bFAx?=
 =?utf-8?B?d1l6NXM5bjRCVk40S3JQdVlyQytKTkl3aHBONStlMm5DNWNvYUVCaUdaQnF4?=
 =?utf-8?B?L2wrODYxMDRKc2M3R3ovaFRUdnBLekN6NjN4b0VSMWkrV3RkUTU5VVpVaFl5?=
 =?utf-8?B?TVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94fc4bf1-36ca-452d-f7cc-08dd9dd4b138
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 10:44:59.1184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ondBAZ4uc+6mUwMIs3nT9m+5OKRrFKDGcGCVU+80WSaRlvCMxzq2pQUehVAF0sxRBQnZP1XBL2CiHnQ6cXQrSkvSCGihCTrZWjClZ6TPt88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4893
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

On Tue, May 20, 2025 at 01:19:24AM +0200, Tomasz Lis wrote:
> All contexts require an update of state data, as the data includes
> GGTT references to memirq-related buffers.
> 
> Default contexts need these references updated as well, because they
> are not refreshed when a new context is created from them.
> 
> v2: Update addresses by xe_lrc_write_ctx_reg() rather than
>   set_memory_based_intr()
> v3: Renamed parameter, reordered parameters in some functs
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c |  4 +++-
>  drivers/gpu/drm/xe/xe_lrc.c        | 35 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_lrc.h        |  2 ++
>  drivers/gpu/drm/xe/xe_sriov_vf.c   | 13 ++++++++++-
>  4 files changed, 52 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index d696c8410a32..9c3e568400e0 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1051,6 +1051,8 @@ void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q)
>  {
>  	int i;
>  
> -	for (i = 0; i < q->width; ++i)
> +	for (i = 0; i < q->width; ++i) {
> +		xe_lrc_update_memirq_regs_with_address(q->lrc[i], q->hwe);

What if we're not using memirq?

>  		xe_lrc_update_hwctx_regs_with_address(q->lrc[i]);
> +	}
>  }
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 525565480aef..959ac9c5d39a 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -898,6 +898,41 @@ static void *empty_lrc_data(struct xe_hw_engine *hwe)
>  	return data;
>  }
>  
> +/**
> + * xe_default_lrc_update_memirq_regs_with_address - Re-compute GGTT references in default LRC
> + *   of given engine.
> + * @hwe: the &xe_hw_engine struct instance
> + */
> +void xe_default_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe)
> +{
> +	struct xe_gt *gt = hwe->gt;
> +	u32 *regs;
> +
> +	if (!gt->default_lrc[hwe->class])
> +		return;
> +
> +	regs = gt->default_lrc[hwe->class] + LRC_PPHWSP_SIZE;
> +	set_memory_based_intr(regs, hwe);

We're using set_memory_based_intr() for gt->default_lrc, and
xe_lrc_update_memirq_regs_with_address() for q->lrc.

Why do we need 2 different methods to do that?

> +}
> +
> +/**
> + * xe_lrc_update_memirq_regs_with_address - Re-compute GGTT references in mem interrupt data
> + *   for given LRC.
> + * @lrc: the &xe_lrc struct instance
> + * @hwe: the &xe_hw_engine struct instance
> + */
> +void xe_lrc_update_memirq_regs_with_address(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
> +{
> +	struct xe_memirq *memirq = &gt_to_tile(hwe->gt)->memirq;
> +
> +	xe_lrc_write_ctx_reg(lrc, CTX_INT_MASK_ENABLE_PTR,
> +			     xe_memirq_enable_ptr(memirq));
> +	xe_lrc_write_ctx_reg(lrc, CTX_INT_STATUS_REPORT_PTR,
> +			     xe_memirq_status_ptr(memirq, hwe));
> +	xe_lrc_write_ctx_reg(lrc, CTX_INT_SRC_REPORT_PTR,
> +			     xe_memirq_source_ptr(memirq, hwe));
> +}
> +
>  static void xe_lrc_set_ppgtt(struct xe_lrc *lrc, struct xe_vm *vm)
>  {
>  	u64 desc = xe_vm_pdp4_descriptor(vm, gt_to_tile(lrc->gt));
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index e7a99cfd0abe..801a6b943f6e 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -89,6 +89,8 @@ u32 xe_lrc_indirect_ring_ggtt_addr(struct xe_lrc *lrc);
>  u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc);
>  u32 *xe_lrc_regs(struct xe_lrc *lrc);
>  void xe_lrc_update_hwctx_regs_with_address(struct xe_lrc *lrc);
> +void xe_default_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe);
> +void xe_lrc_update_memirq_regs_with_address(struct xe_lrc *lrc, struct xe_hw_engine *hwe);
>  
>  u32 xe_lrc_read_ctx_reg(struct xe_lrc *lrc, int reg_nr);
>  void xe_lrc_write_ctx_reg(struct xe_lrc *lrc, int reg_nr, u32 val);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 0f0d1a97ae1d..0a9761b6ffb5 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -225,13 +225,24 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
>  	return ret;
>  }
>  
> +static void xe_gt_default_lrcs_hwsp_rebase(struct xe_gt *gt)
> +{
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +
> +	for_each_hw_engine(hwe, gt, id)
> +		xe_default_lrc_update_memirq_regs_with_address(hwe);
> +}

Device-level functions live in xe_sriov_vf.c, GT-level functions live in
xe_gt_sriov_vf.c

Thanks,
-Michał

> +
>  static void vf_post_migration_fixup_contexts(struct xe_device *xe)
>  {
>  	struct xe_gt *gt;
>  	unsigned int id;
>  
> -	for_each_gt(gt, xe, id)
> +	for_each_gt(gt, xe, id) {
> +		xe_gt_default_lrcs_hwsp_rebase(gt);
>  		xe_guc_contexts_hwsp_rebase(&gt->uc.guc);
> +	}
>  }
>  
>  static void vf_post_migration_fixup_ctb(struct xe_device *xe)
> -- 
> 2.25.1
> 
