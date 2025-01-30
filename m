Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B90C0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 23:01:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2169A10E029;
	Thu, 30 Jan 2025 23:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H6Vhrb0X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F8910E029
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 23:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738278109; x=1769814109;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GdW0tbVzmeT/VdrmpxsZHwp8oJ2OC/dQyt/7YunUhZA=;
 b=H6Vhrb0XXMHYXsO6dvL9gAlYLppka71TZvkHM9c8MpVTrnRa63sDy9qi
 2N1x5pR9XzxFpdDJZkmvptWO1FqlDEYJ3GnLdLJUTfxq5D0i4FhVfLKoN
 PC5UvRqHhNjyWscUye2hUIu5TlsPE7ulCFN2qb9xloKpO57KVc90Vfrv2
 +z7tbzE1ql7QGTwJnWbXZjCQDgLNzXmDWdnVlajV4Oak12asO9JFvDACY
 dw6Tp8C+6nI2hjMxVMUl++kS2CRCol+0QQP7gpuNRrAffcgdFU+mGZuke
 eNWjRylQwSha35SmetzEXnIreMherJEC6+lP/5lIYnXVcZNn5elhQ/h3r Q==;
X-CSE-ConnectionGUID: JOx/+aXmRw6KzWyO9PnHSw==
X-CSE-MsgGUID: nsmkIaY4REyuar8hOPggkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="39009074"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="39009074"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 15:01:48 -0800
X-CSE-ConnectionGUID: h1YUNt8dT6O3Xl/fq+X/Dw==
X-CSE-MsgGUID: POPuvtc7TfSJA4gVd+8JRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="114456637"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 15:01:48 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 15:01:46 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 15:01:46 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 15:01:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hm4BCU2lVd4G/J93KGbGc4fblyL8W3lZJPa5dtIwXkfrqmk3JUyqZ77oyEPTouiomEKA6uDYuZLbqRBswLL1sadCKJsKAyCiRwq3hKn6G56iSy90vbP6Yu854HLEw5up5wEFZ6eTEX8psOAUWOClLQ7dArd2LwRc/M66kxqR2Qo/oq4rfewqD3/Mjda0hrhYMTukl/FWYTcONefEqQm2S3iuprEzaF3BMdop429HO2gXh4uCqG3VincpjzmWr1T32xfBFM0NuI4FxpAQSa+cvjA3ca16pl83vSAdb0I5DWBv/KR/E+/ysuIW0gC5BGBV79zssJDVzSswu0Qg+ATdAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9LETFztU9RYGrjGS2mLrO/oLBSFt/rHzvQo1KuMyYXE=;
 b=MY2N5ajBp5auKAJlqNvZebJowW9wLs1aR/cTAGkTQq5MZcdPuLxjdHwYOBNGZ2xiDM+X5PgrgSKub6x78HW7c89AxROu1w2KQzSBM3CGRbNSovWA62VwFOnp9npnC2T2ZyhfD6XtfXJUHPT6XBsFZqdNhP4NccYb6d+32yexJNaDvwrA7aROg78PTOX795IsSjhpFrT9o5b26Uqf/4dYAkD+2QvL6rql3h9PemR3PimuZQRodZkvg4zebI2GNTv2Eh6id4X2qMF5N/MKveTvMnNASiUcEQUQaLCGafIkHkx9tpOsGkBeCdBvT7oQ7gDLaUBbW6dsv8/1U9tbME3npQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 23:00:30 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 23:00:30 +0000
Date: Thu, 30 Jan 2025 17:00:24 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v4 1/8] drm/xe: Add per-engine-class activity support
Message-ID: <sqh3gymb5eummyrbcpkdxc63ehcb6bqlwcrbm5ge6eiwfqqbpk@zhfz4hidxob3>
References: <20250129101653.1976699-1-riana.tauro@intel.com>
 <20250129101653.1976699-2-riana.tauro@intel.com>
 <Z5rHtFUIbLNRfBfk@orsosgc001> <Z5rlgedsHPm6lhSw@intel.com>
 <d2bb059f-61a3-4e5c-bd84-b8a746a10f87@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d2bb059f-61a3-4e5c-bd84-b8a746a10f87@intel.com>
