Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF354C3ABD8
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 21:40:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BFC10E745;
	Wed, 14 May 2025 21:40:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M81q3zN3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D944710E745
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 21:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747258809; x=1778794809;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OxgXSny72teJJEfxQI1vqrQvFhYYAi6IDSHnZ245n4E=;
 b=M81q3zN3RTUYDIPw11Kkfx77ehUno0Q2g5ASHRzhxIuzBkog9VslFWGe
 FIEG5bw0bsb1GXNC8OzEJFBpf7yU7x9YG7ruXj0RFPwNLSUI8wnTVi/ct
 oxfrOpMbWMEB2uyPOF99UXyd0nbuh+bEH1Palx14BpeEfQyzb9HNefBt4
 ZO7ntk6Ye22rj8ZiNDos7ckdpxmJAUspBdNQPftMuIW3HUIJWN1Lx31MU
 YELf+Ou52MnB/0B9ekElSIksllmC1GlrC3UyMq4NJP+/li/aaymPgu+wZ
 QqZX+pbZvTRUl2vAReWD/DgZdc5RpYP46uFg2NpUNnW7i8xY/ZAB9ghky A==;
X-CSE-ConnectionGUID: W75App/vQ0WMAjskI8LrpQ==
X-CSE-MsgGUID: HT53LI2XRmOSn7B6YdeSsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="60578320"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="60578320"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 14:40:07 -0700
X-CSE-ConnectionGUID: gM7v+AnBRYKIxZFU4LH6tA==
X-CSE-MsgGUID: rFMmA6EFQyG5SIuJ7mH03A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="138040975"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 14:40:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 14:40:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 14:40:05 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 14:40:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GkwsSf/R3pmPDcCCGh5opLKWdxy6x9SDGxfq+k6hVuVF53L4Pz27IimN2/5e9aM69X+8xeCYnMunf1XKhpGW5/jc2b9PN0rfWsmIBFhGd4m8Bg4fOnGw5dr4T6+vc1H0UyyNIANGGDtc7yqgU7jxCxAwP6kBtQk8Qfv/NP2xlUr5GTIZUxB4l5hmcC4nVwHQv+MSEFcuaRs3UmspBAtupbITDWx7a3FYgXjE+15ZHS2uIfRdcCyy5EOD1Cz8BRtT5IO1bPCMQMYaIpFYGfwIdmFfM6f99m4TN0sevyJK0rco9WCVEmiXD83qA/4DgtWiWeTCmD6KywV8+VHKzmGLpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QGxgzLEixSoAWwSvzF9dkQbyusiuqAbusSnB29j2WGw=;
 b=oajefQDqqlpVCUX4sErChuy/z5CmK6s99Gx7I+LYZrldnbN5WA0mqqOrn84qWxIXT7iq2S2wH1sSquptq4U+QcUrEIZypeydxctbKtpiKJl6/PS4ZDx25SyCkXy60tUOC/e20x7R5iioKSzdZglsAz5J48kSZ17aYRW0C0+b0S9YbfjdQ1XhIQnjRmRIHxYfsVGx6PHE7zzrFBKuOOd7iKH9u4lHWbsUX3Vm585g8pOoHvvYd14SYEkoXd462bkY6IDUSIGHE5Y5U2F8yUUSZkzMLLeicDjgQfMTMBYLsv1zdUfaThAgaPXxqfmUa5Ldc5jEqERcumB4ZVuYWzjO/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB8856.namprd11.prod.outlook.com (2603:10b6:8:253::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.25; Wed, 14 May
 2025 21:39:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Wed, 14 May 2025
 21:39:57 +0000
Date: Wed, 14 May 2025 14:41:24 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 23/32] drm/xe: Implement madvise ioctl for xe
Message-ID: <aCUOBPal7m8PF67H@lstrano-desk.jf.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-24-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250407101719.3350996-24-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW2PR16CA0070.namprd16.prod.outlook.com
 (2603:10b6:907:1::47) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB8856:EE_
