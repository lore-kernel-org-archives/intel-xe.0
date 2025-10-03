Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13340CAC5B0
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 01:39:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF6210E867;
	Fri,  3 Oct 2025 01:39:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gv4Ih670";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7D110E867
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 01:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759455559; x=1790991559;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=A1U2FXY63A+TkcHUBtwfC6Yu8lODNAAReebJUrrU2EE=;
 b=gv4Ih670sdgZdDOlDhZYW6QLKhSuy0A73+itDMe78QLyPj7dWCwuFI6/
 CzRNVX+aeVSoU34sV7KWtLiONlzZB+X6j7RCQRFLYUw9JmG6o74fn3Qh4
 QHuepkT3mLna5Z1a4y6ny08qkmveTRpq9TaBOnugQHPy0xrKA8Qo2cDfD
 UrbMOrahSaCw0IuKMyq0twrtkt2CN5scugbsTGYt65lpPW3iL29owDXFJ
 irEndowp9JdQoPgcHv8yR2fxMo8mhJ9Fi83KPqcZf//4R16rW1lswIz/7
 eKydKkbWQABI6sDK0ry/g0MoN3zKPHuzoZy/m36DF49cQoCkeQhtSfIHU g==;
X-CSE-ConnectionGUID: lyrG+BzTQmGhRhVxVSNCsA==
X-CSE-MsgGUID: v8fg6VmiSIyzqpt8rnmq6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="84366695"
X-IronPort-AV: E=Sophos;i="6.18,311,1751266800"; d="scan'208";a="84366695"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 18:39:18 -0700
X-CSE-ConnectionGUID: h+AS2GRXTeWpAulAxg4hqw==
X-CSE-MsgGUID: nEeY5pduSiK44CPWqxBHNQ==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 18:39:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 18:39:16 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 18:39:16 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.58) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 18:39:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xewooSNRJbSK0pQND+5eiNPz6qI6pgYl0ujQDrCiEAE47MCevhC4tC0wC3kHtJCLFkC93geGwmMvNUZi9q6WBCk7Z78/2Riq1qV0CBXEwoOv5ZJ4/x/BYCRfgneWRp+x7c2eDEaNZ7+uJN/XyGqJDLia+sWRJWZHACS8SBi4lO+uixqVUa/u1gsM9CKbygmZfQbcqCCctz9vDCllNi/8R3wD0jY3bv9KO6qkZHpEOeN4b929JTcEuJf3s8YKLwd1beTwjyjdnurrxCcqIl6Gq3IeaOsuJbP1N+GEe8rgFZ5RqgdXFR5N2m3OtboM2mfmNQcQSarm+yQfV23pY3X3UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bIboYfS0pyNLPtrmebUoo+FtpdrZb4Bo1mRYlLCzPRY=;
 b=XNYjmHrTRmKJ7qcNMqh26izqI43HfWKOlRw9ugVWLH5uhNhWoq2Ff5OoswBRm1xt1RxAcP4k70wye6LejT7zOMftaHh3NAdU9f2IfFxRzGTvKsQ2Z2HioN1J2TiVeZBsCKsvT0MERTC38flG4J2ksYyG3z2z5U5qZwl+4QmdE/Cn1adD0lcxyn34mf/iMVEgeaiZpk5Jx/GTvrgacVdvK9FofbDmxFfmPPZ0c79WUMYu4rImTWgxm6ysfvsNySn5OJcT4AQ8Kt/aYMkZSqcTD2drqw61oPXd6pg2zOORZVBUUaRFxI1ssOhotA2yUVR8Hsj7ToLBA+WdwPXZMhqn6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by CO1PR11MB4788.namprd11.prod.outlook.com (2603:10b6:303:97::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 01:39:12 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Fri, 3 Oct 2025
 01:39:12 +0000
Message-ID: <fcf3bbdf-e100-4b7a-9280-a056dc1dc478@intel.com>
Date: Fri, 3 Oct 2025 03:39:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/34] drm/xe/vf: Add xe_gt_recovery_inprogress helper
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
 <20251002055402.1865880-12-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20251002055402.1865880-12-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0037.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::26) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|CO1PR11MB4788:EE_
