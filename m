Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D29CD4845
	for <intel-xe@archiver.kernel.org>; Wed, 12 Nov 2025 21:01:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3D410E127;
	Wed, 12 Nov 2025 21:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EVx5Zaov";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A4F310E127
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Nov 2025 21:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762981268; x=1794517268;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iBRERJ0pFta1ApAREYmoYF69zFFsAY/m/4KdSXvR2aw=;
 b=EVx5Zaov9P1FKtP11lkIhrGd6+4awRZFsMte7Gh45eTIbMcuBT8zWTvV
 Rjqb1hS0tGM3SQtxuymqSg2Y6fxKgHqGOaFgd9wRm9m0+wDkrOZSv8gEX
 dug7b+dxqrIDTAhbWalOPgyvFaRKFsixOHpbvmoCLFmEVbFjQaP0ZDSzQ
 oWfECYFf598J5ud6yPmutC15KGgdE4dxpimqGyTTbe8qpX7KssT6FMCLf
 +fipnccQkA+PbSMVJVsk6h7Oc8R4e6Bk9E54SEbSynk2FOVua8DetXLQO
 wUhXlgx767gfevNPqQ55yqqmriUK5/c1Arxb0BHtZ1gela19Idi92dl1D g==;
X-CSE-ConnectionGUID: cbT30sYqT3aeTYrJZ7X6Hw==
X-CSE-MsgGUID: 9X+Z3VJvRuyU9wIMZcrl9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="76516339"
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="76516339"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 13:01:08 -0800
X-CSE-ConnectionGUID: Mnw7/GysS52AqOEK44nh7Q==
X-CSE-MsgGUID: yC0sneHfRVOBCELn0BgIpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="189320559"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 13:01:07 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 13:01:06 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 13:01:06 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.11) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 13:01:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CqIbCYoFpQgeEJ1GY/PpA3NhE1msJ3PnL11gbqM2vH8/Tzr6bFP1PT0N2J/ulJ8CVM9pK76YYPLhYkUyUH6JGul1vbfNCP2ASLC0UCByoFqVNLiM6/Gu/WHV044DQN3pkSI6CiV+Ks/v55MQDBTfVzptLTiCoBYADwrR1uuyAsmlQNLKCuEJ76rMsmjPvfwkxFemOvxm+klxomzpjHUwE7IY8o4GsAF2/fFE67KkV10/AMFfDdneup14gb6Noa43kv5BTSiJyLW2XQ2p9DTR8G0HIrMrUkDYngf3DAHJ3xiqBEcFyqORR7aVjUsEWwJ8+5aYMDA1otegzk4wFLvFew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMvo8SmoPB/MBjt8M8KLbtJXjow+Al5pgayvPRmCLk0=;
 b=cU1slzrKEPdruJTE3EHtZ9M7t86iyPOG76Gx2Lr/R/4+ttE4I9gt+PBayPxDHN5GXNEEfW3ZdYovKjGiSqpGA0B+/mOvuOWgP+6QJX/11yz9/HHHk3apOkP8Q/WrYGalMZ7dXPIawAsFAbTknwjB1kj9dULmqfQpngw/9adi4XU3iPIIFB984AjkpRZbT3Pg8617ZuxxrABa7x6xrDJ9BrhW1qaf/5RqbxSaZvaz1K851L+pS+YANzSGGl29/mh/nU8vbafyQQkNghuBMIu5bd6lhHePt37NeBPR9i2w4mS39WkleBFB2rxTKTo6L1OnkKdzWcCN7L6tfT4dw5eIHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by BL1PR11MB5238.namprd11.prod.outlook.com (2603:10b6:208:313::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Wed, 12 Nov
 2025 21:01:04 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9298.015; Wed, 12 Nov 2025
 21:01:04 +0000
Date: Wed, 12 Nov 2025 13:01:01 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2 04/30] drm/xe/forcewake: Add scope-based cleanup for
 forcewake
Message-ID: <20251112210101.GG4063759@mdroper-desk1.amr.corp.intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
 <20251110232017.1475869-36-matthew.d.roper@intel.com>
 <176297761536.3698.16687933098897289557@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <176297761536.3698.16687933098897289557@intel.com>
