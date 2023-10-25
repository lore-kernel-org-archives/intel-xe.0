Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A004C0032E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 16:24:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D410A10E5C6;
	Wed, 25 Oct 2023 16:24:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4681810E5D4
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 16:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698251065; x=1729787065;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=U1rmweLpCJUrBwMhLr1qyffw1ilmpQh4Hm20BSwJgMw=;
 b=ktE/+PDelUUZzqNApDIuwJaqGqFeDEjHhMCc01WJX3+hASd75hlNPJWW
 4zXZJWy9ANUbkGipUTtfY2K46VQt3iKy3j3gyhpBMp20L1cKuP5+awi8r
 qpvde2Ig4CkUExa4b5NgUuwXPKF+K/eIiT/g/MrOPHEnePKj0tWH4/RJW
 kHZdjAMJjdZZo9WI7EIKy0xf+mf3boMsykqhJ3Kdo7xK2PuJMRdpxJLdh
 IAPlMsTHRyqtQBzskLC3Oyr0yeDhi9aUBBz9jrjixujLc5mhANiJtvrKV
 ooF8KT18KzpCXo4+NI/OH2zmcYjDfzTHjX4Jn1K15XiPZ4/TsgHwRGqoV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="384554279"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="384554279"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 09:21:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="137545"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2023 09:21:21 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 25 Oct 2023 09:21:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 25 Oct 2023 09:21:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 25 Oct 2023 09:21:54 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 25 Oct 2023 09:21:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QP+QOozlpkmWnYzxu6PTOvB2EBd98Fw+GgtFczPdrW8CWqskAo1VMgfTceg3yELnVIQlnp321PwF1cbk6dU0HTQFdxUEIxo9VDuaON70VyQT43y1piGzLr1Lev68GtE77BnsIoC/RYK3AalXMVpkLWWjd501ljjvopsYl/lloEj7Y6JUwEl/73XGtVIseTpCJXDMuANMuZp7n1qmcjrtDgLviW8rMJXWMZnVMVpRyIC1G0wvucaefY3hmAsPj9jY7iW8XBZgWGGSSkoK5tdzbetEaCBxb+WSP/WyiAFu9vbd8tsaHmgMxiLueTz8jomA/ELtsz5zWhjDH9ehfOV2bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGz2+AXwGCT4SWODYaKyqpE0F7/pA38RIRo6tHpRZ3M=;
 b=gjR/CTbepagr31zcxdQsGbLYywhVnzqsDt24jK2smejg82i3ZM/5W6D1H8vb2xwzN6KbBgO3D8oVSK2pCz20ANzVclyz7R/m++azmjUxO7b9FoAV6kpGTHMxmaqsBIuI1vWIXLtcYMp2tdR0xU2vANV3DUtKen5Iwey9kbHfLzztCLnNhSjrNeGaljc9cDA3gz4hKuTml5AMJ73LUwlxBthEKp1QiFCLi2xnvuxZ24aINmzWmgvKSquN5UsGx4fV9igfZIgFRoG5fnQ8+5QY/GHE53i91bOMyI6UNRrxoi3yXu/wu3Qgzb3tDlj7+W5RY39emu5LPjR80TEGk3dzhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA0PR11MB7791.namprd11.prod.outlook.com (2603:10b6:208:401::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.31; Wed, 25 Oct
 2023 16:21:52 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f723:f4d9:c12a:5b62]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f723:f4d9:c12a:5b62%4]) with mapi id 15.20.6907.028; Wed, 25 Oct 2023
 16:21:52 +0000
Date: Wed, 25 Oct 2023 09:21:49 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Message-ID: <20231025162149.GX5757@mdroper-desk1.amr.corp.intel.com>
References: <20231024220739.224251-1-lucas.demarchi@intel.com>
 <20231024220739.224251-3-lucas.demarchi@intel.com>
 <SJ1PR11MB620448F42F1A59535943B42781DEA@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB620448F42F1A59535943B42781DEA@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY5PR17CA0027.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::40) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA0PR11MB7791:EE_
