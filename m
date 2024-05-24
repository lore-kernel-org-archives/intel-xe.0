Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D94C25B7A
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 12:26:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA78510E8D9;
	Fri, 24 May 2024 12:26:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UG498EA4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB2110E8D9
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 12:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716553592; x=1748089592;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=VLUiM2LdtP8b5YpcyGRijJ3FMtRluwWJ0lHPxSl4974=;
 b=UG498EA4O2KC0lbd85H/9GOMlbW3xDfv/w3xgnKa8wcEHI6XH/U5Dn0x
 3oRg+CDGfYVtKo6ZdkmJBQXDZ4XcQm6/yTWsZSEVZtfQNle53qGbxKdsz
 /R2DF25pWF3Q8iCUnPSU+JdPDcL1/GN8DdBsYGMoOFwoU1xvLQGZyHqWc
 eEHR2Mb1aK9f8Qd0dwYx1pjHDK/0fAEYUPrCupI//GrT2asle/8N5hT9Y
 uNCp6U5v/WfKD9zFHsYvxZnhORpDIo7U0B+Vdw6BxCCY/QqlE21sdzzse
 Ro5Y3Ev2lgUyppzf18oGELlrfvvScbjnK3jFh+WNLXIJczqOLLwzPE3lK g==;
X-CSE-ConnectionGUID: zQjmOyB5SYGV/gF5l3XCXg==
X-CSE-MsgGUID: 0S8licYGTFeNg71SygLP/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="24335071"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="24335071"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 05:26:29 -0700
X-CSE-ConnectionGUID: AvxuzMyeTGCvcBDSyPFwBQ==
X-CSE-MsgGUID: +nReylEVSjKk0lVe+w2L2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="57250462"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 May 2024 05:26:29 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 24 May 2024 05:26:28 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 24 May 2024 05:26:28 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 24 May 2024 05:26:28 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 24 May 2024 05:26:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=adK0TH6fWN6Ox8MTfcU1Vgs1rS1l/lVjWizn7ZX+v0JIXD2oU9SPHXCQV8dYD3EHL2wRX1fLlZqM2HQvfF0ysEa543v4kLSUE+nybDJtlRsuqo2Gob3gND69XoQ//rQKGg7pgVCD3nqN/8nW6pxsFhZ1vHaf8qT21y/QEkPLrFVj3ur3J626R/3lngtUx0qT9vBNCVeYGfi/4QOXQfX5YDBoHoBYNnH7OjxoR9TFhOev5Tolvb6eoo8lxWYMuyjbX+5IBUsiYypq8k+6EBU6R+L+wfWKhYsd6MGwzZsyw4pE0Iulv0bTNq3IlwFpYLpG3LRXZAcW9DOk9IuupsfgKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAUUOnUoUiz7CM3+oLrW3Zf6aHaq9c5EmyFT4DkLWXA=;
 b=AwDfkYjW1Bth50DU9t755t/u4+blYUwiCNJO0vWWVrZk09E+eHcT3t501jhX0fww1I0oBkogi4OxJMx9YsXkFh2jwWv3h4kzguLYH+2Kv6N7/2YgmOJwwVF9wEgsvTLk8sEuNHtFGyvC4MJq838sIAQ4UomkLXzKRGjx80j2LIEcY1nBBbNdvr67SHkTTPkiKR/msqBqjOrWuNQbgWJjHKz3Qm6LEqMpBPsTLJv1RjYh/1cjOTEqAKsfSRGSnzorlVZSzuQF4yi+KiJHacfgxP9jb3TdFiEVcn6+Xa0zAKZKelZRAA4+q+VsqKZnDxEtd2Dd+5X+VvLqs2aIbLYSRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN6PR11MB8172.namprd11.prod.outlook.com (2603:10b6:208:478::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Fri, 24 May
 2024 12:26:23 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Fri, 24 May 2024
 12:26:23 +0000
Date: Fri, 24 May 2024 08:26:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v3 1/5] drm/xe: Decouple job seqno and lrc seqno
Message-ID: <ZlCHal90bzN_jp55@intel.com>
References: <20240524071940.83042-1-thomas.hellstrom@linux.intel.com>
 <20240524071940.83042-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240524071940.83042-2-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY3PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::28) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN6PR11MB8172:EE_
