Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DB8CA0EFF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 03:37:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD14F10E06F;
	Wed, 27 Aug 2025 03:37:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Aq3NnZxf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1D210E274
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 03:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756265865; x=1787801865;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/PG8cOZdZCAB0wblvpsUUSZlHakpqaZysf3ZLKUWhhg=;
 b=Aq3NnZxfci5qOvLSV7Y2pHYXZbDrSz1X8/S3Jk0pg2hsF7d/HreSiLXb
 eOxeqYnf62ADVpzTmRu34YlPptuq1w9CmnFEPD6GuSf0qRL+4ISwT6fLa
 aMVeMq/1T3cKwwVa2lehor42BASeZUVc/9B7acRfK2gd8kP7EdLe0BAIz
 2zMnzia+S1EROuayuw7CcMls4JBxMEjksqFu0BhshtoSqkIEZ4Z1tRnaC
 XdY0I/ZZz9en3aTRDPdgF9lDvgKFDjNITigMh7Ir4bRksGVoXeYgL1fEu
 KuQOJWtW5wE+5Jx7hn9ZnOF2974KBuSy3a14T8TuGJo4gpP2k+WBZMoJp A==;
X-CSE-ConnectionGUID: iF+xn6ELRJSjXrvGgtVbQg==
X-CSE-MsgGUID: OAMqOq5+TiSyKlnk0Lbzfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="69884286"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="69884286"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 20:37:44 -0700
X-CSE-ConnectionGUID: klZyd2NQR5C0lg2Uc/6i2w==
X-CSE-MsgGUID: QvjBFy71QMy3ixigqYuQ5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="206903911"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 20:37:44 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 20:37:43 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 26 Aug 2025 20:37:43 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.86)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 20:37:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l8wBed9TPYMEmTSNOZTbt9chQy2ahRBOWEHJPwN81H81wN966dOxrWLGhSC3lPSsMtidxYRB61eWVVqfsNHEXhA83cK+kFJIB/w1aMJSVLkpxNsl9ICYOLWNmsKjZ5qZwSRJYRHFG3YCCpO/rxgbvtU/DpmkCYoLwT7+iWlitlPGvdnKHsleRL4/V41c9bKHXdvpIbGKDSXaL9vM04sDg3ZHictwLxkE0b/kBWx0xEzkgxoH8AaPeqR2bsgHQZqBFs9Ck7+DAV2/Viw+2ZiDAQIpmcDVjjYx0w+xQL5Ft57AsYFXTSG5gb/DPihm+JK6a4kgVXJPkzyNtGJTragzQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WWYat+y8P+8KZysLvtSr2rKGgbvA6rzcrphiqyVk7gc=;
 b=JNn94XuzHfTsOKWrZhsRWSK99syAv7i/4bdjgPUo2z5rseiqjvY1mPhe6lBUZM24PQZluSf7t7A9KQChzWJ1VvmF50lUMerF4tFTNVErq9VbaIRW2eK9EVeih6NdnhKlsAxpkGvkJ7RNpvqxf2M4HLjKOWUuCxJB/JpQPms+JIqzMIpKAxqNBPb63duIbxxZPvF4YTikGT8a9tOrKmBvQ3E/wKGFLm+cFVafWP2eWTJyi1VlTvyh2+zhtew6h+9UDcmzth195TJeGN9wjTvFH8qHK7sp384CJiuqWc60lgvQc8Mu67uhfNeghHxDEEDrv0ydBQxuotSgnXCv6YqyFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA4PR11MB9231.namprd11.prod.outlook.com (2603:10b6:208:560::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 27 Aug
 2025 03:37:36 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 03:37:36 +0000
Date: Tue, 26 Aug 2025 20:37:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <john.c.harrison@intel.com>
Subject: Re: [PATCH v3 2/3] Revert "drm/xe: Add VM bind IOCTL error injection"
Message-ID: <aK59fKVcrZEbeco1@lstrano-desk.jf.intel.com>
References: <20250826205758.235606-5-jonathan.cavitt@intel.com>
 <20250826205758.235606-7-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250826205758.235606-7-jonathan.cavitt@intel.com>
X-ClientProxiedBy: SJ0PR03CA0246.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::11) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA4PR11MB9231:EE_
X-MS-Office365-Filtering-Correlation-Id: 26e06a6a-8ad4-43bf-613a-08dde51b1066
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wXfwvc+Vm69RTSVcnV7NA4Em2L2bXeAp7t9kuabbz8K9z9ch/1FL9Psv/vj6?=
 =?us-ascii?Q?LhH/XGbcl6Oz8x9ffrWeqhirqAR3kR14aPg2KFVKLhsuW3Lh/N3O4OZ5qOMH?=
 =?us-ascii?Q?WN4Nd5XIVGj8OgsaWp12GZiAoyLhinsdzI/Au9JB2mRPp0JnUbrKGV9Oypkh?=
 =?us-ascii?Q?tiuGxtUIxJPhKkQCSinNnH95PeYiHyg+a8710wiX2bHjhjVK8h72aa8Os87m?=
 =?us-ascii?Q?Rq6AJXoUvBzqHXZq89j6JnLG1ZIs4hwHitc73qdWajdqrQ2ro5Nx7di8zraW?=
 =?us-ascii?Q?VXtCVmeXLZ/YYhWpYrWxvi0DOt3v4Vixgi8KlLFGiwKr/53viFDP3iuVdFOy?=
 =?us-ascii?Q?tORloG68vAjs6tVu+5+O3j6pk3WHD2567T0p20aoV04XuEwTDymk7KFdqJbY?=
 =?us-ascii?Q?DxlQPlw7xfw1gMrdLMQQaSl4lV3RfHwfqwR8HEkdU4R0eGUMC1Nbdi73ICrF?=
 =?us-ascii?Q?BHV9GyR7bFfmUSZzolBIRgLXjn7V12KeRV4zSVZRa4aIyqgK+yER/WRmanRQ?=
 =?us-ascii?Q?dC75YDDHtCslpyGAbkDCI2/3GFlqSicsbdePhIoyRQ6fDtqfE1hUknl2WVz8?=
 =?us-ascii?Q?caDUIOUQiBUU4orY/rja0/162G+qE6wWrC7nwWGEf5/OGW1izIbOnKCSbG2B?=
 =?us-ascii?Q?HvELNDak+5bCg72ZrLmxpnIlaucO8IggsnvLFSEaXIiKMYakN30h1ZckWKNZ?=
 =?us-ascii?Q?FAHUPObF+ad/7oTtgh2EkFgmfD7AMzCPqpMht3OlGXgrIS6rPmu5OFfSoTIP?=
 =?us-ascii?Q?wntEGNFCuCiv9TNq6qpbrhg/5B3Qi7A/SrtuX5P196jbbDJ1Lcf2IfOIMP8z?=
 =?us-ascii?Q?FgObKnykfSAaBUsL6jCj2pmWKYpf2vVCYAD08JQOU0Y98og7PvX103fiBA0g?=
 =?us-ascii?Q?U5dOOzphz5wdb2NGu0KSDUgzLwNaiCdkdBl1TNLuCwenpCN4HHgkUYctBvDs?=
 =?us-ascii?Q?zBD0gMRalRh5haI8UZBEk+45V7ztBtD8Buu8xdwa/wGnsntx+E9xnffGS8Yi?=
 =?us-ascii?Q?sk3zf9sxj4tq3pveDXFCNvkFBDpsEqdLoUF1gZeZFZRa2jx2HLzvbWrgOfmb?=
 =?us-ascii?Q?qxu+qqyJ4l4QyX6TbxjHxX2O25X6y1AaMhViRu5NWV/07akSG69RjKRheA2i?=
 =?us-ascii?Q?76WpG+YPN89r2iFM/94aorZnmIBQ9DYVTko/1PB37+WJCi0wFVW1+QNwgokc?=
 =?us-ascii?Q?EluCs7RLQ3Yq6G/sZHGP8exyI9vYhOMTwcSXt0D5OfZzJDL5mLhaT/dv5M50?=
 =?us-ascii?Q?4M9QTrny6wWA5xUVHwJelf+8u3xfe4P2yXWItD79YDZ4Vub66AHtBjNhw9TG?=
 =?us-ascii?Q?nAGbcEH1UowSwzqyClfRegxbbeBwhO3L/wKulsGKDxDi66WbWy6sgxUk1RN6?=
 =?us-ascii?Q?gIMFtLh7vKAC+upMTzn4uquQ0BAIqfzR7L/pooqkAY4d0QJdR1/UqX+h0lLQ?=
 =?us-ascii?Q?ZMjcxlOS9N4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M592Es8vFvP7213JefuLGG37VTcLZNMOEj4uuj2/WO9j7m5yb5jgaUfPYkDp?=
 =?us-ascii?Q?S6NbNAH5q5dChe7lNA/V2pZKRweZCHeFdZZlM6jc4c0psbRnAGbVu5QNzfHU?=
 =?us-ascii?Q?kNYjPwgSEwFLONaIeY2eY6xFG0CilDrRuYg4ItGP6D2VMjIeV3ln4t7c/cyk?=
 =?us-ascii?Q?bzPvm9JkePOZw9PPxolFPBaJHGjnKXydKrbWLiCHJb+2dY59yPQRftqv61LJ?=
 =?us-ascii?Q?j2bAX12cejGci+SwCFCXNo/oaDxZ2J4Ozqkwz/KnGwcSdlJxPOBsAhKlIEsg?=
 =?us-ascii?Q?Ax7mFJr2Yz6e+obW1/xOK+siJLzVCANKuTUGFj5Z0OerRJMrZe1Zx/er88vr?=
 =?us-ascii?Q?RHuAGjpBY5Xupc8nRW65FUsFnohsgYYjX1ljjoTc+KbFD3Q9ureESYumdl4w?=
 =?us-ascii?Q?Y7whw3cqHkOvzLu6L4FFqhoCg3bY71/EGzTKe4LudR2NR2DsiidOFAks3Hlt?=
 =?us-ascii?Q?dXiqsg69+TWiy7dVPspjWO9+SucwFdN6XMjIhdpQcBE3fr05K0b7MgndonYC?=
 =?us-ascii?Q?u03h56ZneObMrjSR+tI50LdyWifCV3EtKFgRG1eHzijXu6m6CjiCVRUtZ5Xr?=
 =?us-ascii?Q?J+vexKOZLssQyvA02MlJZUbw/tfWqXietAfCBDTD7VOupoNFftQJ5DewwL9j?=
 =?us-ascii?Q?70oaf4BGi+yS3p/m7Bw7nj1ZO+9SRpzaUyXin6xEuAhOCJ8QLZphfEnrGb+R?=
 =?us-ascii?Q?vtO+zch0Y7bNi985oLo/om+ajl846djyZIm9jwOkIrdfOJ32KKxCMI9GyRA5?=
 =?us-ascii?Q?v9gG2bDPLfXivAK2zSEJ0jbqn2W+58ZXJjSHJZ2M2vq5nqWQSdM+0v7mIO2X?=
 =?us-ascii?Q?cWL9Q8d0+D9p3isC5XkeFedpZoYeurF/iTV9Ddof5NaZYEVk72BFYRP8+U/K?=
 =?us-ascii?Q?EwPMbQ6IVtaZ6PiXM2D510yfXzWkVUvat6oMpIGtYMpkVwzWojF+YPimtS2y?=
 =?us-ascii?Q?9brvj/eWiUaWxH/XmNbzyiQ4su8BlLTKnlT82Q2ot1cCjFcFlYw9Xin2VgbH?=
 =?us-ascii?Q?3R52PeynjkuZsO8PQk3z7t/Gsj1DcmWAGx7nqQEdZcsVkZWKGFwGwhxRaK6d?=
 =?us-ascii?Q?XBCrJVNtpJkykgIfWGLWMfAYwWA1+PHFCZCiej/uPBIllppRm6wKAp3fao6j?=
 =?us-ascii?Q?LDsSx4OPu/ZH8bnz2WHIyvvpRVIImkLgiMKjUiTML/7kBXQvfbil+QW/Zcj1?=
 =?us-ascii?Q?zUV/1KcvbxMRWCS8Qn4qkHvdPhMG+mtnhLMOj6TyjBEJIcdw9uHFGNxRbYej?=
 =?us-ascii?Q?Qe8zDOZFfwBGFYhpntP5SrufbUNFkuk3i24tKICo/4CNaY8A2cB427vxaSp/?=
 =?us-ascii?Q?uPDHQKkQh8MDINk2WyCf0CKVWNMnXUoxr9TfkSwYzA4Tgj/dIu0aXnGlt8u1?=
 =?us-ascii?Q?NPHwVB65vkgiRNogVqxtA/7TWR5+D4Drh5xstq56kJecRnriKgI4lMcOSwx2?=
 =?us-ascii?Q?eB6Gzn853zBgw57+N/bvJKVkJSJGQrhQl1qW834KaAXFPVj6xO8fv92wdFBt?=
 =?us-ascii?Q?7/TyNwTyDLM2nGAVfVEd3z+PMFCMUx0Y0NByYDPE7WspSUblB08W6J3qDG+c?=
 =?us-ascii?Q?7hov1PjD8YDJRETYcMeD3DeJRBnSe0o0zf8u/9lc6NAP3k6YE0TlPNssOTO4?=
 =?us-ascii?Q?mQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e06a6a-8ad4-43bf-613a-08dde51b1066
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 03:37:36.0156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lAczwXe8u0VM01/2+atN7Gq6+OE+X/rFud35vKY627tLEEanZCrjrim0PYZxysh520NpmgEddbWJsl+ti3vUAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9231
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

