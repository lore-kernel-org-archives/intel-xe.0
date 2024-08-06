Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81AB1C49EA1
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 21:32:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0546610E0AE;
	Tue,  6 Aug 2024 21:32:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KZnQBZWZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35D810E0AE
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Aug 2024 21:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722979955; x=1754515955;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4gfwibx+T3X1NtiduzAkE/JI0yEtWuuiTSTWsgaxHNk=;
 b=KZnQBZWZ2aPW97VlMZ8/vYbzBhyOu2tHwaL2lIJoVjs+Z4MnRDxkJMrD
 nPlTK0qZ7GpXVlvfmsaKeEDiFBtnZaBtCvAzlgCCblohet4ig1uKd0pzY
 VnHXwpFuG23LAw0RN5yJI4/XXtei6NqLpa0NjV3FMHSwJqGEwfoDKFg2Z
 yC1zf5Y2MxnTEvkmD1Q8Ue2v5CKqVROPWvWpsobEkpj+MGRXTid6B6BjB
 MqfoCseJoJPJHpXFk8oBpMV8/nNY8eFXAzN7xhHIZXeXngMio+hkfJ3Bp
 DV3gz25dBQNBBn4RgdfCw+OENfPuHv8nrkoytIj1OHiQu4/zOs83btwIy Q==;
