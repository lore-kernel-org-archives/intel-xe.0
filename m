Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9EB606A326
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 23:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KWb8f1kt
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 517A110E713;
	Mon,  2 Nov 2026 23:07:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4174910E6FA;
 Mon,  2 Nov 2026 23:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793660827; x=1825196827;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rNV0U5G7llQt0WyQwvu7Z7tDtPlVSeUyG4KnH/VjxYM=;
 b=KWb8f1ktaQeWqmVgy61SXw8wCQ5PFKpJ2LAgKwkYjEXdprJb6LXzEXnK
 fKYm0M2jenL+iE9qwjt9WuQi8JkIfwJvnYwDBshWsOK9TB9b5v8YjSPKN
 wHpok7TwmzV4lwHex+PkBWuvlqt7lSzSHE+F1NrdtlAEF5qo9fNqHXTHg
 6qKZJZJR0sYtLSjZY/3nl4LZn62YVcXUnKyqRV11ilHFOtRFgxsPCqnxB
 8QHa17vXPaGVxEB05lfkRwvQlih0s7mgBmGuQ38pueEXlnEYLocx0hFXl
 LChodfxcJ5EbR44YAPMJLPHFQk4Ka27H0wFFJXHZhcmsvkyv/FnRagW87 w==;
X-CSE-ConnectionGUID: bJzZYiX1Q52GNVMvgjoBjw==
X-CSE-MsgGUID: 6+GwKQFNRFKI+uMQ5m3/nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2388318"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2388318"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 15:07:07 -0800
X-CSE-ConnectionGUID: ZvxFNeZrQq6M40+Jal3ADA==
X-CSE-MsgGUID: ET64fETlQDuoPDtxcUMVnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6789317"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 15:07:07 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 15:07:06 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 15:07:06 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.0) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 15:07:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T5TM2NRY5fBT1tQCqx6mYiz2Dg/mm4oHNRCpeM6DzFuegufsh89u7KqipTHTn6BZEmNVN7BJJR1i8mdLpA3r3q6PwNmSPuKm9IjXBXhVe9t13eZP/zZzutEABf7z5qz6MOMhDbZR89Ddw+URurmgNfX8xRbjVTjlF1MXuGd/c0Ld+ZCxerH7994gXba+aN2PEi+L7R+D9bqxeojkXbG7itZQd99YQ9UWpHfBvvZtenhuJsq3uyJqqPgwZ9gMpT7yqnQzMII02ufHztGxU2bB6uvtCrk6j4acHxSduPGEppSalomSRH/zgivhkuEOQe/Z5DP7AisXaG7ZfsvXgOBakw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tyFJcwAW+flIoI92+TykQxSNdknhCGe6ENPoxzQGQjc=;
 b=M40hxPp/1TSN4YGCrEd/WtZq2xFdQQ6b8QOL/CjVGrJY3p9GgTnOe+LspJ7G0bDDAXuiJDtdwYT3X362xczf32CXmubwJWLHLtvt/c4kEt+T4ne2DbkMIvkAmg4fB8zfyKZff3cQh0w2GJ9mGjyAb5OTGiQLhgO0kw4v81zuf8nVS5uu7hgv3BEf4BGyuDcVFYudQ9M/sHAt87kj2AcR1Rc8g++e5pH1TD9y1DcvULEpcdMM7JDcW7m2Oz6HERxjsMrXUkDdB34J06CqFHDOxCcmFMlTmI2WqQ35o7m/qOYjX6fcgwNj/vKCCt9esXe/BPeGcXlzcl76WzNdychklA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by PH0PR11MB4965.namprd11.prod.outlook.com (2603:10b6:510:34::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 23:06:55 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 23:06:54 +0000
Date: Mon, 2 Nov 2026 18:06:51 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <jani.saarinen@intel.com>
Subject: Re: [drm-intel/topic/core-for-CI] Revert "io_uring/sqpoll: don't
 attach to a thread that is canceling"
Message-ID: <aukXi__TA82lFI9K@intel.com>
References: <20261102200603.2605130-2-umesh.nerlige.ramappa@intel.com>
 <aujvwWHLJnbJ7ddT@soc-5CG1426VCC.clients.intel.com>
 <20261102212644.GF6078@mdroper-desk1>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261102212644.GF6078@mdroper-desk1>
X-ClientProxiedBy: SJ0PR13CA0084.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::29) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|PH0PR11MB4965:EE_
X-MS-Office365-Filtering-Correlation-Id: 708d9008-e079-4bbc-cb36-08df3935fcc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|56012099006|261102123227099003|10067099003|261009223027099003|261022105027099003|261022113327099003|261021121427099003|261021123027099003|4143699003|11063799006|261028144727099003|261026140227099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: 3k2WZ0s7oQHfdkECJYZlfeEKJx4vI5e/0/txsOHhRHiCsc/rENioBJ4l8ASlKyuu/FkG5/TqAnJVxJRySlBsfGQATr7/6ByFVpGScR7hsMvW7LEyOmngid7VNG5YtoM2jZeq2z8JAjzJVFhrSYlYLlPMkiDaY+0UePjizTQD6vJbUfY14EZl0ReevMtIA7hYkWve9wvxGh59LvV7RAeBJxYaj7wTx4imAECLAU4L70skkXw5lJrQfgmDA3FcOnppzCK29bWuoh2Zjox62KZvE4sOhKtLNTXPNJRuoEYTSuQDINMdPoDRIFrvcy1M7A9A9f1O4AaDhVkZx7Fx6dBfeL3Cn5cgZwA6uaPCgZF49W4bwCLHhPEeLrUMVSd0+PJxggxS4zWfII13aAp42un9UJrFyTDdS8eFw+AwDWvXSGdVv9W90RfsAefYpPq9EZSxrCQfBIFgBbX26LgcgByOWHwHwpJ62MPxqztSIIR5F/nCJ47pZvbMns7DvtIYSNJXDRtDL+4ETGwX8UQ4lqHF6gurboJhPpSLHrqD5B8hIub0BlY3Q97S8UHkdmCcVlQisgikRXL2iVKTi4TtjQo8c34Dw3s+S4hle2QakkHcxdgPa1W7HOWijJUepECzvj63
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(261102123227099003)(10067099003)(261009223027099003)(261022105027099003)(261022113327099003)(261021121427099003)(261021123027099003)(4143699003)(11063799006)(261028144727099003)(261026140227099003)(261026121527099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PbA8CONJ0JN2tL9x75eQiZkIhjc5/SvOM/VqupT1FrvLedsHxBgT5sShRazK?=
 =?us-ascii?Q?bB28XQHrUZAs2fo5tASS/0MoatN1GNhnBR6SAPb2yJFELW8YTD2ZwZJxZwdi?=
 =?us-ascii?Q?AqnE0QTxHArPcu4cm35jklON57J96ys6S1rbeDhLh3td0wSo9E351+2EubQf?=
 =?us-ascii?Q?4xo+vz9neM5/QpOhHKBXIjb9hAmvFZlfyBm3OJxirRJquautikvhnFxfDSL3?=
 =?us-ascii?Q?PkRpjWNoz0+Ey7rkTFrJXtscRhmq2dWmDDEnE1r7EGOueq/fCEpodB81QKZE?=
 =?us-ascii?Q?OxVriS8twpczyyUsTJWgzV01e+wCV2P7z49rjLwVQuaToEIkUm0GjP6Rcpwc?=
 =?us-ascii?Q?ayuhTkTmN/B2RWd+94pQb+6buKW0jZHbOs2iBIbIx+FXnU8RpsQ7oofOHf1q?=
 =?us-ascii?Q?ATD1W4mWv5By8A38GXFI3lsyCPwgVo/b+/EqR0sI1c1jgsyIS4wRxDUqlenU?=
 =?us-ascii?Q?m62n1JTeKwiBlyRwclu78klCTS3fGsmvf1HPJjQIf66YzdeQ39ojdBkLAw8C?=
 =?us-ascii?Q?Xv9/UU0hQ5O/v6MgUxUKtmzmUmnNX7nEz1q6KJo+ERDMFe8sEEPeHewtf2pg?=
 =?us-ascii?Q?8KKYtyUwO3/MBvcNWBr6GfSNOtIOZh2HDMCu1z1LwgXtu9L5VSAfeARZKgmB?=
 =?us-ascii?Q?lv3DMJozJQY3yipWcbjJeSEBHry6JMff5ONF61rUcea/4xXavZ5kG3VkvK74?=
 =?us-ascii?Q?6Wnif8V47DgELK5Y79H1VhbUwKBwkIoYUTDaDhSmYrDPEI29HCEoyuYYnwAK?=
 =?us-ascii?Q?s7cLPyL4p8Ei219bhjuRNn2LNvaKERq4x8NynyzHmfqLeiFLnGdC3z0TdPz+?=
 =?us-ascii?Q?vx4R/sKa4KfMq7gt48vTMpiuK7gFknr+V3cx9BDRGNDFFu6hL0cUVwE/u2tZ?=
 =?us-ascii?Q?bVb9wU821+wJJzWvl2x06ejCDnJsVWKSjr9stwv1FyDTBv67TYd+B2oRP5v9?=
 =?us-ascii?Q?HU047R+OXwn/8sokfP8O6qBAbzVjbSrw0GRT6Uc3iLgYG+Xc4rFTSRWLIOuQ?=
 =?us-ascii?Q?xyaKOXFoM+FvXZlQm0WKrFxJcNAqsjdk47b5kNAwaiIAAfLbrjIrLwytC++J?=
 =?us-ascii?Q?reKGEeNxJnqS2G4u0fLVbuYgqgubFIsod/ZkZA2GQ+x5eqjSsGjww27jHaHq?=
 =?us-ascii?Q?wSpyBgXRtdbhL+pk/SfQFfBnFu4Sdof3ylyYhzoGpjjvkNaFWMQhrH8VipTp?=
 =?us-ascii?Q?n0JiRsPmP8i5Vaa0UXo2ZuxHO5Z/aS2DU2GqYdlNRvv4QT/oG5WzDhLbPJBt?=
 =?us-ascii?Q?DUGlGN6xS8J25b18x2igyT+Gei3JXyU02nJ6OVF5mpXoT6oHVOq+S+TPom+Y?=
 =?us-ascii?Q?rlmX4v2J693reI09W68pXDYJ7+PniPy5PHSjvDWM2isyZaAbXnf5fnYffkyp?=
 =?us-ascii?Q?5SFLzvMQUw5gbq3XjD9E9pdGdQeVB0pHsR45XczHdz9WlSlq/YGy5Oe+/Ncz?=
 =?us-ascii?Q?zISQA50KjlMB4jeL0gQV7jo3s8d71TMJZL877k8650E5V+YQ9TvZ1I/XgX54?=
 =?us-ascii?Q?ZE6rw5TZW2LhHf31huqaFXiiSMgSCmVTd40cFdRXXm+yJ+p8uKM9wGg63F/8?=
 =?us-ascii?Q?0B0ri/LPOTLa8qoTTinjo6I3xvWMsrCTcOdwCBkPXp1lYMK5CDCUS9wQBo55?=
 =?us-ascii?Q?trLyj9DtIBEIc1NqbKyx92Rdye9HrO4fkcOZiNUoywkH7/brQ5yGpZAHJign?=
 =?us-ascii?Q?azycsYXK+UcqgiXqw1oqg8VdNm8JST0gsSgtgOAqyMHKyDgjkUV1vnf7TXBn?=
 =?us-ascii?Q?5EAVec6ZJw=3D=3D?=
X-Exchange-RoutingPolicyChecked: mj76Bc1MR/ayFy+t1x67uwf/b70ce8H4UI0egI7Kp9YacI7AoSBeyxYrHQ6i1S6wCHZRxei1qCf7XQs8AwBL89T63kU420Uu+P3iQjFb6lCmR0G8fVsneqLwsmnGqBBIZVwxxMeVo9/FOIHJtyhhCsuK3eTKJAB4sl4XDJhoakBtSgz2Wwlc/ihP0bRL0bVVrHBCcLT9rH/JqEd/imghYAWe4iYBP7phA4o/k58A1Q23t09FduOb+sZ/A5TsoY/Aq9rbHFNApyjSM4YAZdn6MHMurXhZhVvQYLemJ8ZPD6FIMwZqDi2tuGaI+ewHpQRXYkEbmiNK4DjCB6H6WAkzzQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 708d9008-e079-4bbc-cb36-08df3935fcc9
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 23:06:54.8949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e2aNtcdlbtDb6W75wvMnQRl1zwX42ks0WX9mEuJ072dzobvSIpOY5/o/JXPRaiFnHauVdQeFyKDW1SL8d1Vx5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4965
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 01:26:44PM -0800, Matt Roper wrote:
> On Mon, Nov 02, 2026 at 12:17:05PM -0800, Umesh Nerlige Ramappa wrote:
> > On Mon, Nov 02, 2026 at 12:06:04PM -0800, Umesh Nerlige Ramappa wrote:
> > > This reverts commit 22d9db9fd64a493525d692b32c556875b7254665.
> > > 
> > > This is resulting in igt@runner@aborted on Xe and i915 runs, so
> > > reverting the patch. The actual fix is still in flight on the kernel ML:
> > > 
> > > [PATCH] io_uring/sqpoll: don't set IO_SQ_THREAD_SHOULD_STOP on thread exit
> > > 
> > > Until that lands, revert this one.
> > > 
> > > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > > References: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17747
> > 
> > Not sure I got the references right here. I ended up adding the i915 failure
> > instance of the gitlab issue.
> > 
> > Instead should I create a gitlab item to track actual fix and then drop this
> > commit?
> 
> Yeah, the issue you linked here is going to here will be "fixed" by the
> revert you're providing and closed.  We need a separate ticket to track
> the future work of removing this commit from the for-CI branch once a
> proper fix exists in the baseline kernel.
> 
> BTW, if the actual fix on lkml that you mention is looking like it's in
> good shape, applying a copy of that patch in topic/core-for-CI rather
> than reverting the bad patch is another alternative.

In this case, where we have a simple revert, I agree with Umesh that this
might be the less impactful option to our CI.

We can update later if we see the patch progressed.

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> 
> Matt
> 
> > 
> > Thanks,
> > Umesh
> > 
> > > ---
> > > io_uring/sqpoll.c | 11 +----------
> > > 1 file changed, 1 insertion(+), 10 deletions(-)
> > > 
> > > diff --git a/io_uring/sqpoll.c b/io_uring/sqpoll.c
> > > index c833e776320d..49c52284ecdd 100644
> > > --- a/io_uring/sqpoll.c
> > > +++ b/io_uring/sqpoll.c
> > > @@ -433,12 +433,6 @@ static int io_sq_thread(void *data)
> > > 	if (io_sq_tw_pending())
> > > 		io_sq_tw(UINT_MAX);
> > > 
> > > -	/*
> > > -	 * Cancelation drops sqd->lock while it waits, and a ring could attach
> > > -	 * to a thread that is on its way out. A fatal signal doesn't set the
> > > -	 * bit, so set it here for io_sq_offload_create() to see.
> > > -	 */
> > > -	set_bit(IO_SQ_THREAD_SHOULD_STOP, &sqd->state);
> > > 	io_uring_cancel_generic(true, sqd);
> > > 	rcu_assign_pointer(sqd->thread, NULL);
> > > 	put_task_struct(current);
> > > @@ -508,10 +502,7 @@ __cold int io_sq_offload_create(struct io_ring_ctx *ctx,
> > > 		list_add(&ctx->sqd_list, &sqd->ctx_list);
> > > 		io_sqd_update_thread_idle(sqd);
> > > 		/* don't attach to a dying SQPOLL thread, would be racy */
> > > -		ret = 0;
> > > -		if (attached && (!sqd->thread ||
> > > -		    test_bit(IO_SQ_THREAD_SHOULD_STOP, &sqd->state)))
> > > -			ret = -ENXIO;
> > > +		ret = (attached && !sqd->thread) ? -ENXIO : 0;
> > > 		io_sq_thread_unpark(sqd);
> > > 
> > > 		if (ret < 0)
> > > -- 
> > > 2.55.0
> > > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
