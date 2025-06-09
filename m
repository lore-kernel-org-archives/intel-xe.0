Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EE6C61CE8
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 16:07:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0AE910E3E8;
	Mon,  9 Jun 2025 16:07:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XTexm4XZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 585CF10E3E8
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Jun 2025 16:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749485232; x=1781021232;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=HIGJob6d0OCnEZEyLSkbWvmlDACq5RLN6QxRl/t6Szk=;
 b=XTexm4XZtYGc7dwN3fAcH15uKIGdq6dJY4xd8x1lPDRKPooesGfLbwfy
 3Q2tF/MS/oIRVF4+XyEym5NeYxnoZr3nB/hWyyukQ+wOZBhOSbElSEoHh
 x0O/lXyQv6XMKTlaRgW7klJ0Tp9eTvPWo2oLR/jSmHH73tKftZuzD/K+F
 zxvQDL278/8hJj/TqsjA2TryCE3ZrqVCawfFm3GvbBWEox+HYdDzv8AS4
 ZwjebH9IFBvXEbEcmJl8PObY6ppf2EpD+anSEy3FUtncxx0fhfwJabqoJ
 vqhh+LFyCQTiErfjR6aCOIK8glmtBQnrRUZblJuplaF/U0aLkY+NDywbQ g==;
X-CSE-ConnectionGUID: cGTqWwkdS269b7KlPnKW/g==
X-CSE-MsgGUID: 8H5BecNJRdCVEJE8L/a3Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="69015441"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="69015441"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 09:07:08 -0700
X-CSE-ConnectionGUID: L6EmntxMS0G18TXQcxIVBw==
X-CSE-MsgGUID: ZRyXrOTqSPqXJoY3aaYOZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="146477534"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 09:07:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 09:07:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 09:07:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.84)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 9 Jun 2025 09:07:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5qz9uzCf7LOCz5c38ysBHauqN2+lVw70bzPJXXEZecOQwzEtuEeHy4PB6xFDn4cAJy0RG5/9hHFDJbMm43GQXb0LW3Sj7t14KzEtq8mRTdFS3HxxM9h7cPrtXXdSjJCJ/abrVbfU22aXtfhFhYTY5OVXn1pgCmBsEvX1WKaeoKstAal03sBri8vIX41BJmEG00Pe+Yus7KpfhPf5iuXjKlXEJ8pta7b2A8bCN9Js7Q+rKsOiEdAkmg95sXMC7tq5C9mp5xOIfRaJWNWL2UMrqSwvargFWe+kTasrNU+kjE2f406yqXJcPX4jrLtN7riaLXGWHLZ9BwaE1cNfUo87Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JSFtX1BMnTmrR7Ja+kgF5hMS5A4NvcZ2fUMcsAi+Bss=;
 b=sGKe5/ALcI0XY/CR7UCU4/bYPp3WzYaiA5kwnRBvcwTZ0qUnlJqQNl0mRtNMVeRPIwYblejJ5a51MxwBgM3EUjJTrwG7CSfMyv92TWFD+BqyoAvX7wV9dRgATl7lGH3vz6oXSyfxFwmSfJ2GzxGt1KvHK7Qsq000Da9J5DDH5JYAD1UnKpsEzyX1LQGLJO0J7nLMVgSdfsbkkc6E9A0nZrabUqglswy++qLkN10ctffbWSKfAgTfcVYSE066xU6ngdxGdDW2hgymDjx0em0e2DxQxdTiAAZfmwYl4pnvEWsFLkVu/cSg5ruK5xy19XaLPx3xaNe3rCXW/Z2meIUEQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH2PR11MB8834.namprd11.prod.outlook.com (2603:10b6:610:284::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Mon, 9 Jun
 2025 16:07:03 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 16:07:02 +0000
Date: Mon, 9 Jun 2025 09:06:59 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1?= =?utf-8?Q?re?= for
 drm/xe: GSM size should be constant on most platforms
Message-ID: <20250609160659.GM5080@mdroper-desk1.amr.corp.intel.com>
References: <20250605225352.2333981-2-matthew.d.roper@intel.com>
 <174936650981.58007.9418385420371608902@1538d3639d33>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <174936650981.58007.9418385420371608902@1538d3639d33>
X-ClientProxiedBy: BY5PR13CA0034.namprd13.prod.outlook.com
 (2603:10b6:a03:180::47) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH2PR11MB8834:EE_
X-MS-Office365-Filtering-Correlation-Id: a1d49e13-6366-4aff-c835-08dda76fab8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JKMn+fSFQ8KT5BJHX9p/0OR9iNOuG44Kr2tKIhgPsbuu/Rml6dMM35bF3KoH?=
 =?us-ascii?Q?fVo2qbfi+mLVnaT2/h9hywPz59qh1QrdQDa0cmerJb9pJHV7i8uwXl6hao1d?=
 =?us-ascii?Q?3nIzYhoLyc8OKIfZYx/DogIifF+rr9wrZsMYu9zSq/QgSMgnFA1dD/edAfIK?=
 =?us-ascii?Q?2eRppMs5zLN7EPOVDjqaxI7LWeJ/QqYNILg3FSM0tNISkAjze1n3/s3+F4fl?=
 =?us-ascii?Q?VIpQKj0hI/KYmTAzAGOxz8M6T2h/dDxKnlf+nHJpikaQNHrgJ7fR+vyKN6+S?=
 =?us-ascii?Q?lDhARcaLlOZNNfnbnBiWMBAJwAPNnn5FJ/3obKTldndBWUMZRpnhcDpfqEMj?=
 =?us-ascii?Q?3WvQ8pLsWnyaiuiwzK6eniVRtBmhL67Nn7cmqLqtTdu3ziy4SA6UQ/rre0Vk?=
 =?us-ascii?Q?znhowGcD2XFpLovv8eIFrxZ9+2WQgnPLa5Q/2x3/wQ5ly0HrNG/XgdpkTYLZ?=
 =?us-ascii?Q?axicn/pKeOg4g6aShPwIS9vJ/sFJNaS3HxHTYKV6SxSfZZP+MJuFw6pqQ1dw?=
 =?us-ascii?Q?FuzcIzfIl8hgyUw7Ak+x6pC7L8YWCec7YYnzWbcN14Q4tNwxLuSU9oAxkzFW?=
 =?us-ascii?Q?4UgnE9ztgaLUKUBeCRR5OU6AnIhwOWPOp5WkHGclfT/ST8y+qLconl4U3ucg?=
 =?us-ascii?Q?W2bq3VE99NIkDucw2b41m6XQqRm6njd01jsSZTsPV+Hhy7BGUV6pQXKXTNpm?=
 =?us-ascii?Q?6744mvvS4qGSzeQr00yefXIzT/xuhXbPIuJ88chY4yiXLRUY26WHVMMT3L9p?=
 =?us-ascii?Q?mYerRiT8RsdF1Wv2kCDLcgt9qUawq/E9Pi0KsDmb+HVMPsw3zoIXwIyMKNNe?=
 =?us-ascii?Q?2oUaI6Pugjb7nVTpWsTpEAvjmVs1Wu+VgSzSHoFx1F1O93NMc3iWeojJ/DC1?=
 =?us-ascii?Q?HC9jtfX9b2s6M33MXw+g9kzB5/ogOVyX+p2uzgOiZEKVHPYMtvpNHqNlOMOa?=
 =?us-ascii?Q?E9Om2H+/JmxGypFvZI9bTSNDdNlys/DcVgLOrLdMC4AdVkYQNOo8/2tAdSPb?=
 =?us-ascii?Q?jsSIxOVQodbaZ0eEDzUOTuNs/Jc2Ge6CL5iXZOcDT6IqWnquoas3V7XHllQA?=
 =?us-ascii?Q?RURNmkgOZLY0SeORgd6y0KPFkFyJAmkymUWEOrs+3hIB1UGLtl+Eadc6KdqC?=
 =?us-ascii?Q?K3k1+RxAue1tKADEJzOzOR2lBmzDH4e/zsFSPf8gBmSlayVIrFMXpXptbb0k?=
 =?us-ascii?Q?wkg6r/ViNOy/LOX0ZNNMLA8KwiuayDeSIk5V1oXnA6gysoo+SPOY7MBPkptj?=
 =?us-ascii?Q?TZpjp4DckNXNQy6WASWi3aAncA73ZsL4kCkCLCDI4jlZBMCdFXrNtdGamr3g?=
 =?us-ascii?Q?ajeQavq0F80GKF515aAlrpbXzx5k5DOy+np1Dg5yfsTpbKH2p0/Y4ylKRcYh?=
 =?us-ascii?Q?t76nv54=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tPnEybjMGzs9eJKkfVivYTkKIeZuNppmoSAGieAOL0Y+2YC3iTZZJ9m/VlKF?=
 =?us-ascii?Q?pBpZzSoJUBfaAF+vYZiJ22hNxxU/ZB0Vi/C3kjBV1aSr7KzEi+xak7EVber/?=
 =?us-ascii?Q?5epMmXdsl/6EYuh3flK0ROQENJKSx4qtv6nXDXaC8cxKEVUY7ocTXCXyj+If?=
 =?us-ascii?Q?LdsY53GlDwbnHPrGFeLw1ZAWj7nNBU2W1OSdAkBWkuFbvvxPohgLlotAMsWd?=
 =?us-ascii?Q?/GTccXwFbj8UrizJR93iuXd1F7gcyTT4o+D5k27oni7/PAd5O1fjszHH0F0s?=
 =?us-ascii?Q?YfKMx7EfXFG0A0vKDbRI5kV87KFgmKapScg1SKd+aTlhKpDpBAeun/gEhoRg?=
 =?us-ascii?Q?lh6Nm2nP3OhpMJUeR0Kjry89x1yUCBJjwOp4JNEYLP/Z/hyZC7/ey6z5sWEq?=
 =?us-ascii?Q?YAa1q2vPWuwzTd6WawIXQSrB9vSdamANJnucvJOowcv4w7uhDaSAjMkJlFYI?=
 =?us-ascii?Q?y0FcDMx2a7E+HJ+Vpj3FzNZA1xVWbuNbOf5ROLhORgOMCRj/erWj5pLyxz1R?=
 =?us-ascii?Q?PwUUlTG1P7iLLDbqD31OtALsBK1gP01MvuHP6aRl9E965bZs0R7cB0p6wvAD?=
 =?us-ascii?Q?OAIcW2ml6dbAtbtDW/hK6DtILhdNEKgEihhrQtBPnXDiT6a79o/v+QL9JNoE?=
 =?us-ascii?Q?6j7hKtL9CLEannp+j3jVx78+nBEVb4bctVIUffFkZof3KdoWfK/4exVmGr1f?=
 =?us-ascii?Q?RsGR0r3XeVCl6L5CWdDkFpUeWp/r7zaYSe4FyC2gMTuzsY3kPPQzmMBOBFTP?=
 =?us-ascii?Q?idlrMp+bzlx/WTnWwH8+TajvcKO5yuXJ52YQk6pWeQDtgks94gbD1fI9nBM2?=
 =?us-ascii?Q?VOnhBlGsyePkigVPmwXiXXBvWWME6icPQoTXziXkOv3RFa87qfNw6ncP7dUk?=
 =?us-ascii?Q?xrfmLzyluTIkIK71Ic1Pa9VcfNR8vksXCuZKZGwF2Lkkql+F2vmXczIK3mDY?=
 =?us-ascii?Q?33OVjhR6CRI4NA/3DGpK6JL2AVs5gbpU1pUtAitbz1oETSUu07MZOYba6Xdu?=
 =?us-ascii?Q?qtZHrTOGB65JU7qeVQhvTSQ6slstG8xvNSHPWMAyvxgGwFe6AUe723zUCg0C?=
 =?us-ascii?Q?MZExN1SliYF+i6x2dven7YccsVVAbO5PIjRr5uMLlEAK+F/UC2QNvdoEp0XG?=
 =?us-ascii?Q?ResipugNgRsgwH48HBfY1m8HZkmoE9zQDQKH6+DFRiZcEXAJI5YXRcgEyDg1?=
 =?us-ascii?Q?rbz9KtayfzXqF1Huu8IGCGm53yaIxD2Aom6mUSzha8nkw0SrbC9bfq+Lzbqh?=
 =?us-ascii?Q?fLdrlqxeTWqRVRSQP22g9YYx8ayUeZIJx754vI0W0iYNwzVaCDv3pHyAd6qU?=
 =?us-ascii?Q?Cw0tz3R+j0wdBgimQGZdNMuM2I2TFXmGCwlx1/2fQuZWJ9ESomgSaWOMV+/M?=
 =?us-ascii?Q?kciw/CClkO6tZqT+IKAovMuWT39lA+OFwbZfIx0YgVtydSEK7/XDSH6pJY7Z?=
 =?us-ascii?Q?jh2Pao4zknDVUpm4JlXbAwQZopRbVYMuJn9SmD9ts3EIsIjJ5JZg4RGLM/uh?=
 =?us-ascii?Q?Nt0ylN5L23cLiB+nee7TdTX1tJ5pbJS9/b6oYSstEsXdU6xD/AOioxKaGW6T?=
 =?us-ascii?Q?5JQHEiGJzwV9ds1vzj2WhhqeRWIYxswKH5ck99BWPFj6UN2/M0XgxOCP2cQA?=
 =?us-ascii?Q?6g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1d49e13-6366-4aff-c835-08dda76fab8c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 16:07:02.4663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2wn2YFl/GdLZKXzH/laWhnWx0Dt2FBC1TUOtttvt2GKBdBDIqFJFgYlA5jymqOpBtS/Mlhn3qwtd5kJY7M+LubztlaFzblsqf9NwVgVsOJo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8834
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

On Sun, Jun 08, 2025 at 07:08:29AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: GSM size should be constant on most platforms
> URL   : https://patchwork.freedesktop.org/series/149907/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-3203-308a53b9affc92eca9eaa6117dd62c79d5419ce7_FULL -> xe-pw-149907v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-149907v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-149907v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (0 -> 4)
> ------------------------------
> 
>   Additional (4): shard-bmg shard-dg2-set2 shard-adlp shard-lnl 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-149907v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [ABORT][1] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-8/igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1.html

<4> [342.214458] xe 0000:00:02.0: [drm] Use count on domain AUDIO_PLAYBACK is already zero

Seems to be the same as
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4847 which was
closed a while back as 'cannot reproduce.'  Not related to the GSM
changes here.

> 
>   * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>     - shard-bmg:          NOTRUN -> [ABORT][2] +1 other test abort
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4917


Neither failure is related to this patch.  Applied to drm-xe-next;
thanks Gustavo for the review.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-149907v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@intel_hwmon@hwmon-read:
>     - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#1125]) +1 other test skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-1/igt@intel_hwmon@hwmon-read.html
>     - shard-adlp:         NOTRUN -> [SKIP][4] ([Intel XE#1125]) +1 other test skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-4/igt@intel_hwmon@hwmon-read.html
> 
>   * igt@kms_3d:
>     - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#1465])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-5/igt@kms_3d.html
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#623])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>     - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1466])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2233])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_addfb_basic@bad-pitch-256:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#4208] / [i915#2575]) +5 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-463/igt@kms_addfb_basic@bad-pitch-256.html
> 
>   * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>     - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#3157])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-3/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
>     - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#3157])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip:
>     - shard-bmg:          NOTRUN -> [FAIL][12] ([Intel XE#827]) +1 other test fail
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#3767]) +31 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-435/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-d-hdmi-a-1-y:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][14] ([Intel XE#4543]) +3 other tests dmesg-warn
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-d-hdmi-a-1-y.html
> 
>   * igt@kms_async_flips@invalid-async-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#873])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-3/igt@kms_async_flips@invalid-async-flip.html
>     - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#873])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-7/igt@kms_async_flips@invalid-async-flip.html
> 
>   * igt@kms_async_flips@invalid-async-flip-atomic:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#3768])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-466/igt@kms_async_flips@invalid-async-flip-atomic.html
>     - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#3768])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-1/igt@kms_async_flips@invalid-async-flip-atomic.html
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#3768])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-7/igt@kms_async_flips@invalid-async-flip-atomic.html
> 
>   * igt@kms_async_flips@test-cursor-atomic:
>     - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#664]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-8/igt@kms_async_flips@test-cursor-atomic.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>     - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#3279]) +1 other test skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2370]) +1 other test skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2327]) +22 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
>     - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1124]) +63 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-2/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#316]) +14 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@4-tiled-addfb:
>     - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#619]) +1 other test skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-3/igt@kms_big_fb@4-tiled-addfb.html
> 
>   * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
>     - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#607]) +1 other test skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-1/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@4-tiled-addfb-size-overflow:
>     - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#610]) +1 other test skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-8/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#3658]) +3 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-90:
>     - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#1407]) +27 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-6/igt@kms_big_fb@linear-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
>     - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1124]) +59 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-8/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#316]) +23 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-2/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-addfb:
>     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2328]) +1 other test skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#607]) +1 other test skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
>     - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#1477]) +1 other test skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#610]) +1 other test skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1428]) +1 other test skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#610]) +1 other test skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
>     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#1124]) +59 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1124]) +41 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#619]) +1 other test skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html
>     - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1467]) +1 other test skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-4/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#607]) +1 other test skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
>     - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#2191]) +6 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2314] / [Intel XE#2894]) +6 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
>     - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#2191]) +10 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-3/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#2191]) +4 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1512]) +6 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-3/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#367]) +14 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#367]) +7 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#367]) +11 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#367]) +16 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-4/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
>     - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#2887]) +86 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#2907]) +6 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#2669]) +19 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-3/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#455] / [Intel XE#787]) +201 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-9/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#3442]) +1 other test skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#3442]) +1 other test skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#2669] / [Intel XE#3433]) +3 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#3432]) +10 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#787]) +302 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2652] / [Intel XE#787]) +36 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#3432]) +10 other tests skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#787]) +405 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-2:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#455] / [Intel XE#787]) +115 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-2.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][66] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][67] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2887]) +88 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][69] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][70] ([Intel XE#2705] / [Intel XE#4212])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#2907]) +9 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
> 
>   * igt@kms_cdclk@mode-transition:
>     - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#4417] / [Intel XE#455])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-1/igt@kms_cdclk@mode-transition.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#4418])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-3/igt@kms_cdclk@mode-transition-all-outputs.html
>     - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2724]) +2 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#4418])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html
>     - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#4418])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-8/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#4417]) +3 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-5/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#4417]) +2 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-1/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#4417]) +3 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-466/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html
> 
>   * igt@kms_cdclk@plane-scaling:
>     - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#4416]) +3 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-8/igt@kms_cdclk@plane-scaling.html
>     - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#4416] / [Intel XE#455])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-6/igt@kms_cdclk@plane-scaling.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#4416]) +3 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-436/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#4416]) +2 other tests skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-6/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_chamelium_color@ctm-0-25:
>     - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#306]) +10 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-2/igt@kms_chamelium_color@ctm-0-25.html
>     - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2325]) +8 other tests skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-2/igt@kms_chamelium_color@ctm-0-25.html
> 
>   * igt@kms_chamelium_color@ctm-blue-to-red:
>     - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#306]) +9 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-6/igt@kms_chamelium_color@ctm-blue-to-red.html
> 
>   * igt@kms_chamelium_color@ctm-red-to-blue:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#306]) +8 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-463/igt@kms_chamelium_color@ctm-red-to-blue.html
> 
>   * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
>     - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2252]) +57 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
>     - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#373]) +57 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-6/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-storm:
>     - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#373]) +59 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd-storm.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#373]) +44 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#307]) +3 other tests skip
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-8/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#307]) +2 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-433/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#307]) +3 other tests skip
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-6/igt@kms_content_protection@dp-mst-type-1.html
>     - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2390]) +2 other tests skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-8/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2341]) +5 other tests skip
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-6/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@lic-type-0:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][97] ([Intel XE#1178]) +6 other tests fail
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-466/igt@kms_content_protection@lic-type-0.html
> 
>   * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][98] ([Intel XE#3304])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-466/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#1468])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-5/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_content_protection@srm@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][100] ([Intel XE#1178]) +5 other tests fail
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-5/igt@kms_content_protection@srm@pipe-a-dp-2.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][101] ([Intel XE#1188]) +1 other test fail
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-434/igt@kms_content_protection@uevent.html
>     - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#5176]) +7 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-1/igt@kms_content_protection@uevent.html
>     - shard-bmg:          NOTRUN -> [FAIL][103] ([Intel XE#1188]) +1 other test fail
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-2/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-128x42:
>     - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2320]) +27 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-128x42.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#308]) +8 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#2321]) +8 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-512x512.html
>     - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#308]) +8 other tests skip
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-6/igt@kms_cursor_crc@cursor-sliding-512x512.html
>     - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2321]) +7 other tests skip
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-64x21:
>     - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#1424]) +28 other tests skip
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-64x21.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
>     - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2291]) +6 other tests skip
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>     - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#309]) +26 other tests skip
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>     - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#309]) +28 other tests skip
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#323]) +2 other tests skip
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>     - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#323]) +2 other tests skip
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>     - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#2286]) +2 other tests skip
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#323]) +1 other test skip
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#1508])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
>     - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#4210])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-6/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
> 
>   * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>     - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#1508]) +1 other test skip
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#4302])
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-6/igt@kms_display_modes@extended-mode-basic.html
>     - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#4302])
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-6/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#1340])
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#4494] / [i915#3804])
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_dp_aux_dev:
>     - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#3009])
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-1/igt@kms_dp_aux_dev.html
> 
>   * igt@kms_dp_link_training@non-uhbr-mst:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#4354])
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-463/igt@kms_dp_link_training@non-uhbr-mst.html
> 
>   * igt@kms_dp_link_training@non-uhbr-sst:
>     - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#4354]) +1 other test skip
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-9/igt@kms_dp_link_training@non-uhbr-sst.html
> 
>   * igt@kms_dp_link_training@uhbr-mst:
>     - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#4354]) +3 other tests skip
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-4/igt@kms_dp_link_training@uhbr-mst.html
>     - shard-adlp:         NOTRUN -> [SKIP][128] ([Intel XE#4356]) +1 other test skip
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-6/igt@kms_dp_link_training@uhbr-mst.html
>     - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#4354]) +2 other tests skip
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-8/igt@kms_dp_link_training@uhbr-mst.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#4356]) +1 other test skip
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-435/igt@kms_dp_link_training@uhbr-mst.html
> 
>   * igt@kms_dp_linktrain_fallback@dp-fallback:
>     - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#4294])
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-5/igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>   * igt@kms_dp_linktrain_fallback@dsc-fallback:
>     - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#4331]) +1 other test skip
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#4331])
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-466/igt@kms_dp_linktrain_fallback@dsc-fallback.html
>     - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#4331])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html
>     - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#4331])
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#2244]) +6 other tests skip
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-7/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_dsc@dsc-with-output-formats:
>     - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#2244]) +7 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats.html
> 
>   * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
>     - shard-adlp:         NOTRUN -> [SKIP][138] ([Intel XE#4422]) +2 other tests skip
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
>     - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#4422]) +2 other tests skip
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#4422]) +1 other test skip
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-433/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
> 
>   * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
>     - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#4422]) +2 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-4/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#4156]) +1 other test skip
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-7/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-adlp:         NOTRUN -> [SKIP][143] ([Intel XE#776]) +1 other test skip
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-6/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#776]) +1 other test skip
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#776])
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-436/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#2372])
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-7/igt@kms_feature_discovery@chamelium.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#701])
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-466/igt@kms_feature_discovery@chamelium.html
>     - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#701])
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-1/igt@kms_feature_discovery@chamelium.html
>     - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#701])
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-9/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#702])
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-4/igt@kms_feature_discovery@display-2x.html
>     - shard-adlp:         NOTRUN -> [SKIP][151] ([Intel XE#702])
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-2/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-lnl:          NOTRUN -> [SKIP][152] ([Intel XE#703])
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-8/igt@kms_feature_discovery@display-3x.html
>     - shard-adlp:         NOTRUN -> [SKIP][153] ([Intel XE#703])
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-3/igt@kms_feature_discovery@display-3x.html
>     - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#2373]) +1 other test skip
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-5/igt@kms_feature_discovery@display-3x.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#703])
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-432/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#1138])
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-433/igt@kms_feature_discovery@display-4x.html
>     - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#1138])
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-3/igt@kms_feature_discovery@display-4x.html
>     - shard-adlp:         NOTRUN -> [SKIP][158] ([Intel XE#1138])
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-3/igt@kms_feature_discovery@display-4x.html
>     - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#1138])
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-7/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][160] ([Intel XE#1137])
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html
>     - shard-lnl:          NOTRUN -> [SKIP][161] ([Intel XE#1137])
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-7/igt@kms_feature_discovery@dp-mst.html
>     - shard-adlp:         NOTRUN -> [SKIP][162] ([Intel XE#1137])
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-4/igt@kms_feature_discovery@dp-mst.html
>     - shard-bmg:          NOTRUN -> [SKIP][163] ([Intel XE#2375])
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-4/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-adlp:         NOTRUN -> [SKIP][164] ([Intel XE#1135]) +1 other test skip
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-8/igt@kms_feature_discovery@psr1.html
>     - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#2374]) +1 other test skip
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-7/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][166] ([Intel XE#1135])
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-466/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip@2x-blocking-wf_vblank:
>     - shard-adlp:         NOTRUN -> [SKIP][167] ([Intel XE#310]) +42 other tests skip
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-3/igt@kms_flip@2x-blocking-wf_vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
>     - shard-bmg:          NOTRUN -> [FAIL][168] ([Intel XE#3321]) +10 other tests fail
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][169] ([Intel XE#301]) +15 other tests fail
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@2x-flip-vs-panning:
>     - shard-bmg:          NOTRUN -> [SKIP][170] ([Intel XE#2316]) +1 other test skip
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning.html
> 
>   * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
>     - shard-lnl:          NOTRUN -> [SKIP][171] ([Intel XE#1421]) +39 other tests skip
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-3/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
> 
>   * igt@kms_flip@bo-too-big-interruptible:
>     - shard-lnl:          NOTRUN -> [TIMEOUT][172] ([Intel XE#1504]) +1 other test timeout
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-2/igt@kms_flip@bo-too-big-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-adlp:         NOTRUN -> [FAIL][173] ([Intel XE#301]) +1 other test fail
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>     - shard-lnl:          NOTRUN -> [FAIL][174] ([Intel XE#301]) +5 other tests fail
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][175] ([Intel XE#301] / [Intel XE#3321]) +2 other tests fail
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
>     - shard-lnl:          NOTRUN -> [FAIL][176] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
> 
>   * igt@kms_flip@flip-vs-panning:
>     - shard-adlp:         NOTRUN -> [SKIP][177] ([Intel XE#4950]) +5 other tests skip
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-1/igt@kms_flip@flip-vs-panning.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][178] ([Intel XE#1397]) +8 other tests skip
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
>     - shard-lnl:          NOTRUN -> [FAIL][179] ([Intel XE#4683]) +3 other tests fail
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][180] ([Intel XE#2293]) +26 other tests skip
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][181] ([Intel XE#1401]) +25 other tests skip
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][182] ([Intel XE#2380]) +1 other test skip
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][183] ([Intel XE#1397] / [Intel XE#1745]) +8 other tests skip
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [FAIL][184] ([Intel XE#3106] / [Intel XE#4683]) +1 other test fail
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][185] ([Intel XE#4921]) +1 other test dmesg-fail
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][186] ([Intel XE#1401] / [Intel XE#1745]) +25 other tests skip
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][187] ([Intel XE#2293] / [Intel XE#2380]) +26 other tests skip
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][188] ([Intel XE#4543] / [Intel XE#4921]) +1 other test dmesg-fail
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - shard-lnl:          NOTRUN -> [SKIP][189] ([Intel XE#352]) +2 other tests skip
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-8/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
>     - shard-adlp:         NOTRUN -> [SKIP][190] ([Intel XE#651]) +85 other tests skip
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][191] ([Intel XE#656]) +238 other tests skip
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-suspend:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][192] ([Intel XE#651]) +135 other tests skip
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][193] ([Intel XE#4543]) +18 other tests dmesg-fail
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][194] ([Intel XE#4141]) +77 other tests skip
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][195] ([Intel XE#658]) +1 other test skip
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][196] ([Intel XE#4947]) +2 other tests skip
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][197] ([Intel XE#2311]) +153 other tests skip
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][198] ([Intel XE#651]) +79 other tests skip
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>     - shard-lnl:          NOTRUN -> [SKIP][199] ([Intel XE#1469]) +2 other tests skip
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
>     - shard-bmg:          NOTRUN -> [SKIP][200] ([Intel XE#2352]) +2 other tests skip
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>     - shard-adlp:         NOTRUN -> [SKIP][201] ([Intel XE#1151]) +2 other tests skip
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][202] ([Intel XE#1158])
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-466/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
>     - shard-adlp:         NOTRUN -> [SKIP][203] ([Intel XE#1158])
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-9/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
>     - shard-bmg:          NOTRUN -> [SKIP][204] ([Intel XE#2350])
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][205] ([Intel XE#2313]) +155 other tests skip
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][206] ([Intel XE#653]) +85 other tests skip
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][207] ([Intel XE#2312]) +41 other tests skip
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][208] ([Intel XE#653]) +136 other tests skip
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][209] ([Intel XE#656]) +229 other tests skip
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_getfb@getfb-reject-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][210] ([Intel XE#605])
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-5/igt@kms_getfb@getfb-reject-ccs.html
>     - shard-bmg:          NOTRUN -> [SKIP][211] ([Intel XE#2502])
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-8/igt@kms_getfb@getfb-reject-ccs.html
>     - shard-adlp:         NOTRUN -> [SKIP][212] ([Intel XE#1341])
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-3/igt@kms_getfb@getfb-reject-ccs.html
> 
>   * igt@kms_getfb@getfb2-accept-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][213] ([Intel XE#1339])
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-1/igt@kms_getfb@getfb2-accept-ccs.html
>     - shard-bmg:          NOTRUN -> [SKIP][214] ([Intel XE#2340])
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-3/igt@kms_getfb@getfb2-accept-ccs.html
> 
>   * igt@kms_hdmi_inject@inject-4k:
>     - shard-lnl:          NOTRUN -> [SKIP][215] ([Intel XE#1470])
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-3/igt@kms_hdmi_inject@inject-4k.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-lnl:          NOTRUN -> [SKIP][216] ([Intel XE#1470] / [Intel XE#2853])
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-4/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_hdr@bpc-switch-suspend:
>     - shard-bmg:          NOTRUN -> [ABORT][217] ([Intel XE#2705])
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-5/igt@kms_hdr@bpc-switch-suspend.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-lnl:          NOTRUN -> [SKIP][218] ([Intel XE#3374] / [Intel XE#3544])
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-2/igt@kms_hdr@brightness-with-hdr.html
>     - shard-bmg:          NOTRUN -> [SKIP][219] ([Intel XE#3374] / [Intel XE#3544])
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_hdr@invalid-metadata-sizes:
>     - shard-lnl:          NOTRUN -> [SKIP][220] ([Intel XE#1503]) +4 other tests skip
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-5/igt@kms_hdr@invalid-metadata-sizes.html
>     - shard-bmg:          NOTRUN -> [SKIP][221] ([Intel XE#1503]) +1 other test skip
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html
> 
>   * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][222] ([Intel XE#1450]) +1 other test skip
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-6/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html
> 
>   * igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][223] ([Intel XE#1450] / [Intel XE#2568]) +1 other test skip
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-6/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html
> 
>   * igt@kms_joiner@basic-big-joiner:
>     - shard-lnl:          NOTRUN -> [SKIP][224] ([Intel XE#346]) +1 other test skip
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-8/igt@kms_joiner@basic-big-joiner.html
>     - shard-adlp:         NOTRUN -> [SKIP][225] ([Intel XE#346]) +1 other test skip
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-6/igt@kms_joiner@basic-big-joiner.html
>     - shard-bmg:          NOTRUN -> [SKIP][226] ([Intel XE#346]) +1 other test skip
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-5/igt@kms_joiner@basic-big-joiner.html
> 
>   * igt@kms_joiner@basic-max-non-joiner:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][227] ([Intel XE#4298])
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-463/igt@kms_joiner@basic-max-non-joiner.html
>     - shard-adlp:         NOTRUN -> [SKIP][228] ([Intel XE#4298])
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-1/igt@kms_joiner@basic-max-non-joiner.html
>     - shard-bmg:          NOTRUN -> [SKIP][229] ([Intel XE#4298])
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-3/igt@kms_joiner@basic-max-non-joiner.html
> 
>   * igt@kms_joiner@basic-ultra-joiner:
>     - shard-lnl:          NOTRUN -> [SKIP][230] ([Intel XE#2927]) +1 other test skip
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-4/igt@kms_joiner@basic-ultra-joiner.html
>     - shard-adlp:         NOTRUN -> [SKIP][231] ([Intel XE#2927]) +1 other test skip
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-2/igt@kms_joiner@basic-ultra-joiner.html
>     - shard-bmg:          NOTRUN -> [SKIP][232] ([Intel XE#2927]) +1 other test skip
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-6/igt@kms_joiner@basic-ultra-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-big-joiner:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][233] ([Intel XE#346]) +1 other test skip
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-435/igt@kms_joiner@invalid-modeset-big-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-force-big-joiner:
>     - shard-adlp:         NOTRUN -> [SKIP][234] ([Intel XE#3012]) +1 other test skip
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>     - shard-adlp:         NOTRUN -> [SKIP][235] ([Intel XE#2925]) +2 other tests skip
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
>     - shard-bmg:          NOTRUN -> [SKIP][236] ([Intel XE#2934]) +1 other test skip
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
>     - shard-lnl:          NOTRUN -> [SKIP][237] ([Intel XE#2934]) +1 other test skip
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-ultra-joiner:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][238] ([Intel XE#2927]) +1 other test skip
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html
> 
>   * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][239] ([Intel XE#2925])
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-436/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
>     - shard-lnl:          NOTRUN -> [SKIP][240] ([Intel XE#4090])
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-adlp:         NOTRUN -> [SKIP][241] ([Intel XE#356])
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>     - shard-bmg:          NOTRUN -> [SKIP][242] ([Intel XE#2501])
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][243] ([Intel XE#356])
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>     - shard-lnl:          NOTRUN -> [SKIP][244] ([Intel XE#356])
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-bmg:          NOTRUN -> [SKIP][245] ([Intel XE#2486]) +1 other test skip
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-5/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
>     - shard-bmg:          NOTRUN -> [SKIP][246] ([Intel XE#4329])
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-7/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][247] ([Intel XE#4359])
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-466/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
>     - shard-lnl:          NOTRUN -> [SKIP][248] ([Intel XE#4329])
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-1/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
> 
>   * igt@kms_plane@pixel-format-source-clamping:
>     - shard-lnl:          NOTRUN -> [INCOMPLETE][249] ([Intel XE#4735])
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-7/igt@kms_plane@pixel-format-source-clamping.html
>     - shard-adlp:         NOTRUN -> [INCOMPLETE][250] ([Intel XE#1035]) +1 other test incomplete
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-8/igt@kms_plane@pixel-format-source-clamping.html
> 
>   * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
>     - shard-lnl:          NOTRUN -> [WARN][251] ([Intel XE#4801])
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-7/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html
>     - shard-adlp:         NOTRUN -> [WARN][252] ([Intel XE#2078]) +3 other tests warn
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-8/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html
> 
>   * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][253] ([Intel XE#599]) +13 other tests skip
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-6/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html
> 
>   * igt@kms_plane_lowres@tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][254] ([Intel XE#2393]) +1 other test skip
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html
> 
>   * igt@kms_plane_multiple@2x-tiling-4:
>     - shard-adlp:         NOTRUN -> [SKIP][255] ([Intel XE#4596]) +4 other tests skip
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-4/igt@kms_plane_multiple@2x-tiling-4.html
> 
>   * igt@kms_plane_multiple@2x-tiling-y:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][256] ([Intel XE#5021])
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-433/igt@kms_plane_multiple@2x-tiling-y.html
>     - shard-lnl:          NOTRUN -> [SKIP][257] ([Intel XE#4596]) +3 other tests skip
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-3/igt@kms_plane_multiple@2x-tiling-y.html
>     - shard-bmg:          NOTRUN -> [SKIP][258] ([Intel XE#5021])
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-bmg:          NOTRUN -> [SKIP][259] ([Intel XE#4596])
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>   * igt@kms_plane_multiple@tiling-4:
>     - shard-adlp:         NOTRUN -> [SKIP][260] ([Intel XE#5020]) +1 other test skip
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-8/igt@kms_plane_multiple@tiling-4.html
> 
>   * igt@kms_plane_multiple@tiling-x@pipe-c-edp-1:
>     - shard-lnl:          NOTRUN -> [FAIL][261] ([Intel XE#4658]) +3 other tests fail
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-6/igt@kms_plane_multiple@tiling-x@pipe-c-edp-1.html
> 
>   * igt@kms_plane_multiple@tiling-y:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][262] ([Intel XE#5020]) +1 other test skip
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-433/igt@kms_plane_multiple@tiling-y.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-lnl:          NOTRUN -> [SKIP][263] ([Intel XE#5020]) +1 other test skip
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-7/igt@kms_plane_multiple@tiling-yf.html
>     - shard-bmg:          NOTRUN -> [SKIP][264] ([Intel XE#5020]) +1 other test skip
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-4/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-lnl:          NOTRUN -> [SKIP][265] ([Intel XE#3307])
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-1/igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
>     - shard-lnl:          NOTRUN -> [SKIP][266] ([Intel XE#2763]) +49 other tests skip
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
>     - shard-bmg:          NOTRUN -> [SKIP][267] ([Intel XE#2763]) +24 other tests skip
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
> 
>   * igt@kms_pm_backlight@bad-brightness:
>     - shard-bmg:          NOTRUN -> [SKIP][268] ([Intel XE#870]) +4 other tests skip
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-5/igt@kms_pm_backlight@bad-brightness.html
>     - shard-adlp:         NOTRUN -> [SKIP][269] ([Intel XE#870]) +4 other tests skip
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-6/igt@kms_pm_backlight@bad-brightness.html
> 
>   * igt@kms_pm_backlight@brightness-with-dpms:
>     - shard-bmg:          NOTRUN -> [SKIP][270] ([Intel XE#2938])
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html
>     - shard-adlp:         NOTRUN -> [SKIP][271] ([Intel XE#2938])
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-3/igt@kms_pm_backlight@brightness-with-dpms.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][272] ([Intel XE#2938])
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-432/igt@kms_pm_backlight@brightness-with-dpms.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][273] ([Intel XE#870]) +4 other tests skip
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-433/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-adlp:         NOTRUN -> [SKIP][274] ([Intel XE#1122]) +4 other tests skip
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-8/igt@kms_pm_dc@dc3co-vpb-simulation.html
>     - shard-lnl:          NOTRUN -> [SKIP][275] ([Intel XE#736])
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-7/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc5-dpms-negative:
>     - shard-lnl:          NOTRUN -> [SKIP][276] ([Intel XE#1131])
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-1/igt@kms_pm_dc@dc5-dpms-negative.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][277] ([Intel XE#1129]) +1 other test skip
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@dc5-retention-flops:
>     - shard-lnl:          NOTRUN -> [SKIP][278] ([Intel XE#3309])
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-6/igt@kms_pm_dc@dc5-retention-flops.html
>     - shard-adlp:         NOTRUN -> [SKIP][279] ([Intel XE#3309])
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-6/igt@kms_pm_dc@dc5-retention-flops.html
>     - shard-bmg:          NOTRUN -> [SKIP][280] ([Intel XE#3309])
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-adlp:         NOTRUN -> [FAIL][281] ([Intel XE#718])
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-4/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-lnl:          NOTRUN -> [FAIL][282] ([Intel XE#718]) +1 other test fail
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html
>     - shard-bmg:          NOTRUN -> [SKIP][283] ([Intel XE#2392]) +1 other test skip
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-8/igt@kms_pm_dc@dc6-psr.html
>     - shard-adlp:         NOTRUN -> [SKIP][284] ([Intel XE#1129]) +1 other test skip
>    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-6/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_pm_dc@dc9-dpms:
>     - shard-adlp:         NOTRUN -> [SKIP][285] ([Intel XE#734])
>    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-9/igt@kms_pm_dc@dc9-dpms.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-lnl:          NOTRUN -> [FAIL][286] ([Intel XE#2029])
>    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
>     - shard-adlp:         NOTRUN -> [SKIP][287] ([Intel XE#2007])
>    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-2/igt@kms_pm_dc@deep-pkgc.html
>     - shard-bmg:          NOTRUN -> [SKIP][288] ([Intel XE#2505])
>    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-6/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - shard-bmg:          NOTRUN -> [SKIP][289] ([Intel XE#2499])
>    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-3/igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@kms_pm_rpm@dpms-lpsp:
>     - shard-bmg:          NOTRUN -> [SKIP][290] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) +3 other tests skip
>    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-4/igt@kms_pm_rpm@dpms-lpsp.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>     - shard-bmg:          NOTRUN -> [SKIP][291] ([Intel XE#1439] / [Intel XE#836])
>    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>     - shard-lnl:          NOTRUN -> [SKIP][292] ([Intel XE#1439] / [Intel XE#836])
>    [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
> 
>   * igt@kms_pm_rpm@dpms-non-lpsp:
>     - shard-adlp:         NOTRUN -> [SKIP][293] ([Intel XE#836]) +4 other tests skip
>    [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-4/igt@kms_pm_rpm@dpms-non-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-lnl:          NOTRUN -> [SKIP][294] ([Intel XE#1439] / [Intel XE#3141]) +3 other tests skip
>    [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][295] ([Intel XE#1489]) +33 other tests skip
>    [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][296] ([Intel XE#1489]) +48 other tests skip
>    [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][297] ([Intel XE#4608]) +19 other tests skip
>    [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
>     - shard-lnl:          NOTRUN -> [SKIP][298] ([Intel XE#2893] / [Intel XE#4608]) +9 other tests skip
>    [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
>     - shard-lnl:          NOTRUN -> [SKIP][299] ([Intel XE#2893]) +23 other tests skip
>    [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-8/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
>     - shard-bmg:          NOTRUN -> [SKIP][300] ([Intel XE#1489]) +46 other tests skip
>    [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-5/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-lnl:          NOTRUN -> [SKIP][301] ([Intel XE#1128]) +3 other tests skip
>    [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-bmg:          NOTRUN -> [SKIP][302] ([Intel XE#2387]) +3 other tests skip
>    [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-1/igt@kms_psr2_su@page_flip-xrgb8888.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][303] ([Intel XE#1122]) +1 other test skip
>    [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-435/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@fbc-pr-no-drrs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][304] ([Intel XE#2850] / [Intel XE#929]) +67 other tests skip
>    [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-466/igt@kms_psr@fbc-pr-no-drrs.html
> 
>   * igt@kms_psr@fbc-pr-sprite-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][305] ([Intel XE#2850] / [Intel XE#929]) +89 other tests skip
>    [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-3/igt@kms_psr@fbc-pr-sprite-blt.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-render:
>     - shard-bmg:          NOTRUN -> [SKIP][306] ([Intel XE#2234] / [Intel XE#2850]) +84 other tests skip
>    [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-8/igt@kms_psr@fbc-psr2-cursor-render.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-render@edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][307] ([Intel XE#4609]) +12 other tests skip
>    [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html
> 
>   * igt@kms_psr@pr-sprite-render:
>     - shard-lnl:          NOTRUN -> [SKIP][308] ([Intel XE#1406]) +41 other tests skip
>    [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-5/igt@kms_psr@pr-sprite-render.html
> 
>   * igt@kms_psr@psr2-primary-render:
>     - shard-bmg:          NOTRUN -> [SKIP][309] ([Intel XE#2234])
>    [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-5/igt@kms_psr@psr2-primary-render.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-bmg:          NOTRUN -> [SKIP][310] ([Intel XE#2414]) +1 other test skip
>    [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][311] ([Intel XE#2939]) +1 other test skip
>    [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-adlp:         NOTRUN -> [SKIP][312] ([Intel XE#2939]) +1 other test skip
>    [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
>     - shard-adlp:         NOTRUN -> [FAIL][313] ([Intel XE#1874]) +2 other tests fail
>    [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-1/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
> 
>   * igt@kms_rotation_crc@primary-rotation-90:
>     - shard-lnl:          NOTRUN -> [SKIP][314] ([Intel XE#3414] / [Intel XE#3904]) +12 other tests skip
>    [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-7/igt@kms_rotation_crc@primary-rotation-90.html
> 
>   * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
>     - shard-lnl:          NOTRUN -> [FAIL][315] ([Intel XE#4689]) +1 other test fail
>    [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-1/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][316] ([Intel XE#1127]) +1 other test skip
>    [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-bmg:          NOTRUN -> [SKIP][317] ([Intel XE#2330]) +3 other tests skip
>    [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][318] ([Intel XE#3414]) +5 other tests skip
>    [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-lnl:          NOTRUN -> [SKIP][319] ([Intel XE#1127]) +2 other tests skip
>    [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
>     - shard-adlp:         NOTRUN -> [SKIP][320] ([Intel XE#1127]) +3 other tests skip
>    [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90:
>     - shard-adlp:         NOTRUN -> [SKIP][321] ([Intel XE#3414]) +10 other tests skip
>    [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-6/igt@kms_rotation_crc@sprite-rotation-90.html
>     - shard-bmg:          NOTRUN -> [SKIP][322] ([Intel XE#3414] / [Intel XE#3904]) +10 other tests skip
>    [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-8/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>   * igt@kms_scaling_modes@scaling-mode-center:
>     - shard-bmg:          NOTRUN -> [SKIP][323] ([Intel XE#2413]) +2 other tests skip
>    [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-center.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - shard-bmg:          NOTRUN -> [SKIP][324] ([Intel XE#1435]) +2 other tests skip
>    [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-7/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@kms_setmode@basic@pipe-b-hdmi-a-2-pipe-a-dp-2:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][325] ([Intel XE#2883]) +4 other tests fail
>    [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-432/igt@kms_setmode@basic@pipe-b-hdmi-a-2-pipe-a-dp-2.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc:
>     - shard-lnl:          NOTRUN -> [SKIP][326] ([Intel XE#1435]) +4 other tests skip
>    [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-6/igt@kms_setmode@invalid-clone-single-crtc.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-adlp:         NOTRUN -> [SKIP][327] ([Intel XE#362]) +1 other test skip
>    [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-9/igt@kms_tiled_display@basic-test-pattern.html
>     - shard-bmg:          NOTRUN -> [SKIP][328] ([Intel XE#2426]) +1 other test skip
>    [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html
>     - shard-dg2-set2:     NOTRUN -> [FAIL][329] ([Intel XE#1729])
>    [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-lnl:          NOTRUN -> [SKIP][330] ([Intel XE#362]) +1 other test skip
>    [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][331] ([Intel XE#1500])
>    [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][332] ([Intel XE#330])
>    [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-436/igt@kms_tv_load_detect@load-detect.html
>     - shard-lnl:          NOTRUN -> [SKIP][333] ([Intel XE#330])
>    [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-7/igt@kms_tv_load_detect@load-detect.html
>     - shard-adlp:         NOTRUN -> [SKIP][334] ([Intel XE#330])
>    [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-8/igt@kms_tv_load_detect@load-detect.html
>     - shard-bmg:          NOTRUN -> [SKIP][335] ([Intel XE#2450])
>    [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-4/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@kms_vrr@cmrr@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [FAIL][336] ([Intel XE#4459]) +1 other test fail
>    [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> 
>   * igt@kms_vrr@flip-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][337] ([Intel XE#455]) +136 other tests skip
>    [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-3/igt@kms_vrr@flip-suspend.html
>     - shard-bmg:          NOTRUN -> [SKIP][338] ([Intel XE#1499]) +8 other tests skip
>    [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-5/igt@kms_vrr@flip-suspend.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][339] ([Intel XE#455]) +72 other tests skip
>    [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-463/igt@kms_vrr@flipline.html
> 
>   * igt@kms_vrr@lobf:
>     - shard-adlp:         NOTRUN -> [SKIP][340] ([Intel XE#2168]) +1 other test skip
>    [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-8/igt@kms_vrr@lobf.html
>     - shard-bmg:          NOTRUN -> [SKIP][341] ([Intel XE#2168]) +1 other test skip
>    [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-1/igt@kms_vrr@lobf.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][342] ([Intel XE#2168]) +1 other test skip
>    [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-435/igt@kms_vrr@lobf.html
> 
>   * igt@kms_vrr@negative-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][343] ([Intel XE#1499]) +3 other tests skip
>    [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-1/igt@kms_vrr@negative-basic.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][344] ([Intel XE#1091] / [Intel XE#2849])
>    [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
>     - shard-lnl:          NOTRUN -> [SKIP][345] ([Intel XE#1091] / [Intel XE#2849]) +1 other test skip
>    [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
>     - shard-bmg:          NOTRUN -> [SKIP][346] ([Intel XE#1091] / [Intel XE#2849]) +1 other test skip
>    [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-2/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
> 
>   * igt@xe_ccs@block-copy-compressed-inc-dimension:
>     - shard-adlp:         NOTRUN -> [SKIP][347] ([Intel XE#455] / [Intel XE#488]) +6 other tests skip
>    [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-6/igt@xe_ccs@block-copy-compressed-inc-dimension.html
> 
>   * igt@xe_ccs@large-ctrl-surf-copy:
>     - shard-adlp:         NOTRUN -> [SKIP][348] ([Intel XE#3576])
>    [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-1/igt@xe_ccs@large-ctrl-surf-copy.html
> 
>   * igt@xe_compute@ccs-mode-basic:
>     - shard-adlp:         NOTRUN -> [SKIP][349] ([Intel XE#1447]) +1 other test skip
>    [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-1/igt@xe_compute@ccs-mode-basic.html
> 
>   * igt@xe_compute@ccs-mode-compute-kernel:
>     - shard-lnl:          NOTRUN -> [SKIP][350] ([Intel XE#1447])
>    [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-4/igt@xe_compute@ccs-mode-compute-kernel.html
> 
>   * igt@xe_configfs@survivability-mode:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][351] ([Intel XE#5084])
>    [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-434/igt@xe_configfs@survivability-mode.html
>     - shard-lnl:          NOTRUN -> [SKIP][352] ([Intel XE#5084])
>    [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-7/igt@xe_configfs@survivability-mode.html
>     - shard-adlp:         NOTRUN -> [SKIP][353] ([Intel XE#5084])
>    [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-8/igt@xe_configfs@survivability-mode.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x369:
>     - shard-adlp:         NOTRUN -> [SKIP][354] ([Intel XE#1123]) +3 other tests skip
>    [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-1/igt@xe_copy_basic@mem-copy-linear-0x369.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfffe:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][355] ([Intel XE#1123]) +2 other tests skip
>    [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x3fff:
>     - shard-adlp:         NOTRUN -> [SKIP][356] ([Intel XE#1126]) +3 other tests skip
>    [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0x3fff.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfffe:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][357] ([Intel XE#1126]) +3 other tests skip
>    [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html
> 
>   * igt@xe_create@create-big-vram:
>     - shard-lnl:          NOTRUN -> [SKIP][358] ([Intel XE#1062])
>    [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-3/igt@xe_create@create-big-vram.html
>     - shard-adlp:         NOTRUN -> [SKIP][359] ([Intel XE#1062])
>    [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-8/igt@xe_create@create-big-vram.html
> 
>   * igt@xe_create@multigpu-create-massive-size:
>     - shard-bmg:          NOTRUN -> [SKIP][360] ([Intel XE#2504])
>    [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-1/igt@xe_create@multigpu-create-massive-size.html
> 
>   * igt@xe_eu_stall@blocking-re-enable:
>     - shard-adlp:         NOTRUN -> [SKIP][361] ([Intel XE#4497]) +7 other tests skip
>    [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-2/igt@xe_eu_stall@blocking-re-enable.html
> 
>   * igt@xe_eu_stall@blocking-read:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][362] ([Intel XE#4497]) +6 other tests skip
>    [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-435/igt@xe_eu_stall@blocking-read.html
> 
>   * igt@xe_eudebug@basic-vm-access-faultable:
>     - shard-lnl:          NOTRUN -> [SKIP][363] ([Intel XE#4837]) +77 other tests skip
>    [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-1/igt@xe_eudebug@basic-vm-access-faultable.html
> 
>   * igt@xe_eudebug_online@basic-breakpoint:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][364] ([Intel XE#4837]) +60 other tests skip
>    [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-432/igt@xe_eudebug_online@basic-breakpoint.html
> 
>   * igt@xe_eudebug_online@set-breakpoint-faultable:
>     - shard-bmg:          NOTRUN -> [SKIP][365] ([Intel XE#4837]) +76 other tests skip
>    [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-5/igt@xe_eudebug_online@set-breakpoint-faultable.html
> 
>   * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
>     - shard-adlp:         NOTRUN -> [SKIP][366] ([Intel XE#4837]) +80 other tests skip
>    [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-4/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
> 
>   * igt@xe_eudebug_sriov@deny-sriov:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][367] ([Intel XE#4518])
>    [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-436/igt@xe_eudebug_sriov@deny-sriov.html
>     - shard-lnl:          NOTRUN -> [SKIP][368] ([Intel XE#4518]) +1 other test skip
>    [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-5/igt@xe_eudebug_sriov@deny-sriov.html
>     - shard-adlp:         NOTRUN -> [SKIP][369] ([Intel XE#4519]) +1 other test skip
>    [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-9/igt@xe_eudebug_sriov@deny-sriov.html
>     - shard-bmg:          NOTRUN -> [SKIP][370] ([Intel XE#4518]) +1 other test skip
>    [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-3/igt@xe_eudebug_sriov@deny-sriov.html
> 
>   * igt@xe_evict@evict-beng-large-external-cm:
>     - shard-lnl:          NOTRUN -> [SKIP][371] ([Intel XE#688]) +27 other tests skip
>    [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-2/igt@xe_evict@evict-beng-large-external-cm.html
> 
>   * igt@xe_evict@evict-small-external-cm:
>     - shard-adlp:         NOTRUN -> [SKIP][372] ([Intel XE#261] / [Intel XE#688]) +19 other tests skip
>    [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-2/igt@xe_evict@evict-small-external-cm.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
>     - shard-adlp:         NOTRUN -> [SKIP][373] ([Intel XE#688]) +8 other tests skip
>    [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html
> 
>   * igt@xe_exec_basic@many-execqueues-basic:
>     - shard-adlp:         NOTRUN -> [SKIP][374] ([Intel XE#4945]) +13 other tests skip
>    [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-1/igt@xe_exec_basic@many-execqueues-basic.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
>     - shard-bmg:          NOTRUN -> [SKIP][375] ([Intel XE#2322]) +50 other tests skip
>    [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][376] ([Intel XE#1392]) +6 other tests skip
>    [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
>     - shard-adlp:         NOTRUN -> [SKIP][377] ([Intel XE#1392]) +53 other tests skip
>    [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-userptr:
>     - shard-lnl:          NOTRUN -> [SKIP][378] ([Intel XE#1392]) +51 other tests skip
>    [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-userptr.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-userptr-rebind:
>     - shard-adlp:         NOTRUN -> [SKIP][379] ([Intel XE#288]) +153 other tests skip
>    [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][380] ([Intel XE#288]) +109 other tests skip
>    [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
> 
>   * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][381] ([Intel XE#2360]) +2 other tests skip
>    [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-466/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
> 
>   * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
>     - shard-adlp:         NOTRUN -> [SKIP][382] ([Intel XE#2360]) +3 other tests skip
>    [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
> 
>   * igt@xe_exec_reset@cat-error:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][383] ([Intel XE#3868])
>    [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-9/igt@xe_exec_reset@cat-error.html
> 
>   * igt@xe_exec_reset@cm-cat-error:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][384] ([Intel XE#3868])
>    [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-3/igt@xe_exec_reset@cm-cat-error.html
> 
>   * igt@xe_exec_reset@parallel-gt-reset:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][385] ([Intel XE#3876])
>    [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-5/igt@xe_exec_reset@parallel-gt-reset.html
> 
>   * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge:
>     - shard-bmg:          NOTRUN -> [SKIP][386] ([Intel XE#4943]) +138 other tests skip
>    [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-7/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge.html
> 
>   * igt@xe_exec_system_allocator@process-many-stride-mmap-mlock:
>     - shard-adlp:         NOTRUN -> [SKIP][387] ([Intel XE#4915]) +1524 other tests skip
>    [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-4/igt@xe_exec_system_allocator@process-many-stride-mmap-mlock.html
> 
>   * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][388] ([Intel XE#4915]) +1120 other tests skip
>    [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-433/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
>     - shard-lnl:          NOTRUN -> [FAIL][389] ([Intel XE#4937])
>    [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-race:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][390] ([Intel XE#3428])
>    [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-race.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
>     - shard-lnl:          NOTRUN -> [FAIL][391] ([Intel XE#5018])
>    [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
> 
>   * igt@xe_exec_system_allocator@twice-mmap-huge:
>     - shard-lnl:          NOTRUN -> [SKIP][392] ([Intel XE#4943]) +137 other tests skip
>    [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-4/igt@xe_exec_system_allocator@twice-mmap-huge.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults:
>     - shard-lnl:          NOTRUN -> [ABORT][393] ([Intel XE#4757])
>    [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-5/igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults.html
> 
>   * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>     - shard-dg2-set2:     NOTRUN -> [ABORT][394] ([Intel XE#4917])
>    [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
>     - shard-lnl:          NOTRUN -> [ABORT][395] ([Intel XE#4917])
>    [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
>     - shard-adlp:         NOTRUN -> [ABORT][396] ([Intel XE#4917])
>    [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
> 
>   * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][397] ([Intel XE#4911])
>    [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-463/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
>     - shard-adlp:         NOTRUN -> [TIMEOUT][398] ([Intel XE#4911])
>    [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
>     - shard-bmg:          NOTRUN -> [ABORT][399] ([Intel XE#4911])
>    [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
> 
>   * igt@xe_huc_copy@huc_copy:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][400] ([Intel XE#255])
>    [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-466/igt@xe_huc_copy@huc_copy.html
> 
>   * igt@xe_live_ktest@xe_bo:
>     - shard-adlp:         NOTRUN -> [SKIP][401] ([Intel XE#2229] / [Intel XE#455]) +1 other test skip
>    [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-4/igt@xe_live_ktest@xe_bo.html
> 
>   * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
>     - shard-bmg:          NOTRUN -> [SKIP][402] ([Intel XE#2229])
>    [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
> 
>   * igt@xe_live_ktest@xe_eudebug:
>     - shard-lnl:          NOTRUN -> [SKIP][403] ([Intel XE#2833])
>    [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-8/igt@xe_live_ktest@xe_eudebug.html
>     - shard-bmg:          NOTRUN -> [SKIP][404] ([Intel XE#2833])
>    [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-5/igt@xe_live_ktest@xe_eudebug.html
> 
>   * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>     - shard-lnl:          NOTRUN -> [SKIP][405] ([Intel XE#2229]) +1 other test skip
>    [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-5/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
>     - shard-adlp:         NOTRUN -> [SKIP][406] ([Intel XE#2229]) +1 other test skip
>    [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-9/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
> 
>   * igt@xe_media_fill@media-fill:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][407] ([Intel XE#560])
>    [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-432/igt@xe_media_fill@media-fill.html
>     - shard-lnl:          NOTRUN -> [SKIP][408] ([Intel XE#560])
>    [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-7/igt@xe_media_fill@media-fill.html
>     - shard-bmg:          NOTRUN -> [SKIP][409] ([Intel XE#2459] / [Intel XE#2596])
>    [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-4/igt@xe_media_fill@media-fill.html
> 
>   * igt@xe_mmap@pci-membarrier:
>     - shard-lnl:          NOTRUN -> [SKIP][410] ([Intel XE#5100]) +3 other tests skip
>    [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-2/igt@xe_mmap@pci-membarrier.html
>     - shard-adlp:         NOTRUN -> [SKIP][411] ([Intel XE#5100]) +3 other tests skip
>    [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-9/igt@xe_mmap@pci-membarrier.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-lnl:          NOTRUN -> [SKIP][412] ([Intel XE#512])
>    [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-3/igt@xe_mmap@small-bar.html
>     - shard-adlp:         NOTRUN -> [SKIP][413] ([Intel XE#512])
>    [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-8/igt@xe_mmap@small-bar.html
>     - shard-bmg:          NOTRUN -> [SKIP][414] ([Intel XE#586])
>    [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-7/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_mmap@vram:
>     - shard-lnl:          NOTRUN -> [SKIP][415] ([Intel XE#1416])
>    [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-7/igt@xe_mmap@vram.html
>     - shard-adlp:         NOTRUN -> [SKIP][416] ([Intel XE#1008])
>    [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-4/igt@xe_mmap@vram.html
> 
>   * igt@xe_module_load@force-load:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][417] ([Intel XE#378]) +1 other test skip
>    [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-433/igt@xe_module_load@force-load.html
> 
>   * igt@xe_module_load@load:
>     - shard-lnl:          NOTRUN -> [SKIP][418] ([Intel XE#378]) +1 other test skip
>    [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-5/igt@xe_module_load@load.html
>     - shard-bmg:          NOTRUN -> [SKIP][419] ([Intel XE#2457]) +1 other test skip
>    [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-3/igt@xe_module_load@load.html
>     - shard-adlp:         NOTRUN -> [SKIP][420] ([Intel XE#378]) +1 other test skip
>    [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-1/igt@xe_module_load@load.html
> 
>   * igt@xe_module_load@unload:
>     - shard-lnl:          NOTRUN -> [DMESG-WARN][421] ([Intel XE#4792])
>    [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-8/igt@xe_module_load@unload.html
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][422] ([Intel XE#4792])
>    [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-6/igt@xe_module_load@unload.html
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][423] ([Intel XE#4792])
>    [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-5/igt@xe_module_load@unload.html
> 
>   * igt@xe_noexec_ping_pong:
>     - shard-adlp:         NOTRUN -> [SKIP][424] ([Intel XE#379])
>    [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-9/igt@xe_noexec_ping_pong.html
>     - shard-lnl:          NOTRUN -> [SKIP][425] ([Intel XE#379])
>    [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-5/igt@xe_noexec_ping_pong.html
> 
>   * igt@xe_oa@buffer-size:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][426] ([Intel XE#4501])
>    [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-463/igt@xe_oa@buffer-size.html
>     - shard-adlp:         NOTRUN -> [SKIP][427] ([Intel XE#4501])
>    [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-4/igt@xe_oa@buffer-size.html
> 
>   * igt@xe_oa@mmio-triggered-reports:
>     - shard-adlp:         NOTRUN -> [SKIP][428] ([Intel XE#2541] / [Intel XE#3573]) +35 other tests skip
>    [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-3/igt@xe_oa@mmio-triggered-reports.html
> 
>   * igt@xe_oa@mmio-triggered-reports-read:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][429] ([Intel XE#5103])
>    [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-433/igt@xe_oa@mmio-triggered-reports-read.html
>     - shard-adlp:         NOTRUN -> [SKIP][430] ([Intel XE#5103])
>    [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-3/igt@xe_oa@mmio-triggered-reports-read.html
> 
>   * igt@xe_oa@non-system-wide-paranoid:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][431] ([Intel XE#2541] / [Intel XE#3573]) +28 other tests skip
>    [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-432/igt@xe_oa@non-system-wide-paranoid.html
> 
>   * igt@xe_oa@oa-tlb-invalidate:
>     - shard-lnl:          NOTRUN -> [SKIP][432] ([Intel XE#2248])
>    [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-8/igt@xe_oa@oa-tlb-invalidate.html
>     - shard-bmg:          NOTRUN -> [SKIP][433] ([Intel XE#2248])
>    [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html
> 
>   * igt@xe_oa@syncs-syncobj-wait-cfg:
>     - shard-adlp:         NOTRUN -> [SKIP][434] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) +7 other tests skip
>    [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-6/igt@xe_oa@syncs-syncobj-wait-cfg.html
> 
>   * igt@xe_oa@syncs-ufence-wait:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][435] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) +4 other tests skip
>    [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-433/igt@xe_oa@syncs-ufence-wait.html
> 
>   * igt@xe_pat@display-vs-wb-transient:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][436] ([Intel XE#1337])
>    [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html
>     - shard-adlp:         NOTRUN -> [SKIP][437] ([Intel XE#1337])
>    [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-4/igt@xe_pat@display-vs-wb-transient.html
> 
>   * igt@xe_pat@pat-index-xe2:
>     - shard-adlp:         NOTRUN -> [SKIP][438] ([Intel XE#977])
>    [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-3/igt@xe_pat@pat-index-xe2.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][439] ([Intel XE#977])
>    [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-433/igt@xe_pat@pat-index-xe2.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - shard-lnl:          NOTRUN -> [SKIP][440] ([Intel XE#1420] / [Intel XE#2838])
>    [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-5/igt@xe_pat@pat-index-xehpc.html
>     - shard-adlp:         NOTRUN -> [SKIP][441] ([Intel XE#2838] / [Intel XE#979])
>    [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-9/igt@xe_pat@pat-index-xehpc.html
>     - shard-bmg:          NOTRUN -> [SKIP][442] ([Intel XE#1420])
>    [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-3/igt@xe_pat@pat-index-xehpc.html
> 
>   * igt@xe_pat@pat-index-xelp:
>     - shard-lnl:          NOTRUN -> [SKIP][443] ([Intel XE#977])
>    [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-1/igt@xe_pat@pat-index-xelp.html
>     - shard-bmg:          NOTRUN -> [SKIP][444] ([Intel XE#2245])
>    [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-7/igt@xe_pat@pat-index-xelp.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-adlp:         NOTRUN -> [SKIP][445] ([Intel XE#979])
>    [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-4/igt@xe_pat@pat-index-xelpg.html
>     - shard-bmg:          NOTRUN -> [SKIP][446] ([Intel XE#2236])
>    [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-1/igt@xe_pat@pat-index-xelpg.html
>     - shard-lnl:          NOTRUN -> [SKIP][447] ([Intel XE#979])
>    [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-6/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_peer2peer@read:
>     - shard-lnl:          NOTRUN -> [SKIP][448] ([Intel XE#1061])
>    [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-5/igt@xe_peer2peer@read.html
>     - shard-adlp:         NOTRUN -> [SKIP][449] ([Intel XE#1061])
>    [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-1/igt@xe_peer2peer@read.html
>     - shard-bmg:          NOTRUN -> [SKIP][450] ([Intel XE#2427])
>    [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-3/igt@xe_peer2peer@read.html
> 
>   * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][451] ([Intel XE#1173]) +1 other test fail
>    [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-463/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html
> 
>   * igt@xe_pm@d3cold-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][452] ([Intel XE#2284] / [Intel XE#366]) +6 other tests skip
>    [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-4/igt@xe_pm@d3cold-basic.html
> 
>   * igt@xe_pm@d3cold-mmap-system:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][453] ([Intel XE#2284] / [Intel XE#366]) +4 other tests skip
>    [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-436/igt@xe_pm@d3cold-mmap-system.html
> 
>   * igt@xe_pm@d3cold-mmap-vram:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][454] ([Intel XE#4208]) +16 other tests skip
>    [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html
> 
>   * igt@xe_pm@d3cold-mocs:
>     - shard-lnl:          NOTRUN -> [SKIP][455] ([Intel XE#2284])
>    [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-3/igt@xe_pm@d3cold-mocs.html
>     - shard-adlp:         NOTRUN -> [SKIP][456] ([Intel XE#2284])
>    [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-3/igt@xe_pm@d3cold-mocs.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][457] ([Intel XE#2284])
>    [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-433/igt@xe_pm@d3cold-mocs.html
> 
>   * igt@xe_pm@d3cold-multiple-execs:
>     - shard-adlp:         NOTRUN -> [SKIP][458] ([Intel XE#2284] / [Intel XE#366]) +6 other tests skip
>    [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-9/igt@xe_pm@d3cold-multiple-execs.html
>     - shard-bmg:          NOTRUN -> [SKIP][459] ([Intel XE#2284]) +6 other tests skip
>    [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-6/igt@xe_pm@d3cold-multiple-execs.html
> 
>   * igt@xe_pm@d3hot-mmap-vram:
>     - shard-lnl:          NOTRUN -> [SKIP][460] ([Intel XE#1948])
>    [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-1/igt@xe_pm@d3hot-mmap-vram.html
>     - shard-adlp:         NOTRUN -> [SKIP][461] ([Intel XE#1948])
>    [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-9/igt@xe_pm@d3hot-mmap-vram.html
> 
>   * igt@xe_pm@s3-mocs:
>     - shard-lnl:          NOTRUN -> [SKIP][462] ([Intel XE#584]) +9 other tests skip
>    [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-1/igt@xe_pm@s3-mocs.html
> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-bmg:          NOTRUN -> [ABORT][463] ([Intel XE#1794])
>    [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-6/igt@xe_pm@s4-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-lnl:          NOTRUN -> [ABORT][464] ([Intel XE#1794])
>    [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-2/igt@xe_pm@s4-mocs.html
> 
>   * igt@xe_pm@vram-d3cold-threshold:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][465] ([Intel XE#579])
>    [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-466/igt@xe_pm@vram-d3cold-threshold.html
>     - shard-lnl:          NOTRUN -> [SKIP][466] ([Intel XE#579])
>    [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-1/igt@xe_pm@vram-d3cold-threshold.html
>     - shard-adlp:         NOTRUN -> [SKIP][467] ([Intel XE#579])
>    [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-4/igt@xe_pm@vram-d3cold-threshold.html
>     - shard-bmg:          NOTRUN -> [SKIP][468] ([Intel XE#579])
>    [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.html
> 
>   * igt@xe_pm_residency@gt-c6-freeze@gt0:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][469] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
>    [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-1/igt@xe_pm_residency@gt-c6-freeze@gt0.html
> 
>   * igt@xe_pmu@all-fn-engine-activity-load:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][470] ([Intel XE#4650]) +2 other tests skip
>    [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-432/igt@xe_pmu@all-fn-engine-activity-load.html
> 
>   * igt@xe_pmu@fn-engine-activity-load:
>     - shard-bmg:          NOTRUN -> [SKIP][471] ([Intel XE#4650]) +1 other test skip
>    [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-1/igt@xe_pmu@fn-engine-activity-load.html
> 
>   * igt@xe_pmu@fn-engine-activity-sched-if-idle:
>     - shard-lnl:          NOTRUN -> [SKIP][472] ([Intel XE#4650]) +2 other tests skip
>    [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-4/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
> 
>   * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
>     - shard-adlp:         NOTRUN -> [SKIP][473] ([Intel XE#4733]) +15 other tests skip
>    [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-2/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
> 
>   * igt@xe_pxp@pxp-termination-key-update-post-rpm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][474] ([Intel XE#4733]) +10 other tests skip
>    [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-433/igt@xe_pxp@pxp-termination-key-update-post-rpm.html
> 
>   * igt@xe_pxp@pxp-termination-key-update-post-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][475] ([Intel XE#4733]) +14 other tests skip
>    [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-5/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
> 
>   * igt@xe_query@multigpu-query-engines:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][476] ([Intel XE#944]) +8 other tests skip
>    [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-432/igt@xe_query@multigpu-query-engines.html
> 
>   * igt@xe_query@multigpu-query-invalid-cs-cycles:
>     - shard-bmg:          NOTRUN -> [SKIP][477] ([Intel XE#944]) +15 other tests skip
>    [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-6/igt@xe_query@multigpu-query-invalid-cs-cycles.html
> 
>   * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
>     - shard-adlp:         NOTRUN -> [SKIP][478] ([Intel XE#944]) +17 other tests skip
>    [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-1/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
> 
>   * igt@xe_query@multigpu-query-pxp-status:
>     - shard-lnl:          NOTRUN -> [SKIP][479] ([Intel XE#944]) +16 other tests skip
>    [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-6/igt@xe_query@multigpu-query-pxp-status.html
> 
>   * igt@xe_render_copy@render-stress-2-copies:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][480] ([Intel XE#4814]) +2 other tests skip
>    [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-434/igt@xe_render_copy@render-stress-2-copies.html
> 
>   * igt@xe_render_copy@render-stress-4-copies:
>     - shard-adlp:         NOTRUN -> [SKIP][481] ([Intel XE#4814]) +3 other tests skip
>    [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-8/igt@xe_render_copy@render-stress-4-copies.html
> 
>   * igt@xe_spin_batch@spin-mem-copy:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][482] ([Intel XE#4821])
>    [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-435/igt@xe_spin_batch@spin-mem-copy.html
>     - shard-adlp:         NOTRUN -> [SKIP][483] ([Intel XE#4821])
>    [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-adlp-8/igt@xe_spin_batch@spin-mem-copy.html
> 
>   * igt@xe_sriov_auto_provisioning@exclusive-ranges:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][484] ([Intel XE#4130]) +3 other tests skip
>    [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-433/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
> 
>   * igt@xe_sriov_auto_provisioning@fair-allocation:
>     - shard-lnl:          NOTRUN -> [SKIP][485] ([Intel XE#4130]) +4 other tests skip
>    [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-3/igt@xe_sriov_auto_provisioning@fair-allocation.html
> 
>   * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
>     - shard-bmg:          NOTRUN -> [SKIP][486] ([Intel XE#4130]) +4 other tests skip
>    [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-4/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
> 
>   * igt@xe_sriov_flr@flr-vf1-clear:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][487] ([Intel XE#3342])
>    [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-466/igt@xe_sriov_flr@flr-vf1-clear.html
>     - shard-lnl:          NOTRUN -> [SKIP][488] ([Intel XE#3342]) +1 other test skip
>    [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-1/igt@xe_sriov_flr@flr-vf1-clear.html
>     - shard-bmg:          NOTRUN -> [SKIP][489] ([Intel XE#3342]) +1 other test skip
>    [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-7/igt@xe_sriov_flr@flr-vf1-clear.html
> 
>   * igt@xe_sriov_flr@flr-vfs-parallel:
>     - shard-bmg:          NOTRUN -> [SKIP][490] ([Intel XE#4273]) +1 other test skip
>    [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-4/igt@xe_sriov_flr@flr-vfs-parallel.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][491] ([Intel XE#4273]) +1 other test skip
>    [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-432/igt@xe_sriov_flr@flr-vfs-parallel.html
>     - shard-lnl:          NOTRUN -> [SKIP][492] ([Intel XE#4273]) +1 other test skip
>    [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-7/igt@xe_sriov_flr@flr-vfs-parallel.html
> 
>   * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][493] ([Intel XE#4351])
>    [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-dg2-432/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
>     - shard-lnl:          NOTRUN -> [SKIP][494] ([Intel XE#4351]) +1 other test skip
>    [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-lnl-8/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
>     - shard-bmg:          NOTRUN -> [SKIP][495] ([Intel XE#4351]) +1 other test skip
>    [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/shard-bmg-5/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
>   [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
>   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>   [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
>   [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
>   [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
>   [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
>   [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
>   [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
>   [Intel XE#1341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
>   [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
>   [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
>   [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
>   [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
>   [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
>   [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
>   [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
>   [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
>   [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
>   [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
>   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
>   [Intel XE#2007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2007
>   [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
>   [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
>   [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
>   [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>   [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
>   [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
>   [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
>   [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
>   [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
>   [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
>   [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
>   [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
>   [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
>   [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
>   [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
>   [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
>   [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
>   [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
>   [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
>   [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
>   [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
>   [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
>   [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
>   [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>   [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>   [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
>   [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
>   [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>   [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
>   [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
>   [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>   [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
>   [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
>   [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
>   [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
>   [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#3106]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3106
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
>   [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
>   [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
>   [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>   [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433
>   [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#3576]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3576
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
>   [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
>   [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
>   [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
>   [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
>   [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
>   [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
>   [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
>   [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
>   [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
>   [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
>   [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
>   [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
>   [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>   [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
>   [Intel XE#4359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4359
>   [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
>   [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
>   [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
>   [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
>   [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
>   [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
>   [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
>   [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
>   [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
>   [Intel XE#4519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4519
>   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
>   [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
>   [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
>   [Intel XE#4658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4658
>   [Intel XE#4683]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683
>   [Intel XE#4689]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4689
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4735]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4735
>   [Intel XE#4757]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4757
>   [Intel XE#4792]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4792
>   [Intel XE#4801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4801
>   [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
>   [Intel XE#4821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
>   [Intel XE#4911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4911
>   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>   [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
>   [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
>   [Intel XE#4937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
>   [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
>   [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
>   [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
>   [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#5084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5084
>   [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
>   [Intel XE#5103]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5103
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#5172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5172
>   [Intel XE#5173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5173
>   [Intel XE#5176]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5176
>   [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
>   [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
>   [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
>   [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8398 -> IGT_8399
>   * Linux: xe-3203-308a53b9affc92eca9eaa6117dd62c79d5419ce7 -> xe-pw-149907v1
> 
>   IGT_8398: 82be96b2ac16dd680618f1fd3d3ed073b88da3ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8399: 4cb969fb8e5a8a6319e1585ad71e73c786643794 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-3203-308a53b9affc92eca9eaa6117dd62c79d5419ce7: 308a53b9affc92eca9eaa6117dd62c79d5419ce7
>   xe-pw-149907v1: 149907v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
