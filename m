Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C5CCCD1BB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 16:41:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA4B210E14F;
	Wed, 22 Oct 2025 16:41:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B6xzFlvS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18ECC10E14F
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 16:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761151262; x=1792687262;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+tAFNXXk3l1ENZdmetDd9k2ssYOyCI5+va3x3Xiz8KY=;
 b=B6xzFlvSxxams/808bx53HZVbMRAaJc998x1Mru/1c9fkP6Nit9XY6Jr
 xErTHiowdoLaclS51fvlJcyXL4eUxDUxTLA4Zd1h65Z+i2fFJH2EFMWpG
 I9tQ1Vz2+25/4kTWLvbghTh0xQ4CZ7VTkQVW/2AD16D4SUI6Q5JFxcviE
 qyXzP32Uc3Lw0HV2q9UnTYwr/k+btpZLUjNjP2mff/pyTqtznauQJaXid
 BGt7C4765h70LRqCxEh/1NGEMZxf0QZMKX7+yh3LMyoY7OK256Yn8PKc4
 LaxoTRRCTLYaAC1IX2P1BmmX8LXm2CW1jSi8GJvtR/J1Efq33i9nEfoQ1 A==;
X-CSE-ConnectionGUID: PM3sgg5/Siud4AGPIjtY4g==
X-CSE-MsgGUID: qxkXqIeCSeyhUeWh00gwpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="88773431"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="88773431"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 09:41:01 -0700
X-CSE-ConnectionGUID: kabdrTWIRrO9zdn1SOPomw==
X-CSE-MsgGUID: HngSnClcQHCGO0bp3j/l1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="183857413"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 09:41:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 09:41:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 09:41:01 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.66) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 09:41:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g4a+zkuAH9ZVxs9r5YXv02OyM5BBRPnBzArxE4kd+MGBz62F51cpC1U5/wvJwDT1A+Nqh8+A7FEvq++VXs+ZfvYv9K3sfz27E9OU7v0WLSU+NGnZnT58hzsSijdHweqZXYISWKkmiw8XqGa4Npd1RxQSRu9WaozclV4M0y9YWSvkhs6PTUpVSDJOv26UNYOooiWvVM240klEKprIEPr94Zk1Tas0t7pW7gNK8Dq/j8wuvn98gWlbSDUXceNAJ6tEDQTL0y1dB+Hfh0ztBDMoHrbKvSZuS3BPqThYxVYo80V17vSRmjoOAGob+GzuKCFYuBE1urnpcHOijFfM3LObug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3UBjBeTzxXgRcDofzGnTV5vT0kGDvLMPjaWNhkuIdWc=;
 b=B9iEqFj6mgBqJDRQCDMzvdWQ/IkQ4zQD8yRCSotHg9eIjL48KZCPgSUr8dUsr7ZTzDHdU5YNV98PA2i4/NcR1TmCDTVq9Nd3Lol1+BYQ2OhFq240Zsm+pwanPgOfdo8kefFIDPwwmG2YqTN6NA3XhAi2cb1ULIvGVr7IxLffsLJ9Wa1Bn9srT5D/jnvN80WV+GJo+YqERmdSp28ua2SMdnNptiaf6sMsB5qt7b6nbMqFemFX1NwYGrohbuhfjjfhNETYxbnFh1wiu9mRF2dZ2uJWn1/rG5qPeDPZpYZbPv5i9/cH9yDRu5nIl7Od9W2VMpxuIWcioHbY/k8yhZVgLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7491.namprd11.prod.outlook.com (2603:10b6:806:349::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Wed, 22 Oct
 2025 16:40:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.015; Wed, 22 Oct 2025
 16:40:58 +0000
Date: Wed, 22 Oct 2025 09:40:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/vf: Enable RESFIX start marker only on
 supported GUC versions
Message-ID: <aPkJGNeLJBgxP5PL@lstrano-desk.jf.intel.com>
References: <20251022123822.3747-4-satyanarayana.k.v.p@intel.com>
 <20251022123822.3747-6-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251022123822.3747-6-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4PR03CA0335.namprd03.prod.outlook.com
 (2603:10b6:303:dc::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7491:EE_
X-MS-Office365-Filtering-Correlation-Id: 59d504ae-5061-4166-187a-08de1189c74c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Xz3p93XYwvswHnWSsx21dlo43rz1jiRq7In+huaSUSOhj9rLTLPp5Nd7mgGx?=
 =?us-ascii?Q?bzXq7Ai5yerrrGxdhqiXqoFCHVM7+R1ZixsArqXtJ+dXa+b9Be6fYf1c74R4?=
 =?us-ascii?Q?0EGTEWRnoZuHdlhyGxsplqHkBUnfm08zhZyzDlaA0OKIDaPMdLs1uQe2qVvP?=
 =?us-ascii?Q?NbtPw+qZep3eI50MjGEVeO0oIts+lXeL/9aGO0aMfT40wyXDbM2UicI8ynL4?=
 =?us-ascii?Q?CtB7Ha1bVtS+rCe97UtMB4BTwfH4AUNPxNXPfvZ1DQcBQep+qWFXn0V+WAVL?=
 =?us-ascii?Q?g+LXWhRYFYjedoSlXFXnBxDxscdAlbBJ2FEjOIxeU45jve8Bd/t8BhWOY95w?=
 =?us-ascii?Q?bfgpx33VLX2vcEEjK5IWtovL8/rEkB0WiP3i24KsrMwZ/njH0+hQqriGZnkl?=
 =?us-ascii?Q?9V1HdpCnFoLMNcv6GmXkbbn0WV/p2h6aBKm4IEB4Yg7bVARYSsY56xj754Ht?=
 =?us-ascii?Q?duF68zg0IkTH1ib6n4HVpB2+kDASHw+xgF2CfjjHsiX3MN405X69Xj3dXA9Y?=
 =?us-ascii?Q?nxXyS/SV7TRP/fcrEZBL+SQf5XTY+GHf9CimADiG9Xgi3v51meZuKXZEFAAo?=
 =?us-ascii?Q?ffcq67Uo85ky2HV8p/RvCxznxMg2Zwb2JG4CCZcC1+myCxu1rormT1Xdsekd?=
 =?us-ascii?Q?k4cFZm/YWR47BtVkzay9gK+Hycnl8+zSUkgdBXKmXZ04q1eN3MwsLw3uXaaQ?=
 =?us-ascii?Q?JnjDFKMjaeDToZAQGo4B5Zv1UeVjDCoz7esm6dpnmjnoPWBah+YaODSsv6gN?=
 =?us-ascii?Q?gnqZ9q8HR7Tzr6hU1aje19w6f1eANh9m3bHPWC1suAJa7htIcCKgC0Lc23QU?=
 =?us-ascii?Q?aCNZnkOWNItHlHNoY0Od4v+GeTx/UhJJvMhMVIE06FcpECX4XRWUBOUQaGyD?=
 =?us-ascii?Q?HX8z3QVIeoU/I4pT8SBy5oPEC9FvB3nzyyB1Lf3Te7otl7rNOkmPFEicK9Vd?=
 =?us-ascii?Q?MCWsxBt1w7YNAREQZRhi0vv+YEIjuDlH47ztFQ9uyC/ObwJr7z5J/hot1KZx?=
 =?us-ascii?Q?ZRWNY+BILlNICQ0kg0aFvrMQqzAlfN7m1f79BESdC1WFDkKRL72D0R80h4+F?=
 =?us-ascii?Q?nSaZ/r6JRwWuzYCO4qMLKWcuqr1XCjgP3CvSWKSAZNcCvzW9+QHbgOsomWgd?=
 =?us-ascii?Q?SCuDLiKV1P3IqWRs8eLGGDNPLcX4/bovbHeZO2kbXvEcKcM6l9TrQeowP3NV?=
 =?us-ascii?Q?nlU5C505cD4hdYfQ8ihLUOqeBlpLvxuF2fF9Cqs8Hv/kfrnG7kman9VjGT36?=
 =?us-ascii?Q?fWE2SWVDdw3wu1ZsKAhBPxJu91hbQUkMjO8Jq8TKhyzS8S2QfDBaVk7Gsfsv?=
 =?us-ascii?Q?ScKrFIfS0wY+4Kx/uxxAfHYQyJn8IzjSGIHzBfnlM67WS0kvwvS8CEng84UR?=
 =?us-ascii?Q?DNg8OemjS+k8pVyiRhFoUJlvhu1ymoxdrCD+xA0hH6kGsbAYC9y6+d8GKeHA?=
 =?us-ascii?Q?qzC7W8MC8nOHPQLxFaXfT1d1cnElM6rs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JMriOvUWTfDTXc1aiX7YVd6sWNyYKHYdfS2ekLTj4oGqopvO1uEzOxwH8bWQ?=
 =?us-ascii?Q?puFSKb/AJpkGFPiCTMbNCqj7JaNI6dv94iLlfygXKw9/XJdEX2MWQCCvwDqu?=
 =?us-ascii?Q?TlcZyA7WQMOkNsCRSzSMId3gmXd/l3EQ/PkevMJArZWg3xgs5YikbhS7LR6D?=
 =?us-ascii?Q?GJ0ReL76OxV1JQcY3Hjg7gFL80vbTDhIj5xlOxYEGaEYkNNBGRd0jomdJPzd?=
 =?us-ascii?Q?UZ25pn+Vs3FVvRgRdTAf/f/KZygZtrkfd0ZmvyzzOum6Mz4ANAnTuVP1KGiK?=
 =?us-ascii?Q?SvyJVtQE8nECC7rI8lLK6dRJrmJ3xboUUOuVy3kLhPXU6W0+hVt/+Lrz82cC?=
 =?us-ascii?Q?sldp7ppm39qxEQ1Kcwj9OleokSq1RqR4GqzLV1JRReB8RA+gcYRZrw5OepKY?=
 =?us-ascii?Q?h+opt4ZAVuYKCsCBZpR73YLwCnPaRRhL2duX9CSnfz4YtfKvL+69I2yhNlq9?=
 =?us-ascii?Q?/5HuvKpc6AXtShXdtsd974lXaO6TQIZU0HDQUnQVeTnEKzAAXsvu9/sUH9by?=
 =?us-ascii?Q?p3rryhXuqQdLcm2jFaVNwV/0lPprp/tDEeRXHzAiNvhLOjoAmGVs0ezZERmK?=
 =?us-ascii?Q?O5Cv6mrxPaB35C6KIq+K3ZZ+TY+wmQbKJK5bTsk4K2+McupM5Wpd1wCOD+q3?=
 =?us-ascii?Q?RpeRfM2ttBz0rReX9wRSKlMqCTRsg9SonXbcvElW1e47xr+VwDRgtmKiR98m?=
 =?us-ascii?Q?lO+szKOXbhggjC2gHz9P1VVw2pbyQmoWbwSjH0RAUNH4YDn8IN9TtlqXdQiH?=
 =?us-ascii?Q?aaVA566JZIEcUEn4Iww3lgyX58obcBfokALHw5ZZ/iFFm61pBovVCMSAzlW+?=
 =?us-ascii?Q?D16pSWQoKZfU/tQ17ASWRSr4mHaVSQKQiinX+SFWw8ShySSNvT0/dTdSx+98?=
 =?us-ascii?Q?IC8qcnDNqXrhhr2fp3vFbb6BZiuqBlZoWqIB1uCT69rt4+PZLIUehPWWDbSu?=
 =?us-ascii?Q?KjT8xQOZegvGmaxDKO8KNXhuPnhpBxYRtCC1QZKmPh31O4fmmUcg3tv2BhtB?=
 =?us-ascii?Q?em6S2ihVe8f0oC5e+aVwM3Wtbs0M3enW542e1JmUlXhFSojMPYibJEFWm/80?=
 =?us-ascii?Q?flMImVFObwYxuGG0YvyDshSXtYOM6y9LmpXQBhnhOIOAg7xZA9wg6fkdEWDJ?=
 =?us-ascii?Q?U+pfFHKqfFO9ZaseNdiABk4YgFt9laYcOgIg7fxrNWW41LgqvFQE8D+8IwWz?=
 =?us-ascii?Q?ZuvonAMFKHykzjOg7qsRERQIkSmLtwdQW1it7IzRjxy+rTmmPaZLX4a+mwjr?=
 =?us-ascii?Q?zs2Ac4TDz1W+u+AKS2Jt7EMRTDlM4dwS6VTgHvUQsmoeHA5eiZyUYxedWXYR?=
 =?us-ascii?Q?aIGL0o3RldsTNlrnoP5qOYToo0gD2BPtm+xRtq38DZROoIZZCdMBrU22LL2C?=
 =?us-ascii?Q?oT2Gn0XdIGZ+UeuAaaxrifF/xnTr+sO4Ug4ceGakexKfDwBXEDH4Sf7EZcMF?=
 =?us-ascii?Q?p0fstxdgw7soc9gHmY4EtGmdwhqzDTxNmdnkiKADQlA8aW+8ehNJcOdeCEuQ?=
 =?us-ascii?Q?R/8xjZBNKvhzbbA4JgupXmuUjfu17/r06jZg51qO1HNCCf+uLlthaZbFOnTb?=
 =?us-ascii?Q?uD9AEPOoVOjZ+NE7mma9IlWGKlgnpCPBdmHAJi5y9qv2RvuOVf491kPsZTqe?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59d504ae-5061-4166-187a-08de1189c74c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 16:40:58.6545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pFvpXaxpD9OfSHzuwAveVxoYRRWPumeDmq2fDXsZIfB5QfffXKRixG8RcpOn5UyFuhom5C82frd1QNEfW628uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7491
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

On Wed, Oct 22, 2025 at 06:08:10PM +0530, Satyanarayana K V P wrote:
> The RESFIX start marker is supported starting with GuC 70.51.200
> (compatibility version 1.24.10). Gate the feature on the GuC firmware
> version and keep it disabled on older or unsupported versions.
>

Patch LGTM but as stated this either needs to be moved to the first
patch in the series or squashed into the prior patch as prior patch will
break the migration feature.

Matt
 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c    | 14 ++++++++++++--
>  drivers/gpu/drm/xe/xe_sriov_vf.c       | 21 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_vf_types.h |  5 +++++
>  3 files changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index d0ac0ceaba91..9cd7838d8f2f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1254,6 +1254,14 @@ static int vf_post_migration_notify_resfix_done(struct xe_gt *gt, u16 marker)
>  	return vf_notify_resfix_done(gt, marker);
>  }
>  
> +static bool vf_resfix_start_marker_supported(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(xe));
> +	return xe->sriov.vf.migration.resfix_marker_enabled;
> +}
> +
>  static u16 vf_post_migration_resfix_start_marker(struct xe_gt *gt)
>  {
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> @@ -1284,9 +1292,11 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>  	 * Increment the startup marker again if it overflows, since GUC
>  	 * requires a non-zero marker to be set.
>  	 */
> -	marker = vf_post_migration_resfix_start_marker(gt);
> -	if (!marker)
> +	if (vf_resfix_start_marker_supported(gt)) {
>  		marker = vf_post_migration_resfix_start_marker(gt);
> +		if (!marker)
> +			marker = vf_post_migration_resfix_start_marker(gt);
> +	}
>  
>  	err = vf_notify_resfix_start(gt, marker);
>  	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 46dac62eba23..05171dae8390 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -196,6 +196,26 @@ static void vf_migration_init_early(struct xe_device *xe)
>  	xe_sriov_dbg(xe, "migration support enabled\n");
>  }
>  
> +static void vf_resfix_start_marker_init_early(struct xe_device *xe)
> +{
> +	struct xe_gt *gt = xe_root_mmio_gt(xe);
> +	struct xe_uc_fw_version guc_version;
> +
> +	if (!xe->sriov.vf.migration.enabled)
> +		return;
> +
> +	xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
> +	if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 24, 10)) {
> +		xe_sriov_notice(xe,
> +				"Resfix start marker requires GUC ABI >= 1.24.10, but only %u.%u.%u found",
> +				guc_version.major, guc_version.minor, guc_version.patch);
> +		return;
> +	}
> +
> +	xe->sriov.vf.migration.resfix_marker_enabled = true;
> +	xe_sriov_dbg(xe, "migrate: Resfix start marker support is enabled\n");
> +}
> +
>  /**
>   * xe_sriov_vf_init_early - Initialize SR-IOV VF specific data.
>   * @xe: the &xe_device to initialize
> @@ -203,6 +223,7 @@ static void vf_migration_init_early(struct xe_device *xe)
>  void xe_sriov_vf_init_early(struct xe_device *xe)
>  {
>  	vf_migration_init_early(xe);
> +	vf_resfix_start_marker_init_early(xe);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> index 6a0fd0f5463e..d87a53f16b57 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> @@ -38,6 +38,11 @@ struct xe_device_vf {
>  		 * was enabled or not due to missing prerequisites
>  		 */
>  		bool enabled;
> +		/**
> +		 * @resfix_marker_enabled: flag indicating if resfix marker support was
> +		 * enabled or not due to missing prerequisites.
> +		 */
> +		bool resfix_marker_enabled;
>  	} migration;
>  
>  	/** @ccs: VF CCS state data */
> -- 
> 2.51.0
> 
