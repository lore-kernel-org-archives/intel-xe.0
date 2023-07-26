Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA4BC0015E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 17:08:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C7110E4A0;
	Wed, 26 Jul 2023 17:08:06 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A48A10E02F
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 17:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690391284; x=1721927284;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oFbcjo1k2qIvEfvLRneS5Km6y0ls4Oidc0OJ1EtSGho=;
 b=kWdjpQfORZx40t9ImHGos1lhOrp7i4YaattK4+TQ1EJLOJSSa3dAV8Vi
 k/IZ3f4O7X81FPTUWopc19I/KEwQDX0DODElZ6SH5dkNWBPuUEtB+pB66
 xT1rmjEVejKsmaBBETmWacma9ypIWBCUpus9Pdwf8OSJSjoH03yRoDfRF
 5oFUWvkGUzsdgHXPI2cwMwGt8x0WLP+L6Fhin+P/RqkL5f8tVcToLUwM/
 MQoEsLDoCyc0MaJkxZsWJwpu9PHM8GTrrs+F00WC/6slboddH+PxbuaHL
 W+OSRNzHVIuuFoUFfrPfK1z0SrAihNOe8fJW7bFFrbPz+x7WEmUI1+G3s g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="431878907"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="431878907"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 10:08:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="973201360"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="973201360"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 26 Jul 2023 10:08:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 10:08:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 10:08:02 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 10:08:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ejz1qFJl5NgFvovd0KHI4CYucO694q1oVaLKC94vn0IFd2yHjWmdg/Ntf/zw6hVZG3eqX5ZJYS2xHLbgiguK56G7ESLPHg8EAbiTPoYlgY/v9EiTyb9BLbC0Jc9n++mzAWm8K6B6i4PpohEsbp1vYygoPzFhPD07pPxT2eD3hz8gczioyUSafPv3vZl1w7ygHSpjuRumdkgqzk1gpIzCvDjUcQWLTZV8R1OU7yScR1akYsyKcjIdhxwxCOlNmOMKQntdES92IYnf4mGC9fDgnUPQs13j73fqLYZXioVOXeiqJSn3s+7QZGyIUvxJ2LpLKom5OtL8MRPv2cDbt3aGAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3bPUWo3maWxEczDl3bCTZX9NBAKbxBud8KNK2bb7uLc=;
 b=gYgCjF6Ps3tDwbZgjffirSUavQ3D9UoBS1ocS72fwgivDzq502uUoDkA4Xe/xY9yoWyN7ro0+MberxPQErCCrigu/ouFddzsmeQytcAYab+2VsIGHVdYFR1WAFsWapJKZtICcCo7vqfPeKaQhyMTlpqJY447QjDTC4YIvdXVc4qn6oOLnD3SQ0CFX8RzwEZdJJBdwEuEZO1aghPnx33KmXCjNP545dvF8/4QhkJOpUT+ZGq21XPTVrD9k1ANnTUKTBRUbwG0xSswXYYijWpl+/rF3iHjE5WcCZGklTN1ZGTjyIkBUkM+vkQj7qRhJfeMR0WCMMe6BUEOAICFA2j6WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA1PR11MB7038.namprd11.prod.outlook.com (2603:10b6:806:2b3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Wed, 26 Jul
 2023 17:08:00 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 17:08:00 +0000
Date: Wed, 26 Jul 2023 10:07:57 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230726170757.GS138014@mdroper-desk1.amr.corp.intel.com>
References: <20230726160708.3967790-1-lucas.demarchi@intel.com>
 <20230726160708.3967790-10-lucas.demarchi@intel.com>
 <20230726170404.GR138014@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230726170404.GR138014@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR05CA0108.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::49) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA1PR11MB7038:EE_
