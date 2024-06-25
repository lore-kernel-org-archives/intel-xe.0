Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F372C3064D
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 05:16:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA4D10E25C;
	Tue, 25 Jun 2024 05:16:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GLE3exk3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B93310E1C8
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 05:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719292596; x=1750828596;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=D+B6/OJenvRVHF3EYO/KlozB0YhRnVNfnriQXw9TF1g=;
 b=GLE3exk3FmSEwWn36zKIhQMZzrn7tFqB1CsTcPUtww0+wGSsjtdsCmNB
 peCbtEvSsyhU9sAYNr1gkfnERxVk3sJ7oj8Q+mvDaqrJ76D+B3WS9Xw4d
 ORCmQAyG9FiEGv8BpyFNDQ4e2w3Ix+CAanUDXFtku5xSMb3Aesrh0Ze9d
 /n+MXNd7rTYAQjnMAenCkGTOsvq3ESHU3b0dP/2AcwWNrQbqnOWo17VUc
 5BQZLpKf2SPj4GyQ6YPjHBRmdBmiokM96Z5L2NxSQ8WCnf1HU/MZdlbIe
 GtTK0iMNkDcJczEQBev79T8dj9yWvoKYM7CD3OOZeJjkYjQ0XPgdhYB9Z w==;
X-CSE-ConnectionGUID: DSD6SYD+TcuGLA15GTFKCw==
X-CSE-MsgGUID: pp5kCC0rRqi+esRUVHjW5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16415824"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="16415824"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 22:16:35 -0700
X-CSE-ConnectionGUID: G5qSeRKFSomC5eX1sUy9GA==
X-CSE-MsgGUID: hE8PZLtTTJ2Qfa1sK+Illw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="48485623"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jun 2024 22:16:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 22:16:34 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 24 Jun 2024 22:16:34 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 24 Jun 2024 22:16:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ogWe9ingrNuTfWe6RgtMmAOp/GygXQXnZNB7PqK3IAKXL59a752axIzYgJRDafp39p4uztHjl/pIRdQ0fmXJXLKPseNYsYvaaYCSZHaJN33KTfpKdmscqPQeKM3wNqTexavI2M72SFdlCwBPQRHXa3yXBtuGuRIVy3XM3M9hJuqhwAn9ZALRZclSIPbkA2zZVR5POuA9fA13RAQS0U3bcG2mxKj3s8CJAd3b71eFXhzmgUFjkzBSBAgjXoImHQhNW4XYenEdvVcNn2cky0K8Ha29dSL1OAnihmmCALd++XwpqVV+5hlck08rOhpFOnVP2cOr1nsZYtDKklY6tXfTSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MCLcXiHNQDlJ/52K8nB6QUoO4hwa1XRcxDZ9M92xaeI=;
 b=PvWJ2N5TFaEfi7IKGbktS1knh+j6mjAZvgNd4pTwrh9eDYUnKt5KeUqLUfLjMT3P5/Tnus5pcFR5NsLBGdz497iQXKc1dL79ELKIX6Bf7oh0r1rKjcseSgm3WGo+fRg69LAoMcEvKGOM/l6RtULeJdbORdI6epfHcZkWHYS3EutV0/pM6NqYcMkLi0xMIpIm1JNplSksQLdteXl4xhhaF9qBr5NZuFFqZSBi4fDi/yCR3X0AQ5wa+CXEhPFqDA0+Vv9YuW/oilPgoTkKkdUdhaW/KSOo0v9qhrk3nSp95MQzL7NhBfQeswdAM7e0rNCsp0q8F/ThthniC3OKT3h5/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by CYXPR11MB8731.namprd11.prod.outlook.com (2603:10b6:930:db::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Tue, 25 Jun
 2024 05:16:31 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0%4]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 05:16:31 +0000
