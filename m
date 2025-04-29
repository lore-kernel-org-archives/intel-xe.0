Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237D4C3ABA5
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 17:11:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7DD510E431;
	Tue, 29 Apr 2025 17:11:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ndgHbhO+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1489C10E431
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Apr 2025 17:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745946689; x=1777482689;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jzDHYgFOZizUgl1RLOR5wNQ5JXeaRAtjiJrq7AC7DO8=;
 b=ndgHbhO+GIQe6Y5OC7PgYqG6SpbE6TcZ0PrZZycqRZfIvzX/P4iZh6GY
 jOxxuibBsIIiXALT28l54JDgQST072B1TRy+Ijh956mISWoW9rcDyTJcq
 d2MvyO83zyq8P+fzAFuLDy1V6zgW0CPegriIU5iCLP0as65RLm+O1zlhF
 eemvWX34DDzF7h9fZN7gxCbzrYER5xFRAM2LoToPaYlqjHnQOGnNuPTf8
 uKDJ+ixZHLET8I0mQHvclKHm2v7hWXSGB0nxAHerFN4faRX8Gv9VS2HcM
 Sk3eBQuQ7dwYhq3xRG3NykNDh8tRkL+RGe4C/Owt9PqGh4wT6zCSExIaM A==;
X-CSE-ConnectionGUID: pO1zFj9DRu+ENd9YzCcxvg==
X-CSE-MsgGUID: FpncFtkhSQ6fPKdvrzMlfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="58958448"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="58958448"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 10:11:29 -0700
X-CSE-ConnectionGUID: g64mhQWBSFOwl46/Q0e1rg==
X-CSE-MsgGUID: IUDmIge2RoyPCP/PnHaRYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="171117502"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 10:11:28 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 10:11:28 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 29 Apr 2025 10:11:28 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 29 Apr 2025 10:11:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FtgjXE0E8GPwVACu3FFPrJ7sIHlWuGNn5DmycCAwL+8wjAei8oMKMRM0xw72+8ucvoVWJCVfVSbi14OLfgBY0Zds8NW6wlCCH/YethUWh9sHTxNx6iwJGg+FdfDr2QAsD54+nspkzM5oQjme0QwX4p2yDrPu7PqYe2+q2Zeo6Q8fZVJLMJR2L6GmpktgCCkbBPDH78XOVZo9YgAiUo1Xjgz2PIIOLdlCcWWvmAXzIw0ebBMpvQ683x7oNksyr3ydDaq9R7gG5bpzcpKdEI8UY8dBXUaezJPXo9cavjH0e2tEpJrDcdRzkxeeoMJRReWW0w0zibLrQx1OAEhQngdjGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VNCoEY0pThmZ+spchs33cVBy4XwjpWjBhdv7xAagBys=;
 b=GxRI2z1pe5arxvvAiLu0Duh8/5D0ZvJDwGQN5wNGIIPt/lUfdKkZjMaOhdPljLPBz6sGETFTWx8HK95Hr1/s98bB/pQJ+QCdtukDJUoTuCdJz0/wJwerjIiCrPOoSpH9ZL/L6kzlPqSqGLP6YR0jlhpi8fkH7VrBW4tzNC61h7tjCCZv5jvfgepNjun0auNOtrpoHSqrLbyaKaxVT9ur4lPSiRargzHpY8qzwRXPJyTNdjs9ELkImp0gFRrcsMN/6qL966fpVd4XvtiYDN4z0xEeDD/8CmYP2kYI1BVdyXu8STFzzZaz+5tf6lPmFh5o0Ls6H/5fm79bvFG82gduEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB7399.namprd11.prod.outlook.com (2603:10b6:8:101::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 17:11:25 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8699.012; Tue, 29 Apr 2025
 17:11:25 +0000
Date: Tue, 29 Apr 2025 10:11:21 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH V2] drm/xe/tests/mocs: Hold XE_FORCEWAKE_ALL for LNCF regs
Message-ID: <20250429171121.GJ6239@mdroper-desk1.amr.corp.intel.com>
References: <20250428082357.1730068-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250428082357.1730068-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ2PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:a03:505::9) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB7399:EE_
X-MS-Office365-Filtering-Correlation-Id: aece25a0-1158-4abe-6e2f-08dd8740df49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KVi1UB4/1gMd0iU4RhU9tlhBl6UhKcWfN+FMmWon3MSiBLMDqkWBxJEd8jVm?=
 =?us-ascii?Q?jB/39o4LDPL/zFSwKQCClE58+vijNvwEmnnu65mHWC6HHx5W1NP744qZudFg?=
 =?us-ascii?Q?j/1MrcBdr5u/aj2S2JM36mmgByPb9AY/okYP0FUOtk6jBtdJON+F84LgIOOl?=
 =?us-ascii?Q?Y/9wyoAFNo08BVr8isTDOJEVd78lIxuxLVzK8Homi3gVffNzIk5q3JPYvuB3?=
 =?us-ascii?Q?S40fF3NIJpXMXlmzEroMCx2Ax2FE4ZNmO8GdBAPaekmlk0YPBIHzr+AaMKOR?=
 =?us-ascii?Q?6dIlvAocvEg4uJyclJ3FijMkTKX6J/TLK08IGZnRf7Wuvu5iQSi+midyCLCQ?=
 =?us-ascii?Q?3O6zUVHPDJOVlDL2BRKLPS5SGWJn/1Cgd8BSwJuXgJn8NmFBiqMJ0hTPonmF?=
 =?us-ascii?Q?cHHM94tz4sXayMvoHAXYUcEJ2aaDU96tp0KL5eopRdyRdzQ12E5sMFJnIax/?=
 =?us-ascii?Q?Q5bPBzHyRj1DT6vGQ7p5rTsujpjd9tayFrv7HPtvboDG/Jvk7qMPuLaUpH3t?=
 =?us-ascii?Q?9v8Td4Y2TtqWp5JqNfye6ybDuY6765HcianrhlUbcr3qGTudlFUydLNYth+c?=
 =?us-ascii?Q?o3ZbD1+WEoD9C+/lBg4cKs7WMxDWS8w/yA34WCMFLfCI7S1AqKF49Skujl5g?=
 =?us-ascii?Q?3s6NrLw2SlCO4lFVGGfBxNuA87hgnoJWy2wY631TROZp4fNAAMYjM+bMNoPv?=
 =?us-ascii?Q?O9oFAFn1IzX/XcGWxoW7Ei0A944OnVtOaaDi6yvAM9HwLy17iIvYxBv/CrMr?=
 =?us-ascii?Q?4+mEk416rminfOJixeM/Pfrim9ktAIpraZfRGb5vjN3EJAPSKARjZXrzz/5R?=
 =?us-ascii?Q?6X/vLC9fZ7QMzhQPh/PTbIfDBwdWTM6x4gsPr5bZYIKFNyricQ6getBKTHBl?=
 =?us-ascii?Q?/BYWbS+yVtIuqA0UNViqZjcBDc8osXngFCiEdZ/oqt+PMsdtq7ypBhwo4JGB?=
 =?us-ascii?Q?WNAhwfgNrsWgOJKeLMun4e/TeHpJHEhUo4l/mYyPt/3P28FDPYRawGN0jnC2?=
 =?us-ascii?Q?Q0EsKib9n+WgGFe/Sc1bbhPYI5oYm+wGhY2N24DYsPH/DDEkv3+tRsHVQS1Q?=
 =?us-ascii?Q?nJvkrej+vKGbTDk/J2IqRHwtsXAb4vUpKVvPc0bzZQ3P1WU6OFA4XTLDd+m5?=
 =?us-ascii?Q?pJ1TryJ8GX/34yEzbRmu1gi5iPwN/eTSsu/Pw8cSWT2XCX5es112suJGc+tt?=
 =?us-ascii?Q?6E8aRS68W2geIqhBsoyO+jh2bdRaevW3WWtfaS+2WDL+6F9x46pYcAsOOjOJ?=
 =?us-ascii?Q?XkZbTsZLbNJ7SeO4jvZMy629IqBORM2GTCSDqfMKut9Gifw0CYSm3AUuVCQz?=
 =?us-ascii?Q?hfgnCf6eMODiXx7YXjK0nXJhCJBR0Ype0YBYWn2rfpSsf4mktlJ1wQe7mPlf?=
 =?us-ascii?Q?+mY9TKU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Lqkk6uc0nByRVaymPwjzbrrnCjxGtJzVdHlxNk/BnuutyRTUrA6yFKSmjb0P?=
 =?us-ascii?Q?kBcqa3fwGApcn9XbJZUEaET/NGGVyKDSJ5PwHm5uqc7SkDPMcSpOkeJtggRd?=
 =?us-ascii?Q?APY1jbbQOJk7fvA89RyIozAwHJdJeaNAQTqUodQ0zN3TO4qT7F5UlDvSmYTi?=
 =?us-ascii?Q?EpsRXL7HcjFG5Z7O4NcLNf0l0k7rCmBIWw8MOBnrlbq5mk5ir3TMdb5C8Ncx?=
 =?us-ascii?Q?dTcbsBEcQJbAQ4skYI6xJLj/IFkbqLF5XYViqrk7ObUQjH9fKG4hggXmrDr8?=
 =?us-ascii?Q?AB0Zi7rDo/SxSf2DlQdl5yEJ3fBxBfJ7mDjYEYVvdn2MafBMjI7s5q3cb7zu?=
 =?us-ascii?Q?KcW6nykYAScBBsbHk3LMR7hshLLwt4dbk1VM433zDVmLX82PgkY+T0t0dC2z?=
 =?us-ascii?Q?CYfN/V5RgTL1NnIVh/+sVabe3AbgYVqp73D7wiRyS4kYSwJvluU4OlSu8eCP?=
 =?us-ascii?Q?YHJHuONtQmmStlQrych+FR9Jgc6axdMuoMh0Gam9oW2gl6kqv+e1RWrMtyPP?=
 =?us-ascii?Q?ZI/tpZ0XV0y+2gULw87swj77SlRxP5/q5T1YIl1Q3lXR0y+1M5iqH4UpV0NF?=
 =?us-ascii?Q?eExxdxP8Cimpw7pKionLpTBUirqOnGZkxj2dLaZr3LdCalv68dflccS5SDXn?=
 =?us-ascii?Q?alF/Ks5NFQnY2mPLj5wjWBxWZgK/wNkFRticC8ABeRNbqfDzWiybt6VI2L6P?=
 =?us-ascii?Q?kIaYcZnOilIBBnna6oLXfQLYGi95MTKeCvrvpUKO18Hj2i4yMax+kSyTIb3f?=
 =?us-ascii?Q?2R0hDGywH0XlwF3DycX7bMlpjsMhIvSMaH7gymw2NA8K7z8Mx76y/US3YVAC?=
 =?us-ascii?Q?mhmECwV308U85z6bD+vgXW6+gXMImWd1WiLtFGubLMMoEpX1F5kOBvMig7Io?=
 =?us-ascii?Q?87ZB2mJ3JDn9iuLvoNHne4e1cUgKTr+aXVnueNxXucjjPGEJdldbD3Mmumne?=
 =?us-ascii?Q?2LBUJvX1UHMwu5pCGzCBZ6amSglCQNcFrQclKW4Bf495AM7qWTHkJL8ik5Rh?=
 =?us-ascii?Q?DNgeTCc1IDOEIOnjeXKkWhEYKhNQUomEhWQyVj7ch7FKkagIfm+I+3aEqlr7?=
 =?us-ascii?Q?NqN53giYbROIhCK/Kczmzzrb+imUYNK1rxoGSqCGrOPTbxKLB8LkFkGeR3vC?=
 =?us-ascii?Q?b2SpYTFs9/bztl/sjAfXtRcFoFH5pJk5tMS2FyzSW+i4id20LrkneBQicqiV?=
 =?us-ascii?Q?wdU9I3vNUOCeYVB8XP/aKuxRKYUap7wOPmHH1kxqtUmoxMLxgskMRUer+4Ar?=
 =?us-ascii?Q?qdVq+KEaxnTcNiuAyH1CBPGAer3uf3PoF77PyvewsKBFGINA+JcA9jD1fygb?=
 =?us-ascii?Q?bpLTvwQYwbc67d2Tyw1Qos/EWDHKTMvkV87TE8bTznQVokh2bgMqo1dqtnbQ?=
 =?us-ascii?Q?SaaTiwMvUswmZ5h0U2UFNZCafJUZsZPoGpzb6PvK4GcgzRkyYUn8xTVJA5NP?=
 =?us-ascii?Q?VLi6IVte0q8lmUaAfZbB4+pnTNHOcNM0toXpVCPgQlFWrv+2XMCiknEMAiFn?=
 =?us-ascii?Q?Yh1AXf4H8MLPnU66Bs5urCwmFZ+RNwwETrpVu1H7oRwCKkLEl2CJqbTfVwAd?=
 =?us-ascii?Q?rOPDVosJpgqkeUGDY+4wcYKUM4Ii7/D+6cGYcCn1DtZsto1RYOrOswlQ+Kve?=
 =?us-ascii?Q?1g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aece25a0-1158-4abe-6e2f-08dd8740df49
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 17:11:25.2613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cHEl7LjZnf/WEgbuSGmqq25J0kIria96PC+qg4o9EJZ0T/4JIM+L73w73rwobN7eodD4VGRrTdA75gJK8cdR+sOyhDV0py61ygWngWSZh6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7399
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

