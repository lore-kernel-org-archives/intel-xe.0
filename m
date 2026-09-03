Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A001C624A4
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 16:21:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D158A10E0A9;
	Thu,  3 Sep 2026 16:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ACzeoNmd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB4810F682
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 16:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788452469; x=1819988469;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NVF9nDZiSCYSZkrXqqBS9w+WyTRkREge1TV7CP3LFUQ=;
 b=ACzeoNmdSqcJOPZThVAtxsJCatcyCwEViWhWvRtkK3NqR1e1idDSBlwO
 X67uBImKRHOiNtyRQdQBdIxwSBsQ4ttWOeP7PHk73gC+WzOCTCsxLV6VE
 wxzrhd+YrAp7vP0EeBQ5rHTEFTsJVfM1rn0DgpdWN9rI+ZhmP5nMrGQZW
 IhgSD16pPVVKh6c6qsJfphhUf1QxhAQeGxGE4XXb39xiTHRwIb6IHQlix
 gS69kvRTGfMnHm17O5sBHxHe8a9ZFqg9MpCMDI15pGBNV4vb/RviR+A7f
 H6yUQyZ7QwHa3xf66/MR9f91Z4FA0Iw2ozjakA93fPZ9QBwVp8+JPqpX8 w==;
X-CSE-ConnectionGUID: RS+M/T9FS2iApHjBmgz+zQ==
X-CSE-MsgGUID: pY0W8IVWTseO+g7hn+oNMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="100299980"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="100299980"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 09:21:09 -0700
X-CSE-ConnectionGUID: cqIPGZuDRImkA0cvGQy3MQ==
X-CSE-MsgGUID: CQIqsDdaSteNsEz0+2EdVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="265439322"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 09:21:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 09:21:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 09:21:08 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.1) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 09:21:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vLDIBhfU98vM3vcpWWdz7QFt80rGxkhrJ62yR3IJQUmSwSDsZtFNQqUAilt5iq4fyABqz9FA1EwhLuVIcRhkncOcNvuJ7ipMUo9cV3XEiUI4RCLK9IOnDkQaKezmo4J6XzHeZ+2NwuKDTT/ivEWpHRDsKgV3T7r3lSLnEAbHHsPhyTZYhqqgBNCvKuZhRMumc7QSqz67r799dOjzq+Xf5Y1q1zjsleIeR/zAN6uWFrA4OjL6TcAEWOcJIoJ42k0A/ZlqhZT5ptE7Z8oXXSwszHfr142aGTaVqEakashE9wfEjqX/Mp/mYk8M7DOtvA+d9Iq8dLyYdgHHOT1HmOaRCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8hWF6lEMjlsB45Rf9otLb6kSFBG1D3i4IpL3oNY6pV8=;
 b=ZuqPFUtPtvLZEHQXM6r7pvZtceFgpshB/eOTn/uIaKWYxc6nvm4QiBWu8tGDeWbDip2ISYWji09uLFYG77EGgRvOp8j5LXx/oMJUDmI5KV7LrsoJNk6duBUQWpUAoBhmrQQma8EeDYh0itMpTQLqlbui32EM7/Er5M+LShEJR4xxxFclUIVd3rnrwWVnrrZaZ4qV+wvRIF7mdcczG8TgJhsRUaO9M15h8E2hShUtsW9KHmCQMU3iTcoGyJjlakXi2Fji53GrNbLBvqP79ePuvEpNtzLauUzIi0CauU4CsNqqAK9DcbrGyy2h7P9MzyRRb6gJtSxZ6NQ1w09QS8qdXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by CY8PR11MB7193.namprd11.prod.outlook.com (2603:10b6:930:91::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 16:21:01 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 16:21:01 +0000
Date: Thu, 3 Sep 2026 12:20:57 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zongyao Bai <zongyao.bai@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jia.yao@intel.com>,
 <matthew.brost@intel.com>
Subject: Re: [PATCH v5 1/4] drm/xe/forcewake: synchronize engine-cycle access
 with unplug
Message-ID: <apmeaQJPDe0aryMJ@intel.com>
References: <20260601213804.707256-1-zongyao.bai@intel.com>
 <20260813000654.2712317-1-zongyao.bai@intel.com>
 <20260813000654.2712317-2-zongyao.bai@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260813000654.2712317-2-zongyao.bai@intel.com>
X-ClientProxiedBy: SJ0P220CA0028.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::11) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|CY8PR11MB7193:EE_
X-MS-Office365-Filtering-Correlation-Id: 9060dda5-5969-4f8e-1510-08df09d757ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: m+z/zsgubh23q8U/7JoOTXNP6crY/VMmkuTbBgkInT/+b7L0o5BKsP75fU36E4KkiFDg+55mJBRf6DPaGN+S+r6/yGUUtWJYmfN6JS+muoEhnJn+n2J4K7kfCKva0KIPHgcJ6JpwKjxTifg43H1m5iLausCWbqMgftueIHxiTrG9vYNkCIMsvLS7Pk7FsWavTKxHSOU6Z3uHVE+EneAVLm3+w+00c1AET9dLHaDMwXFc19qW5Ho5T4VFpuBsse+jx+U8+6eSRCYXAmgxy539aFuatgI/ZdaOl93MeU0hKN1l+/KueU5zeYJcHFJDIaN+ykht0pRuXMJzNgPVcckkLmxwpYsWf7DvFdXvMeBsQHK2Tu/Gxyw6AgT1/izdwG11FTFBmTCdjienh5OZzkf7oJ0GkI/0jG9PeQpT+NMBtOryV3qDTU3ulsKg1BBArJqf21JO5f2pGtcR1Svzu/XV0qmed5oc7GpuW81wAg+lTlTUCmrBnGNjx2PJJCCSkiLsRK32yugZ+mBcQ+LlH+PkQ4jIDbGdJb1ga5gaLowW65oPaVgrjhVUTHZmfIKYomNOrJOp1okE7eszjozWkC6W1MzXgFY1tBL03KEPJ92YT+zZhUD6cPF3jpxK0l4LPyncJmPkvXXFJcDi5mk3Jw5ZcahczCDs8DFm0vMmVZYQ1JQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ul9Qv8FS+5o/0jbiuv7aK0XM/Ei3S/FEnlRmjo5PPQd7lX8Ga+NmXerc+B1r?=
 =?us-ascii?Q?0JFJtZYhleqD8X89Dk4cjMCqMwlOkUgTe5q6f/iMw+UrLx6mqhp45usIerW7?=
 =?us-ascii?Q?EdvKBJ9q5rL4FXfXuBf47gJ7bNy5DUmlD2S7p03yZwra7jSErLMhabEOarJu?=
 =?us-ascii?Q?syky9E2MXefVsRMMt3ow0oRTBJic8vtJKmCCf32l6r55tzhVfKsK+hpmFIio?=
 =?us-ascii?Q?cfgW+IuqK1nA132RCAt1Naxm9JDSHlhYsuEUl/xeaJyHBBbHY51F7Z6Ki3o9?=
 =?us-ascii?Q?5SjXCZ/FPa0YppAP4wQgDTdSacST4ryToFtSXsUg6fctO/IFe1A4KA/lAnx9?=
 =?us-ascii?Q?VMmANJcCQyTEjM5U8M0PdwV6YwRU4dTFnZOmHxSp7TxAAoV+12yChVbb8GBX?=
 =?us-ascii?Q?UZEfrMv+ecR7cAaL/nUK5W7z2YHFIVTGuyJoqFpiVciINfAHDvDkk5qXsb90?=
 =?us-ascii?Q?kvUq28ZMUe3lWYQ4JgZqgUfi2jkMejS/aCDDUmCrFNj1vqh7mORPxaXDn24I?=
 =?us-ascii?Q?nNAaoFdi7s+S/vVk9NEuVhVkTV5MdPMIPr4EG9Bjw+CIYOhGC91q9d9kU4JU?=
 =?us-ascii?Q?i3LqvqNFxUVXJqRxBxPEnMXVzlTo0YE0UoONlb4nJevVv3HfIXALd8md0R3L?=
 =?us-ascii?Q?CIhJU1wjZDtKdwMgGz4n/nl40BqWwl1KA20i3QDGpzpD7tfJJxm63Pjd1ZvG?=
 =?us-ascii?Q?Xe6OXnv24Zh+0lZl3LI4xIEEVQjNI+yjZ+sdRRpCzekM315YDL1lM3pFbcgz?=
 =?us-ascii?Q?2G4DmYm1jbkBXUidAj1TI605KTelNDKl3UvEw0RQPMaICmiu0fAQ+fuEEdi/?=
 =?us-ascii?Q?s7duRXprl2RrCRTvXN19uPfSpl5WHG0t4vY4oFILMTCWkmhQt+Ks2d4tWPa4?=
 =?us-ascii?Q?w+RxFJMa8BVjJk4TpR31eYnDVdyLQFDjTBYHL/A9EHqE48u3AgEFt/Nsv+fk?=
 =?us-ascii?Q?GOUdLwgi2yP/2m0Uz5ZH6f52sQ8XzgUf4npWg75TEW4hf9mtQav5iY2BWJqk?=
 =?us-ascii?Q?z6ve4fz+VuhpdVeMMtbdwo9AVZq/V3+InanPpzXWoLruH6dVlokXSOAK9qqO?=
 =?us-ascii?Q?ZEhgQJVJdy456d5HZWg743830QPJZkN7CydJi+sXmCU7O5wG/BBvxLArX9CN?=
 =?us-ascii?Q?/2Oz45lbacF/UJwPeu608fAp+wgTUx9pAxfjNT5+WE+M9IUWXn+/koTjMcwn?=
 =?us-ascii?Q?cQ5yaGM6cDq+Q7ihSPpdLOIUo7Y1wr0nMNlx+7Wj+A4Xbo/hi6wUHdRD6/jQ?=
 =?us-ascii?Q?pogK3HLPLEvt2ltOBxMIF7B8gJCr0aMC0HzFiFyW7CfIdAkVbvl23el/DiOW?=
 =?us-ascii?Q?D0xXU789thbC+Q/JOvsifZ395mwL1pRN+1w3U3k66vhnvuiAxZC07xnWwnuF?=
 =?us-ascii?Q?ksMk6bLaWY2rYOlgIFSkJRj+rbd4gFLmAH4QCBSTo9REAUkc9XWTdvEix0ly?=
 =?us-ascii?Q?/iA/ZeIVHxpAcKkI+dv9Q2bim7H2h1jVisL/CIRVZx+pahEDeGw0cUhGA3bC?=
 =?us-ascii?Q?UAtyIEC6GjMzvlxWrE0QLfTyGW50jc4mG2bLOgmJH5b5YnVAwO5VSz+f9017?=
 =?us-ascii?Q?Ac8UssykRXOgK7TtPunjNV0boJnlI8j7VFfg+n+OUOXqGCoK4kdY1TzWWmim?=
 =?us-ascii?Q?Ytkl/983c59Kfyp6M7KxCwon77Q3/JYL6pOLir/WWlsWG2NSI4mmOH14t/PF?=
 =?us-ascii?Q?MIxMHDEMYnkhagpbKEGKoC3DsYH5/cpN5lV+bb2dkQ0bMelajaYby8eKrmzA?=
 =?us-ascii?Q?rV7KTMsu7A=3D=3D?=
