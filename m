Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A41C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 19:40:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D6B1122D8;
	Mon, 15 Apr 2024 19:40:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LlN2XMna";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E341122D8
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 19:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713210010; x=1744746010;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=om/Se8YtSy9AJchkaJBNl/inZcFTeNX7b+BndaXNwcY=;
 b=LlN2XMnahFZATZEfAGU3N7Vg0sktYHLAiwSXIpPI2HTOC2jLU7ycCDG1
 QzDkBFYkM3m3wjw7K6rZ3r9S22RYWHESWD0eqa8D7Ip894yCh6kNOGBp1
 zdczJiH8LqZ5fN1vfJTdMQhTe+bt95/UCSiIFCjgzvqqNMQtX5do2rVHO
 cB9rcZgYypuuO5sY6OzG4DpT0/bFZ2Ag4uvs9uJoZkaD1Rzr+5Bi7cyNn
 yPQOSkBAUUEorzm3ZnLcUKDE/yPS9vQu9goYbGIKXDajZXvGFKRPjd/kb
 Ldt4c1OefZ0m7wLeV5TmJDEKyHaxyx4aI3ndpE07eI1NxeC3HEgpjYjWV w==;
X-CSE-ConnectionGUID: /bIpP8JTRMyyfHxwnsztIw==
X-CSE-MsgGUID: JOCYpi3RQKG5iR9tRTfc6w==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="11564248"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="11564248"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 12:40:10 -0700
X-CSE-ConnectionGUID: N3lUa9beTvGmHUL5X4vYTw==
X-CSE-MsgGUID: hRsnZoibRUG/rmmf+qcLsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="22090849"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Apr 2024 12:40:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 12:40:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Apr 2024 12:40:08 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Apr 2024 12:40:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M8hYb2MdhZ6zh6WJ19MUe0jnLik09m82RQil/Kj3JyCeOpF4gp4tGu1LC1nRL007YQ2i8cTYP7SH55Upua8Ywm003+aRRIcoXax5cfDM3KSIUxLesCueypaZK7vKTjMqoPwZlNYVit5PUnqXr/NStXetlIQwFn4MayRPHZ1vNSwzp7T+BGME934jIsbH78eo1zu9k5W/gsayIDlZmwG1K95gCS7ek5tzpWE1Zhwtormu8Vw/q1IymmsThITXGBrib5Qs1+7pWVjb7YiTdd4guDtui/B/A3Ui5oFamewvamToh8GsbTibISGsP/j6WLJLIilPL3AqGp/nlzo0LRpIYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UaHshqtHX17ET60R37ed+GI7eg6mDxVp6JgXd+FrLTw=;
 b=IiBJ3LWERs2ih2kIP/srS53sbr8fURUJ9dmj9e9J6NmQtQ5M/ke9kMFhZnfVObsn+MzbKXNgeUCnawpS9qBTDmUmqUcZrLtfELStvOz1d84610RYdIbU9AvpJr9MolhA8DQIikQFRU5uLUCaoPOh2UxcK+MZ12QAfMeJIrIVuZI2LlNPPR1Vkx1IVH22A7vlVCZqAbbK7DpBZyiHqCno67AIDirWj9YzXZCQP42dgsXilvYpsZfnn9ELtX+85jlbQ0vFnm37BtfPgJEuwKzSbP5MBM1jsrGP7RShldzRuyHDsjE1zkUgtfM4z3n4a3P3fVrm03lruEaqpRHUm3bOvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8314.namprd11.prod.outlook.com (2603:10b6:610:170::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Mon, 15 Apr
 2024 19:40:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7472.027; Mon, 15 Apr 2024
 19:40:06 +0000
Date: Mon, 15 Apr 2024 19:40:04 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Thomas.Hellstrom@linux.intel.com"
 <Thomas.Hellstrom@linux.intel.com>, "Welty, Brian" <brian.welty@intel.com>
Subject: Re: [v2 28/31] drm/xe/svm: Introduce helper to migrate vma to vram
Message-ID: <Zh2ClEZweYvYFpWN@DUT025-TGLU.fm.intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
 <20240409201742.3042626-29-oak.zeng@intel.com>
 <ZhdPsV/ou2DMQe3O@DUT025-TGLU.fm.intel.com>
 <SA1PR11MB6991AB46782299FA3E2ACE7F92042@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SA1PR11MB6991AB46782299FA3E2ACE7F92042@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR07CA0066.namprd07.prod.outlook.com
 (2603:10b6:a03:60::43) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8314:EE_
X-MS-Office365-Filtering-Correlation-Id: 76146ab5-e356-442e-99e0-08dc5d83da36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xXBv3Tcx1I/EK+Pi3eU5AqYVWYheeMcEO3rsi1fCwIdunOScjWec1uujJPijxi+DoXncvBSRLt3hZlc9BWS7KV0K4dpjuKqIt1wfGck+9kKq+PQBsuarTNth/KGzvM+RGhQcZodFq07H9jzFNZeUDztnkrTrq5rU6PiZCkSPO7XKGvN4xMVc+Kp6aOI8BQACZvFAky3/prsN0cU3tCgVRR9L3nIOakYZ+hVdkGMDPIWRsdbxrybDLtvE/yI1rL+QdfHvmcOsbi3a7KV8bu4jUrmskKykfEUV6tXuXQ+m33cLQtSMZwZnHaFkrdv9cGI9ftcwhHWza2vpxpTtYmy+L0OQjApRxJRf4KKK4fTDG+JmByNS2I8XckS93bLLVEJVTtv5G3Z9aa7Vg3iKCeh+4b7N+MgbtyxhQ6Nyy/5Hntq9Xdo+dcgri/IBnUp3ZJvpviaC1PA4ItQjcluRlb3yyQIYYaLkN1Lxg1nPPa5YIccBRglgbKyWWTFZyRtBm8bNISAJ5tr7L0ckEcJMusRva5UXmgYOGiJxJxcQ8dDgbw4EAmbCv5zqK1EerlLZX9DH7Azf9xVj7PNK/2RYG2ArRaXI9/SGBBaTsp8P45wds1ypooA09eNcK5Eu+gwhrFgu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?tQ9aGw0Olk0//b7teXzA8QSFvRFsyxpTjckK+UbfKfLUNqOz09yT6FLiIs?=
 =?iso-8859-1?Q?S1PVcJ1lLVgzaAy4tlPOW1eTn1J4cxDPqi1mwv7Pk+AoxhoAOGKZQ0UsIe?=
 =?iso-8859-1?Q?VlqRJoMBx0ivbXE0T1UQdcDlED+Wv3C9lqLALqlMut+FDcqGClpB6H7MPv?=
 =?iso-8859-1?Q?JV+a0l+QRhpq9KLtQWn6dqdNkgSkP5LdEQWlR4kKRDgywBTvjIg5VBt/tX?=
 =?iso-8859-1?Q?ISS6jZ+R1txCPS5avtCTVsPXlmH0yavAkqQN9xhss0iSEQJIJ+D/Jc15aX?=
 =?iso-8859-1?Q?KghLwPpRC3s5z5UsMpaH4mcHwFYHQBNlty9D4YtheR74d0lRs/B9576zVn?=
 =?iso-8859-1?Q?+ErPnhxcVCPh0EGP6QLJ+r2F4Ya3X4BBmrWoJ1jEFgJDUQmPjXglOJxL6z?=
 =?iso-8859-1?Q?gRAkdH4E70mnS1hTtqUJBTim/wpd5tJgjmrUFTnu6rMd4U3k1gSxc7YyEB?=
 =?iso-8859-1?Q?psf45yLXdSW10t3z3fcyld4e7B+6ZRz3Fb4cQnMaSvxW4tyMLuCo4Vi9iC?=
 =?iso-8859-1?Q?KZqqh51p2GtVN/TOLJSAerVeBn8wNZ88NJ9Gwkf8uI3ePDhhzHTbkQm1Sr?=
 =?iso-8859-1?Q?d9CKzdXNVU9yBZzJHMdie0bxFF0UcSgcta9dHKR1EPwjXlaUKiviqcpZhw?=
 =?iso-8859-1?Q?r3fhcMAYzNXFiMxqvgYFK6+6hfZsIM1HqHXYK+Ob/9jRRvTXzZAknP3Dnh?=
 =?iso-8859-1?Q?DqRbD/hRLd9PXvqtxYupdB1MpRZlm3GshuFaSRp08NZgVV8a3P/m+gYUh0?=
 =?iso-8859-1?Q?YUzoHbrDMpLmv/krEJ9JRdyL1VAVG4lK3q8QxYYc9Rkf+fT8loX1wFZrcq?=
 =?iso-8859-1?Q?pJHagPMQuZkcjXbH0jX/4bnEP2hCbiF0+vi1MBKXo/j+joTSxuUq4wVE+2?=
 =?iso-8859-1?Q?i3fxkThi3yzF6mr5t5ClJEm6d8gYnOc3D72NdiY8pLNzaAU77ycytEM7Uf?=
 =?iso-8859-1?Q?Qs54L5hsd1uWzFqCCuVE1gBp8ONUmKv6cPvBksHBey5Ojf4AkR335COJ7d?=
 =?iso-8859-1?Q?qKBeaNHKsBhLpbBtRUk4w8Bgc21Ta7Tvjg939XJFyalwfdDqiMMe4pMRJ6?=
 =?iso-8859-1?Q?XF/qJzg2WEPX/CfM88L6BE+08qb72IbPHSbJj/a+cyYQ7sYXspSyGkLRPS?=
 =?iso-8859-1?Q?MiQQsVTtT8wYuaCoXkaij3W4R+KL2uaRJZBaZXxmR4pwcQtI1QBfJzoXrM?=
 =?iso-8859-1?Q?z8IUrETz0qlV7/+jjYBkHYhzXuWOafGSHIzGVFcDUDSpBs9yX8Wrfv5vaT?=
 =?iso-8859-1?Q?8umJWH45Mp+Zs5qmXDSeDKt+Rtgv0OFqBtWHxsUmBaUL2ZNIq6HyfE4Nm3?=
 =?iso-8859-1?Q?mod+vSWJ6PdOICW6AeJ7TvD2oNh9fBGPZMXfKsLHtYPlDqEhxDrO0uyK+u?=
 =?iso-8859-1?Q?o0xNTbMtQHka4d4iRRFx5Drq6kaGtwdbELlR+4SS0vmcGYbWDLGStXfwSZ?=
 =?iso-8859-1?Q?U0fDqof3wPZy+Alpt7FbeqXMM0iaCZ6/1YVv8in1St0htsy4JTiepRNf3c?=
 =?iso-8859-1?Q?LriuFEodWCX/M6z4eRXXWR+PGFnP2XuVGJlm5vxi9UHWMJxCtXZWIzNOaA?=
 =?iso-8859-1?Q?Yz2csQs6J00wEvp4kBgp36Z2NvXEM4AVH/ZsvwNGw9wfayNPy3RzWotQnu?=
 =?iso-8859-1?Q?8A6pUPupZTbF6ts7IEIfE5BfYN/5DbxakXuZiKnQdq+aBE8tx+pQxyDg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76146ab5-e356-442e-99e0-08dc5d83da36
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 19:40:06.4450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FtSHdIFxWeAUJ1MBAYJcPhjyhek/ACgxBKlmXVVYr4sX/Bp2oaAarMeOeVFDPTkBBTeP4esQ6Cla1DKe2eD5TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8314
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

On Fri, Apr 12, 2024 at 03:21:04PM -0600, Zeng, Oak wrote:
> 
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Wednesday, April 10, 2024 10:49 PM
> > To: Zeng, Oak <oak.zeng@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> > <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah
> > <krishnaiah.bommu@intel.com>; Thomas.Hellstrom@linux.intel.com; Welty,
> > Brian <brian.welty@intel.com>
> > Subject: Re: [v2 28/31] drm/xe/svm: Introduce helper to migrate vma to vram
> > 
> > On Tue, Apr 09, 2024 at 04:17:39PM -0400, Oak Zeng wrote:
> > > Introduce a helper function xe_svm_migrate_vma_to_vram.
> > >
> > > Since the source pages of the svm range can be physically not
> > > contiguous, and the destination vram pages can also be not
> > > contiguous, there is no easy way to migrate multiple pages per
> > > blitter command. We do page by page migration for now.
> > >
> > > Migration is best effort. Even if we fail to migrate some pages,
> > > we will try to migrate the rest pages.
> > >
> > > FIXME: Use one blitter command to copy when both src and dst are
> > > physically contiguous
> > >
> > 
> > Yep, touch in this throughout the series. Only vram needs to be
> > contiguous though as we dynamically create PT mappings for sram pages in
> > the migrate code. Getting this in a must and should be done immediately
> > IMO as this a very, very basic perform thing we know needs to be done.
> > We will likely have to tune this code quite a bit for performance so
> > getting known things done would be helpful.
> > 
> > > FIXME: when a vma is partially migrated, split vma as we assume
> > > no mixture vma placement.
> > >
> > 
> > Agree we do not want support partial migrations. We likely want to
> > return -EAGAIN for something and fault back to a smaller xe_vma chunk
> > size which I discussed in [1] and add comment on in [2].
> > 
> > Migration should be best case too if we fail migrate we can always leave
> > backing store in sram too.
> > 
> > I do have question though, when do we get partial migrations? A user
> > having called mlock on some of the pages? I just want to make sure I
> > fully understand that case.
> 
> Yah, mlock could be one case...
> 
> I also looked the hmm code. There are few other cases where MIGRATE_PFN_MIGRATE is not set (so we skip migration after), such as pte is NULL and vma is file-backed (not anonymous); entry is swapped out to hard disk etc. see more details in function migrate_vma_collect_pmd.
> 
> 
> > 
> > [1] https://patchwork.freedesktop.org/patch/588526/?series=132229&rev=1
> > [2] https://patchwork.freedesktop.org/patch/588528/?series=132229&rev=1
> > 
> > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > Co-developed-by: Niranjana Vishwanathapura
> > <niranjana.vishwanathapura@intel.com>
> > > Signed-off-by: Niranjana Vishwanathapura
> > <niranjana.vishwanathapura@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Thomas Hellström <thomas.hellstrom@intel.com>
> > > Cc: Brian Welty <brian.welty@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_svm.h         |   2 +
> > >  drivers/gpu/drm/xe/xe_svm_migrate.c | 115
> > ++++++++++++++++++++++++++++
> > 
> > Same comment on file structure throughout the series apply here too.
> > 
> > >  2 files changed, 117 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> > > index c9e4239c44b4..18ce2e3757c5 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.h
> > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > @@ -83,4 +83,6 @@ int xe_devm_alloc_pages(struct xe_tile *tile,
> > >  void xe_devm_free_blocks(struct list_head *blocks);
> > >  void xe_devm_page_free(struct page *page);
> > >  vm_fault_t xe_svm_migrate_to_sram(struct vm_fault *vmf);
> > > +int xe_svm_migrate_vma_to_vram(struct xe_vm *vm, struct xe_vma *vma,
> > > +							struct xe_tile *tile);
> > >  #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_svm_migrate.c
> > b/drivers/gpu/drm/xe/xe_svm_migrate.c
> > > index 0db831af098e..ab8dd1f58aa4 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm_migrate.c
> > > +++ b/drivers/gpu/drm/xe/xe_svm_migrate.c
> > > @@ -220,3 +220,118 @@ vm_fault_t xe_svm_migrate_to_sram(struct
> > vm_fault *vmf)
> > >  	kvfree(buf);
> > >  	return 0;
> > >  }
> > > +
> > > +/**
> > > + * xe_svm_migrate_vma_to_vram() - migrate backing store of a vma to
> > vram
> > > + * Must be called with mmap_read_lock held.
> > > + * @vm: the vm that the vma belongs to
> > > + * @vma: the vma to migrate.
> > > + * @tile: the destination tile which holds the new backing store of the range
> > > + *
> > > + * Returns: negative errno on faiure, 0 on success
> > > + */
> > > +int xe_svm_migrate_vma_to_vram(struct xe_vm *vm,
> > > +							struct xe_vma *vma,
> > > +							struct xe_tile *tile)
> > > +{
> > > +	struct mm_struct *mm = vm->mm;
> > > +	unsigned long start = xe_vma_start(vma);
> > > +	unsigned long end = xe_vma_end(vma);
> > > +	unsigned long npages = (end - start) >> PAGE_SHIFT;
> > > +	struct xe_mem_region *mr = &tile->mem.vram;
> > > +	struct vm_area_struct *vas;
> > > +
> > > +	struct migrate_vma migrate = {
> > > +		.start		= start,
> > > +		.end		= end,
> > > +		.pgmap_owner	= tile->xe,
> > 
> > Again helper to assign owner.
> > 
> > > +		.flags          = MIGRATE_VMA_SELECT_SYSTEM,
> > > +	};
> > > +	struct device *dev = tile->xe->drm.dev;
> > > +	dma_addr_t *src_dma_addr;
> > > +	struct dma_fence *fence;
> > > +	struct page *src_page;
> > > +	LIST_HEAD(blocks);
> > > +	int ret = 0, i;
> > > +	u64 dst_dpa;
> > > +	void *buf;
> > > +
> > > +	mmap_assert_locked(mm);
> > 
> > This mmap_assert_locked is ambiguous, we should make it clear if this
> > read or write locked. Doesn't it have to be write to do the migrate
> > pages?
> 
> I followed hmm document (Documents/mm/hmm.rst), see section "Migration to and from device memory". It explicitly write a read_lock in this document.
> 
> I believe a read_lock is enough for the migrate_vma_setup/migrate_vma_finalize().
> 
> As I understand it, the mm.mmap_lock protect the process's address space. When we modify process's address space such as mmap/munmap, we need to hold a write mode lock; if we only read process's address space, such as in the migrate_vma_setup/finalize, or in the cpu page fault handler case, we only need a read mode lock. 
> 
> I also cross checked amd driver. They also use a read lock.. see function svm_range_restore_pages in kfd_svm.c....
> 

Yea, I see that too. Trying to figure out the locking, IMO the locking
document might actually be wrong, or the very least the locking design
is very ill-conceived. We can discuss internally a bit before I
publically share my grievances.

> 
> > 
> > A larger question about the locking... The CPU fault handler holds the
> > mmap lock in write mode, right?
> 
> No. since cpu fault handler doesn't modify process address space, instead it only fill up cpu page table for some valid address range, a read lock is enough. 
> 

Ah, yes after digging around a bit I see this.

> > 
> > I'm asking as basically I think at least initially we want to hold the
> > mmap lock in a way that the GPU handler and CPU handler do not race.
> > i.e. From fault userptr create in GPU fault handler to issuing the bind
> > we prevent the CPU fault handler from running.
> 
> Yes we hold mmap_read_lock in both cpu and gpu fault handler to avoid that race.
>

That's not how rw lock work. 2 threads can both hold the read lock in
parallel (shared read access), only 1 thread hold the write lock
(exclusive write access, no one can hold read lock either). Thus my
concern about the cpu and gpu fault handler running in parallel and the
larger locking design questions. Again we can talk through this in
detail internally a bit.
 
> In user mmap/munmap (such as kernel function vm_munmap), we hold a mmap_write_lock which prevent it racing with cpu and gpu fault handler.
> 
> 
> > 
> > I'm having issues figuring out how to prevent races between initial
> > binds of userptrs and userptr invalidates on faulting VMs. This race is
> > seen any xe_exec_fault_mode for example... So preventing races between
> > CPU / GPU fault handler with the mmap probably is a good idea initially.
> > Likely can make the locking finer grained once this is all working and I
> > figure out how to handle this race better.
> 
> 
> I don't quite follow here. 
> 
> Initial bind of user ptr... if you meant the bind in gpu page fault handler, then the racing with invalidation is roughly like below:
> Invalidation is called with mmap_write_lock

Is it? If the notifer does the invalidation via migrate_vma_setup in the
CPU fault handler we established about that only the mmap_read_lock is
held.

> In userptr_pin_page, we hold a mmap_read_lock, so we know during pin page, invalidation is excluded.

Nope, see above invalidation can happen when userptr_pin_page is
executing because of the read lock. The seqno check (described below) is
what prevents programming of bad page tables.

> After pin, before programming gpu page table, we check whether there is invalidation happen *after last pin but before programming page table*, if that happened, we retry
>

Yes, that is how it works on tip but I am refactoring it in [1]. I was
trying to avoid the retry loop by turning PDE/PTE writes into clears if an
invalidation happened but not sure if that works without a larger
refactor due to nature PDEs being shared. I may need the retry loop but
that also gets tricky with array of binds... A few options here and will
land a on solution once [2] is merged.

Regardless my point here is still valid - it may not be the worst idea
when getting this code initially up and running just to grab
mmap_write_lock in GPU fault handler as a BLK (big kernel lock) to
prevent all races. Once the code is stable and stress testing in place,
switch to finer grained locking as define in HMM document (or newly
defined if we fine locking design is insufficient).

Matt

[1] https://patchwork.freedesktop.org/series/125608/
[2] https://patchwork.freedesktop.org/series/132246/

> 
> 
> Oak
> 
> > 
> > > +
> > > +	vas = find_vma_intersection(mm, start, start + 4);
> > 
> > find_vma should work fine here.
> > 
> > > +	if (!vas)
> > > +		return -ENOENT;
> > > +
> > > +	migrate.vma = vas;
> > > +	buf = kvcalloc(npages, 2* sizeof(*migrate.src) + sizeof(*src_dma_addr),
> > > +					GFP_KERNEL);
> > > +	if(!buf)
> > > +		return -ENOMEM;
> > > +	migrate.src = buf;
> > > +	migrate.dst = migrate.src + npages;
> > > +	src_dma_addr = (dma_addr_t *) (migrate.dst + npages);
> > > +	ret = xe_devm_alloc_pages(tile, npages, &blocks, migrate.dst);
> > 
> > Again as I discussed in [3] I think this should be broken out into a
> > different step with the blocks allocated before this, and here just
> > populate migrate.dst from the existing blocks.
> > 
> > [3] https://patchwork.freedesktop.org/patch/588523/?series=132229&rev=1
> > 
> > > +	if (ret)
> > > +		goto kfree_buf;
> > > +
> > > +	ret = migrate_vma_setup(&migrate);
> > > +	if (ret) {
> > > +		drm_err(&tile->xe->drm, "vma setup returned %d for range
> > [%lx - %lx]\n",
> > > +				ret, start, end);
> > > +		goto free_dst_pages;
> > > +	}
> > > +
> > > +	/**FIXME: partial migration of a range print a warning for now.
> > > +	 * If this message is printed, we need to split xe_vma as we
> > > +	 * don't support a mixture placement of one vma
> > > +	 */
> > > +	if (migrate.cpages != npages)
> > > +		drm_warn(&tile->xe->drm, "Partial migration for range [%lx -
> >  %lx], range is %ld pages, migrate only %ld pages\n",
> > > +				start, end, npages, migrate.cpages);
> > 
> > As discussed above, we shouldn't support this. We should fall back to
> > smaller xe_vma chunk size until we find one that works or simply leave
> > the pages in sram and map those pages to GPU.
> > 
> > > +
> > > +	/**Migrate page by page for now.
> > > +	 * Both source pages and destination pages can physically not
> > contiguous,
> > > +	 * there is no good way to migrate multiple pages per blitter command.
> > > +	 */
> > 
> > Touched on this a bunch throughout the series, lets do better than a
> > page a time migration.
> > 
> > Algorithm should be very similar to what I discussed here [4] but with a
> > few key differences.
> > 
> > - I think the sram pages can be unpopulated (page == NULL) if the user
> >   has not yet touched the page
> > - Also I think the MIGRATE_PFN_MIGRATE bit being clear is valid
> > 
> > In these cases this indicate we have to issue a copy for the pages we
> > are accumulating with contigous vram addresses.
> > 
> > [4] https://patchwork.freedesktop.org/patch/588526/?series=132229&rev=1
> > 
> > > +	for (i = 0; i < npages; i++) {
> > > +		src_page = migrate_pfn_to_page(migrate.src[i]);
> > > +		if (unlikely(!src_page || !(migrate.src[i] &
> > MIGRATE_PFN_MIGRATE)))
> > 
> > Discussed this in the CPU fault patch, once we call migrate_vma_setup,
> > on subsequent errors we need to call migrate_vma_finalize to revert the
> > pages to the original state. At least I think if I am reading the doc
> > after this correctly.
> > 
> > Here on error we just free the pages...
> > 
> > Matt
> > 
> > > +			goto free_dst_page;
> > > +
> > > +		xe_assert(tile->xe, !is_zone_device_page(src_page));
> > > +		src_dma_addr[i] = dma_map_page(dev, src_page, 0,
> > PAGE_SIZE, DMA_TO_DEVICE);
> > > +		if (unlikely(dma_mapping_error(dev, src_dma_addr[i]))) {
> > > +			drm_warn(&tile->xe->drm, "dma map error for host
> > pfn %lx\n", migrate.src[i]);
> > > +			goto free_dst_page;
> > > +		}
> > > +		dst_dpa = xe_mem_region_pfn_to_dpa(mr, migrate.dst[i]);
> > > +		fence = xe_migrate_pa(tile->migrate, src_dma_addr[i], false,
> > > +				dst_dpa, true, PAGE_SIZE);
> > > +		if (IS_ERR(fence)) {
> > > +			drm_warn(&tile->xe->drm, "migrate host page
> > (pfn: %lx) to vram failed\n",
> > > +					migrate.src[i]);
> > > +			/**Migration is best effort. Even we failed here, we
> > continue*/
> > > +			goto free_dst_page;
> > > +		}
> > > +		/**FIXME: Use the first migration's out fence as the second
> > migration's input fence,
> > > +		 * and so on. Only wait the out fence of last migration?
> > > +		 */
> > > +		dma_fence_wait(fence, false);
> > > +		dma_fence_put(fence);
> > > +free_dst_page:
> > > +		xe_devm_page_free(pfn_to_page(migrate.dst[i]));
> > > +	}
> > > +
> > > +	for (i = 0; i < npages; i++)
> > > +		if (!(dma_mapping_error(dev, src_dma_addr[i])))
> > > +			dma_unmap_page(dev, src_dma_addr[i], PAGE_SIZE,
> > DMA_TO_DEVICE);
> > > +
> > > +	migrate_vma_pages(&migrate);
> > > +	migrate_vma_finalize(&migrate);
> > > +free_dst_pages:
> > > +	if (ret)
> > > +		xe_devm_free_blocks(&blocks);
> > > +kfree_buf:
> > > +	kfree(buf);
> > > +	return ret;
> > > +}
> > > --
> > > 2.26.3
> > >
