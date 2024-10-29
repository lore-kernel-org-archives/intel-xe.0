Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DA1D3A66B
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 14:58:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B03F10E67C;
	Tue, 29 Oct 2024 14:58:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jAfQDdyg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47FD410E67C
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 14:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730213906; x=1761749906;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6A80av4AhLZizO3A/cJrj/3sY/AcVBPOST0EpXpWd/o=;
 b=jAfQDdygk0iTp84n9Sfjv2asp4h4se+eQw21u7dD1TzK0yfDbt7dskWn
 9u/kLJYbGi3XiS3ijWemnlUBh/0QswDXXCCa5BkJO44NpN7NWQiD3MxAa
 fszQIp4+6IkTM0OsqAnOidnjpja/eHGR8EO9JqtEY44d1ewP4JkDPel3V
 JNzGiVT0TFQcqHOvnVecmnOvJI6r1+99oRy1eXtp19d4D+zxouMPxM31B
 hBvPjfpOTyAitSmUY7WgDwwOhsTENi12Dn78dIurc+qV5kh2QTrwX+kUW
 85ldAQ5y9q8o8lRryEP/L9QhaUYKupByI3yuvrhapeatyXbJoW8oSg681 w==;
X-CSE-ConnectionGUID: GfPtB7p5Qoqsb27xRUD4dg==
X-CSE-MsgGUID: ISq4AwFvQQitjDFeC2gD6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30052295"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30052295"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 07:58:25 -0700
X-CSE-ConnectionGUID: U8Wutqb6QVSGiwmZ869Guw==
X-CSE-MsgGUID: 55vqYwJ8RwiPWdQbe2cBHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="82419155"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Oct 2024 07:58:25 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 29 Oct 2024 07:58:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 29 Oct 2024 07:58:24 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 29 Oct 2024 07:58:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SrFa9LJHGvqj1z0na2eQVjre5ImpipretFCthb9N3VGEX8MBXSzJK3BI5ZT4f7/3/Uo1ak0qmSVK64uiC5+aKwyGqWjiegG5jZs1DE3jYQZ4MdsKxEK9sr+wyAWGsDIMVHzIzA/4mcqvK8iamD2Qhw39jpEYV/iAj53fBdh2xhzTSS873tIQ8x3NZwEe24td5JP587N2qAdw+r6ecgudqkm8GK9tHI9T9cfCuOGwXqoYGtrV3BzNENXZukoGX8NNtu555B3wVJkltSjiUGysHuizvtH1dqjatIFjs+ImcaVkaRT12ex1l09fdx4zowGl/I8awOOt3RexJZ8T4ob8qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bX5zOaLwMwIIsBc7jSYialewl7DsxRIJFzWE/gZedU4=;
 b=tvpAh4X0YfgCRN2Aw2RwV7NET6CHRQFtd1pturoQGsBCNwXN5SMTTvdDxtOuj7SlsxgjAgXPjO3YHMNpny7i7bL7cGC9Yor/juFGpL5aypGsZJlQ8bJ6LKBO6gdegHEh5+nKzkGS+bQD+mJiZhT/UeIVO2/4gLqNxr0fUnvGlvdYlYsc1ZKRYmReLFu7r5s6Wtp7ZKomdSUMSxgZIk3KJWPJRyvqJa/7MW64BvKGtH0khjN1M9hz5Uw3j+4Qw54ZpXwZIteXiGhHSEsb5/chcFbBl68t2oUkx9zOZ/sUEjuMqbNBdKLZcsK1v5qOWgtzsTZs+snuBhikK/PpHjX4hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6537.namprd11.prod.outlook.com (2603:10b6:208:3a3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Tue, 29 Oct
 2024 14:58:21 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8093.025; Tue, 29 Oct 2024
 14:58:21 +0000
Date: Tue, 29 Oct 2024 14:57:39 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <riana.tauro@intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Restore system memory GGTT mappings
Message-ID: <ZyD346NUGiL76Hbq@DUT025-TGLU.fm.intel.com>
References: <20241029003224.2257439-1-matthew.brost@intel.com>
 <20241029003224.2257439-3-matthew.brost@intel.com>
 <326aaf08-60ef-4eb8-8565-093488b4c9d3@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <326aaf08-60ef-4eb8-8565-093488b4c9d3@intel.com>
X-ClientProxiedBy: BYAPR07CA0096.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::37) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6537:EE_
X-MS-Office365-Filtering-Correlation-Id: 93a82e78-4409-49cb-8917-08dcf82a214e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aceMwAFPpDBSO6ICGtje0KVxrbvR6sDR710qu+m78oUS7wcG1vT5uAl7GXVL?=
 =?us-ascii?Q?lPkzhcjy0+5ECAyDGAG4E6lCAodXxLReKpx9HdLsALqpq8xht8ukyF48olrb?=
 =?us-ascii?Q?XyINDZeR3pG2vn5/F1WnQgq+L9L2l6lC7S6ag2LQYp9T2gxq9qIc90ZBzJtp?=
 =?us-ascii?Q?vAWHz3Tl3sxXBNEglM+o+RNTb8IrHX2YgUt8XbeZOg79TfClMjBMA/MnyXeq?=
 =?us-ascii?Q?KmtuCbB6u5MFXKAIBTOVEeoqicwOMWLGoM7qA83g+X48KaG0SVenw+q6VreX?=
 =?us-ascii?Q?yVlwdwcVHtz+EcUPJe2xzBHib0GahdCd0//rIf9/6pNkhLPpGwP+3AKXASk2?=
 =?us-ascii?Q?9V9wonZWilbmVJWWaVrv+BerrC2PRv9zqEQVRPGAMJ1FLbcbWylRk9um4ebT?=
 =?us-ascii?Q?xk7aPEzI+NTV7YFB6EXA6v2bxbYaTbjSpVUrbpKCOtNC1Be+GEErHUUoB2kr?=
 =?us-ascii?Q?shLvmfd5q8y0wRf3zFkvXRABRKGmjx97hvo74HKKNsfeST3ZoIqzvM4s6IZG?=
 =?us-ascii?Q?zryhTR8nNiYiOuC8E2yyY1Ognl3LIrnLnS3M7tB78/hoq7k3MxT/K+JoxEDL?=
 =?us-ascii?Q?j4/ldXukBVG7mYs9RysCixqnfQJM3G4m646Kt9xH4mTV6VYmz/7nfWhG6O/a?=
 =?us-ascii?Q?7IE9ytBnFi3hmGNr/OpCsdgAEdHbtD9hoz1olcGwRPxOwKhEapM9uNJN17NH?=
 =?us-ascii?Q?pDEaiTbLcbRAr2C1PcDPK5keE59t2dCJlXWekQ1/laXcyyJxDuP3j/7rDsLP?=
 =?us-ascii?Q?2gPFEl0FjwiZVv3np9LTQOUrfOo38I08SfPkig5DtaQBir7Bf2kDTWp6x3Ys?=
 =?us-ascii?Q?vMaAdMgnx5VrSeyjOXAs+V4fJKfzTxWkLza2byTOeSRwrC8E4Y6g+VaKKgS4?=
 =?us-ascii?Q?8eZMmOFDc48lMstC0BG9YUxW+bZlx7ZyFqdGQ23LQtoUq3q0vYFNV0x0rwR6?=
 =?us-ascii?Q?A4eZG80JIIUHYF1kbSzf4AVNk23Pbje3r0ikunYLZ1E5ZZBeNxWAI9humzuo?=
 =?us-ascii?Q?aZ8Vb6NgD610X+TwE/CPt+wvf+myveRwO9tJQO5UiQApfBTyfujEcrt/wdGM?=
 =?us-ascii?Q?uw1yfuvqaC9xDUnZAtIKKbPWrQ6fKRKLs5LIWRr60XyvFiu0PRzMMl9bvplp?=
 =?us-ascii?Q?QRTAHDid7+tS5gbcDepwjbMTY21YQxYi1+e6k9n/+mFR3xmKTdht7Rs9uXI+?=
 =?us-ascii?Q?tF0EKVtR56VDvGIxnllu7AwPFgCicy2qIaMlgiPuvTDmzoBT2vUZytaeSOSu?=
 =?us-ascii?Q?8yBNElTNydFxCbzU8yeDVhmqIxAN6eRiv9O2bWm2PFJ1qeLPLJVw5urSGXVj?=
 =?us-ascii?Q?gg2y1a2jMqgW4x3Bq1aJqbk4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8qL4HQr4coeuevho3dp582NCuTzNXYMb37mIYwla7EuUKYr9hh1tjNkVXSDq?=
 =?us-ascii?Q?IF6FksQP5TL7yOA8LE9bXo1Ru/TNiBQ3+P/Bl2sIBribTtJsr6XhqDmZlhB9?=
 =?us-ascii?Q?xdw6ZRratsG2hhktiGo2e1vUBTKfvPJO9nCPnOmLYIJpTgdMI0pXHAA3mt4Z?=
 =?us-ascii?Q?tb5mFipDb/UuUrWqGJrx9QdRRhTWxLiJHsIcb6BM5lCKSwbHnJ6xKZo6KUTK?=
 =?us-ascii?Q?GuTDOD7utBkBOrRH8HaGzYVzCkxCHsapUmRq1KFVHiYHh3u5HTmENHAIgHQH?=
 =?us-ascii?Q?gbTJzxarRpL3JhkT572PM7xf4IbCjqI9MdkFMGq142saOWmsixYVEJoULDIr?=
 =?us-ascii?Q?cGtsIly2xvQ43QJ8vUACAUOtADlMU+XtXKEuMPWTfsum6j88LutzKZmEXRxl?=
 =?us-ascii?Q?8GR9sFVHx2cEnt11v0ZsSg7gAlPQbxQdzHzZFYkaLIDfHOkynY10Khnwp9Nl?=
 =?us-ascii?Q?FPCpcsppuD9s2qxesx67XgKtZ/VQ1Ldz0UG1ZAKIDljyX9I7BcCRefBld3GM?=
 =?us-ascii?Q?oRWmMvvLFA2pjIvZYC08t4u8FYDOTScGqc2ya45qweLrRxBDe8ZdO0Ypx7Wb?=
 =?us-ascii?Q?ytfhCZfIAHtQb5J5zfDnlUX+l31SoVazi7hioUs46X72U4tTRlUSVZb8+L8H?=
 =?us-ascii?Q?FQeQ0cJecRmKlWw7gV9M4S2pxzlsP1QXjdltyFkLLS7vqJ2ITNfU5O9oEpMJ?=
 =?us-ascii?Q?1QaCd1r3vxAXxNyFRhaQJhszg2CMg3JP8V0kplkVNrwGn46ttSm8PGyQAKnF?=
 =?us-ascii?Q?5FzciG9H+4ZmKA2EtsAKgSC1GTWopYqWRUavEm4ko5y7VLiCwbgoFTZ2EdY1?=
 =?us-ascii?Q?IC/cmJp0/DLum0/9c56eBmb/Wy9RMCCe24f2iwlf4bzRALkMffzL45teWc0j?=
 =?us-ascii?Q?TY5VjNAbN2op1ajCEZxg5YBMiI9vn7vqL+3YaXoXCx3uIN9xbsntVfbxA2b3?=
 =?us-ascii?Q?V4LRfAhtj/HH4O3xMkCVV8f/J+7k4jcF14kn/MxfMEUlB66R72GPCD34GDge?=
 =?us-ascii?Q?P4CJHEpjjZlQzh/u8s5ZaDOKiV5MQsWJwV1SxhZm5zjqsgm7fccHFq5ttF90?=
 =?us-ascii?Q?JzPzF4d9hg0y962IFifjFmPt7y1AzupZD0hZU7oLUNyrEYchsXwwxL4dwVEA?=
 =?us-ascii?Q?vcIBLA1b8HqS6W3TV4KQIVfTzm1/SyKIEboW6gKjU2Frm+69KvqTCetukv91?=
 =?us-ascii?Q?olz50kDUp9a40/cD4wqzNCpw2vA0E/+BVR3B3GiDCWByhpu8WJFU4JlISxA8?=
 =?us-ascii?Q?cgcCis9UX4GMkvZ0xkhN7KfSszqI49UWGWJwIVd4BXKa/vp7eErhOPbCnOrf?=
 =?us-ascii?Q?MLfXMRN9jVgrg4V6tUD9X+DeCYRZVQ7I8LxcCcBKf6poeU1L/Fk+6S8sqqX8?=
 =?us-ascii?Q?iO1IJsiMBgVvKdlrIevdqLHSMTu9g+DmD30h420Aae9h7uG1ATREru1TUBZ1?=
 =?us-ascii?Q?LKpZPL8Z9RYVHtTfFAoxVf1DGkKnjxH84U8ieCa7h1YtsYQFqzoOuKr7/uYU?=
 =?us-ascii?Q?5/o/JoeJYftnJtaoiJWcSsOrdjTHmMxKWE8l1KC7w70uvaNn7GDjr4l9rtkl?=
 =?us-ascii?Q?C9bLjAfbcHZjkG4HZMhorIcEYtNxKha/u0jH9qXlGtAW5ZO6mHOlNWJrrBOv?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93a82e78-4409-49cb-8917-08dcf82a214e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 14:58:21.2382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1VzEF89cqOml+nJxrxUpGNz75OkpisxkgQHf8NVSpcyi1x5oRVLGdNPfSiVAfIJ610G+dU5DMc5RgiLpzsNzQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6537
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

