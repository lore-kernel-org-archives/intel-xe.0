Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65314C4706C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 21:33:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1458610EB10;
	Fri, 12 Jan 2024 21:33:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6889010EB10
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 21:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705095214; x=1736631214;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Txml8JojRSTKbR5S9RuMkbjCA69lCx8wG3Be4+ixEuo=;
 b=LiCvYG+gSLLQ9adwPk/6wLuyVcpPJV9rJ75tQRcU6e2AEQydeHz1g6Cs
 6lxwL2w3QONZBgaZDsB4NJXlaudLGcFWGNacAGfYCa+n7KXZWOb+E/9I3
 oXHSKAkxNrZARjR9ynb+HsvZDHvI0aWwdlYypORvwRn8qwoiEP2ZrqOu/
 B0BwzPTeLsk/oUrMwUaJiOHrgPb5xdTUQQ/DsOOsp3loHDg91OisYrEYx
 zNkzO26cJaRVwoOb5p8Oa7CN47VZUWgoJxJVhvTFex4pvMTO/tY/zsw/j
 4arGn/YDyOau5VdyoGc08XtgtDBf6ud3eaHsPD1bjIlLpDxPKcPXN+h0u Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="6018635"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; 
   d="scan'208";a="6018635"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 13:33:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="776122190"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; d="scan'208";a="776122190"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jan 2024 13:33:32 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 13:33:32 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 13:33:31 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Jan 2024 13:33:31 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Jan 2024 13:33:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iwy6/R2PW8iHAKczgwx01ftyleHs8Pmyw4LyxH6DsER+mU8/wt++iL757ix7AdPU9OMNiA4A2xtKLS8E4tQ73FHAVhBewML8rOBMMumMj7IXnpKHIoKowfnp5aKOnlcTsCVIZ7NfT8C20ViIszIpZ00jL99t1MCbJiKWacePNX8A0vgPWkGAFt9ciooSrtZ49cxnb52+ag1dPZjt9l5TrKNVq1wYXxNqUFihkz02ZTykrmWhtlGoxB2aUKVUNlY8oagsA+1pE+YmnKZtJDxSoPAKVoFPjGFe4SjyWsZEbRyQ4HkDT2VZwpVNLxv3lP0n9Wd+Pv695Wk5oPFBppu4IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbVeJHmjYTYq7ZH4e+fwcMHY4cIFEO5X2DuVNT3ak3I=;
 b=jUibeSSIqIf1pR6z5/fYXgWbsHtLHOJGSwlR4qrcu3Hdf/6gnz5bBY0YIGq/R6bI6pNJ4XGtCzgwNZMBplO8J55FQIrFH+CajSW3T0Bwvn3jDwwOsc3DPj5prTjO9AGZZPl6B/fcIaJOInfVNGRDaar+SVcNREAKVN14eF9+z2uGC0zRFyrTy00TcEz7Hnl3aECVqcVNWMOkWCYjoZ0fvTiSMEh2vg/ebMaGtrnXZE0AQY+nH0UaOummpi/z64Ywsn0BcIs0aZmllFCqN3ohCDorex50jnkuyXzzCL+ybIDNyrrdH3Giw09cXnPv2FwdW3brHWuO1/tcMqcidHlx0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6426.namprd11.prod.outlook.com (2603:10b6:510:1f6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Fri, 12 Jan
 2024 21:33:28 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7181.015; Fri, 12 Jan 2024
 21:33:28 +0000
Date: Fri, 12 Jan 2024 13:33:25 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH] drm/xe: Initialize freq_lock even with skip_guc_pc
Message-ID: <20240112213325.GB45138@mdroper-desk1.amr.corp.intel.com>
References: <20240112182949.181403-2-matthew.d.roper@intel.com>
 <ZaGqzR8RXWbWolfg@intel.com>
 <867a3d39-3630-415f-a306-b1a4490feb79@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <867a3d39-3630-415f-a306-b1a4490feb79@intel.com>
X-ClientProxiedBy: BY3PR04CA0009.namprd04.prod.outlook.com
 (2603:10b6:a03:217::14) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6426:EE_
