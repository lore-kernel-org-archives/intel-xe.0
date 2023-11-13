Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE70C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 13:54:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 182DB10E379;
	Mon, 13 Nov 2023 13:54:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C068510E379
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 13:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699883651; x=1731419651;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7xsb+s+wRs9B3eLzRnNarWDg2ae5FEBNH7Xr2ZshPZ8=;
 b=M+CJWLDlMxkJ+eFhb9+okGZGLnIToivfQkNql44eCLVpQX1XuxAviVsT
 OkQfep0pzlvE59tK+a47LM27XWjGJowwMtcR1sn75RYGW+36Qv1vCd5NR
 fgAAVHVv0EgPoASQPZcZozTJg0aKHbqY3hFgcObtT9lA457vtvsMz8rgg
 nBTNBabS2wtL6kxtAwrys4C0OmbXeZyfyOfv81rGx2LyI/C5oMS+CyRkd
 D1EW8IaSZGkDbCPWToaUxd7i88PRD2ZHYYPXOV6Cz2FYRrJYOFD2yWzr1
 9AMpI868et4Y7X+s0xgMqAHYvLtvQaFkNAqguKr1zJKKpadG1zfz/pQvJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="369773809"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="369773809"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 05:54:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="5654296"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2023 05:54:09 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 05:54:10 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 05:54:10 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 05:54:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VMQpGNXdeo+JLxH66x/Sg3mOW5dPb5DnTFTI0gr/9i43lW85j7bvH6FoM1oQdwfbwRUGleO5nhNsQI0jibMLy9hwQPKPP3kWt7RJiJTzvqEfWe2pFvH3bs1QdH6LckU8ioDGKM8VXUT5VwNqQZzvNMFzVZComYHJIQn1prHbPWt9Fj+l4UgQpK+x3FUWfptOiOb4KvJXonalkVWm2YuNVE4jPTdhjpngXp3PiNLjK6dc+E0QCGi9i+JUCrAWwcPOacx9uubjl7TsfO5IVSxvbFgWa5Fq7zfUGxHN/Q5rqyfcCs8EtoyVXtdXwmz0cJNnAU5FyTyGakpuAhNoPnGpIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JSlYpXkSUZRFA7DgCTKjk7zGgRLvUSkltQmSmCw8uIY=;
 b=LyIMff0S5ZcDekF1yYExR6b+ZF/9EknAcL4sGMXR3Foc/BChE+TIxI+QNk09YIZLsOKbqvoFLcxjIN+dKhhIQR2Mz1YdPf60/xKb74eoZ8a80zV9DK2LPPw/GoQR8BcMBYV9S0GDeSTrh8/sq0e6+6PGtdPNikTrfFrnKbuSTS6WY1fPiCNcxBl9d0dm51G4M6OjqqO9+cCXmSx6binIYlVoN28b37ygbzbVh2Of3uwPnfAWlFo9WXSte8MB6R5A2xO1vAjA6mJ68uv/6G0yD+nvFvN/qGgdKXflRqf3LBtxHa6is3siK5sbIcMNU6Rl4jwINu3FOgsMsD5xoWBjOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4885.namprd11.prod.outlook.com (2603:10b6:510:35::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 13:53:58 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.6977.028; Mon, 13 Nov 2023
 13:53:58 +0000
Date: Mon, 13 Nov 2023 08:53:55 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZVIqc4GvduTprsh+@intel.com>
References: <20231022155727.717251-1-kelbaz@habana.ai>
 <8734y0b8xg.fsf@intel.com>
 <oqzjxeuxexv64tadqbghdjz36l3ke2spmqnhp23bc3h5c54dn2@i5jrnpcksp5g>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <oqzjxeuxexv64tadqbghdjz36l3ke2spmqnhp23bc3h5c54dn2@i5jrnpcksp5g>
X-ClientProxiedBy: BY5PR17CA0011.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4885:EE_
X-MS-Office365-Filtering-Correlation-Id: bd11ae5f-151e-42b8-c05e-08dbe44ffbee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t105RGrZQgj9lh2wSoq5K/IbOUgBf5BGMJvQzM6Wxcub/5fnhajYJ4f+fc9UAlIR+FaGtHNM0YWStptHqePB2qRDFqhPqFq7z/9f3Orgx2zdIPubXSvwPRtiW66/47retQ3C0LrNeJLIs4jp2eBNuNL7cxg1iQOQ+AOfgjufzO7HUw31a2BG+/Lcp7/Qpl388a7VUAKoX19g6hHO/n8lcisINpy44GfAOgYuH4PbKC5jkgBptigTj9bDtLGAvuAYbgWgMCePERO+xyx+vzmh05KxmBEjD+AMvs/rEupnRF/x4xsEjfScbPPHLsTANzJVaeOjOzyybM5fWTGQ5CugfXg657oR4WNb5xe30IQBA77STFfBErHvdeUvs9mWR7TFZeHZwNyLOmVZs6zh2a87Df8rnwlTiiiL3+0+q2Gel5g3ALfNa5BK4LTA7toK+NVFiQ35yoLAsI+/MIMcSOEtHz8Lj/9tUZiUPuUggtMgBr7ognlR8RTwcKHBo3MlJtEZgd4dU5YnrbQmxpG1pDX+2fsf7hukXhotkMiTWAjzx/Jpdjjl2oI/pDiLzw+yZ1HwL5doGu1HXEo2X5YorNwR4MzYpKyiBw0zzJV8SMW805sBCd7ldScfTyup8Iu2wq8I
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(39860400002)(346002)(366004)(136003)(230922051799003)(230173577357003)(230273577357003)(186009)(64100799003)(1800799009)(451199024)(2616005)(86362001)(2906002)(5660300002)(41300700001)(36756003)(82960400001)(44832011)(4326008)(6862004)(8676002)(8936002)(26005)(966005)(6486002)(6512007)(316002)(6636002)(83380400001)(6506007)(6666004)(66946007)(66556008)(478600001)(37006003)(66476007)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QVLwuFy0YALPRsuE9XHh+2qnUD9xs2fuIWAhnYlcNoKxNTlk5kEdKW2NCuOF?=
 =?us-ascii?Q?gK/zUJpOToAIvxQo2Fv4yLcvXOyia+8hXMR7ihS+f2Tss0Ko52v7zgLIJ9IQ?=
 =?us-ascii?Q?C/cC40F5ww6Sz1tKn0bcFT3SBe8q4WcHDXeVOfz+xjtYBxIOfoV+DkaX3jCQ?=
 =?us-ascii?Q?m9TSyAVDX0OxSrwEBJMjWx3zhNCKDuGhPHMqa8CnBFO81vH72zL4iYZe3pJ+?=
 =?us-ascii?Q?lLWBODxfLzkPyYZhQd9OX6tQX84CP6cTrRc5xshaB5VaBAWz85TqXO5WX5Ma?=
 =?us-ascii?Q?6OdBbdEfZ+GIlJ6mHfLwfwxj0mdQMh1cvTzGmPCqsIhk0xJZWhgnA/yGXOtA?=
 =?us-ascii?Q?qBs90KyB/ZVzLJMObkkDQXGLiKVMpPD+X6B6OiukAK73tqry8wLFAxDND5Dq?=
 =?us-ascii?Q?BMt/IrcEaMgu6M7i4LUfFZD378k7Oznnz1WrXkjd7E9x3MK7aWVD+Zj7Hb9U?=
 =?us-ascii?Q?RKCiIYEJ6WI2yxuRWRwomyijaNqI8CScRLCCyW5SSEOmxHNcDfJ4luW5hkem?=
 =?us-ascii?Q?tnK+8Iv+eQRsjLDjJjgPIAEG0bhVPEJcyhQh2gBwphhxfIrndbtNdESK1lWh?=
 =?us-ascii?Q?S2TiJReYwJUiUFWfsYcrfP09RbwOqvLALzoK3cEpauaWXYKqqZbKnAVOlYfE?=
 =?us-ascii?Q?FRm0etYxSNAC75cnnlWX4qn8A350q9vu5mpdoXWqPfPA7+bCJPtrjKsmO0jv?=
 =?us-ascii?Q?NCVIHYR5ETYWSQCYIauRtYOhjq207xRPem8aadrjdp8Axje2uH531Eu2D1AZ?=
 =?us-ascii?Q?5tiuTIQmUnoBK84XO+wCw8LigVZp3SfxnzSwDeDO0sCO1GMO41szaH9Kr3ND?=
 =?us-ascii?Q?ctGnLdg27MbgN+Gn90Rykb02HuJVykXyvssODI074NpoIebF25ef4w1PneYo?=
 =?us-ascii?Q?irAmuaxP/boIKFKHTaHkpvY0KrK4lvLZZOPGFdx/X6XMTyGQbm0bZ05gzdGe?=
 =?us-ascii?Q?pMjs8ShgsnIdN7vozNLXPonSZZ3d8vLZkJU0CsbWPisMOdeyg5bsOf9Vr4qp?=
 =?us-ascii?Q?ctLdscisgfD81x60vfoGqUL4Yrz4Bn6XzUaKJeCF7ZebOzo1jeucaTGmpuO0?=
 =?us-ascii?Q?dkKnJ3Tuv9d8cvW6/Sw/qEHSNJt6lDHaGXKki1A2wti61VJcXV34KjxnjUi+?=
 =?us-ascii?Q?pDzOPY7NSxDXlXr0Un8fwRjrq2P++Iy+mBrXt7L7o3Wuo53VUe+z4cIrSFtN?=
 =?us-ascii?Q?E9BqTsB3IMj9TTy9a8voNApOW/uDewlClKdQQPuvoTOWrD3n1S1t4YA6JCeO?=
 =?us-ascii?Q?fsEQAUInXb4OecPPHz8Q0KNvuWe5rnsSNHVGZOFCZfTvynwQGIpfB6lpsgy3?=
 =?us-ascii?Q?o6oz6+YweQ4nPcyg2gGm6sZsmnHKJ6MxJoJr9uyJFDuDGpyH8z1B5sF+JEVt?=
 =?us-ascii?Q?sw6abhUsZi7mwn/BC8t9oMCyfKAqcQZlK8qMXt3na6zoxCDrDLlfhTGJgwyj?=
 =?us-ascii?Q?3IbhCEVPprYuNJwb576WDtWw8lr9DTNf01a1u3YE4f5tSBtgA6p+rnH6EDez?=
 =?us-ascii?Q?VLLLZioRQJxWARdWdkpa5IfeIzdvMo2vdwcktshEP8ZSXE8S79bA2LF9lTG1?=
 =?us-ascii?Q?Y5fneXhhZjzmO/HVMhmd2JCglDkanQFqFsG2JyuV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd11ae5f-151e-42b8-c05e-08dbe44ffbee
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 13:53:58.5806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C/lol0C77SXxEm0tPVNbFPryVr3a6KZObJVxLsqpwFxEXJ3Qx3nkE9FP3uW7Q5n1wB5cv7M8KvEhK9NqPHvlmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4885
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/2] drm/xe: add skip_pcode flag
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Oct 24, 2023 at 12:15:44PM -0500, Lucas De Marchi wrote:
> On Tue, Oct 24, 2023 at 01:40:11PM +0300, Jani Nikula wrote:
> > On Sun, 22 Oct 2023, Koby Elbaz <kelbaz@habana.ai> wrote:
> > > Per device, set this flag to enable access to the PCODE uC or to skip it.
> > > 
> > > Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
> > > ---
> > > Changes in v2:
> > > - Added the flag 'skip_pcode' instead of 'has_pcode'
> > 
> > I don't know why change was made from positive to negative flag.
> > 
> > Generally it's better to use positive flags, because they just read
> > better. Negative flags often lead to double negatives in source, such as
> > !disable.
> > 
> > Please consider using a positive flag, even if it's not "has_something".
> 
> https://lore.kernel.org/all/qvuhtciy6gasz4s5f5opebdepse7x2ubfttnb4alhjq4e5zz4b@fjs6d67fcmex/
> 
> The positive here is harder to work with IMO when thing "stop to exist"
> or when they are added to cope to certain environment limitations.
> That's because a) you have to go over all the past platform info to add
> the opposite, you can't rely on it being zero-initialized anymore.
> b) it's very easy to forget that for platforms that are wip as there are
> no git conflicts to serve as a warning.
> 
> So, I think adding it as "skip" or another better verb could be
> appropriate. At least while there is no single user of that flag and
> platforms being worked on @habana and @intel, IMO this should help us
> not shoot on each others' foot.

