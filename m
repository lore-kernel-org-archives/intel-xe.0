Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DA2C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 19:45:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFFF7112063;
	Fri, 19 Apr 2024 19:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ijERpwmC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E4D112063
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 19:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713555928; x=1745091928;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iynaZiz2e/4HwWAr+qG181S2vlWsgU56sp6uwBU2pzQ=;
 b=ijERpwmC0oVScljaAmpjBfJD0hALo3cjAVyMouAKxVHn6bnC/eQsUogU
 QQpPj7oleJp6m7r5r2z1L/iLL/A6kaDm4yEDEx76/zgHPkn9gQfe1obPu
 rs9R5AtpcrIaQ7sSYNwFXS0Ch5DVLy93cO01n/mips4uxG/y/fr/5V9hE
 cLCmy+da6/Cs+5jhup6zAGbWD5pmCGDhM6iq1uluYL9CsgvOBFojLaPYh
 G37z5tRTEoAGra/YIiNLLMt1CBfBoSF42T+6xb0+zKLjkMLKL9Fubt88t
 KQnlpe3HdwmGM0sHA2j8ADDX34XGXMOMsj/7tsyh0qDkUyUBCCcrOfbZb Q==;
X-CSE-ConnectionGUID: oz082h/jSGGfkTvHmPd0wA==
X-CSE-MsgGUID: 4+6VUTqISS2hJlI0Fjixdw==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="12115746"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="12115746"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 12:45:28 -0700
X-CSE-ConnectionGUID: Rw0paseSTiWapxT/hdYz2A==
X-CSE-MsgGUID: 3ZGRBG2NSJublWa4F332VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="23417906"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 12:45:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 12:45:26 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 12:45:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 12:45:26 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 12:45:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V8sh9mVb41Mf7fJr0gpGD/oNkAhvA/Qlk62URz07gtISNY+J5F5+VRhVQHLi1Z0sveXvRUGIHE1lX+VoMO8njAZDdG7wRdz/LxdBQI5nqsksudZaL11lwWWZZDhaNB2QzP85Mu3IcpiPN7OhDnGHJXfATnYKWZLYCks+Y7lHgkuOLOHjvRZ5WDoDzHOPz+BjvslcGmq1y9qoiC8a4K7j7oQATSFoV5okQJWo7pN0FFc/Aj/N7j1yoQ7icXNit4pJloX/GKhVcarp58f3JJFqg8w4yrCfHJVJVXuNw6YN5Uz1pmtatKFb0H8Qhe+uabRwKC2cEGYqTNAdQcJsLo0YDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z147zp+iJOVFrWtvlq0zXzYmFKoSO6v3NROxcoot4kI=;
 b=KXX1hZFcqakRGkigx5k0oaLLlZCXlJeTc0VlGfQJqhvsmCzU0xMZr8c1thauby78+ilcq9JvTkY5032/2C0NSpCAEPpPuq+mTCkbWFjO/EUBagGyYyngQH9Ua3Z/FZ2gvwxiRZbGzXaQ7Lc6LWLQDEFgvBEmut1TyyEEua3FHSg1zBFx9YZ/l/WDe9bOfgPaj3wcyTdZOOTKIeYO2mzWkmVVm5v+mEQUCEJSRbPvwbAkz7t+ZXKh9198Blp/PBgXLEH99akGGktKpVFEFzGYNgsoJFEQZG2/Ugd41JEZ0fisKsv52SmtkBzFMNQw1fdYcJq4bd60XHsMeQvK2gh+zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB8203.namprd11.prod.outlook.com (2603:10b6:8:187::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.31; Fri, 19 Apr
 2024 19:45:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7472.027; Fri, 19 Apr 2024
 19:45:23 +0000
Date: Fri, 19 Apr 2024 19:45:06 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 11/13] drm/xe: Move ufence add to vm_bind_ioctl_ops_fini
Message-ID: <ZiLJwnOZzrx/PaBn@DUT025-TGLU.fm.intel.com>
References: <20240410054056.478023-1-matthew.brost@intel.com>
 <20240410054056.478023-12-matthew.brost@intel.com>
 <SA1PR11MB699187124D07E9B753DEAA46920D2@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB699187124D07E9B753DEAA46920D2@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0009.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: d9cf0cc0-b66a-4621-63ea-08dc60a9409f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Liv/0S6hULVTcLzEq/gfsXY8g2nwa4mTQyfNn4rRiYzHBALicyu7/FeeE0egdYvuS72cnA1GGXfgGfZuuB0YX8GbyszhpJxXrdbkAtVmL5JCEqMHwvwXGxawhs0afp5RsiY/g1vVZJWEJfuvDJ1GwPfF3I+ixs7LcOxNmNozK4IyBmYHUWBbXjBhsyiACGrMOiKIHCOB06XHtVw+b28M9Hch4ttUatT1zu9FK3G1Gh6ivb607WzPWExx8o/VRZDCqsVAGUGF3iGIVzx/emgGme/W1u78XgyhINSMG8G7McEYQivYVdL7NC2I+ZFipS29K6Dkt1InEqTDNIPdq1u6OO14EoWW9VBs7+ggyVEP58CLvglYc4VwzIKzIugQTHHTFWLp/lZJAh2Gor4sdzpVy9NvOSh2rQ+41aRH+NRC0GlGtQ06mB3qJAodEfBQWfoa8eYPIYTRg+aC549BS2HJdTzpnMDQOUYpDZsXHAOsd1CKgzTgfi0yu4hs/91b2pMDS8mbf35HP1avZSVNcL5CAMLVRZyJxCEKw3M2cjXepSBSDq5PEU96u+LbC13yhdg2758id0X9qN8umVjPSo99XXtV/O5Od/OU0LLez76ikT6Z91RVWDPJDpmDgWq48m4E1WD4j39AOzUjC1Qb/zagjcy8eGCGT0IAMBURCOg41v4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P8Q+5C1AKzujvnVQPe/EKhsYfsroLKHu+YAfhEayqqibELcNltpH7r2H8/ni?=
 =?us-ascii?Q?JTv2R89fcRrvrZIMGM6uHKBs+dtAGIQbsEoRdiqvMzbFaUHU0w80W8ryFl2+?=
 =?us-ascii?Q?tnZmAhlZtT0I3PHn2TEtfv3PNWHPJMLOvm4hthsOcq36ZiziTfoZA/CyugJ4?=
 =?us-ascii?Q?bMvzC3OduCXAQsS21LeElK9TsHpcf7HZAt21xkJayOs09qH/Ltgwb94Aiml4?=
 =?us-ascii?Q?ABqknGj/Nr0OfwkZ1sgn+E3dRJTX+13tzbpsA294mU/FQX6q6e+xVdq+yKT7?=
 =?us-ascii?Q?Qw9/JfsQHS2Ww21y4GU9Mig4xwBb2/Lee31t1djEY0O+lPdgolHo51LIXkem?=
 =?us-ascii?Q?GwkDYG8qIgdb3pxy93mxDaVfs8+vb0lu0jLbwIpwxxTfPjOutmUjfdAXccbV?=
 =?us-ascii?Q?eX+mjwUoQIW4TIO2mGOsQWXzYUbF3UCgw8dQbeNxFWlQNmeXEvN0b1ouWhXu?=
 =?us-ascii?Q?7CJoDgFjKhg92ySUO+g/bX+0YYXC8TK2SO8qkHw+tJ1uWhuPkasnDEceUwZo?=
 =?us-ascii?Q?6nDO0yWs5MyqGH76YmvMJfJ+jZJfUQudD5JTlGBIAwpCY/j3W5UUQiB8R02p?=
 =?us-ascii?Q?jm0zzGUEa33+xFxO30JF+nY6CIr4385Ub1SUUzEQhPj4a81kVHpvHfCq3vMf?=
 =?us-ascii?Q?uVG1tKSZPdqyVYWC/ZYHWzZbShRP0G/Nv5IIE2E088Q94Bg6g8Lxfr+zyXxn?=
 =?us-ascii?Q?sQgnSXzcALJUBQXsr6DmJScKoAab5Aiqb9wF9q2m+iZdKLuATiTu4yDgiVVi?=
 =?us-ascii?Q?H2mZb7neDoSvuvTUzJqEcRTyNmCWHsM0IbmGSaWQ79UjMCl7QVJRm5kfo1mc?=
 =?us-ascii?Q?PZQH6ub4ZHz5BBR8/D5Vg+muQnoysWuXTwT33/AJIjevBfYKZrbmPfZ8BJ16?=
 =?us-ascii?Q?J6qT5Y/9YpSfJydeVZ31kCW6DJzpzIKvdea6kgmaMXI9HrJgjjPRetCkEczR?=
 =?us-ascii?Q?a8Mt+L+5VfmlGicZ8oqilJusgeLhuj6RhXjPHX/1nNgL/wAwFq2Etcq7W38A?=
 =?us-ascii?Q?G/lVP1zE9AxgX64ThoLJwtJcg8kYgtIWPdT5YuFJy9mcoCyhLvydv7FJRJjs?=
 =?us-ascii?Q?q1h0jvkN/+wWjPh2l/QxMJ2Gm9nzcnXoXndW4VyiIn0yBwVHMkbNxhDNj6F8?=
 =?us-ascii?Q?nEaxdCv2hwyKxPx7XXu6PPTz/yi4pAT2RmBxNtI7REVJl5KA0WWvFdB8Po6h?=
 =?us-ascii?Q?TIHsLyCpAPBRpzSEfbzI1rtKWPrnAWr3F5kIEvrFHxMZyO4o95oUExdMGvtj?=
 =?us-ascii?Q?FLf1O40HH691tMFOuE2p5VuU51zRJ43VYhMijnrzfDM4T7VCm1KiIbX+LsYn?=
 =?us-ascii?Q?DeYE/liLiwUy7UNPfSgEnY/rBku9xQSrcEfTOQv3wNe+DXTe9d6Q4biqhCJH?=
 =?us-ascii?Q?UCoeHAc1SCCoMp1SK/fUiRj0/rSgNGPTeXCZgTCoLUAq0SFx1eXgmshhVJRq?=
 =?us-ascii?Q?nmHGaCDcCH6u7gNaNbh0pmNzicUTAcUm0zOw8a8kqrSmdOt5ZWPZ68UJVkcY?=
 =?us-ascii?Q?vB4ZbHTYtEfVV/Q8AwTg2ctZHvsLLp8v6Z5nNOl4kB6aQFxL5lpenUdHf6EJ?=
 =?us-ascii?Q?lsgv+Rf2RdIoSCtxDe0Unh33obQfg1unFZFBkbrl92hlI9HJPEms089CXrm4?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9cf0cc0-b66a-4621-63ea-08dc60a9409f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 19:45:23.1072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6u31Tv9lJV0dTLXGg2D4Hoa3aexNdEyWZVb9YePbktURm5dq8Eplfdv0QwsuIMT735ybUw6s6U4/0EggRJrIcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8203
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