Date: Mon, 24 Jun 2024 22:16:21 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Add timeout to preempt fences
Message-ID: <ZnpSpcRuM0dUgu3S@nvishwa1-DESK>
References: <20240624224844.3950026-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240624224844.3950026-1-matthew.brost@intel.com>
X-ClientProxiedBy: YT4P288CA0082.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0::12) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|CYXPR11MB8731:EE_
X-MS-Office365-Filtering-Correlation-Id: c4b4e131-7899-4acf-e136-08dc94d5f980
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|376011|366013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OtRTwHGyQ12gnnNYeMoGlhGR1gNQZMqGCK8DjGQwtJpBqAJQ2smwfNXB4Xpb?=
 =?us-ascii?Q?x1Lopknf0sWj7xD5bN+WkASUaOsxiKghVwLaqG0DeGHvj8MjCgS7GhOcQ6zG?=
 =?us-ascii?Q?YNwXspHet+lQxMHqYMVjNFztE8Lw/00K9Wxj+ZfY6gJtvcKoSYsq0qSOrRoC?=
 =?us-ascii?Q?1DWxOXZ+xa0GNxj0IFulq3d65DCTg9D9eij0bjMj8GEufeX1tC1c1uOB1jll?=
 =?us-ascii?Q?RKYuKgwOgjy2IGYANlL5p2s8gm5gnCfRXnwt4YzmXSeOc3GPO/3cuPtiOdJj?=
 =?us-ascii?Q?Wr6uJ2ByZBO4TXJwfeiNKcABnnGnPEx8tAaZhjgC4EQ2r9YA4SA9ycbl/ffV?=
 =?us-ascii?Q?LGbmhkkWF4EGqhkBpjUTOq3DOZDvs5/6eM936ZXxcMifd8PwgktF8zyD65bh?=
 =?us-ascii?Q?RGn3RtkaGfWp+xmMZTjmYOy6xlsRP2VGC4D9/HQ2r9rsnB6DchVBwOQ8eEwg?=
 =?us-ascii?Q?M8GT85QQJDk8VUCPS4VDNdqdAxXbICVD1ymq06fRa4nCwPd0GxzTohI2b6Rl?=
 =?us-ascii?Q?nmtQyXD77FHOBTZ1eundRL/yYvaxerQABLpHfe+bEsoEz4BwEZl6p9gFAGIk?=
 =?us-ascii?Q?0I9lhISPmouCVxN528gnZNS3UQuISd66jr+11FwYa55u+uNEb7ardk3KTsnD?=
 =?us-ascii?Q?R5q/xtdinfXN17uHXnbc3/4+dLzroxoSzM7pT/H3kHeekmz+rSQqOkW5h796?=
 =?us-ascii?Q?bO3lRWG+AtgdVtyx8rms+/K8rNOnHFtZKs0Q73RNGRLpXy5R0tNaLEt2YWZ5?=
 =?us-ascii?Q?urIiuSL3o5XB94pNXRNTc/A/lEKO4k5VnmnlMxaVjRfXQbe6pAiGxwPCWWwi?=
 =?us-ascii?Q?09EhZBhhJOP311k75pFDtU9nd8WTppZ1cyFnLxLrd29HP2g9sv2JUKi+T5ID?=
 =?us-ascii?Q?yNoCl3cBrlFdId8JRdERLOK3b/oaFmaeympWkMk/4zMshgird7Wf0S+TigXw?=
 =?us-ascii?Q?KiYq98cF261nXKI9I2LQxh/ItslyWgKxK7TcBnFFk9EQTi1321On7Bb5Sl2d?=
 =?us-ascii?Q?zrLbfl83G5TNyj28Y46Yv/cAUAM1gO/o2170tNqhSUzrKUUwRMxYmIMRJdKD?=
 =?us-ascii?Q?sPC217MyLUHevuAlnsmGRWG59AmCm3Lni0onog73GDHGVGmjjGLgXwGvfkT1?=
 =?us-ascii?Q?5muXNf/tb5s9SwLBD7lcFWNLuroxmj7LnJkrhVRgJ2hOFv+iZ7F45S5kwJzq?=
 =?us-ascii?Q?xqSBu5d88053dpcsjGWUZ99twwSqg3vWTDmxuZ+/5gouofhWeg2yQ1yWjxcV?=
 =?us-ascii?Q?E8ENoV31I6P8Zibeff+A/jtnsODnzIms5ngX6ywnGCdeqWG3wJ8BMV57YjZL?=
 =?us-ascii?Q?Jvkb/QJVsW2hxQxtk1swb3bU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(376011)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U3WbqPJ58lEiKQzRNF+Uj5730tF6R8Xieid5OhvFy8hvbYmK8jCjGTsHOJCV?=
 =?us-ascii?Q?6PmDLvQ5FAkApcQ3dHZY6UYuD1i7TYNxVQqA7VhQUAyV7JV6FT0VUmwj+ZVY?=
 =?us-ascii?Q?SYroxwWlSui2MEtu7kSqzWip5QCRI2n8ukfN46yF/ACZ6X/HK0lJgsnvL5zK?=
 =?us-ascii?Q?j1Vq/695UwdBrAaHB3pBYUJK27j3+zlmwRFaa7RMHioe5JNrA+ntmVbP8dvy?=
 =?us-ascii?Q?hcXPbk02tCV3ak+WrkORbLL0NzzBYjygp2Dccpr4SkDIVdesDaz/3sifBt/A?=
 =?us-ascii?Q?3JoUku0kSWzoqzUWBKgP9g0/5F5MIzLg1gkBgP1udjwhvMsRIioBg7mVlBap?=
 =?us-ascii?Q?xrj2J8aKq8gJzHIk1iYwZfue028mqm2MQQRGTZNCIRruzalZlREDvNvR1LNY?=
 =?us-ascii?Q?0WKSUZX2pykqhesB8uZD7wS9Lk+RYDD0i+O5muZWoVRtHd6l/jN8S9fG5OjG?=
 =?us-ascii?Q?9cD40mZYNZOUYbUwpC8W+k2VUUIBVhGf3tcdeiu3ReS9MKQUDbjz5iY6IvQu?=
 =?us-ascii?Q?efgM/6UYohihiIuzshjuoSmxi5LTM5M3dtSTXAhtdBf/IacBS7bfc5AE+vFg?=
 =?us-ascii?Q?ZhdIMuxtPOPwRVo//z6HA9JLZNd44FD1WdXmwvInCsFDkNL3gQUp1T7Hr59m?=
 =?us-ascii?Q?TP4N2BHgTlktgFii+LuizbAjwVifkGWAawFA+zs6S9zwP3ItQLm6yqr3n1Zf?=
 =?us-ascii?Q?08gv9LG5IO37yC+fqL83uR1QiqyqCnXGUrYkkoo2kaaAe1DUtSL1EENQe/Vo?=
 =?us-ascii?Q?T2HOPRsOulE4tBZKFFaeF8x+4Uh4MgZF6a60worX1qxgUl8fLL4WtuFpt2/r?=
 =?us-ascii?Q?TALX7YYxf3Mq6cVgjRdXHlYHnk4hrjAz+0xArfTYQ25Sgk3eTvhpRXjR7o6N?=
 =?us-ascii?Q?3Vj1PzfuWC49mBgDUwKS+OEVS4on6ce1+QCiudvyvoYyTsx+qGmfzmVoNSon?=
 =?us-ascii?Q?M4PTU7DmuG+kngJDFRO6NyqKgSG7iXuy6mCjPtdIj3gtdGR22kL+hesd+hTW?=
 =?us-ascii?Q?boiZ7jxfeZtRZ7Fuedum6b1dLxITnxewwBVix8E3wJE/Q9rg8ZfRObsRgGo/?=
 =?us-ascii?Q?vJMPI/sbfHY3nWC+pvjwRbaUytIfdUOM190A7x/D/DfE1r46InSO9wzaQpV2?=
 =?us-ascii?Q?KJfQGIy73Xckk1VqCgmFxAzJ1W1w8/n/8kXK3/GGBG7cB71PRWnS/mvqYzhp?=
 =?us-ascii?Q?H0YuEbqEP4kjqg4uERVPVEWcIRLbPvkrvPS4kRKvHYOtfY39vlj03QEZHatk?=
 =?us-ascii?Q?xZNj/m8On4xOhrg2X4rFesSSb5+X8/NUXSpDYmVegJ+ggzLpwRF5Ctb0t4ID?=
 =?us-ascii?Q?Bj8vEqFByjDNBuLrtgMHQPI4LabAenyWXgfxQdtywEwNcM2qTumn5jIIX8TY?=
 =?us-ascii?Q?l0EtzYPrKeyGcpHAur6GnDe/vT3KRV3PNzgGaxY1m1NlSmvCI2nIG2SphKD7?=
 =?us-ascii?Q?FtfqIBkuqyurufevqiJIzSxt53twSvzPPDe/Nrq/o/NkwQlLvdNZig/d5t+t?=
 =?us-ascii?Q?+aWGNn3zjv3vYG4uyPySUvLTP0/FSvJcLo51XmWhJcb29mun6HbYVGDFBK4q?=
 =?us-ascii?Q?KABiKWndOBbE7trvQKM0Q0E4qMcYwp8FUgIrbAQ8HcIaENbYmldpj73OhF0X?=
 =?us-ascii?Q?8iGFxoScw0O1rV/r7i/oedY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4b4e131-7899-4acf-e136-08dc94d5f980
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 05:16:31.6675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /yDxkpedFHi7u2gCq4Qq1jJ2ouyckfrCRYBAlMLH4FRzRqa9eGi5NOiGoUtAw1juwsYmwRQdOeegfEiZplrjnRqp/JgbHCl4c9hHvoZbgLglsH3JbQqE+xYgUHIm72c/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8731
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

