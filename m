Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB52C0015E
	for <intel-xe@archiver.kernel.org>; Tue,  1 Aug 2023 10:54:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 040C410E089;
	Tue,  1 Aug 2023 10:54:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1AEE10E089
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Aug 2023 10:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690887269; x=1722423269;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Z0hBfG/XO9OlzLcwLB5NIHspY0WwkNpNVxAfAsMMzfg=;
 b=lS9nrVTstA7ZkQDS/41Zsfnjcuk9ALOkYoOoi2m5LLc/p0R/KACE7pE0
 yiUtB3Iu23Io2KhS6ZTfPOmUtPH/nttNzrHazM/t/u0asJ5Lnj2L3fcDi
 DzrsgsjeGXaUCEiBRuQ7ee+dgHDwf4vO6NOuglGLb8/mkIUJKNZkwukEZ
 4NxYaAdrR25XS1UAXb8SuzMV03ODsbhSFvRt3fn18nZWfTdOflb0d9023
 f0TKfB/DL/MgZgIHP6uCtaOvu0BcKhAJXbUZ1bxWtMTW88/nAVh5VpxJx
 E2apWwWoNuac+uJrLJ6UecYiaanttyprCPot/mCpU8S0AblF38MkvDFfp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="400216648"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="400216648"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 03:54:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="731937196"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="731937196"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP; 01 Aug 2023 03:54:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 03:54:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 03:54:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 1 Aug 2023 03:54:27 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 1 Aug 2023 03:54:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZgtsE8L27NRpWDCSVy8AAHArAvASqLdOWz9H85Ssz0GHdU4bruRKoTjPGAjIfYcxiZSi8zEBP+cZW3hGtd2GR7pMxo79fb/9lLfmLQXZMkvWDGy2ojVjnO7KVHnBkythaTWR8PPin8WTgcRPWS1aj8lBDfIiKOoKR9GddMhza85bk965SHa7kD9PuQQsACbtz3C1IwQopXq+79KGxMmdUCjB5c5LqLAXDpZcsicFHJncFroC4fmoRC7HHRtDH0mFoeUOP1+eUE3Ea5L/5N9GI/bS8kMakYXrXzDONB3TkpoPMQKrbs/OvAX68CHr29TzoqV+xU7eg9cInHJk4GogQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJ1EyYCezhxvltvCo/qbwPbuRDfO5Fx8buVKug5MuuM=;
 b=NHu/on8JPKAoC9fHRuzBrrWE1eaa3tiaygcqUwN49G65n4tS+kRCZlWCe5oz4WhU0Ui7acEUdv4eRA7TaxLv8t9mOZ48q3888jIAVpWBDzEasD1MneAWZuMfqMN7l48tKYQ7lrXzyWxQp1TJa3p0LmxVyTxXa7Xs6fdS+/3BIfRtYWvS64e4n2AzAqGFtJND7PE90vlKeEfNc/VYTaZ4PGAalA18h2c/b2PXjG2VQ5h9aIz/N7rG6R8ToZMdTTpko+WYny2ee59lSvS9hX+/hzolZ21LcOdtBZzxQw3PStQw8r3gwvS0Um/z5FV8TO/e5isLOhX0LfXjZm7K9V5kNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB7568.namprd11.prod.outlook.com (2603:10b6:806:34e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 10:54:20 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6631.026; Tue, 1 Aug 2023
 10:54:20 +0000
Date: Tue, 1 Aug 2023 06:54:16 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZMjkWGr5VawknYaH@intel.com>
References: <20230801104842.7-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230801104842.7-1-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR05CA0106.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::47) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB7568:EE_
X-MS-Office365-Filtering-Correlation-Id: da77a867-7bdf-407d-97e7-08db927da88f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z+Q8iUQAm8XGRqtbAoLbMrwtqNywCFBjNQSoEUlQBWt+TUg7Kn78UhF67KJaphAODzQUDy3vyPGr+Nmgs+A/3QW5bK19pG8042zk5KalWb7JL52NyC26MDVcuD1w6zoQCE3cQGwS/1f8rTCp9b+7WUc5gDFMtpO3KMORBaxAwSy92JEXxNRiJirKDZVm/MnZzmXfDs7NV/ySRpOEmDcVTNDfOkXoH8fXjf3uI23aqg0ksfa5EWVqhv1yGpy5IVrTC/py02D1UlvjYQkVgj9h409Z5DgTlvqh+5AQedvCTYcKkM4GTzFGXppAKvpkz3EpMPvo9PSwMWTihqIbVRKAfILEHbp0t6mXA5jNiFe+dcwbS0qxX7PZW/fj07PUHkYgGU82Hua6KsvMG7GE5ALrafkGyfycS4WxBv5XpX3S1THX3HPyZ/122nAqTThHtL+pCMhz4gmNaEtfAhuOSj7TAOllbV9yGfFdl31PI1USfwMg6g6pMWHbgUd+ydbilm6RYdN8RDs7SZXsNIIG7GWaJAKZp0oO3/A/KKXzkuiTpjY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(136003)(39860400002)(346002)(376002)(451199021)(2906002)(6636002)(107886003)(4326008)(2616005)(83380400001)(186003)(86362001)(316002)(44832011)(478600001)(41300700001)(38100700002)(966005)(6512007)(82960400001)(37006003)(5660300002)(66556008)(66476007)(66946007)(6506007)(26005)(8676002)(6862004)(6666004)(8936002)(6486002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t2mrjRugCQiP/dX/wAQmY4ZP28ZQu5wLPo7xJYsQL4QskNBxsqCGcn7J9F5y?=
 =?us-ascii?Q?G1QuersnPnytenzlAHfWMbur8lME1oGO63ETxEhz8q9cIkpEVISiKAtC8LFU?=
 =?us-ascii?Q?iCXin/GQJrAcGLAwHkNmEskmmt+Tq/sk3zc+OCU6PcWNnykYkKUwA3qA9sMy?=
 =?us-ascii?Q?SStTau626cKOdBfksXCemyQwzKmJTIca2PwQhVDxC/UlKJgkS3tilim5+xyu?=
 =?us-ascii?Q?ljyUpXzXMHGtd88q7Jr/xnrO0dfJz4u7AeuvgD77KK0dUrdG3Yyj75okgidh?=
 =?us-ascii?Q?vCmkIsheCNPSKQJR26hX6ZIDRRRXxZkbyF3j6ZJ6s4a8dVFcZY6Jcq/JtweM?=
 =?us-ascii?Q?KKl1WXGZi8lPLUMlP9/YwEz+gLYe7dn3xrlVG39MKBZy3gVWASmCR0s/wtFa?=
 =?us-ascii?Q?g3eaga9uxQSTciiONyQ6PeYda52mLjEuvAYUzoQiiOVfJJCK5CqiB4N1hb05?=
 =?us-ascii?Q?AQIj7d4aJ3z9gmprekqw72hEngjQj6tdaomEhkIAycBiSDFajGFRx3XPuUed?=
 =?us-ascii?Q?5czTcRIhh23nBNYVNRy2dAL/TwH5uTE+Xre5w5LVDEPIK4mMlKnza1ZvXVCw?=
 =?us-ascii?Q?vUyFnkGczOY9sW+F+r/0LSco5ouQcJST3XKmaNx0zkY8ZQKrdfqxg0wcXEjL?=
 =?us-ascii?Q?2zbdkX+igRqA1qFrnlnWP/6LhHE9J16XuPWNkim7n2Ny2+tyNXofBz5K2uzK?=
 =?us-ascii?Q?cRRgiDsWJRmawvgDmRT40kFPNSbCkhwmBcvoF0CB7xawtM3X5gatCD3OuQML?=
 =?us-ascii?Q?k2kjAA6T69aVPQhfMNgaJJ1bFLorxZ+sUGtMVisXc0363VLZhc0v99SNSBld?=
 =?us-ascii?Q?N8CoDpYb9Vjt1246PMxYh2PUQ3QjEEYkeHIrQb7lqd0KGWku+xoBkRcNjqVK?=
 =?us-ascii?Q?vYK0EFNrUcJoNb8HEAGfJm/k1TeSgIWQGWEk4RIbAiQxF2Nyys4UZJ5pVzXj?=
 =?us-ascii?Q?UUupZ8E0EYtgDWv0Tgz6GGeG/0JV1mJfG1wb4dpbE8gHOvtor6WAy34r4tbs?=
 =?us-ascii?Q?zyjlOwtbf1MRcpbAQLlHFXpPUIpJeVJ4ml4HSkFfYDnB4+qeOHj2XLNNnV76?=
 =?us-ascii?Q?Rupz3hzbagSAeUDvfYep1Kzq7XgiocDaO1TKeptbWv5ROYDJYexu1RwGThPr?=
 =?us-ascii?Q?JtnFSWg2JZiZeHbJNSsRsps6zrBmnMcL14TprXfFYFdsR6I/DPyVeg1KysBo?=
 =?us-ascii?Q?9eFm28uXZf2L0FSJ1tP2mbZ+yM966/uEaNpf06oMDT3Pv9qLmzTP0dawzyXe?=
 =?us-ascii?Q?mWVauFtNJ20pKdJbY06ABNNzdVhppzu5oXqH8gqGOXVEikoiGUwVjXRXjr9K?=
 =?us-ascii?Q?f4ppeohLIjjGeNwR9Qumk4+C2JvC3+ZWCzpq/lK8McYUuF3jUlvPKdSpyvZU?=
 =?us-ascii?Q?Qu1hKy+9uTvaajcY+44T+U1em23V8Fa5RHQ00KdS41r/6j8wCwqdASqIf92R?=
 =?us-ascii?Q?J8gTYFqeg37hZXrUQXjm7LKeczpSs4Qq+IO32WuGvEP90mnE/Fiaw0bMarsy?=
 =?us-ascii?Q?rJaSNAGAG+jz4rTdJiCLJtC2o8kEHgOth7DvT+rVgufzC9dqPqv5VqGT9IP5?=
 =?us-ascii?Q?7ah9xmTrmfrY5p24W3C+eKCfhdLWEmbkPquvruBtVVNA8ZuWThzxEsnW/jts?=
 =?us-ascii?Q?wA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da77a867-7bdf-407d-97e7-08db927da88f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 10:54:20.1881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S/Gy5wNjKX+VcM7iA+TUxCkOcNTRWBQqAOEekyDC0xqwJsQNFvnrwN1GAsFKOxMJt/Tvx8Uyn9Pc8SL42suo7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7568
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 0/2] Rename engine to exec_queue
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