X-ClientProxiedBy: SJ0PR03CA0051.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|BL1PR11MB5238:EE_
X-MS-Office365-Filtering-Correlation-Id: 3764ac27-ac3d-4f0d-3ea7-08de222e9787
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?evxAjMEj/DADYbeu1C4Gmns+nzi6jhD9MhOvNukMC+kZxUj94UrS/9orh160?=
 =?us-ascii?Q?D09vK+dYjStofwq7mHx6PcPz/ulcSAptT/b+Pk6xVEycULa3wtEgtX5WFR0b?=
 =?us-ascii?Q?fS0BlzRpMbg5+UJGfAgNxxVfknB8QQup+hkvaAbRiLC+iYT1sUBsBTNUv1jy?=
 =?us-ascii?Q?0cgv6K26nQFZHy0euBlyyPlfEvoC7LYgj0BbOsCBuFlXVejoJAcz2bjuKEvu?=
 =?us-ascii?Q?MMGLYOT9ykjZKRt4cOCeVGLC0KTxO0z2Fc81il2id4w+J9YR/+hyWZpWxJy8?=
 =?us-ascii?Q?m6FymIKJlqxbiCSuq0AcaCYGIEHVJ03pusn3/VFYPKl1xN7AiRxPKDz9P2Ok?=
 =?us-ascii?Q?nGyTPMVkP9bEYENeAUeWCULBznKwm9ginlFHOPbXnBhuJJIawTR4G/Q3mMcT?=
 =?us-ascii?Q?mtdohrP3z0UMHtQDd0ZLG1CwSu6A5cUdFxN6hLKOyidnRRvGmLl+SaIKk2Lb?=
 =?us-ascii?Q?gFJkfiPpGg/4p0xaSoDxYAwD3UuICsEa5yZ/K0sBDx9HRZ58na6N9ozvix/s?=
 =?us-ascii?Q?a/vTZZkSnJrnda1snMyoHzoKEh7ENVHWIcRBNhBtGtS2Y4ivpk8mZ2SkiXc4?=
 =?us-ascii?Q?Swc8roh5OYfUwXwwaorBopUU1elWCmokvnoM7YwpLsZZuLtYecR8a/uonyFo?=
 =?us-ascii?Q?MAb0KMwHFH9/dVUGVWarTWt65vopLk9aIDbJu6byG2SbFVXbFzAkiIwqyOFG?=
 =?us-ascii?Q?dXbs4fgE5C8QMfH0ZAwiYFpunSItwxCtwmL0pj1dzBiGhd/C3jKQEQ9mb/6a?=
 =?us-ascii?Q?4kH3Ols6HsLbZOB14mgUcpkxiURmSvKni7+h9kxGIxJ5peqMJrj5rffu7pnL?=
 =?us-ascii?Q?1IoVtnrxWrsqTt/+PLNuAdCQ1Jq26vinPYuaoPmliIbaQVVNv7uvnzThBCyh?=
 =?us-ascii?Q?19ubah/kuNH2kq3/xcefQ/IlBVIAHbwjUHcdMn0ijsPjQmG/64A4bwYR6gab?=
 =?us-ascii?Q?6ZvZorlPQpkYDsqgJQ7iwSHpODKjcginftYaBi9zZDkPvzFgtvgOZM83lzqV?=
 =?us-ascii?Q?Rm9qC5BEERP6Z0O+xWaTw5bsROvMs39nvmELTmb/Jgs043trtP4Zj9ZgKvDE?=
 =?us-ascii?Q?JsuNItsgVZMt+bjuxQ5eDhHEkDy5l8ZweF7k2Bpvx2z0UGfZsC3UPG8fcDwo?=
 =?us-ascii?Q?7SkwG0rPriZLK2SqZoTwtXHLuWIm/Riw/YNNgJzPuN+3TAvvroDsYUrwQZ0d?=
 =?us-ascii?Q?tFvnBaGi537urDgRUGqe9POXOd5IW2f5W7rNvjWZYPXoFr8itDG7seTdO05P?=
 =?us-ascii?Q?sOVLccuMK81DTgciIuC6PlBGoJ2XdABfGGMNMmsDXXhkXopeTdAN9R1GO81Z?=
 =?us-ascii?Q?c/hPBTNRNnTKxRSpcYhVciaP+5FiVH7tmk9ZZ2vqwkAYjWae4VshsmsW+FfM?=
 =?us-ascii?Q?5w6D19ilRot0FB+yX/EWD0lYjhSs7bkY7CR0N9UusZF5lYHBXQLarDhzjRAg?=
 =?us-ascii?Q?lSzZ/fBRd8i9LSXkV9ZORa9kVQEcvNZL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ss3TWD4Ogym1kr/HRAHzt0RxJ0MGgj0va/K3OxJLuXCa8uzcuyOcfWCPsFPf?=
 =?us-ascii?Q?UEtMupCpLw6WS7x8g1WPmZCZMcZLzzv+kDEgl2by1pYrQaBPyBcXCvHX1cp3?=
 =?us-ascii?Q?KF7W3/OCCqnHU5a5QTEOvUWaI3NrXdRjDDKjPTz0Gg99yG5F2lOJdCURy7Z9?=
 =?us-ascii?Q?ERqNcwcf1sTArUhHCgM18slFN4O0sZLEx7eWVV24B+NjvDxfEZxNJZgtegFw?=
 =?us-ascii?Q?g9oG9Rf8IBv6cFnOmeGXHe+ClZtsQsFMa+XdZCBwOQCNqV5ChzSd08cUuZK3?=
 =?us-ascii?Q?WoP8S4EZuEIUErpB8R2vvPpoyCSBRgl1vPsmhfiD5bnLiYEqMv/+OLsR5Ad0?=
 =?us-ascii?Q?rLT0yZxnWCxTD5hbD3W4A+GgBMF2d4iYHf/wG8ew8d0KV2ODyd9Td0LOARnZ?=
 =?us-ascii?Q?zh77e1QTKRRsmYu4u1hbXk7Rb21jt5sTcjdrtnxz9E4fkGUjC9aOIhYPBWTA?=
 =?us-ascii?Q?u9K/1WRRlxPMHqyDnBvXDZ1u0qnD4sNhWqTCzUccARf779yHugQ63iVSjPFg?=
 =?us-ascii?Q?TUZzpZnlnXOhs48dyf9NhoUMI0DZFGdfKEIAgehQhrhmMz0nvdx4Tc9alMvi?=
 =?us-ascii?Q?7rTscDSpHpwuWgXlxyGb307SNY2YRq0GF5s31RHL4A1TXqZr+3JI5F9IIb7g?=
 =?us-ascii?Q?lfDrrIn7Zyw5tXuHqmhccifE4VRMreNJ5wKxbJ9gtDn0IwJzhDVzCWKG8cRz?=
 =?us-ascii?Q?FmZjqYfcztEC5zJA04eRbHHScTBEQgm31Oj5YbHcnoiNfYqIPBb3sc5joEKy?=
 =?us-ascii?Q?EXovMr9kSf8lHXJc/HRnlr33zFf+WIUHOWG2IJbvuw9aXxfRMnprF03vlveA?=
 =?us-ascii?Q?M8Tdwa4dgVrtDDIhNc2oCRNbcgZrZKxmM7AO7MviIEwaKYfoW/z2H2NKWBpc?=
 =?us-ascii?Q?tFd6e3nPWM1F/NreKci1/mgeqzSDLbrZTvZFqjU2VledUaKVPtFbBFSCuvV/?=
 =?us-ascii?Q?Atv8vGjVf9vtIABpL4PSwUrfxqgJ1KNlQL9bOcgZcHNqlQTvaldLvKEQUtsF?=
 =?us-ascii?Q?xoq1VOCrzCyDMDvqRZjRNC6o3npKW9CCvD2o/1DxSLslmS8sMM2rnOeEDPd7?=
 =?us-ascii?Q?B83pvRfS6SqNviIxWrxKT97Ei+4cj6oKnghPXhMojAD4FVRzWo+aaI8KDFF1?=
 =?us-ascii?Q?70nG6yjP3llsQKKSIk/5ulsb/aK0XwjaMjvKxSNnyK9+EqQX/cB5BDPRL8Q1?=
 =?us-ascii?Q?G5yt62ULW3cxrDs6m2FOnKm8JmYSUorlyK32nhLtVaB06mUjbNWPZwNuU7zW?=
 =?us-ascii?Q?4OhMl+OE4Wut3shb0+sdh7tP+OXOA4oFrQfpPGE/cCM3afBYAsLHyyiopAbj?=
 =?us-ascii?Q?Rd/QpbbOCww6uX5WweL2T366k7DQ5XYYeH38ZhL5nUYFdJfEKOPSw7+qLb3J?=
 =?us-ascii?Q?JysDm9NSEzfeWH3pVwLgX5NwE1zHUVOyCS9u6naP14+VB0xI4JRZdAL5AkkO?=
 =?us-ascii?Q?oqJ4MWRgkSbLF7p9gqlSGkUS0sfjBcrFHqGnA5+h2Khh/lCJ2Hf/VJ1B/wZi?=
 =?us-ascii?Q?rNw0cpPi3aAJ+fqZ06odzJUE6Bi09kLe0HBYW0l5Zd/55mSVDYD1D3COe2ID?=
 =?us-ascii?Q?Xk0wG/xs3H89iXTqvODIkw9IN6rGdOpJMalmiOyJdxyS109000ZqG4UlaGYJ?=
 =?us-ascii?Q?+Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3764ac27-ac3d-4f0d-3ea7-08de222e9787
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 21:01:04.0791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wFWSlmdpiLXiP4Zk5+vOa23HMP1Mb+uxTJRWwbvVYmhYOknw7ObpA2DJ1r/GeX/eyAxp66c9orfn5Vb4aLaDQOLtgaZP1Q42yGR/CtlgIDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5238
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

