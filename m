Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5EBD3A665
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 14:56:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4129B10E67E;
	Tue, 29 Oct 2024 14:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U29ShCKV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C651310E67E
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 14:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730213761; x=1761749761;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=I/rU1gD6BK2+GiPoIxB+nqch+Ba02GvPXYd+1OWWxqs=;
 b=U29ShCKVih8nk5Q33zEL96IpfDPjz0B9JvEKyZfpSXAD6IWDdTdXrvYQ
 rHCpvIY0ySP+DVUrW9I4RjezL1FLiXA2ABcZ+YC98pBoU//y4O6Fxy1/B
 g652LAJsNStdCMrCLJTv5R4Y+5z2O0Y+LFCbpVSh3UG/x13vOyrgDVBLF
 BhFXrZ2ekf14AVa5PuPcdS+SHojYak+ei1tL7y6aNiF0lbzrGhO7vdXB8
 4GtitMi4ef/m9dj7+FmebL1quO9lgsjlLPhImgM7kVxhA6ESSfqrczMO/
 Bv7rXKZ5itX+bGTAfXI4bEcsOBtny+VdmkcJefV49mJKeiG2TxWiNLC5h Q==;
X-CSE-ConnectionGUID: Evp6q9hYQWqX+X2bJyOQmw==
X-CSE-MsgGUID: +H3OVjXrQZq4y+2Pfpgv8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="30067957"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="30067957"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 07:56:00 -0700
X-CSE-ConnectionGUID: 9tA9HESkRZmh5IWPGeieLg==
X-CSE-MsgGUID: pNbOIF1iSheGY3H3hYrhQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="105315690"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Oct 2024 07:56:00 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 29 Oct 2024 07:55:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 29 Oct 2024 07:55:59 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 29 Oct 2024 07:55:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jfiifYRV0GipcPxXDVqy098ehtpyi8dLZHVvM+okPWKRzbp33/2YC/ynzolF3Qv8TD2Ky6Gw1L0/Dr1NQJFp/AoHfDgM5wKGsVSLpZy8pAmgKVGPQARy2g8TvMq44g5bWlt5PhDQq16fWbz9SNXJjSvOGDPqovvf+4VNlYto9o14/K4xJOHqXL90s8f80vvfmfKGi4M8zVDKCIrPQxkljLizlK0LvucwrBPXTZw63lL4zNuCwL2hr7k4kexZoD1PhkwWZ1YKWWLJxmRwl82pYcvJyrE+19eaXRD4+4hNDOsIAJyUkYuHkNC5Wt0/LnffmKt4wpuOzFhYRpjkMpiOUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6M4JDhvbw3qWKq1+S3L97z+xxZJj/l73if+ihv0TNOQ=;
 b=xpAD6+CU5iBkxMtQFJtDLR1MvOZBpT+exOuTPo5RshSTc+cwLBbAmccKldul/KrIhuo6HH/94KLe+73mPZx86CoIsCkKg3RMTxSSOsgaMd/rxhBHdbI02ASUhCeKt4pZiKKFgx0wFRa6S5eze139JxyaKFfWXMGDherzu8Zp0c9kt8wI2Brb6vSOs6JWo7CBBpGTHAW+cQOoaqZJzC4AR0aOZ2THXUGoIg5Tw+EoN5EFXBIS9GL1BbzNBpOQ8FABAYT7xG0JLUGX9CDq8rGdxpjndOKkpymyo/N/d8oxKALqUQ4jxI6cUez4fxC7NDbWi1RGvC2wf2At4OWvB5LAug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6537.namprd11.prod.outlook.com (2603:10b6:208:3a3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Tue, 29 Oct
 2024 14:55:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8093.025; Tue, 29 Oct 2024
 14:55:53 +0000
Date: Tue, 29 Oct 2024 14:55:11 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <umesh.nerlige.ramappa@intel.com>,
 <riana.tauro@intel.com>
Subject: Re: [PATCH 1/3] drm/xe: Add XE_BO_FLAG_PINNED_WONTNEED
Message-ID: <ZyD3T8pU8Q8H4k8k@DUT025-TGLU.fm.intel.com>
References: <20241029003224.2257439-1-matthew.brost@intel.com>
 <20241029003224.2257439-2-matthew.brost@intel.com>
 <ZyDjiuhhGqSPLEl_@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZyDjiuhhGqSPLEl_@intel.com>
X-ClientProxiedBy: BYAPR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:40::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6537:EE_
X-MS-Office365-Filtering-Correlation-Id: 511a1dc2-9c30-4fda-e414-08dcf829c935
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SQRGuR56lNwKIOucLNOrlgZtMvSyLxLfyJX95F68rOk7rz/RZdgyY7qA3X7x?=
 =?us-ascii?Q?l2mXUkGpZNZM63FMwmg+obr+dqtEyJz9D0ZNOExm09mgs3ypnxPMWFDNjeqj?=
 =?us-ascii?Q?hpMujvzLBeZwwiX1g6QImgdHp8jEUfGrZK6jrT89eeGLT2QRl/ozAKa72Fgq?=
 =?us-ascii?Q?LSAEJDZPmT1Av41OSkDyZLBsh3gqkdeG3HcLtDsxONTcoRrO5/pLBwWxSJlj?=
 =?us-ascii?Q?tNByIz+56fsSpCbmCcuy+AVcXzDvEzDfaX1vqyPR0dcocjQOG1eOvH68xw3h?=
 =?us-ascii?Q?9n/5S+i31lQr4uP1y4Y4lCa50Wl2L8j0iz0MPeiogFhxaOt/vMnCNcd7MRbG?=
 =?us-ascii?Q?IghwEakf3gEbkDj/9lyAHJ3V8VrrQH4OfjLWroTAn0UMKQH6Q1GRC8U4s/so?=
 =?us-ascii?Q?aQTUwjT7++p/s7ULP+cDMmIzruQ9fOmsksRxFGMCU3fKrTe2qH/YsluA0ikQ?=
 =?us-ascii?Q?z93i+1R8HXUDU+kx/s50n1G/4wDZbTgOOdRM0PwfKeisZHrcI9nQwvhftjM0?=
 =?us-ascii?Q?7GRYFmW6zjVC4wqQXZjttyCz/30gPcI6tjWPkn/565zUHqCLAjNh+wbRbkAO?=
 =?us-ascii?Q?++EfeFtAo9IETt71Nk0WkBIj4ZvR98yYdEPn5s7xNH8mns4IH45Z4m1MQaaB?=
 =?us-ascii?Q?Mao6Gwsj7ZRFXSm7a/zhETSuDdT6BAOXhB6q6/dyanBD/EwgqSXu7NIJK2m9?=
 =?us-ascii?Q?mbBJh027xPiV4GzxzncM6kLwbiAO77OUDbajf00YEU0Q7Bes8lSt0sWNaWAx?=
 =?us-ascii?Q?vqrkdLS2Vbxdak5qSva/a8J9eAclrs4E/oEG+xtY8WgLjYrHL+OPyMwfOvZY?=
 =?us-ascii?Q?unSVBemdpjNrh28Fk1kWx3faF5MG9HgwYZpR5bmBmNfW4h6NYqt6fBh1R57v?=
 =?us-ascii?Q?CPgpENpzmHOuMqq++0kIZu7je/SnEesZ4KWONcoDX1WZOq2+th26E9649F/S?=
 =?us-ascii?Q?VOzOqCRV7WeyXyZg+0IhYNu+NRkg8e+bs5zzEaJ0o79Kvl03cW6eD1YvQ9JH?=
 =?us-ascii?Q?vJ9A8ko7mI2XEBvMsiv0F6PQgBmc02s0qYmcKofWxuwN+cksvvNTguY3JL10?=
 =?us-ascii?Q?2y+AcFlVvCAeqnVHNkW8TPxQgC6I5W9YK2ajVZFTeNAKo4f/d810trhY2RKl?=
 =?us-ascii?Q?76d0lVcLyjiXcT6CpY4XrWgY/i15Yh2QqSPjEU7KRwzxzZYMHGr8xqoSSqvV?=
 =?us-ascii?Q?LSGLe3AOzUa3pfBLqLXooOrWO94XFPDkFVf4tLAy7xvNmg7b7A490X566MQM?=
 =?us-ascii?Q?UEFeQlnjga9XjT8v8/dGrIgmmlrS7Ya0GpIYx4VqdOMRYA4x5iJfQDU1U0BI?=
 =?us-ascii?Q?yZFGtxXPw56Irl+WZ0Ac7vPK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B6A4uZibUa0fUMVQgtw0c6iWjZL/e5hWZ6DRoOwfJyJ+Qt7Snh1dV18rVgUU?=
 =?us-ascii?Q?iTRqaHYaCatHJ8rG2Y8VcI6warrHact6NqGa/LLODFiCbKGlCE7wS+SkKfC2?=
 =?us-ascii?Q?kcuC1ZDf/hVWQ9aWfBwa4Ol9DNLBVYWvwqhSJOoszAnu8NhoBugtrzNduLVF?=
 =?us-ascii?Q?sq5iIxVKquiSUGbfnJx8KdtG1wE9bJDEs8bItyYkNWLgDEcDkbzd/b3sr6Hl?=
 =?us-ascii?Q?4UkIqoFRwGe89a0TFQ8Z0dslNc8+tGa/XKJC6RIePBf0Hd0pARwoI0W+zp/M?=
 =?us-ascii?Q?f0DNvN/jhKGQeJz6Wq4zpYjIY2QK/HVIi6AjZ2LqHBFD2ksuZTPTLhqbZup7?=
 =?us-ascii?Q?ZLAigBLvsOmo7yT0GfdoB4J8rqGsB49JxolVSS3KkON9G+HDlclvks9v3Pxl?=
 =?us-ascii?Q?eBJNfTNtnxF67mSThlLccG8f+ELR0WC2df8MFf21ImOyEh8ue03viqwsfwlU?=
 =?us-ascii?Q?rC2H5SEv95e1ODrG4r9zgf4igtNxlvzntLDKlODhvf4Bd8Xg3SDx3GQ6T3oD?=
 =?us-ascii?Q?ypJtB5hmQFqZWKr2zM5PyuIIz79bVHzR3cFocBoRx0xskP+YGE+RYdk67t85?=
 =?us-ascii?Q?EfsIojV5JLLEI+sZiMaPyFbDIG0Es4INftLLIOwH5ztzLB8Bp6DnULUkc9wo?=
 =?us-ascii?Q?LHQRxtvGDLXn06KOVFNBDPNleHPqBOviXq2cvGPnhcG4kPJ6LA5J+CCscBJz?=
 =?us-ascii?Q?k56k9goFAT7l+ftQIs6Rm25ZV68PlPs3msVZ6kQ4c+r1h23zUX5ckjafIWOV?=
 =?us-ascii?Q?j0OfcStkNP/ZyRJz7OXctZnq3/ootHEctY8UDGR/tkwUW109diYTLNNh7PfM?=
 =?us-ascii?Q?A5W059UK06GiLmXKD52JHGHd727bKYAOerWFuHtdi0he7PCuHcVLKTpMj5Pm?=
 =?us-ascii?Q?aae2nOW07kTHLJmUO1Cl96ZHGZjahPuBCM3XXHOlMESDQHgWveSYWVMEe6sg?=
 =?us-ascii?Q?ui3dC1mGhF+lBC4dHYbc6jFRItKvYznolb/HsRNxCZcq3IAZibcAnVW1tIms?=
 =?us-ascii?Q?uhP3S/PXCvYW9A5JdVuxQU6NoTXjnQEg0DByI384Z1g12g/c9yeTACzeHi8n?=
 =?us-ascii?Q?ynhL4BvXyIYGj4Q2SluTsbuKjh4spJYCRDt1ExlbwDOsCwKjq5R0h/jrwd2e?=
 =?us-ascii?Q?tpAqrU1OpU/ev3K/hzIml+aa1vEBn08855DlFVg+bdAtpaWTOxK/CfEcN3uy?=
 =?us-ascii?Q?FhvqISDSThtgyBewbxS19Vfg5qZejOlQFYFl0ZhP4bMgNeD6NtoEOkEymv19?=
 =?us-ascii?Q?qL07cFLWivndYnB1swUgHdpQRKGtlJ6LDlk/go5EvIRjvOEZXY/2dER4y3uV?=
 =?us-ascii?Q?Yb/exx5w9nlevys7Km4zaqhlKta3zadJJ+jfUOXwD5A2AHXV2oRZ3FfA9FGK?=
 =?us-ascii?Q?hLnPSJ9Pc8URoQ7Q6i6Hz6vHWB2Q1TsnxopGuNBsKB4+MOziUQjmheCfq2+Z?=
 =?us-ascii?Q?pH7zflSwta5wRWq5uhtfhbWA60rlN+5zvcMQXd+B+VSdt2STlILhiMXv+izO?=
 =?us-ascii?Q?nEoksbrTB+1+Y+s9D+JpaKU7wsDKvxU1hhMAECq7og9ijtfOHX5NWIdYlBLm?=
 =?us-ascii?Q?7aUFmJ72K7O0qFIkniWYVaGdtqWUYgoiCBNQMK6u1r8pgsY7avae8IAxnY2w?=
 =?us-ascii?Q?Rg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 511a1dc2-9c30-4fda-e414-08dcf829c935
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 14:55:53.4559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LiG3ET88GTbJZJ8DPlH9pYK65G3r+vBoJ0O9Qf/XcQcTBgOSKf7MweKtlArqUP6VUPukkpWtJmjSUi0WyPtylg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6537
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

On Tue, Oct 29, 2024 at 09:30:50AM -0400, Rodrigo Vivi wrote:
> On Mon, Oct 28, 2024 at 05:32:22PM -0700, Matthew Brost wrote:
> > Not all BOs need to restored on resume / d3cold exit, add
> > XE_BO_FLAG_PINNED_WONTNEED which skips restoring of BOs rather just
> > allocates VRAM for the BO. This should slighly speedup resume / d3cold
> > exit flows.
> > 
> > Marking GuC ADS, GuC CT, GuC log, GuC PC, and SA as WONTNEED.
> 
> What about s/WONTNEED/NORESTORE ?
> 

Yea that seems better.

Matt

> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c      | 24 +++++++++++++++++-------
> >  drivers/gpu/drm/xe/xe_bo.h      |  1 +
> >  drivers/gpu/drm/xe/xe_guc_ads.c |  3 ++-
> >  drivers/gpu/drm/xe/xe_guc_ct.c  |  3 ++-
> >  drivers/gpu/drm/xe/xe_guc_log.c |  3 ++-
> >  drivers/gpu/drm/xe/xe_guc_pc.c  |  3 ++-
> >  drivers/gpu/drm/xe/xe_sa.c      |  3 ++-
> >  7 files changed, 28 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 5b232f2951b1..bd747e53eb9b 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -771,7 +771,9 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
> >  		xe_pm_runtime_get_noresume(xe);
> >  	}
> >  
> > -	if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
> > +	if (bo->flags & XE_BO_FLAG_PINNED_WONTNEED) {
> > +		ttm_bo_move_null(&bo->ttm, new_mem);
> > +	} else if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
> >  		/*
> >  		 * Kernel memory that is pinned should only be moved on suspend
> >  		 * / resume, some of the pinned memory is required for the
> > @@ -891,6 +893,11 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
> >  	if (WARN_ON(!xe_bo_is_vram(bo)))
> >  		return -EINVAL;
> >  
> > +	if (bo->flags & XE_BO_FLAG_PINNED_WONTNEED) {
> > +		ttm_bo_move_null(&bo->ttm, NULL);
> > +		return 0;
> > +	}
> > +
> >  	ret = ttm_bo_mem_space(&bo->ttm, &placement, &new_mem, &ctx);
> >  	if (ret)
> >  		return ret;
> > @@ -943,14 +950,16 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
> >  
> >  	xe_bo_assert_held(bo);
> >  
> > -	if (WARN_ON(!bo->ttm.resource))
> > -		return -EINVAL;
> > -
> >  	if (WARN_ON(!xe_bo_is_pinned(bo)))
> >  		return -EINVAL;
> >  
> > -	if (WARN_ON(xe_bo_is_vram(bo) || !bo->ttm.ttm))
> > -		return -EINVAL;
> > +	if (!(bo->flags & XE_BO_FLAG_PINNED_WONTNEED)) {
> > +		if (WARN_ON(!bo->ttm.resource))
> > +			return -EINVAL;
> > +
> > +		if (WARN_ON(xe_bo_is_vram(bo) || !bo->ttm.ttm))
> > +			return -EINVAL;
> > +	}
> >  
> >  	ret = ttm_bo_mem_space(&bo->ttm, &bo->placement, &new_mem, &ctx);
> >  	if (ret)
> > @@ -1692,7 +1701,8 @@ int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, str
> >  	struct xe_bo *bo;
> >  	u32 dst_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) | XE_BO_FLAG_GGTT;
> >  
> > -	dst_flags |= (*src)->flags & XE_BO_FLAG_GGTT_INVALIDATE;
> > +	dst_flags |= (*src)->flags & (XE_BO_FLAG_GGTT_INVALIDATE |
> > +				      XE_BO_FLAG_PINNED_WONTNEED);
> >  
> >  	xe_assert(xe, IS_DGFX(xe));
> >  	xe_assert(xe, !(*src)->vmap.is_iomem);
> > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > index 7fa44a0138b0..854ab8624d7a 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -39,6 +39,7 @@
> >  #define XE_BO_FLAG_NEEDS_64K		BIT(15)
> >  #define XE_BO_FLAG_NEEDS_2M		BIT(16)
> >  #define XE_BO_FLAG_GGTT_INVALIDATE	BIT(17)
> > +#define XE_BO_FLAG_PINNED_WONTNEED	BIT(18)
> >  /* this one is trigger internally only */
> >  #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
> >  #define XE_BO_FLAG_INTERNAL_64K		BIT(31)
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> > index 4e746ae98888..506b26ea7b74 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> > @@ -418,7 +418,8 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
> >  	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads) + MAX_GOLDEN_LRC_SIZE,
> >  					  XE_BO_FLAG_SYSTEM |
> >  					  XE_BO_FLAG_GGTT |
> > -					  XE_BO_FLAG_GGTT_INVALIDATE);
> > +					  XE_BO_FLAG_GGTT_INVALIDATE |
> > +					  XE_BO_FLAG_PINNED_WONTNEED);
> >  	if (IS_ERR(bo))
> >  		return PTR_ERR(bo);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index 1b5d8fb1033a..61641329fa95 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -237,7 +237,8 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> >  	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
> >  					  XE_BO_FLAG_SYSTEM |
> >  					  XE_BO_FLAG_GGTT |
> > -					  XE_BO_FLAG_GGTT_INVALIDATE);
> > +					  XE_BO_FLAG_GGTT_INVALIDATE |
> > +					  XE_BO_FLAG_PINNED_WONTNEED);
> >  	if (IS_ERR(bo))
> >  		return PTR_ERR(bo);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> > index fead96216243..2a4886f25835 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_log.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> > @@ -261,7 +261,8 @@ int xe_guc_log_init(struct xe_guc_log *log)
> >  	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
> >  					  XE_BO_FLAG_SYSTEM |
> >  					  XE_BO_FLAG_GGTT |
> > -					  XE_BO_FLAG_GGTT_INVALIDATE);
> > +					  XE_BO_FLAG_GGTT_INVALIDATE |
> > +					  XE_BO_FLAG_PINNED_WONTNEED);
> >  	if (IS_ERR(bo))
> >  		return PTR_ERR(bo);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> > index e8b9faeaef64..751c38c41f26 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> > @@ -1086,7 +1086,8 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
> >  	bo = xe_managed_bo_create_pin_map(xe, tile, size,
> >  					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> >  					  XE_BO_FLAG_GGTT |
> > -					  XE_BO_FLAG_GGTT_INVALIDATE);
> > +					  XE_BO_FLAG_GGTT_INVALIDATE |
> > +					  XE_BO_FLAG_PINNED_WONTNEED);
> >  	if (IS_ERR(bo))
> >  		return PTR_ERR(bo);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
> > index e055bed7ae55..a31b085d2d9b 100644
> > --- a/drivers/gpu/drm/xe/xe_sa.c
> > +++ b/drivers/gpu/drm/xe/xe_sa.c
> > @@ -49,7 +49,8 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
> >  	bo = xe_managed_bo_create_pin_map(xe, tile, size,
> >  					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> >  					  XE_BO_FLAG_GGTT |
> > -					  XE_BO_FLAG_GGTT_INVALIDATE);
> > +					  XE_BO_FLAG_GGTT_INVALIDATE |
> > +					  XE_BO_FLAG_PINNED_WONTNEED);
> >  	if (IS_ERR(bo)) {
> >  		drm_err(&xe->drm, "failed to allocate bo for sa manager: %ld\n",
> >  			PTR_ERR(bo));
> > -- 
> > 2.34.1
> > 