X-MS-Office365-Filtering-Correlation-Id: d0dfa42c-c90d-4795-f66a-08dc7becb983
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?uOWSiM0odZtX8WgUgfe0PUsoA8eNwWuOuKvSRnVavi0qn7pA1yOB4PiXjB?=
 =?iso-8859-1?Q?XeIJjeO3YXgzhaHB+HCk4rrUAs2x5WXoHjIUeAF4KXCZTFjKRVEaIPvGnG?=
 =?iso-8859-1?Q?ODUzdo8OIrSQNiIwqyMe/ppemCKC69fBV2gBtQGrlSqm3ibnnJ2eevCyto?=
 =?iso-8859-1?Q?dbHXxss+pEm41ISjBZ4yFXxy4WbUbcYuTPrUGxocCS3SmPqqDIYqisjvhc?=
 =?iso-8859-1?Q?+Zt9OYfFvD/w+dOLv5mZ04m2afblB76UeGBYkGjkgnZMwqZ9KfwtHhU+TB?=
 =?iso-8859-1?Q?M0eimQPID9nbbbogJE0g2pWuCZgUlLsioVcv0AwTr2AkDADrsywWplERIF?=
 =?iso-8859-1?Q?/LHyrCW97i916uS0Z2PiOWWxZJWqABXVHCux8kBL1nkqfD2F+P9o/ojcmX?=
 =?iso-8859-1?Q?9H3YHYe7DoiMG74e4xHuwDFgoqGLTOS+Nrqw1M1xmBOG6b5Dcoa6NR9LLy?=
 =?iso-8859-1?Q?zI/dAP9X9Go64wbQV8YvbXR0VlfbD8LjcH/luUM0xb7JeOw8ODI8iUQHnc?=
 =?iso-8859-1?Q?vO/Kw0KLlTqcCROl8Go5uhVAXwCEIs9Gzl8fptpwIfX46+BcwTFf4yYdaw?=
 =?iso-8859-1?Q?wjxaTnyWFGILcMk/8mzxKLv3+3y0oMHZx7JGAllDwRJ2OGeVhG30APV+MC?=
 =?iso-8859-1?Q?x42iIOSdjn15uxjEeWBLl+PeJ9MHTsD7YgPeQFjBM7pMww0iff8/vrjERF?=
 =?iso-8859-1?Q?dsav5onWQG9X7yiFHPZsRqk4ZibEP5Ssrak9noYfwjf/a3vtBNAIzVNsvZ?=
 =?iso-8859-1?Q?3HQ8CLIp/FxWB9kELEpx8XeGVn/+9em2x9fiy3fWTSAfRpWIebqOKtjl8t?=
 =?iso-8859-1?Q?+kwKJwQbxY3z1sBudiz8kH3tGqZE+ES4pwCyCSQk7AW2bR+DUfEpkkiPYn?=
 =?iso-8859-1?Q?TH8qEhlPQbjlPbECMfEzThlTqQXbjy1j8dcPpbCMLCmInovihZ6YB5Eq3G?=
 =?iso-8859-1?Q?tDj/aoop+wmZDpG8xT1NjiHWoMwuz3YCgOGxTe7K93dVYkjwMWvzspZJXp?=
 =?iso-8859-1?Q?7wVHv0VCCHP9EY13MjxhCRT3yGwvf28SNjv1/TBndNTtyWhdptQ+7yVCD9?=
 =?iso-8859-1?Q?4cHY3OmdLfHo/G19rzrWuv1Qe3BORI3PUHcWMjMLWyAyX2nhx040Zhtyf4?=
 =?iso-8859-1?Q?seendug7Fbp9ZdebT/zJcQp/4g2fqerd53uxgsITS1RL6+Qgf5BY8nTkx0?=
 =?iso-8859-1?Q?Z7ZEZK+TPR0bV91X4X9B3irODTob57Wq1JBV4wZni4MP9iymPPvxIYodWH?=
 =?iso-8859-1?Q?0MGMna2F3FCxDrIkGcVRt4ajuwdZsOO6ZsxqsilJo5+SnzINM64bArt//P?=
 =?iso-8859-1?Q?2GrKzSI41/JlerFOIMN/8I5vHA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?AskZkW5U1DOtqQPu4UoolF6upVGxrjru8SfORE758TfIl56aTTO7omjG/q?=
 =?iso-8859-1?Q?jMaE/GcwZW6mGZgI3F4RmnyIJHeLjAoqNRjTobn79Joi28qn0io2wbTS7Q?=
 =?iso-8859-1?Q?9PRBsi5pUAjja1/FrT6mZEy4gfYBrTN0r5+x5FvqNt862/FZTZ96ipqQPm?=
 =?iso-8859-1?Q?kfvxD/im0RwzCTZGRVMiHGst7yYjtpqupajDbmF6KrEwFr8r2GD68bdu+j?=
 =?iso-8859-1?Q?C3yilEZJYzyzqMslnWgxY5UX1P+5ityLF1IXGEs+4huPHmtMr8gfHDReHQ?=
 =?iso-8859-1?Q?jCRe/b19+oHIbsS5cRdkUtD1QCwVAk/ixGyTcEcJ/TY8fiTDneKDHY69M3?=
 =?iso-8859-1?Q?oIU0FoQV/boI8VdtjHQ7IxhLg6chou/5bMcpPgu5VEKuPsjjJEsos/STlA?=
 =?iso-8859-1?Q?9qhelxFdMAWg4s609Z//ZeI9pgp5Ccj8+ZB5Ej178EIhmjvW8Pct80g7wk?=
 =?iso-8859-1?Q?goGzJhlIUvM7McSUFBHtyOo6vaaucOSpoVQw0JQ7fms1A7XjVq5WMMQOac?=
 =?iso-8859-1?Q?VnPkeEdEQLmqaDOCkYJL9Pocb4Cecuib8wUJppSFnTtE9rLj2djNheJDNi?=
 =?iso-8859-1?Q?Mk+iWMVV0EZgiKO0aGf4UoCJ5zTrLWHFfVwNxfUxLMqARxUHrOyuv18wLA?=
 =?iso-8859-1?Q?y3M1R/bly2eS6JrWagZxWw51edW/lcLi/8KKpfom23kKoDtW6v8P0pBV0u?=
 =?iso-8859-1?Q?SiU9upO8kfnzIeJ7U20H7L1O/3X+rsLJWBQxgEXknf+FxrCykk7dLcPA5c?=
 =?iso-8859-1?Q?EpSpF639jWb/mJNybUtV8HcTuj0Vvs34XKTZSR+F4YBzd7qmyn1LOwqB6r?=
 =?iso-8859-1?Q?RFZf1bmWQ8SiYykGmfoanZarU7MCqsbR2kH2iJDqpzMvxO5DtXzN2ITdqi?=
 =?iso-8859-1?Q?Wgt/59DqlRfRhF723H+qfpLew+6OGkPoJ5lZrTIV7Z+Xrbrrjb1SKYMKRD?=
 =?iso-8859-1?Q?kJrZyNAA5sp/VDIeqyOGcqWz1WEj8snUGyfb1zqTEgeZhAxZUlZunLT06S?=
 =?iso-8859-1?Q?LK5kqTPSt7lyp5NUHhb1BDPJqIv0DWJJQK+DkLLgn5UnUR0c51Njbfe+rj?=
 =?iso-8859-1?Q?QjavpUHTYjzNy+P+ksM9o4+s+a/qfGvMlwlmwpWWUD/2z4/jCsiFLHsuMT?=
 =?iso-8859-1?Q?uTRVtTRdrvjgsnPy8sHrgh1YpxVBCtoHWbip2DHUXcJECyWtDrMS/hcyry?=
 =?iso-8859-1?Q?bY2WPJjUVWUUtAlelMNESzaUj4mpYhlnZxretbAqW1nFoi8yFwAgMzVtjZ?=
 =?iso-8859-1?Q?yOK5kBFhB+3mHmRufvYuUVBjZ1/+fMEWIYvVZLccD74yQ9hX0luK4t2sJF?=
 =?iso-8859-1?Q?7Nxg2+tpMxzpB15cC3rv25diAX/gF6PavqFLQ6NANjk8nMJMYJ79CY316R?=
 =?iso-8859-1?Q?RxTbASNe0aGRRXKWtcxvN8Kq1m0ZK76DKJpGLbCW1TImqVPgYV9ohV/DTz?=
 =?iso-8859-1?Q?EpfNucqlZlILvjrfv9ce3Cn+PI+UwWkj1wQ3szMSW3mrjeGtf1RVWbNURK?=
 =?iso-8859-1?Q?k+6+PvKk7NZQt/haAf4BJwG+CE2HBHcBFbx7obUCzWMmFwVPGgfCu6w4F1?=
 =?iso-8859-1?Q?kKqbKOGXB9KNOoIYhypk+9LV6hYprcKIgzyxjJfxx6AblmmzzZa6EFwA9y?=
 =?iso-8859-1?Q?+RBTQn/24amJ6fCFrLXnOoSTaFHyAk/5eI4QeAItS4E1yOcoa8aRqtbA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0dfa42c-c90d-4795-f66a-08dc7becb983
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 12:26:23.6711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1MpWr7lH6q4POonHCinuKJZynGfKicQ1iNmnkxK/lOm5AOwT6v+jtFBBVtaNom9rsiZnsn8GqW12hA7YbeIR+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8172
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

