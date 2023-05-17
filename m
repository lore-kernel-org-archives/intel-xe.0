Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFA2C7EE22
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 22:43:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02CB510E2D7;
	Wed, 17 May 2023 22:43:18 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9AC10E2D7
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 22:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684363396; x=1715899396;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=H2jZTZjm3IyEUvumK/sc1oNnkDFbV/8qyf7X/Lh8TjE=;
 b=U/XWwjXe0bPEO6VIu0quFb4jI/YEHFp10IQxKxM1e7zcLsB5rkpapCr0
 Qr+Rl9YZqRjgiNbNX0hVCdp96Lajubc31NkqV0ZXll9lhsA+v7ag7p7vi
 Ak5CdUlr8l1gUL8P2UH5aPfy+m0KcVgepGNxmn1pcwtmlGybl9R57JOb+
 cC4VimicQbrKGZ/c6otC9aN3QUxNRYH6LtUJzqMpgmfEtkbJ+SQ0PQQGi
 B0sF93NHYxmi45Iw7GmLAJob1nzpQe9yRyNywK0WjQnLb2BwWgZ4gvs5j
 87aALuRgoTP8Em3smAn+oNKQbR3oY7RTXuHMC50D772sYCYS/fDBJSYPF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="350729023"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; d="scan'208";a="350729023"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 15:43:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="791679486"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; d="scan'208";a="791679486"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 17 May 2023 15:43:15 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 15:43:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 15:43:14 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 17 May 2023 15:43:14 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 17 May 2023 15:43:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fM887k99IG0XS3FxIX3P+Zvbgr+PxLnJNtYgpTxjEpXGhaGR8wuX8hTbC1lhRF7ouAwObYuyNSH5vHxJ+zXDt/ddPKqDIrq7+Yd6TPUeU6r+S4xpNVmwHym65SSTUVbb3F6za3iFOcweLxJa5raZULvenvefu7Mix+h9TUBvTStAyKqFm3pYnpDD8APsE3eF0R5tY8W9ptTMOc6/XzvOp2BczeRq0F9dDTiU9Osw6X8byBok6uvMHqFvJNm0InuizHrMBPMgqExetZ20Ly+sUz6MVyHEVT3ogXyRh0y3ZpA4M10UmzzQweKwlv4f/Lvj9f9/AshSvAmbr8trNqg0Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R836NrpAQ1TYwQY81IDHjSDkYyQ8f7S4PqUrQ3J0I7Q=;
 b=Yy0JoA0iC5mpThHuc3za+GIPYJ2/rzd/tgCGYemRbCLtK79GoHzWyiLNnEUPrgNtvmY20ZyXBhiw1n9s61YuplPWW/eTKfLKum10w143dG1lM/kOHf9e1cvUNkKs0uvUPqzSSJT0dfpGw5XWqzydknquDX7jq/s0qC+56OG7Debhv3f0r5SNzplNgZmbLwweagAmnjavjy6xzRbB751Xj/WSANCpnrBtiyDwvaukyOiFVIMijcmsa8qebrKd6aY11oi4JM4zwDt4Y82k/tDgCapmZ1WZWfKFDfLuBOInDX99tNCzon/rc9aEJnqB+HU7zfesFdmrR5wJIRv3IPApNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ0PR11MB4831.namprd11.prod.outlook.com (2603:10b6:a03:2d2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Wed, 17 May
 2023 22:43:07 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6387.030; Wed, 17 May 2023
 22:43:06 +0000
Date: Wed, 17 May 2023 15:43:03 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230517224303.GX10045@mdroper-desk1.amr.corp.intel.com>
References: <20230516221950.3512818-1-lucas.demarchi@intel.com>
 <20230516221950.3512818-10-lucas.demarchi@intel.com>
 <20230517212552.GV10045@mdroper-desk1.amr.corp.intel.com>
 <vlbnya333jberbzm7w2wuqmpmt4lox5hscmm7gogesfttkgdnz@sctx3xxxtxk2>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <vlbnya333jberbzm7w2wuqmpmt4lox5hscmm7gogesfttkgdnz@sctx3xxxtxk2>
X-ClientProxiedBy: SJ0PR13CA0030.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::35) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ0PR11MB4831:EE_
X-MS-Office365-Filtering-Correlation-Id: 5207365a-0627-48d1-db77-08db5728149e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AMMArcW0SHrS9AdL7idCW0+0DRFgHkF0TvbOYsmjgdW9YksVDn60GIX2Svs1modS5rnFnUhSJfG6wec9Dex71vft85ln8XUC2AEtsNp0CCQI2Awirg/qa+JifRtp63vzVSrHiUF7PLhSzp1F31qqvAmHooTMqbPpZD9OVzihECWojejCdf0uIBJz5/+6g/0OWNu9Oji2debu4RMKHLnKgql3q5/siDhgo/BzraWxr8t9oB56iZVG+vnGSCfN3rRc9uNjr4IF5ypRzPpoDj91o96udYfz10R0UWDztiZrz+mFBiRwm0v09q/udWD2MCm/nIg7k6V5REBevTugLsrLaJ+cWqqgSTgGJY5wBEnN2ssrCut3ck2XHAiJPZmA8vnrqmYGAFni/ZU9eyqPwtFV28jocrMOns4JeLFGxE5iDOwXl1d3ol6pa7RLOqFD//vui68EmylClo26BEE/vk999GazJCTUrw+T5tVrqVSKHbmoL8vA1wUok5D6EYUWR5JhkDaXYddDGU4QziSJ3y4U9WciLKU3jauhWlINuDqO8QEz34PBhHdzTucXde3J4xo7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(39860400002)(136003)(376002)(396003)(451199021)(82960400001)(33656002)(41300700001)(8936002)(5660300002)(6636002)(83380400001)(30864003)(6862004)(8676002)(2906002)(316002)(86362001)(38100700002)(66946007)(4326008)(66556008)(66476007)(107886003)(1076003)(26005)(186003)(6512007)(6506007)(478600001)(6486002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+W2HCpvgko47oXI/RNEjPnW4dm3ElKXempGr17EAJRg5YV0hABxvVzTelFxo?=
 =?us-ascii?Q?E+Rfjr2WY3LOJ9MNRelgAIkBZqCwdGlEem1JedH1rVA5BD/RNtM0Ef32YrqK?=
 =?us-ascii?Q?zeQjKblYonDzG5aidxLsb07iqr/tMNphH+pkwM6vfRtK9WyQiG6YasuB183T?=
 =?us-ascii?Q?1n3/iFmIYw5UPwcLWKg9IfBJ/AS1T0aNGik30SM5Zk6Mfclv7lgzx055ML2i?=
 =?us-ascii?Q?gp66TcKIWbDweSww2uK91PICFd1t79/hSH+90s68q00/pcYtQfyA6dCwkMQK?=
 =?us-ascii?Q?sTZ8UVhi2nKaxF0350gagpx8bvSgSsdv4SstqTJJPyoorhUwW8DfYsksDtYG?=
 =?us-ascii?Q?O/0v8HB4sTCjAeuDg8gnX8PCkuttrQakOGAt36ATbHr72PmSxI0SjNGbuPJB?=
 =?us-ascii?Q?1nyB62gEpU1693Q36gNG4h84p2dBMcfZtfPWStdRYA2BUHFrBX9o8aaaYtJG?=
 =?us-ascii?Q?U0fymldX4jXFiLIp2dFDfePO8JVEhRabjOg45lL6t7PABwmp+Ij8qaXyABuK?=
 =?us-ascii?Q?OUto1FAhq8e7Pd83hl1nNf584g/bKCxKyG8mOQ6H6hJPV83f+HwaJlPXd2Su?=
 =?us-ascii?Q?tgHzqZ/GA3cGCW3AjBdJFaEu0/tWBrC/N9mMtIDScG1HFjSJzorT6xxJxaS8?=
 =?us-ascii?Q?7LYTbd0+LHV58Qbl2Bv3hlIDLvwT2zNTfLzQtAhtwCz5ZsiBNgKBPXoLKeED?=
 =?us-ascii?Q?FrP1tt/zRXA9dIAw/fKlUyMKdt1TwlUIPQ4ZpPOr+gu2kFwhU/p51TMEYup3?=
 =?us-ascii?Q?mMcItQIxwqiOCXSTTpk7kiJKeEku7oYyrBQWJDu+h7m0z9vsjbAoJx83+QZ0?=
 =?us-ascii?Q?n1Dz2ZH8YuSuLMWtqhQTm7Hyc8wNGAdrXXq7Cq2sMz7CuQURFu4GIoueLGBK?=
 =?us-ascii?Q?nJzDkf9Cekfjd+yn5uK3xdd544GvohZRdAVPywu6v6p60CdyvYISSLExQbSM?=
 =?us-ascii?Q?ia+A/sgG+fKZtZxKat8Fbr1JlsmFZtzP2BPGX3pkYJVSDPwzh4JtZzVAdavi?=
 =?us-ascii?Q?bu8QBtkTgMsf0NOvPmA60no8mEoqtNypoZEdUTeATH/s0wlV98BOxmEEAqwq?=
 =?us-ascii?Q?2CV8JZbwydWEa+eMocFROWYZ9J7DjE0uHZ2B9vX5GsfubKxs3ekBqdDiCLTP?=
 =?us-ascii?Q?vAj83q/+NvnKO0rYEMSxmgIxODa/bN4n1lfRrJSWiDX5lRoIS+Ps46r7ekXG?=
 =?us-ascii?Q?9CIlR0aLlUS1bzDGyklq/XCyx+i/Skm9SE5R+9AmzG8JjYXNZyfd/2d7ZfEJ?=
 =?us-ascii?Q?9UIdRc8oYyINajbzRO7zVEG+F/VMoow6Jlg6B1Cd9fBPwYa7ZaDAFGMuU91O?=
 =?us-ascii?Q?IEKR9aS/sEgUWayRYsnv6wJWP5OkpTAQ7PpPO0LGOdnvvuZnLrGBlvk9qkHv?=
 =?us-ascii?Q?MwIoH6Z+ja64Hwad0wkx9+ElwxFkyD8lRNm9TsOjQPDJ+/JXJZydVO6cNx7y?=
 =?us-ascii?Q?Ylhezlc5QicTflezg+O+0+fNcL8Zi2Y6NpqwGZ+zrP5U3O6IkccQCV7mt7Np?=
 =?us-ascii?Q?h4r0kLEcaUqHv9JfdioTS5+mr4hGDO+BrLZv52Rvw4hTipk1N6ibF+G3/8OK?=
 =?us-ascii?Q?nJTyHv3DpPgPjVBlxvWulYVykQNi8i7zkiQl0H2KdBPgWygdM6nSQGdqscER?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5207365a-0627-48d1-db77-08db5728149e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 22:43:06.1186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wrshGshM/hzyHPEf4nBAo1gOMpN+hXlgy9/qpUMouiawX/rctQeMm3Dad5hcv6pIHnnyCj2SIZrriQz+eorfnTHAwHci4lEl0yIzC3B2UT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4831
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 9/9] drm/xe/guc: Port workarounds to OOB
 infra
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

