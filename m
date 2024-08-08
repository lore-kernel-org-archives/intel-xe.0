Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBDDC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 03:34:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67DD10E62E;
	Thu,  8 Aug 2024 03:34:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ACLxUtt0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD16110E62F
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 03:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723088079; x=1754624079;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=E/phZf6kIY4snjB5hx13WUIdaOrwzQRyK6LDjaI1kos=;
 b=ACLxUtt0/r2Ab5DyMxCi45yE/h1NR5XIjIRl8u45xc4BbRI8sfk7lcQU
 ULJZCOJMQka8txHBSMDvxLDT+7ijBKdKh1czXNZ1RQ930swZ1+GY719VA
 D3V99x4q5+U9RLLITPUd6SC6ADrf5bZvONpDnY0KPytD5Fjqkfoebv7RA
 2tckU1wf9fH/QSUc9mG3mTJZn0aAkwde4117H7Wf+2LzPQ4uSbgfPNxRa
 3AF8pzTFNyKPsJ+MxVRh3XG0y6aLPLC5zqCsFilheDuD1Vutxys7IMqvg
 1f3bYLHFzAURNRStQwi7ql1hZ/WnMNgJUqguJlDvxjaKc2HoX4EUlGouh Q==;
X-CSE-ConnectionGUID: gaDYuEZqSmusIkcwR78YJQ==
X-CSE-MsgGUID: f5A1MRYuStuW31tU2RyrkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21005446"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="21005446"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 20:34:39 -0700
X-CSE-ConnectionGUID: DYNhBomxTmWUbZG8d16oOg==
X-CSE-MsgGUID: x2VONsFnQRqvOnwuXqekMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="57038761"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 20:34:38 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 20:34:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 20:34:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 20:34:37 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 20:34:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D6efaioE5GEwR5FFg7zK64cPTZszJlpq+XRAludTAQ3txxxsxIc8EB9iaNgKwWpTp5Jajaz+Qkwxhv+2utRVlaQ8mFqEWUhAKdXkx3qqZxOyhVjxzUqmu2qkuNzojPzzu3mnKSX8rAOCK84B5oitTlTlV786Nf3fH+JCEYut1/HVXclSb6LR5AUHa9GxGXb7YxlAcENpjN6TPWnnYehD4o1I56nbpgJvBLS2j6wvc/JKWe+WhgqcnlTVEvl0ey7T+mF6TVOSc9eOL6tiIsRLSTyoYGVjo4CxM0AdmijPSJx3bUynYK6b8msEcUy7ui1aG274FtTc2BZ6kY4TwAaeIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4o0C98z55+7uSZKqmeCRaNtjcgZ/5xNIMkIw1vtbhJM=;
 b=HLuYrpnX0W2xg0dEB/SQEecnlJjERhzEW4q1eEC/sAgFdN5zfKy9updqel0rMi1qWZCSrKlrP0GqS+iS6AST8E0YOyNLlVsg2EtbQ7NUKVJV5zTF2Xn0mb+cdQ+dbEhwQbHHFd8Thro1h4Wj8FGIGQsHhcjLYX1AfGg3eYIQPpxMszzKpuvXs2M9lUydAwk469EN8tR3ucEZj+eG6hox+5/Ek4oIdR1AakzD/jsV6/auW2Usurxi1YMz6C1J2ZjEwkd+VJMyKrV+QETN/Zx8dRHmpBGGsiyzJBHXyKRQhh1oxUoe/B6qvaz8woy06s1DE2iq5ZRJuUjSbW5moVns1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7472.namprd11.prod.outlook.com (2603:10b6:510:28c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Thu, 8 Aug
 2024 03:34:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 03:34:34 +0000
Date: Thu, 8 Aug 2024 03:33:15 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 09/13] drm/xe/exec: Switch hw engine group execution
 mode upon job submission
Message-ID: <ZrQ8e3kPZf6PCbi9@DUT025-TGLU.fm.intel.com>
References: <20240807162416.1307061-1-francois.dugast@intel.com>
 <20240807162416.1307061-10-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240807162416.1307061-10-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR06CA0040.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7472:EE_
