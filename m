Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7F4C5AD49
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 16:30:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC3D10E680;
	Tue,  3 Jun 2025 16:30:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E3FG1iXZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E7610E646
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 16:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748968206; x=1780504206;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=oTe3twt5IOCTu0quezly3bwQmZ39jNolJ0ctMcYzVrk=;
 b=E3FG1iXZVY6tzXWmfjUY0pm/M6ca4tELmLNAPXcRyJ5t8IngGJEFEx/k
 viTC6RT3kzz0vU4VBH2HFoaxSvFEwToQJ54SKbWJxeWOQj4b/hTbSsDsV
 nDEMxEbPrR1MSfZwwMWjsh5b0vT9hoSJDJF2k5O8kJ19XLtJz6ndoO5bm
 KP17X5gHZFJ3cCA8fOydbDLGppfNgTJJmIbsOqGTLvEY9iUazfOj3HMof
 zNC0vDTHChlvtjMadACQ3iG9WsHRU6tloooCIQNECqZFQAhTR9LngaGKy
 +VHdwf/nJJ+DwqNsL84HwN0haM533fK6lvsjI+q4o6TlnTgUpSTjLQHSq w==;
X-CSE-ConnectionGUID: dWuYnOA4QPKlepJ7fK3cTA==
X-CSE-MsgGUID: U7w8GJo2TIiqxelYMnUWpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="61638964"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="61638964"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 09:30:06 -0700
X-CSE-ConnectionGUID: xIDgvx5yQuaicBQKfA9YnQ==
X-CSE-MsgGUID: LB6T7a4ARqWoeiJgzJgHiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="150063703"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 09:30:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 09:30:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 09:30:05 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.57) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 09:30:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OVXuNNEzukqQ3DtgSgNM2D134HMvhK0DupONv/vtJpSNZiE/yhuVzOrPXOr4IptA8flUVTKwDLlyvwOCvCeo9KEurBa2sxaelEVsLPkGK00/OTygK5UqrSZArswtzwYbyCzMF44lwHOBhYlp/9lxxvmcZOw3ba/kvBGtNqQRy8lGCCrHo7eK4HIhOkUAc8PpExEkHuMTAetjaL/hsOgZowt7GPkPhQJLVNEif47TbmOLY9mreygFicfJBMuLnOCoZF3bDoAEcerWLavWZfzyQQDKu1RkF/c+LAQUfx5qtqDbxL4xbQpyhRrM/zvvln/yHi5RmJc/P1Twp8m8GcQbUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPg0wsNkaj4sEuzW1iV92Bq6dAH+xfedNapPtFB85O0=;
 b=cI1BkrBmGn29U9PbfCucBVxoJ9lAaTBFp4cW225nguUVUOA/CFiZBvK9ml3QCAzQ/ksVa+IU2cIgYe4ZLfajqaTJpQH/KdCnxTtO9n++ujqRiu87m4t35qbfiB4JDszchP52AEGbZHCFTnybqkFQ2cylxXyRVhnUK8LYsGkJTB2cTj5YFnYH8FiVGtuSoq68LmvLLub2prcqLAWmpxsqwZBppEmHSxVMA7I/vrZyfciRN1Tf6hnPZXFtOyWcPcZ8yWLvD15+ZHMbtJVP0BXR+0+OEmwJwxiD6ZeFAbdAu/U8zOserzPe7qS/zugXwvs6PNvGQFO8lv28OwlR2LrXhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6944.namprd11.prod.outlook.com (2603:10b6:806:2bb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Tue, 3 Jun
 2025 16:29:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.029; Tue, 3 Jun 2025
 16:29:36 +0000
Date: Tue, 3 Jun 2025 09:31:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v4] drm/xe: Make VMA tile_present, tile_invalidated
 access rules clear
Message-ID: <aD8jTa9Vzf0VbEv4@lstrano-desk.jf.intel.com>
References: <20250602164412.1912293-1-matthew.brost@intel.com>
 <ca525dc1e2be1e69e06b22fd446996e43b2d7f38.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca525dc1e2be1e69e06b22fd446996e43b2d7f38.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0137.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6944:EE_
