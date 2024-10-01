Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7561FCF3188
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 21:30:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15EA810E1AD;
	Tue,  1 Oct 2024 21:30:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dcRuGEOv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6020110E1AD
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Oct 2024 21:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727818229; x=1759354229;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=p+kpMYcq6l+FmarVzh5v9/QvVWM6rEGt7NOZ5GDWaZs=;
 b=dcRuGEOvlt93PDOWuUnpaaCJgpHWtkaB6uZ3Fb3FIskE2V+Q+I9LgBEx
 4DV3dVKDCH80cesFqjYc3UYCmJo6/UJgNJBHRgTekK8hX4HijO4fpCltR
 uvl7GzLUGfFbIcizqaIrJxrnE8A8yleqQw1j6tmr5cIVF+bz+3Gp9Oy0d
 XfNux1yLO0mBgb8OHLWFu0I+DowEzoaMN4jjKvvlmmF4cRAUjiTIwWfE8
 0I/JygYOuMU+jot3LKsDRVwmnAPMBuhG6f5JZHrGaoEPzWmx9ZxcyNUch
 AVbXWxAFB4JE+xelPu21qp8+uHKPtT1J2vWV63SqwACSK2qLxsR0Iptk5 w==;
X-CSE-ConnectionGUID: jmM1Vp/hQyuU3hZHv98FGQ==
X-CSE-MsgGUID: bt4KxF2jSBamblyYOxn6kQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27151556"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; d="scan'208";a="27151556"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 14:30:19 -0700
X-CSE-ConnectionGUID: KZRXuBCqRLqE0QpA36q7/g==
X-CSE-MsgGUID: Fx5xFVG9SE6hD/Q/p3tNnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; d="scan'208";a="74607486"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Oct 2024 14:30:20 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 1 Oct 2024 14:30:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 1 Oct 2024 14:30:18 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 1 Oct 2024 14:30:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 1 Oct 2024 14:30:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ImN9n0n/WsF+Og8J8Jl7wiQ2ylL6OZD6YbcDTcP8/qzGA9+pyDj8BBRO7ymL8jGDl6x/+8r5IFBypYv9xh0Sdd9Wdsl2f2YbE22sEIWLSeDDIpvvBP/FAWaBFjv/GP/G74uuwjGeaBCNsy0RjTAbvgpPd3O0bTSZNmem6mxPh+3o09Oh/zuUufULxQ37PBufgNniF86dsW3C64JOqyJfP/caIr9Bx3BOJb0hBIk+UryD1wGMb5dmf2qNSz5a79ULZpqEYwJJtDq8KCMornbYSNUu2FqKJJ/ghTF7BxogFGXj4kx7kM7xkR6/skNLaQ3Ojv7x6Y1cH5KZDNHefanZvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NxSh42C2vqYoLRvq38u14EC1SUJOjr+trIF+gV/HUpM=;
 b=E3BHiv4OLyPPhhziDgBnZ6oaILFEF8dEgXH5NwcdcwnMraea04tVXx5SzUY4xiVp8gvkKOFsiipvudJo8BYe/k17s08KNpkhTVQji8xlue3jgyVAAB1RNdW0ij4jjIWKpw+VKKUdew6msAIkZPZaVTneT1lsIMOWggj9kMpU64reQP2WzbVdIdFdQP6yoHiGLGjpX4N1TA51vswhJSboFoytXZC+Enc6iPpClYnjeCm57LcHoe6t1+q5qtm93gYoyWIi59Ect0Ok0SY7VqNJ7F4UKNU7rTjPY0FEgeqmZWTnMseeK2lOO2Em+n1pdnqI6ZfWieYZ+RD3jbXVUurw6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN0PR11MB5962.namprd11.prod.outlook.com (2603:10b6:208:371::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Tue, 1 Oct
 2024 21:30:08 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8026.014; Tue, 1 Oct 2024
 21:30:07 +0000
Date: Tue, 1 Oct 2024 14:30:04 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLkZVTEw6IGZhaWx1cmUg?= =?utf-8?Q?fo?=
 =?utf-8?Q?r?= drm/xe: Prevent null pointer access in xe_migrate_copy (rev3)
Message-ID: <20241001213004.GC4891@mdroper-desk1.amr.corp.intel.com>
References: <20240927161308.862323-1-zhanjun.dong@intel.com>
 <172773933963.1139456.6715653501533975509@2413ebb6fbb6>
 <e45152df-2fe1-4457-b313-bee1096d5e47@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e45152df-2fe1-4457-b313-bee1096d5e47@intel.com>
X-ClientProxiedBy: SJ0PR03CA0359.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::34) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN0PR11MB5962:EE_
X-MS-Office365-Filtering-Correlation-Id: 141355be-4288-4e50-851f-08dce260388a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wQYb+KT5Wgxe8dC2qPU4hW8khhqcA5yEVor0Me+A7cKEBO9SmYjL6kwSHRLa?=
 =?us-ascii?Q?4cQWqGALKyngk8XIklMO8Y21EX7a3foAi7YAijisoTshmmUNM+726Kbar/Wo?=
 =?us-ascii?Q?LrM4KwEWma8lpavSOA5ScS3SyiQ42lsQ8Q9S0px5T4+EWt4N+h2Uw5D92zcU?=
 =?us-ascii?Q?OVXr7vJ3TcnxEmAaFnn5Tw/CEeyUW6DY9YjIK+S2WZsIYm4EZlkrXvQEW2Vy?=
 =?us-ascii?Q?zQW8ARZccEtTUHesD0t/KL9R8qUCZCXjQODSArzmNckXBXyZ4fGHejc1HxR4?=
 =?us-ascii?Q?DNucORdqjW0AOGGZ5poD8lO2AvRPib50aoEQopvqx9yHkHsp0vHp+18HIxOV?=
 =?us-ascii?Q?sIyToUOk+hpp8XVv/ehKbl6txvO+MPl0eo0udVGPqOhChbgd/4R+1nteTTI1?=
 =?us-ascii?Q?9ndtQjyjkxIPfBh8nTgIjP3dM1I3hZKbgi36KvN/tY0aqcD/GgiolfTM1ESB?=
 =?us-ascii?Q?2O+5zADqYXoO5GcCxp3X3q8uCgSQvGGXp0yuYoFtdjDPuuSAiaWayNI1lYSM?=
 =?us-ascii?Q?B4O9ynMuTwHBtFZXsi/Ura8B7tnXV1jm1KHHUSnljoBXjcfDqBWXdjfStXW4?=
 =?us-ascii?Q?v2YGENjbmUi13C3aVxZLvkoH0OB8fjn72eQ9ylNC3LAvLqQuuSJgHdpskuyk?=
 =?us-ascii?Q?DmNt18/XQ7Ziqg+7qgOl4bGIxU+iw2ghV8jD/CVep/YrkP0TniJRdFMdYhGJ?=
 =?us-ascii?Q?+1OyA5oX59g3FXMUD1rtyuPYew5wVPzOPA8AGcPgXjWffNJV6ZpYXkhkD2Uh?=
 =?us-ascii?Q?X+h7KxLpm7AfLRDKgpOUvXzjC20aT7o7UaP1tzPPWTck3JMmH1S8Cf5/7Jax?=
 =?us-ascii?Q?lrQsHEfQ/Ec+6NqqHCD5vzAQCQiA2nEIwQs0KQedwx50u9SAqWvUaGMpKbyE?=
 =?us-ascii?Q?U/oBRKhmxs/hmtbtkDUOy5mAVQqRRil1nDgC+51EJmEVnh9ip3w1CNUs09v2?=
 =?us-ascii?Q?o648qVEUKGhJnlnDD348WQEodd3WnH9BWInFVV6mqIvxMhZI7qcx6aC9i1OS?=
 =?us-ascii?Q?t0GpM1ppFSWPQSi097I06WfHaDRrg0vH/eyAiyIebHAHezjKE4kt4aB1otuG?=
 =?us-ascii?Q?cqh9InE0YEL00WDE1EbobHoizcXX2fFMikWBIqtBiwxON+Cx+9IVteeKm+XH?=
 =?us-ascii?Q?vTK4elbdecRvd1MmdBADWA6vf3kMcsZtNDjavMuwXfQ9IoJxhGg3HAsrMeJ8?=
 =?us-ascii?Q?tHH0yHh25BMC+zZHioArTqs3eQizgGpG2/yNMet+Ova9Us8qny83twcXMtg?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UjRQHSN1m0sYaTQVKPfDaxAGsfGt2rr0vpbBXx4ftliPgdUJl0OoR+A266pa?=
 =?us-ascii?Q?4Qen78fCw94vn4w5L2/OJQN6q1vHwJAYCaiVHRdHI7Z+cM0WfVjlFz5NyVxd?=
 =?us-ascii?Q?EfnxP9m6pFBQs2mKbeDe8YRnWhm4d1n0dC8+7lJlUo4n8CZVBSGslT/3uIEG?=
 =?us-ascii?Q?jER+hqoRf5dZ+u8uLvUOxz9ZMOMmMdlZrtwRORjYzfXxV04rAajVYcRmKQrn?=
 =?us-ascii?Q?1dpsokX9WQQ8IotnQ2v8ejXvdg2pefefM4THouHQ+KQvh2OCAmqVG0BWOPPt?=
 =?us-ascii?Q?pXPwjdNA++R7553saf4oK0C/Jn+/a0KIOhNjwLyS5P1lBTXe+dYosn5lzqP2?=
 =?us-ascii?Q?7leDJJ6bJlxuMLEZq1NLFFgt7VWaw3xbExRaMjlaaglRh/jPwvoXQnJ99gKh?=
 =?us-ascii?Q?NeJdKNUoWDxzRUJ0UYtMQqQnl1X3HC5S4p9WoW66IQ6yJ2GDeT6cD1D3I64r?=
 =?us-ascii?Q?MLv65w+eORqwwLhYAPSi00hgGOthHU0zBkQHf/Da0R9Q/iPeOB0h0sB9T+s5?=
 =?us-ascii?Q?nEIsH/wD/dPXXAVfYz2tuZ2Vvbrv9MPPDWuU2Fqy6wYvnlP8bnMsuFJKNBMa?=
 =?us-ascii?Q?IkBYKeQd67/uTdAwHQzHwZ1SBVilK79HFTcS8HWf3E1EfGJqaV0HeFczumAU?=
 =?us-ascii?Q?QaZ6T4MIhJF1SI5QHtGs4Gj9GlNsRRbxUTBcIf4IBXlnaKLBKQEvO0z66c6E?=
 =?us-ascii?Q?6c4TtX7LiGfDZ+pwE1sQ/3JBXJGAHHES1SxEpLVTUGBmpI1vmhuH9x9ZAlD9?=
 =?us-ascii?Q?vUgQUCW6KV9AnSYO6KvDuJ1IHbGBuMBlakZPEheRoU6jymIM4S6+LA8mwY/L?=
 =?us-ascii?Q?0XGqoKwRNHPHNzyuOdbiKjZKYnbuS/PsPOV6/NF8kWX+abTmNS+XydnukUPY?=
 =?us-ascii?Q?LyXp8DRIz2RipXAVs7CLgiMOwu95HRr6EZrxBRWvH76G1Utcn+GShDnRAnIT?=
 =?us-ascii?Q?/9wKAiCeyCHZC3w/Ydj5uswQck4XL/7d1cGMikE5p3ZzLXtyMTP1jfaKto43?=
 =?us-ascii?Q?SoAT7dXPXbuig16eYeHF8MDffawoXG16VpkywXp1tHG7tvOytumDTAGTVTXS?=
 =?us-ascii?Q?efExuKQ6g5slwQPccX6LzH/cmLVSKgtynpWoncHpvsUFsM6IYhPgrXU6En/Z?=
 =?us-ascii?Q?tAYwPLiNIXPVLMh906iOmoL1O/K4Wcfz9A6uM4zS9EPzu9KRppmGhIjvkYJ6?=
 =?us-ascii?Q?jfGcVdPpLmsE/bBJeOWy8M5mWzu/YQwdCLY5D+0d49RQ/pJCbd2SkcVUarF6?=
 =?us-ascii?Q?ttg6MC99hze/4c4iuYr1ASDKmbzueoXtmZrJ+cYqGT3f8n6U3FUymH4kMc0s?=
 =?us-ascii?Q?q0S53E3J+hhyFkbGpAUrLOU3jOyIMChM/NVbOQGY8INOMecRkEbQ4bq8G19d?=
 =?us-ascii?Q?pgKgQrRwm1wUqi/or0KDBN+pn19/S0NS8Y7uBe8StCak6vOxWK+0rKCnes1d?=
 =?us-ascii?Q?KO1O9Fz8r2OnSsOK3HtP309am/ibNlQf1q/B0xUd6nsDv/KxJjG1VCPSKMb/?=
 =?us-ascii?Q?lFAXoYg7W0WVHLN9rW6c2h0UXTA4cSjeK/OPryFAnMnOQLnhoo4xsYRWktPw?=
 =?us-ascii?Q?cKRlrn7rkBXytDWxmExK/4jIz+Du1Lz2Vaei8yvg+cGjKwXDW5USk1v4zFS/?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 141355be-4288-4e50-851f-08dce260388a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 21:30:07.5283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kph55xIwKskxVko5hchxYw34SZFd33uhgVoCxgOH8TMC3mIP1ftktngrpZqM2CZxBH4Vc0EPZs8IFibpu8DGiiEd3aNGl8BiRfMH2qPeJZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5962
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

