Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83904C0218F
	for <intel-xe@archiver.kernel.org>; Sat,  1 Feb 2025 00:23:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE4D10E0F7;
	Sat,  1 Feb 2025 00:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cK2EcVYS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7BC610E0F7
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Feb 2025 00:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738369422; x=1769905422;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kP/35y29Lpz/U8jwpz8Nmcw19UFuPdAxpllMEB4qwl8=;
 b=cK2EcVYSiIfgBpQm0x2UPwOQJQd7z8ng4PIxyDIVlYO4mAyTmRVmBXWA
 BET1/a4PiStFam2mKjWMse+G6pCf2mVZSYcU5OmJUWdDYjuZjDG/EBETS
 PXax0X1JB0bg+GQWJaq42Fk2qJT7+haWEyYQ/8hU4Rpj6h9LUXnR+r1oJ
 ddowFHtfnI07ly9SKtKoH075URkwufmMgPhNOtTL9KWxTtnWD7b1UAb2v
 rUCb3I5/SRdepI6rSWldl7rMjWoCKyFOWzwY5570S0aXdClNDmTigq2Jn
 JmdJCyOP5TimQXHMdyGkA/tjATyj6XtmZhWHq1ZLNQUF5ntt9pqEdpeCu A==;
X-CSE-ConnectionGUID: 5a/SxuVWTsuZHmzgeSvtSw==
X-CSE-MsgGUID: LwYBQfXYQf6Z6HSZLRBphg==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38836523"
X-IronPort-AV: E=Sophos;i="6.13,250,1732608000"; d="scan'208";a="38836523"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 16:23:42 -0800
X-CSE-ConnectionGUID: rp8cNzymQxyQUitwCQufmQ==
X-CSE-MsgGUID: Gv5zerWzQt+PV6V92J+qLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114911146"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2025 16:23:43 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 31 Jan 2025 16:23:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 31 Jan 2025 16:23:42 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 31 Jan 2025 16:23:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u3dgMc7e6H3xge2516JWskmhYQy4XmALgJ5AUbr/uM3SOWcJtFvP0sPibrVqQ6rTulWx7o6KxhBqPwZ2bLY7HsfFUWL44ItbQbyGFF9ckDxgzj4PsRatWS6I+LoHgAHDjK0hlPZa4YX7mFLLdVfyUhGZ7KczyNKqusVYT94F97yTSqQWBn7AR5H47vEIxPArTqu74PUO+96hbw7biqv3LamWAHwfrCn1LkL0JoA71AQNK0bWkPSpZD0fkbQSVCDBCA9/KcjlvXARLc0+1B3y1rE7kSX3sYIojN1dsnBPfyJtU5Lxfwy2Ta7K3FPHv0WGZMOAKKWkkhpOajHuHfSK2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+RyB6CIUE2/j4yDjtF8e5+Y3QIw2MDlaV9cqZg6fCs=;
 b=dGmDZ4qF+eHRxnSaqpXP9aSD0SoHUjswWgXso1D9rGe5R5Dp5pRfILgv58jEiYb9nXWPcmZq1c68fixmS29w3AQa60KErLpWNdBVA4pZJo92evuPvPHBMNdv7wBVLC9PU6CHDx2Fr8yCmjsCRAh1lBwTqLvLU0GDWwgigb5HQCp5vRgRHD448DDyMHwZR1eRA+Q7euX8hvjrd9s6P+PdLg4NR2oFv44jEex1G9o7MnUbjpPX93Nq9MSBuBcKb2ryXXrE3Cf5dg+O31tNLNDrgsNTeD539zP1alooM5D3XXB0kRlzh5GVedSmM4rKspMEp870iV9BLQLQ2Q9YVjzepw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4864.namprd11.prod.outlook.com (2603:10b6:a03:2d4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Sat, 1 Feb
 2025 00:23:07 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8398.018; Sat, 1 Feb 2025
 00:23:07 +0000
Date: Fri, 31 Jan 2025 18:23:05 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v4 7/8] drm/xe/xe_pmu: Add pmu support for per-function
 engine activity stats
Message-ID: <fvycaneavttc4bj2ue22oa4tguepz7dtyr3stmibs3pd7yeofe@s7dzrdswg6kv>
References: <20250129101653.1976699-1-riana.tauro@intel.com>
 <20250129101653.1976699-8-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250129101653.1976699-8-riana.tauro@intel.com>
