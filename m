Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7B8C02198
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 20:48:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915A610E99A;
	Wed, 12 Feb 2025 20:48:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BzSKAWP3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEDD410E0E4
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Feb 2025 20:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739393324; x=1770929324;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HkkKNYQh0AWeaJPd8AAScTYeJVZwbYhmimjYuvVAt08=;
 b=BzSKAWP3k/csWKt2GYa+8o05KN3vKfMS0ef8Mtqp4JCUNcHbKu3SLTJe
 G4p5HvjNX5bUPtX2y91n04tMBGPeLWeSWEG/EdQD4rprHePxxsN1gvJC/
 wMW4MMWdxUasnVmMa0P8IHxRBdnSRtKEnp5pEHxWXn/fO5KAoY+1AngtE
 hpCSQ0SP7KiJ/+LL5mUyPe63aPwt0V8xok33oqdacZj4hkNIIKnG8Eu8z
 IIVsFnmMs5knzzPE9/pJ9TPpTWwdgSOXuEKRSvd5xAPgsa9AT5Tecckz4
 6XrcWZTxqnczldeftqpIC4NWpMF76FXZ9r3dI/h2Ree+SzmiRJLZmQmKs Q==;
X-CSE-ConnectionGUID: ubOd2QqCQ7yVSYd0Usf+MA==
X-CSE-MsgGUID: a5qXjkDUR+itTeGkfrdvsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="51059032"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="51059032"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 12:48:44 -0800
X-CSE-ConnectionGUID: 74lB62MVRc6nfz3+rwBrwg==
X-CSE-MsgGUID: uDTfOkaMTZG0/UgseDKX0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="112706689"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2025 12:48:40 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Feb 2025 12:48:36 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Feb 2025 12:48:36 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 12:48:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yUrQVe9cgS/KYiWi9OEp0NawLvLDA6eFEItUWSzUF0uOd3J8OUb5RD2UTmeqj/19IPKD4IzUA8Lw7WhRH58l08/50a2c4WCpD83HfgrkFc7aKuWGYpe3C8OXZPzJu6mvH85ouhd7IQMHVfHvn3SlwuzSnGUzCmfMmyscogdwAX92dqEBJUh797ET3UD1r7P5DULUd4enoaE4k30tyl/PCZQFVhLY8d8sBUTUklZZaCj97WtCHtgxD3eoocoNjfmHFEVPV5yumlDhFo/9G1xhVTZ4FHgDTtr68pJe1lo/SxvVXss4tiW85CN5/lr745N0Hcn8lvSTyZiVbVIsy/YtZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CaKeu7S0kZB4/0XaUvbcHh3BK7wzUGv1mjxKdky5Fds=;
 b=DHNIuciu9TCiJanu81uwHUyTiJJDOZCOE0wdjjZb5D68iYBNm787lSHdNK9ghLP2G4BIPgGFEHLoH0aUfKrL6ix78Puwllmi66Pz/Vaf3/lM1yzHPSKbCzEWY32o/KDNOlGkLv+b8n5vrc7tkJdQGOWZiCi5F5yX4crHb2V6zeRtv+Ylfw078VIrBKiQ6yWjGY4rYlM3eOlrnYLEW5RQcziPVf2sBHeDZ4XVWGWy/dn7s8Efe0CV4dZvbnCaRYZBP5u95kYP5NDnCZbDt2dGsrR4fDaV4iQ06MHRi3U6nuD6kZo06RFWRl6icFYunvzlkw2bewQbgIMri7ZrVHWXjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB7835.namprd11.prod.outlook.com (2603:10b6:8:db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Wed, 12 Feb
 2025 20:48:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8445.008; Wed, 12 Feb 2025
 20:48:31 +0000
Date: Wed, 12 Feb 2025 14:48:28 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, <intel-xe@lists.freedesktop.org>,
 <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>,
 <niranjana.vishwanathapura@intel.com>, <ayaz.siddiqui@intel.com>,
 <tomasz.mistat@intel.com>
Subject: Re: [PATCH] drm/xe: Add per-engine pagefault and reset counts
Message-ID: <ipfag5tp7crirxabplso6jal2bmf6nh4jkspqiysxhtl2sf77j@idmsxgup6rra>
References: <20250210193657.96030-1-jonathan.cavitt@intel.com>
 <Z6u2uH9hkHyJ5kP4@intel.com>
 <ywxrqrblg4fmyhpxluq46fdgyd6c3pol5ic5u5emehybvypmho@fs5jajwfogtp>
 <Z6w38scZQPsLIfCs@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Z6w38scZQPsLIfCs@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB7835:EE_
X-MS-Office365-Filtering-Correlation-Id: de5f5923-56ab-4bdd-b5d4-08dd4ba69c29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v6um1EVvg4ny8qnnmJ6lWpPsUMn30j968IZGnIx+qYIpc35zO+qc9uNLRCGs?=
 =?us-ascii?Q?8rsDUfOZwCGbo9y1anjdax2wGCNiDE7fxKKwmRNwjdxLSKbJjrrjW/ce1NxV?=
 =?us-ascii?Q?HW8SJ5sQXxr4pvxYsVBYsPVLRSGL13YVkUDziaWcdjrUDzRRAaDwpRVAPSzP?=
 =?us-ascii?Q?QFDwbc3HMJ8nGW+Qd8P2aSn7dLW3usEDDk5ThzfqIN7b6ZpcGGh36DD48Qvg?=
 =?us-ascii?Q?HBsFsulXsJSjagj/NblnQb/HI+qo6AKTNjabXQ0WU6J52kKs0ndX5wkeOXl0?=
 =?us-ascii?Q?TUWwpJ25yK7dFhM82rWhM+fk6MUMwRFnJbZI3zl1xOAHQUIiUSIhtHz5JWFK?=
 =?us-ascii?Q?gPWVhE4b3hxc4/LBl8GjfGb+W4siKOL01Uth3bpnsokempaEQTuB0niJNF/C?=
 =?us-ascii?Q?yq959cCEN5IFtPLtw4IFfXgBBaL2Jq0Lx2GYA48LNvZqbUeGVaA8V4xkxkLZ?=
 =?us-ascii?Q?0AfzZzfHLC95fuRCoUCKZdGnR9EA1twWwMoGv/meoizPc/iW1f9aF1Hmag54?=
 =?us-ascii?Q?sMLNhS//GmPVfQDEJar17ytk8IT0uVcpUfbp0oPknY4/X/B1vSNEHWA4ue02?=
 =?us-ascii?Q?7bqH10Rs5WxvR67bVq8QFstat0YgZ2t0+8rX/pJd+BSbHf3uA1f7a5LKGFQn?=
 =?us-ascii?Q?mSpvlVAM4x+stIZCvG6YGo3JpIOLCj8l0wsvF+dGv+TpnoA0aVpR9lnlGEyy?=
 =?us-ascii?Q?EvlOyIjAfdSfUVo2nqdyLA0fTtfNxq/QLcJSDui2fybq0/k1dbhprTnnPZzP?=
 =?us-ascii?Q?3xn1+OWXXWxaYtzralEMzYaMeM36t+KlVw/mhrjaXSRt3F1k83E0MEzhFA+E?=
 =?us-ascii?Q?OvPl3aeJ0y9C14pCYI7hXj4bXnualGLLKu5Ii2DEFCS7E1hju3PLZVkLm2vV?=
 =?us-ascii?Q?VFoOh3/PU6ELFZr/sY87rg3fLJjIyvB7YA/0k1GBRaglf2f2kj+rGtz/dfdK?=
 =?us-ascii?Q?N0GTa7/eCZw9RNbJqXgACYQJQaJQGwkIluG+YzycMZGc07m6jVpH/r6LLmUi?=
 =?us-ascii?Q?bFB5FXuCuDvad9Azvv6mUG6UIBPn/WG1w9b9N8R2Jdn3RQuDecBXYcm+/GiT?=
 =?us-ascii?Q?dzRaTFx19ifhBkLXpShO7b1bMwMmETk1LDA7ArzWKWF07w1ZViGUjxG+qq+O?=
 =?us-ascii?Q?s2WCKsXwK5+gGGErcCFVQztLZVtd+FUQmMiWa2av6EB0i299TxwHDK/GO71Z?=
 =?us-ascii?Q?UTGBI9n+fut368+U0ZvyYQLT5TprpSAeLxW/daZwZClQtSJk4EvKiPEAUDQ8?=
 =?us-ascii?Q?S03KtqP9B8+IhLjI9w4dyA4BLIJQMl4u16xyxHV+7WnlYfgkqXTA+7S/w/GH?=
 =?us-ascii?Q?3H/E6sS20dh3gbPEfp0mhWdDVtfGFRcju8pNDWDojW7MVw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I5ahHbTXNWcCFX8H+6ypKdyYXBdcQEIfPxrfNgBdYPooIL2NKMXtZ/7h6vOR?=
 =?us-ascii?Q?5UUaB5NVdSlUTtZ9lnYcTZjauLkDEWN8Nzi0kDKMj0/OSXVKOSDf3M/c5SrM?=
 =?us-ascii?Q?aqRJPbn7DCD5LLQ641UwdrWGAsdxOSegiTSFz43aDQ6roLWbYYp+EtmRzf/O?=
 =?us-ascii?Q?9ZaZ8/lnti2aZjfnOjK13RaD+nETLQUuBWvj6RuAIDEBVaQc7Vtv2Z8NMlrk?=
 =?us-ascii?Q?NMZwEHwJxLpMu2Yey3kTLmRIGR2WNnzo8+aqfweVfSKO7w15aHNETFvdInHx?=
 =?us-ascii?Q?ftbJN3IskAnN3WXg7n/xp03HcehmswrFW5BKPYm56Ur1+I0GqWhgvDYCc88v?=
 =?us-ascii?Q?aXbky7Ttl8UsH+FOZnqmf/zmm1ncqnLju9sDvZsUYlPitAyC2Jl8ZlM5BHla?=
 =?us-ascii?Q?abvyBe3m2DLsG14GJLYuYf90mrhzpzOitFKIVIETtw9H4yEdUhix16T3LRTU?=
 =?us-ascii?Q?aPR5Wq7vcq6TTsTKIv2gUVIxFSMT2jkpDGctw3uhDt6aAu130VeS1tkxGFnj?=
 =?us-ascii?Q?vs9/AcixabKafBich6NpglsPvu5+fI3VUPVqPdVa+hujXpq7qo5AYxydemfp?=
 =?us-ascii?Q?FF8GStOJBWzSYHHScKfSTGNSmdII0CdRAlREFd3DxXe4FYMvpqV7+fRv7FJC?=
 =?us-ascii?Q?zjMB16Sr5HKIx2t7u6x4E+x/+cLFq1GS35IQJOVb1DAELbk5HjVE8MeFXVv/?=
 =?us-ascii?Q?YSJ6qD0RaYP5k1ZXdSRcYDjEek8ZfVhDurN2/8EaxTtZPX2KcAdrWpS0RXNG?=
 =?us-ascii?Q?VNMAxCrq8OJ/9yPCJY/T/+Ckk3O3jFIfuCRdsS8/0QDBPhTS5PoVzEZcqDqE?=
 =?us-ascii?Q?Yr+6QQOnfuvm4t3iYd3kGDVX32abcjpcaI5FaY3fWA2JUBCkYPeMQLn75TzV?=
 =?us-ascii?Q?uZ3kAUE41NhxYMtb2uThLoVCMjtaZ05AuSXmAaKLGykbymfdeEmcw7lhD1pg?=
 =?us-ascii?Q?OQhA4y8PiEoT2rk+0+26/j4copHJlpIvc1matIf9LH8aAuKPdLDDFVQV7a+H?=
 =?us-ascii?Q?86g6hvS5cMXMbbpe+n/ul+2rIEpNbLiQ7fZENid4hRd1Mu1CEzybqQb1KBEg?=
 =?us-ascii?Q?qrctJ1/+Zo7rmy1I/W98qTwmgiIx+PNJeOnw/5KjFijRqWdg1lMkjkz5lTmN?=
 =?us-ascii?Q?rovFSVUc/TT3CRqgVqs1qCs62xMURsuPsPDcbgBS2o5Qm9UeIgNZe/jflUHe?=
 =?us-ascii?Q?p2cnG4vthqX86brvmDqAgUcE7fk7/jIL9HOiOyZVJMcR5iqO65K4GJXTDVX1?=
 =?us-ascii?Q?SEEYjg8H8MHQyVrPJPs1+/HzlU1b6ekzh32cFzn4pDNwnoxNL2pAexvITHT2?=
 =?us-ascii?Q?GPPB9iLyZEmTx5AbV+vBBOjqd3voAPBVUzhbr7VDEV2zPaAxBYau8HfSZxA8?=
 =?us-ascii?Q?5+BHBzq4chJwNo8fxAbSnuJQHcXMUHCPpxMLIawZGYUU15OEwIZynF9R2dIu?=
 =?us-ascii?Q?y1wuMRumFctuPVO0oRBGjyfToXTPEReOGA0n3lrSuDTTrnqUrGCDwkzbR4aM?=
 =?us-ascii?Q?HHadMOHgQ6SV1v6y70DcyP6+aoKcsPQbWTjfido3r8pw88X0V73hxsKjN8lu?=
 =?us-ascii?Q?RQHc2unCamEYxijvF5zVcmaUym+75AawCjDbdtc7z+ZgC3mX69v+BEP7Cmqg?=
 =?us-ascii?Q?Ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de5f5923-56ab-4bdd-b5d4-08dd4ba69c29
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 20:48:31.6089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZqEREC3Df958g9/d6NYJEirq1C0N9kwLvgseO25fqiWbst3hPMK5Zy8UEUsCpHvoBhE9h0TLHB/ZjQZNbVp18jHruNYhOb+kkWmeki1J2Uk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7835
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

On Tue, Feb 11, 2025 at 09:56:02PM -0800, Matthew Brost wrote:
>On Tue, Feb 11, 2025 at 11:37:12PM -0600, Lucas De Marchi wrote:
>> On Tue, Feb 11, 2025 at 03:44:40PM -0500, Rodrigo Vivi wrote:
>> > On Mon, Feb 10, 2025 at 07:36:57PM +0000, Jonathan Cavitt wrote:
>> > > Add counters to all engines that count the number of pagefaults and
>> > > engine resets that have been triggered on them.  Report these values
>> > > during an engine reset.
>> >
>> > My fear is that later someone start using this as some form of metric.
>> >
>> > Could we keep this behind a debug config?
>> >
>> > >
>> > > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> > > CC: Tomasz Mistat <tomasz.mistat@intel.com>
>> > > CC: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
>> > > CC: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> > > ---
>> > >  drivers/gpu/drm/xe/xe_gt_pagefault.c    | 6 ++++++
>> > >  drivers/gpu/drm/xe/xe_guc_submit.c      | 9 +++++++--
>> > >  drivers/gpu/drm/xe/xe_hw_engine.c       | 3 +++
>> > >  drivers/gpu/drm/xe/xe_hw_engine_types.h | 4 ++++
>> > >  4 files changed, 20 insertions(+), 2 deletions(-)
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> > > index 46701ca11ce0..04e973b20019 100644
>> > > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> > > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> > > @@ -130,6 +130,7 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct pagefault *pf,
>> > >  {
>> > >  	struct xe_vm *vm = xe_vma_vm(vma);
>> > >  	struct xe_tile *tile = gt_to_tile(gt);
>> > > +	struct xe_hw_engine *hwe = NULL;
>> > >  	struct drm_exec exec;
>> > >  	struct dma_fence *fence;
>> > >  	ktime_t end = 0;
>> > > @@ -140,6 +141,11 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct pagefault *pf,
>> > >  	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_BYTES, xe_vma_size(vma));
>> > >
>> > >  	trace_xe_vma_pagefault(vma);
>> > > +
>> > > +	hwe = xe_gt_hw_engine(gt, pf->engine_class, pf->engine_instance, false);
>> > > +	if (hwe)
>> > > +		atomic_inc(&hwe->pagefault_count);
>> > > +
>> > >  	atomic = access_is_atomic(pf->access_type);
>> > >
>> > >  	/* Check if VMA is valid */
>> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> > > index 913c74d6e2ae..6f5d74340319 100644
>> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> > > @@ -1972,6 +1972,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>> > >  {
>> > >  	struct xe_gt *gt = guc_to_gt(guc);
>> > >  	struct xe_exec_queue *q;
>> > > +	struct xe_hw_engine *hwe;
>> > >  	u32 guc_id;
>> > >
>> > >  	if (unlikely(len < 1))
>> > > @@ -1983,8 +1984,12 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>> > >  	if (unlikely(!q))
>> > >  		return -EPROTO;
>> > >
>> > > -	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
>> > > -		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
>> > > +	hwe = q->hwe;
>> > > +	atomic_inc(&hwe->reset_count);
>> > > +
>> > > +	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d, pagefault_count=%u, reset_count=%u",
>>
>> I don't think the message was accurate here about being an engine reset
>> and this is probably making it worse. +Matthew Brost
>>
>
>A bit confused by why we need this information in dmesg, but also not
>opposed to more information.

what I meant by message not being accurate is that this is a handler
for:

	process_g2h_msg()
		XE_GUC_ACTION_CONTEXT_RESET_NOTIFICATION -> xe_guc_exec_queue_reset_handler

Do we get that notification on each exec queue? wouldn't that show
multiple "engine reset" for a single reset?

Lucas De Marchi

>
>> In any case, instead of polluting this, what about printing the counter
>> under the "stats" file in debugfs?
>
>Agree. I already suggested this [1] but accidentally replied to the
>wrong list / post.
>
>The current stats interface for a GT but IMO is light weight enough we
>can more or less copy / paste for other scopes (e.g. device, tile,
>engines) hooking into debugfs. The idea for this 'stats' interface was
>for IGTs or quick profiling of workloads in a generic way. This seems to
>fit with this use case.
>
>[1] https://patchwork.freedesktop.org/patch/636270/?series=144622&rev=1#comment_1162350
>
>Matt
>
>>
>> Lucas De Marchi
>>
>>
>> > > +		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id,
>> > > +		   atomic_read(&hwe->pagefault_count), atomic_read(&hwe->reset_count));
>> > >
>> > >  	trace_xe_exec_queue_reset(q);
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>> > > index fc447751fe78..0be6c38fe2a4 100644
>> > > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> > > @@ -516,6 +516,9 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>> > >  	hwe->fence_irq = &gt->fence_irq[info->class];
>> > >  	hwe->engine_id = id;
>> > >
>> > > +	atomic_set(&hwe->pagefault_count, 0);
>> > > +	atomic_set(&hwe->reset_count, 0);
>> > > +
>> > >  	hwe->eclass = &gt->eclass[hwe->class];
>> > >  	if (!hwe->eclass->sched_props.job_timeout_ms) {
>> > >  		hwe->eclass->sched_props.job_timeout_ms = 5 * 1000;
>> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>> > > index e4191a7a2c31..635dc3da6523 100644
>> > > --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
>> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>> > > @@ -150,6 +150,10 @@ struct xe_hw_engine {
>> > >  	struct xe_oa_unit *oa_unit;
>> > >  	/** @hw_engine_group: the group of hw engines this one belongs to */
>> > >  	struct xe_hw_engine_group *hw_engine_group;
>> > > +	/** @pagefault_count: number of pagefaults associated with this engine */
>> > > +	atomic_t pagefault_count;
>> > > +	/** @reset_count: number of engine resets associated with this engine */
>> > > +	atomic_t reset_count;
>> > >  };
>> > >
>> > >  enum xe_hw_engine_snapshot_source_id {
>> > > --
>> > > 2.43.0
>> > >
