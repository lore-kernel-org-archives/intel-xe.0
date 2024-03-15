Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B7AC54E60
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 01:07:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3FF210F894;
	Fri, 15 Mar 2024 01:07:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mD390lzc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A583710F894
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 01:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710464830; x=1742000830;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=40WKkrTRa0lBa80GBuIxg4IGSdPq8DfVyoyqwf7M5UU=;
 b=mD390lzcdyfPAQya+Hd0ma6/r06eTOzjd9U+4qQhogbDHe3znaG9kRIp
 z9RZmn0HjOoJ7ge0WmYvFp7xsJupMTWFbENERkoYcHYodx1yRaBILnH49
 GbPrw0yf0hfPzib0S+baotPuE5BAWcfnqtoBQSLqvnzvYidWXzzbmpH6a
 SSMHcwGoJHzQTcu0y+/gBgrNqpjWfFNJ0eeWVMia1SI5QbfaUPs6K1RYA
 DlD2mc3Gi+1tx5u4oisC0yk5s3TqMZLgIj/uT/pHwHc7LkaKosDoheZyd
 w8MM91UXmTnJzOfPa8bDbclnVp/d3uAmlGP/204622R6DAiSDJztlfAfv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="30760601"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="30760601"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 18:07:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="17086774"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 18:07:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 18:06:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 18:06:56 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 18:06:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HUo4wJluhZvHu2UyOxpLJx/WD9qczCgPQD5UGTaujE0WPT6XoJXM7oc5eaVs8DVgYHPZpBxOf9KQs/aZYZYZC3WBFr+g1Doz+xT8mBWW04SQbHL22cqtr42UP2a1qgRODoJE6N+QXgjzqhv4FTE2X36Zn/ga5gSbagtnWYNVgEw3SNspUR/RH2VCQ0jVfdbRxWyU5j95N+fgfCJOxrnSI2FzCd1/TPccULVghZUvKeSTE6RzxADMq9ayPSf78WbDRmJWHq15fxGcgnTac5544a3LIyw/rjS6MPAYYzUpLJ8LJjqFAMIASgwmnuNWa+N2tF6mSapqKZA6POCGcbk0Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DAIFgIi7TjfXkzmeSpxLwcpMBuDjiF20dSMJTBENGLk=;
 b=IvfvBXT0CvCWlt8V5Ttm5VvyC1HZS/qyzcAF1FRAaT6IpI01rAwdnpDC2oa5l9PKWlfCgaSxl03NisFL5q6yymL1NXdrJX9QnlrHt8MIoc1O8tJzVh8uuHGu1ifPo8b4QWbzhiO9/o0u+Mg6xICzHvIfL8mFFVtVYQQ/hkVBTeERaN/2sWPEeghkDOJ0C3MPCFjemnYJFhjDIoZj45TUlzn0WQa785XfGJLl0yk2ereOs9mydwFsFc5Q560NLtI5G8d6jYfSWV/arrP3qhgNvNgpqDYs0l4vwrGoXfQJj16MtXawoQKGSB/Dmcr0Rm313z+7a2D5Y3Rlh1CI5ULeCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB6422.namprd11.prod.outlook.com (2603:10b6:8:c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Fri, 15 Mar
 2024 01:06:54 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 01:06:54 +0000
Date: Thu, 14 Mar 2024 21:06:50 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Alan Previn
 <alan.previn.teres.alexis@intel.com>, Himanshu Somaiya
 <himanshu.somaiya@intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Force wedged state and block GT reset upon
 any GPU hang
Message-ID: <ZfOfKnlbdIl9lXKa@intel.com>
References: <20240313195459.141463-1-rodrigo.vivi@intel.com>
 <20240313195459.141463-3-rodrigo.vivi@intel.com>
 <7chi3xtzjj46u4ape5o5uz3mkgqyogyu4egb7772j5mbk5i6z2@glcn273zt7o7>
 <ZfIeINI5VJJaaVto@intel.com>
 <jyhbqihplavieq3dc3ltg3hdqz2i5fsqvdbksbt3q3lz4euyid@hmhhcj43ebll>
 <ZfIjVj-MJD2C6YgD@intel.com>
 <ka3c7ex2v2a6lakwfuy5x6drlwf7h5aqbdryrp3wl7pcgjxdyd@45opwtboy4bq>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ka3c7ex2v2a6lakwfuy5x6drlwf7h5aqbdryrp3wl7pcgjxdyd@45opwtboy4bq>
X-ClientProxiedBy: SJ0PR13CA0238.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB6422:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dbe456b-5f62-4988-d2a4-08dc448c3420
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 60gvBdVOLRVR9EceEFOH1/2vFZvD8BCpt/E4CBBbaClWN362eRrE28BtPREPYhxphiDebgkfe+pX43EKLWztAX+K5OWyfdl8dJTBDExf2QV3ODsQSSiEM4wBgDvt12eRgJgS4pePJuiKn8wFSYtnjoCWsSRv3CTJt3Rniad12s64p2+703zw8DQe8ZDIWaGvsiQX42H5A3tgxRg5+voFqtJcME6CxFuNCffCfivu/BKO+sega2J+t1O43zVyBDCXbiRvaSfQBbFdpdmlmaXGipzDuJ9v0HsOy5xUZEL3sFlUucr9SJbb8gExucO7dzIzJ69yBPf4T664RYM3lnvGTTVcMTZdPaaQEI+CiLMjUr18Ayi9jZV+WvUlTB1pzsKyPD00oyt/AbnMigCcg5EGkauNMhOxIO2nuN3w2+GU/qBhMTNuTjPdaUfYyt5pK4kr3a3lIzxkR7Mcrv/ZKCM1ohNQ/LbK455EsruVaakqc4+Np2DqbEEfSbsc7JF//2QmheJHvCiTsDQ12Da38nbFqT9I0dcfifGrC5nZ4b2NdRhXyfykMHaGPUyG6hqi6Itn6LjqzBU5WFnD6pZndi4n5rSk9vg21DW2i1zuZzKa6/w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SjaE/06LpW7Bv0OTH3tclplc+AcLi52JWUrxg9Vdq0vd8yWTd4wjA+od8yrC?=
 =?us-ascii?Q?XoPd2Z5k7sAXhD4rJMFhQQqoo9gu2F02Zmm/LT/WulCxEgI9LZ4wAsv77xFQ?=
 =?us-ascii?Q?6QK3CFqj/XHNqRm5vPD8fR2w7BlYCO+R9kTqAiO1hFEeG4hsTgY5FEa/ZjLw?=
 =?us-ascii?Q?I/R5Q1OO5eV//HnWK6NI+jcGx9KArsvB7EgVch2JaCSgRhZ6BuJWHQbGDdIC?=
 =?us-ascii?Q?HKpnTrmXFDEBY96MRJAISE/177m0MibbaGUa4EhX1/O5DsQ64lFWQpM2vPTQ?=
 =?us-ascii?Q?Mk0DnbZoNyGVNIMIcfGRF2TFuey326aTI2YQbBmfYyP3Ok/tLfTWgbSOOBR2?=
 =?us-ascii?Q?tyYpfsPUJCS3tAX+Oe0wskcF+yZBves/Qpb4GuZP5y0bfPT4jFR9lA5pRy1c?=
 =?us-ascii?Q?fRizXQcuykf7fHWp+Xh9TsqkkXOgfuRHBop/DrjaexuxYjMMOtUz27nubIAI?=
 =?us-ascii?Q?RCu1xft22Qw1dg1J3PYJb4o6dxEYocEyHuiSK4QOYATHVwtRN2FGoy37MzNU?=
 =?us-ascii?Q?GnwBDQyoEuw9OhXGr/+bYOZRYvQ/n20bJKsnkDVcxornmNQd4IK/O+NNsf3l?=
 =?us-ascii?Q?HOQzVNFzGks8foIDQOE8+ivhrigVrQruA/6Zz7rK3Mr6O76wv/qNVrfnYU3R?=
 =?us-ascii?Q?55unkXnZpOqlo7Iet4RC/CbFpsQL2myB7YhTvczNOE/Bzhj77wlv3n7SSGbm?=
 =?us-ascii?Q?Y4sa8k6gyCHXtlU3m+7iDMIxtQABG6wGN/4OWYHaLWc6bBIbKdDTELjtr65D?=
 =?us-ascii?Q?vWZKSko7EOve8yUp7IkvCJbFGfTduW0wtxAcMVSpTJgKP/ZtY+98Qs+a49Q+?=
 =?us-ascii?Q?2cdU+QtfJKL06xXINzvUIiy877FIkLxJkcWtnmMNyJtf7QeRgzydC1IiwHm3?=
 =?us-ascii?Q?kqVDkm4zUHVdE7BonqKwhRLBIMnYWM4tMBUlJA1GqjvDDSNEFNvIV/WeeVwK?=
 =?us-ascii?Q?EvTdbu2vThzM32gh8hB21cgYotwf7nBoLodEoCVUJEsxSK2CdoZ5MecUrOzk?=
 =?us-ascii?Q?6awH1nxRFb29XfGdnAYcoeAu/3gkf1wEXzebdQeBe6Cn/gOtg5Q41qJGn1Io?=
 =?us-ascii?Q?EKYVhxu/rqqQqkwkpZk46hcOVKvgzExwjn7i38EWtmV8fAuJH8TghU4yfDsH?=
 =?us-ascii?Q?A8XDEF5SNXxcXQqKGbYdfQ2i5r3uaJsgYJaZ1ZW2cV/H9myzNraI9CMRJV98?=
 =?us-ascii?Q?c4uhfkCVZG4cJPEhIEX+ghkbcyDiVlPQdvFp58I+Vlw9OXPDdEX44FLgscsH?=
 =?us-ascii?Q?UD5n9v7wmch0xTNNksIG4kDvuKsPKGrVbZKISyAi5kwjwOqLcio+Cqtjqom7?=
 =?us-ascii?Q?tZwkQJHnl8JdGvfSu1UytlYKA+JfKGYIR55+77sjNlrYzRahj12fkGe1cXXx?=
 =?us-ascii?Q?yi/e1c2sRnMQxaN5QD+wd1tXCnzvPawJZZtKwc371ZLD+v9SigpWB1mngWcb?=
 =?us-ascii?Q?ggWd1nQbYoKBFsidjKzcQjqd1XETXOCJv0wtCuAb5A/ncHAQgyV8QgA4hxUr?=
 =?us-ascii?Q?q/Riw4C76jw1oeoRrYvoi6IQm0To5iAl7QY940MJXpsYvLic0NxWGATwV69M?=
 =?us-ascii?Q?XRqS/qWSMHzyB/7vLzG9YZYSYLiUoBtxv01VZrGGSxLSOuJxnyXaGj1i5lPc?=
 =?us-ascii?Q?Og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dbe456b-5f62-4988-d2a4-08dc448c3420
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 01:06:54.3726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ku5iwqcJnpKceCa30pQLM8/4UfKdT6oddqsCD+5YB+INpKAfflYZAyVZGkiZqFZkSYH9uvouJK5NSezIQuToIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6422
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

On Wed, Mar 13, 2024 at 11:00:06PM -0500, Lucas De Marchi wrote:
> On Wed, Mar 13, 2024 at 06:06:14PM -0400, Rodrigo Vivi wrote:
> > On Wed, Mar 13, 2024 at 04:54:38PM -0500, Lucas De Marchi wrote:
> > > On Wed, Mar 13, 2024 at 05:44:00PM -0400, Rodrigo Vivi wrote:
> > > > On Wed, Mar 13, 2024 at 03:49:56PM -0500, Lucas De Marchi wrote:
> > > > > On Wed, Mar 13, 2024 at 03:54:59PM -0400, Rodrigo Vivi wrote:
> > > > > > In many validation situations when debugging GPU Hangs,
> > > > > > it is useful to preserve the GT situation from the moment
> > > > > > that the timeout occurred.
> > > > > >
> > > > > > This patch introduces a module parameter that could be used
> > > > > > on situations like this.
> > > > > >
> > > > > > If xe.wedged module parameter is set to 2, Xe will be declared
> > > > > > wedged on every single execution timeout (a.k.a. GPU hang) right
> > > > > > after devcoredump snapshot capture and without attempting any
> > > > > > kind of GT reset and blocking entirely any kind of execution.
> > > > > >
> > > > > > Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> > > > > > Cc: Himanshu Somaiya <himanshu.somaiya@intel.com>
> > > > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > > ---
> > > > > > drivers/gpu/drm/xe/xe_device.c     | 22 ++++++++++++++++++++++
> > > > > > drivers/gpu/drm/xe/xe_device.h     |  6 +-----
> > > > > > drivers/gpu/drm/xe/xe_guc_submit.c |  4 ++++
> > > > > > drivers/gpu/drm/xe/xe_module.c     |  5 +++++
> > > > > > drivers/gpu/drm/xe/xe_module.h     |  1 +
> > > > > > 5 files changed, 33 insertions(+), 5 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > > > > index 5f0a2bdb7c24..296bc75a55f7 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > > > > @@ -774,3 +774,25 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
> > > > > > {
> > > > > > 	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
> > > > > > }
> > > > > > +
> > > > > > +/**
> > > > > > + * xe_device_declare_wedged - Declare device wedged
> > > > > > + * @xe: xe device instance
> > > > > > + *
> > > > > > + * This is a final state that can only be cleared with a module reload.
> > > > >
> > > > > same thing I mentioned about module reload elsewhere.
> > > > >
> > > > > > + * In this state every IOCTL will be blocked so the GT cannot be used.
> > > > > > + * In general it will be called upon any critical error such as gt reset
> > > > > > + * failure or guc loading failure.
> > > > > > + * If xe.wedged module parameter is set to 2, this function will be called
> > > > > > + * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
> > > > > > + * snapshot capture. In this mode, GT reset won't be attempted so the state of
> > > > > > + * the issue is preserved for further debugging.
> > > > >
> > > > > Maybe make it a little bit more drastic so people don't use it when they
> > > > > shouldn't. I really hate the amount of reset=0 I see on machines being
> > > > > used with i915 with the additional patches to achieve a similar goal.
> > > > > IMO it should be a very targeted tool in a toolbox, not the hammer it
> > > > > became.
> > > > >
> > > > > "In this mode, GT reset won't be attempted so there will be no recovery.
> > > > > Any GPU hang will completely kill the GPU so an autopsy may be
> > > > > attempted.  Use with care, if you know what you're doing."
> > > > >
> > > > > > + */
> > > > > > +void xe_device_declare_wedged(struct xe_device *xe)
> > > > > > +{
> > > > > > +	if (xe_modparam.wedged == 0)
> > > > > > +		return;
> > > > > > +
> > > > > > +	atomic_set(&xe->wedged, 1);
> > > > > > +	drm_err(&xe->drm, "CRITICAL: Xe has been declared wedged. A module reload is required.\n");
> > > > > > +}
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > > > > > index d10664d32f7f..de3149baf82f 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_device.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_device.h
> > > > > > @@ -181,10 +181,6 @@ static inline bool xe_device_wedged(struct xe_device *xe)
> > > > > > 	return atomic_read(&xe->wedged);
> > > > > > }
> > > > > >
> > > > > > -static inline void xe_device_declare_wedged(struct xe_device *xe)
> > > > > > -{
> > > > > > -	atomic_set(&xe->wedged, 1);
> > > > > > -	drm_err(&xe->drm, "CRITICAL: Xe has been declared wedged. A module reload is required.\n");
> > > > > > -}
> > > > > > +void xe_device_declare_wedged(struct xe_device *xe);
> > > > > >
> > > > > > #endif
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > > index 19efdb2f881f..987a57205fc4 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > > @@ -34,6 +34,7 @@
> > > > > > #include "xe_macros.h"
> > > > > > #include "xe_map.h"
> > > > > > #include "xe_mocs.h"
> > > > > > +#include "xe_module.h"
> > > > > > #include "xe_ring_ops_types.h"
> > > > > > #include "xe_sched_job.h"
> > > > > > #include "xe_trace.h"
> > > > > > @@ -949,6 +950,9 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > > > > > 	simple_error_capture(q);
> > > > > > 	xe_devcoredump(job);
> > > > > >
> > > > > > +	if (xe_modparam.wedged == 2)
> > > > > > +		xe_device_declare_wedged(xe);
> > > > > > +
> > > > > > 	trace_xe_sched_job_timedout(job);
> > > > > >
> > > > > > 	/* Kill the run_job entry point */
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> > > > > > index 110b69864656..61272553f40f 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_module.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_module.c
> > > > > > @@ -17,6 +17,7 @@ struct xe_modparam xe_modparam = {
> > > > > > 	.enable_display = true,
> > > > > > 	.guc_log_level = 5,
> > > > > > 	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
> > > > > > +	.wedged = 1,
> > > > > > 	/* the rest are 0 by default */
> > > > > > };
> > > > > >
> > > > > > @@ -48,6 +49,10 @@ module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
> > > > > > MODULE_PARM_DESC(force_probe,
> > > > > > 		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
> > > > > >
> > > > > > +module_param_named_unsafe(wedged, xe_modparam.wedged, int, 0600);
> > > > > > +MODULE_PARM_DESC(wedged,
> > > > > > +		 "Wedged mode - 0=never, 1=upon-critical-errors[default], 2=upon-any-hang");
> > > > >
> > > > > as we chatted earlier today, I think there's one thing missing. If an
> > > > > engine hangs, we won't notice as GuC will reset the engine by itself.
> > > > > We still need to pass GLOBAL_POLICY_DISABLE_ENGINE_RESET as a policy to
> > > > > GuC in the ADS structure. This is what I was attempting earlier today.
> > > > >
> > > > > I was wondering if we could even update that in runtime with
> > > > > INTEL_GUC_ACTION_GLOBAL_SCHED_POLICY_CHANGE so we can target the debug
> > > > > only to when we are ready to reproduce the issues and only on the
> > > > > specific device.
> > > >
> > > > I like that... Perhaps instead of the module parameter we have a debugfs
> > > > entry where we switch the state?
> > > >
> > > > So, on a debugfs write to switch to this mode that gets 'busted'/'wedged'/'dead'
> > > > on every timeout/hang, then at that time we send this sched policy change?
> > > 
> > > the shortcome that we always have is that it doesn't cover the probing
> > > part. One common problem on early device support (either because of hw
> > > issues or driver/guc bugs) is on default context submission. If that
> > > receives a timeout, shouldn't we declare it busted?
> > 
> > hmm... indeed.
> > 
> > so, perhaps continue with the mod param xe.busted=2 but then right before any
> > submission we check for xe.modparam.busted == 2 to send the
> > INTEL_GUC_ACTION_GLOBAL_SCHED_POLICY_CHANGE before sending the command.
> > 
> > so on the next upcoming execution it would avoid the gt reset entirely.
> > 
> > then we could use it either at boot with xe.busted=2
> > or at runtime by
> > echo 2 | sudo tee /sys/module/xe/parameters/busted
> 
> I think we can use the modparam on probe and already put it in ads.
> That dictates the default behavior for the _module_ regardless of the device.

agreed. I already sent the 3 patches that accomplished that.

> Then we allow either setting the param to change the default behavior
> like above or we create a debugfs so we can set it per-device after the
> probe.

I have the 4th patch in here: https://github.com/rodrigovivi/linux/commits/xe-busted
that is targeting this goal. However I'm still dealing with trying to change
the guc sched policy on the fly.

I'm not convinced that i915 code around that 0x506 command is the right code,
so I'm still investigating the spec and doing some experiments.

But I'd like to move forward with this default behavior with module
parameter so we unblock our sv teams.

thoughts?

Thanks,
Rodrigo.

> 
> Advantage of having the debugfs is that we that we could even go on
> other devices we don't want to debug and set them back to 0 too.
> 
> Lucas De Marchi
