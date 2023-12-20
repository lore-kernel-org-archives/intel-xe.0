Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDADC3DA6E
	for <intel-xe@archiver.kernel.org>; Wed, 20 Dec 2023 15:24:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9135D10E5E3;
	Wed, 20 Dec 2023 15:24:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01DA110E5E3
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Dec 2023 15:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703085892; x=1734621892;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3GHNGFv/m2ISGQbSQs7hjVcpQ8kcP0ozMOKa5e3C9sU=;
 b=i8KRWByX4oQCUHPSSJDofRsIa4DyG1fjT/HxIw2aX2K5+K7VrUdaMLFH
 HtIC0n/RkNegoXkw9G1c68d1qWTNOept32BwSYpdg0MMvOK3sTiYtV9tN
 pgvwkp9z8EEFCgtfUu4ZYGX62yx1tQN3W8z5P2itciXde1ivgdMnGrD2N
 +3J3jL6Tfs7NmEPwxruWP7sg4iR+XN0t60X3L8RwVA6thzuj1bdRF9fZC
 zscPrS3picuozAVmIVEeanb4MqHRDA12OS83ryxxRz0e6OZNE4NCzxduq
 Zo6CbgerHjY+HRhc6z0BImVV3DklhB5vnaG2A1j0b3kSsA/7tlPFY7+tV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="482015568"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; d="scan'208";a="482015568"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 07:24:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="846762465"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; d="scan'208";a="846762465"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2023 07:24:51 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 07:24:51 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 07:24:50 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Dec 2023 07:24:50 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Dec 2023 07:24:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hpth4EvmJgTfjazNhC6OTzNg3Bmv3ejwSPUHMHHY6cvzQOrk5dIyFKzfOxARw+P2HGXdFB5DxAHcRQXSXpxHNH1YgqBluYONDq36Je3oXUl036l7WWhZ7h0Nf0MvSc1sSSkLjrQHkvl7VI6iUGDcisuc639HRmHLrmv22RlB4W3Ej1ys+/u2gf2Ek3t+FkLgTiRkT5gIeTJ9UG4MZf8h/ClIe/11l6YPYeIQ0g6tlPGUYKA1SfGa0Qh5tpz1i1D2XrveexsIAZV4/1Hz+1yj1HLFOIjmn9iPYGyXcFjln2ZdPmUWmCDObb2QHhL/MEqhMdKBHti73+8FomgOQGRVkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lwtmdNw7YfhjBdESINmTCBmk/yleAWN3G4vrYM5w2k4=;
 b=UkThlqzqOij1jyIq59EE1RKAeDqjzhYxLcVGjvRIXC1HXkqvsHYhFsmSdQMkwWI1N8mtSux6nacXhJbkfolhTp6avg0uq6Lq638zZ8ICnxgbuhXsQ2nfS7G2xgaLtxYwxnE+YIN87sQac5N/rvUKkD6lG8JaSBa05WCGvJTU+5TDy9uPIHnF1y7fUuDyfPCYsJAglY2TXcUoWghs9G9G4d8zuJSznwN4GykDjLqIWlLav2E0FvhPOe5QwZRUlGH3e1wUKIuLf8MqScbJ+VFL/a4jB7h6lthlLH7oQfUZLtOEcxtSCcwmU5ixELJSLnBNwpSb/vNlIwMc2s7E8GOLnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7850.namprd11.prod.outlook.com (2603:10b6:8:fe::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 15:24:47 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7091.034; Wed, 20 Dec 2023
 15:24:47 +0000
Date: Wed, 20 Dec 2023 10:24:44 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Subject: Re: [v5 1/3] drm/xe: Add vram frequency sysfs attributes
Message-ID: <ZYMHPHBxI10qqM5K@intel.com>
References: <20231219100711.645011-1-sujaritha.sundaresan@intel.com>
 <CY5PR11MB6211D392383C6898707C44D89596A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CY5PR11MB6211D392383C6898707C44D89596A@CY5PR11MB6211.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY3PR04CA0016.namprd04.prod.outlook.com
 (2603:10b6:a03:217::21) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7850:EE_
X-MS-Office365-Filtering-Correlation-Id: a643d99f-ebe1-4427-2b4a-08dc016fccf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2LH1nHpitW44B5wEKO0FU6vTi/SwOJVWw96GF8SwQvlcAjGfBJujgb0MMaTMAxmAQXFJEsp3zCy921Dq9Dm4wSVip3tQxV3J1Mj1XsIHRbBUX8qMxaQ/MJTqiGRGPG+YC/6Sad8R6F1W7YkHHY9txnLtcwzCWmi5FFgmYeGGzmcfN9Ya8cNJq3lKO6VdyFRzXuViKZlod/+J1R+T21OJJY4tEt434SeDf6QVQoXB2sUTf9xBkkuScHNpXv/Md0N6tCfiZuVk66iQ67Gx/8tlZV7v3aXGwNcRkuQqlJHyQJ7NdIynKBjdT8SxI0YvHDJBzSVHrAIVG3J0rIy2NQm5a7Bn6zsBQHYK7AfBMd0M5BU3NNA6z7WlhlchtzTwpVmxDvIO+qa7PmSYm15VRUxgQNzWUwYftYMdxomUDlgwVFH+wl/yIrNmFcEKz61us94QqgEroUZwFCke1k4kzojvcYD9VFUI9pbjQInASZ0zGeRTJmbW/jUw5Zm0OOcMvhNABl6YMysh8Q7sMDgyHCqeFojOg8m2wk8w2YxaxbPuVPTre8FenK1M8FBuuAXzEicL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(346002)(396003)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(478600001)(37006003)(66946007)(66556008)(66476007)(316002)(6636002)(38100700002)(6666004)(82960400001)(41300700001)(86362001)(53546011)(6512007)(36756003)(6506007)(54906003)(5660300002)(26005)(6862004)(4326008)(83380400001)(44832011)(8936002)(2616005)(8676002)(2906002)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aoJxzDNbadzP01DSNTkHPK4299jHnjJ4wwwPomb9TjvONpQNDm5AO73MAptS?=
 =?us-ascii?Q?HhXU8jMbGE1Jy27Rqc/9+mnaNzFpRPIzdkD9SRPtott9ZAa1co7vvy82Zz8Q?=
 =?us-ascii?Q?2KsPPA/TD4mCEuK+B9Pz5+kd2ZZnPifumILVw7d8ltvpqwgSlit33NQDl1xl?=
 =?us-ascii?Q?ke3o6cWx8GG4v0lSP2Kg4v4Ms/a6fy55WoBihxW8ovBjK7K3mF0V4MoHc2VQ?=
 =?us-ascii?Q?LRT/ZC0qXBwjtzdQ7AKEn3cIE6Wwd7QrSZhXKcI3lYYMPxNrLsjeF4ULgehy?=
 =?us-ascii?Q?+ImCKi1qxVvnytMDIW6bL8anzCFYKQgoiYRlrE1zN+J3P0ElHvoTshLMkINC?=
 =?us-ascii?Q?cr3fkrQksXG14qw6lAdl6JLWCicCrMTaDVNT+DBwUatb7i6rbNU4B/cVwcHo?=
 =?us-ascii?Q?M1MS+bsxdqobc8d3/aI6oWGuinxnmJ7O1K0mN8l+Cf/md7bmUe6BFVseF1Cw?=
 =?us-ascii?Q?2bDhQhTCN2NxvCDeMu3quXxlvf9d5dZmrgb2ZLq4gUFpGiKHyU1UlBfv99Bv?=
 =?us-ascii?Q?mzXxjPOaJtep6z48PP1rxy5yGxHz2PhIuO/h7r5nHpW2UZ7FXi572gyfot9V?=
 =?us-ascii?Q?S1yxpD0BNs+KnSnjjRYX5oTsIc+B2K5iN/8E7pTkoVyNBfjQAO9Fsrlqim4P?=
 =?us-ascii?Q?dRKgyECHqzzsLSzyHOX2yVEsjUVgyTXkn8o6n3TC/jSLH8tdMTPomx80MCSs?=
 =?us-ascii?Q?cPZrthG3nGd2aVQvNlgPxaPfB7ILbJ/ywHqP3jdraem2k4U97wGuVm1+Ve5m?=
 =?us-ascii?Q?xQq+v5yHPNdHMl30Qu6tdtbCFO9UwOfpF+6VAKjLSBUuuoZ2sH89hdn2ZroJ?=
 =?us-ascii?Q?rqNJFuHbXcH/4e9EhZv24+7fPbEoIOjYks6Vu+sdvpEvhFBXFmmcuu/m+QaB?=
 =?us-ascii?Q?I5nBtUAFJCGfOWA2IkTPiBebiAPlwZ/0VFPIwxZmzxsi/n3SUlprp+7W2G21?=
 =?us-ascii?Q?VQTNvBq+2pVRLAXbSiimuBuWXp/9F4yBZbe9d540eFlAV7/5dflKUSjBqCdQ?=
 =?us-ascii?Q?KrjjqbkpO9nLOd8txT9FvJKb9/F8topJaTOruHt1Zk1Jol0nIcaatws8gSAO?=
 =?us-ascii?Q?neoEchlOjJDx5A/Yn+EGlCv5Y9lR+JN/O8KRMSVfebnxL1q1bk+eYEX17/vP?=
 =?us-ascii?Q?6yFEawOmtldoW0Uf2UjJR4sgTvSptz0/ggiAmMqicmsNXX4hQ5UowM7exfzk?=
 =?us-ascii?Q?IAxEJjhufa6xxliGeazaIELT8FCL2ic6eyPm1y0h6OPwdN29CvygBn8yxV9L?=
 =?us-ascii?Q?sRLvFmt08Md230HDAG9f0XuLWsK07HimNvJ6XBFZ9JBIc7tJX5AAPdcJQxgG?=
 =?us-ascii?Q?DZ+RKFZlJtvJJJU57bIL7kgE2AuEE+/Qge1azc7RbNBB8VXjYf/TdA4T2DsX?=
 =?us-ascii?Q?bSkvEZepwC2qzY00Nd+B7ZmbEhobEdkkLDubiDZf4a+g1WVQii57B+BHQRC4?=
 =?us-ascii?Q?gR0momsNrsHNbzuhHaC4YoxAY79rAR9MUvKMXtVRuN5ufH2m2RCkAMFtKkjj?=
 =?us-ascii?Q?FhU8Afb5O70sMkjiWeE+wcwx3Qm8H9VKVg6kRI0A9b7ndcP2UQFiqbwaTrNZ?=
 =?us-ascii?Q?V0LubsRT7TmhA223fzPEbQYEEKp40YNwnTSJgSbs?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a643d99f-ebe1-4427-2b4a-08dc016fccf4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 15:24:47.3416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /J6klfnHN/1RPCI5GUmUdV5msw1rxL9TiC8zcNJofdwB0aWTnKL2y5SeB7gAknvAXO6dSo4zUbeBSDlEMX/m1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7850
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
Cc: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Dec 20, 2023 at 09:56:22AM -0500, Gupta, Anshuman wrote:
> 
> 
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Sujaritha
> > Sundaresan
> > Sent: Tuesday, December 19, 2023 3:37 PM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>; Vivi, Rodrigo
> > <rodrigo.vivi@intel.com>
> > Subject: [v5 1/3] drm/xe: Add vram frequency sysfs attributes
> > 
> > Add vram frequency sysfs attributes under the below hierarchy;
> > 
> > /device/tile#/memory/freq0
> > 			|-rp0_freq
> > 			|-rpn_freq
> Hi Rodrigo rp0/rpn for hdm frequency seems confusing.

oh! indeed!
the 'R' makes no sense there beucase it has nothing to do with Render.

> How about {max,min}_freq ?

but I'm afraid min and max would be seen as configuration instead
of the fixed fused 'Points'?!

with this in mind, maybe simply p0_freq and pn_freq ? which aligns
with the pcode mailbox definitions below?

However, on a second thought since we don't have min and max settings
for this anyway, min and max aligns with everything else... we just
make clear in the doc that it is read/informational only.

> Thanks,
> Anshuman Gupta.
> > 
> > v2: Drop "vram" from attribute names (Rodrigo)
> > 
> > v3: Add documentation for new sysfs (Riana)
> >     Drop prefix from XEHP_PCODE_FREQUENCY_CONFIG (Riana)
> > 
> > v4: Create sysfs under tile#/freq0 after removal of
> >     physical_memsize attrbute
> > 
> > v5: Revert back to creating sysfs under tile#/memory/freq0
> >     Remove definition of GT_FREQUENCY_MULTIPLIER (Rodrigo)
> > 
> > Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pcode_api.h  |  8 +++
> > drivers/gpu/drm/xe/xe_tile_sysfs.c | 86 ++++++++++++++++++++++++++++++
> >  2 files changed, 94 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h
> > b/drivers/gpu/drm/xe/xe_pcode_api.h
> > index 5935cfe30204..4076a4e9daf3 100644
> > --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> > +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> > @@ -42,6 +42,14 @@
> >  #define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed
> > point format */
> >  #define	    POWER_SETUP_I1_DATA_MASK
> > 	REG_GENMASK(15, 0)
> > 
> > +#define   PCODE_FREQUENCY_CONFIG		0x6e
> > +/* PCODE_FREQUENCY_CONFIG sub-commands (param1) */
> > +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
> > +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN	0x1
> > +/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
> > +/* PCODE_FREQUENCY_CONFIG param2 */
> > +#define     PCODE_MBOX_DOMAIN_HBM		0x2
> > +
> >  struct pcode_err_decode {
> >  	int errno;
> >  	const char *str;
> > diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > index 0f8d3e7fce46..1d34912e6184 100644
> > --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > @@ -7,9 +7,21 @@
> >  #include <linux/sysfs.h>
> >  #include <drm/drm_managed.h>
> > 
> > +#include "xe_gt_types.h"
> > +#include "xe_pcode.h"
> > +#include "xe_pcode_api.h"
> >  #include "xe_tile.h"
> >  #include "xe_tile_sysfs.h"
> > 
> > +/**
> > + * DOC: Xe Tile sysfs
> > + *
> > + * Provides sysfs entries for frequency in tile
> > + *
> > + * device/tile#/memory/freq0/rp0_freq - The Render Performance 0 level, which
> > is the maximum one.
> > + * device/tile#/memory/freq0/rpn_freq - The Render Performance N level,
> > which is the minimal one.
> > + */
> > +
> >  static void xe_tile_sysfs_kobj_release(struct kobject *kobj)  {
> >  	kfree(kobj);
> > @@ -20,6 +32,65 @@ static const struct kobj_type xe_tile_sysfs_kobj_type = {
> >  	.sysfs_ops = &kobj_sysfs_ops,
> >  };
> > 
> > +static ssize_t rp0_freq_show(struct device *kdev, struct device_attribute *attr,
> > +			     char *buf)
> > +{
> > +	struct kobject *kobj = &kdev->kobj;
> > +	struct xe_tile *tile = kobj_to_tile(kobj->parent);
> > +	struct xe_gt *gt = tile->primary_gt;
> > +	u32 val, mbox;
> > +	int err;
> > +
> > +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND,
> > PCODE_FREQUENCY_CONFIG)
> > +		| REG_FIELD_PREP(PCODE_MB_PARAM1,
> > PCODE_MBOX_FC_SC_READ_FUSED_P0)
> > +		| REG_FIELD_PREP(PCODE_MB_PARAM2,
> > PCODE_MBOX_DOMAIN_HBM);
> > +
> > +	err = xe_pcode_read(gt, mbox, &val, NULL);
> > +	if (err)
> > +		return err;
> > +
> > +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
> > +	val *= 50;
> > +
> > +	return sysfs_emit(buf, "%u\n", val);
> > +}
> > +static DEVICE_ATTR_RO(rp0_freq);
> > +
> > +static ssize_t rpn_freq_show(struct device *kdev, struct device_attribute *attr,
> > +			     char *buf)
> > +{
> > +	struct kobject *kobj = &kdev->kobj;
> > +	struct xe_tile *tile = kobj_to_tile(kobj->parent);
> > +	struct xe_gt *gt = tile->primary_gt;
> > +	u32 val, mbox;
> > +	int err;
> > +
> > +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND,
> > PCODE_FREQUENCY_CONFIG)
> > +		| REG_FIELD_PREP(PCODE_MB_PARAM1,
> > PCODE_MBOX_FC_SC_READ_FUSED_PN)
> > +		| REG_FIELD_PREP(PCODE_MB_PARAM2,
> > PCODE_MBOX_DOMAIN_HBM);
> > +
> > +	err = xe_pcode_read(gt, mbox, &val, NULL);
> > +	if (err)
> > +		return err;
> > +
> > +	/* data_out - Fused Pn for domain ID in units of 50 MHz */
> > +	val *= 50;
> > +
> > +	return sysfs_emit(buf, "%u\n", val);
> > +}
> > +static DEVICE_ATTR_RO(rpn_freq);
> > +
> > +static struct attribute *freq_attrs[] = {
> > +	&dev_attr_rp0_freq.attr,
> > +	&dev_attr_rpn_freq.attr,
> > +	NULL
> > +};
> > +
> > +static const struct attribute_group freq_group_attrs = {
> > +	.name = "freq0",
> > +	.attrs = freq_attrs,
> > +};
> > +
> >  static void tile_sysfs_fini(struct drm_device *drm, void *arg)  {
> >  	struct xe_tile *tile = arg;
> > @@ -32,6 +103,7 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
> >  	struct xe_device *xe = tile_to_xe(tile);
> >  	struct device *dev = xe->drm.dev;
> >  	struct kobj_tile *kt;
> > +	struct kobject *kobj;
> >  	int err;
> > 
> >  	kt = kzalloc(sizeof(*kt), GFP_KERNEL); @@ -50,6 +122,20 @@ void
> > xe_tile_sysfs_init(struct xe_tile *tile)
> > 
> >  	tile->sysfs = &kt->base;
> > 
> > +	if (xe->info.platform == XE_PVC) {
> > +		kobj = kobject_create_and_add("memory", tile->sysfs);
> > +		if (!kobj)
> > +			drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -
> > ENOMEM);
> > +	}
> > +
> > +	if (kobj && xe->info.platform == XE_PVC) {
> > +		err = sysfs_create_group(kobj, &freq_group_attrs);
> > +		if (err) {
> > +			drm_warn(&xe->drm, "failed to register vram freq sysfs,
> > err: %d\n", err);
> > +			return;
> > +		}
> > +	}
> > +
> >  	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
> >  	if (err)
> >  		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed,
> > err: %d\n",
> > --
> > 2.25.1
> 