X-MS-Office365-Filtering-Correlation-Id: ab5816f1-0c19-4118-bd4d-08dd932fdf24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?aQ4WQo2s5OVIZNuExnaxRXtHAucRI8V8EWFAe35/s6XDfF0iI7b3IVboDq?=
 =?iso-8859-1?Q?lwkEaqVqWjGgwBi1ItJ1G7KlqpgaCeXgUiBXKromIW0/sMXm421khnAMzQ?=
 =?iso-8859-1?Q?edUkL1zatbRpvyB0913cxMOArGx/KzluxmOszHh9AM5j3dMvq/FAAlfhja?=
 =?iso-8859-1?Q?9bvGY9LdfXcd16+DG/oOKtBL95cOMbvN8EkFtpLnLmhMyHIJGLFR7ERJIm?=
 =?iso-8859-1?Q?41As7V1LU9XJEAGS6TGEOWU2vJ22I24T2iABMNguo0jJAQ1NWqrgbCOL8n?=
 =?iso-8859-1?Q?NOo+9DtrRgAGgt9TJMErSmuLb9b+2uiW72AVJThEZT3AoL2hoBRWAy1Dg6?=
 =?iso-8859-1?Q?v2MzJJqzPxe6yR7C7WievwQwpPhTQP/VMnXaqTxb4Vi31mw7W7WpAASYGm?=
 =?iso-8859-1?Q?uPAXzrX7yF79SUr7oM/YGIlaXGYT920d0UeyJIdU/Tum+E5mhaBuLmVlJC?=
 =?iso-8859-1?Q?tb81tVyLJ8hZrLYodouzS85vB7LAgPZtkHEbhyktJ01RnaFpRmYLcWrMLW?=
 =?iso-8859-1?Q?x/OpO7b49Y/xkH9QaSAP9ovHRQ5F56ONlwGrxpAjYpT/rALCsyjhVLDvf2?=
 =?iso-8859-1?Q?9F7ipQQDlSxLXzLvD17QQZRcHc6WP9sbXQs6Oe2D2AbPfC9Jx67DqB9lFD?=
 =?iso-8859-1?Q?YJA1jkErzB9fGL9kcfmwTbf8E8PVnxjpp42oroiZWYMDg5/I55UMqxiFYs?=
 =?iso-8859-1?Q?vaEOKKHQYj09pcvt/wRwMAISsQqHfeY5l0ri9v0he9wz0v95b77UqOWspu?=
 =?iso-8859-1?Q?TSAFKPRCpkq2cH439tLsu529GfdD4zEq8dp1eH6WIDc4DVpTwYibMWDXoX?=
 =?iso-8859-1?Q?gNUF0g/o27I7XheXoj4myxGMdjyeMyi3+A4lKNEYCNmEGYKauxBEFbQcOe?=
 =?iso-8859-1?Q?uBqIzeNuLJlZfIfqLTmlPlzH5xDmiZpwo2n0McRUKhH9wkc/A+4+0XFvGt?=
 =?iso-8859-1?Q?6LvD3y/LMu3T4PnUs4A7XSkKenJQWMS/HgGs5fRdmfpkplqpCo7198+Hjc?=
 =?iso-8859-1?Q?wnVxfqayIJL78Wggw+gESB7mypywoXbKvtLXQzrhsqT8VZkkLsW3WVVXl8?=
 =?iso-8859-1?Q?TORqOG+uId9P92/V5I3P05WXKbJCpzIMVWwPUe2NGInvuRBC/ABAxu9+dL?=
 =?iso-8859-1?Q?/++0WWWZuYx+AaEJIfba2U3/wD5RXOc4xeJJ+HeDpSj6NYGZeGdbj01jf2?=
 =?iso-8859-1?Q?9wzd89GCpOrS9xX+dfzNAspFnbc3wgVGWBjFbYPfXED2Tu74S+ZICepjVT?=
 =?iso-8859-1?Q?Nej8b4H6RWW5wX6ftG4LZOK21jtl0WVQe0ePxvIMX0/FaXgaWStVbPbcV/?=
 =?iso-8859-1?Q?wgCpKf0ArPkmwhxcny0d2bmb/Al14hfm50pUHQAmCBSK2nii/0qK0c8c4o?=
 =?iso-8859-1?Q?khz7v/j4zysaRGAvIQgWcdqCRlpxkzXGpAMFsrzzaLTLOVF08Cfbji8EgB?=
 =?iso-8859-1?Q?oCR2sonPHlOrdtsHqoISHR2Gb4h5hgMHIkCwwh8QGqx3xzqxLOUn8mWhVp?=
 =?iso-8859-1?Q?o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?RuDaf2FhYIUJvNeqMxc3+J0Akx5RVNx0JxjA9epFBVuEmdXBvBoZeHJLWi?=
 =?iso-8859-1?Q?CpsyjSndnSOv96Zss6U66kJ03dOFCgeU/1lpqBcBPlh1e1Jq2NuS9/3deL?=
 =?iso-8859-1?Q?40TS7oR0+nCrp3f7G4TqPbErgm4k2p55uv4SJ2LelT/ih2hPonFlq5bFsX?=
 =?iso-8859-1?Q?YXUOxs0j0BQTUpa4Gv+ZtZEBU013tz4ze6H9WY9u9VowDMzL9gVvjwBwz3?=
 =?iso-8859-1?Q?G3Sn+1GRy5+BSSRgAPw5zbf4FV053Zo1XxeCRCUEbjVXiAkmDGdqAqUT32?=
 =?iso-8859-1?Q?tzIrQ9xalOb35hLJOTgGKywkFbJ64+Ez2fGnZv3cDMqLKwzGzdhDHU5Lhe?=
 =?iso-8859-1?Q?barrGBLwoCzQsB2hfjbSvGGUqp8Qs+1M1tCtzZzUVSLKCZpDX6pYxVfUit?=
 =?iso-8859-1?Q?94N0YiN4dkr9RTkRuLNI24jMf2pbJUX8G+eFihirBgtH2PFiUEgGIllp5O?=
 =?iso-8859-1?Q?J1RTm+hfAhrtJSCKS5DShVRd2bp9MsvbjvZiRtuwOJmuI7WaUahBUFbke+?=
 =?iso-8859-1?Q?MT8NxhOHgo9p3lU6ukxFdqzcBJyYUScEndXwAz3I3ZJeFh4s9FUawbw1vc?=
 =?iso-8859-1?Q?DURfGqSM2eQJ3FKCuOz9RT31BN01VYLGIngCqJZslITJN/HcP18YUjLQDO?=
 =?iso-8859-1?Q?0qiG5VMyMiJ6GDojBQiZHEXo4zcdG9moTo1sr+oVLHRWOk61OHUFf0O8je?=
 =?iso-8859-1?Q?4mDc1qdmWATNiGjprqEG1VWcOQmbS1u+KH64zQpbI2hg90EUvcLREkwzfV?=
 =?iso-8859-1?Q?WEs3x3GBDJg0PnKqDmV/OaHfQrUWQ2EFzdfcnaiF67INy9K7xecCGZIchg?=
 =?iso-8859-1?Q?iCKc6+4pwV/BbHT7u/zE/wF4rSsJ4ECEuT5VSQ3OMFHkY0x4d1kMT/aClA?=
 =?iso-8859-1?Q?icPjFqylwbFn9h+rbp25MuVJAFoWpPwDl1cJYljdY6DL5zOvhS5s42ABjH?=
 =?iso-8859-1?Q?aqGybzMYj80a/vHgZz+gAqBpudMu6M/UNt3n1DWtHDcwAb3baiJAafyybX?=
 =?iso-8859-1?Q?FpAnA+uOaKteadxIsE2IQvT4XkxPLtrV21jrloCFIyGnsJtcuolZX9AzqU?=
 =?iso-8859-1?Q?1t5E7s2bX3jhicvNJDi9MWBDdo4xI2y0KKXDM+VK6RHFJhVUOTnYnrrINg?=
 =?iso-8859-1?Q?QedHmGLtJwAvtkyNjlfYTyafIWyRFBMguHXeZqOFgVStpgyFuDE7ntRy8u?=
 =?iso-8859-1?Q?l1wkuPh/VpsPQ+ve9w8QGzZadOxzbaOn/gzS14WVlAq7kCZTwVgEJdrPpo?=
 =?iso-8859-1?Q?kTiveI1oBMhlas0BTBGksxyCxjP/oFki9LWfsJc3tqgjiLAi5t6XBkV74Q?=
 =?iso-8859-1?Q?wYqZkyZmadnHYGquvIdqmHhWv83bLwDI9pgMmyhNNGeu/BLR6gE/IbVoSD?=
 =?iso-8859-1?Q?RTSxcNu35P/OTu4TUpgUd9kgm1HbYx8bF8TCI+CyAQedF/rqWxeAxWNRHq?=
 =?iso-8859-1?Q?a53kWItoRRI09IbxdQZUIKpgM6B1P9tWtGnIxgJXfreCVYhMQ1BFMbDIAf?=
 =?iso-8859-1?Q?8e4e4EDXFapA41JoNIxxADZvFRuE0iR/4eVdpMklXswZlVjuxtP5HdVi+S?=
 =?iso-8859-1?Q?Hgoz5691sRd5FzsES/ZW+tE3iymJ03QNGyXsx14Z9jzlgx08NwruPNLSFC?=
 =?iso-8859-1?Q?mfRPmdgvcDH3mjkeJDSqvSr6F3g43/TB6iZbC5Gf07dLz1Q7Qjy38+hA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab5816f1-0c19-4118-bd4d-08dd932fdf24
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 21:39:57.4749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CU3lAxvAI8x/vBTpG4CsENdzdlRDrHx0ibOFX1C6iFoULrOUex7LCzHV1p0HW+/gZUhTkx8xE5YQ1dR3shJNSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8856
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

