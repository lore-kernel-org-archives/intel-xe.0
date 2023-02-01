Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4262C05027
	for <intel-xe@archiver.kernel.org>; Wed,  1 Feb 2023 04:45:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 558A610E10F;
	Wed,  1 Feb 2023 04:45:05 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E883D10E10F
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Feb 2023 04:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675226703; x=1706762703;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+5ReZAEFVv0bE03Gaco35Lq+kGPOaw20UPeM5JMsg1w=;
 b=iaYlpA0MQ4KIfYJF2SI2lABR/CWRHjsic7wn6NTHr5RuVPD5mXZYktG/
 TxkOihYmuTDH9OVCRNsUORiiApBqEoD1/GjZFOU3stKQJyIy6w+Zh4D7A
 i8X/KZ9HvofnCQFhG1xg9Lh1Acw8t+7zKeVtI6h6Gsqmj/teBDQeUi450
 al4j/NTm5BzyrQvIYkKYEWLk0+YIIi1cBoxdUd+u6+CMRg8tvFf4I5ocH
 NOp3GKAK65LoSaUQW1hqd/PUDJVW1uPeFiMVOk9ivhqLTPqmnWN8oKXfj
 IppJ1QFM9z0Wnauuo/yy7h6ZZaJeV+e8Kv73+3Co5xtqNuHS7RO54TnWA Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="316011093"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="316011093"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 20:45:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="697087948"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="697087948"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 31 Jan 2023 20:45:03 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 31 Jan 2023 20:45:02 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 31 Jan 2023 20:45:02 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 31 Jan 2023 20:45:02 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 31 Jan 2023 20:45:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iPjU04eeHUStspaqxS4qS1w7U+zVIFWiXmiYVO9DQFcdD2NaMBKqgNy8URIsuZs0+vLa+FyTn9GOHvfUjQVTKunRYlv5BNO1k9qP/z+dcr7YELsioycztpuFreEKByDXnUumW3q6dEXUAOVWPRVluXhvMZzUsAPC7kqFt5ObGuaDhbc0PMA4EmcYyz5OV4GN/XoRqij3MIeb9TUPlaoCv2vL/OYa+gtjP4iqr4ebfFhJAfBG0949WUKlN3WDpqQ1cPsWc/c4/lFhBYlQB8R0K7Q0sxpQI647981FhrgNRiryvwi2R8oPChenD4/CPzm4G3sn3v8oQJfQXCcJepmF3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mfejfbQUWGFyRwHp4eGMNeNxHsOk9PRY9CmAQeSCY+Y=;
 b=c2y0Trb/R5mlkXBoZisTj/Vqxa7EfWVVEDO9YSLbGZSMay+t8wrxfDXZnYVtSyCOoqnO3hNlkzqbRPHo/Xucf8UN1LvygQPldnONXI6IQQ/EPbx90pw48cWcUcvBBceywGACez/8SVMJ/cJAeoOdDF3TTBYq8hsuXXsFl8LG/PiCHy5cUtPoS9k2N4Jaf/O/09yUEV7KTL+8UJ1CAX2XdMRGhPshcvd8qGHa777xXIZns1lljmcEeBIi41g3wDEUZ1fDyarC1dpHbK4j2pUcO2/U7cTwEslv0Qy+a7mGAqsLeIFc4CQPPoAKwkz3g0ktP7mZpvm3e9CF9zlB+snHDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7308.namprd11.prod.outlook.com (2603:10b6:208:436::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Wed, 1 Feb
 2023 04:44:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::59f9:9e:220d:bbc3]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::59f9:9e:220d:bbc3%3]) with mapi id 15.20.6064.022; Wed, 1 Feb 2023
 04:44:59 +0000
Date: Wed, 1 Feb 2023 04:44:37 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <Y9nuNU4tppaYldmo@DUT025-TGLU.fm.intel.com>
References: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
 <20230112222538.2000142-3-rodrigo.vivi@intel.com>
 <Y9linmMswlANIT8f@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y9linmMswlANIT8f@intel.com>
