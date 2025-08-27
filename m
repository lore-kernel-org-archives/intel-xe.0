Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444EEC8303F
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 04:25:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE4410E6F1;
	Wed, 27 Aug 2025 04:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nsOgPA0w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A732E10E6F1
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 04:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756268747; x=1787804747;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rRO8ojPqX/9//6eRFDDLayUCWg3N94kbcsDYUsPTals=;
 b=nsOgPA0wKlz8boRI+xBvW1NdRw7n6Xf2j6aGDHWcIr1bAR7lLJ8wjO5L
 9XXKpTiIlrbMlu0fiN9wB6ejwQPYxAe053zXsXksZSqc651bbADEtQVAf
 rpUjgtZ1uzquYhEoSg5PQaMXZJDmPXvEpGmhVPFqEPVgfMLBYz+n6r27B
 8sCd201dHOPCtXk2SopwBZaQFaE1n8LrvCGi27XBZd3mTmFej0WJ6KOgw
 MbjqKNvF9CGmc9HSc5NAH7ztPdgRMWqjDHGrKK+sv13PVYH0kFicUzgUe
 J2bq5kHJVOY2UhcGj2HqXR4VCouzYCJQUFYAmxBRkgKqdmAmvknkUMziQ Q==;
X-CSE-ConnectionGUID: mAoSSflJQlCzNV0B0xotHA==
X-CSE-MsgGUID: 7m3zEc9vTjiUzb7IThJ5Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="57534125"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="57534125"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 21:25:45 -0700
X-CSE-ConnectionGUID: P+qxuIu3TlKXVuEgqoagpw==
X-CSE-MsgGUID: k6FUfdcoS9GailhSGOZX6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="170575676"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 21:25:45 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 21:25:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 26 Aug 2025 21:25:44 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.61) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 21:25:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D4DTiXhEVcBJtNRqLkbrKTLT9yb6KghLzMFw6H4uYcrjrwecDDB5jr7ILyqx8hELbTIbhpcT9C2XPDfzbtpmR622R4XufGDjmgSNCHP5Ua0W7sEdX7/SNg+zxNlBSZ+zpvRHVBOLMpdjIKLkR2pFOr3YaUup9N+HZEO82jOswXalyBvJ+/ZG87KR1zRN6prVE9bT0D3CZO3cn+Y9q6+xtezo+YBlzv/GPscSFc/GMnrpd1awlhsHfbWQD2i5guPeRukRYUG6vTNxWYNq4LSZZtO2oaB30XTDvzd6YFfGjly6U66i4fTs5RAMEz34GHTRKuV9BKJtQ2mnchyQou3J1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vvZ38taKG7MXlByKZXADRSg8/hsvqVM7K+PYj6uVmZA=;
 b=uMGT9qjpkbV6bXQZFaScwgW4T4YTrCHCqloQTEzsqYD+qxxDqt4AeVjR73BAwMq8+C2MOddIwkmo5sFcgKwRc27QjU9ZhNFv6hG2wHAjVw6f2fPPeL0mopYXEGvIBwvq8Qk90sxWXaN/OEvw2w9peFjUrYnqg3DmJVSqSqueRHrNurtAx9+WXGPzHNEnxOPoAaDXaP158vwzLakpEbZ5tBjpMDGRZ6I9c5rf5f1Pp/Q29TErZRLm6cPswd9sI0UTl6kmt+A2guc1VdkIzOzhXevF2u27WAIo/PX9AK1hvvBbXlgFJvesyjZiPP307c55976z5QlrMlGBpTf2idu8hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by MN2PR11MB4535.namprd11.prod.outlook.com (2603:10b6:208:24e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 04:25:42 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 04:25:42 +0000
Date: Tue, 26 Aug 2025 21:25:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <john.c.harrison@intel.com>
Subject: Re: [PATCH 0/2] drm/xe/xe_vm: Add error injection support to lock
 and prep
Message-ID: <aK6Iw9wyUNBWyped@lstrano-desk.jf.intel.com>
References: <20250826175051.92563-4-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250826175051.92563-4-jonathan.cavitt@intel.com>
X-ClientProxiedBy: SJ0PR13CA0050.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::25) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|MN2PR11MB4535:EE_
X-MS-Office365-Filtering-Correlation-Id: c973375e-5e6f-4ec4-4097-08dde521c8ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?S8AjSZOa1aIOv1HJzwUE+1GjmF3ivTTyZjyutRDXfiDmhRxlc+B62MVkEgPq?=
 =?us-ascii?Q?STfUKgFPJfePLvjiXnVybnCgBuVlfyT5RPbxDuoMWxG3rnrH8zKgGvkiJXKq?=
 =?us-ascii?Q?Trn4rMnvqSHHXvTQZs9Ooj64thbJq2I9Fqq0jLDD9rQ9EG2dGxAM76gVh+zF?=
 =?us-ascii?Q?QmGc/h6XPZ6b2puQAHy4mkur6DxRQrQRhkim3p5S+gQrsYtdJ3s3cAehIr6c?=
 =?us-ascii?Q?pnoPAwlmRHIRRIrdA33WiXgCMU3eaPLF2dcCOhK1B83esDqrHPYLwhPeVenE?=
 =?us-ascii?Q?mWYK37iKCTcj2Z3WpRaF0tESGh2ReRgD3d9fn0iqqK2gE45aSjBT2G/A1PHf?=
 =?us-ascii?Q?7ffxDsFcIUsSBhCxHh6gZvZjRe0IZft07SOTDtGVWS4ot08Tid04bTmLRLXr?=
 =?us-ascii?Q?o5h0RboS1QoTdFYSXxWhrWR8IxTq9LLF62wvhB74AN1Wg6JuEKYRBdULvFOq?=
 =?us-ascii?Q?jkDht9L2rGw7OrEAqsNDZr+AVY36T2GxPDFxnDozRp3vhLdBr9rkQKab+xFU?=
 =?us-ascii?Q?K87wajmE9Yl33OJISjz3z7q9okaeYO9vvNTvXDQIYqPU7IE2jOrYf3GIfZVE?=
 =?us-ascii?Q?4MliKcTmCIe9eddgvIxko48luMWKyZEyEuQpV/yEr7FOp97D01OePVVjfofC?=
 =?us-ascii?Q?W4p+XPOZTBHjSzsfUmmiEgMLVA6i3a6MyRg2bi7sW6sC5wQg09Hj5tChD2+U?=
 =?us-ascii?Q?9ALbZsEyaIYcZlq+B59OPv5+NX+Pj6TyBRDhQV1U1FQfnGpTTIHilzMOhw3E?=
 =?us-ascii?Q?9iLjoYGvkc8TkpdmSk/MsYEA6AeSOjC3H4kBXn4RCb1p+HUFmArsqbONUSt1?=
 =?us-ascii?Q?Mpt6tEYfreyhmzT75dw+cMyL1ZHXgls+Y/cPvCCH+1D3pq+sbuQZTeCo1HZM?=
 =?us-ascii?Q?jdSwvhyPIHSggMDk15kIQECk1o7oZddE2c7d8k1Xo/6iWF1xTK9U6ynWnPID?=
 =?us-ascii?Q?/85RUkrWwxdrrl7wYDuVDlkcaV0FNFalF0TXzGcZQ1klOiWpOiWgsonBwZfn?=
 =?us-ascii?Q?nZxHa1pIbtt7lc0keftHQJsxgFnGvbyKYOZp0zPa1GRtPrQ9Aqxh+qO2MIGJ?=
 =?us-ascii?Q?xwGhAFhQZj13/3cDAkqOmqUuXvnWEQDFNgRmfSawWDSx/lI2nn+h5qM1KgC3?=
 =?us-ascii?Q?bg6FyvtAAPs1h6gU0kqgZWwR/0DmFXKum0ESWTZEs2JidHXeb73L+r/29d4m?=
 =?us-ascii?Q?o/QiyiDWKH5YlScEzHEYTGnrSyRdJ5QH+B4Fn+EMn8LMhJedvBBNBqIh2GPz?=
 =?us-ascii?Q?Xe0EBiAXfrrQEMoOe2q1lSvP9fPbeNI9hCXqEff0U4y5eQ7+xSzaCm/v2Og/?=
 =?us-ascii?Q?yrNTqPD3Djoo3+kl3+piqFlh5cQIdtHlqeDkDTL249IY6IVDSAyya3HUd9aI?=
 =?us-ascii?Q?C2eE4wy1EpdmICo1qO0Fs0JPLI8Ip4jFQsyzuE8waQcOmp6j6m3oSU3ApspE?=
 =?us-ascii?Q?U7b1A+p3jzo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nyYfe3HSNcIo5jcwaTWVTtiJbMmKjiQS+PmFbRne3PR93EkEonvHTXNy0HQ3?=
 =?us-ascii?Q?iskihuHpEkHcAQnEEaigHEv1KFtTWNeWOQjViI+haUULi8EaTkcvaM+yU+ZT?=
 =?us-ascii?Q?/6SI5lw5ya0lcE+p/BNSeyLdFz/1X7rooYIDui8SszlS2ls7Ee3um9/QWxMe?=
 =?us-ascii?Q?zMBCaZEHUtblFl9bWck821mMPtantcsbyi96yiKij3eQHo9B5zIYf3xNn2OP?=
 =?us-ascii?Q?BKDiYTBdTWnFrQFF38m8BqyCzeT8dpSpHlOs+LBS5zNcfBcBhVo8Je02rnfV?=
 =?us-ascii?Q?1l8kbnZNy39tTWBKung5MpHsWZ07rtsqvCcgxRlUl4CBB8xS6NVpz3Gd3+8V?=
 =?us-ascii?Q?E1aRkvqaB5QAwn4n5ReqCwjMqE8NNbactm6u8PAGcFTx1wJhDbQNzih4ra0A?=
 =?us-ascii?Q?vxAhAjsNAM3Tz0CtJ5H96Zk/GyGLJ4rHU7mmINl5ZNGciw37Ps2tjg/SNyT2?=
 =?us-ascii?Q?VFxzSjdrkRiAHPWW61yVbFoWeREqG03t3DG0+tOFHNQF050Sb6q6Xtc43Z4b?=
 =?us-ascii?Q?ITU4TNGsqzVk8hOFpSwMjDk3X6zPrJRVJrlXwGjMmwc+U70D0J4wh6pub+b2?=
 =?us-ascii?Q?BkuxSHy3qytsNRZI3Q+MkjixRWwd4ewuGHLjS0/ISlnH6b4Zsp89h93YDULR?=
 =?us-ascii?Q?Id8xDtyPHYHUVnUHvlBWAZDCE3NpAVE6rTF77+Hut/NbY0AUYQl5boi8iiI2?=
 =?us-ascii?Q?NbK37LNJWRTsRkTe6CnUemcR+Mf3jn9gvc0mK5M+dOiOXDbe9sSHxnPUgzL6?=
 =?us-ascii?Q?xyTCeYL1Nd46+0hNd33a8HoKQtI4j2xmL2pzgJ5GMAvN/RttJSsXJzgl/cSX?=
 =?us-ascii?Q?Oq4/ZBo5YWUXBlRkyD6dWrU4Qo1p6PR74Qhe1y3nDm+2c5pH200xiqw+4uXk?=
 =?us-ascii?Q?wZJqh2Pf2FI92grWlwPAGBfvaqflgkleeFY2l4cAlHB/a+PiVgWbjoNgF0Qu?=
 =?us-ascii?Q?hYeoeHNIiKFHNoqN3dL2RuHJhKopdaekZjAJtcBw5bRzasSXEC4cZLPc4NEo?=
 =?us-ascii?Q?Wsfcld8kfy2c/0ETTjFkSAFsOKrngb+eDtwuxl02szj7BQHzT8yF4d51lfwX?=
 =?us-ascii?Q?7K1Og12k+xm/Jq+6veCf1xUVoN0DWovWJ0ce91hK6bvbL6WaRuZehBtWsrFx?=
 =?us-ascii?Q?TsM34iPjmk0BtBjDwFUbE94nWIq5gvkSOwsE0r3nqZqORQRw+AvD4rQB0Jf/?=
 =?us-ascii?Q?kKV450f36jF85uhypxJW40aWi2bGzAse94UY3tUaxqvQ5bYlEaP4wKQLNr9a?=
 =?us-ascii?Q?KlfMceGL96HwFxvv26xat2y4kfpaTyM76Hl3Dnu5hb+H2YgRlgSmNuJl5bTI?=
 =?us-ascii?Q?Wtar+PggT4BT8fTgSU5ujLyjn8RY83GIuA35OWj+lBOyUV7LMsuxhc2Z8cgG?=
 =?us-ascii?Q?cSpDv7XKQFZFbJsJu5rMvuuAcY7gG4ZFAhPUG9xLMILzBwqfUaC3eN8+w1sD?=
 =?us-ascii?Q?PuuUpfb6lIhOOo33PywifoBu1iMwbwFIf0ICfW6Ej3y6lh33GgTXZeiezhRz?=
 =?us-ascii?Q?7k+o1bd7ppVIgd5vz7i3xtrhDpWi7zRjJ+qs7ar5YrMgEj5YZXDV5C56fNwa?=
 =?us-ascii?Q?fSYTLIwFW6cPf3n2itWW/UcK3WmOuzoCgegs+vNg0aGCc4hVkf/5VBGkGxcQ?=
 =?us-ascii?Q?wA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c973375e-5e6f-4ec4-4097-08dde521c8ec
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 04:25:42.5684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PFF2zwU1KfDsu/R5fOvyE/hK3Vnxpkj1qFSUHRnB7WDlMjw6QZJD8H77QHoF06ENC1+LyL9tjbJcKCK28++8mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4535
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

On Tue, Aug 26, 2025 at 05:50:52PM +0000, Jonathan Cavitt wrote:
> Error injection should use the error injection interface, and should be
> decoupled from CONFIG_DRM_XE_DEBUG.  Remove TEST_VM_OPS_ERROR from the
> code, and add error injection support to the function
> vm_bind_ioctl_ops_lock_and_prep.  This necessitates marking the function
> as noinline.
> 

There was 3 revs of this series in a short period of time - I get typing
fast but if this occurs, please cancel prior rev CI runs to avoid
wasting our CI resources.

Matt

> Jonathan Cavitt (2):
>   Revert "drm/xe: Add VM bind IOCTL error injection"
>   drm/xe/xe_vm: Add error injection support to lock and prep
> 
>  drivers/gpu/drm/xe/xe_device_types.h | 12 -----------
>  drivers/gpu/drm/xe/xe_pt.c           | 12 -----------
>  drivers/gpu/drm/xe/xe_vm.c           | 31 ++++++----------------------
>  drivers/gpu/drm/xe/xe_vm_types.h     | 14 -------------
>  4 files changed, 6 insertions(+), 63 deletions(-)
> 
> -- 
> 2.43.0
> 