X-MS-Office365-Filtering-Correlation-Id: a6e84419-b852-43b1-0daf-08dbd5767f3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: McaM3KFspGxq+Ov7P3R4YVpQtzCCBauC2YE9ecvufduU2ZNX9D4X6jtzl3ki3rflukAZg6iO1JQB+REYQYoM74GaRFZyjO6V2WpRA4rQbqyDguzT5A4vtyAJCjLMX37EjqkeBSCsQjbKdg1oKKUuMVXtjaKwLb8KOGNHzAEfgxP3s1UO/5l45ZUqvvOfGFPqt+0vZ2gL5m5DDUDXaXXyWCLdRD3a/uAhrz6EFIw9rUk/C1KaFk8aD+90pSCw0mWd3NQBMNxncDxkoQYiRSwMthN9Nd8XFadRVeKLgankQaw6YJxwfHR9orG/iva1cyDxT41bi4yornxFPC+ClmKoD/RTbYKMgMg2UYmsHw5p1DXwS2Zx/pnmzeHuNI0iwU5Dhjt8G6OYzLyXiB4VbuZXoZwZWsi2EAP8etHcVnzBP5bs81HAxuH1b2QUEjHgOdPMhCbh2njCGzdYIe+PIpBRWt0ambOT/NnH9HG0Cc3SBYGq4ggFGSiSOfiygFTYMwk+NwnphuYMBQLpTB4uzGxGwgbErwiOnxhb9fp+Lti7At9c+AF8JMApTTUDfBhav7NO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(366004)(346002)(136003)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(26005)(38100700002)(2906002)(5660300002)(86362001)(41300700001)(8936002)(66946007)(8676002)(4326008)(33656002)(6862004)(54906003)(6506007)(478600001)(6636002)(1076003)(82960400001)(316002)(66476007)(66556008)(6512007)(83380400001)(6486002)(53546011)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k41y8p0CqxyzNqov2SnD2ODwPoMV3Mmbe67bRHf0OReauYCHLTQV4oZQef0X?=
 =?us-ascii?Q?Nzj+sFGnxIjG9ymIY+OhT2KBcSOjfwQXBtdN3nhgyFuFS3ykwSSTGBKQXXtg?=
 =?us-ascii?Q?0YdfjNpRDCFr8RjVkNIPeBh2+WfatbGl27ie8ERwwvGxVyqtzJCdYkRuP94H?=
 =?us-ascii?Q?v/9kcdW67lDTWu3MZMgDcDRBdpmNNrAZWhKkQDRd6iFkgki/f8j0r06eknyW?=
 =?us-ascii?Q?/jcgD1Ghn4U3okMIwxXQKHMIsBrA3yT1tIChVpth5zUEYNy/hmHwcK5FnGAu?=
 =?us-ascii?Q?ReuKJLGrYxGS4QInHc2PWgFplQQDj600fXC5rtkvCZ887ju6S5Bk83Z10e6m?=
 =?us-ascii?Q?79cfkSRYdYeJ1ULh5dP8ZYWnLbbEma/zN6pT4wdtGPjTFCvO/5Ub8ZUS/l75?=
 =?us-ascii?Q?pugtd4oF6Ns1ESuv0+3CR0mwffiWnWt+b8Heoni9PdDdzrc61iTYFKtsAROO?=
 =?us-ascii?Q?wlOYC0xcIZSOqJNssyKEk5UEdUVPyhi3OjfU3YvHU0Fisug6OX78Zyje/DIg?=
 =?us-ascii?Q?Hftuy4pgUpWgJrcjIk3B3ayTJfW5MKMMtLgbFiE/qCkew36LTAzx1KIoUvXs?=
 =?us-ascii?Q?Syl1K9AmcEv8rnVoihmlBZ8yB/Gui5nerbvKdkDYsQ07iwICBBDI6eqomDnE?=
 =?us-ascii?Q?5q6VvZv37cAdigbQo8zVXctKLP2TziVd7Iwn0oePfNqer5fQnGI3VOWRc+hw?=
 =?us-ascii?Q?AV/J5RYgn5qGMzUfhDuhWbJy3eNO3rHZ7/hSrj8BeGLdFWBaZhOtAqxb2mOj?=
 =?us-ascii?Q?t1ntovOUqHdj0rTg3svgbEWdD5ZIn8zCt3UC8rrHF7nCHexHeZSVfkFLy7nY?=
 =?us-ascii?Q?vkcVel3h97Oii/4EcCJ83upK0Tuqx+jLsAzMJo5y9m8LaWbP1mD9onAF915A?=
 =?us-ascii?Q?Ug4Fi1v21qzowFck4nQKpRdhD17kmBZeKUJvCZZKlXDwPVK9goiVPp4FMngW?=
 =?us-ascii?Q?YX2vPNLfNYaBEdy3vqKeQsz/PN7Vhv2Jm0toEZCJ9th59w4jpOMcw6VfrZk2?=
 =?us-ascii?Q?rFT3e857SLXu378aLJdPkest8HLhTL6t5iObqbzF3p35EB+iNfPZ41M0APvF?=
 =?us-ascii?Q?9cwp06+/XTUwTnR9JAl5OH8Kj8LM27GIUG6RJglinKSpVgWPo30sKhyeEwJh?=
 =?us-ascii?Q?fm1kgRFx35TK3a+PKJWs0rantSxb/ZjQ6qxtzU398Xa735VnI1Xd1sB5rqa6?=
 =?us-ascii?Q?PGbjzYy/F2mcoBSeK6M5z5I2uzKP068CLUuZHvRfUHAfb7xKg9NltYm48rmF?=
 =?us-ascii?Q?KvSSIRBbytePei7V29CZagZ8Bgpraex2K3VNF/TuzmDRQ2qvGE0U4R3hnnVb?=
 =?us-ascii?Q?tDtth0fcQ46qWySSnYg5poCq4GAzrApYAnA17rCIXYyfBJ9CQ9yM7xo6RzCP?=
 =?us-ascii?Q?nOAU3Noo+6hhbjFTMVf2DWTeHTTgsYQeqx6ud983Y40QiHWMYvsecrGAd9fS?=
 =?us-ascii?Q?ITQvMw9582NVI/MPgDKFdOCMW5VpCsiYoJUH/7BZ/RbChFc+FK92ksGvDUbV?=
 =?us-ascii?Q?0Mw3Ir5tFGUijncDCHDeJwWIknLVgD0ed5zvS76haKtxmwf5I8Bq8MtIB3Y3?=
 =?us-ascii?Q?wZTTbzqDFQV72kA3EAWJO+HO3bvbVaCJIVqWDkYyNAa2ZL3jyRcl0YqlB26R?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6e84419-b852-43b1-0daf-08dbd5767f3a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 16:21:52.2285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jWJhpjjfP8TEqCcJd8qWN+X73rJMQF8WI173zEme2Qj7ChD6ztLx0KKCFH08E9nzN8icfHi0C8pgQI9+1JZrvIGu8GjU6W6kYx9Fep82GNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7791
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/3] drm/xe: Add Wa_14019821291
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Oct 25, 2023 at 02:16:04AM -0700, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Lucas
> > De Marchi
> > Sent: Wednesday, October 25, 2023 3:38 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Roper, Matthew D
> > <matthew.d.roper@intel.com>
> > Subject: [Intel-xe] [PATCH v2 3/3] drm/xe: Add Wa_14019821291
> > 
> > From: Matt Roper <matthew.d.roper@intel.com>
> > 
> > This workaround is primarily implemented by the BIOS.  However if the BIOS
> > applies the workaround it will reserve a small piece of our DSM (which
> > should be at the top, right below the WOPCM); we just need to keep that
> > region reserved so that nothing else attempts to re-use it.
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile            |  2 +-
> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h   |  2 ++
> >  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 24 ++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_wa_oob.rules     |  1 +
> >  4 files changed, 28 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile index
> > cee57681732d..ef9d954f5a75 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -37,7 +37,7 @@ quiet_cmd_wa_oob = GEN     $(notdir
> > $(generated_oob))
> >  $(generated_oob) &: $(obj)/xe_gen_wa_oob
> > $(srctree)/$(src)/xe_wa_oob.rules
> >  	$(call cmd,wa_oob)
> > 
> > -$(obj)/xe_guc.o $(obj)/xe_migrate.o $(obj)/xe_ring_ops.o $(obj)/xe_vm.o
> > $(obj)/xe_wa.o: $(generated_oob)
> > +$(obj)/xe_guc.o $(obj)/xe_migrate.o $(obj)/xe_ring_ops.o $(obj)/xe_vm.o
> > +$(obj)/xe_wa.o $(obj)/xe_ttm_stolen_mgr.o: $(generated_oob)
> > 
> >  # Please keep these build lists sorted!
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index 55ceadfc30b0..d542a4e2e6fa 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -155,6 +155,8 @@
> >  #define XEHP_SQCM				XE_REG_MCR(0x8724)
> >  #define   EN_32B_ACCESS				REG_BIT(30)
> > 
> > +#define GSCPSMI_BASE				XE_REG(0x880c)
> > +
> >  #define	MIRROR_FUSE3
> > 	XE_REG(0x9118)
> >  #define   XE2_NODE_ENABLE_MASK			REG_GENMASK(31,
> > 16)
> >  #define   L3BANK_PAIR_COUNT			4
> > diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> > b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> > index 79fbd74a3944..b23827534ab9 100644
> > --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> > +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> > @@ -11,6 +11,8 @@
> >  #include <drm/ttm/ttm_placement.h>
> >  #include <drm/ttm/ttm_range_manager.h>
> > 
> > +#include "generated/xe_wa_oob.h"
> > +#include "regs/xe_gt_regs.h"
> >  #include "regs/xe_regs.h"
> >  #include "xe_bo.h"
> >  #include "xe_device.h"
> > @@ -19,6 +21,7 @@
> >  #include "xe_res_cursor.h"
> >  #include "xe_ttm_stolen_mgr.h"
> >  #include "xe_ttm_vram_mgr.h"
> > +#include "xe_wa.h"
> > 
> >  struct xe_ttm_stolen_mgr {
> >  	struct xe_ttm_vram_mgr base;
> > @@ -112,6 +115,7 @@ static u32 get_wopcm_size(struct xe_device *xe)
> > static u32 detect_bar2_integrated(struct xe_device *xe, struct
> > xe_ttm_stolen_mgr *mgr)  {
> >  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > +	struct xe_gt *media_gt = xe_device_get_root_tile(xe)->media_gt;
> >  	u32 stolen_size, wopcm_size;
> >  	u32 ggc, gms;
> > 
> > @@ -154,6 +158,26 @@ static u32 detect_bar2_integrated(struct xe_device
> > *xe, struct xe_ttm_stolen_mgr
> > 
> >  	stolen_size -= wopcm_size;
> > 
> > +	if (XE_WA(media_gt, 14019821291)) {
> > +		u64 gscpsmi_base = xe_mmio_read64_2x32(media_gt,
> > GSCPSMI_BASE);
> > +
> > +		/*
> > +		 * This workaround is primarily implemented by the BIOS.
> > We
> > +		 * just need to figure out whether the BIOS has applied the
> > +		 * workaround (meaning the programmed address falls within
> > +		 * the DSM) and, if so, reserve that part of the DSM to
> > +		 * prevent accidental reuse.  The DSM location should be just
> > +		 * below the WOPCM.
> > +		 */
> > +		if (gscpsmi_base >= mgr->io_base &&
> > +		    gscpsmi_base < mgr->io_base + stolen_size) {
> > +			xe_gt_dbg(media_gt,
> > +				  "Reserving %llu bytes of DSM for
> > Wa_14019821291\n",
> > +				  mgr->io_base + stolen_size - gscpsmi_base);
> > +			stolen_size = gscpsmi_base - mgr->io_base;
> > +		}
> > +	}
> 
> Wont it be better if warning also posted here if workaround was not applied by BIOS ? 

No, the workaround is only necessary when parts are fused in a specific
manner.  The normal/common case is that the BIOS will decide that it
does not need to apply the workaround, and then the driver will also not
need to take any action.


Matt

> 
> Thanks,
> Tejas
> > +
> >  	if (drm_WARN_ON(&xe->drm, stolen_size + SZ_8M >
> > pci_resource_len(pdev, 2)))
> >  		return 0;
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules
> > b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > index f3ff774dc4aa..752842d734be 100644
> > --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> > +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > @@ -19,3 +19,4 @@
> >  		SUBPLATFORM(DG2, G12)
> >  16017236439	PLATFORM(PVC)
> >  22010954014	PLATFORM(DG2)
> > +14019821291	MEDIA_VERSION_RANGE(1300, 2000)
> > --
> > 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