X-MS-Office365-Filtering-Correlation-Id: 94a8a772-28ac-4c91-ff7b-08db8dfaddab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cvmd/kuZF0sp9Pc3uEBhisAjyu5V43XMfAuh/emjIiRBMpuJhxsMGb20prhNeuGdmGPRRAv54d3aKmqXeQygtfEeqkB8Zszrol5kd7ACCGjr1S4fmnhWQCxRtUCjcjPKn/M1QwHYbnk9lyPD1OKUWwDklEV49sJtwf78O1WIgwx0SDgglk2TNXvP4tOEfKrPou6uj35rT/rdJx8O/ySjBihoPmOczBc4LF6rrKTw14ETknc3+fIR6RK1ZOuUJwLDlpJ2cXXeUpdXKONFOAB+akEPkatnshrCs6twhrVruHk/hKhvp2Qb/MUFdHs5fHQDIszRFHZoyfDloGqva2mVJSDplbR6Fw8a/VjF0l4EzDbO9CoJCNbKw/w1WWdePfMzdTQmcrHZMAliiEOqxQNPh9or9lZ7G5N6tmAH1Nm7Jftf57LqS8tmKDbb+E+XYofS84ji48KzJWjkxHEL082dBNpzo2TJVJK0zzRTVAZUCiF4Z2s5YRPikOAEqiOP4ydKf7+v8aj6X2mkHGQf8O1tCfoWeBHCes9nz5VRrxCGvB+bxyg2+dVnzaJh2AgmLzQp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(376002)(136003)(346002)(39860400002)(451199021)(1076003)(41300700001)(6506007)(33656002)(186003)(478600001)(83380400001)(26005)(86362001)(6666004)(6512007)(2906002)(6486002)(5660300002)(66556008)(66946007)(66476007)(4326008)(6636002)(6862004)(8676002)(8936002)(316002)(82960400001)(38100700002)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z360/ovi7d3Zl+lMzx03RAiQ2kyvVq2TbBhPuCA7NIerOEXYTaE2Sh6IJkuU?=
 =?us-ascii?Q?/GfkN9zo5P4CS8lSYt1MfXuxFjPjaCfbwIAuusiGfoZC4GjOGkYMnAhs4srW?=
 =?us-ascii?Q?ZPf915J42Kp6Mw3AW6zAnQynaP7/+D8K8ZHIkCdhhC8Qpelqhjg4r4HWmx+x?=
 =?us-ascii?Q?0PgQKtlLKM+NQH5sTcYu2ddwmkKTW87Chp3Nac7jvP1w4irAeGS3xZpswbCX?=
 =?us-ascii?Q?GJ5e8lfjZotfhHiQKptuHXzJMFknLvpLGdDtU0vyWu+oZ/p47pMWgC364hSz?=
 =?us-ascii?Q?WGdYzi6NCz23OorowtV+gmFv5EhuL7UjaYm5C3bfDZSgm7z/+UoD1O9zP3HV?=
 =?us-ascii?Q?4VcmxCs6DcBD0WrL15/yOsqefsJZAxzpRGhkZFEuwD8HbuAYDJXwVtIRpZce?=
 =?us-ascii?Q?uWGkJSy9CgA3AtPQxO324vm3ZaOCDW1Cn81BInqFYWy/4Ruqw7VwCgi0wbF4?=
 =?us-ascii?Q?3dByJoQbjwCinpkMZ0lHWsAxtIvmBdkf1n1oDKdBXNvUF1HIhTcoVJxKDFFs?=
 =?us-ascii?Q?dnhbeFOiXEruceXCA/TgElWhLrqpWYHOKOz8OBj9olTBx+nvJCF9nqoycKlC?=
 =?us-ascii?Q?dffEnITwyZCKFs8Ki1Pca7qI0971l/5nJh8TTMp8gowTLB64h7yaFZGrLBn/?=
 =?us-ascii?Q?vkeZgC3wOE2Y5MjzeyBu8oZou8gaYcd8ICbcRBY10vxpEUWi1u69k90IJSgz?=
 =?us-ascii?Q?wMDmrqhC57MzxfL74/0dO3RIy+y8WiPb6bvqkVfBTQ5oglsXBjAoOlI5x9bR?=
 =?us-ascii?Q?4alMG0SUY77FZwv0MbjvZ6NdxTa142WQ8OugnDOvxh1EJ1kSMkNcvfTZHAb9?=
 =?us-ascii?Q?UTUPdmP+CLTUGEgIVzAmYSSPPNoA6lD/Uc1Z8LKo8GBhQAusxGx2ir6nFfb5?=
 =?us-ascii?Q?GL66cVaoIANQByvk+eDXaJYs5p4R3eBOe3Agpk1FQ5ufNHwpmTxAieQK4EMX?=
 =?us-ascii?Q?tmeYJ2f/Yzn2llEl5+gJFRk/juaNRP2Ic5BO9Kl1hkRWl+6DnWtblnflBN3R?=
 =?us-ascii?Q?0siNHYevZ0fwHlvKLqSo37tn9Y85v83KMxOUySR9ps2I0oD32f+VW4qNBfX9?=
 =?us-ascii?Q?phNlaEzTafQFJdAXxVMTVtJAx1+PBz8eR4qfWQw5OnJCEu7Mrn7oB//xUg22?=
 =?us-ascii?Q?o8rJFVsFd9wWjypG+uVZdwPBjGidIaQkDJHiRcFUMxn4GW6xD5LHpdftLpjT?=
 =?us-ascii?Q?uW8rKEDEAUYIUIIasnFixqTW8inuITRG5sPiti0ccQAv0vTTHx/qqCu/r3xg?=
 =?us-ascii?Q?KnhR5utE8+74517AQ37AJUm4IDKp8n4j4Vb3tyeWMTQEZ05jBgktqgok0GLB?=
 =?us-ascii?Q?6e4qzIbbho0FI+cFSPEL0MYKjbBV92HJ4Q1aVgn/uaJC3Ya7TdypX5vM7CMD?=
 =?us-ascii?Q?HWeGa3idTOBF/P8yyU20XbK1vA4yaoMYVj5yhueJkYoIBGa5qO++uLs0YQSF?=
 =?us-ascii?Q?wmsGR9OW6A11KS2ITdOJWR7WKXarcqgr/39AnjbK4Cc6f+1AlMNxkeM+ZL9p?=
 =?us-ascii?Q?QZ0hJC8REV2JGP62+qTtdhKZMbMB7oT3hh8pvphH6SjO5OasisxQYUHbvZ43?=
 =?us-ascii?Q?Oze+swSBuhc55MI7ki4qLGYDfOlKtVv9mRnLMW2ro5nYBGG7yd+uDCz4xezR?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94a8a772-28ac-4c91-ff7b-08db8dfaddab
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 17:08:00.4719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4QOxtd3pKAfR9KYl9wxJCYamo1T4xgY2zKRIKn/0P8rlzSCR+ETuYq4KGw7imBj/47uC7rMGT9TcT8/BXd81Z3Fj4ShFQgAQTNV3/0oXbsU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7038
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 09/10] drm/xe: Carve out top of DSM as
 reserved
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
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jul 26, 2023 at 10:04:07AM -0700, Matt Roper wrote:
> On Wed, Jul 26, 2023 at 09:07:07AM -0700, Lucas De Marchi wrote:
> > Top of DSM contains the WOPCM where kernel driver shouldn't access as
> > it contains data from other HW agents. Carve it out from the stolen
> > memory. On a MTL system, the output now matches the expected values:
> > 
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> 
> > ---
> >  drivers/gpu/drm/xe/regs/xe_regs.h      | 3 +++
> >  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 8 +++++++-
> >  2 files changed, 10 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> > index dbf572d11af0..315f6f8dadf3 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> > @@ -84,4 +84,7 @@
> >  #define DSMBASE					XE_REG(0x1080C0)
> >  #define   BDSM_MASK				REG_GENMASK64(63, 20)
> >  
> > +#define STOLEN_RESERVED				XE_REG(0x1082c0)
> > +#define   WOPCM_SIZE_MASK			REG_GENMASK64(8, 7)
> > +
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> > index 271b3fba4129..7bba8fff5a5d 100644
> > --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> > +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> > @@ -89,7 +89,7 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
> >  static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
> >  {
> >  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > -	u32 stolen_size;
> > +	u32 stolen_size, wopcm_size;
> >  	u32 ggc, gms;
> >  
> >  	ggc = xe_mmio_read32(xe_root_mmio_gt(xe), GGC);
> > @@ -124,6 +124,12 @@ static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr
> >  		return 0;
> >  	}
> >  
> > +	/* Carve out the top of DSM as it contains the reserved WOPCM region */
> > +	wopcm_size = REG_FIELD_GET64(WOPCM_SIZE_MASK,
> > +				     xe_mmio_read64(xe_root_mmio_gt(xe),
> > +						    STOLEN_RESERVED));
> > +	stolen_size -= (1U << wopcm_size) * SZ_1M;
> > +
> >  	if (drm_WARN_ON(&xe->drm, stolen_size + SZ_8M > pci_resource_len(pdev, 2)))
> >  		return 0;

Oh, actually shouldn't we do this WARN check before we slice off the
WOPCM?  If the GSM + DSM (_including_ WOPCM) is larger than the size of
the BAR, something is wrong.


Matt

> >  
> > -- 
> > 2.40.1
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
