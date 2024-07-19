Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D7AC3DA59
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 07:48:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A05510E879;
	Fri, 19 Jul 2024 07:48:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bX8xPbn/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D4310E879
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 07:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721375298; x=1752911298;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PNQVBbRr4upqjzn117BkLCXhz9Cf0+HJ0bcSyk6phC0=;
 b=bX8xPbn/n4Sftr46VZHlCqmQY9dDXWfzmtLDTduszlJlEZm5yaLQM/j5
 /XZXRDkvkWYKUIgmPNbHmWUs48kK1MlpQyra3ZtQWnGfpEpXqKTeGrbIH
 fbknX4mhX2VdiWd+bR+mFoqwsMVNpNr3WO76/R4qIEzUL8W2NvD3Akath
 uY5uM7b1jz2khHejFMqfi3Tzgu9GmK0egEe08WdmJgJdk0fprvFGJ1//C
 42X3+FgtEOaDbVUlpCSB0YjVqP6bZBIAOC6w+06Z4sdMBXyxaFpuLhgFt
 fgzmUy6oK/No1/uDI/qfBfqYljCOHiwq/qZq+OP80GfzmUCQALhJjecAX g==;
X-CSE-ConnectionGUID: W5jPvhkVQ/qHRZS7MtdVwA==
X-CSE-MsgGUID: lN7zuMBrQ3aecK6ZOHcWtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="19120490"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="19120490"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 00:47:53 -0700
X-CSE-ConnectionGUID: IPDg9hPtQc2CQArDx/fakA==
X-CSE-MsgGUID: nkI6Qj+uRnqLZJb29d75og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="55221144"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jul 2024 00:47:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 00:47:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 00:47:50 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 19 Jul 2024 00:47:50 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 19 Jul 2024 00:47:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UTiwZh43JZZ2l2QQte16iX7Rk55/doqPI3JjcQSNteoVqJ8V4aCWmlNB3fmbHgTSGt2iMnyWDz4bjKUBg/g1Rfj+vbfKiQLUQRzGRFfZ06Z54xPqxAwC/Ynu0a+/98kUMoXgwgy7CuHmnwCN6C1NZWO+C/H8aetlaZZ3RylC5fWKFzjVMomYBauG8460LVbEjBZer+8wo4PCpAc+ieldyZ6bCg9UB/Q8nbyl9Hwad58hH6LZa/s7fe/7R/46gzGNkbsxjiKf3Rj3MwkUP16fbPHCg8+6P3HehvBQJ6ZQU+EaIuXmnFHi/bFejQDXdkGhgfbTh98H33FiYXg/1UffLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYiouqRm6F/LHfiODnTlIGsqtDCgKa8CdworzTmoETY=;
 b=iQhJrOdA5czrvppozOP/fzgJTr7VXLVjpwPvfNf2YeHXl0rL8rESNYKlQg3p/GclyD8ycq113Csbo+2qyPTOOEDASTJ9nDBzCHs7tOgkTLPImQ0nsNMHf669NUoDReJYqI3+UZEZM70aFFRgyoYQSgICCZrn5E3BPfGMSaxJcHw6N/5tFbBS/SpFH6lxHSjpHVKzs1GqCpEgWemRWlGH4MH+k8mA5vnwEprRwHc9cDzcwWSX5j2y6DBDPlH2TWBsuPLlXpieUMvwYV+TkZJA6Pd3Bh/8NETYjD7kWoGkpz+wpiLZrGqE1CIeqV8CapMIW4ZgYltdlQPAOy+Rk6aXEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV8PR11MB8533.namprd11.prod.outlook.com (2603:10b6:408:1e5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Fri, 19 Jul
 2024 07:47:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Fri, 19 Jul 2024
 07:47:34 +0000
Date: Fri, 19 Jul 2024 02:47:29 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 0/4] Have xe_vm and xe_exec_queue take references to xef
Message-ID: <65ibpaeheqwit3co3h2rywtnbh4a6gu2bdth4bbyecuwiqdlms@7bx63x4bis24>
References: <20240718210548.3580382-1-umesh.nerlige.ramappa@intel.com>
 <ZpoSw8/LCzIydcsj@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZpoSw8/LCzIydcsj@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: MW4PR04CA0137.namprd04.prod.outlook.com
 (2603:10b6:303:84::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV8PR11MB8533:EE_
X-MS-Office365-Filtering-Correlation-Id: 344c3263-ff35-4f6d-bbd4-08dca7c70d06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1MLaDUJBM4tKGm98Kh4+rzlk5RkESEsXwsgy7VpAifxJM6S0UvZvhNrKJBVm?=
 =?us-ascii?Q?l0C1FAAM6AzqT3VRXyTDgtbbOLyjtziVMeIXhE8jdttjbjrdd4QK1HzcnDMR?=
 =?us-ascii?Q?2uzXYd9Z6qhnz0Ebv1ZPmKcD/1Qe9wuElUu77uN5B66HVyeO/ypD0YN+8WEA?=
 =?us-ascii?Q?QMCaPdbLvD3GN0gfCa1e1uB0pGPk06Xmd2DNJBe7lam/GP1sgZMyHW/6nzVE?=
 =?us-ascii?Q?Ilvs7SSmfLHuPjeCNMQbf7k1mKm/i7HFB39CWt5GjH8ZKJrDf/4bDyO1kkvR?=
 =?us-ascii?Q?H+kEeBgROibuMm/olSLb7rKl6+FRjzxOSSrovASg6HF2Di7IEtcdQE/JwacG?=
 =?us-ascii?Q?hHwJXbrHTSFFo61Vneuc1bWo0tYxiFyhntub2Z3E4ChANNHAuqeY5VHvLUE/?=
 =?us-ascii?Q?9Bc5pBqJPMeDU92Sa8EPhzYpx+bwEvT7voFMTrAdpM2B93ME70o8Xgv8YahR?=
 =?us-ascii?Q?FhjmqTQZaE4PJUA1buDWM7rmf7wpa7CCHkc3+eWQo+LlW8tMdWp+6dElU3FD?=
 =?us-ascii?Q?6/wcTN0mE5FkCy/kIBPNtPd8z1wG6NeGyGjGC6ZKZVhla/NPaqTeaYs8V8HU?=
 =?us-ascii?Q?HeGsjvLcH8PizmAG9culy3ZVxBfdtTWGJmoPVjGT9nHXanDsk7G3vNjzuJov?=
 =?us-ascii?Q?iq/8i56cm67dUOioi2izzwMqZFOMDHHmtfzzTyQAWrLL5smhJueYOkzx1Gtk?=
 =?us-ascii?Q?gL++rlZKltaK0EZUmPIYU8BIAdlPzYMLyH8RmIc+RGv1TZBssxitypFiT1xU?=
 =?us-ascii?Q?JDd0hjbXdO7hB9RavIHTsNk/OMGNo9XWNVGDayCkWXUmOt/UjqHgrMpY7aIS?=
 =?us-ascii?Q?tijoa6RQvSDycjTV/mQgMCnSTL+nwd6fGQXbHJ1OoUU4ffE0W3PGprOTdAfG?=
 =?us-ascii?Q?2wf7qjyETxKWCiqlKjnx4cTqCrkNAiaCB8mfQOvFfRL6b9Nd4nmQUWFSh8Ki?=
 =?us-ascii?Q?cmBsyCGZ27ydYSzJ9o5uyNTSiOt+WYd29L6UOn/BI3TmFtPwP6BeOO93k36j?=
 =?us-ascii?Q?vQ5JXUfgbCAeF0g46aGGVvatJtbwMik1TiKLQQn+RWRR3dZdl1qlH1k8ueFr?=
 =?us-ascii?Q?E9S4yUuY2RWgSGxYhh0l6jqK4dLMsDoq5SiDSZPZmxI6TxyrtR92Wr41H25N?=
 =?us-ascii?Q?vVFxjO3ULH/SF62HvzU5RVSelD+l6dRo8DUTEQjFbTYZx9iPxirXw1pFK4gg?=
 =?us-ascii?Q?GuBks+ch/7zutFoSyuOc1vLmAJYQbk5VDrHx/XbZ2SSAxqxiUHi14BlzGlt2?=
 =?us-ascii?Q?rD7F1w8NUxPlUl8GOz4vUh8enPhC8/Dqz0mtOdwgN6Q2BepTlHv8/S2R2jQg?=
 =?us-ascii?Q?70w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?71ri4scG175eixjeRULZtvBmTAVL1O1Ht6SvXERRSeOqjNF89LDCcA3hjPSx?=
 =?us-ascii?Q?gPSH/aHP/JL66vfPA6TEk0qoW0OXKRvoDMQCMTVzTady3Zf35ic4CZHP9l8Q?=
 =?us-ascii?Q?nPHAk9SJUVyQ8+q5ZCRKYRF5watcbcpZJQIAprPCedoheUbZGjrF6Zcvc3O4?=
 =?us-ascii?Q?K/bDWkAZGPj8erLJBT/W7k6B8Et0qFqZ9R+2/16JTkPSyQEvmGKAe0OzY/Kf?=
 =?us-ascii?Q?0dKQ3hPk9/8EFudFmwMer1bZ4cAdHV0jxyerMlv1Bgdak+nG02thR+ryhbvp?=
 =?us-ascii?Q?QigtOBWsLDgrRtx1mrsQBZ7gPU2OHGEFhh1vGwy8rQ7CPMGREv9RdLdeg5P5?=
 =?us-ascii?Q?S5PdLR79SvB3rYj29EwqEE4LhE1iC6KeJJ/NQzMYnnEG+8VfwUZ1CnHFVPmA?=
 =?us-ascii?Q?YH2nOJNlw2/wyY9RBObyVfDk+65MvUzHtjuldolvhSrV9Ljm+EqQr2Fn0r/A?=
 =?us-ascii?Q?zCTzRutqgN6/nWgMF8nJ+Nid5BOD54HSa3ibsbn9QFrVF5h9snORIrUwXFRs?=
 =?us-ascii?Q?tgljyypOEwohzw7eHmgqDvrXv4aq3nV6ldTQS/Z7TstPGYqc3342h4cof38A?=
 =?us-ascii?Q?CJ7LjJUKrbAWNlkexiPMTMuBEf78dAg1/ieOyN35idxvX0o7NUIwxS36zzHU?=
 =?us-ascii?Q?tMorLd8DevNvSX6IgluBpj9mWZfwDC4gzJ3wFczli20eO2GnTz6Qq2+0ZcvJ?=
 =?us-ascii?Q?wQwMI0JVFAW+zFh7yDEtS92Gbrj7wMRzbqr57/l/ldf6eC9IryFTGj3+ccac?=
 =?us-ascii?Q?ieTEYlLh+w9pRsfKQi+Np1iYIIOWzLjC7oY1D1lISQFVbzbJyTrgZTm55Ygx?=
 =?us-ascii?Q?Mbc/PuQjArCP/BVTK8fDnCxJL7dFRz6hmiZO5YVWeN3XIYBeY6lR56t9p0LC?=
 =?us-ascii?Q?o61SQQVggwB9B/EYaPkWKmdQbMckry1C0yrqS+dBBYpiBQ8l3tjWUqaQJsf3?=
 =?us-ascii?Q?qEaBvK2ylbs7hNlWdI1iE8OWtoay7kraY+KO9uWPqlNOzigPFJQMU5uXZr0Z?=
 =?us-ascii?Q?RIZhrMpwZnnbHV2PLy51iwQfpu/wnJReuyzNzwVSaRgjEsz7e78h7sJjCF4H?=
 =?us-ascii?Q?ER/KK9fh4mLZYZJoB7oTivxuJ+CEX0wQF4YaIWXVU/re0wS76NtzCjCgKhsg?=
 =?us-ascii?Q?OpFpx6nuNEt2LFOGd7L8JmdtWUQ+1w4Ee3ad9qRr5fo+sQF/G7aqbL3fDuxG?=
 =?us-ascii?Q?mL22nMhTsKx6MjSOHcMOLEi3K4WUMDDcPa9Hd6Qj5yYzRHmDqIoVHgrT8N64?=
 =?us-ascii?Q?lgDO6f+jFWLOF7K/B8QhZkQQY8/JbMikA0y4Ybo+wiOckY7EDCrtBPhssGej?=
 =?us-ascii?Q?Qn5UF1E08r+v66SyOPobwKhIi4V3nZPb+g1GNAsUC1CeOb0ffEE434VJIfwH?=
 =?us-ascii?Q?xyPtn+y+xn4akjjxhrIJ+ZFio8Hf4eHG3SOqBg7Lfzq8ONePgeEGzVAUBN0h?=
 =?us-ascii?Q?jTIMHMnOX7qBobwR3LNVbfIWCBgOYg/582BDpevagRza8zEAxTYoa4vWx0FB?=
 =?us-ascii?Q?I2Yfvxl+LF0exM6kCrwUfckxjJNI+u3/z5WAk3jCYWncpW2my4WJYMYky1Fb?=
 =?us-ascii?Q?gXLtu4oprkto/5AawiuDqRyUSIu05ehy/eYTLam+FNV/T6dKIkiIpcpKFzyU?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 344c3263-ff35-4f6d-bbd4-08dca7c70d06
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 07:47:34.0635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7KCig67WQVW3+GjvPWPQYiiQvhZYN0dILQ7zUJrRWs9oP/Y7Im1Ve2UAiOukH4z1k0BnrDaBP+zck1bOjdMfQiP9AAUR+wRer7ye0nbt4rU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8533
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

On Fri, Jul 19, 2024 at 07:16:19AM GMT, Matthew Brost wrote:
>On Thu, Jul 18, 2024 at 02:05:44PM -0700, Umesh Nerlige Ramappa wrote:
>> Just posting the revision that will be pushed for reference. This rev
>> only has documentation changes compared to v2, so will not run CI on
>> this.
>> -----

great. indeed no need to wait for CI.

>> xe_file_close triggers an asynchronous queue cleanup and then frees up
>> the xef object. Since queue cleanup flushes all pending jobs and the KMD
>> stores client usage stats into the xef object after jobs are flushed, we
>> see a use-after-free for the xef object. Resolve this by taking a
>> reference to xef from xe_exec_queue.
>>
>> Issue: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908
>
>It looks like not having ref to vm->xref is causing other issues too [1]
>[2].
>
>Let's get this in ASAP.

IN it is. There was only a minor conflict with drm-misc-next, but that
was trivial to solve.

Thanks for this fix,

Lucas De Marchi

>
>Matt
>
>[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2273
>[2] https://patchwork.freedesktop.org/patch/605099/?series=136240&rev=1
>
>>
>> The series adds xef refcounting and ensures all consumers of xef take a
>> ref to it.
>>
>> v2:
>> - Include review comments from v1
>> - Squash patch 3 and 5 from v1 to add Fixes/Closes tags
>>
>> v3:
>> - kernel-doc fixes (Lucas, Matt)
>>
>> v4: Rebase to drm-tip
>>
>> Note: Patches 1 - 3 can be merged independently
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>
>> Umesh Nerlige Ramappa (4):
>>   drm/xe: Move part of xe_file cleanup to a helper
>>   drm/xe: Add ref counting for xe_file
>>   drm/xe: Take a ref to xe file when user creates a VM
>>   drm/xe: Fix use after free when client stats are captured
>>
>>  drivers/gpu/drm/xe/xe_device.c           | 58 +++++++++++++++++++-----
>>  drivers/gpu/drm/xe/xe_device.h           |  3 ++
>>  drivers/gpu/drm/xe/xe_device_types.h     |  3 ++
>>  drivers/gpu/drm/xe/xe_drm_client.c       |  5 +-
>>  drivers/gpu/drm/xe/xe_exec_queue.c       | 10 +++-
>>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  7 ++-
>>  drivers/gpu/drm/xe/xe_vm.c               |  6 ++-
>>  7 files changed, 71 insertions(+), 21 deletions(-)
>>
>> --
>> 2.38.1
>>