On Wed, May 17, 2023 at 03:25:07PM -0700, Lucas De Marchi wrote:
> On Wed, May 17, 2023 at 02:25:52PM -0700, Matt Roper wrote:
> > On Tue, May 16, 2023 at 03:19:50PM -0700, Lucas De Marchi wrote:
> > > Let xe_guc.c start using XE_WA() for workarounds. The one missing
> > > workaround is left with a "FIXME" since it's not properly implemented
> > > yet.
> > > 
> > > Also, some changes were made to a few workarounds:
> > > 
> > > 	- Wa_22011383443 not implemented due to being an early PVC
> > > 	  stepping. Wa_16011759253 that has the same condition is the
> > > 	  one covering DG2.
> > > 
> > > 	- Wa_22011391025 and Wa_14012197797 were split in 2, since they
> > > 	  cover different steppings and we do want to report both as
> > > 	  implemented. The latter may eventually be removed due to being
> > > 	  early DG2 steppings, but the former should remain.
> > > 
> > > 	- Wa_22012727170 and Wa_22012727685 were split in 2 so both of
> > > 	  them can be reported as active, regardless if they (currently)
> > > 	  have the same rules.
> > > 
> > > 	- Wa_16015675438 and Wa_18020744125 were not checking by
> > > 	  platform or IP version, hence making them not future-proof.
> > > 	  Those workarounds should only be active in PVC and DG2,
> > > 	  besides the check for "no render engine".
> > > 
> > > DG2 system used for test:
> > > 	XE_DG2 G12 56b2:0001 dgfx:1 gfx:Xe_HPG (12.55) media:Xe_HPM (12.55) ...
> > > 	Stepping = (G:A1, M:A1, D:C0, B:**)
> > > 
> > > Output is as expected for the current OOB workarounds:
> > > 
> > > 	$ cat /sys/kernel/debug/dri/0/workarounds
> > > 	...
> > > 	OOB Workarounds
> > > 		14014475959
> > > 		22011391025
> > > 		14012197797
> > > 		16015675438
> > > 		16016323070
> > > 
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/Makefile        |  2 +-
> > >  drivers/gpu/drm/xe/xe_guc.c        | 43 ++++++++----------------------
> > >  drivers/gpu/drm/xe/xe_wa_oob.rules | 16 +++++++++++
> > >  3 files changed, 28 insertions(+), 33 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > > index fcf04951a309..07af0d022263 100644
> > > --- a/drivers/gpu/drm/xe/Makefile
> > > +++ b/drivers/gpu/drm/xe/Makefile
> > > @@ -38,7 +38,7 @@ $(XE_WA_OOB) &: $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules
> > >  	@mkdir -p $(@D)
> > >  	$(call cmd,wa_oob)
> > > 
> > > -$(obj)/xe_wa.o:  $(XE_WA_OOB)
> > > +$(obj)/xe_wa.o $(obj)/xe_guc.o: $(XE_WA_OOB)
> > > 
> > >  # Please keep these build lists sorted!
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > > index 1b5d0b6ad180..252a4bfe6d63 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > > @@ -5,6 +5,7 @@
> > > 
> > >  #include "xe_guc.h"
> > > 
> > > +#include "generated/xe_wa_oob.h"
> > >  #include "regs/xe_gt_regs.h"
> > >  #include "regs/xe_guc_regs.h"
> > >  #include "xe_bo.h"
> > > @@ -20,6 +21,7 @@
> > >  #include "xe_mmio.h"
> > >  #include "xe_platform_types.h"
> > >  #include "xe_uc_fw.h"
> > > +#include "xe_wa.h"
> > >  #include "xe_wopcm.h"
> > > 
> > >  #define MEDIA_GUC_HOST_INTERRUPT        XE_REG(0x190304)
> > > @@ -136,29 +138,16 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
> > >  	struct xe_gt *gt = guc_to_gt(guc);
> > >  	u32 flags = 0;
> > > 
> > > -	/* Wa_22012773006:gen11,gen12 < XeHP */
> > > -	if (GRAPHICS_VER(xe) >= 11 &&
> > > -	    GRAPHICS_VERx100(xe) < 1250)
> > > +	if (XE_WA(xe, 22012773006))
> > >  		flags |= GUC_WA_POLLCS;
> > > 
> > > -	/* Wa_16011759253 */
> > > -	/* Wa_22011383443 */
> > > -	if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, STEP_A0, STEP_B0))
> > > +	if (XE_WA(xe, 16011759253))
> > >  		flags |= GUC_WA_GAM_CREDITS;
> > > 
> > > -	/* Wa_14014475959 */
> > > -	if (IS_PLATFORM_STEP(xe, XE_METEORLAKE, STEP_A0, STEP_B0) ||
> > > -	    xe->info.platform == XE_DG2)
> > > +	if (XE_WA(xe, 14014475959))
> > >  		flags |= GUC_WA_HOLD_CCS_SWITCHOUT;
> > 
> > Hmm, this workaround was already implemented incorrectly, but it does do
> > a good job of highlighting a shortcoming that we need to address...see
> > comment farther down.
> > 
> > > 
> > > -	/*
> > > -	 * Wa_14012197797
> > > -	 * Wa_22011391025
> > > -	 *
> > > -	 * The same WA bit is used for both and 22011391025 is applicable to
> > > -	 * all DG2.
> > > -	 */
> > > -	if (xe->info.platform == XE_DG2)
> > > +	if (XE_WA(xe, 22011391025) || XE_WA(xe, 14012197797))
> > >  		flags |= GUC_WA_DUAL_QUEUE;
> > > 
> > >  	/*
> > > @@ -169,27 +158,17 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
> > >  	if (GRAPHICS_VERx100(xe) < 1270)
> > >  		flags |= GUC_WA_PRE_PARSER;
> > > 
> > > -	/* Wa_16011777198 */
> > > -	if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, STEP_A0, STEP_C0) ||
> > > -	    IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G11, STEP_A0,
> > > -				STEP_B0))
> > > +	if (XE_WA(xe, 16011777198))
> > >  		flags |= GUC_WA_RCS_RESET_BEFORE_RC6;
> > > 
> > > -	/*
> > > -	 * Wa_22012727170
> > > -	 * Wa_22012727685
> > > -	 */
> > > -	if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, STEP_A0, STEP_C0) ||
> > > -	    IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G11, STEP_A0,
> > > -				STEP_FOREVER))
> > > +	if (XE_WA(xe, 22012727170) || XE_WA(xe, 22012727685))
> > >  		flags |= GUC_WA_CONTEXT_ISOLATION;
> > > 
> > > -	/* Wa_16015675438, Wa_18020744125 */
> > > -	if (!xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_RENDER))
> > > +	if ((XE_WA(xe, 16015675438) || XE_WA(xe, 16016323070)) &&
> > > +	    !xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_RENDER))
> > >  		flags |= GUC_WA_RCS_REGS_IN_CCS_REGS_LIST;
> > > 
> > > -	/* Wa_1509372804 */
> > > -	if (IS_PLATFORM_STEP(xe, XE_PVC, STEP_B0, STEP_C0))
> > > +	if (XE_WA(xe, 1509372804))
> > >  		flags |= GUC_WA_RENDER_RST_RC6_EXIT;
> > > 
> > >  	return flags;
> > > diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > > index e69de29bb2d1..060ff25496a7 100644
> > > --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> > > +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > > @@ -0,0 +1,16 @@
> > > +22012773006	GRAPHICS_VERSION_RANGE(1100, 1250)
> > > +16011759253	SUBPLATFORM(DG2, G10), STEP(A0, B0)
> > > +14014475959	PLATFORM(METEORLAKE), STEP(A0, B0)
> > 
> > In general we can't match on platform anymore for disaggregated IP
> > platforms; we need to match solely on IP+version now.  For example, this
> > workaround applies to 12.70, but does not apply to 12.71 and also does
> > not apply to the media GT for media version 13.  The old way of doing
> > things with subplatforms also doesn't work well anymore since we have to
> > be ready for this 12.70 graphics chiplet to potentially be re-used in
> > some future non-MTL platform.
> > 
> > A first step of doing
> > 
> >        14014475959  GRAPHICS_VERSION(1270), STEP(A0, B0)
> > 
> > isn't quite enough since it will still result in this workaround being
> > applied every time guc_ctl_wa_flags() gets called on a platform with
> > graphics version 12.70.  In reality, we only want this workaround to be
> > applied on the _primary_ GT if the graphics version is 12.70.  When we
> > loop around and run the function a second time on the media GT, it
> > should not be applied since media version 13 does not need this
> > workaround.  Other workarounds might apply to both graphics and media
> > GTs, but only specific steppings of each, so we need to specify which IP
> > to check the stepping for.  At the moment XE_RTP_MATCH_STEP can only
> > cope with graphics steppings in rule_matches().
> > 
> > So maybe we want something like:
> > 
> >        12345678900  GRAPHICS_VER_STEP(1270, B0, B3)
> >                     MEDIA_VER_STEP(1300, C1, F4)
> 
> 
> MEDIA_VER_STEP() has a implicit && I'd like to avoid with something like
> this:
> 
>         12345678900  GRAPHICS_VER(1270), STEP(B0, B3)
>                      MEDIA_VER(1300), MEDIA_STEP(C1, F4)
> 
> 	[ MEDIA_STEP() to be added and probably STEP() renamed to
> 	  GRAPHICS_STEP ]
> 
> This is the same as what you wrote, but without exploding on the number
> of matches. For instance I'd expect the next request to be the STEP +
> version range.
> 
> My idea was to leave this on the device-level and anything that is to be
> checked on the gt / engine level or in another way, is checked from
> outside. See the handling for the other WA above:
> 
> 	if ((XE_WA(xe, 16015675438) || XE_WA(xe, 16016323070)) &&
> 	    !xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_RENDER))

