Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F669C4706C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 17:13:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B3A410EB4A;
	Fri, 12 Jan 2024 17:13:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C382310EB4A
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 17:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705079629; x=1736615629;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TF3GAZL6XkKCHZJ6Qw7fgmgIdovUFXFPj3AMZqjzTVQ=;
 b=AnL4KejZpJZK3bALSiuIAcDogAMcGnvgJUu6nbOGDW5PNnZdmg7zTp61
 nxyhFVVPGBhX6QN0xbFBcZYTBALQosUQa9MOcxdF544TN7tkuIaO34Vh1
 zicBb1E4H7tboqjCTJPvkariWgxZS98QNMAtDrWjuWiW6JPqBV053ej7z
 PAUog03tmfEMEwLXGnY8sTjB87xxkdJMM/vF/RRkFVpa2i+VmwEPRzyp+
 My9CuwlBqoSJunosGKG7mOsuFCUBXUVNUg+tghwMXQLuJdnNpPSinPkLt
 Pep/QgZho/yZHXJZS2/p0FzJ5KSJUiccfdMut8ZdE6tEZ+ZHW5C4gT2zN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="485401308"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; d="scan'208";a="485401308"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 09:13:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="906376161"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; d="scan'208";a="906376161"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jan 2024 09:13:48 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 09:13:48 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 09:13:47 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Jan 2024 09:13:47 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Jan 2024 09:13:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFHrveTR6CsZFwKAglu7wzMGleyDyIz29zHKpPHJbEzCv2kMuZANjvhuFEeVU6TMUfON/PeZSSK9y0lKYQIuOdtV4+/HSvMuLEp6bdH4aYAezY7ut8d/YlrE/4ldz8dj2k7csKvpc6seNMw3l8b+yqrykT+6Yry9S/pRsJcNy4GX25WB7G2VGPqU4wes+HJWnKf62iOxj2kM4YW6AcTWi4EM+Q/Kpuu4W5RuGxYz8SJ9wbC5zDCRorsCRCyv+LVGilFRT5Ayfvtk0MxSfNbtSQhG8H9etTitOXIKXrQcA6gs8PffLrVEgQ2eFmg1LuNrySMC5plEpwrtWgHYCqgdxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FBIrnNo/TrGLqSTDV50IcoyAuPr+wNtGJJ75QEuP3wo=;
 b=Mq9FZErix8EPtLnJFbQYdRA4wbAYkgdjdz3Q8HHuMRtAFowSwl945HNRBKoSPG4JM/E116vvDGWUHYWrDb40d5GcxQAWsGtJO6xtOj/AE0rRN3F384s/vnRyJBcV7TL42tM71Xc7MvzdDjAmWh9HID7XXu7vUlrucT9GN5Kv61/JNrma6ZbI1gZH0kNES40tpe55v2DkdmZO9PEouUb3VMaLCCFA2sn2SW9b96JkzagHzDIw4bdrtBoA5puHLTKrKPx4cZkIwq47fXONDuu+uv6XtoVxYgNwH1smV3g6bki5Ud8LtnIqHuensqfTf7hzI1ImcD7tybQ0xV1RSUTgPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB7712.namprd11.prod.outlook.com (2603:10b6:510:290::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.27; Fri, 12 Jan
 2024 17:13:46 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7181.015; Fri, 12 Jan 2024
 17:13:45 +0000
Date: Fri, 12 Jan 2024 09:13:43 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe/migrate: Cap PTEs written by MI_STORE_DATA_IMM to
 510
Message-ID: <20240112171343.GA45138@mdroper-desk1.amr.corp.intel.com>
References: <20240111220238.1467572-2-matthew.d.roper@intel.com>
 <ZaCSJ5+WaCBtHwuL@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZaCSJ5+WaCBtHwuL@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR03CA0100.namprd03.prod.outlook.com
 (2603:10b6:a03:333::15) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB7712:EE_
X-MS-Office365-Filtering-Correlation-Id: 9304df0f-bbaa-4774-ecd2-08dc1391d5c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pUr7fapFKSD71JM/D2vheGTKZMvGvp1IkYlLBQEaQ2/O/NQV+kXezpCwQB6CYZyXAQ+ei9LyXOZYTFDWUCW7OXdSp0OqX11lOByP7/WQtC3ctak+nW2kuS2DhatFro43BllmG07GWuRRcbAmOScSLMOt7InNBehfkgLEciWJk4d7Qnqtn3wdu1o0B9vr0zoKdoFK6uohy3XhiWW51xKekMcTVY+VT0/Zpmoaj2xAAchKp9JGKjlW0U3iMDRbjuMC44YWJVnkBV/Nbt1pmyaNwKDuvqmyOsUAcdwdcEpF3EmM3H5iVjGeQzW2Piyq95ccIuGZz2TgBoEaayJthXRKKRwlSFPh/ZY/cpVvCI6U1K3qnc1vc5FYQUMPEcwwO54Ik590hCDqwdd9mS+GILJcJWf74biFghY8i2zFd4e9kkg28PS8dBCrbVDoJSUhvHxEwoeDCLrApS0+71QReUoPl2hh8PFOlLgqkciyG915GJ5YiO7OVi2rVIoy1qwXhCoogCIFMcTeBONWR5FAZISajhonoB+rGuu69cYMChzPuuCflhD0+g3T56Lk+ncIBZnS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(396003)(366004)(346002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(66556008)(26005)(316002)(6636002)(66946007)(66476007)(82960400001)(6862004)(8936002)(6506007)(8676002)(1076003)(4326008)(83380400001)(6486002)(6512007)(5660300002)(2906002)(478600001)(38100700002)(86362001)(41300700001)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ur83hXcf9ZDo9xybHQ6Svt/vqGKZIdjtKiiqQiz3Wseie54Q+74oLAJFq1CH?=
 =?us-ascii?Q?ejh2KthWAuTbi90Wtcd9JgcCAyoEDwgQgkBGteU/2Sf4sBG2gsJtxycRbBCJ?=
 =?us-ascii?Q?3EpRvNHeo0fG4BC4GQNRCo1nsn/yLNDHu9C9aEwyGASxvFbktkGIDN/D86wc?=
 =?us-ascii?Q?blZHrPvmF5Dh6hPmf7OawZaSh5L+9BYiOmftqEoNYRWF5vT1Nw6jeEuzn5tb?=
 =?us-ascii?Q?CVyaTC03+SCIBme6kx4OoHqjsQWkM02zvnw6fEp2j4Ad2DCY4u1fg4g1NTHC?=
 =?us-ascii?Q?iLDhIX5lRcJXkbFDi44R926tz3OYpoxF8dGHGyfg3UdyU6ru5skQ1yOtxB3F?=
 =?us-ascii?Q?u4g9gdccC2FHrblqUSc7LefVja8J7pqBinrFGKx76jxt2asGK8rl7QHFata5?=
 =?us-ascii?Q?fWns1Jmbkm/RijZMpJQ1ysFCaw5zrVSSgT9efIGW5utU1c2Pc92S883ctZMU?=
 =?us-ascii?Q?56K2beUKxgnZ6O619S66M/3iWllZ3C5QSx8n2QEjDEyDXQxZYLNb0mYziWFB?=
 =?us-ascii?Q?PsRGUsW3e5uV1IYXOfFQPt8TKTSLAwDiNdGPL7u1lQ7dNInfAob9FSGVjlfX?=
 =?us-ascii?Q?jIFhXhiNbAZ+YKm73srdAF96t/hOg/ol/vYlQ/px1xRm6NrUF/BWdcv6sD2B?=
 =?us-ascii?Q?/lp0oqxJZZzNERdduDujXBYwBYNFdOXPBNFfvozg7YClUkY1Awcj/8yymk0M?=
 =?us-ascii?Q?YEH08Zqxd0pSvm5oKYOxORtVJ2H5BGiHwP3kHuQvseF1uxFDxL3bgF/HGp6t?=
 =?us-ascii?Q?0t1Ad3bF7nr4WTHYYfLhs2GLPDnV+YCF3sjWCWU60uaKnlQWKXSwaYPcaKrG?=
 =?us-ascii?Q?JPkcps32zwB+k0qYkCgNqs6Wx8aJZC6XcObafuU1oW8GAiER3MN1BvX3o2Kz?=
 =?us-ascii?Q?4bVC1+VzCMQUXOz+trhuJdljrS821IWn6i/3vds5whCjGMpb14m54AfGIDiR?=
 =?us-ascii?Q?7zaHnGErJTPEfworanzjBG9V5dFKR9XMY8n0x5NNJnF+SpM4R7E3dScxxzwA?=
 =?us-ascii?Q?z1nEUOemfw0/0wAvwDYmlVDCqaIqkrRRI4zc6Ty7YVPxfwhjHdWEdK+aRGAC?=
 =?us-ascii?Q?47oaNL5b7D4TDdM1TkbJzwSJP6DQx69X5x5YTGE4umzdCw9u2EAV81ZrBaI0?=
 =?us-ascii?Q?MUAYg8JYNEZI/NqBnGVFKd0m+wdXxaH89LtYHBgB5y5nBOp5SfSinbnpbyJu?=
 =?us-ascii?Q?NYN9dsJu87tkxXGapCq4a7P3kXKMREauRevjX7ojblljNAg2fcyIBMMjCNvH?=
 =?us-ascii?Q?SKUljolkjf9RTK4u7IiQbq67Q5zjFXRLJ/PG5tbwmMOjt2dhvxUrOxJ++/Z5?=
 =?us-ascii?Q?tWoIh/J7Wa9vgo8tN0VLITTEKzDgD5A6Sd8Czf5pZeBbWN1eC9qWd6pjbx2E?=
 =?us-ascii?Q?67FbvwXfRKihc2y5OFspp1ktDPMQLcB+wg27ytUMmiX6wsmrpy7ryYyF7EwX?=
 =?us-ascii?Q?Q3sIf6Q/B3ndCLJuiei2Mu4U6bIA72b99e65E/dMRVdV8Au58BcwMghIeGXo?=
 =?us-ascii?Q?OYBhNNtZ5ehfY4PGy4ii7i2jdVsqdm9ui0mAdej9fDlO2K+gEVgd8wQVOJc9?=
 =?us-ascii?Q?LqaVeF3l67V531aYwcImC9YqFeiCAvrYJQd+lod6nA1DM8hfeso0crMZGuWt?=
 =?us-ascii?Q?LA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9304df0f-bbaa-4774-ecd2-08dc1391d5c5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 17:13:45.8656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PYpXCO6E3IQs5f8+TCFExNcXBsKc1AqxEdfji96qJh4FczCfp1LIOkV9I2ScogZjErx2YU82y+UvMB8YXrIkuIPoT+k0atwCJTGDPzot2VM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7712
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jan 12, 2024 at 01:13:11AM +0000, Matthew Brost wrote:
> On Thu, Jan 11, 2024 at 02:02:38PM -0800, Matt Roper wrote:
> > Although MI_STORE_DATA_IMM's "length" field is 10-bits, 0x3FE is
> > considered the largest legal value accepted.  Since that instruction
> > field is always encoded in (val-2) format, this translates to 0x400
> > dwords for the true maximum length of the instruction.  Subtracting the
> > instruction header (1 dword) and address (2 dwords), that leaves 0x3FD
> > dwords (i.e., 0x1FE qwords) for PTE values.
> > 
> > Bspec: 60246, 45753
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> 
> The change LGTM and bspec confirms this correct.
> 
> Curious though if this ever showed up as a bug anywhere? If not, why?

I'm not aware of any specific CI failures or bug reports due to this.
My understanding is that if we violate the hardware requirement here it
won't always cause an outright failure, but could give
undefined/inconsistent behavior that might just show up as sporadic
failures.

Applied to drm-xe-next.  Thanks for the review.



Matt

> 
> Anyways:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 
> > ---
> >  drivers/gpu/drm/xe/xe_migrate.c | 19 ++++++++++++++-----
> >  1 file changed, 14 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index 88a32b272dda..44725f978f3e 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -72,6 +72,15 @@ struct xe_migrate {
> >  #define NUM_PT_SLOTS 32
> >  #define LEVEL0_PAGE_TABLE_ENCODE_SIZE SZ_2M
> >  
> > +/*
> > + * Although MI_STORE_DATA_IMM's "length" field is 10-bits, 0x3FE is the largest
> > + * legal value accepted.  Since that instruction field is always stored in
> > + * (val-2) format, this translates to 0x400 dwords for the true maximum length
> > + * of the instruction.  Subtracting the instruction header (1 dword) and
> > + * address (2 dwords), that leaves 0x3FD dwords (0x1FE qwords) for PTE values.
> > + */
> > +#define MAX_PTE_PER_SDI 0x1FE
> > +
> >  /**
> >   * xe_tile_migrate_engine() - Get this tile's migrate engine.
> >   * @tile: The tile.
> > @@ -444,7 +453,7 @@ static u32 pte_update_size(struct xe_migrate *m,
> >  		*L0_ofs = xe_migrate_vm_addr(pt_ofs, 0);
> >  
> >  		/* MI_STORE_DATA_IMM */
> > -		cmds += 3 * DIV_ROUND_UP(num_4k_pages, 0x1ff);
> > +		cmds += 3 * DIV_ROUND_UP(num_4k_pages, MAX_PTE_PER_SDI);
> >  
> >  		/* PDE qwords */
> >  		cmds += num_4k_pages * 2;
> > @@ -479,7 +488,7 @@ static void emit_pte(struct xe_migrate *m,
> >  	ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> >  
> >  	while (ptes) {
> > -		u32 chunk = min(0x1ffU, ptes);
> > +		u32 chunk = min(MAX_PTE_PER_SDI, ptes);
> >  
> >  		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
> >  		bb->cs[bb->len++] = ofs;
> > @@ -1098,7 +1107,7 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
> >  	 * This shouldn't be possible in practice.. might change when 16K
> >  	 * pages are used. Hence the assert.
> >  	 */
> > -	xe_tile_assert(tile, update->qwords <= 0x1ff);
> > +	xe_tile_assert(tile, update->qwords <= MAX_PTE_PER_SDI);
> >  	if (!ppgtt_ofs)
> >  		ppgtt_ofs = xe_migrate_vram_ofs(tile_to_xe(tile),
> >  						xe_bo_addr(update->pt_bo, 0,
> > @@ -1107,7 +1116,7 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
> >  	do {
> >  		u64 addr = ppgtt_ofs + ofs * 8;
> >  
> > -		chunk = min(update->qwords, 0x1ffU);
> > +		chunk = min(update->qwords, MAX_PTE_PER_SDI);
> >  
> >  		/* Ensure populatefn can do memset64 by aligning bb->cs */
> >  		if (!(bb->len & 1))
> > @@ -1283,7 +1292,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
> >  		batch_size = 6 + num_updates * 2;
> >  
> >  	for (i = 0; i < num_updates; i++) {
> > -		u32 num_cmds = DIV_ROUND_UP(updates[i].qwords, 0x1ff);
> > +		u32 num_cmds = DIV_ROUND_UP(updates[i].qwords, MAX_PTE_PER_SDI);
> >  
> >  		/* align noop + MI_STORE_DATA_IMM cmd prefix */
> >  		batch_size += 4 * num_cmds + updates[i].qwords * 2;
> > -- 
> > 2.43.0
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
