Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED29DC3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 23:47:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F2310EA39;
	Fri,  9 Aug 2024 23:47:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="amckI6p5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9BF10EA39
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 23:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723247222; x=1754783222;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=q02jvxbMnvhrVPva13fbvYD7CRL55LxkSXUgEDHEg/g=;
 b=amckI6p5SCQ13qckjUJtRh9p4yToUd97X5VvXJEqjJuGrUx4Y0d3iVRf
 0fX5mjLRVheSj0uFYprboGoy32jRnTWCkoiAgqzXmi0+ZoeDai0qfbh12
 kzcVdBE4lN83l5d/UC1AK4JoUapW8AIKBOXIPYFpvj6O85+R7ub8hJYlF
 mYTTChNAluvE7V0oE7jxFgwe2iKvZF03u0fceiGb/a844NzeIL0KBBPEq
 Albswg+z6TP3Y0STcwL3VVb4wEuoMu1Mx6T5HBI+nyqni/X9Np8J7q4lS
 PuYTbO0ubf0FuNtdMEzd32/g0M0fTi9khUkh4pw9aTyGEdclu3CMfSVhI A==;
X-CSE-ConnectionGUID: tiehLoTpQmiBkguzr/ey0w==
X-CSE-MsgGUID: g/Wan/amS8ao/W2KJ37xGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21566998"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="21566998"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 16:47:02 -0700
X-CSE-ConnectionGUID: u0Jm//BpTx2ekMDXFDRBGg==
X-CSE-MsgGUID: nYZPh2Z3SfuYGh40K0K9hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="57946972"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Aug 2024 16:47:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 16:47:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 9 Aug 2024 16:47:01 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 9 Aug 2024 16:47:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/H7YHHF8HbySHfPirxlEH5J21WBk+8mEJzAPhSUefLUQSyoFnyUzKPcF6ImvT+BwRX0tIZgMq+u5Y3E21kGCvnY9zIgOnIQ7kI2zY2NwSiW/88QE4z5mlApvxF8bhBzKP5DLRJbj1ng6STgikPjM/tVGkg6A0JT4MCUiaRrcwMv5n9pQ/A3OQsARD4QEb/CaoLZMPRSfw1ve2ulvjzfOGs93mMv8Tce0CAwTeVdPjzsXTdxmLlbVgie05mY5phVRHEoVfeuUszcj/AyYvtRCY41cDL13ou0mu0nd9WLVhwXSnBLwByvg8gRIHIv/T0+ULY4zaCQAYY13jVkWw8cfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CbA8qF3jFVi3jkzcvlNOLGYrJ4kl4T30RGRGOVhamdQ=;
 b=OrJVLTY75aRnEYmzDvu7ywg9a0dO1QFr+UahrLzzWvnd315teZ+xfPbudw4Tz0hjWk1k234aYG/WrA9BOYHWeNl1W+Ppk0uCgPNLuv9RkVe/fDDonDCD5StQUHsLTT+imH4QcZHBLceYdjDpMZ1MRhkw5hXDtc+QLqU3ICP7NmHva9qEVoUtEzoiK3RYIN8K4xJN6TEPd2cW6O/P0lpir99NDgy1FlacjnBJkgQYqHQwDBHoj69dMlPKHr5tATLOuuZaNIQFY0bBqyqAZc1CW5IPyBmp27MjuUVlQXJpKGGtrGxhp2zHrKcEfEFIYsyfennkYqwwRXzCi7rvhhB8aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4583.namprd11.prod.outlook.com (2603:10b6:208:26a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Fri, 9 Aug
 2024 23:46:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.031; Fri, 9 Aug 2024
 23:46:58 +0000
Date: Fri, 9 Aug 2024 23:46:02 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matthew Auld <matthew.auld@intel.com>, "John
 Harrison" <John.C.Harrison@intel.com>, Alan Previn
 <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH 0/3] uC-related drmm vs devm fixes
