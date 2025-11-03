Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E49CCFA03
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 17:18:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4261A10E206;
	Mon,  3 Nov 2025 17:18:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B7ZVnnYg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD46510E1FD
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 17:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762190300; x=1793726300;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XhP9L2GWd48i6TRsz7d46la+4tSFGMS0g2yfv3cIdDU=;
 b=B7ZVnnYgQ6YKz7sDouGQY7FRwUmd7JBLqUPTK5ojdNT4hw7H7gWKrdPM
 AIt5O6p6Efis89UM/fOtZZwwmkz+NFzZomx09QrLnv2MfmTEkB4E2KZ1Q
 v+XQHoli40qFkoKd++6a5Z/djrJrVw5/Go5mpkMZzDbqVn/xEYAiMouQE
 oe5Wnkw0gqGYdzS5Z2v0iKc8lNgXaBX3JOatwM0Ode+1o/Ks1gx0CIxSD
 UuFvWuKvUJYCSSV4J4pVhrWszioPP11TIdu8ggCQtNd1eURueDW8G+8Ed
 gkcY4sDG2Z3ba9dJb7e7He5fNFmZOGRLjMENjLxq5BJRzbWdBQ+khj0RA w==;
X-CSE-ConnectionGUID: Zdxo19x1T46XhLQEbdaSnw==
X-CSE-MsgGUID: VPTimjoXQsStrNCrenIWRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64189921"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="64189921"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 09:18:20 -0800
X-CSE-ConnectionGUID: NEf61UaRT5yrkd2/jal9zQ==
X-CSE-MsgGUID: ejjmoOD+REueIO3i81Wh7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="186605896"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 09:18:19 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 09:18:19 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 09:18:19 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 09:18:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zA2uamwy56vXgWmd1tMmSMpBgHICQhTuNT2eYN0KowKipKjkmp5rZ73R7ssvd4MlJeATWIpc2mZuhIE+F6SO3ohsY7ORgOTEahQyU/aOXkOEicrYRGxe0QHRMRy267ay8/gdEvQciqooyAMHC91dwgmNUwIAyt3SAu8Mh7r31dkfHMMYEBHmMu+Os0hhGlPa8zvyFmJU5GnbU6fqPm/LqjRvDkdwIitjqM6Cz/2i0SCXHMI1C68zZTkgD9NXC2EoQYowNkq6PxOFBEC+YK4aMDgbnLp04KWNcvCeqsAwPYINgxP21383sJkmwWzBd8LsWw2Mfo0BDEE/+dEHe6yFww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SZSY+cyuD0i9I6YktMLER6SjiQMZyhBH6aqYjhfl8T4=;
 b=jVUa3XcoVh4ssBOwhFvtXZQbkvrGcMSSNrV++PnK7aKCow3zN2X5DQq47YxBE7ntIEda8qoPxp6EQgRiYP1S/fQ5yubo4fQBQTbnWRSJIsUS/BagDTCa3Hoi1gfI7EUNRS9WhR2JD7mlQXz94FG8UIJbK6btQyI5+Nn+UUeQG5oLWx8vMe2gtWRMhFCNSdyL4cHhJ+ovKpXJS5fQLfueSm9P5JPYQY8GNFvk/SACoUGChTHdP4PtUY9KO91buMb8MrXgwV8P2rrXGKcxgn432HLfja88pM5L9UPhIGLAyEeOTv7DGAfA9fQiDBbDnyXO02DgeJOzN5AUUI6wJuHdRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7465.namprd11.prod.outlook.com (2603:10b6:806:34e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 17:18:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 17:18:14 +0000
Date: Mon, 3 Nov 2025 09:18:12 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 11/16] drm/xe/multi_queue: Handle CGP context error
Message-ID: <aQjj1HQMSkMF87sO@lstrano-desk.jf.intel.com>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
 <20251031182936.1882062-12-niranjana.vishwanathapura@intel.com>
 <aQejDCgeUTRRIsTD@lstrano-desk.jf.intel.com>
 <aQjb4PmAC9VBZ3FP@nvishwa1-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aQjb4PmAC9VBZ3FP@nvishwa1-desk>
