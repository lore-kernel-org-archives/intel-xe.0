Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCCEEDE9AD
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 18:42:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455C510E8EC;
	Tue, 10 Sep 2024 18:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mrQJvAbP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD64110E8EC
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 18:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725993731; x=1757529731;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=L/YCniKO3Pnnty7cgOq3E0DPAbJDcdoBcv1NBT8Vv14=;
 b=mrQJvAbPb4JU1MIZE3mEzoFCJ2CeybO4pEF8J+sUc6flCQ/H81IfOnoZ
 rgWJgyZU56DIn9nGQN7tE2DjvRvJwFxfV3xqjrP1k02pJtoL6yv7lPTCD
 YD/vSNQ81rOii73uEcku1QJnW/AOEAO3R0cLil70QTJ9vT8Ic93zxcKbp
 7e+1voxkX+3Zx0cJPjDZez+f9VwbP710KdHvoNRJji2c5bCzNLBbsH0ak
 dDHj95BoZ5GygAYb+iPdx3NrLH/CsStE73m42AOBh9OmJ2PXr5OynF/xB
 ZifdxQvcL6huQx/JPKv+dL8AW4kUr98WLGF29+QgvWiPFu2XsCBct8CHI w==;
X-CSE-ConnectionGUID: SmKQQRlYTxKZlsH6We4fFw==
X-CSE-MsgGUID: XKHpY7xEQ32qVSkf7Y0mxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24907229"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="24907229"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 11:42:11 -0700
X-CSE-ConnectionGUID: +f1ok2DUSWy7RDtPicA/Tg==
X-CSE-MsgGUID: LNB9f1b8Qm6wF+EzUidQTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="67638052"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 11:42:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:42:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:42:09 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 11:42:09 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 11:42:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J+Jf5Cq4/rAL0lVdvlQk+wYgM7OAe9SW4ZwzWiLnaaJjTP+0I6deKHaI7Sjq/BDu79IJLkefspwhqBgZ5NlluhHNCOpnVwJfyvJDmJKBIeMcyjQoeeySI+RPu0zzM2YqIbzQNa6GMnoZhPf2O+mY6hCXjNYfuHz2h3rk431qRrOmi4Azh2yKVtizxhSg17GnnnWkhVR2fdWDU4dVNgtEpySyarBgRZiFOTIU5hafCw3D6QJqYyAPQDzMue/S9+NeCFTXDkEJbQ6ChKyi8XFQauuRz0k+nmgYjC3ujkpGYiCjREVFb+Y0/hdlc0VIL51w1wQJkHIA99QDchoNU07SyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hQOr4WpYZ3xFaLSd0MoGMsUPkskpP8Ol32SRQkyKp/k=;
 b=uo0PcW3o+YnQpJzaORQwTqLYfPtwXJccYg4xazpzK7jfV12Q9T/EPVTLZPvFaKEe0j6+TeIz9v8tBXBNX9zhhY6diMdfNeXmWMKyU2mpzdNpHcuqVklLKhXOfZ6a3sD8kDcWYV+GQjLAtYh+Y+K5LGAkyqFOYpsnwbeu74qbARLg339nSFooLI0S8vaIWPYtKyQNTXrSjh1Z+uCXpMDbuUUxhPnmaUMaqm92O4qhf0uTCbuvim/ADvKbMBu1MftPoq6RrIVRH1mMKPr1ao7P31TGU1Gp1ruWg8vLNVAOT4+DO2iCKNjtAtiehSk2iYazjWCOSv73VEMFrkKlhYGjYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB6377.namprd11.prod.outlook.com (2603:10b6:510:1fb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Tue, 10 Sep
 2024 18:42:07 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 18:42:07 +0000
Date: Tue, 10 Sep 2024 14:42:04 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 27/43] drm/xe/hw_engine: Convert register access to
 use xe_mmio