X-ClientProxiedBy: MW4P223CA0019.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::24) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CO1PR11MB5076:EE_
X-MS-Office365-Filtering-Correlation-Id: ff06198d-2cc5-437d-2f06-08dd4181e44b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?amBmZkThAkb01AkpPLy92e5Ta+Bhg8v4TH6MTmabgwLC6wP0VcWfBWmtuF?=
 =?iso-8859-1?Q?8ZqkbgZlPWP1tWBTuNUaDEQ3r2vdo6GtBGpM6AiOb/EbdCIQ87Z6xQxB5k?=
 =?iso-8859-1?Q?ESdHH0iFXaOBAKJR8ZL5Hw9DnZv4XrMh++IvFFXb6T7VvqoKcroz8NeNfk?=
 =?iso-8859-1?Q?ClaDMxCEdRqUtW/WkTUtXv9+KVC0ZNcSAVYA7pggu5lPIXaXYhRL+TtrLp?=
 =?iso-8859-1?Q?Fm5LfNJrOH6tR0VtkwPB4OXNGYIeJK+021UYY4nf+QS45RAhDUOvrMFzwE?=
 =?iso-8859-1?Q?BVwmFVieb+hAECpZI6sL4bQFedSdh+oqT0zPQq2nJA9+cCTOXO5crmA+sM?=
 =?iso-8859-1?Q?C8kzSRw/ieswawCJsbRazKB9yySDHY3R9DFwYgwo86LtvRL18PbnO/huBB?=
 =?iso-8859-1?Q?rxu/bMz+0sqJu4nmbX4L0G3KacSM9VOJfES7u4Ezql18SR8TBlKVKYiLka?=
 =?iso-8859-1?Q?rLTaJ0oP8soS77SsLAVsyC+bSL0zNif8SojCZRVeTZLtOoPWBr1l5dmPBB?=
 =?iso-8859-1?Q?SRmY2CZgS9g6MThgSOkflyAMFodwqJf7MZJWHF5uL2lNBmlIEJ4x2wSnY+?=
 =?iso-8859-1?Q?n33P9pTWWca1Lw0XXDgkc9DRXMCPMR6ade7+08jFvSzfgnVNVjyP4GwRMh?=
 =?iso-8859-1?Q?i6+wnCHubFuEk2NpbSN7PbMW94OMDDZXmbHnwaAHxmYyjuWlkDj8OpnNxd?=
 =?iso-8859-1?Q?BAwzy4y6UWukg5ceCWdym3cR+xRFiop2/JRr5XS9aLSfynSSJOI90XqL0T?=
 =?iso-8859-1?Q?3jhJQ2omGbEJACBCO0+VX1qRtkUyhPfI6tMk9Pt6sXYKn4WtM+Wyk8dy1t?=
 =?iso-8859-1?Q?RF5qQNB64QNdue0lHNUC4Slv8S1935rL2+oYMExGkh/P5H2SJgMzrRCjLv?=
 =?iso-8859-1?Q?r53Tw98WJOkbmY/dDciJoSEDse0KIgFzg+Mn3bQU00dCb57vqJVmVlxYU+?=
 =?iso-8859-1?Q?btvDl4ZNXRH6GSPp6ihdwueObKt0NrAX0tFn5UweVnaAWxOGhryImOkppW?=
 =?iso-8859-1?Q?uHyXjpJb994aMLdHPcvN2G31nR6I8x6KI8xXWH19x2bOVAFDHYUrkG6jlS?=
 =?iso-8859-1?Q?L6XlJaZoSfGkY+IbPs/o+H0A8OJYw1jMIHZDwgPI2jyEqKMKuYsBfaMMy9?=
 =?iso-8859-1?Q?a8Wl2B/tdjzvWEBZD/joA6g61h/16X6WTX9IbDhBvrkXQ6m6H4+vNdULXY?=
 =?iso-8859-1?Q?jHjjoos7DiTMQSC4F0g2JWYw9GG6EQb9x5yHV1bCuhkEzW7nxqoU2t8QlV?=
 =?iso-8859-1?Q?GJoZhl23emvQ6mTXcU+s1Y0UV1f9czFIzCYtqCXydEh3u86eOz7IJM1AAv?=
 =?iso-8859-1?Q?MQ8rf+dRA4MztBkD4kdeP6wGM/dAEIhTvFgDCMkJBH+bCoPgqBAYdBvWPp?=
 =?iso-8859-1?Q?5xl1LOrsMVb8Sw6jK7hRLp9Hl6fZtvNuDXQZ3h1SYl8JAesf35dwP26EFv?=
 =?iso-8859-1?Q?v9hPx6t9Csv/W7xr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?zTu1U87n6M11TuivYEjAV340bd10Z4RwUxWkszTXixbRukbbevgQvATM/u?=
 =?iso-8859-1?Q?e/Wqqf2pIwnSoClvvFCV5cSEOfog5NcuVC0k7wTt5JVbM+HPhSExiENGcm?=
 =?iso-8859-1?Q?AFB2wX6+veK66MwXGzg5FRitUIfRtGr4bwYfZ9hI37pVyupZvvHK/HODT9?=
 =?iso-8859-1?Q?SE8z+7qi8d8pdwPecLzZ1IqIE2znOyeaAQfJoHJtd6HkLVES/xoEa+VpOd?=
 =?iso-8859-1?Q?bzzbWItQWfjsl1kUwUoK1dFkUXLKZELe3mUwqOBDGieBPd/6CZVSQSNI8b?=
 =?iso-8859-1?Q?+xv+FPcPA58y++bL5MtEx5Oa0kkeRXmZ1nFfKPAfMbKmMmTOhYSAKrMSRK?=
 =?iso-8859-1?Q?Gafc4biDzGmYMAUOZ2trAkM7Y12WLjPhQpBPv3pfliOZL/efKCnhrUrS4i?=
 =?iso-8859-1?Q?kH1wd9WHRM2DV2idVsjT7Q6jMSSDjFqjBDFxzympOutrVfFU0BeIDW4qLo?=
 =?iso-8859-1?Q?XxFHvd9G5GGCkgekxR3NQHn35tAx3h6J3bbk/TalkAyMeYcMNgk6Xa6uD/?=
 =?iso-8859-1?Q?qIIIYDpNWdcZAnXTrn8ih5mI+r41/MFxsjfXTpLiISvRYse8jGzHVaXEk+?=
 =?iso-8859-1?Q?pVVGqZURLHpbKPVPn8Gi3YHBhCG+YK+6Tl/ufclpZd1JpjOwIdAnlPBOVc?=
 =?iso-8859-1?Q?Ydt1nyVCVt+KRJmFgovSapzrFqN0Rzahr0RbRK+mxC9eJKsld28o8tHwwQ?=
 =?iso-8859-1?Q?YCmurPdPD3j2gQHD4RRSFq5BCkV/7YXBR2hbuwCJpXGx5G1/UYX+RN/K8M?=
 =?iso-8859-1?Q?6yXTwFvcIfbK4GVm3dUJ+y1o6M92WbTnlValkBRVfPG11c+ObYmX8VnGlY?=
 =?iso-8859-1?Q?GEgzSHWDIscdYqGJYmX82vwfkUpv75Y6L8GQFpd3hPVk4qjjvL4We0wVip?=
 =?iso-8859-1?Q?yVemtsjl64Ope/I/RyYNquEMw93AJt/4xU1bntmg1sUcMEcvt9IUD3gDtn?=
 =?iso-8859-1?Q?v+lgMWpFsW1NkQ2RWCRfL48SfoYb6hhHSNuQhzbBW3ml2zbj417gFIlOqT?=
 =?iso-8859-1?Q?ec3VThwQMFJ52jkj8+xOe8XyFWJ06wEnbJJKRA4HXihz65wVqKtRhSadQw?=
 =?iso-8859-1?Q?mV1WqY5vq5787a+yGUyTTIjEzk1si7MQLeTJu3jKDU0VqPmoiX/9UAFnIh?=
 =?iso-8859-1?Q?yH8i+E25zxBmyCHESi9g/w5miRokcqBiPcVz6uJNULYrFoJT/zqBfJjdRN?=
 =?iso-8859-1?Q?6w9d2VliFy60a+KD/WSlrABTuZa8UMfVONhFDCAAlfKVcBSa86L4yqH1a0?=
 =?iso-8859-1?Q?StyhWZd1sPj0A4c9ZRoF0+aXsk5g4sueIRvJP5YMCRi+JGfncA9x9W/zdK?=
 =?iso-8859-1?Q?d6cVKLtCRrp3WYz2RtkNnSaX4TTgsca4NOr8ecCE1fKcs6u5tdu9ZgGU/j?=
 =?iso-8859-1?Q?xVDroMCBTYHIn9uLklQCZVW9HP+JqYsUduZUaN24YLQZSQ1gj8gk9d5dDq?=
 =?iso-8859-1?Q?J+awpg3hKWaG/pXy9ZSt5Trz++1TL+RTnNdrKVRKoNiQmV2FSWm8PYMZYY?=
 =?iso-8859-1?Q?wq7CV3ZsjYTVYmsFrYV6GJtNGWP5DGf4sXIsuDDC2DAVwA7DHzlBEufxUQ?=
 =?iso-8859-1?Q?6IJVjw0Zw01bjOEpKhmXC9bBaJX9qL+saz7ZFzGAy/cD2NFd5F0sQBt8GG?=
 =?iso-8859-1?Q?RQz3bMYciYjLFDhplYD3KDSsoZU1xgVOuS3CwgKgwU4FZHgGWrfOh3hA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff06198d-2cc5-437d-2f06-08dd4181e44b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 23:00:30.1325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZWupK1uxyxTyCLLzoYHlelz7UkLtjFLY2kKSQ/A0BR1jyjyYnNgT1xdnfmU7kCFEb7LZv47ACJ+03gTktH3S+w4vBikKE1FqvPxacPsq8Ao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5076
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