X-ClientProxiedBy: SJ0PR13CA0064.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7465:EE_
X-MS-Office365-Filtering-Correlation-Id: 2914d38c-8451-435c-0e2a-08de1afcf8e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HdPTrL2MAHhH9mSaLHBGgSOv8BUTPLoslf3d5BS4TAljWySXCxa8f6K1sjtB?=
 =?us-ascii?Q?TOi0gOsj2jGl79efb7MTQ6LRynNhJF+1g4dux8NFfemN0PAIMZM30HYg2xRv?=
 =?us-ascii?Q?B4GI+ivwSHV5QOeAr7f9kYahZ884cmGswcmPNMZQ1EsVx0nA0XqjOrZubYMR?=
 =?us-ascii?Q?9Gqg1zs5sIdY0gOVdoGJuwHeCVjbdFBQdo3mVuQbhhzkiKq/BhZXDdbbkOP/?=
 =?us-ascii?Q?oZQfMmddnM7SqYwNO4pvWy3UjxjXxsWAB9FBihYN08XSiKIZLSmDnoyKBoRz?=
 =?us-ascii?Q?KFMqN9+wMoGN3wz7a+mq2J8QFw5XiE4Fke+vrbBwyajt9m62vbfihT6PwYbA?=
 =?us-ascii?Q?rhO6O3+dVnjmiky5py3fIcQcVM7SHKi8Ugg8vOqY5zm4IdOnNqeMkCwSPmgT?=
 =?us-ascii?Q?i1it8lwaWVjuduBV1z6YOXeauIwrIjo4CS655bGbQS4Pdgj5G3U/oI79C7uI?=
 =?us-ascii?Q?XFvWAHOgVx3w9KFxSmB7aSO/Ib0IeTV02uAxfu0M/ofi7uEyntXuW0npD8pP?=
 =?us-ascii?Q?wqmuBrLncWPFweoKSoPLOJOlgf3IUd2qGubgNw0pyuFrdbkhY3EJ7e6gDKWG?=
 =?us-ascii?Q?+8AXJsj17d1cV4VrpacLugOZvw1XQFA/mFvZpR5Z1dyv6wuLXaQDNM8/Vf53?=
 =?us-ascii?Q?x4y2XDKJN08qVN9vQlwZ5+0/FXbYfYCp4zoHlg2A2lC3ns+8ApLYy674I75i?=
 =?us-ascii?Q?T6SQ7OTovb0YfoM6tJun/MQxyAU9Y+Jv7AS62wbcbCrM5FRrbH4NT0lvn69d?=
 =?us-ascii?Q?7M1qCx0MDLXexIIDIhk1u4b01OYiLgsH6qjmTnR9N4IRhIQpf8ICRad9IbVW?=
 =?us-ascii?Q?TNwZnFJI1bFqek6/1fUAp5Bh5KSxX94A6h5ZsAS/H5OxFDTH2xBhcj9uiFQF?=
 =?us-ascii?Q?HeoaJA7O3kxE3GhE1RPtGzPT/LvlmJofT2Fv+kwk7qCT3iNYN6hw6opsY/Qq?=
 =?us-ascii?Q?4AeAohfP2GFq4BRgJKl+omuW6UFWFvj6JW6HJJEewnszdI15cqa7paSKtKVP?=
 =?us-ascii?Q?hoo8mmjD75u7HpV+0YYkkvkFTtuXWGwGDj9nhll6xMDvFKN127UM4s0gOjAU?=
 =?us-ascii?Q?F8s0AAT70fX78S04lzahdBr0gumLTF87pY0TE77T4N3gAIi/VPRJL3hqoCrV?=
 =?us-ascii?Q?Hety7OhkEKpE9q1fy6aIXOHvIw7dv5e9b6JpsAmUeNm62eO1l3AHdq6x1Ebi?=
 =?us-ascii?Q?s2l0VhoKACBJ6TDgkWljwx8Y42v0VpqUQN9/HjP4A2S/PLCZlG+nlAtgoWc8?=
 =?us-ascii?Q?HeciPxhKhbNMpM4bzs1VtQ/PfuFjCRlB+tX5HtH8ZzGrwHX8hNCNiGb0LJsY?=
 =?us-ascii?Q?EsECtCYeS1LdjPpDbrKld4jj3Ytlze9kw4Ogby3SSvlNqqXXpD5kNohMZHVP?=
 =?us-ascii?Q?YkcPLNMonzh41SCHgYx1cc4UBGyqMb4K3vh7ERpB1c3xLj3Y760b6Xw2J/DG?=
 =?us-ascii?Q?rGS7EPIgfRvzs0gnLTTiDZJihbSI3ecz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ug3ZQ9SunjQvgZpGgJFTaV7vwoIBUToE91fWrDAXz30eIRThvon7oR9sB0cg?=
 =?us-ascii?Q?FMmfHTxcEdqQ5aeefDsMjb18CkoMa3tgPrFozlZC5sSyAPxVgCCSe27vtpy/?=
 =?us-ascii?Q?SsNHhoyYfuUF4UifEj/VtZ2bD5K8vpf6WWecdgZSaSyo7mXMSdwrgmgApad0?=
 =?us-ascii?Q?Pz28ovxRfEPZUyG2+GGMSeIIDfoM7pxNaR5B8joI1KUgEDEsFIOkqKd4+AFc?=
 =?us-ascii?Q?rXKkNsP3gGRTypW0or2OM9Clm8onDKmjRWjoOwD6sNTWeWsJSE+L9c5S8msk?=
 =?us-ascii?Q?ueIu/W2PkmgeG1aR1Hhl9Ex88DJy2AzVWaAXSkz5f1H1oXJAB6j4GYvYZ6ip?=
 =?us-ascii?Q?SIpOCxGcNha6BmuYQ9rKA9fLvM3tw6QY2dVamkZ0xd1JWg5c+6qknUQhU2Ti?=
 =?us-ascii?Q?buYQeGY9gv4x/jjekGq+PmxCdQypht27ThqgReVFMx9KSHPlEbwJenEOe7WR?=
 =?us-ascii?Q?0BX4EolnY7fIGOeuCUZMh8pBdPJ00mWYmi+PrRAHkXw4kdc8s1SSGK6xGuTa?=
 =?us-ascii?Q?G+9PfkRaVVfDxCmz/V2tQ95j1GZLb5mmAEckE530ncDk8BWXn4w+eTHPuFJ0?=
 =?us-ascii?Q?qw4X7EHMR/eusgh8hC7l0PEfY28+WK0Dk1pvEBoLDRC9FJTARyF8dtZwtGNI?=
 =?us-ascii?Q?RVLTFd8hrBJ1fS4VD+SPeqFu50GrHKGvHdu2wlkOWxXo0Q/rSUq+uUTdffnn?=
 =?us-ascii?Q?NB2miCMjyfqUMxujYWmuNN3kKBw3trj8fFEVettLodMCpcIXZs9wbJfrTSYD?=
 =?us-ascii?Q?IScpetXBKg7B+pvUhRSqXlaT4rMbBP1E6J2+Mtv9vPLZduebvt1QET+9mfPM?=
 =?us-ascii?Q?1b7bGxT5fp4cE7KZqvADJOIKoxVtD78muBcQ2wH7Hz2l+YYWDQcdDv4adl9Q?=
 =?us-ascii?Q?zAkZBMdi0W+fB8BCbQg1wmI4wAzw/1hlzdZ/ylhvrRgW/Ue/lZ0gZipDpbsi?=
 =?us-ascii?Q?wrvQolwKLlew0wHq9mas2rBY8ScDgFH7X5emvvhu+IiOxhkeezWEd5tgLn/a?=
 =?us-ascii?Q?Nx2RXtO8CJ/VcQFojvM5g84okkGxhUWYKLBhJDGsp/6Rr14fn27JYCb9905W?=
 =?us-ascii?Q?DCvKQfdYZUys477gzO9bmNNTcweTxwRCVAp9fC9hQhsF4xz9MuMiHKVvBglQ?=
 =?us-ascii?Q?Cxr5j+p/Jv0uU6uvAcR2qidyzS9Lt5LxD/WyX7vq8YRaTd9kqCvL9f7RK9Rq?=
 =?us-ascii?Q?EMHxonxZhSiX8STYYaVmPcL9fXuDOgvxIKh1IXcg7KcVV5BTvDDFy449nGQp?=
 =?us-ascii?Q?93ApZctIg9z5xHHvg6Rks2LZX7kfbPb5F8skELjcSAj+llLXz8LZEutCAbeP?=
 =?us-ascii?Q?WX9mucslqiT6FVJLt6dCQLNUrL6ctNssQPgLXFIWZTnSeofXGEGdQm/wgJ0P?=
 =?us-ascii?Q?Wub0upGbR1nS5VjXDhXmWlQEUni7SjRP78B0COlpqWyTP9GAiI7OUHIeTmW8?=
 =?us-ascii?Q?e+LQ3vNKnUNe3p8cqkLBi0yNpRRq4CpJig08mEp/qBlH4dskEca327oiBZcj?=
 =?us-ascii?Q?/7Ca7vYpP/lqbhH+as1NTHz16cgo88oCXoncQIBmAfn+6KG6LOAjpWaqVx8Y?=
 =?us-ascii?Q?mR5tjNWfy57s3zcJQgiUDAVQYseSVKBpXPtmquhCm3PtCwUoNHUSjjYYlIhR?=
 =?us-ascii?Q?+w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2914d38c-8451-435c-0e2a-08de1afcf8e9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 17:18:14.5385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0RMAFWKH1k9slrORDgBEdu46TaA7KZNTrS1v/qMqXJc4Rz211F5cP8Gg160ogVBUbfrzwg/KC+ChTNmueE3XEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7465
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

