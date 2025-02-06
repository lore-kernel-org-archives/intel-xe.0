Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4534DC02194
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 17:13:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE2C10E254;
	Thu,  6 Feb 2025 17:13:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H5RnF0LH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D423810E254
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 17:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738861979; x=1770397979;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=hTK94oE+dFHhIjWBfe/91a87oS/fP1oJ3UkKr14arWk=;
 b=H5RnF0LHI25gk5EfdjH9vOO9hrPpnkoq8tMVpb7atsEirRsw4ZaHchuh
 SzoyDlMnUGHX+nE9bYRI4CZ29vhEwB26bT7tKQsc1/V2a9ga/DPny+u5S
 QNiF+ahwmkGwQdijdJ3KOMbGQZ5JhFo0go2P6Hr9anABRNV64RwYlO/3N
 NLhMg0XCKFz558/z6n1a1qMpxK1Qxk7xDGgTZazTsvKRrpTqstatlpwZy
 7UoB5Zwt3iOCsTGkPxzjOJthBA0/yck7T/yi213delEeJzHq664Br/41/
 Czb6Yj1aTOQIe6a8gEyQVkMGdMtqnn0B69LKopKnI2wFoCqvL9c5PQx7I w==;
X-CSE-ConnectionGUID: ESlySOqRQvOwYrAkxGolEw==
X-CSE-MsgGUID: 41Dmb24QSJ6RrRtoSsP6tA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50909052"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50909052"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 09:12:59 -0800
X-CSE-ConnectionGUID: RcmyxRvGTnKIEgJzupRg5A==
X-CSE-MsgGUID: 7f9hWkqASx2hGwyAObtSag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="111871665"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 09:12:59 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 09:12:58 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 09:12:58 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 09:12:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fk1dgrgrZJ82SfT7NpQ6/EzATeypa0DVZo+guW6AGiYH3CPSlReoksWulYuMHr/IPeVFpwR6SJhn8bLEv4U6NO8L/r5mDpBPu15vj9t6L0qQzMZDwSBZLYn8Eamjnxoz5/misANPlDIWlNRL01c2mVi6gNlo1L2dG2cAIpXJH87QtHqhf1se7A6M/nB52RGqBscUHm4o2UEvePkDn6LjnTN9mCTaHIJTffiucuEwI/62PVe+Pn9m1SXOs5UhkIBsdCXXD5QDoP8lH5J+xENWYDwGiPyvuEd6Xg/P3xVWG4bvS/OWa7Uc+9YIoECjYiCROmnYkXPXewRV+KLX6vv5yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09FE1HQSS7uCZfPu6wbAPc1uMC5qAr4YFa0BBXVNlZY=;
 b=YjMkulocMoVLt+ABH5zojcXhmg1+Lyc4LOsOga1w/al8H7IFoPh6kwB7cpYxhldI/OocPI0dS4i5tucUiS5Nf645VlVy66FEQ9Qe7LpCrZfrm+oSwa9PIv8FdjvgVrSeAmFMmlosnOj23rddHi3yX2LEem5AkmkfFgrWFOU8cxDNqCezelwY/s9LYDMjgJv1zjGATaD1uUex0Mh0FFTmwax7200E4dDH5BRAzC63naUEJnh/Wy8QqiGV0/LIlqIio3dU6Mq7HGE3dqIyJWBQSx0X8p6wRlWEscg/iD4G3AH9HD9A3im1R7OQnN5YMfNUAxoJmPCeCp1ZxpVdErySuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB6728.namprd11.prod.outlook.com (2603:10b6:806:264::9)
 by DS0PR11MB7359.namprd11.prod.outlook.com (2603:10b6:8:134::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 17:12:56 +0000
Received: from SN7PR11MB6728.namprd11.prod.outlook.com
 ([fe80::8436:8310:fe3d:d46f]) by SN7PR11MB6728.namprd11.prod.outlook.com
 ([fe80::8436:8310:fe3d:d46f%4]) with mapi id 15.20.8398.025; Thu, 6 Feb 2025
 17:12:53 +0000
Date: Thu, 6 Feb 2025 09:12:49 -0800
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <tejas.upadhyay@intel.com>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe/xe3: Extend wa_15015404425 for xe3
Message-ID: <Z6Ttkcj_XWatYkkF@msatwood-mobl>
References: <20250129005551.106214-1-matthew.s.atwood@intel.com>
 <20250130173030.GH4460@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250130173030.GH4460@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4P221CA0027.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::32) To SN7PR11MB6728.namprd11.prod.outlook.com
 (2603:10b6:806:264::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6728:EE_|DS0PR11MB7359:EE_
X-MS-Office365-Filtering-Correlation-Id: 72798f68-b055-4142-2f49-08dd46d17dcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmxBKzNsTEVINHpDU1Q0UStlNnkxUWdVTDNGenUvMXl1VVlGemdqQ2ltMjBi?=
 =?utf-8?B?d2ZBbFhKZy9VNHhwRWtLZFVUV3RUZkswSnhMVVcyZVAzQm9DRmpZNjREMG15?=
 =?utf-8?B?ZCtSeXpsV2dCTTU4bHJ3M1ZaYVRMcnF5UnpiM2VmK1lvcWZlOFloKzhlcWcy?=
 =?utf-8?B?eExadnlDR01PbjArWTJLbk1Yb0ppdjNYT3pDZlVCK2N5a1lzNFY1OERlalRW?=
 =?utf-8?B?MmtlejNhS29BSGJ6T09wVWxxUGFmdnRZckxkZk9LakpRQzlCMXRvMkNvQXZz?=
 =?utf-8?B?MEFndWwraDBiNXROaFF0ZTNYZm9ZYU9xSUt2cEdKdlB2YmVuWmNlWXhvaUFI?=
 =?utf-8?B?VXhsbXNwVEZWYzNkdG9kUnpHTWg0bytXbnM2UGs3Qkh2Nk5VT2pEMEVFeHVG?=
 =?utf-8?B?TjMyUFQyLzdZcEZleGNEZlJEZ0ZzV1g0Q3NSbjRWbEYraUMyeEJrQnRqZjhO?=
 =?utf-8?B?N3FEeU5EejJyd1A3NmdVVVUyWEwzbFFXb3J2cXQ1aEszdk4rSG9BdU93dk8y?=
 =?utf-8?B?aXUzMDJGVHdjQjFwdUtHMmRkYk55aS9RNVBYWmlHcEFBR3hDcVpoMUVqazFO?=
 =?utf-8?B?WXhIeU92NmlJV2JReVkxUmM1ZW9tVkpJbTF6d3lWWU96MlFKRFQ1T2NyR3c2?=
 =?utf-8?B?SmxpREdNT0o2ejdGSXJmS0hUK3BHdWd6U3QyWlAwT0YwZ2t4VmpxdXIrL1lq?=
 =?utf-8?B?U25EK0lodWlUZkluWG40OFZXaEZHOEgwbEI0aGo0SVlJNTc3U1k2dzJXVUEr?=
 =?utf-8?B?dmRPV2xCc3QxS0pPOEhJRktWdXVTQUYxZk1vWmNnVkFBS2RNQVZHL0lYNHAy?=
 =?utf-8?B?M3Rsd0hEVzQ4anhoS0xoaXE0bWJqU2U1cmVnSW5KY0pHd3luMFBiYUNvS25N?=
 =?utf-8?B?endiZkJqeE1DSThiLzlac2g1QllGMEZFTzFjODV3RWFVVW9QNm1aVHZuQmxx?=
 =?utf-8?B?MFE5SFI4TUVOa1RLc2puRXVhTkVxZE5mWk14aHNIQm1jYjh3RVd1ZUt4ZUxn?=
 =?utf-8?B?cW85YWhxYzBTMkNhdXVOSjk5cXhrWFFyeU9vMW9ZR3pOWlFQYVJiZ09SaGRm?=
 =?utf-8?B?UXlXakZxejNtZFFaSjVYZHdSWDZoSENZTnZDcmdhUVNtcDdQVXFQbEFZOWRZ?=
 =?utf-8?B?TU5UY0JBby9WRzlHNzRwZnFoeVZyVDRXelJJZVdSeVl6VEdOUDE5b0dOUWY0?=
 =?utf-8?B?Rm8zb01CVEdpMXZHVjhwOHhuajhDaU5jd1R6YTdPWjdreWRRT05KeEJsZ1Fv?=
 =?utf-8?B?aFNtVUdyWG9GTFNZMlVqVm1PWlBIR0VrRTRNekQ3K0pWenZQODJ4VzE5c3Bx?=
 =?utf-8?B?RnNtSmtpQ0wxazh6NlZ3Uko3SDRRQzdkTUpVZUhoRDBQOVBTeEZqakV2dlpL?=
 =?utf-8?B?MWdUNWRVYU1Zd0xESWJ2WkdwTERNbjRibkowV2JQVVl0dlc0Zk13RVM3OUg0?=
 =?utf-8?B?YkJCSnJEU01uVm1LcVdxd2grZWs1WmR4UndSQWZudjdUcC9uWjZ1a3E0SzZP?=
 =?utf-8?B?SHo5R2grMGtpQjEvdG9VU2Q3bDFnMjFJUTdVQjJIU3RJc1VyZnArVWhud0d4?=
 =?utf-8?B?MkFraERkcUlNWWJ2WE14dzlKTFltRHBWV3VyQTJjbWFqV2xXM1dmWjlZelUz?=
 =?utf-8?B?Rm9PeTZaNlRZY2RJZGM4TjA3ZG9GcXUwVW9TRDNUMm5GMzRqdm4wT212em1u?=
 =?utf-8?B?dS9DRFhrOGkvQ1ZtUTNudlVLVHUwWnQzUS9ZODdaMmZQWlE3ZnByV3oxVnNN?=
 =?utf-8?B?M3BXUWEyTHhaL0s3SHdCQTlYNEdSTWt2TmtTUUlMcXRHSitZVkd1eWhJa2dW?=
 =?utf-8?B?YlY3ZXFJbXF2dExzWDZnZlJibU1EKzJ1Wk9RYllCdFQwMEUrVVl6NU1ObE9o?=
 =?utf-8?Q?hxUsCiFtQhN0A?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6728.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUg3T05SbTJ4Q3NJS09QZmROemVOZ01CUGkxQWNPU2dURi8wdnNORnpCQ2Zk?=
 =?utf-8?B?RGEzZFF1TjFiME8wSGFCbmdXR0JGTzVsZXJpdVNwTUordFpLdENQakNMWElo?=
 =?utf-8?B?Mnc4S01mWkJhNEkwNG80YjhJdFYrYW1GRVh5aUUwQk5ybHZkdXhoSmFzRWhr?=
 =?utf-8?B?UlJ3b3BzcmJTem15MWtKUzdpOUZqV1JGbWRCQ25kNFVhcjFhbzR3bVNQUitB?=
 =?utf-8?B?RW9xYUpTZFlwOWxSV25jbklmQ2p1SThrNDhyelhoUVZGYU9CQUx1THJQWmRi?=
 =?utf-8?B?L0Z4alRiMEFtclh1UUYrOHYxL3A1OFhPY1VNcndpa2g4S0h3MHl4aFBaN2g4?=
 =?utf-8?B?b0VJZk0zcW1XZkVkY3VvaTdDRjdmMll5TW55TDM4UERTLzF0S0syWmVjSmh4?=
 =?utf-8?B?K3licmI5ZE1vbGlFSGg4T3U2QnJtL01XbFRSS2JvVUJIZWx3UktYSzVmdyt3?=
 =?utf-8?B?eFA4TEx6bG5VUkJlZDAzTlJoQTIzbENFcjN5VGxuSGhrMTZDb05yTzZ0d1pO?=
 =?utf-8?B?MUd2RVFXUEMzQ2xuVTc4QnhFTDNZUzJ4MHNDanc4N3J1QmhuSmZvVnE3SEZh?=
 =?utf-8?B?WUIrbHVhYWRrbXF5cG5odjhJaUJ6SmtKRll1OHZiRDY4R0dJbzdKaC9YMENZ?=
 =?utf-8?B?SkpRMnliWmgzZmw4ZFN5TlNmOFJRaEI4ejd3WWV4M3ROUGgrZVloUHF0cGVD?=
 =?utf-8?B?SlVYMHN3eEpMRGhQRmhBQ0RNU2VRMGJtaGZkc1BJT3NxSFc4bVRHYzdaL0dF?=
 =?utf-8?B?UE12QjV3ZzNJT1VWZFZrS2FDMzRUbytVeHJrYXliaVNXL3RIU2dtdGQrWCtm?=
 =?utf-8?B?SVVrbjdRazc0RFJOL3ZML0RhM3hHV3ZQb0EvR3hRQlBSOCt2K0I4QzJaTDJQ?=
 =?utf-8?B?VHd5ZUxqMlg3Y3pkT0ZvT1F1THY3Uk1PZUl4L3pMbmM2ZUI5WGxUV2ZVR1NV?=
 =?utf-8?B?RnkrUm0xS3BhSC92cko1U1doWTZtK0x1WkpKUkJDUVdqUlpMZVBQQkp0am0x?=
 =?utf-8?B?QTBOakFoeURRL0szZk9ldE9oU2FYbk9zLzcwVndOQUtBTm1uQm9oNEFHeU1G?=
 =?utf-8?B?SWMza0dmMVBQNU44SG5mVDNBYUcwYk9MemtBcUpDdVd4VTh6cWNwUXFmRmtP?=
 =?utf-8?B?RG1GaytYaTV5Qnh6Sy9SQU40VnBxSEVuOTl6ZmtXbTlORWx1QVhvZG9KTGl5?=
 =?utf-8?B?amErWTkvaUFRRjdsSFc3VlFNQmI0KzE0ZFFjTjZ0aTl6OVcwZ1hralMxb3BF?=
 =?utf-8?B?ZXEvNmlwTE5kb1J1TmpuejdCMU02QXZGWEhFTG9iREJyRWZCVnpaZTZ5WTF5?=
 =?utf-8?B?VmNsWTd5VklJNDhwZS9BN3lSaGdpOURkMlpmQ3FsVmxBZ3lNN0VkRzRDUHZO?=
 =?utf-8?B?T2FzbXhaTEN3dTVxT0FERXg3VlN4dUZ4OXVvWXhLaTViWk5OUENSc3RoRWtt?=
 =?utf-8?B?Z0FoSDQvb0Nic0hJVEF4eC9xbjBncTdiR1ROb3JxaHh1SEk4M2Z4azAyckpM?=
 =?utf-8?B?MUxwUGdtdUtQNCtVeGRJQW1rV01pdEUwWTRKb0VqbXlhMWR1Ri92OEdhUUNp?=
 =?utf-8?B?QkplR0VDOFhoYWhtQVZodUhSK0hMY0lXbEdGWEpaUUdtcjlsemJ6K3pQY3Fy?=
 =?utf-8?B?Y004UHJqTCtUTjlMVnYyeHg3cjIxM21xdTFuTnBROVRmRU9RejNhT09jZWJk?=
 =?utf-8?B?eG5XNW1OMjREVERucVQzRmxaQUgxU0FkNkgvOWZNS2g1RlZ1T0VsOWNTWjMw?=
 =?utf-8?B?dEYvNWhWUEROV3paVzh0blVXS0t2NEZQeWpSUndmWDByRmtxaFVGMWRRTmFF?=
 =?utf-8?B?dm9mTkd4S2kyTC9UcmlBcSs2S1kwMnNpUWxzQ1p3Z0xmOHlkT2xXSGQ4SlVW?=
 =?utf-8?B?QmJOYUprTDB0N3FZU0w1NE51bndOL1ZUK2VKS25WSTJwQndOVzlEcEZ0b3VH?=
 =?utf-8?B?dENyTGJWelFKRjFxdnhYSTN2L2Fma080QytsUUtvZFFKRXBLNitvaFFjQXZz?=
 =?utf-8?B?bW5LeFB5OTRzTWk3dXpyRm5mVlV6bkMrdWJPdnFUMEhBOHFqVDBDQjRTWmVU?=
 =?utf-8?B?eWY2M2QzaFpXa2p0bjduam5obGZEeDRCemNBa1d0Vnp3cVhGZDA0L29CQnZP?=
 =?utf-8?B?akhQa2p3YmErZ3JIWGNkZUloY2xMaFp2VjZqbjh1aE9XcFJDN2R1aVZEeUxx?=
 =?utf-8?B?cWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72798f68-b055-4142-2f49-08dd46d17dcd
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6728.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 17:12:53.0306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3iB59NEsXRztE6HzjPe3NY0vC2z6+hdM/swdmjLugC5d2SqVG8S5Jo18gQZQD0wKkJ1RyZed+WklvdDtjViuPOlRmjo/K1db8EaTWUOPs68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7359
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

On Thu, Jan 30, 2025 at 09:30:30AM -0800, Matt Roper wrote:
> On Tue, Jan 28, 2025 at 04:55:51PM -0800, Matt Atwood wrote:
> > From: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > 
> > wa_15015404425 applies to xe3 A0 step as well.
> 
> We really need a better commit message explaining how this workaround is
> different from our usual ones and why it needs to be handled in a
> special way that's different from all of our other workarounds,
> especially since someone who just quickly skims the workaround database
> without digging into the details is going to incorrectly think this just
> applies to Xe2 media and isn't relevant to PTL.
Ack.
> 
> I was kind of hoping we'd add a more well-defined infrastructure for
> handling device / SoC workarounds.  Adding quick hacks like this is
> going to get out of hand quickly if more of these start showing up.
Any particular ideas here?
+Lucas
> 
> 
> Matt
> 
> > 
> > v2: query based off SOC stepping
> > 
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_mmio.c | 13 +++++++------
> >  drivers/gpu/drm/xe/xe_step.h |  2 ++
> >  2 files changed, 9 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > index d321a21aacf0..98d068ad33bb 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > @@ -150,14 +150,15 @@ int xe_mmio_init(struct xe_device *xe)
> >  static void mmio_flush_pending_writes(struct xe_mmio *mmio)
> >  {
> >  #define DUMMY_REG_OFFSET	0x130030
> > +	struct xe_device *xe = tile_to_xe(mmio->tile);
> >  	int i;
> >  
> > -	if (mmio->tile->xe->info.platform != XE_LUNARLAKE)
> > -		return;
> > -
> > -	/* 4 dummy writes */
> > -	for (i = 0; i < 4; i++)
> > -		writel(0, mmio->regs + DUMMY_REG_OFFSET);
> > +	if (xe->info.platform == XE_LUNARLAKE ||
> > +	    (xe->info.platform == XE_PANTHERLAKE &&
> > +	     xe->info.revid == PTL_SOC_STEP_A0))
> > +		/* 4 dummy writes */
> > +		for (i = 0; i < 4; i++)
> > +			writel(0, mmio->regs + DUMMY_REG_OFFSET);
> >  }
> >  
> >  u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
> > diff --git a/drivers/gpu/drm/xe/xe_step.h b/drivers/gpu/drm/xe/xe_step.h
> > index 686cb59200c2..879486a818e9 100644
> > --- a/drivers/gpu/drm/xe/xe_step.h
> > +++ b/drivers/gpu/drm/xe/xe_step.h
> > @@ -20,4 +20,6 @@ static inline u32 xe_step_to_gmdid(enum xe_step step) { return step - STEP_A0; }
> >  
> >  const char *xe_step_name(enum xe_step step);
> >  
> > +#define PTL_SOC_STEP_A0  0x0
> > +
> >  #endif
> > -- 
> > 2.45.0
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
