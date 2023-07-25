Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531BEC001DE
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 16:52:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C22A10E163;
	Tue, 25 Jul 2023 16:52:01 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5268210E16B
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 16:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690303919; x=1721839919;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kbj/q3/hgfONCUF38ZbJ+w60t1LPzTepZYyDzPtGCh0=;
 b=FxqvzAI5G9u414VMVnfQb2z/34td1OJiu1F7j0JtFsUlamydUeOBoRho
 JU/3pCHO7OGVnn+ZTs502qey67QZnFFvu9a/9i72ykxGKjhGaCMjvBfH9
 9eE7L5lkbR0tzupZqVjkVcskk/9NFS6ikxuKpOtY0MnEB0LMIeBeky0+1
 rTRMpEuALnKiZfeScbfmg0u/hENS19Ip7zj0Do2EPzNGVJTmc95uHcSsX
 usiulvfQ2185urvHX00UtRWkEKgyyrmS7GIqoBlHhdIoVPqmjm8sf+QdZ
 xk8JTtESAgI/DP1JBZBhHysCWT8xoRjvuMsfijNIblzFtdMNcX0C3KiSv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="365248504"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="365248504"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 09:51:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="726175810"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="726175810"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 25 Jul 2023 09:51:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 09:51:56 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 09:51:56 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 09:51:56 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 09:51:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CLeNdDNm8lVeKhjOFXyKUh/VjkuRV6648nN3YWDUGASDhZ/qtnQpquqYcLuVsG92Rt8I5lvLlju8m0ktVKyNdFH5b2w1gvWTVEsFKpVPejSQu5Y1oQzJ7a8pN57KgloHCxjfs9yXh/qwVcYmSw9Kv5L0lvbdCxr+AkWB3NN1V5gxfsLfexi0gNPfJWlhnxNutyIsxg7UFVbbyzwn88/ee/xUTwaRFGRxWRzj5Bn73/DmQk9rOeTEuo0Mtn8f4/3MPSLkkR/i3bemzflbJKnPtl0hmCpv9V5Zgp7VDjDceS5G6PrOadK4p8m68JAOTARuXjGC8spoPu5bVwTUu2B34A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptpAi/Ou6NK4YMId5gykBGUT1Hzi5GEqfO7S0Q9y27k=;
 b=LNXdo7DegQyyi//CCGZWJFNuBYuGo4ljRfpKLkFBVO0lAUJjMjVhuAK1aBAp37xRNGpkqnaGsPKRAnifpNuw8SV716zu7MBBltrnpVxogjZz/59aAnHdJidDjnJlb59u+nlZWJGZWrICAL/+rcPFgbOLSLlqRyjjCuSW/EchKLmcVfGaWCsZQ7Gvfk2jAv4rPfPJdKxP6PE5Jg3DlxE4GEHZZSLj4tmLt4YwIrnfc9WlmR5db2OyvHFx7e2x/V2vYJm6G/EJho0Bk7NFWYtzVivlDFd6Rzt96nhAvDqN1PS4MBJ0IbVb/O+uS7AVDEgPOvA1U0C42uQ1deW1yfvXcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL3PR11MB6459.namprd11.prod.outlook.com (2603:10b6:208:3be::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 16:51:54 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 16:51:54 +0000
Date: Tue, 25 Jul 2023 12:51:50 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZL/9pkLpBBRBTF8f@intel.com>
References: <20230725110116.114688-2-matthew.auld@intel.com>
 <ZL/XBN7wCqeEKLn2@intel.com>
 <420d1aa9-c2e6-03e3-a6c0-c5cbbc067b6e@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <420d1aa9-c2e6-03e3-a6c0-c5cbbc067b6e@intel.com>
