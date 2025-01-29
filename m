Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D73C0218D
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 18:14:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB53810E12B;
	Wed, 29 Jan 2025 18:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A89kIBQq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C9410E12B
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jan 2025 18:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738174478; x=1769710478;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wujYyuWM8rDyEKX+SFZm4x1swCFDiLEkLNb+7S49DgU=;
 b=A89kIBQq9n70pexTsot0HmnzxGjfYNcL157xz7ruD/0FmK+wigFhTq28
 h+PN32aUOJ6hjur3X51PVbTi71x8qnt4ttxkY16uZem0GkMHOZ1e2AP7c
 22smWthuNc+Tvbre1/Ti3NN5r/5VTFXnf5hTCptrXTBlBtiEiJI+uk7gD
 2DSPSRMl7hWYGbSmQLgr8bjcAhew10dcYijaSs89RexSv/Al8KsZ4fF/t
 PImlpJqtd3+NJQFR5AtJ58brh7MbFdGQ0OICqy/x1FB88EUKn9SeMo/3Y
 KaHDtT39fuaATPshQspmL0AlHYVYoh/xPXYyyyLf77PRIIrTvqp2GURfT w==;
X-CSE-ConnectionGUID: X+xHU0sqTe2cQtaUaq63vg==
X-CSE-MsgGUID: 0jBtwHGcR6aCbtu5P2zorg==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="41541486"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="41541486"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 10:14:04 -0800
X-CSE-ConnectionGUID: 8MqlPZQ1RJ68kykwpH1BfQ==
X-CSE-MsgGUID: 8Vu8jwFsTqaTXwZw3W127w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="109686453"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2025 10:14:03 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 10:14:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 10:14:02 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 10:14:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dgOn/lCHFds47nfk7HKuajY7wUdCYCR7PnqZwADn7L1lz0Iy90QLJoqNiJzjtG/FytG5xN5t61geF+u18r2baNMKYUJSZTloTpAyPSW9AZ1GOLTzh8D6uPEkDtmYXZk7Bz3zY1vPogvmTZ2weEviso8J8MVFpkglr8SQcZUux7WrCrr6NhhitqXOp+wARgLCVxmWVUncPwJEMLokfRF94C3m37ztVT2GB2Bd3eApmrfolzZlAgCaoH9cB9XqA8e4/BFv97c3RNzKKw8aAgquIKT7nblFWLNQvtuVZCIK9Fs8tsyxkK2YlhcZdxXhF6oCphgx82Op7MMe6HXZF0o6Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NSmOx9s4/IhD9fFza+Gl5tUzJHDEEZJP5TfmlyBs6No=;
 b=mErrmV+qic0g18nDQGmr/U+xq9k6Zb93MpaNMc1ooBJLfsXJMHQQ9RoyvZgyx0T/ilY79/WzLb4AMgyS7FUV70FzNYIu9Tt/j2RZq/0YmS4s7Gtu0I1JDJWqeUNLZ1AfWcOwcRyrgT1H0YSVhD/OHwMSUjAn8oOhdqIy1F3BYJNP69DOHlYHc4NX3xI5uBC9m5OS/XWgUchTMryv3pjN55w16NkucqKtdYmRYZG6jm8eiPkOK1wdRueBDQMybv/+PWPKdfzcs5t8B7JJ7Z3rxvXBLK+otxYEmDmAEHXhb0w7vRF22BaLNyJZSovyIxdcujaqCGg6L1jl+CJMLNyejQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV3PR11MB8696.namprd11.prod.outlook.com (2603:10b6:408:216::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Wed, 29 Jan
 2025 18:13:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 18:13:33 +0000
Date: Wed, 29 Jan 2025 10:14:29 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/gt_pagefault: Print engine class string
Message-ID: <Z5pwBX4feHBFBYkW@lstrano-desk.jf.intel.com>
References: <20250129175241.338043-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250129175241.338043-1-francois.dugast@intel.com>
X-ClientProxiedBy: MW4PR04CA0370.namprd04.prod.outlook.com
 (2603:10b6:303:81::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV3PR11MB8696:EE_
X-MS-Office365-Filtering-Correlation-Id: 4faafd79-5454-4f64-0f3c-08dd4090a409
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s9ETmAfwW3NGmbNo6SZmJc1dE6pUlKDbgm80DeOzSNN+dWcVdkHRdr4EBBEN?=
 =?us-ascii?Q?wWsa3talyFeSju0t9RVbQsTFSd/4Qy5n+J32l90IwVmeArpXB09j2ljGceAj?=
 =?us-ascii?Q?s90yNaHxRfBsJ0M9CUyRoO6yUFPBto+51t9Ja4Qi86GiesTgtV9p+Vfaf4Jv?=
 =?us-ascii?Q?cEhF1m1vvR7ubCikZoJ7hHJWRr1h4hIgfTJ507PVsPsHeAusPJL2jW0XrtX4?=
 =?us-ascii?Q?qmO0TtQysYq1G8lL4/StK7+r73/oEkFkMGyMdstfxUIecasZOv3ieqcIqCEl?=
 =?us-ascii?Q?w3JG1zEit2BAkLUYe6qo4R1yL7SsWVwI6+/ioyq4kleuJ46sPXSjt/NX1pY+?=
 =?us-ascii?Q?bzFVm14Qcs9OyuVjLaOAVxr7N5+MDQ1FbUgaDS7DerHQpnvqQx4RqZgBNI9h?=
 =?us-ascii?Q?FttFh2dbYqwj1NYJf65UU5c+sgZ+UeVsJRNOHjFb1ncwBt8e0pginrp52KXW?=
 =?us-ascii?Q?Kn8318ln17U13vNmCJQGfy82rmzwF6tUxPrRDFcAix2M8oE0M69YFu46STev?=
 =?us-ascii?Q?y8JA9IPkHogDl1Y+WVjfQ9zA94VGKoMflWkhfglDlg0+F+tIh71E08MYF+Te?=
 =?us-ascii?Q?Cr6HUzgV8e7eeG2Lqx52r15RgQT7Hl98p/Wu39i/4zJsa++DAApjDuiapqpg?=
 =?us-ascii?Q?PBPTjNR3ExOgeG8OFomDfuoUE1tcq8l6RNgP2YYvC/UZs538WlPUy8yWpvTp?=
 =?us-ascii?Q?CmvaYSi0gDe6OP2/H8zMcnkT3xqWi9bqCJpyh3mriu9gxTSumRuQy9zMcQFD?=
 =?us-ascii?Q?sZRvpNZaHw+9dz9TusB/WEhspoY37beiwd20ogvom06ekygQH9Hs8w/9n9ZB?=
 =?us-ascii?Q?r561YkLttbc96L0Uyv4UH059y5SYNMweUGNDz7lR7oMCLu+3kfUe9e1oDVgk?=
 =?us-ascii?Q?yJWdNcwdEAPYtC0E/clV8hpZY4f2ORbEthqhmLhgQp2gtdMo3GljUpxZDhIc?=
 =?us-ascii?Q?kClfrdAf+H0xlBBA/qm714FUP1P+JuOGdx83lZgruF1XUoF9MN60dG5659/1?=
 =?us-ascii?Q?LVfouOdWNolcvp4XWSHnZTqxzL0Ei+JLV8cnVzZESGvXrbte+LMC7tyAl740?=
 =?us-ascii?Q?b/2HTORz3vZVSIU1JRHgbPt0Ojj+/ZOlNZsQlYsVkyygyI0H19acuttd6CWE?=
 =?us-ascii?Q?Xf0UzEjCkvlrwPEhfXvx8AFIQJQrpl/O3qCwQIB161YbDcp3Hi9AqjEwuqtC?=
 =?us-ascii?Q?YlTFkwk4KYWiaKF5Cqsl86KEzb6CoErZSx5DyDfFmrwOeLKyZM/EuCm0bNIt?=
 =?us-ascii?Q?n73KRl3OQCeX4p4jg2XqeyIxnSDvlFZiw2bYqJ+QZRezM4zmXT+P6iSVE8YQ?=
 =?us-ascii?Q?p0PjjHzHVempMgVWLQ/mbhnysMTYzPnhbD7sbtddlKDP0L8C2pCwOyK8ir5e?=
 =?us-ascii?Q?otBRngkKMnsCRcx+2uiK86xLIW8G?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xOHvUttnvQz3IkrOvzFK2x4Ek78pFXC3ydaBpTr0ax7men+GL3AW3lRCMK9S?=
 =?us-ascii?Q?JiHuSUZvz3N8S88+GmXFWHwbWawtKWR+u2NgKEwDuBQvEjaN0uRpdfLAIoH7?=
 =?us-ascii?Q?aP9ZEzV2pg4Q8asen8v3AJ+HWovNIfvBWnUsbPRQZd94O+PFEnhI/8QeBVrK?=
 =?us-ascii?Q?9BCPW+fjzxbbViSIuNbWFnhD+AD9Qb8EV6Q81CU53TZXO8H2iKXfHYAwRMsP?=
 =?us-ascii?Q?52nd9jLK8pny0fjZ/L5Vvyx2HDNztj/2uZ8mFxXk5XErcDDA7mKLj2J5BLT7?=
 =?us-ascii?Q?si1YCKMgAOQN9GrDDl9P6Al3YrMRBV6Er0TTlIO/V8WIqy7W0mOeh9Me25nF?=
 =?us-ascii?Q?pwPpTPlj+ZUGvVyXu4b0MZBMIn1b8qsc42DG2vbX2HnQ1uG2Vp/66qO6t7Gd?=
 =?us-ascii?Q?rSRWoE83Y8pHeALhBmDAln9NV9YnZJLl2QMEUSV3xKwWpAJYOCFLrlvq6oF3?=
 =?us-ascii?Q?46hfJJBxobJ+aq1UV+e0+GbsIGFy8tvbNCb/eeSKLW7/oEyn23J3WSZROpBr?=
 =?us-ascii?Q?SpUvSMC+FKljWhd0nMv/yUWFQJUJor3B+jhO4vLO7Z0pyacEbW9WYRTgdHjm?=
 =?us-ascii?Q?HjGfVlMCavZpO66BjDsmHRowyu4he8vcGp1ENsRZIeL+Ywrpi2WjSKm00OeU?=
 =?us-ascii?Q?rQW6vjnGjCHR4uh2zZgHFYeOwJLUFEBZhKANp46VxlFQOZoRQu2f5U6klH51?=
 =?us-ascii?Q?H3syDYclZvwMTcPoT7mGQJu8CSlFI4s6CDiLFd8p01CTJKh4uYVpOyqo0HUk?=
 =?us-ascii?Q?e0F4sCDYrWVZeev3moyGxdqDC23mJao5vj/rdx4+brHozSh0WF+4JQUGrUpv?=
 =?us-ascii?Q?npRWCGGZnuveqUd5WEG1or1RKkiLDh+I36EDiD7Bfg1DLcclGMS1HaajF3Oz?=
 =?us-ascii?Q?9JoY4gmfiFGxjd+Ifge9HtgjRXmt5aQPzDnlLV0ONbcYJe5MjasooVuWIMkE?=
 =?us-ascii?Q?kyS8rINZ0O0IenOJOAwehGwjAOmnoj5Nhg6v23FyYw6p205J8i1Ys8zZgNIh?=
 =?us-ascii?Q?1AVjQINwi3UpCJBaLef2UN9NpbcE/HOwY4UvPApF2MZE7Vqy0qSFiLc/qB+x?=
 =?us-ascii?Q?XxTc9f1XAKmSNILDjGjY0EGTeO6ZhCtIgk7HwHQxmLd40dvyPCrBXSeXE8oy?=
 =?us-ascii?Q?yBOtC84Pk5IFPI2pMOSJG7fGWfNd+GnzQ48iw9oZYaegHoDQqZFWHWcYGom2?=
 =?us-ascii?Q?bsn0Gj6M8mb0iW09Gi1TYwWQUctxqO/wm8XTbMzuRLN2T3/Wi0xfAFDI94oF?=
 =?us-ascii?Q?rUDWg/0zm+ukp7inJ7PTir/pX1rI1VaGHF/hmyN9TalwBR4C4BShnl8l2/Bb?=
 =?us-ascii?Q?xXDvcgzYaSoHpn7FaMrHreOTGMsuAuaVfL0P51PkCCam8439ovpT5t11p4it?=
 =?us-ascii?Q?cnju6ao1h4ZfTNwEV4R7yZcxafE3LMx1EyHuwM5DyhE2xifdDbpldkwYIiEj?=
 =?us-ascii?Q?V0sKR+E6c2dr3CjerRctf/FVpRlCkUhT0GiOGeNyDVfz63a0qeFxCV9/a99A?=
 =?us-ascii?Q?720qNb4Dq2xfXqYmoDgYP8+b9K7uSfRa0k7hlwH7bb3CXh4jeRq6rA4G08Oc?=
 =?us-ascii?Q?CR+at6wbUGYa0AzFKkeDDebZXW7yvPsCQgUYTXGmRgVqbqjHSuwK/HYZQXIM?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4faafd79-5454-4f64-0f3c-08dd4090a409
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 18:13:32.9836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iwtL6q1LagflZE+ig1Gzlbb7yWQiR8+/Qpe50CdJz3jIlQPxx73XLpl+/d5z2zlnvuSsGxKuozQJDDUEd68RxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8696
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

On Wed, Jan 29, 2025 at 06:52:41PM +0100, Francois Dugast wrote:
> The engine class index which is printed here is an internal representation
> for debugging. It is _not_ an index based on DRM_XE_ENGINE_CLASS_* values
> provided in the uAPI. Add the string representation of the engine class to
> the output in order to limit possible confusion by users when analyzing the
> logs.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 2606cd396df5..cb92fb5cbc75 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -263,12 +263,13 @@ static void print_pagefault(struct xe_device *xe, struct pagefault *pf)
>  		 "\tFaultType: %d\n"
>  		 "\tAccessType: %d\n"
>  		 "\tFaultLevel: %d\n"
> -		 "\tEngineClass: %d\n"
> +		 "\tEngineClass: %d %s\n"
>  		 "\tEngineInstance: %d\n",
>  		 pf->asid, pf->vfid, pf->pdata, upper_32_bits(pf->page_addr),
>  		 lower_32_bits(pf->page_addr),
>  		 pf->fault_type, pf->access_type, pf->fault_level,
> -		 pf->engine_class, pf->engine_instance);
> +		 pf->engine_class, xe_hw_engine_class_to_str(pf->engine_class),
> +		 pf->engine_instance);
>  }
>  
>  #define PF_MSG_LEN_DW	4
> -- 
> 2.43.0
> 
