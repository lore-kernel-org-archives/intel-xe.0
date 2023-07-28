Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277B0C001DE
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 04:44:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5ABF10E63B;
	Fri, 28 Jul 2023 04:44:32 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC7C10E63B
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 04:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690519471; x=1722055471;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gScO0HyhBcq5/5nKJCKuwMcvX/tqLiP2nkYBcdHQMnw=;
 b=IDLhdNaXk+Iaby6n/NrVFJCZwo+mo3G3v6Jqkw14zjat0uK4shbgDe5v
 Rg3uzaBQV7JxRGnuKg8qYdnalZIJlbKQvbnNzsneTTZG2jfE5ueyC+epH
 nmR79BoyGUVMxjAw1BTMZ2bkVlCUUGpGJg1egvqzchiSFNHsUaYaWG446
 Op/chsL0T2dBvFjm28Oou43vLdUVLFCEFX94Wei3BcWG5NJSwCh0HNn/A
 /gCXll94xR6WzdZ9BgcRUsWB+i9+HGdFI+IjDHWTroiVFVx8k7RJ9Hhcz
 FxxKAJcVcbNaBEdUnme8xBraoWev6IHg/A55WmqW7hm2g4kByy2805OUT A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="399438574"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="399438574"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 21:44:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="762460636"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="762460636"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 27 Jul 2023 21:44:29 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 21:44:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 21:44:29 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 21:44:29 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 21:44:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HIR5EcIW6Z3niZJnE+D7/6kGZAuYN/PhuhlmHE1JUmTIvGG97Uu+/G9u1gxKWbevufcLGtEZVOzrW42YFCo8uGFcE3PWtFPEWk6k72yvc/eQBvUkaX3zLXbZTG8XA+lm7stPFkUqG6aNbeDfMjlFd2bSvpv7LkfPzDeLS+Hc4oisp39o0/BWavdF5OQf7p49+W8FQgQdEcFKYF/c9+yRoaHth1dz0AoFYbRFzxdO44R0AcL/8vm60oiI2Emmt/woq8KSCsPJnzsKvEOFWy+HOkbuu8NMT0IreKu+6TB9v91byBLUgxmJE+gSwU4vC9O5LCTAMXip3iQYUIIlZRvYzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1QpXU18UUFCD1JhNgy4b0tt0Zjrz60Pz9+DkAGop8s=;
 b=jO3NP2iSmDuL6FrSYPuduuX6q0snh5FRquwME5OafdWUjx74WI+AANgP06mWh8OEKmegzxs9EgDvv0B3LqkU+sTi8QlGKXFL+b3JO2VklmqK8R8usZSV9bOPQEWCYOKKpbZzqxovj7e/qUwUCRUOozfBTuFvEmki9IxUpJ8WNpxxSYyCJoWOHvDk54nA4ZwThSpXQPqdQjGGreqbwqSd3Ei0P4/EFVjes9eXVrG7Iwum1wPIAWpROB8/oezDeppzQQ0zMSW+CWtJ+RMW+DPgzbj6IJuebgdxAgCnEtopgbjLnp7FhLYrCKNtyPBeHP9cGbQKR/m2WxFyyNq4a60IgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SA1PR11MB6895.namprd11.prod.outlook.com (2603:10b6:806:2b2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 04:44:26 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::fe5e:ee9:8806:c9fa]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::fe5e:ee9:8806:c9fa%7]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 04:44:26 +0000