On Mon, Jun 24, 2024 at 03:48:44PM -0700, Matthew Brost wrote:
>To adhere to dma fencing rules that fences must signal within a
>reasonable amount of time, add a 5 second timeout to preempt fences. If
>this timeout occurs, kill the associated VM as this fatal to the VM.
>
>Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 ++--
> drivers/gpu/drm/xe/xe_execlist.c         |  3 +-
> drivers/gpu/drm/xe/xe_guc_submit.c       | 35 ++++++++++++++++++++----
> drivers/gpu/drm/xe/xe_preempt_fence.c    | 14 +++++++++-
> drivers/gpu/drm/xe/xe_vm.c               | 10 ++++++-
> drivers/gpu/drm/xe/xe_vm.h               |  2 ++
> 6 files changed, 59 insertions(+), 11 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>index 201588ec33c3..1e51c978db7a 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>@@ -172,9 +172,11 @@ struct xe_exec_queue_ops {
> 	int (*suspend)(struct xe_exec_queue *q);
> 	/**
> 	 * @suspend_wait: Wait for an exec queue to suspend executing, should be
>-	 * call after suspend.
>+	 * call after suspend. In dma-fencing path thus must return within a
>+	 * reasonable amount of time. A non-zero return shall indicate an error
>+	 * waiting for suspend.
> 	 */
>-	void (*suspend_wait)(struct xe_exec_queue *q);
>+	int (*suspend_wait)(struct xe_exec_queue *q);
> 	/**
> 	 * @resume: Resume exec queue execution, exec queue must be in a suspended
> 	 * state and dma fence returned from most recent suspend call must be
>diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
>index db906117db6d..7502e3486eaf 100644
>--- a/drivers/gpu/drm/xe/xe_execlist.c
>+++ b/drivers/gpu/drm/xe/xe_execlist.c
>@@ -422,10 +422,11 @@ static int execlist_exec_queue_suspend(struct xe_exec_queue *q)
> 	return 0;
> }
>
>-static void execlist_exec_queue_suspend_wait(struct xe_exec_queue *q)
>+static int execlist_exec_queue_suspend_wait(struct xe_exec_queue *q)
>
> {
> 	/* NIY */
>+	return 0;
> }
>
> static void execlist_exec_queue_resume(struct xe_exec_queue *q)
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index 373447758a60..56e7a340696e 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -1301,6 +1301,16 @@ static void __guc_exec_queue_process_msg_set_sched_props(struct xe_sched_msg *ms
> 	kfree(msg);
> }
>
>+static void __suspend_fence_signal(struct xe_exec_queue *q)
>+{
>+	if (!q->guc->suspend_pending)
>+		return;
>+
>+	q->guc->suspend_pending = false;
>+	smp_wmb();
>+	wake_up(&q->guc->suspend_wait);
>+}
>+
> static void suspend_fence_signal(struct xe_exec_queue *q)
> {
> 	struct xe_guc *guc = exec_queue_to_guc(q);
>@@ -1310,9 +1320,7 @@ static void suspend_fence_signal(struct xe_exec_queue *q)
> 		  guc_read_stopped(guc));
> 	xe_assert(xe, q->guc->suspend_pending);
>
>-	q->guc->suspend_pending = false;
>-	smp_wmb();
>-	wake_up(&q->guc->suspend_wait);
>+	__suspend_fence_signal(q);
> }
>
> static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
>@@ -1465,6 +1473,7 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
> {
> 	trace_xe_exec_queue_kill(q);
> 	set_exec_queue_killed(q);
>+	__suspend_fence_signal(q);
> 	xe_guc_exec_queue_trigger_cleanup(q);
> }
>
>@@ -1561,12 +1570,26 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
> 	return 0;
> }
>
>-static void guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>+static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
> {
> 	struct xe_guc *guc = exec_queue_to_guc(q);
>+	int ret;
>+
>+	ret = wait_event_timeout(q->guc->suspend_wait,
>+				 !q->guc->suspend_pending ||
>+				 exec_queue_killed(q) ||
>+				 guc_read_stopped(guc),
>+				 HZ * 5);

Do we need exec_queue_killed(q) here as we are anyway checking
for '!q->guc->suspend_pending'?

Other than that, the change looks fine to me.

Niranjana

>
>-	wait_event(q->guc->suspend_wait, !q->guc->suspend_pending ||
>-		   guc_read_stopped(guc));
>+	if (!ret) {
>+		xe_gt_warn(guc_to_gt(guc),
>+			   "Suspend fence, guc_id=%d, failed to respond",
>+			   q->guc->id);
>+		/* XXX: Trigger GT reset? */
>+		return -ETIME;
>+	}
>+
>+	return 0;
> }
>
> static void guc_exec_queue_resume(struct xe_exec_queue *q)
>diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
>index e8b8ae5c6485..8356d9798206 100644
>--- a/drivers/gpu/drm/xe/xe_preempt_fence.c
>+++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
>@@ -16,11 +16,23 @@ static void preempt_fence_work_func(struct work_struct *w)
> 	struct xe_preempt_fence *pfence =
> 		container_of(w, typeof(*pfence), preempt_work);
> 	struct xe_exec_queue *q = pfence->q;
>+	int err = 0;
>
> 	if (pfence->error)
> 		dma_fence_set_error(&pfence->base, pfence->error);
>+	else if (!q->ops->reset_status(q))
>+		err = q->ops->suspend_wait(q);
> 	else
>-		q->ops->suspend_wait(q);
>+		dma_fence_set_error(&pfence->base, -ENOENT);
>+
>+	if (err) {
>+		dma_fence_set_error(&pfence->base, err);
>+
>+		down_write(&q->vm->lock);
>+		xe_vm_kill(q->vm, false);
>+		up_write(&q->vm->lock);
>+	}
>+
>
> 	dma_fence_signal(&pfence->base);
> 	/*
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index 5b166fa03684..6b8ff13f0aff 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -311,7 +311,15 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
>
> #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
>
>-static void xe_vm_kill(struct xe_vm *vm, bool unlocked)
>+/**
>+ * xe_vm_kill() - VM Kill
>+ * @vm: The VM.
>+ * @unlocked: Flag indicates the VM's dma-resv is not held
>+ *
>+ * Kill the VM by setting banned flag indicated VM is no longer available for
>+ * use. If in preempt fence mode, also kill all exec queue unlocked with the VM.
>+ */
>+void xe_vm_kill(struct xe_vm *vm, bool unlocked)
> {
> 	struct xe_exec_queue *q;
>
>diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>index b481608b12f1..c864dba35e1d 100644
>--- a/drivers/gpu/drm/xe/xe_vm.h
>+++ b/drivers/gpu/drm/xe/xe_vm.h
>@@ -259,6 +259,8 @@ static inline struct dma_resv *xe_vm_resv(struct xe_vm *vm)
> 	return drm_gpuvm_resv(&vm->gpuvm);
> }
>
>+void xe_vm_kill(struct xe_vm *vm, bool unlocked);
>+
> /**
>  * xe_vm_assert_held(vm) - Assert that the vm's reservation object is held.
>  * @vm: The vm
>-- 
>2.34.1
>
