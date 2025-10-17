Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E3CCCD184
	for <intel-xe@archiver.kernel.org>; Sat, 18 Oct 2025 02:48:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EBF510E1DC;
	Sat, 18 Oct 2025 02:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eTEZ3paS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B33D710E1DC
 for <intel-xe@lists.freedesktop.org>; Sat, 18 Oct 2025 02:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760755708; x=1792291708;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wrgNWk2RzOXPttAB6XKANywdth9G6HOElKIoZiNySPo=;
 b=eTEZ3paSm57oJ+MfPLj20dgjDCcH0uZhA0sT0LbegTp0OULnXx/QgUam
 RGMJnPiNugBKu8aMOuxvm0gC58k+YDByvy2COt1jYf+hZJFc2iF5qvg+r
 9dg3m1d9Tmj/UmJuzJU1ZUaMqLK9YwAmihILqjZkgR901tkGQ7PQ+UhnL
 HK59tTMVNAGBcgK4PSS03vq9pKfn4XkID5FY/KPLW6sPhPVKSTbuwYWp9
 2m+PZpdfL2xKSlN5scIarH2mc35wlKv3YSxl+FlLKD3qr0zkGvfCni2uS
 WqKPCJvwdxQE+0knWXAzcgspXeuH/kwU82kH8ZfVj6jYdGKbSBF8wNHVd g==;
X-CSE-ConnectionGUID: H5Ni6yFbTRi1R7GPDlyeNw==
X-CSE-MsgGUID: Lb0DAVhRTQiEUJ48Mrc52g==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="85589788"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; d="scan'208";a="85589788"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 19:48:27 -0700
X-CSE-ConnectionGUID: hfshKeq+Q86WBWkPvo2tbg==
X-CSE-MsgGUID: kTL491WHS8a4sVWGplX/cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; d="scan'208";a="182818748"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 19:48:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 13:53:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 17 Oct 2025 13:53:11 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.52) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 13:53:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h8ALJIuK5+Y0hiTIzCRo6Lm4eJEK+Pn4ac6KN1ZfwKOj5JN1mmgrTYLZdWA3ltH1kZuWCReUeoqTzWy5bS6abCHxm27BfKf15IsMpUoj2iEUiG1IqAbQK7E6EdU4/6jOUSuDbGkQttFJeEBe4R7skmAnPiJtuquTIKNg8a3eHr4Fy8W2lzkomm41kJsM9RARywYPoyObKE1TkIZyAabde7ltms7B7wjL+Y43yMHB/IUiRJTz/w+j26eM5FFkF2ydCGS8GZVlSactc3ju07JvLNE1k/mmU0kHr+j1uO4fSzaRsn6UK5MwOZCmp2ATWD1hIV/UkYtcZBtp91H6gMnP8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pckZmch3pGQ9hgqbsGfxMa9hwCMfUU64WwYZih1B8ZY=;
 b=gBWvpuqvm0Z70+xcwb8BOz1uwwH7bOI2tTBYjvx+06iDg4rE2eDF475msobVVPWT1E5/0dXqHMGsHM1A2OSo+8f1tzZKV5J27H86QEOodKcG7m5hR/TuPhnrbcl//pgUrSm+OnzmeBGlzAler0u8m4xrYbV9VFFsAvjPq88RYEcXSEOMKcxJ4O9GtdYCZjsuQ2+3ulOkPEDNwSXoFTPYR4MVezz9uPGu9Nyn7S6tkkVKisjRvbtQRUG6uKS9ueUlmXlvrMNcBR6x/yzCSFjxz9PIZZjPEOwwzlRZ8i1KSOyVXorhzDKaoML9rmAcyFDZspuZd2oxXb2jIOw2YEYYRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV8PR11MB8746.namprd11.prod.outlook.com (2603:10b6:408:202::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Fri, 17 Oct
 2025 20:53:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.009; Fri, 17 Oct 2025
 20:53:08 +0000
Date: Fri, 17 Oct 2025 13:53:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 03/12] drm/xe: Add xe_ggtt_node_addr() to avoid
 dereferencing xe_ggtt_node