On Fri, May 24, 2024 at 09:19:36AM +0200, Thomas Hellström wrote:
> From: Matthew Brost <matthew.brost@intel.com>
> 
> Tightly coupling these seqno presents problems if alternative fences for
> jobs are used. Decouple these for correctness.
> 
> v2:
> - Slightly reword commit message (Thomas)
> - Make sure the lrc fence ops are used in comparison (Thomas)
> - Assume seqno is unsigned rather than signed in format string (Thomas)
> 
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c      |  2 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c      |  5 +++--
>  drivers/gpu/drm/xe/xe_ring_ops.c        | 12 ++++++------
>  drivers/gpu/drm/xe/xe_sched_job.c       | 16 ++++++++--------
>  drivers/gpu/drm/xe/xe_sched_job.h       |  5 +++++
>  drivers/gpu/drm/xe/xe_sched_job_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_trace.h           |  7 +++++--
>  7 files changed, 30 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 0fd61fb4d104..e8bf250f5b6a 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -98,7 +98,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  
>  	if (xe_exec_queue_is_parallel(q)) {
>  		q->parallel.composite_fence_ctx = dma_fence_context_alloc(1);
> -		q->parallel.composite_fence_seqno = XE_FENCE_INITIAL_SEQNO;
> +		q->parallel.composite_fence_seqno = 0;

Why do you change this case to 0 instead of the -127?
Shouldn't it be a separate patch since it is not directly the new lrc_seqno
that this patch is introducing? 

>  	}
>  
>  	return q;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 54778189cfd5..53ab98c5ef5e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -940,8 +940,9 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  		return DRM_GPU_SCHED_STAT_NOMINAL;
>  	}
>  
> -	drm_notice(&xe->drm, "Timedout job: seqno=%u, guc_id=%d, flags=0x%lx",
> -		   xe_sched_job_seqno(job), q->guc->id, q->flags);
> +	drm_notice(&xe->drm, "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
> +		   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> +		   q->guc->id, q->flags);
>  	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
>  		   "Kernel-submitted job timed out\n");
>  	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index a3ca718456f6..2705d1f9d572 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -398,7 +398,7 @@ static void emit_job_gen12_gsc(struct xe_sched_job *job)
>  
>  	__emit_job_gen12_simple(job, job->q->lrc,
>  				job->batch_addr[0],
> -				xe_sched_job_seqno(job));
> +				xe_sched_job_lrc_seqno(job));