X-ClientProxiedBy: BYAPR06CA0020.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL3PR11MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: b9e3cb1c-ef70-45a9-c89c-08db8d2f7338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9D8npG/Sptv/7z9X0rlzG0vi87CkpJ7OSCrdSmI65vmiHTIAPm7q0mvTq103JWQzQ8f92tkGsjJeQiC5Z2aXi9vxcxKnpxsqEHxiBikK9jYYtJaIg5Qnb5ep727x+9sGxNfNDOMdCsU3PoJCDEVZEcgdwzk6HjY+kbMsMIbVb8L4h/dM6QmtpILpQU+M9+slCd1wv5xJ4T/v3C+0Utc64DGyXSQ1nQg+Ck5vqFahGg2nUoocLCwa2acfVtNlppQl3fgLA4vLzC2U/CMOvzHv1eSCu8G4mchaeQptLROkJu1Wm32zzkeAU0arc+W7TlZYD2L5b/F4yj2FEfZj+o2veGu1nN+Ns5IAF/2CTw2NcVXXnyPGrzsVn6KbHS/utH8ZJMj63Ry+qPN/GPIudzoCf2vU40q8dwDhurPT0xKGEEsd3d8NDk/bGMbM23burfLWBSLdjW06jqQwSxsgBcgsUXI3S44GHiNDfMKjnZ/LfB/2V5UgRQEE9USn/NU2reP/bydENCmAtKIiqHhyVQ7afJj53iFcofhenqQbl5cIRaI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(396003)(376002)(39860400002)(346002)(451199021)(2616005)(186003)(53546011)(6506007)(26005)(83380400001)(6666004)(37006003)(478600001)(82960400001)(86362001)(36756003)(6486002)(66556008)(316002)(41300700001)(6636002)(66476007)(66946007)(38100700002)(2906002)(8676002)(8936002)(6862004)(4326008)(5660300002)(44832011)(6512007)(966005)(66899021);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7FuNJW3MUWSQU2TUHiZcRXbSGv2rNNXGA2kMZF1VgPmPUSrVbM0ZxwtxEdVW?=
 =?us-ascii?Q?RnB9Z8tRzz0G+a/p9x/f2guP6ZX/rMxB8OrTIIPdxeNhCjVeCOLSHCYkR/Zs?=
 =?us-ascii?Q?ieqCX0U7bPiKSkNLzi/dnqgCDYPqM06X2l0TE531IASbUXkynIHz6DRt878B?=
 =?us-ascii?Q?vEY+5UXTsImpkmSvdR0danh0yfgtNpzQOv8II+gy4cWyob7eAKqoMzcJ6pzT?=
 =?us-ascii?Q?AADFEBVCiBO3QDJqGgQiJd+XQBWj8LGncBwlT1ZYB8DXeD1DOa42RsaObh8u?=
 =?us-ascii?Q?UPPPwlAeCehubRi32jGjvso1LP9DJ7ufH/QK/Vqr7CNtMZeB5OBv8KKaL459?=
 =?us-ascii?Q?cW77OWWdaxoVe79GuwOLs3aeYaEjW6IDgHBp6ie0Frm+l4+URxlSItPrJsI1?=
 =?us-ascii?Q?dK5bx/4R8EXgB2+g/0YVmAU4GICoYrC0N6/50Lx2ruZhKdg1N5DEoaeugnyQ?=
 =?us-ascii?Q?mJYbfRylnylVuC8EFwjgVkt1GLORRH3eHnGaDa+Soz066RtTSnt1ai38VW2r?=
 =?us-ascii?Q?6eS+IEOIujs0ML3F1S5SJM/4RZoz9NTxIISwD21KqC8mWLbb45Xk7vTSOY1v?=
 =?us-ascii?Q?mYlR0qPZdfV5PTT7Zxi37SEEN+3vkFDMH48z7PSDNNwCIbKywAArPZ8c8ZaH?=
 =?us-ascii?Q?2q0WSvBH3YOAz+jtO+8bMqqMzxCaJRubdQHYduXc7aeseek5cAH3Gvnrq3Uf?=
 =?us-ascii?Q?gEF0izRkbxt7XHn3q8V85xaId9fdUABD/P7xp32NSGe+XfO32qYUVFV32qIJ?=
 =?us-ascii?Q?0YiQod4OgbyY3fcS1Hz3f2n8oYvWwuWcTMouv83K+QyMZihkJWeGY1RZEffW?=
 =?us-ascii?Q?vYrrYj/LREaEWzUWfWw30BsEIu7oABr2sMD92kXnNRrkQZAbmjKiIcZNakS1?=
 =?us-ascii?Q?GiU9kxvlHuRguhmcRDRySFKZ43TaGldMoUnnL6x6/D/morsZsUwqidEQ/S4j?=
 =?us-ascii?Q?qrm53ezRUVfDuC9SFosSCtk5r266qWxGAr+B8MUl8uwT5sHeptS8wy+Hd/om?=
 =?us-ascii?Q?pPymEeFI6cpvoZO/6tIfQZQjDbRkSNcsXEy/4SOa+G9UA/4EY3wPvTO1Hnkv?=
 =?us-ascii?Q?fp588X2EKlW8o7FgkoDx0DfbBS1Kuu209U0OsnyQ8eQOPGTjfYaRaqNB/Av9?=
 =?us-ascii?Q?KYDbrxNvgGF+5c9jmpf34VhIl3Vq+49FHPw2a7WEja/iZuUoRLOoNsmNV4de?=
 =?us-ascii?Q?djPDWgvxFrYMSh/prGcf9zsOdjO+uk9ofsnN8dQ6mgT92xM/RWRowI08Cnw9?=
 =?us-ascii?Q?54QoTSQ+qfiOavDYLs1hzuxuyx19vuCbgCsjZWB/TTYqoctpDPPggeJshr1W?=
 =?us-ascii?Q?mNCwwZ9+EnjFmXQPqNh221iwrV9MkFaTvaDFodtAzJmilMKKwy63AgjkBB7C?=
 =?us-ascii?Q?YDBoixiay0O9XtUIJ+qOAuFba7nMeBjgClLAy2dxr2FmRWrw86FY0LqmgLio?=
 =?us-ascii?Q?UvbvHqGxH9hF478MH9EQ2A1vsmQOxSNzbiQPQwngip3FEzllJOjWyrTcm+3x?=
 =?us-ascii?Q?Tnrki2xo15dXOT1QUw+33aEH8AvZIXN88sXpQR48z3NRx+1ldo+Qkw4TlIF6?=
 =?us-ascii?Q?xSh3Tmg8zAIlmF+oECiiDaFGbhMnEI5DmUTXYYTK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b9e3cb1c-ef70-45a9-c89c-08db8d2f7338
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 16:51:54.2604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D8OgrSDFE0vQyeLg+KmdbUNHuHvNQtW1Iy1e8GvpdjSvlSDowPz0ThPHDTx/FkHN/BZtWDUW48nNvEMJxDe7kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6459
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/engine: add missing rpm for bind
 engines
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jul 25, 2023 at 04:11:41PM +0100, Matthew Auld wrote:
> On 25/07/2023 15:07, Rodrigo Vivi wrote:
> > On Tue, Jul 25, 2023 at 12:01:17PM +0100, Matthew Auld wrote:
> > > Bind engines need to use the migration vm, however we don't have any rpm
> > > for such a vm, otherwise the kernel would prevent rpm suspend-resume.
> > > There are two issues here, first is the actual engine create which needs
> > > to touch the lrc, but since that is in VRAM we trigger loads of missing
> > > mem_access asserts.
> > 
> > with this in mind, should we really create the new ENGINE_FLAG_HOLD_RPM,
> > or should we simply use the existent ENGINE_FLAG_VM?
> 
> Sure, I can do that instead.