X-ClientProxiedBy: SJ0PR03CA0129.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7308:EE_
X-MS-Office365-Filtering-Correlation-Id: 91f132c2-e3ad-4b1a-edbd-08db040f1309
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6MB7iT8IU6kPQePfyGvZYmRP6CUD7/zLXqhVrnOlFFOrywI/ERC72mtxaql7o/ahVXWmPEV/JoIHmh6IckCZaSWptOpme428aqWBX28sIub4jNFjQHBUM0Ys1rH4RkbkR5BdLEL+cIrh0oikA9sWbPGnhk1R81klqIG6nS9Ojz1/eDxk6ZNQIdLxWxSfh9ln9qVNE4Ckdb6SBmZYlDnL6G1mmZgM9elO58CzZU+8tL4GQFhKxz2ggXiiVrNOCmYZTXQZyEK0But+h2ABuXdISljePaLKtZ6Fmt8TpvKAOH1SMdccV7LZVR/Fy4BUHRwNsqdvuqFXChaedGsMO8ySROWpRcacABkUZKqJRP5tKV7gjluAsVyNE6BmTOdMem/s6rsGPpv6zCFdiNRVhBZJyozvRtc8t7eoAYMJMblzU/b0Dd0fE9ZR4hG1XWINCTy4sKAvoNcHnH1G0UXbRvdni224dCccEBL9V6JGFW/mKG/aCl26F1/y/Zs+YVZuuxQyFK8edpnc5pmiYuXr13oweOS5fDHYrWqwC+tM9sHSeXsnsyyp0R/KONB9B+GwpVVrKid62p7sKLv+Fn1rPZ6Af5aYogmgwwcDo1xec92XziM/B2cUkB5gR+RnBeZLUcG0CD8ZHwIywTlbAbVdiXOJMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(366004)(39860400002)(376002)(346002)(396003)(451199018)(38100700002)(6862004)(82960400001)(8936002)(86362001)(5660300002)(44832011)(316002)(6636002)(41300700001)(2906002)(83380400001)(6506007)(6512007)(8676002)(4326008)(66556008)(186003)(26005)(478600001)(66476007)(6666004)(6486002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HfCinoZHfALfgoYD1qQvWKfJXhrc9kj9tGCCTph00CpWivNhFo+lwtUxqERs?=
 =?us-ascii?Q?2hmGknireK7jj1VNIg166YqGBgzzKIk5RdF0z9CqJAEYL/ZhLY3JR9UU8h5e?=
 =?us-ascii?Q?KS2DYv7Cs/9iokQ9luqLNfU6ZLiN1ts3fkZ4r0Oy+3ADVLi87BRR4l5SftJH?=
 =?us-ascii?Q?zXQKUCt9EWx0cneDR8TeNWNVCGKiJDMAlXuQseA5nRn1TsDpnNx1OsZmv7pQ?=
 =?us-ascii?Q?8sYrC/m69JRVmRguAcfQpwBwTIaSpWHa19wt81vv/wJs/tikK5Vli1USNGA2?=
 =?us-ascii?Q?mNNskM6ZuAHIGx/US5tvoBrPyVSnmCCzh8JcH92oOWdSmvwELhzJI1ScRg5x?=
 =?us-ascii?Q?BqBYCNlseTIG5VgYQ5ixyGQClL0m4e1mpQYAf6Ci2dAjQPI+qUfKf7GnA1DT?=
 =?us-ascii?Q?UQLGcjLBYnzHHeoBZ95oEiP9y+/DkbdvGEunMlylNdCd6DsaQpSX5E1boHh6?=
 =?us-ascii?Q?/aI7k2fI0PUqfwR09EiSfS+mzCPdl4CSCZoRLsD1TfP9vxe7w9TTyRhd9vsZ?=
 =?us-ascii?Q?qH5x7NRWIguE1H9iBcm9JkeTlUWovv6vl5BWfbz2NEYFCa2vy4gHQ8eEYPz3?=
 =?us-ascii?Q?WI4qxeEtYJO3C8PqSys5WqDBjL1ECBLqIdzL6H/OBcUyzW8/4mxesOyDMxTv?=
 =?us-ascii?Q?gy5YQpID0KMO1nzL6LsSJSn9HTTsQCPy4rFFT+ALWOGNr+DPIVd/DJajQUvD?=
 =?us-ascii?Q?9Pe+xbwE0JMYxqsuDYnkQh5MBBvm1d2SoXHeQnb8eWbmzNa2uu3KRSJvGv6p?=
 =?us-ascii?Q?FO/HXOKGGH/1QUMTOyrq2vgDxkSmSvv4RD25yYsY2/m8hURXwat8ptUWJckw?=
 =?us-ascii?Q?0hDkJnptd/FhoicaGHJZDtaf5DrgbGEK4Ff6XtzOsTmBo+v4/RmbkkJUizKJ?=
 =?us-ascii?Q?nbPUGsRHZopRxYXdPj/hVylk0yyRw76780+piVQC0qt8x0JrULtxt+upEFWI?=
 =?us-ascii?Q?llRq3bdLJjV2icqqUcWXc1bu3Oi+0hbko1P1384CVhOcKovCcAoBNUA4cuPy?=
 =?us-ascii?Q?irzvThTzsipBVEDLNY3Ocg2/+9Sat2EK4pJAPrSkYGvq2z4O8NPSz2BSpf2x?=
 =?us-ascii?Q?u6nDvSS88TjPZlxB9PldvDk4oBRK00bna8tTsEHDuP806uk9Z9t7GqYOPXRq?=
 =?us-ascii?Q?LyWT6OLiPe8zIknSElSV6UnDjrEcYsW1UxPeXwgZK0v3EbfIrxZs9RVpIHbH?=
 =?us-ascii?Q?DOO+PEPkAxiV7N2s49NV3eBt2IVSrX6wiXJvdaY+sqzvwPO/5/sqyATcBZc6?=
 =?us-ascii?Q?KRZGDUrxor4W7Wd8x1NjQcE7OBcMHfxnrFYWit2sOns39DhDHqApUivut60f?=
 =?us-ascii?Q?of07gWzX9ypiortZuK/1/x+DsbvOFIycGnYBNhlsf3TjqifD6mM6VJ9+udoJ?=
 =?us-ascii?Q?N3jvMNO4358+pr+PKnXpreB+HkBlNIimb1zPdlDDIZPQkK9n3vozO3rO4T+l?=
 =?us-ascii?Q?rbrLMWEUOrVK0KxT5l/HF4vBZCGFpCb47/bWfCFYHQ5grFXc08c7kQ5XeCCx?=
 =?us-ascii?Q?DUkvZRZ6eCqc7MH1ohVBq4uj9FsVNWHWudMtW6t/KdwujXwLCwidHRxsGukf?=
 =?us-ascii?Q?oaU3E1LZVjd/44Vj9Ydk3UMvY6Hj/A+sVN6rb3TGAqEYRC31oUJE1jf7k7ci?=
 =?us-ascii?Q?Hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 91f132c2-e3ad-4b1a-edbd-08db040f1309
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 04:44:59.5527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oAYM0Vkmr554sghyMCz/Sbwll5RNTW7HOmW8kGeOJFWARXYTEO4TNafXzjmwawDSCt9eqpv2Rrg4sixspiobvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7308
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 02/37] drm/xe: Implement a local
 xe_mmio_wait32
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
Cc: maarten.lankhorst@linux.intel.com, intel-xe@lists.freedesktop.org,
 philippe.lecluse@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 31, 2023 at 01:49:02PM -0500, Rodrigo Vivi wrote:
