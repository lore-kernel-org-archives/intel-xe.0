Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DEC10FCAF2
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 22:39:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D2610ED03;
	Wed,  1 Apr 2026 22:39:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TzOWXAQC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 023B510ED03
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 22:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775083173; x=1806619173;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=C2DwEUbbHPzPqnVeknI3x4LqvCt+iglGr9VV9WDB6rw=;
 b=TzOWXAQCV/FfpR35SZzGfwGzsImENM+s366rxjKQwjo+8P3ZeHYr4xcX
 oDHAXxYhiXLzKz5qj/bxk0nenllkfh22q00IpUq0XTMc1KqJBUoE6wnw4
 N9yCaEaXKI/+m5Tzl13sLljXTpDssB4jiJvMIXZd0pZKIuZpRw8ANLaQS
 kUFQCOOEN+TZ+NzF5EHwAoiBUB+5O3/M/2flEz/34kSvBA8rL2mFfXK60
 MruG9jA5RfLkubuKAAWFYsrzP2oTMSVHqOduyXoZjW8JlH+qAkbGhGhZC
 H71j8vqipYFA9y/dQNlPiZat2jYAklSu8xAUjg+hT4NuScBZSHGpJvKhT g==;
X-CSE-ConnectionGUID: G7ReX8TzTjq4KJ/hZ/fUzg==
X-CSE-MsgGUID: 2fJt48kFS9uqTh1ozfrAiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="63687550"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="63687550"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 15:39:33 -0700
X-CSE-ConnectionGUID: v2VGsi0FQYa19qxZ/gsROg==
X-CSE-MsgGUID: GZ7YQo2iTuOSLukpadNLBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="226788425"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 15:39:32 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 15:39:31 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 15:39:31 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.11) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 15:39:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UZ13pVUgSUUtWzXwQpzuBtBAtljSaD+sn08Z+5dKuOg2NEAydVOqSsWgujTtmpi1CwvmFmIyiWhsa0KW2VHMH4bQWpuptTgcBs3Kaoa/Sa+/urlZRfF9HPek5rw0DoPdpymuxI+FXYB6p9xlNlkB9FSqE9gDmw2FNz4q5/d+5X3Jhqbhulqh1MVfqGjWhOENiRw5fDla1bJqf72Tlv99kJn6X4ejgkudUMh618TB9aKV2TpBNwDXUC0+MIHMyqy/1+4RI8qkC9aVYCoI2eEO7z7keSyvVSCGueA6ZOzqBLlP9hYH6wLulYErv8VqkNHOes14VuHISs+1wBGuQttRsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+YsLNpXiZX6wA0KTpM7NxtQ6DpuA2Nx0EsbTJ7pFxE=;
 b=ex00gzYDpgL6c4poIAgp20NWMMk77Gag91GWdtNguCiRvkRBl8Hg91aU4DSnGEp9leL7WaJjnmxugSr5EZrcYuana1nTm06c1FqA26lDUM38sGlo96/JtZtfUicdJ/FTCnDMLKk7hod93jiNdVYA8WOk5SJdQ8yJo4RN6Vp/pJW/RWBpUZmBvUQg9GNnD7F2rTSOhIphqDjFtOjIVLch0bvECMVbOX6SM1Nsh/GztAiK1+4rcgBWShoqrM/sz4Gu6wZrxM6Sfx8hRVRUzttH962twx/0jp5mkfPDtHgjSN1w+Bb9lm9QO3VoO/c2MNYDD/C5MRuYRPHjtyr3a3nkqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ0PR11MB4960.namprd11.prod.outlook.com (2603:10b6:a03:2ac::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 22:39:25 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 22:39:25 +0000
Date: Wed, 1 Apr 2026 15:39:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <arvind.yadav@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3 05/25] drm/xe: Update xe_bo_put_deferred arguments to
 include writeback flag
Message-ID: <ac2eme9CVx3bqd0K@gsse-cloud1.jf.intel.com>
References: <20260228013501.106680-1-matthew.brost@intel.com>
 <20260228013501.106680-6-matthew.brost@intel.com>
 <ac0NbbTfD1Pzl_Up@fdugast-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ac0NbbTfD1Pzl_Up@fdugast-desk>
