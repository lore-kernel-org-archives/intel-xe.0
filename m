Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06520CCF9E7
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 16:25:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B738010E109;
	Wed, 25 Sep 2024 16:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PyJcl3jO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113CE10E109
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Sep 2024 16:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727281504; x=1758817504;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=reZoioOM1dAIzc1kUoHPdZx4m/kVlgXoY9VSL19X7Lo=;
 b=PyJcl3jOLkU+ReQGJNSRLQVJVdDqtQgIrWJkqc9X9B51Tg9DiolRm+oo
 W828z5Dym2bDEIDwTtMtdbY0WO4T1GzuB3oezwFl7yyHiQZPIafghA9mC
 j0Nl01CHxsicMMedanGZ1QIpId4TLBrRKOu1JN0THwc2peHWSAYPzsQzm
 YqpEOOAOHNNDjyr7XXiBtPvEq6nV/UB1PQYKsyAOX8gxbjIGd9SDxlesD
 Ttwd/22zTO1IRyngVErwaz1YKRgtF8x6XNeIhmxIGC/jhhWnyDIKbcKr9
 9jG0yZNEWZkYzC841MTEunhUohiJ3BQl1DsNa2mEkmPzpXkOoKENwQnb7 w==;
X-CSE-ConnectionGUID: u7O1o3pTRHKVD94a33sCqw==
X-CSE-MsgGUID: 3OcufD46TGWjmvVgLeJkfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="13967572"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="13967572"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 09:25:03 -0700
X-CSE-ConnectionGUID: 2tmojox9S2iVzFypNA2plQ==
X-CSE-MsgGUID: ZqAZugFuTeW/9aiL3QwZEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="71836623"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2024 09:25:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Sep 2024 09:25:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Sep 2024 09:25:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 25 Sep 2024 09:25:02 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 25 Sep 2024 09:25:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KX9IHlgG2dYj/ewIC+Y3E5HHswhb+1ICiqS7tZJmxc/gpY5E/zRotEOC3jdjysBr4OcUgnyhDG0LcPxbxZyrYShzcwgtabOy0GVKUlqek55cjA5CzFPZaRB2Weq9YlzDKK8i31u9JFL4rUicJslSBJN/hA3m93faeKdVumHCl14Zud/hBP3fIQZTeaVbAHIwPm2zeIWxCLxlb3Syi1o2VtyvJrtN4iwljJvw4a32CU5F7i15MQY3SzXMQXotX0fXkAxZJtK3JF2wDiMGcHqPaxxCQDDuwDcIy+joLMcTw6Q/vQmGOFUo6cqXD9shp9rcuYI+lcx5Xj+2z5VDaGRLNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mWB6By4r6cARkCpRcH3uOnK5YNyp1k/4Zt5DTOBAA9I=;
 b=pXDkXaeEZ/wmsue2vJEDk79AKloi2woxyCor9wqaye2vlRNhZQ1JsZXkFlJ5mEnYVchEKwFaB8k0ENXniNTsS1iaRu6JT0LvvZ01uQ4AUpCCVQg/QNtJEyacIRbIH75VdFqGithxFoiZNv+BfyQTeeIlATxWTO4z2OG01r2eUdcBL854tjm1pVNs3ITE9d38242cUfQZ1todx0nob0CcWy7lSFKqzUaPYvvjEcgTTOZqWDQYI60XEItJLZ4std0hX0opLOb+XyKZChmJk3/yj8J0l2q/M1QLxqAZzxz/loo2NsvB1CyicccZ0um6uDaFVDH/n5kl2vDzMpOOtGjTFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB5325.namprd11.prod.outlook.com (2603:10b6:5:390::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Wed, 25 Sep
 2024 16:24:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 16:24:58 +0000
Date: Wed, 25 Sep 2024 16:22:53 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe: Take ref to job and job's fence in
 xe_sched_job_arm
Message-ID: <ZvQ43VuU2v5ICGHI@DUT025-TGLU.fm.intel.com>
References: <20240924184541.2992459-1-matthew.brost@intel.com>
 <0a1bbe76-c0ba-4d6e-aae7-0ff723bc334f@intel.com>
 <ZvQtK78Jo+OxtTpy@DUT025-TGLU.fm.intel.com>
 <b669d5b6-2497-436e-a824-d5b000a92204@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b669d5b6-2497-436e-a824-d5b000a92204@intel.com>
X-ClientProxiedBy: BY3PR05CA0059.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB5325:EE_
X-MS-Office365-Filtering-Correlation-Id: 947bd6e8-14cf-4d7e-40fb-08dcdd7e9911
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g0DaYCUKdJvhUnScIOLwStJILrcXs3n+xViy3W/9MASr0cOJDazwyamu1RKf?=
 =?us-ascii?Q?P/mLA0/q3djPdIvJVFHzoGkfQoM4XGchu6qt0JpBcaeEWuIvHP48VBniGVVB?=
 =?us-ascii?Q?BmuQHtyXUUHVym5pSY/jGbEbNQduYVwQ4+3s/s2VFmF8H4F03NZ5F1D7Ea/k?=
 =?us-ascii?Q?iJKIUdxbR+mi3yO6iLVn0e/iSINlCpADy4BmPwlo95lTk1+Cpia5k/yv5a0I?=
 =?us-ascii?Q?bFEE9RczJ50b+ExeFIZVe4BRxSjTx6LMNMvaosR+4yjYR+C1oYbzmGAm6hLm?=
 =?us-ascii?Q?NC8+RBE6qeOHL4CVfG+E4D4JAHx2DZ1ivGaWpvJDDpnIxxkgKpU/S44QlO48?=
 =?us-ascii?Q?YdMy/5iBPoNBN6loAX2jomZrjzdKIPIrk5G0o0f+VKJ+BK1t7wiPibG8+Q3u?=
 =?us-ascii?Q?ZIB5qMrRS+GTc5DDmCfwNy+9jz3+Aeu3Q76qt9nujIT6wcKu2Aja1xyrggmS?=
 =?us-ascii?Q?J9YCuavYHQ48DmUorZ29+pGbdtuBGjS26e803h43Vx929D6GSy7NXRqcNpQu?=
 =?us-ascii?Q?mTl+PEcEn56DpO8a5BZszLLRxJUqBDEcjd5QXbdCyPN9EjBIUm3ylduZARIw?=
 =?us-ascii?Q?iw2wNg8t0eE1Gwo89Zt3zeyQL9BULB/qkSepB5L99U7xPm9O4iazTGI8maVj?=
 =?us-ascii?Q?XOAW35MO41UCwbx9v6AFi/B/9ftWh2FEug23Dl2T1tKCwJwGQRTJcYfu7nFw?=
 =?us-ascii?Q?6XCqCMEZs3gIWzlduDyWwy63J+js2OefrQNHaH55wizFeq3n8DojSakr1aWM?=
 =?us-ascii?Q?chv7N65N2erX1BM1oPhW4CnsK6RNyddebRLyCH/dI4YjVDUeX5IRIndUiEnB?=
 =?us-ascii?Q?aU0YrC2z+do0/L+gYNiLqDLVpdf/PQHuqELYFio4Ry3H6+daDupiRoHdNfEH?=
 =?us-ascii?Q?r5zQGlTiCr2J2zTd1RLhsQLH/MoudeLYHf+WRcrd7aRG0Gme4jpINPXehQLU?=
 =?us-ascii?Q?+n4RxWxX4NiZX89mDHUjFwrMvpJh3CoFw0q5mglpiABjtaszP8qcw3OKepLt?=
 =?us-ascii?Q?/eCi1Y7iWrE9KSSCrtYJgdsI2wXPyT7lrHfWmV1dsWOAMi6vskuu6nyx6qgH?=
 =?us-ascii?Q?vY+xTtkSe+SP9s0dZokAKx/xEyNAyJHtlIWV8d0AotpC4tFTHACZkpiFppml?=
 =?us-ascii?Q?ffd4M6nwpppBGJ0UwjleeAMRMAj2mMT2mw8JvOh23tNeKU63l8aZEdixAwwn?=
 =?us-ascii?Q?AQBPiDi5iFupldQ4sXBR2ykrhU29gaogjlrJ4xwi1uFq3w1BlE4mHAjdtDIw?=
 =?us-ascii?Q?naOURZjbJAZiouWKLS/hCsQKHXaeVx7Ve9HC0aCmMnygpM2nJB5/kEweBFH3?=
 =?us-ascii?Q?2K0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LnJ7QBo+vx+7Bv4tLQC4Um/glXo+DTPtEq/bO8HPeUrrziaq/lzMZ/eXCbKC?=
 =?us-ascii?Q?0L9HO2zWMKrQQdCsgan8Ovcv8FHqM1OJmKf3HMamPQ11vtXDZ6uEcU8tG/RY?=
 =?us-ascii?Q?vCazXFuhwdeiN4HH7RHJ7bJNBKnqIsfKRUUmg/YZJ6OgLK/jTDm/m/9UsUmH?=
 =?us-ascii?Q?zxXknhzaI6QC9oR/wF8eo7EJROcBinOZnEJJDCXNPdtItvgFOBXZT76h4IQ1?=
 =?us-ascii?Q?2xHms0pvxboyvSmnzSeOdqzQ0qRB2XSP3BGDLc7aphDj9Z0GwDiNEa6gR8q+?=
 =?us-ascii?Q?jDBKwDzLSmm8UMfHKLGLJSgGWD2zZSNZXO2TmG07m/EbDEuWBKgqaiRTAfY/?=
 =?us-ascii?Q?SS+RkdcCRDFM5IPCD2ezaKunVFFJbOkL+XIZe1lo8Sa81p53ZvHAX/I/X0qZ?=
 =?us-ascii?Q?UBt2jJMK+ZbWfnrl1WMicnHSbIFsAwD+jIzM0HAbry7ukf0ifAbYdlDkX3H1?=
 =?us-ascii?Q?bWaVn2tFQvB69vKOeji/L5o16Higycv2wTlZqY3gRFf9N53f6X2tRkAnZKtR?=
 =?us-ascii?Q?dCjFjjK/ojBBH5YhYvygrRqTmaZEs4JHu0YIoexXxlhAhP3Tu6BrdPYEWPmw?=
 =?us-ascii?Q?SpwWetN1GMVicAEAIMYTH3H1AViQfI+CDr6uQ7XA34eer0eCXYBgs6r+cH62?=
 =?us-ascii?Q?/CK6yG/BGSP48MX/kDKsK61c2BZr0gnAqFosIA+8COPCGovkgzcKwMFzIh6u?=
 =?us-ascii?Q?4u1m2lhzO5aT8sPB7jhvCzw1J8Zq09OjCM1VbmXe4z+kKnVCfXFT/j9xbXxt?=
 =?us-ascii?Q?KvYgJ5O0bh+giK7WEprJUexQu+A6Y+j8/57K64Q1iUWLE+oEqNd/40//RB18?=
 =?us-ascii?Q?CI/37lzSQm/b7Sp0yyBTl2I6+j17xDW9Gzzll+mzfBEMd6EDZFvADDbiL3t6?=
 =?us-ascii?Q?n1Cxp0pPxjyYYCicDU3Kv3iNL6Odg0jmbukmsoQGshH70g+OCjTrg0fx1cFe?=
 =?us-ascii?Q?T8I2XzCYQ+Hd2BRFs/ThhoAMcykL0rbjFDm8KpiwKhz9w82miu0kTit04SPz?=
 =?us-ascii?Q?FtTM9Ni0M7euEIVyxv5KFW3CzTgnlmY3LTfR13iklZVQf2L/FPAqEeIUVbNc?=
 =?us-ascii?Q?4fn9nTFf5c3eIFADZWgrRELVjy4l0+hIpsSZjk2DvOZF6BecWP4hSzziWOPN?=
 =?us-ascii?Q?5Px2yOs0zeuNhG4msEpQ3gvkiVv6MCDcqxhAnCmTDdf9sHe7iTNZyn3+D7oZ?=
 =?us-ascii?Q?AHzqPX26b8NM0BNW/32Gko9s1OuLztnRpzJ2l+M99h2/uIU+7a4oaE4ls+1g?=
 =?us-ascii?Q?FNlgsjgMrHVhg419SGLDmGgWeEdvxCgLJYwlcUQ9vwqfSXDvsAAB/TKLtFQv?=
 =?us-ascii?Q?DGDPpE8dQu9SEieqAGMjvQRYt4QGnKNz0kC2Yb7zRJElOWa+pr3+nR69kfyE?=
 =?us-ascii?Q?YQctpJRZ6WmUuUg1tRuK8WENXa9v6ZymvjZ51tm5VdBQm8A+8/Mim2hTAm4T?=
 =?us-ascii?Q?A4P0giH/eofLOOVSp+RU2llEOU9lW3y2vWAcYqUC29tkHWOE5SxDzTHIv5yE?=
 =?us-ascii?Q?NCbillwsDmjnC9Uvzc3ysefwNnXJD0MECmYRaKWwGLX7ZH6UStBjohlQQhyB?=
 =?us-ascii?Q?v6Vbof9KFY9hX8/Prj2mqvE3rbxSa3CDS53qhRixkokg+JTMOdIvFtS4T+Ih?=
 =?us-ascii?Q?vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 947bd6e8-14cf-4d7e-40fb-08dcdd7e9911
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 16:24:58.4763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FMt9uPPOUHVK/buYF/pUaG+prlePHA2jiHu/KwSSSEwObtUMafvOOkhiHdOVdUKO1zfYFDJnQn6GW7PZRTe3Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5325
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

On Wed, Sep 25, 2024 at 04:58:40PM +0100, Matthew Auld wrote:
> On 25/09/2024 16:32, Matthew Brost wrote:
> > On Wed, Sep 25, 2024 at 03:29:20PM +0100, Matthew Auld wrote:
> > > On 24/09/2024 19:45, Matthew Brost wrote:
> > > > Fixes two possible races:
> > > > 
> > > > - Submission to hardware signals job's fence before dma_fence_get at end
> > > >     of run_job
> > > > - TDR fires and signals fence + free job before run_job completes
> > > > 
> > > > Taking refs in xe_sched_job_arm to job and job's fence solves these by
> > > > ensure all refs collected before entering the DRM scheduler. The refs
> > > > are dropped in run_job and DRM scheduler respectfully. Safe as once
> > > > xe_sched_job_arm is called execution of job through DRM sched is
> > > > guaranteed.
> > > > 
> > > > v2:
> > > >    - Take job ref on resubmit (Matt Auld)
> > > > 
> > > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2811
> > > 
> > > Maybe also:
> > > https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2843
> > > 
> > > ?
> > 
> > Yes, look like same issue.
> > 
> > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > Cc: <stable@vger.kernel.org> # v6.8+
> > > > ---
> > > >    drivers/gpu/drm/xe/xe_execlist.c        |  4 +++-
> > > >    drivers/gpu/drm/xe/xe_gpu_scheduler.c   | 17 +++++++++++++++++
> > > >    drivers/gpu/drm/xe/xe_gpu_scheduler.h   |  6 +-----
> > > >    drivers/gpu/drm/xe/xe_guc_submit.c      | 11 +++++++----
> > > >    drivers/gpu/drm/xe/xe_sched_job.c       |  5 ++---
> > > >    drivers/gpu/drm/xe/xe_sched_job_types.h |  1 -
> > > >    6 files changed, 30 insertions(+), 14 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> > > > index f3b71fe7a96d..b70706c9caf2 100644
> > > > --- a/drivers/gpu/drm/xe/xe_execlist.c
> > > > +++ b/drivers/gpu/drm/xe/xe_execlist.c
> > > > @@ -309,11 +309,13 @@ execlist_run_job(struct drm_sched_job *drm_job)
> > > >    	struct xe_sched_job *job = to_xe_sched_job(drm_job);
> > > >    	struct xe_exec_queue *q = job->q;
> > > >    	struct xe_execlist_exec_queue *exl = job->q->execlist;
> > > > +	struct dma_fence *fence = job->fence;
> > > >    	q->ring_ops->emit_job(job);
> > > >    	xe_execlist_make_active(exl);
> > > > +	xe_sched_job_put(job);
> > > > -	return dma_fence_get(job->fence);
> > > > +	return fence;
> > > >    }
> > > >    static void execlist_job_free(struct drm_sched_job *drm_job)
> > > > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > > > index c518d1d16d82..7ea0c8e9e7a9 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > > > @@ -4,6 +4,7 @@
> > > >     */
> > > >    #include "xe_gpu_scheduler.h"
> > > > +#include "xe_sched_job.h"
> > > >    static void xe_sched_process_msg_queue(struct xe_gpu_scheduler *sched)
> > > >    {
> > > > @@ -106,3 +107,19 @@ void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
> > > >    	list_add_tail(&msg->link, &sched->msgs);
> > > >    	xe_sched_process_msg_queue(sched);
> > > >    }
> > > > +
> > > > +/**
> > > > + * xe_sched_resubmit_jobs() - Resubmit scheduler jobs
> > > > + * @sched: Xe GPU scheduler
> > > > + *
> > > > + * Take a ref all jobs on scheduler and resubmit.
> > > > + */
> > > > +void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
> > > > +{
> > > > +	struct drm_sched_job *s_job;
> > > > +
> > > > +	list_for_each_entry(s_job, &sched->base.pending_list, list)
> > > > +		xe_sched_job_get(to_xe_sched_job(s_job));	/* Paired with put in run_job */
> > > > +
> > > > +	drm_sched_resubmit_jobs(&sched->base);
> > > > +}
> > > > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > > > index cee9c6809fc0..ecbe5dd6664e 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > > > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > > > @@ -26,6 +26,7 @@ void xe_sched_add_msg(struct xe_gpu_scheduler *sched,
> > > >    		      struct xe_sched_msg *msg);
> > > >    void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
> > > >    			     struct xe_sched_msg *msg);
> > > > +void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched);
> > > >    static inline void xe_sched_msg_lock(struct xe_gpu_scheduler *sched)
> > > >    {
> > > > @@ -47,11 +48,6 @@ static inline void xe_sched_tdr_queue_imm(struct xe_gpu_scheduler *sched)
> > > >    	drm_sched_tdr_queue_imm(&sched->base);
> > > >    }
> > > > -static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
> > > > -{
> > > > -	drm_sched_resubmit_jobs(&sched->base);
> > > > -}
> > > > -
> > > >    static inline bool
> > > >    xe_sched_invalidate_job(struct xe_sched_job *job, int threshold)
> > > >    {
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > index fbbe6a487bbb..689279fdef80 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > @@ -766,6 +766,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
> > > >    	struct xe_guc *guc = exec_queue_to_guc(q);
> > > >    	struct xe_device *xe = guc_to_xe(guc);
> > > >    	bool lr = xe_exec_queue_is_lr(q);
> > > > +	struct dma_fence *fence = NULL;
> > > >    	xe_assert(xe, !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
> > > >    		  exec_queue_banned(q) || exec_queue_suspended(q));
> > > > @@ -782,12 +783,14 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
> > > >    	if (lr) {
> > > >    		xe_sched_job_set_error(job, -EOPNOTSUPP);
> > > > -		return NULL;
> > > > -	} else if (test_and_set_bit(JOB_FLAG_SUBMIT, &job->fence->flags)) {
> > > > -		return job->fence;
> > > > +		dma_fence_put(job->fence);	/* Drop ref from xe_sched_job_arm */
> > > >    	} else {
> > > > -		return dma_fence_get(job->fence);
> > > > +		fence = job->fence;
> > > >    	}
> > > > +
> > > > +	xe_sched_job_put(job);	/* Pairs with get from xe_sched_job_arm */
> > > 
> > > Only doubt is job being destroyed here. I think you were saying that
> > > guc_exec_queue_free_job(drm_job) can potentially happen before run_job()
> > > completes. But if that's the case can't the refcount reach zero here, and
> > > then caller of run_job() goes down in flames, since the drm_job is no longer
> > > a valid pointer, assuming the put() here frees the memory for it?
> > > 
> > 
> > Free job just puts the job (creation ref) so we still have reference
> > from xe_sched_job_arm here. This put could potentially free the job's
> > memory but it safe at this point in time as only the job's fence is
> > needed after this. The job's fence is decoupled from the job and ref
> > counted too.
> 
> Maybe I'm totally missing something, but I see two spots calling run_job():
> 
> drm_sched_resubmit_jobs():
> 
> fence = sched->ops->run_job(s_job);
> if (IS_ERR_OR_NULL(fence)) {
>     s_job->s_fence->parent = NULL;
>     ....
> } else {
>     ....
>     s_job->s_fence->parent = dma_fence_get(fence);
> }
> 
> s_job looks to be the drm_job, so it needs to stay alive, otherwise
> s_job->s_fence goes boom AFAICT.
> 
> And same type of thing in drm_sched_run_job_work(), where it expects the
> drm_job to stay alive after calling run_job().
> 

Your not. This is an over sight on my end.

I think we need to rethink the guc_exec_queue_free_job in
guc_exec_queue_timedout_job then as I don't think this safe. I think
that will need to be dropped, replaced with a requeue of job to the
pending list or alternativelty queue the job free on the scheduler work
queue which is ordered with run_job. Then also keep dma fence ref
counting changes in this patch (take ref to jobs fence in arn).

Let me play around with this.

Matt

> > 
> > Matt
> > 
> > > > +
> > > > +	return fence;
> > > >    }
> > > >    static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
> > > > diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> > > > index eeccc1c318ae..d0f4b908411f 100644
> > > > --- a/drivers/gpu/drm/xe/xe_sched_job.c
> > > > +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> > > > @@ -280,16 +280,15 @@ void xe_sched_job_arm(struct xe_sched_job *job)
> > > >    		fence = &chain->base;
> > > >    	}
> > > > -	job->fence = fence;
> > > > +	xe_sched_job_get(job);			/* Pairs with put in run_job */
> > > > +	job->fence = dma_fence_get(fence);	/* Pairs with put in scheduler */
> > > >    	drm_sched_job_arm(&job->drm);
> > > >    }
> > > >    void xe_sched_job_push(struct xe_sched_job *job)
> > > >    {
> > > > -	xe_sched_job_get(job);
> > > >    	trace_xe_sched_job_exec(job);
> > > >    	drm_sched_entity_push_job(&job->drm);
> > > > -	xe_sched_job_put(job);
> > > >    }
> > > >    /**
> > > > diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
> > > > index 0d3f76fb05ce..8ed95e1a378f 100644
> > > > --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> > > > @@ -40,7 +40,6 @@ struct xe_sched_job {
> > > >    	 * @fence: dma fence to indicate completion. 1 way relationship - job
> > > >    	 * can safely reference fence, fence cannot safely reference job.
> > > >    	 */
> > > > -#define JOB_FLAG_SUBMIT		DMA_FENCE_FLAG_USER_BITS
> > > >    	struct dma_fence *fence;
> > > >    	/** @user_fence: write back value when BB is complete */
> > > >    	struct {