X-Exchange-RoutingPolicyChecked: ojOLDGKv1Q9UNNrnsHk4Gb1vZCfcjzoEy8EoLpdtQdAsr5/lqGQEbt7vMcb95AiIcF/TPE7bqmrR14PhoGhHw6tGpSHrpIIlnenLPOGS5KAeY/G76K4pZOwsAloe+T4R8xYbdw1tuJdWd5xDht2CQwg5EdVyxA1j3ckSgbZV1l3IQe+0l5pVCn18bEv+Lf4x7xS90PzlPKInpwNIn8RVqN5gRt4THiHunqzVuuXFqx/YqxA0i7/UW835Mueo08NTS8qf1SYX3077R86tQhlvB6R48l2IGA/DPeAOLK9dI+ZCB2RlVY/JTs6+yD5WzydGQxyZvn5qPXaQ/9ToMhwnJw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9060dda5-5969-4f8e-1510-08df09d757ff
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 16:21:01.1961 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oFTWCU3L4SW1g7uq1xxIfSLjFl3xV0cOSNZ25WQjl+SoSvt3gt4OXVOcAhuYeUplzzSFXoRgl6/6lswYwsdbeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7193
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

On Thu, Aug 13, 2026 at 12:06:51AM +0000, Zongyao Bai wrote:
> Prepare engine-cycle queries for delayed forcewake release by
> protecting their forcewake and MMIO section with drm_dev_enter(). This
> lets unplug wait for admitted queries before flushing delayed-release
> timers.
> 
> Use drm_dev_unplug() on post-registration probe failure to provide the
> same synchronization before teardown.
> 
> Assisted-by: GitHub-Copilot:gpt-5.6-sol
> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c |  2 +-
>  drivers/gpu/drm/xe/xe_query.c  | 34 ++++++++++++++++++++++++++--------
>  2 files changed, 27 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 71111ad32465..81b31325e581 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1166,7 +1166,7 @@ int xe_device_probe(struct xe_device *xe)
>  
>  err_unregister_display:
>  	xe_display_unregister(xe);
> -	drm_dev_unregister(&xe->drm);
> +	drm_dev_unplug(&xe->drm);
>  
>  	return err;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index dc975f595368..3c356bc48e2a 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -8,6 +8,7 @@
>  #include <linux/nospec.h>
>  #include <linux/sched/clock.h>
>  
> +#include <drm/drm_drv.h>
>  #include <drm/ttm/ttm_placement.h>
>  #include <generated/xe_wa_oob.h>
>  #include <uapi/drm/xe_drm.h>
> @@ -123,6 +124,7 @@ query_engine_cycles(struct xe_device *xe,
>  	__ktime_func_t cpu_clock;
>  	struct xe_hw_engine *hwe;
>  	struct xe_gt *gt;
> +	int dev_idx, err = 0;

use ret instead of err, then...

>  
>  	if (IS_SRIOV_VF(xe))
>  		return -EOPNOTSUPP;
> @@ -143,28 +145,44 @@ query_engine_cycles(struct xe_device *xe,
>  		return -EINVAL;
>  
>  	eci = &resp.eci;
> +	if (!drm_dev_enter(&xe->drm, &dev_idx))
> +		return -ENODEV;
> +
>  	gt = xe_device_get_gt(xe, eci->gt_id);
> -	if (!gt)
> -		return -EINVAL;
> +	if (!gt) {
> +		err = -EINVAL;
> +		goto out;
> +	}
>  
> -	if (eci->engine_class >= ARRAY_SIZE(user_to_xe_engine_class))
> -		return -EINVAL;
> +	if (eci->engine_class >= ARRAY_SIZE(user_to_xe_engine_class)) {
> +		err = -EINVAL;
> +		goto out;
> +	}
>  
>  	hwe = xe_gt_hw_engine(gt, user_to_xe_engine_class[eci->engine_class],
>  			      eci->engine_instance, true);
> -	if (!hwe)
> -		return -EINVAL;
> +	if (!hwe) {
> +		err = -EINVAL;
> +		goto out;
> +	}
>  
>  	fw_domain = xe_hw_engine_to_fw_domain(hwe);
>  
>  	xe_with_force_wake(fw_ref, gt_to_fw(gt), fw_domain) {
> -		if (!xe_force_wake_ref_has_domain(fw_ref.domains, fw_domain))
> -			return -EIO;
> +		if (!xe_force_wake_ref_has_domain(fw_ref.domains, fw_domain)) {
> +			err = -EIO;
> +			goto out;
> +		}
>  
>  		hwe_read_timestamp(hwe, &resp.engine_cycles, &resp.cpu_timestamp,
>  				   &resp.cpu_delta, cpu_clock);
>  	}
>  
> +out:
> +	drm_dev_exit(dev_idx);
> +	if (err)

oh no!
never to the if (err) after the goto! Sashiko is absolutely right!

... then you move this to the very end and simply:

out:
	drm_dev_exit(dev_idx);
	return ret;

> +		return err;
> +
>  	if (GRAPHICS_VER(xe) >= 20)
>  		resp.width = 64;
>  	else
> -- 
> 2.43.0
> 