Date: Thu, 27 Jul 2023 21:44:23 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZMNHp1f+wwyd9ZTB@nvishwa1-DESK>
References: <20230727082235.905240-1-tejas.upadhyay@intel.com>
 <20230727082235.905240-7-tejas.upadhyay@intel.com>
 <ZMKMuWeQBXsSo2Sb@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZMKMuWeQBXsSo2Sb@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::8) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SA1PR11MB6895:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f821988-5448-4f25-9e92-08db8f25520a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 74OO+el929efNtfbbrMi0fvYWT/FW19YBaBrEBgpb0PnR5O7sYqoI8azlFkENvaPkEPNRCaNEY/pXvwYVkSbS1ShipV4+3RUAM/OVg1HhXJsklidTHLEHJE2To3P9F1TLySfpX7epgAmBKFNDi80E4VwbNb7azcy/LR8u/cpgfrwQroCa1lWWU6vrs/3Bo6h1hQKpHcogJX/6RL6qZh5FrbEjpnHMJpMjdr5/8MkX8OiO1VtN+cg7EODXW+vvYOjuvMK5cNJkiqDcHS01dsxctY/luTj3239MUvaJHN/fWlvk2rpLAjL+4oyjHrgp16c9EvBumGN2FdA8kh2BzMnqgZO5zAHMDpH+ny+4k+CYWtuEw6J4YpPR0GWF9km9KRtq9lzr+0OWMCgCJMG58y7UK2lEak1OYmqw2kOTSKKHvkdN8E5A/PREXpa+iqk4BuSA6+WI3kbzjntFQhmRrP1jtXdhZDkoGAOR5pihsgRHohQN3woqU4Ivv+dlqel7WX5MoBLMJNHRzbEH7dgzb7C0n3vR71PWqi5BhupgeLD66BYFLDp9Vi9fm7UWmdvY9nPQVPaPgpAE0uJUKStwarQmIidbXTIyWyd/SkzHtrPnJE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(396003)(39860400002)(376002)(136003)(366004)(451199021)(38100700002)(82960400001)(6666004)(9686003)(6486002)(19627235002)(478600001)(316002)(8676002)(41300700001)(6862004)(66476007)(66946007)(6636002)(8936002)(66556008)(5660300002)(4326008)(186003)(83380400001)(26005)(6506007)(6512007)(86362001)(33716001)(30864003)(2906002)(44832011)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e4p6CtX1iFqwddJDOyCHeiZDDMvWDbU6CHKzHdBr+lz7akdzDSV0fAuRCbnG?=
 =?us-ascii?Q?iPq+3wC9dc2SHPK4PB+toPqkKAoIxQJC6mcnpeyJSrgjLmaic0c3e0KQiFSI?=
 =?us-ascii?Q?W8ByIMEjxJU2oc1vu26X29MPUbjzJqh0W+YbJSxasm0dpqIZznbvaSZIpHgD?=
 =?us-ascii?Q?tI7In0VVKAAxIQuvAmVHMHbR00JUeM7H2ii68QxhgkNyP8oSyfSCGqCLpkhE?=
 =?us-ascii?Q?y38HdPxnvWP6QjffnLG70wkVDzqZnCVqWQwzXUXqRtnwsincUVpg494yvZgf?=
 =?us-ascii?Q?fSXyi9ZsthmZUZ073Leumd48TZLf+JYsPvNRQzPQ728XV4APShLRMDmSi6hM?=
 =?us-ascii?Q?J8ZZAlHrOj/1PJ8atr16ZUtjkNhlrdED0CYEd+EIDVzVa2xLEUr7LOY9ZqKI?=
 =?us-ascii?Q?HPvQho6XAg4YnLodyKjdKjcLrEtfTJk4IhAK/7ROK5tWA2W8qGoDbWSM+QhA?=
 =?us-ascii?Q?s1V4cF4ZzWKVTNAh8ouLUbbrynQweuGCYfZiKStsuSbStL3DFzytf5xKTuyN?=
 =?us-ascii?Q?p1EpGCaDfSAwKHe2vT3r9SnuQWwpgAKm46ZfhldBEqHdBFzv9CCDPqm8Q6vi?=
 =?us-ascii?Q?GdZ58r670raEWBLSi6FWzv+6BPZduxk4AaVH9Cyk1LRQAxT00OS1q2GK0LkO?=
 =?us-ascii?Q?LpOYdRT3ntWWYDMzrKwNWTdMy9pD9j2Tw0+w9p4qe7cWLPVWMV21/hmCT354?=
 =?us-ascii?Q?f2dSFC3Yu0nRThVwU2Hl1Ga8M8KFBhMJQDDdJAKObr+H79nJlVibTJPjaC/f?=
 =?us-ascii?Q?i6p+rcRH/E9NlpjBDd1MEoudcKEnsSoupaTOJzIaMfOGwSVpi/YPS1KIs2A4?=
 =?us-ascii?Q?1cFnYaVm7rVpE9cAHfdsbsIUHEMDhoYThfPxK+5bOYh46xlfD2pJ2kfeRtLQ?=
 =?us-ascii?Q?Pq6TtRmTly/092XR8NCSSwutykZ57pyyo59BD8/29TQYAf8XuEunZbe3hAzC?=
 =?us-ascii?Q?Y2ZB/kJeVTxjyKjF7n7lxp/8APTsY1C3EBL7DbsLHzSB+xT3tEaYM1paEsZp?=
 =?us-ascii?Q?pEVtzTPSjCVBQOU7NBXQgYFy2itfpkeCG4wgv5ENEn4rmQWDw1hbAml/GTmR?=
 =?us-ascii?Q?ib7NCd6DjUwzj3evaVJRrowlKAbaXGvOdfeiqokZ/NLk5pXQ0swWxizItA7Z?=
 =?us-ascii?Q?kmitO0oLUdPsGXlSkgugHNdobE5nbGAacEqpuYePjv6DpmyBU9cCophgi13b?=
 =?us-ascii?Q?Lz4o4ZF4C43NELwiiULd/38+TYEt+WlGUtDp93QC1XrYAQb+CHJ/WCfFvhdR?=
 =?us-ascii?Q?RoleWBo1aPqyhqzm9pyGWskY9PmIMq3JXURHhMKtOPQjS11b4Q/5NTQ6mmtj?=
 =?us-ascii?Q?+mDuWnGyPrhwjjoCV6CBU3TqhZLqCSzRlfRRPO3vEaWdvnF4UE/P6Q0JNYF5?=
 =?us-ascii?Q?Yv+wSYxtIxSNPFivhwQIsdmXKAyrS0v6TeiWmFH/RAUNAGdfuif4Cm7AAH5k?=
 =?us-ascii?Q?X9BKPWsSG+PlfC3SXB6gX9TX+VJTKh/uqE1YNYp0fl1GZewmVcro3M42Klij?=
 =?us-ascii?Q?GkFPANRTqN0kQMPg+aLze/gh0OSaUf21FL7Mx+xC8cZO9Y0jvfyyofYVyckQ?=
 =?us-ascii?Q?udqgHmglErT0Km+GaVEyB8epWQeEZAMiqtQzUqC2om5TvDkwg3SCwiGdP/aS?=
 =?us-ascii?Q?+dx3M/UfQbuAjwtTgNGyrPw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f821988-5448-4f25-9e92-08db8f25520a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 04:44:25.7595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FW3ytz6hr2P/QhGTcW2v9Z8cW7exthTqbpXhQICHaXu6SLlUGc7td3+DVU42XlwEDbSWC4a5OSx89q6bEO85aZ6ftamhjSOF8+DabK0zPLl42Xpw1iHIxhjW0S6wYjdP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6895
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