> On Thu, Jan 12, 2023 at 05:25:03PM -0500, Rodrigo Vivi wrote:
> > Then, move the i915_utils.h include to its user.
> > 
> > The overall goal is to kill all the usages of the i915_utils
> > stuff.
> > 
> > Yes, wait_for also depends on <linux/delay.h>, so they go
> > together to where it is needed. It will be likely needed
> > anyway directly for udelay or usleep_range.
> > 
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> 
> Matt, may I convert your gitlab approvals in reviewed-bys?
> or do you want to go one by one here in the ml?
> 

Please consider any of my gitlab approvals as:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> > ---
> >  drivers/gpu/drm/xe/xe_force_wake.c |  6 ++++++
> >  drivers/gpu/drm/xe/xe_gt_mcr.c     |  7 +++++++
> >  drivers/gpu/drm/xe/xe_guc.c        |  7 +++++++
> >  drivers/gpu/drm/xe/xe_guc_pc.c     |  7 +++++++
> >  drivers/gpu/drm/xe/xe_mmio.h       | 29 ++++++++++++++++++++---------
> >  drivers/gpu/drm/xe/xe_pcode.c      |  7 +++++++
> >  6 files changed, 54 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> > index 5a5b6e3e715d..04b22eeb8ab5 100644
> > --- a/drivers/gpu/drm/xe/xe_force_wake.c
> > +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> > @@ -10,6 +10,12 @@
> >  #include "xe_mmio.h"
> >  #include "../i915/gt/intel_gt_regs.h"
> >  
> > +/*
> > + * FIXME: This header has been deemed evil and we need to kill it. Temporarily
> > + * including so we can use '__mask_next_bit'.
> > + */
> > +#include "i915_utils.h"
> > +
> >  #define XE_FORCE_WAKE_ACK_TIMEOUT_MS	50
> >  
> >  static struct xe_gt *
> > diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> > index 63829d8c8b54..ce776b260750 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> > @@ -11,6 +11,13 @@
> >  
> >  #include "../i915/gt/intel_gt_regs.h"
> >  
> > +#include <linux/delay.h>
> > +/*
> > + * FIXME: This header has been deemed evil and we need to kill it. Temporar
> > + * including so we can use 'wait_for'.
> > + */
> > +#include "i915_utils.h"
> > +
> >  /**
> >   * DOC: GT Multicast/Replicated (MCR) Register Support
> >   *
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index b5557375804f..373c94230fc3 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -22,6 +22,13 @@
> >  #include "i915_reg_defs.h"
> >  #include "../i915/gt/intel_gt_regs.h"
> >  
> > +#include <linux/delay.h>
> > +/*
> > + * FIXME: This header has been deemed evil and we need to kill it. Temporarily
> > + * including so we can use 'wait_for' and range_overflow_t.
> > + */
> > +#include "i915_utils.h"
> > +
> >  /* TODO: move to common file */
> >  #define GUC_PVC_MOCS_INDEX_MASK		REG_GENMASK(25, 24)
> >  #define PVC_MOCS_UC_INDEX		1
> > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> > index 38b1275ea655..515b7aab03c3 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> > @@ -16,6 +16,13 @@
> >  #include "i915_reg_defs.h"
> >  #include "../i915/i915_reg.h"
> >  
> > +#include <linux/delay.h>
> > +/*
> > + * FIXME: This header has been deemed evil and we need to kill it. Temporarily
> > + * including so we can use 'wait_for'.
> > + */
> > +#include "i915_utils.h"
> > +
> >  #include "../i915/intel_mchbar_regs.h"
> >  /* For GEN6_RP_STATE_CAP.reg to be merged when the definition moves to Xe */
> >  #define   RP0_MASK	REG_GENMASK(7, 0)
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> > index e7cca6d2f81f..d3bc0989ce2e 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.h
> > +++ b/drivers/gpu/drm/xe/xe_mmio.h
> > @@ -10,13 +10,6 @@
> >  
> >  #include "xe_gt_types.h"
> >  
> > -/*
> > - * FIXME: This header has been deemed evil and we need to kill it. Temporarily
> > - * including so we can use 'wait_for' and unblock initial development. A follow
> > - * should replace 'wait_for' with a sane version and drop including this header.
> > - */
> > -#include "i915_utils.h"
> > -
> >  struct drm_device;
> >  struct drm_file;
> >  struct xe_device;
> > @@ -84,8 +77,26 @@ static inline int xe_mmio_wait32(struct xe_gt *gt,
> >  				 u32 reg, u32 val,
> >  				 u32 mask, u32 timeout_ms)
> >  {
> > -	return wait_for((xe_mmio_read32(gt, reg) & mask) == val,
> > -			timeout_ms);
> > +	ktime_t cur = ktime_get_raw();
> > +	const ktime_t end = ktime_add_ms(cur, timeout_ms);
> > +	s64 wait = 10;
> > +
> > +	for (;;) {
> > +		if ((xe_mmio_read32(gt, reg) & mask) == val)
> > +			return 0;
> > +
> > +		cur = ktime_get_raw();
> > +		if (!ktime_before(cur, end))
> > +			return -ETIMEDOUT;
> > +
> > +		if (ktime_after(ktime_add_us(cur, wait), end))
> > +			wait = ktime_us_delta(end, cur);
> > +
> > +		usleep_range(wait, wait << 1);
> > +		wait <<= 1;
> > +	}
> > +
> > +	return -ETIMEDOUT;
> >  }
> >  
> >  int xe_mmio_ioctl(struct drm_device *dev, void *data,
> > diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> > index 236159c8a6c0..313ccd70d1a9 100644
> > --- a/drivers/gpu/drm/xe/xe_pcode.c
> > +++ b/drivers/gpu/drm/xe/xe_pcode.c
> > @@ -11,6 +11,13 @@
> >  
> >  #include <linux/errno.h>
> >  
> > +#include <linux/delay.h>
> > +/*
> > + * FIXME: This header has been deemed evil and we need to kill it. Temporarily
> > + * including so we can use 'wait_for'.
> > + */
> > +#include "i915_utils.h"
> > +
> >  /**
> >   * DOC: PCODE
> >   *
> > -- 
> > 2.38.1
> > 
