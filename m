Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E9FC87FCA
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 05:54:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 350EE10E300;
	Wed,  6 Aug 2025 05:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gNf3kDec";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94BA10E300
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 05:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754459692; x=1785995692;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=g3LcIRuKpbnHrKK8TOwj2NDgmRS1kOJksGib1mqPaTo=;
 b=gNf3kDeccfMJVHNpSTu3T5MTpd91UYDmuuvFyEZM5kMKSESD+uDy2Kgb
 8qK0wB/YtvMIcAwrUYVHDzpjGN/7wdgi9oM8fIix8WDYQnZldPfHVCSxc
 d5UFBCVufxiFCIJFYL8PHQOM31zm6H7fXfYYlCJO1Tppmd39zodYsfeMO
 zTX/r3ZiskDSAx7FtiPNxjOIRJuDPCBKjZg+DYPsttkl7sT/CCOGJinh5
 VDX6uMrpY4BqUZVptxevFVRKzZFfW9lP8OnL4Tw5R9lsZTlazMtiAa4dX
 MR30scrHzhiuU9i1JNFW/6gyO2q6lK1kGOHB79EoJUL0nMnnX9kb5WDPq g==;
X-CSE-ConnectionGUID: dythflHGTTi+KPhpv7ookg==
X-CSE-MsgGUID: 4dvqTUwtQheoyR8eyapxtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="74226414"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="74226414"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 22:54:52 -0700
X-CSE-ConnectionGUID: j0tzRR4tQp2k0bO72P3Omg==
X-CSE-MsgGUID: NovJxH1ZTx2S0kjlIkxnBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="164590116"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 22:54:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 22:54:50 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 22:54:50 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.79)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 5 Aug 2025 22:54:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IyxZRjmoMngXvdc6gScaoQJmmYjUdjh4miawcAX1gcvjQw2Nicl5wcEh9P8Dt5yONPjHLwNoLLfzHXC1qvE6qOscJKVwOfOsmHQH0Zqxo/RlWUnemJcWopv4bb4FKw8rF9lAVto2l75OVybobcYuMjHTN7Pbk6pRd1zRldVug1JB22E04hsR4FMitSZZ3f9ZS/zFYRHIjpXPelJvwBVC6b0AbKoKnMeHUTDQCY3Vo6NinzvccoTi2s1Nr3CpjhMC+U3mEKgYj40vfQeOF2Hx6BUySkMJxyqtaVVmZ1LqjfV4142zTsoPYJ9qxFyNQtG1Dbvdc37KyMsmfPqcmmN+HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRimuk+2ZfIGr68sxlVAME6RLnyxmdrvFKx9+i3KKpE=;
 b=ODw9mQXw4fjpHBJrtwEd/YKilAQdP6VgndRpvilHoekcd8s/Jv5VP2biizVEcCFMMdDhpFoNu/YBm7w39WDjU2vIlvLJ5FcJmc2JDSuY6fu4026CWp7OxsxYGUD7WL0rL3dZBb692odzLhqgO3BTLxzgpYoHvUJVT02j1LlsKHN3v5RxS5CnboRqCW4X3WUIc1NWpc8hfG9DZXYZP1abmIvT57VaNMFiPzU85OeKge/f2vFOLd1RenWmoPG2s5tHmbO4yQqQfzy9mVQJPeXVm+MyY/TTQfGot4bDGTpdp4BLCrs+1QVQ9tLD4xgi/hf/2qy8u+tGvzJ3nOxWXVkJ9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7510.namprd11.prod.outlook.com (2603:10b6:806:349::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Wed, 6 Aug
 2025 05:54:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 05:54:47 +0000
Date: Tue, 5 Aug 2025 22:54:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for CPU
 binds and ULLS on migration queue (rev2)
Message-ID: <aJLuJK3dO9GuPqIM@lstrano-desk.jf.intel.com>
References: <20250805234200.1035609-1-matthew.brost@intel.com>
 <175444531807.215260.1566149779838744729@1538d3639d33>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <175444531807.215260.1566149779838744729@1538d3639d33>
X-ClientProxiedBy: MW4PR04CA0357.namprd04.prod.outlook.com
 (2603:10b6:303:8a::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7510:EE_
X-MS-Office365-Filtering-Correlation-Id: c7da3e5c-cada-427e-f4ab-08ddd4adbff5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iOLsOWC52ze1CYbfY8aJyfNuXpcaYH26j2LCm+GV2dJ+Nf9ewSuTGhvS7fJA?=
 =?us-ascii?Q?zrwfn5tvKupFj6IGg2axxVG43xewM9pGlY/LkV/ye3Ugtl2tXSIaZTiG0E7T?=
 =?us-ascii?Q?OpsibBfe7hMIK2pIrO5Z/m0KCeGH/LV5Kh1U6tzC7Gb+flgDCKspnqEEYBMp?=
 =?us-ascii?Q?FMJ9aGhOj0MMt393Roj5vJ7y0QrtMqJYZ2FO2vDkJD50Ov/xRtlrVmdMpZHi?=
 =?us-ascii?Q?yQIDOpl16GsJ3Bl3zXF7AYFcAiiAGoyfjU2YobIsE9uPhvmUKbfNT+e3I8sJ?=
 =?us-ascii?Q?sAdmZeiYhcpQs2oUBXt39Je60kVwHnerejEdEulc+nUv9UWbVCUvXXQWnOD0?=
 =?us-ascii?Q?UOqF28ngJ9toaHaYrz2SJoI65JOz6K7xO2FFetL81NDkXte4/F1bjAOsWq7V?=
 =?us-ascii?Q?LwFcNRpv+tw/Vl4YKQvLXnEyPUFFBRkjSTORzkQyWePWwoB5nvINl0QODxtg?=
 =?us-ascii?Q?CX2s96Gjf7wYmq218NhyzM4OVoK/yI31yyG88j4UE1hpW30ZeCmofXqgev97?=
 =?us-ascii?Q?RLI6PbKNWT/gMGBRWm2YTySDCC6JNnZszxHyINdcXr8ECzD6dKmfjC3YcAMZ?=
 =?us-ascii?Q?6ett+1gUjVU4RGbPTvRdSrFK6OIzHgm05cg8TMGA69BC3+Lkk/hGCMI8Hueo?=
 =?us-ascii?Q?bBIiAhbXl6GuNqCyOzkcXN7rKJuIpXgyoGh4xQRMjThoPKpNLVL8ni8mHn88?=
 =?us-ascii?Q?d8PvrJ4fX6WA8JdADZL5stLm8ixNfC7xLyGkfULImmwiwfU+6o6+vYbGntyU?=
 =?us-ascii?Q?KbTzfkXEYqYJsRUw8XRobWZImzTHhXf10NroNVLXZl5meo2IOzVL1/TOJno+?=
 =?us-ascii?Q?V6dP8KPSfhwKblhOTdlwqSeHzsbKh9OcZASW8Dv6rw2U4lpSFRXw8P0d1Tzw?=
 =?us-ascii?Q?KXooXTmpeiB+QKkteL9wsXOVzbAVFC659J2HJtMvnfu31xA6TbcZBY93lLgE?=
 =?us-ascii?Q?eylK5tnoO/AMDPjjcso4mlCxno2U39nzNP4kuQy5zhU2nc0Xl9WMhOKJgXuj?=
 =?us-ascii?Q?XK7fhjJsGQGN+nSNsa//MT58+oJ+yYdXsQAdYDrVO2LQcfB1+HcB8xDmAv/R?=
 =?us-ascii?Q?MEqWrtaa5xf7dOD4xwUzMYKmi/ADhqdq/N/f0h/hH+Dc089CzvaSoUmqHYBr?=
 =?us-ascii?Q?i2N/wZ0rl36SUKqTJ/tFiSufWSsWeivPfVA1Bv4gcxtBBnMbiGmSqcrA9g7e?=
 =?us-ascii?Q?2aT+aiQu9BZOwQkBx8h3RASMFFWJUor8Z5qr8wH979ZW16qbZT5fkOyRXjhR?=
 =?us-ascii?Q?wJE6NJirqS+1nM/elXyR+Fb6V/cdM+Fvlt2gnl8JB9Oei3StGevhl3dwCP8X?=
 =?us-ascii?Q?cMIIPxehXA3Hs0KgRMgxtYiDOhvUE0JeIcBoQZK/sXJ6vDOK9UUdlAcIwaDM?=
 =?us-ascii?Q?3diLVQI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PYTmPUPUVcNwYO1vnO7rs9ElD2O0XawdAw7SCxJKPGF+K+Rb+lPTBjkW4iRw?=
 =?us-ascii?Q?EH8brpqhjvXGgzB0s7Wm1KJP6nSTDVNXT4NgxBogePwVCJrck/16P6YH4JM8?=
 =?us-ascii?Q?Q6MYWtlMmN6WneQi4oCfmIBw1SlOFWBTSPaSDxOD4Evig198uBk/s5fe8z+L?=
 =?us-ascii?Q?D7R2FUb3aynSqM440gkVWlvxk9E26seoj3npeWn//QVG73GLczZRRdKyt/j/?=
 =?us-ascii?Q?q7kw7qbLXIGb2HmPaGZXTZBZ4lNLqFLCZli7FW+XrB5auXL2vdtWayJKyq/2?=
 =?us-ascii?Q?jhtsnCPl2vk9wna/3Ui0OmLWdAEuF1LEMmaD2VtCZygSxlRfQR8xAdW8Ma4g?=
 =?us-ascii?Q?M4DuI11VVaiaHwQC+dYW1wx3VIPXqZpXw1kD0qcEdO68RBvZ7gPUA8iY/ol/?=
 =?us-ascii?Q?iRJk/9w2xkpt+Bei0oW+gUQ3Irpdlagl8Hp3CWEyVlXwue4xogNicNMC/dXW?=
 =?us-ascii?Q?ANdyUqpH9GR5rdhJvawtvIt7muwWu1AFFa11sjx6O2hNbeC5omf57h6KAcR4?=
 =?us-ascii?Q?pRgrxzDC8ahu6pq3Et4Jta1sJefvXBJb2WEGpEf69BmFK2IKY6UEv8YAz4tq?=
 =?us-ascii?Q?TfNIwLZOiXwXEobF61//NRghMderzX8Hrqa9NRvlB/9pRHVcHhwhE8dnIRDb?=
 =?us-ascii?Q?Wwsu1E3gfhVAwYUvlE5NHdLGZnNVywBejB9AYERP8GUNdoQw2wHrcOPmmQo+?=
 =?us-ascii?Q?Rlt80d2qWxO3yjlTy6M+3bakljVZNWZydfvnVHMp41Mz3XI5MLuu5dwKX4vO?=
 =?us-ascii?Q?r3xeJSPWl+2qc46iq/TKK71MmBEiekpDY/UOHEuir7iTkJptrwtClYOtQRci?=
 =?us-ascii?Q?jDdSLlnXSiCUl1kS5o4bQ3OznEbd7TV+WpvbSPyKcDqXwsSZ4YibMKevuUmg?=
 =?us-ascii?Q?YmyEcniN8ZINdujpxFookfWNvIOUSrhow5fhTZ4c7RVC8ne2Drek55wEMFhV?=
 =?us-ascii?Q?K2NFLabYK0q9L2eZeKuqSQX1BFQa/rsP4IIVDpAH+bZD8lOnxSJWdqcEAhg0?=
 =?us-ascii?Q?3d01RYQqcZdyt7viApN0qPuiI75dNk45QjEP6VFc+p154IWUbv6ZvB0HtGTR?=
 =?us-ascii?Q?xzecIA8VnJ5+rkKLDCzOd4ILj9JG2gj1xn6sSTdlONkmwSN5QVFopyASf9L1?=
 =?us-ascii?Q?CSS/4qTXfiPGGc+xYGmWWscDfqtUOsPL3zoh40TrkQpZd/vP2syPRRoee5E+?=
 =?us-ascii?Q?Mg4QwNwVO9HD/yvxTO8+up+TtPnYLp3Lo0UXnhiClT8Q5eebtITN3fzDlkak?=
 =?us-ascii?Q?iKa5jxqFhWxPyXU+06DYW4BWCjlSq9WpJAesTBggjCkjhb5nTpYM/3bzomWy?=
 =?us-ascii?Q?xNjCDxF9WFW9cAoUvmcoPQ9nEooL2xXwWSsLOzXVB5rX6f+MqkaDHIC3gOVp?=
 =?us-ascii?Q?abuH/4zw7V5qGE9Q22TJujxJajQPLa+zyOhc7ZrMet7P0kpEE99BJAte6y9Y?=
 =?us-ascii?Q?r9ktJA3xJYsfb3QU/2WqVGHEfZ/7EjoK6rTIFkipkzW23KOxDGigf1c0aQr8?=
 =?us-ascii?Q?566S1rzW4XY7deMO8z0MXCDo6r7Jt5IM8oYceTyEyioRiMHYf247j6AHTkNl?=
 =?us-ascii?Q?5w2ArNA2YHKp85Pr8tJxFoSpxUTwakYPeCvSlWyINtmMHqsSbfHwE+pvRFQf?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7da3e5c-cada-427e-f4ab-08ddd4adbff5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 05:54:47.3247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 93OvwoB+IDTjCuqV9jvJNPm7h8NlKppGNHCDFA4RMQ8tWJp0hRuHOddblZrgakRQSjVT5wfEu44IpQYdpm8iVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7510
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

On Wed, Aug 06, 2025 at 01:55:18AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: CPU binds and ULLS on migration queue (rev2)
> URL   : https://patchwork.freedesktop.org/series/149888/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c_FULL -> xe-pw-149888v2_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-149888v2_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-149888v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-149888v2_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_pm_rpm@i2c:
>     - shard-bmg:          [PASS][1] -> [SKIP][2] +3 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-6/igt@kms_pm_rpm@i2c.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-bmg-6/igt@kms_pm_rpm@i2c.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-rpm:
>     - shard-lnl:          [PASS][3] -> [SKIP][4] +2 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-4/igt@kms_vblank@ts-continuation-dpms-rpm.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-lnl-5/igt@kms_vblank@ts-continuation-dpms-rpm.html
> 
>   * igt@xe_pm@d3hot-mmap-system:
>     - shard-bmg:          [PASS][5] -> [FAIL][6] +2 other tests fail
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-6/igt@xe_pm@d3hot-mmap-system.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-bmg-6/igt@xe_pm@d3hot-mmap-system.html
> 
>   * igt@xe_pm@d3hot-multiple-execs:
>     - shard-bmg:          [PASS][7] -> [TIMEOUT][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-8/igt@xe_pm@d3hot-multiple-execs.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-bmg-2/igt@xe_pm@d3hot-multiple-execs.html
> 
>   * igt@xe_pm@s3-d3hot-basic-exec:
>     - shard-bmg:          [PASS][9] -> [WARN][10] +1 other test warn
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-6/igt@xe_pm@s3-d3hot-basic-exec.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-bmg-6/igt@xe_pm@s3-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-lnl:          [PASS][11] -> [WARN][12]
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-4/igt@xe_pm@s4-d3hot-basic-exec.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-lnl-5/igt@xe_pm@s4-d3hot-basic-exec.html
> 

PM issues are valid - we are leaking PM refs somehow. Investigating.

>   * igt@xe_vm@bind-array-enobufs:
>     - shard-lnl:          [PASS][13] -> [FAIL][14]
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-5/igt@xe_vm@bind-array-enobufs.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-lnl-4/igt@xe_vm@bind-array-enobufs.html
>     - shard-adlp:         [PASS][15] -> [FAIL][16]
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-3/igt@xe_vm@bind-array-enobufs.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-adlp-8/igt@xe_vm@bind-array-enobufs.html
>     - shard-dg2-set2:     [PASS][17] -> [FAIL][18]
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-433/igt@xe_vm@bind-array-enobufs.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-dg2-464/igt@xe_vm@bind-array-enobufs.html
>

This test is no longer valid as we not are limited by the number of
migration PTEs when doing binds.

Matt

>   
> #### Warnings ####
> 
>   * igt@kms_pm_rpm@modeset-lpsp:
>     - shard-bmg:          [SKIP][19] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [SKIP][20] +1 other test skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-149888v2_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@alternate-sync-async-flip:
>     - shard-lnl:          [PASS][21] -> [FAIL][22] ([Intel XE#827]) +1 other test fail
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-4/igt@kms_async_flips@alternate-sync-async-flip.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#316]) +1 other test skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#1124]) +1 other test skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-bmg-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#1124]) +2 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#2191])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#787]) +97 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][28] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][29] -> [INCOMPLETE][30] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html
> 
>   * igt@kms_chamelium_color@ctm-0-25:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#306])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-dg2-434/igt@kms_chamelium_color@ctm-0-25.html
> 
>   * igt@kms_chamelium_frames@hdmi-aspect-ratio:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#373]) +2 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-dg2-434/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2321])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-bmg-7/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-max-size:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#455]) +3 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-max-size.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>     - shard-bmg:          [PASS][36] -> [FAIL][37] ([Intel XE#4633])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
> 
>   * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#4422])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-dg2-434/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-adlp:         [PASS][39] -> [DMESG-WARN][40] ([Intel XE#2953] / [Intel XE#4173]) +7 other tests dmesg-warn
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-4/igt@kms_fbcon_fbt@fbc-suspend.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-adlp-9/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1135])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-dg2-434/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip@flip-vs-dpms-on-nop@a-hdmi-a2:
>     - shard-dg2-set2:     [PASS][42] -> [FAIL][43] ([Intel XE#3098]) +1 other test fail
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-432/igt@kms_flip@flip-vs-dpms-on-nop@a-hdmi-a2.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-dg2-432/igt@kms_flip@flip-vs-dpms-on-nop@a-hdmi-a2.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>     - shard-lnl:          [PASS][44] -> [FAIL][45] ([Intel XE#301]) +1 other test fail
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:
>     - shard-adlp:         [PASS][46] -> [DMESG-WARN][47] ([Intel XE#4543]) +4 other tests dmesg-warn
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling:
>     - shard-adlp:         [PASS][48] -> [DMESG-FAIL][49] ([Intel XE#4543]) +1 other test dmesg-fail
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
>     - shard-adlp:         [PASS][50] -> [FAIL][51] ([Intel XE#1874]) +1 other test fail
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#651]) +7 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2311]) +1 other test skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
>     - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2313]) +1 other test skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#653]) +5 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          [PASS][56] -> [SKIP][57] ([Intel XE#1503])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-7/igt@kms_hdr@invalid-hdr.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#1489]) +1 other test skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr@psr-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-bmg-7/igt@kms_psr@psr-suspend.html
> 
>   * igt@kms_psr@psr2-basic:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-dg2-434/igt@kms_psr@psr2-basic.html
> 
>   * igt@kms_setmode@basic@pipe-b-edp-1:
>     - shard-lnl:          [PASS][61] -> [FAIL][62] ([Intel XE#2883])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html
> 
>   * igt@kms_vrr@cmrr@pipe-a-edp-1:
>     - shard-lnl:          [PASS][63] -> [FAIL][64] ([Intel XE#4459]) +1 other test fail
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-dg2-463/igt@xe_compute_preempt@compute-preempt-many.html
> 
>   * igt@xe_eudebug@basic-connect:
>     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#4837])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-bmg-7/igt@xe_eudebug@basic-connect.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
>     - shard-dg2-set2:     [PASS][67] -> [SKIP][68] ([Intel XE#1392]) +3 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#288]) +1 other test skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html
> 
>   * igt@xe_exec_sip_eudebug@breakpoint-writesip-twice:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#4837])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-dg2-463/igt@xe_exec_sip_eudebug@breakpoint-writesip-twice.html
> 
>   * igt@xe_exec_system_allocator@process-many-execqueues-mmap-huge-nomemset:
>     - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#4943])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-bmg-7/igt@xe_exec_system_allocator@process-many-execqueues-mmap-huge-nomemset.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-busy-nomemset:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#4915]) +48 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-dg2-434/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-busy-nomemset.html
> 
>   * igt@xe_media_fill@media-fill:
>     - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2459] / [Intel XE#2596])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-bmg-7/igt@xe_media_fill@media-fill.html
> 
>   * igt@xe_oa@mmio-triggered-reports:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#3573]) +1 other test skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-dg2-434/igt@xe_oa@mmio-triggered-reports.html
> 
>   * igt@xe_pm@d3cold-i2c:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#5694])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-dg2-434/igt@xe_pm@d3cold-i2c.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-huc:
>     - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#944])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-bmg-7/igt@xe_query@multigpu-query-uc-fw-version-huc.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [INCOMPLETE][77] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][78]
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>     - shard-bmg:          [SKIP][79] ([Intel XE#2291]) -> [PASS][80]
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
> 
>   * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
>     - shard-bmg:          [SKIP][81] ([Intel XE#2316]) -> [PASS][82]
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
> 
>   * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][83] ([Intel XE#4543]) -> [PASS][84] +6 other tests pass
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-6/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-adlp-1/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-bmg:          [SKIP][85] ([Intel XE#1503]) -> [PASS][86]
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-bmg-7/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_plane_scaling@2x-scaler-multi-pipe:
>     - shard-bmg:          [SKIP][87] ([Intel XE#2571]) -> [PASS][88]
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-bmg-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> 
>   * igt@kms_vblank@query-forked-busy-hang@pipe-a-hdmi-a-1:
>     - shard-adlp:         [DMESG-WARN][89] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][90] +2 other tests pass
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-3/igt@kms_vblank@query-forked-busy-hang@pipe-a-hdmi-a-1.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-adlp-8/igt@kms_vblank@query-forked-busy-hang@pipe-a-hdmi-a-1.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
>     - shard-dg2-set2:     [SKIP][91] ([Intel XE#1392]) -> [PASS][92] +4 other tests pass
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-dg2-435/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_exec_reset@parallel-gt-reset:
>     - shard-bmg:          [DMESG-WARN][93] ([Intel XE#3876]) -> [PASS][94]
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-3/igt@xe_exec_reset@parallel-gt-reset.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-bmg-4/igt@xe_exec_reset@parallel-gt-reset.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
>     - shard-lnl:          [FAIL][95] ([Intel XE#5018]) -> [PASS][96]
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset:
>     - shard-bmg:          [FAIL][97] ([Intel XE#4937]) -> [PASS][98]
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>     - shard-dg2-set2:     [INCOMPLETE][99] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][100] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-adlp:         [DMESG-WARN][101] ([Intel XE#4543]) -> [DMESG-WARN][102] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543])
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:
>     - shard-bmg:          [SKIP][103] ([Intel XE#2312]) -> [SKIP][104] ([Intel XE#2311]) +4 other tests skip
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
>     - shard-bmg:          [SKIP][105] ([Intel XE#5390]) -> [SKIP][106] ([Intel XE#2312])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
>     - shard-bmg:          [SKIP][107] ([Intel XE#2312]) -> [SKIP][108] ([Intel XE#2313]) +3 other tests skip
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][109] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][110] ([Intel XE#3544])
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@xe_peer2peer@write:
>     - shard-dg2-set2:     [FAIL][111] ([Intel XE#1173]) -> [SKIP][112] ([Intel XE#1061])
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c/shard-dg2-464/igt@xe_peer2peer@write.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/shard-dg2-432/igt@xe_peer2peer@write.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
>   [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
>   [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
>   [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
>   [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>   [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
>   [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
>   [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
>   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>   [Intel XE#4937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
>   [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
>   [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c -> xe-pw-149888v2
> 
>   IGT_8487: 8487
>   xe-3509-7b7457e249a1f7db97122bc6b9384e5e2f45475c: 7b7457e249a1f7db97122bc6b9384e5e2f45475c
>   xe-pw-149888v2: 149888v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149888v2/index.html