On Fri, Apr 19, 2024 at 09:24:18AM -0600, Zeng, Oak wrote:
> 
> 
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > Matthew Brost
> > Sent: Wednesday, April 10, 2024 1:41 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Brost, Matthew <matthew.brost@intel.com>
> > Subject: [PATCH 11/13] drm/xe: Move ufence add to vm_bind_ioctl_ops_fini
> > 
> > Rather than adding a ufence to a VMA in the bind function, add the
> > ufence to all VMAs in the IOCTL that require binds in
> > vm_bind_ioctl_ops_install_fences.
> 
> This is a typo right? From the codes, it should be vm_bind_ioctl_ops_fini
> 

Yes, typo. Will fix in next rev.

> I also want to make sure I understand here: so the ufence added to vma is *only* used to make sure last vma bind has been completed upon vma unbind time. So even though it is more natural to set ufence at bind function, it is safe to set it after all operations are submitted (vm_bind_ioctl_ops_fini func). No vm_bind ioctl (and the vma unbind triggered by ioctl) can go through *before* the last vm bind ioctl's ops finish, right?
>

The ufence is attached to all VMAs being bound in an IOCTL. It prevents
any of those VMAs from being unbound until the attached ufence has
signaled (binding operation complete).

It is safe (and correct) to attach the ufence *after* operations
submitted because we are past the point of failure and are under the
VM->lock. The ufence could be signaled or unsignaled when attached to
the VMA. Safe to attach signaled ufences due to ref counting. Future
IOCTLs return -EBUSY if trying to unbind a VMA which an unsignaled
ufence.

