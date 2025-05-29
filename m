Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A58C5B543
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 23:36:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A2710E216;
	Thu, 29 May 2025 23:36:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O5reJKTc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A601510E216
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 23:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748561798; x=1780097798;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RrY8v0IwbAaxEqdVwJVBrxloC9Cll31tWG8njUKYo1M=;
 b=O5reJKTc3n0EUArUxbCo/mZlxwtC3/9sP+8+xdO7Wz65v5bsvdBLiEcf
 0V2H6YX+CbRWWLoIXPIY/IEiqIM7FfIuXmEEkXKuwqkr0ka5OOpT3cy+t
 A474Si484Z21bZni6zomtqXvf6EfD23GJ4dOwW9dqx2qEMz2z5Ak1XVNX
 5/GWJL8HEqkgnALVNslgZFSTB44El59D2I9gEQgJfjvJyYvs/wJ8D3G2G
 KvTZE5MaT7mtRGQ8tBaArIhJTnBGNjs7KFTL/Q+gzAu989NdXjRI1dzpo
 2i+KPd2yTo+4MZn5NKn9dUyo5Xz+bUKZbFiuGA6PLTgQ1uHBe1vfsiviL A==;
X-CSE-ConnectionGUID: zQ5pNWcSRPqRE47o4sKhYg==
X-CSE-MsgGUID: DlNTwc+yQRmV54u5mMh8Mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="49762708"
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; d="scan'208";a="49762708"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 16:36:33 -0700
X-CSE-ConnectionGUID: UKV8cgqxQC+arr7KeowJPA==
X-CSE-MsgGUID: eSz5pSBqQyqMF1WKBU+Itw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; d="scan'208";a="166883507"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 16:36:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 16:36:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 16:36:32 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.48)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 16:36:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rgz1NQptkQsY/DHpyCctnL3VDZC8HxLzTiygOzGVyOmmmkQcCoJ4H2dF2gVu9VCPs1Tbv3bk0xSaiek9TSOcHDhPqBHMqPRam3lej+kpIgR9VcRWwAQ2LisnJllONjVuMVtq8k1dvLeIOFSzUfra2SY0sopzb7WAVWYYEIL57X2K4tTpuhvWwspLBRahFUmGyN0OlZBv2oK+NSLGT6QU0o+UBzf7Q8TccjH/AEm9IXNpwU/BJOv0kHqhE+8V4BWNS8iHmmNrj++jeHr4I2RLbUnNodE8x3W9bRr8Qa57isapBDB0pvDgsvRmY4iPAucOs0BWXD2zPnZowI+fWSfdhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6j8cIQ2LeKCxKAjT17nX0zzOOjHN407dhBsHhtPDogs=;
 b=eLRW6xtYlEvJKrAyjuALPHIUleSg14tGas1/7M6kIbH34LuG+fpfJ/dPp0pTVxsM4G9wgP6AceNZd1SEnSxKgh7M+lDbqfMmZcSHVR5ey4iafDcC0Upvmp0gGgdHZ8sFHhLy50/IxkW+YDOvqz58/3tElGU7vzTfQWylYvByZeYMGTGUr/Ei4XS38OcuaKOGpIv2hDQaof/E8GIca9Y2HUM6w7MMAjZkD2dWrRRLpKbkPzEOal/jotuyBvkNHAO0rtvMkfedxIScDtFmyEqu1QSR+fd5DGbgIwfSa2LL7gkHhh9Ss9TPPJ3ccmuRuCMBq7JjtHju4l0jWdgqgqUWfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7819.namprd11.prod.outlook.com (2603:10b6:610:125::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Thu, 29 May
 2025 23:36:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.029; Thu, 29 May 2025
 23:36:29 +0000
Date: Thu, 29 May 2025 16:38:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 12/19] drm/xe/svm : Add svm ranges migration policy on
 atomic access
