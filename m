Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB8DD75BB9
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 05:36:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE09B10E068;
	Thu, 21 Nov 2024 05:36:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QVxJH3SJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD8210E068
 for <Intel-Xe@lists.freedesktop.org>; Thu, 21 Nov 2024 05:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732167389; x=1763703389;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=z8uy/I4M3xq5QdjokXbfQqx89CB11xUVZq/9amBKNzE=;
 b=QVxJH3SJfqEkQ7k52vKsES+IPtXSV2aTpNNOd4cIjA87SBYwrrmKZknx
 YrOPU7V4It6aEKffk7oKY4W2m7Lc5W7fm1f6w8iPXE7NZndps1wrq3AeG
 3WmtJWSGFH+CNZhfmwzstr6m3Dssys673qgThQHCToUYpFIL9PDA280Xb
 3Bi32vmuQ6qcsWozGR/WcoU7PHHiayB+v1NompGV5fHVoZGblS57GegzJ
 dQhlYgRwiOaDo6zm9GXpnoIsVo0OaqIBXEt0KxNo+GyvPC6pft1vY8Sb5
 b0UfOWydTFVMpEb5j6mkPxzVU/2KZXGMl5nSeOtYFnH8armNMLINvNsWP Q==;
X-CSE-ConnectionGUID: UR5RcyGDQ4CEHHtYcjDTaQ==
X-CSE-MsgGUID: BrqzukuQTuSyxMpZ5elEvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="35924842"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="35924842"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 21:36:28 -0800
X-CSE-ConnectionGUID: 1Mouy769TeeSuxxbtHYFpw==
X-CSE-MsgGUID: 1Fc01uQ5T4qxmYVBoljbpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="90532634"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2024 21:36:27 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 20 Nov 2024 21:36:27 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 20 Nov 2024 21:36:27 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 20 Nov 2024 21:36:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IqKuAbpSSyeelBjp0cGMpAjFj7fN205WEJbmCJueoIv+r968ItZJpaWaOkbiXlXP6lxOAt0UJf9SVTaSDD7m0WZlsH7HRGzaNcEW2HDGeJaYa1k6Kh0PdGz5RcqXx9zQY8Qi44gfWjtdooZ9PSuQna8SdrAFujF5WcuyAgW007cjiKyzfUKlk+hx4x/ofoenzaTCirNhWCPsEu3aHpKOUbDwmX9/CbSWCEAZre1ewt4DUVJ1PMMkBZZAOI1z6RLBUVPfJNk4+SRz6VKU3Yl3k//ktvF4hxem28vEMpjRuMQASZdcT78a32WGuViedF3Nt5NR8XvZZLMEgkODWTnAIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DkEvqQzSm7PphLJZzFfD9Ac6AyB4g9pWMWBDesDViJA=;
 b=ve2SE6W0fso6kmlQcNbfSfPwn4mMkNzM2oYmIWNIB9KEJESKzQygJRRGY9OOjB2+pu9/9IFGcok3IrItrFtnBvHa99FGFYJoGtqj0tt2CP+OLnz7WYBCxh4Yl/Q4eaxY7z1kS0f2YjMKeSHPqpQlWh+LCFdT2tO17hniy5P73+PSCUzqXRZ1K2QiVEA0ezu9mG9uwowOTEZMQmBajj8kMNIr5lvQIDLCDnDVS0yPhVt1zrYXFelRjYf9FrfhM6ijGc+FeGgJCUp7bnRKfGThTChcHAqwKvdLNCVozm/e4+/bNgcsdK2QeitwhMeKbbN7+bd6mtcshImA3dH6frAItA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4540.namprd11.prod.outlook.com (2603:10b6:303:56::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Thu, 21 Nov
 2024 05:36:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 05:36:16 +0000
Date: Wed, 20 Nov 2024 21:36:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: Add a reason string to the devcoredump
Message-ID: <Zz7G9MKChzMefclb@lstrano-desk.jf.intel.com>
References: <20241120232257.1025282-1-John.C.Harrison@Intel.com>
 <20241120232257.1025282-2-John.C.Harrison@Intel.com>
 <Zz6rNo0s6y5W0Hrp@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zz6rNo0s6y5W0Hrp@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0118.namprd03.prod.outlook.com
 (2603:10b6:303:b7::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4540:EE_
X-MS-Office365-Filtering-Correlation-Id: 1de32aae-6878-43db-1f6d-08dd09ee6b44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0VJY2LOIWhYacqcMpdxJtHiN6GplziF9aoa8gjacdJOd9dozDRjemd7ngrMQ?=
 =?us-ascii?Q?0K9ITjxFg/BMYOY3Csr5NXEPaIlqezg58XpNmwslgEPzYhLzrfLrNnkhVexj?=
 =?us-ascii?Q?6f2cWLdPJsOgFblo0vlkRvhAGsw/X8xaJcw5+Vy45rG//HxBI/bLmgYym1r0?=
 =?us-ascii?Q?5RKhiUwzJ5moN+Jlebt8FGMDzHumEAB2Jl7o17Kq7EjWmtXCvfwQWc25FNFY?=
 =?us-ascii?Q?/JUv4CO7reqvBxlcItTIu6s8kv7S6N5zhP2m4/Ms2/h6EfTmtvsPEBp5xCLk?=
 =?us-ascii?Q?ER+FJ3zsjDjATzGiLe/WXE3mgBDuQQbW7oN24reLzija4f24zzI+X8RSqJz3?=
 =?us-ascii?Q?x/IhiAHiknJhzB/HoGDdTkR5NVgWG67phKRqexm0Vl4zoDtDOh7+68uAba9C?=
 =?us-ascii?Q?4tA1I23DivU51t3v4eap1DWFXMiAuoUS+ajc0ypE3A0NjWoXvhG+eN9aDwXk?=
 =?us-ascii?Q?NXZe7OVtNO84+McOwI2o7Q9rTr60KVQD68u0MpAnWJIR3kqe8x7olW2+o+qp?=
 =?us-ascii?Q?2ryaOTwu2RfP8Tk438wfBQAJ3kbsU89dWEPODU9u9Qf3NoC4fHyy5zyDHODE?=
 =?us-ascii?Q?0Rel6r8QRTLiAlAbwYkJ++d9wCwWpfJNYI/Lz+Dl24DJXXmP1rBJWqVMMhEk?=
 =?us-ascii?Q?0t4yXYvIUa742507AcUN2UmRKRdrTJrD7sJetZN8PU9vyn9WbueLOmU5X3qu?=
 =?us-ascii?Q?/h7ixB5osBckB9fkZ2yT9ek57Br1x4gxj+RoR9DhCK7GoWuTBtXeOxRphYsf?=
 =?us-ascii?Q?Z9nEJHhp5V7Ex6td7kPhKmuDBbpr3AFXPeixmKmt9j2T2NCAkimaYnXQbblT?=
 =?us-ascii?Q?wjwIkMx/pB7GnShFcfZX8axr7vi8xbV3Gl0ODathUVC6GxuVsV4Z3tMMLbBg?=
 =?us-ascii?Q?njhwWToJjouBf5GBsH+2zDENmas6vMNty1+Cg86a9mkjcddSSlSirLRig/WQ?=
 =?us-ascii?Q?mGtNmPKm6PA5iW5HzcO1wvWNqBB1vZo+4R3vzu/0U7Q0chVkaemKoP9kP79V?=
 =?us-ascii?Q?xZsQsXTrikMezwAKat3nvBBp3MKgaDVAxACy29O3eowaG4Whs6ljhD6N0lbY?=
 =?us-ascii?Q?gxwofIew1kH0+QDiC46n7QqIcr2VusLlwkmFoXGctEP7iB4x6vNs/RKVm2Fy?=
 =?us-ascii?Q?iknUY/9IBG+O0zdYeQXM3UBoQ+zoc2k3pkYAZC542TMZh6V9tXHb/PMti4ps?=
 =?us-ascii?Q?cnXUjCqbkQ7+kNMbK6sizNmYAhM3LDhlZiCM8Wyfl5c+Z1XUbhN0jxb68+LF?=
 =?us-ascii?Q?jS0/RU1NyW3Kvm6CQNyJJkV6nsWP+C9LZMqOz0EDKIb2bauP53ZS72C3LJfG?=
 =?us-ascii?Q?BPOkRpd76tUM0NaBGPRdOfyl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cNhU7D99mF6ro8Lq0v967Huini6eF2RKPiapJPMfjJ1HINKwbIuPC2nmXMOj?=
 =?us-ascii?Q?GO7giE754BAmB1a45MV/EVjrFQwmT583u6hXCI4XF4OJ1hC3nlbNa221B5p+?=
 =?us-ascii?Q?oX8zjNj3R8fTeezxXZU1Pz88cqv2ha0OjimjJpuXJcM9Fe2g+4K9sIuuwKTS?=
 =?us-ascii?Q?EMuSHZi9X93xovo3Dsagd8+RPzUcqzgeWaCRIzXPI6ZHwZ9tTZZgdmaafe6I?=
 =?us-ascii?Q?mGy9FnCTVkauSJmlxMfoStxjNLYcoOQqaNmngVC3dfSI15zL1C7SHr0lVYoI?=
 =?us-ascii?Q?31lRbg83Z6phpxS5x4m9ZSV9pjItk/pcCVANCTxtRwHG/fwF4ueyLSxY+9Mb?=
 =?us-ascii?Q?5sQVzqgLmSNaGFJswYhFVAxnpjw8dqqDF+RaesEFwaLMrHKhCRJC3kgXOE7v?=
 =?us-ascii?Q?O1+YOWhujwtdHupz+BKcyCXXkjxfnEHQfJ1qPJSlxw8peeDlEvEnQXWX8sfv?=
 =?us-ascii?Q?Mamifbp2RMG0ll7SNWB2kQvccff89PagHDuxSFfKwVeU3Be9VB+8/+xrNGd+?=
 =?us-ascii?Q?iHhbT1BOE5R/AEMFhE64PT+42v0RDD7tX6cUKxtNL5Ubk6+IOUg6vGr8RpxF?=
 =?us-ascii?Q?Hl/BDmU5D2NUDRRv7XsMHlCuW0HDgqHY3ouxdZJSihxa7ESIYuk/kdWA3WKk?=
 =?us-ascii?Q?YlnSKGzTf/XPlJP38Tbz7x4ZFDJkmeB9YF2hVhXJJO4cLGl2PkONL+ezM+wx?=
 =?us-ascii?Q?XLlYINc6tdHGhHUvPk2q0rGzZghR7ypyEn0e+AZTekBDYhXy2bbSpWgmpabY?=
 =?us-ascii?Q?ncNOxE5u3ERvloKu05usyV3Ky8GnjW+tJUbF+a6TEFxaPIOyx1+6WpGOzG6m?=
 =?us-ascii?Q?q5v1E1JSM+mJzoc6wzdGQynS+hMAK/ReXzPjorW5gqZuarEk3xmU9jeJ+8lr?=
 =?us-ascii?Q?JFEqlod1aSc7Kf1w47aTlqr09lcxej+7VfWfbCwn+KXSknQAQOjYVPw75mQk?=
 =?us-ascii?Q?xEWm/O/R5f3XO1El6KkFvq4DxEJLo9SOCp+p2EcmMsAu5GZbZR/3AdA1sRTD?=
 =?us-ascii?Q?4GGObBLdOrCvRSLZyJHEKvz+a/DOM8ZkObIN/+Ay4iB4I0JHQ6yDUbHoeJ7g?=
 =?us-ascii?Q?bgibqQcf6UPJs2ydm/4HAGnBaXGfzabP8gxJDvBp6ZfyThtzCNZ3ZJCipKOz?=
 =?us-ascii?Q?9eDCJx+40yueyO1+3ur9HXxniCcHlfsQH58nAYcMpFpcooOpsc5L92OpNIDS?=
 =?us-ascii?Q?i9J5yryELZY58BlTcVRmnUUjwU7/NuqeX+FFHmdibzPHsuEb8Ma3500o9q9f?=
 =?us-ascii?Q?4r7r7YeweeBAuRMFUREJlx5haWRKBi52jMaKoi9jiBH8GwlDprjtfF+3s5qF?=
 =?us-ascii?Q?an1efsgyb9W/H5se8p19dd0UA84QlgOCqveu6igg2OCrgxYg47ZYCREiQf05?=
 =?us-ascii?Q?Ri/V0jGfFUj/HrUfhLavaDO6epKK9le0v1ZGYGu41ivtSugIfPM1PBiSPDqT?=
 =?us-ascii?Q?W4WnPmD+PxvjROxFuMVbV8zOFK3YyHJLoO0E9+RzXOJRA2C6YQJ4UIwOzxh/?=
 =?us-ascii?Q?Soq2Ks3ojFo3gmM1EtKaB3csMGj/7YbwAim/L7+X017X7ajuaKt40cn+tNG+?=
 =?us-ascii?Q?CmSTs28OqlETi7GPLSYcdvAtCCSQTC1jowPuTV0PLjEECtGhdV8qYiSZ3y3y?=
 =?us-ascii?Q?MA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1de32aae-6878-43db-1f6d-08dd09ee6b44
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 05:36:16.4304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YIMaS9lAzRlrh6QhAnxD+umLFOf/HRlpj3NNliQjUPCQL7yo+GScfsq0SUjctQXwAcD7NytEEpZKQUZYygiMQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4540
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

On Wed, Nov 20, 2024 at 07:38:30PM -0800, Matthew Brost wrote:
> On Wed, Nov 20, 2024 at 03:22:56PM -0800, John.C.Harrison@Intel.com wrote:
> > From: John Harrison <John.C.Harrison@Intel.com>
> > 
> > There are debug level prints giving more information about the cause
> > of the hang immediately before core dumps are created. However, not
> > everyone has debug level prints enabled or saves the dmesg log at all.
> > So include that information in the dump file itself. Also, at least
> > one of those prints included the pid as well as the process name. So
> > include that in the capture too.
> > 
> 
> This looks helpful.
> 
> A couple of nits below.
> 
> > Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_devcoredump.c       | 20 +++++++++++++++++---
> >  drivers/gpu/drm/xe/xe_devcoredump.h       |  5 +++--
> >  drivers/gpu/drm/xe/xe_devcoredump_types.h |  4 ++++
> >  drivers/gpu/drm/xe/xe_guc_submit.c        | 14 ++++++++++----
> >  4 files changed, 34 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> > index 0e5edf14a241..b5aebe8fb06d 100644
> > --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > @@ -99,6 +99,7 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
> >  	p = drm_coredump_printer(&iter);
> >  
> >  	drm_puts(&p, "**** Xe Device Coredump ****\n");
> > +	drm_printf(&p, "Reason: %s\n", ss->reason);
> >  	drm_puts(&p, "kernel: " UTS_RELEASE "\n");
> >  	drm_puts(&p, "module: " KBUILD_MODNAME "\n");
> >  
> > @@ -106,7 +107,7 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
> >  	drm_printf(&p, "Snapshot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
> >  	ts = ktime_to_timespec64(ss->boot_time);
> >  	drm_printf(&p, "Uptime: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
> > -	drm_printf(&p, "Process: %s\n", ss->process_name);
> > +	drm_printf(&p, "Process: %s [%d]\n", ss->process_name, ss->pid);
> >  	xe_device_snapshot_print(xe, &p);
> >  
> >  	drm_printf(&p, "\n**** GT #%d ****\n", ss->gt->info.id);
> > @@ -138,6 +139,9 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
> >  {
> >  	int i;
> >  
> > +	kvfree(ss->reason);
> 
> Do we need kvalloc / kvfree here? Seems like this would be small in size.
> 
> > +	ss->reason = NULL;
> > +
> >  	xe_guc_log_snapshot_free(ss->guc.log);
> >  	ss->guc.log = NULL;
> >  
> > @@ -253,8 +257,11 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
> >  	ss->snapshot_time = ktime_get_real();
> >  	ss->boot_time = ktime_get_boottime();
> >  
> > -	if (q->vm && q->vm->xef)
> > +	if (q->vm && q->vm->xef) {
> >  		process_name = q->vm->xef->process_name;
> > +		ss->pid = q->vm->xef->pid;
> > +	}
> > +
> >  	strscpy(ss->process_name, process_name);
> >  
> >  	ss->gt = q->gt;
> > @@ -297,10 +304,12 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
> >   * gt_reset. It is skipped if we still have the core dump device available
> >   * with the information of the 'first' snapshot.
> >   */
> 
> Seems like kernel doc should be updated.
> 
> > -void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job)
> > +__printf(3, 4)
> > +void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const char *fmt, ...)
> >  {
> >  	struct xe_device *xe = gt_to_xe(q->gt);
> >  	struct xe_devcoredump *coredump = &xe->devcoredump;
> > +	va_list varg;
> >  
> >  	if (coredump->captured) {
> >  		drm_dbg(&xe->drm, "Multiple hangs are occurring, but only the first snapshot was taken\n");
> > @@ -308,6 +317,11 @@ void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job)
> >  	}
> >  
> >  	coredump->captured = true;
> > +
> > +	va_start(varg, fmt);
> > +	coredump->snapshot.reason = kvasprintf(GFP_KERNEL, fmt, varg);
> 
> See above. Off the top my head idk if there is a non-kv* version of this
> function but if there is, maybe use that.

Ok, scratch this comment. I do see these functions defined:

__printf(2, 3) __malloc char *kasprintf(gfp_t gfp, const char *fmt, ...);
__printf(2, 0) __malloc char *kvasprintf(gfp_t gfp, const char *fmt, va_list args);

The former call doesn't work here as va_start is only safe to call once
in a call chain [1]. The former internally needs to call va_start again.
Unsure why this seemly equivalent functions have different signatures
but I think your usage here is correct.

Matt

[1] https://stackoverflow.com/questions/59608636/can-we-call-va-start-twice-without-calling-va-end-in-between

> 
> Nits aside, LGTM:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 
> > +	va_end(varg);
> > +
> >  	devcoredump_snapshot(coredump, q, job);
> >  
> >  	drm_info(&xe->drm, "Xe device coredump has been created\n");
> > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h b/drivers/gpu/drm/xe/xe_devcoredump.h
> > index c04a534e3384..6a17e6d60102 100644
> > --- a/drivers/gpu/drm/xe/xe_devcoredump.h
> > +++ b/drivers/gpu/drm/xe/xe_devcoredump.h
> > @@ -14,11 +14,12 @@ struct xe_exec_queue;
> >  struct xe_sched_job;
> >  
> >  #ifdef CONFIG_DEV_COREDUMP
> > -void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job);
> > +void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const char *fmt, ...);
> >  int xe_devcoredump_init(struct xe_device *xe);
> >  #else
> >  static inline void xe_devcoredump(struct xe_exec_queue *q,
> > -				  struct xe_sched_job *job)
> > +				  struct xe_sched_job *job,
> > +				  const char *fmt, ...)
> >  {
> >  }
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > index be4d59ea9ac8..e6234e887102 100644
> > --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > @@ -28,6 +28,10 @@ struct xe_devcoredump_snapshot {
> >  	ktime_t boot_time;
> >  	/** @process_name: Name of process that triggered this gpu hang */
> >  	char process_name[TASK_COMM_LEN];
> > +	/** @pid: Process id of process that triggered this gpu hang */
> > +	pid_t pid;
> > +	/** @reason: The reason the coredump was triggered */
> > +	char *reason;
> >  
> >  	/** @gt: Affected GT, used by forcewake for delayed capture */
> >  	struct xe_gt *gt;
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index e132294fde51..7d0e7cb977ad 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -898,7 +898,8 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> >  		if (!ret) {
> >  			xe_gt_warn(q->gt, "Schedule disable failed to respond, guc_id=%d\n",
> >  				   q->guc->id);
> > -			xe_devcoredump(q, NULL);
> > +			xe_devcoredump(q, NULL, "Schedule disable failed to respond, guc_id=%d\n",
> > +				       q->guc->id);
> >  			xe_sched_submission_start(sched);
> >  			xe_gt_reset_async(q->gt);
> >  			return;
> > @@ -906,7 +907,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> >  	}
> >  
> >  	if (!exec_queue_killed(q) && !xe_lrc_ring_is_idle(q->lrc[0]))
> > -		xe_devcoredump(q, NULL);
> > +		xe_devcoredump(q, NULL, "LR job cleanup, guc_id=%d", q->guc->id);
> >  
> >  	xe_sched_submission_start(sched);
> >  }
> > @@ -1132,7 +1133,9 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >  				xe_gt_warn(guc_to_gt(guc),
> >  					   "Schedule disable failed to respond, guc_id=%d",
> >  					   q->guc->id);
> > -			xe_devcoredump(q, job);
> > +			xe_devcoredump(q, job,
> > +				       "Schedule disable failed to respond, guc_id=%d, ret=%d, guc_read=%d",
> > +				       q->guc->id, ret, xe_guc_read_stopped(guc));
> >  			set_exec_queue_extra_ref(q);
> >  			xe_exec_queue_get(q);	/* GT reset owns this */
> >  			set_exec_queue_banned(q);
> > @@ -1162,7 +1165,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >  	trace_xe_sched_job_timedout(job);
> >  
> >  	if (!exec_queue_killed(q))
> > -		xe_devcoredump(q, job);
> > +		xe_devcoredump(q, job,
> > +			       "Timedout job - seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
> > +			       xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> > +			       q->guc->id, q->flags);
> >  
> >  	/*
> >  	 * Kernel jobs should never fail, nor should VM jobs if they do
> > -- 
> > 2.47.0
> > 