How would we write the condition if a workaround can potentially apply
to both GTs, but only to specific steppings of each?  E.g., in the
"12345678900" I gave above, trying to write the code like this:

        void init(struct xe_gt *gt) {
                if (XE_WA(xe, 12345678900))
                        do_something(gt);
        }

won't work since the XE_WA() will evaluate the same way both times we
call the function (primary GT and media GT).  If we happen to be running
on a platform that falls within the range for both graphics and media,
then that's okay.  But if it turns out the platform's graphics is
in-range and media is out-of-range, or vice-versa, then we're applying
the workaround somewhere we shouldn't be.

Effectively XE_WA() is only telling us whether the workaround will be
active _somewhere_ on the platform.  It's not currently capable of
telling us whether it should be active on the part of the platform we're
operating on right now (i.e., it doesn't take xe_gt as parameter rather
than xe_device).


Matt

> 
> 
> Lucas De Marchi
> 
> > 
> > that ties the stepping to the specific IP and version.  And then we'd
> > probably also want XE_WA to take an xe_gt as a parameter so that it can
> > make sure that gt->type is appropriate as well.
> > 
> > 
> > Matt
> > 
> > > +		PLATFORM(DG2)
> > > +22011391025	PLATFORM(DG2)
> > > +14012197797	PLATFORM(DG2), STEP(A0, B0)
> > > +16011777198	SUBPLATFORM(DG2, G10), STEP(A0, C0)
> > > +		SUBPLATFORM(DG2, G11), STEP(A0, B0)
> > > +22012727170	SUBPLATFORM(DG2, G10), STEP(A0, C0)
> > > +		SUBPLATFORM(DG2, G11), STEP(A0, FOREVER)
> > > +22012727685	SUBPLATFORM(DG2, G10), STEP(A0, C0)
> > > +		SUBPLATFORM(DG2, G11), STEP(A0, FOREVER)
> > > +16015675438	PLATFORM(PVC)
> > > +		PLATFORM(DG2)
> > > +16016323070	PLATFORM(PVC)
> > > +1509372804	PLATFORM(PVC), STEP(B0, C0)
> > > --
> > > 2.40.1
> > > 
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