On Mon, Apr 07, 2025 at 03:47:10PM +0530, Himal Prasad Ghimiray wrote:
> This driver-specific ioctl enables UMDs to control the memory attributes
> for GPU VMAs within a specified input range. If the start or end
> addresses fall within an existing VMA, the VMA is split accordingly. The
> attributes of the VMA are modified as provided by the users. The old
> mappings of the VMAs are invalidated, and TLB invalidation is performed
> if necessary.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile        |   1 +
>  drivers/gpu/drm/xe/xe_device.c     |   2 +
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 309 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm_madvise.h |  15 ++
>  4 files changed, 327 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
>  create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index e4fec90bab55..3e83ae8b9dc1 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -117,6 +117,7 @@ xe-y += xe_bb.o \
>  	xe_uc.o \
>  	xe_uc_fw.o \
>  	xe_vm.o \
> +	xe_vm_madvise.o \
>  	xe_vram.o \
>  	xe_vram_freq.o \
>  	xe_vsec.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index d8e227ddf255..3e57300014bf 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -60,6 +60,7 @@
>  #include "xe_ttm_stolen_mgr.h"
>  #include "xe_ttm_sys_mgr.h"
>  #include "xe_vm.h"
> +#include "xe_vm_madvise.h"
>  #include "xe_vram.h"
>  #include "xe_vsec.h"
>  #include "xe_wait_user_fence.h"
> @@ -196,6 +197,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>  	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
>  			  DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
>  };
>  
>  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> new file mode 100644
> index 000000000000..ef50031649e0
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -0,0 +1,309 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include "xe_vm_madvise.h"
> +
> +#include <linux/nospec.h>
> +#include <drm/ttm/ttm_tt.h>
> +#include <drm/xe_drm.h>
> +
> +#include "xe_bo.h"
> +#include "xe_gt_tlb_invalidation.h"
> +#include "xe_pt.h"
> +#include "xe_svm.h"
> +
> +static struct xe_vma **get_vmas(struct xe_vm *vm, int *num_vmas,
> +				u64 addr, u64 range)
> +{
> +	struct xe_vma **vmas, **__vmas;
> +	struct drm_gpuva *gpuva;
> +	int max_vmas = 8;
> +
> +	lockdep_assert_held(&vm->lock);

lockdep_assert_held_write

> +
> +	*num_vmas = 0;
> +	vmas = kmalloc_array(max_vmas, sizeof(*vmas), GFP_KERNEL);
> +	if (!vmas)
> +		return NULL;
> +
> +	vm_dbg(&vm->xe->drm, "VMA's in range: start=0x%016llx, end=0x%016llx", addr, addr + range);
> +
> +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, addr, addr + range) {
> +		struct xe_vma *vma = gpuva_to_vma(gpuva);
> +
> +		if (*num_vmas == max_vmas) {
> +			max_vmas <<= 1;
> +			__vmas = krealloc(vmas, max_vmas * sizeof(*vmas), GFP_KERNEL);
> +			if (!__vmas) {
> +				kfree(vmas);
> +				return NULL;
> +			}
> +			vmas = __vmas;
> +		}
> +
> +		vmas[*num_vmas] = vma;
> +		(*num_vmas)++;
> +	}
> +
> +	vm_dbg(&vm->xe->drm, "*num_vmas = %d\n", *num_vmas);
> +
> +	if (!*num_vmas) {
> +		kfree(vmas);
> +		return NULL;
> +	}
> +
> +	return vmas;
> +}
> +
> +static int madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
> +				     struct xe_vma **vmas, int num_vmas,
> +				     struct drm_xe_madvise_ops ops)
> +{
> +	/* Implementation pending */
> +	return 0;
> +}
> +
> +static int madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
> +			  struct xe_vma **vmas, int num_vmas,
> +			  struct drm_xe_madvise_ops ops)
> +{
> +	/* Implementation pending */
> +	return 0;
> +}
> +
> +static int madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
> +			     struct xe_vma **vmas, int num_vmas,
> +			     struct drm_xe_madvise_ops ops)
> +{
> +	/* Implementation pending */
> +	return 0;
> +}
> +
> +static int madvise_purgeable_state(struct xe_device *xe, struct xe_vm *vm,
> +				   struct xe_vma **vmas, int num_vmas,
> +				   struct drm_xe_madvise_ops ops)
> +{
> +	/* Implementation pending */
> +	return 0;
> +}
> +
> +typedef int (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
> +			    struct xe_vma **vmas, int num_vmas, struct drm_xe_madvise_ops ops);
> +
> +static const madvise_func madvise_funcs[] = {
> +	[DRM_XE_VMA_ATTR_PREFERRED_LOC] = madvise_preferred_mem_loc,
> +	[DRM_XE_VMA_ATTR_ATOMIC] = madvise_atomic,
> +	[DRM_XE_VMA_ATTR_PAT] = madvise_pat_index,
> +	[DRM_XE_VMA_ATTR_PURGEABLE_STATE] = madvise_purgeable_state,
> +};
> +
> +static void xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end, u8 *tile_mask)
> +{
> +	struct drm_gpusvm_notifier *notifier;
> +	struct drm_gpuva *gpuva;
> +	struct xe_svm_range *range;
> +	struct xe_tile *tile;
> +	u64 adj_start, adj_end;
> +	u8 id;
> +
> +	lockdep_assert_held(&vm->lock);

lockdep_assert_held_write

> +

	/* Waiting on pending binds */

> +	if (dma_resv_wait_timeout(xe_vm_resv(vm), DMA_RESV_USAGE_BOOKKEEP,
> +				  false, MAX_SCHEDULE_TIMEOUT) <= 0)
> +		XE_WARN_ON(1);
> +
> +	down_write(&vm->svm.gpusvm.notifier_lock);
> +

xe_svm_notifier_lock

> +	drm_gpusvm_for_each_notifier(notifier, &vm->svm.gpusvm, start, end) {
> +		struct drm_gpusvm_range *r = NULL;
> +
> +		adj_start = max(start, notifier->itree.start);
> +		adj_end = min(end, notifier->itree.last + 1);
> +		drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end) {
> +			range = to_xe_range(r);
> +			for_each_tile(tile, vm->xe, id) {
> +				if (xe_pt_zap_ptes_range(tile, vm, range)) {
> +					*tile_mask |= BIT(id);
> +					range->tile_invalidated |= BIT(id);
> +				}
> +			}
> +		}
> +	}
> +
> +	up_write(&vm->svm.gpusvm.notifier_lock);
> +

