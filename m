Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C7BC87FCB
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 23:01:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0142010E165;
	Wed,  6 Aug 2025 23:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZQcoNAtM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6617C10E165
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 23:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754521318; x=1786057318;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cD8OUOshaaoLd1bjhur7X53v3f7OiVZAfBbx0ndSpj4=;
 b=ZQcoNAtMeq3K2LupZY5bzGOqDXahbRnER8zfjp/7jZZWuYEP9dHRlPG4
 kOAbcFp7oxlvA+Y31YS4Yej4BfUy11ckh6JG8CANfI2nKvQ7g843N3rm7
 SLLoAapy/1B0UeY/RTiv6ODc/d2Z4+gH5DVd9f54qLzJwflPZtK+9q165
 QlRT2anDzwzYxu3xHnAcV+X8BkHjpZyn6kVilq+uLxyVg5cWnSvv/bpgQ
 bkjxwXhvmjcpfrf/KAiveGQ6/OML8ouvHAT54o9gOabeWpyF2hAxeJ2Vv
 0Gw3O3a67Gkr5ad3fo0Yro16cFhx3VQhCdrmVtHjJU2K3MPeYhNIt4/H0 Q==;
X-CSE-ConnectionGUID: 6Y7SBMxgSPuckKbtzgj+bA==
X-CSE-MsgGUID: laWfSEdvRhiwyroHDDgiUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67116747"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="67116747"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 16:01:56 -0700
X-CSE-ConnectionGUID: /XMJAsQxT1qbHr4hmwjc1g==
X-CSE-MsgGUID: Tmwzyr61TISAfZL5/HGukw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="169330872"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 16:01:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 16:01:55 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 6 Aug 2025 16:01:55 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.44) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 16:01:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cGucTwT3tRV57jyLKJXWYamvA2MKRxVYBL9iE4mLu9V0hZEjJDKbY0UIuCMmdM2yEx5dcFOZfqIR9+EqEECHvAOrtrCyf4eNWXv0A701+20RPhJqUWaLUJ72FGFwFRm80WOCftEKQtdy351oGy/DhtcuE6LGa9OnI9qR7cVgByvJjScMDG5nySd+WoZMFgNe9uK4ZZJh4oRRPOzOnaFk/M3g9fIFI0IXAFCU2cEMm/+bPmS/cjBEcGBdg2RU5SBwzrBUXDjKIHz9aGS/ZEJBBUzrphbj24iBKnOz6dDw7bnEQeOFiQjVSsDZU+DdDIusZGkhSf80GTOtZwnr9RkyTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IkILL7O+rPVB4s1QL58Cgi8wePAPFmjIVg6W7rggZAA=;
 b=uCzgJBB+m3bC7UGZp1FoS86znbPL4zWwVA++YUzIHeZYKeUhc3dXWxpOrAYdGGzV5WFqVHhue3i9e/k+jiNSrXFkt51dGPw7BhKeNHSbO9/Ps7Pmr7nYTb+FLPQPpsICwM/E6GADDxevVgWzl3EZvMskhn1t1nBy3LZ2L2dyIPmr0xgtCqFMyFh75KNxtN1Po8/hj5ySJAt45e05Z2pbKmZWUqL6GMgxFmVUdpFDKIQQIMSxqhO8j2rQ2YI2dPyX3oZ7sF+L0zTbKKqC6hwmIBeNSJzksLyFQY9aar3Ions8GJpCbHAR7KoxPW0XZArnX9SDWDjsXOewYEcFfGoHDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5017.namprd11.prod.outlook.com (2603:10b6:806:11e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 23:01:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 23:01:50 +0000
Date: Wed, 6 Aug 2025 16:01:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 2/2] drm/xe/guc: Scale mmio send/recv timeout for CCS
 save/restore with smem size
Message-ID: <aJPe21FhLLfOj0KD@lstrano-desk.jf.intel.com>
References: <20250806082910.15845-1-satyanarayana.k.v.p@intel.com>
 <20250806082910.15845-3-satyanarayana.k.v.p@intel.com>
 <aJOCoZMciuSkCYgg@lstrano-desk.jf.intel.com>
 <f2c26f5f-5033-4604-b355-05c234bd62fd@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f2c26f5f-5033-4604-b355-05c234bd62fd@intel.com>
