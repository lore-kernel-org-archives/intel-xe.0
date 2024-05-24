Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7296C25B7A
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 13:12:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA1F10ED83;
	Fri, 24 May 2024 13:12:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eg+vi/29";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D65210ED83
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 13:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716556349; x=1748092349;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=nfn9W+VczbkJWvkIurr7dnXDqg/mKbG47VzFd62sM5E=;
 b=eg+vi/295HG+QzUH8FkDVcT/NVqlos3W9U1eRaFk75Nbshym8SH7tqdl
 is8rjyV6ccOE5S0ho+vTwc/5tQaOSIeyChTEe/9QOT8mTgXAltoL9mizB
 4mni/3jBNpbYjRCUjHPdPPnMXCy13xs5rZEJ01fRt3EQw7nE/YFOg1XhS
 3fR0qA5Jl2rgJV+nEpPpCGNCWgD6lluc5ZqzDpUvSanhhdet/SJyfM25q
 9GahV13eTkQQzJBuFKWwY/bq0+17GyJLH/kgibo2LppyLfbZZ/N/hTs0v
 BzOQAn/CubaA1uBL8XsGJ56Fb/rMoDCmIuKwsoGFWZ9xKmupG4KvtR8hb w==;
X-CSE-ConnectionGUID: I2IA9vnvQe+BXfR+8o6Mog==
X-CSE-MsgGUID: /aYwC0c3ShaaUzIMD3FqBw==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="11679385"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="11679385"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 06:12:28 -0700
X-CSE-ConnectionGUID: 5Uzr3JDpTsC2GdbLV24VlA==
X-CSE-MsgGUID: S58IHUw1RQK8Zzxoo9oFhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="34551524"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 May 2024 06:12:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 24 May 2024 06:12:28 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 24 May 2024 06:12:28 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 24 May 2024 06:12:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D25jcSmDFUO7i24SYaNO/nugbvgEPhvDut7uYgpfbGzprLNRsoDKSgNRn/9ZplUKcP+BryaiH0UMG7cF36sal+vS2x+HLRrEfy8leDu7zUapmtlx0UPOrcY/EV6vCKTd1e10PgSLcCEW2fQ+iOXdhWTq7/e4L1iAjApLB0CumB4IZI9Ofo03/cRTU1Ob7kWajN9iAReyZvF8c89jmX59VFCDS71hcKLXxgCwqUdI+EKVHxCmDhBPi/oiU8r1joFADcR90/JfBUHOF31fctSf3CHeOrE6nJKcdOODz3hjgeyvCzrb2oEGV0orkdqfzp5XSVtIqvTd2kFhcB2tzAAvRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FyvFLM0lFSLI4Y9mNtuR5BCxwyz8mPEC18oTX+nLy2I=;
 b=GUfqALSXAfqZs+ZxloC4GcJ81UnD31wXIEPospYomS2rRLTuUpoRreYLHrNazLoLKbIlWTiwxrwKNf6uwKrLnMPquCHnw2YCvFc/cnqMpE5UU5V99YttKTvskgQ6v2GdjkkxewTCUUkyIAqr1Y4rm8vAr54O2HqW7Vi3WWKSIfnjW+mIbm7wE/i/VBqY2zrrY7aJuLx1r/V7MT05Hgrd2yhN8Sdhq8PFC1c8IJX4VU1pUqc5TGppb3Fx+nXWjzg/0sVKMXgPa0CggEj7EFg9vwpqVjjS1jxusOtG5UIcwbF6ObiUI2QnR/sg9B76ENZPfeN9sFQODUNnyjIIjoTw/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA0PR11MB4637.namprd11.prod.outlook.com (2603:10b6:806:97::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Fri, 24 May
 2024 13:12:25 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Fri, 24 May 2024
 13:12:25 +0000
Date: Fri, 24 May 2024 09:12:22 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v3 3/5] drm/xe: Don't initialize fences at
 xe_sched_job_create()