Matt
 
> Oak
> 
> 
> 
>  This will help with the transition to
> > job 1 per VM bind IOCTL.
> > 
> > v2:
> >  - Rebase
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_sync.c | 15 ++++++++++++
> >  drivers/gpu/drm/xe/xe_sync.h |  1 +
> >  drivers/gpu/drm/xe/xe_vm.c   | 44 ++++++++++++++++++++++++++++++--
> > ----
> >  3 files changed, 53 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> > index 65f1f1628235..2883d9aca404 100644
> > --- a/drivers/gpu/drm/xe/xe_sync.c
> > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > @@ -338,6 +338,21 @@ xe_sync_in_fence_get(struct xe_sync_entry *sync,
> > int num_sync,
> >  	return ERR_PTR(-ENOMEM);
> >  }
> > 
> > +/**
> > + * __xe_sync_ufence_get() - Get user fence from user fence
> > + * @ufence: input user fence
> > + *
> > + * Get a user fence reference from user fence
> > + *
> > + * Return: xe_user_fence pointer with reference
> > + */
> > +struct xe_user_fence *__xe_sync_ufence_get(struct xe_user_fence
> > *ufence)
> > +{
> > +	user_fence_get(ufence);
> > +
> > +	return ufence;
> > +}
> > +
> >  /**
> >   * xe_sync_ufence_get() - Get user fence from sync
> >   * @sync: input sync
> > diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
> > index 3e03396af2c6..006dbf780793 100644
> > --- a/drivers/gpu/drm/xe/xe_sync.h
> > +++ b/drivers/gpu/drm/xe/xe_sync.h
> > @@ -37,6 +37,7 @@ static inline bool xe_sync_is_ufence(struct
> > xe_sync_entry *sync)
> >  	return !!sync->ufence;
> >  }
> > 
> > +struct xe_user_fence *__xe_sync_ufence_get(struct xe_user_fence
> > *ufence);
> >  struct xe_user_fence *xe_sync_ufence_get(struct xe_sync_entry *sync);
> >  void xe_sync_ufence_put(struct xe_user_fence *ufence);
> >  int xe_sync_ufence_get_status(struct xe_user_fence *ufence);
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 0319e70577fe..1da68a03407b 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1900,17 +1900,10 @@ xe_vm_bind(struct xe_vm *vm, struct xe_vma
> > *vma, struct xe_exec_queue *q,
> >  {
> >  	struct dma_fence *fence;
> >  	struct xe_exec_queue *wait_exec_queue =
> > to_wait_exec_queue(vm, q);
> > -	struct xe_user_fence *ufence;
> > 
> >  	xe_vm_assert_held(vm);
> >  	xe_bo_assert_held(bo);
> > 
> > -	ufence = find_ufence_get(syncs, num_syncs);
> > -	if (vma->ufence && ufence)
> > -		xe_sync_ufence_put(vma->ufence);
> > -
> > -	vma->ufence = ufence ?: vma->ufence;
> > -
> >  	if (immediate) {
> >  		fence = xe_vm_bind_vma(vma, q, syncs, num_syncs,
> > tile_mask,
> >  				       first_op, last_op);
> > @@ -2918,20 +2911,57 @@ static struct dma_fence *ops_execute(struct
> > xe_vm *vm,
> >  	return fence;
> >  }
> > 
> > +static void vma_add_ufence(struct xe_vma *vma, struct xe_user_fence
> > *ufence)
> > +{
> > +	if (vma->ufence)
> > +		xe_sync_ufence_put(vma->ufence);
> > +	vma->ufence = __xe_sync_ufence_get(ufence);
> > +}
> > +
> > +static void op_add_ufence(struct xe_vm *vm, struct xe_vma_op *op,
> > +			  struct xe_user_fence *ufence)
> > +{
> > +	switch (op->base.op) {
> > +	case DRM_GPUVA_OP_MAP:
> > +		vma_add_ufence(op->map.vma, ufence);
> > +		break;
> > +	case DRM_GPUVA_OP_REMAP:
> > +		if (op->remap.prev)
> > +			vma_add_ufence(op->remap.prev, ufence);
> > +		if (op->remap.next)
> > +			vma_add_ufence(op->remap.next, ufence);
> > +		break;
> > +	case DRM_GPUVA_OP_UNMAP:
> > +		break;
> > +	case DRM_GPUVA_OP_PREFETCH:
> > +		vma_add_ufence(gpuva_to_vma(op->base.prefetch.va),
> > ufence);
> > +		break;
> > +	default:
> > +		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> > +	}
> > +}
> > +
> >  static void vm_bind_ioctl_ops_fini(struct xe_vm *vm, struct xe_vma_ops
> > *vops,
> >  				   struct dma_fence *fence)
> >  {
> >  	struct xe_exec_queue *wait_exec_queue =
> > to_wait_exec_queue(vm, vops->q);
> > +	struct xe_user_fence *ufence;
> >  	struct xe_vma_op *op;
> >  	int i;
> > 
> > +	ufence = find_ufence_get(vops->syncs, vops->num_syncs);
> >  	list_for_each_entry(op, &vops->list, link) {
> > +		if (ufence)
> > +			op_add_ufence(vm, op, ufence);
> > +
> >  		if (op->base.op == DRM_GPUVA_OP_UNMAP)
> >  			xe_vma_destroy(gpuva_to_vma(op-
> > >base.unmap.va), fence);
> >  		else if (op->base.op == DRM_GPUVA_OP_REMAP)
> >  			xe_vma_destroy(gpuva_to_vma(op-
> > >base.remap.unmap->va),
> >  				       fence);
> >  	}
> > +	if (ufence)
> > +		xe_sync_ufence_put(ufence);
> >  	for (i = 0; i < vops->num_syncs; i++)
> >  		xe_sync_entry_signal(vops->syncs + i, fence);
> >  	xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
> > --
> > 2.34.1
> 
