Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499E5C0015E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 17:02:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0108510E4A2;
	Wed, 26 Jul 2023 17:02:24 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F02DE10E4A0
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 17:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690390941; x=1721926941;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2n7SvLmtaKlfvf8F1Ly46P8Ql5hbdlzqU9Uv8FezbYk=;
 b=IYFbiikhs+KOHfhbFEcnTaBN+LxGMkVw4UjipFQVSptVsMbmmpdY+b4f
 zEIwp6miJ9tKoKIh2XyqHlFfecsf370CR1jhUJRHUx1kER1skGtT+LPYk
 CGmGBavN4jk9TYY3AbtEdHUF5XdEQdTL2EgtQJtuUGq6KFY/7K/4+5Ruo
 h5VdCZJIO7V/eMTBc5ArvWbrKsSoZm8pD4DDDdyo4T+17p/59dMLb0yA5
 Lr+kSoS8KWKCl830n6ZCHmvo6B9LFr5tAOrtJJJSCYCRfJVWaZayPLvD3
 OZ8EZbPVRjK14hdkDlg5eLmeSdOlk18F5kvlYa9KuT9fo76Y+3F3Q7W/G Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="348356695"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="348356695"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 10:01:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="676778996"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="676778996"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 26 Jul 2023 10:01:50 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 10:01:50 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 10:01:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 10:01:49 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 10:01:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PsosaxsQE8cNZulRPs3UCT2HSn9VBDxTzsQk2A+ASl23xCWGGkbYBugwRhJHWtgbKgY2Yta/OP3eQrKqtdjYm/xJuKmSAjTr8kPbH1yPV6z6mjB9hBrRCnSjyzaXnnnOVL1+dPdcIr8vpxZJHu6/g/Cr/j4coayrJ6BEBTb0MlusBlm3KXgXdmeIAKbf1HrYjexhtBiEqbkqmZC9inzWhNtc4qxBregKd8ugVMqW2A1l/kX4Rilmeuubfl0jsVxH5B+yBoELHjcDmLpyvo0EbJ7d5RL/J+XRuDvVSvrlg9cCUhpSWeDSPyGe8SqQiO3ZR7qHrmule4ci/dc/gFdYwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NJDTH7pDZBDRwMz3/Q6yuOjfvXWcqehdFdeMiVr8hVM=;
 b=VrZ02RrFsq+u6swJVddAHWQRczyyk2Lb4/HiPrJEdD39XCZNn6UlPTeW2Wq7r9ZItq90Xv/GuNCaJhRiyF0iBIqwFJUAXfGgxHqcZeBerJIyLy4jlGibLjDbWwvovyFCiGvPHvEu6YABb4FlWLF//FsVG8DR5lAVM/ii1S0D6+iTutu0JCwxThZHxoVOoDvaxg37UtFwGOgDNQ81knZbLA9ZCbHNtTAOd9qRaKF9df+03VATAtK8X5RcoejNVa8jE4Wt+kYl90aZ25B3TsormOZkEqEU4rjdqOnKx/ICxxjxZ0NBiV0za4cyKlw9nrpL3pFu4bKZzXp+oqzILllFfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4957.namprd11.prod.outlook.com (2603:10b6:a03:2df::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 17:01:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 17:01:41 +0000
