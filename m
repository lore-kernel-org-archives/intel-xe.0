Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1225ECEACEF
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 18:30:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C279910E0EE;
	Mon, 17 Nov 2025 18:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Niyv9mcP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C4CE10E0EE
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Nov 2025 18:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763404211; x=1794940211;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wsPvbbZAHk54aC6Wyn/3Np4Lnq9dqslip4YDUa4qmz4=;
 b=Niyv9mcPxjStShoTca2mEuhLTzwiSlrmLssBOfPlJ+9Dx6W5nBTykPKC
 vGuV9xFTULg1AOe+Bf98KVjoWYYjlQOBBbjiO8AD8F8Mrt281cEnffpoP
 KvfdVhqmNAY8JAdBLhCDD9eJTCT8yTcMWMjXPPArVCzhOT7zNgilmQH5f
 HECGrGrtXc9XxluK4oxMe6Vb8H6vWfAVOgpBWJ7PYHmMnTt0OipAktAOA
 FkfIVidAxuEOZ4IHEv15HK1nqcgZ5vDTs2lq5ia0aqlXD1ExkG1tXCqox
 MrJ1Tnuw4ArWrTR7BSAcPRaxKEMNAzVb7992/FbrJUd3qkTf8+zuJo77+ A==;
X-CSE-ConnectionGUID: RS+PTL4dSn66aY0BaPFalA==
X-CSE-MsgGUID: aPAo0jWxReq6/3mecRc8mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65348766"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="65348766"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 10:30:10 -0800
X-CSE-ConnectionGUID: xK5IT2FJR8qwez1FbK5UPg==
X-CSE-MsgGUID: yV2gKlmJTViJ3nLZkQvT6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="189784312"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 10:30:10 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 10:30:09 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 10:30:09 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.23)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 10:30:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sdmob/xVERWoNwaTeYT6JoiJROdJnMR9Gs09RXiy3yn7oZhrKVU135RXjq5HnYw0XOqovDQlet4Tyinlirhy7V/vo1xyT4mj69YAUfqpDh6/15pdzwv34EfMfar8x2wJf7rbF9286YDs1xiiurNVe+pFuT7uJDfpcWFIWELfQk2TAr8QPZTvMBpnAq8YTsb9HDT1TmHNieavMrAHaEJJvs3zdoC+SS/T4n5yni5TECk6g2iVBoQpm4B3m3kvMRxFA+KgG5rDV9IgV0I7rSdV9wld+uJsbSlcF7Zy20UGc3IAMVL+MMF0+yTdC36DNvqSKP9Ifkp3tGst/4fzVQfXgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0DXsw5YDbn3gq4UTSfGtXtRILh/NRumQxufKGCCsxJ0=;
 b=FwkDoLJ+f/Ux0GpicnKEYHXxEv3/RcBLkkffSChHxeMkd/cV3ebe3ne/m8yjZQi/XwIoW1lytBRTcz7AfnaE0G8PizcpmeWfv69DqIo7mFGxlZtvchPtmo7t42SUtIq9xWbZS5bgMJkoHuOh6o7nhUmazbYfcChlPfOut61Ruuu7EdN67ntX/Bnyn7GX3oTD0utM8AVVeBK50R8DyiuY3kuiESKlasSE7bunRtbs7/vboAthT7BUaXcuQCUx1o8Qq3dp0Xqrx2dMVmGSzWFtYfe8wXdrgRns++42wZYBCQnFCmIro86oDAHhvw8zh+OwenXfXlTkK7zxlJIC8B3DXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM3PR11MB8760.namprd11.prod.outlook.com (2603:10b6:0:4b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 18:30:03 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%5]) with mapi id 15.20.9320.013; Mon, 17 Nov 2025
 18:30:02 +0000
Date: Mon, 17 Nov 2025 10:29:58 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe/vf: Shadow buffer management for CCS
 read/write operations
Message-ID: <aRtppjN1eHyxsX/m@lstrano-desk.jf.intel.com>
References: <20251105121151.2680100-1-satyanarayana.k.v.p@intel.com>
 <20251105121151.2680100-3-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251105121151.2680100-3-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4PR04CA0241.namprd04.prod.outlook.com
 (2603:10b6:303:88::6) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM3PR11MB8760:EE_
