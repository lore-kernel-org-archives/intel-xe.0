Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BB8CD128A
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 15:54:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E99710EB3B;
	Wed, 10 Apr 2024 15:54:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MiqFpW96";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69EA010EE67
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 15:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712764477; x=1744300477;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LBBW+DnXH+NND43enigB3Ot4MIHYSZ2iV8RxioOFgzo=;
 b=MiqFpW96aI58KD7OkuJOv08U47je+djIIzWCqywgUcg32zMEyeYMpOr5
 3LUadG0rmePN0rMXw0sTKXAqvGMcFqeh+D9H904/+foyIVob3T6RZSUY/
 V058IkFJ0qBnPrAUGqp+dfYi74Epz82gTtKll8g3n+fG/gMoRytVwywyr
 ZjvzesG1p65PF9dhtXi+/8UYr7xw/4fehpIqpF1u38uFh96yPYXyUF6u1
 L5kBPdEQGf5E538spCQmivXrQq/aC81gmvDogUJa1pjgDNohWgAJqQq73
 xe92QOi2hHrZG32KoZJuw9jip6JFqaTKOJautNsD1DTwfi6YrWFuwyYXX Q==;
X-CSE-ConnectionGUID: 6SsbC2ilSum9Tmtt5x0PxA==
X-CSE-MsgGUID: TfAdG2cYRdKcFKkaurvDnQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7989708"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7989708"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 08:54:36 -0700
X-CSE-ConnectionGUID: AcJbmA4NTVWVBJ8132BpyQ==
X-CSE-MsgGUID: remL1Hd4Tqm6Dl8bKt3OYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="43861087"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 08:54:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 08:54:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 08:54:35 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 08:54:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EbBjQKGDBTX783SzP6+qsr4uiJtGUX9xHc4cYdGuIOaLC1WUyKah/2zgCBml8E6reyM3C5kFNWOOz/3kpZSfda3ZA3dDy3fE66V4Y2wckUTs4xP6WJfWDr4Zfa3KK8ROYix6yZRd1bTX2dAT3F6isGwAZsS6++MHYMOTgS9S/uF7Q+cKHTOyNohGsvOzafurYBsgtYtEom5c5ES4fIXEjBGwJ5PpnRvfmsD1qU3L+Xi2LUfzFTOjkdpI8OIF5B2MP4iG8En4Fy74n3vhdt75PVfUUtzBlFi7LwIaaB7rdKzL7OOIR4IGbtkLPxyAYCuE5jTuMgJxfTErNyDZ9dQSmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ex7k7kIuzgPlxz5KqSBYZfq+Lt9M+gzPwycWuUm60I=;
 b=ik5f4C4Nboe5coux7AOBRAbWiXULiQgjRK3tB4TvUadg2AwenIncu9yCkOXD+Xi9ZUkCsuXqRiNTnf4sVmkXqycx644j6Mhbd98I+/J5FqQE1oa1i/7fR+HvimdG9tSQzXsm+Z4oM+WHqNvMWoQlSgJB8duH5joEVULY3iE2/2YF72eWPh45y0JIg9hqUeYk8CmfyErjCliTdS/Y7iabfFgKjbS7KfMOZ+yeyKJDhSM6V0345Wg3gO30Rr32CRrFDtrnKtzA24P9IjCmb/hRQJcv8eMJW8a18aapGdgbcYSp8yBHnljgfy17CAkRYOmO1J9uzaJIM2aHb0OHJn9s1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by BL3PR11MB6507.namprd11.prod.outlook.com (2603:10b6:208:38e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Wed, 10 Apr
 2024 15:54:29 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 15:54:29 +0000
Date: Wed, 10 Apr 2024 17:54:26 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/5] drm/xe/pf: Introduce mutex to protect VFs
 configurations
