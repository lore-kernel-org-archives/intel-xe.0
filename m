Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DE0C25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 20:50:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E5C510EC6A;
	Tue, 28 May 2024 20:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aRrLO0X5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95FD310EC6A
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 20:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716929436; x=1748465436;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ExdfJBExH3bDjTSGXdagdV4r4XvNkVxfGDB4ZrHRaBw=;
 b=aRrLO0X5UGU32SsJReCNu6l2n8sS/s5Mg3OVJJ+obuWM0TGCh+z0fWo3
 DuqqDggboMALnrRru1roBxrLuRInf6aHmlQ9c/7mlM5OPbm9GgPZjr+/K
 b4YULVwd4g3XnXQh17ft7HfV+vsvU7kFBM1QwI5PrNxNGJEEarlMOwf6e
 qyIQNfsJSpY/AsQPQDXa3UAPkZ6HU8Q4Ddjmv6MTHDievVI6lV7VQ11n3
 pHSNBvmmPP6lRVNXudXxEdxI6ZUH5meiURJS7KEHyl5RqpUnvsfKs5TVt
 sVoNH6GTCwKNhCtyxTq3q719NVN+DWNLrX5DKSQTz512Ks6VWNqU+URwo g==;
X-CSE-ConnectionGUID: G/SzLB4iRW2cgu2xUjUmag==
X-CSE-MsgGUID: 3+/B4O0qSvG7llz5Kk2t/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13152167"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="13152167"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 13:50:35 -0700
X-CSE-ConnectionGUID: vTRgSC0cRP6Fyv1RsqvcMg==
X-CSE-MsgGUID: 3he3fEsvQS2cxz3aWiVwOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="66383725"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 May 2024 13:50:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 13:50:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 13:50:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 13:50:34 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 13:50:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2+J701bWnksMV0DeyIL0f3j9KppFXFFkdBn8Sa4PMwhqeeOsDmsyXi7jzoqnob4Gx2uQUE2I/oPua7UgVmnqJzdmtBY3W0eC0il3Xcy4cimX+9hnjiKxpzEP6kV3ybYM6WUMnghIuVyaBZuk18ApmztNng6I4/7uAHxpoHCMPW3mFdlbIJXxU03+j5F/FePk2Fzlx/j3MMvejPtx7cynwKoZYOVWyyOA1Ue6cZhMganggu7/7yWXW5CvQYTyeMcjbNxjGM1lHnIMZFLwtcArO7MAgQv51gWVOuh1rXICg14dKg1Rd2X3bqv3eWVtYQmFiLjvuvhjF67Lis00/Ctjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ajm6edDk9yMu6/mahvlWoAIMoVbyZU5iuxBC4DTlI0g=;
 b=ZXIfhAjoBDkz6YtyU5NUzRByuY16h7WzxZGd4+61+dAb7Fna0D1IWI09DjnTqbCncIff6T/bFS3Nhnb3Xf0UUvlUXFohm3NQBphD3/GzWdwIETLtfWp6VFak1V7Kic5gOG2Qk+pn8y4N4VGhcW1t6cvOVhb2mAiRkOg5gxV84QEXN1N7YLnabB8Mr+be05x7vMDgwxH1cwD5iayPUpzNlKzFew1v/lVsUdg5JgIIjdpHkrtSysDpsa0vmQ2mtO5t8ZRCNTe7pYxszgTb3bS0/Uvz/R8Bo/DyQ0mlPHBdBZyIAnlygQopBZMdz1drH9COXZGRG3RF6QWxlpbSamAqUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CO1PR11MB5012.namprd11.prod.outlook.com (2603:10b6:303:90::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 20:50:32 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 20:50:32 +0000
Date: Tue, 28 May 2024 20:49:49 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2] drm/xe: Add engine name to the engine reset and
 cat-err log
