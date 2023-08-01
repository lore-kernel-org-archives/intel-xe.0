Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C4FC0015E
	for <intel-xe@archiver.kernel.org>; Tue,  1 Aug 2023 17:16:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6850B10E138;
	Tue,  1 Aug 2023 17:16:32 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F143210E138
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Aug 2023 17:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690910189; x=1722446189;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=n2pK7mt/Q/nR/aGl1s+YAqmhL95MGfXWIvmoD3i2R/0=;
 b=KlHpRu+3sCH89FYIr66QyFakorUfAe3VsnqVuvbtDCiuE7cnjecqnDW9
 aedQRW1bKsdlvgr1SRY80xNX23tmoF7MWxs79H/ShhHVM2i0BiGNMcG25
 ErV0reHMV3dsEPxloYqGLsNtj2PLq48MqQyZDphUnWusqp+PkPPS/fk+/
 2gXXYswzD+Yeok1HDAqyFCG0CB1KtW6+RAx73UOsryU8ZoTEcRlpbhqPL
 cTAq6ACa3/sdR1TjxqSyzYfP90C/Vn9zP7pEqa1CW3GiHxg+M63FTj2og
 i+gBXGvR+UFlOTT4dZRfrqKcNPB5bxKH3p0kWj28Ue+T9j9DZ7b0UwaH5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="435688322"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; d="scan'208";a="435688322"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 10:12:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="732059479"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; d="scan'208";a="732059479"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 01 Aug 2023 10:12:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 10:12:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 1 Aug 2023 10:12:08 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 1 Aug 2023 10:12:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vcw6CMJL4cBiWTE7cc7TIhTQEgL+zQuTIx1Vyq+aQTLMsYMccw38EJykJ1+VuQe2cxB8yJU1+wqNV8n/SLzA+p0dM0n3g6zv4SKs/6aitsoUm2iSvHRkHy65VNIUNJDbwrbqkqHEU9g2vFxQ3VZpQiWD+MzEcXqVF9ansk5eCU1KkSvJItEBeE2tNo9ojwt1iE9dW60GFM0K2LjhvRHniMTqZ5LZGL50CFNXN8Z/3nuVFY606zxfZ4TFgzvJkbsZb0PAMfb7AjxLZQ3nD1rRN6gvP5uJaanK8a5xp5v7PuhxfREl8WibIMOSdBo3k5vAJ35SW4Tlsrnhpx69QN621A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O2Zg3kFriW+nEyUlNdIH5XrgmdpuGYKh/gLwV5IRy0w=;
 b=cg32nMcikHvizEYGwinDxHmdhnga7ADXTknHcbpPkttK9a2Rtf6zh3DJCC+TPJ5J7l1kT4Cgt2BTEIrusmy3a6SaOs7q8dNILwQa9EgYPBstFaZ3swgp8pElt1hym5F4gvz8QFADEUBU+0UwKHfC18X6idn/pwt1iMKlJgKQcX0EyQdOkLTKQGmyGz33j+PHTwfOlN6VxTimi8wblG8s+8M559rCp0kk0YG/BVGY2fZHokh8HIySY2QHkX+Kwq4zWMaVAPz4GLLiDTM/24IVKOvcC30Q2xkIUktCYauQ4+v5jNJXbT0i1qa/EDerXDBZ+2q+uXH5ujv3LmzGeBn4fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by CH3PR11MB8239.namprd11.prod.outlook.com (2603:10b6:610:156::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 17:12:01 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ee81:9c69:6117:358c]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ee81:9c69:6117:358c%4]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 17:12:01 +0000
