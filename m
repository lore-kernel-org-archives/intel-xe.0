Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D646DC3DA45
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 19:16:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93BD310EADA;
	Thu, 11 Jul 2024 19:16:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F4sFxljG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55ED010E2CB
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 19:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720725380; x=1752261380;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=R3kqMFwkl8o38Sc/gbsK+3bzbu1RmGUSO7Cxzsg7tbA=;
 b=F4sFxljGPOX+DzGcEFMJb9/vrwS1PHdjeKfQ/aVpcs/lVxglPBc5vpxB
 dKMeFS889LMCLwBa04EIwzcDqSrQcyhOdy+XNhOrvS8YXjFtuMwO9SAxy
 dentkzfVDK5ppAKKLEEjpjL6R1hr9jBzvbcMgdRAcUZJ9TeqRy8IlLqSi
 HuZi7KyJue9JHsOxZnSVn3kcBSwK/a8pla5stUH3oZOLs9iFaLVLwGAya
 JLIeGdUnkDqawQczUimU9XM+Zu2CroUQm8ZA2EHX3A+A+r7CR59PAtA2o
 aa9VpX8YduwfBoVNnfvNHSN4wS4CvDh20sw4dUvBtynr4bcZjtc2OySni A==;
X-CSE-ConnectionGUID: 2U3bUpBSSqe4KOtdZXJTxA==
X-CSE-MsgGUID: hjvIJZoWThO/vFnk6nuHCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="17956543"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="17956543"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 12:16:20 -0700
X-CSE-ConnectionGUID: WV2FIyhrRWeniP+PZEPkAg==
X-CSE-MsgGUID: JW18qHBoRWutBL557f8KtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="53854930"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 12:16:19 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 12:16:18 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 12:16:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 12:16:18 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 12:16:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lx0WvhNX3RIRraIk0+8wLvXxnO7Ckgz7C5goRuIR50+Vt0EsMjJzZyT5zmTdXoHdCWNFehnlTasCtGARltIen+00YowBqeHFy7W39WQYs04euljYXqP+Laes+ZvTzY6oikUXHYXuhPL39UaPp0vRZKj7hebcUb5ysmP4NL6+aJyf/euF90efZ5PHs0Kru3LVW88odsZ+mJCiB00k4hg7v2lNyrVlOS4IYcJNg0GM6fIdQ33nOhsamCbO9VQGtnrLKgRfiu0dBbOzUWUpfBqG/d1dogNEdl1TUhMr8/0BdT7Ck+8QeGTuOWP0gAGROXiA6qr6i3tlXejtPhzBq00InA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLdKYi3bqVNaXkwxpLrfvB6bM3S1WYsqCe7IJvRzbhU=;
 b=fdrv3oYpc147y625IH2Kn6I5DVfHH8NI4f+DeApZ/CkU49mxYlLl/o5YhHWC2PJViwSng9Ke6euhcqoXwAAyakFwcckoWSBpiKxWwiKIzovO3JOUpkhrOKBmEr+QrRQiUOixb3Dh6Q46u/tGhheh1OUlEEZ9IILSNT2wT3BOF9XG6tDJa8YqwbuXZh71BiYkkawaQJjvdqzL7dw5+feVNNyYlUd/H6xwln1UcXyFn4sC8Itl4oJu0ba55OiA00qHU69RlwiwmZ+iY2HSJDWq5mM1S67PuXcRK2hgNihR2PtgPAiroFfToW3C8dR4NsQFNkqL0c0WqA+Mb8iWIL4yAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CYYPR11MB8305.namprd11.prod.outlook.com (2603:10b6:930:c1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Thu, 11 Jul
 2024 19:16:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7762.020; Thu, 11 Jul 2024
 19:16:14 +0000
Date: Thu, 11 Jul 2024 14:16:11 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jose.souza@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, <fei.yang@intel.com>, Ashutosh Dixit
 <ashutosh.dixit@intel.com>
Subject: Re: [PATCH v2] drm/xe/uapi: Expose SIMD16 EU mask in topology query
Message-ID: <iuknmfhu2anc6f7sqfalijhaws6mmx5djfu3vhv5j4frhnxin7@2jqs23zqm5kn>
References: <20240710220446.2169797-1-lucas.demarchi@intel.com>
 <ZpAaK5OjjziS3S88@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZpAaK5OjjziS3S88@intel.com>
X-ClientProxiedBy: MW4PR03CA0221.namprd03.prod.outlook.com
 (2603:10b6:303:b9::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CYYPR11MB8305:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e0c19b7-f5b0-49ff-5cad-08dca1ddeebf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?thRnUqybJPhixcRGeNjEYTb8LcCY8a29OLjjgEgJVj/LaFWEPcTlgotZHFrE?=
 =?us-ascii?Q?TMkVJDweZNUGg5v2aLZui4+VfSH+YvKHLp9QDCGuWGTWLyIvjCCuINpjyU2+?=
 =?us-ascii?Q?Y6+StsLywmIVbIhKj1sZNE5PUnonasIXnVaIVkyUc8t7thCMFmukDhdt1Sq2?=
 =?us-ascii?Q?7VJyW9K2VeDw35MYoSGKiuO4CF5/AYDb5utEql2QXlrUFFWWP7p6h1hT7+vs?=
 =?us-ascii?Q?nWn9C45Q8k3mYQgNLRABEt5z+EDjPBVryuzCKmXb4P3LnH0+ekNSQdBql+tr?=
 =?us-ascii?Q?t80nUmPeAwIe9CwSf6gAW3fw6I8aKD1I5qHfRJHbnunS6LysihXofdZHevBS?=
 =?us-ascii?Q?BtJWeNuW8IvRLoHujRx9Zo2z7IOXqA5A/2ieHMMQYSiJMblCOElYDEu5Wske?=
 =?us-ascii?Q?6vI+OlX6e7I8lXDEB1m+ocEwD71Ha5Jinp66hGaNIfrE1iwxtP0BGlLGbeC2?=
 =?us-ascii?Q?Z3+RsSci4opBUBm2iFjDJTW02hCdVNqAq7heM6Uied1AMdcn3b9yJJsJcHab?=
 =?us-ascii?Q?C7oaNrjsqcUcoFPqkhlfgZIvbO+8JkWTX3UZ//AFTzxHYHKrCNgEmmjA+cgu?=
 =?us-ascii?Q?BbsHAnJy0sNuZ/PxiwTvaUDddKAZHAVu2ePxgJ2zHuYuraCaYay/o32M7GVc?=
 =?us-ascii?Q?QWABo8L+l/291A/aXG0hhQpPoHX1N4qJIAelZl2xvmSEAPdySLeFvCysgoZT?=
 =?us-ascii?Q?qp88pgBxDw9hQHxCXrqH4Sfxho0NAJE5r5L+hmDfaA8lYJlQdd3an0SLB6WS?=
 =?us-ascii?Q?RexP0v8d4tMPTNhBG1J/HGPs08XCRPqQbFNaxfgHpMhTgVAlExxZOS4dD8EF?=
 =?us-ascii?Q?+tZ+kknQzlHelSPfjlj7tLQdVSs7aqBH2PcP3m4Ww2ffOScoAjLsqohzvxpw?=
 =?us-ascii?Q?TcZPT8kNvtUYRQsS6ETPOzSzCe3RquEAOgg3RsaHsWk1OnO2EkbFC+V0K4rJ?=
 =?us-ascii?Q?WbS2WgDAZDJsUatjEKQOIIA51gLlJa2HRWMIVJlX5RHW35mkJ0frLMO8NfIf?=
 =?us-ascii?Q?l5Q+UrKKbB4qOKQ2CgMwU1gcQHY3OUuEqm0hSaM9FMWikyLyr6G2jvpqn1l4?=
 =?us-ascii?Q?twxOQp4CNitBsCgWGIPVxTuEpp6R81KqkXCOdrlUJePK7WJXLhxVLdYtlmzm?=
 =?us-ascii?Q?kWMusR54MVrsCO7vxbxnhuAOkymz5wgyrWBEDMViaPkmlQ8Lwyb2lMH7yY1k?=
 =?us-ascii?Q?GHwBYDQ/9UzUI9lNC9qek1EEmO0xcZren0MVvognXzqng2mji5Bsk1nFEONn?=
 =?us-ascii?Q?XneQY9V92eI1Y1rc4s9o3IpcREbhiFcGuX5EOeXjTcEhcGnN/NVaDPmfsT4/?=
 =?us-ascii?Q?yPg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vM00uyRbRXq/PueUT8vriZykSo4URCz0EKB8vkRXq51deCGkbm8G+SnmlvQ5?=
 =?us-ascii?Q?PWCQO36qOhPnRAmYgzrRDvGh91+vBE7kqzX4hKEj9IHriTkpYMepvJ95CggM?=
 =?us-ascii?Q?lROPyY+SCYDIaTD1xS6tq1NSoiuMHxcLJ1XBo145TdxYPXtn7Hg61aMld6p0?=
 =?us-ascii?Q?5SQ5JPK0SQHVTXyj9302Geh+d4wW8GCpG/NiCMKe6Gws0/6GV0IjsSaK89fX?=
 =?us-ascii?Q?hveSzArGq93QQfGEWQiXQ7VNa8p9DyxKXvr4Mv/e6C7eKqahisekGuV4asEC?=
 =?us-ascii?Q?2PncCzBAScZ4w3sgTT0akFjryCfxJdRH9U9Rs09q8g3+SB2z5DJBRqOC5mmW?=
 =?us-ascii?Q?9FVF8G4TrqmpFRHZ+xZzu+iQvkAvLyJN0/3CaDLowq33bkMYvr5U/iGPS/Fx?=
 =?us-ascii?Q?/+AzQLO5fQW8uAzDUYoxhQAuV0awhuqvyOm44J+dBv9IZpT1U+NQGA+j6hxL?=
 =?us-ascii?Q?7hUCe2mLMQ70vtcLx47M0Y4nukHXGbx5FdPhRODOCBN6nrkLs7bpj+jdbfIN?=
 =?us-ascii?Q?lOrH4nZV1Pdu8kyevnNUXmNBeRZaRPEclURKv+sKj3WV0Mw8WeTqZXOX2hNb?=
 =?us-ascii?Q?NhbKmJWq8vkHE4otP90wCDUVv4SAXuFw9JibJMuxMDQhwOcdfCL1Mnjwn3IF?=
 =?us-ascii?Q?EQoKPWutWyWVtPM2CmCGZ+Rmgd2ylJs4722T1hY+hcxKMU+rx/8Ov05j8Dop?=
 =?us-ascii?Q?/qIrSbbeX9PMm8P8b94XxWYV+ygyQCP2MdqvwreHbo/8L48OuwEJW8k8Wiik?=
 =?us-ascii?Q?Jg5Ub2IHMsJ5LuJAZpW2mzgATmVBfMTjk+ZcA8ztLVhqw/vqvUtlI0FUd1gZ?=
 =?us-ascii?Q?1YnGfjcNCJIV1wsncISAImq0r6znzH++J9vwe4kEoqDpDTzpeKAHKqHsw7YQ?=
 =?us-ascii?Q?qJ6PjdjSas1vJd02xOHYn/CTdfoZXr4LguXmzl08SwMW8mfjDxncDbrI/uIr?=
 =?us-ascii?Q?icNV24o4QodxPNtAkFre9TV61ANN6Wmu3qR7DiypHad+aMki6loL1bZKd1Rt?=
 =?us-ascii?Q?CODpczPpXId35Gw0PLUF3ikBKRr469vtggR6/n4E/bcthPgfzm0rY3RmHPvL?=
 =?us-ascii?Q?u/z6dkJ2/Z0FeAUrtSVwOLRbeL6T6qEbDUAZOed2tiAsYEJexqnpD99PJHCJ?=
 =?us-ascii?Q?e4bLHVxxuMc1wRT5hHhotMPStV5LReQB71fvWG0vA+sV+kYu860fiQMyz3Ji?=
 =?us-ascii?Q?82CswbLrQ2ZYIKvJV1qPu0CDiFIhV8IuPvX606VMfZZsCPyQQZvD3/XOrtHv?=
 =?us-ascii?Q?qfWuKtuwwPJMoOpeQPp0C70IBwXZPmWHyhF9Mw6p8CK7nzkuoUahbNl3LPcb?=
 =?us-ascii?Q?aTGLHqSVBdwqN7EO758tYO1cNzJ0H/Xg+PXPve8TYtiC2KbQSiIrOaAN3rVp?=
 =?us-ascii?Q?kEgMVgRsKxQvCjbA00B+9Rm53D/EoiCJBhPUB8GnupjH+P7OkDh8FhKGUPgx?=
 =?us-ascii?Q?NO88vDbl2368MnL/ouWcf0zjIFn/VVIzwlXrZD1KelRY0riq/8nHihoTpRVu?=
 =?us-ascii?Q?4EtR/l86nGgb6F4za7JZdgqwGzQovw6u/Ys9bf/7/cX97e15IvfTgh9Snqd9?=
 =?us-ascii?Q?CqF8WVZ8WpajRGF/rGUQ7Zk8kKZ2rGKZOoKU1odIqzIVs8T6jnLnYYoINvNM?=
 =?us-ascii?Q?5Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e0c19b7-f5b0-49ff-5cad-08dca1ddeebf
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 19:16:14.6957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gm+3eYkKSWqjnuBahWK/0P/7FetSysQY3OkFVc76I7NxSxIAmtkUSU9RYelhVE0+K9TWHzHbSFO4rhLvOgFku6VP+1RlYuFkUJrXBD3MCmQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8305
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

On Thu, Jul 11, 2024 at 01:45:15PM GMT, Rodrigo Vivi wrote:
>On Wed, Jul 10, 2024 at 03:02:27PM -0700, Lucas De Marchi wrote:
>> PVC, Xe2 and later platforms have 16-wide EUs. We were implicitly
>> reporting for PVC the number of 16-wide EUs without giving userspace any
>> hint that they were different than for other platforms. Xe2 and later
>> also have 16-wide, but in those cases the reported number would
>> correspond to the 8-wide count.
>>
>> To avoid confusion and make sure the right number is used by userspace
>> depending on the platform, add a new item to the topology query and drop
>> the one that is not available. The new mask reported for both PVC and
>> Xe2 should now match the numbers reported via hwconfig.
>>
>> v2: Use a different topo item with EU type in its name to report the
>>     new mask instead of adding the type itself as the item (Matt Roper)
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>
>> Tested on LNL to check the behavior in dmesg, debugfs and ioctl.
>> Test-with: https://lore.kernel.org/igt-dev/20240710220050.2169596-1-lucas.demarchi@intel.com/
>>
>>  drivers/gpu/drm/xe/xe_gt_topology.c | 27 ++++++++++++++++++++++-----
>>  drivers/gpu/drm/xe/xe_gt_types.h    | 11 +++++++++++
>>  drivers/gpu/drm/xe/xe_query.c       |  4 +++-
>>  include/uapi/drm/xe_drm.h           | 10 +++++++++-
>>  4 files changed, 45 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
>> index 25ff03ab8448..5a1559edf3e9 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>> @@ -6,6 +6,7 @@
>>  #include "xe_gt_topology.h"
>>
>>  #include <linux/bitmap.h>
>> +#include <linux/compiler.h>
>>
>>  #include "regs/xe_gt_regs.h"
>>  #include "xe_assert.h"
>> @@ -31,7 +32,7 @@ load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
>>  }
>>
>>  static void
>> -load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
>> +load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask, enum xe_gt_eu_type *eu_type)
>>  {
>>  	struct xe_device *xe = gt_to_xe(gt);
>>  	u32 reg_val = xe_mmio_read32(gt, XELP_EU_ENABLE);
>> @@ -47,11 +48,13 @@ load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
>>  	if (GRAPHICS_VERx100(xe) < 1250)
>>  		reg_val = ~reg_val & XELP_EU_MASK;
>>
>> -	/* On PVC, one bit = one EU */
>> -	if (GRAPHICS_VERx100(xe) == 1260) {
>> +	if (GRAPHICS_VERx100(xe) == 1260 || GRAPHICS_VER(xe) >= 20) {
>> +		/* SIMD16 EUs, one bit == one EU */
>> +		*eu_type = XE_GT_EU_TYPE_SIMD16;
>>  		val = reg_val;
>>  	} else {
>> -		/* All other platforms, one bit = 2 EU */
>> +		/* SIMD8 EUs, one bit == 2 EU */
>> +		*eu_type = XE_GT_EU_TYPE_SIMD8;
>>  		for (i = 0; i < fls(reg_val); i++)
>>  			if (reg_val & BIT(i))
>>  				val |= 0x3 << 2 * i;
>> @@ -213,7 +216,7 @@ xe_gt_topology_init(struct xe_gt *gt)
>>  		      XEHP_GT_COMPUTE_DSS_ENABLE,
>>  		      XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
>>  		      XE2_GT_COMPUTE_DSS_2);
>> -	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss);
>> +	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss, &gt->fuse_topo.eu_type);
>>  	load_l3_bank_mask(gt, gt->fuse_topo.l3_bank_mask);
>>
>>  	p = drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, "GT topology");
>> @@ -221,6 +224,18 @@ xe_gt_topology_init(struct xe_gt *gt)
>>  	xe_gt_topology_dump(gt, &p);
>>  }
>>
>> +static const char *eu_type_to_str(enum xe_gt_eu_type eu_type)
>> +{
>> +	switch (eu_type) {
>> +	case XE_GT_EU_TYPE_SIMD16:
>> +		return "simd16";
>> +	case XE_GT_EU_TYPE_SIMD8:
>> +		return "simd8";
>> +	}
>> +
>> +	unreachable();
>> +}
>> +
>>  void
>>  xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
>>  {
>> @@ -231,6 +246,8 @@ xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
>>
>>  	drm_printf(p, "EU mask per DSS:     %*pb\n", XE_MAX_EU_FUSE_BITS,
>>  		   gt->fuse_topo.eu_mask_per_dss);
>> +	drm_printf(p, "EU type:             %s\n",
>> +		   eu_type_to_str(gt->fuse_topo.eu_type));
>>
>>  	drm_printf(p, "L3 bank mask:        %*pb\n", XE_MAX_L3_BANK_MASK_BITS,
>>  		   gt->fuse_topo.l3_bank_mask);
>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>> index 6b5e0b45efb0..01ea87d8886b 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -27,6 +27,11 @@ enum xe_gt_type {
>>  	XE_GT_TYPE_MEDIA,
>>  };
>>
>> +enum xe_gt_eu_type {
>> +	XE_GT_EU_TYPE_SIMD8,
>> +	XE_GT_EU_TYPE_SIMD16,
>> +};
>> +
>>  #define XE_MAX_DSS_FUSE_REGS		3
>>  #define XE_MAX_DSS_FUSE_BITS		(32 * XE_MAX_DSS_FUSE_REGS)
>>  #define XE_MAX_EU_FUSE_REGS		1
>> @@ -343,6 +348,12 @@ struct xe_gt {
>>
>>  		/** @fuse_topo.l3_bank_mask: L3 bank mask */
>>  		xe_l3_bank_mask_t l3_bank_mask;
>> +
>> +		/**
>> +		 * @fuse_tipo.eu_type: type/width of EU stored in
>> +		 * fuse_topo.eu_mask_per_dss
>> +		 */
>> +		enum xe_gt_eu_type eu_type;
>>  	} fuse_topo;
>>
>>  	/** @steering: register steering for individual HW units */
>> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>> index 4e01df6b1b7a..73ef6e4c2dc9 100644
>> --- a/drivers/gpu/drm/xe/xe_query.c
>> +++ b/drivers/gpu/drm/xe/xe_query.c
>> @@ -518,7 +518,9 @@ static int query_gt_topology(struct xe_device *xe,
>>  		if (err)
>>  			return err;
>>
>> -		topo.type = DRM_XE_TOPO_EU_PER_DSS;
>> +		topo.type = gt->fuse_topo.eu_type == XE_GT_EU_TYPE_SIMD16 ?
>> +			DRM_XE_TOPO_SIMD16_EU_PER_DSS :
>> +			DRM_XE_TOPO_EU_PER_DSS;
>
>have you considered setting both for backward compatibility?
>And then highlighting in the documentation this duplication in the case
>of simd16 and that that should be checked first?!

that would be a silently break, with software utilizing the wrong number
until someone noticed, probably after force_probe removal... and also bring
the question: does it have N SIMD16 EUs + M SIMD8 EUs?

Lucas De Marchi
