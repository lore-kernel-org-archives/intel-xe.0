Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E809E7FDF3
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 01:02:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 153F510E4C9;
	Tue,  3 Feb 2026 01:02:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XIZk0+TK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0AB610E4C8
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 01:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770080545; x=1801616545;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=x+l+ko5KiHqflciWvJM1ekdooQR88qjqOp/baXYyfqg=;
 b=XIZk0+TKxo3AIq0fdEzygAB2/0cArJDoS22sIszexP/Mkb4rsBWquS4X
 6DdlucGLGJMPBHUaGmOytSkGANK4mPpCsw4VdWkyvNjH9rYohb6QHGVI9
 7ek6+IPJ9sMLmeMBuvkJMMNNJL5YHDljeAwKg1iNV/XA+WCNxcMEgt9dO
 loFipIMw2iPNgCr1vKjEcc0LPVr8TgfbqW8h7XLkB0rS8xVTv5ziiQ2jf
 Kg/LDE2dydi/QDnErw4qnV9CXG3trYTXDE0HQEzku5GU2Dc5jDdmZGByj
 Bwq2MPtg4uRrBVJoVlALfKXe7FzAthhM+EwLlhNHyoQKEt7jyb+MZBW2+ Q==;
X-CSE-ConnectionGUID: e/sOZ4FWR9argiOvqzca4Q==
X-CSE-MsgGUID: NwU3g4HDREuDAwZAeSj+Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="81560551"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="81560551"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 17:02:24 -0800
X-CSE-ConnectionGUID: LgkhC7OPTy6bNN6OnvUDiw==
X-CSE-MsgGUID: cQEd0KPZQJy9NwPuXODw0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="240359325"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 17:02:24 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 17:02:23 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 17:02:23 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.44) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 17:02:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ct7eXZUFsA6O9kRVyBvsgofQHNfZSHkLOf6PNi2me+mOE5WnapRAWJwCtGDHjOBvTI9edbb/DmxNWTPaD8A5307lGSf1qEEzCkCNemkBTElYA3vRbQsdKjW8klWoF9J6gPBVuHuRywn2C9MjM0pTErr5Sff7bKP93nPSm6bHHfC6k6o4SQCGxKnwN07wo4cXGx3FCWy3tQoVbRl8Q65q7IlxFMG7UpnbBrIvZjOBiyG6ecyRzzEMR8clqeAaOL7iWr/VBANDBnkZ26x+tW5viKNMOGBqHcJMmiuHnYR6RA3xsxgKq16mVX7o73VaASTXoDo1uZ0ZOn779ivp0XOl3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uYl5NsGBbxRaZmTlam1FjXGGVcTIH7JprSsVD0JgHxk=;
 b=Do62sCo57DAoYm4Qst/QpqRuI9TphFwlDr18uyfrf4p9yVdtr1z4g29JwjYWEUeoXCssxfVPCh9XyMnb01WAPeaCGck2RWqNfhepfVUIo9oj1peLPyDSvvL4P5xQXhQwvhx+7/eDq7FQgRycdDWDUfcnpSPm+gfC/Ayii+Vxy1V+BHMDe5EQZQCw1lPI2eR3CO80zkcjSmTDAQGvth9H4eTvhaXXQS8V5c5FxqFz/msZ3rrjnpkU0FgWyfY2AF3jUdI3hnrLpo3EFPjKX1x2gh3+4xmWiEZDLrJQ1R9m2ByCbG/B9qG9rQcKZzE8O5AGNnivcTuk0uLZ5OfA7XC6zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SN7PR11MB7091.namprd11.prod.outlook.com (2603:10b6:806:29a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 01:02:15 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%4]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 01:02:15 +0000
Message-ID: <019f9fc5-5695-4b65-b39c-8de2ee278f9e@intel.com>
Date: Mon, 2 Feb 2026 17:02:15 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/xe: Enable Wa_14025515070
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260130210120.2682085-5-julia.filipchuk@intel.com>
 <20260130210120.2682085-6-julia.filipchuk@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260130210120.2682085-6-julia.filipchuk@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::12) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SN7PR11MB7091:EE_