X-ClientProxiedBy: MW4PR04CA0236.namprd04.prod.outlook.com
 (2603:10b6:303:87::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5017:EE_
X-MS-Office365-Filtering-Correlation-Id: 945c6624-121d-45b0-1ff8-08ddd53d3a0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TRhSWF8M+JdLP5NhTGTzGd52qRSRHxuzHw2o3r38vVze28Iau73hgO4+op0/?=
 =?us-ascii?Q?VQMpwOyRuTSa965uWvQy0ibGwiDqL4zDZ7pkloNSZumZPG3L+6LDCEbIr4BO?=
 =?us-ascii?Q?l8/IQuy2Ib+y5bSbbJHsGUlcGiogP6O5iEsOmO99vjz8FQAcHwPFpvZrb+oF?=
 =?us-ascii?Q?SVCU6eD94K9nIW86d3hRJT0YPrP7cnYVzlczO/NQFcg0pQGUigGWeOWDQQkA?=
 =?us-ascii?Q?Zw78jSO4MxLdpTzq/kUEUkqSesfPrpMgimGb/G369Ro0Qje7wm0u+M98iq9w?=
 =?us-ascii?Q?UL6FTwJ1fsgwWPkqLRs0F3p1w7Xpxxq/mP7HNvJkntTiqZ9cHd0ryxPxIFsB?=
 =?us-ascii?Q?v32/DSUVjq/DlZGQILEZb6JWqq5XkqDI2F1Xrsjd4J9GiGNnjPzgvAJ0i1Vp?=
 =?us-ascii?Q?8CGRNb0nG95gPfvQNCF2LOO+Q7fpxGO6u9OrfnQ0mSIKF+h96c+VPpqazJmg?=
 =?us-ascii?Q?4KnZoZZPnwgrrWL+VgspdHeILV3Gx3+8QMN32KgEB4+rzf+Z/C6+n7b5m7kD?=
 =?us-ascii?Q?U5PijcsDs3E6mie7cLgmHbOsM0tHkIkPyALivCy826j3cNGvxzhAOZU0HuqZ?=
 =?us-ascii?Q?gPAR5WPZvg0CTJ+uH2c0zT37uRbfy51uf5vTs6U7h13uXQ0/cfMQvTY2RGpt?=
 =?us-ascii?Q?Wte4Q+dpxjFpIjFbW/Xs/sV+AKoPEKJ7WPKBxeK+1dAMvDfeI07X5pFxdVwx?=
 =?us-ascii?Q?42wApPxBUzdS7RDFOOwkMMhWnNcao/OMMKr6XdzNB82IGlOKwjaGMYDt0pdt?=
 =?us-ascii?Q?3UoR1xylaRqQr1LJpErSKgXZteW5qcraW+t4JTac589Nrh+bm4D2O6WhhCHW?=
 =?us-ascii?Q?Ql9xSVFTD79qpp9IEC2ENiDxRYN/4jfsgXD3pHBY0++A1PWBld18geWItZUm?=
 =?us-ascii?Q?pX4+GrPPjbysSMdRJs2+tm0igGBwjMZR9XHqxcoMA8ynsaPJ7WHdOrLb754p?=
 =?us-ascii?Q?p7KsXSUj2nLPc4f692G9yh7L6zi4zlaptZzL1/j/WwNa6HcqZSpYFVoG2UwL?=
 =?us-ascii?Q?uh6Hg0HSU9tL/158RbYF2etBaKxOzhjz+reTSZzgwCs4FjxN838Ie28/tkIw?=
 =?us-ascii?Q?gzt0ciAe6bq/NN+gb1hGwuWaECWz/dDpAYE/zua/3A+qYksxU6jm+4M5K93E?=
 =?us-ascii?Q?iuknc9Lt5zp2Lth6XpbPzOnRtbUxkyXcd1GUn4R4h7MN1op96KW4RKSbbD3r?=
 =?us-ascii?Q?esTisqZL/wpzFgK5Mz9qWUhWRY6FfTFhIoWgpEOd1cdCdzcwiw/nyOKo8M4O?=
 =?us-ascii?Q?NPPBVICgLANIYua9N4827UQad79yIMekNdtpDc/kGAgktCY++wca3EZQeO1j?=
 =?us-ascii?Q?9nfWQI9Ow44BDt9Pi0ZFYF5gY7bwm6y2TC9HNGqS0wKFjd9CHQU2hDaPj5Xw?=
 =?us-ascii?Q?xjM6qpCx3Fhj6Hba/ps97/NxICT8uoqwP5oLYyi9vYEpq/JWub2bR42t4jlF?=
 =?us-ascii?Q?jYBT8wTaBio=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kYqUuEAly97PRb5MSUoY4yXAsCuccm4CUpi+y9+GJJQI9BDVVBo8Qjao+4T8?=
 =?us-ascii?Q?7tkjREt3Bzv2qlCsq8I6kXojxfhSl0CiSaW3lKrYMjU890HSPwIwwyzt6q/l?=
 =?us-ascii?Q?NmjtYmlRWuBf1Mb3silH3hK1of5OdonZ55D//NtYEsSHsB7+RtVpT4gikVSI?=
 =?us-ascii?Q?ShYsA3Y1ZsiDbr6i09UwORIuqd26REHTm/tpHHgsElzVGI760N8L5ogibKSY?=
 =?us-ascii?Q?DKVX/TowT+vfFhkF5b9nBaZr7V2nr3Wc7rzIhmQxt5lL69yRSETjeS5eoz68?=
 =?us-ascii?Q?y5J+RjzdbNYQQ+hYGTqhczWO5qyUf1DLTeyodGw0ZUOcdq4d9K27sY6U4caZ?=
 =?us-ascii?Q?+F1YKTZKJgznto8eW/H5hirf1zQ7mytSSR9tycaTscPr71znG8jGfLAZloHj?=
 =?us-ascii?Q?nvo9zKjaNuuDcnL9bIdLWdSypPzScrxjCTRORRNA08A9EW9PlMF1zFLKACwk?=
 =?us-ascii?Q?ykhPqQyzruKmhnUUE2+oIbbs2WObjQyqjgGDIrQOitzGgeqrjfHWnnm6zN4H?=
 =?us-ascii?Q?WhROD8zViBGbGH9oEBEmmqu+jy3s8hgQ9J7Z26wwvAJd4S2/Mf84n6xJOIY5?=
 =?us-ascii?Q?2yviPUJD00Z599FAC0Cp7W4lbXrbhEyol0ljrJWaBKmYI0RbcGJvKP8WVwPz?=
 =?us-ascii?Q?WLciT2nJLQG2+uN/bcflx24FIvDA5AlpaicyzQSNe/gWpSS8J7sISKmK6pta?=
 =?us-ascii?Q?eM6V/QwjQK8CMHVLglV9cnHxcR0waiMmDCht1w5h02UskxJvyTwkWxWDZSIg?=
 =?us-ascii?Q?8knPS6eLpZ5EIUivtAsRPJKea0K4ZaS9a6myBAugYjjJDbxitNgNpMsauU7m?=
 =?us-ascii?Q?ZUu6H53X5jzOkXPquR3ryzw129xUrdvVrMWR/LZUBITWQHfsEUkNxOuAMAAH?=
 =?us-ascii?Q?u+hs61R2NE/MM6npjIcqY7S3O7R1Abh4l8bXmEPFT9AeLckMlJsO7Sr9DsnY?=
 =?us-ascii?Q?kTFIE89A8Ve58JG5Txl39ubMJwrAeVs3iPD0hs1KQGtNyflZcK7NoUOtxQxs?=
 =?us-ascii?Q?x8db8jx69gkKcX5kRPccDE5U5QrWOgsArYxYprB3fg8SFgRjzV3UTWZaTizT?=
 =?us-ascii?Q?SOToFmg6MbRJ4Gr10p99GnIydVg/9LBDJC6oiamUKCCGfS3KkZsk9ZRPtZef?=
 =?us-ascii?Q?B7YAOCvRUOQjwlmpXuBxlVy7tLQrxaodpfKfkUcbdNsRRx+aFpcfiEe66X8W?=
 =?us-ascii?Q?oDwHFu5x3hl+sgVlf+tE4jS1ruZbNyzK0x+bq0y+DwRR+zbolWkVQlVj2Bha?=
 =?us-ascii?Q?xVegWDKkDMcoBj5x1+kfbqfTeGEFBMZYDw/V6TayteiFzufh79L/5S3VRvAd?=
 =?us-ascii?Q?baTDzvxfDhkrIN3DmVYVwsWUUpK8R7Zucuy4bbw+dCfypFXa7QlElplbJWP1?=
 =?us-ascii?Q?ohcy7PDuRvxjzFcpi0j+BQ/ATyVA7avR9bbVA3GKLNVCckuS860HuuEw6fIy?=
 =?us-ascii?Q?LMG5e6KKiR8JWPbYAGNUma3el87XKHsN8NwYF++nJRyfSDWx3LzRMgG5GTfh?=
 =?us-ascii?Q?KDhqzx3AXQCm2ZfEzBZasUF/jKfi8XQ757pSPwggJxxbPQO3ykqpLhznUZjc?=
 =?us-ascii?Q?AT7+L/isYEznGCDJlDo2xOeMEHyWfLLU4FwF9eo7e4tO2WQaNkyNB6v7PHVy?=
 =?us-ascii?Q?qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 945c6624-121d-45b0-1ff8-08ddd53d3a0f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 23:01:50.2200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0PqdKZyKxrr8pWEENkuc8qTkf+gJs+/cMoqGkfqmSOJCSwo2OwR2Pm4ds5fNj5NyK6e5z5fWV9aa6vFWZ5DqKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5017
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

On Wed, Aug 06, 2025 at 12:57:40PM -0700, John Harrison wrote:
> On 8/6/2025 9:28 AM, Matthew Brost wrote:
> > On Wed, Aug 06, 2025 at 01:59:10PM +0530, Satyanarayana K V P wrote:
> > > After VF migration, GUC restores CCS metadata scaled to system memory size.
> > > The default timeout (50ms) is calibrated for 4GB memory capacity per
> > > specification. Timeouts for other memory sizes are proportionally derived
> > > from this baseline.
> > > 
> > > This ensures adequate restoration time for CCS metadata across
> > > different hardware configurations while maintaining spec compliance.
> > > 
> > > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > > Cc: John Harrison <John.C.Harrison@Intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_guc.c | 33 ++++++++++++++++++++++++++++++++-
> > >   1 file changed, 32 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > > index 9e34401e4489..d836ded83491 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > > @@ -10,6 +10,7 @@
> > >   #include <generated/xe_wa_oob.h>
> > >   #include "abi/guc_actions_abi.h"
> > > +#include "abi/guc_actions_sriov_abi.h"
> > >   #include "abi/guc_errors_abi.h"
> > >   #include "regs/xe_gt_regs.h"
> > >   #include "regs/xe_gtt_defs.h"
> > > @@ -1397,6 +1398,36 @@ int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr)
> > >   	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
> > >   }
> > > +/*
> > > + * After VF migration, GUC restores CCS metadata scaled to system memory size.
> > > + * Default timeout (50ms) is calibrated for 4GB memory capacity per
> > > + * specification. Timeouts for other memory sizes are proportionally derived
> > > + * from this baseline.
> > > + */
> > > +static u32 guc_mmio_send_recv_timeout(struct xe_guc *guc, const u32 *request)
> > > +{
> > > +	struct xe_device *xe = guc_to_xe(guc);
> > > +	u32 timeout = 50000;
> > Is this really the upper bound? It seems like if could be signicantly
> > higher if multiple VFs are trying to do things all at the same time.
> That is really a problem with the wait function itself rather than the
> timeout. The timeout is meant to be the maximum expectation for how long the
> operation will take once started. Unfortunately, we currently have no checks
> on whether GuC has actually read the message itself before starting that
> timer.
> 
> There is also the opposite concern - what happens to any other VF (or PF)
> that is trying to get work done while the GPU is tied up migrating this VF?
> A stall of multiple seconds will cause all sorts of timeouts to trip.
> 

It should only tie up the migration engine, I think GuC is free to do
other work here when that is running, right? Sure, the migration engine
is used by lot of things - clears for new memory allocations, bind,
etc... but I don't think anything would timeout rather just experience a
pretty heavy delay. Could be wrong this.

> I think the expectation is that migration is a deliberate act and the system
> is not going to be doing anything else at the time. It is not something that
> just randomly occurs in the middle of a heavily loaded system. But I may be
> wrong on that?

I'm unsure on this part too. If is not some random event, then my
original concern would be invalid.

Matt

> 
> > 
> > Scaling the timeout itself, does make sense though.
> > 
> > Matt
> > 
> > > +	u32 action, factor;
> > > +	struct sysinfo si;
> > > +	u64 sys_mem_size;
> > > +
> > > +	action = FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, request[0]);
> > > +	if (action != GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE || IS_DGFX(xe) ||
> > > +	    !xe_device_has_flat_ccs(xe))
> > > +		return timeout;
> > > +
> > > +	si_meminfo(&si);
> > > +	sys_mem_size = si.totalram * si.mem_unit;
> Do we have to worry about Linux supporting >64bit addressing any time soon?
> I assume that is the reason for having separated units here is that the
> total might be over 64bits? Or are there no plans for 6-level page tables
> yet?
> 
> John.
> 
> > > +
> > > +	if (sys_mem_size <= SZ_4G)
> > > +		return timeout;
> > > +
> > > +	factor = (sys_mem_size + SZ_4G) / SZ_4G;
> > > +	timeout *= factor;
> > > +
> > > +	return timeout;
> > > +}
> > >   int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
> > >   			  u32 len, u32 *response_buf)
> > >   {
> > > @@ -1439,7 +1470,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
> > >   	ret = xe_mmio_wait32(mmio, reply_reg, GUC_HXG_MSG_0_ORIGIN,
> > >   			     FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_GUC),
> > > -			     50000, &reply, false);
> > > +			     guc_mmio_send_recv_timeout(guc, request), &reply, false);
> > >   	if (ret) {
> > >   		/* scratch registers might be cleared during FLR, try once more */
> > >   		if (!reply && !lost) {
> > > -- 
> > > 2.43.0
> > > 
> 
