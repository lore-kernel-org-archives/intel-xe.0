Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F5F8CD5BB9
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 13:14:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6421F10E3C0;
	Tue, 19 Sep 2023 13:14:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B94810E3C0
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 13:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695129259; x=1726665259;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oqVOL3sXBsjO37hdWfJHJklS6w72Sz04JXS9YwJbEpc=;
 b=BXso5XWQddGreheK6pk4bLQy7PwHtCTu+9nuD4q35iJAVZ/TLX/L3ew2
 kZ3gKsr14RQ891laRedn3eyEZXg3lyq5cYhN0pTX/MZmPiJNYH0L5Zfbh
 7HhVY53k2X8OUDZ8pj8+kdNWliKnHcvR0Y8Lf98MI03x9Y7Kf7ACITsdF
 g6RnKMZiaLl3uuAwr852iOIE0ACNMkdzvCXh6YdQ0qgXyUx+di+0PSko9
 DqNw3k2mvHVN09+nqhA/Nl2abVrrsDoFnmaJ4y3ybAsjRaJB7Uyuk6XbU
 ypq88nQb72Ke4+/5FtgydsB6F+sUFb6t7YobJtvuslTTBHKwVHIv4mnLm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="370251360"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="370251360"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 06:14:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="861541900"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="861541900"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 06:14:18 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 06:14:18 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 06:14:18 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 06:14:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/I3uNpYTMXHbLmsDCoJO07UqIvZZZWeAudO2wn6uCPiQPtSWoVYhc+i76vy9Tvb68YM213yfd7bvOr3mE1HCO/i9CbA4CwrNCzonjKnjLSwTr1YNSvqO8wWT0JNXNK+TacXyauEoNUvLng+lfsXmuRvFM1D4ZpmzPpQpv+eGTzJD4Vc0KoYxfwFC0P71mmikuDCuY5ryahk1ihYXCOPLglW8p7QWaiZquJWLLj5TN/7GCXSwlzFL8TPKfBarI44MmUixgRY3ugy0zp8RdQi02JebpOHh2zVLonyxttI+AH7E5osfbCgeCsg9EzYZOZYCArVhTCdr0+KrTx6L8JeHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzRn4xyKg5MO3DKPP8Gb9YFZSI1jfe+iNUsHeYWnYWg=;
 b=eF+I/mikJ6D/yBY4uuzptie5VjkhwslcJGvUh8HU6CVS8IDLHnqfEqRdksO4gq/hdZuYOK1eA0PJ/EaeA/icMFZXCfc21nYDTTZke7gNVJB385Ay8BO8P39w3JGtT6qIwoym5uQjHHD8rszl8Se8nMa18bsaxVvYS/WpT2cMyol6jI+Y5XkjIPG4/YVz325tP3LgAxfac+Owppm4ypPxWE59bKtmt+N9QTolCL+7o153ZmcoCqzWjDC+JvuP7EXN7jAN01Ju4dKQ2rn7rzsaG4Uesa3uqOlfmuNHqNtM1q1V/OmZM46OHi18YgRUUmskmhslAVARlFZW7WIKT5+wiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA0PR11MB7912.namprd11.prod.outlook.com (2603:10b6:208:3dd::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Tue, 19 Sep
 2023 13:14:10 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Tue, 19 Sep 2023
 13:14:10 +0000
Date: Tue, 19 Sep 2023 09:14:06 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZQmenqsn4JVHeoDr@intel.com>
References: <20230915233445.2241554-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230915233445.2241554-1-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR13CA0161.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA0PR11MB7912:EE_
X-MS-Office365-Filtering-Correlation-Id: 916c7511-d5dd-4a20-0ee4-08dbb9124f95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KZErOcUKTurMRgQAg//0Xp7msrDp8N+4d6MPMAOvvKsr702hNRXdCS5oLRgW4GboMzKxJgDeR5fHWO+tano0hox5aiKj58Kjpi/go4sHizLthjPotHp136vkM7GB0VM/7HDBxiXqq7f/JHsojb5MntqDoOlamApZF81ccVunGEVAEH3qPyrljuP2kV3YEH3BtJAVEdlei/KvADtOJa6pU8ThyRbQyC9DrNOLS+m0Nw7n/Cci5n9TnFrfVbAzwUZzYko6+LUJNkMOKXEUUI6jslpAnU+vw6YFjZ9VleOMmyLzNigbmf/Ua8sua/rQ1A4s3jWMCH8/GaoIBT0BlCs9sM4uxkCLK3WGbpDrJ6I3V75vCS1KVmqtp3YEWlHDRZxlNcwiuH4kPwQN5m1UQhujIBFWQcV4UvPEDjQye+xC6/H/1rImRHYbm4So+4QsIzPEctBuo6DJj1xlw3/3f2ssyEh5T4Z7kz8Rzpwrg+us5FHS/Le4UVjcijBq/plZgFjH0W6chu+J845jLwGqhVvEscm2c6wdPH+5sYhJl/xQJOgOoYXVmZzEg5GO21w1sEL0G57BzCK95gitD64ams9uMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(346002)(396003)(366004)(1800799009)(186009)(451199024)(6506007)(6486002)(6666004)(36756003)(38100700002)(86362001)(82960400001)(2616005)(26005)(2906002)(6512007)(966005)(478600001)(83380400001)(44832011)(8676002)(6862004)(5660300002)(4326008)(41300700001)(8936002)(66946007)(66476007)(66556008)(6636002)(316002)(37006003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z9UIQVLSGGFawJMxV5K9rzrm08qdue5W9w4cy1FdIgWqhiDotYls/9ZHZocB?=
 =?us-ascii?Q?uI7l4AxPWVZETJeZQCIlpUSPrhgQYX2Suf3bQIEsuna0bgRhMUNNC3vfRaIQ?=
 =?us-ascii?Q?jgZ8iPbSchFvyYjZt5eCYSfMAru1wTtnS4PlDAyiQSrkFAzbxTlT7yGicLFG?=
 =?us-ascii?Q?NTX+maFCroO8Zl1T6lj7N2GbLmhL344X7FMzcSpKUXsSCp8EKynrOJ5NgSl2?=
 =?us-ascii?Q?tpo90uNN1rLafzYodbA64DBICKHAdGr0IyVGyVfy3HC31F/7YXTm46o4gK3/?=
 =?us-ascii?Q?yggS5u4BvsW1xP6qyG8ij/d+3pnlBlXwlJfzVAjQvXtLu2ehrR8fkIbuyFyy?=
 =?us-ascii?Q?bwpLVzV4zCP84QFqMAljECvi/XUQgP1fcLMXhbfYBYE1AabbKOrhkrVGAsMy?=
 =?us-ascii?Q?vbZfUH8/V1hLM6TojJrpjcR/TePNEOD+QqpKSaBMjbWi4igDz/KvaHBsJYhA?=
 =?us-ascii?Q?ogGf2E+o+4lc6q+gNyAIlGxE0l5A9Nep+2tpr9xqcasZ+BQWFXnHDdgMa8YP?=
 =?us-ascii?Q?zkYMb9l0wS0MDS31zx4A3qi/wOHDq0kI9EgsmHF+Fny3TcvJP8tJ6u+k2XfB?=
 =?us-ascii?Q?0um3b//fapiBguAIfBEo8ipbyU5YRM5cyWQRs0oDLyHmKIVrb1quQwUdiAZC?=
 =?us-ascii?Q?1Re8sffUvDW3dc4g6YNLBiOsg5wamrTcHsu7JNsVQV/imXPFG9n2aC7fCzx0?=
 =?us-ascii?Q?n/SC1yAHFvRWvl9OAk+G83YLwqg7jgt9RxRWklnuesAhqoKoVj9SUVL8Gc9s?=
 =?us-ascii?Q?LVI/Ea0uWqVGRxiNW+ReMUEoWsi4v7v/2P4Lzzl2bOiTwE342LE0YQg/5E8L?=
 =?us-ascii?Q?02g/8V5rh5CHTWPdxQRvuo6B5Ms7rEDny2NwARaH9Z6BOQ3fiDqJMVRPeQJK?=
 =?us-ascii?Q?zsoku3G1o55nju10h3VfKXDmJLt3SOp89u85gkGgygpzZuEcRaZCBbPZGQDO?=
 =?us-ascii?Q?E5aQX92qF4r7sQqaI3nqCO1/Y/Xh4zRwP3yXZwf8K2sFgXyrIWcRmoe43y8h?=
 =?us-ascii?Q?lecLbtcnX8ZsAX1QgKPO8CddxzuMbrfI0iD9ApVoQRjUGYVuTcltSrI60Mhm?=
 =?us-ascii?Q?zkVPpYIQZ9lsSY/8Q6o2cS/Mw3OEYl68SAuqJN/l9FHkc39PaRnlK1SVR/Mx?=
 =?us-ascii?Q?3YAAiFwhaYhGFbhRd0VrOU1Yy0Gnkvm1XAYlkfTMjRsJfCMr931Y7+3iWWr4?=
 =?us-ascii?Q?aDkCF0aR4mq8dxxh51h76mlJAPajBDMBsI4MKO6N5Ie6Or2RhwpmeamIqWWn?=
 =?us-ascii?Q?r6DPFzxO5aKLE5nq94aR/GhFwERdkusnkg/DdBMjA9Rst+VSzfjbWr1hgrHw?=
 =?us-ascii?Q?x3KPXoi4dzS63NSz2OBptqBtMymDP/e+RBP7ng52Oji3MkcrOc+Xaaqo47n5?=
 =?us-ascii?Q?EszRv5ijY25qHS/DSoJHrqGpA8y+8JMgh0LdSoy55BaN5yXfMVUTZxYj3397?=
 =?us-ascii?Q?QovmWlYrQIVtx+mvibbRyTrOKGjABPovSfx4BMN8TOU+nrNp6wLpzxNKhFnp?=
 =?us-ascii?Q?Rzhv5uyjA137vM5O34Q1P/8EneVoK19BoE2DGVs/qGt5usJ7jsCFzN4HwMLP?=
 =?us-ascii?Q?H80Nemb2ETYuEq9VeTTBaeI1WVtvtRqMAZCkXP04?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 916c7511-d5dd-4a20-0ee4-08dbb9124f95
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 13:14:10.1451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XrxTjw7nxPJ4VV+jOn4IyFpL5KYliDhc2IEs/diDFdV8WwR0oyxb9znZV63MvDMwYuuHUjTqupxhYk3bhZArlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7912
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 0/4] Remove
 XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE
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