Message-ID: <ZlCSNtSd67eXcqBk@intel.com>
References: <20240524071940.83042-1-thomas.hellstrom@linux.intel.com>
 <20240524071940.83042-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240524071940.83042-4-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY5PR20CA0005.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA0PR11MB4637:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d369f43-52e5-4db6-7d97-08dc7bf327de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?rdQykl8FsI0hrzi0mehJGxInAloPfXghiIFpjldJlL+RN4n7nm49fm6mNg?=
 =?iso-8859-1?Q?kv5oYw1wi7A+oe1Utz4gHBTuep6pwYVt1bTGFF9/kAtj7EzY/1cEEXMdq1?=
 =?iso-8859-1?Q?TCR6FHMCOBxX00NFp6HCYQG497HSQRDFAujm6S3cz5K6o1E4URrEMOZ2zF?=
 =?iso-8859-1?Q?4rq3M6r62+QwRE7DyrjK3xdd6lCBRUAWIe12e30xl1W+i47xAe+UNplE6l?=
 =?iso-8859-1?Q?urPu31XBdSB6zChjsH347/ka6y+l/2eJ2SSHK/8EE7RnlltABZb6osdfud?=
 =?iso-8859-1?Q?vJs38jygLvCuj0HbaXcXYKVa5UfoKE7weX1LjGcglQPs24fWg7oW9L7G2I?=
 =?iso-8859-1?Q?Z6EGFBA3OMkE1li4POhTP9qOS8O0MNr9y+8JI0b1aAi+GibDPckj+0Idbt?=
 =?iso-8859-1?Q?6w/dOAlNyalAdfzDGlG+RHsW0Srpx0OwqOqCgTETfV/cToEt27u0EbAmkE?=
 =?iso-8859-1?Q?cw7wHxITzbkIiCie+bQfs6geu8i0KuRfXGio7daf5ra2q607Iyxh6P71lm?=
 =?iso-8859-1?Q?HFPx1mAYYGtN8lBuzjFfbUjJ+YqFXR+FqUVSKvGQGCmfshBHDdQDTCs2VP?=
 =?iso-8859-1?Q?6ZWtEYz4f10EN2KGrKpgixR0b/7EGsjwzjcuUVn+Idms8OkwNwX9Z/G2+5?=
 =?iso-8859-1?Q?E787dvAKv20jjX6aPIysJfOqGoPXqC5cadh0ALM3hab1gJg83kVHtFlXjy?=
 =?iso-8859-1?Q?7D5zR/0EB2ESAwTtChbdWWCtuxxhK8KZxuCAQ5o+QPWyM2pRQyb2dzVB+9?=
 =?iso-8859-1?Q?kOnbwHFRpnc18xvleg6POtai75zgwyi0Z7W7xeaOp7MMcS/f7706tSk1f/?=
 =?iso-8859-1?Q?PwhRYzAjrJvpKzvSvxK3jXuV1v5VaxWm1PPeNZr8MfAdPTzZyqs/F+VJRZ?=
 =?iso-8859-1?Q?C+vmMHWDagHDOvsgmwFnnDJnCv+6lqCJ4/FEy4ik9IbV4yRFwJ9NApAhf8?=
 =?iso-8859-1?Q?N+gsZoHXionkHIhCjIYJvPF/WM8BeJDfo7NM+R+wv4QP4bj2xqcjUV3/t5?=
 =?iso-8859-1?Q?ob+A554H/UKUWaJVph8SU6af/k/x4K77opSYtCa7WyVl9jcKKRpw99C0y5?=
 =?iso-8859-1?Q?Bg8INfyX/3ospjCvnfpPJXF5jD/DleeZbMZpqw3o/0NmCJBArUFmP7eQr+?=
 =?iso-8859-1?Q?1/BaXZaccNMlPyhSM4fAr4OAArYVBL5yoX4Yo1ziKZFGsg5Ys4g2oLaOh5?=
 =?iso-8859-1?Q?uVVhw7Ow4c9uBq4hISaJDUn19CnBwV5KvmCq7sANestIOV52PjOFRqqlx7?=
 =?iso-8859-1?Q?3Zs2IHQsjMaHmuK6D2Co5rhUjkuj9sm5W18VwsaL4B4EKnH4AuGsPhadPO?=
 =?iso-8859-1?Q?DmNnooancXqQEyc682hKOKAeVg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?oS2knpT6rxn0pSW8k8VdYRh1y7PVl48ECrrJXssDtkVIxY7KZllt2AFyVc?=
 =?iso-8859-1?Q?/56mbdxCmZ4s+AvPHzhu/1I71IuWC9OzCjSeUg+WmxhVrlcWM7IypiiDY+?=
 =?iso-8859-1?Q?1FmGQOmB0YDuDCt5cmDxkcJlxLflmy3OMTBiW4l9uVjpalJWfpMVeM8sKv?=
 =?iso-8859-1?Q?b5gua/4Z6Z24llgbHLydXrPGKbal44tS5fpk9jaTJxk5oXgmdFtFn/H74c?=
 =?iso-8859-1?Q?EfNP4JYkF4DI5Hx91ndTVgi7I8I9rIH85gEzkbbcidhdZJVZ6XFk1l4y3J?=
 =?iso-8859-1?Q?i/VVYzs1XQdhlCYwJun8LDN0l2YuoaYNz6Adpd2B6mN7KXOSSUeQC7fG/G?=
 =?iso-8859-1?Q?qAnCJp00t4aVEs3XY5DYdl8I3nbSwYipT8vcoRlYZhIsdIRXMrFzWeOMWd?=
 =?iso-8859-1?Q?clOozzeI4jU2wrXonebgWXBuBKE/65lONfzopL3BJYXuZIEQpCy9CjB0gh?=
 =?iso-8859-1?Q?FNQojgCH6k/QUnHKZZ8SRnhEF/dMUxL76ymJId/DcEFXPjMKrCzQSMvac3?=
 =?iso-8859-1?Q?JcUtBIBxEpJp9T1IrrOKlMUe9GcSmvIHVkRdiIVQUwrcdVHmuyNkDOiAEK?=
 =?iso-8859-1?Q?VzjMIVap7GFN2SsPa9ShumePwwMXbTy5eN6Kn27id6CiqWELagEpJIaPVR?=
 =?iso-8859-1?Q?1y/axB4HNMLx/9OWS+jxRVTaiMrcopAOkKvCz0GiCSXJyLJIhF2wye9LT2?=
 =?iso-8859-1?Q?sXy2SOCSuIV2Qv7FOF3nrvY6cW5XQYRWfh5Xep5Ppl8GnG5XXESG16K0nR?=
 =?iso-8859-1?Q?0NZQ/flPFYtiRoTCXDRo//FoCNyDYuINEd38RtNY6yCF+CYVgTxW8Up4rx?=
 =?iso-8859-1?Q?X+vYkCRZiakBPNobPW7Hs7pECzrmV2s72WwwkZ3qTNZsMDFqWSNwNtMrVQ?=
 =?iso-8859-1?Q?y+ZelWCiE6zCxa5brb2Cpn/H011am0ePBCLwhiw1tAkRzehvAstqgfsGeS?=
 =?iso-8859-1?Q?mZegPxhgAVS9ZX8oSa9IUJ297Q9QVo6Rs2+2YrKuVoQOlrzd8bEsaK+qkR?=
 =?iso-8859-1?Q?JXyE5hd70BkLduEIm2T47G/JEvjLI2i46dHcrLUQ4HztXexhJhFuNy1O4i?=
 =?iso-8859-1?Q?5Rqm8BTL+2zkhhf53vP+7xUAhaKFYvTVautQ0RSZOrfw5/85tw7QA7fhw/?=
 =?iso-8859-1?Q?wyV6kAAtzEs2nO4pf1UjvMXV+PMNgDTehUB3ptTbL/J8i3UZv/h45/kCZl?=
 =?iso-8859-1?Q?MswnDkrgpNojtS6w0nFHu9rA4tEiSTrcev+kSJHgUKobfIJzzpiz+mAcBA?=
 =?iso-8859-1?Q?TjpVzAPP9vQRBrOZvAs3jsNGh+9XERUyVsK1klgSv9KJDY04M//DuVuV6R?=
 =?iso-8859-1?Q?jVQ2R1PERZWqpM0pq8ohVa4iw6xBRkfKba6Dh1RB1LmLQCNsvGJS6zN3Mi?=
 =?iso-8859-1?Q?5K0vG2QmjDrgIN1oawoohZ8gVRlDtKuOR6vOd1wbqFXuN/4FJ/9emxTFie?=
 =?iso-8859-1?Q?5xezy3cQAV8ZNq/ne/8yNoV0FPbWFjz5dTn9q8ZEsGihHaoWY26yHKGCnX?=
 =?iso-8859-1?Q?6rD3l/bTPOaqU5X7Ou22pUnCzHUDOnWpaeWtyGqeGZxF9D6yvWC5CxYGci?=
 =?iso-8859-1?Q?xK2rQe5z8XStiV8Tt5+oNMMajJ/g/4TgoJk/8DiMTuY9HWFIWpUecv3vPz?=
 =?iso-8859-1?Q?zVy1Eord+94g1nb5+0LW14szXxKWmhCpAFG8vVv9NjaylArFmrx3WHSQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d369f43-52e5-4db6-7d97-08dc7bf327de
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 13:12:25.7939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ElDWjr0d1MY/uae2aIhhOaUZcKgl5H693w9u5wzzQznUpbU3tOGR5LDdPF4R2uE9RhhuL7WTqyNb3NiFG2d9wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4637
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

