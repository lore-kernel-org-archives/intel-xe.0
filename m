Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B13C3ABD8
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 19:38:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B5B10E63B;
	Wed, 14 May 2025 19:38:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G1YIa8Qk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3403F10E63B
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 19:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747251511; x=1778787511;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IkCH4tQol1ssvGY0zAjiuKZ4HfRPcYtdPnzIlGxb1HU=;
 b=G1YIa8Qkhz3dPQJDZR7l3IJR4uKcmUTupRUgVRPOQTZdkXE4hwqaTQvL
 f3XoJw5rm9QdTXcJzILHfdFneQ3XqSQO+xSUMlUz5bXIKr35IbtkYkLR+
 asFPNGdel9ieGfpdkJVx2idIZJXdUuoJF48WCJaI+wAIiy0ksadHTveGl
 +XiPirPIjqpPoYtWBcn11EDnfUczFu//hj50p/n0aPXeLmsOWkMT6v02a
 i3dke3JmcnqMuNxfIik6FX8owzF8RqB1HlSp6dr2oxhFEBUi7sWPQHika
 cBc0w7Sr0wR1ylhtnlUWJYiTk7qKkYTRx7ZEAdx5z5szrKoDOLUElyqAl A==;
X-CSE-ConnectionGUID: n6KEC7clTOqjKTC+1tmVvg==
X-CSE-MsgGUID: Vx2giEd4R5yjshu+eSirtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="51807177"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="51807177"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 12:38:30 -0700
X-CSE-ConnectionGUID: 9YYaAhIIQIe3SxWGe90t1g==
X-CSE-MsgGUID: S4hbsF5CStOKawFVq7rdkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="138016539"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 12:38:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 12:38:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 12:38:29 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 12:38:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yVzuqwbpfSeXG69dWMmII28koWRMMBTJdar+199OTgY1T1NWl+bMR0WYvYi30CvPxty3PpzwPG6E9i7xSErog7zhaT2xMf/2tuAWg3WgJ//5pLGiyMfrTewZ6K4F4u5Z4iqNQouUmV+xUnb+FQJFf4mR8m6yLYLhnFN9g5Mw04R2FL+PJOjEzF82wY1ekdXBEDYSe9agPrV9eZgwbIsEtdv52rFfL39icRyXGLptRwpXkFt6NVJfrImj/KFhVrYG2TcESsaPw53h7Q8n/GR2rduD5U6jNmeWWvQ1rCR5nnu4Klq55u81xumth8sKjZ0UDTtHlSWKBtsiqeFprBWJCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S9cXJZjSjFweDKqaMRphcNXw00dQHb9Lm0j3hlyC8+g=;
 b=JfqtHnVMJVo7QY8PfwnvtP0ie2GbSZTvzPx3hhpfnOxCe4R2qrBl4O+wIaEHbk/fS093vZfF6vq63yMsUETqDDwXKb3Adj56N/jmLH1W67fbmmAr4D+pWso0zlV7JMZw3e8lJKzfOfx0NPts3dCtwzi0CRM2jcZXXTRY9sgDJ4nrcEVRYc9L+PwHSBI72tfAWRAkLesPIzuv5Ev4N3PA5vIy32HPX3++dgIm7fvTbEPneY48SrBg/7DXQXbUfjEyzhf92oiR2W1iZ4huNGLjAS5VLGbB3kIMRE9ELYwricmc0PewB8fOoO1gMy+P9ssT1K4m9Wh1+5jaEqvqGuTqdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4765.namprd11.prod.outlook.com (2603:10b6:806:9b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Wed, 14 May
 2025 19:38:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Wed, 14 May 2025
 19:38:07 +0000
Date: Wed, 14 May 2025 12:39:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <oak.zeng@intel.com>
Subject: Re: [RFC 27/29] drm/xe/uapi: Add uapi for vma count and mem attributes
Message-ID: <aCTxdsdjAjH+F3Ax@lstrano-desk.jf.intel.com>
References: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
 <20250314080226.2059819-28-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250314080226.2059819-28-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0376.namprd04.prod.outlook.com
 (2603:10b6:303:81::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4765:EE_
X-MS-Office365-Filtering-Correlation-Id: a10af4a0-2e3c-44fd-d12c-08dd931eda21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QEHAo6tzDqWz54l5EdSB2dYKvQRaf5j5yACpFC25kt6+tGwZORfZj4+vWviX?=
 =?us-ascii?Q?qu/D53kTIAfcbs4TYNDiU+Y0H1gw7hptgKt5ZrOuhYYAmzCCyPmFcDiCfX02?=
 =?us-ascii?Q?QI2q6ttzxMkEJOtpGGoqcDClSRUznLqHS5bMtvAQ6wHmBVtOTQNt/Ra5/n3C?=
 =?us-ascii?Q?P7FfKXaUGdgTnJf/qMZBtqWkymw1ECnhQuzphjubamP9CBuT8BF2c4g/bCxk?=
 =?us-ascii?Q?GL6VGCv98FOXwHQOtlayBjZqkKoEO5/C3vHo1NV/ekkDabvXBemiOHMiPB0L?=
 =?us-ascii?Q?4r5L0V2NVwcMKRcibPSMwgUKG0wnGW2p6EEJ14yV9NWCGpcX7W+/MYb4wlWi?=
 =?us-ascii?Q?zicNGKwfMsczZqVdD/vEcuC3bodP+xUaq/XIOBTfZ009zpCEMr1gvunbGWY+?=
 =?us-ascii?Q?6RAWyhr0zD/kC7xLQB6jkzbwg5BM0sStQEwroEf7nMS5afPlm3uYIQXImY16?=
 =?us-ascii?Q?i59jBtiT2rKy82S0uRBu421Zs1WV/LkgsHgbPzL0mjWCHiJUQLO8F9ZpExbZ?=
 =?us-ascii?Q?2TySU0QbJ6UiXfY6D49oM0CN7/KMumsJ0ICvRAaSbv7IoZ1DTUP7SSvl3mEa?=
 =?us-ascii?Q?gG6KIu3og4GQCCe2xm0xAjzbJDw/UMIOKL+vFdkq7jMNjofwccEtToqsr/ph?=
 =?us-ascii?Q?10XvIH6tPTNXtflZWratuAisgO+lwxAY2H1gRFSrsRphxKY69rCaZkx/iUQb?=
 =?us-ascii?Q?h01xS3oxt9wTu8/hjbjbxSRUDG5HRwSPIoi0YcOoYWQTgm5oCXJ9Aq9TKqWT?=
 =?us-ascii?Q?2oLYmcZswplsgxAZvWlsPjRxbLMOTdtNVT4CTqoVYrOGkMJY7S8ScjGjL57K?=
 =?us-ascii?Q?hSKB5nZ++zB06QQMzKympjM8jWcMgWrpBwEkaKE06KmzHHxWF4/SMwAlmDWE?=
 =?us-ascii?Q?imn1pLNLNfveKPMqnLJAV5BBVsnVqxjYTP4IxLi6Q7PpmrN5rw1re4GegTgc?=
 =?us-ascii?Q?T4q2/V30ahUDC8YQpe9ZKz9InQdIxoUANP1+rx/WgETaAMHGFkwZGS+9iDed?=
 =?us-ascii?Q?OfA21mgq3gnRLPtELryaceOzv1FW14XTtdTGsajjod5CMHlYBwm5HGQDxsSW?=
 =?us-ascii?Q?xgXlGKklHsmY4DNTwPPdSb2ccczfTeT+w1RMtsa7/8KODeLWr7qLz6xc004/?=
 =?us-ascii?Q?vMy7lfqVqucZ6m3wuEOvFcHgzw+pMhhha0axxW1E4Yt1JzqIRlW4Gq6t2Zz8?=
 =?us-ascii?Q?lUbNl08dS0tw86CDXWq99Q2W4Ynmuk5sXQo8JU1HD29pMRnPIlUSlxcFnNji?=
 =?us-ascii?Q?/I7AY4K06lgvXv79HTrKlSyVSNsUjhgie3PXM3wFy5/uPA2yfb0sv1MTy+sE?=
 =?us-ascii?Q?CRC0oED4uGCIOePKUHuhNmbUvkhH3tw5Hut3MoErAnFVBqyjYyNFLg5UD3Ar?=
 =?us-ascii?Q?iDygjB8XBSgOeApGsWZNXdRQhThp7V/qWoZMOdvJ1LAA7U9BNHV6hrJCODdh?=
 =?us-ascii?Q?J2+uPe+t72E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fzFjo7kc5PsYhBlGMTQM7A6i0dxVA7pW/sik5PBZsUcq1zWrKHSyRBVYXV/K?=
 =?us-ascii?Q?/FQ+LHXj/uPDQzwvEuZvuIBnpmvAFBLLfUF9g1i7tTQ8fA3TF8NYDbmrbEjg?=
 =?us-ascii?Q?V8r5bMGGVsjzydbB671kGlA4o0fTnfpjvJC3yeGv1JN7DweiMKsjIQa4xN17?=
 =?us-ascii?Q?NbbwJ4aCqbw+R8oaCl/XUU9bj2KHsadPQpGe/SNFZ1dH4yKItWs5HMpbfO8W?=
 =?us-ascii?Q?thjJeSvruZSOLhfIyu/U7mB9OV58s1zQbQH1qhTJ3a7i6Co2MmDcPNOtCjX9?=
 =?us-ascii?Q?rBrK/9du388HB3O6d0T/bSs8CNlvonj4DDTrBc7xZMxIAoSyjyS9Yo8qPQWn?=
 =?us-ascii?Q?e2kk9JoK/Ll0e7Hj8sc7+hXm9FNeinVNTRqOeXoxOKpq66czF1LifGCM9src?=
 =?us-ascii?Q?XhUZVFKai5B7V/X8ByEP2REysJza+bmsXOpljhZ/Nu6Lpwn0ieow1S2vHohe?=
 =?us-ascii?Q?USpyufN4Hu5Co4hhuCVyCA9PZFooMh1WXlyQ7ow7hsBkWXtdZrFCaDBVQ0I7?=
 =?us-ascii?Q?gi8f6mHZncpvNXN0DNGSdVSykIHrqN+lDzvFwurqab4GbHibXycWFkxk7Puk?=
 =?us-ascii?Q?xwciY6hMYmvAeDZ4iaKHdNHyo5BztdssFENKo98UQ7wQAsNRe9iGEJAeCql0?=
 =?us-ascii?Q?JsTyIrD+DKTwPwrWOmypBzqCelaUQjcsgQo2922vGILiQ4lr9VBsihfRkijR?=
 =?us-ascii?Q?Pps0JLHz9Lu9+5buV0j8uLi9+TLYbKbos1imQkOd+1sLq2WgmshMKjc9sMAQ?=
 =?us-ascii?Q?A7Om1RyHKKAgFvE4ia4n3O/vnlr4APsvHEwH4i3PXTyaa5QrgyqO+oEvko03?=
 =?us-ascii?Q?uQc2/58JtMdqEdj0GEk/GJOdbMjdGzN6PJIhzxdrFBoHedq+g+Ln2Lzzr+nw?=
 =?us-ascii?Q?gEz0xelw748u3zFsVedcZHLqyO5hpTEViPEc1I0ZJOrJurmW1Uxt0N2LmckP?=
 =?us-ascii?Q?OfzopTd3tWe0dw0PPOJhZljHzaKmiOjAVZtvSXAKYsG8e4b5wWYaeGCWkxVj?=
 =?us-ascii?Q?YBWLcZxYQe79lHE7ntGVIcvxz/hEZ/SjeeWo39FKkndOPtfeJ9eGoxtiIWrd?=
 =?us-ascii?Q?4HBNqgmDkeuIiL8KNo9nEpaAOZ+vOFdJwg/3v1q/ozqZucLOFwfae/UwDBpr?=
 =?us-ascii?Q?v3DqtbguSzRxaN8FxJE1QHFqvAHk4UFcMq9Ei1JHlkLgjWZzb88HaeWyGkdJ?=
 =?us-ascii?Q?2X+JevUoHURhH62uOfBby2NCzgc9hxkIsoH2O7jHcL2jrgLt0kaR1e2LoPx6?=
 =?us-ascii?Q?dhDQqex6X+OuKJbIeSvsQtBiSNHih8Fzxv3Rfzw+6M1su37NwQqd7TBjOnhv?=
 =?us-ascii?Q?xWBotRsjEx8Hec4z2iAyvFvpZL/W3Mh6UgHevP1JuPCUAAXK9poul6cjwl8J?=
 =?us-ascii?Q?WKWLDmcp6Gz9XAepUAgXfx7RpGDAObw3XhZiPyv9kjyW4S8XJJ5gy+5U/LqI?=
 =?us-ascii?Q?JOjc69IDES0+zGq6PYwyVB6+xNKwYjjHJlyFFiSsKGrvrhuxi3/+PjQBsc2Y?=
 =?us-ascii?Q?1zKorNgQH7ioqVAUrvuPrjjWB8kOW/eANdUEuWJMsh7Rb8JZ3ZmGGpnrdxtb?=
 =?us-ascii?Q?3mcodSCdBTGZxY98zXMQ2sWQJjcfZ9LUCFfC54bIpx0ruGBRzVwwo8INaZjH?=
 =?us-ascii?Q?Uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a10af4a0-2e3c-44fd-d12c-08dd931eda21
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 19:38:07.5762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SPemBSucjd9iPtnGCRjNC5lyVtyQDa1e/n6wY4GU2KokDexQBvc3gqKRIRbb4DwuThZuO6bYK61yN8ZVLniwsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4765
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

On Fri, Mar 14, 2025 at 01:32:24PM +0530, Himal Prasad Ghimiray wrote:
> -DRM_IOCTL_XE_VM_QUERY_VMAS: Return number of VMAs in user-specified range.
> -DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS: Fill VMA attributes in user-provided
>  buffer.
> 

I can't remember if landed on if this needed? I thought the answer was,
no not needed.

If it is needed could be make this a single IOCTL. e.g. Call in once
with num_vmas == 0 + NULL vector, IOCTL returns num_vmas, then called
again with num_vmas != 0 + non-NULL vector.

Matt

> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c |   2 +
>  drivers/gpu/drm/xe/xe_vm.c     |  94 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h     |   3 +-
>  include/uapi/drm/xe_drm.h      | 115 +++++++++++++++++++++++++++++++++
>  4 files changed, 213 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 91687679cf14..8ad5e5523e38 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -195,6 +195,8 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>  			  DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_VM_QUERY_VMAS, xe_vm_query_vmas_ioctl, DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_VM_QUERY_VMAS_ATTRS, xe_vm_query_vmas_attrs_ioctl, DRM_RENDER_ALLOW),
>  };
>  
>  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 36546c82df06..349481b13546 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2161,6 +2161,100 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
>  	return err;
>  }
>  
> +int xe_vm_query_vmas_ioctl(struct drm_device *dev, void *data,
> +			   struct drm_file *file)
> +{
> +	struct xe_device *xe = to_xe_device(dev);
> +	struct xe_file *xef = to_xe_file(file);
> +	struct drm_xe_vm_query_num_vmas *args = data;
> +	struct drm_gpuva *gpuva;
> +	struct xe_vm *vm;
> +
> +	vm = xe_vm_lookup(xef, args->vm_id);
> +	if (XE_IOCTL_DBG(xe, !vm))
> +		return -EINVAL;
> +
> +	args->num_vmas = 0;
> +	down_write(&vm->lock);
> +
> +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, args->start, args->start + args->range)
> +		args->num_vmas++;
> +
> +	up_write(&vm->lock);
> +	return 0;
> +}
> +
> +static int get_mem_attrs(struct xe_vm *vm, u32 *num_vmas, u64 start,
> +			 u64 end, struct drm_xe_vma_mem_attr *mem_attrs)
> +{
> +	struct drm_gpuva *gpuva;
> +	int i = 0;
> +
> +	lockdep_assert_held(&vm->lock);
> +
> +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
> +		struct xe_vma *vma = gpuva_to_vma(gpuva);
> +
> +		if (i == *num_vmas)
> +			return -EINVAL;
> +
> +		mem_attrs[i].start = xe_vma_start(vma);
> +		mem_attrs[i].end = xe_vma_end(vma);
> +		mem_attrs[i].atomic.val = vma->attr.atomic_access;
> +		mem_attrs[i].pat_index.val = vma->attr.pat_index;
> +		mem_attrs[i].preferred_mem_loc.devmem_fd = vma->attr.preferred_loc.devmem_fd;
> +		mem_attrs[i].preferred_mem_loc.migration_policy = vma->attr.preferred_loc.migration_policy;
> +
> +		i++;
> +	}
> +
> +	if (i <  (*num_vmas - 1))
> +		*num_vmas = i;
> +	return 0;
> +}
> +
> +int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> +{
> +	struct xe_device *xe = to_xe_device(dev);
> +	struct xe_file *xef = to_xe_file(file);
> +	struct drm_xe_vma_mem_attr *mem_attrs;
> +	struct drm_xe_vm_query_vmas_attr *args = data;
> +	u64 __user *attrs_user = NULL;
> +	struct xe_vm *vm;
> +	int err;
> +
> +	if (XE_IOCTL_DBG(xe, args->num_vmas < 1))
> +		return -EINVAL;
> +
> +	vm = xe_vm_lookup(xef, args->vm_id);
> +	if (XE_IOCTL_DBG(xe, !vm))
> +		return -EINVAL;
> +
> +	down_write(&vm->lock);
> +
> +	attrs_user = u64_to_user_ptr(args->vector_of_vma_mem_attr);
> +	mem_attrs = kvmalloc_array(args->num_vmas, sizeof(struct drm_xe_vma_mem_attr),
> +				   GFP_KERNEL | __GFP_ACCOUNT |
> +				   __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
> +	if (!mem_attrs)
> +		return args->num_vmas > 1 ? -ENOBUFS : -ENOMEM;
> +
> +	err = get_mem_attrs(vm, &args->num_vmas, args->start,
> +			    args->start + args->range, mem_attrs);
> +	if (err)
> +		goto free_mem_attrs;
> +
> +	err = __copy_to_user(attrs_user, mem_attrs,
> +			     sizeof(struct drm_xe_vma_mem_attr) * args->num_vmas);
> +
> +free_mem_attrs:
> +	kvfree(mem_attrs);
> +
> +	up_write(&vm->lock);
> +
> +	return err;
> +}
> +
>  static bool vma_matches(struct xe_vma *vma, u64 page_addr)
>  {
>  	if (page_addr > xe_vma_end(vma) - 1 ||
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 377f62f859b7..0b2d6e9f77ef 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -193,7 +193,8 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
>  			struct drm_file *file);
>  int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
>  		     struct drm_file *file);
> -
> +int xe_vm_query_vmas_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
> +int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
>  void xe_vm_close_and_put(struct xe_vm *vm);
>  
>  static inline bool xe_vm_in_fault_mode(struct xe_vm *vm)
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index f30d0cb5b054..68c447db9f2e 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -82,6 +82,8 @@ extern "C" {
>   *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
>   *  - &DRM_IOCTL_XE_OBSERVATION
>   *  - &DRM_IOCTL_XE_MADVISE
> + *  - &DRM_IOCTL_XE_VM_QUERY_VMAS
> + *  - &DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS
>   */
>  
>  /*
> @@ -104,6 +106,8 @@ extern "C" {
>  #define DRM_XE_WAIT_USER_FENCE		0x0a
>  #define DRM_XE_OBSERVATION		0x0b
>  #define DRM_XE_MADVISE			0x0c
> +#define DRM_XE_VM_QUERY_VMAS		0x0d
> +#define DRM_XE_VM_QUERY_VMAS_ATTRS	0x0e
>  
>  /* Must be kept compact -- no holes */
>  
> @@ -120,6 +124,8 @@ extern "C" {
>  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>  #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
>  #define DRM_IOCTL_XE_MADVISE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
> +#define DRM_IOCTL_XE_VM_QUERY_VMAS		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_VMAS, struct drm_xe_vm_query_num_vmas)
> +#define DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_VMAS_ATTRS, struct drm_xe_vm_query_vmas_attr)
>  
>  /**
>   * DOC: Xe IOCTL Extensions
> @@ -2059,6 +2065,115 @@ struct drm_xe_madvise {
>  
>  };
>  
> +/**
> + * struct drm_xe_vm_query_num_vmas - Input of &DRM_IOCTL_XE_VM_QUERY_VMAS
> + *
> + * Get number of vmas in virtual range of vm_id
> + */
> +struct drm_xe_vm_query_num_vmas {
> +	 /** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @vm_id: vm_id of the virtual range */
> +	__u32 vm_id;
> +
> +	/** @num_vmas: number of vmas in range returned in @num_vmas */
> +	__u32 num_vmas;
> +
> +	/** @start: start of the virtual address range */
> +	__u64 start;
> +
> +	/** @size: size of the virtual address range */
> +	__u64 range;
> +
> +	 /** @reserved: Reserved */
> +	__u64 reserved[2];
> +};
> +
> +struct drm_xe_vma_mem_attr {
> +	 /** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @start: start of the vma */
> +	__u64 start;
> +
> +	/** @size: end of the vma */
> +	__u64 end;
> +
> +	struct {
> +		struct {
> +		/** @val: value of atomic operation*/
> +			__u32 val;
> +
> +		/** @reserved: Reserved */
> +			__u32 reserved;
> +		} atomic;
> +
> +		struct {
> +		/** @val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE */
> +			__u32 val;
> +
> +		/** @reserved: Reserved */
> +			__u32 reserved;
> +		} purge_state_val;
> +
> +		struct {
> +			/** @pat_index */
> +			__u32 val;
> +
> +			/** @reserved: Reserved */
> +			__u32 reserved;
> +		} pat_index;
> +
> +		/** @preferred_mem_loc: preferred memory location */
> +		struct {
> +			__u32 devmem_fd;
> +
> +			__u32 migration_policy;
> +		} preferred_mem_loc;
> +	};
> +
> +	 /** @reserved: Reserved */
> +	__u64 reserved[2];
> +};
> +
> +/**
> + * struct drm_xe_vm_query_vmas_attr - Input of &DRM_IOCTL_XE_VM_QUERY_MEM_ATTRIBUTES
> + *
> + * Get memory attributes to a virtual address range
> + */
> +struct drm_xe_vm_query_vmas_attr {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @vm_id: vm_id of the virtual range */
> +	__u32 vm_id;
> +
> +	/** @num_vmas: number of vmas in range returned in @num_vmas */
> +	__u32 num_vmas;
> +
> +	/** @start: start of the virtual address range */
> +	__u64 start;
> +
> +	/** @size: size of the virtual address range */
> +	__u64 range;
> +
> +	union {
> +		/** @num_vmas: used if num_vmas == 1 */
> +		struct drm_xe_vma_mem_attr attr;
> +
> +		/**
> +		 * @vector_of_ops: userptr to array of struct
> +		 * drm_xe_vma_mem_attr if num_vmas > 1
> +		 */
> +		__u64 vector_of_vma_mem_attr;
> +	};
> +
> +	/** @reserved: Reserved */
> +	__u64 reserved[2];
> +
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.34.1
> 
