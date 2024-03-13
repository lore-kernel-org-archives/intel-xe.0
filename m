Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0158FC54E58
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 22:06:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F5F10EDF6;
	Wed, 13 Mar 2024 22:06:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YyWE939a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95DF210EDF6
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 22:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710367583; x=1741903583;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BX4K/XXSkhn8jfbsHR6Dcy4/MblC+JnjgfLo0XxdRt4=;
 b=YyWE939aC+NqyKhc+RfVKiBvKspq8RmGCRF69G4Lmyj5ubYJXuQu2mdz
 Wh8nh2YFDdwITVQ8d7F07408rwiSGZJ9KxbKT/voljYnAWYwfG1DDKeiH
 wXhTGjvWbFej3jeyhSSvFQmX7wJ9DB77wYEK2Q36yFtuEkgneXEPYhuSd
 epHHM00rN0DB8EdB8Ta2FqYr3y5ZjdcE4hyKPOP+MD7gNG4n20HZ/37Hv
 PPsp1WxbyM/4TlAorodVUSRRJGMVzZBO75nbkrc2fAGFqo+tgTg4d30W0
 OQrclIm66EsrTv0iH6Q4OKnEN+CgDVssu98nbpnF6RggZAmfdCiBs2Bl/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5026769"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="5026769"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 15:06:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="12485344"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2024 15:06:22 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 15:06:21 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Mar 2024 15:06:21 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 15:06:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hg7BMvxUknucVJenOIMGzkmeqdqU6XOzGKnI8kKw+rpkyAeQ6vbG0xFJCVveGAgJu/F975JFRbqYTlLYPoi7pNlPHkUlaA6avITxz/UBnSNI3IPphGcsrXwjoqZGi3kbzLqx0uswgzMgG7w0EYcFl61wp/fHbnSMbxsQgCWXb6RBsxcU8AbACkRe6m9EydsiGvnJo8sNd2kaoP3Pjpc8Ccn/EteXj+O8I4H1zCxvfVhol/iyQgI1m6uapp2qGUh2IPp94aG+ECbpvYIlq4USB7p0xXEW3EESLPO6ar4fDwklwxymussj360LGUyXsQJ+32+FCY0+EzFMuWUOjHBT6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7K0luT4pJKGgETtUVLCsdFSZDeDpCyFh9/Reb3JaiU=;
 b=ft7Lt0yDHgD3f90ZgGWq2PEdMtv7YVAbZsomiCrVv3VZfaQ1xw1YkRB+KUTIGrR+a2XSswbgYpY23SEF6jcUxYVHVQh+dS317mRyqu5T3TNGHWu+qg388pEp4uGRo+G+DukOsdMoriNOUNwWc+flAk7pTE6PlRwLTy1K2e7YYc/1Enem3nn658kqGguoN3CCASuRDUtYWfntzA5QdQLakyOz/TDK3y6qrF0Jp8DapOMPjvqF3Ys4PWe6ELn/q5+7L++/vFSGxYK1TQPZA8qWnvJXlr8WS0I0lvQ0wJGxZKLv6x5KRC2jl0X9lkoSF6HRTAhaUeFyIz62Xvn1krQ9iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL3PR11MB6388.namprd11.prod.outlook.com (2603:10b6:208:3b8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Wed, 13 Mar
 2024 22:06:18 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 22:06:18 +0000
Date: Wed, 13 Mar 2024 18:06:14 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Alan Previn
 <alan.previn.teres.alexis@intel.com>, Himanshu Somaiya
 <himanshu.somaiya@intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Force wedged state and block GT reset upon
 any GPU hang
Message-ID: <ZfIjVj-MJD2C6YgD@intel.com>
References: <20240313195459.141463-1-rodrigo.vivi@intel.com>
 <20240313195459.141463-3-rodrigo.vivi@intel.com>
 <7chi3xtzjj46u4ape5o5uz3mkgqyogyu4egb7772j5mbk5i6z2@glcn273zt7o7>
 <ZfIeINI5VJJaaVto@intel.com>
 <jyhbqihplavieq3dc3ltg3hdqz2i5fsqvdbksbt3q3lz4euyid@hmhhcj43ebll>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <jyhbqihplavieq3dc3ltg3hdqz2i5fsqvdbksbt3q3lz4euyid@hmhhcj43ebll>
X-ClientProxiedBy: BYAPR02CA0020.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL3PR11MB6388:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f61d8f2-a894-4ba3-63e6-08dc43a9cf1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AxLYha52Hx0/mMK+beiebDyTn+w8MDreEhbh2utSNteAGRZTlGsUoq/f4lKe10rkb7QXcqs8oMpCeaVWafcdmuAeOkU5C0HXmC/Dpk/xz4xw1dgfS1dtHN3OudXoiVJ2XRNdYdVDJ0pBpNZoahFb/GujUKRKq2l3tkFTKV/RGfUMDwdARSAtBJ/9rYX4SlPI//Nqp7VAKWvejyaKjTY0jgzdPMTrZLSwDi4Ni3M+U2tB4e6t1zmJ2dEKHL8iyadO3T+Bjz7lYfGKpxvhQ+t0kGn+KnpmNB7gSP52bTT9C6uyShLH5RFoBhev80iZ+SgO69uM8e/DXh4k9rB47dtUbX10JY1jUPbtVBONU0yRhNlSjJdaq82sUo2P7EiRcORs90HIajDon7phz2MN2q4yqKBlxKi8cRofoADGmvN9bkULLD8/ACpTtflmXjezzcPv1lSTnu4uk7wjFAmhmUaTVXpxA39n9Z62L6IwSEn3LLTEqYWK6jDjZ7/dNt2UnEXmYZ5BuBkeeN6HetHE7lzwI064oDSl44VU4xfMHNOv0qqzKAYMISfIQqguHemcru/gpZOGBnqD/FRHlB5cNdHxTq3Q/cwJ/YzIXL+pdVl8TxDQPwJ/5xIu9b/K4TbEKPIiqitz7/EAxPYqAHOfPzzs2z6/96SznDm23JisX3liU0U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bx64PpRk54FdzzvS1H4hy+LdxSCnvGcFsPSgmm9rUff/hGude0cpb8BU+GKL?=
 =?us-ascii?Q?1FLHUecYJVUODXpKPfnX/MpQ24QbF5wxsOeswZHFTzUcr3V2FnIUa+8q+P7q?=
 =?us-ascii?Q?yWkH7Vf8Hjnml+lSPCVwlHQGp8ayPm7gORPdHgGaA6woRRMgiDxetMjsXRgi?=
 =?us-ascii?Q?gLyk3QnUjur3Cxq7IPL/YDsxPO3Pxqxw/MBSQH1c1ZAAUAZoZUm2sv4N3ZNX?=
 =?us-ascii?Q?11wgExCeTSctY/yzAtyoJZKIzPh6M9KExtgiMFa8f/J13nsTcagX9ngW8tVj?=
 =?us-ascii?Q?CNZhVO4siwwxynzAFIZl1meHFWycAMuy6EZ7ULPd0bJXpIrEOBeuKVse/IIG?=
 =?us-ascii?Q?zt3TbeqLxNf6OKiWgaLzbgqluzRQZJwA169LijmosOPgH5sgvYunnF5VV5bl?=
 =?us-ascii?Q?9d3RuVxrDkDbuNm8B5XkQlrNo2DRMGcVW7dhq+NHThTht7+i8oMCVx1l11lg?=
 =?us-ascii?Q?o/PG39zM/D+rpWY/iTDDafrruqL0e9GFoOa+NdP8IUMVNNrIRJS1XPxxOnDg?=
 =?us-ascii?Q?gHKA8vMPM3XXe1DC7mNXvD1EWyT73eItXNiBxakvBALUW8CJx+fV3fVUTuyF?=
 =?us-ascii?Q?ZDo186rq5MzHXyVZYwjGn5TVT86KiFfAWWbArReqb5tACXbn3jA95zH/iwvY?=
 =?us-ascii?Q?giD/6yWOwIzoEu8OwShJYgPEuWfSjLTabYlKgBMQIJRrEtFCi+t8AJM8sw7E?=
 =?us-ascii?Q?cvlIGt3+W8EiktDbtm3jr+Cn8JSmflSoNcPHpUkdmWrij6inJuGJF30yl3Rs?=
 =?us-ascii?Q?CRXCMTDoNMzBMejy/vTdFzmz7F069Q/qkYJtrGzMmZRiR1DykrkZn+nzLDGZ?=
 =?us-ascii?Q?zRiOjagPsh+IDy1hqt6hFZ6o7aa5oFhIEARfRYRxeZwuoGlduxQshOGozpL5?=
 =?us-ascii?Q?A+jK0o/GGmmogYt2oIO0M6E2ZIv9JN+yEHVCHhR/HWRkKtjTUWUAMz+9Zghd?=
 =?us-ascii?Q?vbUn07clScO9tKbeIh+Za/kkrPHgr9wr1ltB1P+1g3PYlGTlqW46fIDS1SWa?=
 =?us-ascii?Q?10TB2ZgGVNsSr5WCteaKoEQ+lxgF85842V4JIjXIDxb0by4c/Kn8eVlaZkHF?=
 =?us-ascii?Q?3o7cB3XaciGpA8YPvxK/OBK6WGtbauaMiXQRf7/XgfYUDkNitdZnuBX3+o/d?=
 =?us-ascii?Q?rsxGvdB8KNTxpC8+3mUks6RjpPLEW7Ipbc0vW4azokO+9l/TsGCxevuzjFcz?=
 =?us-ascii?Q?76Tkmo+WNOsCj49jxZoYCDDQH9xqsTQkaqys3cgPaJ621nBnhI1r6k0w9Uss?=
 =?us-ascii?Q?GFqxvWK3GBgtQkgGNa+7lSCX+3T2/HOKbNv25HgBVeHcrHhAWcKylhzEEMCJ?=
 =?us-ascii?Q?NxL6WkSdQvKYdMYwmaImTCGGQ7SYN9fZxYCV/zTc3kp/ljKtbIe5o4uKcuRP?=
 =?us-ascii?Q?Twd3XqV1nOWTQD/9torIICVUil/R9fpwJzxNH8neIiEItalkBuQtpsIdG5+k?=
 =?us-ascii?Q?GrYn+npEUP39vtEnA/YCYP9SanNnuVujgx0xHTWv5IIcnfj6JE1f4pYM5Yto?=
 =?us-ascii?Q?mJU6TQYx+q++6Dv/9EVqf6K1TuEgX5huDKic7PeRWm+1hjQ5LG0U5jswhbV/?=
 =?us-ascii?Q?nPiXVSSfXkVaEccRn1LjmglrjDM3UWT5SACla7zPmJRZqCHkAqAYV05+fywU?=
 =?us-ascii?Q?/w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f61d8f2-a894-4ba3-63e6-08dc43a9cf1f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 22:06:18.6178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /UGlEH3ZKatiOExGeZPv2wb1S3wEeNq5lCVoc/LVqT5BVpEiwmhKYai8GIdF+4f1cUg9/WqFGtlgCDvu64arHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6388
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

On Wed, Mar 13, 2024 at 04:54:38PM -0500, Lucas De Marchi wrote:
> On Wed, Mar 13, 2024 at 05:44:00PM -0400, Rodrigo Vivi wrote:
> > On Wed, Mar 13, 2024 at 03:49:56PM -0500, Lucas De Marchi wrote:
> > > On Wed, Mar 13, 2024 at 03:54:59PM -0400, Rodrigo Vivi wrote:
> > > > In many validation situations when debugging GPU Hangs,
> > > > it is useful to preserve the GT situation from the moment
> > > > that the timeout occurred.
> > > >
> > > > This patch introduces a module parameter that could be used
> > > > on situations like this.
> > > >
> > > > If xe.wedged module parameter is set to 2, Xe will be declared
> > > > wedged on every single execution timeout (a.k.a. GPU hang) right
> > > > after devcoredump snapshot capture and without attempting any
> > > > kind of GT reset and blocking entirely any kind of execution.
> > > >
> > > > Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> > > > Cc: Himanshu Somaiya <himanshu.somaiya@intel.com>
> > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > ---
> > > > drivers/gpu/drm/xe/xe_device.c     | 22 ++++++++++++++++++++++
> > > > drivers/gpu/drm/xe/xe_device.h     |  6 +-----
> > > > drivers/gpu/drm/xe/xe_guc_submit.c |  4 ++++
> > > > drivers/gpu/drm/xe/xe_module.c     |  5 +++++
> > > > drivers/gpu/drm/xe/xe_module.h     |  1 +
> > > > 5 files changed, 33 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > > index 5f0a2bdb7c24..296bc75a55f7 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > > @@ -774,3 +774,25 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
> > > > {
> > > > 	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
> > > > }
> > > > +
> > > > +/**
> > > > + * xe_device_declare_wedged - Declare device wedged
> > > > + * @xe: xe device instance
> > > > + *
> > > > + * This is a final state that can only be cleared with a module reload.
> > > 
> > > same thing I mentioned about module reload elsewhere.
> > > 
> > > > + * In this state every IOCTL will be blocked so the GT cannot be used.
> > > > + * In general it will be called upon any critical error such as gt reset
> > > > + * failure or guc loading failure.
> > > > + * If xe.wedged module parameter is set to 2, this function will be called
> > > > + * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
> > > > + * snapshot capture. In this mode, GT reset won't be attempted so the state of
> > > > + * the issue is preserved for further debugging.
> > > 
> > > Maybe make it a little bit more drastic so people don't use it when they
> > > shouldn't. I really hate the amount of reset=0 I see on machines being
> > > used with i915 with the additional patches to achieve a similar goal.
> > > IMO it should be a very targeted tool in a toolbox, not the hammer it
> > > became.
> > > 
> > > "In this mode, GT reset won't be attempted so there will be no recovery.
> > > Any GPU hang will completely kill the GPU so an autopsy may be
> > > attempted.  Use with care, if you know what you're doing."
> > > 
> > > > + */
> > > > +void xe_device_declare_wedged(struct xe_device *xe)
> > > > +{
> > > > +	if (xe_modparam.wedged == 0)
> > > > +		return;
> > > > +
> > > > +	atomic_set(&xe->wedged, 1);
> > > > +	drm_err(&xe->drm, "CRITICAL: Xe has been declared wedged. A module reload is required.\n");
> > > > +}
> > > > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > > > index d10664d32f7f..de3149baf82f 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device.h
> > > > +++ b/drivers/gpu/drm/xe/xe_device.h
> > > > @@ -181,10 +181,6 @@ static inline bool xe_device_wedged(struct xe_device *xe)
> > > > 	return atomic_read(&xe->wedged);
> > > > }
> > > >
> > > > -static inline void xe_device_declare_wedged(struct xe_device *xe)
> > > > -{
> > > > -	atomic_set(&xe->wedged, 1);
> > > > -	drm_err(&xe->drm, "CRITICAL: Xe has been declared wedged. A module reload is required.\n");
> > > > -}
> > > > +void xe_device_declare_wedged(struct xe_device *xe);
> > > >
> > > > #endif
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > index 19efdb2f881f..987a57205fc4 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > @@ -34,6 +34,7 @@
> > > > #include "xe_macros.h"
> > > > #include "xe_map.h"
> > > > #include "xe_mocs.h"
> > > > +#include "xe_module.h"
> > > > #include "xe_ring_ops_types.h"
> > > > #include "xe_sched_job.h"
> > > > #include "xe_trace.h"
> > > > @@ -949,6 +950,9 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > > > 	simple_error_capture(q);
> > > > 	xe_devcoredump(job);
> > > >
> > > > +	if (xe_modparam.wedged == 2)
> > > > +		xe_device_declare_wedged(xe);
> > > > +
> > > > 	trace_xe_sched_job_timedout(job);
> > > >
> > > > 	/* Kill the run_job entry point */
> > > > diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> > > > index 110b69864656..61272553f40f 100644
> > > > --- a/drivers/gpu/drm/xe/xe_module.c
> > > > +++ b/drivers/gpu/drm/xe/xe_module.c
> > > > @@ -17,6 +17,7 @@ struct xe_modparam xe_modparam = {
> > > > 	.enable_display = true,
> > > > 	.guc_log_level = 5,
> > > > 	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
> > > > +	.wedged = 1,
> > > > 	/* the rest are 0 by default */
> > > > };
> > > >
> > > > @@ -48,6 +49,10 @@ module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
> > > > MODULE_PARM_DESC(force_probe,
> > > > 		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
> > > >
> > > > +module_param_named_unsafe(wedged, xe_modparam.wedged, int, 0600);
> > > > +MODULE_PARM_DESC(wedged,
> > > > +		 "Wedged mode - 0=never, 1=upon-critical-errors[default], 2=upon-any-hang");
> > > 
> > > as we chatted earlier today, I think there's one thing missing. If an
> > > engine hangs, we won't notice as GuC will reset the engine by itself.
> > > We still need to pass GLOBAL_POLICY_DISABLE_ENGINE_RESET as a policy to
> > > GuC in the ADS structure. This is what I was attempting earlier today.
> > > 
> > > I was wondering if we could even update that in runtime with
> > > INTEL_GUC_ACTION_GLOBAL_SCHED_POLICY_CHANGE so we can target the debug
> > > only to when we are ready to reproduce the issues and only on the
> > > specific device.
> > 
> > I like that... Perhaps instead of the module parameter we have a debugfs
> > entry where we switch the state?
> > 
> > So, on a debugfs write to switch to this mode that gets 'busted'/'wedged'/'dead'
> > on every timeout/hang, then at that time we send this sched policy change?
> 
> the shortcome that we always have is that it doesn't cover the probing
> part. One common problem on early device support (either because of hw
> issues or driver/guc bugs) is on default context submission. If that
> receives a timeout, shouldn't we declare it busted?

hmm... indeed.

so, perhaps continue with the mod param xe.busted=2 but then right before any
submission we check for xe.modparam.busted == 2 to send the
INTEL_GUC_ACTION_GLOBAL_SCHED_POLICY_CHANGE before sending the command.

so on the next upcoming execution it would avoid the gt reset entirely.

then we could use it either at boot with xe.busted=2
or at runtime by
echo 2 | sudo tee /sys/module/xe/parameters/busted

> 
> I like "busted" :)
> 
> Lucas De Marchi