X-MS-Office365-Filtering-Correlation-Id: 23e1892a-da33-44f4-8a03-08dc13b61d8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gOuvm1/lZUOdRVZ4eNdz2fCt6rJiLD7wd3sMoYpTEoWkQgMqw2/plvKxFSo+oQuB3DiT2dPYubAGQ8P2m4HD4peLnzdaWoUJ3C+nszSGOpI+REd8dRmbEpty4jyNq2+2eyWaayivezbCyiteJVTA4euHSosX62a0tKQR4IjdgANBfGMpjvi4etEdGAsaKrbiZUT4VmhrYvE2vRs8gCpZtPdxQE0j4/DCMpLWw6BwVLBNL6IUd5vpKB3VEbD2Gun8On+oU3pwg2BJ9r3TAvRz077sClvcSRBjI2wx+jD1dxuw8Mt56hLPf70DRpzpbmC4FBXbjByzMizVj9PTrsG0n+fjIgettUAczLddCAOWBwT4yydDdr7C8oFIYmCwJN0TyBIWNchvudMhiPPTxy6T9WmW0fJB/lxpG4H0tM/AbpRWk8BT9HYWbWjLcJBx/Wq44Gudw7qSITIul9Dpq6jdY60KiervPDygFw8vrEyhT9vVIMVnDm5G1NL7kCoBZb2m/AVMv7F1dLjGPMqly2gu6kFPxvq3xUIgtFNCPEKHSzXmf11KOARg7mZ6Ml+3a7X9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(376002)(366004)(396003)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(26005)(83380400001)(6506007)(53546011)(6512007)(1076003)(8936002)(6666004)(5660300002)(6862004)(4326008)(41300700001)(2906002)(6486002)(8676002)(316002)(478600001)(6636002)(66476007)(66946007)(66556008)(86362001)(33656002)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qRDpj+CxS5L+3GSjHeTUFJU9erXn3NPIe/8k7cRxH50yJvWltO1sWyYVTcPG?=
 =?us-ascii?Q?vkcJl00WVh4ZRl2tqfIqCIk01ynE0ttUXNK/bZp8cYGLZ3XMN02en0tgqmJ7?=
 =?us-ascii?Q?NmOaeFN2r/8gc+wyGhpeOY1Yer7XfWmRqjUFcVP4+WbWzL8qh3dv+wPtAXRJ?=
 =?us-ascii?Q?lw5etqlcfWflsRvYji89Zjh65+i5TVljOlQyX99wfH//g3zAmoHXB3FLdZwa?=
 =?us-ascii?Q?4nE4RVnraI8sYuXLc+KgIPo5K25DKe39CiSoconl/IFuK5PA4q7MFIAF8vbZ?=
 =?us-ascii?Q?pSmpPcWNJfFQpyVx/P19o7dFh+s7+AvLOpDKrG9CaqgP2+miIssfRXBNGqZa?=
 =?us-ascii?Q?gVF664Ry2ca9QqO6Tn8RLJGnkndVHUn7IKUYloee4TWb4qEIxtdAg7LO7wOh?=
 =?us-ascii?Q?nz49IH7xyXT9tufCFViiCn73CYwD2Wgehc71LQM7SBRSrfdKwfJWcpBZsLJQ?=
 =?us-ascii?Q?UedFBo7WE5OdyQK5UkQU45nAqotW5Tcvz8/2PdLuXfcGcdYj1RFQCEijQKwr?=
 =?us-ascii?Q?AExYpRHI392TC1hgpMrz1G8OJ4hDeMoaaubT5JashXuFk/xzLK5LXQq+5mjh?=
 =?us-ascii?Q?tDS7UFJ3/8cb4w2rVL0AJvMSeq/DM3sf7iyMbBV3le+ZkXotDYS0e0wHn8Yk?=
 =?us-ascii?Q?9jeBe7iYvxvRGHiezB44Gi8XyfFD8bMfb49Cegijm/aEq1wL/mCwWm0AVNMp?=
 =?us-ascii?Q?GP0sMmPTHw1DsK03Wisc8J2f+2e/BCh756F4MFf5ArPpAL6Bn7M5GdboRH/0?=
 =?us-ascii?Q?SDKkGom7JvaVgOFcmZfp88wKRmSUTvzCbgRzoLS3ezo7J7LAFN6P8J4AcFOy?=
 =?us-ascii?Q?Qfx/iA75GIuEAdS/wUNoOA+CUqlGKS3A6pPlts919ZrwYeK7DNref8gMaaou?=
 =?us-ascii?Q?6lissWzYoBB9hbBXHOn04Le7GTkTWYjVoFRD48VCKeOqzJAA4giKt+qositL?=
 =?us-ascii?Q?Tk6ucK4dOyVex1UNCX1o0ojV0GQO1mPWNP7jzz/EOzORCbwKCUMLlLyTLnj3?=
 =?us-ascii?Q?DgotR/hQlpI2m7sMjYuCr68XcJ7Lq3YCDWnVQpGpgLPtxYUpk+5IC3gZbsZ8?=
 =?us-ascii?Q?l/NsreFI9tg09HoSlnOOgy0V8EtBMGankrAHNMvpVHNVhXv7vploqZSQeXZJ?=
 =?us-ascii?Q?4s8mti556o38hhXdZ0wnaZvSaUoIBkU8mI2jf2+kf3DwdgVzXrK4QvxI4KUn?=
 =?us-ascii?Q?0jnnlD1x/GOGZ6tFnPql4bwyYeqlnTq4HaioC6bwc+jG64Sr/4bnLtfePJt4?=
 =?us-ascii?Q?ed2Wkpr22sX93wSrKwmEvUJ8ocbbp0UzsJtvMu8+EqJiOFfKlfnI5APR5ENX?=
 =?us-ascii?Q?NfGgzsTNuaY18+Izg3fVKhJkEU1ysSMEyBMRC8fKcyG7x+7lXnioLyYDnNUk?=
 =?us-ascii?Q?jRni3QAFhTbu8Bz/DwxEoMsXpV3i0ReZqL6mQQUWz3ZLb2Va0+fzIP7Gx+G/?=
 =?us-ascii?Q?o/AscWt3aHUGAd6xO0vC/lmxiN/OMpYyjRAiNbyAdwsVyOeLEveQMiTIHESh?=
 =?us-ascii?Q?eRCS/ipWKMZlxSwj27BZncEZ3eHWI+iyBI3E6LjyhrxOPluoG3S0pFq+Jeqc?=
 =?us-ascii?Q?z/2sMGqziwW9f974JXh5JBbVIBAFILP7Uenb8G84g901FiSVCKQyZN/pgXvQ?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23e1892a-da33-44f4-8a03-08dc13b61d8a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 21:33:28.1424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qCtIxi0faN/43ZDTBtTdMcAc6VF6RvNPgIKeLW5t0G0DJLcPqqxWsYYczS5+4SNAO91aQGyZrJ/MzKKdB3rG/kiag13V1DCRLbW6eHhOXG4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6426
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jan 12, 2024 at 01:16:38PM -0800, Belgaumkar, Vinay wrote:
> 
> On 1/12/2024 1:10 PM, Rodrigo Vivi wrote:
> > On Fri, Jan 12, 2024 at 10:29:50AM -0800, Matt Roper wrote:
> > > gucpc isn't initialized when skip_guc_pc is used, but some of the sysfs
> > > frequency entries still try to grab the uninitialized frequency mutex
> > > before realizing that they need to bail out.  Tweak the init/fini code
> > > flows so that the mutex is always initialized properly.
> > hmmm... good catch.
> > But I honestly don't believe we should be calling/running any function
> > that is trying to get the freq_lock. If guc pc is skip, why would we try
> > to communicate with guc to get or set the freq?
> > 
> > The shared buffers are not set and all. We need a deeper decoupling here.
> > Vinay?
> 
> Yeah, the frequency related sysfs are definitely not being created when
> skip_guc_pc is set. @Matt, do we know which sysfs entries are causing this?

