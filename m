Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2538DCF64B1
	for <intel-xe@archiver.kernel.org>; Sat, 22 Nov 2025 04:35:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A2E10E170;
	Sat, 22 Nov 2025 04:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RwaNtUfX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6504E10E16C
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Nov 2025 04:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763786124; x=1795322124;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CuGJQLDziJCW5dvKzU5AyDjXx6xSeIdKOGz2JjUSsXk=;
 b=RwaNtUfXSLEMBZbvm6nyqkKOGEum6i8Gw65e4QjMJCJqxR6mf3hbww+T
 YagOWKGEETIiCe3Vg3Xv0txbhtzSrE0bL51f1dvOtxpSApS0TCE+CkUdW
 iTe/4VNnhh5jjteR6zYOj+C+llkybbtS+qf05XZwUqF6sLbd9ocefAZCR
 259VomgEWILj2mFwM3s4+5O5Bhxt4Evwd7aCCJLI1XNQ2kf46SwV/V8Cz
 5XY8tHZzceDlQWjPaMhsEqyo831O/B5fvCCWZkrj1XrOtAiBpa4Rul5Jr
 gLAKdcZp5lW0oQqMQS44t/r8A2aDEcpA7NKLuG7DcG4uh6g2MIr9fFfoG A==;
X-CSE-ConnectionGUID: ki1DN4t/TnGNig6viSdXSA==
X-CSE-MsgGUID: BWAMsemARVinDhtpioWZuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="66038236"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="66038236"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 20:35:23 -0800
X-CSE-ConnectionGUID: rvp2wBZvSPO7qxLEOcDdeg==
X-CSE-MsgGUID: a0QNJCFbQ5uYQf96BTvutw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="191532062"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 20:35:23 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 20:35:22 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 20:35:22 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.70) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 20:35:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUCw8Ex3U8VFsJLDxpB3nk4k+mdpcRidRD/6wRfRJapESRuJooQPsHMWUeVaiHwfyAOOevXbUwu62TBd9NPnfGMCV54lQK4gRdT4gvF1wnva9Lp5aUGUxRURQUk5435i6Z+vNVH8u3qru6XY0yx03PMQZL7c+aqM/N4WQsDUKmAdvKLNs9KA4rsvC0CKZMJsuvwn6krwEgKyQobVOfh0Z6EE3ix3umQIxq+f+534svD1PJsJpeSEe6CHOZJ9pUuf5AmNuJrC4seCj7zagLyi22lcZfoY20/Zn6nLxfBT5MVbbYs+JOyBO5Cqq2Ae0bkXM5SAdXcRBDKvPJDFweig6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KGs/V00i44musGm09IF8qxo/jPNW7aCfXiQB3kjxkmM=;
 b=AMbEAghqJIDnHwmNg4cFHwqsNxc1CaCOxjLSECTv+UHOLFhRsHyoAaUpUc9dd14SLdg0KrCmag0Jphuqe+ylf/zYqi6LLzY3nQnrHBdniSpuiyEVFOPrm9YZkn92rDPPJKiDZqtf4FhWq7Ts8gZE6+J3orLAnK002OcNPv4TORIWOmdIThM8KOq/ZANn6fmWOQzn542dhnkbMPxPHbCUxDCJRVbtfERInLbveS3srIRkseJA9KkRI3dIE2l0BBpA/Hk98bU7m3E7U9cQ/7wDgs6dtnvYwdGYfGlmvYl1BICQWSyHsT8AS3QNE38x0cbBqSJajjdBymudXrcfr21P+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by CH3PR11MB7722.namprd11.prod.outlook.com (2603:10b6:610:122::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Sat, 22 Nov
 2025 04:35:19 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 04:35:19 +0000
Date: Fri, 21 Nov 2025 20:35:16 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 02/18] drm/xe/multi_queue: Add user interface for
 multi queue support
Message-ID: <aSE9hPYxCNub4RHd@nvishwa1-desk>
References: <20251121035147.766072-20-niranjana.vishwanathapura@intel.com>
 <20251121035147.766072-22-niranjana.vishwanathapura@intel.com>
 <aSDs6c+wt5B2E61C@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aSDs6c+wt5B2E61C@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR03CA0281.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::16) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|CH3PR11MB7722:EE_
