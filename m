Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D894C369DC
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 17:06:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E45F910E334;
	Tue, 29 Apr 2025 17:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="laYTAbAR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D5010E334
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Apr 2025 17:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745946360; x=1777482360;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HqhmxckrfjsXxiqojAK5Cdts/2ruCkqczquhHznVaIY=;
 b=laYTAbARNRcZH/0qHVf2/1wyuE/l0Vgq7cfK6aza/abV8k/91z5dRDjA
 bwlozfIUSus9jUgh7R7qekXX2Zb00hQwRCLpcqOmLUa5Jduv0a5aL0guS
 be42vzMmrgYwRei81+mvsSVL4u8ZNNzxth8GEnRhS5/0Zlp7fXzhQ9y9l
 fOiKjIPQUt8YVbKW40D2mKE6GsxkDSZazOpX9Ha1jQPfFQvYFolWpBkvq
 Eydf3NhKsBY3YUZiBhPfSppEElHftrlnvXAPVN86s7x4kKobbfZUhRNND
 N31TMZve94buSD8hhMGiKiXciZfPl7s1OxTT18H6DZI7U1Fx0bTeC/Pc7 w==;
X-CSE-ConnectionGUID: Xh/XbZmuQl2nxTFSD8wC6A==
X-CSE-MsgGUID: oKolcj5WTOW9z2QDUdSZSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="46698038"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="46698038"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 10:05:59 -0700
X-CSE-ConnectionGUID: ZNQkzu9MQT6WAkLiChvo+Q==
X-CSE-MsgGUID: O5jJ263bTYKNVMGomkTlog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="133776947"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 10:05:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 10:05:58 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 29 Apr 2025 10:05:58 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 29 Apr 2025 10:05:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=niDQB3zHSnvXShyE+IqcXEaVbHlH53B4uLcL67AQZeI+GGnqZ8zRvc36BuDO+kpmAgLhvQGE46Sw8mpLHo/cj/4hHa+nDFWqSsvCt7F/9Rrr2MaYja1YxVrTb2+cCTcfLkm7OdlbegtPMl0HrDH2ydM6gUMaNL9hxk+lucDzHpt5pB+40uhyXo6qIpHNrxilOIrqbhKxWqoOgo/9byU8uqRxtWAy1M2CWeCD9nNh8BufABvEFPtBWH5iJdfsSBPN1PisYmvXjSFZAi0PP9J4xDqusJK0iVyX07PhbyWVDCCqFFHEEmFiqBbXnlv3oG43oifKilrTH70/nAAYsoTTqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g5nkImg3yaaIY6eRdWiLsU3yzxPP0ug08W6eGA9bm6I=;
 b=chCSfeZr4DviQXLmlVegHA2UyueLrWb0MnsrcHleMkPKLSakoL4tt2TQv75sf2DtJr8r1Od+tIyEOYljneCZMGkBdoZCaO4bF5mFZO3WU+KXyxV+EMkaukzaDfjF8VrQ33pQMKmaTsiPucKCljrgNmsP5gdI/+mDh8xsL/7W2BIIz2CHp57B5AJzjemiIsAP9Z2IVO8JEHt4HUvI9Dv2FAbY4Ih3OxeFIK/kY7iBCWrqluZSp220KT+UHIwkdA35d4f9NjfUvPWEafrX2KOkfyOFGoMMou3cprQHkKxri/LgFd2Grt2fw9RSS6FRlpoi3CDFSMOIpq+Y4rjoAy0QHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB5969.namprd11.prod.outlook.com (2603:10b6:8:5c::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.33; Tue, 29 Apr 2025 17:05:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.012; Tue, 29 Apr 2025
 17:05:51 +0000
Date: Tue, 29 Apr 2025 10:07:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/2] drm/xe: upon page fault, use generic uc fw
 instead of guc