On Thu, Jan 30, 2025 at 10:19:24AM +0530, Riana Tauro wrote:
>Hi Umesh/Rodrigo
>
>On 1/30/2025 8:05 AM, Rodrigo Vivi wrote:
>>On Wed, Jan 29, 2025 at 04:28:36PM -0800, Umesh Nerlige Ramappa wrote:
>>>On Wed, Jan 29, 2025 at 03:46:44PM +0530, Riana Tauro wrote:
>>>>GuC provides support to read engine counters to calculate the
>>>>engine activity. KMD exposes two counters via the PMU interface to
>>>>calculate engine activity
>>>>
>>>>Engine Active Ticks(engine-active-ticks) - number of active ticks for engine
>>>>Engine Total Ticks (engine-total-ticks) - total ticks of engine
>>>>
>>>>Engine activity percentage can be calculated as below
>>>>Engine activity % = (engine active ticks/engine total ticks) * 100.
>>>>
>>>>v2: fix cosmetic review comments
>>>>    add forcewake for gpm_ts (Umesh)
>>>>
>>>>v3: fix CI hooks error
>>>>    change function parameters and unpin bo on error
>>>>    of allocate_activity_buffers
>>>>    fix kernel-doc (Umesh)
>>>>    use engine activity (Umesh, Lucas)
>>>>    rename xe_engine_activity to xe_guc_engine_*
>>>>    fix commit message to use per-engine class(Lucas)
>>>>
>>>>v4: remove forcewake as engine is already running
>>>>    when reading gpm timestamp
>>>
>>>+ Rodrigo
>>>
>>>Sorry, I think I mentioned offline that the runtime pm get is sufficient for
>>>reading this register, but it's not. It does need a forcewake of the GT
>>>domain.  At the same time, we cannot use the xe_force_wake_get because of
>>>the lockdep issue you mentioned and also I assume that xe_force_wake_get may
>>>sleep and the event may be read from irq context.
>The lockdep issue is due to perf holding a raw_spinlock and forcewake 
>having a spinlock. In 6.13 due to config PROVE_RAW_LOCK_NESTING being 
>enabled was seeing this issue. Latest patch has disabled this due to 
>issues with i915.
>
>[  465.359017] =============================
>[  465.363050] [ BUG: Invalid wait context ]
>[  465.367063] 6.13.0-rc5-xe #11 Tainted: G     U
>[  465.372544] -----------------------------
>[  465.376555] swapper/0/0 is trying to lock:
>[  465.380652] ffff88810d5b8098 (&fw->lock){....}-{3:3}, at: 
>xe_force_wake_get+0x1f9/0x8c0 [xe]
>[  465.389168] other info that might help us debug this:
>[  465.394221] context-{5:5}
>[  465.396847] 1 lock held by swapper/0/0:
>[  465.400682]  #0: ffff88885f031fb8 (&cpuctx_lock){....}-{2:2}, at: 
>__perf_event_read+0x60/0x230
>[  465.409295] stack backtrace:
>
>
>Since in this case we are checking mmio only when engine is running
>and gt will be active. i thought we could remove it.
>
>>>> +	if (ea->running) {
>>>> +		gpm_ts = xe_mmio_read64_2x32(&gt->mmio, MISC_STATUS_0) >>
>>>> +			 engine_activity->gpm_timestamp_shift;
>>>> +		ea->active = lower_32_bits(gpm_ts) - 
>cached_activity->last_update_tick;
>>>> +	}
>
>But yeah, gt might enter c6 just after reading ea->running. To avoid 
>this,as lucas suggested have to use hr timer.
>
>I thought if needed, will add it as part of a separate series.
>I can add the forcewake back as the config is removed and add hr timer 