X-MS-Office365-Filtering-Correlation-Id: 811f632e-d59d-4c87-731b-08dda2bbd442
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?KBVew7CyyEKv8ia/nm7BEL5Aj1NHIqyE75yb2Nh7iyJkicpW02zJkwJ7MS?=
 =?iso-8859-1?Q?zuD8PIgTncmVaHsgLDHfL5AQ7d1Fd+TdTTmYRMd7y073txuWmJ11fyO9nF?=
 =?iso-8859-1?Q?7oNeQgatsli3clOaXKpk9Gs6nEGd+Zo+ipTHLX2EvLv5wrwfxPqWUD0Oq6?=
 =?iso-8859-1?Q?lMRlnmKXx6Y+orTkslHWlyyBuJYv2dyMW9K1FVk22lsE0p5YbPaj6bKfby?=
 =?iso-8859-1?Q?6iLW+eOUV3lc13nfp2LZNM7Ez0HB0UT5IuBLlkg0gNqh2X7E0Os2dxGDM9?=
 =?iso-8859-1?Q?JpLERGymbR5Jwzwinf3UPcoQY7pm0dRKNHYE1MGgUqZLtusIcwsdK90i7H?=
 =?iso-8859-1?Q?GRJ/Isw3ak7LnVvAySRe3q35HiasLbVWIp52pf7cDYtqoOYuDOmNFD5oDa?=
 =?iso-8859-1?Q?KnRZWZSKwYBvVS574fIrvWUepJGm1JdBDGtq/dJ6XJacpWeNXg3go+5YUD?=
 =?iso-8859-1?Q?bG96tNUwFXCGhbYXsuzO4MjwxuzJmZDmBaDKd/s+3yktrLfVupzTDDsvU7?=
 =?iso-8859-1?Q?aNpXLeOennIVe4zNdUzqAUej0CyKwE8hq7eTH99Enwf5Gy+5dtk2wsIsI2?=
 =?iso-8859-1?Q?jgjr0+zwX/I7QLWXX+3l6F0wlg8DMxM2PQ/4OLloCItQQmdHwa+mPucbbM?=
 =?iso-8859-1?Q?nZ7meu0oqjS/YzcbrOMwiDssiKl8TxCkRAhWyeqSl7tbUNO9USll2zQxEa?=
 =?iso-8859-1?Q?vGkEdFoo4oajC+gcA/OT9sRil6HJl6POuxGsGAbvBV8G1wl3MO0aAkuhki?=
 =?iso-8859-1?Q?P/Q/IZkvx4TCR6CsG1pNS0PmlcGb5j9H/2coGJFgX1C8UtbF+gJwbD7x70?=
 =?iso-8859-1?Q?95+1l2mInxYvgTkJIBbPzLszK4O8YOPP9OkOIOisoYatl0U55iurKlP/i7?=
 =?iso-8859-1?Q?5hhNbsHeMYz1xAAU5YFZ3Sf7aacURfJz4TX/dPsbg2H3IPtqmTIvK18hOV?=
 =?iso-8859-1?Q?RT61Cjm77GL0IKKeb+VeuEeS2FJ50Mnt7KzML3yOGvBO+6W0zSNVilGOAK?=
 =?iso-8859-1?Q?luRtkLa0b+dl9zJRq89ZRKlQ6kR6RCY5gtLKWzNDXQU1fE/1ZKybKXeXJY?=
 =?iso-8859-1?Q?DsF8bG3I2b/+sdvOSLvTEe0yL/Q1hlUB1KiRFySs+hRSQbR/sIqMcKZiL+?=
 =?iso-8859-1?Q?tX0UHoH9fYG+mkGPtwgkzulsd/MVIIZ++EzHntCFpJ+dp2T2Li/1UhqKZM?=
 =?iso-8859-1?Q?QMssC1iq+YDGhhD+G3cjHD7I3L9I9x9XFoDWzuPcsdJVhKjX8YfL8pAkM3?=
 =?iso-8859-1?Q?y/iW3fz9y/4hpkiMq/o6cVOoAZTZr0fuoEvT2OEUJFJY3fLj8ONMPApRfY?=
 =?iso-8859-1?Q?2XCjBAZQHXOXLIgfZg4wJwYoi3hNdvg2R8/Rmoyz8cf59BKg42BU1CpvmF?=
 =?iso-8859-1?Q?OnjgS3NmXZanRFaXITifPzNqRZKg9LDLtzFSzmfluVdPenkz1/bdEnSQDr?=
 =?iso-8859-1?Q?8vzl/tydiuSxhXYg9Po3lrg6cYObfKC4lYvAg0WE+6rLlr5QtB+Me600sN?=
 =?iso-8859-1?Q?M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?X7u9R554oRUNdVaAOwgeC0YAtFxSl3032buTs8f8/HpJVd3Clov0IwYIGU?=
 =?iso-8859-1?Q?1vIymRIRkzMbQ7RgWNiMi73/H1uwg357CjeesnXA+DwO74vEvbP8er9pew?=
 =?iso-8859-1?Q?rOQdlvvPdz0fFNMlQ+j32W9i4q5qSueyNYUAP8i66SdDigr2SkD+BT45N2?=
 =?iso-8859-1?Q?EobVjYdY5RxqzwTSRfqvWG2WLnYvZPOlOtAbvFJDMvwp5/DHXUSRQItL/2?=
 =?iso-8859-1?Q?KMgAUimeHZcZTATQGAlr64xeVGBlmeBiU23N35rZ/jylA8VsQv6j+tHuKa?=
 =?iso-8859-1?Q?w6yN/tWJFWtMYliDvVYodlHilU0gTvzXyfyZUolnNaRLVDUJsiqD7dVeLx?=
 =?iso-8859-1?Q?zZvzuHzykNbfYuCllNSDSB71HTPt/umyKr7+rVgDl7EelA98yOHbHYxCKq?=
 =?iso-8859-1?Q?/QH2jFGZ/CXIGqzpzYZil312+FPMV5G1JA0VrgAzCYlDII3HH3+GY9MHKV?=
 =?iso-8859-1?Q?aFkLJjysYZqyh7amN/T/NpE7m+V2vlzlk/50CrvkEXQl92P1GUEi0uIqjM?=
 =?iso-8859-1?Q?TjeyrJNXGSTj24rzT9T97dUl5Q1raEuR1Gu6JsjIULOGAd8J2uNk0hjqim?=
 =?iso-8859-1?Q?jDD9upSbZT6zbroXN1IHF/WlscPTxRNgdExiWv69w8KDNAChzhzibPGuae?=
 =?iso-8859-1?Q?eRkCma0lfAUIMfgkixStO9G9KL5C/Ti9Wo3KrC6qQ1Xm/8BySem8ifxeTX?=
 =?iso-8859-1?Q?opjOa0HrcE3dscJ9VvWRvwDUgubaLeV8LGlhukTQlzlwWhc4iNm84QaUZx?=
 =?iso-8859-1?Q?ob9Jn26FOTd+q343AwR6v8Cwej66/ZsOJ8WIuJ/9i/vvRtYbg6XLsrtvgH?=
 =?iso-8859-1?Q?C8fyGlcqWmlUc7NMZ+XaJ7i29IwGbUYRSW309JDAPaw8McWmW/gNOsmH7n?=
 =?iso-8859-1?Q?4jwn/9NndnX66QbKjgkOVUMAdeIUSHagkrPMwaDg7y/4rQAHdei/HR4yvr?=
 =?iso-8859-1?Q?VmQn2xqMilhEpGQyK3HkrL7RbV+dYGR4+WYhsc0oO3v+rb5OT3/GfxfFNF?=
 =?iso-8859-1?Q?M7x2zWQDLAKkyWS/QrEJVPc4M/39E0okAMOGJ7HZVTnl5gNk6KFEm9N///?=
 =?iso-8859-1?Q?q/TTW+bVHWsTnHBrVmZHEQfa+jRyioJeduhfLUa4FWavVJ8FTiMZ9l2l/H?=
 =?iso-8859-1?Q?NXCwn5AbCaRLk1KWLu1UYbfOEQQZ4uhuGCHUjtEBQK5qGPwGgwLTeeCKLJ?=
 =?iso-8859-1?Q?urz+2r7wPmGezr/skBcxFEXb77ZPO5tH0f47iLCrWBCxS6krgx3xCsWLqX?=
 =?iso-8859-1?Q?JGelE2jY9rHF4aU3P0WLbK/Sk1c6T913Y6V44bp5B4hQdw27JgoUNdrQNy?=
 =?iso-8859-1?Q?5ecW9WEaO0Hm6Ydhv24Va/zdRs8622fMtjnT770H4B2hWhvxpB0P4RiBkp?=
 =?iso-8859-1?Q?/ppoDIWQ05eBZz+i3qfNJPVEz7C6LdwjUsXluaBp2dnEO1aPwlPz2gWr3o?=
 =?iso-8859-1?Q?kSIlsMBnO5yINUwvd49s0OpZ8Gy5pGluJQbcpxdqx3DaMoS7DgghLsKXa3?=
 =?iso-8859-1?Q?SsrxwhEhoOYGQBM8RazTTNnpq4lV5RX/YB3/TDslnQCCby90mOa1CbhLIK?=
 =?iso-8859-1?Q?CBi2DlaGAa39ki7hihdTGfwL+hGSbI2H9cF9kmJHfk5w+Hea8j1WvS5uZG?=
 =?iso-8859-1?Q?E/1ILP7CsmbwFe9ojHNDqIbtC/gZO8ay/VuOVhEg3Q/YLwJc5iwBI0Ow?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 811f632e-d59d-4c87-731b-08dda2bbd442
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 16:29:36.3155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BUAgjx7nQNII8yKuOtvPBJTbkrW3xcKaHAlux/1K2LNOwrX4AtXPJ24aL9BV685kh5TvtzIfLCEhc6fk7SJhhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6944
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

