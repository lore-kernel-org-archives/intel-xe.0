Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB727C48BC1
	for <intel-xe@archiver.kernel.org>; Wed, 14 Feb 2024 13:55:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A045D10E1E9;
	Wed, 14 Feb 2024 13:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gcEY2Es4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC8C10E1E9
 for <Intel-Xe@lists.freedesktop.org>; Wed, 14 Feb 2024 13:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707918901; x=1739454901;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1+ZelCiYVJORyOMZbBoDf73dRiMccR7Wm2k9aIyQODI=;
 b=gcEY2Es4ghvD4ZSRta8n6QICAR3+H0BNpU2iBZVqn55MyspBE6K/wXS0
 2wyQwFJv8aL9ZiSRX2OX/72VGVOVXL6myhnkzxM1OZALlOI5PZWSkXsF8
 IVXk8OWmU1NTPUEbO5nPoRm2QpxAJvedyFxdqU7JxCsq5uU2RuvLo+dp7
 WBZ6nEj0pzyvpcaDkBRZqiSHHJ8Tt1wApacCThbgcPVy7mrWyLVGvsrns
 9kgea7ff57eW3gTZJwnpYNR0ayss2+5zElsbTbQ3aQlv0x/CVJc+lHaFo
 5ui3rH6klan0EpwOdDG1/v4H9rVVGMzJa8Y6/47sX9CsBcZ8eYayRz5XK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="4926790"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="4926790"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 05:55:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3185000"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2024 05:55:00 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 05:54:59 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 14 Feb 2024 05:54:59 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 14 Feb 2024 05:54:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ld5Xi69vd2uZGmyYdez6eY0vU7x178+C56zVQYTG3Err2HIqlhbNeM5QJNn2PUq0FrUO9wSQTt5ywNXFQf5+LOPS8N7VdzbJVbpQKNkGrh5FtLtipltR3HVz63HruOySz5n3ymrPEbTZboFtfKEL/XedfL8g+sGf2ds2861pBKi1eGwNYstZO95Fs8q4g5dZde/o+K4VhLlBWWVKZGmmP9KadOFWHkSbY28loKH5Hi7JODvrNQE6uGljuTGGtMnT85xsxhWp8sSlQngJ3DzXcwj76MUfZoCMQun1xTQk3C3nlds/qfISGH9Ndo3nQ+p8l6CJdOarNkZUaiSZCSFzLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xj/i3VF84IhchiSJHcNBGnSmoxH6nKgohSmpruZSw4Y=;
 b=fD5fVH9jKdr4LIdnjPipCPYQmVqCCNWdp2hLEiaafZsaM1jy9wkpcw1WXRuDSGo2USsvxQC3IVsZcaORfIU50EJYroX7u+VRQqz/H+Okqxpr5A/AqQjl7G+bzAHqtj/t7TRSpAoQuXFLicgJVY4ukJ42oeQrE/8tsGDscE9p0gmMVJfLQiBT+fFN2+BOeRNV7+J6su9MQqaQaycg8+aJglwyzYfkyCWfDt90XdRunTnZNXWqjLn0mi/884OuNQrXc8ksDNZ2wCyWeUS5+6Es82vXYgkj+18b3oFwLQ98baztw6n/LU6K+Kzp/9QqK6xeQjZxbQWlEi2ccvkCfjZRcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM8PR11MB5654.namprd11.prod.outlook.com (2603:10b6:8:33::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.27; Wed, 14 Feb
 2024 13:54:58 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7270.036; Wed, 14 Feb 2024
 13:54:58 +0000
Date: Wed, 14 Feb 2024 08:54:54 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/2] drm/xe: Make read_perf_limit_reasons globally
 accessible
Message-ID: <ZczGFSmfKZwei7on@intel.com>
References: <20240213003426.3943662-1-John.C.Harrison@Intel.com>
 <20240213003426.3943662-2-John.C.Harrison@Intel.com>
 <ZcuJOkUkZnss9ttl@intel.com>
 <7d8760f4-5867-4e07-a82d-d2e64e564272@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7d8760f4-5867-4e07-a82d-d2e64e564272@intel.com>
X-ClientProxiedBy: BY3PR10CA0006.namprd10.prod.outlook.com
 (2603:10b6:a03:255::11) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM8PR11MB5654:EE_