X-MS-Office365-Filtering-Correlation-Id: 0470e473-2e18-4a8a-be33-08de62bfdf12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlFHbElTa28wUHJTWWRiQlBSVWZodlVENWM2SUd4QkVablFnMUpjTFhNdmk0?=
 =?utf-8?B?K3NKRWYyTUM5L05nVnpCQnA4WGdMdkRRUkl4czVPdnY4QUhGVTBaTE81WU5z?=
 =?utf-8?B?NTBiaUNuV2doY01ETE1ScTJ0cllDcG0vZnZuSVN4YkVmOGtrRVVwLzVIblU2?=
 =?utf-8?B?UlV5T3VwSEorMEJhamZpTnZ3dFJSQ3RadFdCSDh1djZFVElxWGZSYkNJcHM1?=
 =?utf-8?B?VXpmYU94Y3Y0NUZGN216MmdmOEZHTTU1emEwQWMzY25VQzZMcFhPV01nWkFq?=
 =?utf-8?B?RWFYdGZseFBtRzdHY0tXM2wvY1FGSGxWMGo1RDJXUDlMUnE4MzJSV3NTa29G?=
 =?utf-8?B?NTRKaGtVR1ZKZnh4WDJ3Q3NnTnI0UFUzQ0tUTUJjWklhNS9LRFlZMXJxVmRQ?=
 =?utf-8?B?M0pzQXVGZVpIUWl0ZVduRUtkdFVkakx1Ylc2YXdCZWhvbUdEcG43TzgzQVhR?=
 =?utf-8?B?elJteHVUSDZOVUFZclZKNHc5WHN1Vmh2NnpzMTBuQ25PMGMzTkpyTWVwWnNM?=
 =?utf-8?B?eXAvTFcwS0FBRlcyVmFML2N1c2tvTVpLeXU3Skhtc3lDMXJraVMwRmt3aDRB?=
 =?utf-8?B?UlpLSGp4eVFsQTRhaWdhbmhFRXJWQnJiVm8yalVHR2xyYyt0ekRSajBPMEdK?=
 =?utf-8?B?dGJCMGFBcFZwU3ZPU01yNVZGMFRkZVhYZ0lPYlR5cWI4eVpCanBWdVlpMW4x?=
 =?utf-8?B?Zlh5VjdxdFlqdno3MStPU0ZudG5ad1pmdVBBQk5CRnJpRjBTVitEdDRBangr?=
 =?utf-8?B?QzJ4dDFWN1RBNURjNGl5V3JDbUE4cmtueWZQMitmWW51WDEvTDR1Y1ozRHNa?=
 =?utf-8?B?Q2o1V3hJVE9jdFJ3VEtucVdUeXJwbEp3U0czcGZOb0hSWTd1MWErQ3hVRE5M?=
 =?utf-8?B?SU1mVGRxYXBPRS82TVIxQWp6NzZ1WTBhOWZWbWdpRGQ3cGxCaDlpZmlwSkUw?=
 =?utf-8?B?ak10TWZzMHhBVTRwV1VPT3VHSVZESzZyd1UwalVwUlVwZHFjQkZpWVhSeWpR?=
 =?utf-8?B?K3IxN1M1TXFKZVQvOWExbjZZdm1kTmdTVEh0YUh5ZzVRaGsvdXVDT1MrTEYx?=
 =?utf-8?B?ZmNTRWxKdFM5b1VUUGl5MGdBZjI1ODU0SDlNNDk5eFVXbjlLVTFkUnZyYyts?=
 =?utf-8?B?T21iSkJDNDlDd0tRem9aVm5LdTN6di9jZkFSeC9Dd0tOalMxdi9wcVVSZ1FZ?=
 =?utf-8?B?WTRCMWNzMXdNb1lpTUlZbmR3UHVtcmxjNHBnS1hrUjJUQU5DRStrck5rOTBV?=
 =?utf-8?B?aHlxUmVUNVpXSCtUQ0I5N1ZVcTROMmcxT3F6QndZcEpFVXdsakxYQ2xNemtN?=
 =?utf-8?B?RnJneGUxWm1JdlFlS3N3dzNFNWVxK25KRk1hNXFhakpDZlpFcjBDNGllcEdw?=
 =?utf-8?B?cmxDWUtxMjU2azNxaFBTbHRpVnVmSEk2ZWxJd2owTkFQMVJrdEJSOVVmUlk2?=
 =?utf-8?B?bkNFTDJmQWN0MEh5aCtLZ2ZNdUZnYzdodTBoYXIyd2Fyb3Vicjg0M1dKQ3Rt?=
 =?utf-8?B?RkRXcGdpOTBMSzJ5VFZBZG0xcTg1Vk1PN01OWU93Mko0WTIrbStva1JxNCtG?=
 =?utf-8?B?a0NFc0tCbUpFSlNraHYvYTZkZGdOaUFZT3h1R0NOSGczcjFNYVNBcS9jeFJw?=
 =?utf-8?B?Q21TZlhDZVd6M2JaaCtzdnFSdFFCaGprdnliQU9ZTUhpdTF3VFJ3OGYwMk5j?=
 =?utf-8?B?dVFiVlMrTEE3R2l5bEhnSnU0K0ljaFpUSStSOHRiOWRNYVo3Tnh5dlBGbHVX?=
 =?utf-8?B?NWZmMUphU2NxbXBmck9YVmQvSEtwbDdkUkdVRVJONmNDL1VURHN0N2RhV0VR?=
 =?utf-8?B?RFcveW8wdnRZdXBvSzFZVnpuM2JHRElEakVkWE4rL3BvVXBQUFRvR05QYjcx?=
 =?utf-8?B?b3RPZ284QVUwbzRNV010NTB6N1pUQnBTMlcwcTZSN2ovbmVyNUVxYTJnN0NW?=
 =?utf-8?B?NFpOcWVmSktibk9QcFlzSHFPRmtYMVQxVCttWlJZM3pRcUdoQ3p0REE1T2xt?=
 =?utf-8?B?OEJKSTYvYVNFSTJaQ1dkSVc1dml3VE0rRWt6OFpZd1hCRlk2OFJKdnE3NldC?=
 =?utf-8?B?c3I3dGRKaUpjeFFnQVdBRkVyT05DRzJsV1NsUmcvNGRrdm5oaUV3Vy9JVkNZ?=
 =?utf-8?Q?2jyQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUdsRTBzbjIxcVhwMjVXcUo5aEhqTVdKbzc1SmNCNGNqK0dIazJqWi9MZ0Rm?=
 =?utf-8?B?d21xUDBCTXROSWNmQm5hVmFqSkphcDhZNWtDVVdxUGVYSndiN3BXenA2UDdm?=
 =?utf-8?B?cnRpczA2RDk1VER4VlRnRzA4Nlo0VEg5SWczdnJwZjIwTGFKSFRhdWpqdTRQ?=
 =?utf-8?B?Zll0NlV6dDhXd256T05GeHprWTkzcUxCTGw2R0hkSEZZUUhJdmZzbWNkcldL?=
 =?utf-8?B?UWxBZVBDM05mVWRsd0hxdlFRUHhwVmVyaUZ6SG1lZy9SY1I5dk5EMi8vdTFl?=
 =?utf-8?B?ZmY4VFlsa2JGWTZGbnM4UTBEMEFYM1R6QlpNUHd1TkFyeGtFQUI0T3pZWEU2?=
 =?utf-8?B?MWE3NG83QkhNVnBuaGxZdkRWN3ZHRW50ZTdZb2tsNkZCZkdVNmh3Mlo3ZU5I?=
 =?utf-8?B?YlZ1RmR4bkVkMUhXMkRPUTFpUFp3QzJwS09qVkZVNHorck9jSmR0T1dkMGR3?=
 =?utf-8?B?M3c0bVlINFA5cXoxcjVrTkhRMnlYL0JrelpZMm1XTDh4cjdWVmg2aEMvbCs2?=
 =?utf-8?B?VURaaU5hNFdzMFNjWVdqQTFQcml1ZXVyM0dCQ3hhSlN3YUV5Nm82SllkUndK?=
 =?utf-8?B?d2tsNlB6NkZ1YWRReG43OEEwSHBhRWNiZWYwdXhLNzhxV2lsbEtITGdCV2Ev?=
 =?utf-8?B?ZEdETkpBYXB6cU9BWXRlY05KYUZGaXNlVHRyS2J3VGdTdmFGQkN2TVk1YlFs?=
 =?utf-8?B?SytJNXNSc2VzOUJHRVJJbDdPSTY2WFZmY29wb3NWZ29IY21XVzRiV01wMEwr?=
 =?utf-8?B?ajhZektUeWJGZ3JzaVRnN2d3YVFmbWxRVWJKZUozTVF4R3g4U0FtR1ZyZkRv?=
 =?utf-8?B?bXNwbmloSjM0bnE4VzhHSEhjRXl1UFhKL1NCaG52NHMyL3NQRHRJV3lVWndR?=
 =?utf-8?B?VnJZU21Zd0RtZGFacnFWaWh0aGkwM3JzSmkwZy91d2J1TGVHM1EvbGN6ZE5Y?=
 =?utf-8?B?ZVMxWHZYdU1YWnoxVnZacFQ2VVNsck1PS1ZXZVV6UzlPSy9FS0s5OVJSZjM4?=
 =?utf-8?B?M2JZOEsrNEJPOG9TMGorRDhDN29iSE5mb2xGRmZ3L0psSGpjcnZqOWtzMGti?=
 =?utf-8?B?RzdaaWVUU0tyY3BadE4yUEt1alV6V3VPNDNyQjFFeXB3VVhaVDdEVWxja2o5?=
 =?utf-8?B?SHArNW14eE1QRmVYOS9iY0xxNkV4akRZQTNiRlFwMmhrMVBKTEFzeEdGTHhO?=
 =?utf-8?B?ZllSMTVUUHlaTVpkdGhPQmRUNG9jOXJLbm9IdUFxdjcxVm1FRzJ5THRkUWdU?=
 =?utf-8?B?eVoreDBqOXpGTWF0UUkwWjNublhCWldhWDBlQUVRTGNqUVJ5N2hwN1dUaG01?=
 =?utf-8?B?MUNPSFFTVm5YK1ZYeGdFM3dmdUtWSGRKaWhCNFFiQVkrM3QzMFI3MG1EUDNY?=
 =?utf-8?B?NGdTQVU2VnpzQjV3NDY1TXdhZHoyaXZubXV3TjRYek5TQ3BXeHZMSlFacWt3?=
 =?utf-8?B?Y3NFWHdZRUtUNHZJY09ZVjF3d3ZSdkxIZFlVQWo5a2dTNTRUa01OcmFFSlYy?=
 =?utf-8?B?VVA3eE02N0UxU2NLdStFYWw0ZmZweVVzUDA4WVJGYWhKL2lsTDE2eUdSRHNj?=
 =?utf-8?B?MENhb3k5NDlkWm9RTnRlMEdMdyt3cGFoSUc5cUxiay9yeVg2VWlYSERJU1Vk?=
 =?utf-8?B?Y0VpbzZGbXZZRUdXcjk4N29FS3g4L1pGbzRxUjZuMGIrcXUya2JPcXUwcDVK?=
 =?utf-8?B?ZXBqdE5aeG1XYTFPendIek1oMWh2bElwTnl6U3dITXlSZTNoSEJ2ODZqU0FF?=
 =?utf-8?B?OEl6MjJoQjFHdDV5Q2h4eWdrRkJ4VFlWWlhUMXJQVlk3R3NVVFNrMVk3Mmlj?=
 =?utf-8?B?Wnpaek51Y1hnTVY1bGlGNWNsaWpyMDlXK0tWVk50Q21Lc0F3SlBxY2J5bS9u?=
 =?utf-8?B?bFRNMU5Xek5Za3Y3UytadnM5M2c0Wjgvb29PdFI0eC92dkRuNFBCU0d5cnRs?=
 =?utf-8?B?L0IweXQwQUNaY2U4OU9CdWoydnllbXp5NGJFbUQyVmRwM0RuaGw4UGRSMXdB?=
 =?utf-8?B?MWE4RnJBb01OZEEzTkdUNUwvaUZXRWI0UVBPT2RSb2hmTWhOYm5ObXlYTnNB?=
 =?utf-8?B?ZmJtcEhQUjFRWFljN0V0azRUZTg2THc2TE9OdWh6WXhQWno3RmRHUFVwZ1d1?=
 =?utf-8?B?ZE56MUlocWUra1o4M2JhWHJPTU96YVlpUW41VDErdHkydkRpdXZDcEJDb2xM?=
 =?utf-8?B?OHNyNGpNdVpJL2sxMWpDUXF5bHNYNHRhdklNTHZqelhtUFZkcEc4SHYyMEE2?=
 =?utf-8?B?aVEvNzJ2TzNXdFpmdWp2SG42RysyRlFFYjQ1Vno1Yytkb3Y0bHdQK0NXdzJC?=
 =?utf-8?B?N1BwWm1haEhmNmF1UFFhMVBLc1RHTEEvRHBWK0xSYjRueCtPTXRnaW1oOU00?=
 =?utf-8?Q?JhYBiHS/U8RC/aKw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0470e473-2e18-4a8a-be33-08de62bfdf12
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 01:02:15.5476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/OopHM9eGBA0fEKIjtgxrgWoVRSG9Dxo1jF+NHk2fNX1MA/hHMRfTVVr6lsyQVMYw1uFXyvX827y0DA0GTG2EKdbzysggcHT1FT0qq3PZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7091
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



