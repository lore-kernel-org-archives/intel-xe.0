Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB30C3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 17:57:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71AA810EA88;
	Thu, 18 Jul 2024 17:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bxT0pbLf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F1710EA88
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 17:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721325461; x=1752861461;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+IbeLAj5cSJnUcgNxq0dyXP40mNm9HW3ByD/DNTWAd4=;
 b=bxT0pbLflkUCKTCKDN7YWx8sYRSsY1hI1KIhZkAo+hq19Pa5zCqOCpm8
 thE6oR6DeFtGlX187gzi7QaaORk/j5AHtCQBxXykb1RjsL1ZWIe8T3Tn1
 VNTvds4cVba6fcLsciCpSKVxt3D8GwkBnCyk5W2lQNkhv0A40saj368+g
 JBozCvUiwL9e4dItojocDXQ/yJogLWuv94Gg4BLUpgnJ4+hwcGKGPREZ9
 89yvGKnU3N0UM6KWrkzFpsEw001P+HzYyKySf5hF96LR6FsU7XbCPsn6l
 4N+ji6ZI+SsO1F9pA3A52+7uS4Y5IJiypGvdwXw1M4IBvp8rqi110O8OR w==;
X-CSE-ConnectionGUID: aMk0aARcRf+gud/nlAGKQA==
X-CSE-MsgGUID: kuE0FpI+RquMUPNouLZlZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="29487812"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="29487812"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 10:57:41 -0700
X-CSE-ConnectionGUID: kmp8QiKnSEWVV0k1E1PjXg==
X-CSE-MsgGUID: +zZfz3ueRTy1DNTDYSCLtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="88331691"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jul 2024 10:57:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 10:57:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 18 Jul 2024 10:57:39 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 18 Jul 2024 10:57:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sgw5RWa0+9+gaF9jDtwIWLJLobEF12Vw4ob2jG3HDkPYKSj08++M28MZPC0bg3D1lQzj5YPy8ztic/FBlQduV/pMAEoryNSfH65/dCK6i5V25ENEYNmep8PfIdvn0Sz0vo2qiw5wquDzNImNFWcdrLkGk5KQzSca/V/bv/rSo6eaEagxtf90vauKKrOrBgKA8mJHk6Bd1YFCGGWbOBLSvcm7WK6X42tMjPz9A3F7f/2zGKS/HL7Pe6k4ue76fqbSpzCYur2eiJB1lLks5fwf59ab/zZeJ2coanLqLQXb4oNO7CiVIn+fYgH55N2/c5cIk7eoGGcBR8Oy2tGjtfWmmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0tvwhT9ZnmCZcGlc5T8Wj08DlhX1sCM9YGp3MjznkIs=;
 b=xCgPza3HEOjC/3zg+421lCw0f19JM7OfUFUzt02e4HYLU2KDNNb8MFEvX2Y6oZnHuUkvBWiGG20Zh5qAZSGamcM5xDzupDz/N2PebaM1cFCn0Aej53xrFoWaVc52S96bsppgWN+3CWkjCxzySJLeXLlzWEnYK9hMDbqPzY5qFXEd+Fr2i7pb1SoJkUQlhiJsyE1I4qEUZTfe2zBb+ZOELEam5Mr/iBH5Gh3oRPpgylSmvYATbWDGj/PGH/hjr81OfWCjC+S5PdhWIfHILxZZwmDEFqiYmKHs4h2jkmpiSxAt2xJdHpo5hjwrHq2UsGmrwRq5+a0ly3MoRlLClifcyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ1PR11MB6081.namprd11.prod.outlook.com (2603:10b6:a03:48c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Thu, 18 Jul
 2024 17:57:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Thu, 18 Jul 2024
 17:57:36 +0000
Date: Thu, 18 Jul 2024 17:56:50 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <daniele.ceraolospurio@intel.com>, <karthik.poosa@intel.com>
Subject: Re: [PATCH v4 2/2] drm/xe: remove GuC reload in D3Hot path
Message-ID: <ZplXYlk2gOswxJ43@DUT025-TGLU.fm.intel.com>
References: <20240717055558.4169407-1-riana.tauro@intel.com>
 <20240717055558.4169407-3-riana.tauro@intel.com>
 <f26ad960-4a13-49b3-b523-caa5715e40fd@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f26ad960-4a13-49b3-b523-caa5715e40fd@intel.com>
X-ClientProxiedBy: BY5PR17CA0070.namprd17.prod.outlook.com
 (2603:10b6:a03:167::47) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ1PR11MB6081:EE_
X-MS-Office365-Filtering-Correlation-Id: 6391edfc-7de3-4444-f83c-08dca7531b33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FNVlwMpG96R079KgqtlGi1dCavKjOaTCB0dZbpa7JN0a9xqdufzOwrDznkkk?=
 =?us-ascii?Q?rJq6vhma2O218cdav5z0c/woj3ypUtkRhUy7q3CerQdb+wSSo92RBiGtb9pL?=
 =?us-ascii?Q?uYUHLZpRU368oRjsRDYEZKf66/mIZP0cBA4UomVFbt5ioJ4VnhFW+D901Hok?=
 =?us-ascii?Q?CAW0723KwEziUkNwKTEphKeDM5tc/0ipNYExfchGDtnnoxsc+QzvPACudqch?=
 =?us-ascii?Q?RmG5wyRK2bzPBR0DrXG0YZD68IdsfRaSywhjbBDhVJoPer2irGhl8Q1iB8Jw?=
 =?us-ascii?Q?dPkDsuoRblJKhnmK/9214mkKFqvqOa+w8XDVuGhSETsUXJFJBF/X5hp6FSLP?=
 =?us-ascii?Q?X2kEjqEoefMYuHOFjONaUZzADql4e245PyBewPgl1ppfivK6X2RIVaKTZWnZ?=
 =?us-ascii?Q?7POqb7l/b7yPLcpJ1wgBdMUj3biWz5W/bjteh4fi+/MARP+Mv28dqRpHqW8U?=
 =?us-ascii?Q?mq8x/vzSB7bUmURHJhKnu/JJU6JxggMWUnh5lsivCu665nX2OorPsqRvqLtM?=
 =?us-ascii?Q?TySKfmANZ4TBX8wyCmtMwNo3A7Bsw0TNsKrCUcSFlzu5APFQ9KPicUpJBY58?=
 =?us-ascii?Q?UWkZ2gittZmd9jehOp9kZwGP9nQIosroM2T63f4l/WanpkbbYyVPhzMJbKAR?=
 =?us-ascii?Q?lEoq267y1RC4azKAB8H3ljUmUSUwnX4yMekcrq+DZ10G3h8kwUFg5mxogFRU?=
 =?us-ascii?Q?ZCoEWfd2EFVUM1X9Tvozxgc5LOJ+IvxMtF5C+59monOqgTDlgUq9r58TPp67?=
 =?us-ascii?Q?OI2yxn2ZbxtDzPqXbj7H5289047/a2lebpfQLV4HMkHIr5/oZuT9Zai+Z+hv?=
 =?us-ascii?Q?RJJCIqvFSPghaFPxF85e3TvDMoZiBiJiL1enCd+JAUTPeIaJDe0b8J0o8XMZ?=
 =?us-ascii?Q?hcuIeYfrumNdcmCbJTiLPRK1WH/I+SvnAPoU1mryUW2r++/rI9ikIpNFl1eW?=
 =?us-ascii?Q?HUJdkD04rGxkWXGXL6ZpqED3361gKDy7qupQ3nNAIARYhoBhP3An9IQ3TCN/?=
 =?us-ascii?Q?BMtEESG5cq+8sVc4XyowaojGF77UQTcCl6xRLmzCumPlCTX19pJAgZ3vQYmY?=
 =?us-ascii?Q?2Vdt3xBPLwUeAxSZXQkYixze1grpxV1n2xuVrmIZj4uMXhfbIPmzDefOZe01?=
 =?us-ascii?Q?F21aBAS993L8CJuXK+0uv1XLEIdqk25Ce7Bm2ZfBPl488STlfx+zYlpiGscH?=
 =?us-ascii?Q?y5wbMthjdky3ZALSbaWtEeUUnSDCcY91+8bxaKDHkJpudV4iDFwKK+rCUDa7?=
 =?us-ascii?Q?+Wxj4FGjinbTnw/d5Z52uUW1wNA+xB2YLT98hd+GpU08AOJ2KXkLsnpQMt1g?=
 =?us-ascii?Q?wWQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XNKi4yXizxGJRTWKkIK3nZt7X33yvwkTiD2HjtP/Pn5EaMDJhHowci6Y47eN?=
 =?us-ascii?Q?E85P+wpQ7u9hD+qLK+p0Li588OgVfs42Mpr0XQAvOTRZoKM0UNqQVsnavgU1?=
 =?us-ascii?Q?fxRH3YBK+4I/3UZ1NropzTWv54gB9GItuZ164O38Fwm4wAMmrIJk837mD7tW?=
 =?us-ascii?Q?CxQ6rfALPQwjIAiRsjUCJnLQmXaYoOja7a5WihxN3+djkiD0cLd87iYHwE+y?=
 =?us-ascii?Q?B43GqRyGRK43ZiQhlbXmVH9kOmOFcFBxnah47xWBU3Pdthjw18LeHxPQz/Yz?=
 =?us-ascii?Q?42trgA9/80qAo5ca41mi8u7jRnCeMqaLwbPdeT9GqznlIM+XOVWdPc/ro6eF?=
 =?us-ascii?Q?sNsbhbPyFpcJUqbIwD00qEomquzYnhfVZfRMcB4jokV2PIgSH63Pu+2j7DCY?=
 =?us-ascii?Q?OIA+NDun6NB1L02sJgYq4/QGpa4xa+4sHgeoZMb4d+AyXuwJKO7bjP2M36GX?=
 =?us-ascii?Q?w7mVtcb5vTUhxeDmVN3Hk6HUz1CWs+ecHz9KlXHeX/8U4IZVjL1bHcKzEWLn?=
 =?us-ascii?Q?RL79kVvbTN3O0LkaLIsGMmxhOpxIbBZ4r/1z6u3myi8uedLwzOfSnDw033Ra?=
 =?us-ascii?Q?17Yw2xQlfNnUOFtWAA5gLf0XEyAE9vib4M60crnWFr1E2Dc5xMKIYBWADj0M?=
 =?us-ascii?Q?My4WsPEJ+EywdYbS7oTNa/QKWZ3X7ZxLvEv54BY//iGD0u4tDdmgehVkNz3N?=
 =?us-ascii?Q?hwG446df3e70i12BoLSpJg4+X88v1OeoQDM44fiARNSbB7i69a9Zi5dK4M+4?=
 =?us-ascii?Q?gI95cSHcshlQQbLjYQB0kxGAwRx3rQykH+nxj40RJzqJKc5a7KAlwmmpUlyh?=
 =?us-ascii?Q?NjqLcVwVaDoVqhoS3hcRTsg07zWpwWKdn8Dbcwcr+Zmi8IEUKyK40Eron14y?=
 =?us-ascii?Q?tkq7lzqVGStf3R7q+T856k9Tl/uesJOz7inHRTWhxBGd+SA3dpNsT9lP/Hh2?=
 =?us-ascii?Q?RecCebEILu+M5xS12xFsNj9yjBIwPu9LE+1p2rPM/qYD8pG8WNjX8EUNA5Dl?=
 =?us-ascii?Q?veM+JY0j9QYCt9GcUh3onnp9P6uUU8i6GdlDGRmQjW/MYsaVL0ZGqhG2XInM?=
 =?us-ascii?Q?X6w3b8z5KCUVlcrY5CLkhHoh+f8GZbh70XTsw5e8MUNdyz1Yn935jjMffDPR?=
 =?us-ascii?Q?v4SHmVpfnAUs2UX6iJ9ayV+G/Z0TYYeEQq5JHiYtSSuCIVp2kHS1r6ckOyl9?=
 =?us-ascii?Q?sMKDivYEWce67pIOO1MfRe6e6/2ESnML8bMX9W5YmTj3vo2//dl06l9ZDeG8?=
 =?us-ascii?Q?RRyaCNlKPPsJvCquUwNMvUbh9VzsOGdYaiuqnm/gOgJW+WvpLCL6btGMBWbp?=
 =?us-ascii?Q?DlXLENOC7vxb7WegebOc4IL3aG/koyP70Ouxl+3yzE1iwP7lJ+RKsJBDdw+C?=
 =?us-ascii?Q?aUbgr8hnGbRWRsR/GTcH1rvoGVpMkjGxTQsa0/npeawbSXAOpnhXV0lfBBrb?=
 =?us-ascii?Q?iXMwhNiV1vjTRHILnvbQTaCIVmWrFFAdHeVTlgWtYpD6aKIIhB3zsAKTajwC?=
 =?us-ascii?Q?t1wzJtU5gSs2x98KfcztA8bhsExtiy8Lbn4qSWtqfo4qMpkMkfj1gkETDeil?=
 =?us-ascii?Q?d9kV1Sky52sD+e3kiJ+7JxDViv0nlgqL4rMxIkJ+4Se0vdGDwjjLmRhhtgRq?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6391edfc-7de3-4444-f83c-08dca7531b33
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 17:57:36.1642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R9DNEgbZl2Tw9g3e5P2VPf5cYJFACjNPG4OBDLzVlcm05Q5ImExz0c+i48ww+wOi8UAtEn0E/sWqQk5iuMSbcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6081
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

On Wed, Jul 17, 2024 at 10:38:00AM +0200, Michal Wajdeczko wrote:
> 
> 

A couple of things.

> On 17.07.2024 07:55, Riana Tauro wrote:
> > Currently GuC is reloaded for both runtime resume and system resume.
> > For D3hot <-> D0 transitions no power is lost during suspend so GuC reload
> > is not necessary.
> > 
> > Remove GuC reload from D3Hot path and only enable/disable CTB
> > communication.
> > 
> > v2: rebase
> > 
> > v3: fix commit message
> >     add kernel-doc for gt suspend and resume methods
> >     fix comment
> >     do not split register and enable calls of CT (Michal)
> > 
> > v4: fix commit message
> >     fix comment (Karthik)
> >     split patches
> >     correct kernel-doc (Rodrigo)
> > 
> > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt.c  | 33 ++++++++++++++++++++++++----
> >  drivers/gpu/drm/xe/xe_gt.h  |  4 ++--
> >  drivers/gpu/drm/xe/xe_guc.c | 44 +++++++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_guc.h |  2 ++
> >  drivers/gpu/drm/xe/xe_pm.c  |  8 +++----
> >  drivers/gpu/drm/xe/xe_uc.c  | 28 +++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_uc.h  |  2 ++
> >  7 files changed, 111 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 85f974441d50..716d3b46e986 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -831,8 +831,16 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
> >  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> >  }
> >  
> > -int xe_gt_suspend(struct xe_gt *gt)
> > +/**
> > + * xe_gt_suspend - GT suspend helper
> > + * @gt: GT object
> > + * @runtime: true if this is from runtime suspend
> > + *
> > + * Return: 0 on success, negative error code otherwise.
> > + */
> > +int xe_gt_suspend(struct xe_gt *gt, bool runtime)
> >  {
> > +	struct xe_device *xe = gt_to_xe(gt);
> >  	int err;
> >  
> >  	xe_gt_dbg(gt, "suspending\n");
> > @@ -842,7 +850,11 @@ int xe_gt_suspend(struct xe_gt *gt)
> >  	if (err)
> >  		goto err_msg;
> >  
> > -	err = xe_uc_suspend(&gt->uc);
> > +	if (runtime && !xe->d3cold.allowed)
> > +		err = xe_uc_runtime_suspend(&gt->uc);
> > +	else
> > +		err = xe_uc_suspend(&gt->uc);
> > +
> >  	if (err)
> >  		goto err_force_wake;
> >  
> > @@ -881,8 +893,16 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
> >  	return ret;
> >  }
> >  
> > -int xe_gt_resume(struct xe_gt *gt)
> > +/**
> > + * xe_gt_resume - GT resume helper
> > + * @gt: GT object
> > + * @runtime: true if called on runtime resume
> > + *
> > + * Return: 0 on success, negative error code otherwise.
> > + */
> > +int xe_gt_resume(struct xe_gt *gt, bool runtime)
> >  {
> > +	struct xe_device *xe = gt_to_xe(gt);
> >  	int err;
> >  
> >  	xe_gt_dbg(gt, "resuming\n");
> > @@ -890,7 +910,12 @@ int xe_gt_resume(struct xe_gt *gt)
> >  	if (err)
> >  		goto err_msg;
> >  
> > -	err = do_gt_restart(gt);
> > +	/* GuC is still alive at D3hot, no need to reload it */
> > +	if (runtime && !xe->d3cold.allowed)
> > +		xe_uc_runtime_resume(&gt->uc);
> > +	else
> > +		err = do_gt_restart(gt);
> > +
> >  	if (err)
> >  		goto err_force_wake;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> > index 1123fdfc4ebc..4c942e4716ad 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.h
> > +++ b/drivers/gpu/drm/xe/xe_gt.h
> > @@ -52,8 +52,8 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt);
> >  void xe_gt_record_user_engines(struct xe_gt *gt);
> >  
> >  void xe_gt_suspend_prepare(struct xe_gt *gt);
> > -int xe_gt_suspend(struct xe_gt *gt);
> > -int xe_gt_resume(struct xe_gt *gt);
> > +int xe_gt_suspend(struct xe_gt *gt, bool runtime);
> > +int xe_gt_resume(struct xe_gt *gt, bool runtime);
> >  void xe_gt_reset_async(struct xe_gt *gt);
> >  void xe_gt_sanitize(struct xe_gt *gt);
> >  int xe_gt_sanitize_freq(struct xe_gt *gt);
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index 8131c290a4f4..f612507e15d5 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -1114,6 +1114,50 @@ void xe_guc_sanitize(struct xe_guc *guc)
> >  	guc->submission_state.enabled = false;
> >  }
> >  
> > +/**
> > + * xe_guc_runtime_suspend - GuC runtime suspend
> > + * @guc: GuC object
> > + *
> > + * This function waits for any outstanding CTB to complete
> > + * and disables CTB communication before entering
> > + * D3Hot
> > + *
> > + * Return: 0 on success, negative error code otherwise.
> > + */
> > +int xe_guc_runtime_suspend(struct xe_guc *guc)
> > +{
> > +	struct xe_guc_ct *ct = &guc->ct;
> > +
> > +	/*
> > +	 * Wait for any outstanding CTB to complete before tearing down
> > +	 * communication with GuC.
> > +	 */
> > +	if (!wait_event_timeout(ct->wq, !ct->g2h_outstanding, (HZ / 5)))
> > +		return -ETIMEDOUT;
> 
> this seems to be using only 'ct' stuff, so maybe it should be part of
> the 'ct' layer ?
> 

I think we are trending towards merging this [1]. If we do so
g2h_outstanding should always be zero here, thus is unnecessary. We
should assert this though somewhere in patch (e.g. in this function or
in CT layer).

[1] https://patchwork.freedesktop.org/series/136226/

> > +
> > +	/* Disable CTB */
> > +	xe_guc_ct_disable(&guc->ct);
> 
> hmm, I guess today it only works since xe_guc_ct_disable() actually is
> not disabling (unregistering) CTB within the GuC, since it was optimized
> away knowing that GuC will be reset in the next step or already dead.
> 
> but for our runtime_suspend|resume maybe it would be beneficial to
> un-register CTB and later re-register CTB, so we know we have semi-fresh
> start

Isn't the point of D3hot VRAM + GuC firmware is persistent? Why
unregister CTBs, just add latency to resume.

The point of this patch it just to cut CT communicate at the software
level to make sure we don't shoot ourselves in the foot say by sending
CTs is a suspend state.

> 
> we only need to take care of resetting ctb.descriptor.status|head|tail
> as during registration, GuC expects them to be zero
> 
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_guc_runtime_resume - GuC runtime resume
> > + * @guc: GuC object
> > + *
> > + * This function enables GuC CTB communication
> > + */
> > +void xe_guc_runtime_resume(struct xe_guc *guc)
> > +{
> > +	/*
> > +	 * Power is not lost when in D3Hot state,
> > +	 * hence it is not necessary to reload GuC
> > +	 * everytime. Only enable interrupts and
> > +	 * CTB communication during resume
> > +	 */
> > +	xe_guc_enable_communication(guc, false);
> > +}
> > +
> >  int xe_guc_reset_prepare(struct xe_guc *guc)
> >  {
> >  	return xe_guc_submit_reset_prepare(guc);
> > diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> > index b49444297eb0..98d6d84a66c0 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.h
> > +++ b/drivers/gpu/drm/xe/xe_guc.h
> > @@ -22,6 +22,8 @@ int xe_guc_upload(struct xe_guc *guc);
> >  int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
> >  int xe_guc_enable_communication(struct xe_guc *guc, bool register_ctb);
> >  int xe_guc_suspend(struct xe_guc *guc);
> > +int xe_guc_runtime_suspend(struct xe_guc *guc);
> > +void xe_guc_runtime_resume(struct xe_guc *guc);
> 
> as we are adding runtime_suspend|resume pair at the xe_guc layer, maybe
> the same should be done for the xe_guc_ct layer, which would eliminate
> this 'register_ctb' hack and/or need to expose internal ct state.
> 
> then we will have something like:
> 
> xe_guc_init
>   xe_guc_ct_init	- alloc ct buffers
> 
> /xe_guc_enable
> |  xe_guc_ct_enable	- register ctb in GuC
> |
> | /xe_guc_runtime_suspend
> | |  xe_guc_ct_runtime_suspend	- wait, mark ct as disabled/unavailable
> | |
> | \xe_guc_runtime_resume
> |    xe_guc_ct_runtime_resume	- mark ct as enabled/available

I like the idea of adding xe_guc_ct_runtime_suspend /
xe_guc_ct_runtime_resume functions.

Matt

> |
> \xe_guc_disable
>    xe_guc_ct_disable	- optionally un-register ctb from GuC
> 
> @Rodrigo, would that work ?
> 
> >  void xe_guc_notify(struct xe_guc *guc);
> >  int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
> >  int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len);
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index de3b5df65e48..070d28d193c7 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -99,7 +99,7 @@ int xe_pm_suspend(struct xe_device *xe)
> >  	xe_display_pm_suspend(xe, false);
> >  
> >  	for_each_gt(gt, xe, id) {
> > -		err = xe_gt_suspend(gt);
> > +		err = xe_gt_suspend(gt, false);
> >  		if (err) {
> >  			xe_display_pm_resume(xe, false);
> >  			goto err;
> > @@ -154,7 +154,7 @@ int xe_pm_resume(struct xe_device *xe)
> >  	xe_display_pm_resume(xe, false);
> >  
> >  	for_each_gt(gt, xe, id)
> > -		xe_gt_resume(gt);
> > +		xe_gt_resume(gt, false);
> >  
> >  	err = xe_bo_restore_user(xe);
> >  	if (err)
> > @@ -370,7 +370,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
> >  	}
> >  
> >  	for_each_gt(gt, xe, id) {
> > -		err = xe_gt_suspend(gt);
> > +		err = xe_gt_suspend(gt, true);
> >  		if (err)
> >  			goto out;
> >  	}
> > @@ -423,7 +423,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> >  	xe_irq_resume(xe);
> >  
> >  	for_each_gt(gt, xe, id)
> > -		xe_gt_resume(gt);
> > +		xe_gt_resume(gt, true);
> >  
> >  	if (xe->d3cold.allowed) {
> >  		xe_display_pm_resume(xe, true);
> > diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> > index eb9c1443c849..2f52e57bea12 100644
> > --- a/drivers/gpu/drm/xe/xe_uc.c
> > +++ b/drivers/gpu/drm/xe/xe_uc.c
> > @@ -288,6 +288,34 @@ int xe_uc_suspend(struct xe_uc *uc)
> >  	return xe_guc_suspend(&uc->guc);
> >  }
> >  
> > +/**
> > + * xe_uc_runtime_suspend - uC runtime suspend
> > + * @uc: uC object
> > + *
> > + * Return: 0 on success, negative error code otherwise
> > + */
> > +int xe_uc_runtime_suspend(struct xe_uc *uc)
> > +{
> > +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> > +		return 0;
> > +
> > +	return xe_guc_runtime_suspend(&uc->guc);
> > +}
> > +
> > +/**
> > + * xe_uc_runtime_resume - uC runtime resume
> > + * @uc: uC object
> > + *
> > + * Called while resuming from D3Hot
> > + */
> > +void xe_uc_runtime_resume(struct xe_uc *uc)
> > +{
> > +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> > +		return;
> > +
> > +	xe_guc_runtime_resume(&uc->guc);
> > +}
> > +
> >  /**
> >   * xe_uc_remove() - Clean up the UC structures before driver removal
> >   * @uc: the UC object
> > diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> > index 11856f24e6f9..dd483ea43b9b 100644
> > --- a/drivers/gpu/drm/xe/xe_uc.h
> > +++ b/drivers/gpu/drm/xe/xe_uc.h
> > @@ -15,6 +15,8 @@ int xe_uc_init_hw(struct xe_uc *uc);
> >  int xe_uc_fini_hw(struct xe_uc *uc);
> >  void xe_uc_gucrc_disable(struct xe_uc *uc);
> >  int xe_uc_reset_prepare(struct xe_uc *uc);
> > +int xe_uc_runtime_suspend(struct xe_uc *uc);
> > +void xe_uc_runtime_resume(struct xe_uc *uc);
> >  void xe_uc_stop_prepare(struct xe_uc *uc);
> >  void xe_uc_stop(struct xe_uc *uc);
> >  int xe_uc_start(struct xe_uc *uc);
