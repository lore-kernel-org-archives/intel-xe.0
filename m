Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A4EC52D6F
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 15:24:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 775AE10E24D;
	Wed, 21 Aug 2024 15:24:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mH1t5TY2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9591910E24D
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Aug 2024 15:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724253879; x=1755789879;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iN92lWc1NUN0P6/G62VphvVbz5AxYI+5gk+b7ivohQ4=;
 b=mH1t5TY2oJF6s09rg4qf9A5JGTRtOT81ZpiSzRGzMkRsTtbrvwyUGawj
 T0k5X+DfQI29aywM+Gm3sjgzNGW4zjqYuD1rBcHoKTcEY3BCAs9fDoPnL
 Hg7w+qxlAwptFKDmRhaTTap3nFKhNsPES2big6aRgmTlGXFoXU0zuyfpM
 TSog6TMbvSTsS1er9fbo8gfzmUM1nXCnEybLyeO3fpq6mLwrXfXVH0dO4
 oJp4AzNF49jy+0kLvtBOnIMgnTwyTbU+nFA5Eu/OasaADzeNXwrQGZSxa
 R3drQ6Nu+/zdBA0AAKoEKMwReTnr/UdVZ9RAq7EjjxNdRV9vA8Eto8igM w==;
X-CSE-ConnectionGUID: E1Ti0wGPRZul8EUre6KoKg==
X-CSE-MsgGUID: Idpg4iAuSsKNtCi9xGJk/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22806225"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="22806225"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 08:24:39 -0700
X-CSE-ConnectionGUID: FS38te8KTDquP8hUqa37YQ==
X-CSE-MsgGUID: EeaLgkV6Si2oeEj/1I2YNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="65330285"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Aug 2024 08:24:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 08:24:38 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 08:24:38 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 08:24:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJg+0FFvkeJTL1Bf/b0t1BQwddQPW2KqKXd54OaPmjdcSf2JqIvEtNI718kwP0D159E31MCVaQsjajKm1crPgj4JWvODvd6cBP36gMNTv4DrkSkA8pZlH8uPNNxecH7/1kjQ4LDl+dXMYJ0d6mjYYHsSBAUxrJNSWRDVdU6Emacwwz/7bnb/RB5fgbG6S85+JaErxjgKZ6dGfOmRcN1eXPSgb6Adl4PuOsAGhYgqBbOYj5ejHeItzaECLpo73FT/4dbX6P+uxiNl5hEnFrVYgwIcmEqY3OmhVPxLWyFXL7UjDWyC5pkl2KcBxsY7s67RBIJaC2RbFioTmq47FYw2+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjDn4hNTGvpDcSgfbvE8jawlltlAJR0ReNfzggAQcJ4=;
 b=qa4djOhkRxfSmZ0gmUUYTZb5SxC2vMwsYs/P0Y7i+HehghuohYCSBNbmaOZOh6jBO4fowt39AaL8AO1IYKrWgBagx6zeQHSg2mI2khPkbdbaFMvqSf/mlLzD/aHCJJrScNvQzy99Xo+cbikO6tRGKll75XY5fs5bVVz37qrFX40Ld3jbqh0DQ/eP9Ez1f3zfDWSyJlns/U2Uu+a5BjfP3gYCVa3w+vW+uEN3KqTl60QGuYhYNVhAL/idz3FnjilAZc7R+YxDQ9rtQypQ3SFkRyR15svotjxpIWYuLJ4tvERrJZA0wo0ROsUbtRmbmNNgRMYgmQ9BUk60sgEhg9NzAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8206.namprd11.prod.outlook.com (2603:10b6:8:166::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Wed, 21 Aug
 2024 15:24:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Wed, 21 Aug 2024
 15:24:34 +0000
Date: Wed, 21 Aug 2024 15:23:30 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Free job before xe_exec_queue_put
Message-ID: <ZsYGch0IF0JYpKT2@DUT025-TGLU.fm.intel.com>
References: <20240820202309.1260755-1-matthew.brost@intel.com>
 <2279a661-6dab-44e6-beac-55ab47e1e5c4@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2279a661-6dab-44e6-beac-55ab47e1e5c4@intel.com>
X-ClientProxiedBy: BY5PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: 70209681-b347-4401-432b-08dcc1f55c89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HRuQgwncwzetT8BuY/d1U9F6oleHKzKRdmLzLhKANvSsuTKaWOq0fp4SZUsM?=
 =?us-ascii?Q?Bs97BCGjSOACweT2p3zPuhL5GUJY6HCwdUmlxnjx4QCo4RPeuR6kxD2YGree?=
 =?us-ascii?Q?te0ZCkbarIwRxBnJqVNGdi5Saf76eUN4vY/R4T+Gbunm3TdhhV6cZFL3vFr5?=
 =?us-ascii?Q?TctNz5o/VUf4mTfkZo7fbcfFHDaQLBWgaHxkbkcCZyVFVXcn/vf+3eMlzrm6?=
 =?us-ascii?Q?tMhooz/x61rVeJYZyz4M8LiG4mlPf2YcHEU0OK5PoLpXR71AOUHt1aUHcidT?=
 =?us-ascii?Q?+W3Sy3Ie7tlAZomh8T6m1swyBRyP0ORv8fwGEKTNF0aSHVNayfOSIGBATERE?=
 =?us-ascii?Q?oQG6mnq5N/6fdqDw4UnWWY+CBwt2wieFTrckDXn5MRv6DQVSPeJCQI0jkSDQ?=
 =?us-ascii?Q?IGxqIg3MbHsynjdqaEuhIIU2KGCrhMbFxLpkRPH4HJ3YJjA3vwlL0dsXyJFM?=
 =?us-ascii?Q?BVBgvf/lqJ94trgjdzMtOd0Q3PZvdEW2q7ONlIxKunyAg2JBL1OSYsEr4gM6?=
 =?us-ascii?Q?GMo95fSlmqUU2a5V+UmpxpJcL3JfM4nC/ueYx11Y6hDRX3x486A4thZb0kFv?=
 =?us-ascii?Q?KWip/zEuRqLj12zKvVANG+Q8Ov27ly6ErJ+p4ZZfNlMQEILBzivf/dtb0JoU?=
 =?us-ascii?Q?BylPGx7MfGkNPsbxaNDFzDdR05pDlS63wvwJFYTxmfF+6wKEtQlq/l0+OxNH?=
 =?us-ascii?Q?mY9L/hGr8ssVlqre8J0c+pvHYwuGQFLr61F9EaOflkknbNCnBp2DxgyS1f1g?=
 =?us-ascii?Q?v65s4EV0tufE29qzwK2YQjCUYqkQhJRt+OFA71K7oDYgN7puROTmWdKl7f/6?=
 =?us-ascii?Q?uzFCAgDvhD/iXAWvLrAZDj25gvGj7ie8xAnFq3fKnwAQW9UijI4EsI+Vzlc0?=
 =?us-ascii?Q?K0c1sxOAw7DLMBmPItOia5p8g1qRdk+vyDz0pz3w8v/IwrmcoeC7Wc5Axoui?=
 =?us-ascii?Q?Dz3lF2c/pE78g1C1HXDFzByoLdfdQhHk81rWjIDl34W8EAgajw+rfo1HA0Lg?=
 =?us-ascii?Q?jgGjdoWF/e+bFcNe9tmplAwq02hrE9OIZEA8Ju7P6dr2Lf6U9bF02JyMJt4/?=
 =?us-ascii?Q?dolKwzrxxe9alvHvAGZX2kQ2iM18IeYnW3rohrQJ68rMNzucAeZ+0YVOTVVR?=
 =?us-ascii?Q?EtACgwJT5q5qblhJ0DVUpTRu6zUGTvE2X3Bl3UUf7r2i+Jb0AfCWNQJ1P6AY?=
 =?us-ascii?Q?1ztlYcZMSOlPx7ZTw5fteKV8QNkKnA5qj+BEBouB1H7Vbg/jTa4bGGw0SLZB?=
 =?us-ascii?Q?XjbuURvlVMF3EmXTR07MRLv9EFNkN+YTQMR9rkjcE7095JR3lAMC5iTIp0O1?=
 =?us-ascii?Q?0m1ohiZGdjZpjpVjre/59Hrn3ysieTCaOJrIyiPqyBQqYA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w6PUR4dlXVFtfCPOcPDbjN2YumCcMbSyYXexO+NvcrFsB/2aF9jUznKX2Pnx?=
 =?us-ascii?Q?7xZk2qmT7g5k+HUUrMIp72ACVCw6jH7mcMQr0Vv+zJNY32IALZ1GeRTX2cch?=
 =?us-ascii?Q?m65iq9/1Q/wKTiS6pJCygsMPXOBdaGzPw8qAwVLFmuMgrMsxP5pa3JzQKa4K?=
 =?us-ascii?Q?Zf9MMnHokhF1QymXSXus8PffiJZ7paAyqHzNa6OkAwYcCY/rXamGRM/q0w90?=
 =?us-ascii?Q?oOMwKYdaEdjvYUNUTp73BvkV1NgP2okhMx502LrNI+UDDaNwnWfWMPUqPUgB?=
 =?us-ascii?Q?+ufdvYlrPHziee//1TT+m1eiPN9zVjkwJ5YdNPlMSUzPK8Tvnpr1h9DA1UkT?=
 =?us-ascii?Q?GM4AzXemXp8F9ToJbsYeS8YXZ1CAZAoKm3oT1ee7DYKWNqkx9gc4Dyx+tYJg?=
 =?us-ascii?Q?ZYj/PHfkYkbnMQyaWSRiEN5bElrlEyvleq4wY3DtOckSy/73P/8q9jyujHHt?=
 =?us-ascii?Q?ZNknog4uXmE/lf4bzePfcRkEenmMT8cZ/1/dVPNC/8AqDKcvVGImKLA+kTuY?=
 =?us-ascii?Q?peMnD308ADV/jxo6EkTs3t0j0Ra2EdrTLO9T+6XSvC70jUIlKgBrZutrxC/U?=
 =?us-ascii?Q?wL3VWpKZQJmtBBBPSEjvjhg7hqAwwKkOBFgH0yUnICI8y0NwpJvJbaFhqB+8?=
 =?us-ascii?Q?BK3TDiikKoKYyiQd3Y/GdGCvdHzYqJyjIMZYKC/366X3ftWn9msI81hcFPbg?=
 =?us-ascii?Q?nzCR1B0rikvePJwetcnRjZZTW0JWOaK/2jsKU9a4ZivYpm88eoFM8J9zMf/l?=
 =?us-ascii?Q?g+2W8rw5a7yzlsLmy/PcedZxIkbtKmBkLWfypFWp8Vsl4Gz3vkjguPsqBEnr?=
 =?us-ascii?Q?3SbM/byqHZSzYNhsvW78Hqn2D/dLLR9n/3q+VXnZTl/mdEVrorGZCbvaZemj?=
 =?us-ascii?Q?TwZhWQfwzVK5z2rsMbv1sNGDLdAj+HEF/v8fmAKcqtBa/usX4vF4DEpt4k7F?=
 =?us-ascii?Q?qrxgOjFtoDZAXS+ZgAztq80ukqH3c/yUmHQeO2213HfoXyB3+I5X04vnusCQ?=
 =?us-ascii?Q?M1P61EtVxtudsDMvauGafC5rBMwWyAfkGPsxEJyi2STiINdr17zeOCycAt3C?=
 =?us-ascii?Q?HrWIFbccaWJ+PWqUeFDUkdTgHroUSC6Qw8GzS5DbM0BhikOf1cESDL3CwSSF?=
 =?us-ascii?Q?yTncHfv3oWrPw8EoquVQr+9H1Y50iDOKv4rk5csFMhwjgqhhWXHOdnmDaKwX?=
 =?us-ascii?Q?XS434vc31Wg1Lw54KcP49Z72K/Reax1wie9/IV+4fhiJZ2GnjZQb/Nhkae/7?=
 =?us-ascii?Q?axHikCcIOvmByR/s3354+RdMKulnHhyiaFICOBo+1yQBFzAyXpGjZDljDY2G?=
 =?us-ascii?Q?DtFr5eL6uI9BNrIf6xooH/XBrpB3Aixy7StuHr6jaLSIriz1W3VpzvVp93X6?=
 =?us-ascii?Q?8IvvCpZexhXYfEvlj77Ja+vrrDumS0rIU6wFjO+GNuFU5ZyugYfl4S62pNGR?=
 =?us-ascii?Q?1sNJKb6ISSB9+ur89QppO29l7qa7ecxn3+NRHdyFVDTNvCXObpqb5orszg3N?=
 =?us-ascii?Q?rjce32tOADhI9RGUWZ569/xBKphB6mYtBNLVE8lzMkLe2NsiloglbAxJVY/T?=
 =?us-ascii?Q?hsTQVHCT2DihG1wBfTbm976QcXikpPwFrMd+T9tjoPid2wvpqf6bDE9EN/ao?=
 =?us-ascii?Q?pQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70209681-b347-4401-432b-08dcc1f55c89
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 15:24:34.4659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gBiGH6RwhK4wEBPSsfA7/JiHQViLByX5yX4S+takwb1wJrO6IfiL0yFK1i8ZyiXGpbIuJSpx58QmCUoVfZa3AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8206
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

On Wed, Aug 21, 2024 at 11:52:26AM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 21-08-2024 01:53, Matthew Brost wrote:
> > Free job depends on job->vm being valid, the last xe_exec_queue_put can
> > destroy the VM. Prevent UAF by freeing job before xe_exec_queue_put.
> 
> 
> Seems this order needs to be fixed also in error handling/cleanup of
> xe_sched_job_create.
> 

We should likely have an additional exec queue ref from the outer layers
when creating jobs but for uniformity agree that should be changed too.
Will post a follow up for that.

Matt 

> 
> > 
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_sched_job.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> > index 44d534e362cd..9628f9deb3c0 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job.c
> > +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> > @@ -171,12 +171,13 @@ void xe_sched_job_destroy(struct kref *ref)
> >   	struct xe_sched_job *job =
> >   		container_of(ref, struct xe_sched_job, refcount);
> >   	struct xe_device *xe = job_to_xe(job);
> > +	struct xe_exec_queue *q = job->q;
> >   	xe_sched_job_free_fences(job);
> > -	xe_exec_queue_put(job->q);
> >   	dma_fence_put(job->fence);
> >   	drm_sched_job_cleanup(&job->drm);
> >   	job_free(job);
> > +	xe_exec_queue_put(q);
> >   	xe_pm_runtime_put(xe);
> >   }
