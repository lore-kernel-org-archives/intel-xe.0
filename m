Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC02DE92706
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 14:59:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E6E10E417;
	Thu,  5 Oct 2023 14:59:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5CF810E417
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 14:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696517948; x=1728053948;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=o0nL+OrdYh7W4qUv+spWcYKfkNhD54+ohop3gpUVa/Y=;
 b=MLiUFpjkzLqgI934vk62ARJ9/KPfOhJZ6PhWK2d//+o8ZuXnW+6r8ed9
 LnxoxUR/YgGpJMp/Stq2xyW82InKB1KJxsEQyZP3nz+gbKzR3fChMv2VN
 gs4woMNNso/ZnWErIEmrNA0tV1ybQ5bEz8ugH9uoU2N6kl+EM7S9cyKbu
 1YxFfVlvrbKNXuKqxwt1Z5Yf/AnjfxSL+DlyY+A6OdoYTIb/vWfEVqYRW
 2TDbXvLUorciHRVvpmw1Y3SIxNhm3XUQqC/FiStOoJJlhTqpkD4AhRw8Q
 uAUgw7oMkzB13/3STveOBMRkjc0YUAXq+jnboJCRQ8+HP+GJU4b3Ox0s6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="447706917"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="447706917"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 07:59:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="842438388"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="842438388"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 07:59:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 07:59:06 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 07:59:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 07:59:06 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 07:59:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T38JGr0q7dMabfk4rpTFe/iuo1TI6BLORCDp2F2+ydfcvDLdgCQWfSXx8xnzscffEdAZumbPYT+O02+ADyJpNsXM7tXib+guzD6oVeEG1O3ckByMy/ho2sIThvUL1le9zzFL9uq48TX1Tm1EE0+c3MKt01rfi8c1zzRz3LSJc35MZksX/fmcOCW0B7KF0GujfZPGuhCfbAM4DMAnmZ3fEG0++bg1BhLKtPNz94wMydwseNDUypL9c9O/0q/QKTpNpCURV0muuTLNW7W+PVfETxpseVwgWivYkVnQ+2ZBk26ziYRnEP04pOEFXHV7bzFIXBnupx09WW9AEKEY1i9D9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Betu8xS3bIuCLYiJ7ww+Vz5rz8Aq09zlrC0zkDwvITk=;
 b=ZDOdZK4BmEwoge94Q7FANQ4tBdfxGLPi/wsFxMeM1iXgmIyboIUAg61DzZmlebLOIZ+AL71oMnvr+FEo16KqeuB3E20k0O0P/vWP14exzY8QvMk15SlB7MA1FO4MsR90qo1311CJGyePwJ7E7kv/fgaJhHnfYFws+O2OV3hPd7BmSTzKQXllfPApl5RaUUIFF6QAL21rc4gx29S3xB+6+9JpL3zHYjaQQnVizJkfJIoa0en6RMXQpf7yQNp1n3bJ9CIrB5iSb9Bnh0jaXKF7hUDiIhR2wV8RAwEwRTQw6rtIo9uIcZBTdAnS391XeCA47Gk28DQnFD6T6nr1uL8hnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7854.namprd11.prod.outlook.com (2603:10b6:208:3f6::5)
 by CH3PR11MB7915.namprd11.prod.outlook.com (2603:10b6:610:12f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Thu, 5 Oct
 2023 14:59:04 +0000
Received: from IA1PR11MB7854.namprd11.prod.outlook.com
 ([fe80::9e86:2cc6:b627:c265]) by IA1PR11MB7854.namprd11.prod.outlook.com
 ([fe80::9e86:2cc6:b627:c265%5]) with mapi id 15.20.6838.028; Thu, 5 Oct 2023
 14:59:04 +0000
Date: Thu, 5 Oct 2023 07:59:00 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20231005145900.GA208112@mdroper-desk1.amr.corp.intel.com>
References: <20231004210624.123779-1-jose.souza@intel.com>
 <yiyeir6exg26ttr5jcuzth6qpz7e2k3wxxo5hwsqqff44qmm53@l7t3ikixq4yu>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yiyeir6exg26ttr5jcuzth6qpz7e2k3wxxo5hwsqqff44qmm53@l7t3ikixq4yu>
X-ClientProxiedBy: MW4PR04CA0178.namprd04.prod.outlook.com
 (2603:10b6:303:85::33) To IA1PR11MB7854.namprd11.prod.outlook.com
 (2603:10b6:208:3f6::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7854:EE_|CH3PR11MB7915:EE_
X-MS-Office365-Filtering-Correlation-Id: 27c6b54b-8364-4b88-9cb1-08dbc5b39dec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vwdGVkQ+kKqfDO9jmhmOh/fP4uUEjMk+ay7f2/Isx+xVlAY2Jn68/8OTjLaUFRdRg3Lb4JdlRZRIhV3yrEjbEgNXfrYyKJ1CICxzUOhltC4Yc894arXc0hvaBW/4fo+h+TEn4hcwLMDm4LfuO9/xN2FkVz3sg4jTANQprnVHqCGObn4tIeD/fPspRfQmAcdcKB9qP1GYeu+e4HGuT9eKb+OH+BFFt/D2RlZEwXmjmulRRUCl6LiSKpa2XBCn5x7U2Gnug0JYlV29CIjqwcqUMGd9yL36kiH6dzo+ajfXkVq3kVunwOfU9FZgU9uhQk1lVG/mCPKermLAOmRou00mOq+1pnxXG459tW01UgXUr3fs92mFYyBRTanGnFS76MZzv3cLytkTypxZvZ2t7hipgGCHdJnDPsuNvwhWKghRMU2U61WR7CWGHsLO9X/CLC5/D6oHrEadSqU4q5OSw0W78UH6Du+5snahfZy16kPiX4vC/YTXlKsJ9B9Pn2//NeRYetmKwEZqcD9ZAwNe/M/wm5QpegYWXZyEBkQ9tzZ2qQ9Ua2ac+WqEQYX31UZuNeE2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(366004)(396003)(136003)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(66946007)(66556008)(66476007)(54906003)(6636002)(316002)(41300700001)(1076003)(107886003)(6512007)(33656002)(26005)(6666004)(6506007)(478600001)(6486002)(38100700002)(86362001)(82960400001)(83380400001)(2906002)(6862004)(4326008)(8936002)(8676002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8u1MhrVK4FHrH7ksfcUGwaweJFseOvhw2Wg2h/UAK+qH7GinGKjOJxFGS9?=
 =?iso-8859-1?Q?PXnbssueah5TunJc9CQwPOd0CMdNe0I/QTz3qPC0Hoj953kF0Lr9OQhlNv?=
 =?iso-8859-1?Q?KvraFzOYddEONFMIrtpBE1xqZJyTZtDpjnog/9uVj8xu2Qs94zeKafwGhz?=
 =?iso-8859-1?Q?L/wiiYeSgVFNsCkhhwKRcpx/vKG29/yZhbAraqNvb/XEeGrnWPmw5NpWj7?=
 =?iso-8859-1?Q?+EeX04984//APaWRUDiai8w+VmECpzbrHUFWvOETE3xY6MaBQtSaZy1CLQ?=
 =?iso-8859-1?Q?9Zfhwlr9AktFGzsTOkqXS6wzCDEJYmhPnAfz/G8knzX8vCUnAQ7OitbIfv?=
 =?iso-8859-1?Q?oyNNK9QovZFvSlgutUtxSBeVOijMholROkkxRUo5S/0p97hf3ZRRiBLMOy?=
 =?iso-8859-1?Q?vsJmWikBldzEs/oW1QqPoTPaY+vgM1myOWWAbD17t60HTEJ7A49kW17NWb?=
 =?iso-8859-1?Q?8nDlkcUSqSOAuDSAvvZRBCdjdyrVXeBrSTSMbnTYI2rPH+SFoorwGWz5wr?=
 =?iso-8859-1?Q?uzCmr6fATqF6DimOMmuUrEifCypOmfRalc1n4EKPBQhu4fDVluPTswZLSp?=
 =?iso-8859-1?Q?Ggb6Bm+/DqH5wMQLm6UX/dMvSYIxwNIYTLqdZnf2HwdLoGsgxc+Vx1ESNi?=
 =?iso-8859-1?Q?S6HSmUMplIABsY0R2rg7noNcxHvyzgPtL7Dg+iMzfR7D3Ay7EjMUQGtS++?=
 =?iso-8859-1?Q?y/lIX4lWY2hpid42NJ62rrUIngpXo2dk47qeZGrKUCllu5fM82Z8XDLGwV?=
 =?iso-8859-1?Q?LeZZ8TEjt9KMFd+yAY4+suKAt99CT5fowyJ4166SWcQ7tyJLD3vXU2/g3M?=
 =?iso-8859-1?Q?ZsPmsci8oanjY9JDiqyWPq8diI3KOwso2P2CPWRtLgpWqnJqHDjDbbRO8T?=
 =?iso-8859-1?Q?Anp4/gOBvAyGlK1mFKiXdmzvl4YkcphhS4p56R2E7zq/6kDVIbqje5qU5Y?=
 =?iso-8859-1?Q?8X/WEjTgxrJvBn1M1aPDejq5zpggRJCYFdML7nn/yhjvuZoTTvXsfVOvLU?=
 =?iso-8859-1?Q?ErEtCSUjMQ47Sfl06OUy7XWh+EjDEp4+3CRN7MnITzmMfF/9C75vP8c1ts?=
 =?iso-8859-1?Q?CrAKJvwRfm3yPO+nDsnUSzOFr9ieka7VZO5bisFOzp3+bocyh74lQZbqft?=
 =?iso-8859-1?Q?LFTtnyUEjW0/3PWlgFr6vQsw/5qG2Cnjp7RDSrTK5vxI/VHCvQZAIqEZEt?=
 =?iso-8859-1?Q?qAHsyofrXHAI8sT79ADzB0rxdnk4CnS5YuBzCuiWmcWYtlCN2BZQHevyg4?=
 =?iso-8859-1?Q?QR7PZdfNIr9P8MRPYr0rWksNSZLxjvc4zJUQhmPC41IIH9h751GwilAjK2?=
 =?iso-8859-1?Q?zhLABQbBP4DQbedmwpgtnQNyX2r3JXUYawrh4QU0p4SAqkjVodZ9pe26ia?=
 =?iso-8859-1?Q?AqOAVWlTY33I99oJi3zJLngudeFRONprxTfffrc83NB7OK1L7Qw1zQWCJu?=
 =?iso-8859-1?Q?2yCjU7Iz2ZuKe9efPVzBT2NrvLdO2WaD37NPOxnA5cBf3jw6sei//zdxFu?=
 =?iso-8859-1?Q?3JjCIj9DxWQ2pEewuIjb9JwCaU07GjVmy39vf7ai4Nm+/uhhSVKMbMufQt?=
 =?iso-8859-1?Q?zWEe3+MUNK/4I+wSQxE7MJuImk5J+ZX+Q1nS7r5e7zFZy28IPVShPUUi76?=
 =?iso-8859-1?Q?m26rIiSXqo9+B0Z4USsZcIg2orLmBD4Mo21s+m/ambluFiHl0Ictu3hg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c6b54b-8364-4b88-9cb1-08dbc5b39dec
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 14:59:04.4631 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WeZMWgeMYin3923JhhUy+fW/pkvAKKwCqn+ZB5slE3brmGV/Xku63Cf1SXuJwgQhFdnq3TQP2U67cy0Zngkjrr/39lO49O3vFX9vW9hc+kY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7915
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Allow atomic operations in pages for
 Xe2
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

On Wed, Oct 04, 2023 at 11:29:49PM -0500, Lucas De Marchi wrote:
> On Wed, Oct 04, 2023 at 02:06:24PM -0700, Jose Souza wrote:
> > Without this if a atomic operations is executed it causes engine
> > memory catastrophic error.
> > 
> > This bit was already being added in the pte_encode_vma() path but not
> > in the pde_encode_bo() path.
> > 
> > This fixes at least the 3 failures in piglit sanity and 2 failures in
> > crucible.
> > 
> > Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_vm.c | 3 +++
> > 1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index ea17d026546cd..6be5d92706932 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1261,6 +1261,9 @@ static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
> > 	pte |= pte_encode_cache(xe, cache);
> > 	pte |= pte_encode_ps(pt_level);
> > 
> > +	if (GRAPHICS_VERx100(xe) >= 20)
> > +		pte |= XE_USM_PPGTT_PTE_AE;
> 
> I think there's a clash with doing this here and doing it where it was
> done in commit 6193a2ba4704 ("drm/xe: set PTE_AE for all platforms supporting it")
> 
> There it's adding the flag  in the gpuva.flags which is later added to
> the pte. However, in xe_pt_stage_bind() that checks for XE_VMA_ATOMIC_PTE_BIT
> is only inside doing that for devmem. I was thinking that I might had screwed it
> with my recent refactors, but looking at the log it was always like
> that and the fix in the commit above didn't fix it for *all* the
> platforms.
> 
> Does it fix it if you simply change that function to consider system
> memory? Otherwise we should probably change it only in the pte encode
> instead of doing it in both places.

If we set this bit on system memory aren't we going to stop getting page
faults?  My understanding was that we need to migrate from smem->vram
before performing GPU atomic operations, which is why we leave that bit
clear on sram pages today.


Matt

> 
> +Fei, +Matt Brost, +Matt Roper
> 
> Lucas De Marchi
> 
> > +
> > 	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
> > 		pte |= XE_PPGTT_PTE_DM;
> > 
> > -- 
> > 2.42.0
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
