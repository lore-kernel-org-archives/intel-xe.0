Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5CACCF9E4
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 15:35:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D232610EA3C;
	Wed, 25 Sep 2024 15:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xmu+7SzV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4AF10EA3C
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Sep 2024 15:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727278513; x=1758814513;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=u9KiBL/CaLZJOTGbt9PJdGtUcYsGIXyAIJ8tH0Bvens=;
 b=Xmu+7SzVUr0wzJuhTFrpOVxtzSAsq0snIcNrNUbosKLHWZTNp7SKdlYt
 /1nFwoqKrsDzQvDY3LoxIWLkZ7vGiR4c0DOQNdL4ag2y2cbBGNJG6H65E
 nZLB4UGDIBrOMgXc2wxeuVR7NC+vczwC5lUFj/EVSj0ydS0959zBfTJpr
 fuldv4hPt14QkE9DOxX2wf0rgWtACSgkMvh3J1Qs4vGCIgbv5J+6fceC2
 A9zfaHQA/QhDdiFw4yeNbpegnrkz5rZMsZu9HLPEwY5oLd1MuWLc9GHW9
 Ahlr7b6V+9jocnoHdAaRNAOLWX2BXfhp5AY2nkPrGIOeBXDRimqMfpIYG Q==;
X-CSE-ConnectionGUID: gbyyaNAfTDy9PG1wBUVTRg==
X-CSE-MsgGUID: yFlUR0y8T/+GtyfewnasZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26487218"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="26487218"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 08:35:12 -0700
X-CSE-ConnectionGUID: cTmS7WmxS2us9K8nod8WNA==
X-CSE-MsgGUID: Lqm/aWNaRJ2qm2Fbe94xFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="71895133"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2024 08:35:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Sep 2024 08:35:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Sep 2024 08:35:11 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 25 Sep 2024 08:35:11 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 25 Sep 2024 08:35:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pXtsV0KYwQQZMLeIgEZw6mhkOL0VaT5qQ27oKIa/s3UsxhvGtX5/8WT9+FVHINhLoIm/rlo97I45lgiOe2/rYaTqp86YhnGPMc/nne2S2Wf/0LoYSrcENBc4VHv216aU2lTjIijktdHWuaVppup8jjG/dKOMLRLNxlPj5IVCrgsKB6/8xlS+HALpdoZkcILLWEqs+FXqFAfYtU8ia7jBgcGmOFtsd5RjzWF6xUZ6bdsR9HTmrIRjr/9BxHsrDPaZSAfz8aGC4eW3tRVKDUu/qiXzU2ToB+WNm/rqvKOYMzS3Uurs0jiBpk1Hr/tAz672lXOmbUUAwzoztjkZMGdlAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/aM6Nklm/uOcQ6DsSEmwkK3uIVMFt3xXX5Yne2Uy0O0=;
 b=kHdWzvoEANywoMNQVHyL4pTSF6op9Ep2L/yYp8DWfiYH+7mQt1n+5GO969xIkABQGLAinTyGf/0u/Vo5puDPpedZwwiF/zCjpL11ANpjRHtizT8zKZ/RPZqTWSgP8kwC/+wmPMVrWms/pod8++uHtAYjDE46+pgj1HvohAp4s/8jor28EkGMxhmjfKy5BnhghKeviIHm4G4L9IzO26jnKN71K/RGsxobo12/EKRQ6Yyosfp6H+rnJt15sWAaRvpA5C9ao0AtQlV+GVDOKt8KqYprwMhDwdJrkEoEHM8YO9GkTrPrSDbysvxfLn0z98WZKTfqVHhBo9tUUpSgKhM+rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8446.namprd11.prod.outlook.com (2603:10b6:806:3a7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Wed, 25 Sep
 2024 15:35:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 15:35:03 +0000
Date: Wed, 25 Sep 2024 15:32:59 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe: Take ref to job and job's fence in
 xe_sched_job_arm
Message-ID: <ZvQtK78Jo+OxtTpy@DUT025-TGLU.fm.intel.com>
References: <20240924184541.2992459-1-matthew.brost@intel.com>
 <0a1bbe76-c0ba-4d6e-aae7-0ff723bc334f@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0a1bbe76-c0ba-4d6e-aae7-0ff723bc334f@intel.com>
X-ClientProxiedBy: BYAPR04CA0012.namprd04.prod.outlook.com
 (2603:10b6:a03:40::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8446:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d2220c5-2b23-4769-3d9d-08dcdd77a027
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VetIJ+6Xhfaf7y9gttH93ZSKL3UkZPdYrMLPYfkTxJqoSZWuvmpKinq4yWyq?=
 =?us-ascii?Q?YG+nU/zutb0BNybSSnsFM9drSuxhux+PEycHyaA3P6yE9+v1NBNe4y3+eCus?=
 =?us-ascii?Q?29qNfrQi/KKXPMccimp+fFjRMmuaE3Q7f+wx7L7KX5nfoIjbOrAwwzMUyDWd?=
 =?us-ascii?Q?U+fyZI6wq8xGwg/0jKRoawEAh/Rq+oEcziwXbn+8cDiOxLxncsklOrvO/8o8?=
 =?us-ascii?Q?XZVsM0z8QJbzvSdx0vg0Q2KKngITL5Iva3hNFireMZNSm1k0GW0G7Gs6WMJX?=
 =?us-ascii?Q?mJCr9k6PrGUJfFnDMcO8z2Y3G3980XpfSYGRMnhabnIoFZhw0vmjrHUumZT/?=
 =?us-ascii?Q?7Fsx6ZMIlZ4iF0TvwHSD/80x/tdhiqGjLzI268pWUIHLYOIl4RAnQR2W5rhw?=
 =?us-ascii?Q?aPIQCR+/ItonsixscK2VJU5Rhv2q/2ALZbTBJWbYlZZ4eV6pisnUogVKr42R?=
 =?us-ascii?Q?+AYM26vq5MptIPkP61njJih2PxeZ+Lych+d9kjaLdcm61UvLWq1OIm6nV4vN?=
 =?us-ascii?Q?OZsaKkCG9tQKlksu+fVs2zRTeSsP0pK/yWF7Bb5/CWWb6NDm3UoE3KeqwqSf?=
 =?us-ascii?Q?ynP4ef0e+pZfpkQWh2fkEQ+mvuc5L4aBNs4Z+Li7EcG0Wc0K5zwYnH2cYKkx?=
 =?us-ascii?Q?931R0cX9OaHpl9VT3ZlSayXD6fKPJo7DUq19GsMKSXOKZl1dBZOVzbKzGfWh?=
 =?us-ascii?Q?Rl+Lp0kOTBCn2Rb4V2TZgtiNPvOWCtdCjrp1vlR5qbgrDP2w7HmAG4ja6f9p?=
 =?us-ascii?Q?wletvKjdCsy0u0Ps1MPhKi2UZDAbY7xJKocilG1zMq+Suzuv8pl7EyT4/AT1?=
 =?us-ascii?Q?f14LhO8LDPDdd03pxFk1Y2Uy2sUjKXrc+sipTXknjrO6RjpC7ubWxbaYSoAO?=
 =?us-ascii?Q?zJEFr2mHJh1RvLO0/YBcPXZ2w5w1JRP5VaLc7YUyAyyDGVg6ik1j6myQ4JyP?=
 =?us-ascii?Q?BvY3Qx2IK33t/0GWiND3LrBKgdMDcHOW8zXT9kO6VvWBt0b7daKSDjtx2Dnz?=
 =?us-ascii?Q?3XdMZmwqYo3l7XC4PashhRX3SIfjh8DI7BCcu7R2/kpFizuIpc2esw/INRtm?=
 =?us-ascii?Q?rBS+NIPQw63dFR/QM/KZoirkUsvvN7nIKgF62eCQQnCniPcvfYr2ciJK9cj5?=
 =?us-ascii?Q?KyzK+u7gkB6x24qOft1YA+T9RW5tXKiz3M8DUuvapQ20TaP4utO2r5DMPPwN?=
 =?us-ascii?Q?JaoQ2w91d21lbHCzpdA51431NuwlozW8XrukZv7/ZC4QqlyO3ZJ7UXdzMAXQ?=
 =?us-ascii?Q?KTlAUQZ+NFM/NJHRy8YZeSppgQ0pqusnMv201aXYjjFlHQu19CU9bAadmZPY?=
 =?us-ascii?Q?lyQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gAq9MDfptzNgsAAYZ9VtBAa8gospBfc03foxdS8eW8FObpXLZ+axqf5LXCdw?=
 =?us-ascii?Q?wiZnJFia0fPnmp7W3XiYEYq6KjxXMqZ+m8e7PlkNozjaw9NgNe+7SdtuGkzs?=
 =?us-ascii?Q?vJ8mA9Q/nlOu83KjKldJzqbx5bLPh2LcZprAkc5Q0JfN7LMV6o0W7O6x/ua3?=
 =?us-ascii?Q?bH1OKNf4EnTKLv/hCG/o6gETJ9LE8KFITCvvUqGTWY9hf9vxQpao5vo/DrMJ?=
 =?us-ascii?Q?Qnde7W1GQ3zhZoDKpZzGSYvaxqpaYty+7e25lloviuLuA9QwOpdELxufUAHB?=
 =?us-ascii?Q?o5Ho1cuC4FM0S5IPGaCaL6V61HQC0/JcVZAY9ubmEF6x7MCWnaRXFvzF6tL8?=
 =?us-ascii?Q?gxxHHqyYDRHTYroleRjKUWw+xIeou+rmPwrPmGlh3HGJxeJaMzqm1QArq1M2?=
 =?us-ascii?Q?0WcQUN/A6tkGOv9HmK792U06OBKX1woYmJjiivN1hkV492i5xtMCe6DkdgcE?=
 =?us-ascii?Q?bthPJqLtiqasicToWLymK+jGVCdxXiotcIfw2GGycBGY8guH8VkITaycUbT6?=
 =?us-ascii?Q?I0UQxF/8Tn5IlVWvhFl6XaLAwqyCxh3XKtyVfYPC/HB7hLjfS5BacJoy9uNI?=
 =?us-ascii?Q?y8xMVbnfMLl9czHd5D5TYux/OZZxhQO7eO09ylZLcqr2sCZLBlfCIZght/w1?=
 =?us-ascii?Q?OLxyiGRGeZso2gYtxLOm57lK68QnbiJCxuetgqAPSH5EZP7hni7/eBmqseKw?=
 =?us-ascii?Q?fNbSWD+7gq5M8KtmRfXcOUByPNzcfQZ3wabGO9+jM3zc5kYIto2Oo75mAF6S?=
 =?us-ascii?Q?W8jkzISswtn+U0vmCy0I4m2QbcUd5mBNd2TaJzyFs7A4Im9xGu4uVIOdGjYo?=
 =?us-ascii?Q?agaJ5EsDAJkxRWWZq3nvAnPE8zzJLfnlQPvhq6PIiJFwraaQk4doQN5FQZQz?=
 =?us-ascii?Q?oDWnkUyK76/J2Xqq/sSOtL47lAcE0KVobLZA23rc/q73ER+8ATEuy9sqk78i?=
 =?us-ascii?Q?v7EzKY91HO6mc7TmXNZdSz4jHjmxkSrDT3Y8zRN6srod73m0LCbLAi83p7gD?=
 =?us-ascii?Q?Md5NuVaJ6bVW2BIo/t9abFs9la1af/VFZ2AHacdfMKXhp0dXhSzID9Dq+8yr?=
 =?us-ascii?Q?6XmEQtMlBWcthEbJouXURxnHDVXqBp49U666XsvqPBf53edpwhwP86VlhnlM?=
 =?us-ascii?Q?41YTTFz+oV6QSSnmAvJOh89rQpM+OcRGF7UQF0mAKASkuL7wBvza/fnbOvCe?=
 =?us-ascii?Q?0fqxbtDaM9769F48CFuxA5ddlrkyN3TlTV5/AO06/EJNJzOxXEz+GPztao9C?=
 =?us-ascii?Q?KkD+uDyD2P0E22zRsjX0s5ueMXRe+81WrYs85H2q3xdnDSBWRbjhgsnYjcN5?=
 =?us-ascii?Q?C+yn1abzrGSfQ4aU6qh+qY5HTS79hY9Rh4Wv4VI/BOyVcoVHTSfj4hAC65wZ?=
 =?us-ascii?Q?HFwtW++yqJqyM/mSRGa+67yz0VkSBqDL4b7k0P+K9QKY9Cj5GC3NHiwHyADM?=
 =?us-ascii?Q?sXNbk5K2BCdyeKh7wz0jgv2Q1bvhBAaidMJPp6l0CWCqxMIGH8JeKiELWGnP?=
 =?us-ascii?Q?qPdYJWSBHWkfV/FECuENo9BwMIaObAX40qgO9NfDPrV7AXua4K4PoPL1aBG0?=
 =?us-ascii?Q?rkEVQJiVyIYii5bez6KINB1IqXyUM0d0Mg5MEejGkS3sko5WdQ4ELzNF36oK?=
 =?us-ascii?Q?0Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d2220c5-2b23-4769-3d9d-08dcdd77a027
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 15:35:03.8610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Q4K1dkYFbwgBPcARiW2C4M6apekpoQTQUXw4pXnLxyQvFqpZk1GHpWdLH34GrjeXSnGtxRRFH0wuptT+YUuoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8446
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

On Wed, Sep 25, 2024 at 03:29:20PM +0100, Matthew Auld wrote:
> On 24/09/2024 19:45, Matthew Brost wrote:
> > Fixes two possible races:
> > 
> > - Submission to hardware signals job's fence before dma_fence_get at end
> >    of run_job
> > - TDR fires and signals fence + free job before run_job completes
> > 
> > Taking refs in xe_sched_job_arm to job and job's fence solves these by
> > ensure all refs collected before entering the DRM scheduler. The refs
> > are dropped in run_job and DRM scheduler respectfully. Safe as once
> > xe_sched_job_arm is called execution of job through DRM sched is
> > guaranteed.
> > 
> > v2:
> >   - Take job ref on resubmit (Matt Auld)
> > 
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2811
> 
> Maybe also:
> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2843
> 
> ?

Yes, look like same issue.

> 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: <stable@vger.kernel.org> # v6.8+
> > ---
> >   drivers/gpu/drm/xe/xe_execlist.c        |  4 +++-
> >   drivers/gpu/drm/xe/xe_gpu_scheduler.c   | 17 +++++++++++++++++
> >   drivers/gpu/drm/xe/xe_gpu_scheduler.h   |  6 +-----
> >   drivers/gpu/drm/xe/xe_guc_submit.c      | 11 +++++++----
> >   drivers/gpu/drm/xe/xe_sched_job.c       |  5 ++---
> >   drivers/gpu/drm/xe/xe_sched_job_types.h |  1 -
> >   6 files changed, 30 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> > index f3b71fe7a96d..b70706c9caf2 100644
> > --- a/drivers/gpu/drm/xe/xe_execlist.c
> > +++ b/drivers/gpu/drm/xe/xe_execlist.c
> > @@ -309,11 +309,13 @@ execlist_run_job(struct drm_sched_job *drm_job)
> >   	struct xe_sched_job *job = to_xe_sched_job(drm_job);
> >   	struct xe_exec_queue *q = job->q;
> >   	struct xe_execlist_exec_queue *exl = job->q->execlist;
> > +	struct dma_fence *fence = job->fence;
> >   	q->ring_ops->emit_job(job);
> >   	xe_execlist_make_active(exl);
> > +	xe_sched_job_put(job);
> > -	return dma_fence_get(job->fence);
> > +	return fence;
> >   }
> >   static void execlist_job_free(struct drm_sched_job *drm_job)
> > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > index c518d1d16d82..7ea0c8e9e7a9 100644
> > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > @@ -4,6 +4,7 @@
> >    */
> >   #include "xe_gpu_scheduler.h"
> > +#include "xe_sched_job.h"
> >   static void xe_sched_process_msg_queue(struct xe_gpu_scheduler *sched)
> >   {
> > @@ -106,3 +107,19 @@ void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
> >   	list_add_tail(&msg->link, &sched->msgs);
> >   	xe_sched_process_msg_queue(sched);
> >   }
> > +
> > +/**
> > + * xe_sched_resubmit_jobs() - Resubmit scheduler jobs
> > + * @sched: Xe GPU scheduler
> > + *
> > + * Take a ref all jobs on scheduler and resubmit.
> > + */
> > +void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
> > +{
> > +	struct drm_sched_job *s_job;
> > +
> > +	list_for_each_entry(s_job, &sched->base.pending_list, list)
> > +		xe_sched_job_get(to_xe_sched_job(s_job));	/* Paired with put in run_job */
> > +
> > +	drm_sched_resubmit_jobs(&sched->base);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > index cee9c6809fc0..ecbe5dd6664e 100644
> > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > @@ -26,6 +26,7 @@ void xe_sched_add_msg(struct xe_gpu_scheduler *sched,
> >   		      struct xe_sched_msg *msg);
> >   void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
> >   			     struct xe_sched_msg *msg);
> > +void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched);
> >   static inline void xe_sched_msg_lock(struct xe_gpu_scheduler *sched)
> >   {
> > @@ -47,11 +48,6 @@ static inline void xe_sched_tdr_queue_imm(struct xe_gpu_scheduler *sched)
> >   	drm_sched_tdr_queue_imm(&sched->base);
> >   }
> > -static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
> > -{
> > -	drm_sched_resubmit_jobs(&sched->base);
> > -}
> > -
> >   static inline bool
> >   xe_sched_invalidate_job(struct xe_sched_job *job, int threshold)
> >   {
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index fbbe6a487bbb..689279fdef80 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -766,6 +766,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
> >   	struct xe_guc *guc = exec_queue_to_guc(q);
> >   	struct xe_device *xe = guc_to_xe(guc);
> >   	bool lr = xe_exec_queue_is_lr(q);
> > +	struct dma_fence *fence = NULL;
> >   	xe_assert(xe, !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
> >   		  exec_queue_banned(q) || exec_queue_suspended(q));
> > @@ -782,12 +783,14 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
> >   	if (lr) {
> >   		xe_sched_job_set_error(job, -EOPNOTSUPP);
> > -		return NULL;
> > -	} else if (test_and_set_bit(JOB_FLAG_SUBMIT, &job->fence->flags)) {
> > -		return job->fence;
> > +		dma_fence_put(job->fence);	/* Drop ref from xe_sched_job_arm */
> >   	} else {
> > -		return dma_fence_get(job->fence);
> > +		fence = job->fence;
> >   	}
> > +
> > +	xe_sched_job_put(job);	/* Pairs with get from xe_sched_job_arm */
> 
> Only doubt is job being destroyed here. I think you were saying that
> guc_exec_queue_free_job(drm_job) can potentially happen before run_job()
> completes. But if that's the case can't the refcount reach zero here, and
> then caller of run_job() goes down in flames, since the drm_job is no longer
> a valid pointer, assuming the put() here frees the memory for it?
>

Free job just puts the job (creation ref) so we still have reference
from xe_sched_job_arm here. This put could potentially free the job's
memory but it safe at this point in time as only the job's fence is
needed after this. The job's fence is decoupled from the job and ref
counted too.

Matt

> > +
> > +	return fence;
> >   }
> >   static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> > index eeccc1c318ae..d0f4b908411f 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job.c
> > +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> > @@ -280,16 +280,15 @@ void xe_sched_job_arm(struct xe_sched_job *job)
> >   		fence = &chain->base;
> >   	}
> > -	job->fence = fence;
> > +	xe_sched_job_get(job);			/* Pairs with put in run_job */
> > +	job->fence = dma_fence_get(fence);	/* Pairs with put in scheduler */
> >   	drm_sched_job_arm(&job->drm);
> >   }
> >   void xe_sched_job_push(struct xe_sched_job *job)
> >   {
> > -	xe_sched_job_get(job);
> >   	trace_xe_sched_job_exec(job);
> >   	drm_sched_entity_push_job(&job->drm);
> > -	xe_sched_job_put(job);
> >   }
> >   /**
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
> > index 0d3f76fb05ce..8ed95e1a378f 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> > @@ -40,7 +40,6 @@ struct xe_sched_job {
> >   	 * @fence: dma fence to indicate completion. 1 way relationship - job
> >   	 * can safely reference fence, fence cannot safely reference job.
> >   	 */
> > -#define JOB_FLAG_SUBMIT		DMA_FENCE_FLAG_USER_BITS
> >   	struct dma_fence *fence;
> >   	/** @user_fence: write back value when BB is complete */
> >   	struct {