Message-ID: <aBEHQgRrBm/j7yY2@lstrano-desk.jf.intel.com>
References: <20250218112702.262780-1-dafna.hirschfeld@intel.com>
 <20250218112702.262780-2-dafna.hirschfeld@intel.com>
 <aA/tNSnOE2uWjNgI@lstrano-desk.jf.intel.com>
 <4mlwidurvhnl3pimzg4qlczo6raiyiq2kc6lgbhdhoup4qmz3l@3ajazrvqcs4i>
 <lavciajcxm5sxdhq7a272l7zrn3l3qmv4gazx67asmelieqsbp@pds2yn254djq>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <lavciajcxm5sxdhq7a272l7zrn3l3qmv4gazx67asmelieqsbp@pds2yn254djq>
X-ClientProxiedBy: MW4PR03CA0121.namprd03.prod.outlook.com
 (2603:10b6:303:8c::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB5969:EE_
X-MS-Office365-Filtering-Correlation-Id: 896f6a05-5b91-4399-986b-08dd87401868
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W9EnQI6pGiKuygumyn+bZPdrt1MR9llktLapo+MsOL5LC1OJ992z/Od0GNEa?=
 =?us-ascii?Q?lF1CEA4qT5XCb5BqHqdL1m+rmh7BAJv2rAIRg+xtVyyplRDm+h4RP7eeU99l?=
 =?us-ascii?Q?/+VZMB5IXEGGLWLXupoap5fbgmfDlUzIDaOL5KsmuBxUss2Pb+MPdNUsWtkB?=
 =?us-ascii?Q?8sxJtGUI5oHs7tWVPE3qXU8MGM0GqB6Yx41FIkJOPVJ2L5LwHw9E6UKa1cMx?=
 =?us-ascii?Q?fh6zV5E4vmkmLrB30xgiTlI26gfzR0FMU24L9d1PYg4oLaSqxKCjyC97J6dS?=
 =?us-ascii?Q?EQbECGrIpUtSvxTbt7jA8gAdfaa9SnfAlP5w10S9OkHpAi5WF3H+R89KcE4J?=
 =?us-ascii?Q?NyXb5xA2SUgF/MaqaseLq/XHD5u6nxhiRHIDL1+GwIBLFfP8HVXKYf4Iu96F?=
 =?us-ascii?Q?2LUqMip8mVYKkwI+RBds7MUsO8j+V+KUkwfhKJVTIV8c3n7cxDSusqM2gYoB?=
 =?us-ascii?Q?fe3afCMa3ykOYsL2MGROGVeyMil2Chq5N1ZVvFR7zoH4FqzBSuaUA7fT/mVA?=
 =?us-ascii?Q?O8+fV1OTSGfAdLaCZekr/qgvIV88BDGwkRaatMr2gEEwilIkvbZ0p8P7tgyu?=
 =?us-ascii?Q?QcOIN/E0reK3wXhfJGvK1lWyKh2hyHhlXtM8Wm106Ssg0HlNYyUZLCXIGpsO?=
 =?us-ascii?Q?DIR6NmQdRwdkE4jHbrhfLY054e7HqdelSbBZ6OZvUJvWfnOs/jb5DuyuS5CR?=
 =?us-ascii?Q?n+13BDLzgyQPjecP4Gw6/s6EAv3PidMzovBVq4ByCX3IrzuRY/O1/5Cn0839?=
 =?us-ascii?Q?IzlSPmzxc3fXpadtxOXuVWNUsSFcG98Ksha1A4LFxzRS0BrcpfvlnqtlgRgk?=
 =?us-ascii?Q?D/ORVXtTI7fRl7b3Pq0kSpkPik7UoPxagHSidneot4sSMbeDnm5/0zlJioxB?=
 =?us-ascii?Q?xE2YyxeDIvcphhfSrqARWZ3DXn8q3QyiDbcpB6NlE9XdVQy3EviTqajdKkL5?=
 =?us-ascii?Q?nCsEM+3ImYvw17k9L8jXlQrbVbvf8kgrTJkAWQKExaRV17RCIMTKgUeKAG8M?=
 =?us-ascii?Q?R3VSM5QUnxAEFX0cnkkcK7LxNXA0DDZh4Qgwd7r6pJq+4mOB7ftEgf2fC+pw?=
 =?us-ascii?Q?CEM/42pwIXyaDUgjg/kyIei1BaHA8h+OMTTMTvtPDfignzPFLSc4rfYGIG3v?=
 =?us-ascii?Q?vX+9jkIBz4RgY0rKMiHMzDwEygLQ6E9uIMVtoCBQmGs6ZaEcqpoKkfs2qlR4?=
 =?us-ascii?Q?94wKuLyVw2s+iLCfeESBaTqPOK+mFV91w6DmN39YPsDsCLOdoNgthT8G0/Wp?=
 =?us-ascii?Q?340mzfG3G8/eqVl+NNjbYeoi3riL7BpCthTeaeL9kNAl0AB9ZxhmGeosPv7c?=
 =?us-ascii?Q?KNDUpnURxs1blfBBnJrxiDbyduNQxK1BjHU3eRfDIpqfpCq5mQf9SZN5xn9r?=
 =?us-ascii?Q?2k936KlKzCrNHFIRar0aFXz+9uGKZh08th8pT6eAXpKj15uB6h0al3C52NIa?=
 =?us-ascii?Q?aoUM+zO8BwQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lGfZwDG4mEKmOdMfYjLDwn+fpMDtS0aDBxwrkdEzXqO1+HpBtEXME0Q3eY0b?=
 =?us-ascii?Q?bBT/w47kCzIVArZW7mb1qKXif76+ecZw18Kx01pRiRr0+mhrUThLIj+li/M3?=
 =?us-ascii?Q?TCc/K97thZTl3lRCVgxXU+FBXNX6MP/aIDwe1dFmDdKVqsnfH1ZHoVE1tSvL?=
 =?us-ascii?Q?rYIKeEy/ftfpnrNYur08CijDqKFq6UT/h+zEPmjtpKt1oYmk0S1zWSyBytHr?=
 =?us-ascii?Q?gsI2SrVL6fGUyJkSISOo5nJMkpfRzY7Ka0BO4mo4wQptUQHQVsStI35L8i/B?=
 =?us-ascii?Q?eP6C0ONlmonmN/lisKhP6QA0xZm5fufZQto8O1lXcmzB3+E8EwtAqUex+UN1?=
 =?us-ascii?Q?rDz+0eVnkap8Q2sh6A+weRIhlMneVkPZoZfVd2D+bWTG/UMIjZJXwW0WJiLi?=
 =?us-ascii?Q?a62DmaMAH+b9nBP79KRMBWoWdGYeDIFPcE26kFBLIH7c5iebdXdL9adC/RFj?=
 =?us-ascii?Q?5sukyPjy4F3IHStHJOxtgh58b00FMkXxnxvlNwHUBZr/tDmfXwy43IQcA1K9?=
 =?us-ascii?Q?XkXbgLavKUqKJVc+44SvyD0bnOj15ktl31ikomfHch6itW+QuUya5ovgzDuC?=
 =?us-ascii?Q?ioepI9L5QDWh2qqEyDTnWKL768cCp/0+zPyHbfco/CglbT9hU+UThDrbEXyx?=
 =?us-ascii?Q?XabXoMCfTAwugMYBujS7IKAxguV6p9+O2PYGEMgVtASMeoeynWkGksI3IPuD?=
 =?us-ascii?Q?y5oOf1SgZBfricxQV8ZSM9jdSn/i2HH9YL8Tfo/zI60o21ifwVJwlOHEwuha?=
 =?us-ascii?Q?lxOkhHWc+k0AOymR6NuRrEHtxXeFpFqPuuG4R/HlzjoBMVo/wv+ti0AiR1zU?=
 =?us-ascii?Q?RBSF00G1M1w/nsQT7Cab3qDVkFSEjZWKC4AP7mSrem/IxwvB1fnF4azaOmt1?=
 =?us-ascii?Q?V6jU7r+UzOxat3cRt/Bemc8NtbapI3Bac+B5MzNxyfLNGTAK4O4UFZQtWyhX?=
 =?us-ascii?Q?uQmebAexgL7USUmaliQrpA2FEjUJcKWZDd93kWpGlZ9OfINmQdV57jGvmUWw?=
 =?us-ascii?Q?Z1+ksAsmF8gA4qkZrBNq8A8o0CIk/pHo1bS+cMllMA2hb05oDllEAXDGjsnG?=
 =?us-ascii?Q?UQM6sJsyET47dOAa8CgLctz3YgGpDDH5zsX4+Zd2Ucup5Y+DEby9DMDNi5x6?=
 =?us-ascii?Q?1Mg/VGzvRgFq8TzCJkFL9UG3CfmI+zwLWTMp7h5yth0wIGewG6OfBk3BMaoM?=
 =?us-ascii?Q?EZQMlD/pHnQdxnsVe2tpI1n66pcsVushlq5pESy2w5LIdzmTmVhHT4tvIrlw?=
 =?us-ascii?Q?SYrp5mVdl1vjPKq5iOeiWO66BZf5D9x+4HQt3UkfUK6LvJxRoMceZE2YH7/3?=
 =?us-ascii?Q?SW4oS1SMxszKM4KDdE9eETaMZW5kk4en0ouC8mGMPZy1lLWiRod18GUUIOyT?=
 =?us-ascii?Q?3IOj3yFnHgXEvYxLI7YuJXy8ECo0HmyS+0ktG0mQl5x7Trg/9Ap2PnylffnC?=
 =?us-ascii?Q?IVtuvWScPIHkvnQAXmzFwENPVW1RkDFX9t/NshEVTLHFeW1EIg+7oE/Hg2YU?=
 =?us-ascii?Q?rY7MY6KGBhI/ahk5cccRVwEUUVj4u+w/laH/7xCV/ToMCyZpnM/DryEnmrr3?=
 =?us-ascii?Q?8oD3R8AUYxWBRHqw7sLhN4psjy8+/luY+2b3liWkHNSrzvUUp647wzdmzRRk?=
 =?us-ascii?Q?gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 896f6a05-5b91-4399-986b-08dd87401868
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 17:05:51.5815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y4mWE/Lgkh52JB1rfrVFrXnrL0HJzL1qHvHQRs3Rg2wrH6rKxAxQvpNplfovsZpV9v5yhNWgoLpUep+wwPI2fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5969
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

On Tue, Apr 29, 2025 at 05:14:42PM +0300, Dafna Hirschfeld wrote:
> On 29.04.2025 15:49, Dafna Hirschfeld wrote:
> > On 28.04.2025 14:03, Matthew Brost wrote:
> > > On Tue, Feb 18, 2025 at 01:27:02PM +0200, Dafna Hirschfeld wrote:
> > > > Future asic will have different firmware to handle page faults.
> > > > Change the code in xe_gt_pagefault.c to use xe_uc_fw instead of
> > > > xe_guc and add a callback to struct xe_uc_fw to send the page
> > > > fault replay to the fw.
> > > > 
> > > 
> > > I think this is on the right track - the current code is clearly layered
> > > incorrectly.
> > > 
> > > > Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
> > > > ---
> > > > drivers/gpu/drm/xe/xe_gt_pagefault.c | 24 ++++--------------------
> > > > drivers/gpu/drm/xe/xe_gt_pagefault.h |  6 +++---
> > > > drivers/gpu/drm/xe/xe_gt_types.h     |  2 ++
> > > > drivers/gpu/drm/xe/xe_guc.c          | 15 +++++++++++++++
> > > > drivers/gpu/drm/xe/xe_guc_ct.c       |  8 ++++----
> > > > drivers/gpu/drm/xe/xe_uc_fw_types.h  |  5 +++++
> > > > 6 files changed, 33 insertions(+), 27 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > index 51c4bcc769d2..c1e076e14219 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > @@ -11,13 +11,10 @@
> > > > #include <drm/drm_exec.h>
> > > > #include <drm/drm_managed.h>
> > > > 
> > > > -#include "abi/guc_actions_abi.h"
> > > > #include "xe_bo.h"
> > > > #include "xe_gt.h"
> > > > #include "xe_gt_stats.h"
> > > > #include "xe_gt_tlb_invalidation.h"
> > > > -#include "xe_guc.h"
> > > > -#include "xe_guc_ct.h"
> > > 
> > > Yes, removing all GuC specific code in xe_gt_pagefaul.c is a good idea.
> > > 
> > > > #include "xe_migrate.h"
> > > > #include "xe_trace_bo.h"
> > > > #include "xe_vm.h"
> > > > @@ -246,18 +243,6 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
> > > > 	return err;
> > > > }
> > > > 
> > > > -static int send_pagefault_reply(struct xe_guc *guc,
> > > > -				struct xe_uc_pagefault_reply *reply)
> > > > -{
> > > > -	u32 action[] = {
> > > > -		XE_GUC_ACTION_PAGE_FAULT_RES_DESC,
> > > > -		reply->dw0,
> > > > -		reply->dw1,
> > > > -	};
> > > > -
> > > > -	return xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> > > > -}
> > > > -
> > > > static void print_pagefault(struct xe_device *xe, struct pagefault *pf)
> > > > {
> > > > 	drm_dbg(&xe->drm, "\n\tASID: %d\n"
> > > > @@ -322,9 +307,8 @@ static bool pf_queue_full(struct pf_queue *pf_queue)
> > > > 		PF_MSG_LEN_DW;
> > > > }
> > > > 
> > > > -int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
> > > > +int xe_pagefault_handler(struct xe_gt *gt, struct xe_uc_fw *fw, u32 *msg, u32 len)
> > > 
> > > s/xe_pagefault_handler/xe_gt_pagefault_handler/
> > > 
> > > I think this needs a interface refactor.
> > > 
> > > This is still assuming the 'msg' field will be the same format across
> > > firmwares which I don't think is a assumption we can safely make.
> > > 
> > > > {
> > > > -	struct xe_gt *gt = guc_to_gt(guc);
> > > > 	struct xe_device *xe = gt_to_xe(gt);
> > > > 	struct pf_queue *pf_queue;
> > > > 	unsigned long flags;
> > > > @@ -336,6 +320,7 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
> > > > 
> > > > 	asid = FIELD_GET(PFD_ASID, msg[1]);
> > > > 	pf_queue = gt->usm.pf_queue + (asid % NUM_PF_QUEUE);
> > > > +	pf_queue->fw = fw;
> > > > 
> > > 
> > > This doesn't work as if you have multiple FWs queuing up page faults
> > > this could be pointing to the wrong firmware by the time the fault is
> > > processed.
> > 
> > right, but this will work if setting the FW is inside the condition 'if (!full)' right?
> 
> oh, I see now , we have 'data' holding a queue of different msg opaques that might come
> from different firmwares
> 

Yep, I don't we should assume a single GT or PF msg queue is only being
feed by 1 firmware.

Matt

> Dafna
> 
> > 
> > > 
> > > > 	/*
> > > > 	 * The below logic doesn't work unless PF_QUEUE_NUM_DW % PF_MSG_LEN_DW == 0
> > > > @@ -390,7 +375,7 @@ static void pf_queue_work_func(struct work_struct *w)
> > > > 			FIELD_PREP(PFR_ENG_CLASS, pf.engine_class) |
> > > > 			FIELD_PREP(PFR_PDATA, pf.pdata);
> > > > 
> > > > -		send_pagefault_reply(&gt->uc.guc, &reply);
> > > 
> > > I also don't think it is the job GT page fault layer to encode the
> > > response to the firmware as that could be different between firmwares
> > > too.
> > > 
> > > So roughly I think we something along these lines...
> > > 
> > > - The firmwares parse the fields which GT page fault handler needs to
> > > understand (page_addr, asid, access_type) and passing these in as
> > > arguments to xe_gt_pagefault_handler
> > > - The original FW message is also passed in, we define max length for
> > > this, this is just opaque data to GT page fault layer
> > > - The firmware passes in vfunc for send_pagefault_reply, this accepts
> > > original FW message + pass / fail value so the firmware can encode the
> > > reply
> > 
> > Why pass a vfunc instead of the FW itself like I did in this patch?
> > If we pass a vfunc, then it should also accept a pointer to the FW right?
> > 
> > Thanks,
> > Dafna
> > 
> > 
> > > - All the above is stored in a pf_queue entry
> > > - Internally in GT page fault layer we drop looking at firmware specifc
> > > 'struct pagefault' rather the new format which encodes page_addr,
> > > asid, access_type, the reply vfunc, and opaque firmware data.
> > > 
> > > This will be more data in the pf_queue but it makes the GT page fault
> > > layer truly opaque to any firmware interfaces.
> > > 
> > > Does this make sense?
> > > 
> > > Matt
> > > 
> > > > +		pf_queue->fw->send_pagefault_reply(gt, pf_queue->fw, &reply);
> > > > 
> > > > 		if (time_after(jiffies, threshold) &&
> > > > 		    pf_queue->tail != pf_queue->head) {
> > > > @@ -664,9 +649,8 @@ static bool acc_queue_full(struct acc_queue *acc_queue)
> > > > 		ACC_MSG_LEN_DW;
> > > > }
> > > > 
> > > > -int xe_guc_access_counter_notify_handler(struct xe_guc *guc, u32 *msg, u32 len)
> > > > +int xe_access_counter_notify_handler(struct xe_gt *gt, struct xe_uc_fw *fw, u32 *msg, u32 len)
> > > > {
> > > > -	struct xe_gt *gt = guc_to_gt(guc);
> > > > 	struct acc_queue *acc_queue;
> > > > 	u32 asid;
> > > > 	bool full;
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.h b/drivers/gpu/drm/xe/xe_gt_pagefault.h
> > > > index 839c065a5e4c..0c01af3b7124 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.h
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.h
> > > > @@ -9,11 +9,11 @@
> > > > #include <linux/types.h>
> > > > 
> > > > struct xe_gt;
> > > > -struct xe_guc;
> > > > +struct xe_uc_fw;
> > > > 
> > > > int xe_gt_pagefault_init(struct xe_gt *gt);
> > > > void xe_gt_pagefault_reset(struct xe_gt *gt);
> > > > -int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len);
> > > > -int xe_guc_access_counter_notify_handler(struct xe_guc *guc, u32 *msg, u32 len);
> > > > +int xe_pagefault_handler(struct xe_gt *gt, struct xe_uc_fw *fw, u32 *msg, u32 len);
> > > > +int xe_access_counter_notify_handler(struct xe_gt *gt, struct xe_uc_fw *fw, u32 *msg, u32 len);
> > > > 
> > > > #endif	/* _XE_GT_PAGEFAULT_ */
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > > > index 6e66bf0e8b3f..73f7bd044828 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > > > @@ -249,6 +249,8 @@ struct xe_gt {
> > > > 		struct pf_queue {
> > > > 			/** @usm.pf_queue.gt: back pointer to GT */
> > > > 			struct xe_gt *gt;
> > > > +			/** @usm.pf_queue.fw the fw that handles the pf */
> > > > +			struct xe_uc_fw *fw;
> > > > 			/** @usm.pf_queue.data: data in the page fault queue */
> > > > 			u32 *data;
> > > > 			/**
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > > > index 1619c0a52db9..1ea3678f1463 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > > > @@ -5,6 +5,7 @@
> > > > 
> > > > #include "xe_guc.h"
> > > > 
> > > > +#include "xe_uc_fw_types.h"
> > > > #include <drm/drm_managed.h>
> > > > 
> > > > #include <generated/xe_wa_oob.h>
> > > > @@ -642,6 +643,19 @@ static int vf_guc_init(struct xe_guc *guc)
> > > > 	return 0;
> > > > }
> > > > 
> > > > +static int send_pagefault_reply(struct xe_gt *gt, struct xe_uc_fw *fw,
> > > > +				struct xe_uc_pagefault_reply *reply)
> > > > +{
> > > > +	struct xe_guc *guc = container_of(fw, struct xe_guc, fw);
> > > > +	u32 action[] = {
> > > > +		XE_GUC_ACTION_PAGE_FAULT_RES_DESC,
> > > > +		reply->dw0,
> > > > +		reply->dw1,
> > > > +	};
> > > > +
> > > > +	return xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> > > > +}
> > > > +
> > > > int xe_guc_init(struct xe_guc *guc)
> > > > {
> > > > 	struct xe_device *xe = guc_to_xe(guc);
> > > > @@ -652,6 +666,7 @@ int xe_guc_init(struct xe_guc *guc)
> > > > 	ret = xe_uc_fw_init(&guc->fw);
> > > > 	if (ret)
> > > > 		goto out;
> > > > +	guc->fw.send_pagefault_reply = &send_pagefault_reply;
> > > > 
> > > > 	if (!xe_uc_fw_is_enabled(&guc->fw))
> > > > 		return 0;
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > index 72ad576fc18e..14ff5f255d45 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > @@ -1293,15 +1293,15 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
> > > > 								 adj_len);
> > > > 		break;
> > > > 	case XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC:
> > > > -		ret = xe_guc_pagefault_handler(guc, payload, adj_len);
> > > > +		ret = xe_pagefault_handler(gt, &guc->fw, payload, adj_len);
> > > > 		break;
> > > > 	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
> > > > 		ret = xe_guc_tlb_invalidation_done_handler(guc, payload,
> > > > 							   adj_len);
> > > > 		break;
> > > > 	case XE_GUC_ACTION_ACCESS_COUNTER_NOTIFY:
> > > > -		ret = xe_guc_access_counter_notify_handler(guc, payload,
> > > > -							   adj_len);
> > > > +		ret = xe_access_counter_notify_handler(gt, &guc->fw, payload,
> > > > +						       adj_len);
> > > > 		break;
> > > > 	case XE_GUC_ACTION_GUC2PF_RELAY_FROM_VF:
> > > > 		ret = xe_guc_relay_process_guc2pf(&guc->relay, hxg, hxg_len);
> > > > @@ -1494,7 +1494,7 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
> > > > 
> > > > 	switch (action) {
> > > > 	case XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC:
> > > > -		ret = xe_guc_pagefault_handler(guc, payload, adj_len);
> > > > +		ret = xe_pagefault_handler(gt, &guc->fw, payload, adj_len);
> > > > 		break;
> > > > 	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
> > > > 		__g2h_release_space(ct, len);
> > > > diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> > > > index d8714ccb3f78..4d82430e3274 100644
> > > > --- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> > > > @@ -9,6 +9,7 @@
> > > > #include <linux/types.h>
> > > > 
> > > > struct xe_bo;
> > > > +struct xe_gt;
> > > > 
> > > > /*
> > > >  * +------------+---------------------------------------------------+
> > > > @@ -228,6 +229,10 @@ struct xe_uc_fw {
> > > > 
> > > > 	/** @private_data_size: size of private data found in uC css header */
> > > > 	u32 private_data_size;
> > > > +
> > > > +	/** a callback to send the page fault replay to the fw */
> > > > +	int (*send_pagefault_reply)(struct xe_gt *gt, struct xe_uc_fw *xe_fw,
> > > > +				    struct xe_uc_pagefault_reply *reply);
> > > > };
> > > > 
> > > > #endif
> > > > --
> > > > 2.34.1
> > > > 