On 1/30/2026 12:50 PM, Julia Filipchuk wrote:
> Corrects a failure on context switch. On registration of context with
> indirect ring state will correct state of targeted and idle command
> streamers.
>
> If Wa is unavailable, notify and disable indirect_ring_state.
>
> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
> ---
>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  1 +
>   drivers/gpu/drm/xe/xe_guc_ads.c       | 10 ++++++++++
>   drivers/gpu/drm/xe/xe_wa_oob.rules    |  5 +++++
>   3 files changed, 16 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index e33bd622ab44..69e6d9f9650c 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -496,6 +496,7 @@ enum xe_guc_klv_ids {
>   	GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO					= 0x900a,
>   	GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH					= 0x900b,
>   	GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG					= 0x900c,
> +	GUC_WA_KLV_CLEAR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CONTEXT_REGISTRATION		= 0x900e,

Maybe we could try to make this define a bit shorter? something like:
GUC_WA_KLV_CLR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CTX_REG

>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index f4cbc030f4c8..1c563a01c12c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -360,6 +360,16 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>   	if (XE_GT_WA(gt, 14020001231))
>   		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
>   				 GUC_WORKAROUND_KLV_DISABLE_PSMI_INTERRUPTS_AT_C6_ENTRY_RESTORE_AT_EXIT);
> +	if (XE_GT_WA(gt, 14025515070)) {
> +		if (GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 53))
> +			guc_waklv_enable(ads, NULL, 0, &offset, &remain,
> +					 GUC_WA_KLV_CLEAR_CS_INDIRECT_RING_STATE_IF_IDLE_AT_CONTEXT_REGISTRATION);
> +		else {
> +			/* Disable indirect_ring_state when workaround not available. */
> +			gt->info.has_indirect_ring_state = 0;
> +			xe_gt_notice(gt, "indirect ring state requires workaround present in GuC firmware v70.53.+\n");

With v70.53.+ I can't understand if you mean "70.53 or newer" or 
"70.53.*" (although both mean the same thing). Maybe just v70.53+ would 
be clearer?
Also, shortening some of the words should make this fit within the 100 
char limit, e.g. "indirect ring state requires a WA present in GuC v70.53+"

> +		}
> +	}
>   
>   	size = guc_ads_waklv_size(ads) - remain;
>   	if (!size)
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 5cd7fa6d2a5c..1da3a8f96f98 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -69,6 +69,11 @@
>   		MEDIA_VERSION(3002), FUNC(xe_rtp_match_psmi_enabled)
>   16023683509	MEDIA_VERSION(2000), FUNC(xe_rtp_match_psmi_enabled)
>   		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_match_psmi_enabled)
> +14025515070	GRAPHICS_VERSION(2004)
> +		MEDIA_VERSION_RANGE(1301, 3000)

We usually avoid using big ranges that cover multiple gens, because a 
new derivative might be added for an older gen that doesn't require the WA.

> +		MEDIA_VERSION(3002)
> +		GRAPHICS_VERSION_RANGE(3000, 3001)
> +		GRAPHICS_VERSION(3003)

According to the WA database this also applies to Graphics 3004, 3005 
and 3511 and Media 3500 and 3503

Daniele

>   
>   15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
>   16026007364    MEDIA_VERSION(3000)