On Wed, Nov 12, 2025 at 05:00:15PM -0300, Gustavo Sousa wrote:
> Quoting Matt Roper (2025-11-10 20:20:22-03:00)
> >Since forcewake uses a reference counting get/put model, there are many
> >places where we need to be careful to drop the forcewake reference when
> >bailing out of a function early on an error path.  Add scope-based
> >cleanup options that can be used in place of explicit get/put to help
> >prevent mistakes in this area.
> >
> >Examples:
> >
> >   CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
> >
> >       Obtain forcewake on the XE_FW_GT domain and hold it until the
> >       end of the current block.  The wakeref will be dropped
> >       automatically when the current scope is exited by any means
> >       (return, break, reaching the end of the block, etc.).
> 
> Looking further down in the patches, I see that fw_ref is only being
> used to check for success.  I wish there was a way for us to do
> something like:
> 
>     if (xe_force_wake_require(gt_to_fw(gt), XE_FW_GT))
>         return; /* ... or whatever that handles the force wake error. */
> 
> , but I can't think of a way define such a macro, since we need a
> variable in the scope where xe_force_wake_require() would be called for
> the cleanup to work properly.

There's also the complication that forcewake doesn't have a strict
success/failure results, but can also be partially successful.  If you
request XE_FORCEWAKE_ALL, then it's possible that a subset of the
available domains will fail to wake, while others will not.  In theory
the calling code can do something intelligent in this "partial success"
case based on which specific domain(s) did/didn't wake up (although in
reality I don't know if that ever happens today).