Message-ID: <ZlZDbe15A88vX5OB@DUT025-TGLU.fm.intel.com>
References: <20240528101445.27688-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240528101445.27688-1-nirmoy.das@intel.com>
X-ClientProxiedBy: BY5PR16CA0002.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::15) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CO1PR11MB5012:EE_
X-MS-Office365-Filtering-Correlation-Id: 776e642f-2bb2-4510-31ac-08dc7f57d0f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/mhutjLwciOHeGv7HnTFmL7Y2qpsCbMxzbYM29pVEg+xmb6FoeYI0YTvsv2+?=
 =?us-ascii?Q?SGqCwKsMFT/Gi7ifV/JOjMvBAawsCRa+I36k09DL/LGpHGjd2TaeBKK8/2+H?=
 =?us-ascii?Q?ivtj7XLCTwAMEodg7/fiPcrHpKmFEDs7Mqudjoa54utmFCJVTdoshvhsJDJF?=
 =?us-ascii?Q?0jysuINn546KpEBcCIOzORTh0oi2xDHNEGNYe2PZ860RKFUUvsB+QaEnJyqp?=
 =?us-ascii?Q?8c0g56Cw7Lkobt2BruGCgrB+PfWUHkUv2SMHGYj60rknlloedgh+IK1m5mTx?=
 =?us-ascii?Q?isoGCHCODH0cSzqwLIIqIHNmRX0AHuO7aIqcjZPwGwqaCBQ/U7Wnl71I4wum?=
 =?us-ascii?Q?0mAbcJ+jmMsWUdOtw3qzdS5wWGktLy/9QLBjLUckEwLDvBCyb7kq8QqdnoRD?=
 =?us-ascii?Q?fwvEKfI0AO8HtY6CUCgEbZscfnpvm0UKvEp0BNwuJ2N21yM6/O75A2hXGTKw?=
 =?us-ascii?Q?k0ce2GL8Qdc/3Zwp8A7xUN+HyLzLJRvwhRnL+I1pPbqEq0Sa8u16ErAR8UMO?=
 =?us-ascii?Q?w/SyKYLKo1/HGm+0HzJIv12/1Ad0GTXj1t9gGDMKygrsvXEOFdkaZ4VS2dC1?=
 =?us-ascii?Q?smLCpABYLe3lq8UnnVz7tA1lKlc5MpDJVfCroElj95g/Nx2lISkflhNvsp/8?=
 =?us-ascii?Q?kbFXXrdqu1o+sKHdn47mef+2FonHJZiVrO13FSrRuKuRq4RJM9V8YJefHFi+?=
 =?us-ascii?Q?8Er7Gh9InK+x/3E4I4VxNnqK8dx1E2D18lQra07z3p5Q7zO8ho3YPyWl1skS?=
 =?us-ascii?Q?2mG6fx7pA3/a4Q5AJnC6NK8s3snRvTEabkUkLQXURDpntid+rfswAeNDrPIW?=
 =?us-ascii?Q?Np00ETwoec/hueBJri2Rt9z4PaAxbtPBxqDE3DIzioJQ47f/WTSy1IJRttuN?=
 =?us-ascii?Q?PCdU/9+F2TIZYYq4UAZ4zoLzaY03HKqP2EWM/k966E75AqIeERXagiBgbdBA?=
 =?us-ascii?Q?IMtWqzzyKzxm/NllLB1vNJTHhxJJZYZNKkxkIeEliVaBwRW7mf5xGJyKJqta?=
 =?us-ascii?Q?eBBzQsxbRq9KAjXP1etXkwWvqHqkxIkQq8u7jO+3K1vQ75Zhdj1ITXq83X1I?=
 =?us-ascii?Q?YLsIdCQLeaYXYVzEEKcOtH3Tg8IYKQFpXg2Obtwau41CA0nT/Ap0EkT1yieF?=
 =?us-ascii?Q?d3M+ISoX/JbzPFMsXU+yvn93zJtocl0Zc1DfyxjXBuXwuFK1L60emdDxnDb/?=
 =?us-ascii?Q?hyvEBkdi9GDZ7cYRdXhzjurDbj7QQPDtlK0XTJ7aEJQFG/KLMsASKI8yXGar?=
 =?us-ascii?Q?xSGTOlDb90bpCjO76iTpThN8yCMnOOTggCM2Dv82Ig=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MSxzmLdDPhkcoyfyRuP2eSoQ6W2V3J5szSSi5qol7y+GRyGbGD9S/j1vPkKE?=
 =?us-ascii?Q?mSgG0Gul4s54sRwk0vTE4wUdOL+1B1JxqevEhuA/P/7Pvy5MR2b0dbaC84wa?=
 =?us-ascii?Q?T06KdLI8utnPRO7fPHrW2TIgq0xVFcKZJiS4QmwW7VTtHx92BlyZQ05vXFK7?=
 =?us-ascii?Q?xiqjfMaCVk1Z7ThHobcotVr8XC71HiKnwSzQHVYJYYzGbxnANWUMlVhTqgJU?=
 =?us-ascii?Q?OQfBFug7gYAQ6qT3yLEr/5aX1KcC5HbEfmGuNF8IEQ/Xczvc7mVWyxZVaAB1?=
 =?us-ascii?Q?/R/S8LsRYUEYj1YbQwOWQxRcEYj+XxlS3tvStP8mKFRQuAqGZiqN+CV1A4BA?=
 =?us-ascii?Q?5bGrByLptBTc0a7YNF8uPCOFki/JBQJK25W1yoYzGQUPy9VmerNEwF5MbIzB?=
 =?us-ascii?Q?5n1BuRP8f1dZp4U66CrXMcQdjp1rlKZZem3esMJeGx/N59PzE7Lmq1k4RCGw?=
 =?us-ascii?Q?59kVk5ony1S8CxaEXjI3DJp2XuXvYSVGvMNNWxtypL9vR0B9woMfBI1usseU?=
 =?us-ascii?Q?6yUYteuag3VJd7FYRJHMsmsacIPFDL3bqO4ejvaVCXtgcmelmhJdND4DiRYF?=
 =?us-ascii?Q?p64OPiQgyIC3f7cvTTTn7WXHRua15BF0DF4ejaNAu3XoBvembWse3gIyg1iG?=
 =?us-ascii?Q?OtZmEwLT8zzZPWz9XiNc7QPnqoMI8/4b5ql0zj+2DUqsbhQcdM+4fwmkPo4G?=
 =?us-ascii?Q?yCGQFe/1D6V27qwYfURiRuFeBOoaxLz03i2XDLMb0DyF568ybFlLc1fDw11y?=
 =?us-ascii?Q?qGJKn3se+77lZYpv/RSHjxjZRwQuz1HFXikK9rtsfD6cqn9S2VLkmaPqcKLD?=
 =?us-ascii?Q?5va3+RKE1UywW5TLMrVtwN6sCI3SQxhm858cOr80op6PyuoXIFgmGZ03B52O?=
 =?us-ascii?Q?R4Mf5ICCeAdRsqwbIeWRtBq8D/v5CHLA5tghmR4gRlBNMQJ6AOhEAjgNCZSt?=
 =?us-ascii?Q?9hcDvmONQH6o1zI5UcLECXj+kW3410aUt5KBkoaL/ozJELo3xgA6ogWunh8g?=
 =?us-ascii?Q?5qgSghqOluQ4bacwWtdkPiR4zaG8NjBmXGHYCHGkLrV14M4xG5YMFrI3O5La?=
 =?us-ascii?Q?U+uNB60ul0He7mHwNogdsWrtprWILTZQC8wVU7fXWqjoWuVsMPpuFFLKjUuy?=
 =?us-ascii?Q?mGRPJKkHgupkX2RA9al9AeHIPdB2w2bHaM0UKWPpLrWFUhNJB/8dGytMc+cX?=
 =?us-ascii?Q?fyiMQit0Y0z3qwy2+l+4YzeOf0BV6t+LZfjO0uNcJTql4x8QKOhg209bAJsL?=
 =?us-ascii?Q?3MB/D36o/PCcN94VB32xIsd3CX4O/wRdKm8rsvqLlXPJ5FcTuHga4nA3ERz8?=
 =?us-ascii?Q?VYWx92tmJfugOBJOACFW0/pp7vj6uYlZIOqAlVio+oY9Q9/hHrR0qNli/onc?=
 =?us-ascii?Q?4uTfYzNhqM6JIR+sJ6fqmMZzboKKrlFarqrYHerFo8S1EAgQcMMFa//jWJXC?=
 =?us-ascii?Q?B9+tDu4bmyrMup0mh5vXgh61AJtGdZaXJnYBaqVNMtkHMbyKivl2MXR9T+m5?=
 =?us-ascii?Q?IkPPaRCvk5jAY0PAeT9uSo51mMsUmOIKbkLx+7BGpmtkTCF8JWhHDB0bdBdb?=
 =?us-ascii?Q?wwuL+APcOxjLGePri3UDl/3AaJwZc3IFbGTjI0Kka8bizt4WIo9QuQV/skSl?=
 =?us-ascii?Q?Cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 776e642f-2bb2-4510-31ac-08dc7f57d0f8
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 20:50:32.5412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KGz5NPsSAGClGJ9+stv1HtWONkRqNSFHcxCTZMND1ztkgaVbnmrKUaQklIoweY+qmpKQzAcRQ4MDStp7LzhLlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5012
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

