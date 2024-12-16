Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F86E7717F
	for <intel-xe@archiver.kernel.org>; Mon, 16 Dec 2024 17:46:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8856010E1D7;
	Mon, 16 Dec 2024 17:46:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HM1KtPJU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF4010E1D7
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Dec 2024 17:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734371189; x=1765907189;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1+MquRTRSXFahITXbEAX9+mr7cwkhmRJ2PSQ+nf7o5w=;
 b=HM1KtPJUFluo3RLd3GxSmxCPWp5AxaofB7ss7YUFrM9PbgOm2283T2fN
 N8xlPJ3I61i662UhEZ3YDhf/iJ4Uf91CQb/T9tR/+fGxVZCRnx2rN3hW6
 0/ieBPEZ5mseppAHrBSOjMuxmxYMFQZfs4vJL9PqZm7XqsGNJ2GL/DeAK
 +SK3WjGw9opYz5BgBY0teqxzuBYYAPG94Ce1rOCmH70ezQUqE82Z8fzOG
 VOtqfK+Dib0AJinu86r5+aYJpN01m9kohUzTMaghaX2NdqqqdGGR9B7+i
 GQCaVIWRO/wlUJvxnpoq0sYIFcdmboQbYT4uLS8I/y0ybptTT4u5YKPSf A==;
X-CSE-ConnectionGUID: AcmXD0p4RHiJkBL9BFLkeQ==
X-CSE-MsgGUID: PR/c/54/RG+KiN+U4BmVGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="45463982"
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; d="scan'208";a="45463982"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 09:46:29 -0800
X-CSE-ConnectionGUID: //saZFeuSZqkwue+72zx2g==
X-CSE-MsgGUID: 3FOLPnYyTWKAgI9sNzuKHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; d="scan'208";a="97305915"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Dec 2024 09:46:28 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 16 Dec 2024 09:46:28 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 16 Dec 2024 09:46:28 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 16 Dec 2024 09:46:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g3/5PHDPSyeIkzYs/1Hrh8nVPxKwiWn286tAU81qPSWKLAgnyvvQNboO8QO0PhfIwUERlXBtimWHl94fOv2k0eFL8yOTVlZ2ozK1k3CdFJPbNLvMz+VUG/bIOlaXRSASZ/i0V4noacYcZq2HOOYxZyj0zVWVM6eTzSiy12EhovaX9mPM5Hr4yMzjSv0neJzw5xnnPXbcKABONZNakpk71AgIuBINILrRA4GO/PJ3QOsjVU3sFMuLRJlKyAy9rzx8dGTrtNx3C8qi5yD4G7AGQf6VZED+dc8Jsm6Zf6QKT3gK0CK5APlxaFzE345s9DPiZoFleDoVVmCTXzMEDBKi8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LlOgpaFWhJytDje8duE4IsZtfv+SYvGJnrR3FbdG1RY=;
 b=nOC0j+J+uImRExXa5io5NOFzyjvPIfajII1XWYpjqKgUg+3o2MUBvEw/e675Jv5RknpGFhKUiMZ4ugqJbKEYz/+rhJfLLgsjpBt28SKWQiP/oOTl54c4d2MLhDFGJXfH0mxO3Sc6lTf8F/Mod1a6q34HV0xWwuUAAmKoaRVWr4amAktYyVKhkqZZCfl/HlLd0vJA5l5pbLZLbt5FWefI/e7BW3F6qJePQkzPtDuaPFI2IIlnK6eixPkYoF2/c7S0Bhctdn+ENzIi4koPf6vcP4xqRKnP0t9TQVQq/CsfBqxHfwk2b4JoQFVocAO9B7DWU5TnALcwkUoo//zU3kMZWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by MN2PR11MB4757.namprd11.prod.outlook.com (2603:10b6:208:26b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Mon, 16 Dec
 2024 17:46:25 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 17:46:25 +0000
Date: Mon, 16 Dec 2024 12:46:21 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <matthew.d.roper@intel.com>,
 <aravind.iddamsetty@intel.com>
Subject: Re: [PATCH 2/2] RFC drm/xe: Enable Boot Survivability mode
Message-ID: <Z2BnbVDjnTQ3CJYf@intel.com>
References: <20241212054945.1091894-1-riana.tauro@intel.com>
 <20241212054945.1091894-3-riana.tauro@intel.com>
 <878qsfucxo.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <878qsfucxo.fsf@intel.com>
X-ClientProxiedBy: MW4PR03CA0343.namprd03.prod.outlook.com
 (2603:10b6:303:dc::18) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|MN2PR11MB4757:EE_