Message-ID: <20240410155426.6orhsa264jvyw74b@intel.com>
References: <20240410123125.1155-1-michal.wajdeczko@intel.com>
 <20240410123125.1155-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240410123125.1155-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI2P293CA0005.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::12) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|BL3PR11MB6507:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P9eXD+J3l4HL+QRdZm+Ukm4t0k/zxaxlUfpZ7yexa4WS5Ob6SyNzx5WHI74gcj4t7bMIuANOeVOO+OIL7nsQx3FWDOU3Fd51jO1JpmtDVHATp87KKWYLkVVPuubQHifhPemJnfy9Zjca3aHVqOBxCfHoJxB7I3xxw88YnDhT+G5T5CFtzx26LM3ch0kGPjU0mws/tW3OooTkjXg+1FllJKWdBjt4KhHOfdhlPdbPvYOxiXSOn09hDbXmm/n2/hmvohExl1SBIRKbzK6kYAA2XvGwjlH4kHMZxWkkpLSeYXdvbpCmr7WHvM78OywOUB1Bjpw/xUgPYJc1BvS2nibDpZMC5xnqT/0hm4IEzZo+OaNbk/PY0acwpM/Yl07p4lTr58ZobYky7+uoPz2ONRpTKj8+fLe8I64FmyKW2Uztmls7koYJ6MFTWlshVwG2PU8STYKmqSSlBSwREq2N+KOHh8VcVC9emKn0b95hHyNgAh4t+6n6fdown9UmhTYLeDLW0eBfKkaZhS6kDTZcq/hGZHzKXAwbGMMqtJznjL6GFBbOcGL3LZSarw6oKFfzNiCscWCcraXqD3AgSc1IO+x3eTxH6P/J0vPwx6WzBQvEulUFJqE8+6+vMGfYSXIx82mTx+XyGYgOdb4SeW6RtWJoDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aE1QLzVXdmVDMnhNSi9GQmkvSnpmdy9FeVlXc1JCN3lVZjByOVM5UTU1VktC?=
 =?utf-8?B?bGhuajFPOC9ENWU4ZDVsK2QwY3VVOUdwVHZFRi9VWGZpM0J1aXJsYW04UThD?=
 =?utf-8?B?U2ZZR29ZWERsWVd2QU16clJVMUZnWFBZeFJNYkl6c0h2STNucUxNcHdpY3ZE?=
 =?utf-8?B?RnhtelpPTDJFNVd6NmdTbCtCTlVKRzh6TTdBMmcvUWlTeFE2NVVYMTM1VmdL?=
 =?utf-8?B?WkNSK2hSMk5TOWxhb3drajVwd3l2SVl1dHI4OWFGRi9wM0pPNEhMNkFndmha?=
 =?utf-8?B?STJHRlJCM3hKTDNKNXdScEM2Z20rQTFHdUJaOU5YdWhRT3AxWk9SZ2szdnJn?=
 =?utf-8?B?Zk8vV2dEdnVDVmU5QTVyREJ3VTZJRlVNaStFeFVEOXdEa3phUk82RmozZCty?=
 =?utf-8?B?VU1rZGxmamV5d3YxU2R3aXBTNGFkR3BTd29qdUR5TnVLOEtmZXU3RmZ1ZWpL?=
 =?utf-8?B?TFdDNU85c0c0bnQyLzh4TlU4Wk5vVHVVMWJSbHQrMnlJd0pJU1lJL0Exd0ZM?=
 =?utf-8?B?dkZvQ3Vqeld2a2NEQUl1ZkxMdEtYejZ5OGNEWlNFUzVqdWNHWFg2WDlEQmNN?=
 =?utf-8?B?dTRlWWZyZWE0Vlc0cGF1U1hSYWE2R0JidTJNd29ub1pMcjNlQ2Y0aHorc0hT?=
 =?utf-8?B?eGdLU05wUnF1NTRvcHJOeXh5bGoxNmNvSGRUazFOYWF5dERBVnp1VjBMQW9X?=
 =?utf-8?B?clFwY0tJRmdwdDdXSDRsVTdTbFJlbllWQUcrU1cweVRWVUZ4NW10Uit6NTRE?=
 =?utf-8?B?dWVmaVNxd0I0NlloWVRHWWdFbE05aWJZL1dwei9uZTdOZWxwQXlhNU4vYUdE?=
 =?utf-8?B?T29aM1FuUlA0ak5hNDBMWEVwM2x4T2ZyK2hQUkpCTUN4N3p2TFJoMGF5eFVr?=
 =?utf-8?B?OHozREJpcE9hRXMyVTBXTWhuUktuUnF5bk1sdFdtQ3h0clQyK0FuWFdyM0to?=
 =?utf-8?B?NWdxb01NaHhXLy9HMjFFS21jV213RHBxZG0xQ0duMVhYeXQydTBQQXlyekpV?=
 =?utf-8?B?cjdoV2NqNG95V2RvVmhJYm5tTXlUcGk4Qmh5ZFlvYXMzKzJJMG55b0JyVVhR?=
 =?utf-8?B?YjBma1B1VFpUTm1zVDJKM2ZPVVRPT1NraGZjaUJSRXFmTUlwT2l6OXVDZlpT?=
 =?utf-8?B?cGdJbUhzNTk3eWh5WWhHRTZ2bHkzU2o2V1d6eEpMYnBxVUsrREZpVGJqOVhF?=
 =?utf-8?B?c281ZmljRlZBSEc4ZGdxK1h2aitQbmUzMnB3OUVEc0p5Q2dxQy9rcWpZc0g3?=
 =?utf-8?B?UEs5L1F1ZFhjcXBjeTZIdDJDN09VNlRUS0VlbkF5SCtUTG5oUStsd3dsSkUr?=
 =?utf-8?B?UFBCU3FsM2VWTVJhSmxvTlMvMCs5enNmdGU2dmdFNHdUeXhKeUVja0ZKLzVZ?=
 =?utf-8?B?ZlJuTk93RUhPNXhmWm0vay83RlhiLzNKNUhnRTROckZ5cmtGRDJnd1NKQjdR?=
 =?utf-8?B?SFpHcTJQcElkVDU1VnZhcCtLdmtYd2J2U1ZXOTBpY1RTVnBzcUhNQ3VVNWpp?=
 =?utf-8?B?Q0hCSnRHNXlDYUpia21vOVhQYXFhWGZuSHFGUXNzWGlkTXh6ci94T2xiTGtG?=
 =?utf-8?B?ZEU4b04rVjlKbEt5ODZTUFhhc0Z0WSt4azhiaThCU0YyT0xQZUZmSkhrdFNZ?=
 =?utf-8?B?UmFqNStRZ1BxTFU2bWFFbEZ0dUxvNWVuSnp5L1ExclR0SWJLNGJVNWFFSGhQ?=
 =?utf-8?B?TWp3WlMxY29NYStmeS9Qck9pSmNaZ08wb25DZHMzVkRKVlZhMVVUMHY3RU5P?=
 =?utf-8?B?L3VZSUVjRWJDZno0RjR1NzduaWFUZHgvQmNqNjNkZ1dDSDUrVW8wZXhYUy9I?=
 =?utf-8?B?YitoeG5WQTNBeDg4YXlQR3BaQ3N4Ukh1SVZXTWNYOFFwOVo1TkNoazRSdi92?=
 =?utf-8?B?NDNkRHlBeFAvZHg0UkpSSnZGRUxQa09haWhDM2NZYWxvekQwOHdWVnZucFN5?=
 =?utf-8?B?ZWN3SjYva2dSeHFUTE9FVmhXYnMzNWVVWVAzZk9oUDFyTTN5OXZtNGpoWmx3?=
 =?utf-8?B?b0JvSWcreEtrc25TSEVhcEtIUkRjUWdMcVpOK3c3ejY1N0N5UFRVR2Q5L204?=
 =?utf-8?B?TW96ZStSN2EvSjNseDdFQmNJbmVKRUY4NDM3V3M5TXFoZGRlWkphUktHQWpE?=
 =?utf-8?B?VDRpVHB2cWFVTzlBVk9EWkJDZDg1TVpLWUtmMkVhZnZsUTBSbzRONWlrM2k5?=
 =?utf-8?B?MVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40336c0b-23c1-4be5-9b6e-08dc59768189
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 15:54:29.5632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VTJ4nkVpfDkWRrosv2lCTN/UCb0/sDDhwgANxsZ4WrKhiy2kku5Yn+3xzqCNDDK5LA8+k9whLOk9khTkOO00uOUCHKM52Zl7OdlYVKFiezw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6507
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2024-kwi-10 14:31:21 +0200]:
> PF driver will maintain configurations and resources for every VF
> and this data could span multiple tiles and/or GTs.  Prepare mutex
> to protect data that we will add in upcoming patches.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov.c       |  7 +++++++
>  drivers/gpu/drm/xe/xe_sriov_pf.c    | 15 +++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf.h    |  6 ++++++
>  drivers/gpu/drm/xe/xe_sriov_types.h |  4 ++++
>  4 files changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> index d324f131e3da..1b40f5de9ef5 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_sriov.c
> @@ -94,6 +94,13 @@ int xe_sriov_init(struct xe_device *xe)
>  	if (!IS_SRIOV(xe))
>  		return 0;
>  
> +	if (IS_SRIOV_PF(xe)) {
> +		int err = xe_sriov_pf_init_early(xe);
> +
> +		if (err)
> +			return err;
> +	}
> +
>  	xe_assert(xe, !xe->sriov.wq);
>  	xe->sriov.wq = alloc_workqueue("xe-sriov-wq", 0, 0);
>  	if (!xe->sriov.wq)
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
> index 030c2b69ecc4..0f721ae17b26 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
> @@ -3,6 +3,8 @@
>   * Copyright © 2023-2024 Intel Corporation
>   */
>  
> +#include <drm/drm_managed.h>
> +
>  #include "xe_assert.h"
>  #include "xe_device.h"
>  #include "xe_module.h"
> @@ -70,6 +72,19 @@ bool xe_sriov_pf_readiness(struct xe_device *xe)
>  	return true;
>  }
>  
> +/**
> + * xe_sriov_pf_init_early - Initialize SR-IOV PF specific data.
> + * @xe: the &xe_device to initialize
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_init_early(struct xe_device *xe)
> +{
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +
> +	return drmm_mutex_init(&xe->drm, &xe->sriov.pf.master_lock);
> +}
> +
>  /**
>   * xe_sriov_pf_print_vfs_summary - Print SR-IOV PF information.
>   * @xe: the &xe_device to print info from
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.h b/drivers/gpu/drm/xe/xe_sriov_pf.h
> index ebef2e01838a..d1220e70e1c0 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.h
> @@ -13,12 +13,18 @@ struct xe_device;
>  
>  #ifdef CONFIG_PCI_IOV
>  bool xe_sriov_pf_readiness(struct xe_device *xe);
> +int xe_sriov_pf_init_early(struct xe_device *xe);
>  void xe_sriov_pf_print_vfs_summary(struct xe_device *xe, struct drm_printer *p);
>  #else
>  static inline bool xe_sriov_pf_readiness(struct xe_device *xe)
>  {
>  	return false;
>  }
> +
> +static inline int xe_sriov_pf_init_early(struct xe_device *xe)
> +{
> +	return 0;
> +}
>  #endif
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_types.h b/drivers/gpu/drm/xe/xe_sriov_types.h
> index fa583e8fa0c2..c7b7ad4af5c8 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_types.h
> @@ -7,6 +7,7 @@
>  #define _XE_SRIOV_TYPES_H_
>  
>  #include <linux/build_bug.h>
> +#include <linux/mutex.h>
>  #include <linux/types.h>
>  
>  /**
> @@ -50,6 +51,9 @@ struct xe_device_pf {
>  
>  	/** @driver_max_vfs: Maximum number of VFs supported by the driver. */
>  	u16 driver_max_vfs;
> +
> +	/** @master_lock: protects all VFs configurations across GTs */
> +	struct mutex master_lock;
>  };

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

>  
>  #endif
> -- 
> 2.43.0
> 

-- 