X-MS-Office365-Filtering-Correlation-Id: e1a0f80b-9cdd-40ac-dfdd-08de26075252
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gkwXVDKlJCmhchr2bHQnxD+TnP5syIrLhjWzyPhr8OOb1YZ5UJmgOw0/dMv2?=
 =?us-ascii?Q?cpuy3NfeEjcwo5iySpmdoveUQobdLQlUWetT1pPh2i46elD8CjM3hJ5O3UKa?=
 =?us-ascii?Q?RSu4C8r7cXKDcivcZ2pfoZhqPx+osbVD909SDaZLj7MM4F7WJNSPLBxh8Up8?=
 =?us-ascii?Q?792AqIzTa4plAO3AkQiknqzRjbUmJNY9OoKCQ8F1h3GZmGK6u/ldPhDlhN8+?=
 =?us-ascii?Q?aFqWwtvGltCwgL52qXqlA81JrnTkKG0ZRvazvOUBZFfCGbMLU4Xwi+zM0c5t?=
 =?us-ascii?Q?I9VjyURlk82vfcKCER0SSYfogEtt8pYmyKQYEoVIgiuYoZAFix/TC6QKDoFn?=
 =?us-ascii?Q?3id8bwIbkZ2BT1Otcu3mfbsVutzjtn+PJkTSTkr9dVOrbXn5gi49YGgE8Dyd?=
 =?us-ascii?Q?7Aat/L6aU+4WmUgHit5vcgcIzPnEG2yfVq9fY+HuL1SqM+LaadzOsRuuXKX4?=
 =?us-ascii?Q?eXLwg2/CNhbEcmLvG8ZGwYLuCAP5+HXbjIBeKt2Ev3Bnc4HkwV7g1hVF9NZ9?=
 =?us-ascii?Q?eByhWlqziJF3epF8cLEezPuIcqW6fRPGPRvr7t13br4JYSm11Sma2BTNCTAR?=
 =?us-ascii?Q?86H8IjRvZb4NQnPDbxCz1KXcSSwCLdk4u/CY8PKeQ+Z8uQZxhupmUM1x5JTn?=
 =?us-ascii?Q?myx3jC+B479ixWyGWmS1rN9xDuVZsegzzPNncBQ8N3T5FwBBXZGcKa95FHuU?=
 =?us-ascii?Q?Fu1s5V9XXL2SbxUTbK7bCmYL61Ho9oOU/d3E45JQ1/PbqpNtaBphJa4avD01?=
 =?us-ascii?Q?Y2x1C+R9SVGrYWCOG1PWG49p9LHb8SEisjTgQeLjnYW+lUcpm/QjleoJYvB6?=
 =?us-ascii?Q?DVTqupySYdCyPQdQaTRCmwXPopx9lmwAu4Vq5tQTF+F9nsG3Q7ribPubzo09?=
 =?us-ascii?Q?PulJmo2/cZ6iTd3cEIXDjg3KUj1IbZpM7rxSAdhohNGm0h3Hl8I0Wf2oxc3A?=
 =?us-ascii?Q?vgT2tjkf/fIWtpC374TAJQnxcK4syKsMu34oN/NyqKelsQ7P0vd1yyabVW62?=
 =?us-ascii?Q?t7hIOarIhTunDXnIKWuL6lUtxT5Iz4G9XvYt8CXwWjFV1GR6jWkvNOLbJdtb?=
 =?us-ascii?Q?QPaGH/zZUA8e/NOxHHqqu59PyCVBTKiKydMdheaM+q9UBk5nn72z4B6kPcm+?=
 =?us-ascii?Q?YYAqpc4jtreF/ZMlfCn4qls7x461ujpt2BH/a4q29sRz5SCfUsmhUoD9YZYX?=
 =?us-ascii?Q?9bGpRKpLz/ytAn/hRLBPTVO5OHXQzNSwJPrjiy9/wfgCiimcLrkxHkS2G5Y6?=
 =?us-ascii?Q?yzzwAZbhHoSFSDEFIBI/5SiIscsP4ExWQMtUYEt7YRRihO23s6Mirxk+G+Xm?=
 =?us-ascii?Q?by+7eDC0XJ7BIdUnTclFP3tKT9iarQE2byDvzf4j7FJ2zOhkPHiqKYR5OozS?=
 =?us-ascii?Q?b2sPel7wS8efh7dQkuRbdkl4kF5Hx6b/NjzX9vjFMp6aqyM2fw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Yl8nS3TMaMdnsd1H+PhTZOlYvKd5uIRkhDGPDoOx+yg2k/JI08sMvLvMRiIj?=
 =?us-ascii?Q?Md45CQZRuXIzepT4yp8YIWD3A1rDM4AKjkES/rLO2X/8S8ZhotnM3gp2jOXx?=
 =?us-ascii?Q?jjEIG1pftchpPIC+t9lhobTNzAkkNMO9GQjfEHe0BNiOrxc5qPr/0OhhbvZQ?=
 =?us-ascii?Q?wKpbnBOdOWj1jt6YelilRc9ri2KBFbanWq58jOfwijJKGPRtDF+ALWuHlhIW?=
 =?us-ascii?Q?AmwLJGzmOWoKm3Y9jbJwL/veBURoGvWLshQPOvRQ+Kp+Cr5mmXLVUL9SaFVJ?=
 =?us-ascii?Q?QSsl39wB8MuvBaRc9MJKIi3KEfU6NJniEfGqx9+EINkJTAvuzJVAqdIlr02M?=
 =?us-ascii?Q?cTxqgRGRGeMZdiSKT2RAEN++THW2s2bZNhK9Pjv6O0ox/GHZV1MsRXKxrvc4?=
 =?us-ascii?Q?Wd1AhkBsYLtPC+erDBJo+dTZFYE5TuYnwcwYJSuFoQXrf0NdYAgZgmOO/Oz6?=
 =?us-ascii?Q?InTULN2zXW6+aGbC3YjnQx8fru4Ju2B9N27aXGtCFt+F8P47bwQIiQDzQo9N?=
 =?us-ascii?Q?Ec/Zt459uVE+eJlo0JJ0gTv3dMzoEW0PgArtORy4Vvna7MHtI3eEV55M5/py?=
 =?us-ascii?Q?fnbs4BD1XWecqdyi6UiLsQLXiLUN4p/Ak9Yay86QsfFYWof8yPkuLyzzKRu2?=
 =?us-ascii?Q?Iv6FVnBCW8Kglf4SnW0+gA359qYZfd4iJSwFKhppXSsQnS5kDLe4msg9wAR9?=
 =?us-ascii?Q?KdARxN+idiix4q7wLdC84um/96mhkjuVbor8yvp/rhXFoY3GPfu+AQWXGiov?=
 =?us-ascii?Q?l8tofuFuqi+sOkUFzM3qfsKKTLBw++r+CKgQ/U+s4IhU8PLk3/nKeuOfOQks?=
 =?us-ascii?Q?lZ/gTQpJhI9cTPAwOGsm8wi2cLDr2JO9Eal1BsVsf2aGwx4484HLoPLCwgay?=
 =?us-ascii?Q?r2HmIf6Dtf39viCgivZ9JtoNFl/2z7rwRJhAE84BAwhY9YUrUz28zlhefhRf?=
 =?us-ascii?Q?GCKVrFuoqF0p92/nXVDL8/Tqv446kBfBjJIEownFfkGGXxk2EXHgTR4rOu2K?=
 =?us-ascii?Q?KYCfu9cdAX0fsOkNiXaChQ3TfH0khVrVwdah6evFoVBoVbFernsSzdzOE6ht?=
 =?us-ascii?Q?F+lp+0uTpLRO6Y1sHrUNs4wAGlKbSFRwWBVlKZZmu6cWRw4ZV7U4be7x56Gw?=
 =?us-ascii?Q?/eUXW+eJlZy5T09LqnKMJeQTPyLyaNH93qwYf58CCccjR2f3YRy85okPAR9w?=
 =?us-ascii?Q?bH8ZXwHTyRJXFSHAfA9B4n8MeID9f+wuOkTHTrLDj8YPBmXQKH2IIHw6PA5o?=
 =?us-ascii?Q?PeJ5ZadJjO+0sOHDtgBmIWw4KFW7fO7M+BSJM6i7Y4E4XEpNnLelmYohwNSa?=
 =?us-ascii?Q?htq72JVaE9E4RSwZKWLjkp77qgoWT3NRT6FaNrcyF6mE4rtC3u6+1XaBfV0J?=
 =?us-ascii?Q?UaFrajn6WJYsKaNQ/YdBNZmqobBUUdX8hLX5Nlzykuo8dCIRLCrUIrj8CkTi?=
 =?us-ascii?Q?WIpvq5yErKfyLlQFELbKeRQQlP5GDuMmUxlfY4vFV95C3pUnJVhQ6E6SBrMi?=
 =?us-ascii?Q?M3EGfKcrNPSzKGqghWtiGpvQdb696nB9zFgHG8szUiXlhNoSIAvnhNqrk7YJ?=
 =?us-ascii?Q?550KwKPgtAD+k3KQoAhe6iNuQY4LNnSfk9z7dUd/zfUcFyOvLG9vTDlvhOZh?=
 =?us-ascii?Q?jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1a0f80b-9cdd-40ac-dfdd-08de26075252
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 18:30:02.8009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qEdiE6fMCK23TfoRrs5z7cTOfsm8ztrzIUxdgrG+0teaTQ4EWbOAMPuFWe2nKfw5Ug7PBhZ2934TkgZs/igx9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8760
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