X-MS-Office365-Filtering-Correlation-Id: 07b25e1a-27ce-4363-3938-08dd1df98f9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BAbshhPteDiWFcdNQsyDJ23v5vnZxhkSaBDdh9iSfsqmbDOkIQ4tswF6v8vd?=
 =?us-ascii?Q?7EL4CbonBauMs28gcdt38/WiFAs8Y2ZjkKn00CpKPvtaFOvNAGN0q1YuvNgv?=
 =?us-ascii?Q?N03/D2g64u+2NmMZGY9iNFLpCd/OxfeuFeyQxDm9jhxlJo9VWnJQHt0dAXtT?=
 =?us-ascii?Q?2aAM5nyAD/LoVxPTCpsIZW2uQvd7tVEcQX3PhRMMKjlKoaASb2m0eH7JoNVs?=
 =?us-ascii?Q?r8K8x3QdzzeJf9gLAIlfCpTL7larCRKv6Qsz8gWHU9meSJpeKpfapdkb+Jtz?=
 =?us-ascii?Q?IOgIGQxs5tLsvIunfDooNxbgWaWEbskBUtEAEOToo5VCEZdTxf6yIoyE7bAK?=
 =?us-ascii?Q?ke4bivpo7zv0gzhflFhq3X986Vuvm1eUTcVSiMGq63+PIJAyNdoBRxU91gFv?=
 =?us-ascii?Q?/nYOdidF2fvE1Kv9XslkJt+m34mt0PK5U4e1kDB0Mu4az1qxfryCNwoCveni?=
 =?us-ascii?Q?Hhl7CmYRJmlEMV68J2OtFMqx/MZjRfsL+piCpDtxXiUsR3m1KGVtQCQGVVaH?=
 =?us-ascii?Q?2lgzW8uZaLK7E7sFV81IwbNJ4TcA2rBiIeak4LIC72A2UjcjUnH/CgHjS2Ek?=
 =?us-ascii?Q?j9eFfbOhoDabydtpsUKIPlZ9VpSU+m+HuOLoWgX3M2MGbgL7PzyLLXBalYrW?=
 =?us-ascii?Q?ff6mzvdc4bZbBlrYG8M5YfRlRshefIyihLaO5oH/w6XQy45KlOF7yVRsAJIO?=
 =?us-ascii?Q?iAMPZE5ZSuerehQrQWAoCMkl+2EhbafUn8l8fa2jNfC8zCjSARUh6/9yIYp/?=
 =?us-ascii?Q?JNtqypDKrZK2E4a1V+OFPTxXrwRZVH5rUGLxKO5mmUdGNWSiVVi1cI4wfigV?=
 =?us-ascii?Q?l6cJV9mVqHkcg/KeD2PBquCL3umSXHmCiILXvjZNNGYgVWQlhSagd5aUR8i1?=
 =?us-ascii?Q?PvC7OqyzjNJOL3DoOv0Ww0J9BKw1h+nZL8dL9cY7N9q+vCzFKYL0r3/BFJMk?=
 =?us-ascii?Q?/ivEEmCmMm8O4Xea3XWo4qHVisQoIztn+8XTxGw4Ffz7hbeJ59v6gu9D3ufr?=
 =?us-ascii?Q?s2Ek+Nn53DlMucUri3zVuAgcsnRWlx71Z6EzTxxePThLrEYoxW0flvrGRVSo?=
 =?us-ascii?Q?kAzxodjlmUyRYYN49uc5pcFW+TzAwHOv/+qbEwDMjHaTROcFRUYTGiAhqIVc?=
 =?us-ascii?Q?9jB4OTNq4xspCH56LZtLqXT6A18CDR+jnHt+0ZD4OKk89kTgmxwkiBeAbs6o?=
 =?us-ascii?Q?hvWH7L1pWkbFNTEimUdmYk71j6shwB5z/A+uuq6U8PYuUMeZfbVVDowICpYa?=
 =?us-ascii?Q?CYjQ1zp7G4SmY/gTU8FZki0czNviCE6CT/HikMPuJdYrk2tjlbDTdyL1uvNy?=
 =?us-ascii?Q?m6WjQ37guPOLRjZ0gSe2CioPUcd03WGlF2JVMnvYRrsABNqbBYI76wFJ8JKu?=
 =?us-ascii?Q?gxnoHsQ0tj7rBqB/kBirES1c6rFp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jo5Qym+fq5Uhwj4JO+VzCDOhLIxF5evXwluuZ/kt6ZxOqg8evm15vhl2+0mb?=
 =?us-ascii?Q?54NQ2xWSodncHtzbVjdU64tc6wYz3NkfY5T53Oaj3Aw9j4gpA50Ab32xTRgt?=
 =?us-ascii?Q?8s41sqS3Kmq2ru1uzr7D7O8ubOo2ay7XpMlArfAOcH80FRLnuv4tLqSy3fb8?=
 =?us-ascii?Q?8n5us1Mu3CCrD7rQvaIIuny9f6CZLXMTEPfFvf2m9zW7iymOXaRWSoGqAebC?=
 =?us-ascii?Q?PS3g2GfGKWAlpN8D+6YwQFQ5vAicETM4uKNZmNqddk2GbFaLohC/aurihnWh?=
 =?us-ascii?Q?P2BcyHSvx/1N3djOShmL87lTTs2cTlo+T8OsVptqODTQHqCPdY0Ph6BdIR+9?=
 =?us-ascii?Q?M1qASuY6WieELKZRXuMJeWmuUAOTmxw/vJeJpjZX5pIRjS0cmrH/QB8fZF/m?=
 =?us-ascii?Q?76AAw+58UnCSpLG+zjDcE2gPPb2riY+3cwjrgQAouUpwDmDi5IkwXzo4BrOJ?=
 =?us-ascii?Q?/qDBriUrkJY/rur1P5NWbJj6hCSEyhidOMYJLLB0MkwUK1b39/ZO2JGxv7jm?=
 =?us-ascii?Q?nzGRr5SVkuqGI3QQNc9gN8gatBcZxIQSdnqtb6cS6Gsva9AD4OFObjpQ/Dpr?=
 =?us-ascii?Q?9arASKcE56akZp+wa+M27/kd8Acakjv7k5Q3ropHgbBUBHXgozLN6xPPgLHf?=
 =?us-ascii?Q?1NC3ECVbKQLilxxW+wbtUT4JfuGnij0tywVcTeFx5Ob8D4txQOQDYmSvzZrV?=
 =?us-ascii?Q?H4pHqo0yKUoByAybjVBOm+YE7oZAsMLaWF22cwuD984hjsjBjl1c4k6GSQu7?=
 =?us-ascii?Q?oq2P7XJopithsLtcB8zMJHi4qZQNCKF0qhWm2j1qHYG27wtvLHQcVmHp6YCk?=
 =?us-ascii?Q?caA5Wv44ZIKcEzUQd4P/4+Oyq5nz39gwibgu6+aatVJiYh/UBhFl/wyb5qjf?=
 =?us-ascii?Q?dxeblszJ6ShA7CzX/1i9+EDXFnt59Fl4yyvTtF5Me+bvBCnMumyx3F2z7Ksn?=
 =?us-ascii?Q?EnpVC88yib4kCbuJtf0LN8c3mIUg9LsDi50udOI1bLyeSGqs0vpdLyingRYM?=
 =?us-ascii?Q?0wKwSM4YuJi9P2JzaEi2DyEbrAukuoGjuQ/uvGn3JWqo9yE9ilg5wp29tcDI?=
 =?us-ascii?Q?CReL0LN1998jGAeT73g0Yo/uyNTAPHQsw6Ukwq3GsEC5l5YiHXaOu0EfOp64?=
 =?us-ascii?Q?qOtCGb1KRz+CLAgcCDlB9zZBJc9JrhOEGqp3xaoJbq6cUhxCFcOJgtC55eYN?=
 =?us-ascii?Q?NRJvTi+TXnypsZtUxgMPYPkOfY6bBjm0KxXaSdECqoNZA/k4TpcEQheo8aUa?=
 =?us-ascii?Q?O1F0Y6UrxdkEjgTuk709hm8iYynHvIKSCmCNCWoQgJdnfU4q4x1WH5HrkUxp?=
 =?us-ascii?Q?71op9V6gw3xyp0KVSkwqd5i+2W93Iq126mcM2ZVj/g/tT3X6XR9AmGpwkRZi?=
 =?us-ascii?Q?1hcvjl7UlIS+QBeopWwSxxKWsY7YNa9DZQXHtS9SGbQ+4Nf2Xo28HwFegUBX?=
 =?us-ascii?Q?Bt1haBUK+RZPWTni7CZJaT4Frorj33PWWTn7B6VJUP9msWSeDmfprqeL++iA?=
 =?us-ascii?Q?H40cyQd1xalVQrtXGrRKRCmD46RcCYORmYRYwPS9j3QcDtxU30IpCfyH7wE3?=
 =?us-ascii?Q?Cw28a36RO/x97xK8dLKhIUg5ET83oJqbv9FdIh+ROQfJ3r6vBfCiq4+8NkI2?=
 =?us-ascii?Q?fQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07b25e1a-27ce-4363-3938-08dd1df98f9b
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 17:46:25.1653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jk31A/3GL7ZaBoo1AED7MQDOUhCZ1D1+r7iyT12W/oUCOo/jKUKVHViItUkNoLKM4pa7/w0KCSx6bmu+St3UvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4757
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