Looks like I was running a build from a couple days ago before commit
"drm/xe: Check skip_guc_pc before setting SLPC flag" landed.  Without
that patch, the frequency sysfs entries still get created, even when
skip_guc_pc is set.  Now that it's in place, this change probably isn't
needed anymore.


Matt

> 
> Thanks,
> 
> Vinay.
> 
> > 
> > > Fixes: 975e4a3795d4 ("drm/xe: Manually setup C6 when skip_guc_pc is set")
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_guc_pc.c | 9 +++++----
> > >   1 file changed, 5 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> > > index f71085228cb3..67ce24fae79d 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> > > @@ -964,11 +964,12 @@ void xe_guc_pc_fini(struct xe_guc_pc *pc)
> > >   	if (xe->info.skip_guc_pc) {
> > >   		xe_gt_idle_disable_c6(pc_to_gt(pc));
> > > -		return;
> > > +		goto out;
> > >   	}
> > >   	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
> > >   	XE_WARN_ON(xe_guc_pc_stop(pc));
> > > +out:
> > >   	mutex_destroy(&pc->freq_lock);
> > >   }
> > > @@ -984,11 +985,11 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
> > >   	struct xe_bo *bo;
> > >   	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
> > > -	if (xe->info.skip_guc_pc)
> > > -		return 0;
> > > -
> > >   	mutex_init(&pc->freq_lock);
> > > +	if (xe->info.skip_guc_pc)
> > > +		return 0;
> > > +
> > >   	bo = xe_managed_bo_create_pin_map(xe, tile, size,
> > >   					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> > >   					  XE_BO_CREATE_GGTT_BIT);
> > > -- 
> > > 2.43.0
> > > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