X-ClientProxiedBy: MW4P222CA0008.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::13) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ0PR11MB4960:EE_
X-MS-Office365-Filtering-Correlation-Id: 40cf5efa-5855-452f-74ba-08de903f86a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 0fhy8LSYR4FSXs5VxBD6xvOoYKG9baMXLo0hgDHf1ke770qeskiMWEdkGABwxovYGjJag0JNBrepGcfwFxbNnrgx3sG8NmDvl8JKymCI17XfYbhpH9cqBkQg5/1JXquNO2kyAN8vH1vixHEw1pp5e1Wd6G6b+hUYApRRF27tE6GYqGoOhjbaRo1pRcQkH/ecldtixl2xN7jH9ibXdVG6rFTLUyKdHM3DWiDzp1wChaV/ixclLn64n2fcfjI8GdHNf6tuqSmt+FKEdB6RHWi9yP2VgxAmfjmKaAmfHH35RBTXvZ1CONS/DtkHh1OWIZVS3DWxgD1UraAHKG1s7qnFuruzH5tSkZdhDt5JuiYOAlkZ7ey2sb5jZWew30+FTnyLg1wn2D1UwlgEm70pO6wpmlkSuG2LvmBh0SF7LqHe+QBj9IS7Lc9Utm/qKjStY4d7RsWQFN+taBdUm1Vq2cjWqtlJ00s6U0JEFxizjzzsMWQbL8Xotnw0BC7R7b11WdMEwWMqahCjJwLVCYDy9XuxVY2wnRqY9caah9P445FZem/v0HPr3hxoxAYoqn0LxTf4/UyPtI1PSI2VJ02EzOUJFEswjuIpJKkA5lLYraJAjNwq1sC0NK8Q85A4do/aIouqI0VXKVZmtA9BMuKPmAXw4sUz9LWYiJRFngNE4tQPZm6tMFN1IDtFz0Jxki6qxtD7f/ILkVvzrJICXRephb7oIX2iff0QMr35eowgEhHN8bk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JNF1nEogGyKV6soPilc6+bUpDxq7RwBSGBhWLHuuntVmNawh2g/o/E4/cGS/?=
 =?us-ascii?Q?Fhhs9wVqzsAgXazou/9MN/qBohKn1Ksk3en7tYoooHDs/6wXY+BnOv2ivJaf?=
 =?us-ascii?Q?UXfj7yMx8purumfSMUGQvqXSjASZ6OFgIb4A+91BeNaX1y2uR1c5A7FuLWkS?=
 =?us-ascii?Q?yhg8lGw1MUI5Df0WV4K1NDOKIU4HzcRaJafSoF8CcCh6d1pVUPYXH5AgP8w/?=
 =?us-ascii?Q?P3B5oyyB+Dthyid/2X3euVpEBS9Ut6MD8pLocByhouZI+MrY2e9hA4AFfLRf?=
 =?us-ascii?Q?xUo4seexRA9A1ubKfkNnIgsFYJCVENfkD6r4uAkCjTbpDVqPn2/dSm9vyNO3?=
 =?us-ascii?Q?JDv2bD5LJfMcG/vbbUvDn05WK4EOVNqiWtpKhnYWYWGUWQ88WEBOV4d54ueS?=
 =?us-ascii?Q?Z0jeAwWuHSkrJMj3+NOL+h2jWANolrhGVA1Xv4fOXXPnkpzvHqGwEn2Ml0vO?=
 =?us-ascii?Q?Bo00gGXZNdAUtGVKr/zy12hriAAoj+MF4/bTWZhiy+9jSRfXLEdnRjc67AvQ?=
 =?us-ascii?Q?5fVyRdRPPQs1AUJBmQsX0oN98wMS8p/vpW8usgUI34RM3kY77umOupcb0bXx?=
 =?us-ascii?Q?lwLCZrAMH1TIRUGb1BMQ+UP03o5Ybyt96z96CqyaaYijZ51wKKJLhKAf1a5N?=
 =?us-ascii?Q?vpsMB48XHr9O4qSCxsR11J5u63HOjdMDhHInx82NHKtx6RDIfalG1KXJEm0j?=
 =?us-ascii?Q?Hkm53ztVod9lgpTo3rc8qa161ZgUfoBpwDpTknjlddQWjNMaX5zW6zfBjRC1?=
 =?us-ascii?Q?uuVt6Wy4p7fjPY0lSosVEX2fxEH00mAYPIK83s4fcLjPOGvk6R5Ch5Q1cu2o?=
 =?us-ascii?Q?HlykXhIn+v8EyWxCGn/e1ltT1pn7g/hp0VsMCUS4Ey1y7IcX+dxyXEwYbaWp?=
 =?us-ascii?Q?qij/bBdhH+WMowk1QsKhWcuV84Y+jilvrMvFLee8SSClc3yrXyo1c4+NOY7H?=
 =?us-ascii?Q?+FbMdoYPesYFaLrWElRJu3XGdlE+mzx5Cgkx2OG8cLM+DGQMVke28WXCN1f0?=
 =?us-ascii?Q?VzdF4yyKd1bQXYMQogxTgTIWd4qAko5iWg8xcMGO97IcFfm2oIInPJR1KefY?=
 =?us-ascii?Q?W7EF+1r0cZiIwHteStIRVXmZkOFoaYcnDYoHTiia6E7VaKa82XKC/gpP0lq4?=
 =?us-ascii?Q?9RhTpcmm+K4keQzYIix+0QLe17ttTikglsUdEL9oDxzueHM8YUvwi3+Ci5uj?=
 =?us-ascii?Q?DmUfrLDjMi8+FSyTFgIHbg5icRH8mLEqz5Xt1qGROltlbqiKjHmz1yGB2f6D?=
 =?us-ascii?Q?mxmO5fPoW7PsmORH/fasKB+3CwBxYpHkfTVrYcuQSwRoA7NCrzq5gKFy3NPv?=
 =?us-ascii?Q?QYpOmp5rKATHYwG/rSY/TvQGExRq8SCXY9MCHLR9JnsXtFeEPpzaHltgKUE/?=
 =?us-ascii?Q?DoIVf+tHYFp2mivh1a9BaXyMYu1ae9ON5fbI3+IXf7bD2Dv81kZGFtwhE54h?=
 =?us-ascii?Q?HwMyuWOlaOJuPTVeXivrN6NAPyrLpyDTw5NKjHKn2AF4RLrLQ7qzm+w53lpk?=
 =?us-ascii?Q?LHcQBkutr2kviJBFoHSYxCb2MM47EV4NQ2PB8aGGcQiFDQBNW7XXrmEzytZX?=
 =?us-ascii?Q?th+a4JZRMPO56ZN6G1juzr7B6FhnVQxGb8/Dr/lt2vX2IdEg+12EfJ8mPWnQ?=
 =?us-ascii?Q?lX8TeBrPvnlw9RdDM+oq84zXWNbNKCIwDZ8q7eP9q4iqIBzmhiKeZ0cgApBj?=
 =?us-ascii?Q?IDYTFxoxBgRUmiX1NoXLAV7LhzMJxuBxHEEmp+bCNk2UKx/6OTtVL4mrHQ7t?=
 =?us-ascii?Q?REqyoGs83B5btl2uhyveZu1iU6i3HUY=3D?=