Message-ID: <ZraqOtF30QPXEwkv@DUT025-TGLU.fm.intel.com>
References: <20240809231237.1503796-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240809231237.1503796-1-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BY5PR17CA0032.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::45) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4583:EE_
X-MS-Office365-Filtering-Correlation-Id: ca2ba994-dbb3-4a51-d802-08dcb8cd8eeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sF9b6PYrTwO6xnpdtYxftZ4G/JbYMtYezxyIJLtAPASz/wLyvJ6ss868Eb73?=
 =?us-ascii?Q?QKUmfyr+JWhpdsT9379PPFt97FSDrGHP6v3hk4mBO5wn2q6xi6cJUbn0laIJ?=
 =?us-ascii?Q?ZSobjgiQpWtWORPbZNiTpawxC2XLEGLTExwCsCqM9eFW+TRY2qZQ3nC2IbUx?=
 =?us-ascii?Q?2vdugPfqRpCmre91muWi/ZYzPLi43tb/PTygRA+XrkqVNXYxzZdQUJQksRrI?=
 =?us-ascii?Q?eH8eNlljKlAlsQ2uHBcA5bDHB/RijSydgYAAqEnmbwtqHm7NXUS0dhE5ACU0?=
 =?us-ascii?Q?UbLfmDDUR7AsM/ivbcL0xb73ylI8FCt8F6IuM/QoN9aKplv5MXUqDx+RQ7Bb?=
 =?us-ascii?Q?dnwbg72JDTGe+nw31xfnWkvgw0m7ZXAPCxFGaJdl0NltRA8kPmK+heuaBBV8?=
 =?us-ascii?Q?ktcKcXLYb47jnuU9uLdYrE/VqZ8gjmIYoCXy5YCFzRED6aqu8Trk6Th89AZe?=
 =?us-ascii?Q?NKygwc/y99gNQnvFiJRR0kbUC4wVmTKF7Pm9pKGb5E54GuoRRQGGVpd1kiuE?=
 =?us-ascii?Q?WHynFFInWlYIqaVvtfQ4JS4qwisdSAvUbgqK3pPqUu1z/A4s+/1VmS0RoZnX?=
 =?us-ascii?Q?Jt7GWJWmEfIwyJFD9jjTgGktDMW9rO5bWOpMmRNPYAXU/WpCowbP08JsTW0J?=
 =?us-ascii?Q?eLrJvVTlIJtcxVsxjpnEBrwlkGmrqgZxYOlGs9Juhw5QxAUnLZDPbEJUhzW8?=
 =?us-ascii?Q?0wXaK6hQ769WF8AL6MAP96vUTDJBrca1alb5HIB6kSSUoxBnPdMMAEelAQmo?=
 =?us-ascii?Q?hskyjrhfwOIubLce5hVoFARBhvSfInjZl8uEN7PJYzlUA/Ynb03rO42IqfmF?=
 =?us-ascii?Q?hpJ2tJ9atDz0rSWQatNwi7H7nE0QizgUDtg2el76y6BYWk1S1sm0IXD9c29X?=
 =?us-ascii?Q?pbMHEhURLADUe2HFmIrn2f3cw2ZCh5n4Ab66B6+sjVHrYHsIBdPtZlcVDBvX?=
 =?us-ascii?Q?IC/vz3ansfWQfpBeSZVctXECADSxbpV+14WWUtliVqU4boGrzIg7GWBprdAF?=
 =?us-ascii?Q?5qubHvtTNae4wmdRnS2GcR+/MSmZCMtfSzUazvlTP/nNTHGTpTpEIcSiaw/6?=
 =?us-ascii?Q?l4AcqpH4NzT5mE/Kb/xp+Amw4uQTYdqKogXWfPzvO9ExMX01Ryv89/hqXTTd?=
 =?us-ascii?Q?BQY306pO/HvVh9eQXR8EOj/ft+zUKAI7x95c5dMjICg4V+b2inkNZtEmVJlw?=
 =?us-ascii?Q?UKrx8EWEBvieVDo+RbUeVhkaK8FDezAmIya/tB2fyH68cul6N6Otl2+q0MrF?=
 =?us-ascii?Q?ihJLfSXYaUrK6qRpXIw8ealymwoqKLdhfGuVz1o9IA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m/sSrtt2MKYaGLs9D47pvairqzNPX7oFnA0DwWKFbGWUZE9GomOSv0qv51TD?=
 =?us-ascii?Q?rpsun7W/1mb/fqbzlPjwXGENSJvpl0OCOklaUL/jIPGuXIuUiihAZb9uSAdr?=
 =?us-ascii?Q?z4omn1lFQTOUBDLJ1CUFdsKunt5xEhkWN+3Hv65DHrmN3pOG73lRow8CQcCS?=
 =?us-ascii?Q?rgS8whpZVYMw5H0BsgIbXVXFkWFn5Xjk5aZ1k1MZyD28olP+XcOzpgWwEvos?=
 =?us-ascii?Q?A+XU+fVLBSrsIKhkbOJYZfI/javcUBAgAbdUasdTNJBAbn3YPtjnhFSjoOgO?=
 =?us-ascii?Q?gR55T3eL+cdllK1bWPtveJb76LnmykVx/RTCz3PqyuYSte7UNSeXztKTcYPL?=
 =?us-ascii?Q?+cHTvzWtYOZXW4c74ZHzvheeGoKfRA4OmDWWnhr/rC3FwgxCOIZBHeSYV4fy?=
 =?us-ascii?Q?HPWjxE8QxUo8lb2LYWYba/FDyVJ3YwjFmj1u+RrxGHsD01GAUnEqoJ/10R5d?=
 =?us-ascii?Q?h/WFQgR5jtyc903BCBdiaIJ04CkVhPsV9Ei/Q8S1MV9eGrHy+xzMpzjnpfpT?=
 =?us-ascii?Q?wAevlr+HouTvNle8nEdoRbyyZeECJQXeTq1eHXLAbd38Gmhs8hPgvg8w0ZJE?=
 =?us-ascii?Q?rszDTHM3lmQVgZYApszJRSQbRo4fglT508PLSXIPuXRuiyU4NmgxnhmkJ0bs?=
 =?us-ascii?Q?X0INEWsmTj0xl5QK1LH/aiTEYTq2Cuh36WMaonFhbpjsfVIBXbh+TW2+NStB?=
 =?us-ascii?Q?VC9hlI/YHrGDfN3tbGCmrtTA+7lZMrK3bfETfZn2Tifm6pXKJPAOGWR+zZ+7?=
 =?us-ascii?Q?ZAaQzbkmNZPTOz3jN2tyLeI0U6uwYA+R5m8KtcBEF5hwlBkFIFhKqN01M2nV?=
 =?us-ascii?Q?zx/0ktBjkf6K0yb1QQsKFgcU+zPYT0eRmzU6gnbiwVSrpJm5Cl2efBMQ9Ylc?=
 =?us-ascii?Q?oCecwkc+Ws+Sp5YXeiF7HmwSEju+B6rCs4k2vYyavzVe8ZhvUB5bf3R2KA3C?=
 =?us-ascii?Q?h3sKFysu/7gnEd1NM+EFWkWsFmx2efz4Chr8bguNLmccqU+NpiGx0B9DU6A3?=
 =?us-ascii?Q?hd+Z/9UiMK2Z9+JfjbheLZ+Kehc7jFXaODiIU9UNA8gQoVZSig7+qB4uLX2W?=
 =?us-ascii?Q?xlX9i2pr9JUS0KrQ/dLgvKsAUe6mgKd/R7XrLdJyGT/+xPVM1B4xmkAgkMsE?=
 =?us-ascii?Q?/4Mim8ZADbknfbtq8bBgDM/tjBKyGBPz0RoNKQR1/EwZpFLf9lJPnq+gaoKf?=
 =?us-ascii?Q?anxrbIeYN+oqcEepSvQeYqH0CLboA0TuKPo14I9kY+wnFn2PA7s5EybJB3eE?=
 =?us-ascii?Q?xWJ5VpgURSAWaC98vYBM+dhuUCp9pOMxIvqeNynQV3w7RwT7P0QLkrlPFnLE?=
 =?us-ascii?Q?uv/2zASpQtNXFBvxDmZIaPpT4IL3LmuRaSJsRQGXNO0a2SDNP2WuI9tgPMXL?=
 =?us-ascii?Q?Yx//B9zBY749at6WvlmWN6SKwJgkT9l8t7RCn+5g6jqW4oUbj4JDdTzeK3MV?=
 =?us-ascii?Q?aA3AtiudTrwQa5V6l+hRX+dR5lgxKbR3kEyduJBh3bXb72ZFcGW9JZWvDxmI?=
 =?us-ascii?Q?fdOlcfnCQw4+MV1I1buTSyVKK54opUAS5wUzSKlA9lGqkEzqTz9jCiFTp/cw?=
 =?us-ascii?Q?JN+Za+dgKbOqdyA4u6eIGVHqmlr99Xdt8Vi0f2REWVkk04kP65cGRAyST0lQ?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca2ba994-dbb3-4a51-d802-08dcb8cd8eeb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 23:46:58.6656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3sNn5iLfpOX1BsSkrDAG4atAzqA3smQGduuhCf+MyzB/rfzaNikBl1fykj/UlKpDkLbGKdX1ceOajB3gEEPE+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4583
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