X-MS-Office365-Filtering-Correlation-Id: e0c6a842-a54b-4d1e-ac2d-08dc2d6487bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YaK4RTspJvbdByfe8wJnHw+op0IC8oTFlrRYJEHgAfZegdqR1B3t3DKy1Yk4R2uJEaJUXSH472Aaay5wueazlmnUW8ImQK4QbejEIiFB1QdDg77KjLH70+rczvaCjeb1HOmKT4bySEqfv8pJHzZ3VW1nGKuJEsyoKjzImm6jGGdUmwTz2sF42PRxFyhFL9fXgyLS/9n1NLQ1Kp6GOZXiuFCdLQ372bsLLlQDEJUPQMOn3nX8ZLv/dMlsTfNkY5qbDIm4QWh3LHiqutXS9kR5Imih7bRFPjNzq/VW4gMzJQOpCK+3zGWSbzwd7wlyQ3iCPV/B1S9cDiiyrioMmVkJ2fDtU0KXnwlWiy3fwPYRhmuI3YDXSaxA41j2PN1vAfTWjLh1IVDNQCfpComph1O+hr/pOBxOWoocfnq4HjOu5NhygewUibVA2waZUwjeZNcnW1rQ05jREcSluSBzjtogyoSDKAsAlgs9LZwzZewvL1cEFTYiII8JE+PFQlJkjTaEp7R0NE3wB/iEcjHlggllnp7subIC8w3jKX7hQOjtLcAC7FwPcw1G2CTUcv3j9uDP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(376002)(346002)(396003)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(6512007)(6486002)(6506007)(6666004)(53546011)(2906002)(5660300002)(41300700001)(44832011)(37006003)(316002)(6862004)(478600001)(6636002)(4326008)(66476007)(66556008)(66946007)(8936002)(8676002)(26005)(83380400001)(86362001)(38100700002)(36756003)(82960400001)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l2V6uxjUgss2WNZ+WHGtBXd5EyLAf8yzEyJiaUU2QKWrfJvSZn4Q23vKzw1U?=
 =?us-ascii?Q?rk77me9+RADbgj3rTrDYhvvHl7sT+LbwPnzGi46IxpU65/3/uSVVO2dqCofg?=
 =?us-ascii?Q?m8V9ZoBs9M21eYztc0eNjxA1kj1wlgjphSvj42BgRj4ORNywTYzZC+g8txu/?=
 =?us-ascii?Q?/zQ23pCwKrNN5xgoqNl4dYnfp9M9HDxZqCldeU+StvFsXCawwkMx7tpQt0Th?=
 =?us-ascii?Q?3y9F10C9M6gDgnCa8LIk4xnAedVFxUDd0cZayggHX9lpEwnpc1SmsHiTmm75?=
 =?us-ascii?Q?DQnuAP8Op1HdV5WyF/OhPQjWIwy8X8xUVfsPZFAcwrdstoVElDuZUA5ZTBPa?=
 =?us-ascii?Q?BtvfqxbwmAkTes1X/NTekJ5iLjrg4p+u8+wFQtBHWb26prGwVyLVp8qiDUra?=
 =?us-ascii?Q?LY/fQtH4CDzC7corFgqJhl3EsuZ7Zn/ZFAsWD/g73GaFt3RZ0Th57DBxT5tO?=
 =?us-ascii?Q?RUp4HUMGC2D36apBXCb3ZxocOepfQxrkhP5C7+56Tjftp3CLS9fDAChfYora?=
 =?us-ascii?Q?H0R43fXk36gfzamYQg5s09gDiM8/CES3I8xf6ayzvmtquhTz5aTCpa1FbYoF?=
 =?us-ascii?Q?oFsCltuXF+B/BnmZx1760ZDUqaljFxoPD3wN5V8EHrRAmx5NqU1mR4XRCxau?=
 =?us-ascii?Q?NWsZBcMq2QHcL3B+/XApVXSxuI/pLngkBhTy6f9M0p+yT4Q3pd7vzJkTAlEc?=
 =?us-ascii?Q?3GFTNpfm0AxrCxYd2efw7wUr/agL7M7l3cUHszZOiEHtTmVohZp8T2fe0Iwi?=
 =?us-ascii?Q?rR6hXVw6EL/e6zCU837Erd0cS/tYEheqwlAUjdcHbqgUZqa+xZNBpH/7OdLE?=
 =?us-ascii?Q?Qxxhi+dVwHGe++NzcoPti3uLooDzFFKasrhsVPaNgwgonmxmKbdXSsZjEX7V?=
 =?us-ascii?Q?tMjlVoT++nKemyW0d1TfhnJcSCe4lmzwSd+OHQPxhSW4Cm0CfafhQFIiD2S2?=
 =?us-ascii?Q?nEUo0YKXtK2Hd2V84TYwJB6uR/t5iiOVmHU3Lb217NpP16c9d9+fz7O7lFtf?=
 =?us-ascii?Q?N6kAlnpZKgLPUgKndH5p63QNaClCQvtGY7T3mtBzVhEqpVOF+TlEWROlLoVP?=
 =?us-ascii?Q?1Ndv9wEg71A6QkQe+sXTcBa4is34Sk1COCMCLtDgbGHzbsMGjP3vu9WPfXiK?=
 =?us-ascii?Q?VnrAibuZA4WoeeJL/mAWHzP69uQa9b5C3F1qxNF4+mC3LuQsu2UREB5hxOpi?=
 =?us-ascii?Q?8CWbTM4LYDXd3FCHhB3mXh3qTLJK6/NWjz0bOEy4I+PCz0M9D6lcFe6ih6fY?=
 =?us-ascii?Q?5OZd+Bi0s1WIvj0MH4zB/gXpXe04QqB05c6Ce+J3VWYyHz4JS2veXhha6gES?=
 =?us-ascii?Q?X9IDLEvwHEYJx3cVnWHXaRaXWlA7o9S6/HBwuD1/9j9L09ffVdLXCERIAQGV?=
 =?us-ascii?Q?OTcyxpWrkbXM+D2Yy1DnK7nZHO5NrtrarXqRO+ZaO9oXdWjTe8BlbanHrkn+?=
 =?us-ascii?Q?5+KS9svlttPGCZdBt9dM3C5CtyNP0IKPL1wn2DEvcrIa7++3TWhUOXlKwwb3?=
 =?us-ascii?Q?8V7SA/P+MOfhYdXUXErfEZ1ymuR03LvzuPWNvNHIuYR4Ux/Nx1XLNPrdBXaG?=
 =?us-ascii?Q?NNokeQbAbJP1wtlGWeZG6ZKe6gVuUpnsZXEhKO5d5guPHXsVul9Piiz4AjcL?=
 =?us-ascii?Q?jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0c6a842-a54b-4d1e-ac2d-08dc2d6487bd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 13:54:57.9376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xpPTvz89JrWz+8zwUePjsTM5RPYe4LJElLGxPe4qGCwOvn/xT1l2OffWYgCNju8Zym9sdm16oECyQV1raGzIbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5654
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