On Tue, Aug 26, 2025 at 08:58:01PM +0000, Jonathan Cavitt wrote:
> This reverts commit 04e9c0ce19ac68afd8be7fd54772db3b0356cf75.
> 
> Error injection should use the error injection interface, and should be
> decoupled from CONFIG_DRM_XE_DEBUG.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Responding to the correct version.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 12 ------------
>  drivers/gpu/drm/xe/xe_pt.c           | 12 ------------
>  drivers/gpu/drm/xe/xe_vm.c           | 23 +----------------------
>  drivers/gpu/drm/xe/xe_vm_types.h     | 14 --------------
>  4 files changed, 1 insertion(+), 60 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 71fc29b3372a..42a7d910ca70 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -27,10 +27,6 @@
>  #include "xe_step_types.h"
>  #include "xe_survivability_mode_types.h"
>  
> -#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> -#define TEST_VM_OPS_ERROR
> -#endif
> -
>  struct dram_info;
>  struct intel_display;
>  struct intel_dg_nvm_dev;
> @@ -565,14 +561,6 @@ struct xe_device {
>  	/** @atomic_svm_timeslice_ms: Atomic SVM fault timeslice MS */
>  	u32 atomic_svm_timeslice_ms;
>  
> -#ifdef TEST_VM_OPS_ERROR
> -	/**
> -	 * @vm_inject_error_position: inject errors at different places in VM
> -	 * bind IOCTL based on this value
> -	 */
> -	u8 vm_inject_error_position;
> -#endif
> -
>  #if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
>  	/**
>  	 * @global_total_pages: global GPU page usage tracked for gpu_mem
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index f1313d50f297..f9f54700ae1d 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -2160,12 +2160,6 @@ error_injectable int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vm
>  	xe_tile_assert(tile, pt_update_ops->current_op <=
>  		       pt_update_ops->num_ops);
>  
> -#ifdef TEST_VM_OPS_ERROR
> -	if (vops->inject_error &&
> -	    vops->vm->xe->vm_inject_error_position == FORCE_OP_ERROR_PREPARE)
> -		return -ENOSPC;
> -#endif
> -
>  	return 0;
>  }
>  ALLOW_ERROR_INJECTION(xe_pt_update_ops_prepare, ERRNO);
> @@ -2396,12 +2390,6 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>  		return dma_fence_get_stub();
>  	}
>  
> -#ifdef TEST_VM_OPS_ERROR
> -	if (vops->inject_error &&
> -	    vm->xe->vm_inject_error_position == FORCE_OP_ERROR_RUN)
> -		return ERR_PTR(-ENOSPC);
> -#endif
> -
>  	if (pt_update_ops->needs_invalidation) {
>  		ijob = xe_gt_tlb_inval_job_create(pt_update_ops->q,
>  						  tile->primary_gt,
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 9cbe1256439d..ce8a35418357 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3218,12 +3218,6 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
>  			return err;
>  	}
>  
> -#ifdef TEST_VM_OPS_ERROR
> -	if (vops->inject_error &&
> -	    vm->xe->vm_inject_error_position == FORCE_OP_ERROR_LOCK)
> -		return -ENOSPC;
> -#endif
> -
>  	return 0;
>  }
>  
> @@ -3467,7 +3461,7 @@ static error_injectable struct dma_fence *vm_bind_ioctl_ops_execute(struct xe_vm
>  }
>  ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
>  
> -#define SUPPORTED_FLAGS_STUB  \
> +#define SUPPORTED_FLAGS	\
>  	(DRM_XE_VM_BIND_FLAG_READONLY | \
>  	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
>  	 DRM_XE_VM_BIND_FLAG_NULL | \
> @@ -3475,12 +3469,6 @@ ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
>  	 DRM_XE_VM_BIND_FLAG_CHECK_PXP | \
>  	 DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR)
>  
> -#ifdef TEST_VM_OPS_ERROR
> -#define SUPPORTED_FLAGS	(SUPPORTED_FLAGS_STUB | FORCE_OP_ERROR)
> -#else
> -#define SUPPORTED_FLAGS	SUPPORTED_FLAGS_STUB
> -#endif
> -
>  #define XE_64K_PAGE_MASK 0xffffull
>  #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
>  
> @@ -3863,15 +3851,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		err = vm_bind_ioctl_ops_parse(vm, ops[i], &vops);
>  		if (err)
>  			goto unwind_ops;
> -
> -#ifdef TEST_VM_OPS_ERROR
> -		if (flags & FORCE_OP_ERROR) {
> -			vops.inject_error = true;
> -			vm->xe->vm_inject_error_position =
> -				(vm->xe->vm_inject_error_position + 1) %
> -				FORCE_OP_ERROR_COUNT;
> -		}
> -#endif
>  	}
>  
>  	/* Nothing to do */
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index b5108d010786..a7a9e80777f3 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -25,16 +25,6 @@ struct xe_user_fence;
>  struct xe_vm;
>  struct xe_vm_pgtable_update_op;
>  
> -#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> -#define TEST_VM_OPS_ERROR
> -#define FORCE_OP_ERROR	BIT(31)
> -
> -#define FORCE_OP_ERROR_LOCK	0
> -#define FORCE_OP_ERROR_PREPARE	1
> -#define FORCE_OP_ERROR_RUN	2
> -#define FORCE_OP_ERROR_COUNT	3
> -#endif
> -
>  #define XE_VMA_READ_ONLY	DRM_GPUVA_USERBITS
>  #define XE_VMA_DESTROYED	(DRM_GPUVA_USERBITS << 1)
>  #define XE_VMA_ATOMIC_PTE_BIT	(DRM_GPUVA_USERBITS << 2)
> @@ -512,10 +502,6 @@ struct xe_vma_ops {
>  #define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH BIT(0)
>  #define XE_VMA_OPS_FLAG_MADVISE          BIT(1)
>  	u32 flags;
> -#ifdef TEST_VM_OPS_ERROR
> -	/** @inject_error: inject error to test error handling */
> -	bool inject_error;
> -#endif
>  };
>  
>  #endif
> -- 
> 2.43.0
> 