Date: Tue, 1 Aug 2023 10:11:58 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZMk83j8CfI191Lul@nvishwa1-DESK>
References: <20230731191742.1130309-1-tejas.upadhyay@intel.com>
 <20230731191742.1130309-7-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230731191742.1130309-7-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR03CA0265.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::30) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|CH3PR11MB8239:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b86f47f-7f3f-4107-229d-08db92b26b84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lXy9fr9f+nxsphAdpwLudaQOSW7jJw2LdugDbViZgvrAnh3CpSZPoXz/5lX3S8EWCuZjluometLlgn6BdRWyOg3KZk7oh5MkqsTlitz05Fu54V7ogn6iJGrM1+nMsIrWRhIZT/HgJclmSIryzGETAQ7UmZzVf3uAB+CaodQU7umxhzkJjbKCzNQSqCl5Ti9tANczxzefOtANUhSAZr3qjDZmJ9sjaE9mwlK0CymTFPHmhAdUcmxn/lRIkNAC5viHGWlTXKdIk61LshITeF3WPpfikFyP3iPiu80XXBJuyIwfDC5qVaqfSUJHwzu/4XpsS6dSlggDskI2Mc1pJjdx0cu3z8U6dY98AhIxbjEHoQwIa756GjLWNLoEHGFYBCR5QXp6Vsf0KqX9fp8H1+QbbCGS9k/OhyHMp7h/Z676vxHdRY7h8P8mAbW1NQItoHuX2K5mHZ/220S15hIaEMWQ5tIdBssXIkML9KciapcV/E7MlW4hIGWXoUMzqg798dGfeEPAklyJI/l8rMK3e/AjildUPRqMxMChCSzyRdkCeGVXqIRlBbTtT9rgOvDt8lgA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(136003)(366004)(346002)(39860400002)(396003)(451199021)(8936002)(8676002)(6862004)(6486002)(41300700001)(478600001)(33716001)(30864003)(2906002)(6666004)(26005)(44832011)(83380400001)(186003)(316002)(86362001)(6506007)(5660300002)(38100700002)(6512007)(9686003)(4326008)(6636002)(19627235002)(82960400001)(66556008)(66476007)(66946007)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DcTpqxEphzAOdBuaJk/yiiLataayrhad49hKTSutj+zuefBghTfMWJO91aNc?=
 =?us-ascii?Q?J7PNw87JxTZX+przTeJG829ecIGzeYEbcEjriyOheZb3JzZGqHU9K9R4NRCl?=
 =?us-ascii?Q?UnX8wrj0Wh2f4ivmvUHj3KHjRjzuwL2JNzCNTClv/N1ExYJSrfL5bUhfp2t7?=
 =?us-ascii?Q?41ifPT0i0z31TPZVNvOWwXkUhjy556vmIciM0QWF2tqwoMayzAB93hO9FzAT?=
 =?us-ascii?Q?Q/4KD+cvoygjAuPFKRwxVSp0S8i6HR7TnMgraxsn3SFB70OqL/2tROY8Ek/E?=
 =?us-ascii?Q?6oJiEQ0CcH9KH3IkXWu71woavFjI04fPogQlPc3Eugg8Yt6coldDGG5wPgND?=
 =?us-ascii?Q?Tm+QcnQpMBc61g0BvJQ0YWm54myRbXHYXvRcE/bATsXxS4R1qWtQr7UsKayp?=
 =?us-ascii?Q?ztTrjFxsQoEPmtW/IhlEzwI13cKb0L9w61XxmM3CoRXCEW0KRefFZFHrn9i7?=
 =?us-ascii?Q?bsFpzs6vLNsrmrwyu31Afl6iEEkxBcKG1+k4J+jMl1fl5dtHEYVg3aEkYURb?=
 =?us-ascii?Q?etmVw6CKnbYhs5Sz/z9QXIL50OUrSIeHnJ9/+4qC+ARScpPVIgelTYi/aqYx?=
 =?us-ascii?Q?rWGNzBBeBfHi8rQuUvU7eKH1sxt2DEq2bSK6H/4wAzVF/p1da02/hPSTAFZE?=
 =?us-ascii?Q?7AkCqle2fa98nhnpIfUwCnjuGj9+c7B6BHkxSrR+2742p0wbU0Cm/iq2sHvD?=
 =?us-ascii?Q?gHlviUyh49t6tOQ1Y/GrRfsSAF1oCwglqgirULucHFWLQrC4paizdiY3IfSJ?=
 =?us-ascii?Q?YNVmzUowP1d36BDT2lFdzdie0sJjGL4BbEeCSGGjkejfPhBKY1Ngpp3pZW5c?=
 =?us-ascii?Q?o0qrY+6IPPLwcEf9PXYQhNGGQWDd+mhggoGfJWZFBVj/fuO0xEHxoaCv1ufA?=
 =?us-ascii?Q?R3H+guDvzJrEMnWvrkyKnasYb59k41c152JcQ0LLrFc8ZG4l5i98YUskpyBm?=
 =?us-ascii?Q?jHCx0QlImoJaC2kF8g3KWIcho7k7DYRxRgxa+FtN8en5BX57jYmhHDKkELRq?=
 =?us-ascii?Q?7IpfYTl7n98afA4w42EzyGc64uFu+HtzPpYa7oVHSjt6dP93dbtlZf7CR2/h?=
 =?us-ascii?Q?zizRy2ml5pO5Z75GtmupXpDZMqg2/XlEKAouoEIrjUv+ONeWv29WGxAUlJTu?=
 =?us-ascii?Q?D7IG7QVmhUsMXHkgZJUToSqLHDBFMH+WMAEOzNwDj3wSTt2Y9oFIMtp36Rq8?=
 =?us-ascii?Q?XprXjMQZU/AAhkcKmTG1+jUpVji7JFo9HyQkrEif51X2S3BnQJCfTKYE2flw?=
 =?us-ascii?Q?ysHH3DSrkpXvej6HEeg7RaOVdIsIXcv4hyKpYxPQeq8oLGO0NMxuoeWoDxts?=
 =?us-ascii?Q?Sgf4HqXJHsTYmQVLhlMMDTBa/IM5FWFEKwiUKhyzUMTDeVzsnwJHF9roYr+i?=
 =?us-ascii?Q?mbDKA0ugLKp3SCR06L9G/FIyzoiSudokQEsrHKgcK4SyvEeJk9jEBNTGZxG5?=
 =?us-ascii?Q?FBIgPpaM4GzYbHxDxI0MlN2e/qeSO5XArqApLQtq6CrQxtDYW2IAllTHxUXu?=
 =?us-ascii?Q?yp5UzsH8O3PQZ4n50M1kbiAmtfQNLja43J0YZbMK1G7NRRN4N19h0qKtlYEV?=
 =?us-ascii?Q?AkP0clMQ5npMSAm5tl+tjACfvtWUHKKNsrP7xNQCCU6MgK3qDrNst9484Gn6?=
 =?us-ascii?Q?q7uzHU0vLl2HtkcrnVqJr5s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b86f47f-7f3f-4107-229d-08db92b26b84
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 17:12:01.0484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2UXCDZs7DSYg0KB4hLqdcCUx9mAPV/CybXmMPdSCgs9dYObAkGu+d74X699sE7RStvKm8UIqs514YtXVE/gRDlrGhcnf47/1G4gO75wM/DNMgKEbrjGQr/u0bsdhhmLX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8239
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V11 6/6] drm/xe: Add min/max cap for engine
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