On Tue, Oct 29, 2024 at 09:44:32AM +0000, Matthew Auld wrote:
> On 29/10/2024 00:32, Matthew Brost wrote:
> > GGTT mappings reside on the device and this state is lost during suspend
> > / d3cold thus this state must be restored resume regardless if the BO is
> > in system memory or VRAM.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> I think this needs fixes?
> 

I don't think we have a user of SYSTEM pinned BOs upstream on DGFX
platforms yet. But let me double check... If we do, then yea fixes tags
would be good.

> > ---
> >   drivers/gpu/drm/xe/xe_bo.c       | 14 +++++++++++---
> >   drivers/gpu/drm/xe/xe_bo_evict.c |  1 -
> >   2 files changed, 11 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index bd747e53eb9b..6c8fd5ced2a2 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -890,8 +890,8 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
> >   	if (WARN_ON(!xe_bo_is_pinned(bo)))
> >   		return -EINVAL;
> > -	if (WARN_ON(!xe_bo_is_vram(bo)))
> > -		return -EINVAL;
> > +	if (!xe_bo_is_vram(bo))
> > +		return 0;
> 
> In the suspend flow in xe_bo_evict_all() there is:
> 
> 	if (!IS_DGFX(xe))
> 		return 0;
> 
> But seems like we now need this flow for igpu, so need to also drop that
> check?
> 

