Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA95C02183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 21:50:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1124010E39C;
	Thu, 16 Jan 2025 21:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a/X3LdvT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9017410E39C
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jan 2025 21:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737064253; x=1768600253;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cHcD7WSBQ/koAMJi5WIYpYzInEdzy+6+3SFNyeur/ck=;
 b=a/X3LdvTAvjNm63K6fClbfjxq2n1C8ck34f76i10O5waSg7Ag8X2l0GE
 dv4MJO3ou46ixGO+MSGcJGGqlOdMvBLY8JYip8k5VHyeLxHseJJId/SF0
 zFbGMETsfe6MxRejFC/2hxcNI2/2tAkigsJRwIhBYFMvLWnJGLOXr7gwn
 97BUePsq0ekr80deC0o5noGbRAOp9dsI14synZC3PtV6+TOXWsGiajcHe
 MbhWnzR5T+KawsbWKAzzn3mj6GnGPJ0pPEiKCott2DsIQ1odB7GTP5ijC
 8e8cVrXJLcGC1i4x5HOBLTauaOMERRXSreYkLHAXr9q361B7A2XQXipwc g==;
X-CSE-ConnectionGUID: Jp1mv8iiQEKboixC3taiBA==
X-CSE-MsgGUID: yxIVbguPQPiA9cF4z2ieLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="55022652"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="55022652"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 13:50:52 -0800
X-CSE-ConnectionGUID: ecdvFfTcT46YZVNRK0dCLQ==
X-CSE-MsgGUID: BJeNbr9gTBS3nOoZ3ltawQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="106087908"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2025 13:50:52 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 16 Jan 2025 13:50:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 16 Jan 2025 13:50:51 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 16 Jan 2025 13:50:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vv06FbeI9mAw1+C5uh84s4y4FnZYoKzCH+iRMbIGpEfZYtXR4gQecYhlEXOa7i2A2ZMNnQJD+7JoODL7/hHRmAFchGtmZekJGfW1X3pTWVOkMzgP+0JgNTNZcaPZwyMhfEQSID8QGoBV60U6A/wsnro58tAU4F2W/ebwV/DLOPkc4VyOj4JFStxUdKRtziVuH9FH0qo91y6Ioy+TCg/qo0isGHSxX1vutqwNPX3+1F2crou95jsTWWcHi6W+Zi4/c+ZazEWXMPLpvubCkpGOcN8Mr8kOUhfOMpanb3xGEIAbSVN2WIZQvwghtxiI+Vof9rx1X83IzdE3LN8SIVTYBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4hU316/N/IxoJlITwlsuKbOenLtk1pNgbWyrcRzDK0=;
 b=DZjPsyUkeFKDQGFg46t8CUvr7WZHo4EoZXFxfBueVw+yYoB00xP4SVmhK7Tx3uF8c2N8Lw7EbaG9U6bGNaX9WS9e2Px+NHm6gUNm+rmfvvlcVCSJykR9JaOiajFWkKlrZ+HP8xeIWV4Bm5ulUqzXEswoqgfRVN60o9/u4WeeEH9evV2WvdyuKKWRGKYGTo0t3A8rp5aeISkaFnSis01S0Zh5LTOXS3w02+JD3UASpKFD+3xe15+uNtn9WT5h4rHKfzqR9chBpEwqG4SuJnqq3FhDRAIJx5xXTwtCSckvOeBsQ4KJ3C+lKK9Dd0dSEaKgZsYFWZN5FTYt3KK0XKkNLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7444.namprd11.prod.outlook.com (2603:10b6:8:146::11)
 by DM4PR11MB8157.namprd11.prod.outlook.com (2603:10b6:8:187::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 21:50:48 +0000
Received: from DS0PR11MB7444.namprd11.prod.outlook.com
 ([fe80::fea8:e53a:7a96:7fe3]) by DS0PR11MB7444.namprd11.prod.outlook.com
 ([fe80::fea8:e53a:7a96:7fe3%3]) with mapi id 15.20.8335.011; Thu, 16 Jan 2025
 21:50:48 +0000
Date: Thu, 16 Jan 2025 15:50:38 -0600
From: "Olson, Matthew" <matthew.olson@intel.com>
To: Harish Chegondi <harish.chegondi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <ashutosh.dixit@intel.com>,
 <james.ausmus@intel.com>, <felix.j.degrood@intel.com>,
 <matias.a.cabral@intel.com>, <joshua.santosh.ranjan@intel.com>,
 <shubham.kumar@intel.com>, <matthew.d.roper@intel.com>,
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v8 0/7] Add support for EU stall sampling
Message-ID: <Z4l_LkmTYPaXjzZ7@bolson-desk>
References: <cover.1736970203.git.harish.chegondi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1736970203.git.harish.chegondi@intel.com>
X-ClientProxiedBy: SN6PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:805:de::22) To DS0PR11MB7444.namprd11.prod.outlook.com
 (2603:10b6:8:146::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7444:EE_|DM4PR11MB8157:EE_
X-MS-Office365-Filtering-Correlation-Id: ae907e5d-3164-4926-f73f-08dd3677d600
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5JHvh37AWWm32ykVswOOdteRnJQBLEhJK+/4A/q0WTDsI1eU696DQ675kC6z?=
 =?us-ascii?Q?6CyKEa+lGJX0s/gK/c0C2C7gesUKKPYlx0ydTp/XpeQ8EDT1YOmhxAORiZkA?=
 =?us-ascii?Q?j6C44LaGB9kfg6ofXxwvvuhyOQhiIpJATIE9UZjgK//ELllMqc41Np5qwnUY?=
 =?us-ascii?Q?ZizNzpx/LNqkfU7C+VMwI2opzFN8EIFKhaexPPWOjPjujnWb9e1IZrqYf2Xz?=
 =?us-ascii?Q?vQripOaF8YfZNIkFlV9H6veJvqnK4ovsrODp4zPYuAJzbvrjydmhqfPVhKjU?=
 =?us-ascii?Q?rwhmtvOEn7cX449Y0l7LQ/7tpVxYlsqvCFPC/VxfatO6jtcvxBipsKlOh6QM?=
 =?us-ascii?Q?s/jtyLvdDSDhVZt82Y912HK2eKvCx8RpZWXHlKtCUmJT4oixCG0l/1pRB0lf?=
 =?us-ascii?Q?aiuaRVKqd1mp+Es07exuVArwMWjqH7WAWfEXTSwXPIgytr1so0KhipboGOZ4?=
 =?us-ascii?Q?w5eZcdB9LJC5aC9lZwM9afzjoZM9Z69yOBF9lrbUtB0L0b6KktDgUxEkZt2g?=
 =?us-ascii?Q?Wv4AkvgjT1cYth4k0S0xHM3Z3MzqquU9y21C5dzNz6hczVInxbCTXd1i/Tb/?=
 =?us-ascii?Q?wBT2wZpXlChVU/u4uc9w2/9XH7Fy4PWa15wX7RCk36OPtigJVCMwY3FirK0P?=
 =?us-ascii?Q?RwSdQ8gHLCkM/8x6RVVsNeQoUJAHoO1cFjBFWAvs0TrEeZKMHFwOSxIo8g9p?=
 =?us-ascii?Q?WEmgMGGqkS+BkHI5d0uPEMEY2mQWEJHguLY29tHaE+E6rKjtpfhmk4dAVag7?=
 =?us-ascii?Q?WaMpeQkO6+6oypKG50C1hD5UazdOxMz1wNVaEdvIHauml1jwnJvdSyt9RlWq?=
 =?us-ascii?Q?h6+RvwrSxpsVuXNsweYBL407PXjz5TCjYvD0ceWt9ws0rmW0ox+gViGWvJF1?=
 =?us-ascii?Q?OwiSq/N/onfPZv84dU9zUJ84aZ8iNIBEH3m3s0K+C66ObttoQpLWVj1kBD1+?=
 =?us-ascii?Q?3WXPSCJn7opc+7N2RGCGUzeIMnsQH3ZdiFOLcfRqG2tWGanQU6qfk0KxbgUe?=
 =?us-ascii?Q?Kc04dTBN/+piAv+JXe9E2SbdkivtURhb4horlG6t7XIQSUHNDL/Hs9ppDIM/?=
 =?us-ascii?Q?DmtBIpHp3wWYv/tL1zc/SRyJoUKn74auY8S5FJAVH4HVSPQI/KC1cmttpN/1?=
 =?us-ascii?Q?NumOn0n1IRv3VbcByDfXFc+s/cDHsH1SS5D1PdkVr5AAhiuLPEY4jk8wIJ9h?=
 =?us-ascii?Q?6etmUgMgjI0S//PkKg9rbR1wK5V17N6touGxEhL56Xs6dqqZYIqYNat+Uzju?=
 =?us-ascii?Q?BzM99D+hyI20ICEKyHyukbCulq/Q+oEptqv9dLzrmaAvJ4b9SHoOXBSn70zM?=
 =?us-ascii?Q?H43f5UN9G/eIFrE0dqTfS3oqW1S6yBsMOJcD4NpSGefb1Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P1DrRNWfK11HO/l6oGXI4DwLdQiMqZEjKpYR6wG6MfV18Pn9G2JvHKCjJtVI?=
 =?us-ascii?Q?Usk5fVoRMysH1GnkljAjdO9dZ+ZGlmVYnLQiUvz4RV2WBGRqwQMddAho2X4c?=
 =?us-ascii?Q?9MjQL13UZN8NwYm58RMoOh3eHvP9FqVZfj14ekSml3c5/vj5lRmGIzMnPQvY?=
 =?us-ascii?Q?7UM3FczHKcxorn01JGA22tNdLHQQyK3TI2lH4bmqWGKxHYewQkWoaxQHaz4Y?=
 =?us-ascii?Q?sl9V/mtKzwaVlxG0BCt8G/N869ZR0Q/Z5AY/O1ycxHJZBJHznMBIO0peyFuK?=
 =?us-ascii?Q?ovMCxQUFGmJhg89zpezzXwP6OwyEWvDocc/8wylDANmDdo/WdQRcUs5TRsxL?=
 =?us-ascii?Q?NczhUTNwxcM0SRdeUvFbsHOI9ahoEdxJeT/pdXH1+qzcaaJU/+agwaxlI+uj?=
 =?us-ascii?Q?EHbNVNccSO1rxQJIwlkf12v1LNbnWdLaDPz3J5+jiAwS//FtBFgL5MTypzGf?=
 =?us-ascii?Q?WYf4AnXng8W6xnf+wlulMRKGLAidOfIefDS7rwW+jy1zBtNkiHpBw7DAe+zN?=
 =?us-ascii?Q?yN8R932xRN/trcSe1zbQLaVAc0gAKJJW9T2dNTPuxrtpo0xdt3d+a38w98wR?=
 =?us-ascii?Q?esmjHluu2Ay/VrM7ErWf9hd9sL2TOSPvk9Po+vcsKwtuKznP60v6oONDz8Yv?=
 =?us-ascii?Q?BC7/6O67zizgWlVmWzVvIZ0W1M/gG/oVPupCgtE/1czXOAjSGTjKLl9BzFXR?=
 =?us-ascii?Q?5PfXdF8/Ei8n6OlPBp1NS8fvYw/rIXbmZlPx5/bwj3F0i5jn/OaU2NZnxfL7?=
 =?us-ascii?Q?CgB+NmsFa80d+2Io4uxhcpn0IKAmtiS5+5X+iImfnJtZbyVRbWdNa1rYeeUn?=
 =?us-ascii?Q?X4+SdcfUyAMqwASROcWvD/D1hyUnf1cikYO+9KfDhX6nnsDwlfbu8aQHLKGl?=
 =?us-ascii?Q?DZvJma5r3jPbxxPWna0R06w7OCqOKpM2v9XiIG6b0kNxP2ds8nC/aHrsMf/2?=
 =?us-ascii?Q?O8rPlOeehVYT+ptNZAmzlLR7Qm3EV8UXsm0xu28aToxR0oRLG+g+d4VOY5pd?=
 =?us-ascii?Q?cSQrY1lvgQiSQyn+brcY8hYqTf8DxPZfb5QZVgasknhOCI9Fw2irhFkYHJ+3?=
 =?us-ascii?Q?8BLE4cZ1Y28GuZih5XxRZQQhWp6TdkvB4DozJgbcJ9+X5P7q2Pr5zD/s/a4k?=
 =?us-ascii?Q?MJdcZP6t+E+Z7DVJKK+NwVTT/1jl/V7vFOECd87s8Im7We5hIwV7WNMbtzmN?=
 =?us-ascii?Q?EQLRKB35FhVKKFQU/SnMRzF9XR8RZDkb/5HluZjQfdi8y8KMNYcJw5SaeeQs?=
 =?us-ascii?Q?+zn0ljmoZjmSvQ1h/P76LwnUPrwhXAFxEjhw0Z0jR9isBkX1vW5m+pwNF4q3?=
 =?us-ascii?Q?uV6r0/I4Yzrp6TXHQuS04sXpWy6uNXngGPKPCpuNFwvDTrXgLr94OfJeRyc6?=
 =?us-ascii?Q?GvjF51HmlQRvZCLhWeB2/tHme/9BLBqsn4L8Kc8GZjs/9S9GU4JTkLc6tNPA?=
 =?us-ascii?Q?QY/KyBewqOchOk6jKrZxBS2oBiNwOOjyj0L2RB1EVX7Nrpdty9TjRj4mofR7?=
 =?us-ascii?Q?/T3TcFKoENje7zi4zqV9y3VfFqxlHHphmGNifBy/Ndt5ZmIKFsLaGNXzMbuH?=
 =?us-ascii?Q?FrzW74zxVfVbBXisHMYsDq6QUjaBITakcMqoslEdojw8JPdiyXXAmuxjx3/u?=
 =?us-ascii?Q?vQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae907e5d-3164-4926-f73f-08dd3677d600
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 21:50:47.9303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A2zf5vaHErCHBBcBlHMAwH/yf4Toj/Opm4CDSua+CsVTHviQ3ZARP3o7nXq7ynlWGChAMi7IOwyogxYlQE3rhg==
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

On Wed, Jan 15, 2025 at 12:02:06PM -0800, Harish Chegondi wrote:
> The following patch series add support for EU stall sampling,
> a new hardware feature first added in PVC and is being supported
> in XE2 and later architecture GPUs. This feature would enable
> capturing of EU stall data which include the IP address of the
> instruction stalled and various stall reason counts.
> 
> Support for this feature is being added into Mesa:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30142
> 
> New IGT tests for EU stall sampling are being added:
> https://patchwork.freedesktop.org/series/143030/
> 
> This patch series has undergone basic testing with the new IGT tests.

Our profiler, iaprof, also consumes EU stalls using this patch series and
generates AI flamegraphs using them. I've been testing mostly with v7 of this
patch series since it came out, and have had no issues with it. The stalls are
reasonable (both the reasons and the GPU address that they point to), and we've
been able to poll them well enough to run our profiler in the background.

I suspect the following was already discussed for one of the earlier versions of
this series, but is it possible to have even lower sampling rates than what are
currently provided? We're already selecting the slowest sampling rate (the last
in the array), but CPU usage is too high for our liking, and we're still getting
tens of millions of samples per minute.