What I'm not so sure is about the extra case that that would bring:

at xe_vm_create()
if (!(flags & XE_VM_FLAG_MIGRATION))

> 
> > 
> > > The second issue is when destroying the actual
> > > engine, which requires GuC CT to deregister the context.
> > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/499
> > 
> > I wonder if we should get the mem_acceess from inside the ct path
> > to be sure?
> 
> Do you mean calling xe_device_mem_access_get() in ct_send()? I think that
> will give various locking issues since any locks the caller is holding you
> then can't ever grab in the suspend/resume callbacks without deadlocking.
> And the callers of ct_send() are all over the place, and some are quite deep
> down. Also some callers expect some future CT response so holding in
> ct_send() is only one side, and would need to be kept held over to the wait
> side.

hmm indeed! And I think we had already discussed that in the past...
sorry for the noise

> 
> > 
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_engine.c       | 20 ++++++++++++++++++++
> > >   drivers/gpu/drm/xe/xe_engine_types.h |  1 +
> > >   2 files changed, 21 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> > > index 59e0a9e085ba..dba71f53e53e 100644
> > > --- a/drivers/gpu/drm/xe/xe_engine.c
> > > +++ b/drivers/gpu/drm/xe/xe_engine.c
> > > @@ -76,6 +76,17 @@ static struct xe_engine *__xe_engine_create(struct xe_device *xe,
> > >   	if (err)
> > >   		goto err_lrc;
> > > +	/*
> > > +	 * Normally the user vm holds an rpm ref to keep the device awake, and
> > > +	 * the context holds a ref for the vm, however for some engines we use
> > > +	 * the kernels migrate vm underneath which offers no such rpm ref. Make
> > > +	 * sure we keep a ref here, so we can perform GuC CT actions when
> > > +	 * needed. Caller is expected to have already grabbed the rpm ref
> > > +	 * outside any sensitive locks.
> > > +	 */
> > > +	if (e->flags & ENGINE_FLAG_HOLD_RPM)
> > > +		drm_WARN_ON(&xe->drm, !xe_device_mem_access_get_if_ongoing(xe));
> > > +
> > >   	return e;
> > >   err_lrc:
> > > @@ -152,6 +163,8 @@ void xe_engine_fini(struct xe_engine *e)
> > >   		xe_lrc_finish(e->lrc + i);
> > >   	if (e->vm)
> > >   		xe_vm_put(e->vm);
> > > +	if (e->flags & ENGINE_FLAG_HOLD_RPM)
> > > +		xe_device_mem_access_put(gt_to_xe(e->gt));
> > >   	kfree(e);
> > >   }
> > > @@ -560,14 +573,21 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
> > >   			if (XE_IOCTL_DBG(xe, !hwe))
> > >   				return -EINVAL;
> > > +			/* The migration vm doesn't hold rpm ref */
> > > +			xe_device_mem_access_get(xe);
> > > +
> > >   			migrate_vm = xe_migrate_get_vm(gt_to_tile(gt)->migrate);
> > >   			new = xe_engine_create(xe, migrate_vm, logical_mask,
> > >   					       args->width, hwe,
> > > +					       ENGINE_FLAG_HOLD_RPM |
> > >   					       ENGINE_FLAG_PERSISTENT |
> > >   					       ENGINE_FLAG_VM |
> > >   					       (id ?
> > >   					       ENGINE_FLAG_BIND_ENGINE_CHILD :
> > >   					       0));
> > > +
> > > +			xe_device_mem_access_put(xe); /* now held by engine */
> > > +
> > >   			xe_vm_put(migrate_vm);
> > >   			if (IS_ERR(new)) {
> > >   				err = PTR_ERR(new);
> > > diff --git a/drivers/gpu/drm/xe/xe_engine_types.h b/drivers/gpu/drm/xe/xe_engine_types.h
> > > index 36bfaeec23f4..a3867e4db0bb 100644
> > > --- a/drivers/gpu/drm/xe/xe_engine_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_engine_types.h
> > > @@ -59,6 +59,7 @@ struct xe_engine {
> > >   #define ENGINE_FLAG_VM			BIT(4)
> > >   #define ENGINE_FLAG_BIND_ENGINE_CHILD	BIT(5)
> > >   #define ENGINE_FLAG_WA			BIT(6)
> > > +#define ENGINE_FLAG_HOLD_RPM		BIT(7)
> > >   	/**
> > >   	 * @flags: flags for this engine, should statically setup aside from ban
> > > -- 
> > > 2.41.0
> > > 