X-ClientProxiedBy: MW2PR2101CA0031.namprd21.prod.outlook.com
 (2603:10b6:302:1::44) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4864:EE_
X-MS-Office365-Filtering-Correlation-Id: 1800f02d-1a11-4e14-09bd-08dd425699ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?n1VWz9CzkIWAIkjvRDLxDRb9ABPovC7TcIBD9g79aYiYbpLc7jGBzhJdxpXb?=
 =?us-ascii?Q?m5ICje4E0aiQY+1xYnGc3gOQQdcSJGXg+03VfHfPtpy7Uqsa87L7HdBkhHO9?=
 =?us-ascii?Q?52sl3SZu8zVoiv7BpIgzCiWBm1ml0LXDXCoUY0tbcjc/btEtcnxyDccGISOq?=
 =?us-ascii?Q?u1dKl42duB+PlzOJ0JbMp+fnSfV4apUMbWvJma6jut9sKvXhjjgUk2Zzkfu6?=
 =?us-ascii?Q?V4Ueu2W9CFewKUoDE5Pj4FuDJOQXgToeKR+9t/7SYmFXVc+J9gPF0uVEzU/z?=
 =?us-ascii?Q?M5qGayeNameRj2e2J0DyuXqovOMmd7aqDefD7QXortsHe4yeOqayyeL9zVRA?=
 =?us-ascii?Q?OOBG4jde/asApUwpjlW7XWFyQFS9dbjD2UMZLNj9Ga+TLMdqgG1LYr9fPxy3?=
 =?us-ascii?Q?q2qYTXjBXUiAcovbNtKxhw6R8CzHhKk7IDATYnbBTWLCGhet3KYklmsKuDxr?=
 =?us-ascii?Q?h1z44/EvrxC3XWsszUKbmrPuX7sONcVDD6JpQcXzLJfZQGA51ZmTg3iEPrGZ?=
 =?us-ascii?Q?7i6XjpFAFhxorfbUM7h8YdgESPZFMVsTdHAdgLowoY3YuPvoktBYsdEd4Th/?=
 =?us-ascii?Q?ZxulKG0T2xvJgQYd60pANwSwCq3dz4KLB6ArM0Q6SbjoZIvJ6DdZTRNxZ9jO?=
 =?us-ascii?Q?+upH8650Fo3k9tY7dQFHWkGWh22iZO21G6ry6tCSZwEUqhv9BipwDS9Kv3HN?=
 =?us-ascii?Q?LaJCKS3TRc12y42OxpHTc9m5kiShS+v1G47jGiaBWTKavww8i5EymPizXbp4?=
 =?us-ascii?Q?GSfPyWejXWaP3yvX08kK5W3Z5XK7DEUSmUQXrASiD3UYWB8pEbDR+Y0vDxhu?=
 =?us-ascii?Q?Qc73wcqIiEHHtXaQ3Je7H/xWwULEwy2PHpntyiVTxEyBmm7h2aJh9ZCYVZd9?=
 =?us-ascii?Q?Q/dn79g4fdeAHnXK/yP6ux9OHYl/lp2fY8c3L4BBqAlhFMMkTb+uUFzLsudS?=
 =?us-ascii?Q?5GMMQbWKApQLJ+eYlQnxMTqREEYEFCEPuxb51IfqaydeHhV+fDmnsKUPGDgW?=
 =?us-ascii?Q?X/0QVIG8kMhp34m0h4bArZnDiHWEEVFFpIzraD8NrqLE+HTSLfU5G2VRDIWM?=
 =?us-ascii?Q?8Li9tg8191leJ39icYKvNL+c/oCuLf4cHAHnHiqNMuFvj8Ko5A0e0EL/8WOz?=
 =?us-ascii?Q?f0y8khMvz9H5jf+1Om1TWUX3lFU22ZIZAflNkte/vKuwRyWikm/m8FlXY2yk?=
 =?us-ascii?Q?dBZ1hsgSlAOIDCM7HxcGxQex6YSRVi63YCP/iiZ4rG0C/qYGK0s+rMb1/b24?=
 =?us-ascii?Q?A++2aRLRgwJMuKhbGvKAn7SXWBJqVgsPFJlNPsGU+c3btyBJGbZpx0DpZoXv?=
 =?us-ascii?Q?OEVfISJUYbDb4u8nqARRIQK8flFIH+87O7BM/0m/t0HpZaB9ZnqqPLShv5tc?=
 =?us-ascii?Q?SheWNC4ElV7OAg1CPyYuxSskm0kn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w7U9kdVReY/6AWeyD0ODnNwoYVzDT1O+OidLGs9BeumbHQkWFwsQ+wJHGpro?=
 =?us-ascii?Q?zD0YSfkGaUWeul7ufX0knlYWBrFhnELgz1fAmOROB5JwgOUYh1dy/+LMgrGY?=
 =?us-ascii?Q?t3U1qyCp0lNSUkJqh8tMIXnMsOLacaaVGYgk/gdExTLnijsCgVma5qanwCt8?=
 =?us-ascii?Q?+E3/9oStYrGn6ymRXplVDhDzkl3VmEbjQcEBbvxdBBqe3uTRRR0j6H8MUSr0?=
 =?us-ascii?Q?TolQgDiCv63wy/zu9EX6F/zjjpllKFxdQXL2nqeO+MWVpg90VBq7zBLn3U3+?=
 =?us-ascii?Q?EsIDx4/kStd7mIsT0lUS8GpvSg2rRYuhzrv8H84HVfPkomysUxqTv3YaOzoE?=
 =?us-ascii?Q?CurUzX2JBd8kz/EpBlTWLwNQmAsyyY5cKC1+DfEgRQ01K2bLTSOKcj2vj0eQ?=
 =?us-ascii?Q?cCHTYuPrgGJaQqEESo/yJmGSb5iS8rY27FxXx9HZYyz1g8TgaIvazpJ2LB09?=
 =?us-ascii?Q?QK4Ozvk5/PxrbZuGIaIYihB8SkWfGwvcpiRwIKwXDJcg/KHS5v26IbUtBDxY?=
 =?us-ascii?Q?ME7wraWUu8kZyooZrO4Q5FUqf9NYCngJfDcJF1yJzM2fx2i0Q419Mmc+YkV5?=
 =?us-ascii?Q?GCD4uKyZQVlGeviJJ8zxnZ3W1tKUpjK8KR/1an7KQvKiTDwyri41G/peASMK?=
 =?us-ascii?Q?kMzMdVyz9jhVQ/uqZnQdwcJv/+xX2+92a5kjoN+ofzvzAMdVAoDKTXUfuWj4?=
 =?us-ascii?Q?sDzpCZPf0ymKFVzH9bMFLyHAlmgomHLat6O9s0lGQMhYoUX+7aiU64fiiust?=
 =?us-ascii?Q?NfUYnF1NN+NJ+7XXMHWTmnYsUc9N2RzEVWqNWH7oRfVjKu85zNDnYVzm2qH2?=
 =?us-ascii?Q?aYxq/W2JnU6d/Vwo9h5FVjOmXOA8dsVkG09i04iVnhp47kBXrO2quBDk5b6k?=
 =?us-ascii?Q?nlKd/1a2zZey9xCjhuMGkeaTKmXY2GCOa/ciL54fB1dnW1LOPOczya/yQJij?=
 =?us-ascii?Q?5qIAd1LwfXxa7p3m0xUo9bPQ8RaSTKAa3jNy51NcpWmGR9kxPVenRUhZy6cB?=
 =?us-ascii?Q?8YRV6VvT261OZMHl265YbOIL2soveLWbhijh3Bo6sBhmOdYNxgzTzUR5s6Ho?=
 =?us-ascii?Q?+Oy/jQJAA/nfWDyVuGCKzcj9VvojI1nFnALj6c+PQslnLRg+ibFDOD/++FTw?=
 =?us-ascii?Q?HpYwx9GLcXIXxZ4XGweIlHPaCIfqWOJtOa1MJEt0wB6Z7VD6qzGuvmTIyiER?=
 =?us-ascii?Q?y9XikHrtVG5ZAYbdffykzAIvtdF8WNpmpOrRIfUGEjqDnMzcNiRlAEDw1Ibx?=
 =?us-ascii?Q?h5vrBUttnj5rhrEgfKe7QoKn82/qve9V54VcMvWG7ReRJWX1ID68vOUwV1JV?=
 =?us-ascii?Q?0eZEAGAB/e1IzX0Ionzns2Ej8K8/g2AsiIXUYdXtnR10N9eD/E4cRV0PKa63?=
 =?us-ascii?Q?ZaHh1lcQpUJyRviGcP+1+OfzvknuEQkBSZVrq8bVaUsP2QGrJOI+SwLYTo8y?=
 =?us-ascii?Q?MjwOBI08ASZpgH761MNTI0MJQyPI5B53bXXkQoHeD819yJzkdcjaN0X6LYCr?=
 =?us-ascii?Q?z4mqJzL7+zgJbrefUM+DFJyGk4dwbsAQp4OtxMuqJwT11p60ZV1iJlHUk8W1?=
 =?us-ascii?Q?3vXCDPsATHM3lmsvqIoVKXYxBiX4PHKSzftf8JEZw3IFssrT2i1BvKrf9pLd?=
 =?us-ascii?Q?4w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1800f02d-1a11-4e14-09bd-08dd425699ef
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2025 00:23:07.6259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dSq5IsXpwjsElXZtqXWjLzstNP101vjH2g/p8q2klnt8lrA2Nu/Qj77IDqj5YuvG9N8iYWgYAwOIeOlx2z3vtoCn6dbI0nVhzZ6hhsT6aU4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4864
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