On Wed, Nov 05, 2025 at 12:11:51PM +0000, Satyanarayana K V P wrote:
> CCS copy command consist of 5-dword sequence. If vCPU halts during
> save/restore operations while these sequences are being programmed,
> incomplete writes can cause page faults during IGPU CCS metadata saving.
> 
> Use shadow buffer management to prevent partial write issues during CCS
> operations.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> 
> ---
> V1 -> V2:
> - Updated xe_sa_bo_swap_guard_lock() to use guard(mutex) class (Michal W).
> - Moved xe_device_wmb() into xe_sriov_vf_ccs_rw_update_bb_addr() (Matt B).
> ---
>  drivers/gpu/drm/xe/xe_migrate.c      | 54 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_migrate.h      |  3 ++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 19 +++++++---
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  1 +
>  4 files changed, 73 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index dbe9320863ab..2106593fe48e 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -34,6 +34,7 @@
>  #include "xe_res_cursor.h"
>  #include "xe_sa.h"
>  #include "xe_sched_job.h"
> +#include "xe_sriov_vf_ccs.h"
>  #include "xe_sync.h"
>  #include "xe_trace_bo.h"
>  #include "xe_validation.h"
> @@ -1103,12 +1104,16 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  	u32 batch_size, batch_size_allocated;
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_res_cursor src_it, ccs_it;
> +	struct xe_sriov_vf_ccs_ctx *ctx;
> +	struct xe_sa_manager *bb_pool;
>  	u64 size = xe_bo_size(src_bo);
>  	struct xe_bb *bb = NULL;
>  	u64 src_L0, src_L0_ofs;
>  	u32 src_L0_pt;
>  	int err;
>  
> +	ctx = &xe->sriov.vf.ccs.contexts[read_write];
> +
>  	xe_res_first_sg(xe_bo_sg(src_bo), 0, size, &src_it);
>  
>  	xe_res_first_sg(xe_bo_sg(src_bo), xe_bo_ccs_pages_start(src_bo),
> @@ -1141,6 +1146,10 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  		size -= src_L0;
>  	}
>  
> +	bb_pool = ctx->mem.ccs_bb_pool;
> +	guard(mutex) (xe_sa_bo_swap_guard(bb_pool));
> +	xe_sa_bo_swap_shadow(bb_pool);
> +
>  	bb = xe_bb_ccs_new(gt, batch_size, read_write);
>  	if (IS_ERR(bb)) {
>  		drm_err(&xe->drm, "BB allocation failed.\n");

There is a goto just below here. We should drop the goto and just return
as the suggestion [1] is if guards are used, avoid using gotos. 

Other than this nit, LGTM.

Matt

[1] https://elixir.bootlin.com/linux/v6.17.8/source/include/linux/cleanup.h#L148

> @@ -1194,12 +1203,57 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  	xe_assert(xe, (batch_size_allocated == bb->len));
>  	src_bo->bb_ccs[read_write] = bb;
>  
> +	xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
> +	xe_sa_bo_sync_shadow(bb->bo);
>  	return 0;
>  
>  err_ret:
>  	return err;
>  }
>  
> +/**
> + * xe_migrate_ccs_rw_copy_clear() - Clear the CCS read/write batch buffer
> + * content.
> + * @src_bo: The buffer object @src is currently bound to.
> + * @read_write : Creates BB commands for CCS read/write.
> + *
> + * Directly clearing the BB lacks atomicity and can lead to undefined
> + * behavior if the vCPU is halted mid-operation during the clearing
> + * process. To avoid this issue, we use a shadow buffer object approach.
> + *
> + * First swap the SA BO address with the shadow BO, perform the clearing
> + * operation on the BB, update the shadow BO in the ring buffer, then
> + * sync the shadow and the actual buffer to maintain consistency.
> + *
> + * Returns: None.
> + */
> +void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
> +				  enum xe_sriov_vf_ccs_rw_ctxs read_write)
> +{
> +	struct xe_bb *bb = src_bo->bb_ccs[read_write];
> +	struct xe_device *xe = xe_bo_device(src_bo);
> +	struct xe_sriov_vf_ccs_ctx *ctx;
> +	struct xe_sa_manager *bb_pool;
> +	u32 *cs;
> +
> +	xe_assert(xe, IS_SRIOV_VF(xe));
> +
> +	ctx = &xe->sriov.vf.ccs.contexts[read_write];
> +	bb_pool = ctx->mem.ccs_bb_pool;
> +
> +	guard(mutex) (xe_sa_bo_swap_guard(bb_pool));
> +	xe_sa_bo_swap_shadow(bb_pool);
> +
> +	cs = xe_sa_bo_cpu_addr(bb->bo);
> +	memset(cs, MI_NOOP, bb->len * sizeof(u32));
> +	xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
> +
> +	xe_sa_bo_sync_shadow(bb->bo);
> +
> +	xe_bb_free(bb, NULL);
> +	src_bo->bb_ccs[read_write] = NULL;
> +}
> +
>  /**
>   * xe_get_migrate_exec_queue() - Get the execution queue from migrate context.
>   * @migrate: Migrate context.
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index d7bcc6ad8464..db66b2ea31a5 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -134,6 +134,9 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  			   struct xe_bo *src_bo,
>  			   enum xe_sriov_vf_ccs_rw_ctxs read_write);
>  
> +void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
> +				  enum xe_sriov_vf_ccs_rw_ctxs read_write);
> +
>  struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate);
>  struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate);
>  struct dma_fence *xe_migrate_vram_copy_chunk(struct xe_bo *vram_bo, u64 vram_offset,
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index 9959d619addc..33f4238604e1 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -150,7 +150,8 @@ static int alloc_bb_pool(struct xe_tile *tile, struct xe_sriov_vf_ccs_ctx *ctx)
>  	xe_sriov_info(xe, "Allocating %s CCS BB pool size = %lldMB\n",
>  		      ctx->ctx_id ? "Restore" : "Save", bb_pool_size / SZ_1M);
>  
> -	sa_manager = xe_sa_bo_manager_init(tile, bb_pool_size, SZ_16);
> +	sa_manager = __xe_sa_bo_manager_init(tile, bb_pool_size, SZ_4K, SZ_16,
> +					     XE_SA_BO_MANAGER_FLAG_SHADOW);
>  
>  	if (IS_ERR(sa_manager)) {
>  		xe_sriov_err(xe, "Suballocator init failed with error: %pe\n",
> @@ -384,6 +385,18 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>  	return err;
>  }
>  
> +#define XE_SRIOV_VF_CCS_RW_BB_ADDR_OFFSET	(2 * sizeof(u32))
> +void xe_sriov_vf_ccs_rw_update_bb_addr(struct xe_sriov_vf_ccs_ctx *ctx)
> +{
> +	u64 addr = xe_sa_manager_gpu_addr(ctx->mem.ccs_bb_pool);
> +	struct xe_lrc *lrc = xe_exec_queue_lrc(ctx->mig_q);
> +	struct xe_device *xe = gt_to_xe(ctx->mig_q->gt);
> +
> +	xe_device_wmb(xe);
> +	xe_map_wr(xe, &lrc->bo->vmap, XE_SRIOV_VF_CCS_RW_BB_ADDR_OFFSET, u32, addr);
> +	xe_device_wmb(xe);
> +}
> +
>  /**
>   * xe_sriov_vf_ccs_attach_bo - Insert CCS read write commands in the BO.
>   * @bo: the &buffer object to which batch buffer commands will be added.
> @@ -444,9 +457,7 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
>  		if (!bb)
>  			continue;
>  
> -		memset(bb->cs, MI_NOOP, bb->len * sizeof(u32));
> -		xe_bb_free(bb, NULL);
> -		bo->bb_ccs[ctx_id] = NULL;
> +		xe_migrate_ccs_rw_copy_clear(bo, ctx_id);
>  	}
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> index f8ca6efce9ee..00e58b36c510 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> @@ -20,6 +20,7 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
>  int xe_sriov_vf_ccs_register_context(struct xe_device *xe);
>  void xe_sriov_vf_ccs_rebase(struct xe_device *xe);
>  void xe_sriov_vf_ccs_print(struct xe_device *xe, struct drm_printer *p);
> +void xe_sriov_vf_ccs_rw_update_bb_addr(struct xe_sriov_vf_ccs_ctx *ctx);
>  
>  static inline bool xe_sriov_vf_ccs_ready(struct xe_device *xe)
>  {
> -- 
> 2.43.0
> 