I don't think so. AFIAK GGTT mappings are not blown away on iGPU
platforms so this isn't needed.

Matt

> >   	if (bo->flags & XE_BO_FLAG_PINNED_WONTNEED) {
> >   		ttm_bo_move_null(&bo->ttm, NULL);
> > @@ -946,6 +946,7 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
> >   		.interruptible = false,
> >   	};
> >   	struct ttm_resource *new_mem;
> > +	struct ttm_place *place = &(bo->placements[0]);
> >   	int ret;
> >   	xe_bo_assert_held(bo);
> > @@ -961,6 +962,9 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
> >   			return -EINVAL;
> >   	}
> > +	if (!mem_type_is_vram(place->mem_type))
> > +		return 0;
> > +
> >   	ret = ttm_bo_mem_space(&bo->ttm, &bo->placement, &new_mem, &ctx);
> >   	if (ret)
> >   		return ret;
> > @@ -1814,7 +1818,10 @@ int xe_bo_pin(struct xe_bo *bo)
> >   			place->fpfn = (xe_bo_addr(bo, 0, PAGE_SIZE) -
> >   				       vram_region_gpu_offset(bo->ttm.resource)) >> PAGE_SHIFT;
> >   			place->lpfn = place->fpfn + (bo->size >> PAGE_SHIFT);
> > +		}
> > +		if (mem_type_is_vram(place->mem_type) ||
> > +		    bo->flags & XE_BO_FLAG_GGTT) {
> >   			spin_lock(&xe->pinned.lock);
> >   			list_add_tail(&bo->pinned_link, &xe->pinned.kernel_bo_present);
> >   			spin_unlock(&xe->pinned.lock);
> > @@ -1875,7 +1882,8 @@ void xe_bo_unpin(struct xe_bo *bo)
> >   	    bo->flags & XE_BO_FLAG_INTERNAL_TEST)) {
> >   		struct ttm_place *place = &(bo->placements[0]);
> > -		if (mem_type_is_vram(place->mem_type)) {
> > +		if (mem_type_is_vram(place->mem_type) ||
> > +		    bo->flags & XE_BO_FLAG_GGTT) {
> >   			spin_lock(&xe->pinned.lock);
> >   			xe_assert(xe, !list_empty(&bo->pinned_link));
> >   			list_del_init(&bo->pinned_link);
> > diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
> > index 541b49007d73..32043e1e5a86 100644
> > --- a/drivers/gpu/drm/xe/xe_bo_evict.c
> > +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
> > @@ -159,7 +159,6 @@ int xe_bo_restore_kernel(struct xe_device *xe)
> >   		 * should setup the iosys map.
> >   		 */
> >   		xe_assert(xe, !iosys_map_is_null(&bo->vmap));
> > -		xe_assert(xe, xe_bo_is_vram(bo));
> >   		xe_bo_put(bo);