On Tue, May 28, 2024 at 12:14:45PM +0200, Nirmoy Das wrote:
> Add engine name to the engine reset and cat error log
> which should be useful while debugging.
> 
> v2: Add logical mask and engine class(Matt)
>     Use xe_gt_{info|dbg} (Michal)
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Sending to correct version:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 72aa2f91832c..e22bd6b09a74 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1681,6 +1681,7 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  
>  int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  {
> +	struct xe_gt *gt = guc_to_gt(guc);
>  	struct xe_device *xe = guc_to_xe(guc);
>  	struct xe_exec_queue *q;
>  	u32 guc_id = msg[0];
> @@ -1694,7 +1695,8 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	if (unlikely(!q))
>  		return -EPROTO;
>  
> -	drm_info(&xe->drm, "Engine reset: guc_id=%d", guc_id);
> +	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
> +		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
>  
>  	/* FIXME: Do error capture, most likely async */
>  
> @@ -1716,6 +1718,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>  					       u32 len)
>  {
> +	struct xe_gt *gt = guc_to_gt(guc);
>  	struct xe_device *xe = guc_to_xe(guc);
>  	struct xe_exec_queue *q;
>  	u32 guc_id = msg[0];
> @@ -1729,7 +1732,9 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>  	if (unlikely(!q))
>  		return -EPROTO;
>  
> -	drm_dbg(&xe->drm, "Engine memory cat error: guc_id=%d", guc_id);
> +	xe_gt_dbg(gt, "Engine memory cat error: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
> +		  xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
> +
>  	trace_xe_exec_queue_memory_cat_error(q);
>  
>  	/* Treat the same as engine reset */
> -- 
> 2.42.0
> 
