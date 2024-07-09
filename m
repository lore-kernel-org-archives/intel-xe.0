Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B680C2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 20:49:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 450DA10E669;
	Tue,  9 Jul 2024 20:49:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W3zkr3gZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DAA710E669
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 20:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720558175; x=1752094175;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Q4uvXUHCTC8YF74e8goUgnXdJf2/BREJWDF6Q23zUMo=;
 b=W3zkr3gZqjowRZ0/9hiiMn5nS/rejdtsqMHrARY87UzENk74M8/RTTEd
 14pZApoQaRqRzHC3xjYudlSrqlCpLX7JKFCN8MUHPxARRMZCAMV4FqFc2
 oepjXf3CPV8bYmuWTcrBUEi6uo2W6JUDDA6xy/R2XT9/qsPz6sNAze0w6
 f7IGjrPiFQVrUr7tfYDEZl3bfX7+9K8IOVIDyZ/adlab4HQtb/HoAQ4MR
 CTdVwYn7kUU0ZGmJc/r/JXEfSvlR6PxkM9LA6zhv/bv18eG4PMNuDg9xd
 k7xnUsWCRAWHnezh1ymZjZWXPZonBL7MJZnsVprwZHiQqiF1g/vDtNS1D w==;
X-CSE-ConnectionGUID: jn/KRXvIRoOIRDD46AKwQA==
X-CSE-MsgGUID: IFAzZFwhTny7Af4e+Xr52Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="20749198"
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; d="scan'208";a="20749198"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 13:49:30 -0700
X-CSE-ConnectionGUID: E7kLG7g7RZasOquXJSXVCw==
X-CSE-MsgGUID: 5GOyhYlJRF6D3hfzUrPPrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; d="scan'208";a="47958462"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 13:49:30 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 13:49:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 13:49:29 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 13:49:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPrvT6lpC7bs6nKvo2qP1GzduweEpjyU0wVHk5L1wOGnf8sGMYY0XWAP20NC6RfGu9u0c1SV5UIM+jVd5AibWwuBJxAUEtZZVHXsiVYtNqNtieyzKsEsDQYMyjxHxmdtA9dk/X/eXyP8sOv88hUBhF2o85wFeaypO64COPAZg+BGhQEpvI6E21qO2HFc0DLsPwCtMSbjj3rO3DlrGh0ZyyHAWfbrJDV8meF8wAtom8Im5WFqguZQHVkmV6p7VT/vc0i0dhi/KP7JVK6Cb+1pLgApVembLrcXALQL3qZvnwiyCZdtvU5M4r6jqDAdheNvQHFd6rQ1zgvyWIcsp27q4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CiF20tWzg2fSah8nUqAmSugUE1o9PvL8bC4Ep4mMdGI=;
 b=Z63YxFzTyPewigYWhi9ai3+uN0P9nnKZNJbjQcfyDNtvvSZoe5357C5C/Su32a49fZ7Y41/mi0GMs3j+oJIAcrC8Ucf4XfNHWo3sqdMdVrDhqSAnaeW7Q8ga8Xv7NjHvyrPL8+KX/WnhsvDBARVbkqwlCPUdHVkHExKjgcnOJJ/7MQZj4F2sb5Z7yoT3nPHxWOfFxfprO4Zj8QWc5dDsU5+X4uhvkpyIsVR+9SGDKu6c1J4se+b27XYisnv3cFYlztbuVb0lLQey6fXjmJuTkKwhgSEwbOlnASTkvBXAfdCoopTfn5SZCU+kFLm0R8/JXourZW4PmvGNRROR5wqxCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM4PR11MB6165.namprd11.prod.outlook.com (2603:10b6:8:ae::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.34; Tue, 9 Jul 2024 20:49:27 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 20:49:27 +0000
Date: Tue, 9 Jul 2024 20:48:43 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Stuart Summers <stuart.summers@intel.com>, <John.C.Harrison@intel.com>,
 <brian.welty@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: Fix missing workqueue destroy in
 xe_gt_pagefault
Message-ID: <Zo2iK3CrjQ47Q5Eg@DUT025-TGLU.fm.intel.com>
References: <cover.1720550129.git.stuart.summers@intel.com>
 <7c8bf0c59c0bd167c238dc5a65d0074a4ea4109d.1720550129.git.stuart.summers@intel.com>
 <Zo2IneFVE2yZ8B6Q@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zo2IneFVE2yZ8B6Q@intel.com>
X-ClientProxiedBy: SJ0PR03CA0235.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::30) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM4PR11MB6165:EE_
X-MS-Office365-Filtering-Correlation-Id: a8e12275-0358-4623-666a-08dca0589f58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6QCnrYQWgXCklbYcq6GFrA6MsZBQ/qtjIw37PLmgk2KXubAfBxWhzXbDX9Zm?=
 =?us-ascii?Q?cpjbc1LwPwdqmrZvHHc4nflGZ/ES+epn2dlGkPHDpL7u3qQqPuQFLgPC/Gd5?=
 =?us-ascii?Q?7rR7yez/oXOh8V+so+prWq4vNO5j9oY7yennTdSBCnU+AD5qjag/kwDQ+W05?=
 =?us-ascii?Q?kO291pARsl8dWSfLIjUcDGlRZEAHXED+Y//onh2a11DJJtOpoeUFC5jt1bwY?=
 =?us-ascii?Q?u4Pvd+uoHsZFuVjXJs7iI3tdNaksSHApDc3XapoNJUHYkiAOhWfOP1Nb88BM?=
 =?us-ascii?Q?Xs3w1pCgtDr7nDsWMC5FIadShTzdNnCGdHCz9HCeFz3IlCGMt+SzZbjbHJhc?=
 =?us-ascii?Q?2GHg74qVPbEumMAvoXRu2+Hfp1AxN0q6SwW56FpJktYKKhnHCRUDzTTNp7oU?=
 =?us-ascii?Q?qKSoq3rN5v/9wAk3pmOusBn1+7lP3MfR6Xom6ifbdT/VwiaWUraYNhfTj/X4?=
 =?us-ascii?Q?1uEU1v8l32KEGeMHQYf5rrSBcauYZAYn/7iWggh1agQIemkBH3sdBh/5snL+?=
 =?us-ascii?Q?iOd87eNxvPl0pGBK2IfiA8mX4VI2MLXU5LBV9/zh5rtiJ0gfiujh2vSEAMOT?=
 =?us-ascii?Q?ptdUhSCkkSEWs0t3r5/vfI01kEIwquUVtl/3ffv5p+bJnKWm+sICRO/6XV1Y?=
 =?us-ascii?Q?2JTY+6NiI2DnbQpHsb5QLty70oYloadcVjIjAyHuDCRcs0SDP1bXd89FOpor?=
 =?us-ascii?Q?5xXyhH/5KH98zCJVY8/Qpss86E3oMGq42VTDMtIdX4sLBlQ2ABHpC3qn1TwC?=
 =?us-ascii?Q?wbNiPbkttdDv/09YwKNYTEMKuYKeWC4lhWOtYfFiXzgo7BAlQAsLu1sOpM16?=
 =?us-ascii?Q?Uqo+DTsad5ThXe31P2u+2GQl93HafaenBtvEu4Zci7HXQ13SdkNz8S4GjoQc?=
 =?us-ascii?Q?HeqymOjLT7ovvhKG7kw1RxOQH5elGQdHORrmxM8YUVwU17XGyvyqtWAc9hOs?=
 =?us-ascii?Q?evS8rjtEtWubvwW5wodt2LBBWj/SVTUEvDmux2SqNGoWQ8e9X2u/Zlf+pInY?=
 =?us-ascii?Q?RBPRPPw8tSc+CPYusj5d3NyvJ2FsD9OEGM7Vu9dvWUiPM65mMxExt9F564/0?=
 =?us-ascii?Q?ExAnMMfIdlchmgm4uZr6IHBtYejon2/FWWWmPS51bY2A21oj+43q99x3GI9U?=
 =?us-ascii?Q?jhI5Z01GCFh0lIJLxRW+WHGJrLtuMeFozMG8dYEMlAfws0zJk7K5EiCaLy1A?=
 =?us-ascii?Q?F+NKLF3q66DGIBO2C6Ke2DXH8HBaZvwrWy/IRGhYS/S7bziXPVmwLVjE2Ox6?=
 =?us-ascii?Q?y/c4RYFqCpCs6TKZwK9nM28PpVUA+qmKuPVc5vdIjTax72ZeR8hSDZjJXt89?=
 =?us-ascii?Q?Re4EkyZfv5onJQVd+hIuDYkHnay94Wv2q/ZJVlplNKA8MA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JmBbDte6d854PIZsxOjAa2sBwnN89NvP9ecCprBXeuFC4t4AU1x0IuCzDRXQ?=
 =?us-ascii?Q?mgsVE0JYGlI2c40J7h8Moj0lHeNWJ3QKJmHBjpQe2FUorIdlu9yx7FF3BDc/?=
 =?us-ascii?Q?IuNndhBwhdMTO/Y+B/EO1u/3OJh2oRp0mGkqKSQFsnrwRcrhO2mYDwK/tXzv?=
 =?us-ascii?Q?6QmEOVFBxT2z44i/X1ads5A5TELR46IxXsJInFt1dachLi+jSuk+mUsywlgl?=
 =?us-ascii?Q?y7qdUQUgbxQpZB/vrCUYzWUk6Lov6jYk331tjR0B9qY4DUXoEH2xk6veWpCJ?=
 =?us-ascii?Q?b1XNzenMXf4IBtE3Vi0n7dOdzkTLHchWM7IdoWNUMhst1Mkvu7ewMYQyGTc0?=
 =?us-ascii?Q?pfH8CedivRNmi65qKJJ4mSpMek5Hv8KbbQ3TuA3OuUon8jDWe4CtjqnVT8Oy?=
 =?us-ascii?Q?fk13AJoXtJIMO8fxFS5cWzo21PEjp941jGMgOi7jkxLJMbQItohNGt9q1nSY?=
 =?us-ascii?Q?LVXjvwjkLtrdfd4GFER9DgnyEYcojPBCTdoYhx127jEDEPS4R5/izPc+QXyO?=
 =?us-ascii?Q?TKmyE6zwi+1Z5tf1cJAqUFKrBa6S1+2Lbfog4wIvq0lwN1jx2LPcuApsg5i8?=
 =?us-ascii?Q?OvGClpEfV8ykk8k6sHjt+CDutkxbHqRIgYwoQ+iTIp7g5mmFEY5x3IcZ5Ka2?=
 =?us-ascii?Q?Y4WKml5LPeTXO3Ls0udN3xCOHXU15e2XyVRw1gTfTQc1uXSF0nouxcr+bSU/?=
 =?us-ascii?Q?02jFonlJE0EnsTCIpoI3Pk1bc/oCJii33aRx5f8qTdKuLWkLiBjKI9a2NVDz?=
 =?us-ascii?Q?+skqVjWZJQYDOqEA040zQnRpWD/O4euU3T2DcosWFE0Hy291jwLAlq5joySE?=
 =?us-ascii?Q?5+dN7+5WpEX8YSODVqAg0mm1FHyFZOhxdlgPZUP4GZom+F6LupYc/Y7svW6A?=
 =?us-ascii?Q?G0/UOgjuMFTlq3iqCfzE2Z6m8gyL1j8PZWluuY0IhgS+JJ5PXpamDL/YXw2f?=
 =?us-ascii?Q?RODH5u/EeEd1a8ceRw9WysWRotyTK9n8BxlJxg2VViLymYvgj6xDsTrRzsxS?=
 =?us-ascii?Q?yLCrD7AOhNm0b1E2atlOJCCGWhB43ojxQH/nQuksZNw2ArdieAYr6VWOwKDp?=
 =?us-ascii?Q?NEeXADWfSuv1U7tRZoZmzZ5uTD0CS8s1dozHOi2nm5OyibrG6ESdRAvLoktO?=
 =?us-ascii?Q?1mla+JLx0ir1yn3y2tJunvvceeCbxio42h8HbdykLp+LSCygN7tEGioYzzik?=
 =?us-ascii?Q?WhMEH8Gfs4XdspSfBhFvb9761eMBgAwiGnt7zzpa4lYnddnsioVmV5DUH6Wo?=
 =?us-ascii?Q?P33F1GhYqXWDUytGqKQ33VnDpL1xE335nGiSpNYxERjsw2FZlL2hD4oaI0lJ?=
 =?us-ascii?Q?e9eWClmQoOHg6GbeqMl908GD5jIR5I1/UQUss+j5qhX/bygaes+zrpuXu4WT?=
 =?us-ascii?Q?pnWtT0d4xNX7Z5szcDQcX8Bpp9dtd19Xn9yAja+twazzu4MHm/IE/q+eEm9Y?=
 =?us-ascii?Q?i3/n2wuzNPS67GGLqwv+CoPY629yrN/0kLyvjMLy2fuRFl/wZDoxiomZt/Fu?=
 =?us-ascii?Q?5wvuHbS+k1qTUFk+qdtbMg+el1DJYMqtdqhS3+C9LtqihQR2xBqqsFujeMQ0?=
 =?us-ascii?Q?QDbK5PR31IF18rFlTQaUNIvY0MHopjJI5BlnvAojZ3Nyg81iWDQvMziA4pqr?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8e12275-0358-4623-666a-08dca0589f58
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 20:49:27.2081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J9YXSBMxL89ER8bDOID82teJVTSINh99lx1U6j0xevzIzasoVehkq2culJ1mhYdh6ovbRB+DR4R6dnuaW1F2kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6165
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