X-MS-Office365-Filtering-Correlation-Id: a9eaadc7-38c2-423f-fc13-08de021da794
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWZpTGcvK0lYUmZiTkxRTm1RU0dMbXRYOXlRYlJJV3FVQXdNdUI5T2RlLy9p?=
 =?utf-8?B?M043bDB0U1ltZjVFN0FEUDRCSDdoNDVwYjZ4UEtXYzlLVGlvZnAvRnovOGYr?=
 =?utf-8?B?Z28wN1gxUTlUQ2E1b1NYOVlRNks5TXlHOVhqblJzSkFrRzJLTEJ5NmZJZUs5?=
 =?utf-8?B?SlZXYmMyU1dwVnJSK04vNmQvVDdHSjlpZjBrYy80RzM0UWFZdjVYOHZFUkxN?=
 =?utf-8?B?SHBTZExDcTlCblJQMVpRODhvV2x2R2JNcWZWZjJTSXptZkpscUw1U1RXdWla?=
 =?utf-8?B?UmFZMm1xcFFYWGlxTHdsV3Nib1Zka2JhMlVnNGw2cFVFbDRqV3h3WXlFbnN3?=
 =?utf-8?B?QnlMNmN6aHZKaVRvVmpiTE1HVW9DWW5hL1kwUlZRNFFDdm9XWkZLWG9UZmwv?=
 =?utf-8?B?ZytidWNUWHg4U0hJMU45czRpK0lDVnZaNWlvYkk5bEx6dkR6TWpyK0hxZUpH?=
 =?utf-8?B?bXFwbGNQKzBZUjhMMnI4ays1dC9tNHRDTGxYU2RHd3psQm9Gc1A5NlI1aTRV?=
 =?utf-8?B?OXIwWHNyMllNTERzVDRxTkNHWmZBNFZLaUdLZjFkOG5ZVks4SGZsL0VKeE00?=
 =?utf-8?B?UTd5aFM1T2x4ejJTVHozTXRSaVZVdVhFNkRiZkRqTXZXVVVFdTF3VXR3Z1V1?=
 =?utf-8?B?L2I0RFJtR1ZlU0JobklicjVLMDd6UEtDQmtaOE1Hd3FRQ1o1UjNuWCthLzhG?=
 =?utf-8?B?Z29PN2pHS250eTlLMmpubDdlZlZLUzRyQ1l1TXpUTGcxZnRRVkRIcE5BNHFK?=
 =?utf-8?B?UnFicjF2ZDdSRGZkbERISnVsSWxkQkl6RnJaNVoxaEY4WndqQjZENGdaNXF3?=
 =?utf-8?B?Ykdyc29JMHlESWRSN0ZUaHl0bVZjZXZPalZjd0g2L1N0UCtZeGhZMGU3SkZN?=
 =?utf-8?B?L3BIVjJrYnNMNmg1bEN2azBMc0tGeWw0WDI2WlJRNmZNSUFhcnRsOUtDb3VL?=
 =?utf-8?B?OUVhS05NNzJ2cnluZ1dJSmYxWGtXYTVZMVB5UGFkUDlRc2owSVUyZmVDVGRs?=
 =?utf-8?B?d1J6Rk5OUlR0a0xNT2x0aFhIZmc1QUR0OXhwazAyNE4xcnpIUUNscEhuTHRB?=
 =?utf-8?B?MmszNjdCelpHNHlPaU85R29yWTdLQWhRNnRIUE4zd2JobVkvdWdqSE8rNHVj?=
 =?utf-8?B?clBHK1VLVGM4K3BpU1RRRlhhNzFxSHhlVUd3T2sralBDWHUvdXN1Vlp4VDB0?=
 =?utf-8?B?U3VmbnpHbG43aUJoU05GVWVPd0JYT1IrMDhWMjI3K2o2T3lvaVhtZkIvVXNi?=
 =?utf-8?B?RUg5L1ZvK2FNN3hGZkR1aW1nMjA2bldONlMwYmNqL0J3b2I3RXpudG1wSkdM?=
 =?utf-8?B?U2dDOEk4ZlNqOE9VaFdTcnozUHV4aXFKSzM5bEZaNVRwWG1PVGFOaERoZmlH?=
 =?utf-8?B?UnZDeDk0bDc4b2Z6YVlFc083WFVlUjc3dzBCbjlMcXlJakJMMjQrT3hCVUVK?=
 =?utf-8?B?MGNkODhwclk1bTZJSG9VOTEzODdlZThPaGpkUHVOSVp3aWJId2ZLQWlrUlRU?=
 =?utf-8?B?MDVYekJFYXYrbk16UnNSMEJmUUVyc0lYUXJHZ3REMk0yb2dOSGU5ZGZ6a0Fz?=
 =?utf-8?B?OFhmMTVNZnNHb1U5K28vSnU0UjNiOUF4YW94ZnQ3WEZ0NkJTTmU4QjlzNGpi?=
 =?utf-8?B?c2FJTXZnbUZ5dDJRYi9pZXU4bFBsM05mUHZJZzZvVTNGRG9lMDlLSi8rTUpK?=
 =?utf-8?B?d0JQTjNCT0FRL0kxcmY3OFJEaTlLQTVhRkhIZnVmOTBvRHVTQUpmTHNlRkp0?=
 =?utf-8?B?TzNhMUVhYzg0bU83a1FROUlzeHZrRlZ1MzNKRTZZU1hXUjZyWjJ1cGJPQ0kr?=
 =?utf-8?B?azRuaE05K2w3UC9xYzJkbU94SWVvaHMxN1dINTRXeitPREw5djhwZ25yeHRH?=
 =?utf-8?B?VVduZ0cwTlBoRlpUVDh2a3VsUUV5bVFNTVNib3ViUkhrcFNSc3FPeGl6OHNC?=
 =?utf-8?Q?1rB2fAugTp/kcQewNr8XttmJeLhZ7V9D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzFJYVFRWWszWkJFT1M3TkcxcGVYZFgvTXVNQXU5anIySG52Sy9QdFh1Q3hS?=
 =?utf-8?B?NXlxNTl6ZW9NWU8vTmVZcE8zY0o5dDhuK3lkZmNZdXBjTnRabVFDZ1NRdEFh?=
 =?utf-8?B?WjRLS1JEK3JUS1p6R1Y5dFAxNnd5SkhlQlk2Y1Q0STdIQlFLbEs5UEJFVXFx?=
 =?utf-8?B?bVFIM1ZYVzVucXpKd3R4Kzk3YW5oZmJhU0tQSnQyeXdFTGsvM3FlaW1SYzl3?=
 =?utf-8?B?VmlXQ3lpcGlNeHUrS2I4WGZNNTVGbGNSWmsyZHVkbk9KTHlSSTlMb2RlekR1?=
 =?utf-8?B?ZmJMdzdCRERMb1BRYmx6Y0pLV3ByTUVUK1J0VHlvR0tCelNrdFNCakF1eGh2?=
 =?utf-8?B?SWlMRldteDEzNnFJM0ttWlQ4ODI0SXZFaFA2VjA2WFppdVdyMGZPNkNhWFVa?=
 =?utf-8?B?RkJmbmJMZjAyUm1VYnUxeE95ZzRTclc2bXVYcWYvcm84dnZvY1AxMjRnRFNa?=
 =?utf-8?B?REt3Y3ZYZUZJYnhEOXV1SFpJQ1dodVlxazk0MGtFTW4vbG9NY0RUOXBtbEpW?=
 =?utf-8?B?U3RlR1AxUHdvZkpXY2wxc0dDWWNsbklWbjlaalpGQWJobGd6Zk9ENEZTVEZK?=
 =?utf-8?B?Z2J4UzZOVTIySFNaM0lmUng0ZjZwNWI1dUtPWmdiVjh0SnNCSnBXU0FILzZ3?=
 =?utf-8?B?bTczOEp3RTBRT0o4M09WbXlPUFJOL3ZGUU9DbEVvNFcvRW1tVWpwRzEwSk9i?=
 =?utf-8?B?b3ZYQUZCK3k0d1FjejRya1lESzdXZlN6R1pVVk5xQ1RnajFOdS9WdFJmMndV?=
 =?utf-8?B?dmJxa2xIWlNRWjlLTEZPTTY0N3ltaHhOZEtJUEgyZC8yR29iMkhEN3ZhV01u?=
 =?utf-8?B?a2pZTmd5VXdpVmFiOHZvYnVuV09Eb0JXZ0V6Q2NXV1U1em5nZ3V2Y2pLTzdK?=
 =?utf-8?B?UHZZKzZycDV2d2xWendqb2FweXhxa3o5ZGZLV1lOZ2laZThzNXViOTB5Tklh?=
 =?utf-8?B?WjJSOE43anFZdjAzNDdDbkdmY09xemIyek9ESDZDTnlUOHY2akVCck1IV2NR?=
 =?utf-8?B?SzhNTkdac2VTMDJDNmJpM2VINUx1L1JXdlJDVWpEbjZROGVsYjdUMFd5ajFw?=
 =?utf-8?B?UHZOOWVRREF5ZlBUMWVIVDBPUFBDRzFsK0luUWpNei9xYkFBTWFRVDQweUhJ?=
 =?utf-8?B?dTUxd1k1d0ZEZlBFaDFRR25GQjk4bkF4WU1GanJlaW1FYkh2VXdYaW5NbUQy?=
 =?utf-8?B?TVVPRWNUWStLV21vOExMWGJMczdNTk5sK2RjTUpaSVc3R1JlWUJQL0FsN3pS?=
 =?utf-8?B?ajQ4NmdyYjY0WENSOVkzVFhmMUFpRDNrRm03T3VCM0FsZitaYldxcUswWEdi?=
 =?utf-8?B?OUV3QlNzSkc1enBObWViR0lic1FtRTRLSk90MTk4TlFWRkxzc3VJenpCWG1K?=
 =?utf-8?B?d1dWWW50Z0ZOKy9pK2FsZ3NoOUYrK1NRaERmNXM3L0hpN3RLY1grZGk3MHY3?=
 =?utf-8?B?Y2Y5SkkzK2NNSjY1dGw1Yjhtd2pHQU5pa0VzRFEyQnJtNlA5dTBnRDI4a1lN?=
 =?utf-8?B?dVNUbEtEWjBmL0d4NTNSMm1nNDUrajc1UFkxTzg2UlpoMHpQVWpkUzljUU52?=
 =?utf-8?B?WjhFd1VobFZwdjMzMWFSbmlFNnBkdHpGTnpBZFhIWC9DTytyRGh3ZXl6S0J2?=
 =?utf-8?B?dnlPTGFvek9BaXpvQ2UzZjliY0RYN0lrNDBvUCtJMFBZaWt2NWtxMTFRWm9D?=
 =?utf-8?B?bHdZd2N4cUxCQkxNU3lCSDdncThGeU5VekFXOWNlM2Q1OHcwdTJiVGNRbjRk?=
 =?utf-8?B?Qm45ZVJ3ZGUzbVRqYndFeUZVTVExUDdocHlJbERkK1A3UTdBRUJLWUZzTU5q?=
 =?utf-8?B?cjJMeS8rc1ZTQ0lzNTJHWGNRVjludGxUU0dOWEt2L3plSXMrdk1YVXhKdFFG?=
 =?utf-8?B?THA4QkE4Q2FnYUpaY242V0hPdkFUYWdoSUZqUXVIY2FWZ0dlay9jckhybGxS?=
 =?utf-8?B?YWc4TDV2Y20xVDRtRUlLbjl2L2srTkc3VFB3Wll1dnlzaExqK1hXTndYTTV5?=
 =?utf-8?B?cU1pZzBXZThSNU5RZDZSeVBjbVRsd2F6RC9EWjlTdnk1eTNGSmtxSFltY2xa?=
 =?utf-8?B?T2Vqa1RMbkNFNjVxWlNjMjA2OTBSK3VnVFY3MWhBZWRjWHhFTi81REhhUkQ5?=
 =?utf-8?Q?REerwOYGhGs3pC4VNttlHgae9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9eaadc7-38c2-423f-fc13-08de021da794
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 01:39:12.4272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2elJKgAOeHEV4T6R1zshflvQZ6ZyBOce3lLdotb+Y2r3PHB+GeMSSvrzFLGgChqHosupfz2cZxMfSz4ShMlOnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4788
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