X-MS-Office365-Filtering-Correlation-Id: c881d9b3-3aa6-42a8-5b6e-08dcb75b0556
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OSBJBC5OiIxIOasE+MpK/QoDaeIL+YD2ZbWf+9FcONwpn58HHivhLRfJZqCI?=
 =?us-ascii?Q?ydJamNHO/3Nx+cxDMZ9BisN5CZabGmdWQrw4LLztT8XfJLqRlNXI/t3F+jig?=
 =?us-ascii?Q?6SB2jB/aGN3mjO8L9OxmYHtEb0yacGLtqjBwGgBVDWt2llMLi2Ji9hN7YKXm?=
 =?us-ascii?Q?fpHyLwm0NItROL/BP+QzkIRl1xbIJeswTqUd4KP5fgsu/u+f4p8l4PrVXUaq?=
 =?us-ascii?Q?IAR5R0T5zSEsPlHxZ0x9dY77cOzxYamh/gfnQef1zx68h2CDcCgfuQiqmVjx?=
 =?us-ascii?Q?k6b+trtSegYIQBLLiqBcA8YXTSGcoJYlWvdQeAS5Icrmz2ZTaG65b5STOOp8?=
 =?us-ascii?Q?c7FphyaWXr5OIzXIRIpBXUV1CCWd7ejNikEvRXC7UsL031F9yEU2KnSOkvem?=
 =?us-ascii?Q?rZz24/Xha8VaZrx6eqdoF2xDQuwLsMclbH9TJt0DxlR25d8FLl1UxhdBJvTA?=
 =?us-ascii?Q?YmVmGCVIqufSP9na4bB3vjMxdLfFYjXorh5J/miYXky6mHAN6wzaLThd8ANC?=
 =?us-ascii?Q?8XsutQglaANcRrUt5FqyDnyD2QHdAnTuDLiR9Ap0B0dLFBCBFJ7PuEo8qzWZ?=
 =?us-ascii?Q?5ozAyZg61O6FxCimcZM5TNAZ45Ef8CQxeraCl9UD3RPCHqromg1CGbkSTqDG?=
 =?us-ascii?Q?GenociCD6auhS8+5UV2Wz2TtrASGhXXu1vhkjcz02J90vHWn2nzHtGvEPJ11?=
 =?us-ascii?Q?2rAkxhcjPZ+4ZhM7nah6N2XCqZUGh1tGEqZetp50jPQXGSWJSMvt0PeVbBkv?=
 =?us-ascii?Q?AAwFyPCMdT85r+4rNbLSM93/NvNtoUf6btk4x2/v8KQP+3qBPUwlCIeO3RZv?=
 =?us-ascii?Q?g4Y553R6hXp85VS7RcgZi4CJ91ik2HBtNR0/Ja6QE8aKIwZqMir/ka+dXA4i?=
 =?us-ascii?Q?6ztbI3AtQdRMf3M9KSns4r6HfMrSwyuqIgy22kKuQJ0LtucehIaWNP6CWHbZ?=
 =?us-ascii?Q?xFvySHIR6E6baMnSjDcGapseWp3uksQNvhcl9gOR0t/7NZMGWFtAjLh1ZfYb?=
 =?us-ascii?Q?c1HzA+93cYgU+n6rKBFonsbw/5BuYoSasaBqAP9TJTiwEM9Vxa9Mjl+Wu0C+?=
 =?us-ascii?Q?wJckgmjNSQYHFqcpevIQ/+N+ZYHbraNhiYq5QsLOAc9czFOzw6K3fIf6Jicc?=
 =?us-ascii?Q?YR7cIFEBj/uMcjTsqQHfUgSSg0wkQlt5j2P4xZLnNwPn2f1MKNKy5wKTSDyU?=
 =?us-ascii?Q?znCW/oDQJRwrEkgxD7oSxKvPPEQrPLkNYlpn4wFOkaapyCdRKOo5gZyVuB1i?=
 =?us-ascii?Q?szL6fidD2K4wOfNZO90AUtkkDRJu/s3OUk8gSxR9X5VYAWJg82iw8KCoQ8N2?=
 =?us-ascii?Q?UfFBiugTsGOC9AFA4PIJiHMsfFPGVfTnaGOlXruNqTSksQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nE0795nEwiRD9OtVJ3yn8wYq0IxOXBWN6IYIge2qrqLehPYS0qu9hH4IlaV+?=
 =?us-ascii?Q?66gGTqSd0S74W0NoV7+434wJ8jEqxcms1l3IrSTbJ+Fq5DrJI3yQ0wR3snQt?=
 =?us-ascii?Q?d+dKgD/2jlRshOd00o6qAL6E9QVpYaa1N8D+FCcrWV0bBvz8lAeMuG22QdjJ?=
 =?us-ascii?Q?0EaqEW0GFFvq/9NMYHNgqdXpy7y9tKdPSYE6zbdWat5lFVUX2w/kQ1KS3eEL?=
 =?us-ascii?Q?kd8MgJ3hf911YwPZ7p8DlFI0PLo+s0zbQS0yydXZfW8og2FFMlBwscffpFjF?=
 =?us-ascii?Q?o29PY9lVrVjSkm6c/x6bUmPVzisG6sRlfPVzH0Z4evZTGzE7FrP2+A7nMoHD?=
 =?us-ascii?Q?cWMAm2nWHMM8zzNgfFoII9OFjkPFWdatXQaU9PsXm5XnOUlw9krwY/+Df0Zh?=
 =?us-ascii?Q?CC/xCfvc4Jn5qd0MlL2U+51OCiZKdnSW1S59TIeyqpCM8Q9CAZjARhux+37K?=
 =?us-ascii?Q?XFZ8ueXaDP2Tk/ylLtrXgXsixctPtAlCdt1gXxz1wbV5RmwwZbRw4TPRcau1?=
 =?us-ascii?Q?rUCqKSlwpOfK1wQme0pBFp/H51KEzVhoWWt2t63EXyCwzh9nAVQj2Vj6vo0Z?=
 =?us-ascii?Q?WkegrdXI3WAfUftRoxJw6QuwjibuHi5I1nr2HnG54Ab7Z7mxKQfpJvJqzAVS?=
 =?us-ascii?Q?HocI3+OAvxQF/bx5Q3xdwkW0bzR83HRY/ETGxLsrEQG4QmhynXPGwZoibgZ6?=
 =?us-ascii?Q?ahVNE3IqyGATDdF8wXevVIAX1ZjfLD25ud83IuBF+Lm0Xxt0Gyudfb2DdfAC?=
 =?us-ascii?Q?OqmUv6XjCS4zir5lciAWpMiy+dTrbD9AzjhI7FqoLLjYnuHkAnXdkjKPtFIL?=
 =?us-ascii?Q?pgBK+N5Fdnp74/O3ncjChYW2hnBrTG+caXMcEFUfUpgy4ZJX8LP4xqe6HkJ2?=
 =?us-ascii?Q?BDdKBlhH4XbTKgNTJsKjRquPJqH0FcG9g2gOqGg/neKtn+JqSz4RREXn+9f5?=
 =?us-ascii?Q?z8ti7XpiPGUt/sSmSyNBX6m9EtjsPaNSbg23g2TPJqb6HQycyRz6nQLYczj0?=
 =?us-ascii?Q?0zIzS5flCu5dbsn4GxBKJgnZurt+Yg5LcK1Wy2y4ZlvW7XchXNO7IL9qJWUX?=
 =?us-ascii?Q?nsGNe9OmqC5n75He0KXUDj/C8M4AsFzA200cezuZaUeFc2UPOsQNTtReVrHw?=
 =?us-ascii?Q?iL8c1k9GW53Vvub876Lr+UynCRa1AfhkJFC7LK74/oanfQ4PEpQrmk0mTSST?=
 =?us-ascii?Q?X8tDLg/U7V2wiQsJErc4sRkhgIFbW3roYwvUYqPV+ApYSzmBAA0JlPnfb76h?=
 =?us-ascii?Q?Gxy9m9mYOcia8eWaUx1gFhcIREsN5bwNL9eqxOP30F//YRMRNEnVpv4ipwti?=
 =?us-ascii?Q?2QTSXUNa2KjjL4yMI6zutloNHAJ6XnoTG6bEy4rk55Hce2eUFoH8pHYhcYmK?=
 =?us-ascii?Q?6kzuXRRrgmUBp/6KT2AwoSGakaTkmnnCfNxJnuQIAt6Vwx3QjWLOd9z05Q/I?=
 =?us-ascii?Q?vgBXDa5T47xkBdGmEgzDKGHp1ZG/6TuwS+7wJ2EcJ2aOkM3V39SzfGAGbrK9?=
 =?us-ascii?Q?kXPJmTprRUBZIBV6N1BBL2m+Q9e3dvYBuXUbNb10Ly8bgI0k2ZLd1hTYZuUU?=
 =?us-ascii?Q?WFQqheLQxpGfxKU+BHWeE+tlelwKbZsJgV01J/h6gmPkEyVoBT+Pk8TFn2/L?=
 =?us-ascii?Q?Xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c881d9b3-3aa6-42a8-5b6e-08dcb75b0556
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 03:34:33.9894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bMg+kDu91BEezG+4AuFBqJY5JWwZ0B0Vo/0QD+BvzVYTVeHQMICIaxrg/QbfrLysl1RpYKXGZVNvSj5n1hy4qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7472
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