Message-ID: <ZuCS_GtrVFl2QbRR@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
 <20240907000748.2614020-72-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240907000748.2614020-72-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR04CA0067.namprd04.prod.outlook.com
 (2603:10b6:303:6b::12) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: ac719f77-c306-4d0e-d832-08dcd1c845b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QwvUQxxjjaO/fRYn04J8bz0mCFN5j21wwV+z8/lvLd15rXwJHUMZpOAiG9hT?=
 =?us-ascii?Q?zwLaibpHjrwBtF9eOg5n4RqA17j21fnZA4W9eN9OCEwJRpLuIq8XpU+9351o?=
 =?us-ascii?Q?mCHZC5uI1TBYNU2UG/JslTqGQqA9SkuLWmApEPvpHQ8AxmEUcyoSVmUQNXiX?=
 =?us-ascii?Q?rWfdrvB+lwPHLihCi34xcoEm/4vIeVhEBViYEKvcw6QoU8/lREpg7RGfKuzq?=
 =?us-ascii?Q?7KqlbcJPBEuJJCxjJiEpIz2I5R0cBOuGisXiU9/SiDEtesUGYFJbGalhP8Kr?=
 =?us-ascii?Q?tCvQshJMJTiB/e6w0iYwOwxLkZrMoZxtBR2RcqJ8sCgz3Uar2kHKQ381FJQE?=
 =?us-ascii?Q?/dEuuDRqEAf2cjMTmsfthsTDcholLtH/CCNoafmqfZ/rFACEAoLs32x56XtU?=
 =?us-ascii?Q?m1gq2HrFj4FPflh1pgIckQz6Igjm82O10eMaDxAM0xWuDO55Gctbx27Y/DLu?=
 =?us-ascii?Q?uHCxuaAXuXZUw1QzUgM1dQwvERS8t91oY4DGCl0X8fgeQJH5D5QsWYYAv9L8?=
 =?us-ascii?Q?jfjVp1YQrRHYfrvS8UEJEvE4xo+VG2tPMszFwaUeUc6KFWVD6qKO5vVw2fgW?=
 =?us-ascii?Q?zw6gjMsMRKqJmYwDc90UQcQfYD6c2qF9DFIoCd4GHjl0akbKynL260CwZ8j1?=
 =?us-ascii?Q?xDt6R7znA6mp7/jK7jRU6Yd9KNTceCf9dNkOetKwfdYA9GWnv56hcAjQgRif?=
 =?us-ascii?Q?ruQ+XXRKrMpBHmCC01mwISUay1fHto1BuVpDlb38OQKDVJPls54m8CyvK88q?=
 =?us-ascii?Q?KC9MqPh0peA503YzxhpjNXAVO8lzM99Phhos3w+UPsxfqk5gDXUO97lEeXey?=
 =?us-ascii?Q?lgQpoCwI/ns30JB2bXrYpFBVjLNfCiUE5iG1g+2B1AFcj1JnMrrBMkxOaR5K?=
 =?us-ascii?Q?1Ro5AoF6PoxtwNKosg2/tphk7cmzFCe8ebPdekyFBDgdO0GrNvKLkLE3Kmxj?=
 =?us-ascii?Q?wmqIURzlcHiuIO4QZMCyJ/CMkznANWqKh0W566+x5DT/gfnWb1W7592uFm9N?=
 =?us-ascii?Q?a0JDsYkOuSlPfDfBbCuCS+mpwNYa9Ro/OqBlVUxDgXaTaXSHjhr43gBpNbuw?=
 =?us-ascii?Q?TU1DcnvSmBTR+yuC7zBk1nHd+sf0Zjhg3CFUkfgR2kOxXDzjk1fhT7sfF+YA?=
 =?us-ascii?Q?0HHY7CVBV1SCg59k6NM34MsRc2Gmt9+Q48fYwiKDj7wr0oZmpb3w8t0iroKG?=
 =?us-ascii?Q?O+ysCnveGaXoKXkGVaiPhgbkEO8SI8rOTcmWQK5wJeX6GM4fPbCNBWStQDI2?=
 =?us-ascii?Q?fHXKWOMW2o8QNBDIoSw6j0ukB1go6/zHW9Jcb7WC5J85qfAjpd/1b4TCA34A?=
 =?us-ascii?Q?SX+l2vfjGJk/Jf7VrWNUoMLYb35ChLLAQaPyB22aNkxX8A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Kx4FSqjy+xAIBdDbVoHtEXTAryBX7zHX5ghbj+/mA6gIl9QcgUmdTnjOIM1a?=
 =?us-ascii?Q?dWWbCM5LZlsV/U1OY0WaIXndrQr3ep4PMbP+RtRaWntdWa2EB/jdRHNFh/KV?=
 =?us-ascii?Q?n2ko1EQHiGDyfz+qN7pc3qt2fdwrpBmdgJ/Ricah1CYO7HlPP29j7eoGGtdx?=
 =?us-ascii?Q?y74z5EXuc/LEjc4ZOvmKY1H+ZtoOgwoeyoL+r1sMcfTnpZEn2Woq78jmMa9u?=
 =?us-ascii?Q?6GQ/15cDLX7gl9UypmT9KKSigCAtCcfZW9K4UNfmgAT3ifQVe9HtTOVvaWXx?=
 =?us-ascii?Q?/tc2erWXlqyf9YKcoABio5tYiZKVaknV0do9Ba28SHkyLTnvhP+ocxNLPl62?=
 =?us-ascii?Q?0rnzkInW5N8hv9a7JNU0TTUJIko8m46Y+pm00oLYk0uDLSMn5EX1oz+aYXrA?=
 =?us-ascii?Q?McRyGgI4OB0tG9D6aNEiOdLMj9fgf8Jw0G+pl4GqSvnM3ZkJoQzFdI3vIwMw?=
 =?us-ascii?Q?qCgG5hEiM0tpyJ3Soq4ep3NUOt6GG8CgkRFZ6nZiscr4wmrnM2rANOdea4JS?=
 =?us-ascii?Q?gyPO/R1IAd/iH/SmlNFOCEKjXHBN5FMDDN7BcSctsnjwzvudLmCZdxlvEeZ8?=
 =?us-ascii?Q?LFevusKZCK2dmOtdqHVn37TqyUzhNJT/FNbIQ+9wXwN2sq/OkYwKjwLGc0zy?=
 =?us-ascii?Q?cpJuKbByd81oKnaQ+cZ3iBe8srU/vbx1gTsnb8e3FmGgKRkd6Q3Y0ztMyGsY?=
 =?us-ascii?Q?ycP++fAvV1WJrkXWX7q+s0eYc+LHWfAy4IzVFNKsEVemcu2vKV++Ln6Wjc9C?=
 =?us-ascii?Q?pXGXxwVkxpDLmTdI+Fuhs0YxrV5VXnlJxQB0odubHBvyEC3WuiNHJdhuNUlS?=
 =?us-ascii?Q?cMv6Uzm41IFf5vGCaEBSdswt9by+CTgyH9LLRG9DC1FymJkdQC16y9Q4+Us3?=
 =?us-ascii?Q?4Zotif9KNVJOBti09jzQwXsH/YsYNIc+mMKEStlwDKdcvGZNUXzwyhRHutgQ?=
 =?us-ascii?Q?ynfeWK+t1e4//s8OZycnSmgWRKh3lTSPqBnXAwRAVPPJFqPap8bOPN9zKxJR?=
 =?us-ascii?Q?YZE/rf3VhRdXONgGgsIOU8Uk3b9+ODQSa1thDu5JNwP0DJtBlExnrZzGTdgK?=
 =?us-ascii?Q?Dq6KmtcNovmuzoTxEAEaN04LyjnmOH2Ya1ifsVu3WUpBOAEvnNFanKP9N6je?=
 =?us-ascii?Q?NtnMjtM8hFhkuAOOStOo3khd3cggRLNrYDrlqj/cV+4WwMgLZLovb0pSDsTI?=
 =?us-ascii?Q?xF85DxH/LKzAH2+IlPnvCM9+klFhprJsn5G7mHUPsnC4d5wt2FxjxdbGtO3j?=
 =?us-ascii?Q?rXbe5gOIWe9FQoly9DjmgT9V09EMVAQjrb5nYUYxuhcoME7n77prUFnlstRf?=
 =?us-ascii?Q?RgoWpWHVNch9WFbHg8AwN31xfW0dLJehqFJBhmuc3hJLjbvfX8NbHcXzy4G4?=
 =?us-ascii?Q?59U+B4WMrpKzw17XcQ2958kNRZEHcCNXDwwV3t4f26RNCgI6bhCFF75S7Qa/?=
 =?us-ascii?Q?0rNQWJH/2dpXcnrCUbeQ0LUm26yU9nfWmosVGBV04L3P6AVKosyeXz5UwtUK?=
 =?us-ascii?Q?TAmt2vUuSV5ygWdUlbQnV1pwvMAGYoSfqsNHfF/iJsbEnByTUVyYP1lqy36P?=
 =?us-ascii?Q?sZVyuiUp1rfs9ABocCnyrAp8f2LWoI7k2OSYoG5lIUWEukYQTlt8XW/tyskF?=
 =?us-ascii?Q?5Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac719f77-c306-4d0e-d832-08dcd1c845b6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 18:42:07.5781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zSttOQRflAFXQ1VtipDGeXV5BdqOyBYIKdMUI+GpP8w2VQLmgz6l7E7rXl2+s8g1TCXgCIQ/SH4dCpZAqjj/hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6377
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