> 
> Thank You.

No, thank *you!*

Reviewed-by: Ben Olson <matthew.olson@intel.com>

> 
> v8: a. Used div_u64() instead of / to fix 32-bit build issue.
>     b. Changed copyright year in new files to 2025.
>     c. Renamed struct drm_xe_eu_stall_data_pvc to struct xe_eu_stall_data_pvc
>     d. Renamed struct drm_xe_eu_stall_data_xe2 to struct xe_eu_stall_data_xe2
> 
> v7: a. Renamed input property DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT
>        to DRM_XE_EU_STALL_PROP_WAIT_NUM_REPORTS to be consistent with
>        OA. Renamed the corresponding internal variables.
>     b. Fixed some commit messages based on review feedback.
>     c. Changed sampling_rates from a pointer to flexible array.
> 
> v6: a. Changed the uAPI input to accept sampling rate in GPU cycles
>        instead of sampling rate multiplier.
>     b. Fix buffer wrap around over write bug (Matt Olson).
>     c. Include EU stall sampling rates information and per XeCore buffer size in the query information.
> 
> v5: Addressed review feedback from v4 including
>     a. Removed DRM_XE_EU_STALL_PROP_POLL_PERIOD from the uAPI (Ashutosh)
>     b. Separated the patches for Xe_HPC and Xe2 (Matt R)
>     c. Moved read() returning -EIO into a separate patch
>     d. Removed spinlocks around set_bit() and clear_bit() (Matt R)
>     e. Renamed several variables, structures and enums (Ashutosh and
> Matt R)
>     f. Addressed other review feedback.
> v4: Addressed review feedback from v3 including
>     a. Split the patch into multiple patches (Matt R)
>     b. Added a new device query to get EU stall info (Ashutosh)
>     c. Renamed all Dss to xecore (Matt R)
>     d. Removed buffer size and disable at open input properties. (Matt R)
>     e. Removed the "_SHIFT" macros (Matt R)
>     f. Allocate the EU stall buffer only on system memory.
>     g. Changed the work arounds to OOB (Matt R)
>     h. Other review feedback.
> v3: a. Removed data header and changed read() to return -EIO when data is dropped by the HW.
>     b. Added a new DRM_XE_OBSERVATION_IOCTL_INFO to query EU stall data record info
>     c. Added struct drm_xe_eu_stall_data_pvc and struct drm_xe_eu_stall_data_xe2
>        to xe_drm.h. These declarations would help user space to parse the
>        EU stall data
>     d. Addressed other review comments from v2
> v2: Rename xe perf layer as xe observation layer (Ashutosh)
> 
> Cc: Felix Degrood <felix.j.degrood@intel.com>
> Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> 
> Harish Chegondi (7):
>   drm/xe/topology: Add a function to find the index of the last enabled
>     DSS in a mask
>   drm/xe/uapi: Introduce API for EU stall sampling
>   drm/xe/eustall: Implement EU stall sampling APIs for Xe_HPC
>   drm/xe/eustall: Return -EIO error from read() if HW drops data
>   drm/xe/eustall: Add EU stall sampling support for Xe2
>   drm/xe/uapi: Add a device query to get EU stall sampling information
>   drm/xe/eustall: Add workaround 22016596838 which applies to PVC.
> 
>  drivers/gpu/drm/xe/Makefile                |    1 +
>  drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h |   29 +
>  drivers/gpu/drm/xe/xe_eu_stall.c           | 1103 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_eu_stall.h           |   61 ++
>  drivers/gpu/drm/xe/xe_gt.c                 |    6 +
>  drivers/gpu/drm/xe/xe_gt_topology.h        |   13 +
>  drivers/gpu/drm/xe/xe_gt_types.h           |    3 +
>  drivers/gpu/drm/xe/xe_observation.c        |   14 +
>  drivers/gpu/drm/xe/xe_query.c              |   38 +
>  drivers/gpu/drm/xe/xe_trace.h              |   33 +
>  drivers/gpu/drm/xe/xe_wa_oob.rules         |    1 +
>  include/uapi/drm/xe_drm.h                  |   74 ++
>  12 files changed, 1376 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_eu_stall_regs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.c
>  create mode 100644 drivers/gpu/drm/xe/xe_eu_stall.h
> 
> -- 
> 2.47.1
> 