On Mon, Dec 16, 2024 at 12:42:11PM +0200, Jani Nikula wrote:
> On Thu, 12 Dec 2024, Riana Tauro <riana.tauro@intel.com> wrote:
> > Enable boot survivability mode if pcode initialization fails and
> > if boot status indicates a failure. In this mode, drm card is not
> > exposed and driver probe returns success after loading the bare minimum
> > to allow firmware to be flashed via mei.
> >
> > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.c             |  9 +++++++--
> >  drivers/gpu/drm/xe/xe_pci.c                | 13 +++++++++++++
> >  drivers/gpu/drm/xe/xe_survivability_mode.c |  3 +++
> >  3 files changed, 23 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 56d4ffb650da..50ed980e1db9 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -51,6 +51,7 @@
> >  #include "xe_pm.h"
> >  #include "xe_query.h"
> >  #include "xe_sriov.h"
> > +#include "xe_survivability_mode.h"
> >  #include "xe_tile.h"
> >  #include "xe_ttm_stolen_mgr.h"
> >  #include "xe_ttm_sys_mgr.h"
> > @@ -585,8 +586,12 @@ int xe_device_probe_early(struct xe_device *xe)
> >  	update_device_info(xe);
> >  
> >  	err = xe_pcode_probe_early(xe);
> > -	if (err)
> > -		return err;
> > +	if (err) {
> > +		if (xe->info.platform == XE_BATTLEMAGE && xe_survivability_mode_required(xe))
> 
> Why the platform check here? Doesn't this stuff belong abstracted inside
> the survivability mode?

Indeed. Moving inside xe_survivability_mode_required() itself sounds the right thing
to do.
Also, it could be IS_DGFX && GRAPHICS_VER >= 30 instead of platform check...

> 
> > +			xe_survivability_mode_init(xe);
> > +
> > +		return xe->survivability.mode ? 0 : err;
> 
> Is it a good idea to start looking at survivability guts from all over
> the place? I mean xe->survivability.mode. Even its value should be an
> implementation detail, and this is using it to decide whether the
> previous call succeeded.
> 
> I think this would benefit from hiding stuff better and providing
> interfaces. This is one of the things i915 sucks at, and it's really
> hard and tedious work to fix afterwards.
> 
> Just imagine xe->survavibility is an opaque pointer (even if it isn't)
> and implement stuff based on that. It will make a world of difference in
> future maintainability.

indeed...

bool xe_survivability_mode_on()
{
	return  xe->survivability.mode;
}

would be enough I believe...

> 
> 
> BR,
> Jani.
> 
> 
> > +	}
> >  
> >  	err = wait_for_lmem_ready(xe);
> >  	if (err)
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 7d146e3e8e21..b9dcd36de06d 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -30,6 +30,7 @@
> >  #include "xe_pm.h"
> >  #include "xe_sriov.h"
> >  #include "xe_step.h"
> > +#include "xe_survivability_mode.h"
> >  #include "xe_tile.h"
> >  
> >  enum toggle_d3cold {
> > @@ -768,6 +769,9 @@ static void xe_pci_remove(struct pci_dev *pdev)
> >  	if (IS_SRIOV_PF(xe))
> >  		xe_pci_sriov_configure(pdev, 0);
> >  
> > +	if (xe->survivability.mode)
> > +		return xe_survivability_mode_remove(xe);
> > +
> >  	xe_device_remove(xe);
> >  	xe_pm_runtime_fini(xe);
> >  	pci_set_drvdata(pdev, NULL);
> > @@ -840,6 +844,15 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> >  		return err;
> >  
> >  	err = xe_device_probe_early(xe);
> > +
> > +	/*
> > +	 * In Boot Survivability mode, no drm card is exposed
> > +	 * and driver is loaded with bare minimum to allow
> > +	 * for firmware to be flashed through mei
> > +	 */
> > +	if (!err && xe->survivability.mode)
> > +		return 0;
> > +
> >  	if (err)
> >  		return err;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> > index 7e36989efd68..6c1e79b5c15f 100644
> > --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> > +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> > @@ -176,7 +176,10 @@ bool xe_survivability_mode_required(struct xe_device *xe)
> >   */
> >  void xe_survivability_mode_remove(struct xe_device *xe)
> >  {
> > +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > +
> >  	sysfs_remove_files(&xe->drm.dev->kobj, survivability_attrs);
> > +	pci_set_drvdata(pdev, NULL);
> >  }
> >  
> >  /**
> 
> -- 
> Jani Nikula, Intel