Date: Wed, 26 Jul 2023 17:00:33 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Message-ID: <ZMFRMaXa+tgLKA9W@DUT025-TGLU.fm.intel.com>
References: <20230726132550.846300-1-tejas.upadhyay@intel.com>
 <20230726132550.846300-7-tejas.upadhyay@intel.com>
 <ZMErFd6Kquei++tq@DUT025-TGLU.fm.intel.com>
 <SJ1PR11MB6204DE3DAA57DD8E3788C4488100A@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6204DE3DAA57DD8E3788C4488100A@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4957:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cb27451-9bd2-4e7f-e9f9-08db8df9fbb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AvrMjHxx3JDkN00hU7/XPMGWTsO5FIKuJXld34aONe8z8H5QTVkk5DHzXqeyub5T5F/+RT3FQGmzorh2GbZ6Ppp53M0ljivrokrqkE3OfKG9yxJdbGxpcbiuEtwOJuWVUcaDcU7Q6HQN3mL22Qrg5y4rUubvJn2hz8m38rpVX9sW6ON0wHdpEIedGvkpneH+YeJ4JxaDsQhSjzQ2reSUpHBL+4tuBboxA4668y01JG4wxdZ/61mPN2k/NsEGoVBWOedbq/YQ9U8R/xKgymoTlmEzbBxit2RjydQMJVhfWdL5CMpH/l1xxlhMjy2RZLQpameyoRAQ662tMSechgBIQarJq/DXYkb1s/gTgzSC6x4cP/JJ9EpTbkxCIpvaxkxYJr5mSPd/fufqdH9KildeZ7k/0+i96d0SP/v5eSfDx5S2ue3yJDn8O7secvM86pybSkbuDY3yYybZVnmHMck736ZGi+85msn7UsbQD/FCqr2YdZ+2vFCtPM6cA3w61dcpu3clboHtYR6wDj08IaiNvI4o0HNP03r6HwziSS7+MwKna3Z2K8nh69+wluOzuoix2+FsH1+cQ4qkPkwKK3/JITs8IUPyfvJiM3mrI/ieoaM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(396003)(346002)(376002)(136003)(451199021)(6486002)(54906003)(66946007)(66556008)(66476007)(83380400001)(82960400001)(86362001)(38100700002)(19627235002)(107886003)(53546011)(26005)(6512007)(30864003)(186003)(6506007)(478600001)(6666004)(316002)(41300700001)(5660300002)(6636002)(2906002)(4326008)(8936002)(8676002)(44832011)(6862004)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k2j3Uazeq2JE2Geic8HWwOM+cipueFa9hJ3fna9sv9Lr5uIlKGcMcyJgAKyY?=
 =?us-ascii?Q?QUH4MpKPwIYCREop4DoBw7d6rTu0zfyeQeb/3gNqvlv2sPS+xRqUnGrLQICZ?=
 =?us-ascii?Q?sapDRxudrc6JpKTAQEdqLOZ52+WGj7k5cec4KVFb+oX3GagHCEo3xPOrJvdX?=
 =?us-ascii?Q?cySIzweLAVsuu/oPUbiy5sX0RlEw950FIxDvsvuxZ4lD2NWrT4PACfDafVji?=
 =?us-ascii?Q?uL51q8o3fpAZ7vXFV/cVvH0f5lVHFGrLLWELTdYcyDbPmvdTnc8lJ6zeyrX2?=
 =?us-ascii?Q?YBWIlZdPuejrXAao2kMYQQE1awpOywzDhIkPv4CJQjliHi/IsouBjVY82voy?=
 =?us-ascii?Q?LY9IqIAkX81Vjinx8BaqLwvs00W2/27Lt/cYpBk6EVao0rE66eyYmtwxwmLu?=
 =?us-ascii?Q?dc1VUMhW9tHyFU5xrieXZ7hsols9tF7eyttrOtaoViFjLgEvb+aD1uusJJRz?=
 =?us-ascii?Q?nLyXu+UkD0Ehs6Ch/AnWqC6Qv+bZvyHGvU0rSNnyege6qeTDpIMoDjF+p/7b?=
 =?us-ascii?Q?NPEcmclVj+8Wkqdkq9ixb7BLHZ19BukU54fAEYlwljI9DgZgxKfpngfhFTuk?=
 =?us-ascii?Q?W2IDuv2NAqBaOk++4PUQrD66Ql/VHI3Szu2Dg/d2LTx8vE9KNzDpQn0knshc?=
 =?us-ascii?Q?UBFtedfgrnu2jRLxMxJzJ9SmXJX2u73ay/R1cml8bxT/YyvejeGWudOKqKKx?=
 =?us-ascii?Q?K0h5/dBWGm+XU/LR+Iq2cBnkkTCmQ1S52nLZ5ecN97CTRraSz3NFIMOw4sQm?=
 =?us-ascii?Q?z30GIhVIqaVk9DEBGJCM8++XuZYYnWERJ60TVsJ2sob3mWQVjgonSnzkP0Jy?=
 =?us-ascii?Q?OGVcK1MbK19ol6meOfmi5gW1BzeTmXu4eJ6tJsdUheUG3XU8GUzSAg4CuUM0?=
 =?us-ascii?Q?nQoIPCfx/15W72nTShtouQKQuGEkDiDAOmlC+yrOnJGWimb2fRStGBgq4bgr?=
 =?us-ascii?Q?Mr9OgLbPbaDZ4gsGuwXqz5Yjk14N8SqZlTTLF06kGLgn4k6b7tCJt3/aGHAD?=
 =?us-ascii?Q?Ytvlhder2cojmGO1xDq7XyAoe4E9s3L7KERwSp3K+USZxzWLqQOTnVPnZPwb?=
 =?us-ascii?Q?ytE0tnFDSiz5vhqOZzvxtb7LugaUQZtIcWAu3Zo3h+g5j8Cvb5v6s7PTXXCL?=
 =?us-ascii?Q?H2uAOLgC6vgymg0UT/uuPMcWeuvTjc45jV3bVseETlDZuCcWrviUIQK6qF+m?=
 =?us-ascii?Q?g2O/qK6P2NpqP28MihqMTQdIOfmtpKF7q7gUbjNTRbFNd4DuVc8WFXiY7E4k?=
 =?us-ascii?Q?WcUsiGmBF5m15+LFQ8jSJSNZspYQLN7cJE/2XF0BYRWAVjnlEwwwLbbC1MGJ?=
 =?us-ascii?Q?P0JYCc3VsYtC9uE3tLtdknHPUxDD9NPCc6wtTjJq944lRGE5NZl6WdikYuTg?=
 =?us-ascii?Q?upvS9Oiu1uoVKUrCGj91e0hnEpwZZ5HauIZCSl2Dx9iClr5CEtX5+6DF5OP2?=
 =?us-ascii?Q?NEpCe7fZhxZUs/STB3Vj43mySyYNcYLT2B7udzMA4PR7YGc3xU70F2CuS+hr?=
 =?us-ascii?Q?GC2d0AMBn5hcYSomRkzzJnmoNfd5BiVcKZ7GTeoy/bQKpg4u3GuJWENgCtww?=
 =?us-ascii?Q?Yt//JdeoVq8/FmWfXqG2KC/pGvhlzegoWJ9CbWKz6oP5+KGXyf59mv31KtvM?=
 =?us-ascii?Q?lQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb27451-9bd2-4e7f-e9f9-08db8df9fbb3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 17:01:41.4398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wlanZtDCrkYUSMJvDNI/wnYCqZ+qix+hhseY+iV/CAO6beSAiKt+sllg6Beaz0L5Y+aOZD29CyN74sRhIV8Jgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4957
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V8 6/6] drm/xe: Add min/max cap for engine
 scheduler properties
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jul 26, 2023 at 09:10:52AM -0600, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Wednesday, July 26, 2023 7:48 PM
> > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Vishwanathapura, Niranjana
> > <niranjana.vishwanathapura@intel.com>
> > Subject: Re: [PATCH V8 6/6] drm/xe: Add min/max cap for engine scheduler
> > properties
> > 
> > On Wed, Jul 26, 2023 at 06:55:50PM +0530, Tejas Upadhyay wrote:
> > > Add sysfs entries for the min, max, and defaults for each of engine
> > > scheduler controls for every hardware engine class.
> > >
> > > Non-elevated user IOCTLs to set these controls must be within the
> > > min-max ranges of the sysfs entries, elevated user can set these
> > > controls to any value. However, introduced compile time CONFIG min-max
> > > values which restricts elevated user to be in compile time min-max
> > > range if at all sysfs min/max are violated.
> > >
> > > Sysfs entries examples are,
> > > DUT# cat /sys/class/drm/cardX/device/tileN/gtN/engines/ccs/.defaults/
> > > job_timeout_max         job_timeout_ms          preempt_timeout_min
> > timeslice_duration_max  timeslice_duration_us
> > > job_timeout_min         preempt_timeout_max     preempt_timeout_us
> > timeslice_duration_min
> > >
> > > DUT# cat /sys/class/drm/card1/device/tileN/gtN/engines/ccs/
> > > .defaults/              job_timeout_min         preempt_timeout_max
> > preempt_timeout_us      timeslice_duration_min
> > > job_timeout_max         job_timeout_ms          preempt_timeout_min
> > timeslice_duration_max  timeslice_duration_us
> > >
> > > V8 :
> > >    - fix enforce_sched_limit and avoid code duplication - Niranjana
> > >    - Make sure min < max - Niranjana
> > > V7 :
> > >    - Rebase to replace hw engine with eclass interface
> > >    - return EINVAL in place of EPERM
> > >    - Use some APIs to avoid code duplication
> > > V6 :
> > >    - Rebase changes to reflect per engine class props interface - MattB
> > >    - Use #if ENABLED - MattB
> > >    - Remove MAX_SCHED_TIMEOUT check as range validation is enough
> > > V5 :
> > >    - Rebase to resolve conflicts - CI
> > > V4 :
> > >    - Rebase
> > >    - Update commit to reflect tile addition
> > >    - Use XE_HW macro directly as they are already filtered
> > >      for CONFIG checks - Niranjana
> > >    - Add CONFIG for enable/disable min/max limitation
> > >      on elevated user. Default is enable - Matt/Joonas
> > > V3 :
> > >    - Resolve CI hooks warning for kernel-doc
> > > V2 :
> > >    - Restric min/max setting to #define default min/max for
> > >      elevated user - Himal
> > >    - Remove unrelated changes from patch - Niranjana
> > >
> > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/Kconfig                 |   6 +
> > >  drivers/gpu/drm/xe/Kconfig.profile         |  46 +++
> > >  drivers/gpu/drm/xe/xe_engine.c             |  40 ++-
> > >  drivers/gpu/drm/xe/xe_engine_class_sysfs.c | 354
> > +++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_engine_class_sysfs.h |   2 +
> > >  drivers/gpu/drm/xe/xe_hw_engine.c          |   8 +
> > >  drivers/gpu/drm/xe/xe_hw_engine.h          |  31 ++
> > >  7 files changed, 481 insertions(+), 6 deletions(-)  create mode
> > > 100644 drivers/gpu/drm/xe/Kconfig.profile
> > >
> > > diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> > > index d44794f99338..0a4ea965645b 100644
> > > --- a/drivers/gpu/drm/xe/Kconfig
> > > +++ b/drivers/gpu/drm/xe/Kconfig
> > > @@ -83,3 +83,9 @@ depends on DRM_XE
> > >  depends on EXPERT
> > >  source "drivers/gpu/drm/xe/Kconfig.debug"
> > >  endmenu
> > > +
> > > +menu "drm/xe Profile Guided Optimisation"
> > > +	visible if EXPERT
> > > +	depends on DRM_XE
> > > +	source "drivers/gpu/drm/xe/Kconfig.profile"
> > > +endmenu
> > > diff --git a/drivers/gpu/drm/xe/Kconfig.profile
> > > b/drivers/gpu/drm/xe/Kconfig.profile
> > > new file mode 100644
> > > index 000000000000..e72f15ec4bf6
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/Kconfig.profile
> > > @@ -0,0 +1,46 @@
> > > +config DRM_XE_JOB_TIMEOUT_MAX
> > > +       int "Default max job timeout (ms)"
> > > +       default 10000 # milliseconds
> > > +       help
> > > +         Configures the default max job timeout after which job will
> > > +         be forcefully taken away from scheduler.
> > > +config DRM_XE_JOB_TIMEOUT_MIN
> > > +       int "Default max job timeout (ms)"
> > > +       default 1 # milliseconds
> > > +       help
> > > +         Configures the default min job timeout after which job will
> > > +         be forcefully taken away from scheduler.
> > > +config DRM_XE_TIMESLICE_MAX
> > > +       int "Default max timeslice duration (us)"
> > > +       default 10000000 # microseconds
> > > +       help
> > > +         Configures the default max timeslice duration between multiple
> > > +         contexts by guc scheduling.
> > > +config DRM_XE_TIMESLICE_MIN
> > > +       int "Default min timeslice duration (us)"
> > > +       default 1 # microseconds
> > > +       help
> > > +         Configures the default min timeslice duration between multiple
> > > +         contexts by guc scheduling.
> > > +config DRM_XE_PREEMPT_TIMEOUT_MAX
> > > +       int "Default max  preempt timeout (us)"
> > > +       default 10000000 # microseconds
> > > +       help
> > > +         Configures the default max preempt timeout after which context
> > > +         will be forcefully taken away and higher priority context will
> > > +         run.
> > > +config DRM_XE_PREEMPT_TIMEOUT_MIN
> > > +       int "Default min  preempt timeout (us)"
> > > +       default 1 # microseconds
> > > +       help
> > > +         Configures the default min preempt timeout after which context
> > > +         will be forcefully taken away and higher priority context will
> > > +         run.
> > > +config DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
> > > +       bool "Default configuration of limitation on scheduler timeout"
> > > +       default y
> > > +       help
> > > +	 Configures the enablement of limitation on scheduler timeout
> > > +	 to apply to applicable user. For elevated user, all above MIN
> > > +	 and MAX values will apply when this configuration is enable to
> > > +	 apply limitation. By default limitation is applied.
> > > diff --git a/drivers/gpu/drm/xe/xe_engine.c
> > > b/drivers/gpu/drm/xe/xe_engine.c index 9e167b113963..a558918f9a64
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_engine.c
> > > +++ b/drivers/gpu/drm/xe/xe_engine.c
> > > @@ -12,6 +12,7 @@
> > >  #include <drm/xe_drm.h>
> > >
> > >  #include "xe_device.h"
> > > +#include "xe_engine_class_sysfs.h"
> > >  #include "xe_gt.h"
> > >  #include "xe_hw_fence.h"
> > >  #include "xe_lrc.h"
> > > @@ -191,8 +192,17 @@ static int engine_set_priority(struct xe_device
> > > *xe, struct xe_engine *e,  static int engine_set_timeslice(struct xe_device
> > *xe, struct xe_engine *e,
> > >  				u64 value, bool create)
> > >  {
> > > -	if (!capable(CAP_SYS_NICE))
> > > -		return -EPERM;
> > > +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> > > +	u32 min = XE_HW_ENGINE_TIMESLICE_MIN;
> > > +	u32 max = XE_HW_ENGINE_TIMESLICE_MAX; #else
> > > +	u32 min = e->hwe->eclass->sched_props.timeslice_min;
> > > +	u32 max = e->hwe->eclass->sched_props.timeslice_max;
> > > +#endif
> > 
> > The min / max here should just be e->hwe->eclass->sched_props, right? We
> > enforce that the user cannot change these values via sysfs to an illegal value.
> 
> We also enforce elevated user to not violate compile configs min/max when CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT is enabled.
> 

But still this doesn't make any sense to have this in two places, the
sysfs is the only place where we need to check this.

As you have it coded if CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT is
enabled then the min / max sysfs entries are basically unused. We want
the sysfs entries to be bounds and the user can only set the sysfs
entries to within the Kconfig allowed range. We know the sysfs entries
are within the bounds, thus we only check the sysfs entries. It also
allows the user to do something like this.

KCONFIG_MIN=5
KCONFIG_MAX=10

user set sysfs MIN=2	# rejected by the kernel
user set via IOCTL=6	# Allowed
user set sysfs MIN=8	# Allowed
user set via IOCTL=6	# Rejected

Following this logic you only need to enforce
CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT when setting the min / max sysfs
entries, everywhere else just use e->hwe->eclass->sched_props for the
bounds checks.

Matt

> Thanks,
> Tejas
> > 
> > Matt
> > 
> > > +
> > > +	if (enforce_schedule_limit() &&
> > > +	    !engine_timeout_in_range(value, min, max))
> > > +		return -EINVAL;
> > >
> > >  	return e->ops->set_timeslice(e, value);  } @@ -201,8 +211,17 @@
> > > static int engine_set_preemption_timeout(struct xe_device *xe,
> > >  					 struct xe_engine *e, u64 value,
> > >  					 bool create)
> > >  {
> > > -	if (!capable(CAP_SYS_NICE))
> > > -		return -EPERM;
> > > +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> > > +	u32 min = XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
> > > +	u32 max = XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX; #else
> > > +	u32 min = e->hwe->eclass->sched_props.preempt_timeout_min;
> > > +	u32 max = e->hwe->eclass->sched_props.preempt_timeout_max;
> > > +#endif
> > > +
> > > +	if (enforce_schedule_limit() &&
> > > +	    !engine_timeout_in_range(value, min, max))
> > > +		return -EINVAL;
> > >
> > >  	return e->ops->set_preempt_timeout(e, value);  } @@ -266,11
> > +285,20
> > > @@ static int engine_set_persistence(struct xe_device *xe, struct
> > > xe_engine *e,  static int engine_set_job_timeout(struct xe_device *xe,
> > struct xe_engine *e,
> > >  				  u64 value, bool create)
> > >  {
> > > +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> > > +	u32 min = XE_HW_ENGINE_JOB_TIMEOUT_MIN;
> > > +	u32 max = XE_HW_ENGINE_JOB_TIMEOUT_MAX; #else
> > > +	u32 min = e->hwe->eclass->sched_props.job_timeout_min;
> > > +	u32 max = e->hwe->eclass->sched_props.job_timeout_max;
> > > +#endif
> > > +
> > >  	if (XE_IOCTL_DBG(xe, !create))
> > >  		return -EINVAL;
> > >
> > > -	if (!capable(CAP_SYS_NICE))
> > > -		return -EPERM;
> > > +	if (enforce_schedule_limit() &&
> > > +	    !engine_timeout_in_range(value, min, max))
> > > +		return -EINVAL;
> > >
> > >  	return e->ops->set_job_timeout(e, value);  } diff --git
> > > a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> > > b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> > > index 569d5f89310e..4a749e91de5d 100644
> > > --- a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> > > +++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> > > @@ -11,6 +11,20 @@
> > >
> > >  static int xe_add_engine_class_defaults(struct kobject *parent);
> > >
> > > +bool enforce_schedule_limit(void)
> > > +{
> > > +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> > > +	return true;
> > > +#else
> > > +	return !capable(CAP_SYS_NICE);
> > > +#endif
> > > +}
> > > +
> > > +bool engine_timeout_in_range(u64 timeout, u64 min, u64 max) {
> > > +	return timeout >= min && timeout <= max; }
> > > +
> > >  static void kobj_xe_engine_release(struct kobject *kobj)  {
> > >  	kfree(kobj);
> > > @@ -39,11 +53,92 @@ kobj_xe_engine(struct kobject *parent, char
> > *name)
> > >  	return keclass;
> > >  }
> > >
> > > +static ssize_t job_timeout_max_store(struct kobject *kobj,
> > > +				     struct kobj_attribute *attr,
> > > +				     const char *buf, size_t count) {
> > > +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > +	u32 timeout;
> > > +	int err;
> > > +
> > > +	err = kstrtou32(buf, 0, &timeout);
> > > +	if (err)
> > > +		return err;
> > > +
> > > +	if (timeout < eclass->sched_props.job_timeout_min)
> > > +		return -EINVAL;
> > > +
> > > +	if (enforce_schedule_limit() &&
> > > +	    !engine_timeout_in_range(timeout,
> > > +				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> > > +				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> > > +		return -EINVAL;
> > > +
> > > +	WRITE_ONCE(eclass->sched_props.job_timeout_max, timeout);
> > > +
> > > +	return count;
> > > +}
> > > +
> > > +static ssize_t job_timeout_max_show(struct kobject *kobj,
> > > +				    struct kobj_attribute *attr, char *buf) {
> > > +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > +
> > > +	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_max);
> > > +}
> > > +
> > > +static struct kobj_attribute job_timeout_max_attr =
> > > +__ATTR(job_timeout_max, 0644, job_timeout_max_show,
> > > +job_timeout_max_store);
> > > +
> > > +static ssize_t job_timeout_min_store(struct kobject *kobj,
> > > +				     struct kobj_attribute *attr,
> > > +				     const char *buf, size_t count) {
> > > +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > +	u32 timeout;
> > > +	int err;
> > > +
> > > +	err = kstrtou32(buf, 0, &timeout);
> > > +	if (err)
> > > +		return err;
> > > +
> > > +	if (timeout > eclass->sched_props.job_timeout_max)
> > > +		return -EINVAL;
> > > +
> > > +	if (enforce_schedule_limit() &&
> > > +	    !engine_timeout_in_range(timeout,
> > > +				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> > > +				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> > > +		return -EINVAL;
> > > +
> > > +	WRITE_ONCE(eclass->sched_props.job_timeout_min, timeout);
> > > +
> > > +	return count;
> > > +}
> > > +
> > > +static ssize_t job_timeout_min_show(struct kobject *kobj,
> > > +				    struct kobj_attribute *attr, char *buf) {
> > > +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > +
> > > +	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_min);
> > > +}
> > > +
> > > +static struct kobj_attribute job_timeout_min_attr =
> > > +__ATTR(job_timeout_min, 0644, job_timeout_min_show,
> > > +job_timeout_min_store);
> > > +
> > >  static ssize_t job_timeout_store(struct kobject *kobj,
> > >  				 struct kobj_attribute *attr,
> > >  				 const char *buf, size_t count)
> > >  {
> > >  	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> > > +	u32 min = XE_HW_ENGINE_JOB_TIMEOUT_MIN;
> > > +	u32 max = XE_HW_ENGINE_JOB_TIMEOUT_MAX; #else
> > > +	u32 min = e->hwe->eclass->sched_props.job_timeout_min;
> > > +	u32 max = e->hwe->eclass->sched_props.job_timeout_max;
> > > +#endif
> > >  	u32 timeout;
> > >  	int err;
> > >
> > > @@ -51,6 +146,10 @@ static ssize_t job_timeout_store(struct kobject
> > *kobj,
> > >  	if (err)
> > >  		return err;
> > >
> > > +	if (enforce_schedule_limit() &&
> > > +	    !engine_timeout_in_range(timeout, min, max))
> > > +		return -EINVAL;
> > > +
> > >  	WRITE_ONCE(eclass->sched_props.job_timeout_ms, timeout);
> > >
> > >  	return count;
> > > @@ -78,11 +177,40 @@ static ssize_t job_timeout_default(struct kobject
> > > *kobj,  static struct kobj_attribute job_timeout_def =
> > > __ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
> > >
> > > +static ssize_t job_timeout_min_default(struct kobject *kobj,
> > > +				       struct kobj_attribute *attr, char *buf) {
> > > +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
> > > +
> > > +	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_min);
> > > +}
> > > +
> > > +static struct kobj_attribute job_timeout_min_def =
> > > +__ATTR(job_timeout_min, 0444, job_timeout_min_default, NULL);
> > > +
> > > +static ssize_t job_timeout_max_default(struct kobject *kobj,
> > > +				       struct kobj_attribute *attr, char *buf) {
> > > +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
> > > +
> > > +	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_max);
> > > +}
> > > +
> > > +static struct kobj_attribute job_timeout_max_def =
> > > +__ATTR(job_timeout_max, 0444, job_timeout_max_default, NULL);
> > > +
> > >  static ssize_t timeslice_duration_store(struct kobject *kobj,
> > >  					struct kobj_attribute *attr,
> > >  					const char *buf, size_t count)
> > >  {
> > >  	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> > > +	u32 min = XE_HW_ENGINE_TIMESLICE_MIN;
> > > +	u32 max = XE_HW_ENGINE_TIMESLICE_MAX; #else
> > > +	u32 min = e->hwe->eclass->sched_props.timeslice_min;
> > > +	u32 max = e->hwe->eclass->sched_props.timeslice_max;
> > > +#endif
> > >  	u32 duration;
> > >  	int err;
> > >
> > > @@ -90,11 +218,92 @@ static ssize_t timeslice_duration_store(struct
> > kobject *kobj,
> > >  	if (err)
> > >  		return err;
> > >
> > > +	if (enforce_schedule_limit() &&
> > > +	    !engine_timeout_in_range(duration, min, max))
> > > +		return -EINVAL;
> > > +
> > >  	WRITE_ONCE(eclass->sched_props.timeslice_us, duration);
> > >
> > >  	return count;
> > >  }
> > >
> > > +static ssize_t timeslice_duration_max_store(struct kobject *kobj,
> > > +					    struct kobj_attribute *attr,
> > > +					    const char *buf, size_t count) {
> > > +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > +	u32 duration;
> > > +	int err;
> > > +
> > > +	err = kstrtou32(buf, 0, &duration);
> > > +	if (err)
> > > +		return err;
> > > +
> > > +	if (duration < eclass->sched_props.timeslice_min)
> > > +		return -EINVAL;
> > > +
> > > +	if (enforce_schedule_limit() &&
> > > +	    !engine_timeout_in_range(duration,
> > > +				     XE_HW_ENGINE_TIMESLICE_MIN,
> > > +				     XE_HW_ENGINE_TIMESLICE_MAX))
> > > +		return -EINVAL;
> > > +
> > > +	WRITE_ONCE(eclass->sched_props.timeslice_max, duration);
> > > +
> > > +	return count;
> > > +}
> > > +
> > > +static ssize_t timeslice_duration_max_show(struct kobject *kobj,
> > > +		struct kobj_attribute *attr,
> > > +		char *buf)
> > > +{
> > > +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > +
> > > +	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_max);
> > > +}
> > > +
> > > +static struct kobj_attribute timeslice_duration_max_attr =
> > > +	__ATTR(timeslice_duration_max, 0644,
> > timeslice_duration_max_show,
> > > +	       timeslice_duration_max_store);
> > > +
> > > +static ssize_t timeslice_duration_min_store(struct kobject *kobj,
> > > +					    struct kobj_attribute *attr,
> > > +					    const char *buf, size_t count) {
> > > +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > +	u32 duration;
> > > +	int err;
> > > +
> > > +	err = kstrtou32(buf, 0, &duration);
> > > +	if (err)
> > > +		return err;
> > > +
> > > +	if (duration > eclass->sched_props.timeslice_max)
> > > +		return -EINVAL;
> > > +
> > > +	if (enforce_schedule_limit() &&
> > > +	    !engine_timeout_in_range(duration,
> > > +				     XE_HW_ENGINE_TIMESLICE_MIN,
> > > +				     XE_HW_ENGINE_TIMESLICE_MAX))
> > > +		return -EINVAL;
> > > +
> > > +	WRITE_ONCE(eclass->sched_props.timeslice_min, duration);
> > > +
> > > +	return count;
> > > +}
> > > +
> > > +static ssize_t timeslice_duration_min_show(struct kobject *kobj,
> > > +					   struct kobj_attribute *attr, char
> > *buf) {
> > > +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > +
> > > +	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_min);
> > > +}
> > > +
> > > +static struct kobj_attribute timeslice_duration_min_attr =
> > > +	__ATTR(timeslice_duration_min, 0644,
> > timeslice_duration_min_show,
> > > +	       timeslice_duration_min_store);
> > > +
> > >  static ssize_t timeslice_duration_show(struct kobject *kobj,
> > >  		struct kobj_attribute *attr, char *buf)  { @@ -118,11 +327,40
> > @@
> > > static ssize_t timeslice_default(struct kobject *kobj,  static struct
> > > kobj_attribute timeslice_duration_def =  __ATTR(timeslice_duration_us,
> > > 0444, timeslice_default, NULL);
> > >
> > > +static ssize_t timeslice_min_default(struct kobject *kobj,
> > > +				     struct kobj_attribute *attr, char *buf) {
> > > +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
> > > +
> > > +	return sprintf(buf, "%u\n", eclass->defaults.timeslice_min); }
> > > +
> > > +static struct kobj_attribute timeslice_duration_min_def =
> > > +__ATTR(timeslice_duration_min, 0444, timeslice_min_default, NULL);
> > > +
> > > +static ssize_t timeslice_max_default(struct kobject *kobj,
> > > +				     struct kobj_attribute *attr, char *buf) {
> > > +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
> > > +
> > > +	return sprintf(buf, "%u\n", eclass->defaults.timeslice_max); }
> > > +
> > > +static struct kobj_attribute timeslice_duration_max_def =
> > > +__ATTR(timeslice_duration_max, 0444, timeslice_max_default, NULL);
> > > +
> > >  static ssize_t preempt_timeout_store(struct kobject *kobj,
> > >  				     struct kobj_attribute *attr,
> > >  				     const char *buf, size_t count)  {
> > >  	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> > > +	u32 min = XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
> > > +	u32 max = XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX; #else
> > > +	u32 min = e->hwe->eclass->sched_props.preempt_timeout_min;
> > > +	u32 max = e->hwe->eclass->sched_props.preempt_timeout_max;
> > > +#endif
> > >  	u32 timeout;
> > >  	int err;
> > >
> > > @@ -130,6 +368,10 @@ static ssize_t preempt_timeout_store(struct
> > kobject *kobj,
> > >  	if (err)
> > >  		return err;
> > >
> > > +	if (enforce_schedule_limit() &&
> > > +	    !engine_timeout_in_range(timeout, min, max))
> > > +		return -EINVAL;
> > > +
> > >  	WRITE_ONCE(eclass->sched_props.preempt_timeout_us, timeout);
> > >
> > >  	return count;
> > > @@ -158,17 +400,129 @@ static ssize_t preempt_timeout_default(struct
> > > kobject *kobj,  static struct kobj_attribute preempt_timeout_def =
> > > __ATTR(preempt_timeout_us, 0444, preempt_timeout_default, NULL);
> > >
> > > +static ssize_t preempt_timeout_min_default(struct kobject *kobj,
> > > +					   struct kobj_attribute *attr,
> > > +					   char *buf)
> > > +{
> > > +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
> > > +
> > > +	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_min);
> > > +}
> > > +
> > > +static struct kobj_attribute preempt_timeout_min_def =
> > > +__ATTR(preempt_timeout_min, 0444, preempt_timeout_min_default,
> > NULL);
> > > +
> > > +static ssize_t preempt_timeout_max_default(struct kobject *kobj,
> > > +					   struct kobj_attribute *attr,
> > > +					   char *buf)
> > > +{
> > > +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
> > > +
> > > +	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_max);
> > > +}
> > > +
> > > +static struct kobj_attribute preempt_timeout_max_def =
> > > +__ATTR(preempt_timeout_max, 0444, preempt_timeout_max_default,
> > NULL);
> > > +
> > > +static ssize_t preempt_timeout_max_store(struct kobject *kobj,
> > > +					 struct kobj_attribute *attr,
> > > +					 const char *buf, size_t count)
> > > +{
> > > +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > +	u32 timeout;
> > > +	int err;
> > > +
> > > +	err = kstrtou32(buf, 0, &timeout);
> > > +	if (err)
> > > +		return err;
> > > +
> > > +	if (timeout < eclass->sched_props.preempt_timeout_min)
> > > +		return -EINVAL;
> > > +
> > > +	if (enforce_schedule_limit() &&
> > > +	    !engine_timeout_in_range(timeout,
> > > +
> > XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> > > +
> > XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> > > +		return -EINVAL;
> > > +
> > > +	WRITE_ONCE(eclass->sched_props.preempt_timeout_max, timeout);
> > > +
> > > +	return count;
> > > +}
> > > +
> > > +static ssize_t preempt_timeout_max_show(struct kobject *kobj,
> > > +					struct kobj_attribute *attr, char *buf)
> > {
> > > +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > +
> > > +	return sprintf(buf, "%u\n",
> > > +eclass->sched_props.preempt_timeout_max);
> > > +}
> > > +
> > > +static struct kobj_attribute preempt_timeout_max_attr =
> > > +	__ATTR(preempt_timeout_max, 0644, preempt_timeout_max_show,
> > > +	       preempt_timeout_max_store);
> > > +
> > > +static ssize_t preempt_timeout_min_store(struct kobject *kobj,
> > > +					 struct kobj_attribute *attr,
> > > +					 const char *buf, size_t count)
> > > +{
> > > +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > +	u32 timeout;
> > > +	int err;
> > > +
> > > +	err = kstrtou32(buf, 0, &timeout);
> > > +	if (err)
> > > +		return err;
> > > +
> > > +	if (timeout > eclass->sched_props.preempt_timeout_max)
> > > +		return -EINVAL;
> > > +
> > > +	if (enforce_schedule_limit() &&
> > > +	    !engine_timeout_in_range(timeout,
> > > +
> > XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> > > +
> > XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> > > +		return -EINVAL;
> > > +
> > > +	WRITE_ONCE(eclass->sched_props.preempt_timeout_min, timeout);
> > > +
> > > +	return count;
> > > +}
> > > +
> > > +static ssize_t preempt_timeout_min_show(struct kobject *kobj,
> > > +					struct kobj_attribute *attr, char *buf)
> > {
> > > +	struct xe_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > +
> > > +	return sprintf(buf, "%u\n",
> > > +eclass->sched_props.preempt_timeout_min);
> > > +}
> > > +
> > > +static struct kobj_attribute preempt_timeout_min_attr =
> > > +	__ATTR(preempt_timeout_min, 0644, preempt_timeout_min_show,
> > > +	       preempt_timeout_min_store);
> > > +
> > >  static const struct attribute *defaults[] = {
> > >  	&job_timeout_def.attr,
> > > +	&job_timeout_min_def.attr,
> > > +	&job_timeout_max_def.attr,
> > >  	&timeslice_duration_def.attr,
> > > +	&timeslice_duration_min_def.attr,
> > > +	&timeslice_duration_max_def.attr,
> > >  	&preempt_timeout_def.attr,
> > > +	&preempt_timeout_min_def.attr,
> > > +	&preempt_timeout_max_def.attr,
> > >  	NULL
> > >  };
> > >
> > >  static const struct attribute *files[] = {
> > >  	&job_timeout_attr.attr,
> > > +	&job_timeout_min_attr.attr,
> > > +	&job_timeout_max_attr.attr,
> > >  	&timeslice_duration_attr.attr,
> > > +	&timeslice_duration_min_attr.attr,
> > > +	&timeslice_duration_max_attr.attr,
> > >  	&preempt_timeout_attr.attr,
> > > +	&preempt_timeout_min_attr.attr,
> > > +	&preempt_timeout_max_attr.attr,
> > >  	NULL
> > >  };
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
> > > b/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
> > > index 683726563059..33c458606117 100644
> > > --- a/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
> > > +++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
> > > @@ -10,6 +10,8 @@
> > >
> > >  #define MAX_ENGINE_CLASS_NAME_LEN    16
> > >  int xe_engine_class_sysfs_init(struct xe_gt *gt);
> > > +bool enforce_schedule_limit(void);
> > > +bool engine_timeout_in_range(u64 timeout, u64 min, u64 max);
> > >
> > >  /**
> > >   * struct kobj_eclass - A eclass's kobject struct that connects the
> > > kobject and the diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > index 96c32a815c90..06a98ea9800b 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > @@ -364,8 +364,16 @@ static void hw_engine_init_early(struct xe_gt
> > > *gt, struct xe_hw_engine *hwe,
> > >
> > >  	if (!gt->eclass[hwe->class].init_done) {
> > >  		gt->eclass[hwe->class].sched_props.job_timeout_ms = HZ *
> > 5;
> > > +		gt->eclass[hwe->class].sched_props.job_timeout_min =
> > XE_HW_ENGINE_JOB_TIMEOUT_MIN;
> > > +		gt->eclass[hwe->class].sched_props.job_timeout_max =
> > > +XE_HW_ENGINE_JOB_TIMEOUT_MAX;
> > >  		gt->eclass[hwe->class].sched_props.timeslice_us = 1 * 1000;
> > > +		gt->eclass[hwe->class].sched_props.timeslice_min =
> > XE_HW_ENGINE_TIMESLICE_MIN;
> > > +		gt->eclass[hwe->class].sched_props.timeslice_max =
> > > +XE_HW_ENGINE_TIMESLICE_MAX;
> > >  		gt->eclass[hwe->class].sched_props.preempt_timeout_us =
> > 640 * 1000;
> > > +		gt->eclass[hwe->class].sched_props.preempt_timeout_min =
> > > +
> > 	XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
> > > +		gt->eclass[hwe->class].sched_props.preempt_timeout_max =
> > > +
> > 	XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
> > >  		/* Record default props */
> > >  		gt->eclass[hwe->class].defaults = gt->eclass[hwe-
> > >class].sched_props;
> > >  		gt->eclass[hwe->class].init_done = true; diff --git
> > > a/drivers/gpu/drm/xe/xe_hw_engine.h
> > > b/drivers/gpu/drm/xe/xe_hw_engine.h
> > > index 7eca9d53c7b1..3d37d6d44261 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> > > @@ -10,6 +10,37 @@
> > >
> > >  struct drm_printer;
> > >
> > > +#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> > > +#define XE_HW_ENGINE_JOB_TIMEOUT_MIN
> > CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> > > +#else #define XE_HW_ENGINE_JOB_TIMEOUT_MIN 1 #endif #ifdef
> > > +CONFIG_DRM_XE_JOB_TIMEOUT_MAX #define
> > XE_HW_ENGINE_JOB_TIMEOUT_MAX
> > > +CONFIG_DRM_XE_JOB_TIMEOUT_MAX #else #define
> > > +XE_HW_ENGINE_JOB_TIMEOUT_MAX (10 * 1000) #endif #ifdef
> > > +CONFIG_DRM_XE_TIMESLICE_MIN #define
> > XE_HW_ENGINE_TIMESLICE_MIN
> > > +CONFIG_DRM_XE_TIMESLICE_MIN #else #define
> > XE_HW_ENGINE_TIMESLICE_MIN
> > > +1 #endif #ifdef CONFIG_DRM_XE_TIMESLICE_MAX #define
> > > +XE_HW_ENGINE_TIMESLICE_MAX CONFIG_DRM_XE_TIMESLICE_MAX
> > #else #define
> > > +XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000) #endif #ifdef
> > > +CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
> > > +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN
> > > +CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN #else #define
> > > +XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 1 #endif #ifdef
> > > +CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
> > > +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX
> > > +CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX #else #define
> > > +XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX (10 * 1000 * 1000) #endif
> > > +
> > >  int xe_hw_engines_init_early(struct xe_gt *gt);  int
> > > xe_hw_engines_init(struct xe_gt *gt);  void
> > > xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
> > > --
> > > 2.25.1
> > >