On Tue, Jun 03, 2025 at 12:06:46PM +0200, Thomas Hellström wrote:
> On Mon, 2025-06-02 at 09:44 -0700, Matthew Brost wrote:
> > Document VMA tile_invalidated access rules, use READ_ONCE /
> > WRITE_ONCE
> > for opportunistic checks of tile_present and tile_invalidated, move
> > tile_invalidated state change from page fault handler to PT code
> > under
> > the correct locks, and add lockdep asserts to TLB invalidation paths.
> > 
> > v2:
> >  - Assert VM dma-resv lock rather than BO in zap PTEs
> > v3:
> >  - Back to BO's dma-resv lock, adjust documentation
> > v4:
> >  - Add WRITE_ONCE in xe_vm_invalidate_vma (Thomas)
> >  - Change lockdep assert for userptr in xe_vm_invalidate_vma (CI)
> >  - Take userptr notifier lock in read mode in xe_vm_userptr_pin
> > before
> >    calling xe_vm_invalidate_vma (CI)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_pagefault.c | 11 +++++++----
> >  drivers/gpu/drm/xe/xe_pt.c           | 16 +++++++++++++---
> >  drivers/gpu/drm/xe/xe_vm.c           | 19 +++++++++++++++----
> >  drivers/gpu/drm/xe/xe_vm_types.h     | 11 +++++++++--
> >  4 files changed, 44 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > index 7a8f87709e39..05fbc83c64b7 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > @@ -68,8 +68,12 @@ static bool access_is_atomic(enum access_type
> > access_type)
> >  
> >  static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
> >  {
> > -	return BIT(tile->id) & vma->tile_present &&
> > -		!(BIT(tile->id) & vma->tile_invalidated);
> > +	/*
> > +	 * Advisory only check whether the VMA currently has a valid
> > mapping,
> > +	 * READ_ONCE pairs with WRITE_ONCE in xe_pt.c
> > +	 */
> > +	return BIT(tile->id) & READ_ONCE(vma->tile_present) &&
> > +		!(BIT(tile->id) & READ_ONCE(vma->tile_invalidated));
> >  }
> >  
> >  
> > @@ -121,7 +125,7 @@ static int handle_vma_pagefault(struct xe_gt *gt,
> > struct xe_vma *vma,
> >  
> >  	trace_xe_vma_pagefault(vma);
> >  
> > -	/* Check if VMA is valid */
> > +	/* Check if VMA is valid, opportunistic check only */
> >  	if (vma_is_valid(tile, vma) && !atomic)
> >  		return 0;
> >  
> > @@ -158,7 +162,6 @@ static int handle_vma_pagefault(struct xe_gt *gt,
> > struct xe_vma *vma,
> >  
> >  	dma_fence_wait(fence, false);
> >  	dma_fence_put(fence);
> > -	vma->tile_invalidated &= ~BIT(tile->id);
> >  
> >  unlock_dma_resv:
> >  	drm_exec_fini(&exec);
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index c9c41fbe125c..f39d5cc9f411 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -907,6 +907,11 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct
> > xe_vma *vma)
> >  	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
> >  	u8 pt_mask = (vma->tile_present & ~vma->tile_invalidated);
> >  
> > +	if (xe_vma_bo(vma))
> > +		xe_bo_assert_held(xe_vma_bo(vma));
> > +	else if (xe_vma_is_userptr(vma))
> > +		lockdep_assert_held(&xe_vma_vm(vma)-
> > >userptr.notifier_lock);
> > +
> >  	if (!(pt_mask & BIT(tile->id)))
> >  		return false;
> >  
> > @@ -2191,10 +2196,15 @@ static void bind_op_commit(struct xe_vm *vm,
> > struct xe_tile *tile,
> >  					   DMA_RESV_USAGE_KERNEL :
> >  					   DMA_RESV_USAGE_BOOKKEEP);
> >  	}
> > -	vma->tile_present |= BIT(tile->id);
> > -	vma->tile_staged &= ~BIT(tile->id);
> > +	/* All WRITE_ONCE pair with READ_ONCE in xe_gt_pagefault.c
> > */
> > +	WRITE_ONCE(vma->tile_present, vma->tile_present | BIT(tile-
> > >id));
> >  	if (invalidate_on_bind)
> > -		vma->tile_invalidated |= BIT(tile->id);
> > +		WRITE_ONCE(vma->tile_invalidated,
> > +			   vma->tile_invalidated | BIT(tile->id));
> > +	else
> > +		WRITE_ONCE(vma->tile_invalidated,
> > +			   vma->tile_invalidated & ~BIT(tile->id));
> > +	vma->tile_staged &= ~BIT(tile->id);
> >  	if (xe_vma_is_userptr(vma)) {
> >  		lockdep_assert_held_read(&vm-
> > >userptr.notifier_lock);
> >  		to_userptr_vma(vma)->userptr.initial_bind = true;
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 7140d8856bad..18f967ce1f1a 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -732,7 +732,9 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
> >  					     
> > DMA_RESV_USAGE_BOOKKEEP,
> >  					      false,
> > MAX_SCHEDULE_TIMEOUT);
> >  
> > +			down_read(&vm->userptr.notifier_lock);
> >  			err = xe_vm_invalidate_vma(&uvma->vma);
> > +			up_read(&vm->userptr.notifier_lock);
> 
> Hm. Why are we calling xe_vm_invalidate_vma() here to begin with? Isn't
> the reason we end up here that the userptr was already invalidated?
> 