On Fri, Aug 09, 2024 at 04:12:34PM -0700, Daniele Ceraolo Spurio wrote:
> If HW access is required for cleaning up a resource, we need to use devm
> callbacks instead of drmm ones, otherwise the HW might already be gone
> by the time the cleanup function is called.
> 
> The first patch in the series fixes the managed_bo callback, which is
> not uC-specific but it is used to clean up the uC objects. The second
> and third patch fix cleanup of BOs and exec_queues in uC code.
> 

I can confirm this is fixing the issue mentioned in the cover letter [1]
here.

Matt

[1] https://patchwork.freedesktop.org/series/137111/

> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> 
> Daniele Ceraolo Spurio (3):
>   drm/xe: use devm instead of drmm for managed bo
>   drm/xe/uc: Use managed bo for HuC and GSC objects
>   drm/xe/uc: Use devm to register cleanup that includes exec_queues
> 
>  drivers/gpu/drm/xe/xe_bo.c         |  6 ++---
>  drivers/gpu/drm/xe/xe_gsc.c        | 16 +++++--------
>  drivers/gpu/drm/xe/xe_gsc_proxy.c  | 36 +++++-------------------------
>  drivers/gpu/drm/xe/xe_guc_submit.c |  4 ++--
>  drivers/gpu/drm/xe/xe_huc.c        | 19 +++++-----------
>  5 files changed, 21 insertions(+), 60 deletions(-)
> 
> -- 
> 2.43.0
> 
