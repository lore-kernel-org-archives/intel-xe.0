Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F50C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Apr 2024 12:16:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE60112A52;
	Mon, 22 Apr 2024 12:16:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jP0OsnAa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F1E112A51
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 12:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713788166; x=1745324166;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=b7foZeewWJ85Hlp1m0zNpsb6snmshkUgy3HuymT41nM=;
 b=jP0OsnAaCVHVsXQsT7fFAIRAAKsGJAKIUhcKm5m6h+DRNVrDz0XlFMpj
 TZNEh7YiH4qpVXjFu6tvtLXzRuECjSvuvidQBolNKOgdKdLUcjm9u1bV5
 ezogqRp9pfNvQnsrNkiWlfofXwl83fnTq2+53RJMIvmLvllNPYXI0DNWI
 96ZIyKPXkn3emF82ow/56aKhu4Tn1PlQ/hNIOjbeRxyYK+xGB2l+wCAEe
 qUO443RK8IVOCNEIA/IBYD9bhKmkIEa2ON2MfOhZm2SjZ/Gah3mHVeDdB
 PaeAIifTiJxzV0aoRkgNuUHfjchpGZxl9IIJInWZa6TSqKLa53GJvHyPU g==;
X-CSE-ConnectionGUID: +Qessf4aTwm+RKsAl6Z3ew==
X-CSE-MsgGUID: KHFWwIX6Rgqj4eDGjD7cTg==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="13096908"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="13096908"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 05:16:05 -0700
X-CSE-ConnectionGUID: 3TpkqBa7TICoq+X4I4c0lg==
X-CSE-MsgGUID: u5twLMMOSO+ffCDSMRyJYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="28458834"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 05:16:05 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 05:16:04 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 05:16:04 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 05:16:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ArhpT3KZNeIdyfQaOrlIZadzBR4CcmvyTWJckRQj0UlLfCPpomPH0BaSSZCN6nQx1CLwNWzQnvfpQ5l5l8nm924iQluwnWSo05kBlRSzIttQ4FEDlhYcAY6SSNkKDg3Wbj3deZtVDV3LSjBTqObekHbxyyBCHRVzpLZ9+VwH8k+K4+OHGQ2aEzoLkca/F/WrRPiojkXnEiiIrV8TW+fbSCrDZYHla2xJd5s05GWNZrJyjrXFCIxSRD8ye7wRg4GR3K32tqZoNyA9L63o6FU/P0nBXqtqk0FYROZPFPHiwr9pFP1xdArQze5J1dk6dvK+NgtpU4p9RMht+JbVSd+kFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UpPvPLyc/bwngCJod7NL6mghxPnku0ripXjlWGzWnpQ=;
 b=NZQQaQyW0WmSwQccJ9OkAZFiPBS9TwUzGfRDfCbUkrluOZz217RFlBHEL1J/fVxBS9j+YcXKvpGvBIBTjMtxEz9EkF1VBw48foX7NhMrW2uvuiF5hAL960/f2PlOJt1Ju5exZ1dEnsVddqeKGzXVMRvgkRMioOaSQwPI1GS7gOBPpH0REGW/v87s8usJgvMiT8Jaj49myhX0xI63p5+f2sbBby/j792x1Tec/iwAHb5ABCrmrMabjyXrU36VEU3iTmOy2dLWG+zAoIgaNvxSlzX5sqg/WPxTVrC7cQw4uiJy3D9uDQSuBBM7gvSbINRxhXgJjEfR1bRfp3bZJ57hcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DM4PR11MB8157.namprd11.prod.outlook.com (2603:10b6:8:187::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.20; Mon, 22 Apr
 2024 12:16:02 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7519.018; Mon, 22 Apr 2024
 12:16:02 +0000
Date: Mon, 22 Apr 2024 14:16:00 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/pf: Clamp maximum execution quantum to 100s
Message-ID: <20240422121600.iiphkb3sb5uhj4uq@intel.com>
References: <20240419123543.270-1-michal.wajdeczko@intel.com>
 <20240419123543.270-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240419123543.270-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: ZR2P278CA0066.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:52::20) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DM4PR11MB8157:EE_