On Mon, Nov 03, 2025 at 08:44:16AM -0800, Niranjana Vishwanathapura wrote:
> On Sun, Nov 02, 2025 at 10:29:32AM -0800, Matthew Brost wrote:
> > On Fri, Oct 31, 2025 at 11:29:31AM -0700, Niranjana Vishwanathapura wrote:
> > > Trigger multi-queue context cleanup upon CGP context error
> > > notification from GuC.
> > > 
> > > Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/abi/guc_actions_abi.h |  1 +
> > >  drivers/gpu/drm/xe/xe_guc_ct.c           |  4 +++
> > >  drivers/gpu/drm/xe/xe_guc_submit.c       | 33 ++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_guc_submit.h       |  2 ++
> > >  drivers/gpu/drm/xe/xe_trace.h            |  5 ++++
> > >  5 files changed, 45 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > > index 3e9fbed9cda6..8af3691626bf 100644
> > > --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > > +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > > @@ -142,6 +142,7 @@ enum xe_guc_action {
> > >  	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_QUEUE = 0x4602,
> > >  	XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC = 0x4603,
> > >  	XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE = 0x4604,
> > > +	XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CGP_CONTEXT_ERROR = 0x4605,
> > >  	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
> > >  	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
> > >  	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > index 48b5006eb080..d0e19af0b4d2 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > @@ -1574,6 +1574,10 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
> > >  	case XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE:
> > >  		ret = xe_guc_exec_queue_cgp_sync_done_handler(guc, payload, adj_len);
> > >  		break;
> > > +	case XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CGP_CONTEXT_ERROR:
> > > +		ret = xe_guc_exec_queue_cgp_context_error_handler(guc, payload,
> > > +								  adj_len);
> > > +		break;
> > >  	default:
> > >  		xe_gt_err(gt, "unexpected G2H action 0x%04x\n", action);
> > >  	}
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index 87c13feb2cef..605352145d76 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -48,6 +48,8 @@
> > >  #include "xe_vm.h"
> > >  #include "xe_bo.h"
> > > 
> > > +#define XE_GUC_EXEC_QUEUE_CGP_CONTEXT_ERROR_LEN		6
> > > +
> > >  static struct xe_guc *
> > >  exec_queue_to_guc(struct xe_exec_queue *q)
> > >  {
> > > @@ -3001,6 +3003,37 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
> > >  	return 0;
> > >  }
> > > 
> > > +int xe_guc_exec_queue_cgp_context_error_handler(struct xe_guc *guc, u32 *msg,
> > > +						u32 len)
> > > +{
> > > +	struct xe_gt *gt = guc_to_gt(guc);
> > > +	struct xe_device *xe = guc_to_xe(guc);
> > > +	struct xe_exec_queue *q;
> > > +	u32 guc_id = msg[2];
> > > +
> > > +	if (unlikely(len != XE_GUC_EXEC_QUEUE_CGP_CONTEXT_ERROR_LEN)) {
> > > +		drm_err(&xe->drm, "Invalid length %u", len);
> > > +		return -EPROTO;
> > > +	}
> > > +
> > > +	q = g2h_exec_queue_lookup(guc, guc_id);
> > > +	if (unlikely(!q))
> > > +		return -EPROTO;
> > > +
> > > +	xe_gt_dbg(gt,
> > > +		  "CGP context error: region=%s err=0x%x, context=0x%x LRCA=0x%x:0x%x SgId=0x%x",
> > > +		  msg[0] & 1 ? "uc" : "kmd", msg[1], msg[2], msg[4], msg[3], msg[5]);
> > > +
> > > +	trace_xe_exec_queue_cgp_context_error(q);
> > > +
> > > +	/* Treat the same as engine reset */
> > > +	set_exec_queue_reset(q);
> > > +	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
> > 
> > I don't think you need the exec_queue_check_timeout check.
> > 
> 
> The check here is same as in other guc error handlers like
> xe_guc_exec_queue_reset_handler() and xe_guc_exec_queue_memory_cat_error_handler().

Ah, it is but it doesn't seem right in those cases either. Maybe I'm
forgeting something, will try page this information back in.

> Hence the reason to keep it here also. Doesn't exec_queue_check_timeout()
> mean TDR is already underway?

Yes, it does.

So with the current state of the code, this is correct, so:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

If I reason this can be dropped, let's drop it everywhere in a single
shot.

Matt

> 
> Niranjana
> 
> > Otherwise LGTM.
> > 
> > Matt
> > 
> > > +		xe_guc_exec_queue_trigger_cleanup(q);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  /**
> > >   * xe_guc_exec_queue_cgp_sync_done_handler - CGP synchronization done handler
> > >   * @guc: guc
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> > > index abfa94bce391..01b013a90b1b 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> > > @@ -35,6 +35,8 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
> > >  int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
> > >  int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len);
> > >  int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
> > > +int xe_guc_exec_queue_cgp_context_error_handler(struct xe_guc *guc, u32 *msg,
> > > +						u32 len);
> > > 
> > >  struct xe_guc_submit_exec_queue_snapshot *
> > >  xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
> > > diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> > > index 79a97b086cb2..c9d0748dae9d 100644
> > > --- a/drivers/gpu/drm/xe/xe_trace.h
> > > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > > @@ -172,6 +172,11 @@ DEFINE_EVENT(xe_exec_queue, xe_exec_queue_memory_cat_error,
> > >  	     TP_ARGS(q)
> > >  );
> > > 
> > > +DEFINE_EVENT(xe_exec_queue, xe_exec_queue_cgp_context_error,
> > > +	     TP_PROTO(struct xe_exec_queue *q),
> > > +	     TP_ARGS(q)
> > > +);
> > > +
> > >  DEFINE_EVENT(xe_exec_queue, xe_exec_queue_stop,
> > >  	     TP_PROTO(struct xe_exec_queue *q),
> > >  	     TP_ARGS(q)
> > > --
> > > 2.43.0
> > > 