Message-ID: <aDjv2D4idRhGU0rS@lstrano-desk.jf.intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-13-himal.prasad.ghimiray@intel.com>
 <aDjtTXKvpuUdgSlT@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aDjtTXKvpuUdgSlT@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4P223CA0018.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: 932c44cd-8f55-444f-98fa-08dd9f09a2a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?t8TEsTqTM5cFJc3rqaQK7QsJS2L0TIhP4fft45vjnMG0l5102Bnxs6Pb3i6G?=
 =?us-ascii?Q?VBsSjwl0deIoLTQbWr21oWG0AfgyA5v18TK4MypC7XI4DeQeWabbdQtjDF8J?=
 =?us-ascii?Q?YzdAQ4rvXZEAdZrP9eo3Obq/+Mb9DbLIgcsZHXjMhB3TjwzqO13tUgJnpZ3b?=
 =?us-ascii?Q?3ImFYnWgYfu/TDdB7JZ6WXDVClKnQJTYGn+z9Xr+4YTFkT7DWnCAgyyOjXwp?=
 =?us-ascii?Q?fZPWuUbpxOGVAaV7mhG9C5FxYMPaWE6/uB/+DArN86lRL/EeuAgaTnkkCl0l?=
 =?us-ascii?Q?tvaZJ1djRl5FyEMMAfd91L5+MEkq+pgTNuhdF4POX9cu7ovCN/oA2QUPhvNG?=
 =?us-ascii?Q?LCde2s0KAVjbJkuKgiFNtKtqMsz6M1pFqc9Vl1+rdunXcmpzXx3ufrrQFbsJ?=
 =?us-ascii?Q?s9xfsSiggiYBgiK1YJFlx6TQoB056lsFMFt+v29a9mzsOLnOPLpC2TUJUksx?=
 =?us-ascii?Q?Bp0gpHAIhRGvCyL8cKz2RP6lfcNgaPQ0D5BCUbPNGsTWhDeJXhOHLEJlXft+?=
 =?us-ascii?Q?65eVd2Xz4SeM9kVEXYy/uJCJBS21O/1QCNg3VZEQNDK181Wn1/wwN6x0msAR?=
 =?us-ascii?Q?MigOo8e+G8NQRuNTYuXDfvIKYsVge29O3BBSDqgL1Md8D6lNM9+HPU4qBY9s?=
 =?us-ascii?Q?/Ixh9iIP/RYNDOuB7SXeinkvLSmUip06P9aX29dTZLdT6zewuOrdUVyEhPba?=
 =?us-ascii?Q?7JAYnOUZBnez8ogBuykhuaXwGAu0Sd0fv7CLtvMA2o5MEkD8qs+lprm84t0j?=
 =?us-ascii?Q?8/shgC88vzZOxBW4pvnvNYPQUUo32XxAx3TSsboyjp5nDE45sBd+m5Y0ivcg?=
 =?us-ascii?Q?KQTmRe8+sFdsA8RJPP5KAa2o3NZDpUzjipfzVeHV3A/5K1DsIlXv3ZfVgyIx?=
 =?us-ascii?Q?/uggugA1L3fSf9nBOTO0Zvj3cEz0twB4E34oxLPeIkQR+lRaGqwmRMm/GEc3?=
 =?us-ascii?Q?hP9VT311ki/Cp/3csxLj5uldQ2CuM5lgCBR6eayUIGCJEAsJbBLBSnBz9t1F?=
 =?us-ascii?Q?UACWUo/XbZiW2riy4DcLkPOI7jERwkjWOxZoU79/uw1xtfWNTpemPKWnD5MM?=
 =?us-ascii?Q?tSLmjAigO8osVIBqX4DghhuHozrlYpl9sTfZa9/X+PvX7zLWdpbydi8/f9Ay?=
 =?us-ascii?Q?D+cdxZ6v0FrIzl4JITOulj76b8lW9w6pmsKI20zJYj3MaEfputJ1s8amuI+y?=
 =?us-ascii?Q?7tLB+3iCHdKvyPtXGjlJ70xIt9JDuEk/VCDWp9rgvtR34eyO1RepxEAcaCHk?=
 =?us-ascii?Q?IGJFEevCW+p9uOVEga7h0TOekZjjyA/lCWmoykeoiHXZ1ZkmvKMxM0R4y7Gg?=
 =?us-ascii?Q?58KMNOK8y8RREqXqk4mpTKWfvqIDE7KRQ9ccA38+spOYECg9DQumsEslr48c?=
 =?us-ascii?Q?xUZJHU6IylYcUt3gBf0aZQQVi9/fhQxCnDw1BH7n2w8Xc1/BzisaCXgNB2Ci?=
 =?us-ascii?Q?dw9y/1/lDj8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sLkILPc9oxibseZhnMuH/PggaNagM1whttedQnFLRhYTdlHHGjMUUzj4V5fP?=
 =?us-ascii?Q?QjXRpFHmG7YFOCkMIcLi4LO7Ugm7p4uINRIO8J5m8egn+PcEb+LaI1E6J04v?=
 =?us-ascii?Q?8fjRufGmO1h/ppzMZFF4FIyNKwuDVJxZgcejTfTGcD0v8BEIR3Y7jhBb8Gph?=
 =?us-ascii?Q?dDfOMEVJ1Iu7Hn8m+byn2djkCNS3RL0NmC/WhONJFx45238TPPpuZcpZHZOS?=
 =?us-ascii?Q?XoNqN7yaC5nQkcXAFHRwERXFHVrR9ESywFhq+Cco28jYx639qCzF2Vp7sO1L?=
 =?us-ascii?Q?QMe1rhF06hLx+TYl3P+9CTkAZrPZNMEndUoqjfG+/OzF9YkKxMaxc8Esh4IB?=
 =?us-ascii?Q?sjNZVxfugU7XGAJODVpGLMFnipbc2eiJqlDr6Nrxbkr1udf6oxPwGij+RonP?=
 =?us-ascii?Q?QAOAYME6iLpNbsHcqN17Y6gf4B+O5obaH83CfU/Wl/oeuSz6Uz+gBmCRdRhm?=
 =?us-ascii?Q?wPno7QatAD9YIlDAGzfTXIA7f2aTTo/7LVX77GPz2m177ZnDQ/ZhEBZXj0t3?=
 =?us-ascii?Q?5eZajZBJZzzxvLwzkrv7+Vcgui5fB398/mCBu07tpzOkeAuzdu5UkBIXRmgq?=
 =?us-ascii?Q?41PUZTwKVJCKKlh2fF6GHBlERsuFMJzYV4UH3id4u/0M0rqj3757abLL992s?=
 =?us-ascii?Q?C+LlbpnthPjabSHAmACURHHXkhyrx4uneV82nTourlzU5iqf9woUiFWMb24Z?=
 =?us-ascii?Q?HmrOQv1ODDwYrqZZUF549MwDPgyS34ik4R1QjYRdJ6bBdim40L5RM6TlCFQb?=
 =?us-ascii?Q?+QexdSNtoHehDpuQezA8K+0zny3gf+UyldNksNYHlO4cudgCVCrEAi80h+U9?=
 =?us-ascii?Q?inPXG6kTmT0Oh+IPnBy5E+3gjWNM0ueYX1lmjbpW6zS4Ofe6mvtcE3075gnI?=
 =?us-ascii?Q?HRUhhZzwjNTzHh4/qZv7OVphyAKjrGVjw6TAxk8Z4EILGxR9UFuoJ1rvTBHO?=
 =?us-ascii?Q?2fZapLTbVs1fBY3RcetgY1kYGH/8MZw4NdYf17kvgvey6pgocOBU/m0q+FKR?=
 =?us-ascii?Q?LRp8TLUNwc/a+UdUqpTwBRYcXKSMusg0CZg04HBrSVQZ+aN4ET/SZPIJ7wuC?=
 =?us-ascii?Q?5EDlzi4oBBq26+fY9V6gguJ7kFI9hmHtI+hpIZdjApB5fURMvvJs0cRHZI06?=
 =?us-ascii?Q?KZFAYWW15d/jhvB0llvYDftVaNHGJHsU6qTnrA/mEbtEt0EdNXHRr6p2JOsp?=
 =?us-ascii?Q?WqmcwiNQ2KpdGSseIsCJS3cbxH5Rv6gtTJj4uaUWlH5RJ/1TYroIhGyBSFzO?=
 =?us-ascii?Q?Chnf+dlN3UGALH/mzM9xkuqNVy9K/MzfAmQr6XHZbGKbrrDPOqv+GGLsOTxk?=
 =?us-ascii?Q?i3JNnB8g1UbLnVK7lGTfjqo4Fd0SuKDDbEOMzN+DrW5dzTky1/DTeA3oqRXw?=
 =?us-ascii?Q?evpvoyZgX1IcManzcCHfitcgEKSFlaw5FQdTpJIpGGHpovIZrPKR3k10z/Tb?=
 =?us-ascii?Q?yRi0LdIJM//ks3JMX0I7vk81qExuBvCnJGh2bQVZ2n5zhXFt2PPhKCmUN/cL?=
 =?us-ascii?Q?LOK45Vew4tOjpHvXbsR41adqxiRPzbbksXgrU1EJ70WR1A1XYLmGL+U5Qckl?=
 =?us-ascii?Q?aCPXoLqXzp1jnYpSOOOToIKHGd2ewqG9aXmkLcDNMLWcGm7rPEOaj1rFHJna?=
 =?us-ascii?Q?Ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 932c44cd-8f55-444f-98fa-08dd9f09a2a0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 23:36:28.9951 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P3QccfC8PZ68YAPh0t6Pq8VRctzMAq1KEraT1iZBEmuKBaXmSr2HddOBBAbuvUrDLh/KAiHCjEjp11N2tAqwWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7819
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

