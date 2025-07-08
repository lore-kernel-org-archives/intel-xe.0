Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12574C8303C
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 22:14:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C49AF10E6F0;
	Tue,  8 Jul 2025 22:14:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XaPjZ+zQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C6010E1D7
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Jul 2025 22:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752012880; x=1783548880;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=z40GoYRPvsc9vlBVlfP/FNuxJMktUBSDxO6ppyq2pac=;
 b=XaPjZ+zQro2nVjTeloZu/K17RWEyDjDlqEhpAhgIb/50r5H+yitsAUoy
 yFVWfNxBYzHu025JTH5LXw6FrmxFNZx5nz9y6nxPCZf+s9YqhTQx1920x
 Yz/BBH5SSSi4HXJ3ZaNpstszy0ki2TDRW+a/US8Fa1gU2b94XhLFgKKxG
 K0U8h7Ysbro3mGseqnHK3EsfaPtJ61pC7TxgBXQJhpvf+oUcHApIJBpzQ
 F/bQUfW1h98borSOm5lH9kTQ7aUYHU12KIW0r0Dy4X1l7n83k3cVsXpyA
 yboVmgBNTP68exMJV8uVRhwvlSQRjALnTOSIhe3KBrkxzKVLbA1IbkElM A==;
X-CSE-ConnectionGUID: S2QB9fd5TkOBmJjFmA7QMA==
X-CSE-MsgGUID: ciPH9uDYQAiLJcuOlCroQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54196485"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="54196485"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 15:14:40 -0700
X-CSE-ConnectionGUID: /qqCIpXySlSYWJMiXt9KRw==
X-CSE-MsgGUID: znkLSJ4UT+qI9obcs97ouA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="159639259"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 15:14:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 15:14:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 15:14:38 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.70)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 15:14:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cMNUpNRaes8rs8flIh2yzsoG7ghIk/vZGvu3bA0UOcBfFCeeViTMC/TSiQ81BYZdr+CIMOlHJR39bCErIDj/BzzgzK+InX3cg1cUmH2fhcfFA7ukDMCY67xmZ1MThXurcRCHAjBOqazlOQhDXyq5B0W+I8kCB/XW8lhz75ArlSGnqd2ZFaK5AwwoVIv8mjFTRd26gmAvjljl6FYf4/MZyvrtDrtJMHfxN0l+hKrDnTG6wGV+2LQNqaSLm7Gaqen+i0cKvFP0D8acwXbanxAvrtByl2L6ywmqeJZaZs2y01v9Qvh+LHOxjALW83zZMu+ECKc2mU+9+aR+zomVTO83QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KdxB3ovRimzEZfu1mFbcR29Y9lx7yRoYr3SfzFNjuZw=;
 b=GmHq2Fn6m3iD7yCAaYp41XMyksTwYQqaEtx7ZSVCOcm59P7hGF6A83JUBOHdC8ogVvSfr9aVLK0et0SZDdXs43f05ffKu+WzhMEgomvci7NwaDVF55lR6mMUnDLTkvLsTYb6fe8IK30uJ6VIAax4F5Rnm4gShqyesI6lH497LflQvgJ6G9SSzOy32Bs++DSea7hVh2yJP7c+BKOjnPaMnBQP92mINh7cxulNmv8DVPxzVPvgJ9Kni9aS2hwxypNucjpcWrSQDakDdkdIh3vjT44t3TSVQnTIVVMoUaxewLc9WuTvR0Qn7WkAoeHCZ/mGCISSZO0IBmQydWJyCGSPkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7036.namprd11.prod.outlook.com (2603:10b6:930:50::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Tue, 8 Jul
 2025 22:14:10 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Tue, 8 Jul 2025
 22:14:10 +0000
Date: Tue, 8 Jul 2025 17:14:06 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v8 2/7] drm/xe: Rename utilisation workaround emission
 function