In preempt fence mode the userptr invalidation interrupts execution and
triggers rebind worker. The rebind worker sees the userptr is not valid
and invaliates the PTEs, resumes the VM.

Matt

> 
> >  			xe_vm_unlock(vm);
> >  			if (err)
> >  				break;
> > @@ -3853,6 +3855,7 @@ void xe_vm_unlock(struct xe_vm *vm)
> >  int xe_vm_invalidate_vma(struct xe_vma *vma)
> >  {
> >  	struct xe_device *xe = xe_vma_vm(vma)->xe;
> > +	struct xe_vm *vm = xe_vma_vm(vma);
> >  	struct xe_tile *tile;
> >  	struct xe_gt_tlb_invalidation_fence
> >  		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
> > @@ -3864,17 +3867,24 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> >  	xe_assert(xe, !xe_vma_is_cpu_addr_mirror(vma));
> >  	trace_xe_vma_invalidate(vma);
> >  
> > -	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> > +	vm_dbg(&vm->xe->drm,
> >  	       "INVALIDATE: addr=0x%016llx, range=0x%016llx",
> >  		xe_vma_start(vma), xe_vma_size(vma));
> >  
> > -	/* Check that we don't race with page-table updates */
> > +	/*
> > +	 * Check that we don't race with page-table updates,
> > tile_invalidated
> > +	 * update is safe
> > +	 */
> >  	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
> >  		if (xe_vma_is_userptr(vma)) {
> > +			lockdep_assert(lockdep_is_held_type(&vm-
> > >userptr.notifier_lock, 0) ||
> > +				       (lockdep_is_held_type(&vm-
> > >userptr.notifier_lock, 1) &&
> > +					lockdep_is_held(&xe_vm_resv(
> > vm)->lock.base)));
> > +
> >  			WARN_ON_ONCE(!mmu_interval_check_retry
> >  				     (&to_userptr_vma(vma)-
> > >userptr.notifier,
> >  				      to_userptr_vma(vma)-
> > >userptr.notifier_seq));
> > -
> > 			WARN_ON_ONCE(!dma_resv_test_signaled(xe_vm_resv(xe_vma_vm(vma)),
> > +			WARN_ON_ONCE(!dma_resv_test_signaled(xe_vm_r
> > esv(vm),
> >  							    
> > DMA_RESV_USAGE_BOOKKEEP));
> >  
> >  		} else {
> > @@ -3914,7 +3924,8 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> >  	for (id = 0; id < fence_id; ++id)
> >  		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
> >  
> > -	vma->tile_invalidated = vma->tile_mask;
> > +	/* WRITE_ONCE pair with READ_ONCE in xe_gt_pagefault.c */
> > +	WRITE_ONCE(vma->tile_invalidated, vma->tile_mask);
> >  
> >  	return ret;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 0e1318a15c9e..4275f71a74dd 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -100,14 +100,21 @@ struct xe_vma {
> >  		struct work_struct destroy_work;
> >  	};
> >  
> > -	/** @tile_invalidated: VMA has been invalidated */
> > +	/**
> > +	 * @tile_invalidated: Tile mask of binding are invalidated
> > for this VMA.
> > +	 * protected by BO's resv and for userptrs, vm-
> > >userptr.notifier_lock in
> > +	 * write mode for writing or vm->userptr.notifier_lock in
> > read mode and
> > +	 * the vm->resv. For stable reading, BO's resv or useptr
> s/userptr/useptr/
> 
> > +	 * vm->userptr.notifier_lock in read mode is required. Can
> > be
> > +	 * opportunisticly read with READ_ONCE outside of locks.
> 
> opportunistically
> 
> > +	 */
> >  	u8 tile_invalidated;
> >  
> >  	/** @tile_mask: Tile mask of where to create binding for
> > this VMA */
> >  	u8 tile_mask;
> >  
> >  	/**
> > -	 * @tile_present: GT mask of binding are present for this
> > VMA.
> > +	 * @tile_present: Tile mask of binding are present for this
> > VMA.
> >  	 * protected by vm->lock, vm->resv and for userptrs,
> >  	 * vm->userptr.notifier_lock for writing. Needs either for
> > reading,
> >  	 * but if reading is done under the vm->lock only, it needs
> > to be held
> 
> Otherwise RB holds.
> /Thomas
> 