On Tue, Aug 01, 2023 at 12:47:42AM +0530, Tejas Upadhyay wrote:
>Add sysfs entries for the min, max, and defaults for each of
>engine scheduler controls for every hardware engine class.
>
>Non-elevated user IOCTLs to set these controls must be within
>the min-max ranges of the sysfs entries, elevated user can set
>these controls to any value. However, introduced compile time
>CONFIG min-max values which restricts elevated user to be in
>compile time min-max range if at all sysfs min/max are violated.
>
>Sysfs entries examples are,
>DUT# cat /sys/class/drm/cardX/device/tileN/gtN/engines/ccs/.defaults/
>job_timeout_max         job_timeout_ms          preempt_timeout_min     timeslice_duration_max  timeslice_duration_us
>job_timeout_min         preempt_timeout_max     preempt_timeout_us      timeslice_duration_min
>
>DUT# cat /sys/class/drm/card1/device/tileN/gtN/engines/ccs/
>.defaults/              job_timeout_min         preempt_timeout_max     preempt_timeout_us      timeslice_duration_min
>job_timeout_max         job_timeout_ms          preempt_timeout_min     timeslice_duration_max  timeslice_duration_us
>
>V11:
>   - Make engine_get_prop_minmax and enforce_sched_limit static - Matt
>   - use enum in place of string in engine_get_prop_minmax - Matt
>   - no need to use enforce_sched_limit or no need to filter min/max
>     per user type in sysfs - Matt
>V10:
>   - Add kernel doc for non-static func
>   - Make helper to get min/max for range validation - Matt
>   - Filter min/max per user type
>V9 :
>   - Rebase to use s/xe_engine/xe_hw_engine/ - Matt
>V8 :
>   - fix enforce_sched_limit and avoid code duplication - Niranjana
>   - Make sure min < max - Niranjana
>V7 :
>   - Rebase to replace hw engine with eclass interface
>   - return EINVAL in place of EPERM
>   - Use some APIs to avoid code duplication
>V6 :
>   - Rebase changes to reflect per engine class props interface - MattB
>   - Use #if ENABLED - MattB
>   - Remove MAX_SCHED_TIMEOUT check as range validation is enough
>V5 :
>   - Rebase to resolve conflicts - CI
>V4 :
>   - Rebase
>   - Update commit to reflect tile addition
>   - Use XE_HW macro directly as they are already filtered
>     for CONFIG checks - Niranjana
>   - Add CONFIG for enable/disable min/max limitation
>     on elevated user. Default is enable - Matt/Joonas
>V3 :
>   - Resolve CI hooks warning for kernel-doc
>V2 :
>   - Restric min/max setting to #define default min/max for
>     elevated user - Himal
>   - Remove unrelated changes from patch - Niranjana
>
>Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>---
> drivers/gpu/drm/xe/Kconfig                    |   6 +
> drivers/gpu/drm/xe/Kconfig.profile            |  46 +++
> drivers/gpu/drm/xe/xe_engine.c                |  89 ++++-
> drivers/gpu/drm/xe/xe_hw_engine.c             |   8 +
> drivers/gpu/drm/xe/xe_hw_engine.h             |  31 ++
> drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 332 ++++++++++++++++++
> drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h |   1 +
> 7 files changed, 507 insertions(+), 6 deletions(-)
> create mode 100644 drivers/gpu/drm/xe/Kconfig.profile
>
>diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>index d44794f99338..0a4ea965645b 100644
>--- a/drivers/gpu/drm/xe/Kconfig
>+++ b/drivers/gpu/drm/xe/Kconfig
>@@ -83,3 +83,9 @@ depends on DRM_XE
> depends on EXPERT
> source "drivers/gpu/drm/xe/Kconfig.debug"
> endmenu
>+
>+menu "drm/xe Profile Guided Optimisation"
>+	visible if EXPERT
>+	depends on DRM_XE
>+	source "drivers/gpu/drm/xe/Kconfig.profile"
>+endmenu
>diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
>new file mode 100644
>index 000000000000..e72f15ec4bf6
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/Kconfig.profile
>@@ -0,0 +1,46 @@
>+config DRM_XE_JOB_TIMEOUT_MAX
>+       int "Default max job timeout (ms)"
>+       default 10000 # milliseconds
>+       help
>+         Configures the default max job timeout after which job will
>+         be forcefully taken away from scheduler.
>+config DRM_XE_JOB_TIMEOUT_MIN
>+       int "Default max job timeout (ms)"
>+       default 1 # milliseconds
>+       help
>+         Configures the default min job timeout after which job will
>+         be forcefully taken away from scheduler.
>+config DRM_XE_TIMESLICE_MAX
>+       int "Default max timeslice duration (us)"
>+       default 10000000 # microseconds
>+       help
>+         Configures the default max timeslice duration between multiple
>+         contexts by guc scheduling.
>+config DRM_XE_TIMESLICE_MIN
>+       int "Default min timeslice duration (us)"
>+       default 1 # microseconds
>+       help
>+         Configures the default min timeslice duration between multiple
>+         contexts by guc scheduling.
>+config DRM_XE_PREEMPT_TIMEOUT_MAX
>+       int "Default max  preempt timeout (us)"
>+       default 10000000 # microseconds
>+       help
>+         Configures the default max preempt timeout after which context
>+         will be forcefully taken away and higher priority context will
>+         run.
>+config DRM_XE_PREEMPT_TIMEOUT_MIN
>+       int "Default min  preempt timeout (us)"
>+       default 1 # microseconds
>+       help
>+         Configures the default min preempt timeout after which context
>+         will be forcefully taken away and higher priority context will
>+         run.
>+config DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
>+       bool "Default configuration of limitation on scheduler timeout"
>+       default y
>+       help
>+	 Configures the enablement of limitation on scheduler timeout
>+	 to apply to applicable user. For elevated user, all above MIN
>+	 and MAX values will apply when this configuration is enable to
>+	 apply limitation. By default limitation is applied.