X-MS-Office365-Filtering-Correlation-Id: ca7a7e54-0bf4-4b6a-df09-08de29808a92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YieC47sOcz5ALoXfTpiTrEfNllvcAgJeYeY7mS+WE2tHlMnBEwqnMcIy8gmU?=
 =?us-ascii?Q?PDPhwQk5v1FMJ06/qhPQTNNZZbPgUzJOvvfdB5XE5HOy4H/WfT1ayNXpd9vq?=
 =?us-ascii?Q?H8V2wYBSLU3q2Xflmbjki/MBZrrxpzMCZ61YFeSU/XjlMazHDi8ybfztgbOV?=
 =?us-ascii?Q?WYiCfsr4O+H8ZSP49QcsgB7UPwBiUsOZh3uUuJ6wWt94E5KC/qG+CHJTGIei?=
 =?us-ascii?Q?r0oWJwAcjQQtTYcsdg1BT3HITfjlGDQ1U9+EBFw7TJIDqpuIDum2IlW9BeJn?=
 =?us-ascii?Q?D9oAL1tayr7nZlXn5OhaJSsITuhFb9pYfdS5cKivN9idRklgFHqqRjp72+Ni?=
 =?us-ascii?Q?BO6t84JpuH0Hml1Og2Mm5jS5DWt4R+RCiXxQdXGVyiqqFibuwa7PmJlUS6+p?=
 =?us-ascii?Q?ePhEdHhzgLsimlhci6QdY+O87adcT0JTr8+DXOgdYHbrbmBLlDFo+RlSFQix?=
 =?us-ascii?Q?2tFM73p2IfLcFADPBzDAnq1Kz2wBPnRdUdJHQjeR7hDSe8cSUk7oZxqfgqX6?=
 =?us-ascii?Q?o0BHevN5BTwC03B3WeT/w4oD+uXtiVqiw1ItpXF4v9C4uKaHa4O5VO8EP4cT?=
 =?us-ascii?Q?mUvQjsDJ9h9K4ZDf80cfH27ICZ6WFZgN18wDb66mYYgso8MuIZZr5Bu82XGp?=
 =?us-ascii?Q?OsWXk7s+bn8EgJm4dEvW7tZNaEbS/tSC1FBara0WQYao7lgfMFpZJFmI9CHi?=
 =?us-ascii?Q?nKiapDU0YQQHPrQXMg7jNIshE8x6rJHy35VwGUKKpQOZyVWDFP+wcKFP4pT3?=
 =?us-ascii?Q?zRlNHPC222RR1pkD3CT8NSpHmKLm+VC5Fq02HDt4CG3Hyv3b65kAPIOPt08C?=
 =?us-ascii?Q?937528I18Ny/optCv9NIx/WKT7B3sVx2vphz83O308S1GtmvCGzMwE8zUtVS?=
 =?us-ascii?Q?CVMhkOsya1ESz7G+8cYFOJSD5xbNrLsh9+mIBC51pwAIUfYE8yrdzOyzliYC?=
 =?us-ascii?Q?gpMB8aGZDTLG13bDJVWqAtWtyfrjSA40Ss7xJMHmGLu0N2pPL7VXA/NO3jVz?=
 =?us-ascii?Q?WFkrpXb1eLADaz6pre9ebs/1hhw/kXWLe7CbaRfEdRoY39ZtPa6mIUwXkvrf?=
 =?us-ascii?Q?2ypE/V4Jj/iG0t5dtIi+31/nwj+WXfqJeIz/LPdMxs/VcEFT+ew2dGzZL3IU?=
 =?us-ascii?Q?Ld5JdwBGsW0s+LpdIyTkCk5FQBnuhVVfItQCf1KkboIZuKIwwAsvnXkndWBb?=
 =?us-ascii?Q?cPU+o3f+Acv4OB+20KGSUhi4BL3YBusve8rhAR9XMmzkWf2uEoC4SQjTJPUv?=
 =?us-ascii?Q?0aDXEk3dfszuhTr4jMjqrhEP9UIjTL0t+4qqt5FIKDMoigpIPGxG+8WpEHOx?=
 =?us-ascii?Q?1fvF/YLkHkwmetKNjfC9Iok1hZu3Yt+4Mx5q6DCsfJANx5SXMjzGkdIINDFk?=
 =?us-ascii?Q?n/y7D2XzKVf7+PcuCdjKkAW/83GOSWquFxKsr9qfSubeS+o1FPjYCrB/46gt?=
 =?us-ascii?Q?JXJ+QfgblvjDatNw3CcsOu0gmBRLYuHwS18NCuJXExZnJeEZ1/GzGw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sWr9I3cNxnOVSrDasEUdkHeqEFE01EHkkc67HrZ6loxe0yG14VhSJM7mkD7k?=
 =?us-ascii?Q?R/GrvoPrlAwSpfcw/AAcDgi2V39ZhAeQ3kfJTaIZlVIYAdBjXmFHuLMuogBE?=
 =?us-ascii?Q?/oGeL2IC7sZt08LqIca+xiz98gYyWUktWTlZe6LmWIDEMJeGqq5OoPf9bKK1?=
 =?us-ascii?Q?GqpR4sSPocAZldEfgClqOWudNll51i5lRO9GPTOI5LmY3sq8iZyTYBKRQxEJ?=
 =?us-ascii?Q?fn3vaOOstdesyFA6ob/YC23T2/1j4OqRImhvSn72GntesURGzJKV2e9nbroY?=
 =?us-ascii?Q?MAtc5+TtZwbrC/hQ0lkNlT6q/kyMzosc6ARbrgX1cU5k/e1l+Zbs9sbIO/GU?=
 =?us-ascii?Q?ymfV/L4XF7AqjYNIPOd2WaCxBNzaQFN/1VQ1im7+OmDO4YKEshCQJTZUvWkV?=
 =?us-ascii?Q?AcW3VnPJTpf/FAECIb+D9vzJCHHt9l8SxQ1GnWD9dB/aUNz+hgmyDUVYDT5l?=
 =?us-ascii?Q?QQNPQkJApgnEWCefQSQ5O9MkWQ2QUmkWh718Dsi8p5S/yByf3kMSHOtjqfph?=
 =?us-ascii?Q?cqBRVk8mcDA8HR/YPo05sqYt5M5lzVPR14IWhYxIyXJF9O7ij4uy2P2sEJyp?=
 =?us-ascii?Q?XRnyWe7E/VNYen4VwGxk+7nHHTej1thcBo5VhGdvN7YhLUzfqsa0pSUGH09R?=
 =?us-ascii?Q?afAvBXBdwfDO2z4Cz/2npvyRQXnXNokqdwoalnCHxrtJ1UujoASeipGBCpaF?=
 =?us-ascii?Q?NLAdf84O/gmOgoq1lU+FrNsz5B4b+O5HNTQUuSLd6zYsVk7zBiPSlGpnnugg?=
 =?us-ascii?Q?WenPsquR3HJQ0mt7JkT3gz3TK+IN48YeDq8cMHnPiC9srsuUvFgI6FCwLPrA?=
 =?us-ascii?Q?F20wecZ4JxC9kRm5wUMnv0y/+7OmHYqBn8zK6xLnUZkRe2Uh7L2L5OWmEzKt?=
 =?us-ascii?Q?MlYGhAapZ5u256KjyNHqL+m+/GBiPpsAv9v379pqtgIduvAicDLlq2tD/igb?=
 =?us-ascii?Q?JOgZsEVTzGQszy3A1T+2EaRzO/HBs0fxZr75NErN0yF6u/R+v4w0fsdwJ7mI?=
 =?us-ascii?Q?pZ7J1LVhf1qNxV1+ehpKB58StGVTcwi6rP0l+9anpfYLzDgmq0sULRK4HVpG?=
 =?us-ascii?Q?vJZasMSbzBAvYcv75TR7fyQo/QbbLE7ndp44YV6r9FUFLfIiETcSZS+xTpoB?=
 =?us-ascii?Q?j64vBmmhRuZOeLITMAbSNTJX/+CWZxUDZz+dVS3orjCEGr1If73IL7LZIEyr?=
 =?us-ascii?Q?vJgsMPjek0buIs6RRPr5GHOA6xgn0dlU7WiDLuZYIZIE3taW0xc4t6Uh2UZ7?=
 =?us-ascii?Q?OvmMGWPjjzNkhUUVhbaj/ECKmq43HoaS81UHcJq6jf7+tERnvJaUPd4iula5?=
 =?us-ascii?Q?xHxu2ANJ/sJe02OEbktD2tA9b5l+hF8hFqGR+cWuc66gq2MhTdiVLEGWSt6a?=
 =?us-ascii?Q?GXqB4BDkNLXAyeHBbpP9I9QyC9T76BspXsEEij9xVa2j3PvTVOWCDEfiOkVU?=
 =?us-ascii?Q?OhgkvQmex8/5/aIK7+rNACAJdtjen1bzA32Tqn0tpU0ScA/hQkiaKznRgUru?=
 =?us-ascii?Q?7PMdB10+8CHgez2LtTSAQvkaFux7a/jK7AsgJyEnMS5KOxDCpvGK+5uHn8+e?=
 =?us-ascii?Q?3BjZdu8H79YKtMlv6kq424gwsnquvWcp3uP7CsAXD4iauFSvYi7c1QT3PoaM?=
 =?us-ascii?Q?JWv9saUjS5oFwJIC+JU1WRA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca7a7e54-0bf4-4b6a-df09-08de29808a92
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 04:35:19.3247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5nVW4/q+xMVa/I5JiL/ttAu3GiGha9UmQ65ewi+8Y+mnX6msB+cft/7yYXrpJULFtbi9IsRgdBYCaA4KxqvlHNNf1ZIyg9UyZe8oZtqllUot+NWgpePdbqW/M7YvJ2YQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7722
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

