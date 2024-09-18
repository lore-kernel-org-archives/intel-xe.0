Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C70CDD541
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 15:25:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA2010E1A6;
	Wed, 18 Sep 2024 15:25:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OsX8d0gP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD1D10E113
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 15:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726673150; x=1758209150;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XZVjIAIe5ua8lm1j1ZdxUdRT9mTXOqAG3d0TAnSxx3g=;
 b=OsX8d0gP7TzP6N7QRnDXogPXqVJ9EpxAyvklxCsJERkeK7GNsFD0S8f/
 hbN6Iuq0lY69RCzXIlcATUPcOmUHa1daeoUOXZ97IDsy7OysWDyBreZnP
 pWg/dJorZ4XE73PIiL/efFmmbpib9ZKtp69DLZriD3zTPGNBWxo7InCrt
 kAVaZ+cMQMhL0dUJpZ1F90x5w3p0dLw+Nj0eQaeHKiLY2j4mlC4i0MfWH
 AT/uh4gENcOiI5iPyIvxaIYsbCIZGEZYnAJX5iUUzi++eWgWapuQzZJ9e
 7/MHUGJ50nljkPXVnL8mU58+waNOqETZ7dgcnuGPPiu2WlU7bbLCPbxGW Q==;
X-CSE-ConnectionGUID: 3hAVYpkASU6XBq9WA8e/QQ==
X-CSE-MsgGUID: z7vEq7KPQJuLR8IWRQ3Rzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="36174664"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="36174664"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 08:25:46 -0700
X-CSE-ConnectionGUID: UOUz4fBcTbmR94A6EgxGMg==
X-CSE-MsgGUID: IrpsAv67RXyf0IgPAyn+kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="92907780"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2024 08:25:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 08:25:41 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 08:25:41 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 08:25:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wamVx+SpQ77fMjyXvv9gjywxxtlPIQ0e2Eptje7QRowmRmKUAkkUs5TpIdLAU1ideK3gPtgMJzUQk+o37MIUBc/ILCrRfy2B2riaWBNR1b8RviclGZVRH0bDwRTOeHxF5T4S/J3z5f6MMltm9pkCzYvS7081HGpfVHqdika160jF6/Cm/0YC23ynMX/bNvZlKWe9GVloueHRGzrh7K7ir+c3/h2jYOPiPrFHcPN2QNXvN21miacQ+k005cd3jjzB0RU4r2Lf3cVHGihqN2ZMUxZSgne/Ih/T4tKSCG/kkClXjrvCg4EusZokyI2iUvqqKhsTzMBpg9rGul3pq6ddsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K84+Z71vKFgnr5ns3rkqAE3BlcnGN6mgKz5EgOFgN2U=;
 b=c3iwvWEsfMeXmF8tBMQ4Vu1VcB+hDbcWfxqXhUnkCqgHol4drt9zaI3L2bokaKWOvAeWTukMSeUGZmcMjSkno6/WpovciBKKm7akZpirpFrjcujZkGQ55xEpuXbWu4XwbtUkQls03ePkjgTLQQIYhA4S4VQUkrB9IzuTIG+GiwqPO8v+WhZ0ggo376bGH4xnAmRtgirKLOPAhmOktUMv8W/KpO24NS5pYULirUmjEkHAkAIpiElW1AL17c0r2cnvSsSgBfUhu8OQ0m7a7ecx1w7mMv/7IYxjElxPbC6xLYjYC0SIJajW4y28a88kDT746dk3YKD+HbB2v9ta9ZW+xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB6816.namprd11.prod.outlook.com (2603:10b6:a03:485::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Wed, 18 Sep
 2024 15:25:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7982.012; Wed, 18 Sep 2024
 15:25:39 +0000
Date: Wed, 18 Sep 2024 15:24:03 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Convert to USM lock to rwsem
Message-ID: <ZurwkyNtFvcbIJ5F@DUT025-TGLU.fm.intel.com>
References: <20240918054436.1971839-1-matthew.brost@intel.com>
 <148ac588-d4bd-4a86-849b-5e28b530b3b7@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <148ac588-d4bd-4a86-849b-5e28b530b3b7@intel.com>
X-ClientProxiedBy: BY5PR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e0a88d9-2c87-4b48-cea9-08dcd7f626ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kKhufvDFJsvlb8YUwRjvL9u/8AT2Wazu+i/ACLONIQhVyD9EUB2LYU9aCFz1?=
 =?us-ascii?Q?f5L9uOLXK6pghnhczSpYSQiv8XrVs+9Yw/L3FahRtWD80ehT03qqylq5yCQL?=
 =?us-ascii?Q?o3WDiGJ+HovvAifLPepZrq1wrV/Kmy5C1y8+L2KI6dT5Wqv/lGTLrPOKk5BS?=
 =?us-ascii?Q?D+BdU8OlS5+Nd2TqKeG2dHH7npKPliKf3kcuvt3nm8nl27O1mMYQBA0sJqyX?=
 =?us-ascii?Q?MoE7iP9XQed3H2x4BWcMu4D0cHxy0W99dsnuNsxByStTFLxYMATYuawxyI+u?=
 =?us-ascii?Q?+GNgN++0JKsNMSRE2MjemWqX53OMGLwZ7mLvaD3MCQNCDuFMO6fFgCo3OTZQ?=
 =?us-ascii?Q?GNHcKgqftMqyWYKPjwMKm2Wd7Up5jlQQkcAZQXZXvzb9rLOrLmvjnyW6ZU1f?=
 =?us-ascii?Q?othTpB4+ZqxtdmyGQXZhJekRMqHa0ef33E7urSyf7MEzVqvHJKQYddvs7jcy?=
 =?us-ascii?Q?KFGag7Ab7IY7dLWX83nCydkg6lVOUum5Ht+V8QkJuBxkn7qbErjW9vAuYv31?=
 =?us-ascii?Q?GZDKycjZNlp7c/zmLcV7gQlqbpdeFeBoIXGj0MNaXY4WNu2b/lfxLrhk+Oix?=
 =?us-ascii?Q?6chjY8LyxAxrDg2ShTX68Ox9nYXn7EaCJ3es8LtdUBWRBr4P9mGk8ufnjj9t?=
 =?us-ascii?Q?rtqsUSNSf0T9+QEfHC8P+IsEqtF0D3BaM2uSaGJZokCjgpxNuhqtIFbyLMFV?=
 =?us-ascii?Q?A6KWmdZTb3rmDku2/LF4rKOjejXf5hxiNNV4pn/qoCLu1jKJOmnST+gv3EZg?=
 =?us-ascii?Q?KbyG2W655+lISPrKQemsSpPD9N71gJvAv9Yr+dLRQ5CcpSNE1//n79Gqf+J4?=
 =?us-ascii?Q?DztiFShnL4Xj/4jb0/YZ52LSUS72q+IR+0uaPDvQJWQzqwW7Tz+xybqiy695?=
 =?us-ascii?Q?95p+vih0h0ZL+uTIEacXAJeJUjhHGtFgS77ACL9GaZDLAD9lVNvhEoyn/9YJ?=
 =?us-ascii?Q?p+1U072v93XVCksW4QmM+Hef6x8TtIBOymB4vDbf1a621efWaSv4qU9+M/5b?=
 =?us-ascii?Q?850Nh+0OS8u0emEUC6ndi4ROonacjz/+cYVtLm7CNiwHfSgarycZH4kkBm0G?=
 =?us-ascii?Q?dBA4VXNR4+wXbwlS/WiuvqMLq3NgiOwc1kinqh3cZ6TvmxqI7GfJ/KSSLxjC?=
 =?us-ascii?Q?feWHdGZ0NuqBAdX+ojSOvB7xOU37eFCK8LMnw7l6jsGFQbxrJG/9UWOAQeXe?=
 =?us-ascii?Q?7dEsCX/U0tyNBGyvZPBqzYS7un4nVfEtWFgBP37UGYcwrbanij5YsNBUGpnR?=
 =?us-ascii?Q?KQOoYOO1y/qF6SUBW3SsYTrIqguBZW4CLL/aGw2kbw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W1cnZEYaQQk1UdjSOE8ZPBGGiZk+LFS36jb9h/YHLGWyf+6+1BW1pdID5t/l?=
 =?us-ascii?Q?QqCALscz6pgxBvw0KztvFOUvMfZ8av9OwYqzxFVV7swxZAZ+wK9qreFeEfhM?=
 =?us-ascii?Q?FpCOCpVPLarCPNDa6Ly9Dl8T2FNRouaEO38WuZdGWbq5wI9rq9cTjLFJfPTa?=
 =?us-ascii?Q?JhJps6As7FRAxCoDg7A3fWIJCPSnHnszGgx/IjFTz74wKdcclf3EJ27feTQJ?=
 =?us-ascii?Q?jiaXufYqYwyfjBfYNlNROvYefJhYczcXOk47n437j7b7Qs1B7/hNtSj0K7r4?=
 =?us-ascii?Q?KDZUftdC5o+o1TewO6xXDlry2eZfQGKLp14KKlrYSwUdL/wNMDGWUr3L/xMf?=
 =?us-ascii?Q?WAfcx4ccTa9f1vU5WVOTVzQ2gQAAVWU143w1yjsh+5Q9qRJLoDkfFE34Olt6?=
 =?us-ascii?Q?+D74pIv1Uj9fWdlu89DXRIXZCVKCd4U8IU8FsljGUBtp7XGU8xrJiVn+Kt35?=
 =?us-ascii?Q?VG7ZOeXFA8jc62r1lBbO5QxwBKzkPDx//bS0ncH9bXcuevCTTAet3BBoFrS3?=
 =?us-ascii?Q?XpDLbmKksLt795E5Z7TrJbaxsb7t7efcHe/DxEeT2Y3MIg3vy7HsHBY2JBQ+?=
 =?us-ascii?Q?92Vw+pngzSzG5qMwu8CELcwaQv08v5cfROU4ZBLR7XZSiIspwXlhihliEHtn?=
 =?us-ascii?Q?k8gvrl3qf9ixsISuvaFg64RaxgjMVQcWYBQqfa3BLucd88mN3VK84xDsdH6b?=
 =?us-ascii?Q?SsrjyctsKfKMdYSsQmUzp35Qo+5tioQUKAsKfZjU7+PuQoUBAlIZvEFVYs9c?=
 =?us-ascii?Q?orAs5Bc5pud6xU9zuXlhnSWiJJDwopuR+0TLMiGhmoG5DkHVtIInuXVyRM43?=
 =?us-ascii?Q?P90E2pv655u2NpRWsXJHitlJHiD2jYSy27PTCa/WTYB9aFZ3Dvxk4PMJyFZC?=
 =?us-ascii?Q?KnWodZWFDWe2Dy1gFPR9IN9cLrOFRJ8vDwZGfXFjG6RePyVcLw/9QX7rO9kq?=
 =?us-ascii?Q?XfOC/Ph0g1wq6+/KlxFRTfp/thMNjLSLu84PP7dmvZy+iAAGUYVA64/eHTeW?=
 =?us-ascii?Q?abKKZp8dlqIDbKrFzCCr1la7OqV7ZecALrsiUieasm8zuZ+e5GYUsH0C1HyV?=
 =?us-ascii?Q?bxQ6yPd2lvRlChXkH1jn2tEBFQsl+3KtKWVtkYwXtDjY2SlfM0exFMwQC4+O?=
 =?us-ascii?Q?U5YA0J+ZestjTfNKm37+QfXR2oKdLhQVUdQXfyn79ADy511QunyPXpOsWOCs?=
 =?us-ascii?Q?fnI6PfDaEmuIwDzzX7hd+RtSI5dGE645rJRzXmWpBJOTneZJVd+yzF41lOlS?=
 =?us-ascii?Q?wVSsnrbixQ1NulfbDgt3xPXv/oGv0QSm4VNL6wpZgSe1sFdm7J4adSE0fijt?=
 =?us-ascii?Q?yya/cM7MnJoTJ8HXnlfnfp8w5PHAChUy1GbnaKH5Tm1PxGmqwNSD2iUvy47I?=
 =?us-ascii?Q?FEehb/MjP/D8ODls5urkxmsPtMPizZjjuOF6nl1eBVZ5H4+MoPaSrg2nb5MT?=
 =?us-ascii?Q?QWtZG+D9WIQ0UfVBKsb6mOLlvphn5Kq5HNGS4vi2WSllaH4n0vUyNRZKeiTr?=
 =?us-ascii?Q?pxaidoQY5vWqjPlgDSm+I+nbu2nqhrQ65G2YpM1nOrnaNrUUc8en17KSWAJs?=
 =?us-ascii?Q?7Sx4HAwXOeAdZcoAnLoUQOYgZkeTw4GMy7c+e5sLWl5/o8BNU2yZ0kByAEVF?=
 =?us-ascii?Q?Kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e0a88d9-2c87-4b48-cea9-08dcd7f626ac
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 15:25:39.1574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nw/+7JEl1YG1rdW43H1BYobxwvNJPwPaAmJpj1z+B+aXqi6i+ClCm60Ykc7ORvSwtmZYBmnqy72afgbHS/2cmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6816
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

On Wed, Sep 18, 2024 at 08:56:26AM +0100, Matthew Auld wrote:
> On 18/09/2024 06:44, Matthew Brost wrote:
> > Remove contention from GPU fault path for ASID->VM lookup.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_device.c       | 4 +---
> >   drivers/gpu/drm/xe/xe_device_types.h | 2 +-
> >   drivers/gpu/drm/xe/xe_gt_pagefault.c | 8 ++++----
> >   drivers/gpu/drm/xe/xe_vm.c           | 8 ++++----
> >   4 files changed, 10 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 4d3c794f134c..38eade07a004 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -335,9 +335,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
> >   	init_waitqueue_head(&xe->ufence_wq);
> > -	err = drmm_mutex_init(&xe->drm, &xe->usm.lock);
> > -	if (err)
> > -		goto err;
> > +	init_rwsem(&xe->usm.lock);
> >   	xa_init_flags(&xe->usm.asid_to_vm, XA_FLAGS_ALLOC);
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index c92df0a2423f..4507a5756a05 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -395,7 +395,7 @@ struct xe_device {
> >   		/** @usm.next_asid: next ASID, used to cyclical alloc asids */
> >   		u32 next_asid;
> >   		/** @usm.lock: protects UM state */
> > -		struct mutex lock;
> > +		struct rw_semaphore lock;
> >   	} usm;
> >   	/** @pinned: pinned BO state */
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > index 00af059a8971..5c3af2bb5402 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > @@ -198,13 +198,13 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
> >   		return -EFAULT;
> >   	/* ASID to VM */
> > -	mutex_lock(&xe->usm.lock);
> > +	down_read(&xe->usm.lock);
> >   	vm = xa_load(&xe->usm.asid_to_vm, pf->asid);
> >   	if (vm && xe_vm_in_fault_mode(vm))
> >   		xe_vm_get(vm);
> >   	else
> >   		vm = NULL;
> > -	mutex_unlock(&xe->usm.lock);
> > +	up_read(&xe->usm.lock);
> >   	if (!vm)
> >   		return -EINVAL;
> > @@ -549,11 +549,11 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
> >   		return -EINVAL;
> >   	/* ASID to VM */
> > -	mutex_lock(&xe->usm.lock);
> > +	down_read(&xe->usm.lock);
> >   	vm = xa_load(&xe->usm.asid_to_vm, acc->asid);
> >   	if (vm)
> >   		xe_vm_get(vm);
> > -	mutex_unlock(&xe->usm.lock);
> > +	up_read(&xe->usm.lock);
> >   	if (!vm || !xe_vm_in_fault_mode(vm))
> >   		return -EINVAL;
> 
> Looks like we potentially leak the vm here. Could maybe make this the same

Yep, noticed that too. Was going to do in follow up today.

Matt

> as above? Maybe even a small helper.
> 
> Anyway,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> 
> 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 7acd5fc9d032..a3d7cb7cfd22 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1613,7 +1613,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> >   	up_write(&vm->lock);
> > -	mutex_lock(&xe->usm.lock);
> > +	down_write(&xe->usm.lock);
> >   	if (vm->usm.asid) {
> >   		void *lookup;
> > @@ -1623,7 +1623,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> >   		lookup = xa_erase(&xe->usm.asid_to_vm, vm->usm.asid);
> >   		xe_assert(xe, lookup == vm);
> >   	}
> > -	mutex_unlock(&xe->usm.lock);
> > +	up_write(&xe->usm.lock);
> >   	for_each_tile(tile, xe, id)
> >   		xe_range_fence_tree_fini(&vm->rftree[id]);
> > @@ -1772,11 +1772,11 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
> >   		goto err_close_and_put;
> >   	if (xe->info.has_asid) {
> > -		mutex_lock(&xe->usm.lock);
> > +		down_write(&xe->usm.lock);
> >   		err = xa_alloc_cyclic(&xe->usm.asid_to_vm, &asid, vm,
> >   				      XA_LIMIT(1, XE_MAX_ASID - 1),
> >   				      &xe->usm.next_asid, GFP_KERNEL);
> > -		mutex_unlock(&xe->usm.lock);
> > +		up_write(&xe->usm.lock);
> >   		if (err < 0)
> >   			goto err_free_id;