Looking at this I got a bit confused now.
If you are emitting the job, why you are using the lrc seqno and not the job seqno?
I mean, the other seqno that remains looks like a fence_seqno and not a job_seqno,
right? In this case wouldn't it be better if we could rename the other one to make
it more clear the split so the next developer changes the seqnos don't get confused
in which to use when/where?

>  }
>  
>  static void emit_job_gen12_copy(struct xe_sched_job *job)
> @@ -407,14 +407,14 @@ static void emit_job_gen12_copy(struct xe_sched_job *job)
>  
>  	if (xe_sched_job_is_migration(job->q)) {
>  		emit_migration_job_gen12(job, job->q->lrc,
> -					 xe_sched_job_seqno(job));
> +					 xe_sched_job_lrc_seqno(job));
>  		return;
>  	}
>  
>  	for (i = 0; i < job->q->width; ++i)
>  		__emit_job_gen12_simple(job, job->q->lrc + i,
> -				        job->batch_addr[i],
> -				        xe_sched_job_seqno(job));
> +					job->batch_addr[i],
> +					xe_sched_job_lrc_seqno(job));
>  }
>  
>  static void emit_job_gen12_video(struct xe_sched_job *job)
> @@ -425,7 +425,7 @@ static void emit_job_gen12_video(struct xe_sched_job *job)
>  	for (i = 0; i < job->q->width; ++i)
>  		__emit_job_gen12_video(job, job->q->lrc + i,
>  				       job->batch_addr[i],
> -				       xe_sched_job_seqno(job));
> +				       xe_sched_job_lrc_seqno(job));
>  }
>  
>  static void emit_job_gen12_render_compute(struct xe_sched_job *job)
> @@ -435,7 +435,7 @@ static void emit_job_gen12_render_compute(struct xe_sched_job *job)
>  	for (i = 0; i < job->q->width; ++i)
>  		__emit_job_gen12_render_compute(job, job->q->lrc + i,
>  						job->batch_addr[i],
> -						xe_sched_job_seqno(job));
> +						xe_sched_job_lrc_seqno(job));
>  }
>  
>  static const struct xe_ring_ops ring_ops_gen12_gsc = {
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index a4e030f5e019..874450be327e 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -117,6 +117,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
>  			err = PTR_ERR(job->fence);
>  			goto err_sched_job;
>  		}
> +		job->lrc_seqno = job->fence->seqno;
>  	} else {
>  		struct dma_fence_array *cf;
>  
> @@ -132,6 +133,8 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
>  				err = PTR_ERR(fences[j]);
>  				goto err_fences;
>  			}
> +			if (!j)
> +				job->lrc_seqno = fences[0]->seqno;

