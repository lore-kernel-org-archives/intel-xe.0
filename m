Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E10C0015E
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 05:05:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E432010E012;
	Fri, 28 Jul 2023 05:05:49 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8151110E012
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 05:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690520747; x=1722056747;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qqEdhnpDaoOzvUBmDyp3GSoL2OJNgYtMO6W/IroUNzU=;
 b=IALmkvaGlO6P0ZP+FMTNPBrvmFYxXMl2eA5qz8wH0YEpdzcu6cbfJihf
 l7cjNFg+MdN0M0xKROBYQqVlY6QkmCErtcmh1Ar3m/Bne5kovIcRRZR0d
 Fxsnr/bkPFse1VE22LLCOiWvvB92knb5rVZt1o0+AfV2hBRXgkx2FGayP
 hOulkUx1ydnUuOm8/ITymAUERZsbvzXlrBIAzA9IV93q/yK4X5G8zsxM/
 wQQ8SnEWpciN3aqLxMMJCBtBoDLZfIe4NoiL+QuGjvWyc8f2B/0h5bp7j
 fWj0WYG7BLm09n2RH0Fil8PXEJNgwWb8pmrE3hTP/V/07XbmfU/t338wN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="365966587"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="365966587"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 22:05:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="757007535"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="757007535"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 27 Jul 2023 22:05:46 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 22:05:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 22:05:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 22:05:45 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 22:05:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYTYTqP777sZWJxJAC/qTQiDEkCKM5WCHD1j/e+dGjyD7WMZayLlOGx40I6G+v1bOSzVbFJLYEB8OhiHpguDKHcXqCi6EnrnrLN/F2fDxlhs9KuQVUbrxCbP/FBTkJv/9H5JC2a7KVaZdUP55hDsbLJKJfWIXF5hxLrFP1ggws6P0MjiH3kGG9CAFygCYzeXx6K5hWRgi/LBxtO0KMsyCZZs2TSOR6IsooilwhcmXd+qEkysFcuxwj8e6drEf0hF06ksXZJ1FnaAEkSu8YHxSujR4UsSqvQMv7nZPvnmjTTIZP76HQv+0Qux8c6kRC9BT9eAeDlqcK3aIsBPdT+McQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rGSpMA3LJNZb4Jk3Dtx5hbmvQiLzZNjC/suPF9xlSbk=;
 b=TD6dsaMMrRQ/Rb4d0kZ1vYqkKOsX3pRpf1W9CN2ZnwRijVJT6Iyk254LWDCr+EKYzUr3wylqfriWV5x4WvQHlURt+3lI+tpL0ZE1GFazZPPR7PSECY0PoO79KYdqghsu+enQEL0TyxENvzCs2ZtC56HYOs5fgLI1GfLKjXs6yHQtCeNZNyN8/LbHikeDjKKKfYQr5okDoQyecd3f6TjNhpBmJTYTkh7V511SWdKrCrkDqUcRwZ2FqQZMtejYgxOT0lVE8M6is4/KOW+mSuzgdz5Mut76gG/wkSoEu2NsrY8X/x2VTSbtlFEDP3HbbmifhDHZHm/zB7OdARSHY+8GoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7662.namprd11.prod.outlook.com (2603:10b6:510:27d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Fri, 28 Jul
 2023 05:05:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 05:05:40 +0000
Date: Fri, 28 Jul 2023 05:04:52 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <ZMNMdIXaJrm4RKGJ@DUT025-TGLU.fm.intel.com>
References: <20230727082235.905240-1-tejas.upadhyay@intel.com>
 <20230727082235.905240-7-tejas.upadhyay@intel.com>
 <ZMKMuWeQBXsSo2Sb@DUT025-TGLU.fm.intel.com>
 <ZMNHp1f+wwyd9ZTB@nvishwa1-DESK>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZMNHp1f+wwyd9ZTB@nvishwa1-DESK>
X-ClientProxiedBy: BYAPR06CA0008.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7662:EE_
X-MS-Office365-Filtering-Correlation-Id: e20703ed-4d88-4989-d6d7-08db8f2849fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: STCJ7EirnkQ9WlR3jse0j6sp7iqs/Crx3NuctYm3BaseZ2j4aDADZFsbuXXL7Z5UrFXyoWW2UZ+4vQGInG8+MmwxmRGjFQdu4DonFMBIW1itBHm/JbcmP1+cdrco3VcjwNvTurHGUN58HWKy2eYrYjXBtEQL8vt8kidaEpMAhV0+BDvAaK5mNaWp5UTfEYPQIef8TZFxK1qtPDMxEAOOhiKkVMuJEb3JfhCD5RjZ3C7swv5Uz/wFQG/5dq7+bSV/vWKn9hPk/1OnZuofyuLd8al6EDfIKtFxWzftS0T9aXCiZwPvIPL8AchFmKDN8m4JUgam+U2kG54PkbvdkR+2h1qguc34V6HCcUiIgbI5IFh6eLD5oivGYsJXqo1WeTBxVhHuZnUIgaw0N/TB2M9FRoLImnZxJOaNdFwbttGqSvb8rcqBwbJb9zJbrbjuxGYUq3jdvLCI2qF8qE/t9IA7UM4U5dcMOwEAzHEtpQPgHQ5OJERCREVjXpGYcRDIKkDSq2AnYa/vebXP0w/tmaS2ZaXAr4mYvXyzOuXpqpLmN3n0dfQsg5/CqXvabrgoaypz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(136003)(396003)(376002)(366004)(451199021)(83380400001)(30864003)(19627235002)(82960400001)(38100700002)(2906002)(26005)(66556008)(66476007)(5660300002)(4326008)(316002)(66946007)(6636002)(186003)(6506007)(6666004)(6512007)(6486002)(44832011)(41300700001)(86362001)(6862004)(478600001)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kvrnjdXY2urdXAn3wEICsGlXLxSsrVdC71QkGbM/91v7tzza70BEXx2BywnZ?=
 =?us-ascii?Q?6yzA+ZEzHovCyQ9U7O8gdvGt4Rn8NPNBx2M6tlPg2LCRqc04Oi66clRgCFkg?=
 =?us-ascii?Q?eoZ7OlSKnNm3Iw8Xn3u0u0Wl2JshZVIefwnsk4Do/TGJy8da4lfl4sLLeHFG?=
 =?us-ascii?Q?Ue6Kma5cwjJz2hOKk2rkuX0RAOfPJzhq5pazX7xTKMBjyW+smBES4tGr/Al9?=
 =?us-ascii?Q?YGNzykfVrhqDk+hR052xbMwfgRG+ghWn9fThEryzUECU+j9ZI33wIpQvjqPX?=
 =?us-ascii?Q?av6OjTYd+YUz9KHiZBlQ/hKTQtOM8fHW3a9sHXpYIxI7rIsujiMNTFIxabVM?=
 =?us-ascii?Q?wVfFKkiSr4ATqGqxV3xqC0Ykqnwz6Nzf1HQ6YDdOtpnWEHOwlCwgLmaCx7z5?=
 =?us-ascii?Q?Zt7MjcEvPKVuT3+YVFsQy2X9toc/t3T7SYXfPgBLI8Ihnv0F46eTpizS4S6C?=
 =?us-ascii?Q?sNjYuxWaz/ylScDzp+94udrERZAO3zZcjWabggWOZUkMDtrXBnWi5O/2R04S?=
 =?us-ascii?Q?G3wZwzrtc1By4bwsZpdCZws4Z+GUZVscg/OapjI6MbYFnuqXDqhtnrF3Zvfx?=
 =?us-ascii?Q?Hcxd0BHaPHuMC0JCgqtcEUFelJd+Y7Poz3qrjC/JvmO6CsC7y9H9mCxshmKb?=
 =?us-ascii?Q?0vXVsX0cgC67+ADe1PdQuN7DDnZEF3E9xKtrZPXaX9WhB8tMecD6IRzIy/CS?=
 =?us-ascii?Q?YvKXqO2NMX/K9V8oW/UYoou3iehhDqETjU4kwRbX/+nIWn6O4L8BS0LbsZAY?=
 =?us-ascii?Q?S+EUxY0jAvNhI4bms0Z9nbRoCwltLo8/6sw6RKbtsjR1e0oBxe1yMSj9hYRi?=
 =?us-ascii?Q?AA7V/q93gugUQxGR/9qO1SLyw86hW6XCuxVoyFw97oOF71iTVkZ2Y89bEvT1?=
 =?us-ascii?Q?bUWrlo+BPGFCJBRU7cHC9RY1T2ar7qJImG15hMqwJkE0e4HjEek7PfsYqFJ2?=
 =?us-ascii?Q?ry+BpKDTHwEEgDwb8+hybb/SUJ/zVoPr3oxlKK2SBwP0Lp541Z9mmHNz41Nx?=
 =?us-ascii?Q?5Rl32oFaTJMhuhspMSHzEglRqJAWQ0Slw45MyE7swpYm1mKJtJBqkfxwSm7X?=
 =?us-ascii?Q?MnonFgjj2scDOeYJ2UaXNnKeMtlKfL1pXaadkXfW2unQ6F2AdFdjFO4nIuEQ?=
 =?us-ascii?Q?bR5YOqb1jj37OvxQj3IE7SuqPatGJ/JjuWcN7yHeXRroAdV1QpmWo/K/Cq+K?=
 =?us-ascii?Q?zWMR9qW2c8gK6ajJKvZjzaue1UBBTF1bBnX5vMVmmIvG2cWH6j1y9wuSIdjx?=
 =?us-ascii?Q?GglfNyzxaCAJCvEecA++UgxhZamAOr24CdtJWmGry2jxfXMXFXVsFRRUcrDy?=
 =?us-ascii?Q?qfQAWa2s4zuKQv5fqCiZkdZTar+i2dUWTWzH24aDYpoLbJo/AQ4Q8vy7X7F8?=
 =?us-ascii?Q?5OVS4W4k7JjPAOy/OPWai7GBKCEax1nSRiUs6r3yHVlP47VtjxAWd/ARYidC?=
 =?us-ascii?Q?WqHbVrVG3s6VO/5t+84LShN712bLV3I8St8LF9VTAMHIjs0xxu2xciVugor7?=
 =?us-ascii?Q?4+dNXlWBilR/5aLMR5Llo0vrYrLp4HcIWI7KOzm42yrKpPE6PhrY1PY6FcTQ?=
 =?us-ascii?Q?a8fdCZsMzs+Kwr1tcUHgLNgZmhAtUUU0U4Hb+JKsghMjiGuJUPLRiSeypT06?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e20703ed-4d88-4989-d6d7-08db8f2849fb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 05:05:40.7343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OYnz/G0nV63ZysMub0zilG6l3h1yFELbEwdGHF59bVOGbWRpzbAFKYbrr+c7Onu+AxAyeYj5UqLuuot0LaqLtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7662
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V9 6/6] drm/xe: Add min/max cap for engine
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jul 27, 2023 at 09:44:23PM -0700, Niranjana Vishwanathapura wrote:
> On Thu, Jul 27, 2023 at 03:26:49PM +0000, Matthew Brost wrote:
> > On Thu, Jul 27, 2023 at 01:52:35PM +0530, Tejas Upadhyay wrote:
> > > Add sysfs entries for the min, max, and defaults for each of
> > > engine scheduler controls for every hardware engine class.
> > > 
> > > Non-elevated user IOCTLs to set these controls must be within
> > > the min-max ranges of the sysfs entries, elevated user can set
> > > these controls to any value. However, introduced compile time
> > > CONFIG min-max values which restricts elevated user to be in
> > > compile time min-max range if at all sysfs min/max are violated.
> > > 
> > > Sysfs entries examples are,
> > > DUT# cat /sys/class/drm/cardX/device/tileN/gtN/engines/ccs/.defaults/
> > > job_timeout_max         job_timeout_ms          preempt_timeout_min     timeslice_duration_max  timeslice_duration_us
> > > job_timeout_min         preempt_timeout_max     preempt_timeout_us      timeslice_duration_min
> > > 
> > > DUT# cat /sys/class/drm/card1/device/tileN/gtN/engines/ccs/
> > > .defaults/              job_timeout_min         preempt_timeout_max     preempt_timeout_us      timeslice_duration_min
> > > job_timeout_max         job_timeout_ms          preempt_timeout_min     timeslice_duration_max  timeslice_duration_us
> > > 
> > > V9 :
> > >    - Rebase to use s/xe_engine/xe_hw_engine/ - Matt
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
> > >  drivers/gpu/drm/xe/Kconfig                    |   6 +
> > >  drivers/gpu/drm/xe/Kconfig.profile            |  46 +++
> > >  drivers/gpu/drm/xe/xe_engine.c                |  25 +-
> > >  drivers/gpu/drm/xe/xe_hw_engine.c             |   8 +
> > >  drivers/gpu/drm/xe/xe_hw_engine.h             |  31 ++
> > >  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 354 ++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h |   2 +
> > >  7 files changed, 466 insertions(+), 6 deletions(-)
> > >  create mode 100644 drivers/gpu/drm/xe/Kconfig.profile
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
> > > diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
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
> > > diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> > > index 9e167b113963..d934196eb79f 100644
> > > --- a/drivers/gpu/drm/xe/xe_engine.c
> > > +++ b/drivers/gpu/drm/xe/xe_engine.c
> > > @@ -13,6 +13,7 @@
> > > 
> > >  #include "xe_device.h"
> > >  #include "xe_gt.h"
> > > +#include "xe_hw_engine_class_sysfs.h"
> > >  #include "xe_hw_fence.h"
> > >  #include "xe_lrc.h"
> > >  #include "xe_macros.h"
> > > @@ -191,8 +192,12 @@ static int engine_set_priority(struct xe_device *xe, struct xe_engine *e,
> > >  static int engine_set_timeslice(struct xe_device *xe, struct xe_engine *e,
> > >  				u64 value, bool create)
> > >  {
> > > -	if (!capable(CAP_SYS_NICE))
> > > -		return -EPERM;
> > > +	u32 min = e->hwe->eclass->sched_props.timeslice_min;
> > > +	u32 max = e->hwe->eclass->sched_props.timeslice_max;
> > 
> > So I screwed this up in my last comment, sorry.
> > 
> > min = cap_nice ? KConfig option for min : e->hwe->eclass->sched_props.timeslice_min;
> > same logic for max;
> > 
> > Probably add helper for this.
> > 
> > > +
> > > +	if (enforce_schedule_limit() &&
> > > +	    !engine_timeout_in_range(value, min, max))
> > 
> > Then I think logic works too...
> > 
> > if cap nice && !Kconfig option to enfore limits (enforce_schedule_limit returns false):
> > 	user can do whatever
> > else if cap nice
> > 	user within Kconfig range
> > else
> > 	user within sysfs range
> > 
> > This is what we want in the end.
> > 
> 
> Matt, I think this is exactly what the previous revision of the patch was doing.
> 

No... Previous version

min = Kconfig option to enfore limits ? KConfig option for min : e->hwe->eclass->sched_props.timeslice_min
same for max

Results in:

if cap nice && !Kconfig option to enfore limits (enforce_schedule_limit returns false):
	user can do whatever
else if cap_nice || Kconfig option to enfore limit	
	user within Kconfig range
else
 	user within sysfs range

!cap_nice && Kconfig option to enfore limits == user within Kconfig range (previously)
!cap_nice && Kconfig option to enfore limits == user within sysfs range (my suggestion)

The logic is different and I believe we want what I'm suggesting.

Matt

> > > +		return -EINVAL;
> > > 
> > >  	return e->ops->set_timeslice(e, value);
> > >  }
> > > @@ -201,8 +206,12 @@ static int engine_set_preemption_timeout(struct xe_device *xe,
> > >  					 struct xe_engine *e, u64 value,
> > >  					 bool create)
> > >  {
> > > -	if (!capable(CAP_SYS_NICE))
> > > -		return -EPERM;
> > > +	u32 min = e->hwe->eclass->sched_props.preempt_timeout_min;
> > > +	u32 max = e->hwe->eclass->sched_props.preempt_timeout_max;
> > > +
> > > +	if (enforce_schedule_limit() &&
> > > +	    !engine_timeout_in_range(value, min, max))
> > > +		return -EINVAL;
> > > 
> > >  	return e->ops->set_preempt_timeout(e, value);
> > >  }
> > > @@ -266,11 +275,15 @@ static int engine_set_persistence(struct xe_device *xe, struct xe_engine *e,
> > >  static int engine_set_job_timeout(struct xe_device *xe, struct xe_engine *e,
> > >  				  u64 value, bool create)
> > >  {
> > > +	u32 min = e->hwe->eclass->sched_props.job_timeout_min;
> > > +	u32 max = e->hwe->eclass->sched_props.job_timeout_max;
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
> > >  	return e->ops->set_job_timeout(e, value);
> > >  }
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > index afa7d25c3852..e601bffe3b13 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > @@ -364,8 +364,16 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
> > > 
> > >  	if (!gt->eclass[hwe->class].sched_props.job_timeout_ms) {
> > >  		gt->eclass[hwe->class].sched_props.job_timeout_ms = HZ * 5;
> > > +		gt->eclass[hwe->class].sched_props.job_timeout_min = XE_HW_ENGINE_JOB_TIMEOUT_MIN;
> > > +		gt->eclass[hwe->class].sched_props.job_timeout_max = XE_HW_ENGINE_JOB_TIMEOUT_MAX;
> > >  		gt->eclass[hwe->class].sched_props.timeslice_us = 1 * 1000;
> > > +		gt->eclass[hwe->class].sched_props.timeslice_min = XE_HW_ENGINE_TIMESLICE_MIN;
> > > +		gt->eclass[hwe->class].sched_props.timeslice_max = XE_HW_ENGINE_TIMESLICE_MAX;
> > >  		gt->eclass[hwe->class].sched_props.preempt_timeout_us = 640 * 1000;
> > > +		gt->eclass[hwe->class].sched_props.preempt_timeout_min =
> > > +								XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
> > > +		gt->eclass[hwe->class].sched_props.preempt_timeout_max =
> > > +								XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
> > >  		/* Record default props */
> > >  		gt->eclass[hwe->class].defaults = gt->eclass[hwe->class].sched_props;
> > >  	}
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> > > index 7eca9d53c7b1..3d37d6d44261 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> > > @@ -10,6 +10,37 @@
> > > 
> > >  struct drm_printer;
> > > 
> > > +#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> > > +#define XE_HW_ENGINE_JOB_TIMEOUT_MIN CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> > > +#else
> > > +#define XE_HW_ENGINE_JOB_TIMEOUT_MIN 1
> > > +#endif
> > > +#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MAX
> > > +#define XE_HW_ENGINE_JOB_TIMEOUT_MAX CONFIG_DRM_XE_JOB_TIMEOUT_MAX
> > > +#else
> > > +#define XE_HW_ENGINE_JOB_TIMEOUT_MAX (10 * 1000)
> > > +#endif
> > > +#ifdef CONFIG_DRM_XE_TIMESLICE_MIN
> > > +#define XE_HW_ENGINE_TIMESLICE_MIN CONFIG_DRM_XE_TIMESLICE_MIN
> > > +#else
> > > +#define XE_HW_ENGINE_TIMESLICE_MIN 1
> > > +#endif
> > > +#ifdef CONFIG_DRM_XE_TIMESLICE_MAX
> > > +#define XE_HW_ENGINE_TIMESLICE_MAX CONFIG_DRM_XE_TIMESLICE_MAX
> > > +#else
> > > +#define XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000)
> > > +#endif
> > > +#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
> > > +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
> > > +#else
> > > +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 1
> > > +#endif
> > > +#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
> > > +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
> > > +#else
> > > +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX (10 * 1000 * 1000)
> > > +#endif
> > > +
> > >  int xe_hw_engines_init_early(struct xe_gt *gt);
> > >  int xe_hw_engines_init(struct xe_gt *gt);
> > >  void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > > index 990bb675d1e0..2b7ac4e02db6 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > > @@ -11,6 +11,20 @@
> > > 
> > >  static int xe_add_hw_engine_class_defaults(struct kobject *parent);
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
> > > +bool engine_timeout_in_range(u64 timeout, u64 min, u64 max)
> > > +{
> > > +	return timeout >= min && timeout <= max;
> > > +}
> > > +
> > >  static void kobj_xe_hw_engine_release(struct kobject *kobj)
> > >  {
> > >  	kfree(kobj);
> > > @@ -39,11 +53,92 @@ kobj_xe_hw_engine_class(struct kobject *parent, char *name)
> > >  	return keclass;
> > >  }
> > > 
> > > +static ssize_t job_timeout_max_store(struct kobject *kobj,
> > > +				     struct kobj_attribute *attr,
> > > +				     const char *buf, size_t count)
> > > +{
> > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
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
> > > +				    struct kobj_attribute *attr, char *buf)
> > > +{
> > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > +
> > > +	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_max);
> > > +}
> > > +
> > > +static struct kobj_attribute job_timeout_max_attr =
> > > +__ATTR(job_timeout_max, 0644, job_timeout_max_show, job_timeout_max_store);
> > > +
> > > +static ssize_t job_timeout_min_store(struct kobject *kobj,
> > > +				     struct kobj_attribute *attr,
> > > +				     const char *buf, size_t count)
> > > +{
> > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
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
> > > +				    struct kobj_attribute *attr, char *buf)
> > > +{
> > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > +
> > > +	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_min);
> > > +}
> > > +
> > > +static struct kobj_attribute job_timeout_min_attr =
> > > +__ATTR(job_timeout_min, 0644, job_timeout_min_show, job_timeout_min_store);
> > > +
> > >  static ssize_t job_timeout_store(struct kobject *kobj,
> > >  				 struct kobj_attribute *attr,
> > >  				 const char *buf, size_t count)
> > >  {
> > >  	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> > > +	u32 min = XE_HW_ENGINE_JOB_TIMEOUT_MIN;
> > > +	u32 max = XE_HW_ENGINE_JOB_TIMEOUT_MAX;
> > > +#else
> > > +	u32 min = e->hwe->eclass->sched_props.job_timeout_min;
> > > +	u32 max = e->hwe->eclass->sched_props.job_timeout_max;
> > > +#endif
> > 
> > I don't think we need this, just make sure default is within min / max
> > of the sched_props.
> > 
> 
> Shouldn't the sched_prop set through sysfs here which applies to all future
> user engines (xe_engine) has the same requirement as the sched_prop set
> directly to user engine (xe_engine) through set_properly ioctl?
> ie., shoudln't the requirement be same in job_timeout_store() and
> engine_set_job_timeout()?
> 
> Niranjana
> 
> > Matt
> > 
> > >  	u32 timeout;
> > >  	int err;
> > > 
> > > @@ -51,6 +146,10 @@ static ssize_t job_timeout_store(struct kobject *kobj,
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
> > > @@ -78,11 +177,40 @@ static ssize_t job_timeout_default(struct kobject *kobj,
> > >  static struct kobj_attribute job_timeout_def =
> > >  __ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
> > > 
> > > +static ssize_t job_timeout_min_default(struct kobject *kobj,
> > > +				       struct kobj_attribute *attr, char *buf)
> > > +{
> > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
> > > +
> > > +	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_min);
> > > +}
> > > +
> > > +static struct kobj_attribute job_timeout_min_def =
> > > +__ATTR(job_timeout_min, 0444, job_timeout_min_default, NULL);
> > > +
> > > +static ssize_t job_timeout_max_default(struct kobject *kobj,
> > > +				       struct kobj_attribute *attr, char *buf)
> > > +{
> > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
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
> > >  	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> > > +	u32 min = XE_HW_ENGINE_TIMESLICE_MIN;
> > > +	u32 max = XE_HW_ENGINE_TIMESLICE_MAX;
> > > +#else
> > > +	u32 min = e->hwe->eclass->sched_props.timeslice_min;
> > > +	u32 max = e->hwe->eclass->sched_props.timeslice_max;
> > > +#endif
> > >  	u32 duration;
> > >  	int err;
> > > 
> > > @@ -90,11 +218,92 @@ static ssize_t timeslice_duration_store(struct kobject *kobj,
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
> > > +					    const char *buf, size_t count)
> > > +{
> > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
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
> > > +					   struct kobj_attribute *attr,
> > > +					   char *buf)
> > > +{
> > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > +
> > > +	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_max);
> > > +}
> > > +
> > > +static struct kobj_attribute timeslice_duration_max_attr =
> > > +	__ATTR(timeslice_duration_max, 0644, timeslice_duration_max_show,
> > > +	       timeslice_duration_max_store);
> > > +
> > > +static ssize_t timeslice_duration_min_store(struct kobject *kobj,
> > > +					    struct kobj_attribute *attr,
> > > +					    const char *buf, size_t count)
> > > +{
> > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
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
> > > +					   struct kobj_attribute *attr, char *buf)
> > > +{
> > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > +
> > > +	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_min);
> > > +}
> > > +
> > > +static struct kobj_attribute timeslice_duration_min_attr =
> > > +	__ATTR(timeslice_duration_min, 0644, timeslice_duration_min_show,
> > > +	       timeslice_duration_min_store);
> > > +
> > >  static ssize_t timeslice_duration_show(struct kobject *kobj,
> > >  		struct kobj_attribute *attr, char *buf)
> > >  {
> > > @@ -118,11 +327,40 @@ static ssize_t timeslice_default(struct kobject *kobj,
> > >  static struct kobj_attribute timeslice_duration_def =
> > >  __ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
> > > 
> > > +static ssize_t timeslice_min_default(struct kobject *kobj,
> > > +				     struct kobj_attribute *attr, char *buf)
> > > +{
> > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
> > > +
> > > +	return sprintf(buf, "%u\n", eclass->defaults.timeslice_min);
> > > +}
> > > +
> > > +static struct kobj_attribute timeslice_duration_min_def =
> > > +__ATTR(timeslice_duration_min, 0444, timeslice_min_default, NULL);
> > > +
> > > +static ssize_t timeslice_max_default(struct kobject *kobj,
> > > +				     struct kobj_attribute *attr, char *buf)
> > > +{
> > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
> > > +
> > > +	return sprintf(buf, "%u\n", eclass->defaults.timeslice_max);
> > > +}
> > > +
> > > +static struct kobj_attribute timeslice_duration_max_def =
> > > +__ATTR(timeslice_duration_max, 0444, timeslice_max_default, NULL);
> > > +
> > >  static ssize_t preempt_timeout_store(struct kobject *kobj,
> > >  				     struct kobj_attribute *attr,
> > >  				     const char *buf, size_t count)
> > >  {
> > >  	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> > > +	u32 min = XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
> > > +	u32 max = XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
> > > +#else
> > > +	u32 min = e->hwe->eclass->sched_props.preempt_timeout_min;
> > > +	u32 max = e->hwe->eclass->sched_props.preempt_timeout_max;
> > > +#endif
> > >  	u32 timeout;
> > >  	int err;
> > > 
> > > @@ -130,6 +368,10 @@ static ssize_t preempt_timeout_store(struct kobject *kobj,
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
> > > @@ -158,17 +400,129 @@ static ssize_t preempt_timeout_default(struct kobject *kobj,
> > >  static struct kobj_attribute preempt_timeout_def =
> > >  __ATTR(preempt_timeout_us, 0444, preempt_timeout_default, NULL);
> > > 
> > > +static ssize_t preempt_timeout_min_default(struct kobject *kobj,
> > > +					   struct kobj_attribute *attr,
> > > +					   char *buf)
> > > +{
> > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
> > > +
> > > +	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_min);
> > > +}
> > > +
> > > +static struct kobj_attribute preempt_timeout_min_def =
> > > +__ATTR(preempt_timeout_min, 0444, preempt_timeout_min_default, NULL);
> > > +
> > > +static ssize_t preempt_timeout_max_default(struct kobject *kobj,
> > > +					   struct kobj_attribute *attr,
> > > +					   char *buf)
> > > +{
> > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
> > > +
> > > +	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_max);
> > > +}
> > > +
> > > +static struct kobj_attribute preempt_timeout_max_def =
> > > +__ATTR(preempt_timeout_max, 0444, preempt_timeout_max_default, NULL);
> > > +
> > > +static ssize_t preempt_timeout_max_store(struct kobject *kobj,
> > > +					 struct kobj_attribute *attr,
> > > +					 const char *buf, size_t count)
> > > +{
> > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
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
> > > +				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> > > +				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> > > +		return -EINVAL;
> > > +
> > > +	WRITE_ONCE(eclass->sched_props.preempt_timeout_max, timeout);
> > > +
> > > +	return count;
> > > +}
> > > +
> > > +static ssize_t preempt_timeout_max_show(struct kobject *kobj,
> > > +					struct kobj_attribute *attr, char *buf)
> > > +{
> > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > +
> > > +	return sprintf(buf, "%u\n", eclass->sched_props.preempt_timeout_max);
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
> > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
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
> > > +				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> > > +				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> > > +		return -EINVAL;
> > > +
> > > +	WRITE_ONCE(eclass->sched_props.preempt_timeout_min, timeout);
> > > +
> > > +	return count;
> > > +}
> > > +
> > > +static ssize_t preempt_timeout_min_show(struct kobject *kobj,
> > > +					struct kobj_attribute *attr, char *buf)
> > > +{
> > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> > > +
> > > +	return sprintf(buf, "%u\n", eclass->sched_props.preempt_timeout_min);
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
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> > > index 757136614672..2e2ab351a991 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> > > @@ -10,6 +10,8 @@
> > > 
> > >  #define MAX_ENGINE_CLASS_NAME_LEN    16
> > >  int xe_hw_engine_class_sysfs_init(struct xe_gt *gt);
> > > +bool enforce_schedule_limit(void);
> > > +bool engine_timeout_in_range(u64 timeout, u64 min, u64 max);
> > > 
> > >  /**
> > >   * struct kobj_eclass - A eclass's kobject struct that connects the kobject and the
> > > --
> > > 2.25.1
> > > 