On 10/2/2025 7:53 AM, Matthew Brost wrote:
> Add xe_gt_recovery_inprogress helper.
>
> This helper serves as the singular point to determine whether a GT
> recovery is currently in progress. Expected callers include the GuC CT
> layer and the GuC submission layer. Atomically visable as soon as vCPU
> are unhalted until VF recovery completes.
>
> v3:
>   - Add GT layer xe_gt_recovery_inprogress (Michal)
>   - Don't blow up in memirq not enabled (CI)
>   - Add __memirq_received with clear argument (Michal)
>   - xe_memirq_sw_int_0_irq_pending rename (Michal)
>   - Use offset in xe_memirq_sw_int_0_irq_pending (Michal)
> v4:
>   - Refactor xe_gt_recovery_inprogress logic around memirq (Michal)
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.h                | 13 ++++++
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 22 +++++++++++
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 +
>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h | 10 +++++
>   drivers/gpu/drm/xe/xe_memirq.c            | 48 +++++++++++++++++++++--
>   drivers/gpu/drm/xe/xe_memirq.h            |  2 +
>   6 files changed, 93 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 41880979f4de..ee0239b2f48c 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -12,6 +12,7 @@
>   
>   #include "xe_device.h"
>   #include "xe_device_types.h"
> +#include "xe_gt_sriov_vf.h"
>   #include "xe_hw_engine.h"
>   
>   #define for_each_hw_engine(hwe__, gt__, id__) \
> @@ -124,4 +125,16 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
>   		hwe->instance == gt->usm.reserved_bcs_instance;
>   }
>   
> +/**
> + * xe_gt_recovery_inprogress() - GT recovery in progress
> + * @gt: the &xe_gt
> + *
> + * Return: True if GT recovery in progress, False otherwise

```
True if migration recovery is pending or in progress
```
Both the messages we log and spec clearly establish that migration recovery is the queued work, not the whole period after vCPU starts.

> + */
> +static inline bool xe_gt_recovery_inprogress(struct xe_gt *gt)
> +{
> +	return IS_SRIOV_VF(gt_to_xe(gt)) &&
> +		xe_gt_sriov_vf_recovery_inprogress(gt);
> +}
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 0461d5513487..c2be8fc14c88 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -26,6 +26,7 @@
>   #include "xe_guc_hxg_helpers.h"
>   #include "xe_guc_relay.h"
>   #include "xe_lrc.h"
> +#include "xe_memirq.h"
>   #include "xe_mmio.h"
>   #include "xe_sriov.h"
>   #include "xe_sriov_vf.h"
> @@ -776,6 +777,7 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt)
>   	struct xe_device *xe = gt_to_xe(gt);
>   
>   	xe_gt_assert(gt, IS_SRIOV_VF(xe));
> +	xe_gt_assert(gt, xe_gt_sriov_vf_recovery_inprogress(gt));

