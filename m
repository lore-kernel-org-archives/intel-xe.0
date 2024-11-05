Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF9BD1CA15
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 02:44:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C58310E3F4;
	Tue,  5 Nov 2024 02:44:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wp1z5+/D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3040710E3F4
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 02:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730774674; x=1762310674;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uUFD9FkTTxsTTrMGDC2dnF+7A/QCSPBYLtgqnG9fJTI=;
 b=Wp1z5+/DyqA3nzRwXF4EmBt6RBgV4eLRLBgZiEphfHS6yOMzZyFnoObw
 K8WgoDxyReEQtKi1W2SUnq82Uy8UUG3R/xeTjhgxbGP1w04BMUVT7UB0G
 VdJtBrtZyhdaT/POJEmkOdXP2zyKuep4ylzTS50qhwzOhK05EpCMQ5o+5
 sZ7+RfWkvsNNEtQIsJTP48P+LQUhGAfxHbGePhjKNe9ZmigT430vcMVtp
 ElYgPjzPELfrn6ueylGqPzAQP5N/wNaRK3bNvpq8iuLQbEEwVsusxQ/PX
 JOYrPHWK1CScQDMgHa3e2STQNdUHtyET9m/BLwwvvhMKwM79BxoNgc3kY A==;
X-CSE-ConnectionGUID: 4+Hg+WtvTWuPso8XDDLBtw==
X-CSE-MsgGUID: 2j6BfgkORVeehJvTvfgfRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30451820"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30451820"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 18:44:33 -0800
X-CSE-ConnectionGUID: Zo5ccNpnQPWAMQ285EQXmA==
X-CSE-MsgGUID: HWJFa1TZTDeAzzE7jwS9CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="88604715"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 18:44:33 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 18:44:32 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 18:44:32 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 18:44:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oHntcoOzcKaXxZez19Co0zjaiiuDeGrYdbMkNp/0to/Ey8QCPvWt8fjesof0xVH8q0teR24n7zRBhchTjIK5Tvy4vDwKsLy2PnFxzKJGqwSaYhNzh8sa7FWKGGRhSJiMvTPSkX12ybDOxwj/P62TQcQKUIpf5ppzWD0yP9PUn4ILTwWgDHgdtpSfRCrlDpnIv/kfLpCjpQSR/M8Wa+Kljr+ifqJWNm+XM1Oy707zXlZ9OJkxDa2nORSeng/oaPsIgHdLJyBqweb55qTiNDeWlrrKD2fP9ENCFp+wjZwtWK9Ol1Je4xeizBvUgkvH/6RB0mjD1/g8nu9Wh1iSP81dcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ymk2CtxuubJCPm4hj4jnbaZ5QvK0fngHAG7JCZ7Htvs=;
 b=fMjf49bNwQCMYt+/0IYKytxCuO5elZduRz/6ATntshnmJsXOZ7r/6FS5Wl2jC56e/QZgYi/lMxVr7WR5Mno78Zeyh2ejE1cw+DtFaF6x2TRLby3Qb9z+itYYb6UIXFnbN+wXLh2CQsfWnX9H+hljD19biZe1IpwW97818W3ie+kgqGVxq1jFa+JLwdLbH2i+pao+W6W+sbg01DuHMm+hluEWafAejitX/RMcDtg/ey8/bgbHYbjhrImctgN+j4OKcGFdLWy9d/OIDw9bThrEsS/hJoaI4LS89eRG9Gwbp81/t0CKYbdkjwlQd4J5AxVXAnPa/XtFFdtkkpNJ9g9TeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CY8PR11MB7800.namprd11.prod.outlook.com (2603:10b6:930:72::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Tue, 5 Nov
 2024 02:44:30 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Tue, 5 Nov 2024
 02:44:30 +0000
Date: Mon, 4 Nov 2024 21:44:26 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: Fix possible exec queue leak in exec IOCTL
Message-ID: <ZymGit7CkuWQsHvj@intel.com>
References: <20241105003832.4021758-1-matthew.brost@intel.com>
 <20241105003832.4021758-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241105003832.4021758-2-matthew.brost@intel.com>
X-ClientProxiedBy: MW4PR04CA0131.namprd04.prod.outlook.com
 (2603:10b6:303:84::16) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CY8PR11MB7800:EE_
X-MS-Office365-Filtering-Correlation-Id: 9317225f-4c39-4ef9-4697-08dcfd43c5d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KPmls665NL36kNGaKPfvMV6hyZ3bLf5G+dIP4q7+rK1s1tvDVqX+/P18I035?=
 =?us-ascii?Q?vfadZPdhALGyJlYvE0wFXSSItPsV+qPP9X3dzYVRV+aWBbNtZaxlOK73HZHJ?=
 =?us-ascii?Q?ghKs5RFcBm1Qsf4Va3mcdu1STcd9LHuvQWc9bnTYBJBD9yg/q1C6EgE3lYM5?=
 =?us-ascii?Q?eu8VMc8dMeVsXHL+pNx6IAc9VP7bVUE+mOo9d69OlIsPMdhsGo2fluPJdZri?=
 =?us-ascii?Q?rhAt2NMj25Xcn0Bl+toLVDap6dlFF9EGAxxVGZRj/+iqlm0A79ejp1GJ4Wc6?=
 =?us-ascii?Q?rMAX24QQ5Qh1SW0lvi+CmFx5myMM5lN4/Rky1NrYJ+ZrdVQ7MqxoZpSSPHr9?=
 =?us-ascii?Q?/Cbvua+ReQY/GcLPKd18zu5IpZ7lyDHuzZUj/xoy4xqKSa1f7jCCEqw1nIt4?=
 =?us-ascii?Q?JFlUZ2eMNRGd6zuVtRCmTzppqrifH/dHYSrGJc65A/GRQGvw0oZDrXEN1sde?=
 =?us-ascii?Q?gfJ+gBHxljZg2MAusTEZH/pce2k4dnZETUeJRCcR/6vyInBwbeP4RbYRmzoW?=
 =?us-ascii?Q?51rKgrW5amGerldD1zKGXyve4CDw3lK7Zgo8hdFhs4N7pRDm959qw4JK5k6y?=
 =?us-ascii?Q?XKt5j2t279Nx2ViBUH8UIqg+TdXgGmWk6yurZoCTxO+5fV2J58EqiZtMesaF?=
 =?us-ascii?Q?WY6S0EA0u53v4P/7pWDLc+vjerlz7i22ZsQFlklNx6+qtimbLrfdDHms8Qvc?=
 =?us-ascii?Q?z2f4sC6OVzHBFnnJOkv2Bsq90X58O+57zIq8hOYJ3QN822pbuOGGFnoohFcU?=
 =?us-ascii?Q?cR6dCCxEbxgAoew9Ah1uRovAfwHhBBF60vxI0Y0ZCq7Fp7sxiocbHX4lVQ+A?=
 =?us-ascii?Q?0Uy+AO53MpzhtBv8qcUgKDL/d3DcSEEM/jr2irJATb5cvY3cKvEL7Ve2wASF?=
 =?us-ascii?Q?pqfNJIiBtNjj/weDe3pWcDwTvNPqfO4nspicJwqq/Lgq8RfWvNMFfLALv//v?=
 =?us-ascii?Q?6T72DJoEXbhInODK2uV2cxGShBuSOQ6f2gjTYY6Uxgv1np2PDY0a3qbbuE/l?=
 =?us-ascii?Q?h6nnehZ3r1xgX649/MO0jFWgaYifpVcrL6iXCY9bsbkbVvJuPfjEN4MmhfQ4?=
 =?us-ascii?Q?vAubIH2DF4Rk/mykXULPC0Hjnh6lmQ1ODRhRWlKQLUOtD1uaUMtUMPVrbNbL?=
 =?us-ascii?Q?6fATS9nPRChs/j+4D4VZziVoLjNIJQu6n7JZkLNFtI8uae5HP2Ac3JIg4J8j?=
 =?us-ascii?Q?nWZWS62N8v64mHBieO7KNwzEHeU7y0WX+6nxWicNS6amf8IBdO4/68e1qV/B?=
 =?us-ascii?Q?lSYcN7kVzr5o50ox4qkZx8tGzLcc8Wm4j4WI26lHpgSsV1fIXn6CIlMgGn0a?=
 =?us-ascii?Q?pX7X1WUSTdLeLB9odGNRihw+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TB6ZRIyO+ry7zkQ8SlRDoUkyvjmYmerSNlIFf4ktqFEvDPz5FY/ZajUbfBIM?=
 =?us-ascii?Q?zPAdFvPdPm/oB4VEpVOpkvLHfWoeMtLUABvV1L0WtlL9MgwgMIpHY6xmDtdZ?=
 =?us-ascii?Q?mD/PPmhA/nIOeqQ2e/z/xS0Ptu2chYCIachrxhrOBMmijlE6evj+jKBlBXMD?=
 =?us-ascii?Q?yEZEdNED1F+H2687uJl0gluRB3JYImnNkLig+QlSgm76RxO2DdVPho2IBUtX?=
 =?us-ascii?Q?O5aa0Ef/jBdmpzCZuxf8SOJBD5jB9/iUK3COHMfSJ2WZ+jBhvm68kuJHW9sT?=
 =?us-ascii?Q?SdDUO5wQFivYRFdHLmhUOKmaT4D9MwsuMFfkGP+kkw0sBV8cBTXyeT3Q7Q7x?=
 =?us-ascii?Q?yht559ntEfAsQcJCEeXduNU6d6BUprph8rWBaidqFbBR+3X0e3rkckWaZ0co?=
 =?us-ascii?Q?d85ixbcOin/Udfv47CxNqL8mhL+UAIAco5FogaZMr1xqBBX2SuZHKCOpJE5V?=
 =?us-ascii?Q?V1F8vbKQ3PFFKS9ID/ZhGZ033LyNisB7Sevg4IkYJNo26bG9t09TKAx9e6xR?=
 =?us-ascii?Q?GftTLoD0qGXhawdRmiZ/EOIB9AHRmyuTT9nvEq2WUm3oyXWZSHrqgj3zFREu?=
 =?us-ascii?Q?oenaGbdznhFZe+pauOtp50GgAV6XlL2r0Sn1mI/ixRDMbUD4yHzs0FEHWKCa?=
 =?us-ascii?Q?3VWYQxO9AJASmdBuCKNpxebdutCKK3hvcqiZrWyJfRj02zT1Ne+p+o8I7BZO?=
 =?us-ascii?Q?jwCRlxAF2pcyUW3+ahzP5e6YOKs/ewUlQ8iwaGFs/jDbR13SLEBLTY9BXuGO?=
 =?us-ascii?Q?meUte6GjNeeaRGpKVEgZHT/2ltvmsRPIB+rHpcmwrn2Ik4mrAwIAJO/vrZ2B?=
 =?us-ascii?Q?CZ/B4YCYs3xWPQHe91lX5Kt6i50eSpV3V8ZcpQhqh0BAK/oMbSua5TPEyJQk?=
 =?us-ascii?Q?7Kb5525+MojtY0PPTFmnAYOHDJKC2RooHQW4N/V+qFG3sXECUtmBgGRiLFsa?=
 =?us-ascii?Q?MjGPuLx4kF9HSSwrXdfzRbP9xDXH8uzKlqN+2zIkTatEfd49bU+1i4bVdrcn?=
 =?us-ascii?Q?VCzlMP2xJGCGI+6JPT9bYfq+GVHmGzprwc5+vMf5rlOoRyD/b2Pglb+a0/Si?=
 =?us-ascii?Q?sPmMrScUJvtK5sLWr0gu1unzZ4+0UbkDHlry3RH0w+J/mzB3sMiMWA4tCd+3?=
 =?us-ascii?Q?ADMmHrajHvOtd4UnRd50cBkvAsLuhbZVWm69kFl5p12M5zIhqg2PGy11mhOc?=
 =?us-ascii?Q?Ca2Zi2lXTD6HX2h6G5OBRfkUUfLMW+l68WlnGrg6EOc0iaZQT4xogKWiyXVC?=
 =?us-ascii?Q?IQV5MmMP7CXw6jod8mGhD98pUUHIZNT+t4+BwYrpOsaEUEKa+cM5SCEWOHWU?=
 =?us-ascii?Q?+h3jsPEpHPr6ZG4TGv7yA5wXlqW0Ye7g/qGusEvOX7JmJWFnRNW+MTlQ/7ye?=
 =?us-ascii?Q?NToPz1BlawEISqCu7mQKXlxaGSYs4LLe6vD4lXV2tXzBTpPixOoaP/HBEjT4?=
 =?us-ascii?Q?D/vpdEfmyi4uSlHKkDK7cVLZ1sH6A0y9nnajwt/kzqaeRuSlkwlj+vGEXv5z?=
 =?us-ascii?Q?SvIrX3+8oxkdGYsM/l1cmXa2WnasmVjuw0UX4JL3mL46TF74UvkJqdgE6bhH?=
 =?us-ascii?Q?EKVYrU+3/t+1w7zdJ479Wkbb3P0PRr8Iw0glR42f623MxDxPGsDcvweDfjrd?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9317225f-4c39-4ef9-4697-08dcfd43c5d3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 02:44:30.6816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v83/s04SeDa1DQ4OUsZldMqAPOswmmuA183/3rpgLXCPdvnxwjWZ2vcanIpq0OmuWBwjpdtTD9X6BYfVC3AFHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7800
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

On Mon, Nov 04, 2024 at 04:38:30PM -0800, Matthew Brost wrote:
> In a couple of places after an exec queue is looked up the exec IOCTL
> returns on input errors without dropping the exec queue ref. Fix this
> ensuring the exec queue ref is dropped on input error.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index f23ac1e2ed88..6de12f91b865 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -132,12 +132,16 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	if (XE_IOCTL_DBG(xe, !q))
>  		return -ENOENT;
>  
> -	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_VM))
> -		return -EINVAL;
> +	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_VM)) {
> +		err = -EINVAL;
> +		goto err_exec_queue;
> +	}
>  
>  	if (XE_IOCTL_DBG(xe, args->num_batch_buffer &&
> -			 q->width != args->num_batch_buffer))
> -		return -EINVAL;
> +			 q->width != args->num_batch_buffer)) {
> +		err = -EINVAL;
> +		goto err_exec_queue;

this function is so huge... it probably deserves some splits...
but the patch is correct

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +	}
>  
>  	if (XE_IOCTL_DBG(xe, q->ops->reset_status(q))) {
>  		err = -ECANCELED;
> -- 
> 2.34.1
> 