On Fri, May 24, 2024 at 09:19:38AM +0200, Thomas Hellström wrote:
> Pre-allocate but don't initialize fences at xe_sched_job_create(),
> and initialize / arm them instead at xe_sched_job_arm(). This
> makes it possible to move xe_sched_job_create() with its memory
> allocation out of any lock that is required for fence
> initialization, and that may not allow memory allocation under it.
> 
> Replaces the struct dma_fence_array for parallell jobs with a
> struct dma_fence_chain, since the former doesn't allow
> a split-up between allocation and initialization.

I'm wondering if it would be possible/better to split this change
in a separate patch.

> 
> v2:
> - Rebase.
> - Don't always use the first lrc when initializing parallel
>   lrc fences.
> - Use dma_fence_chain_contained() to access the lrc fences.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       |   5 -
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  10 --
>  drivers/gpu/drm/xe/xe_ring_ops.c         |  12 +-
>  drivers/gpu/drm/xe/xe_sched_job.c        | 159 +++++++++++++----------
>  drivers/gpu/drm/xe/xe_sched_job_types.h  |  18 ++-
>  drivers/gpu/drm/xe/xe_trace.h            |   2 +-
>  6 files changed, 113 insertions(+), 93 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index e8bf250f5b6a..e3cebec3de24 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -96,11 +96,6 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  		}
>  	}
>  
> -	if (xe_exec_queue_is_parallel(q)) {
> -		q->parallel.composite_fence_ctx = dma_fence_context_alloc(1);
> -		q->parallel.composite_fence_seqno = 0;
> -	}
> -
>  	return q;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index ee78d497d838..f0c40e8ad80a 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -103,16 +103,6 @@ struct xe_exec_queue {
>  		struct xe_guc_exec_queue *guc;
>  	};
>  
> -	/**
> -	 * @parallel: parallel submission state
> -	 */
> -	struct {
> -		/** @parallel.composite_fence_ctx: context composite fence */
> -		u64 composite_fence_ctx;
> -		/** @parallel.composite_fence_seqno: seqno for composite fence */
> -		u32 composite_fence_seqno;
> -	} parallel;
> -
>  	/** @sched_props: scheduling properties */
>  	struct {
>  		/** @sched_props.timeslice_us: timeslice period in micro-seconds */
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 2705d1f9d572..f75756e7a87b 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -366,7 +366,7 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
>  
>  	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE; /* Enabled again below */
>  
> -	i = emit_bb_start(job->batch_addr[0], BIT(8), dw, i);
> +	i = emit_bb_start(job->ptrs[0].batch_addr, BIT(8), dw, i);
>  
>  	if (!IS_SRIOV_VF(gt_to_xe(job->q->gt))) {
>  		/* XXX: Do we need this? Leaving for now. */
> @@ -375,7 +375,7 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
>  		dw[i++] = preparser_disable(false);
>  	}
>  
> -	i = emit_bb_start(job->batch_addr[1], BIT(8), dw, i);
> +	i = emit_bb_start(job->ptrs[1].batch_addr, BIT(8), dw, i);
>  
>  	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | job->migrate_flush_flags |
>  		MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW;
> @@ -397,7 +397,7 @@ static void emit_job_gen12_gsc(struct xe_sched_job *job)
>  	xe_gt_assert(gt, job->q->width <= 1); /* no parallel submission for GSCCS */
>  
>  	__emit_job_gen12_simple(job, job->q->lrc,
> -				job->batch_addr[0],
> +				job->ptrs[0].batch_addr,
>  				xe_sched_job_lrc_seqno(job));
>  }
>  
> @@ -413,7 +413,7 @@ static void emit_job_gen12_copy(struct xe_sched_job *job)
>  
>  	for (i = 0; i < job->q->width; ++i)
>  		__emit_job_gen12_simple(job, job->q->lrc + i,
> -					job->batch_addr[i],
> +					job->ptrs[i].batch_addr,
>  					xe_sched_job_lrc_seqno(job));
>  }
>  
> @@ -424,7 +424,7 @@ static void emit_job_gen12_video(struct xe_sched_job *job)
>  	/* FIXME: Not doing parallel handshake for now */
>  	for (i = 0; i < job->q->width; ++i)
>  		__emit_job_gen12_video(job, job->q->lrc + i,
> -				       job->batch_addr[i],
> +				       job->ptrs[i].batch_addr,
>  				       xe_sched_job_lrc_seqno(job));
>  }
>  
> @@ -434,7 +434,7 @@ static void emit_job_gen12_render_compute(struct xe_sched_job *job)
>  
>  	for (i = 0; i < job->q->width; ++i)
>  		__emit_job_gen12_render_compute(job, job->q->lrc + i,
> -						job->batch_addr[i],
> +						job->ptrs[i].batch_addr,
>  						xe_sched_job_lrc_seqno(job));
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index 874450be327e..4537c7f9099f 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -6,7 +6,7 @@
>  #include "xe_sched_job.h"
>  
>  #include <drm/xe_drm.h>
> -#include <linux/dma-fence-array.h>
> +#include <linux/dma-fence-chain.h>
>  #include <linux/slab.h>
>  
>  #include "xe_device.h"
> @@ -29,7 +29,7 @@ int __init xe_sched_job_module_init(void)
>  	xe_sched_job_slab =
>  		kmem_cache_create("xe_sched_job",
>  				  sizeof(struct xe_sched_job) +
> -				  sizeof(u64), 0,
> +				  sizeof(struct xe_job_ptrs), 0,
>  				  SLAB_HWCACHE_ALIGN, NULL);
>  	if (!xe_sched_job_slab)
>  		return -ENOMEM;
> @@ -37,7 +37,7 @@ int __init xe_sched_job_module_init(void)
>  	xe_sched_job_parallel_slab =
>  		kmem_cache_create("xe_sched_job_parallel",
>  				  sizeof(struct xe_sched_job) +
> -				  sizeof(u64) *
> +				  sizeof(struct xe_job_ptrs) *
>  				  XE_HW_ENGINE_MAX_INSTANCE, 0,
>  				  SLAB_HWCACHE_ALIGN, NULL);
>  	if (!xe_sched_job_parallel_slab) {
> @@ -79,26 +79,33 @@ static struct xe_device *job_to_xe(struct xe_sched_job *job)
>  	return gt_to_xe(job->q->gt);
>  }
>  
> +/* Free unused pre-allocated fences */
> +static void xe_sched_job_free_fences(struct xe_sched_job *job)
> +{
> +	int i;
> +
> +	for (i = 0; i < job->q->width; ++i) {
> +		struct xe_job_ptrs *ptrs = &job->ptrs[i];
> +
> +		if (ptrs->lrc_fence)
> +			xe_lrc_free_seqno_fence(ptrs->lrc_fence);
> +		if (ptrs->chain_fence)
> +			dma_fence_chain_free(ptrs->chain_fence);
> +	}
> +}
> +
>  struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
>  					 u64 *batch_addr)
>  {
> -	struct xe_sched_job *job;
> -	struct dma_fence **fences;
>  	bool is_migration = xe_sched_job_is_migration(q);
> +	struct xe_sched_job *job;
>  	int err;
> -	int i, j;
> +	int i;
>  	u32 width;
>  
>  	/* only a kernel context can submit a vm-less job */
>  	XE_WARN_ON(!q->vm && !(q->flags & EXEC_QUEUE_FLAG_KERNEL));
>  
> -	/* Migration and kernel engines have their own locking */
> -	if (!(q->flags & (EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_VM))) {
> -		lockdep_assert_held(&q->vm->lock);
> -		if (!xe_vm_in_lr_mode(q->vm))
> -			xe_vm_assert_held(q->vm);
> -	}
> -
>  	job = job_alloc(xe_exec_queue_is_parallel(q) || is_migration);
>  	if (!job)
>  		return ERR_PTR(-ENOMEM);
> @@ -111,43 +118,25 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
>  	if (err)
>  		goto err_free;
>  
> -	if (!xe_exec_queue_is_parallel(q)) {
> -		job->fence = xe_lrc_create_seqno_fence(q->lrc);
> -		if (IS_ERR(job->fence)) {
> -			err = PTR_ERR(job->fence);
> -			goto err_sched_job;
> -		}
> -		job->lrc_seqno = job->fence->seqno;
> -	} else {
> -		struct dma_fence_array *cf;
> +	for (i = 0; i < q->width; ++i) {
> +		struct dma_fence *fence = xe_lrc_alloc_seqno_fence();
> +		struct dma_fence_chain *chain;
>  
> -		fences = kmalloc_array(q->width, sizeof(*fences), GFP_KERNEL);
> -		if (!fences) {
> -			err = -ENOMEM;
> +		if (IS_ERR(fence)) {
> +			err = PTR_ERR(fence);
>  			goto err_sched_job;
>  		}
> +		job->ptrs[i].lrc_fence = fence;
>  
> -		for (j = 0; j < q->width; ++j) {
> -			fences[j] = xe_lrc_create_seqno_fence(q->lrc + j);
> -			if (IS_ERR(fences[j])) {
> -				err = PTR_ERR(fences[j]);
> -				goto err_fences;
> -			}
> -			if (!j)
> -				job->lrc_seqno = fences[0]->seqno;
> -		}
> +		if (i + 1 == q->width)
> +			continue;
>  
> -		cf = dma_fence_array_create(q->width, fences,
> -					    q->parallel.composite_fence_ctx,
> -					    q->parallel.composite_fence_seqno++,
> -					    false);
> -		if (!cf) {
> -			--q->parallel.composite_fence_seqno;
> +		chain = dma_fence_chain_alloc();
> +		if (!chain) {
>  			err = -ENOMEM;
> -			goto err_fences;
> +			goto err_sched_job;
>  		}
> -
> -		job->fence = &cf->base;
> +		job->ptrs[i].chain_fence = chain;
>  	}
>  
>  	width = q->width;
> @@ -155,19 +144,14 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
>  		width = 2;
>  
>  	for (i = 0; i < width; ++i)
> -		job->batch_addr[i] = batch_addr[i];
> +		job->ptrs[i].batch_addr = batch_addr[i];
>  
>  	xe_pm_runtime_get_noresume(job_to_xe(job));
>  	trace_xe_sched_job_create(job);
>  	return job;
>  
> -err_fences:
> -	for (j = j - 1; j >= 0; --j) {
> -		--q->lrc[j].fence_ctx.next_seqno;
> -		dma_fence_put(fences[j]);
> -	}
> -	kfree(fences);
>  err_sched_job:
> +	xe_sched_job_free_fences(job);
>  	drm_sched_job_cleanup(&job->drm);
>  err_free:
>  	xe_exec_queue_put(q);
> @@ -188,6 +172,7 @@ void xe_sched_job_destroy(struct kref *ref)
>  		container_of(ref, struct xe_sched_job, refcount);
>  	struct xe_device *xe = job_to_xe(job);
>  
> +	xe_sched_job_free_fences(job);
>  	xe_exec_queue_put(job->q);
>  	dma_fence_put(job->fence);
>  	drm_sched_job_cleanup(&job->drm);
> @@ -195,27 +180,32 @@ void xe_sched_job_destroy(struct kref *ref)
>  	xe_pm_runtime_put(xe);
>  }
>  
> -void xe_sched_job_set_error(struct xe_sched_job *job, int error)
> +/* Set the error status under the fence to avoid racing with signaling */
> +static bool xe_fence_set_error(struct dma_fence *fence, int error)
>  {
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags))
> -		return;
> +	unsigned long irq_flags;
> +	bool signaled;
>  
> -	dma_fence_set_error(job->fence, error);
> +	spin_lock_irqsave(fence->lock, irq_flags);
> +	signaled = test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
> +	if (!signaled)
> +		dma_fence_set_error(fence, error);
> +	spin_unlock_irqrestore(fence->lock, irq_flags);
> +
> +	return signaled;
> +}
>  
> -	if (dma_fence_is_array(job->fence)) {
> -		struct dma_fence_array *array =
> -			to_dma_fence_array(job->fence);
> -		struct dma_fence **child = array->fences;
> -		unsigned int nchild = array->num_fences;
> +void xe_sched_job_set_error(struct xe_sched_job *job, int error)
> +{
> +	if (xe_fence_set_error(job->fence, error))
> +		return;
>  
> -		do {
> -			struct dma_fence *current_fence = *child++;
> +	if (dma_fence_is_chain(job->fence)) {
> +		struct dma_fence *iter;
>  
> -			if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> -				     &current_fence->flags))
> -				continue;
> -			dma_fence_set_error(current_fence, error);
> -		} while (--nchild);
> +		dma_fence_chain_for_each(iter, job->fence)
> +			xe_fence_set_error(dma_fence_chain_contained(iter),
> +					   error);
>  	}
>  
>  	trace_xe_sched_job_set_error(job);
> @@ -230,7 +220,7 @@ bool xe_sched_job_started(struct xe_sched_job *job)
>  
>  	return !__dma_fence_is_later(xe_sched_job_lrc_seqno(job),
>  				     xe_lrc_start_seqno(lrc),
> -				     dma_fence_array_first(job->fence)->ops);
> +				     dma_fence_chain_contained(job->fence)->ops);
>  }
>  
>  bool xe_sched_job_completed(struct xe_sched_job *job)
> @@ -244,13 +234,24 @@ bool xe_sched_job_completed(struct xe_sched_job *job)
>  
>  	return !__dma_fence_is_later(xe_sched_job_lrc_seqno(job),
>  				     xe_lrc_seqno(lrc),
> -				     dma_fence_array_first(job->fence)->ops);
> +				     dma_fence_chain_contained(job->fence)->ops);
>  }
>  
>  void xe_sched_job_arm(struct xe_sched_job *job)
>  {
>  	struct xe_exec_queue *q = job->q;
> +	struct dma_fence *fence, *prev;
>  	struct xe_vm *vm = q->vm;
> +	u64 seqno = 0;
> +	int i;
> +
> +	/* Migration and kernel engines have their own locking */
> +	if (IS_ENABLED(CONFIG_LOCKDEP) &&
> +	    !(q->flags & (EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_VM))) {
> +		lockdep_assert_held(&q->vm->lock);
> +		if (!xe_vm_in_lr_mode(q->vm))
> +			xe_vm_assert_held(q->vm);
> +	}
>  
>  	if (vm && !xe_sched_job_is_migration(q) && !xe_vm_in_lr_mode(vm) &&
>  	    (vm->batch_invalidate_tlb || vm->tlb_flush_seqno != q->tlb_flush_seqno)) {
> @@ -259,6 +260,25 @@ void xe_sched_job_arm(struct xe_sched_job *job)
>  		job->ring_ops_flush_tlb = true;
>  	}
>  
> +	/* Arm the pre-allocated fences */
> +	for (i = 0; i < q->width; prev = fence, ++i) {
> +		struct dma_fence_chain *chain;
> +
> +		fence = job->ptrs[i].lrc_fence;
> +		xe_lrc_init_seqno_fence(&q->lrc[i], fence);
> +		job->ptrs[i].lrc_fence = NULL;
> +		if (!i) {
> +			job->lrc_seqno = fence->seqno;

same question of the first patch remains here...

> +			continue;

but here my doubt goes a bit beyond on why you only init
the chain the non-first one.

> +		}
> +
> +		chain = job->ptrs[i - 1].chain_fence;
> +		dma_fence_chain_init(chain, prev, fence, seqno++);
> +		job->ptrs[i - 1].chain_fence = NULL;
> +		fence = &chain->base;
> +	}
> +
> +	job->fence = fence;
>  	drm_sched_job_arm(&job->drm);
>  }
>  
> @@ -318,7 +338,8 @@ xe_sched_job_snapshot_capture(struct xe_sched_job *job)
>  
>  	snapshot->batch_addr_len = q->width;
>  	for (i = 0; i < q->width; i++)
> -		snapshot->batch_addr[i] = xe_device_uncanonicalize_addr(xe, job->batch_addr[i]);
> +		snapshot->batch_addr[i] =
> +			xe_device_uncanonicalize_addr(xe, job->ptrs[i].batch_addr);
>  
>  	return snapshot;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
> index 990ddac55ed6..0d3f76fb05ce 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> @@ -11,6 +11,20 @@
>  #include <drm/gpu_scheduler.h>
>  
>  struct xe_exec_queue;
> +struct dma_fence;
> +struct dma_fence_chain;
> +
> +/**
> + * struct xe_job_ptrs - Per hw engine instance data
> + */
> +struct xe_job_ptrs {
> +	/** @lrc_fence: Pre-allocated uinitialized lrc fence.*/
> +	struct dma_fence *lrc_fence;
> +	/** @chain_fence: Pre-allocated ninitialized fence chain node. */
> +	struct dma_fence_chain *chain_fence;
> +	/** @batch_addr: Batch buffer address. */
> +	u64 batch_addr;
> +};
>  
>  /**
>   * struct xe_sched_job - XE schedule job (batch buffer tracking)
> @@ -43,8 +57,8 @@ struct xe_sched_job {
>  	u32 migrate_flush_flags;
>  	/** @ring_ops_flush_tlb: The ring ops need to flush TLB before payload. */
>  	bool ring_ops_flush_tlb;
> -	/** @batch_addr: batch buffer address of job */
> -	u64 batch_addr[];
> +	/** @ptrs: per instance pointers. */
> +	struct xe_job_ptrs ptrs[];

instance and ptrs sounds so generic here...
I'm bad with names as well... but I'm wondering if it wouldn't be better
to s/xe_sched_job *job/xe_sched_jobs *jobs/
and then this one here is 'a' job: struct xe_job job[];

Another bad option xe_batches_and_fences batches_and_fences[]; :/

>  };
>  
>  struct xe_sched_job_snapshot {
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index 6c6cecc58f63..450f407c66e8 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -272,7 +272,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
>  			   __entry->flags = job->q->flags;
>  			   __entry->error = job->fence->error;
>  			   __entry->fence = job->fence;
> -			   __entry->batch_addr = (u64)job->batch_addr[0];
> +			   __entry->batch_addr = (u64)job->ptrs[0].batch_addr;
>  			   ),
>  
>  		    TP_printk("fence=%p, seqno=%u, lrc_seqno=%u, guc_id=%d, batch_addr=0x%012llx, guc_state=0x%x, flags=0x%x, error=%d",
> -- 
> 2.44.0
> 