On Fri, Nov 21, 2025 at 02:51:21PM -0800, Matthew Brost wrote:
>On Thu, Nov 20, 2025 at 07:51:36PM -0800, Niranjana Vishwanathapura wrote:
>> Multi Queue is a new mode of execution supported by the compute and
>> blitter copy command streamers (CCS and BCS, respectively). It is an
>> enhancement of the existing hardware architecture and leverages the
>> same submission model. It enables support for efficient, parallel
>> execution of multiple queues within a single context. All the queues
>> of a group must use the same address space (VM).
>>
>> The new DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE execution queue
>> property supports creating a multi queue group and adding queues to
>> a queue group. All queues of a multi queue group share the same
>> context.
>>
>> A exec queue create ioctl call with above property specified with value
>> DRM_XE_SUPER_GROUP_CREATE will create a new multi queue group with the
>> queue being created as the primary queue (aka q0) of the group. To add
>> secondary queues to the group, they need to be created with the above
>> property with id of the primary queue as the value. The properties of
>> the primary queue (like priority, timeslice) applies to the whole group.
>> So, these properties can't be set for secondary queues of a group.
>>
>> Once destroyed, the secondary queues of a multi queue group can't be
>> replaced. However, they can be dynamically added to the group up to a
>> total of 64 queues per group. Once the primary queue is destroyed,
>> secondary queues can't be added to the queue group.
>>
>> v2: Remove group->lock, fix xe_exec_queue_group_add()/delete()
>>     function semantics, add additional comments, remove unused
>>     group->list_lock, add XE_BO_FLAG_GGTT_INVALIDATE for cgp bo,
>>     Assert LRC is valid, update uapi kernel doc.
>>     (Matt Brost)
>> v3: Use XE_BO_FLAG_PINNED_LATE_RESTORE/USER_VRAM/GGTT_INVALIDATE
>>     flags for cgp bo (Matt)
>>
>> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>
>As this is new uAPI we will need a UMD PR and ack from a UMD team.
>