When I first read this thread I was also with the impression that the
positive has_pcode would be better. But then after chatting offline
with Lucas, Matt Roper and others, I changed my mind.

For the cases where it is rare to have to skip, the negative is better
to maintain, and then, if down the road, that becomes the most common
behavior we can flip from negative to positive.

I also liked a suggestion from Matt about using 'lacks_' instead of 'skip_',
however I don't have a strong preference and on the second patch in this
series, the 'skip' is better.

So, let's just unblock the progress here and move forward with what we
have here and we can always improve or flip things later as needed.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Lucas De Marchi
> 
> > 
> > BR,
> > Jani.
> > 
> > 
> > > 
> > >  drivers/gpu/drm/xe/xe_device_types.h | 2 ++
> > >  drivers/gpu/drm/xe/xe_pci.c          | 2 ++
> > >  drivers/gpu/drm/xe/xe_pcode.c        | 9 +++++++++
> > >  3 files changed, 13 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > index 44d622d4cc3a..29199671d9e8 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -257,6 +257,8 @@ struct xe_device {
> > >  		u8 enable_display:1;
> > >  		/** @bypass_mtcfg: Bypass Multi-Tile configuration from MTCFG register */
> > >  		u8 bypass_mtcfg:1;
> > > +		/** @skip_pcode: skip access to PCODE uC */
> > > +		u8 skip_pcode:1;
> > >  		/** @supports_mmio_ext: supports MMIO extension/s */
> > >  		u8 supports_mmio_ext:1;
> > >  		/** @has_heci_gscfi: device has heci gscfi */
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > index 2fae45b9d88e..05b0aa9f2ab7 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > @@ -61,6 +61,7 @@ struct xe_device_desc {
> > > 
> > >  	u8 has_llc:1;
> > >  	u8 bypass_mtcfg:1;
> > > +	u8 skip_pcode:1;
> > >  	u8 supports_mmio_ext:1;
> > >  };
> > > 
> > > @@ -578,6 +579,7 @@ static int xe_info_init(struct xe_device *xe,
> > >  	xe->info.media_name = media_desc ? media_desc->name : "none";
> > >  	xe->info.has_llc = desc->has_llc;
> > >  	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
> > > +	xe->info.skip_pcode = desc->skip_pcode;
> > >  	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
> > >  	xe->info.tile_mmio_ext_size = graphics_desc->tile_mmio_ext_size;
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> > > index 4a240acf7625..b324dc2a5deb 100644
> > > --- a/drivers/gpu/drm/xe/xe_pcode.c
> > > +++ b/drivers/gpu/drm/xe/xe_pcode.c
> > > @@ -61,6 +61,9 @@ static int pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
> > >  {
> > >  	int err;
> > > 
> > > +	if (gt_to_xe(gt)->info.skip_pcode)
> > > +		return 0;
> > > +
> > >  	lockdep_assert_held(&gt->pcode.lock);
> > > 
> > >  	if ((xe_mmio_read32(gt, PCODE_MAILBOX) & PCODE_READY) != 0)
> > > @@ -249,6 +252,9 @@ int xe_pcode_init(struct xe_gt *gt)
> > >  	int timeout_us = 180000000; /* 3 min */
> > >  	int ret;
> > > 
> > > +	if (gt_to_xe(gt)->info.skip_pcode)
> > > +		return 0;
> > > +
> > >  	if (!IS_DGFX(gt_to_xe(gt)))
> > >  		return 0;
> > > 
> > > @@ -280,6 +286,9 @@ int xe_pcode_probe(struct xe_gt *gt)
> > >  {
> > >  	drmm_mutex_init(&gt_to_xe(gt)->drm, &gt->pcode.lock);
> > > 
> > > +	if (gt_to_xe(gt)->info.skip_pcode)
> > > +		return 0;
> > > +
> > >  	if (!IS_DGFX(gt_to_xe(gt)))
> > >  		return 0;
> > 
> > -- 
> > Jani Nikula, Intel