why the lrc_seqno is = the first fence seqno?

>  		}
>  
>  		cf = dma_fence_array_create(q->width, fences,
> @@ -144,10 +147,6 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
>  			goto err_fences;
>  		}
>  
> -		/* Sanity check */
> -		for (j = 0; j < q->width; ++j)
> -			xe_assert(job_to_xe(job), cf->base.seqno == fences[j]->seqno);
> -
>  		job->fence = &cf->base;
>  	}
>  
> @@ -229,9 +228,9 @@ bool xe_sched_job_started(struct xe_sched_job *job)
>  {
>  	struct xe_lrc *lrc = job->q->lrc;
>  
> -	return !__dma_fence_is_later(xe_sched_job_seqno(job),
> +	return !__dma_fence_is_later(xe_sched_job_lrc_seqno(job),
>  				     xe_lrc_start_seqno(lrc),
> -				     job->fence->ops);
> +				     dma_fence_array_first(job->fence)->ops);
>  }
>  
>  bool xe_sched_job_completed(struct xe_sched_job *job)
> @@ -243,8 +242,9 @@ bool xe_sched_job_completed(struct xe_sched_job *job)
>  	 * parallel handshake is done.
>  	 */
>  
> -	return !__dma_fence_is_later(xe_sched_job_seqno(job), xe_lrc_seqno(lrc),
> -				     job->fence->ops);
> +	return !__dma_fence_is_later(xe_sched_job_lrc_seqno(job),
> +				     xe_lrc_seqno(lrc),
> +				     dma_fence_array_first(job->fence)->ops);