X-MS-Office365-Filtering-Correlation-Id: 376baab0-1d86-4a30-b1f6-08dc62c5f9e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a3ptLzVkVGRDSSt6RkdSWGdUdjF1Z09CNEhpT0FMOU9IcStPYjk2Y0p6VDVD?=
 =?utf-8?B?NkdNUkhhS1BFODFwTVFhOHdmWTd1YkpJbnFTL0hYc2RYN1YwZ0wzd1ZHSHVK?=
 =?utf-8?B?SWhYbDF3TFZHVnNrR05EN29lR1lGOFJLTUI1YjNjdVVLU0tsemsvemJ4QVdM?=
 =?utf-8?B?MGVLYUJYZEcvRExOZjhQWSs2OXhva0RUeitmM1p4bFpObTUwYVF5TUI3NU9o?=
 =?utf-8?B?VEd2UFBZN2p6RUNhWEVCVk1wc08wWUY5OFNJOGNGbkowUnNBblVRa2kyUjlJ?=
 =?utf-8?B?Y1RuQjVIMWNUWVJqQ0FMU0xwWXhWRWJIYlByNDBOZEdqZktnZ0Zka09Nd0Fq?=
 =?utf-8?B?Q25DY0x5Z0ZQTVk5RzNISUI1VDMyZ1JzSElGaFJ3NlJFQWRja0RJcndPZ0Ns?=
 =?utf-8?B?eVBZK1ZETGhnbHRsM2NxVXBmK0VnVytSOTc2djhHVFlMMnh2VkFnakZxQ01K?=
 =?utf-8?B?RzZxYnM5VmlKOUxESThBUFRlT2o1MmtqWmRUYWttR0xkNGY1KzgweWdMbEtS?=
 =?utf-8?B?eS9ZVDVTbG1WVHRaNTQyQlZiQ1pvT09kM0YvL1RIRFVrVmErNGkrcW9BKzgr?=
 =?utf-8?B?Qm9BMnVHNjQ0RWtxSlJUQlpHaTVjcXNJcUZOb3p1alozVnNjWEZxVVBOVGxy?=
 =?utf-8?B?aXF0MGd4UW9MT3l1c29wWXZIOGJyUXF1V2pTcDBybC8vMUg1b2RPWEFiNEJ4?=
 =?utf-8?B?MzdtYmJmYjc4RG1qSURYRFQ5L1FaMVRCVkY2b0NJNmhSNHkxQlZCZ2tuNnNj?=
 =?utf-8?B?NS9xa1JleEd2b1FOVHdRWDlUb3JiVHlGVjJtaW82d2haZHpmRklkS0VycjR6?=
 =?utf-8?B?NDk0Y2crV2VidVpIM2ljRWlEMndEWUNqV1NBblYrR2JaK1lUVjkrbkxsNEtR?=
 =?utf-8?B?c3F2d3VJbHBkNTVFNkZhcGpJK3lpcXNsa2tMaVBsSXNNQXE2TGpCNVpycGxM?=
 =?utf-8?B?eXhSNkx3Z3Zid0NKOWNzOUcrTXNNTHRlUEFTcm9IbzJjaXI1N2lJUVJiWHZC?=
 =?utf-8?B?SjFqQk1jUml5TzY3MkxiajdHdE9pWWUrSWNEbVdxcUdyOWJQMmsyQnFhVHQ2?=
 =?utf-8?B?OGcwN25IZlZITEZGcjRBM2o2KzF0QVFkdnZaTXdxYXBJQkd6NTZsNEZIcXdN?=
 =?utf-8?B?Q2VsTWxJdDdDTGt3SS9wSFduNXhBNnpzVlFxQ2VPRzhUaVZFK01lbE50eHJ0?=
 =?utf-8?B?RisyWVJQN0YyV2xNbWNMUGN5eEVSYXhHdzFxcE9hY0M4NUJnZGs4ajcyakVx?=
 =?utf-8?B?YVRBWGo1VHJIaVR2VEV5Z1ZGR1NObUZkTU14V1VXWUg5MG5tK1N0d2d5dWRj?=
 =?utf-8?B?WFZrclRvelZSUHVOOUZTRmZoZHhqUlQ1cjZhM3lVUVJDSERpTFpPQmN6UENV?=
 =?utf-8?B?YURZRG5wUzBwM3FYbCs3RFBNa1RSeWVtUE9rTmV4SzRKMXFDZTRiNm0zY253?=
 =?utf-8?B?K1NWMkpuRDk4a1d6bW0yUE5mMlE2SmlUb3ZEUk15ZmlKQm1wdHpRSHdXNjcr?=
 =?utf-8?B?RnkvS2p5UUJ5emczUXE4UVR2WW05eGVNWDBKNER4SExBZXk1cjJKQ2VpTURa?=
 =?utf-8?B?STRtYjNnV1Rmc0hZVjRWVGF1enpHRW04c1pHR2tXeno0VDIzTXlvSjNzVFNC?=
 =?utf-8?B?azc1Sk1vZ0JnWjV0clV6eHJLUm9LY3FQQzJHM2VmUEVKWWE5c3NiWGpUY0lV?=
 =?utf-8?B?b1BONnNPb01VUDBSaG5NWHg0cGFFbHp1ZHJNUktTcXBBaE4xNlJ2MHVnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3ZpS09GNUlnT1pxdFpLWlNvd1ZTZU1kMzBUcENUTDFrM0FQd3kyR2pJakdz?=
 =?utf-8?B?czBxWkE3RXgxR2lJdkFQY3kyS1hSYzg3SnJwNVVxSDVoajF0WHhIRDIya0U0?=
 =?utf-8?B?b2FkeUFFc1dBdmcxQzF4emlzY09FNjk3VHpaR2VGTEc4am1RdUdaMkx0TkV5?=
 =?utf-8?B?cTJtaUQrZmFqcGhnNkQvWWgvenM3Y0xSSFdSTzF3dTV6ckdyQW85ZU10Y0xh?=
 =?utf-8?B?MEdLME1PenFJbXJhSjVpckhlRWdkSXZYUU5uM1JaalRzeHRhYVJ1dWx5cWVQ?=
 =?utf-8?B?MFNIMmV2ZHczUktPdFVwbUdleno3WUZYWCt4NEJ0bDUrTUNORE9tclg3UWJ1?=
 =?utf-8?B?R3c1NFkvSmlVSkY3bGN5TjEzbXQ5VVhWSFdpeW0xcCtMT1hJTDhQMFJwR0pq?=
 =?utf-8?B?VXVqeEI2V3BFcU01eGMrc080UndoTlRlVkxRMGRCcHBXbVNEUWZ0aFVPOGR1?=
 =?utf-8?B?MXRpL3p4QjBZc2VmRDFYT2QwWlBYOXVTQWpRaTBCVVJRdnluZlROd0xkOURT?=
 =?utf-8?B?c3VzblV3WFJ6dEg0TCtrWllpc0xmVGtXMFZna043alM0d2dTWm5tdzM5a0xa?=
 =?utf-8?B?T0hjOEZRWDIyeTBZRURYRlp5dEpMc0R1dnpid2FyVmUrbmR2ZVdNNTZKNXlJ?=
 =?utf-8?B?cCtlN2w0YjN5akRROG5aQllFUzJwcmp6alEvUmIweU5vb2ZSR3pWdVlCV1lo?=
 =?utf-8?B?ZmliNmhGcFFKdVp5MDF4bHpVRXJ1aXJpdHdjSHd5d1ZLUDRUNkhlYU5HbUUy?=
 =?utf-8?B?REo3N3RmY25xNzNsWUNkbXNhNGh3bS9SZVVEL25peS9sdEVNZ3RnOUpGWHN4?=
 =?utf-8?B?SldCNWIrRS8wdkt0N1JpNHFZK0pQbGhuVm1KeWJTZDEvNFpFL3hnTUZqUzky?=
 =?utf-8?B?dm5YeHFreHhxeXdneGIyK2ZzQ0RJWmkzODRwdUVaQkw5WWtpNHdsWVE0Ymhn?=
 =?utf-8?B?eU5GK1dqN2lmTEpaT0QwUnloa3kvdFQxeFNnNnh6WThHdVZXbldCTHBGa0pZ?=
 =?utf-8?B?aExTT2FlZlF5RXhqbWd0MmU1MmcrVHdaSG1kQ2VMRTliYmQyY09ZT0p0anBr?=
 =?utf-8?B?ZUNGcWZ6L0c5UnRidFNvcVRBVDNxOUJhNVRCNklrRk5ZL0YrVnREMG1UbVVN?=
 =?utf-8?B?Vy9JWFRmMGlVWXlpUEE4VjlNYWxKNitSc2l5WDNCQnc0ZjJ2TTFxY1hQZUNH?=
 =?utf-8?B?SU1DZE5md2ZjaGJibWFFbVhibDVNVFBwNWtjTzVQOUd3ODl4M0xVNWxxYW1Y?=
 =?utf-8?B?N1hjd1A3SUJ2Yk1sL2hTbVhEWHdpZC9RMHNlVkloajlydThMTElPVE1KUEJD?=
 =?utf-8?B?d2xGcDNUYXpCMDEzaS9NTmVWNVE3QXRHTUxtR0Fta0lneW5ORFllTC9UczZR?=
 =?utf-8?B?K05ScStESnRhNFBacUJlL01BdEJqeG9lckZwRHlRakpvZVhzR0RBNWMweXl5?=
 =?utf-8?B?RXc0aHZmRkVtc3hzVHhIYThOQU9CR0MxK0VRNGQ3dnFkZHhVTGZRV3F3TEJk?=
 =?utf-8?B?MmJhSEMySXB3QTY2Q2VWN29sLzUrQjd4YU9RZlhxditnZjhOTEJ4TXZuME9t?=
 =?utf-8?B?KzlYZW15Y1hCazlCckNxVUNaUHdwTWVlanB2VDAvMm9ZMmRvdGR4RmZrSDRr?=
 =?utf-8?B?endrSktSMTJKZWV4eHdCL2VNUTNoL3RQN1NRbnJUY2RTUy9vSXFvbVFOSEow?=
 =?utf-8?B?THJ4dGVpU0gwbUFYdTg0cWtmcml3YnV5WW1MNU1jS3VWOGRkZ2w3RGJIajNV?=
 =?utf-8?B?UUNMU0dLc2pMYmEzN1hSOUdYRWZhYzhoUDdUWHhDaGg0MXptenlFc1laRlJV?=
 =?utf-8?B?VnVncys4WXQ0QjcxTUY1TCtla0VuNEo1MnpoWi9nKzRpVG16TDFUbHRFRkc3?=
 =?utf-8?B?QVZscXM5ZU1EYWRzT1o0OVIvMzZUaGQwVk56d1JQVWQxb3lWNWZteC9NcVNU?=
 =?utf-8?B?L0xlUVRlUlJRYmQ4NXQzb01LeVdwSUpPSUVrcUdnc09vTEN2M0RhTVRxNGJ4?=
 =?utf-8?B?Um1UMitWRzFrNlZEVTJHSG8wanA1eUJlcVBDUDRvREV1dEtyalV6M0RWY1BJ?=
 =?utf-8?B?dHhCRFFSMzY4MHRrQ3FONVUrWEVIbEdFRWFWUlZBajVMb2JVVFNGWnNQMHhP?=
 =?utf-8?B?MTdrS2xTM1F6UklaZCtmQ1JnSXRJdk9KNHgxQ3VxZFdNYTBXVkp0R0RLKzR1?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 376baab0-1d86-4a30-b1f6-08dc62c5f9e1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 12:16:02.2070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mMsGqUmDd6psyCbMVLiM6OxyfO/dAHHbSMDbic7gJcNFs1w4CMHaCbssWpHrmhOKmCnk1lg46bqbU2f4ya1xrvZxTsjSQ6LG+Ftfs8LI2f8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8157
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2024-kwi-19 14:35:43 +0200]:
> GuC is silently clamping values of the execution quantum and
> preemption timeout KLVs to 100s. Perform explicit clamping on the
> driver side as later there is no way to read back values used by
> the firmware and we shouldn't mislead the user about actual values
> being used when we print them in dmesg or debugfs.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 0f5614877770..82d402030b9e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -187,14 +187,20 @@ static int pf_push_vf_cfg_dbs(struct xe_gt *gt, unsigned int vfid, u32 begin, u3
>  	return pf_push_vf_cfg_klvs(gt, vfid, 2, klvs, ARRAY_SIZE(klvs));
>  }
>  
> -static int pf_push_vf_cfg_exec_quantum(struct xe_gt *gt, unsigned int vfid, u32 exec_quantum)
> +static int pf_push_vf_cfg_exec_quantum(struct xe_gt *gt, unsigned int vfid, u32 *exec_quantum)
>  {
> -	return pf_push_vf_cfg_u32(gt, vfid, GUC_KLV_VF_CFG_EXEC_QUANTUM_KEY, exec_quantum);
> +	/* GuC will silently clamp values exceeding max */
> +	*exec_quantum = min_t(u32, *exec_quantum, GUC_KLV_VF_CFG_EXEC_QUANTUM_MAX_VALUE);
> +
> +	return pf_push_vf_cfg_u32(gt, vfid, GUC_KLV_VF_CFG_EXEC_QUANTUM_KEY, *exec_quantum);
>  }
>  
> -static int pf_push_vf_cfg_preempt_timeout(struct xe_gt *gt, unsigned int vfid, u32 preempt_timeout)
> +static int pf_push_vf_cfg_preempt_timeout(struct xe_gt *gt, unsigned int vfid, u32 *preempt_timeout)
>  {
> -	return pf_push_vf_cfg_u32(gt, vfid, GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_KEY, preempt_timeout);
> +	/* GuC will silently clamp values exceeding max */
> +	*preempt_timeout = min_t(u32, *preempt_timeout, GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_MAX_VALUE);
> +
> +	return pf_push_vf_cfg_u32(gt, vfid, GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_KEY, *preempt_timeout);
>  }
>  
>  static int pf_push_vf_cfg_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
> @@ -1604,7 +1610,7 @@ static int pf_provision_exec_quantum(struct xe_gt *gt, unsigned int vfid,
>  	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
>  	int err;
>  
> -	err = pf_push_vf_cfg_exec_quantum(gt, vfid, exec_quantum);
> +	err = pf_push_vf_cfg_exec_quantum(gt, vfid, &exec_quantum);
>  	if (unlikely(err))
>  		return err;
>  
> @@ -1674,7 +1680,7 @@ static int pf_provision_preempt_timeout(struct xe_gt *gt, unsigned int vfid,
>  	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
>  	int err;
>  
> -	err = pf_push_vf_cfg_preempt_timeout(gt, vfid, preempt_timeout);
> +	err = pf_push_vf_cfg_preempt_timeout(gt, vfid, &preempt_timeout);
>  	if (unlikely(err))
>  		return err;
>  


LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 