On Wed, Jan 29, 2025 at 03:46:50PM +0530, Riana Tauro wrote:
>Add pmu support for per-function per-engine-class engine activity
>stats.
>
>per-function per-engine-class activity is enabled when num_vfs
>are set. If num_vfs is set to 2, then the applicable function ids
>are
>
>0 - Global per-engine-class activity
>1 - PF per-engine-class activity
>2,3 - per-VF per-engine-class activity from PF

IMO that's super confusing. The pci function is already part of the
pmu name and hence event source:

	/sys/bus/event_source/devices/xe_0000_00_02.0
					 function --^

in a pf/vf scenario, what's the point of the global one?
Also is it monitoring per-vf, all vfs or what? The interface looks
confusing.


>
>This can be read from perf tool as shown below
>
>./perf stat -e xe_<bdf>/engine-active-ticks,gt=0,engine_class=0,
>			 engine_instance=0,function=1/ -I 1000
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> drivers/gpu/drm/xe/xe_pmu.c | 45 ++++++++++++++++++++++++++++++-------
> 1 file changed, 37 insertions(+), 8 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>index 15e9a57aa429..2968fc9a358c 100644
>--- a/drivers/gpu/drm/xe/xe_pmu.c
>+++ b/drivers/gpu/drm/xe/xe_pmu.c
>@@ -12,6 +12,7 @@
> #include "xe_hw_engine.h"
> #include "xe_pm.h"
> #include "xe_pmu.h"
>+#include "xe_sriov_pf_helpers.h"
>
> /**
>  * DOC: Xe PMU (Performance Monitoring Unit)
>@@ -29,15 +30,21 @@
>  *
>  *        60        56        52        48        44        40        36        32
>  * | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - |
>- *   [ gt ]
>+ *   [ gt ]    [             function              ]
>  *
>  *        28        24        20        16        12         8         4         0
>  * | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - |
>  *            [   engine_class  ] [ engine_instance ] [         event             ]

I usually like ascii art, but I'm not sure this buys us anything
compared to the GENMASKs below, particularly because they don't apply to
all events and they are **not** set in stone. Userspace is supposed to
read from sysfs what are the bits correspond to each parameter.

Lucas De Marchi

>  *
>- * engine_class and engine_instance bits will be applicable for
>+ * function, engine_class and engine_instance bits will be applicable for
>  * per-engine-class activity events (engine-active-ticks, engine-total-ticks)
>  *
>+ * Function id applicable for per-engine-class activity
>+ *
>+ * 0 - global per-engine-class activity
>+ * 1 - PF per-engine-class activity
>+ * 2 .. (num_vfs + 1) - per-VF per-engine-class activity from PF
>+ *
>  * The standard perf tool can be used to grep for a certain event as well.
>  * Example:
>  *
>@@ -49,6 +56,7 @@
>  */
>
> #define XE_PMU_EVENT_GT_MASK			GENMASK_ULL(63, 60)
>+#define XE_PMU_EVENT_FUNCTION_MASK		GENMASK_ULL(59, 44)
> #define XE_PMU_EVENT_ENGINE_CLASS_MASK		GENMASK_ULL(27, 20)
> #define XE_PMU_EVENT_ENGINE_INSTANCE_MASK	GENMASK_ULL(19, 12)
> #define XE_PMU_EVENT_ID_MASK			GENMASK_ULL(11, 0)
>@@ -58,6 +66,11 @@ static unsigned int config_to_event_id(u64 config)
> 	return FIELD_GET(XE_PMU_EVENT_ID_MASK, config);
> }
>
>+static unsigned int config_to_function_id(u64 config)
>+{
>+	return FIELD_GET(XE_PMU_EVENT_FUNCTION_MASK, config);
>+}
>+
> static unsigned int config_to_engine_class(u64 config)
> {
> 	return FIELD_GET(XE_PMU_EVENT_ENGINE_CLASS_MASK, config);
>@@ -116,7 +129,7 @@ static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
> static bool event_param_valid(struct perf_event *event)
> {
> 	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>-	unsigned int engine_class, engine_instance;
>+	unsigned int engine_class, engine_instance, function_id;
> 	u64 config = event->attr.config;
> 	struct xe_gt *gt;
>
>@@ -124,18 +137,28 @@ static bool event_param_valid(struct perf_event *event)
> 	if (!gt)
> 		return false;
>
>+	function_id = config_to_function_id(config);
>+	if (function_id && !IS_SRIOV_PF(xe))
>+		return false;
>+
> 	engine_class = config_to_engine_class(config);
> 	engine_instance = config_to_engine_instance(config);
>
> 	switch (config_to_event_id(config)) {
> 	case XE_PMU_EVENT_GT_C6_RESIDENCY:
>-		if (engine_class || engine_instance)
>+		if (engine_class || engine_instance || function_id)
> 			return false;
> 		break;
> 	case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
> 	case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
> 		if (!event_to_hwe(event))
> 			return false;
>+		/*
>+		 * Two additional functions are required for global(0)
>+		 * and PF(1) when SRIOV is enabled
>+		 */
>+		if (function_id > xe_sriov_pf_get_totalvfs(xe) + 1)
>+			return false;
> 		break;
> 	}
>
>@@ -194,15 +217,19 @@ static u64 read_engine_events(struct perf_event *event)
> {
> 	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
> 	struct xe_hw_engine *hwe;
>-	u64 val = 0;
>+	unsigned int function_id;
>+	u64 val = 0, config;
>+
>+	config = event->attr.config;
>+	function_id = config_to_function_id(config);
>
> 	hwe = event_to_hwe(event);
> 	if (!hwe)
> 		drm_warn(&xe->drm, "unknown pmu engine\n");
>-	else if (config_to_event_id(event->attr.config) == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS)
>-		val = xe_guc_engine_activity_active_ticks(hwe, 0);
>+	else if (config_to_event_id(config) == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS)
>+		val = xe_guc_engine_activity_active_ticks(hwe, function_id);
> 	else
>-		val = xe_guc_engine_activity_total_ticks(hwe, 0);
>+		val = xe_guc_engine_activity_total_ticks(hwe, function_id);
>
> 	return val;
> }
>@@ -305,6 +332,7 @@ static void xe_pmu_event_del(struct perf_event *event, int flags)
> }
>
> PMU_FORMAT_ATTR(gt,			"config:60-63");
>+PMU_FORMAT_ATTR(function,		"config:44-59");
> PMU_FORMAT_ATTR(engine_class,		"config:20-27");
> PMU_FORMAT_ATTR(engine_instance,	"config:12-19");
> PMU_FORMAT_ATTR(event,			"config:0-11");
>@@ -313,6 +341,7 @@ static struct attribute *pmu_format_attrs[] = {
> 	&format_attr_event.attr,
> 	&format_attr_engine_class.attr,
> 	&format_attr_engine_instance.attr,
>+	&format_attr_function.attr,
> 	&format_attr_gt.attr,
> 	NULL,
> };
>-- 
>2.47.1
>