On Mon, Apr 28, 2025 at 01:53:57PM +0530, Tejas Upadhyay wrote:
> LNCF registers report wrong values when XE_FORCEWAKE_GT
> only is held. Holding XE_FORCEWAKE_ALL ensures correct
> operations on LNCF regs.
> 
> V2(Himal):
>  - Use xe_force_wake_ref_has_domain
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1999

LNCF registers are part of the RENDER forcewake domain on Xe_LP
platforms, so using ALL is a brute force way to fix the problem on
those.  However the LNCF registers are documented as being part of the
GT domain from Xe_HPG onward, so the existing code should have already
been working correctly for those platforms.  However the original bug
report was for both ADL-P (Xe_LP) and DG2 (Xe_HPG) so it doesn't seem
like forcewake should have been the cause of the DG2 errors.

Have you confirmed that the issue has vanished on DG2 (not just ADL)?
If so, you should feed your findings back to the hardware team in case
the documentation for this register range is incorrect.  There are a
number of other LNCF and LBCF registers that the driver accesses so we
should make sure we figure out what's actually happening here.  Also,
i915 (the official driver for DG2) is still using GT forcewake for the
LNCF registers on DG2 and isn't seeing problems like this, which makes
it questionable as to whether this is truly the root cause.


Matt

> Fixes: a6a4ea6d7d37 ("drm/xe: Add mocs kunit")
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_mocs.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
> index ef1e5256c56a..0e502feaca81 100644
> --- a/drivers/gpu/drm/xe/tests/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
> @@ -46,8 +46,11 @@ static void read_l3cc_table(struct xe_gt *gt,
>  	unsigned int fw_ref, i;
>  	u32 reg_val;
>  
> -	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	KUNIT_ASSERT_NE_MSG(test, fw_ref, 0, "Forcewake Failed.\n");
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +		KUNIT_ASSERT_TRUE_MSG(test, true, "Forcewake Failed.\n");
> +	}
>  
>  	for (i = 0; i < info->num_mocs_regs; i++) {
>  		if (!(i & 1)) {
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