Looking at this patch, the requirement seems to be,
The sysfs limits (min/max) setting through sysfs is always subjected to config limits.
The sched_prop values set through sysfs is always subjected to sysfs limits.
The sched_prop values set through engine set_property ioctl can override limits
if cap_nice and DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT is not set.

In that case,
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana

>diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
>index f4eb67915bfc..d77dd42384eb 100644
>--- a/drivers/gpu/drm/xe/xe_engine.c
>+++ b/drivers/gpu/drm/xe/xe_engine.c
>@@ -13,6 +13,7 @@
>
> #include "xe_device.h"
> #include "xe_gt.h"
>+#include "xe_hw_engine_class_sysfs.h"
> #include "xe_hw_fence.h"
> #include "xe_lrc.h"
> #include "xe_macros.h"
>@@ -22,6 +23,13 @@
> #include "xe_trace.h"
> #include "xe_vm.h"
>
>+enum xe_engine_sched_prop {
>+	XE_ENGINE_JOB_TIMEOUT = 0,
>+	XE_ENGINE_TIMESLICE = 1,
>+	XE_ENGINE_PREEMPT_TIMEOUT = 2,
>+	XE_ENGINE_SCHED_PROP_MAX = 3,
>+};
>+
> static struct xe_engine *__xe_engine_create(struct xe_device *xe,
> 					    struct xe_vm *vm,
> 					    u32 logical_mask,
>@@ -201,11 +209,68 @@ static int engine_set_priority(struct xe_device *xe, struct xe_engine *e,
> 	return e->ops->set_priority(e, value);
> }
>
>+static bool xe_engine_enforce_schedule_limit(void)
>+{
>+#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
>+	return true;
>+#else
>+	return !capable(CAP_SYS_NICE);
>+#endif
>+}
>+
>+static void xe_engine_get_prop_minmax(struct xe_hw_engine_class_intf *eclass,
>+				      enum xe_engine_sched_prop prop,
>+				      u32 *min, u32 *max)
>+{
>+	switch (prop) {
>+	case XE_ENGINE_JOB_TIMEOUT:
>+		*min = eclass->sched_props.job_timeout_min;
>+		*max = eclass->sched_props.job_timeout_max;
>+		break;
>+	case XE_ENGINE_TIMESLICE:
>+		*min = eclass->sched_props.timeslice_min;
>+		*max = eclass->sched_props.timeslice_max;
>+		break;
>+	case XE_ENGINE_PREEMPT_TIMEOUT:
>+		*min = eclass->sched_props.preempt_timeout_min;
>+		*max = eclass->sched_props.preempt_timeout_max;
>+		break;
>+	default:
>+		break;
>+	}
>+#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
>+	if (capable(CAP_SYS_NICE)) {
>+		switch (prop) {
>+		case XE_ENGINE_JOB_TIMEOUT:
>+			*min = XE_HW_ENGINE_JOB_TIMEOUT_MIN;
>+			*max = XE_HW_ENGINE_JOB_TIMEOUT_MAX;
>+			break;
>+		case XE_ENGINE_TIMESLICE:
>+			*min = XE_HW_ENGINE_TIMESLICE_MIN;
>+			*max = XE_HW_ENGINE_TIMESLICE_MAX;
>+			break;
>+		case XE_ENGINE_PREEMPT_TIMEOUT:
>+			*min = XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
>+			*max = XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
>+			break;
>+		default:
>+			break;
>+		}
>+	}
>+#endif
>+}
>+
> static int engine_set_timeslice(struct xe_device *xe, struct xe_engine *e,
> 				u64 value, bool create)
> {
>-	if (!capable(CAP_SYS_NICE))
>-		return -EPERM;
>+	u32 min = 0, max = 0;
>+
>+	xe_engine_get_prop_minmax(e->hwe->eclass,
>+				  XE_ENGINE_TIMESLICE, &min, &max);
>+
>+	if (xe_engine_enforce_schedule_limit() &&
>+	    !xe_hw_engine_timeout_in_range(value, min, max))
>+		return -EINVAL;
>
> 	return e->ops->set_timeslice(e, value);
> }
>@@ -214,8 +279,14 @@ static int engine_set_preemption_timeout(struct xe_device *xe,
> 					 struct xe_engine *e, u64 value,
> 					 bool create)
> {
>-	if (!capable(CAP_SYS_NICE))
>-		return -EPERM;
>+	u32 min = 0, max = 0;
>+
>+	xe_engine_get_prop_minmax(e->hwe->eclass,
>+				  XE_ENGINE_PREEMPT_TIMEOUT, &min, &max);
>+
>+	if (xe_engine_enforce_schedule_limit() &&
>+	    !xe_hw_engine_timeout_in_range(value, min, max))
>+		return -EINVAL;
>
> 	return e->ops->set_preempt_timeout(e, value);
> }
>@@ -279,11 +350,17 @@ static int engine_set_persistence(struct xe_device *xe, struct xe_engine *e,
> static int engine_set_job_timeout(struct xe_device *xe, struct xe_engine *e,
> 				  u64 value, bool create)
> {
>+	u32 min = 0, max = 0;
>+
> 	if (XE_IOCTL_DBG(xe, !create))
> 		return -EINVAL;
>
>-	if (!capable(CAP_SYS_NICE))
>-		return -EPERM;
>+	xe_engine_get_prop_minmax(e->hwe->eclass,
>+				  XE_ENGINE_JOB_TIMEOUT, &min, &max);
>+
>+	if (xe_engine_enforce_schedule_limit() &&
>+	    !xe_hw_engine_timeout_in_range(value, min, max))
>+		return -EINVAL;
>
> 	return e->ops->set_job_timeout(e, value);
> }
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>index b7be7b0acb35..b8fcc6e985cf 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>@@ -364,8 +364,16 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>
> 	if (!gt->eclass[hwe->class].sched_props.job_timeout_ms) {
> 		gt->eclass[hwe->class].sched_props.job_timeout_ms = 5 * 1000;
>+		gt->eclass[hwe->class].sched_props.job_timeout_min = XE_HW_ENGINE_JOB_TIMEOUT_MIN;
>+		gt->eclass[hwe->class].sched_props.job_timeout_max = XE_HW_ENGINE_JOB_TIMEOUT_MAX;
> 		gt->eclass[hwe->class].sched_props.timeslice_us = 1 * 1000;
>+		gt->eclass[hwe->class].sched_props.timeslice_min = XE_HW_ENGINE_TIMESLICE_MIN;
>+		gt->eclass[hwe->class].sched_props.timeslice_max = XE_HW_ENGINE_TIMESLICE_MAX;
> 		gt->eclass[hwe->class].sched_props.preempt_timeout_us = 640 * 1000;
>+		gt->eclass[hwe->class].sched_props.preempt_timeout_min =
>+								XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
>+		gt->eclass[hwe->class].sched_props.preempt_timeout_max =
>+								XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
> 		/* Record default props */
> 		gt->eclass[hwe->class].defaults = gt->eclass[hwe->class].sched_props;
> 	}
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
>index 7eca9d53c7b1..3d37d6d44261 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.h
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
>@@ -10,6 +10,37 @@
>
> struct drm_printer;
>
>+#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
>+#define XE_HW_ENGINE_JOB_TIMEOUT_MIN CONFIG_DRM_XE_JOB_TIMEOUT_MIN
>+#else
>+#define XE_HW_ENGINE_JOB_TIMEOUT_MIN 1
>+#endif
>+#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MAX
>+#define XE_HW_ENGINE_JOB_TIMEOUT_MAX CONFIG_DRM_XE_JOB_TIMEOUT_MAX
>+#else
>+#define XE_HW_ENGINE_JOB_TIMEOUT_MAX (10 * 1000)
>+#endif
>+#ifdef CONFIG_DRM_XE_TIMESLICE_MIN
>+#define XE_HW_ENGINE_TIMESLICE_MIN CONFIG_DRM_XE_TIMESLICE_MIN
>+#else
>+#define XE_HW_ENGINE_TIMESLICE_MIN 1
>+#endif
>+#ifdef CONFIG_DRM_XE_TIMESLICE_MAX
>+#define XE_HW_ENGINE_TIMESLICE_MAX CONFIG_DRM_XE_TIMESLICE_MAX
>+#else
>+#define XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000)
>+#endif
>+#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
>+#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
>+#else
>+#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 1
>+#endif
>+#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
>+#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
>+#else
>+#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX (10 * 1000 * 1000)
>+#endif
>+
> int xe_hw_engines_init_early(struct xe_gt *gt);
> int xe_hw_engines_init(struct xe_gt *gt);
> void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>index 238275675297..d9b662f22fc8 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>@@ -13,6 +13,22 @@
> #define MAX_ENGINE_CLASS_NAME_LEN    16
> static int xe_add_hw_engine_class_defaults(struct kobject *parent);
>
>+/**
>+ * xe_hw_engine_timeout_in_range - Helper to check if timeout is in range
>+ * @timeout: timeout to validate
>+ * @min: min value of valid range
>+ * @max: max value of valid range
>+ *
>+ * This helper helps to validate if timeout is in min-max range of HW engine
>+ * scheduler.
>+ *
>+ * Returns: Returns false value for failure and true for success.
>+ */
>+bool xe_hw_engine_timeout_in_range(u64 timeout, u64 min, u64 max)
>+{
>+	return timeout >= min && timeout <= max;
>+}
>+
> static void kobj_xe_hw_engine_release(struct kobject *kobj)
> {
> 	kfree(kobj);
>@@ -41,11 +57,85 @@ kobj_xe_hw_engine_class(struct kobject *parent, char *name)
> 	return keclass;
> }
>
>+static ssize_t job_timeout_max_store(struct kobject *kobj,
>+				     struct kobj_attribute *attr,
>+				     const char *buf, size_t count)
>+{
>+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>+	u32 timeout;
>+	int err;
>+
>+	err = kstrtou32(buf, 0, &timeout);
>+	if (err)
>+		return err;
>+
>+	if (timeout < eclass->sched_props.job_timeout_min)
>+		return -EINVAL;
>+
>+	if (!xe_hw_engine_timeout_in_range(timeout,
>+					   XE_HW_ENGINE_JOB_TIMEOUT_MIN,
>+					   XE_HW_ENGINE_JOB_TIMEOUT_MAX))
>+		return -EINVAL;
>+
>+	WRITE_ONCE(eclass->sched_props.job_timeout_max, timeout);
>+
>+	return count;
>+}
>+
>+static ssize_t job_timeout_max_show(struct kobject *kobj,
>+				    struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>+
>+	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_max);
>+}
>+
>+static struct kobj_attribute job_timeout_max_attr =
>+__ATTR(job_timeout_max, 0644, job_timeout_max_show, job_timeout_max_store);
>+
>+static ssize_t job_timeout_min_store(struct kobject *kobj,
>+				     struct kobj_attribute *attr,
>+				     const char *buf, size_t count)
>+{
>+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>+	u32 timeout;
>+	int err;
>+
>+	err = kstrtou32(buf, 0, &timeout);
>+	if (err)
>+		return err;
>+
>+	if (timeout > eclass->sched_props.job_timeout_max)
>+		return -EINVAL;
>+
>+	if (!xe_hw_engine_timeout_in_range(timeout,
>+					   XE_HW_ENGINE_JOB_TIMEOUT_MIN,
>+					   XE_HW_ENGINE_JOB_TIMEOUT_MAX))
>+		return -EINVAL;
>+
>+	WRITE_ONCE(eclass->sched_props.job_timeout_min, timeout);
>+
>+	return count;
>+}
>+
>+static ssize_t job_timeout_min_show(struct kobject *kobj,
>+				    struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>+
>+	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_min);
>+}
>+
>+static struct kobj_attribute job_timeout_min_attr =
>+__ATTR(job_timeout_min, 0644, job_timeout_min_show, job_timeout_min_store);
>+
> static ssize_t job_timeout_store(struct kobject *kobj,
> 				 struct kobj_attribute *attr,
> 				 const char *buf, size_t count)
> {
> 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>+	u32 min = eclass->sched_props.job_timeout_min;
>+	u32 max = eclass->sched_props.job_timeout_max;
> 	u32 timeout;
> 	int err;
>
>@@ -53,6 +143,9 @@ static ssize_t job_timeout_store(struct kobject *kobj,
> 	if (err)
> 		return err;
>
>+	if (!xe_hw_engine_timeout_in_range(timeout, min, max))
>+		return -EINVAL;
>+
> 	WRITE_ONCE(eclass->sched_props.job_timeout_ms, timeout);
>
> 	return count;
>@@ -80,11 +173,35 @@ static ssize_t job_timeout_default(struct kobject *kobj,
> static struct kobj_attribute job_timeout_def =
> __ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
>
>+static ssize_t job_timeout_min_default(struct kobject *kobj,
>+				       struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
>+
>+	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_min);
>+}
>+
>+static struct kobj_attribute job_timeout_min_def =
>+__ATTR(job_timeout_min, 0444, job_timeout_min_default, NULL);
>+
>+static ssize_t job_timeout_max_default(struct kobject *kobj,
>+				       struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
>+
>+	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_max);
>+}
>+
>+static struct kobj_attribute job_timeout_max_def =
>+__ATTR(job_timeout_max, 0444, job_timeout_max_default, NULL);
>+
> static ssize_t timeslice_duration_store(struct kobject *kobj,
> 					struct kobj_attribute *attr,
> 					const char *buf, size_t count)
> {
> 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>+	u32 min = eclass->sched_props.timeslice_min;
>+	u32 max = eclass->sched_props.timeslice_max;
> 	u32 duration;
> 	int err;
>
>@@ -92,11 +209,89 @@ static ssize_t timeslice_duration_store(struct kobject *kobj,
> 	if (err)
> 		return err;
>
>+	if (!xe_hw_engine_timeout_in_range(duration, min, max))
>+		return -EINVAL;
>+
> 	WRITE_ONCE(eclass->sched_props.timeslice_us, duration);
>
> 	return count;
> }
>
>+static ssize_t timeslice_duration_max_store(struct kobject *kobj,
>+					    struct kobj_attribute *attr,
>+					    const char *buf, size_t count)
>+{
>+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>+	u32 duration;
>+	int err;
>+
>+	err = kstrtou32(buf, 0, &duration);
>+	if (err)
>+		return err;
>+
>+	if (duration < eclass->sched_props.timeslice_min)
>+		return -EINVAL;
>+
>+	if (!xe_hw_engine_timeout_in_range(duration,
>+					   XE_HW_ENGINE_TIMESLICE_MIN,
>+					   XE_HW_ENGINE_TIMESLICE_MAX))
>+		return -EINVAL;
>+
>+	WRITE_ONCE(eclass->sched_props.timeslice_max, duration);
>+
>+	return count;
>+}
>+
>+static ssize_t timeslice_duration_max_show(struct kobject *kobj,
>+					   struct kobj_attribute *attr,
>+					   char *buf)
>+{
>+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>+
>+	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_max);
>+}
>+
>+static struct kobj_attribute timeslice_duration_max_attr =
>+	__ATTR(timeslice_duration_max, 0644, timeslice_duration_max_show,
>+	       timeslice_duration_max_store);
>+
>+static ssize_t timeslice_duration_min_store(struct kobject *kobj,
>+					    struct kobj_attribute *attr,
>+					    const char *buf, size_t count)
>+{
>+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>+	u32 duration;
>+	int err;
>+
>+	err = kstrtou32(buf, 0, &duration);
>+	if (err)
>+		return err;
>+
>+	if (duration > eclass->sched_props.timeslice_max)
>+		return -EINVAL;
>+
>+	if (!xe_hw_engine_timeout_in_range(duration,
>+					   XE_HW_ENGINE_TIMESLICE_MIN,
>+					   XE_HW_ENGINE_TIMESLICE_MAX))
>+		return -EINVAL;
>+
>+	WRITE_ONCE(eclass->sched_props.timeslice_min, duration);
>+
>+	return count;
>+}
>+
>+static ssize_t timeslice_duration_min_show(struct kobject *kobj,
>+					   struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>+
>+	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_min);
>+}
>+
>+static struct kobj_attribute timeslice_duration_min_attr =
>+	__ATTR(timeslice_duration_min, 0644, timeslice_duration_min_show,
>+	       timeslice_duration_min_store);
>+
> static ssize_t timeslice_duration_show(struct kobject *kobj,
> 				       struct kobj_attribute *attr, char *buf)
> {
>@@ -120,11 +315,35 @@ static ssize_t timeslice_default(struct kobject *kobj,
> static struct kobj_attribute timeslice_duration_def =
> __ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
>
>+static ssize_t timeslice_min_default(struct kobject *kobj,
>+				     struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
>+
>+	return sprintf(buf, "%u\n", eclass->defaults.timeslice_min);
>+}
>+
>+static struct kobj_attribute timeslice_duration_min_def =
>+__ATTR(timeslice_duration_min, 0444, timeslice_min_default, NULL);
>+
>+static ssize_t timeslice_max_default(struct kobject *kobj,
>+				     struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
>+
>+	return sprintf(buf, "%u\n", eclass->defaults.timeslice_max);
>+}
>+
>+static struct kobj_attribute timeslice_duration_max_def =
>+__ATTR(timeslice_duration_max, 0444, timeslice_max_default, NULL);
>+
> static ssize_t preempt_timeout_store(struct kobject *kobj,
> 				     struct kobj_attribute *attr,
> 				     const char *buf, size_t count)
> {
> 	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>+	u32 min = eclass->sched_props.preempt_timeout_min;
>+	u32 max = eclass->sched_props.preempt_timeout_max;
> 	u32 timeout;
> 	int err;
>
>@@ -132,6 +351,9 @@ static ssize_t preempt_timeout_store(struct kobject *kobj,
> 	if (err)
> 		return err;
>
>+	if (!xe_hw_engine_timeout_in_range(timeout, min, max))
>+		return -EINVAL;
>+
> 	WRITE_ONCE(eclass->sched_props.preempt_timeout_us, timeout);
>
> 	return count;
>@@ -160,17 +382,127 @@ static ssize_t preempt_timeout_default(struct kobject *kobj,
> static struct kobj_attribute preempt_timeout_def =
> __ATTR(preempt_timeout_us, 0444, preempt_timeout_default, NULL);
>
>+static ssize_t preempt_timeout_min_default(struct kobject *kobj,
>+					   struct kobj_attribute *attr,
>+					   char *buf)
>+{
>+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
>+
>+	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_min);
>+}
>+
>+static struct kobj_attribute preempt_timeout_min_def =
>+__ATTR(preempt_timeout_min, 0444, preempt_timeout_min_default, NULL);
>+
>+static ssize_t preempt_timeout_max_default(struct kobject *kobj,
>+					   struct kobj_attribute *attr,
>+					   char *buf)
>+{
>+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
>+
>+	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_max);
>+}
>+
>+static struct kobj_attribute preempt_timeout_max_def =
>+__ATTR(preempt_timeout_max, 0444, preempt_timeout_max_default, NULL);
>+
>+static ssize_t preempt_timeout_max_store(struct kobject *kobj,
>+					 struct kobj_attribute *attr,
>+					 const char *buf, size_t count)
>+{
>+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>+	u32 timeout;
>+	int err;
>+
>+	err = kstrtou32(buf, 0, &timeout);
>+	if (err)
>+		return err;
>+
>+	if (timeout < eclass->sched_props.preempt_timeout_min)
>+		return -EINVAL;
>+
>+	if (!xe_hw_engine_timeout_in_range(timeout,
>+					   XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
>+					   XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
>+		return -EINVAL;
>+
>+	WRITE_ONCE(eclass->sched_props.preempt_timeout_max, timeout);
>+
>+	return count;
>+}
>+
>+static ssize_t preempt_timeout_max_show(struct kobject *kobj,
>+					struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>+
>+	return sprintf(buf, "%u\n", eclass->sched_props.preempt_timeout_max);
>+}
>+
>+static struct kobj_attribute preempt_timeout_max_attr =
>+	__ATTR(preempt_timeout_max, 0644, preempt_timeout_max_show,
>+	       preempt_timeout_max_store);
>+
>+static ssize_t preempt_timeout_min_store(struct kobject *kobj,
>+					 struct kobj_attribute *attr,
>+					 const char *buf, size_t count)
>+{
>+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>+	u32 timeout;
>+	int err;
>+
>+	err = kstrtou32(buf, 0, &timeout);
>+	if (err)
>+		return err;
>+
>+	if (timeout > eclass->sched_props.preempt_timeout_max)
>+		return -EINVAL;
>+
>+	if (!xe_hw_engine_timeout_in_range(timeout,
>+					   XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
>+					   XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
>+		return -EINVAL;
>+
>+	WRITE_ONCE(eclass->sched_props.preempt_timeout_min, timeout);
>+
>+	return count;
>+}
>+
>+static ssize_t preempt_timeout_min_show(struct kobject *kobj,
>+					struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>+
>+	return sprintf(buf, "%u\n", eclass->sched_props.preempt_timeout_min);
>+}
>+
>+static struct kobj_attribute preempt_timeout_min_attr =
>+	__ATTR(preempt_timeout_min, 0644, preempt_timeout_min_show,
>+	       preempt_timeout_min_store);
>+
> static const struct attribute *defaults[] = {
> 	&job_timeout_def.attr,
>+	&job_timeout_min_def.attr,
>+	&job_timeout_max_def.attr,
> 	&timeslice_duration_def.attr,
>+	&timeslice_duration_min_def.attr,
>+	&timeslice_duration_max_def.attr,
> 	&preempt_timeout_def.attr,
>+	&preempt_timeout_min_def.attr,
>+	&preempt_timeout_max_def.attr,
> 	NULL
> };
>
> static const struct attribute *files[] = {
> 	&job_timeout_attr.attr,
>+	&job_timeout_min_attr.attr,
>+	&job_timeout_max_attr.attr,
> 	&timeslice_duration_attr.attr,
>+	&timeslice_duration_min_attr.attr,
>+	&timeslice_duration_max_attr.attr,
> 	&preempt_timeout_attr.attr,
>+	&preempt_timeout_min_attr.attr,
>+	&preempt_timeout_max_attr.attr,
> 	NULL
> };
>
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
>index c093f381abbe..60469fde4147 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
>+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
>@@ -12,6 +12,7 @@ struct xe_gt;
> struct xe_hw_engine_class_intf;
>
> int xe_hw_engine_class_sysfs_init(struct xe_gt *gt);
>+bool xe_hw_engine_timeout_in_range(u64 timeout, u64 min, u64 max);
>
> /**
>  * struct kobj_eclass - A eclass's kobject struct that connects the kobject and the
>-- 
>2.25.1
>