On Tue, Jul 09, 2024 at 02:59:41PM -0400, Rodrigo Vivi wrote:
> On Tue, Jul 09, 2024 at 06:40:59PM +0000, Stuart Summers wrote:
> > On driver reload we never free up the memory for the pagefault and
> > access counter workqueues. Add those destroy calls here.
> > 
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_pagefault.c | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > index e18659201208..ded8e3c33a82 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > @@ -398,6 +398,18 @@ static void pf_queue_work_func(struct work_struct *w)
> >  
> >  static void acc_queue_work_func(struct work_struct *w);
> >  
> > +static void pagefault_fini(void *arg)
> > +{
> > +	struct xe_gt *gt = arg;
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +
> > +	if (!xe->info.has_usm)
> > +		return;
> > +
> > +	destroy_workqueue(gt->usm.acc_wq);
> > +	destroy_workqueue(gt->usm.pf_wq);
> > +}
> > +
> >  int xe_gt_pagefault_init(struct xe_gt *gt)
> >  {
> >  	struct xe_device *xe = gt_to_xe(gt);
> > @@ -428,7 +440,7 @@ int xe_gt_pagefault_init(struct xe_gt *gt)
> >  	if (!gt->usm.acc_wq)
> >  		return -ENOMEM;
> 
> I believe we should destroy the  pf_wq in this return, no?!
> 

Yes, I was going to say the same thing in my review - we need to destroy
pf_wq here.

Matt

> with that fixed or clarified,
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> >  
> > -	return 0;
> > +	return devm_add_action_or_reset(xe->drm.dev, pagefault_fini, gt);
> >  }
> >  
> >  void xe_gt_pagefault_reset(struct xe_gt *gt)
> > -- 
> > 2.34.1
> > 