no, we are only papering over CI exploding in order to buy time to get
it fixed. But I think I will remove the patch from topic/core-for-CI
since it has the potential to cause more harm.

Lucas De Marchi

>in another series.
>
>Thanks
>Riana
>>
>>I don't understand this statement entirely. force wake get cannot sleep.
>>It is based on spin locks. It should not be issuing any lockdep here.
>>It is quite simple flow with minimal or none interdependency. Remember
>>that in i915 for instance it exists and lives in the middle of every
>>mmio read and write call...
>>
>>>
>>>I would check if we can add a helper xe_force_wake_get_if_active() and just
>>>use that to bump up the wakeref.
>>
>>I would prefer to not complicate things...
>>
>>>
>>>@Rodrigo, @Vinay Any thoughts on this ^ ?
>>
>>Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>
>>>
>>>Thanks,
>>>Umesh
>>>
>>>>
>>>>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>>Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>>---
>>>>drivers/gpu/drm/xe/Makefile                   |   1 +
>>>>drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   1 +
>>>>drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   2 +
>>>>drivers/gpu/drm/xe/xe_guc_engine_activity.c   | 317 ++++++++++++++++++
>>>>drivers/gpu/drm/xe/xe_guc_engine_activity.h   |  18 +
>>>>.../gpu/drm/xe/xe_guc_engine_activity_types.h |  89 +++++
>>>>drivers/gpu/drm/xe/xe_guc_fwif.h              |  19 ++
>>>>drivers/gpu/drm/xe/xe_guc_types.h             |   4 +
>>>>8 files changed, 451 insertions(+)
>>>>create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.c
>>>>create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.h
>>>>create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>>>>
>>>>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>>>index 328aff36831b..7e93461c60bd 100644
>>>>--- a/drivers/gpu/drm/xe/Makefile
>>>>+++ b/drivers/gpu/drm/xe/Makefile
>>>>@@ -33,6 +33,7 @@ xe-y += xe_bb.o \
>>>>	xe_device_sysfs.o \
>>>>	xe_dma_buf.o \
>>>>	xe_drm_client.o \
>>>>+	xe_guc_engine_activity.o \
>>>>	xe_exec.o \
>>>>	xe_execlist.o \
>>>>	xe_exec_queue.o \
>>>>diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>>>>index fee385532fb0..ec516e838ee8 100644
>>>>--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>>>>+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>>>>@@ -140,6 +140,7 @@ enum xe_guc_action {
>>>>	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
>>>>	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>>>>	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>>>>+	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
>>>>	XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
>>>>	XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
>>>>	XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
>>>>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>>index 096859072396..124cc398798e 100644
>>>>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>>@@ -358,6 +358,8 @@
>>>>#define   RENDER_AWAKE_STATUS			REG_BIT(1)
>>>>#define   MEDIA_SLICE0_AWAKE_STATUS		REG_BIT(0)
>>>>
>>>>+#define MISC_STATUS_0				XE_REG(0xa500)
>>>>+
>>>>#define FORCEWAKE_MEDIA_VDBOX(n)		XE_REG(0xa540 + (n) * 4)
>>>>#define FORCEWAKE_MEDIA_VEBOX(n)		XE_REG(0xa560 + (n) * 4)
>>>>#define FORCEWAKE_GSC				XE_REG(0xa618)
>>>>diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>>>>new file mode 100644
>>>>index 000000000000..088209b9c228
>>>>--- /dev/null
>>>>+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>>>>@@ -0,0 +1,317 @@
>>>>+// SPDX-License-Identifier: MIT
>>>>+/*
>>>>+ * Copyright © 2025 Intel Corporation
>>>>+ */
>>>>+#include "xe_guc_engine_activity.h"
>>>>+
>>>>+#include "abi/guc_actions_abi.h"
>>>>+#include "regs/xe_gt_regs.h"
>>>>+
>>>>+#include "xe_bo.h"
>>>>+#include "xe_force_wake.h"
>>>>+#include "xe_gt_printk.h"
>>>>+#include "xe_guc.h"
>>>>+#include "xe_guc_ct.h"
>>>>+#include "xe_hw_engine.h"
>>>>+#include "xe_map.h"
>>>>+#include "xe_mmio.h"
>>>>+
>>>>+#define TOTAL_QUANTA 0x8000
>>>>+
>>>>+static struct iosys_map engine_activity_map(struct xe_guc *guc, struct xe_hw_engine *hwe)
>>>>+{
>>>>+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>>>>+	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
>>>>+	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>>>>+	size_t offset = 0;
>>>>+
>>>>+	offset = offsetof(struct guc_engine_activity_data,
>>>>+			  engine_activity[guc_class][hwe->logical_instance]);
>>>>+
>>>>+	return IOSYS_MAP_INIT_OFFSET(&buffer->activity_bo->vmap, offset);
>>>>+}
>>>>+
>>>>+static struct iosys_map engine_metadata_map(struct xe_guc *guc)
>>>>+{
>>>>+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>>>>+	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
>>>>+
>>>>+	return buffer->metadata_bo->vmap;
>>>>+}
>>>>+
>>>>+static int allocate_engine_activity_group(struct xe_guc *guc)
>>>>+{
>>>>+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>>>>+	u32 num_activity_group = 1;
>>>>+
>>>>+	engine_activity->eag = kmalloc_array(num_activity_group,
>>>>+					     sizeof(struct engine_activity_group),
>>>>+					     GFP_KERNEL);
>>>>+
>>>>+	if (!engine_activity->eag)
>>>>+		return -ENOMEM;
>>>>+
>>>>+	memset(engine_activity->eag, 0, num_activity_group * sizeof(struct engine_activity_group));
>>>>+	engine_activity->num_activity_group = num_activity_group;
>>>>+
>>>>+	return 0;
>>>>+}
>>>>+
>>>>+static int allocate_engine_activity_buffers(struct xe_guc *guc,
>>>>+					    struct engine_activity_buffer *buffer)
>>>>+{
>>>>+	u32 metadata_size = sizeof(struct guc_engine_activity_metadata);
>>>>+	u32 size = sizeof(struct guc_engine_activity_data);
>>>>+	struct xe_gt *gt = guc_to_gt(guc);
>>>>+	struct xe_tile *tile = gt_to_tile(gt);
>>>>+	struct xe_bo *bo, *metadata_bo;
>>>>+
>>>>+	metadata_bo = xe_managed_bo_create_pin_map(gt_to_xe(gt), tile, PAGE_ALIGN(metadata_size),
>>>>+						   XE_BO_FLAG_SYSTEM |
>>>>+						   XE_BO_FLAG_GGTT |
>>>>+						   XE_BO_FLAG_GGTT_INVALIDATE);
>>>>+	if (IS_ERR(metadata_bo))
>>>>+		return PTR_ERR(metadata_bo);
>>>>+
>>>>+	bo = xe_managed_bo_create_pin_map(gt_to_xe(gt), tile, PAGE_ALIGN(size),
>>>>+					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>>>>+					  XE_BO_FLAG_GGTT |
>>>>+					  XE_BO_FLAG_GGTT_INVALIDATE);
>>>>+
>>>>+	if (IS_ERR(bo)) {
>>>>+		xe_bo_unpin_map_no_vm(metadata_bo);
>>>>+		return PTR_ERR(bo);
>>>>+	}
>>>>+
>>>>+	buffer->metadata_bo = metadata_bo;
>>>>+	buffer->activity_bo = bo;
>>>>+	return 0;
>>>>+}
>>>>+
>>>>+static struct engine_activity *hw_engine_to_engine_activity(struct xe_hw_engine *hwe)
>>>>+{
>>>>+	struct xe_guc *guc = &hwe->gt->uc.guc;
>>>>+	struct engine_activity_group *eag = &guc->engine_activity.eag[0];
>>>>+	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>>>>+
>>>>+	return &eag->engine[guc_class][hwe->logical_instance];
>>>>+}
>>>>+
>>>>+static u64 cpu_ns_to_guc_tsc_tick(ktime_t ns, u32 freq)
>>>>+{
>>>>+	return mul_u64_u32_div(ns, freq, NSEC_PER_SEC);
>>>>+}
>>>>+
>>>>+#define read_engine_activity_record(xe_, map_, field_) \
>>>>+	xe_map_rd_field(xe_, map_, 0, struct guc_engine_activity, field_)
>>>>+
>>>>+#define read_metadata_record(xe_, map_, field_) \
>>>>+	xe_map_rd_field(xe_, map_, 0, struct guc_engine_activity_metadata, field_)
>>>>+
>>>>+static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>>>>+{
>>>>+	struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>>>>+	struct guc_engine_activity *cached_activity = &ea->activity;
>>>>+	struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
>>>>+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>>>>+	struct iosys_map activity_map, metadata_map;
>>>>+	struct xe_device *xe =  guc_to_xe(guc);
>>>>+	struct xe_gt *gt = guc_to_gt(guc);
>>>>+	u32 last_update_tick, global_change_num;
>>>>+	u64 active_ticks, gpm_ts;
>>>>+	u16 change_num;
>>>>+
>>>>+	activity_map = engine_activity_map(guc, hwe);
>>>>+	metadata_map = engine_metadata_map(guc);
>>>>+	global_change_num = read_metadata_record(xe, &metadata_map, global_change_num);
>>>>+
>>>>+	/* GuC has not initialized activity data yet, return 0 */
>>>>+	if (!global_change_num)
>>>>+		goto update;
>>>>+
>>>>+	if (global_change_num == cached_metadata->global_change_num)
>>>>+		goto update;
>>>>+	else
>>>>+		cached_metadata->global_change_num = global_change_num;
>>>>+
>>>>+	change_num = read_engine_activity_record(xe, &activity_map, change_num);
>>>>+
>>>>+	if (!change_num || change_num == cached_activity->change_num)
>>>>+		goto update;
>>>>+
>>>>+	/* read engine activity values */
>>>>+	last_update_tick = read_engine_activity_record(xe, &activity_map, last_update_tick);
>>>>+	active_ticks = read_engine_activity_record(xe, &activity_map, active_ticks);
>>>>+
>>>>+	/* activity calculations */
>>>>+	ea->running = !!last_update_tick;
>>>>+	ea->total += active_ticks - cached_activity->active_ticks;
>>>>+	ea->active = 0;
>>>>+
>>>>+	/* cache the counter */
>>>>+	cached_activity->change_num = change_num;
>>>>+	cached_activity->last_update_tick = last_update_tick;
>>>>+	cached_activity->active_ticks = active_ticks;
>>>>+
>>>>+update:
>>>>+	if (ea->running) {
>>>>+		gpm_ts = xe_mmio_read64_2x32(&gt->mmio, MISC_STATUS_0) >>
>>>>+			 engine_activity->gpm_timestamp_shift;
>>>>+		ea->active = lower_32_bits(gpm_ts) - cached_activity->last_update_tick;
>>>>+	}
>>>>+
>>>>+	return ea->total + ea->active;
>>>>+}
>>>>+
>>>>+static u64 get_engine_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>>>>+{
>>>>+	struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>>>>+	struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
>>>>+	struct guc_engine_activity *cached_activity = &ea->activity;
>>>>+	struct iosys_map activity_map, metadata_map;
>>>>+	struct xe_device *xe = guc_to_xe(guc);
>>>>+	ktime_t now, cpu_delta;
>>>>+	u64 numerator;
>>>>+	u16 quanta_ratio;
>>>>+
>>>>+	activity_map = engine_activity_map(guc, hwe);
>>>>+	metadata_map = engine_metadata_map(guc);
>>>>+
>>>>+	if (!cached_metadata->guc_tsc_frequency_hz)
>>>>+		cached_metadata->guc_tsc_frequency_hz = read_metadata_record(xe, &metadata_map,
>>>>+									     guc_tsc_frequency_hz);
>>>>+
>>>>+	quanta_ratio = read_engine_activity_record(xe, &activity_map, quanta_ratio);
>>>>+	cached_activity->quanta_ratio = quanta_ratio;
>>>>+
>>>>+	/* Total ticks calculations */
>>>>+	now = ktime_get();
>>>>+	cpu_delta = now - ea->last_cpu_ts;
>>>>+	ea->last_cpu_ts = now;
>>>>+	numerator = (ea->quanta_remainder_ns + cpu_delta) * cached_activity->quanta_ratio;
>>>>+	ea->quanta_ns += numerator / TOTAL_QUANTA;
>>>>+	ea->quanta_remainder_ns = numerator % TOTAL_QUANTA;
>>>>+	ea->quanta = cpu_ns_to_guc_tsc_tick(ea->quanta_ns, cached_metadata->guc_tsc_frequency_hz);
>>>>+
>>>>+	return ea->quanta;
>>>>+}
>>>>+
>>>>+static int enable_engine_activity_stats(struct xe_guc *guc)
>>>>+{
>>>>+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>>>>+	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
>>>>+	u32 metadata_ggtt_addr = xe_bo_ggtt_addr(buffer->metadata_bo);
>>>>+	u32 ggtt_addr = xe_bo_ggtt_addr(buffer->activity_bo);
>>>>+	int len = 0;
>>>>+	u32 action[5];
>>>>+
>>>>+	action[len++] = XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER;
>>>>+	action[len++] = metadata_ggtt_addr;
>>>>+	action[len++] = 0;
>>>>+	action[len++] = ggtt_addr;
>>>>+	action[len++] = 0;
>>>>+
>>>>+	/* Blocking here to ensure the buffers are ready before reading them */
>>>>+	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>>>>+}
>>>>+
>>>>+static void engine_activity_set_cpu_ts(struct xe_guc *guc)
>>>>+{
>>>>+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>>>>+	struct engine_activity_group *eag = &engine_activity->eag[0];
>>>>+	int i, j;
>>>>+
>>>>+	for (i = 0; i < GUC_MAX_ENGINE_CLASSES; i++)
>>>>+		for (j = 0; j < GUC_MAX_INSTANCES_PER_CLASS; j++)
>>>>+			eag->engine[i][j].last_cpu_ts = ktime_get();
>>>>+}
>>>>+
>>>>+static u32 gpm_timestamp_shift(struct xe_gt *gt)
>>>>+{
>>>>+	u32 reg;
>>>>+
>>>>+	reg = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
>>>>+
>>>>+	return 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
>>>>+}
>>>>+
>>>>+/**
>>>>+ * xe_guc_engine_activity_active_ticks - Get engine active ticks
>>>>+ * @hwe: The hw_engine object
>>>>+ *
>>>>+ * Return: accumulated ticks @hwe was active since engine activity stats were enabled.
>>>>+ */
>>>>+u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe)
>>>>+{
>>>>+	struct xe_guc *guc =  &hwe->gt->uc.guc;
>>>>+
>>>>+	return get_engine_active_ticks(guc, hwe);
>>>>+}
>>>>+
>>>>+/**
>>>>+ * xe_guc_engine_activity_total_ticks - Get engine total ticks
>>>>+ * @hwe: The hw_engine object
>>>>+ *
>>>>+ * Return: accumulated quanta of ticks allocated for the engine
>>>>+ */
>>>>+u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe)
>>>>+{
>>>>+	struct xe_guc *guc =  &hwe->gt->uc.guc;
>>>>+
>>>>+	return get_engine_total_ticks(guc, hwe);
>>>>+}
>>>>+
>>>>+/**
>>>>+ * xe_guc_engine_activity_enable_stats - Enable engine activity stats
>>>>+ * @guc: The GuC object
>>>>+ *
>>>>+ * Enable engine activity stats and set initial timestamps
>>>>+ */
>>>>+void xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
>>>>+{
>>>>+	int ret;
>>>>+
>>>>+	ret = enable_engine_activity_stats(guc);
>>>>+	if (ret)
>>>>+		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
>>>>+	else
>>>>+		engine_activity_set_cpu_ts(guc);
>>>>+}
>>>>+
>>>>+static void engine_activity_fini(void *arg)
>>>>+{
>>>>+	struct xe_guc_engine_activity *engine_activity = arg;
>>>>+
>>>>+	kfree(engine_activity->eag);
>>>>+}
>>>>+
>>>>+/**
>>>>+ * xe_guc_engine_activity_init - Initialize the engine activity data
>>>>+ * @guc: The GuC object
>>>>+ *
>>>>+ * Return: 0 on success, negative error code otherwise.
>>>>+ */
>>>>+int xe_guc_engine_activity_init(struct xe_guc *guc)
>>>>+{
>>>>+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>>>>+	struct xe_gt *gt = guc_to_gt(guc);
>>>>+	int ret;
>>>>+
>>>>+	ret = allocate_engine_activity_group(guc);
>>>>+	if (ret) {
>>>>+		xe_gt_err(gt, "failed to allocate activity group %d\n", ret);
>>>>+		return ret;
>>>>+	}
>>>>+
>>>>+	ret = allocate_engine_activity_buffers(guc, &engine_activity->device_buffer);
>>>>+	if (ret) {
>>>>+		xe_gt_err(gt, "failed to allocate activity buffers%d\n", ret);
>>>>+		kfree(engine_activity->eag);
>>>>+		return ret;
>>>>+	}
>>>>+
>>>>+	engine_activity->gpm_timestamp_shift = gpm_timestamp_shift(gt);
>>>>+
>>>>+	return devm_add_action_or_reset(gt_to_xe(gt)->drm.dev, engine_activity_fini,
>>>>+					engine_activity);
>>>>+}
>>>>diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.h b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>>>>new file mode 100644
>>>>index 000000000000..c00f3da5513d
>>>>--- /dev/null
>>>>+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>>>>@@ -0,0 +1,18 @@
>>>>+/* SPDX-License-Identifier: MIT */
>>>>+/*
>>>>+ * Copyright © 2025 Intel Corporation
>>>>+ */
>>>>+
>>>>+#ifndef _XE_GUC_ENGINE_ACTIVITY_H_
>>>>+#define _XE_GUC_ENGINE_ACTIVITY_H_
>>>>+
>>>>+#include <linux/types.h>
>>>>+
>>>>+struct xe_hw_engine;
>>>>+struct xe_guc;
>>>>+
>>>>+int xe_guc_engine_activity_init(struct xe_guc *guc);
>>>>+void xe_guc_engine_activity_enable_stats(struct xe_guc *guc);
>>>>+u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe);
>>>>+u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe);
>>>>+#endif
>>>>diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>>>>new file mode 100644
>>>>index 000000000000..a2ab327d3eec
>>>>--- /dev/null
>>>>+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>>>>@@ -0,0 +1,89 @@
>>>>+/* SPDX-License-Identifier: MIT */
>>>>+/*
>>>>+ * Copyright © 2025 Intel Corporation
>>>>+ */
>>>>+
>>>>+#ifndef _XE_GUC_ENGINE_ACTIVITY_TYPES_H_
>>>>+#define _XE_GUC_ENGINE_ACTIVITY_TYPES_H_
>>>>+
>>>>+#include <linux/types.h>
>>>>+
>>>>+#include "xe_guc_fwif.h"
>>>>+/**
>>>>+ * struct engine_activity - Engine specific activity data
>>>>+ *
>>>>+ * Contains engine specific activity data and snapshot of the
>>>>+ * structures from GuC
>>>>+ */
>>>>+struct engine_activity {
>>>>+	/** @active: current activity */
>>>>+	u64 active;
>>>>+
>>>>+	/** @last_cpu_ts: cpu timestamp in nsec of previous sample */
>>>>+	u64 last_cpu_ts;
>>>>+
>>>>+	/** @quanta: total quanta used on HW */
>>>>+	u64 quanta;
>>>>+
>>>>+	/** @quanta_ns: total quanta_ns used on HW */
>>>>+	u64 quanta_ns;
>>>>+
>>>>+	/**
>>>>+	 * @quanta_remainder_ns: remainder when the CPU time is scaled as
>>>>+	 * per the quanta_ratio. This remainder is used in subsequent
>>>>+	 * quanta calculations.
>>>>+	 */
>>>>+	u64 quanta_remainder_ns;
>>>>+
>>>>+	/** @total: total engine activity */
>>>>+	u64 total;
>>>>+
>>>>+	/** @running: true if engine is running some work */
>>>>+	bool running;
>>>>+
>>>>+	/** @metadata: snapshot of engine activity metadata */
>>>>+	struct guc_engine_activity_metadata metadata;
>>>>+
>>>>+	/** @activity: snapshot of engine activity counter */
>>>>+	struct guc_engine_activity activity;
>>>>+};
>>>>+
>>>>+/**
>>>>+ * struct engine_activity_group - Activity data for all engines
>>>>+ */
>>>>+struct engine_activity_group {
>>>>+	/** @engine: engine specific activity data */
>>>>+	struct engine_activity engine[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>>>>+};
>>>>+
>>>>+/**
>>>>+ * struct engine_activity_buffer - engine activity buffers
>>>>+ *
>>>>+ * This contains the buffers allocated for metadata and activity data
>>>>+ */
>>>>+struct engine_activity_buffer {
>>>>+	/** @activity_bo: object allocated to hold activity data */
>>>>+	struct xe_bo *activity_bo;
>>>>+
>>>>+	/** @metadata_bo: object allocated to hold activity metadata */
>>>>+	struct xe_bo *metadata_bo;
>>>>+};
>>>>+
>>>>+/**
>>>>+ * struct xe_guc_engine_activity - Data used by engine activity implementation
>>>>+ */
>>>>+struct xe_guc_engine_activity {
>>>>+	/** @gpm_timestamp_shift: Right shift value for the gpm timestamp */
>>>>+	u32 gpm_timestamp_shift;
>>>>+
>>>>+	/** @num_activity_group: number of activity groups */
>>>>+	u32 num_activity_group;
>>>>+
>>>>+	/** @eag: holds the device level engine activity data */
>>>>+	struct engine_activity_group *eag;
>>>>+
>>>>+	/** @device_buffer: buffer object for global engine activity */
>>>>+	struct engine_activity_buffer device_buffer;
>>>>+};
>>>>+#endif
>>>>+
>>>>diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
>>>>index 057153f89b30..6f57578b07cb 100644
>>>>--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>>>>+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>>>>@@ -208,6 +208,25 @@ struct guc_engine_usage {
>>>>	struct guc_engine_usage_record engines[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>>>>} __packed;
>>>>
>>>>+/* Engine Activity stats */
>>>>+struct guc_engine_activity {
>>>>+	u16 change_num;
>>>>+	u16 quanta_ratio;
>>>>+	u32 last_update_tick;
>>>>+	u64 active_ticks;
>>>>+} __packed;
>>>>+
>>>>+struct guc_engine_activity_data {
>>>>+	struct guc_engine_activity engine_activity[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
>>>>+} __packed;
>>>>+
>>>>+struct guc_engine_activity_metadata {
>>>>+	u32 guc_tsc_frequency_hz;
>>>>+	u32 lag_latency_usec;
>>>>+	u32 global_change_num;
>>>>+	u32 reserved;
>>>>+} __packed;
>>>>+
>>>>/* This action will be programmed in C1BC - SOFT_SCRATCH_15_REG */
>>>>enum xe_guc_recv_message {
>>>>	XE_GUC_RECV_MSG_CRASH_DUMP_POSTED = BIT(1),
>>>>diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
>>>>index 573aa6308380..63bac64429a5 100644
>>>>--- a/drivers/gpu/drm/xe/xe_guc_types.h
>>>>+++ b/drivers/gpu/drm/xe/xe_guc_types.h
>>>>@@ -13,6 +13,7 @@
>>>>#include "xe_guc_ads_types.h"
>>>>#include "xe_guc_buf_types.h"
>>>>#include "xe_guc_ct_types.h"
>>>>+#include "xe_guc_engine_activity_types.h"
>>>>#include "xe_guc_fwif.h"
>>>>#include "xe_guc_log_types.h"
>>>>#include "xe_guc_pc_types.h"
>>>>@@ -103,6 +104,9 @@ struct xe_guc {
>>>>	/** @relay: GuC Relay Communication used in SR-IOV */
>>>>	struct xe_guc_relay relay;
>>>>
>>>>+	/** @engine_activity: Device specific engine activity */
>>>>+	struct xe_guc_engine_activity engine_activity;
>>>>+
>>>>	/**
>>>>	 * @notify_reg: Register which is written to notify GuC of H2G messages
>>>>	 */
>>>>-- 
>>>>2.47.1
>>>>
>
