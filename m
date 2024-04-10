Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F611CD11C2
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 15:58:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E6A10E21A;
	Wed, 10 Apr 2024 15:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="auxGATPu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E754610E21A
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 15:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712764710; x=1744300710;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=oYbosJrRZGt05CZQ3nlo4fIy6nF9z3K+N32lbQ5Rl5c=;
 b=auxGATPuYbBUT19dy68mmQv6RqBgwEKgNbX/XzPU+4B5yqMv1m3fj7uX
 SKAddP8TVN2ZiN2eogshfC9SKcCsfKdw3KK8fw+KmN3fKBTwRYua4+epy
 CsXeUv2bGx0XnIFWYKc6Om/xbEer4EQ5W46qOJJgwKadfiMHpDpOme5T8
 FG3MvMV4FS+psFZZFki3XA3LneNZalVARJhxa7c+jrqd3U5NWwR1PJgZF
 NJq+o3OVactfLF0C0qp3/sjc0I9KcbDNj/76NDBAbLqLd/q7KE7seUAHU
 SHZbcstqbrE2fdDqGllv3XS3I66+Ajd8GCL0NsUpn96dtwbt/OPjYFQ+0 A==;
X-CSE-ConnectionGUID: Y8GX8MT5RE2OAN1aSA4Qbw==
X-CSE-MsgGUID: 8pw/yUNUTXu+2wuKccYXJQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8050714"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8050714"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 08:58:30 -0700
X-CSE-ConnectionGUID: Hl+AwNzqRuK1g74iipQbkg==
X-CSE-MsgGUID: Wc1YmKYURwWZESyLBWDS7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25123940"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 08:58:29 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 08:58:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 08:58:28 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 08:58:28 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 08:58:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZWDzvPea15pz4r8DYjPwSNvqwvhNEHGtX9OSMZlCb5HeeVlrnIVn6v8hZJLqX35enNptTYMKhK6J3D/TAxBAcB9iHOaiJUv8lZiJB0itNHeNU7jbV6JlFoOJ/sfzA/Pe4lXIg2+ps1RhyrKxqdw9jhFIRTNqeLd/ABkZ5339hbFT6RQ1NLiAGVGM9i5JB3Yv8NphRBLo0YXm6yAuj49aDXbdNKV4MgxGvmYhHpXVBNwFTrCH8v6EGUMxyvxuJZ3V0CuW3iY2VCgr76knxIi+D0MTWf1hkLcRbutzXn88UvLCnj32CZl95geRGD/4BgNr1PfKIYWcXyJkZyPhfE3wUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iKdkEg3aYTsw2kNxMg6XQx6JmcylXnsPOBhtbOQKwdg=;
 b=Q6gnqgPSDFt7ABkUPwLSyqShwjzkze0CDylO5XNMKKM/tgCvWTGqvwYJKxra2YprB0WmhaBO9pRhokeDgRsqj7rySbd8bHzVP1qKrnqSnKdAPtqxb0brkK1mNkkmr1rMtPO94gPH7qiBSa902fgcSO2FGVnZdcOVfCMTGWITAPm2BioxQzkxB5J3aPwNDmDjaafT7PRJHgiF3eFcaw7K2u/nfsm9yDidcvmSEvycV5UAAHnMJl+UZYAL2k7a51bjmZzTGeG2ZBkWMfC+D02eSm9XtvEv9Ac6/pU7NNNhTHr8MQOlUq1Bnujzvp9RO0rkEGj8PRux9Mkdqm+nq8w6ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA3PR11MB7553.namprd11.prod.outlook.com (2603:10b6:806:316::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Wed, 10 Apr
 2024 15:58:27 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 15:58:26 +0000
Date: Wed, 10 Apr 2024 17:58:24 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/5] drm/xe/pf: Introduce helper functions for use by PF
Message-ID: <20240410155824.vgtz5a5bsbs2gbdf@intel.com>
References: <20240410123125.1155-1-michal.wajdeczko@intel.com>
 <20240410123125.1155-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240410123125.1155-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI0P293CA0015.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::8) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA3PR11MB7553:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: unOYz+88TcDOXFno/NndHezTz36YxeTixqhZ+DB4aekcLCl6Y42ZZ8Z4JeUBco01+T1uw7ZpKNoX9BphwGCfJcE1HkDPFbYBR9Lm4VgOnV81noZKGCtoGnxBeFtPxN55X4U1ywhBK5t5JXZIc47LAiADaqhVQprmiWtH3+diqMblPKl0LKewhYwc94bnFLTVCknL/seuPwqM0WPy6leChsjPKvubRkkRSF0jx+xeV2hhhJnpzz+1pEpRZ5jBgodSeSbQhuuYmfAsnS3xBs/9wmqkEUgJgcfAEf4mUBWh5imnS2FlRUkXyZtCr4redI8G3te7Ig+YapexWsp5mZ9OsR+wO8nGmYFOhuK4ojklC3w5SxfEgyRuCYU5Np6V07ORICqY/bQSPCx1xtopUXWYDbawfxri3Nc12AMtXitz5zerUjtXJGueei0A2xNl7f6rhyBXHDU5UBZvzg1uUUjxz0q/jekoUjL0QDeusyGzST5I5idbGf0lR+wslTOXDVAA+ekAcVO5IR7VOaYKIbSzvYMVXOcNu9KytC79Ww7RL/OBRj0p5NIklaODgYu0wbaL6+tq0MbWZvl71bPMoq5CNiik9SsVbbxCBrRqPSJwVc+IaBIhPFzlgpQ1B7S+Loea8OSrQ6JKtsN4Z+xXIzJz/RrqX7rKkiUl9v4QxE/KJzY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0V2ZmVnVmIyMTlHN09IWGNNd0RFbUNCa1FqeW91ei9pVFdTRmhxKzArYTZn?=
 =?utf-8?B?aTMrY1h5d2s2WVNLNFRjWFFHQTZlaEhrUjJ2Y0NwUEV3VjRwd2VZS3JDUDZF?=
 =?utf-8?B?R1FYbUtpb3BSVFYxbEl5d1FrekJLdnhlUElPTmx0V0NVMnV4K0tMWTNRRHV1?=
 =?utf-8?B?RkFEY0lGMktWdTg3MHFLUllYWURWOGgzVnlFejBXdDRYek9uemx5R2FkZWts?=
 =?utf-8?B?anlUV3g0ZFYzdk93UXFjVHZTd05RZGRwd1BNNnFWMi9XNnhTMEIyU2F3MXNv?=
 =?utf-8?B?ZkJuY3ppbmhjSkZWMXkvS3AxanlxRjlDS0N1b200UjlmZ1diYXFHczgyc2J1?=
 =?utf-8?B?Zyt1dVZFa0xPRllwdVlMV045ZjA2US9RTTRLMHc4dHFrdnJRM1BrSE9vTjM0?=
 =?utf-8?B?c2daYjFPVWZIOVRKMTFKcjdzLzVQVDFoYTNheForZkFRbjBFZzdaWkJEbTV0?=
 =?utf-8?B?U2I2QnpISEhEbjhZcmN4T29MT1ZGV3hqSm5zUm8zVG5aM0tiaXlRbUY0eFJT?=
 =?utf-8?B?dFVtdVhhMWFZLzBQT0ZrNGV3Q1VoYTVZQlZxY2FNeXJ3WjJ1Y3Nrc2kxd2tr?=
 =?utf-8?B?THM2ZmN1WjR0TmNJMmpXNWh2dFFVbW1WazVTVmgvcTlRWGFhVmhFT0c0bEI1?=
 =?utf-8?B?YjQ1M293ZVBhNC9GdkdDSnpSN3E4ZUxQanFyT0dRaE1WeitUOUtwY3Zvblpi?=
 =?utf-8?B?TDh3TG9DVUx6cGlhNDZOMnNBdzNsaUFxdnI4U3I4dDIrZzE0SldjeDFTd0xP?=
 =?utf-8?B?V3dacDlMUkdUK2U3bVc3RnZhd2toQWdScWErQTAyRDhOSzYvRUhLRTY3VXBS?=
 =?utf-8?B?blkyTmdVSS95Wm9ncFJ4elpBczhXdGd2akpmdTdOa3Rub3RpNjN4bTNhL3c5?=
 =?utf-8?B?V0l0MVJqOWxIK2V5NGJvdjFieGZyM3EzRnJRVzNtN2xPNnRPbnZrSzNweUFS?=
 =?utf-8?B?M2tVMjArTlJ0QXgvV0JYbU1tMFVFMy90bnZiU2tOSHdmSFZUY3JsRWNqTEVV?=
 =?utf-8?B?aHcvTTQyYWg2TFRwV0w5V3d0Vlk1MXcxdmtYVzA0ZHRQMWNDL2RGYURBZi95?=
 =?utf-8?B?WG83Q2c1dWd5WVVxNWZZcHMvcDVIWnVINnVha0pvdDJKUzRWbHpPaWtWZDVD?=
 =?utf-8?B?MEZ3bnFlNmllaHJHR21Pb1Fad3JnMXpJUitZM2VtTlA2NTdTaWtwMDl5MzBi?=
 =?utf-8?B?SHRSNHo4R3VLYnE2Y1VybjE4S2tGeFZ0MGR6dDVoTldleEFSTHBQRnNMTGJZ?=
 =?utf-8?B?WmRoRjBWL01iU0t0a1M1UGdHdVo3aC81SmJMdEFpSm4rUWlPQ1FGa2FDMHdR?=
 =?utf-8?B?V0s0ZGUzL3FhcU9kU0FLUG8yQklwNk5rN2VHMHVCTnMxM0MyNmVobURZWWp2?=
 =?utf-8?B?Njg4SjBJcHRKT0QySFI1UjRnNnljYUNYYUYvbUd3Q0UvaW1teEFlZ2YyMnlU?=
 =?utf-8?B?Vjc2R1FQUHpOVXppaHNTdUhyaVBHV1pKelF4R0pPSVE1eUxxZm0vN0ZvZlp1?=
 =?utf-8?B?RlgxTkVXc2wybTY4d3NMSUFJYWM5NUVVdGN5NDBobmNTUXpMWGx3U3FOMnc3?=
 =?utf-8?B?TVRvL1dlRXJRSHNHUGdDSVM4WnV0dUxCd1ZTZkd5bWhqN1RMUVEwSnJRUEFF?=
 =?utf-8?B?Rm8ycVBQdkhnd2F5TWpEVTdlMCtnSGo2TzlIbTR2MkszWVRYZzBjUGZ0ZGMx?=
 =?utf-8?B?d2EwekluaVh6STh6M3BWTEtyTG9nTHd0dzV3QXh1MHdZUTZHbkM2eU84ZVdN?=
 =?utf-8?B?alpPMzZBRmtJWWdLNjBNSmt6eDRaOS82dm8wV25rZ0NtOU8zSk1oUFNjc1Ev?=
 =?utf-8?B?THBOKzlpalNPcjJ0RDJ4SE1UVW9iZW53UmhXT3dOOWM5WjNOVXpTbnNNQXEy?=
 =?utf-8?B?bXJWRlZjTVBNZlBKTkxFYXB1Vy83K21QYlltY1FMT0dNTks2YndUdmJHRXFD?=
 =?utf-8?B?dXlwT25KK1lKSU8zdjZ5NjY4a2tCeWw2Z0VRM1VCdlVqRDZUYnFzNUFoU25G?=
 =?utf-8?B?WUFPV0VpWmUyNU81WG1VSEgxb0hxd2FtcnRyYk04M1RaVGhrbUlMdlZBWmtM?=
 =?utf-8?B?S1c1c3pNMmVOUlFCZHA5dDVhb2cxMlhsQy9pNEt3enVIT3gxa0UzaWVUNWVU?=
 =?utf-8?B?Z0FoeTJSaS9FVlMyS1poQkhpK0RNYkdadFc1MnlCUURLc21Na2FSbmI2dlpO?=
 =?utf-8?B?bFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 788233eb-2004-488b-6a74-08dc59770f09
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 15:58:26.9440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MbEW36oFMh8D9g/mpKDvXdt+S9qQQgqqWZSg0oarzxsB5oxZoXzcEwpqJjNP5wxEz4K9azEz2RvEr/72NV8d7PBxo/2I/BTGpbE1Az4m+Zo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7553
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2024-kwi-10 14:31:22 +0200]:
> PF driver will maintain VF's configuration data mostly on the
> GT level, but some internal data is located at the device level.
> 
> To allow easy access to that data from the GT level functions, and
> to minimize code duplications, introduce set of helper functions
> and macros for explicit use by the PF driver.
> 
> We will use these helpers in upcoming patches.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_helpers.h | 35 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_helpers.h    | 46 +++++++++++++++++++++
>  2 files changed, 81 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_helpers.h
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_helpers.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_helpers.h
> new file mode 100644
> index 000000000000..99472a48ec35
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_helpers.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_SRIOV_PF_HELPERS_H_
> +#define _XE_GT_SRIOV_PF_HELPERS_H_
> +
> +#include "xe_gt_types.h"
> +#include "xe_sriov_pf_helpers.h"
> +
> +/**
> + * xe_sriov_pf_assert_vfid() - warn if &id is not a supported VF number when debugging.
> + * @gt: the PF &xe_gt to assert on
> + * @vfid: the VF number to assert
> + *
> + * Assert that &gt belongs to the Physical Function (PF) device and provided &vfid
> + * is within a range of supported VF numbers (up to maximum number of VFs that
> + * driver can support, including VF0 that represents the PF itself).
> + *
> + * Note: Effective only on debug builds. See `Xe ASSERTs`_ for more information.
> + */
> +#define xe_gt_sriov_pf_assert_vfid(gt, vfid)	xe_sriov_pf_assert_vfid(gt_to_xe(gt), (vfid))
> +
> +static inline int xe_gt_sriov_pf_get_totalvfs(struct xe_gt *gt)
> +{
> +	return xe_sriov_pf_get_totalvfs(gt_to_xe(gt));
> +}
> +
> +static inline struct mutex *xe_gt_sriov_pf_master_mutex(struct xe_gt *gt)
> +{
> +	return xe_sriov_pf_master_mutex(gt_to_xe(gt));
> +}
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
> new file mode 100644
> index 000000000000..7d156ba82479
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#ifndef _XE_SRIOV_PF_HELPERS_H_
> +#define _XE_SRIOV_PF_HELPERS_H_
> +
> +#include "xe_assert.h"
> +#include "xe_device_types.h"
> +#include "xe_sriov.h"
> +#include "xe_sriov_types.h"
> +
> +/**
> + * xe_sriov_pf_assert_vfid() - warn if &id is not a supported VF number when debugging.
> + * @xe: the PF &xe_device to assert on
> + * @vfid: the VF number to assert
> + *
> + * Assert that &xe represents the Physical Function (PF) device and provided &vfid
> + * is within a range of supported VF numbers (up to maximum number of VFs that
> + * driver can support, including VF0 that represents the PF itself).
> + *
> + * Note: Effective only on debug builds. See `Xe ASSERTs`_ for more information.
> + */
> +#define xe_sriov_pf_assert_vfid(xe, vfid) \
> +	xe_assert((xe), (vfid) <= xe_sriov_pf_get_totalvfs(xe))
> +
> +/**
> + * xe_sriov_pf_get_totalvfs() - Get maximum number of VFs that driver can support.
> + * @xe: the &xe_device to query (shall be PF)
> + *
> + * Return: Maximum number of VFs that this PF driver supports.
> + */
> +static inline int xe_sriov_pf_get_totalvfs(struct xe_device *xe)
> +{
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +	return xe->sriov.pf.driver_max_vfs;
> +}
> +
> +static inline struct mutex *xe_sriov_pf_master_mutex(struct xe_device *xe)
> +{
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +	return &xe->sriov.pf.master_lock;
> +}
> +
> +#endif

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 