xe_svm_notifier_unlock

> +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
> +		struct xe_vma *vma = gpuva_to_vma(gpuva);
> +
> +		if (xe_vma_is_cpu_addr_mirror(vma))
> +			continue;
> +
> +		if (xe_vma_is_userptr(vma)) {
> +			WARN_ON_ONCE(!mmu_interval_check_retry
> +				    (&to_userptr_vma(vma)->userptr.notifier,
> +				     to_userptr_vma(vma)->userptr.notifier_seq));
> +
> +			WARN_ON_ONCE(!dma_resv_test_signaled(xe_vm_resv(xe_vma_vm(vma)),
> +							     DMA_RESV_USAGE_BOOKKEEP));
> +		}
> +
> +		if (xe_vma_bo(vma))
> +			xe_bo_lock(xe_vma_bo(vma), false);
> +

Do you need the BO's dma-resv lock here? I don't think you do. Maybe double
check with Thomas on this one as I could be forgeting something here. 

> +		for_each_tile(tile, vm->xe, id) {
> +			if (xe_pt_zap_ptes(tile, vma))
> +				*tile_mask |= BIT(id);
> +		}
> +
> +		if (xe_vma_bo(vma))
> +			xe_bo_unlock(xe_vma_bo(vma));
> +	}
> +}
> +
> +static void xe_vm_invalidate_madvise_range(struct xe_vm *vm, u64 start, u64 end)
> +{
> +	struct xe_gt_tlb_invalidation_fence
> +		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
> +	struct xe_tile *tile;
> +	u32 fence_id = 0;
> +	u8 tile_mask = 0;
> +	u8 id;
> +
> +	xe_zap_ptes_in_madvise_range(vm, start, end, &tile_mask);
> +	if (!tile_mask)
> +		return;
> +
> +	xe_device_wmb(vm->xe);
> +

We have the below pattern in a few places in the driver. I wonder if it
time for a helper?

> +	for_each_tile(tile, vm->xe, id) {
> +		if (tile_mask & BIT(id)) {
> +			int err;
> +
> +			xe_gt_tlb_invalidation_fence_init(tile->primary_gt,
> +							  &fence[fence_id], true);
> +
> +			err = xe_gt_tlb_invalidation_range(tile->primary_gt,
> +							   &fence[fence_id],
> +							   start,
> +							   end,
> +							   vm->usm.asid);
> +			if (WARN_ON_ONCE(err < 0))
> +				goto wait;
> +			++fence_id;
> +
> +			if (!tile->media_gt)
> +				continue;
> +
> +			xe_gt_tlb_invalidation_fence_init(tile->media_gt,
> +							  &fence[fence_id], true);
> +
> +			err = xe_gt_tlb_invalidation_range(tile->media_gt,
> +							   &fence[fence_id],
> +							   start,
> +							   end,
> +							   vm->usm.asid);
> +			if (WARN_ON_ONCE(err < 0))
> +				goto wait;
> +			++fence_id;
> +		}
> +	}
> +
> +wait:
> +	for (id = 0; id < fence_id; ++id)
> +		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
> +}
> +
> +static int input_ranges_same(struct drm_xe_madvise_ops *old,
> +			     struct drm_xe_madvise_ops *new)
> +{
> +	return (new->start == old->start && new->range == old->range);
> +}
> +
> +int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *file)