On Thu, May 29, 2025 at 04:27:09PM -0700, Matthew Brost wrote:
> On Tue, May 27, 2025 at 10:09:56PM +0530, Himal Prasad Ghimiray wrote:
> > If the platform does not support atomic access on system memory, and the
> > ranges are in system memory, but the user requires atomic accesses on
> > the VMA, then migrate the ranges to VRAM. Apply this policy for prefetch
> > operations as well.
> > 
> > v2
> > - Drop unnecessary vm_dbg
> > 
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pt.c         |  9 +++++--
> >  drivers/gpu/drm/xe/xe_svm.c        |  4 +++-
> >  drivers/gpu/drm/xe/xe_vm.c         | 38 ++++++++++++++++++++++++++++--
> >  drivers/gpu/drm/xe/xe_vm.h         |  2 ++
> >  drivers/gpu/drm/xe/xe_vm_madvise.c | 10 +++++++-
> >  5 files changed, 57 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 39bc1964089e..ad17ded0ecaa 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -645,13 +645,18 @@ static bool xe_atomic_for_vram(struct xe_vm *vm)
> >  	return true;
> >  }
> >  
> > -static bool xe_atomic_for_system(struct xe_vm *vm, struct xe_bo *bo)
> > +static bool xe_atomic_for_system(struct xe_vm *vm,
> > +				 struct xe_bo *bo,
> > +				 struct xe_vma *vma)
> 
> You can get the BO from the VMA, so I'd drop the BO argument.
> 
> >  {
> >  	struct xe_device *xe = vm->xe;
> >  
> >  	if (!xe->info.has_device_atomics_on_smem)
> >  		return false;
> >  
> > +	if (vma->attr.atomic_access == DRM_XE_VMA_ATOMIC_DEVICE)
> > +		return true;
> > +
> >  	/*
> >  	 * If a SMEM+LMEM allocation is backed by SMEM, a device
> >  	 * atomics will cause a gpu page fault and which then
> > @@ -745,7 +750,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
> >  
> >  	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
> >  		xe_walk.default_vram_pte = xe_atomic_for_vram(vm) ? XE_USM_PPGTT_PTE_AE : 0;
> > -		xe_walk.default_system_pte = xe_atomic_for_system(vm, bo) ?
> > +		xe_walk.default_system_pte = xe_atomic_for_system(vm, bo, vma) ?
> >  			XE_USM_PPGTT_PTE_AE : 0;
> >  	}
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > index 5691bb9dbf26..743bb1f7d39c 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -771,6 +771,8 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
> >  	struct xe_vm *vm = range_to_vm(&range->base);
> >  	u64 range_size = xe_svm_range_size(range);
> >  
> > +	preferred_region_is_vram |=  xe_vma_need_vram_migrate_for_atomic(vm->xe, vma);
> > +
> 
> I'm not sure about this. Shouldn't we just set preferred_region_is_vram
> at the caller (prefered_vram || atomic fault) in the fault handler?
>

Let me fix this condition at the caller...

prefered_vram || (atomic fault && xe_vma_need_vram_migrate_for_atomic)

Matt

> >  	if (!range->base.flags.migrate_devmem || !preferred_region_is_vram)
> >  		return false;
> >  
> > @@ -812,7 +814,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> >  			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> >  		.check_pages_threshold = IS_DGFX(vm->xe) &&
> >  			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
> > -		.devmem_only = atomic && IS_DGFX(vm->xe) &&
> > +		.devmem_only = atomic && xe_vma_need_vram_migrate_for_atomic(vm->xe, vma) &&
> >  			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> >  		.timeslice_ms = atomic && IS_DGFX(vm->xe) &&
> >  			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ?
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 8208409485f6..e5fc2c2be8b2 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2930,13 +2930,22 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
> >  	ctx.read_only = xe_vma_read_only(vma);
> >  	ctx.devmem_possible = devmem_possible;
> >  	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
> > +	ctx.devmem_only = xe_vma_need_vram_migrate_for_atomic(vm->xe, vma) &&
> > +			  IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR);
> 
> I still wouldn't set devmem only for prefetch as I don't think we should
> fail the prefetch unless we absolutely have too. A fault will still fix
> up atomic faults that are in system memory if needed.
> 
> >  
> >  	/* TODO: Threading the migration */
> >  	xa_for_each(&op->prefetch_range.range, i, svm_range) {
> > -		if (!region)
> > +		bool needs_vram = xe_svm_range_needs_migrate_to_vram(svm_range, vma, region);
> > +
> > +		if (!needs_vram) {
> >  			xe_svm_range_migrate_to_smem(vm, svm_range);
> > +		} else if (needs_vram) {
> > +			/* If  migration is mandated by atomic attributes
> > +			 * in vma and prefetch region is smem force prefetch
> > +			 * in vram of root tile.
> > +			 */
> > +			region = region ? region : 1;
> >
> 
> I don't this logic needs to change until we have preferred location is
> implemented. I don't think the atomic mode has any bearing on prefetch.
>  
> > -		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
> >  			tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
> >  			err = xe_svm_alloc_vram(vm, tile, svm_range, &ctx);
> >  			if (err) {
> > @@ -4178,6 +4187,31 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
> >  	kvfree(snap);
> >  }
> >  
> > +/**
> > + * xe_vma_need_vram_migrate_for_atomic - Check if VMA needs VRAM migration for atomic operations
> > + * @xe: Pointer to the XE device structure
> > + * @vma: Pointer to the virtual memory area (VMA) structure
> > + *
> > + * This function determines whether the given VMA needs to be migrated to
> > + * VRAM in order to do atomic GPU operation.
> > + *
> > + * Return: true if migration to VRAM is required, false otherwise.
> > + */
> > +bool xe_vma_need_vram_migrate_for_atomic(struct xe_device *xe, struct xe_vma *vma)
> > +{
> > +	/* Note: The checks implemented here are platform-specific. For instance,
> > +	 * on a device supporting CXL atomics, these would ideally work universally
> > +	 * without additional handling.
> > +	 */
> > +	if (!IS_DGFX(xe) || vma->attr.atomic_access == DRM_XE_VMA_ATOMIC_UNDEFINED ||
> 
> I think DRM_XE_VMA_ATOMIC_UNDEFINED is same as GLOBAL, right? Isn't that
> the default? Or global the default? We have been told whatever the
> default is, just has to work for SVM so maybe set to GLOBAL by default?
> 
> > +	    vma->attr.atomic_access == DRM_XE_VMA_ATOMIC_CPU ||
> > +	    (xe->info.has_device_atomics_on_smem &&
> > +	     vma->attr.atomic_access == DRM_XE_VMA_ATOMIC_DEVICE))
> > +		return false;
> > +
> > +	return true;
> > +}
> > +
> >  /**
> >   * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
> >   * @vm: Pointer to the xe_vm structure
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > index 8151b1b01a13..edd6ffd7c3ac 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -171,6 +171,8 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
> >  
> >  struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr);
> >  
> > +bool xe_vma_need_vram_migrate_for_atomic(struct xe_device *xe, struct xe_vma *vma);
> > +
> >  int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > index f7edefe5f6cf..084719660401 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > @@ -69,7 +69,15 @@ static int madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
> >  			  struct xe_vma **vmas, int num_vmas,
> >  			  struct drm_xe_madvise_ops ops)
> >  {
> > -	/* Implementation pending */
> > +	int i;
> > +
> > +	xe_assert(vm->xe, ops.type == DRM_XE_VMA_ATTR_ATOMIC);
> > +	xe_assert(vm->xe, ops.atomic.val > DRM_XE_VMA_ATOMIC_UNDEFINED &&
> 
> >= DRM_XE_VMA_ATOMIC_UNDEFINED, right?
> 
> Also santize this input before here as discussed in patch 19 and 10.
> 
> Matt
> 
> > +		  ops.atomic.val <= DRM_XE_VMA_ATOMIC_CPU);
> > +
> > +	for (i = 0; i < num_vmas; i++)
> > +		vmas[i]->attr.atomic_access = ops.atomic.val;
> > +	/*TODO: handle bo backed vmas */
> >  	return 0;
> >  }
> >  
> > -- 
> > 2.34.1
> > 