If the handler was called, then this will always pass. It does not fully 
verify the solution, as it doesn't mean the MEMIRQ was already set on 
the first vCPU cycle, which the patches rely on.

It only verifies that:

* the IRQ type is MEMIRQ

* the IRQ handler does not clear bytes which indicate source of the 
request before calling the handler

So this assert is ok to stay, but requirements on the IRQ raising moment 
are not established by it and need to be explicitly stated. Currently 
this is only mentioned in commit message, and not as requirement but 
rather.. a fact? Hard to tell even, as the sentence lacks pointing a 
subject.

I think we need this plainly stated, and not only in commit message but 
also in the sources or kerneldoc.

I don't think it would be a problem to expand the solution to IRQs with 
source in MMIO, we could expand the function to check MMIO bits if any 
platform requires that.

I also now think the requirement on IRQ bytes being set from first vCPU 
instruction is reasonable, meaning all VMM systems will meet it because 
it is required to finish VM memory restore of all types before GuC 
restore, and GuC needs to drive the HW to trigger the IRQ during its 
state load, it cannot defer it. (btw the MEMIRQ buffer seem to be in sys 
mem, not in vram as I previously thought)

So not sure if Michal will agree, but my perspective is: this is ok, and 
just needs comments to emphasize the "IRQ source data visible from the 
first vCPU cycle" requirement.