X-Exchange-RoutingPolicyChecked: IeYx0Fu03qjYoNs6ASe5WvGHRh7c2deuOtcV/m9ioFF5NmPJv2MT25HiQZ1Q6ShkByBpNSzoKGHtaZIuF5cZVUGCTrrRjEO+TLy6OwS8H3qEYhKQhYMlDwpQgMMivZzdOEV2E5tLCZa67DpXv8Lbidu/6xBlob2F/1g3SE3RJXKVRwypLyw/JyrgHDz/XlyFx/bgEZjB//ALvcBDHFgl11wB+C/aDNVaHtwK90tJXfJZ317MLWNiTRL0EzPQ2UwLZ6uC1z1RuuqgSALaeleZSQ+hHcQBjMUg/oleyH7MZNuZFR+VrR//iTn+UVwLQsFJvWS5a9ApoKFOZo/uI29k7w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 40cf5efa-5855-452f-74ba-08de903f86a2
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 22:39:25.1599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ALW4U9O1+VvO/7va5KX6iVV9S7LpSfpVkSGksVe1hvaurXKCGVQ17aUdVh+d4stWnaFEsKBVmNjfO/ASQnTjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4960
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

On Wed, Apr 01, 2026 at 02:20:06PM +0200, Francois Dugast wrote:
> On Fri, Feb 27, 2026 at 05:34:41PM -0800, Matthew Brost wrote:
> > Update the xe_bo_put_deferred arguments to include a writeback flag,
> > which indicates whether the BO was added to the deferred list. This is
> > useful when the caller needs to take additional actions after the BO has
> > been queued for deferred release.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo.h         | 10 ++++++++--
> >  drivers/gpu/drm/xe/xe_drm_client.c |  2 +-
> >  drivers/gpu/drm/xe/xe_pt.c         |  2 +-
> >  3 files changed, 10 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > index c914ab719f20..bf284ed47325 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -348,6 +348,8 @@ void __xe_bo_release_dummy(struct kref *kref);
> >   * @bo: The bo to put.
> >   * @deferred: List to which to add the buffer object if we cannot put, or
> >   * NULL if the function is to put unconditionally.
> > + * @added: BO was added to deferred list, written back to caller, can be NULL if
> > + * writeback is not needed.
> 
> We should add in this comment that if set by the caller then it must be
> false, because this function only sets it to true. With that:
> 