On Thu, Jul 27, 2023 at 03:26:49PM +0000, Matthew Brost wrote:
>On Thu, Jul 27, 2023 at 01:52:35PM +0530, Tejas Upadhyay wrote:
>> Add sysfs entries for the min, max, and defaults for each of
>> engine scheduler controls for every hardware engine class.
>>
>> Non-elevated user IOCTLs to set these controls must be within
>> the min-max ranges of the sysfs entries, elevated user can set
>> these controls to any value. However, introduced compile time
>> CONFIG min-max values which restricts elevated user to be in
>> compile time min-max range if at all sysfs min/max are violated.
>>
>> Sysfs entries examples are,
>> DUT# cat /sys/class/drm/cardX/device/tileN/gtN/engines/ccs/.defaults/
>> job_timeout_max         job_timeout_ms          preempt_timeout_min     timeslice_duration_max  timeslice_duration_us
>> job_timeout_min         preempt_timeout_max     preempt_timeout_us      timeslice_duration_min
>>
>> DUT# cat /sys/class/drm/card1/device/tileN/gtN/engines/ccs/
>> .defaults/              job_timeout_min         preempt_timeout_max     preempt_timeout_us      timeslice_duration_min
>> job_timeout_max         job_timeout_ms          preempt_timeout_min     timeslice_duration_max  timeslice_duration_us
>>
>> V9 :
>>    - Rebase to use s/xe_engine/xe_hw_engine/ - Matt
>> V8 :
>>    - fix enforce_sched_limit and avoid code duplication - Niranjana
>>    - Make sure min < max - Niranjana
>> V7 :
>>    - Rebase to replace hw engine with eclass interface
>>    - return EINVAL in place of EPERM
>>    - Use some APIs to avoid code duplication
>> V6 :
>>    - Rebase changes to reflect per engine class props interface - MattB
>>    - Use #if ENABLED - MattB
>>    - Remove MAX_SCHED_TIMEOUT check as range validation is enough
>> V5 :
>>    - Rebase to resolve conflicts - CI
>> V4 :
>>    - Rebase
>>    - Update commit to reflect tile addition
>>    - Use XE_HW macro directly as they are already filtered
>>      for CONFIG checks - Niranjana
>>    - Add CONFIG for enable/disable min/max limitation
>>      on elevated user. Default is enable - Matt/Joonas
>> V3 :
>>    - Resolve CI hooks warning for kernel-doc
>> V2 :
>>    - Restric min/max setting to #define default min/max for
>>      elevated user - Himal
>>    - Remove unrelated changes from patch - Niranjana
>>
>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> ---
>>  drivers/gpu/drm/xe/Kconfig                    |   6 +
>>  drivers/gpu/drm/xe/Kconfig.profile            |  46 +++
>>  drivers/gpu/drm/xe/xe_engine.c                |  25 +-
>>  drivers/gpu/drm/xe/xe_hw_engine.c             |   8 +
>>  drivers/gpu/drm/xe/xe_hw_engine.h             |  31 ++
>>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 354 ++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h |   2 +
>>  7 files changed, 466 insertions(+), 6 deletions(-)
>>  create mode 100644 drivers/gpu/drm/xe/Kconfig.profile
>>
>> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>> index d44794f99338..0a4ea965645b 100644
>> --- a/drivers/gpu/drm/xe/Kconfig
>> +++ b/drivers/gpu/drm/xe/Kconfig
>> @@ -83,3 +83,9 @@ depends on DRM_XE
>>  depends on EXPERT
>>  source "drivers/gpu/drm/xe/Kconfig.debug"
>>  endmenu
>> +
>> +menu "drm/xe Profile Guided Optimisation"
>> +	visible if EXPERT
>> +	depends on DRM_XE
>> +	source "drivers/gpu/drm/xe/Kconfig.profile"
>> +endmenu
>> diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
>> new file mode 100644
>> index 000000000000..e72f15ec4bf6
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/Kconfig.profile
>> @@ -0,0 +1,46 @@
>> +config DRM_XE_JOB_TIMEOUT_MAX
>> +       int "Default max job timeout (ms)"
>> +       default 10000 # milliseconds
>> +       help
>> +         Configures the default max job timeout after which job will
>> +         be forcefully taken away from scheduler.
>> +config DRM_XE_JOB_TIMEOUT_MIN
>> +       int "Default max job timeout (ms)"
>> +       default 1 # milliseconds
>> +       help
>> +         Configures the default min job timeout after which job will
>> +         be forcefully taken away from scheduler.
>> +config DRM_XE_TIMESLICE_MAX
>> +       int "Default max timeslice duration (us)"
>> +       default 10000000 # microseconds
>> +       help
>> +         Configures the default max timeslice duration between multiple
>> +         contexts by guc scheduling.
>> +config DRM_XE_TIMESLICE_MIN
>> +       int "Default min timeslice duration (us)"
>> +       default 1 # microseconds
>> +       help
>> +         Configures the default min timeslice duration between multiple
>> +         contexts by guc scheduling.
>> +config DRM_XE_PREEMPT_TIMEOUT_MAX
>> +       int "Default max  preempt timeout (us)"
>> +       default 10000000 # microseconds
>> +       help
>> +         Configures the default max preempt timeout after which context
>> +         will be forcefully taken away and higher priority context will
>> +         run.
>> +config DRM_XE_PREEMPT_TIMEOUT_MIN
>> +       int "Default min  preempt timeout (us)"
>> +       default 1 # microseconds
>> +       help
>> +         Configures the default min preempt timeout after which context
>> +         will be forcefully taken away and higher priority context will
>> +         run.
>> +config DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
>> +       bool "Default configuration of limitation on scheduler timeout"
>> +       default y
>> +       help
>> +	 Configures the enablement of limitation on scheduler timeout
>> +	 to apply to applicable user. For elevated user, all above MIN
>> +	 and MAX values will apply when this configuration is enable to
>> +	 apply limitation. By default limitation is applied.
>> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
>> index 9e167b113963..d934196eb79f 100644
>> --- a/drivers/gpu/drm/xe/xe_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_engine.c
>> @@ -13,6 +13,7 @@
>>
>>  #include "xe_device.h"
>>  #include "xe_gt.h"
>> +#include "xe_hw_engine_class_sysfs.h"
>>  #include "xe_hw_fence.h"
>>  #include "xe_lrc.h"
>>  #include "xe_macros.h"
>> @@ -191,8 +192,12 @@ static int engine_set_priority(struct xe_device *xe, struct xe_engine *e,
>>  static int engine_set_timeslice(struct xe_device *xe, struct xe_engine *e,
>>  				u64 value, bool create)
>>  {
>> -	if (!capable(CAP_SYS_NICE))
>> -		return -EPERM;
>> +	u32 min = e->hwe->eclass->sched_props.timeslice_min;
>> +	u32 max = e->hwe->eclass->sched_props.timeslice_max;
>
>So I screwed this up in my last comment, sorry.
>
>min = cap_nice ? KConfig option for min : e->hwe->eclass->sched_props.timeslice_min;
>same logic for max;
>
>Probably add helper for this.
>
>> +
>> +	if (enforce_schedule_limit() &&
>> +	    !engine_timeout_in_range(value, min, max))
>
>Then I think logic works too...
>
>if cap nice && !Kconfig option to enfore limits (enforce_schedule_limit returns false):
>	user can do whatever
>else if cap nice
>	user within Kconfig range
>else
>	user within sysfs range
>
>This is what we want in the end.
>

Matt, I think this is exactly what the previous revision of the patch was doing.

>> +		return -EINVAL;
>>
>>  	return e->ops->set_timeslice(e, value);
>>  }
>> @@ -201,8 +206,12 @@ static int engine_set_preemption_timeout(struct xe_device *xe,
>>  					 struct xe_engine *e, u64 value,
>>  					 bool create)
>>  {
>> -	if (!capable(CAP_SYS_NICE))
>> -		return -EPERM;
>> +	u32 min = e->hwe->eclass->sched_props.preempt_timeout_min;
>> +	u32 max = e->hwe->eclass->sched_props.preempt_timeout_max;
>> +
>> +	if (enforce_schedule_limit() &&
>> +	    !engine_timeout_in_range(value, min, max))
>> +		return -EINVAL;
>>
>>  	return e->ops->set_preempt_timeout(e, value);
>>  }
>> @@ -266,11 +275,15 @@ static int engine_set_persistence(struct xe_device *xe, struct xe_engine *e,
>>  static int engine_set_job_timeout(struct xe_device *xe, struct xe_engine *e,
>>  				  u64 value, bool create)
>>  {
>> +	u32 min = e->hwe->eclass->sched_props.job_timeout_min;
>> +	u32 max = e->hwe->eclass->sched_props.job_timeout_max;
>> +
>>  	if (XE_IOCTL_DBG(xe, !create))
>>  		return -EINVAL;
>>
>> -	if (!capable(CAP_SYS_NICE))
>> -		return -EPERM;
>> +	if (enforce_schedule_limit() &&
>> +	    !engine_timeout_in_range(value, min, max))
>> +		return -EINVAL;
>>
>>  	return e->ops->set_job_timeout(e, value);
>>  }
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index afa7d25c3852..e601bffe3b13 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -364,8 +364,16 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>>
>>  	if (!gt->eclass[hwe->class].sched_props.job_timeout_ms) {
>>  		gt->eclass[hwe->class].sched_props.job_timeout_ms = HZ * 5;
>> +		gt->eclass[hwe->class].sched_props.job_timeout_min = XE_HW_ENGINE_JOB_TIMEOUT_MIN;
>> +		gt->eclass[hwe->class].sched_props.job_timeout_max = XE_HW_ENGINE_JOB_TIMEOUT_MAX;
>>  		gt->eclass[hwe->class].sched_props.timeslice_us = 1 * 1000;
>> +		gt->eclass[hwe->class].sched_props.timeslice_min = XE_HW_ENGINE_TIMESLICE_MIN;
>> +		gt->eclass[hwe->class].sched_props.timeslice_max = XE_HW_ENGINE_TIMESLICE_MAX;
>>  		gt->eclass[hwe->class].sched_props.preempt_timeout_us = 640 * 1000;
>> +		gt->eclass[hwe->class].sched_props.preempt_timeout_min =
>> +								XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
>> +		gt->eclass[hwe->class].sched_props.preempt_timeout_max =
>> +								XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
>>  		/* Record default props */
>>  		gt->eclass[hwe->class].defaults = gt->eclass[hwe->class].sched_props;
>>  	}
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
>> index 7eca9d53c7b1..3d37d6d44261 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
>> @@ -10,6 +10,37 @@
>>
>>  struct drm_printer;
>>
>> +#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
>> +#define XE_HW_ENGINE_JOB_TIMEOUT_MIN CONFIG_DRM_XE_JOB_TIMEOUT_MIN
>> +#else
>> +#define XE_HW_ENGINE_JOB_TIMEOUT_MIN 1
>> +#endif
>> +#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MAX
>> +#define XE_HW_ENGINE_JOB_TIMEOUT_MAX CONFIG_DRM_XE_JOB_TIMEOUT_MAX
>> +#else
>> +#define XE_HW_ENGINE_JOB_TIMEOUT_MAX (10 * 1000)
>> +#endif
>> +#ifdef CONFIG_DRM_XE_TIMESLICE_MIN
>> +#define XE_HW_ENGINE_TIMESLICE_MIN CONFIG_DRM_XE_TIMESLICE_MIN
>> +#else
>> +#define XE_HW_ENGINE_TIMESLICE_MIN 1
>> +#endif
>> +#ifdef CONFIG_DRM_XE_TIMESLICE_MAX
>> +#define XE_HW_ENGINE_TIMESLICE_MAX CONFIG_DRM_XE_TIMESLICE_MAX
>> +#else
>> +#define XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000)
>> +#endif
>> +#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
>> +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
>> +#else
>> +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 1
>> +#endif
>> +#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
>> +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
>> +#else
>> +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX (10 * 1000 * 1000)
>> +#endif
>> +
>>  int xe_hw_engines_init_early(struct xe_gt *gt);
>>  int xe_hw_engines_init(struct xe_gt *gt);
>>  void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>> index 990bb675d1e0..2b7ac4e02db6 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>> @@ -11,6 +11,20 @@
>>
>>  static int xe_add_hw_engine_class_defaults(struct kobject *parent);
>>
>> +bool enforce_schedule_limit(void)
>> +{
>> +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
>> +	return true;
>> +#else
>> +	return !capable(CAP_SYS_NICE);
>> +#endif
>> +}
>> +
>> +bool engine_timeout_in_range(u64 timeout, u64 min, u64 max)
>> +{
>> +	return timeout >= min && timeout <= max;
>> +}
>> +
>>  static void kobj_xe_hw_engine_release(struct kobject *kobj)
>>  {
>>  	kfree(kobj);
>> @@ -39,11 +53,92 @@ kobj_xe_hw_engine_class(struct kobject *parent, char *name)
>>  	return keclass;
>>  }
>>
>> +static ssize_t job_timeout_max_store(struct kobject *kobj,
>> +				     struct kobj_attribute *attr,
>> +				     const char *buf, size_t count)
>> +{
>> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>> +	u32 timeout;
>> +	int err;
>> +
>> +	err = kstrtou32(buf, 0, &timeout);
>> +	if (err)
>> +		return err;
>> +
>> +	if (timeout < eclass->sched_props.job_timeout_min)
>> +		return -EINVAL;
>> +
>> +	if (enforce_schedule_limit() &&
>> +	    !engine_timeout_in_range(timeout,
>> +				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
>> +				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
>> +		return -EINVAL;
>> +
>> +	WRITE_ONCE(eclass->sched_props.job_timeout_max, timeout);
>> +
>> +	return count;
>> +}
>> +
>> +static ssize_t job_timeout_max_show(struct kobject *kobj,
>> +				    struct kobj_attribute *attr, char *buf)
>> +{
>> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>> +
>> +	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_max);
>> +}
>> +
>> +static struct kobj_attribute job_timeout_max_attr =
>> +__ATTR(job_timeout_max, 0644, job_timeout_max_show, job_timeout_max_store);
>> +
>> +static ssize_t job_timeout_min_store(struct kobject *kobj,
>> +				     struct kobj_attribute *attr,
>> +				     const char *buf, size_t count)
>> +{
>> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>> +	u32 timeout;
>> +	int err;
>> +
>> +	err = kstrtou32(buf, 0, &timeout);
>> +	if (err)
>> +		return err;
>> +
>> +	if (timeout > eclass->sched_props.job_timeout_max)
>> +		return -EINVAL;
>> +
>> +	if (enforce_schedule_limit() &&
>> +	    !engine_timeout_in_range(timeout,
>> +				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
>> +				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
>> +		return -EINVAL;
>> +
>> +	WRITE_ONCE(eclass->sched_props.job_timeout_min, timeout);
>> +
>> +	return count;
>> +}
>> +
>> +static ssize_t job_timeout_min_show(struct kobject *kobj,
>> +				    struct kobj_attribute *attr, char *buf)
>> +{
>> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>> +
>> +	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_min);
>> +}
>> +
>> +static struct kobj_attribute job_timeout_min_attr =
>> +__ATTR(job_timeout_min, 0644, job_timeout_min_show, job_timeout_min_store);
>> +
>>  static ssize_t job_timeout_store(struct kobject *kobj,
>>  				 struct kobj_attribute *attr,
>>  				 const char *buf, size_t count)
>>  {
>>  	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>> +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
>> +	u32 min = XE_HW_ENGINE_JOB_TIMEOUT_MIN;
>> +	u32 max = XE_HW_ENGINE_JOB_TIMEOUT_MAX;
>> +#else
>> +	u32 min = e->hwe->eclass->sched_props.job_timeout_min;
>> +	u32 max = e->hwe->eclass->sched_props.job_timeout_max;
>> +#endif
>
>I don't think we need this, just make sure default is within min / max
>of the sched_props.
>

Shouldn't the sched_prop set through sysfs here which applies to all future
user engines (xe_engine) has the same requirement as the sched_prop set
directly to user engine (xe_engine) through set_properly ioctl?
ie., shoudln't the requirement be same in job_timeout_store() and
engine_set_job_timeout()?

Niranjana

>Matt
>
>>  	u32 timeout;
>>  	int err;
>>
>> @@ -51,6 +146,10 @@ static ssize_t job_timeout_store(struct kobject *kobj,
>>  	if (err)
>>  		return err;
>>
>> +	if (enforce_schedule_limit() &&
>> +	    !engine_timeout_in_range(timeout, min, max))
>> +		return -EINVAL;
>> +
>>  	WRITE_ONCE(eclass->sched_props.job_timeout_ms, timeout);
>>
>>  	return count;
>> @@ -78,11 +177,40 @@ static ssize_t job_timeout_default(struct kobject *kobj,
>>  static struct kobj_attribute job_timeout_def =
>>  __ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
>>
>> +static ssize_t job_timeout_min_default(struct kobject *kobj,
>> +				       struct kobj_attribute *attr, char *buf)
>> +{
>> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
>> +
>> +	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_min);
>> +}
>> +
>> +static struct kobj_attribute job_timeout_min_def =
>> +__ATTR(job_timeout_min, 0444, job_timeout_min_default, NULL);
>> +
>> +static ssize_t job_timeout_max_default(struct kobject *kobj,
>> +				       struct kobj_attribute *attr, char *buf)
>> +{
>> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
>> +
>> +	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_max);
>> +}
>> +
>> +static struct kobj_attribute job_timeout_max_def =
>> +__ATTR(job_timeout_max, 0444, job_timeout_max_default, NULL);
>> +
>>  static ssize_t timeslice_duration_store(struct kobject *kobj,
>>  					struct kobj_attribute *attr,
>>  					const char *buf, size_t count)
>>  {
>>  	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>> +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
>> +	u32 min = XE_HW_ENGINE_TIMESLICE_MIN;
>> +	u32 max = XE_HW_ENGINE_TIMESLICE_MAX;
>> +#else
>> +	u32 min = e->hwe->eclass->sched_props.timeslice_min;
>> +	u32 max = e->hwe->eclass->sched_props.timeslice_max;
>> +#endif
>>  	u32 duration;
>>  	int err;
>>
>> @@ -90,11 +218,92 @@ static ssize_t timeslice_duration_store(struct kobject *kobj,
>>  	if (err)
>>  		return err;
>>
>> +	if (enforce_schedule_limit() &&
>> +	    !engine_timeout_in_range(duration, min, max))
>> +		return -EINVAL;
>> +
>>  	WRITE_ONCE(eclass->sched_props.timeslice_us, duration);
>>
>>  	return count;
>>  }
>>
>> +static ssize_t timeslice_duration_max_store(struct kobject *kobj,
>> +					    struct kobj_attribute *attr,
>> +					    const char *buf, size_t count)
>> +{
>> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>> +	u32 duration;
>> +	int err;
>> +
>> +	err = kstrtou32(buf, 0, &duration);
>> +	if (err)
>> +		return err;
>> +
>> +	if (duration < eclass->sched_props.timeslice_min)
>> +		return -EINVAL;
>> +
>> +	if (enforce_schedule_limit() &&
>> +	    !engine_timeout_in_range(duration,
>> +				     XE_HW_ENGINE_TIMESLICE_MIN,
>> +				     XE_HW_ENGINE_TIMESLICE_MAX))
>> +		return -EINVAL;
>> +
>> +	WRITE_ONCE(eclass->sched_props.timeslice_max, duration);
>> +
>> +	return count;
>> +}
>> +
>> +static ssize_t timeslice_duration_max_show(struct kobject *kobj,
>> +					   struct kobj_attribute *attr,
>> +					   char *buf)
>> +{
>> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>> +
>> +	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_max);
>> +}
>> +
>> +static struct kobj_attribute timeslice_duration_max_attr =
>> +	__ATTR(timeslice_duration_max, 0644, timeslice_duration_max_show,
>> +	       timeslice_duration_max_store);
>> +
>> +static ssize_t timeslice_duration_min_store(struct kobject *kobj,
>> +					    struct kobj_attribute *attr,
>> +					    const char *buf, size_t count)
>> +{
>> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>> +	u32 duration;
>> +	int err;
>> +
>> +	err = kstrtou32(buf, 0, &duration);
>> +	if (err)
>> +		return err;
>> +
>> +	if (duration > eclass->sched_props.timeslice_max)
>> +		return -EINVAL;
>> +
>> +	if (enforce_schedule_limit() &&
>> +	    !engine_timeout_in_range(duration,
>> +				     XE_HW_ENGINE_TIMESLICE_MIN,
>> +				     XE_HW_ENGINE_TIMESLICE_MAX))
>> +		return -EINVAL;
>> +
>> +	WRITE_ONCE(eclass->sched_props.timeslice_min, duration);
>> +
>> +	return count;
>> +}
>> +
>> +static ssize_t timeslice_duration_min_show(struct kobject *kobj,
>> +					   struct kobj_attribute *attr, char *buf)
>> +{
>> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>> +
>> +	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_min);
>> +}
>> +
>> +static struct kobj_attribute timeslice_duration_min_attr =
>> +	__ATTR(timeslice_duration_min, 0644, timeslice_duration_min_show,
>> +	       timeslice_duration_min_store);
>> +
>>  static ssize_t timeslice_duration_show(struct kobject *kobj,
>>  		struct kobj_attribute *attr, char *buf)
>>  {
>> @@ -118,11 +327,40 @@ static ssize_t timeslice_default(struct kobject *kobj,
>>  static struct kobj_attribute timeslice_duration_def =
>>  __ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
>>
>> +static ssize_t timeslice_min_default(struct kobject *kobj,
>> +				     struct kobj_attribute *attr, char *buf)
>> +{
>> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
>> +
>> +	return sprintf(buf, "%u\n", eclass->defaults.timeslice_min);
>> +}
>> +
>> +static struct kobj_attribute timeslice_duration_min_def =
>> +__ATTR(timeslice_duration_min, 0444, timeslice_min_default, NULL);
>> +
>> +static ssize_t timeslice_max_default(struct kobject *kobj,
>> +				     struct kobj_attribute *attr, char *buf)
>> +{
>> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
>> +
>> +	return sprintf(buf, "%u\n", eclass->defaults.timeslice_max);
>> +}
>> +
>> +static struct kobj_attribute timeslice_duration_max_def =
>> +__ATTR(timeslice_duration_max, 0444, timeslice_max_default, NULL);
>> +
>>  static ssize_t preempt_timeout_store(struct kobject *kobj,
>>  				     struct kobj_attribute *attr,
>>  				     const char *buf, size_t count)
>>  {
>>  	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>> +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
>> +	u32 min = XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
>> +	u32 max = XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
>> +#else
>> +	u32 min = e->hwe->eclass->sched_props.preempt_timeout_min;
>> +	u32 max = e->hwe->eclass->sched_props.preempt_timeout_max;
>> +#endif
>>  	u32 timeout;
>>  	int err;
>>
>> @@ -130,6 +368,10 @@ static ssize_t preempt_timeout_store(struct kobject *kobj,
>>  	if (err)
>>  		return err;
>>
>> +	if (enforce_schedule_limit() &&
>> +	    !engine_timeout_in_range(timeout, min, max))
>> +		return -EINVAL;
>> +
>>  	WRITE_ONCE(eclass->sched_props.preempt_timeout_us, timeout);
>>
>>  	return count;
>> @@ -158,17 +400,129 @@ static ssize_t preempt_timeout_default(struct kobject *kobj,
>>  static struct kobj_attribute preempt_timeout_def =
>>  __ATTR(preempt_timeout_us, 0444, preempt_timeout_default, NULL);
>>
>> +static ssize_t preempt_timeout_min_default(struct kobject *kobj,
>> +					   struct kobj_attribute *attr,
>> +					   char *buf)
>> +{
>> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
>> +
>> +	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_min);
>> +}
>> +
>> +static struct kobj_attribute preempt_timeout_min_def =
>> +__ATTR(preempt_timeout_min, 0444, preempt_timeout_min_default, NULL);
>> +
>> +static ssize_t preempt_timeout_max_default(struct kobject *kobj,
>> +					   struct kobj_attribute *attr,
>> +					   char *buf)
>> +{
>> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
>> +
>> +	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_max);
>> +}
>> +
>> +static struct kobj_attribute preempt_timeout_max_def =
>> +__ATTR(preempt_timeout_max, 0444, preempt_timeout_max_default, NULL);
>> +
>> +static ssize_t preempt_timeout_max_store(struct kobject *kobj,
>> +					 struct kobj_attribute *attr,
>> +					 const char *buf, size_t count)
>> +{
>> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>> +	u32 timeout;
>> +	int err;
>> +
>> +	err = kstrtou32(buf, 0, &timeout);
>> +	if (err)
>> +		return err;
>> +
>> +	if (timeout < eclass->sched_props.preempt_timeout_min)
>> +		return -EINVAL;
>> +
>> +	if (enforce_schedule_limit() &&
>> +	    !engine_timeout_in_range(timeout,
>> +				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
>> +				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
>> +		return -EINVAL;
>> +
>> +	WRITE_ONCE(eclass->sched_props.preempt_timeout_max, timeout);
>> +
>> +	return count;
>> +}
>> +
>> +static ssize_t preempt_timeout_max_show(struct kobject *kobj,
>> +					struct kobj_attribute *attr, char *buf)
>> +{
>> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>> +
>> +	return sprintf(buf, "%u\n", eclass->sched_props.preempt_timeout_max);
>> +}
>> +
>> +static struct kobj_attribute preempt_timeout_max_attr =
>> +	__ATTR(preempt_timeout_max, 0644, preempt_timeout_max_show,
>> +	       preempt_timeout_max_store);
>> +
>> +static ssize_t preempt_timeout_min_store(struct kobject *kobj,
>> +					 struct kobj_attribute *attr,
>> +					 const char *buf, size_t count)
>> +{
>> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>> +	u32 timeout;
>> +	int err;
>> +
>> +	err = kstrtou32(buf, 0, &timeout);
>> +	if (err)
>> +		return err;
>> +
>> +	if (timeout > eclass->sched_props.preempt_timeout_max)
>> +		return -EINVAL;
>> +
>> +	if (enforce_schedule_limit() &&
>> +	    !engine_timeout_in_range(timeout,
>> +				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
>> +				     XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
>> +		return -EINVAL;
>> +
>> +	WRITE_ONCE(eclass->sched_props.preempt_timeout_min, timeout);
>> +
>> +	return count;
>> +}
>> +
>> +static ssize_t preempt_timeout_min_show(struct kobject *kobj,
>> +					struct kobj_attribute *attr, char *buf)
>> +{
>> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>> +
>> +	return sprintf(buf, "%u\n", eclass->sched_props.preempt_timeout_min);
>> +}
>> +
>> +static struct kobj_attribute preempt_timeout_min_attr =
>> +	__ATTR(preempt_timeout_min, 0644, preempt_timeout_min_show,
>> +	       preempt_timeout_min_store);
>> +
>>  static const struct attribute *defaults[] = {
>>  	&job_timeout_def.attr,
>> +	&job_timeout_min_def.attr,
>> +	&job_timeout_max_def.attr,
>>  	&timeslice_duration_def.attr,
>> +	&timeslice_duration_min_def.attr,
>> +	&timeslice_duration_max_def.attr,
>>  	&preempt_timeout_def.attr,
>> +	&preempt_timeout_min_def.attr,
>> +	&preempt_timeout_max_def.attr,
>>  	NULL
>>  };
>>
>>  static const struct attribute *files[] = {
>>  	&job_timeout_attr.attr,
>> +	&job_timeout_min_attr.attr,
>> +	&job_timeout_max_attr.attr,
>>  	&timeslice_duration_attr.attr,
>> +	&timeslice_duration_min_attr.attr,
>> +	&timeslice_duration_max_attr.attr,
>>  	&preempt_timeout_attr.attr,
>> +	&preempt_timeout_min_attr.attr,
>> +	&preempt_timeout_max_attr.attr,
>>  	NULL
>>  };
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
>> index 757136614672..2e2ab351a991 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
>> @@ -10,6 +10,8 @@
>>
>>  #define MAX_ENGINE_CLASS_NAME_LEN    16
>>  int xe_hw_engine_class_sysfs_init(struct xe_gt *gt);
>> +bool enforce_schedule_limit(void);
>> +bool engine_timeout_in_range(u64 timeout, u64 min, u64 max);
>>
>>  /**
>>   * struct kobj_eclass - A eclass's kobject struct that connects the kobject and the
>> --
>> 2.25.1
>>