Message-ID: <7dpdjcwvj5nidgypujmgtjgrycd2mixubgqcajuxrguvqf5xsr@x6czecsfttb2>
References: <20250703082059.61597-1-tvrtko.ursulin@igalia.com>
 <20250703082059.61597-3-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250703082059.61597-3-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: SJ0PR05CA0106.namprd05.prod.outlook.com
 (2603:10b6:a03:334::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7036:EE_
X-MS-Office365-Filtering-Correlation-Id: de8b0df7-6da1-4c87-4e4b-08ddbe6cc348
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3J+Cib6l9ZlHoTKwbI1Pz1+HPNzft9AY6xR/d7bV+6XjqiQD6nEvO+/HsbYu?=
 =?us-ascii?Q?ebOipA/q6iZkHnhbYzYg/peTTLHmYVqzZ8OG4u98V9VN5aB8KFtTQ2pxQ7jJ?=
 =?us-ascii?Q?71NsIYjafuVtlY4iI064infJwRF5UPonoSqnXXjYty86mvZhp6G+N9nhU3Em?=
 =?us-ascii?Q?0KtZMr1YQlr6TiqdqL901UArynMbGfIS2wavxVg4Hzr/02j1DRP50SJ82SQ/?=
 =?us-ascii?Q?IvsQOuE4sX4FKptcC9Q++/XIchrpigDI76StZrxqAJC4KhCrGESgMLbZYHml?=
 =?us-ascii?Q?V7jTjUtymbWGfgUjRk17pS/fnY7kljuzCUmp3y7wuVfI8vranhX9omB3XVQZ?=
 =?us-ascii?Q?R/BsPj0cTfycCrZj6i/6OQm6TSSXv3cS2zDX/TTstxxxxYkY47a5TDzMB4og?=
 =?us-ascii?Q?9OvA3r6QY6AK4CIkOGR81O+ktT3/raJYCM8vK2ygkv1WbIgQ7z1jh52ntKNF?=
 =?us-ascii?Q?WwawnQmryDqjIFlFhmgGK1+mM/J7ouUB4zcJcS2irzC3E/RWXJAv6mGZeu41?=
 =?us-ascii?Q?H99NwHaUm+ea7HaoZJ4SAIFL+VHNSChkw37WtC9PP/xLVCaopW5HZ03Jd+Jc?=
 =?us-ascii?Q?eoNoeqf2OyFcCA9DKQ+yCga0k+qCRdTsRkgVLQq5kxXjmytrwWqrC0fSMUSa?=
 =?us-ascii?Q?rttGJP5brGOmn1CMxijozDRblwpWd/Y3x/GowwDxLNtTuKtMFUXUCVdWshE3?=
 =?us-ascii?Q?a47NjAO74hBv4VOO0VvEcfHMr+EQ64ejLhV9vAFCcb71OcATEkiSSdu2wtB8?=
 =?us-ascii?Q?BJ7DaQfOHf6Vw+oZhXoH3jNyr+iQTijZ1mubY+auBE9mkiatnov8XXNvwQxC?=
 =?us-ascii?Q?eYZ2YUll7w48QN0PqrdUaU7nV3JBhAq4hlImI/S6tQspAS2KNdA/4e57mSJK?=
 =?us-ascii?Q?OKdvABqiBwVwPxSvB6yyxu20wJJAsgxGoRSHkdUJQAy/7L+IAmuHJQJGWd8C?=
 =?us-ascii?Q?hWNqISvestCobUGcLG7qzBt8Ekr5/N77dTVjyRlq2d8S3ddNkwSKAhe86p+3?=
 =?us-ascii?Q?OHCgsyXLWbie25EKk0aTE+MRlyNno/srZlRzu2hUmhB/64c6twZ/MKFSzp9Z?=
 =?us-ascii?Q?6HQREuOOQUPKUfFOJTNEEJxlX24FCqz8i2upXp4Dh3yc01jBZVFAbX5jOxpy?=
 =?us-ascii?Q?zF+iV6Hrp7s0jJvQegXELcU03AdQFzOLnaF/dvzByAGJuHw7oNbLTtJi74SY?=
 =?us-ascii?Q?JnH5oUeCLdwciMP6Sk8UJj5iHuMjHTtv/nNDVaVSK3/yr2JPUkzsiNBFCG0H?=
 =?us-ascii?Q?dkS6u6Xxobqi+fEtYGq8hG3ZYWUQ+K9RdOxBkUmBzpqQ8XxrTsCbuNJkngCY?=
 =?us-ascii?Q?nLYbOLvBsJWcBXEy7ZMoQ0TxWo92M08wDivfVdmwTyOdiMgrJl0qN22rd5bI?=
 =?us-ascii?Q?gG9VizF2wM9LMa1foA7XTEZdSmGAY9MkgsOccuhvOay2MUz9SRnjrYYgVBrf?=
 =?us-ascii?Q?ZaIpXTl43V4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3W0yHdeW9ql8Tu2dIUeZM73ud5P6u1ufrIze5OiEgGM8JTzLrohiyi7V9r6B?=
 =?us-ascii?Q?90ORiYvShUkm0I1OjbWPdphB91k3BYrp2FGpr2n4fOGzrxZS8tyd6+sJluEn?=
 =?us-ascii?Q?3EaIgByp37PM1ra34H8yI4SJnu5sH7nSxDPIoHYBJMTmGO2RIijrJoiO+gmu?=
 =?us-ascii?Q?S0VivF8fYd+ETxNiPgjyNu3Qz6MR8IqCr4tCRNhIWlidkIh4bRNAdJG+idYs?=
 =?us-ascii?Q?FVuqmCzcpmUYr3Cw9kNr9wmOl2CONT3AE2QOcipMktCDzw/KZ+OWXAgP2PP0?=
 =?us-ascii?Q?MXH77Ow+R/Q5EKBByAfjePcU3llxwlolbJVM+bMw9+jZi04JHYFR3uQleTHy?=
 =?us-ascii?Q?7+CX/4VuI1nvdY4hFCbdPkTI35BevtpfJjaDq+1/DEFTeF0DtuRBm6dS2Ahh?=
 =?us-ascii?Q?PhiQhvyQD0OTdJuq9sWnh2BAKyyjfqD/Bx3twk+M2EVx3MtpBJ/kHWLhFyY+?=
 =?us-ascii?Q?3GinhYvlQbH+JTl2LuiYUVvxHgEhVCyhA/XsVTIogk4ki6gqWsbyLtTVnFEJ?=
 =?us-ascii?Q?6o0v74C2Ts8H1lcvcIhScxHIbF9zMuRWIYJb/mMamq8/KVDell/aHKcLinTy?=
 =?us-ascii?Q?jOdTkjrCaJdyCW2Yo+vHyVZKMFVnyYs6QaTJKznUbGMbCiHP/z2h7X/Xu4r5?=
 =?us-ascii?Q?b1X9lvd3uipXdGprcbUk4B7LJVRUdBF/ZSgKsgLjIeD/WOgYvw7RpAk7zIoM?=
 =?us-ascii?Q?srkQXiRWB5sT6k3QTfu8MBnww/IQqgkcGycpgdzsbAXCJTtLJwSUefPuAPqU?=
 =?us-ascii?Q?6QfsARr6OddTVR7Bj+coYexMv6dOjhZKAtMqRFLzgPg++uKleMFCV9zhkTxD?=
 =?us-ascii?Q?3+ijadtWWqFpxS8zEwoALPf1zhxDj4mRnDWhvH5KCQ3/L+6eLB1PZHXKR1Is?=
 =?us-ascii?Q?b3ZgDi3vpnC+uYchVp3tzjgFeyYzBgIylaUPKi3pQ3zsodo2r6mvt+i9Kpgl?=
 =?us-ascii?Q?d1CR1oyx8TEcBNRxZyipyyW6OGvbpGUSsSkTaJjUivJ83qHJAKBTCDm8Fp+H?=
 =?us-ascii?Q?mH0TNfHXrPycsJ/cV+90DXMWsPNtDU4cE/Rwl1U1k5uncny2XAZK6inGXemQ?=
 =?us-ascii?Q?PDEomX0NvJnONfg5y/k7fyDpZxKNyNzNz//ncofHZicKrfmaEMUQvNAR+5bz?=
 =?us-ascii?Q?ZBs0rMjxk7pIjbX/NKMSQH6h08bp1ZrquYxU+3M3gkuLHUZpKN4Gul/7/e+Z?=
 =?us-ascii?Q?dfxLk95UEq+9/PAA/hqTRMLrOSnmZchHbs1OOmblouh/TUWIuzAkD/2VN8sp?=
 =?us-ascii?Q?tl4oa7rMwT7eZtq6EcmzUmopWKVTz/GQ/Ph0x0buZLHxFAIVJgdVf9VEThQY?=
 =?us-ascii?Q?2mDtlQ+drPBi8kXOV2aSbOsCZW9Kcd/1GMj/vmh/g1GmFpk6c3AXej/xNwZ1?=
 =?us-ascii?Q?RmPMer91v1mSN/vdWNe0Ajsxvt7kdXBjLbNTk2W06/2AX054CJ45LYmsqqmO?=
 =?us-ascii?Q?erdcCoMDrquQcQiEeF1/whQn7UEpV+defZ0XZocFIkEPLJToqqv1Ec5d0UWt?=
 =?us-ascii?Q?c0EXOKFOmjLvW5ErqfQFsz/SwKhxqo+WwW55qozsynHNXyAEpIkEh7wCgmKo?=
 =?us-ascii?Q?90HLIti6J8ILt//0bS6fVSCkVQ0PcI2O07ZeQ7YtGdrpB8AVvMn8fhPbPOJn?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de8b0df7-6da1-4c87-4e4b-08ddbe6cc348
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 22:14:10.1676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d1UwCBynWeUfV9FaooxJo7u8+a9IikQexCVVYLHONY8VDpPvM4IcwcXCs5LZ7XHkiqY1wWh8d10MiCqLSqeX29a/IWBtiFJtd2lfcShQpgY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7036
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

On Thu, Jul 03, 2025 at 09:20:54AM +0100, Tvrtko Ursulin wrote:
>Lucas suggested to consolidate to a slightly different naming scheme which
>will align with the upcoming additions better.
>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_lrc.c | 7 ++++---
> 1 file changed, 4 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 5b05a730a0f2..edd8751b164a 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -944,8 +944,9 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
>  * store it in the PPHSWP.
>  */
> #define CONTEXT_ACTIVE 1ULL
>-static ssize_t wa_bb_setup_utilization(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>-				       u32 *batch, size_t max_len)
>+static ssize_t
>+setup_utilization_wa(struct xe_lrc *lrc, struct xe_hw_engine *hwe, u32 *batch,

almos this entire file uses the style like

static ssize_t setup_utilization_wa()...

with the return type in the same line. Let's keep it like that. Also, in
the commit message s/utilisation/utilization/ because that's what
matches the code change.

With that, Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi


>+		     size_t max_len)
> {
> 	u32 *cmd = batch;
>
>@@ -1038,7 +1039,7 @@ finish_bo(struct xe_lrc *lrc, unsigned int offset, u32 *cmd, u32 *free)
> static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
> {
> 	static const struct bo_setup funcs[] = {
>-		{ .setup = wa_bb_setup_utilization },
>+		{ .setup = setup_utilization_wa },
> 	};
> 	unsigned int offset = __xe_lrc_wa_bb_offset(lrc);
> 	u32 *cmd, *buf = NULL;
>-- 
>2.48.0
>
