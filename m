Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DD5C83F1B
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 15:52:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6937110E55F;
	Mon, 14 Jul 2025 15:52:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k3ECGpJ6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFE310E562
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Jul 2025 15:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752508355; x=1784044355;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4aJ9+uzy8LwGUJvBiFadkePPJrIDaQnLI9tVjPOI4bE=;
 b=k3ECGpJ6ZP5zvm2afpI4c+HQg7I0RfAdTntJv/b6tKUNCFyZGPk2iU76
 bCfGxiJn4SZ4htM7g16opO/+rNlHLP/TaZffk+gQHzqXJPuje1JuSq1Il
 YVm/XW1oiln0BPjqE7ee1cTkXlZ/toGXTseyDn+kJKUrnFM8oAY+FVt9q
 Emb0FGJiwwI7G1VMl1ngqw5VSj2V8jGNNUv2mv0HLL6JbS+eH5vgLPIQi
 fYbu4aDPa0KajNw6AlBAj6yIGN9XrMmmeOVigAWwNoGov778A3LwA8kXx
 sxa1gaSrSYGTR03iiZytKRHaDSkU1NCqO9vKfHZZVaSJ1wtKCt6spWaEx A==;
X-CSE-ConnectionGUID: aw+Dut13QBKDGD5fd6Sftw==
X-CSE-MsgGUID: JfdqedwHQaucZyemJBDOHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="72282827"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="72282827"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 08:52:26 -0700
X-CSE-ConnectionGUID: j36vTf9UQ++uth2gXBpUVg==
X-CSE-MsgGUID: Cs9MGfnlTem5bJKfoODxrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="156765902"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 08:52:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 08:52:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 14 Jul 2025 08:52:25 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.65)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 08:52:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZP+/BERKZctUHBkKOJrM/uywVzm6D6BmdO/PuZz3hZiwZRB1YL+NGVRfLcBEn9gg4Qv8iyHjmMTzTYodXhA1Z1cg+ij5XXCU9Ch+majqC+ros+tvRK5lkoVkt8/cIhptB1rYrI/UXgbibYrrsjxnRNpAlRteAFxVdACcKyyA75Z07YMxmIBzFx+dxLY1hxax44eSmT+Vs6r+PENa5cw3fowpKaVIZvq4Ycg/9yqv6imUFKIjJAVceq3SMzkYHxHIjQ8QSF32ItvE0uM481tZRhY5cVr2Jq8qm1GEq1yFCDkqkEEODPegFK8lyRyUxGPqpUmouud0ZFunuoTvSYnzkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4aJ9+uzy8LwGUJvBiFadkePPJrIDaQnLI9tVjPOI4bE=;
 b=Jdm36dCG8ObDlFDRcZuzx2e2k9AxCKXw37JcsSicUtD6Tai9IiPnRKyhjRTppRE66Uyhi2JOHZh2lj2FTU8wDClQBgPConu9ay0Q54ijzmRghKjpEgWv6w1WUii7ohBtvtn68V+SnYnFGpyFliyrxevCZwcdHhH1/jIpajgvWmYKJPN/gmO08wtCTP4jj4Ho6Lr8WmtDxs5XNcS/fVq4LlQ80J/kgwxCY+IkEtQ47cX+Ya9+A5jff8STxbI/nrVnrjnoiMdcmFgRB7cBcxiNKI+DoqtuM9QWFYC73k0Ozt47O0Pevo3FWWG6rV1yKCCJTBsiJ7G5gADFUiZrf95doA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV3PR11MB8482.namprd11.prod.outlook.com (2603:10b6:408:1bb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Mon, 14 Jul
 2025 15:52:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 15:52:08 +0000
Date: Mon, 14 Jul 2025 10:52:05 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe: Remove references to CONFIG_DRM_XE_DEVMEM_MIRROR
Message-ID: <su3sw3gyvzuxkbwtrio2i6sgtsulalfjxfcihz3bc2e6txu6ft@d2m7abm6c45g>
References: <20250710205413.1105595-1-matthew.brost@intel.com>
 <CH0PR11MB5444A2EE452F111723C4635CE548A@CH0PR11MB5444.namprd11.prod.outlook.com>
 <aHAvIeeQJB5mNSwp@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aHAvIeeQJB5mNSwp@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR03CA0385.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV3PR11MB8482:EE_
X-MS-Office365-Filtering-Correlation-Id: 7554914c-f66f-4711-3526-08ddc2ee6317
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PndWNCDUYH3P04a8WUkniM7Bd8EMQRimBxiezrj/yiOiaq+AZ0qcfVN9ZIFG?=
 =?us-ascii?Q?Nex90VK49i7c0KPoLjm8favsyGPOcs5ax2VdTCPcjcpsZcOJsVBB+9xR5fah?=
 =?us-ascii?Q?rmEo71JYBBt6R+XHgYWd4husvSLWwOxTrghNCAkwWDlaUDlb0XwGyM1yDcId?=
 =?us-ascii?Q?SQm/54ilBTUUyuwcsSMoUZ3acVoLG0NjWNvdYbz10DHU/si9arwb7wR7+DjP?=
 =?us-ascii?Q?Aegif1+rVmWFMkLcLtSzPmqREpT3q4op27BpqPHSLX9dMgPypxsCqzIwrH3C?=
 =?us-ascii?Q?Wi+hhqbXLMWs5AK1AOFq4ffnqwsLw2QvDXB+duS8HvX5DOavu2S804bBa6JV?=
 =?us-ascii?Q?G4FfvfYO5mO2CG0pNM0oJDbGletIS8uZZFw6JYc8XtelKRYnDx37o+7A25lf?=
 =?us-ascii?Q?P6qlS+Aq3VcBeH7OtHtMIoIIWgSKdiyguMIfuDsJ5EKWhSYMZcMX0bEqvX5T?=
 =?us-ascii?Q?ps7Unk1huXS3FF+BCxwsEjpe0PNDw1K4+Bn3Gb075AmxRihTnjnyFZsohpLf?=
 =?us-ascii?Q?cEpowvPt06qMZuckhZ46CMPG4Vxqxx/9OhuHmqwcZa3d0vsGut3/77xIge7e?=
 =?us-ascii?Q?MenLkURiKOi4bW5TSW7jVWCpWQCwdat+vM76oZbJDqxiqj8QcgF2wughZXWJ?=
 =?us-ascii?Q?DXKouzKqwcucKKOAx0bjRUMRJWpWDrCdRG3C6jtDX/DySjk+tG56VwKGJUHI?=
 =?us-ascii?Q?JjBCx6uVFKTBbwtJklf6U4IiPnjrZC7Goh+1Zu7I378CHpqmt4nIOJd5qE1e?=
 =?us-ascii?Q?hN/GE/MOG77EEC17DdcGE+ptXyaeIGLYv19pSHVNWt73Emkqzc2V7GPhJyTt?=
 =?us-ascii?Q?E/kjhAKuwipz5unp//758mb6y2ldyg99DE5RxJvkAlw8lGTMOT6Kf6oCn3T/?=
 =?us-ascii?Q?4BRvZbE0XlXH6ISpII12JHcYBHcWVhCy6nRZP/FbWfO7YD8w8TYxhGtdrrOQ?=
 =?us-ascii?Q?k1fEYqKEOlv9Xv0Nh55C6NbeGEoKJqe8D6S3MxQCxRpwnhwKYTjd8dQzQUOr?=
 =?us-ascii?Q?3K72axrSw20++RhnxpOhg9zs23ctdPnaVwLbU/oPAgbheKaPrqiFdLmDpQpt?=
 =?us-ascii?Q?SyVgV7i/njHdvFEoEdf5RjyJZDcUyvJvmM92FLahLq6W6INx9SNEP/7iRPmI?=
 =?us-ascii?Q?Hbxs0hsHJTS/HbuV73s+iWurnv2GCPbcFUlXwLPrsCSNL/b8o/45op39CGi5?=
 =?us-ascii?Q?326RQM+AISPMvlFlo+y95IgohJRHNhANja6b0ix5tBg16T52NOHbjxfIMAfC?=
 =?us-ascii?Q?uM0aTRblyYFKXYsdDfMhOQaJKgqiyBQb8qf9yXqWSaXObnBEC5cF7patDkuO?=
 =?us-ascii?Q?4Zp83aqvnykyu8HdqmmiETBriBaH/QfOCveEHuO5nUvdaALCo8u+T3Wg40Ky?=
 =?us-ascii?Q?0RQEytTZ/N6y87/K0Ya8ymro8TBw7iaxu65l6F52gnfnLwCN1emFFAeJr8hR?=
 =?us-ascii?Q?Mjm8caIxjgA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VVaSoZ4zN+TwFTSYDd0S3Cf7AjBHrzluG5Ir98LNUqOpchUJkeWY0UdJjQPe?=
 =?us-ascii?Q?ttWCTMzR0uG/4kaPQyQufjjuSabgWorDIEvMS9dSM9zX4TKvJY0RXiiDhwBr?=
 =?us-ascii?Q?2EOLcTaq3FHYfwPF7tUCIiciaY7+i3sE5bu5G3CuyYu1w38mBNvcRLFzCZM3?=
 =?us-ascii?Q?rIMeZ6KPCvEIe7Wt+yAH0V+olKxw1zkPM51fjx/EZQ+4FIhbQGVCYjHMHBdH?=
 =?us-ascii?Q?cKirZlQnM4jlDLoUKU7FSso/GxdniHz/unvcDy6u7Dz6CvagWtAnbiFwlwoG?=
 =?us-ascii?Q?NvWhuXyFnVaDYNRKNn6OMIRwM6nR3+wYMc7nS2AaWknrxYgOz2wauiokNnnZ?=
 =?us-ascii?Q?PgpSEicMdKBlFfECqVw4CnTaCgqWABrzEKTU1TQlcg1HSZdfeYc+KUwRrGzc?=
 =?us-ascii?Q?ZL8XFtnpaYuAdXLpOSpvX4LAU2knhR8YQCnFmHNaaF6ctqpVYaR9d9uBSYDs?=
 =?us-ascii?Q?TOMMMF4/RonC1o22MD5TK26Dt4Y76JwIn7EoEytbLPSpXrtgt+kUjJ7MzWMd?=
 =?us-ascii?Q?EW1b3YdnU3i2dRd+JmL7pGwAOSg/jKUj8CbGvafh4CPv1Pu+n8idM0lijSk5?=
 =?us-ascii?Q?vORIOfFyoEXRsmWOXAwKPg3tdAP0zHX/jmxiM/Ijxi73AOrxSoAlWGsg9xF6?=
 =?us-ascii?Q?TUKMV9eADAQujYrA/MdeyWbzgQTgNz0ypxFklfdxX3ER346/GomgfqbIbSxu?=
 =?us-ascii?Q?DW7pDQut3s01sm871DJZSkLEZsvTfnRINHgvEND2lPDOZZrZEvW2tThoXN9N?=
 =?us-ascii?Q?gMrvPx/gGSOFxxvpml4uLZsy6uem9XbvojhR/mBxgJb2JpKJYS/av+H3DWpz?=
 =?us-ascii?Q?Prlh4awulO1dj5DiFPTgy6ZfrTe/YUw4bOdJVLuWjD2pDJF/5HvjB39NlZbu?=
 =?us-ascii?Q?cPsCvY332y1GDLPKMYEHrcO+OIkm9oJpELrXmJ8YOkemRldzAMJXfaB/toIa?=
 =?us-ascii?Q?cpjMncFWbiHK3qrecRSOSn5xqxt3fOjGZNc/CnVI1jHafZorcN9EpzxWp8NS?=
 =?us-ascii?Q?C0X94YgRxp7Lg1fZ8xoocVeNU6YF/WWEsaapQTeNgNLdjW//j2BAV4QTxRQU?=
 =?us-ascii?Q?jQgwQ7JkcgiC0HKyMd0Z1ppjFrFWujuzAYd7UHwxrfl3yt1x30PBNqJJWSex?=
 =?us-ascii?Q?KtMO0BYFYlYOSnBxxKBZR2YiHDmCY/nBHSH36Hk9TbkI7me14fphrLqPgTe4?=
 =?us-ascii?Q?JoNk3/YxQUuO4RYoDUmhFelx8/GOMYTC64pXCyWjvlIj4q1Gh4/LrAi/aqhi?=
 =?us-ascii?Q?IpnZ/No5QaQ97vOSpVttQgY/Y59OGSdVHu7ExgnPFGzPT0HN0e+MpY67P4WH?=
 =?us-ascii?Q?4xNU63wz0sLY6CsVAoZhz9icGs7982EjVZ8iRslXNAeJKjFAxhiHMq4kK82m?=
 =?us-ascii?Q?5pM2oxKgO4dA+TcUAR7rAEqgDpjSP9Upo14gxoMwiJBC4/CNHsdEeQ74SaHG?=
 =?us-ascii?Q?xmT4mp2zt+pNugF7lBPmVrv/rfC+PdqTyVCC+N5V1/rQoSBHwXcLTtQo5IUK?=
 =?us-ascii?Q?9B6vWYPlxPIa8YT+BgLo75UWhlqubT8E6MlGfPRg8NiIoF6QDz+vxIKZ5sWs?=
 =?us-ascii?Q?RoKUxFYstE2/N95SrW5g5GtqGaGuLgqJz9CIcuQT2WMEpcGJzKwR0TqHw0o1?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7554914c-f66f-4711-3526-08ddc2ee6317
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 15:52:07.9964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lnrD50TzlTYO31hOr6dbVuwG+8SIfx+DB+Axm4cxr+aGf5xVrR9lHes4Nw29Ri94Jw3lfCwtvqyinDdaxlOohpneZ+jeVZ/PnV1i5Tta3DM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8482
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

On Thu, Jul 10, 2025 at 02:22:41PM -0700, Matthew Brost wrote:
>On Thu, Jul 10, 2025 at 03:19:03PM -0600, Cavitt, Jonathan wrote:
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew Brost
>> Sent: Thursday, July 10, 2025 1:54 PM
>> To: intel-xe@lists.freedesktop.org
>> Subject: [PATCH] drm/xe: Remove references to CONFIG_DRM_XE_DEVMEM_MIRROR
>> >
>> > The prefetch code was referencing CONFIG_DRM_XE_DEVMEM_MIRROR, which has
>> > been replaced by CONFIG_DRM_XE_PAGEMAP. As a result, prefetches were
>> > limited to SRAM. Update the code to use CONFIG_DRM_XE_PAGEMAP instead of
>> > the deprecated option.
>> >
>> > Fixes: f86ad0ed620c ("drm/gpusvm, drm/pagemap: Move migration functionality to drm_pagemap")
>> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>
>> LGTM, though I will admit it's a bit weird this didn't cause the kernel to fail to compile
>> before, as CONFIG_DRM_XE_DEVMEM_MIRROR doesn't seem to have an official
>> declaration in the code to be referenced.
>>
>
>IS_ENABLED just checks if CONFIG_DRM_XE_DEVMEM_MIRROR was defined, which it is not.

yeah... so I did a quick and dirty grep:

sed -n "s/.*ENABLED(CONFIG_\([A-Z_0-9]\+\).*/\1/p" -- drivers/gpu/drm/xe/*.[ch] | sort -u
CONFIGFS_FS
DEBUG_FS
DRM_XE_DEBUG
DRM_XE_DEBUG_GUC
DRM_XE_DEBUG_MEM
DRM_XE_DEBUG_SRIOV
DRM_XE_DEBUG_VM
DRM_XE_DISPLAY
DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
DRM_XE_GPUSVM
DRM_XE_KUNIT_TEST
DRM_XE_LMTT_2L_128GB
DRM_XE_PAGEMAP
DRM_XE_USERPTR_INVAL_INJECT
I2C
INTEL_MEI_GSC_PROXY
LOCKDEP
PERF_EVENTS
PROVE_LOCKING
TRACE_GPU_MEM
X86

Checking for them:

$ git grep "config $foo\$" -- '**/Kconfig*'

It seems we are also doing something weird with
DRM_XE_LMTT_2L_128GB coming from commit b1d204058218 ("drm/xe/pf:
Introduce Local Memory Translation Table")

+Michal

Lucas De Marchi