Message-ID: <aPKssSsFZ1NkVTP+@lstrano-desk.jf.intel.com>
References: <20251015074708.1654014-14-dev@lankhorst.se>
 <20251015074708.1654014-17-dev@lankhorst.se>
 <aPAW2H5JAyOFXl69@lstrano-desk.jf.intel.com>
 <52cccc2a-6958-4701-824b-3897bbdf366f@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <52cccc2a-6958-4701-824b-3897bbdf366f@lankhorst.se>
X-ClientProxiedBy: MW4PR04CA0347.namprd04.prod.outlook.com
 (2603:10b6:303:8a::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV8PR11MB8746:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d3e6973-bec4-44d4-9de5-08de0dbf2d33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QV/Qm7BLOnPDNcvQcvRbzRdPLlotQGZHA/AtzGEWnWDxUMOLWBB52yeBbT1n?=
 =?us-ascii?Q?iEHWtV3DuYjNuj2CmP4Bm7qj+wSs4u6fJbeRiJHOGA3wtEooP6WF0pMJxFpH?=
 =?us-ascii?Q?9VKkT2cmjZLH7LyRJG/wqWLenEZu83oJRlG1XLzHL83fqX1bGWsaKFksWxqo?=
 =?us-ascii?Q?Fwamd/Hgdnpy3is2xEnXuZWcJ9/Ei1x9RbKpTotSOzmt0/szsmO8/gzUTpNV?=
 =?us-ascii?Q?2BI+fioDU2aiyhp4olII+3Hhd7Rs3qPPknwE/Yr3VGK+bVT/MKSq67bwLkfc?=
 =?us-ascii?Q?3s+kpqtA+wb7yITP5h8OFfm6JuMSJJvWeSqkeQJanhrgWTTEXKpDU+3/ppIc?=
 =?us-ascii?Q?6SOZ/cjhWaEKzaSMGvEky88k1x8qet8alCqNeZCP4/PXdD66Y+H9mn67frWx?=
 =?us-ascii?Q?ryQeZnHXDG+Qw/uajjuxTiG8mZfZgD+Ty95tdf0G/1lBqu1t0LJctZ+MRsBV?=
 =?us-ascii?Q?+RnnYkMiaKfQ5g4OuyAr8iTSW6fdDueMTTYxHSBMJDXC14qEQY29D5zpar1m?=
 =?us-ascii?Q?JjDGJWf41tiXnguxDsnbBgRGoiX2W6IBSYfC/XUPJTjW+NsXOzrChB8BX2ry?=
 =?us-ascii?Q?ywtcpg8qdDJtot48rfjwBGJ7tI5gpWByEDUljy6g1KNw79oThAooawsmKL5D?=
 =?us-ascii?Q?Cko2bcKMHU/1Zmbj2fezuOxzr77RGy8NAvuCNMq7x2Zpc/tnb+m68+cHV1gf?=
 =?us-ascii?Q?JGGgYJTCgtascSyf62bdqED2kxJoSaEzRLloLDk0YsaKiP7l9obkjhUqYPJX?=
 =?us-ascii?Q?NBsx6t2VVDG35yvEXDZ9qb5VIO4sSXZe078JB/r9HhQCJWfCgTu/9BIdcaup?=
 =?us-ascii?Q?faHY8LzCEB1xHvMRbRUo8zZki09KUxLtvC7ufZBkS5VW7Bl0L88hPwO+bgKv?=
 =?us-ascii?Q?EvKEMNysNszJA/n/CqgC0HGZ16QRlGPKH1TaR6Mj1O8Td7i0PFA4sjEqos/9?=
 =?us-ascii?Q?J4OoWdee33musAijKvBv05Fgp3j0G+1+DrkOVzL5CKGSw+4VVPHrdQMWFRvD?=
 =?us-ascii?Q?eK/5Q6amGtMb0WxsC+ghh8mY/3KaTe2NlTJAGMqnDbUyK+rgir/hUeE7nQjU?=
 =?us-ascii?Q?+OwaqZm8RhKIld3BV9F1eaxWrjlMW+IiquTydQICpthcuPw7ML45EyDLjRxY?=
 =?us-ascii?Q?4RSDB1qHyTX+4GBqds2zLjHVBr/339lyd4aaokkQW5CV2H9ofLfcdKG9w9x4?=
 =?us-ascii?Q?m1qrj6SyrpzV32RfnbR7mNk7KQe2HPaQUQQEFC0True3LzrktbuADwO6YC+7?=
 =?us-ascii?Q?dwHcqbx1X4MoJUewrjZevdTXjXYL6yVLCe1GlPSUbK03utQSELUtAO//w6Ev?=
 =?us-ascii?Q?NdmUTAGCRibI7LBjMOV66PUiMmG8XqXYQILnnb35CLMfitdpHSUO50EtjSI0?=
 =?us-ascii?Q?Ah0uJau3z1E2/whJWfjch1mGFxFsx3rTTHefqnEwYa2cPiJ+js7n5eV5V34F?=
 =?us-ascii?Q?c+eChB38NLEqquqJvu6VZf3NXMkXK32Y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mvXrYfPC2MN3QhRWjUt2jUpQmRvjKSDzCrbhK5lwx9zRrjMzodUWbZEkTkjv?=
 =?us-ascii?Q?br3FXf3iAMj7HBbIBM/QNoyYmpQQDYBOz7AWP4cu5cuaB4dTD7Lf8FzWorcA?=
 =?us-ascii?Q?ldpELFbSyTL/bs4kbEzWUxdOSlk1YctGqVD8AmUFuqf0w7jjTAbgTXX2jLfd?=
 =?us-ascii?Q?k1FttoE10E3bSzjN+EVbHSio1B6jFcGz7m8KeKytef07NCzBbbZ/bOH7aO50?=
 =?us-ascii?Q?JZZqxghGg6UIgYaROJwHGHptu1LZzJQMPWGqYn0Bn9WIbDu/tEtPgvmlvDIO?=
 =?us-ascii?Q?2/467dbU7AXxMBmDzqHMB0gHtNlGmzvVUAcb65I3Z3HKDMQayOYH6HvEIjSO?=
 =?us-ascii?Q?UtX7L1h78LJgeIt5n+jpCdzOjKT+7OuGhWROmMYREWOf0piNdsWbgL9PO81H?=
 =?us-ascii?Q?+hdoTjm4EfZ0AVxpBlNl7ePytu4UPY2pCcAhd2Ki4xfEj2836+dNBCnuRGSn?=
 =?us-ascii?Q?nCMjA9alq2PZYVLmS2c3zLlF4vkBYx9jHuk+0IbOlo2pjqVL3e3t3k/z6HwV?=
 =?us-ascii?Q?D6sz5MB/rlElBrv5A8UwiDx4wTZaTT1sGM3jW5wIQc2yeMFQ4TEBBE9kNKaJ?=
 =?us-ascii?Q?D2Bo6n0zbZ+nwMz9kUGwfcfKpHyNQ7GkbhhWOavF6Me9A+4HXu9CmVLy0kBF?=
 =?us-ascii?Q?S9fA/DaKa5hE+A/LiwNSUVTOPp5XQXPC1F/LTbkpNyA6+OmlvwuSZkvVu138?=
 =?us-ascii?Q?nlr0CjRbNvMcTw0+xDOnwpN4K3hef2IMz92VJgoAMFUFgaSlQ/hqoUw6ynVy?=
 =?us-ascii?Q?FUF5/dVPqySv0SZr/S/x3KeyNg6cmzBpL4PCr/BON8dvHhlrd5Wu/7+aNe5L?=
 =?us-ascii?Q?xZAJcNPo4dtrkMclrVMwT89ixdoxeB4Sz9nsQS/cYQ529X/PB+lmGUYN4/SG?=
 =?us-ascii?Q?y5VZ1Yc6enu1KAWqnqU0EbIhoaWGJR3KI04k/aiYHGOzLcVpw5q2pUeVrwQD?=
 =?us-ascii?Q?mqB9n8rKa6tCN+9zJbJVH7jYnEqZ4x53EFixGy4Lk79FjZFSDpPFVBpGyisY?=
 =?us-ascii?Q?TZzZtpcUJ0D6kS1RVnjPUHiqBbUeCiuWJ4YamVLbToqZpMIrR99BAidF7zH/?=
 =?us-ascii?Q?ln0K8+gNP4T3J19LK5KRrOvymlDaukzB9x+I2rqSWp6deddRBh1c+QxKhoji?=
 =?us-ascii?Q?/Xf0/+y5yzDXlqaLXrG/q5N8tfJm0BcoMkLOEsLQbpAp4Rs+rCHeh+8kK1Ll?=
 =?us-ascii?Q?PB45hCBtuT80XPSm9zeDT7pgN+RwsKbUBbGKqd5GHyeoNR72z/ugM44zADmk?=
 =?us-ascii?Q?tNyrSfMrRmxlAzg21dB2qdlR1JHy1pQfHrrbLfq/bZE1eWv6bqBBhHc3RD59?=
 =?us-ascii?Q?yGVefl9BmHnAYNOmM1MzkCg0MSmZ4uZ+nR+oSu9rwaXGsgrPqFY0vcoZ1gvg?=
 =?us-ascii?Q?dg30AwE4SiwHO1im1ccikv89Asufu6RoTrs5Jyc+3zHC4aChEz5/hE6M5sdT?=
 =?us-ascii?Q?Ptl4yfCzFHugUUXO6ySLVBGwqSgz2iT2o2QfIx+UPAhgpu29D0Lsrs87hnf9?=
 =?us-ascii?Q?IPKjiFHDxhokfDimzMpMbTBOK9rh0mqm43WWq4D66OKqbwUpzgefIm2XZJTc?=
 =?us-ascii?Q?xrrzm16u5OYtHOsarWSk+gPoIB0pScAB6T8Yidq9Kpy4sQYtVKACjUOrzamJ?=
 =?us-ascii?Q?nA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d3e6973-bec4-44d4-9de5-08de0dbf2d33
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 20:53:08.2694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3rQHd+4I3SREKDwh8aDUZglwGIClPKqe56timG5aPbH94n0Y7f/tr4HqwefITMsv1eGgUQcPpEIaYAZ1VVYWlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8746
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

On Thu, Oct 16, 2025 at 08:13:44AM +0200, Maarten Lankhorst wrote:
> Hey,
> 
> Den 2025-10-15 kl. 23:49, skrev Matthew Brost:
> > On Wed, Oct 15, 2025 at 09:47:12AM +0200, Maarten Lankhorst wrote:
> >> This function makes it possible to add an offset that is applied to
> >> all xe_ggtt_node's, and hides the internals from all its users.
> >>
> >> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> >> ---
> >>  drivers/gpu/drm/xe/xe_bo.h   |  8 +++++---
> >>  drivers/gpu/drm/xe/xe_ggtt.c | 11 +++++++++++
> >>  drivers/gpu/drm/xe/xe_ggtt.h |  2 ++
> >>  3 files changed, 18 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> >> index 353d607d301da..dd67a6f40a16d 100644
> >> --- a/drivers/gpu/drm/xe/xe_bo.h
> >> +++ b/drivers/gpu/drm/xe/xe_bo.h
> >> @@ -9,6 +9,7 @@
> >>  #include <drm/ttm/ttm_tt.h>
> >>  
> >>  #include "xe_bo_types.h"
> >> +#include "xe_ggtt.h"
> >>  #include "xe_macros.h"
> >>  #include "xe_validation.h"
> >>  #include "xe_vm_types.h"
> >> @@ -251,13 +252,14 @@ static inline u32
> >>  __xe_bo_ggtt_addr(struct xe_bo *bo, u8 tile_id)
> >>  {
> >>  	struct xe_ggtt_node *ggtt_node = bo->ggtt_node[tile_id];
> >> +	u64 offset;
> >>  
> >>  	if (XE_WARN_ON(!ggtt_node))
> >>  		return 0;
> >>  
> >> -	XE_WARN_ON(ggtt_node->base.size > xe_bo_size(bo));
> > 
> > Is there any reason this warning was dropped? It's not immediately
> > obvious to me why it would be.
> > 
> The impossibility because of being allocated with a different size
> than xe_bo_size() in __xe_ggtt_insert_bo_at(). I dropped it
> because it's redundant.

Ok, makes sense. I suppose with the GGTT being private you can't access
this information a bit later in the series.

Matt 

> 
> Kind regards,
> ~Maarten Lankhorst