On Wed, Aug 07, 2024 at 06:23:38PM +0200, Francois Dugast wrote:
> If the job about to be submitted is a dma-fence job, update the current
> execution mode of the hw engine group. This triggers the required
> operations to ensure mutual exclusion of executions modes in this hw
> engine group.
> 
> v2: Change execution mode in exec IOCTL only when submitted job is
>     dma-fence (Matt Brost)
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

A little pedantic but I'd restructure the series so patch #10 is before
this patch and then this patch and #11 are combined. The reason being
the common code path of exec IOCTL is fully updated (and feature
complete) in a single patch. e.g. At this point the exec IOCTL is kinda
broken. I think we are likely fine as the restriction removing mixed VMs
is not lifted until later but it is good practice that no single patch
breaks any functionality. Also when looking back via git blame, having
this patch and #11 combined makes things a bit more clear.

The changes in this patch LGTM though.

Matt

> ---
>  drivers/gpu/drm/xe/xe_exec.c            | 17 ++++++++++++++++-
>  drivers/gpu/drm/xe/xe_hw_engine_group.c | 13 +++++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine_group.h |  3 +++
>  3 files changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index f36980aa26e6..2169fbf766d3 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -14,6 +14,7 @@
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_exec_queue.h"
> +#include "xe_hw_engine_group.h"
>  #include "xe_macros.h"
>  #include "xe_ring_ops_types.h"
>  #include "xe_sched_job.h"
> @@ -124,6 +125,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	bool write_locked, skip_retry = false;
>  	ktime_t end = 0;
>  	int err = 0;
> +	struct xe_hw_engine_group *group;
> +	enum xe_hw_engine_group_execution_mode mode, previous_mode;
>  
>  	if (XE_IOCTL_DBG(xe, args->extensions) ||
>  	    XE_IOCTL_DBG(xe, args->pad[0] || args->pad[1] || args->pad[2]) ||
> @@ -182,6 +185,15 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		}
>  	}
>  
> +	group = q->hwe->hw_engine_group;
> +	mode = xe_hw_engine_group_find_exec_mode(q);
> +
> +	if (mode == EXEC_MODE_DMA_FENCE) {
> +		err = xe_hw_engine_group_get_mode(group, mode, &previous_mode);
> +		if (err)
> +			goto err_syncs;
> +	}
> +
>  retry:
>  	if (!xe_vm_in_lr_mode(vm) && xe_vm_userptr_check_repin(vm)) {
>  		err = down_write_killable(&vm->lock);
> @@ -199,7 +211,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		downgrade_write(&vm->lock);
>  		write_locked = false;
>  		if (err)
> -			goto err_unlock_list;
> +			goto err_hw_exec_mode;
>  	}
>  
>  	if (!args->num_batch_buffer) {
> @@ -324,6 +336,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	up_read(&vm->lock);
>  	if (err == -EAGAIN && !skip_retry)
>  		goto retry;
> +err_hw_exec_mode:
> +	if (mode == EXEC_MODE_DMA_FENCE)
> +		xe_hw_engine_group_put(group);
>  err_syncs:
>  	while (num_syncs--)
>  		xe_sync_entry_cleanup(&syncs[num_syncs]);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> index 75c82d24cedd..4781d6d606aa 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> @@ -288,3 +288,16 @@ __releases(&group->mode_sem)
>  {
>  	up_read(&group->mode_sem);
>  }
> +
> +/**
> + * xe_hw_engine_group_find_exec_mode() - Find the execution mode for this exec queue
> + * @q: The exec_queue
> + */
> +enum xe_hw_engine_group_execution_mode
> +xe_hw_engine_group_find_exec_mode(struct xe_exec_queue *q)
> +{
> +	if (xe_vm_in_lr_mode(q->vm))
> +		return EXEC_MODE_LR;
> +	else
> +		return EXEC_MODE_DMA_FENCE;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.h b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> index e0deb7c7bb5b..0f196c0ad98d 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> @@ -22,4 +22,7 @@ int xe_hw_engine_group_get_mode(struct xe_hw_engine_group *group,
>  				enum xe_hw_engine_group_execution_mode *previous_mode);
>  void xe_hw_engine_group_put(struct xe_hw_engine_group *group);
>  
> +enum xe_hw_engine_group_execution_mode
> +xe_hw_engine_group_find_exec_mode(struct xe_exec_queue *q);
> +
>  #endif
> -- 
> 2.43.0
> 