On Fri, Sep 06, 2024 at 05:08:16PM -0700, Matt Roper wrote:
> Stop using GT pointers for register access.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 29 +++++++++++++++--------------
>  1 file changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index c9c3beb3ce8d..0788c2347c84 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -295,7 +295,7 @@ void xe_hw_engine_mmio_write32(struct xe_hw_engine *hwe,
>  
>  	reg.addr += hwe->mmio_base;
>  
> -	xe_mmio_write32(hwe->gt, reg, val);
> +	xe_mmio_write32(&hwe->gt->mmio, reg, val);
>  }
>  
>  /**
> @@ -315,7 +315,7 @@ u32 xe_hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg)
>  
>  	reg.addr += hwe->mmio_base;
>  
> -	return xe_mmio_read32(hwe->gt, reg);
> +	return xe_mmio_read32(&hwe->gt->mmio, reg);
>  }
>  
>  void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
> @@ -324,7 +324,7 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
>  		xe_hw_engine_mask_per_class(hwe->gt, XE_ENGINE_CLASS_COMPUTE);
>  
>  	if (hwe->class == XE_ENGINE_CLASS_COMPUTE && ccs_mask)
> -		xe_mmio_write32(hwe->gt, RCU_MODE,
> +		xe_mmio_write32(&hwe->gt->mmio, RCU_MODE,
>  				_MASKED_BIT_ENABLE(RCU_MODE_CCS_ENABLE));
>  
>  	xe_hw_engine_mmio_write32(hwe, RING_HWSTAM(0), ~0x0);
> @@ -354,7 +354,7 @@ static bool xe_rtp_cfeg_wmtp_disabled(const struct xe_gt *gt,
>  	    hwe->class != XE_ENGINE_CLASS_RENDER)
>  		return false;
>  
> -	return xe_mmio_read32(hwe->gt, XEHP_FUSE4) & CFEG_WMTP_DISABLE;
> +	return xe_mmio_read32(&hwe->gt->mmio, XEHP_FUSE4) & CFEG_WMTP_DISABLE;
>  }
>  
>  void
> @@ -612,7 +612,7 @@ static void read_media_fuses(struct xe_gt *gt)
>  
>  	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>  
> -	media_fuse = xe_mmio_read32(gt, GT_VEBOX_VDBOX_DISABLE);
> +	media_fuse = xe_mmio_read32(&gt->mmio, GT_VEBOX_VDBOX_DISABLE);
>  
>  	/*
>  	 * Pre-Xe_HP platforms had register bits representing absent engines,
> @@ -657,7 +657,7 @@ static void read_copy_fuses(struct xe_gt *gt)
>  
>  	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>  
> -	bcs_mask = xe_mmio_read32(gt, MIRROR_FUSE3);
> +	bcs_mask = xe_mmio_read32(&gt->mmio, MIRROR_FUSE3);
>  	bcs_mask = REG_FIELD_GET(MEML3_EN_MASK, bcs_mask);
>  
>  	/* BCS0 is always present; only BCS1-BCS8 may be fused off */
> @@ -704,7 +704,7 @@ static void read_compute_fuses_from_reg(struct xe_gt *gt)
>  	struct xe_device *xe = gt_to_xe(gt);
>  	u32 ccs_mask;
>  
> -	ccs_mask = xe_mmio_read32(gt, XEHP_FUSE4);
> +	ccs_mask = xe_mmio_read32(&gt->mmio, XEHP_FUSE4);
>  	ccs_mask = REG_FIELD_GET(CCS_EN_MASK, ccs_mask);
>  
>  	for (int i = XE_HW_ENGINE_CCS0, j = 0; i <= XE_HW_ENGINE_CCS3; ++i, ++j) {
> @@ -742,8 +742,8 @@ static void check_gsc_availability(struct xe_gt *gt)
>  		gt->info.engine_mask &= ~BIT(XE_HW_ENGINE_GSCCS0);
>  
>  		/* interrupts where previously enabled, so turn them off */
> -		xe_mmio_write32(gt, GUNIT_GSC_INTR_ENABLE, 0);
> -		xe_mmio_write32(gt, GUNIT_GSC_INTR_MASK, ~0);
> +		xe_mmio_write32(&gt->mmio, GUNIT_GSC_INTR_ENABLE, 0);
> +		xe_mmio_write32(&gt->mmio, GUNIT_GSC_INTR_MASK, ~0);
>  
>  		drm_info(&xe->drm, "gsccs disabled due to lack of FW\n");
>  	}
> @@ -809,6 +809,7 @@ xe_hw_engine_snapshot_instdone_capture(struct xe_hw_engine *hwe,
>  				       struct xe_hw_engine_snapshot *snapshot)
>  {
>  	struct xe_gt *gt = hwe->gt;
> +	struct xe_mmio *mmio = &gt->mmio;
>  	struct xe_device *xe = gt_to_xe(gt);
>  	unsigned int dss;
>  	u16 group, instance;
> @@ -820,11 +821,11 @@ xe_hw_engine_snapshot_instdone_capture(struct xe_hw_engine *hwe,
>  
>  	if (is_slice_common_per_gslice(xe) == false) {
>  		snapshot->reg.instdone.slice_common[0] =
> -			xe_mmio_read32(gt, SC_INSTDONE);
> +			xe_mmio_read32(mmio, SC_INSTDONE);
>  		snapshot->reg.instdone.slice_common_extra[0] =
> -			xe_mmio_read32(gt, SC_INSTDONE_EXTRA);
> +			xe_mmio_read32(mmio, SC_INSTDONE_EXTRA);
>  		snapshot->reg.instdone.slice_common_extra2[0] =
> -			xe_mmio_read32(gt, SC_INSTDONE_EXTRA2);
> +			xe_mmio_read32(mmio, SC_INSTDONE_EXTRA2);
>  	} else {
>  		for_each_geometry_dss(dss, gt, group, instance) {
>  			snapshot->reg.instdone.slice_common[dss] =
> @@ -959,7 +960,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>  	xe_hw_engine_snapshot_instdone_capture(hwe, snapshot);
>  
>  	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
> -		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
> +		snapshot->reg.rcu_mode = xe_mmio_read32(&hwe->gt->mmio, RCU_MODE);
>  
>  	return snapshot;
>  }
> @@ -1150,7 +1151,7 @@ const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
>  
>  u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe)
>  {
> -	return xe_mmio_read64_2x32(hwe->gt, RING_TIMESTAMP(hwe->mmio_base));
> +	return xe_mmio_read64_2x32(&hwe->gt->mmio, RING_TIMESTAMP(hwe->mmio_base));
>  }
>  
>  enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe)
> -- 
> 2.45.2
> 