Personally I think it might be better to convert forcewake to a strict
success/fail model and eliminate partial successes as an option.  But
that's a bit orthogonal to the scope-based cleanup, and one of the
changes we made in v2 here was to try to avoid adjusting the existing
forcewake interface like I was in v1.


Matt

> 
> >
> >   xe_with_force_wake(fw_ref, gt_to_fw(ss->gt), XE_FORCEWAKE_ALL) {
> 
> In display code, we usually have with_intel_something().  I wonder if we
> should follow suit and use with_xe_force_wake().
> 
> >        ...
> >   }
> >
> >       Hold all forcewake domains for the following block.  As with the
> >       CLASS usage, forcewake will be dropped automatically when the
> >       block is exited by any means.
> >
> >Use of these cleanup helpers should allow us to remove some ugly
> >goto-based error handling and help avoid mistakes in functions with lots
> >of early error exits.
> >
> >v2:
> > - Create a separate constructor that just wraps xe_force_wake_get for
> >   use in the class.  This eliminates the need to update the signature
> >   of xe_force_wake_get().  (Michal)
> >
> >Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> >---
> > drivers/gpu/drm/xe/xe_force_wake.h | 28 ++++++++++++++++++++++++++++
> > 1 file changed, 28 insertions(+)
> >
> >diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> >index 0e3e84bfa51c..0204503b53a0 100644
> >--- a/drivers/gpu/drm/xe/xe_force_wake.h
> >+++ b/drivers/gpu/drm/xe/xe_force_wake.h
> >@@ -61,4 +61,32 @@ xe_force_wake_ref_has_domain(unsigned int fw_ref, enum xe_force_wake_domains dom
> >         return fw_ref & domain;
> > }
> > 
> >+struct xe_force_wake_ref {
> >+        struct xe_force_wake *fw;
> >+        unsigned int domains;
> >+};
> >+
> >+static struct xe_force_wake_ref
> >+xe_force_wake_constructor(struct xe_force_wake *fw, unsigned int domains)
> >+{
> >+        struct xe_force_wake_ref fw_ref = { .fw = fw };
> >+
> >+        fw_ref.domains = xe_force_wake_get(fw, domains);
> >+
> >+        return fw_ref;
> >+}
> >+
> >+DEFINE_CLASS(xe_force_wake, struct xe_force_wake_ref,
> >+             xe_force_wake_put(_T.fw, _T.domains),
> >+             xe_force_wake_constructor(fw, domains),
> >+             struct xe_force_wake *fw, unsigned int domains);
> >+
> >+/*
> >+ * Scoped helper for the forcewake class, using the same trick as scoped_guard()
> >+ * to bind the lifetime to the next statement/block.
> >+ */
> >+#define xe_with_force_wake(ref, fw, domains) \
> >+        for (CLASS(xe_force_wake, ref)(fw, domains), *done = NULL; \
> >+             !done; done = (void *)1)
> 
> I think it would be good to use __UNIQUE_ID() for "done" here, to avoid
> shadowing any existing variable from the outer scope.  We could do it
> with something like:
> 
> 	#define xe_with_force_wake(ref, fw, domains, done) \
> 		for (CLASS(xe_force_wake, ref)(fw, domains), *done = NULL; \
> 		     !done; done = (void *)1)
> 
> 	#define xe_with_force_wake(ref, fw, domains) \
> 		__xe_with_force_wake(ref, fw, domains, __UNIQUE_ID(done))
> 
> --
> Gustavo Sousa
> 
> >+
> > #endif
> >-- 
> >2.51.1
> >

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