the s/job->fence->ops/dma_fence_array_first(job->fence)->ops
looks like a good canditate for a separate patch, no?!

>  }
>  
>  void xe_sched_job_arm(struct xe_sched_job *job)
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.h b/drivers/gpu/drm/xe/xe_sched_job.h
> index c75018f4660d..002c3b5c0a5c 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.h
> +++ b/drivers/gpu/drm/xe/xe_sched_job.h
> @@ -73,6 +73,11 @@ static inline u32 xe_sched_job_seqno(struct xe_sched_job *job)
>  	return job->fence->seqno;
>  }
>  
> +static inline u32 xe_sched_job_lrc_seqno(struct xe_sched_job *job)
> +{
> +	return job->lrc_seqno;
> +}
> +
>  static inline void
>  xe_sched_job_add_migrate_flush(struct xe_sched_job *job, u32 flags)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
> index 5e12724219fd..990ddac55ed6 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> @@ -37,6 +37,8 @@ struct xe_sched_job {
>  		/** @user_fence.value: write back value */
>  		u64 value;
>  	} user_fence;
> +	/** @lrc_seqno: LRC seqno */
> +	u32 lrc_seqno;
>  	/** @migrate_flush_flags: Additional flush flags for migration jobs */
>  	u32 migrate_flush_flags;
>  	/** @ring_ops_flush_tlb: The ring ops need to flush TLB before payload. */
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index 2d56cfc09e42..6c6cecc58f63 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -254,6 +254,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
>  
>  		    TP_STRUCT__entry(
>  			     __field(u32, seqno)
> +			     __field(u32, lrc_seqno)
>  			     __field(u16, guc_id)
>  			     __field(u32, guc_state)
>  			     __field(u32, flags)
> @@ -264,6 +265,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
>  
>  		    TP_fast_assign(
>  			   __entry->seqno = xe_sched_job_seqno(job);
> +			   __entry->lrc_seqno = xe_sched_job_lrc_seqno(job);
>  			   __entry->guc_id = job->q->guc->id;
>  			   __entry->guc_state =
>  			   atomic_read(&job->q->guc->state);
> @@ -273,8 +275,9 @@ DECLARE_EVENT_CLASS(xe_sched_job,
>  			   __entry->batch_addr = (u64)job->batch_addr[0];
>  			   ),
>  
> -		    TP_printk("fence=%p, seqno=%u, guc_id=%d, batch_addr=0x%012llx, guc_state=0x%x, flags=0x%x, error=%d",
> -			      __entry->fence, __entry->seqno, __entry->guc_id,
> +		    TP_printk("fence=%p, seqno=%u, lrc_seqno=%u, guc_id=%d, batch_addr=0x%012llx, guc_state=0x%x, flags=0x%x, error=%d",
> +			      __entry->fence, __entry->seqno,
> +			      __entry->lrc_seqno, __entry->guc_id,
>  			      __entry->batch_addr, __entry->guc_state,
>  			      __entry->flags, __entry->error)
>  );
> -- 
> 2.44.0
> 