On Fri, Sep 15, 2023 at 04:34:41PM -0700, Matthew Brost wrote:
> Backwards backing uAPI changes, getting on the list.

Patch 2 breaks compatibility.

> 
> First 3 patches already on the list [1] and free to merge as soon as it
> gets an RB.

Please do not merge this today as I'm getting these patches with
the others that Francois and myself are collecting to have a one-time
shot on breaking the compatibility.

> 
> The required IGT changes are also on the list [2].
> 
> Matt
> 
> [1] https://patchwork.freedesktop.org/series/123820/
> [2] https://patchwork.freedesktop.org/series/123821/
> 
> Matthew Brost (4):
>   drm/xe: Fix xe_exec_queue_is_idle for parallel exec queues
>   drm/xe: Deprecate XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE
>     implementation
>   drm/xe: Rename exec_queue_kill_compute to
>     xe_vm_remove_compute_exec_queue
>   drm/xe: Remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from uAPI
> 
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 97 +++++++-----------------
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 +-
>  drivers/gpu/drm/xe/xe_vm.c               | 21 +++++
>  drivers/gpu/drm/xe/xe_vm.h               |  1 +
>  include/uapi/drm/xe_drm.h                | 19 ++---
>  5 files changed, 57 insertions(+), 87 deletions(-)
> 
> -- 
> 2.34.1
> 
