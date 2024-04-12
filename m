Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BC2C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 22:36:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E84110F902;
	Fri, 12 Apr 2024 22:36:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EUL+Eqp3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D6710F4FB
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 22:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712961380; x=1744497380;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OdLtMoC/3J8jCjOzBEbAqbrr/OWj9hOjSNO+mJj6SOs=;
 b=EUL+Eqp3+UtVHvHMCLKgIXNh4xNU5fSQV1C5KcHaKkOd03AERCkP86Dc
 7g2Pe7iaiRcp0kkTV0fpB3aTi147LlFuoXH1oHmBms16FF+mC7jwZabqB
 hKOH8J6nWeFld7bzGy586qHlHHIzyiAKiwchoyAruBNC/x1rK2MK50R/4
 2bBoOYqSKkadnuCPiHUk+rgHeCA6vJzLlN7wR9+x9XfeazzsmaHSW8JfT
 BSdEoKOZqTGsftMsyUjnDA+0i6g1lCVIHgMXe6GzVlZ5dQx50LLwYgjj3
 fFeXODlevnFBwwAZqsXuVMCw2usypgbDlBz6yvZly0Yud+H97nNc5/P1I w==;
X-CSE-ConnectionGUID: fx4oWkjqQsyQfyxz6fXTNQ==
X-CSE-MsgGUID: qjVm8I7ISJ2x7QgqV66muA==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="12282740"
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; d="scan'208";a="12282740"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 15:36:19 -0700
X-CSE-ConnectionGUID: yszDnk/dStG7ZDWJ9TZViQ==
X-CSE-MsgGUID: HCQR9JvNTBOhkAW/a2RyNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; d="scan'208";a="21388843"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 15:36:17 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 15:36:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 15:36:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 15:36:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 15:36:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mda/KwOz4ifnp6AJl4ewp/XQ6lWE7uUFXoKqrElj8mo4coPaxwsBStmsN9zTZa0uT4pIK/5p6DZFZpmlQdhOu7iXgCfnygTTsEh5kLa1EXY5x70UK+UUP9tFYYrafH3qdGYZ8d6uBzjSDbBKnlmnfHiVO5wj8lBFIjeMPX+hTH49GFchWflH7+6YbVVw2dfWimUd0hWceDq7SuCYRIrnCKF7zCnTjAqyuA+JNlsYrcjGWkF0Ja9V8PH39OWjF48HMWUkEjoAiwbye9RMvRIPZEN81vYeRzkrJjGRX3RJGRl+wCUSDC3/3X4rq7MUVPzzzG3C7pWlsuP/JGwu4IM+HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cze2AFBdIefEl5/lfxbOb6nE9LAhK5wji3gALp8mKt4=;
 b=O5aKbwSmQptxPuFY0831bo0qgHX4FLshxCU6Wz+6W8D83mtKadoJu0k47JM9YWrXxjzEPj9ps6fKMzqJcwQVj99S8dphBnSb6UnT0vv9110EuEQfUBvcjFg0yo5sOfxWLlZ5bbD1+sx/bSvk7GVYr0kWC6FMuNXmX/CqAuhzP6SmRZy4MliNZka4H0YdEVl5B4Dh4hH7z6NFPIuI7e4r5JX0izVc8L4Nu9JIB0G+cWU8GIrfcba1IoP30M7S+6D+HoZ4HR3ewHAAwFhJGoW2ZDARUrRVGow6H64ZK6BHLrpOybZQBxY7UUQ/LZaziTaNRp5FTuzPuYstDpoXRVELYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6147.namprd11.prod.outlook.com (2603:10b6:208:3ed::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Fri, 12 Apr
 2024 22:36:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Fri, 12 Apr 2024
 22:36:13 +0000
Date: Fri, 12 Apr 2024 22:34:58 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe/vm: don't include xe_gt.h
Message-ID: <Zhm3EpmMSDM9mmbD@DUT025-TGLU.fm.intel.com>
References: <20240412113144.259426-4-matthew.auld@intel.com>
 <20240412113144.259426-6-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240412113144.259426-6-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR13CA0149.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6147:EE_
X-MS-Office365-Filtering-Correlation-Id: cfc5de09-9909-4288-148d-08dc5b40f51f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /RdJK82O8oZYzhX8SoG5vSpIHkrZ11cKlH9mJHI1RIVbUpJlxRmHk0I+GNJ9jdok0rLnEL5me5/alasqeJmsBEp4EltC8oeGuZda4Q3cF+Gi/6Davve8aW9Rf+1qqIfeP63rYnI6IU5pSPnFA7GElXmyzFGwmz7bXoP16JF6SnFQ5yVnRQ+BDCBKG1ar5uH2oCpXZG9HFkhdtsNlBNrZocCXUJeo/tcTdZLDgT3LsPRHqUlNldKHQkqRVxrGtUaMa0FU81c8k02HvAD6235buI496tJguWTf7e44GRaX1f+OnFFuppbHvNHXmlUhp2Te8LaKshIIdVvvW2mTnfpocxzfj+ojvN1gsqvs9fqvyi0QZc1gWj36QNcz/HqqVpDoutGSqiP1MxpjI0oCMT9vIypk4yz4pzGbIFdrrVdnktWUMCbKWtP/c24RKvt0DRnVLFxMNQf3Dd4G5ZaZvm4vCKt1MTos4dchyCA/5BsPd0eTKZ9Cx8gfnwU9zqdGewgJF7181BkLnLBfN8J3+iEf1VIERe3kqplWcd044mmAT0Y/XfJR+TPu0RmQqh5gXS2dd3g81z4587OsNd6N9WTm1/CDi9Bo7S7RCKu7VeTmi6FJzG6hZZoc14cTUiNjSSNEQMSlOV+T3JNRLEI04CWWWuthprePDXqplyuacUeQNVM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bmmz9zMvfbhEmnb+uKkegBL1F9YML6l7ThBB9wMO87GNv7V4GoOP7VEpeWeC?=
 =?us-ascii?Q?4ncnef3aATaNG4XlU3Nv79jemGf8wI9DBmRnbrxFIZM+h4H8n9sYYFpdVxqu?=
 =?us-ascii?Q?4hHAPycWmUhhtwUtzntYvh/aCp8vMUSGvHcfdPKGmMatKFQ2ptTWSOrHu/aB?=
 =?us-ascii?Q?jcqat2Nr1oLdQIAV2isCyHf53LMoeWwMgway+bTkzgCFXuF0MTLUprZBkeFK?=
 =?us-ascii?Q?/X9jOFbZJplrVpGyln6y6PlqA6e1LbW+4oumwhMW+aFXibCwGS0rpV62dcx8?=
 =?us-ascii?Q?5J7iIx5aCMcc72zCgs/61YPBasd5++yiizhE3EcVvOcB8j7tYOWjxkBptz/S?=
 =?us-ascii?Q?hhvLj2zywB91508InaUAwoBcAKTXLj/wF8BkDetKwa3923Gb0SEZcy8ZuoKh?=
 =?us-ascii?Q?Wb8Q7g21CtZ2br1lM+2wuY0toyY/YipSBYw3ZecnaACGsW63q/5bvO/cukHQ?=
 =?us-ascii?Q?MO4PU+PSL0T3SMRyy/qhlc3SjMXi//H53gKX7vzLl87foIw36TYORMgi/XZw?=
 =?us-ascii?Q?Im5/9VgYqo8ULQdZTIHKG/+uV95Kkfv4TAJWjtJcJXxG6872UTP9t8sCct9Q?=
 =?us-ascii?Q?SSUvhkr7bGFeRt22+TP0UFgzUMN4EPzDWAePl8JMi5OCjrslihQWsvWEajQf?=
 =?us-ascii?Q?03nP+CL1AC+jPpm7wQ4OMtQiX6+LZIFGJPmGTDDxqH08lsHsMQ28+pD1uyWI?=
 =?us-ascii?Q?o6C8wnAdn+z3l7n/xe2GcjVsZZqL8a2Puiy/dPbtjXZJTn4IFNc/RtLnDF5q?=
 =?us-ascii?Q?y6nT2ZU3/3pIlBq95KePgxQtXjJS6DvDmYTLz2JZOeCc04x+idYN5QFfQPy/?=
 =?us-ascii?Q?lMjP8CfhVFxUdF6vmoFv6a6ynCAlahuKVQOAKDW0a99iw4qr8z8cB+zPYbkC?=
 =?us-ascii?Q?4qb86VaH+9Kjldmzz3tbSC3t8KFHUT6oIRLdq+0zAYEHmOK7RqUx5qFpH1GE?=
 =?us-ascii?Q?FTj7S9zaXEf4SQ6G0Nrzoo+FWMgljlipgFdjCeuvQU/9NHPwIhiBMxI5OU8+?=
 =?us-ascii?Q?sxMQd0CO9P840RQDU8fJP7xGuXVgejrDUZMKZg4mZGIqAhdgSROmzAxvQgo3?=
 =?us-ascii?Q?od46/0HRnz9fnDe+tbSDTmEU+ZPafk3P+AfrgB2m22gwBYH/IsjUXZEeGxa3?=
 =?us-ascii?Q?iM48i01Lf8QEg/cWrAOXxNesz3jxBHgARO37f7VjlRCGZHT3UMnrShw++gAS?=
 =?us-ascii?Q?2fNHU1HrovXNmR/7442kk+gj7eRR8V/mJPRbmXmTaUoE1K8B4fY4RuzTY7vx?=
 =?us-ascii?Q?HPOpmlEYycJ102773vV0U58gIUSHgpxkCj8FqpmNZPR8JcjdiEZFKoC14Wti?=
 =?us-ascii?Q?4Osb4wuNSAIb24Ag4Uk6F5OFC8rN/XKBCaxfVXCrQxw99Tlmu6+6AO8X7Hv2?=
 =?us-ascii?Q?CBgdYueMgc3y3nRNz8ayR2qC66Ek7gYXgXrI8t2r/X0oFTjiXrOGi0BJWCHq?=
 =?us-ascii?Q?iphyMeFjpPcUQY6WB8sJrfp9FhrSCME+M6AnrEzUcz+7iPnTUNKVyf5NwLeh?=
 =?us-ascii?Q?xxzPlWQ6as7xI4By2a8B5FxDYMtQALTAGsGHvUEbDGBIJTXBlqu2pcLgqI/r?=
 =?us-ascii?Q?U5QiTcHOmnEaZQjKH38nqHCworkmOdGzPb63/Bp+OOofeS1Ube0gO2RlmjBz?=
 =?us-ascii?Q?sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc5de09-9909-4288-148d-08dc5b40f51f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 22:36:12.9538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tQBS81rTeY5CkxB6Mqm18J/2Ux7Q0aj/Ytyv3PtGJbABpGg91tGmTqEdICzx7O6OZXQ/SoujK2IpaI51CK+4gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6147
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

On Fri, Apr 12, 2024 at 12:31:47PM +0100, Matthew Auld wrote:
> clangd complains here, since nothing in xe_gt.h seems to be needed.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

This isn't related to rest of the series is it?

Anyways, LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 300d166f412e..35b63512d288 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -27,7 +27,6 @@
>  #include "xe_device.h"
>  #include "xe_drm_client.h"
>  #include "xe_exec_queue.h"
> -#include "xe_gt.h"
>  #include "xe_gt_pagefault.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_migrate.h"
> -- 
> 2.44.0
> 