Thanks.
I have added the link to UMD PR in the cover letter.
https://github.com/intel/compute-runtime/pull/862.
Will check with UMD team for ack.

>Matt
>
>> ---
>>  drivers/gpu/drm/xe/xe_exec_queue.c       | 194 ++++++++++++++++++++++-
>>  drivers/gpu/drm/xe/xe_exec_queue.h       |  47 ++++++
>>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  26 +++
>>  include/uapi/drm/xe_drm.h                |  10 ++
>>  4 files changed, 275 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 8724f8de67e2..330b5103222c 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -13,6 +13,7 @@
>>  #include <drm/drm_syncobj.h>
>>  #include <uapi/drm/xe_drm.h>
>>
>> +#include "xe_bo.h"
>>  #include "xe_dep_scheduler.h"
>>  #include "xe_device.h"
>>  #include "xe_gt.h"
>> @@ -63,6 +64,33 @@ enum xe_exec_queue_sched_prop {
>>  static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
>>  				      u64 extensions, int ext_number);
>>
>> +static void xe_exec_queue_group_cleanup(struct xe_exec_queue *q)
>> +{
>> +	struct xe_exec_queue_group *group = q->multi_queue.group;
>> +	struct xe_lrc *lrc;
>> +	unsigned long idx;
>> +
>> +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
>> +		/*
>> +		 * Put pairs with get from xe_exec_queue_lookup() call
>> +		 * in xe_exec_queue_group_validate().
>> +		 */
>> +		xe_exec_queue_put(xe_exec_queue_multi_queue_primary(q));
>> +		return;
>> +	}
>> +
>> +	if (!group)
>> +		return;
>> +
>> +	/* Primary queue cleanup */
>> +	xa_for_each(&group->xa, idx, lrc)
>> +		xe_lrc_put(lrc);
>> +
>> +	xa_destroy(&group->xa);
>> +	xe_bo_unpin_map_no_vm(group->cgp_bo);
>> +	kfree(group);
>> +}
>> +
>>  static void __xe_exec_queue_free(struct xe_exec_queue *q)
>>  {
>>  	int i;
>> @@ -73,6 +101,10 @@ static void __xe_exec_queue_free(struct xe_exec_queue *q)
>>
>>  	if (xe_exec_queue_uses_pxp(q))
>>  		xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
>> +
>> +	if (xe_exec_queue_is_multi_queue(q))
>> +		xe_exec_queue_group_cleanup(q);
>> +
>>  	if (q->vm)
>>  		xe_vm_put(q->vm);
>>
>> @@ -567,6 +599,147 @@ exec_queue_set_pxp_type(struct xe_device *xe, struct xe_exec_queue *q, u64 value
>>  	return xe_pxp_exec_queue_set_type(xe->pxp, q, DRM_XE_PXP_TYPE_HWDRM);
>>  }
>>
>> +static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *q)
>> +{
>> +	struct xe_tile *tile = gt_to_tile(q->gt);
>> +	struct xe_exec_queue_group *group;
>> +	struct xe_bo *bo;
>> +
>> +	group = kzalloc(sizeof(*group), GFP_KERNEL);
>> +	if (!group)
>> +		return -ENOMEM;
>> +
>> +	bo = xe_bo_create_pin_map_novm(xe, tile, SZ_4K, ttm_bo_type_kernel,
>> +				       XE_BO_FLAG_VRAM_IF_DGFX(tile) |
>> +				       XE_BO_FLAG_PINNED_LATE_RESTORE |
>> +				       XE_BO_FLAG_FORCE_USER_VRAM |
>> +				       XE_BO_FLAG_GGTT_INVALIDATE |
>> +				       XE_BO_FLAG_GGTT, false);
>> +	if (IS_ERR(bo)) {
>> +		drm_err(&xe->drm, "CGP bo allocation for queue group failed: %ld\n",
>> +			PTR_ERR(bo));
>> +		kfree(group);
>> +		return PTR_ERR(bo);
>> +	}
>> +
>> +	xe_map_memset(xe, &bo->vmap, 0, 0, SZ_4K);
>> +
>> +	group->primary = q;
>> +	group->cgp_bo = bo;
>> +	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
>> +	q->multi_queue.group = group;
>> +
>> +	return 0;
>> +}
>> +
>> +static inline bool xe_exec_queue_supports_multi_queue(struct xe_exec_queue *q)
>> +{
>> +	return q->gt->info.multi_queue_engine_class_mask & BIT(q->class);
>> +}
>> +
>> +static int xe_exec_queue_group_validate(struct xe_device *xe, struct xe_exec_queue *q,
>> +					u32 primary_id)
>> +{
>> +	struct xe_exec_queue_group *group;
>> +	struct xe_exec_queue *primary;
>> +	int ret;
>> +
>> +	/*
>> +	 * Get from below xe_exec_queue_lookup() pairs with put
>> +	 * in xe_exec_queue_group_cleanup().
>> +	 */
>> +	primary = xe_exec_queue_lookup(q->vm->xef, primary_id);
>> +	if (XE_IOCTL_DBG(xe, !primary))
>> +		return -ENOENT;
>> +
>> +	if (XE_IOCTL_DBG(xe, !xe_exec_queue_is_multi_queue_primary(primary)) ||
>> +	    XE_IOCTL_DBG(xe, q->vm != primary->vm) ||
>> +	    XE_IOCTL_DBG(xe, q->logical_mask != primary->logical_mask)) {
>> +		ret = -EINVAL;
>> +		goto put_primary;
>> +	}
>> +
>> +	group = primary->multi_queue.group;
>> +	q->multi_queue.valid = true;
>> +	q->multi_queue.group = group;
>> +
>> +	return 0;
>> +put_primary:
>> +	xe_exec_queue_put(primary);
>> +	return ret;
>> +}
>> +
>> +#define XE_MAX_GROUP_SIZE	64
>> +static int xe_exec_queue_group_add(struct xe_device *xe, struct xe_exec_queue *q)
>> +{
>> +	struct xe_exec_queue_group *group = q->multi_queue.group;
>> +	u32 pos;
>> +	int err;
>> +
>> +	xe_assert(xe, xe_exec_queue_is_multi_queue_secondary(q));
>> +
>> +	/* Primary queue holds a reference to LRCs of all secondary queues */
>> +	err = xa_alloc(&group->xa, &pos, xe_lrc_get(q->lrc[0]),
>> +		       XA_LIMIT(1, XE_MAX_GROUP_SIZE - 1), GFP_KERNEL);
>> +	if (XE_IOCTL_DBG(xe, err)) {
>> +		xe_lrc_put(q->lrc[0]);
>> +
>> +		/* It is invalid if queue group limit is exceeded */
>> +		if (err == -EBUSY)
>> +			err = -EINVAL;
>> +
>> +		return err;
>> +	}
>> +
>> +	q->multi_queue.pos = pos;
>> +
>> +	return 0;
>> +}
>> +
>> +static void xe_exec_queue_group_delete(struct xe_device *xe, struct xe_exec_queue *q)
>> +{
>> +	struct xe_exec_queue_group *group = q->multi_queue.group;
>> +	struct xe_lrc *lrc;
>> +
>> +	xe_assert(xe, xe_exec_queue_is_multi_queue_secondary(q));
>> +
>> +	lrc = xa_erase(&group->xa, q->multi_queue.pos);
>> +	xe_assert(xe, lrc);
>> +	xe_lrc_put(lrc);
>> +}
>> +
>> +static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue *q,
>> +				      u64 value)
>> +{
>> +	if (XE_IOCTL_DBG(xe, !xe_exec_queue_supports_multi_queue(q)))
>> +		return -ENODEV;
>> +
>> +	if (XE_IOCTL_DBG(xe, !xe_device_uc_enabled(xe)))
>> +		return -EOPNOTSUPP;
>> +
>> +	if (XE_IOCTL_DBG(xe, xe_exec_queue_is_parallel(q)))
>> +		return -EINVAL;
>> +
>> +	if (XE_IOCTL_DBG(xe, xe_exec_queue_is_multi_queue(q)))
>> +		return -EINVAL;
>> +
>> +	if (value & DRM_XE_MULTI_GROUP_CREATE) {
>> +		if (XE_IOCTL_DBG(xe, value & ~DRM_XE_MULTI_GROUP_CREATE))
>> +			return -EINVAL;
>> +
>> +		q->multi_queue.valid = true;
>> +		q->multi_queue.is_primary = true;
>> +		q->multi_queue.pos = 0;
>> +		return 0;
>> +	}
>> +
>> +	/* While adding secondary queues, the upper 32 bits must be 0 */
>> +	if (XE_IOCTL_DBG(xe, value & (~0ull << 32)))
>> +		return -EINVAL;
>> +
>> +	return xe_exec_queue_group_validate(xe, q, value);
>> +}
>> +
>>  typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>>  					     struct xe_exec_queue *q,
>>  					     u64 value);
>> @@ -575,6 +748,7 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
>>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
>>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE] = exec_queue_set_pxp_type,
>> +	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP] = exec_queue_set_multi_group,
>>  };
>>
>>  static int exec_queue_user_ext_set_property(struct xe_device *xe,
>> @@ -595,7 +769,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
>>  	    XE_IOCTL_DBG(xe, ext.pad) ||
>>  	    XE_IOCTL_DBG(xe, ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY &&
>>  			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE &&
>> -			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE))
>> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE &&
>> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP))
>>  		return -EINVAL;
>>
>>  	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
>> @@ -644,6 +819,12 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
>>  		return exec_queue_user_extensions(xe, q, ext.next_extension,
>>  						  ++ext_number);
>>
>> +	if (xe_exec_queue_is_multi_queue_primary(q)) {
>> +		err = xe_exec_queue_group_init(xe, q);
>> +		if (XE_IOCTL_DBG(xe, err))
>> +			return err;
>> +	}
>> +
>>  	return 0;
>>  }
>>
>> @@ -798,12 +979,18 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>  		if (IS_ERR(q))
>>  			return PTR_ERR(q);
>>
>> +		if (xe_exec_queue_is_multi_queue_secondary(q)) {
>> +			err = xe_exec_queue_group_add(xe, q);
>> +			if (XE_IOCTL_DBG(xe, err))
>> +				goto put_exec_queue;
>> +		}
>> +
>>  		if (xe_vm_in_preempt_fence_mode(vm)) {
>>  			q->lr.context = dma_fence_context_alloc(1);
>>
>>  			err = xe_vm_add_compute_exec_queue(vm, q);
>>  			if (XE_IOCTL_DBG(xe, err))
>> -				goto put_exec_queue;
>> +				goto delete_queue_group;
>>  		}
>>
>>  		if (q->vm && q->hwe->hw_engine_group) {
>> @@ -826,6 +1013,9 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>
>>  kill_exec_queue:
>>  	xe_exec_queue_kill(q);
>> +delete_queue_group:
>> +	if (xe_exec_queue_is_multi_queue_secondary(q))
>> +		xe_exec_queue_group_delete(xe, q);
>>  put_exec_queue:
>>  	xe_exec_queue_put(q);
>>  	return err;
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
>> index fda4d4f9bda8..e6daa40003f2 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
>> @@ -66,6 +66,53 @@ static inline bool xe_exec_queue_uses_pxp(struct xe_exec_queue *q)
>>  	return q->pxp.type;
>>  }
>>
>> +/**
>> + * xe_exec_queue_is_multi_queue() - Whether an exec_queue is part of a queue group.
>> + * @q: The exec_queue
>> + *
>> + * Return: True if the exec_queue is part of a queue group, false otherwise.
>> + */
>> +static inline bool xe_exec_queue_is_multi_queue(struct xe_exec_queue *q)
>> +{
>> +	return q->multi_queue.valid;
>> +}
>> +
>> +/**
>> + * xe_exec_queue_is_multi_queue_primary() - Whether an exec_queue is primary queue
>> + * of a multi queue group.
>> + * @q: The exec_queue
>> + *
>> + * Return: True if @q is primary queue of a queue group, false otherwise.
>> + */
>> +static inline bool xe_exec_queue_is_multi_queue_primary(struct xe_exec_queue *q)
>> +{
>> +	return q->multi_queue.is_primary;
>> +}
>> +
>> +/**
>> + * xe_exec_queue_is_multi_queue_secondary() - Whether an exec_queue is secondary queue
>> + * of a multi queue group.
>> + * @q: The exec_queue
>> + *
>> + * Return: True if @q is secondary queue of a queue group, false otherwise.
>> + */
>> +static inline bool xe_exec_queue_is_multi_queue_secondary(struct xe_exec_queue *q)
>> +{
>> +	return xe_exec_queue_is_multi_queue(q) && !xe_exec_queue_is_multi_queue_primary(q);
>> +}
>> +
>> +/**
>> + * xe_exec_queue_multi_queue_primary() - Get multi queue group's primary queue
>> + * @q: The exec_queue
>> + *
>> + * If @q belongs to a multi queue group, then the primary queue of the group will
>> + * be returned. Otherwise, @q will be returned.
>> + */
>> +static inline struct xe_exec_queue *xe_exec_queue_multi_queue_primary(struct xe_exec_queue *q)
>> +{
>> +	return xe_exec_queue_is_multi_queue(q) ? q->multi_queue.group->primary : q;
>> +}
>> +
>>  bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
>>
>>  bool xe_exec_queue_is_idle(struct xe_exec_queue *q);
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> index 771ffe35cd0c..f429b1952be9 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> @@ -32,6 +32,20 @@ enum xe_exec_queue_priority {
>>  	XE_EXEC_QUEUE_PRIORITY_COUNT
>>  };
>>
>> +/**
>> + * struct xe_exec_queue_group - Execution multi queue group
>> + *
>> + * Contains multi queue group information.
>> + */
>> +struct xe_exec_queue_group {
>> +	/** @primary: Primary queue of this group */
>> +	struct xe_exec_queue *primary;
>> +	/** @cgp_bo: BO for the Context Group Page */
>> +	struct xe_bo *cgp_bo;
>> +	/** @xa: xarray to store LRCs */
>> +	struct xarray xa;
>> +};
>> +
>>  /**
>>   * struct xe_exec_queue - Execution queue
>>   *
>> @@ -111,6 +125,18 @@ struct xe_exec_queue {
>>  		struct xe_guc_exec_queue *guc;
>>  	};
>>
>> +	/** @multi_queue: Multi queue information */
>> +	struct {
>> +		/** @multi_queue.group: Queue group information */
>> +		struct xe_exec_queue_group *group;
>> +		/** @multi_queue.pos: Position of queue within the multi-queue group */
>> +		u8 pos;
>> +		/** @multi_queue.valid: Queue belongs to a multi queue group */
>> +		u8 valid:1;
>> +		/** @multi_queue.is_primary: Is primary queue (Q0) of the group */
>> +		u8 is_primary:1;
>> +	} multi_queue;
>> +
>>  	/** @sched_props: scheduling properties */
>>  	struct {
>>  		/** @sched_props.timeslice_us: timeslice period in micro-seconds */
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 47853659a705..4de21e0a4fcf 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -1252,6 +1252,14 @@ struct drm_xe_vm_bind {
>>   *    Given that going into a power-saving state kills PXP HWDRM sessions,
>>   *    runtime PM will be blocked while queues of this type are alive.
>>   *    All PXP queues will be killed if a PXP invalidation event occurs.
>> + *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP - Create a multi-queue group
>> + *    or add secondary queues to a multi-queue group.
>> + *    If the extension's 'value' field has %DRM_XE_MULTI_GROUP_CREATE flag set,
>> + *    then a new multi-queue group is created with this queue as the primary queue
>> + *    (Q0). Otherwise, the queue gets added to the multi-queue group whose primary
>> + *    queue's exec_queue_id is specified in the lower 32 bits of the 'value' field.
>> + *    All the other non-relevant bits of extension's 'value' field while adding the
>> + *    primary or the secondary queues of the group must be set to 0.
>>   *
>>   * The example below shows how to use @drm_xe_exec_queue_create to create
>>   * a simple exec_queue (no parallel submission) of class
>> @@ -1292,6 +1300,8 @@ struct drm_xe_exec_queue_create {
>>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
>>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
>>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
>> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		3
>> +#define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
>>  	/** @extensions: Pointer to the first extension struct, if any */
>>  	__u64 extensions;
>>
>> --
>> 2.43.0
>>