On Mon, Sep 30, 2024 at 08:14:18PM -0400, Dong, Zhanjun wrote:
> All failures is not related to this patch.

Applied to drm-xe-next.  Thanks for the patch and review.


Matt

> 
> Regards,
> Zhanjun
> 
> On 2024-09-30 7:35 p.m., Patchwork wrote:
> > *Patch Details*
> > *Series:*	drm/xe: Prevent null pointer access in xe_migrate_copy (rev3)
> > *URL:*	https://patchwork.freedesktop.org/series/138889/
> > <https://patchwork.freedesktop.org/series/138889/>
> > *State:*	failure
> > *Details:*
> > https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/index.html
> > <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/index.html>
> > 
> > 
> >   CI Bug Log - changes from
> >   xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1_full ->
> >   xe-pw-138889v3_full
> > 
> > 
> >     Summary
> > 
> > *FAILURE*
> > 
> > Serious unknown changes coming with xe-pw-138889v3_full absolutely need
> > to be
> > verified manually.
> > 
> > If you think the reported changes have nothing to do with the changes
> > introduced in xe-pw-138889v3_full, please notify your bug team
> > (I915-ci-infra@lists.freedesktop.org) to allow them
> > to document this new failure mode, which will reduce false positives in CI.
> > 
> > 
> >     Participating hosts (4 -> 4)
> > 
> > No changes in participating hosts
> > 
> > 
> >     Possible new issues
> > 
> > Here are the unknown changes that may have been introduced in
> > xe-pw-138889v3_full:
> > 
> > 
> >       IGT changes
> > 
> > 
> >         Possible regressions
> > 
> >   *
> > 
> >     igt@core_hotunplug@hotrebind-lateclose:
> > 
> >       o shard-lnl: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-lnl-8/igt@core_hotunplug@hotrebind-lateclose.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-5/igt@core_hotunplug@hotrebind-lateclose.html>
> >   *
> > 
> >     igt@kms_big_joiner@invalid-modeset:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-2/igt@kms_big_joiner@invalid-modeset.html>
> >   *
> > 
> >     igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
> > 
> >       o shard-lnl: NOTRUN -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-5/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html> +4 other tests fail
> >   *
> > 
> >     igt@xe_exec_compute_mode@twice-userptr-invalidate-race:
> > 
> >       o shard-lnl: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-lnl-5/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-4/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html> +3 other tests fail
> >   *
> > 
> >     igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html> +1 other test skip
> > 
> > 
> >         Warnings
> > 
> >   *
> > 
> >     igt@kms_feature_discovery@psr1:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-2/igt@kms_feature_discovery@psr1.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-8/igt@kms_feature_discovery@psr1.html> +43 other tests skip
> >   *
> > 
> >     igt@kms_pm_dc@dc6-dpms:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-464/igt@kms_pm_dc@dc6-dpms.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-435/igt@kms_pm_dc@dc6-dpms.html> +33 other tests skip
> >   *
> > 
> >     igt@xe_live_ktest@xe_bo:
> > 
> >       o shard-dg2-set2: INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-436/igt@xe_live_ktest@xe_bo.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-434/igt@xe_live_ktest@xe_bo.html> +1 other test timeout
> > 
> > 
> >         Suppressed
> > 
> > The following results come from untrusted machines, tests, or statuses.
> > They do not affect the overall result.
> > 
> >   *
> > 
> >     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
> > 
> >       o {shard-bmg}: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html> (Intel XE#2652 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html> +1 other test incomplete
> >   *
> > 
> >     igt@kms_flip@2x-flip-vs-rmfb@ab-dp2-hdmi-a3:
> > 
> >       o {shard-bmg}: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-bmg-2/igt@kms_flip@2x-flip-vs-rmfb@ab-dp2-hdmi-a3.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-rmfb@ab-dp2-hdmi-a3.html> +1 other test incomplete
> > 
> > 
> >     Known issues
> > 
> > Here are the changes found in xe-pw-138889v3_full that come from known
> > issues:
> > 
> > 
> >       IGT changes
> > 
> > 
> >         Issues hit
> > 
> >   *
> > 
> >     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
> > 
> >       o shard-adlp: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033>) +1 other test dmesg-warn
> >   *
> > 
> >     igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
> > 
> >       o shard-lnl: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-lnl-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html> (Intel XE#1426 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) +3 other tests fail
> >   *
> > 
> >     igt@kms_big_fb@4-tiled-32bpp-rotate-90:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html> (Intel XE#1407 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407>) +1 other test skip
> >   *
> > 
> >     igt@kms_big_fb@4-tiled-64bpp-rotate-90:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-2/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +1 other test skip
> >   *
> > 
> >     igt@kms_big_fb@4-tiled-8bpp-rotate-270:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
> >   *
> > 
> >     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
> > 
> >       o shard-lnl: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html> (Intel XE#1659 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659>)
> >   *
> > 
> >     igt@kms_big_fb@linear-64bpp-rotate-0:
> > 
> >       o shard-lnl: NOTRUN -> DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-5/igt@kms_big_fb@linear-64bpp-rotate-0.html> (Intel XE#1725 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725>)
> >   *
> > 
> >     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:
> > 
> >       o shard-adlp: NOTRUN -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html> (Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>)
> >   *
> > 
> >     igt@kms_big_fb@y-tiled-32bpp-rotate-90:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-2/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
> >   *
> > 
> >     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +1 other test skip
> >   *
> > 
> >     igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +1 other test skip
> >   *
> > 
> >     igt@kms_big_fb@yf-tiled-addfb:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-5/igt@kms_big_fb@yf-tiled-addfb.html> (Intel XE#1467 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467>)
> >   *
> > 
> >     igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-8/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html> (Intel XE#1512 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512>)
> >   *
> > 
> >     igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html> (Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
> >   *
> > 
> >     igt@kms_bw@linear-tiling-1-displays-3840x2160p:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
> >   *
> > 
> >     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +7 other tests skip
> >   *
> > 
> >     igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +1 other test skip
> >   *
> > 
> >     igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +6 other tests skip
> >   *
> > 
> >     igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +11 other tests skip
> >   *
> > 
> >     igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html> (Intel XE#2887 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +3 other tests skip
> >   *
> > 
> >     igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-2/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html> (Intel XE#314 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>) +2 other tests skip
> >   *
> > 
> >     igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-2/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html> (Intel XE#314 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1 other test skip
> >   *
> > 
> >     igt@kms_chamelium_color@degamma:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-2/igt@kms_chamelium_color@degamma.html> (Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
> >   *
> > 
> >     igt@kms_chamelium_edid@vga-edid-read:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-5/igt@kms_chamelium_edid@vga-edid-read.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +3 other tests skip
> >   *
> > 
> >     igt@kms_chamelium_frames@hdmi-crc-fast:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-2/igt@kms_chamelium_frames@hdmi-crc-fast.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +1 other test skip
> >   *
> > 
> >     igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>)
> >   *
> > 
> >     igt@kms_content_protection@dp-mst-type-1:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-5/igt@kms_content_protection@dp-mst-type-1.html> (Intel XE#307 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) +1 other test skip
> >   *
> > 
> >     igt@kms_content_protection@legacy:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-2/igt@kms_content_protection@legacy.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +8 other tests skip
> >   *
> > 
> >     igt@kms_content_protection@uevent:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-8/igt@kms_content_protection@uevent.html> (Intel XE#599 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>)
> >   *
> > 
> >     igt@kms_cursor_crc@cursor-onscreen-512x512:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html> (Intel XE#1413 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413>)
> >   *
> > 
> >     igt@kms_cursor_crc@cursor-rapid-movement-256x85:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html> (Intel XE#1424 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>) +2 other tests skip
> >   *
> > 
> >     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html> (Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
> >   *
> > 
> >     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html> (Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
> >   *
> > 
> >     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html> (Intel XE#309 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +2 other tests skip
> >   *
> > 
> >     igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html> (Intel XE#309 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>)
> >   *
> > 
> >     igt@kms_cursor_legacy@torture-move@pipe-a:
> > 
> >       o shard-dg2-set2: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-463/igt@kms_cursor_legacy@torture-move@pipe-a.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-464/igt@kms_cursor_legacy@torture-move@pipe-a.html> (Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) +1 other test dmesg-warn
> >   *
> > 
> >     igt@kms_dsc@dsc-with-formats:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-434/igt@kms_dsc@dsc-with-formats.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +2 other tests skip
> >   *
> > 
> >     igt@kms_fbcon_fbt@psr-suspend:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html> (Intel XE#776 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/776>)
> >   *
> > 
> >     igt@kms_feature_discovery@chamelium:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-433/igt@kms_feature_discovery@chamelium.html> (Intel XE#701 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/701>)
> >   *
> > 
> >     igt@kms_feature_discovery@display-3x:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-2/igt@kms_feature_discovery@display-3x.html> (Intel XE#703 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/703>)
> >   *
> > 
> >     igt@kms_flip@2x-blocking-absolute-wf_vblank:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-2/igt@kms_flip@2x-blocking-absolute-wf_vblank.html> (Intel XE#310 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/310>)
> >   *
> > 
> >     igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-5/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html> (Intel XE#1421 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +4 other tests skip
> >   *
> > 
> >     igt@kms_flip@blocking-wf_vblank:
> > 
> >       o shard-lnl: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-lnl-7/igt@kms_flip@blocking-wf_vblank.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-8/igt@kms_flip@blocking-wf_vblank.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +8 other tests fail
> >   *
> > 
> >     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html> (Intel XE#1401 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401> / Intel XE#1745 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>) +1 other test skip
> >   *
> > 
> >     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-default-mode:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-default-mode.html> (Intel XE#1401 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401>) +1 other test skip
> >   *
> > 
> >     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
> > 
> >       o shard-adlp: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html> (Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) +3 other tests fail
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +5 other tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@drrs-suspend:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-suspend.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +3 other tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
> > 
> >       o shard-adlp: NOTRUN -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html> (Intel XE#1861 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861>)
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +11 other tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbc-tiling-4:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-tiling-4.html> (Intel XE#1151 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151>)
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +1 other test skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +6 other tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +2 other tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +5 other tests skip
> >   *
> > 
> >     igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
> > 
> >       o shard-lnl: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-2/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +6 other tests dmesg-warn
> >   *
> > 
> >     igt@kms_plane@plane-position-hole@pipe-a-plane-1:
> > 
> >       o shard-lnl: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-a-plane-1.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-a-plane-1.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
> >   *
> > 
> >     igt@kms_plane_cursor@overlay@pipe-b-edp-1-size-64:
> > 
> >       o shard-lnl: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-lnl-8/igt@kms_plane_cursor@overlay@pipe-b-edp-1-size-64.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-5/igt@kms_plane_cursor@overlay@pipe-b-edp-1-size-64.html> (Intel XE#1471 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471>) +1 other test fail
> >   *
> > 
> >     igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:
> > 
> >       o shard-dg2-set2: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#2566 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566>)
> >   *
> > 
> >     igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-b:
> > 
> >       o shard-dg2-set2: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-b.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20@pipe-b.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
> >   *
> > 
> >     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +7 other tests skip
> >   *
> > 
> >     igt@kms_pm_dc@dc9-dpms:
> > 
> >       o shard-dg2-set2: NOTRUN -> INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-463/igt@kms_pm_dc@dc9-dpms.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
> >   *
> > 
> >     igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
> >   *
> > 
> >     igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
> >   *
> > 
> >     igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-8/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html> (Intel XE#2893 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893>) +1 other test skip
> >   *
> > 
> >     igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +2 other tests skip
> >   *
> > 
> >     igt@kms_psr@fbc-pr-cursor-plane-move:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-8/igt@kms_psr@fbc-pr-cursor-plane-move.html> (Intel XE#1406 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>)
> >   *
> > 
> >     igt@kms_psr@fbc-psr-sprite-render:
> > 
> >       o shard-lnl: NOTRUN -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-8/igt@kms_psr@fbc-psr-sprite-render.html> (Intel XE#1649 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649>) +3 other tests fail
> >   *
> > 
> >     igt@kms_psr@psr2-no-drrs:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-2/igt@kms_psr@psr2-no-drrs.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +2 other tests skip
> >   *
> > 
> >     igt@kms_psr@psr2-primary-render:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-433/igt@kms_psr@psr2-primary-render.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +3 other tests skip
> >   *
> > 
> >     igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html> (Intel XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
> >   *
> > 
> >     igt@kms_rotation_crc@primary-rotation-90:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-90.html> (Intel XE#327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>)
> >   *
> > 
> >     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html> (Intel XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
> >   *
> > 
> >     igt@kms_rotation_crc@sprite-rotation-270:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-2/igt@kms_rotation_crc@sprite-rotation-270.html> (Intel XE#327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) +1 other test skip
> >   *
> > 
> >     igt@sriov_basic@enable-vfs-autoprobe-off:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-8/igt@sriov_basic@enable-vfs-autoprobe-off.html> (Intel XE#1091 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091> / Intel XE#2849 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849>)
> >   *
> > 
> >     igt@xe_evict@evict-beng-cm-threads-small-multi-vm:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-2/igt@xe_evict@evict-beng-cm-threads-small-multi-vm.html> (Intel XE#261 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261> / Intel XE#688 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +1 other test skip
> >   *
> > 
> >     igt@xe_evict@evict-mixed-many-threads-small:
> > 
> >       o shard-dg2-set2: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
> >   *
> > 
> >     igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-8/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html> (Intel XE#688 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +4 other tests skip
> >   *
> > 
> >     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html> (Intel XE#1392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +2 other tests skip
> >   *
> > 
> >     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html> (Intel XE#1392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +2 other tests skip
> >   *
> > 
> >     igt@xe_exec_fault_mode@many-rebind-imm:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-433/igt@xe_exec_fault_mode@many-rebind-imm.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +1 other test skip
> >   *
> > 
> >     igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +4 other tests skip
> >   *
> > 
> >     igt@xe_exec_threads@threads-shared-vm-userptr-rebind:
> > 
> >       o shard-dg2-set2: NOTRUN -> INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-433/igt@xe_exec_threads@threads-shared-vm-userptr-rebind.html> (Intel XE#1169 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169> / Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1356 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356>)
> >   *
> > 
> >     igt@xe_oa@closed-fd-and-unmapped-access:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-434/igt@xe_oa@closed-fd-and-unmapped-access.html> (Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +2 other tests skip
> >   *
> > 
> >     igt@xe_oa@oa-exponents:
> > 
> >       o shard-lnl: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-lnl-7/igt@xe_oa@oa-exponents.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-3/igt@xe_oa@oa-exponents.html> (Intel XE#2723 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723>)
> >   *
> > 
> >     igt@xe_oa@oa-exponents@ccs-0:
> > 
> >       o shard-lnl: NOTRUN -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-3/igt@xe_oa@oa-exponents@ccs-0.html> (Intel XE#2723 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723>)
> >   *
> > 
> >     igt@xe_oa@unprivileged-single-ctx-counters:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-2/igt@xe_oa@unprivileged-single-ctx-counters.html> (Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +1 other test skip
> >   *
> > 
> >     igt@xe_pm@d3cold-mocs:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-2/igt@xe_pm@d3cold-mocs.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284>)
> >   *
> > 
> >     igt@xe_pm@d3hot-mmap-vram:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-5/igt@xe_pm@d3hot-mmap-vram.html> (Intel XE#1948 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948>)
> >   *
> > 
> >     igt@xe_pm@s4-d3hot-basic-exec:
> > 
> >       o shard-adlp: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-1/igt@xe_pm@s4-d3hot-basic-exec.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607>)
> >   *
> > 
> >     igt@xe_pm@s4-vm-bind-prefetch:
> > 
> >       o shard-adlp: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-6/igt@xe_pm@s4-vm-bind-prefetch.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html> (Intel XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607> / Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
> >       o shard-lnl: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-lnl-1/igt@xe_pm@s4-vm-bind-prefetch.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html> (Intel XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607> / Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
> >   *
> > 
> >     igt@xe_query@multigpu-query-invalid-extension:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-5/igt@xe_query@multigpu-query-invalid-extension.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1 other test skip
> > 
> > 
> >         Possible fixes
> > 
> >   *
> > 
> >     igt@kms_addfb_basic@addfb25-modifier-no-flag:
> > 
> >       o shard-adlp: DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-8/igt@kms_addfb_basic@addfb25-modifier-no-flag.html>
> >   *
> > 
> >     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
> > 
> >       o shard-adlp: DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html> +1 other test pass
> >   *
> > 
> >     igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
> > 
> >       o shard-dg2-set2: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html> (Intel XE#1426 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-464/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html> +1 other test pass
> >   *
> > 
> >     igt@kms_fbcon_fbt@fbc:
> > 
> >       o shard-dg2-set2: INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-466/igt@kms_fbcon_fbt@fbc.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-463/igt@kms_fbcon_fbt@fbc.html> +1 other test pass
> >   *
> > 
> >     igt@kms_flip@2x-nonexisting-fb:
> > 
> >       o {shard-bmg}: DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html> (Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html> +11 other tests pass
> >   *
> > 
> >     igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1:
> > 
> >       o shard-lnl: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html> +3 other tests pass
> >   *
> > 
> >     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
> > 
> >       o shard-adlp: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html> (Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html> +3 other tests pass
> >   *
> > 
> >     igt@kms_pipe_crc_basic@suspend-read-crc:
> > 
> >       o shard-lnl: INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-lnl-4/igt@kms_pipe_crc_basic@suspend-read-crc.html> (Intel XE#2622 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2622>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-8/igt@kms_pipe_crc_basic@suspend-read-crc.html>
> >   *
> > 
> >     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1:
> > 
> >       o shard-lnl: INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-lnl-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1.html>
> >   *
> > 
> >     igt@kms_plane@plane-position-hole@pipe-a-plane-3:
> > 
> >       o shard-lnl: DMESG-FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html>
> >   *
> > 
> >     igt@kms_plane@plane-position-hole@pipe-b-plane-1:
> > 
> >       o shard-lnl: DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html> +3 other tests pass
> >   *
> > 
> >     igt@kms_plane_cursor@viewport:
> > 
> >       o shard-dg2-set2: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-434/igt@kms_plane_cursor@viewport.html> (Intel XE#616 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-436/igt@kms_plane_cursor@viewport.html> +1 other test pass
> >   *
> > 
> >     igt@xe_pm@s4-multiple-execs:
> > 
> >       o shard-lnl: ABORT
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607> / Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-5/igt@xe_pm@s4-multiple-execs.html>
> >   *
> > 
> >     igt@xe_pm@s4-vm-bind-unbind-all:
> > 
> >       o shard-adlp: ABORT
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html> (Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html>
> >   *
> > 
> >     igt@xe_pm_residency@toggle-gt-c6:
> > 
> >       o shard-lnl: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html> (Intel XE#958 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/958>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html>
> > 
> > 
> >         Warnings
> > 
> >   *
> > 
> >     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-435/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#623 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/623>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html> (Intel XE#623 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/623>)
> >   *
> > 
> >     igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#660 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/660>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html> (Intel XE#660 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/660>)
> >   *
> > 
> >     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#801 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/801>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html> (Intel XE#801 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/801>) +23 other tests skip
> >   *
> > 
> >     igt@kms_big_fb@4-tiled-addfb:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-4/igt@kms_big_fb@4-tiled-addfb.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#619 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/619>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-2/igt@kms_big_fb@4-tiled-addfb.html> (Intel XE#619 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/619>) +1 other test skip
> >   *
> > 
> >     igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-2/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-4/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html> (Intel XE#607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>) +1 other test skip
> >   *
> > 
> >     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +54 other tests skip
> >   *
> > 
> >     igt@kms_big_fb@linear-32bpp-rotate-270:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-9/igt@kms_big_fb@linear-32bpp-rotate-270.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-6/igt@kms_big_fb@linear-32bpp-rotate-270.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +21 other tests skip
> >   *
> > 
> >     igt@kms_big_fb@x-tiled-16bpp-rotate-270:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-436/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +19 other tests skip
> >   *
> > 
> >     igt@kms_big_fb@y-tiled-addfb-size-overflow:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#610 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html> (Intel XE#610 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610>) +1 other test skip
> >   *
> > 
> >     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> > 
> >       o shard-adlp: DMESG-FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>)
> >   *
> > 
> >     igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +50 other tests skip
> >   *
> > 
> >     igt@kms_big_fb@yf-tiled-addfb:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#619 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/619>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb.html> (Intel XE#619 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/619>) +1 other test skip
> >   *
> > 
> >     igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html> (Intel XE#607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>) +1 other test skip
> >   *
> > 
> >     igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#610 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html> (Intel XE#610 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610>) +1 other test skip
> >   *
> > 
> >     igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +16 other tests skip
> >   *
> > 
> >     igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-9/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html> (Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) +11 other tests skip
> >   *
> > 
> >     igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html> (Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) +6 other tests skip
> >   *
> > 
> >     igt@kms_bw@linear-tiling-4-displays-2560x1440p:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-4/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-4/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +14 other tests skip
> >   *
> > 
> >     igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +236 other tests skip
> >   *
> > 
> >     igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +157 other tests skip
> >   *
> > 
> >     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +349 other tests skip
> >   *
> > 
> >     igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +99 other tests skip
> >   *
> > 
> >     igt@kms_cdclk@mode-transition-all-outputs:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-9/igt@kms_cdclk@mode-transition-all-outputs.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#314 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-2/igt@kms_cdclk@mode-transition-all-outputs.html> (Intel XE#314 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>)
> >   *
> > 
> >     igt@kms_cdclk@mode-transition@pipe-d-dp-4:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-464/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#314 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-435/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html> (Intel XE#314 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>) +4 other tests skip
> >   *
> > 
> >     igt@kms_chamelium_color@ctm-0-50:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-2/igt@kms_chamelium_color@ctm-0-50.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-8/igt@kms_chamelium_color@ctm-0-50.html> (Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +8 other tests skip
> >   *
> > 
> >     igt@kms_chamelium_color@ctm-limited-range:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-436/igt@kms_chamelium_color@ctm-limited-range.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html> (Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +8 other tests skip
> >   *
> > 
> >     igt@kms_chamelium_edid@dp-edid-resolution-list:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-2/igt@kms_chamelium_edid@dp-edid-resolution-list.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-8/igt@kms_chamelium_edid@dp-edid-resolution-list.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +54 other tests skip
> >   *
> > 
> >     igt@kms_chamelium_hpd@vga-hpd:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +45 other tests skip
> >   *
> > 
> >     igt@kms_content_protection@dp-mst-lic-type-0:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#307 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-0.html> (Intel XE#307 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) +3 other tests skip
> >   *
> > 
> >     igt@kms_content_protection@dp-mst-type-1:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-6/igt@kms_content_protection@dp-mst-type-1.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#307 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-8/igt@kms_content_protection@dp-mst-type-1.html> (Intel XE#307 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) +4 other tests skip
> >   *
> > 
> >     igt@kms_cursor_crc@cursor-onscreen-512x512:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x512.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html> (Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +4 other tests skip
> >   *
> > 
> >     igt@kms_cursor_crc@cursor-random-512x170:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-2/igt@kms_cursor_crc@cursor-random-512x170.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-4/igt@kms_cursor_crc@cursor-random-512x170.html> (Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +6 other tests skip
> >   *
> > 
> >     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html> (Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) +3 other tests skip
> >   *
> > 
> >     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html> (Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) +5 other tests skip
> >   *
> > 
> >     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#309 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html> (Intel XE#309 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +23 other tests skip
> >   *
> > 
> >     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / i915#3804 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html> (i915#3804 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804>)
> >   *
> > 
> >     igt@kms_fbcon_fbt@psr:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-463/igt@kms_fbcon_fbt@psr.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#776 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/776>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-464/igt@kms_fbcon_fbt@psr.html> (Intel XE#776 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/776>)
> >   *
> > 
> >     igt@kms_fbcon_fbt@psr-suspend:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-2/igt@kms_fbcon_fbt@psr-suspend.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#776 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/776>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-8/igt@kms_fbcon_fbt@psr-suspend.html> (Intel XE#776 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/776>) +1 other test skip
> >   *
> > 
> >     igt@kms_feature_discovery@chamelium:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-4/igt@kms_feature_discovery@chamelium.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#701 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/701>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-6/igt@kms_feature_discovery@chamelium.html> (Intel XE#701 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/701>)
> >   *
> > 
> >     igt@kms_feature_discovery@display-2x:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-6/igt@kms_feature_discovery@display-2x.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#702 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/702>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-9/igt@kms_feature_discovery@display-2x.html> (Intel XE#702 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/702>)
> >   *
> > 
> >     igt@kms_feature_discovery@display-3x:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-464/igt@kms_feature_discovery@display-3x.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#703 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/703>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-435/igt@kms_feature_discovery@display-3x.html> (Intel XE#703 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/703>)
> >   *
> > 
> >     igt@kms_flip@2x-nonexisting-fb-interruptible:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-8/igt@kms_flip@2x-nonexisting-fb-interruptible.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#310 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/310>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-4/igt@kms_flip@2x-nonexisting-fb-interruptible.html> (Intel XE#310 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/310>) +36 other tests skip
> >   *
> > 
> >     igt@kms_force_connector_basic@prune-stale-modes:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-464/igt@kms_force_connector_basic@prune-stale-modes.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / i915#5274 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-435/igt@kms_force_connector_basic@prune-stale-modes.html> (i915#5274 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274>)
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +76 other tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +213 other tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@drrs-suspend:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +132 other tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#658 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html> (Intel XE#658 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>) +1 other test skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +136 other tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +79 other tests skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html> (Intel XE#1151 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151>) +1 other test skip
> >   *
> > 
> >     igt@kms_frontbuffer_tracking@plane-fbc-rte:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html> (Intel XE#1158 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-436/igt@kms_frontbuffer_tracking@plane-fbc-rte.html> (Intel XE#1158 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158>)
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html> (Intel XE#1158 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html> (Intel XE#1158 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158>)
> >   *
> > 
> >     igt@kms_getfb@getfb-reject-ccs:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-8/igt@kms_getfb@getfb-reject-ccs.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1341 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-2/igt@kms_getfb@getfb-reject-ccs.html> (Intel XE#1341 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341>)
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-466/igt@kms_getfb@getfb-reject-ccs.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#605 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/605>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-466/igt@kms_getfb@getfb-reject-ccs.html> (Intel XE#605 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/605>)
> >   *
> > 
> >     igt@kms_getfb@getfb2-accept-ccs:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-8/igt@kms_getfb@getfb2-accept-ccs.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1339 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-6/igt@kms_getfb@getfb2-accept-ccs.html> (Intel XE#1339 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339>)
> >   *
> > 
> >     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#356 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/356>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (Intel XE#356 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/356>)
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-464/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#356 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/356>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-435/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (Intel XE#356 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/356>)
> >   *
> > 
> >     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +17 other tests skip
> >   *
> > 
> >     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +15 other tests skip
> >   *
> > 
> >     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +26 other tests skip
> >   *
> > 
> >     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +23 other tests skip
> >   *
> > 
> >     igt@kms_pm_backlight@fade:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-4/igt@kms_pm_backlight@fade.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-2/igt@kms_pm_backlight@fade.html> (Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) +4 other tests skip
> >   *
> > 
> >     igt@kms_pm_backlight@fade-with-suspend:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-463/igt@kms_pm_backlight@fade-with-suspend.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-464/igt@kms_pm_backlight@fade-with-suspend.html> (Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) +3 other tests skip
> >   *
> > 
> >     igt@kms_pm_dc@dc9-dpms:
> > 
> >       o shard-adlp: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html> (Intel XE#1204 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-6/igt@kms_pm_dc@dc9-dpms.html> (Intel XE#734 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/734>)
> >   *
> > 
> >     igt@kms_pm_dc@deep-pkgc:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-8/igt@kms_pm_dc@deep-pkgc.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#2007 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2007>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-4/igt@kms_pm_dc@deep-pkgc.html> (Intel XE#2007 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2007>)
> >   *
> > 
> >     igt@kms_pm_rpm@dpms-non-lpsp:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-2/igt@kms_pm_rpm@dpms-non-lpsp.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#836 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/836>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-8/igt@kms_pm_rpm@dpms-non-lpsp.html> (Intel XE#836 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/836>) +3 other tests skip
> >   *
> > 
> >     igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +43 other tests skip
> >   *
> > 
> >     igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +37 other tests skip
> >   *
> > 
> >     igt@kms_psr@pr-primary-page-flip:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-6/igt@kms_psr@pr-primary-page-flip.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-9/igt@kms_psr@pr-primary-page-flip.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +81 other tests skip
> >   *
> > 
> >     igt@kms_psr@psr-dpms:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-463/igt@kms_psr@psr-dpms.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-464/igt@kms_psr@psr-dpms.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +64 other tests skip
> >   *
> > 
> >     igt@kms_rotation_crc@bad-pixel-format:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-2/igt@kms_rotation_crc@bad-pixel-format.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-8/igt@kms_rotation_crc@bad-pixel-format.html> (Intel XE#327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) +7 other tests skip
> >   *
> > 
> >     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html> (Intel XE#327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) +7 other tests skip
> >   *
> > 
> >     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html> (Intel XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html> (Intel XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>) +2 other tests skip
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html> (Intel XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html> (Intel XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>) +1 other test skip
> >   *
> > 
> >     igt@kms_setmode@basic@pipe-a-edp-1:
> > 
> >       o shard-lnl: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-lnl-2/igt@kms_setmode@basic@pipe-a-edp-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-3/igt@kms_setmode@basic@pipe-a-edp-1.html> (Intel XE#2883 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883>)
> >   *
> > 
> >     igt@kms_tiled_display@basic-test-pattern:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-6/igt@kms_tiled_display@basic-test-pattern.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#362 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-8/igt@kms_tiled_display@basic-test-pattern.html> (Intel XE#362 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>) +1 other test skip
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#362 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html> (Intel XE#362 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>)
> >   *
> > 
> >     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1500 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html> (Intel XE#1500 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500>)
> >   *
> > 
> >     igt@kms_tv_load_detect@load-detect:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-464/igt@kms_tv_load_detect@load-detect.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#330 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/330>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-464/igt@kms_tv_load_detect@load-detect.html> (Intel XE#330 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/330>)
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-6/igt@kms_tv_load_detect@load-detect.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#330 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/330>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-8/igt@kms_tv_load_detect@load-detect.html> (Intel XE#330 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/330>)
> >   *
> > 
> >     igt@kms_vrr@flip-suspend:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-2/igt@kms_vrr@flip-suspend.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-4/igt@kms_vrr@flip-suspend.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +119 other tests skip
> >   *
> > 
> >     igt@kms_vrr@flipline:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-463/igt@kms_vrr@flipline.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-464/igt@kms_vrr@flipline.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +85 other tests skip
> >   *
> > 
> >     igt@kms_writeback@writeback-fb-id:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-435/igt@kms_writeback@writeback-fb-id.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-466/igt@kms_writeback@writeback-fb-id.html> (Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) +4 other tests skip
> >   *
> > 
> >     igt@kms_writeback@writeback-invalid-parameters:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-8/igt@kms_writeback@writeback-invalid-parameters.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-2/igt@kms_writeback@writeback-invalid-parameters.html> (Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) +5 other tests skip
> >   *
> > 
> >     igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-464/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#2849 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-435/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html> (Intel XE#1091 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091> / Intel XE#2849 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849>) +1 other test skip
> >       o shard-lnl: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-lnl-3/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html> (Intel XE#2849 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-4/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html> (Intel XE#1091 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091> / Intel XE#2849 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849>)
> >   *
> > 
> >     igt@xe_ccs@suspend-resume:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-4/igt@xe_ccs@suspend-resume.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#488 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/488>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-4/igt@xe_ccs@suspend-resume.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#488 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/488>) +5 other tests skip
> >   *
> > 
> >     igt@xe_compute@ccs-mode-compute-kernel:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-6/igt@xe_compute@ccs-mode-compute-kernel.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1447 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-8/igt@xe_compute@ccs-mode-compute-kernel.html> (Intel XE#1447 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447>)
> >   *
> > 
> >     igt@xe_compute_preempt@compute-preempt-many:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-435/igt@xe_compute_preempt@compute-preempt-many.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1280 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-463/igt@xe_compute_preempt@compute-preempt-many.html> (Intel XE#1280 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +5 other tests skip
> >   *
> > 
> >     igt@xe_evict@evict-small-external-cm:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-4/igt@xe_evict@evict-small-external-cm.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#261 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261> / Intel XE#688 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-4/igt@xe_evict@evict-small-external-cm.html> (Intel XE#261 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261> / Intel XE#688 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +46 other tests skip
> >   *
> > 
> >     igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#688 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html> (Intel XE#688 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +8 other tests skip
> >   *
> > 
> >     igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html> (Intel XE#1392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +45 other tests skip
> >   *
> > 
> >     igt@xe_exec_fault_mode@many-basic-prefetch:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-435/igt@xe_exec_fault_mode@many-basic-prefetch.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-463/igt@xe_exec_fault_mode@many-basic-prefetch.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +13 other tests skip
> >   *
> > 
> >     igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-4/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-2/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +117 other tests skip
> >   *
> > 
> >     igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-9/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +20 other tests skip
> >   *
> > 
> >     igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +101 other tests skip
> >   *
> > 
> >     igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#2229 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-9/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html> (Intel XE#2229 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>) +2 other tests skip
> >   *
> > 
> >     igt@xe_media_fill@media-fill:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-463/igt@xe_media_fill@media-fill.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#560 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/560>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-464/igt@xe_media_fill@media-fill.html> (Intel XE#560 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/560>)
> >   *
> > 
> >     igt@xe_mmap@small-bar:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-1/igt@xe_mmap@small-bar.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#512 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/512>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-1/igt@xe_mmap@small-bar.html> (Intel XE#512 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/512>)
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-435/igt@xe_mmap@small-bar.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#512 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/512>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-466/igt@xe_mmap@small-bar.html> (Intel XE#512 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/512>)
> >   *
> > 
> >     igt@xe_mmap@vram:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-1/igt@xe_mmap@vram.html> (Intel XE#1008 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-1/igt@xe_mmap@vram.html> (Intel XE#1008 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008>)
> >   *
> > 
> >     igt@xe_module_load@force-load:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-6/igt@xe_module_load@force-load.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-8/igt@xe_module_load@force-load.html> (Intel XE#378 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/378>) +1 other test skip
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-463/igt@xe_module_load@force-load.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-463/igt@xe_module_load@force-load.html> (Intel XE#378 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/378>) +1 other test skip
> >   *
> > 
> >     igt@xe_noexec_ping_pong:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-6/igt@xe_noexec_ping_pong.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#379 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/379>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-8/igt@xe_noexec_ping_pong.html> (Intel XE#379 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/379>)
> >   *
> > 
> >     igt@xe_oa@mmio-triggered-reports:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-6/igt@xe_oa@mmio-triggered-reports.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-8/igt@xe_oa@mmio-triggered-reports.html> (Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +31 other tests skip
> >   *
> > 
> >     igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-433/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-466/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html> (Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +25 other tests skip
> >   *
> > 
> >     igt@xe_pat@display-vs-wb-transient:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-2/igt@xe_pat@display-vs-wb-transient.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1337 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-8/igt@xe_pat@display-vs-wb-transient.html> (Intel XE#1337 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337>)
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1337 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html> (Intel XE#1337 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337>)
> >   *
> > 
> >     igt@xe_pat@pat-index-xe2:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-6/igt@xe_pat@pat-index-xe2.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#977 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/977>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-8/igt@xe_pat@pat-index-xe2.html> (Intel XE#977 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/977>)
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-464/igt@xe_pat@pat-index-xe2.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#977 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/977>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-464/igt@xe_pat@pat-index-xe2.html> (Intel XE#977 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/977>)
> >   *
> > 
> >     igt@xe_pat@pat-index-xelpg:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-4/igt@xe_pat@pat-index-xelpg.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#979 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-6/igt@xe_pat@pat-index-xelpg.html> (Intel XE#979 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>)
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-433/igt@xe_pat@pat-index-xelpg.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#979 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-433/igt@xe_pat@pat-index-xelpg.html> (Intel XE#979 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>)
> >   *
> > 
> >     igt@xe_peer2peer@read:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-6/igt@xe_peer2peer@read.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-8/igt@xe_peer2peer@read.html> (Intel XE#1061 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061>) +1 other test skip
> >   *
> > 
> >     igt@xe_pm@d3cold-basic:
> > 
> >       o shard-lnl: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-lnl-5/igt@xe_pm@d3cold-basic.html> (Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-lnl-3/igt@xe_pm@d3cold-basic.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) +6 other tests skip
> >   *
> > 
> >     igt@xe_pm@d3cold-mmap-system:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-435/igt@xe_pm@d3cold-mmap-system.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-466/igt@xe_pm@d3cold-mmap-system.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) +2 other tests skip
> >   *
> > 
> >     igt@xe_pm@d3cold-mmap-vram:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html> (Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-433/igt@xe_pm@d3cold-mmap-vram.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) +3 other tests skip
> >   *
> > 
> >     igt@xe_pm@d3cold-mocs:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-464/igt@xe_pm@d3cold-mocs.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-435/igt@xe_pm@d3cold-mocs.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284>)
> >   *
> > 
> >     igt@xe_pm@d3hot-mmap-vram:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-6/igt@xe_pm@d3hot-mmap-vram.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1948 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-8/igt@xe_pm@d3hot-mmap-vram.html> (Intel XE#1948 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948>)
> >   *
> > 
> >     igt@xe_pm@s3-d3cold-basic-exec:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-2/igt@xe_pm@s3-d3cold-basic-exec.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-4/igt@xe_pm@s3-d3cold-basic-exec.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) +6 other tests skip
> >   *
> > 
> >     igt@xe_pm@vram-d3cold-threshold:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-464/igt@xe_pm@vram-d3cold-threshold.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-464/igt@xe_pm@vram-d3cold-threshold.html> (Intel XE#579 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/579>)
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-6/igt@xe_pm@vram-d3cold-threshold.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-8/igt@xe_pm@vram-d3cold-threshold.html> (Intel XE#579 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/579>)
> >   *
> > 
> >     igt@xe_query@multigpu-query-engines:
> > 
> >       o shard-dg2-set2: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-dg2-464/igt@xe_query@multigpu-query-engines.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-dg2-464/igt@xe_query@multigpu-query-engines.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +12 other tests skip
> >   *
> > 
> >     igt@xe_query@multigpu-query-invalid-extension:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1/shard-adlp-6/igt@xe_query@multigpu-query-invalid-extension.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v3/shard-adlp-8/igt@xe_query@multigpu-query-invalid-extension.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +14 other tests skip
> > 
> > {name}: This element is suppressed. This means it is ignored when computing
> > the status of the difference (SUCCESS, WARNING, or FAILURE).
> > 
> > 
> >     Build changes
> > 
> >   * Linux: xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1 ->
> >     xe-pw-138889v3
> > 
> > IGT_8036: 5aa244179b574e949a07ab1c7494033081735718 @
> > https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> > xe-1985-1522f131505272ed86f58e937f2481e4e3e144c1:
> > 1522f131505272ed86f58e937f2481e4e3e144c1
> > xe-pw-138889v3: 138889v3
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