On Tue, Aug 01, 2023 at 10:48:40AM +0000, Francois Dugast wrote:
> This is an attempt to rename engine to exec queue in order to prevent confusion
> between engine and hw engine, as discussed here:
> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/162
> 
> Looking for feedback on potential mixups between engine and hw engine, either
> because an occurrence of hw engine has incorrectly been renamed to exec queue
> or because an occurrence of engine has not been renamed to exec queue.
> 
> v2:
>   - No longer sent as RFC
>   - Fix kernel doc and some comments
> 
> v3: Rename xe_engine.[ch] in a separate commit to keep history

good idea!

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
for both patches

> 
> Francois Dugast (2):
>   drm/xe: Rename xe_engine.[ch] to xe_exec_queue.[ch]
>   drm/xe: Rename engine to exec_queue
> 
>  drivers/gpu/drm/xe/Makefile                   |    2 +-
>  drivers/gpu/drm/xe/tests/xe_migrate.c         |   18 +-
>  drivers/gpu/drm/xe/xe_bb.c                    |   26 +-
>  drivers/gpu/drm/xe/xe_bb.h                    |    8 +-
>  drivers/gpu/drm/xe/xe_devcoredump.c           |   40 +-
>  drivers/gpu/drm/xe/xe_devcoredump.h           |    6 +-
>  drivers/gpu/drm/xe/xe_devcoredump_types.h     |    2 +-
>  drivers/gpu/drm/xe/xe_device.c                |   62 +-
>  drivers/gpu/drm/xe/xe_device.h                |    8 +-
>  drivers/gpu/drm/xe/xe_device_types.h          |    4 +-
>  drivers/gpu/drm/xe/xe_engine.c                |  850 -------------
>  drivers/gpu/drm/xe/xe_engine.h                |   63 -
>  drivers/gpu/drm/xe/xe_exec.c                  |   62 +-
>  drivers/gpu/drm/xe/xe_exec_queue.c            |  850 +++++++++++++
>  drivers/gpu/drm/xe/xe_exec_queue.h            |   63 +
>  ...e_engine_types.h => xe_exec_queue_types.h} |  110 +-
>  drivers/gpu/drm/xe/xe_execlist.c              |  126 +-
>  drivers/gpu/drm/xe/xe_execlist_types.h        |    8 +-
>  drivers/gpu/drm/xe/xe_gt.c                    |   72 +-
>  drivers/gpu/drm/xe/xe_gt_types.h              |    6 +-
>  drivers/gpu/drm/xe/xe_guc_ads.c               |    2 +-
>  drivers/gpu/drm/xe/xe_guc_ct.c                |   10 +-
>  ...gine_types.h => xe_guc_exec_queue_types.h} |   26 +-
>  drivers/gpu/drm/xe/xe_guc_fwif.h              |    6 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c            | 1076 ++++++++---------
>  drivers/gpu/drm/xe/xe_guc_submit.h            |   20 +-
>  drivers/gpu/drm/xe/xe_guc_submit_types.h      |   20 +-
>  drivers/gpu/drm/xe/xe_guc_types.h             |    4 +-
>  drivers/gpu/drm/xe/xe_lrc.c                   |   10 +-
>  drivers/gpu/drm/xe/xe_lrc.h                   |    4 +-
>  drivers/gpu/drm/xe/xe_migrate.c               |   66 +-
>  drivers/gpu/drm/xe/xe_migrate.h               |    6 +-
>  drivers/gpu/drm/xe/xe_mocs.c                  |    2 +-
>  drivers/gpu/drm/xe/xe_mocs.h                  |    2 +-
>  drivers/gpu/drm/xe/xe_preempt_fence.c         |   32 +-
>  drivers/gpu/drm/xe/xe_preempt_fence.h         |    4 +-
>  drivers/gpu/drm/xe/xe_preempt_fence_types.h   |    7 +-
>  drivers/gpu/drm/xe/xe_pt.c                    |   18 +-
>  drivers/gpu/drm/xe/xe_pt.h                    |    6 +-
>  drivers/gpu/drm/xe/xe_query.c                 |    4 +-
>  drivers/gpu/drm/xe/xe_ring_ops.c              |   38 +-
>  drivers/gpu/drm/xe/xe_sched_job.c             |   76 +-
>  drivers/gpu/drm/xe/xe_sched_job.h             |    4 +-
>  drivers/gpu/drm/xe/xe_sched_job_types.h       |    6 +-
>  drivers/gpu/drm/xe/xe_trace.h                 |  140 +--
>  drivers/gpu/drm/xe/xe_vm.c                    |  178 +--
>  drivers/gpu/drm/xe/xe_vm.h                    |    4 +-
>  drivers/gpu/drm/xe/xe_vm_types.h              |    6 +-
>  include/uapi/drm/xe_drm.h                     |   86 +-
>  49 files changed, 2124 insertions(+), 2125 deletions(-)
>  delete mode 100644 drivers/gpu/drm/xe/xe_engine.c
>  delete mode 100644 drivers/gpu/drm/xe/xe_engine.h
>  create mode 100644 drivers/gpu/drm/xe/xe_exec_queue.c
>  create mode 100644 drivers/gpu/drm/xe/xe_exec_queue.h
>  rename drivers/gpu/drm/xe/{xe_engine_types.h => xe_exec_queue_types.h} (52%)
>  rename drivers/gpu/drm/xe/{xe_guc_engine_types.h => xe_guc_exec_queue_types.h} (59%)
> 
> -- 
> 2.34.1
> 