X-CSE-ConnectionGUID: MLKASZZdTYOU54EK01HU9Q==
X-CSE-MsgGUID: to5+3dl0TPSGiEFqh6wD0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="20693165"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="20693165"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 14:32:34 -0700
X-CSE-ConnectionGUID: py0TmbKKSCa+I4/zcCL3Og==
X-CSE-MsgGUID: Jyj2zBiaTFem8u777fGrBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="87308119"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Aug 2024 14:32:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 6 Aug 2024 14:32:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 6 Aug 2024 14:32:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 6 Aug 2024 14:32:33 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 6 Aug 2024 14:32:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lD37Wz3ZHlgaeGlHHPwoEi8IYNL+B3dvCO2S9GScX7IzSmX+N6lfCed3+3zq+Z5z3RllwIpjEwuKRuaFz63WG5jGwUGDEWRylZeyjbsyuYj5bWuw9VT4bqLmHP3VvEfUOxj1DhzBwbMyEV/Kx9oSVyzPA8IJzyHca8e56L/pCK9/997buX1X0NHCULAMApmSBqWOzpqtOUYfSsR2dcBVyg1HP9chGB7JGBZIR4gIufeDSApbX0EZLG5tPKahCqkhNB/q0wQqenelW7XZSmJrKMviKsxS3d/ayyUkZ5HhtyfVRbWPjstIiVXxLCLCeKc9LAiWZyOBcPAjGST4VT3hPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGF7Ygv/MgbYFBZgdNMze1LeiZL4nN0X9DJU4+3H+fM=;
 b=xx+CK3faujI83yjzNAMl3fD23QM51mvDviHtXR12AzI4+DGgSnDwXZH2NhQHtHUFNEW9nIowTbh807f29/DaoPmxOJFeJaRL5FS4K6LjyRX8agnhj54KhiObtgex8wGOIEvyNtQTf3cGHTTernBanT0nk9Jb0ZzFk4YUFFRI+cQFz7uqhOk+3VPqEIOEeUfZRDOe6m0PD3bugswZtaN1c31FiBARbuVUqqvqHS2u3kuc4sGZqqXxaiKdop+C7z9WrhENMA5qH17buU42wCDMt8TcpjCm3khiPfGlu9TG0CbQKxESO9k6guHuaUs1lY7WrAU/EPCwiNyoZnR7yJwoSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB6562.namprd11.prod.outlook.com (2603:10b6:510:1c1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.24; Tue, 6 Aug
 2024 21:32:21 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 21:32:21 +0000
Date: Tue, 6 Aug 2024 14:32:18 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Shekhar Chauhan <shekhar.chauhan@intel.com>
Subject: Re: =?utf-8?B?4pyXIENJLkJBVA==?= =?utf-8?Q?=3A?= failure for
 drm/xe/xe2: Add performance turning changes
Message-ID: <20240806213218.GC5091@mdroper-desk1.amr.corp.intel.com>
References: <20240805053710.877119-1-shekhar.chauhan@intel.com>
 <172283888290.539585.18293770757677970832@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172283888290.539585.18293770757677970832@2413ebb6fbb6>
X-ClientProxiedBy: BYAPR06CA0065.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::42) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB6562:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ffe2784-9c14-4a17-febc-08dcb65f40f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P5rrfzPxDRwxkMPQEfk4gydqRNsjLn+uZpU7n9rRJdyThx3LJ9DE1fLcSpK2?=
 =?us-ascii?Q?1+ZaPb+6gnIF2KO3jPcXmwR2j5XXQZYxlMEB71A4HghvBxHVEyQ88OU/qw2F?=
 =?us-ascii?Q?lEL7CraRPP5fQo5xqOp67r+tpMTKLshSYa9jGgZTOeksZ2soAUfhNUo8Rtcx?=
 =?us-ascii?Q?+Dwzteyte2LSIefgSxOGRj/UQgsXFL2fAv7P+DdX6um30ONkYLCOH/HaSNnY?=
 =?us-ascii?Q?WGO4Bbqt/9lyGp98OBhPSALAW0YljHXKSQgop1bdWZrD5czi0SvFU4iW/eyd?=
 =?us-ascii?Q?ZJSSflaLHMKaUoFDMD5FC1blQBJPyWt5XRLG39S1Erkzh0hOquURdHzTMozP?=
 =?us-ascii?Q?agN+Z6BwA8p55y3m0uBsd3/63Mh6o+RnLIl4pSnnJUwzxWxhlDDFZvkWrWDy?=
 =?us-ascii?Q?0VFrIve3y4kyoEtce5n3x1vWcyL6g4Vfwv1Rky7nx8hux3LMFNJHfRCPpymD?=
 =?us-ascii?Q?QZGqQ1on6JTFxbJXtaH9IGVkqXhTKN/4zrt2nl1Paea/Ntmixs9fuD/R3kFd?=
 =?us-ascii?Q?zH8N0IPli24O4a/j4/LsB1AcB7vdtWUKKYG+i9gLAmpAC2KmAN2tlgJbZwnd?=
 =?us-ascii?Q?FQxq3o1JXmUu4w0HuQS1FhiO2/obuSAFJRUQPZai4H0y+Df88tt7IC4llSPn?=
 =?us-ascii?Q?kAN+kEl2ya1cpg5msvVTKduABEMQUUsMJ5Rxt2sYzfj3Zivf3s1s2wkWY3PZ?=
 =?us-ascii?Q?0SilHTqCIHgh9+D6M7ZMWbiGilFfYwmpluv6vnzNa5DvIZde95Q+oqxiN+67?=
 =?us-ascii?Q?swplOrAdLPvm6cJ7pKk+EtGewQlK2viIK3B7ybtnKkFcf8chOnDEfhDQQk/+?=
 =?us-ascii?Q?R9P5X07R0/2EpXsm49QYhUfzrGZ4fHiBfC/TOndyROcoeXjJha97waPFTPzV?=
 =?us-ascii?Q?5MocKryp4pEPE+hEx76FN82BGtBG9mFKLPwXhFJ5e9IkOFDRqyeP0FXXe4Y0?=
 =?us-ascii?Q?n+OqSllPEDMb/knHFvBB3/2LarJEEvf4r/zSRHcAc7p1VtG4v9SK0rbcQPo4?=
 =?us-ascii?Q?S6xcmeEuZnsjdgVHlAvO33RNAOXVi2VvEBkdpArjVt4VqMGR9jJ4+CGtuSOq?=
 =?us-ascii?Q?WZ1rrP3oMC56THQY1j5PndSJTIkGOKRvyBxF+BV9QYCzljRcmacw2JToVigO?=
 =?us-ascii?Q?4mCgjtkqXrMUISJguboHZnvOpKS28kf/dHPXGYeIPKg6PTp/A6mA1OUUYiWs?=
 =?us-ascii?Q?RgeJlWGgV5W/p/3PsNQPJr0kFq5GllHBLO63rENcNM1AievsiecNTzU72ETg?=
 =?us-ascii?Q?IFtdVh7Z1ac0RfuhmsM6rfUgCXR9vgeQeD2xvWbaQJy0XZXVkPeyAvw66utB?=
 =?us-ascii?Q?+yc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HN84D1mI9xHDc6vjknZIQ4CeuS4oJVNhcteKruYW20YhjyH70nqDTEXed1kD?=
 =?us-ascii?Q?nEgGXvPc4cXtcHPDBsH8pPSrfknwfPU5UiGG8mY96XXkQTzwvbHcSTkPdvpl?=
 =?us-ascii?Q?CQBQ4G5Us3OLorEtoJIJan+RPDfCfv/+lVEunTpj9hhPlVC5utp5Phuk8KCr?=
 =?us-ascii?Q?FCuUezdCBaZlT2luYUrMoxS1Q+Fqa/MKu7h2egnRhiAQU/b8f4M5WS4UNEFw?=
 =?us-ascii?Q?dBkQsyC+WfXDz/giYPhv+ue3iPLjc9lUecxxcJrnDeEBiQ2pEA5tfGKHU9Hf?=
 =?us-ascii?Q?1kI+Z2n9VLJD/t/55bDrJzJPhLu3kWfWSWkVQZ12PEBri8AkBEHj5Dd3HU0k?=
 =?us-ascii?Q?d5IECiHrq5GW0nOFF5T0aRPoMcYSdxst49PIK6/3hPBlcqyXVitUlcdfAqzp?=
 =?us-ascii?Q?hhurnaQOMxoKVqjuzQBGK3NiLqZb+fnsiNrE+klGiETN00PpuYggXEV7Xxsc?=
 =?us-ascii?Q?BpYE0hz7ULQbw6/ul/MFEsIolpw7o+/TB3nREadjFJrccqU3EZa5x+Jcnsrs?=
 =?us-ascii?Q?YspY7s/mD1s6+DiM2iZywvcjzhWOcnneO6KXKnB5QH7N7VCWLJ50bWlJw6V9?=
 =?us-ascii?Q?QAPZHA4e6R7KKghf7WU3g6gYJMluxWln4YO7h3808GFeIJf73ivzqGh56FB/?=
 =?us-ascii?Q?I2cNuKrvXCC/ttbNI0ihhTmbBQbMSM1eJwvDRKethPeZITdDydBunYVvxKT1?=
 =?us-ascii?Q?PrH1hVGRJu7IVeQ05DeyNE3ci//Zd0KNLAshTyx6X1hhqqPB+FYnoIpf5HhM?=
 =?us-ascii?Q?cE/0cEjKIp8JlYAzp78X0lsfqnYkQ/t9I74dQfwv9vHdV1/696qpRrxfs07u?=
 =?us-ascii?Q?vOE7/tmKeHK9+AKZQ8UJTx/WvkeUDCsO/q/jH+Yn8Lwk+8HpmLKiZW9tmj5g?=
 =?us-ascii?Q?2/D0oItoptGXu+S6J00w4gRoVT+tICCAqu0aYE4W2vg8tbyCq52AOcLh0k/t?=
 =?us-ascii?Q?oDNOExX0798bMLnJfGxEcKH/i/oKMxlJDW4jY0T6638DkQtIAK9mE0m9zddJ?=
 =?us-ascii?Q?dbvZMYw+Aa0v8+yZeleH6o7VjN/Do338N4/0XE/945Uv83+zAchWZCKL0sDm?=
 =?us-ascii?Q?44gJeTJqtQBb+MTompVBzhHu0Cv3bl6yTQ7eZCkTqWmOT9MdQoj0Oze4fGh2?=
 =?us-ascii?Q?WtW3Thr1b0TZAoWod39D1o1ekwYP/NN38Oe+tr82U6u8Zhc3iTwwXKV7wB0B?=
 =?us-ascii?Q?xVw/n5JzvjRAH6rwuR/aH0kkYJ6bX4f5zJtSbOlEyX9UbIInYfmXnAc5ElgK?=
 =?us-ascii?Q?4RjX8VK4yVQ8nYN7RXN6QI+GC4F/FxgV+1t9nWJSKyg/JM2USRNgFQ13nwJj?=
 =?us-ascii?Q?CKtXXoqx8IwAm86ILWISe1VT9ozDiS6OvGMbt+zZCPUEa8oAbgrkwmV+1Iqd?=
 =?us-ascii?Q?wYTxcGiyQ7zKlUZOza7Gj7zVjYo8Ds1ACQ/gflaUFTQl380nTMin54pxNsD9?=
 =?us-ascii?Q?vCeNiDplLTrVDWG1DkdjyuISdqdKyqc1RIRr4H0XkMhihUx3fse/AH68s5ev?=
 =?us-ascii?Q?drKEmxdsRJOfVEcGPYzrx8kNsm1RlRtzNRiBDN5S7jIkmlcoOdJi4ZzxBRKr?=
 =?us-ascii?Q?8AFsegP7cXdH9R69YPAnIQEr7pSbs5oLNtcljimCIzbe6T+TqIFCKkpxKeQk?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ffe2784-9c14-4a17-febc-08dcb65f40f9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 21:32:20.9994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p0JrYJt9m+rvhM953DQFfZvJjftYDnph5mBHL4nxOjFlqZJ8l7/SvVlw1V3119UR3SpOisKWZXqHNKUor0GEu78ex/CBUl4c5fWGhfkEy3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6562
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

On Mon, Aug 05, 2024 at 06:21:22AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/xe2: Add performance turning changes
> URL   : https://patchwork.freedesktop.org/series/136873/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71_BAT -> xe-pw-136873v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-136873v1_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-136873v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (7 -> 7)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-136873v1_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_sysfs_scheduler@timeslice_duration_us-invalid@vecs:
>     - bat-bmg-1:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71/bat-bmg-1/igt@xe_sysfs_scheduler@timeslice_duration_us-invalid@vecs.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/bat-bmg-1/igt@xe_sysfs_scheduler@timeslice_duration_us-invalid@vecs.html

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/877

Not related to this patch.


Matt

> 
>   
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71 -> xe-pw-136873v1
> 
>   IGT_7954: a22f1dab2c2604f9678e4b27ba40bee7dcce9dfd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1711-0b8d955bfdcf0864a764a125ab13bc0fd81f3b71: 0b8d955bfdcf0864a764a125ab13bc0fd81f3b71
>   xe-pw-136873v1: 136873v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136873v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