-Tomasz

>   
>   	set_bit(gt->info.id, &xe->sriov.vf.migration.gt_flags);
>   	/*
> @@ -1118,3 +1120,23 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
>   	drm_printf(p, "\thandshake:\t%u.%u\n",
>   		   pf_version->major, pf_version->minor);
>   }
> +
> +/**
> + * xe_gt_sriov_vf_recovery_inprogress() - VF post migration recovery in progress
> + * @gt: the &xe_gt
> + *
> + * Return: True if VF post migration recovery in progress, False otherwise
> + */
> +bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt)
> +{
> +	struct xe_memirq *memirq = &gt_to_tile(gt)->memirq;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	/* early detection until recovery starts */
> +	if (xe_device_uses_memirq(gt_to_xe(gt)) &&
> +	    xe_memirq_sw_int_0_irq_pending(memirq, &gt->uc.guc))
> +		return true;
> +
> +	return READ_ONCE(gt->sriov.vf.migration.recovery_inprogress);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 0af1dc769fe0..bb5f8eace19b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -25,6 +25,8 @@ void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt);
>   int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
>   void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>   
> +bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt);
> +
>   u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>   u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>   u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index 298dedf4b009..1dfef60ec044 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -46,6 +46,14 @@ struct xe_gt_sriov_vf_runtime {
>   	} *regs;
>   };
>   
> +/**
> + * xe_gt_sriov_vf_migration - VF migration data.
> + */
> +struct xe_gt_sriov_vf_migration {
> +	/** @recovery_inprogress: VF post migration recovery in progress */
> +	bool recovery_inprogress;
> +};
> +
>   /**
>    * struct xe_gt_sriov_vf - GT level VF virtualization data.
>    */
> @@ -58,6 +66,8 @@ struct xe_gt_sriov_vf {
>   	struct xe_gt_sriov_vf_selfconfig self_config;
>   	/** @runtime: runtime data retrieved from the PF. */
>   	struct xe_gt_sriov_vf_runtime runtime;
> +	/** @migration: migration data for the VF. */
> +	struct xe_gt_sriov_vf_migration migration;
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> index 49c45ec3e83c..2391993634b5 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -398,8 +398,9 @@ void xe_memirq_postinstall(struct xe_memirq *memirq)
>   		memirq_set_enable(memirq, true);
>   }
>   
> -static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
> -			    u16 offset, const char *name)
> +static bool __memirq_received(struct xe_memirq *memirq,
> +			      struct iosys_map *vector, u16 offset,
> +			      const char *name, bool clear)
>   {
>   	u8 value;
>   
> @@ -409,12 +410,26 @@ static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
>   			memirq_err_ratelimited(memirq,
>   					       "Unexpected memirq value %#x from %s at %u\n",
>   					       value, name, offset);
> -		iosys_map_wr(vector, offset, u8, 0x00);
> +		if (clear)
> +			iosys_map_wr(vector, offset, u8, 0x00);
>   	}
>   
>   	return value;
>   }
>   
> +static bool memirq_received_noclear(struct xe_memirq *memirq,
> +				    struct iosys_map *vector,
> +				    u16 offset, const char *name)
> +{
> +	return __memirq_received(memirq, vector, offset, name, false);
> +}
> +
> +static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
> +			    u16 offset, const char *name)
> +{
> +	return __memirq_received(memirq, vector, offset, name, true);
> +}
> +
>   static void memirq_dispatch_engine(struct xe_memirq *memirq, struct iosys_map *status,
>   				   struct xe_hw_engine *hwe)
>   {
> @@ -434,8 +449,16 @@ static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *stat
>   	if (memirq_received(memirq, status, ilog2(GUC_INTR_GUC2HOST), name))
>   		xe_guc_irq_handler(guc, GUC_INTR_GUC2HOST);
>   
> -	if (memirq_received(memirq, status, ilog2(GUC_INTR_SW_INT_0), name))
> +	/*
> +	 * We must wait to perform the clear operation until after
> +	 * xe_gt_sriov_vf_start_migration_recovery() runs, to avoid race
> +	 * conditions where xe_gt_sriov_vf_recovery_inprogress() returns false.
> +	 */
> +	if (memirq_received_noclear(memirq, status, ilog2(GUC_INTR_SW_INT_0),
> +				    name)) {
>   		xe_guc_irq_handler(guc, GUC_INTR_SW_INT_0);
> +		iosys_map_wr(status, ilog2(GUC_INTR_SW_INT_0), u8, 0x00);
> +	}
>   }
>   
>   /**
> @@ -460,6 +483,23 @@ void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
>   	}
>   }
>   
> +/**
> + * xe_memirq_sw_int_0_irq_pending() - SW_INT_0 IRQ is pending
> + * @memirq: the &xe_memirq
> + * @guc: the &xe_guc to check for IRQ
> + *
> + * Return: True if SW_INT_0 IRQ is pending on @guc, False otherwise
> + */
> +bool xe_memirq_sw_int_0_irq_pending(struct xe_memirq *memirq, struct xe_guc *guc)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	u32 offset = xe_gt_is_media_type(gt) ? ilog2(INTR_MGUC) : ilog2(INTR_GUC);
> +	struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&memirq->status, offset * SZ_16);
> +
> +	return memirq_received_noclear(memirq, &map, ilog2(GUC_INTR_SW_INT_0),
> +				       guc_name(guc));
> +}
> +
>   /**
>    * xe_memirq_handler - The `Memory Based Interrupts`_ Handler.
>    * @memirq: the &xe_memirq
> diff --git a/drivers/gpu/drm/xe/xe_memirq.h b/drivers/gpu/drm/xe/xe_memirq.h
> index 06130650e9d6..a6fffdadef88 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.h
> +++ b/drivers/gpu/drm/xe/xe_memirq.h
> @@ -25,4 +25,6 @@ void xe_memirq_handler(struct xe_memirq *memirq);
>   
>   int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc);
>   
> +bool xe_memirq_sw_int_0_irq_pending(struct xe_memirq *memirq, struct xe_guc *guc);
> +
>   #endif