Yes, or I could just change this sematic as it is kinda goofy.

Matt

>     Reviewed-by: Francois Dugast <francois.dugast@intel.com>
> 
> >   *
> >   * Since the final freeing of an object includes both sleeping and (!)
> >   * memory allocation in the dma_resv individualization, it's not ok
> > @@ -367,7 +369,8 @@ void __xe_bo_release_dummy(struct kref *kref);
> >   * false otherwise.
> >   */
> >  static inline bool
> > -xe_bo_put_deferred(struct xe_bo *bo, struct llist_head *deferred)
> > +xe_bo_put_deferred(struct xe_bo *bo, struct llist_head *deferred,
> > +		   bool *added)
> >  {
> >  	if (!deferred) {
> >  		xe_bo_put(bo);
> > @@ -377,6 +380,9 @@ xe_bo_put_deferred(struct xe_bo *bo, struct llist_head *deferred)
> >  	if (!kref_put(&bo->ttm.base.refcount, __xe_bo_release_dummy))
> >  		return false;
> >  
> > +	if (added)
> > +		*added = true;
> > +
> >  	return llist_add(&bo->freed, deferred);
> >  }
> >  
> > @@ -393,7 +399,7 @@ xe_bo_put_async(struct xe_bo *bo)
> >  {
> >  	struct xe_bo_dev *bo_device = &xe_bo_device(bo)->bo_device;
> >  
> > -	if (xe_bo_put_deferred(bo, &bo_device->async_list))
> > +	if (xe_bo_put_deferred(bo, &bo_device->async_list, NULL))
> >  		schedule_work(&bo_device->async_free);
> >  }
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> > index 84b66147bf49..45efe7a55427 100644
> > --- a/drivers/gpu/drm/xe/xe_drm_client.c
> > +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> > @@ -246,7 +246,7 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
> >  			xe_assert(xef->xe, !list_empty(&bo->client_link));
> >  		}
> >  
> > -		xe_bo_put_deferred(bo, &deferred);
> > +		xe_bo_put_deferred(bo, &deferred, NULL);
> >  	}
> >  	spin_unlock(&client->bos_lock);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 99b15d37267f..83dacc91b7b3 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -212,7 +212,7 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
> >  
> >  	XE_WARN_ON(!list_empty(&pt->bo->ttm.base.gpuva.list));
> >  	xe_bo_unpin(pt->bo);
> > -	xe_bo_put_deferred(pt->bo, deferred);
> > +	xe_bo_put_deferred(pt->bo, deferred, NULL);
> >  
> >  	if (pt->level > 0 && pt->num_live) {
> >  		struct xe_pt_dir *pt_dir = as_xe_pt_dir(pt);
> > -- 
> > 2.34.1
> > 