Kernel doc.

> +{
> +	struct xe_device *xe = to_xe_device(dev);
> +	struct xe_file *xef = to_xe_file(file);
> +	struct drm_xe_madvise_ops *advs_ops;
> +	struct drm_xe_madvise *args = data;
> +	struct xe_vm *vm;
> +	struct xe_vma **vmas = NULL;
> +	int num_vmas, err = 0;
> +	int i, j, attr_type;
> +
> +	if (XE_IOCTL_DBG(xe, args->num_ops < 1))
> +		return -EINVAL;
> +
> +	vm = xe_vm_lookup(xef, args->vm_id);
> +	if (XE_IOCTL_DBG(xe, !vm))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, !xe_vm_in_fault_mode(vm))) {

Do we want to restrict this fault mode? Maybe check with Mesa if they
see any use cases.

> +		err = -EINVAL;
> +		goto put_vm;
> +	}
> +
> +	down_write(&vm->lock);
> +
> +	if (XE_IOCTL_DBG(xe, xe_vm_is_closed_or_banned(vm))) {
> +		err = -ENOENT;
> +		goto unlock_vm;
> +	}
> +
> +	if (args->num_ops > 1) {
> +		u64 __user *madvise_user = u64_to_user_ptr(args->vector_of_ops);
> +
> +		advs_ops = kvmalloc_array(args->num_ops, sizeof(struct drm_xe_madvise_ops),
> +					  GFP_KERNEL | __GFP_ACCOUNT |
> +					  __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
> +		if (!advs_ops)
> +			return args->num_ops > 1 ? -ENOBUFS : -ENOMEM;
> +
> +		err = __copy_from_user(advs_ops, madvise_user,
> +				       sizeof(struct drm_xe_madvise_ops) *
> +				       args->num_ops);
> +		if (XE_IOCTL_DBG(xe, err)) {
> +			err = -EFAULT;
> +			goto free_advs_ops;
> +		}
> +	} else {
> +		advs_ops = &args->ops;
> +	}
> +
> +	for (i = 0; i < args->num_ops; i++) {
> +		xe_vm_alloc_madvise_vma(vm, advs_ops[i].start, advs_ops[i].range);
> +
> +		vmas = get_vmas(vm, &num_vmas, advs_ops[i].start, advs_ops[i].range);
> +		if (!vmas) {
> +			err = -ENOMEM;
> +			goto unlock_vm;
> +		}
> +
> +		attr_type = array_index_nospec(advs_ops[i].type, ARRAY_SIZE(madvise_funcs));
> +		err = madvise_funcs[attr_type](xe, vm, vmas, num_vmas, advs_ops[i]);
> +
> +		kfree(vmas);
> +		vmas = NULL;
> +
> +		if (err)
> +			break;
> +	}
> +
> +	for (i = 0; i < args->num_ops; i++) {
> +		for (j = i + 1; j < args->num_ops; ++j) {
> +			if (input_ranges_same(&advs_ops[j], &advs_ops[i]))
> +				break;
> +		}

The above loop doesn't look like it actually does anything.

Matt

> +		xe_vm_invalidate_madvise_range(vm, advs_ops[i].start,
> +					       advs_ops[i].start + advs_ops[i].range);
> +	}
> +free_advs_ops:
> +	if (args->num_ops > 1)
> +		kvfree(advs_ops);
> +unlock_vm:
> +	up_write(&vm->lock);
> +put_vm:
> +	xe_vm_put(vm);
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h b/drivers/gpu/drm/xe/xe_vm_madvise.h
> new file mode 100644
> index 000000000000..c5cdd058c322
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_VM_MADVISE_H_
> +#define _XE_VM_MADVISE_H_
> +
> +struct drm_device;
> +struct drm_file;
> +
> +int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
> +			struct drm_file *file);
> +
> +#endif
> -- 
> 2.34.1
> 