On Tue, Feb 13, 2024 at 06:12:11PM -0800, John Harrison wrote:
> On 2/13/2024 07:22, Rodrigo Vivi wrote:
> > On Mon, Feb 12, 2024 at 04:34:25PM -0800, John.C.Harrison@Intel.com wrote:
> > > From: John Harrison <John.C.Harrison@Intel.com>
> > > 
> > > Other driver code beyond the sysfs interface wants to know about
> > > throttling. So move the query function out of sysfs.
> > > 
> > > Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_gt_freq.c           | 15 +++++++++++
> > >   drivers/gpu/drm/xe/xe_gt_freq.h           |  4 +++
> > >   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c | 31 ++++++++---------------
> > >   3 files changed, 29 insertions(+), 21 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
> > > index e5b0f4ecdbe8..51645a24009e 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_freq.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> > > @@ -11,7 +11,10 @@
> > >   #include <drm/drm_managed.h>
> > >   #include <drm/drm_print.h>
> > > +#include "regs/xe_gt_regs.h"
> > >   #include "xe_device_types.h"
> > > +#include "xe_mmio.h"
> > > +#include "xe_gt.h"
> > >   #include "xe_gt_sysfs.h"
> > >   #include "xe_gt_throttle_sysfs.h"
> > >   #include "xe_guc_pc.h"
> > > @@ -220,3 +223,15 @@ void xe_gt_freq_init(struct xe_gt *gt)
> > >   	xe_gt_throttle_sysfs_init(gt);
> > >   }
> > > +
> > > +u32 xe_read_perf_limit_reasons(struct xe_gt *gt)
> > > +{
> > > +	u32 reg;
> > > +
> > > +	if (xe_gt_is_media_type(gt))
> > > +		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
> > > +	else
> > > +		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
> > > +
> > > +	return reg;
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_freq.h b/drivers/gpu/drm/xe/xe_gt_freq.h
> > > index f3fe3c90491a..89be518b4967 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_freq.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt_freq.h
> > > @@ -6,8 +6,12 @@
> > >   #ifndef _XE_GT_FREQ_H_
> > >   #define _XE_GT_FREQ_H_
> > > +#include <linux/types.h>
> > > +
> > >   struct xe_gt;
> > >   void xe_gt_freq_init(struct xe_gt *gt);
> > > +u32 xe_read_perf_limit_reasons(struct xe_gt *gt);
> > this component is xe_gt_freq, not xe_ nor xe_read or xe_read_perf.
> > Please use the right namespace prefixes.
> Argh! Forgot to update that.
> 
> > 
> > But besides the namespace, I don't believe that these limits
> > belong to xe_gt_freq anyway... why are you taking that from the
> > throttle reasons and moving here?
> > 
> > What about removing the 'sysfs' name from the xe_gt_throttle
> > component and making that to export a function
> > xe_gt_throttle_get_limit_reasons(struct xe_gt *gt)
> > ?
> Because that seems like a lot of unnecessary churn. The intention is to
> simply add the throttle register to debug prints so that CI bug reports can
> be triaged more effectively. Re-writing the entire sysfs file to split it up
> into multiple units is not worth the effort when all that is required is to
> export the function to read a register.

No, that's not what I meant... I don't believe we need to split the file.
just remove the 'sysfs' portion of the name of the component itself,
so we have a component responsible for providing throttle information, either
with direct exposing the sysfs and also with the exported functions that can
be accessed by any other component that might make usage of the throttle
information.

> 
> John.
> 
> 
> > 
> > Thanks,
> > Rodrigo.
> > 
> > > +
> > >   #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> > > index 63d640591a52..89d9f89962ad 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> > > @@ -8,6 +8,7 @@
> > >   #include <regs/xe_gt_regs.h>
> > >   #include "xe_device.h"
> > >   #include "xe_gt.h"
> > > +#include "xe_gt_freq.h"
> > >   #include "xe_gt_sysfs.h"
> > >   #include "xe_gt_throttle_sysfs.h"
> > >   #include "xe_mmio.h"
> > > @@ -34,77 +35,65 @@ dev_to_gt(struct device *dev)
> > >   	return kobj_to_gt(dev->kobj.parent);
> > >   }
> > > -static u32 read_perf_limit_reasons(struct xe_gt *gt)
> > > -{
> > > -	u32 reg;
> > > -
> > > -	if (xe_gt_is_media_type(gt))
> > > -		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
> > > -	else
> > > -		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
> > > -
> > > -	return reg;
> > > -}
> > > -
> > >   static u32 read_status(struct xe_gt *gt)
> > >   {
> > > -	u32 status = read_perf_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
> > > +	u32 status = xe_read_perf_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
> > >   	return status;
> > >   }
> > >   static u32 read_reason_pl1(struct xe_gt *gt)
> > >   {
> > > -	u32 pl1 = read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
> > > +	u32 pl1 = xe_read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
> > >   	return pl1;
> > >   }
> > >   static u32 read_reason_pl2(struct xe_gt *gt)
> > >   {
> > > -	u32 pl2 = read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
> > > +	u32 pl2 = xe_read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
> > >   	return pl2;
> > >   }
> > >   static u32 read_reason_pl4(struct xe_gt *gt)
> > >   {
> > > -	u32 pl4 = read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
> > > +	u32 pl4 = xe_read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
> > >   	return pl4;
> > >   }
> > >   static u32 read_reason_thermal(struct xe_gt *gt)
> > >   {
> > > -	u32 thermal = read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
> > > +	u32 thermal = xe_read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
> > >   	return thermal;
> > >   }
> > >   static u32 read_reason_prochot(struct xe_gt *gt)
> > >   {
> > > -	u32 prochot = read_perf_limit_reasons(gt) & PROCHOT_MASK;
> > > +	u32 prochot = xe_read_perf_limit_reasons(gt) & PROCHOT_MASK;
> > >   	return prochot;
> > >   }
> > >   static u32 read_reason_ratl(struct xe_gt *gt)
> > >   {
> > > -	u32 ratl = read_perf_limit_reasons(gt) & RATL_MASK;
> > > +	u32 ratl = xe_read_perf_limit_reasons(gt) & RATL_MASK;
> > >   	return ratl;
> > >   }
> > >   static u32 read_reason_vr_thermalert(struct xe_gt *gt)
> > >   {
> > > -	u32 thermalert = read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
> > > +	u32 thermalert = xe_read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
> > >   	return thermalert;
> > >   }
> > >   static u32 read_reason_vr_tdc(struct xe_gt *gt)
> > >   {
> > > -	u32 tdc = read_perf_limit_reasons(gt) & VR_TDC_MASK;
> > > +	u32 tdc = xe_read_perf_limit_reasons(gt) & VR_TDC_MASK;
> > >   	return tdc;
> > >   }
> > > -- 
> > > 2.43.0
> > > 
> 
