Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34040FB5168
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 21:02:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB09E10E2DC;
	Mon,  6 Apr 2026 21:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TcORR8mK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 131F710E2DC
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 21:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775509318; x=1807045318;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WlFaotsKS8ASCnVx2Ysmc98WTfnNmFV501DbQEoNIno=;
 b=TcORR8mKVeub0jhacaH9YX7pW7ppl4I5TJBCFAyo4bk6Pgz4motz6x+F
 ek5cWLj0CS8PP6ZQYVLa9N2pHgzCs7BqG3PqgmvojhIg1Ifd79lr6gMal
 NGnYE/l9nWS0fzo3s2GlAth+jP1g6BoiJMIVJE/LUxnwuGhCT43LPE0Fq
 v7t68nLEXn6158ZW1z3L/2Igr/IRbGLbgrEZulVq6vCNVbpxhzheSvLjh
 4EUSZeaE1bKZabILfLGHxTPJa6gHNAqrCAy7k8ineFmJ6pljALzzwd34F
 UGENopj3mQRoObHtHQyi9B4bWHR+OoyAxJinYAzQOX6ABDejehmrkQNtC A==;
X-CSE-ConnectionGUID: uh8Y380hSbGc1Rb8PBtyjA==
X-CSE-MsgGUID: p1h/ks5ASqSqG6+n8tNXMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87088779"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="87088779"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 14:01:57 -0700
X-CSE-ConnectionGUID: puOucNdcQ4mVgBg+9B8HMQ==
X-CSE-MsgGUID: M7rXuO8yR2+Kg5svT7KpUw==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 14:01:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 14:01:57 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 14:01:57 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.1) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 14:01:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mC2ZtRgR8oZ8AqpkbghIaTV6N0/H3iMEXfGQDgxHmO4lULiYkPVtWjqdE/KXzx1X41FQ1sNZ1QeSR0wpMjdED1gQ5uD3iDPV/F7OTcrvBSq0dE8sjJe7mRVoL171nrmetG8LYLFINvfpluHsg9SNFx+jQCcOOgDVhBc5ObwhH8TC6l6McDKkj0v8CM/D1kzdNz4p6Cw/mjNB1j6dxIJN+f1Iwu6JG/j9vVBLDI/0J6pT/S5j1Hu2UpqdGSM7XyT+Zh34WHy4C2WvDNyDKOFfJLGmDzOefx+Lv1hej26eHRqqM2CaECd+Ml/SrrZ1MEbyIhrxoDE2KhWZ3E2ACh2FQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kXJjYEdaYutE5Wg8Djt4HxuNVtb6GxW5eMrGW/U1YPY=;
 b=iF/dJKQ6IxSleUJY+jYcbeiYCzWnNAUR6Nzw0GXoRrpqMqSbGlsEOatImL0a8ZkcTu1B6fatEEkW9t6IrmaConsUKvAu/B9QDK3iaFRYitm6Zol7e38fRmfd9bZyKVcEH6It1n7ACNtVVcdlqx/q0i55SDzUABZV72FN69zgUKtnI9E5rDHddC39u6GHWeU4aDI3NPngnfJOl414irdO7wFMOCIzx5S5rD4UTP1pyzlJFsjxvTMMEMIMhxrAM4NmMpUMtg/WdOyH3vW5vqUiecQcYBME+JFLdKfzOWYYteACx/QZKnmy6eJ3iwR4UwbYvXZvEkXKvZQiSvmD9Fywrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB8594.namprd11.prod.outlook.com (2603:10b6:806:3b1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Mon, 6 Apr
 2026 21:01:54 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9769.018; Mon, 6 Apr 2026
 21:01:54 +0000
Date: Mon, 6 Apr 2026 14:01:51 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <fei.yang@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Stuart Summers <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe: Wait for HW clearance before issuing the next
 TLB inval.
Message-ID: <20260406210151.GR2729713@mdroper-desk1.amr.corp.intel.com>
References: <20260404062250.3435419-1-fei.yang@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260404062250.3435419-1-fei.yang@intel.com>
X-ClientProxiedBy: BYAPR02CA0041.namprd02.prod.outlook.com
 (2603:10b6:a03:54::18) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB8594:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b2f8591-30d9-4f63-3c0e-08de941fbb69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: FKkDAfoYdEuZU95/QLOecKWZjK1Fk8MaR3HyHDKegCLARzYP6Mc39OenWKoVcy5DGJJIosDZlMCGs2H3ywuz4vAYj0E+8Vp9VyoOP34ERd+tD20ZUVwdgMS4lkmvfXzFGNhn2vAia+7F2BUxVyIgBp2sPRnlx1f0g9UXAdOL7qjw27S4JVXRMgHu8TjErZowbCqsLvDIRQyKUBD+A1BetSw0Io2/LUHxEtEAyj7Z4YiSqP5I/xE7Ym/BaCMZI5/fqM2j3v3WfWoU3xRG0fGJfnxJVBxirT0PS3G0EGNPk+mXasaKUSINmDbGThuPWylSuBJDwd3D0cWlefwja+Ch66ThCvdDL4qStE3cFQ+nLjwTo2IxBi59zBPGWpSzkCC+cCjbiu5KnCYVjSwzxP3R3+HvqJjbP24oYzi0u8jvcosDO+Uj6lWY3XDZLfFpfUNLAd6nOsWwJWINUu5Hwo2IFusQICleSm+xUSxknKkrnzMMYJX7WpHuCsE0L03Ri/lFzJJtrWpB2XXEnv8sh00qe7iHT/NcPSmAk3RIdN8KtVZXLchi2xrh44bQt634URvZDnVmZYNpf09AIInIuewHBJVNK6/k9lGy6KZsqcZbzpqwBXnj5QPg2WQf7LkLwwnUhkXVNos7+Vmc/TVpuL+yJzk5svkGAe0+BLbsizQ2BHXz1jtf7LICcyJalmbHqZn5TjL1KeuTX/bMM5odSFF5SGzGoAPB+bPvQq+E+T/XSmk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?WN2Qt08LlIeuwNOEKCG/Fe6tnV0bpelJO3OeTUVDWHOGKe6xv4+uk7W0xr?=
 =?iso-8859-1?Q?yxwK6rLb2fnygiIL0TvK5VjspyliEpK28AePghCrYuLHEGojp5UfNNFj4y?=
 =?iso-8859-1?Q?wCL/cwK9p8BlMHRjMCqW/msB8tAvlensLoNB11xbJh6VF8ZvasPM4hdazf?=
 =?iso-8859-1?Q?6/iGKc7iPvp1Mf45busOKOJssOoh9IqCusoqKb1VVlx1zvsFTxSt7jKkRU?=
 =?iso-8859-1?Q?jIY3PxwuIaxBIGdFSCayoDWesMbxQg0CMexqIPU1OQ/acyxwFwckav5ORe?=
 =?iso-8859-1?Q?VBjA8F5L+U38J72Sy481Pp1Rd3DsS8xOcX28aHNfog4mMM48CiQCvQWhiI?=
 =?iso-8859-1?Q?bxymzNPnjl5LmWPXYAVSnerwXOWVgrZsmz/r6XOYecAAo+OXwqO2iGj8MB?=
 =?iso-8859-1?Q?Gp/2NHQ4cRYJG/tdaV9aB6ACajFGwGoh4MlbXzQrkyhV2X/0WOufrTzx7n?=
 =?iso-8859-1?Q?5mMsxMMJDrf9w62kYVYqbulyRrONF1ZBpRR6lXkdE2ZHghXuMFb72LJcW8?=
 =?iso-8859-1?Q?7nmtZeT+xb8X7dkZlVK9vGgq8zRVdk8GrI/1LVNbvaB7lChvUw7mifYkeu?=
 =?iso-8859-1?Q?Bds6DWN4LWN4Wvbap/u0haYAjK/XPToAU1nrJfGjEJDg/hYdnHLtv+T4wa?=
 =?iso-8859-1?Q?RW8sK4anrjAJiSk+ASuPpD1ZA/q56aHQVRUibG/WzF1MpcM+TGkKNxn2JU?=
 =?iso-8859-1?Q?jFa447xxi1MhRFm0tBQDLs6JSkUxV05JV+gCcisECxTxlBRthYPAiUMwi+?=
 =?iso-8859-1?Q?FJj339gUbxAb8d09q4eiTTdKJlD/7FST3vyhv8yJh3rcwhaVxI7AD7mnJe?=
 =?iso-8859-1?Q?wAUlo0zFnn7FMYPFf+Kj35upmSM7VgdrIbfTxT3FdACDKu+yaGUsPKllFb?=
 =?iso-8859-1?Q?umlONz5krIKAKnJ9KQWfsUlOTPm7+XC5O0YcK+0XzN2q9qLY4mhtgHb18z?=
 =?iso-8859-1?Q?Xdx/i8t/yEt6qi1nyyt4fxsd3l4aghgcGZZ/CWC/AsLCxMSlzf4HjVXqGJ?=
 =?iso-8859-1?Q?z/H0kgDUN2MxY78FYmZxzNQnw3N2eMXF8MkyI8iy1k8hjQmSFDnUAzMnIi?=
 =?iso-8859-1?Q?ItUZp9szjS9L39pHnQKZDUmoTtba6WM8NjrN/YW7dBhuCiikFLq/lmypu6?=
 =?iso-8859-1?Q?NwGb0jAhkY1VzBreU6MGuegZ3x30GozmdPGeIq2ebvToBHFDkjoASgSqMU?=
 =?iso-8859-1?Q?VN4aUO1ZW4H0FlEXhAaZ1GoRGFHPvfOBKFggfftWwNCeggBfyd7nXdw2QT?=
 =?iso-8859-1?Q?CVWG5+YBirBdzwu5lhY3urc/NCOZioHwrkMsGGjte0D1537nalZ9heJHUK?=
 =?iso-8859-1?Q?5++WHXkoNWqx43lh4BPBqYCe9Dvxxv4DTGryeB65h8ZL+KVjIxPZSACkPp?=
 =?iso-8859-1?Q?HhKqq+xBI+NrKE9+l+rvto3zbXJQfW9k6sIVsfz6Xyl95gLoudSoA1YLoJ?=
 =?iso-8859-1?Q?5kSnYMq1Zyu9oFFdiZRrTLiW6mKA36lpuDm5zWtZHczy+nFI5X6ktsVnIC?=
 =?iso-8859-1?Q?o4x1WclEnHtHXNTgwQiilic/uwqQUAGSTcfTyRldojyFbuFuNuDKIuaRuZ?=
 =?iso-8859-1?Q?jkmhcNIm5KTd6lRkACQ+ku90/R5E3hrgad9DKrYyJrAqxiFhsm4ArkwzSR?=
 =?iso-8859-1?Q?fkRp5a7DafxsYzUwINBBN5t7h3e4QE+kvgQXLKd8Db1vkOxP1thuTBp49/?=
 =?iso-8859-1?Q?Yib0qBjHFItKtrpGR2Pvb/4oa2cR97LSPCEtxBE4uTHaEae+jY7JDXkgFK?=
 =?iso-8859-1?Q?HDQlIDQtRu+0tKArh8KeUrAKTGhvGtJWFl4C12v10zmJQ+2ATwsid/13jq?=
 =?iso-8859-1?Q?CfLcFKbIz87HDR41hHwwQP5716ZYxR8=3D?=
X-Exchange-RoutingPolicyChecked: AsAMGu+vFk32B3zmtB2aNaSwiZ3hZLaZKYcx7L+8pakrE48pofBhwtQ9ppZC/wKvGJ81ww2rQV4aCN5epzQEaDWyDxNjwEIpHUAwPWy1x7Rp2JQKFO2MAI1Oj2yi8QtLkn4Daa+TXL1gCIimMs6LhAaTd2tD2D/DDxPRlP1Xtp2ZyZ97byJeHU+UJRdz2BDlWv4mwtFiKrA++X4IxROJeSBlDqY959zdwWyISzndhoxMeyar9JmwZUupHl/C/4adskTQQGYOdt6Jx0nTy3W7hoXYONB6G40iWkWPZIa2b91UR4h6k8fFyu68mScMkUUVJvpu7jToFZ36+1ax5mE1pw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b2f8591-30d9-4f63-3c0e-08de941fbb69
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 21:01:54.4242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X8Xk7nlj1/Q06/NbZi1JCJmTbnlIk47T2jddadugOOvmRKdB6Qm+fY0/jf/CUaVrtLF++d4BrjX6Z1dsrXC5cnNfanoICnrroWXo1zSkArs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8594
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

On Fri, Apr 03, 2026 at 11:22:49PM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> Hardware requires the software to poll the valid bit and make sure it's
> cleared before issuing a new TLB invalidation request.
> We also need to avoid racing against GuC on TLB invalidations by only
> allowing KMD to issue TLB invalidation request during GuC reset.
> 
> v2: separate ggtt inval to xe_gam_port and call in guc_reset only (Matt)
> 
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile           |  1 +
>  drivers/gpu/drm/xe/xe_gam_port.c      | 72 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gam_port.h      | 15 ++++++
>  drivers/gpu/drm/xe/xe_gt.c            |  1 +
>  drivers/gpu/drm/xe/xe_gt_types.h      |  7 +++
>  drivers/gpu/drm/xe/xe_guc.c           |  4 ++
>  drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 18 -------
>  7 files changed, 100 insertions(+), 18 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_gam_port.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gam_port.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index f9abaf687d46..96127ad60e9b 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -78,6 +78,7 @@ xe-y += xe_bb.o \
>  	xe_guc_rc.o \
>  	xe_guc_submit.o \
>  	xe_guc_tlb_inval.o \
> +	xe_gam_port.o \
>  	xe_heci_gsc.o \
>  	xe_huc.o \
>  	xe_hw_engine.o \
> diff --git a/drivers/gpu/drm/xe/xe_gam_port.c b/drivers/gpu/drm/xe/xe_gam_port.c
> new file mode 100644
> index 000000000000..137887cf93b8
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gam_port.c
> @@ -0,0 +1,72 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_gt_stats.h"
> +#include "xe_gt_types.h"
> +#include "xe_gt_printk.h"
> +#include "xe_mmio.h"
> +#include "xe_gam_port.h"
> +
> +#include "regs/xe_guc_regs.h"
> +
> +/*
> + * GGTT TLB invalidation as part of GuC reset flow while the communication
> + * between host and GuC is disabled.
> + */
> +
> +int xe_gam_port_tlb_inval_ggtt(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_mmio *mmio = &gt->mmio;
> +	int ret = 0;
> +
> +	spin_lock(&gt->mmio_tlb_invl_lock);
> +
> +	if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
> +		/* Wait 1-second for the valid bit to be cleared */
> +		ret = xe_mmio_wait32(mmio, PVC_GUC_TLB_INV_DESC0, PVC_GUC_TLB_INV_DESC0_VALID,
> +				     0, 1000 * USEC_PER_MSEC, NULL, true);
> +		if (ret) {
> +			ret = -ECANCELED;
> +			goto out;
> +		}
> +
> +		xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC1, PVC_GUC_TLB_INV_DESC1_INVALIDATE);
> +		xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC0, PVC_GUC_TLB_INV_DESC0_VALID);
> +
> +		/* Wait 1-second for the valid bit to be cleared */
> +		ret = xe_mmio_wait32(mmio, PVC_GUC_TLB_INV_DESC0, PVC_GUC_TLB_INV_DESC0_VALID,
> +				     0, 1000 * USEC_PER_MSEC, NULL, true);
> +		if (ret) {
> +			ret = -ECANCELED;
> +			goto out;
> +		}
> +	} else {
> +		/* Wait 1-second for the valid bit to be cleared */
> +		ret = xe_mmio_wait32(mmio, GUC_TLB_INV_CR, GUC_TLB_INV_CR_INVALIDATE,
> +				     0, 1000 * USEC_PER_MSEC, NULL, true);
> +		if (ret) {
> +			ret = -ECANCELED;
> +			goto out;
> +		}
> +
> +		xe_mmio_write32(mmio, GUC_TLB_INV_CR, GUC_TLB_INV_CR_INVALIDATE);
> +
> +		/* Wait 1-second for the valid bit to be cleared */
> +		ret = xe_mmio_wait32(mmio, GUC_TLB_INV_CR, GUC_TLB_INV_CR_INVALIDATE,
> +				     0, 1000 * USEC_PER_MSEC, NULL, true);
> +		if (ret) {
> +			ret = -ECANCELED;
> +			goto out;
> +		}
> +	}
> +
> +out:
> +	spin_unlock(&gt->mmio_tlb_invl_lock);
> +
> +	if (ret)
> +		xe_gt_warn(gt, "TLB INVAL cancelled due to uncleared valid bit\n");
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gam_port.h b/drivers/gpu/drm/xe/xe_gam_port.h
> new file mode 100644
> index 000000000000..b5c383d635f1
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gam_port.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_GAM_PORT_H_
> +#define _XE_GAM_PORT_H_
> +
> +#include <linux/types.h>
> +
> +struct xe_gt;
> +
> +int xe_gam_port_tlb_inval_ggtt(struct xe_gt *gt);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 8a31c963c372..6bb990069eff 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -514,6 +514,7 @@ int xe_gt_init_early(struct xe_gt *gt)
>  
>  	xe_force_wake_init_gt(gt, gt_to_fw(gt));
>  	spin_lock_init(&gt->global_invl_lock);
> +	spin_lock_init(&gt->mmio_tlb_invl_lock);
>  
>  	err = xe_gt_tlb_inval_init_early(gt);
>  	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 8b55cf25a75f..2418a0b2f19c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -324,6 +324,13 @@ struct xe_gt {
>  	 */
>  	spinlock_t global_invl_lock;
>  
> +	/**
> +	 * @mmio_tlb_invl_lock: prevents back to back TLB invalidation
> +	 *    without polling for hardware clearance for the previous
> +	 *    invalidation
> +	 */
> +	spinlock_t mmio_tlb_invl_lock;
> +
>  	/** @wa_active: keep track of active workarounds */
>  	struct {
>  		/** @wa_active.gt: bitmap with active GT workarounds */
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index e762eada21db..70eff5b22fbb 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -48,6 +48,7 @@
>  #include "xe_uc_fw.h"
>  #include "xe_wa.h"
>  #include "xe_wopcm.h"
> +#include "xe_gam_port.h"
>  
>  static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
>  			    struct xe_bo *bo)
> @@ -991,6 +992,9 @@ int xe_guc_reset(struct xe_guc *guc)
>  		goto err_out;
>  	}
>  
> +	if (xe_gam_port_tlb_inval_ggtt(gt))
> +		xe_gt_warn(gt, "GGTT TLB invalidation timed out\n");
> +
>  	return 0;
>  
>  err_out:
> diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> index ced58f46f846..7c3e63e49760 100644
> --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> @@ -61,8 +61,6 @@ static int send_tlb_inval_all(struct xe_tlb_inval *tlb_inval, u32 seqno)
>  static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
>  {
>  	struct xe_guc *guc = tlb_inval->private;
> -	struct xe_gt *gt = guc_to_gt(guc);
> -	struct xe_device *xe = guc_to_xe(guc);
>  
>  	/*
>  	 * Returning -ECANCELED in this function is squashed at the caller and
> @@ -77,22 +75,6 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
>  		};
>  
>  		return send_tlb_inval(guc, action, ARRAY_SIZE(action));
> -	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
> -		struct xe_mmio *mmio = &gt->mmio;
> -
> -		if (IS_SRIOV_VF(xe))
> -			return -ECANCELED;
> -
> -		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
> -		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
> -			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC1,
> -					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
> -			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC0,
> -					PVC_GUC_TLB_INV_DESC0_VALID);
> -		} else {
> -			xe_mmio_write32(mmio, GUC_TLB_INV_CR,
> -					GUC_TLB_INV_CR_INVALIDATE);
> -		}

It's not clear to me why it's safe to remove this.  Aren't we still
required to do GGTT invalidations during initial device probe, before
we're at the point where the CT is running and we can start asking the
GuC to do it on our behalf?  We allocate and map various buffers into
the GGTT in order to get the GuC firmware itself loaded and running, so
if we're not doing invalidations on those, I'm not sure the GuC
initialization itself will work?

Is there an assumption that something else like an FLR already did the
invalidation for us and it's safe to update with GGTT without doing
further invalidations?  If so, it would be good to explain those flows
in more detail in the commit message.


Matt

>  	}
>  
>  	return -ECANCELED;
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
