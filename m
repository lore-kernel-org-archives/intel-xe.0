Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA39C43458
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 21:09:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E95C510F2B5;
	Wed,  8 Jul 2026 21:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dpq95fL9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEEBF10F2B5
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jul 2026 21:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783544944; x=1815080944;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HyIApV5oqhg9s7BRJYGM7eudLpQM7lG7/TuqFHjTuSQ=;
 b=dpq95fL9epXjtyTTAZ34GrE5PWdpDQO9wT1HHIn/1OQv0yG+Z5/14nfm
 J8Gj6gZNWd1yNYLHm0G9iHf+3Ransbejx31a5WQDvlKavHz8lw8lSxxgl
 /n/fXY402vWKHo5Yz3toWIIenuhMaCLjcb7XcEl1KkdJnzJ/3IPuVZYZ3
 cHkcXYqBl4u/aBPK4ol+WCOJL98k2k3aaNYiJ4EGYtRD5aKHXXhQXIfqO
 PoWI0d5P9TIbWa+rVM29//ozR5x94UIOR+B6rBLi3Ia6OlT91sm3NLPkw
 dNpCoUlXy8giA7E8fhIG7BArcPWukhsu6ucCw46AKmFenXJybpciiLL7J w==;
X-CSE-ConnectionGUID: 6o0Hpc15QYCheD9TEJc4Ig==
X-CSE-MsgGUID: p8tg2HsrSYSyLnXZZPCB5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="71741277"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="71741277"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 14:09:01 -0700
X-CSE-ConnectionGUID: swyCprbKQ0q/2+spUAnp3g==
X-CSE-MsgGUID: F2YUKjReQcyKAdbKKwloBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="251031655"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 14:09:01 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 14:09:01 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 8 Jul 2026 14:09:01 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.19) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 14:09:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C3AkVAqxyI9qbTFgkStdUaF1Lyoo5eVPhjoDvQVdmj1NOMPAUeveuVRYAezKoLSd7FfNDcFqT5vhn6KjCS/2PMXRI+aLoaIpeajSZWIX0vu5G92i+XLC+aLJbHQUyaa9JQoC95pH4mzFH1qxFlrpCjAqIJPrXzATvptsx9qKWo7dLQsUKnZFKeMKc75WRZmFI/Z6TCYbE7rhOjU6xwgQNdyhcKP2OFa9CepoYsH3PNFA13X3sdXYZirDVC5Fxfj5y3rN9Vx/6bbjK9sQ1IqPgmZ3awjL08Xg96zD3tlWgfDrrqN7Ztc78hfg4h8xUn+11tCkYtUULe07KUb2TBcwCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4t6I+v2nwjZ/Y1qZy56auNsZ6MPnotlJMsFaLQnbf2s=;
 b=x+fA+TaDD0pwoORer2pu8EXfQgH6R7/sf5wmrLIXoHgdCcKskagVTEBQ31S7G3H8jHi/fw2IIvslCeiGf9jJwxhNH07CaKyb8UHxDM98sHZ9eHC+BlPkMw7jaH9aNKq9hRbebaa299Z0jxUDtJFR9gw0cQuV0F3QfLrEOc3YcdAc9Q3lNxglhj5XqvBNI02YIPNl5AK9v6CvsSciNQrHQenlKMo7ZNJJiQSdOhfWznsuTwrkbbziIZ+SU6wtFXL2LJtA2JQtNloi61X4/C0KMrihW1hXdkDpmaJv8SAQ9LD5d6NphgjJhceOCRk7cT0XBt1C2wK58MwVJbS089N6Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS4PPF1DFB73954.namprd11.prod.outlook.com (2603:10b6:f:fc02::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 21:08:57 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0181.008; Wed, 8 Jul 2026
 21:08:57 +0000
Date: Wed, 8 Jul 2026 14:08:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Varun Gupta <varun.gupta@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <gustavo.sousa@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH v4] drm/xe: Add debugfs knob to control GPGPU preemption
 granularity
Message-ID: <20260708210855.GB80957@mdroper-desk1.amr.corp.intel.com>
References: <20260618042421.483657-1-varun.gupta@intel.com>
 <20260706141243.1060735-1-varun.gupta@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260706141243.1060735-1-varun.gupta@intel.com>
X-ClientProxiedBy: BY3PR04CA0012.namprd04.prod.outlook.com
 (2603:10b6:a03:217::17) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS4PPF1DFB73954:EE_
X-MS-Office365-Filtering-Correlation-Id: d582b284-e9a1-4a78-dfed-08dedd351ff1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|18092099006|22082099003|18002099003|4143699003|3023799007|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: K2y08r2xWFejgSV8UWm49VerABiBsxylhPrSfpSl0RAUdXJq1ElqI3ffD2x8ORV56n09Ou7Y5M1bEkpjvlCbrXcJAFLY6PQon+PqTWTui3I+rCfiRdELMsj5EYvaw1y06HbZig5kJDMk/q84jw4skjjGiUAn3GhWZaNT/Y38jIOecj8VSJ5uEjIGtv+sdHByWZ8WHEsvCf1M0LKvaIUleOBGuWnvjkOC9kOyZQpoazhM5jpa3ZbiETFRJ2NrBroMd91iJVZ1sBQY38ChSTB6hg42Tfabb96QCB59vppI326seD2PAev2sBCJeds9Qfw0+XU1L/mgUyEoiodCVe7Gv5lMTRf55iZITGOo7H7MzxmmxJg8dYlBkLLUMSMzNMckBAhFJR4sbloSqwlPeVzZyWUb3XqGF27FGHt08gpJnVl5sz0UT9PPPBU6urHyn4o5iynCjiDGek6s90gVpGz+/JzZOpOHnjTvDKtOLpsXv794em3OZUTGHkj8X6zUcfv5nHKHzMmIyQasBSxLePfhU/E7N4eszin31Oj9fFYFLT3NdtzMj6iYNDOdy28bFzgJnJtNJgxpqV2ghk6Z588XGupmRVY2UoTIKPDdCaPu9NBQD6nMBg/ZPXNtqUeJiJP08U6NlnemflVxwzdo3E6Sv8hMIvV2dVGdatMJ6ZooV4k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18092099006)(22082099003)(18002099003)(4143699003)(3023799007)(6133799003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g64pT7p9EegQgNWQ2K62msaDArYi3ViHY8C2JnUFInXUN3TWnPmEIxxvBYWD?=
 =?us-ascii?Q?kTjH1XAcN7ml1nWPETbA1QLc9TzAbXPzJuapwPoLk5YUKRrs/ot03dNnK/CD?=
 =?us-ascii?Q?YRRfs/cSdnzL+VHoEMdnxwD1Geug5VUO09PWHfkFfJfFR/8R1v4tHkcPZQOE?=
 =?us-ascii?Q?CLoEvZfK/sU0fV7G+3u4K4rlddALq+f1hAJGlCR8M5CLWCca4zEBVjQNZf+h?=
 =?us-ascii?Q?ThjvYzZsYsjtdK+tWT6nMuV8uy2zFMu7L6frGOqIthGAMlkLS9K5HOl5YJQG?=
 =?us-ascii?Q?bCgxGY2pqI6PtM9hu3QZz/PiZQZ49I2m1hMrq3nR5l8TIW2W9gOQA9v9c1L/?=
 =?us-ascii?Q?1RVFvnxRLb9ORf/POudo5ySd1xYGp5lPOXe/62+isPfZPpyGTFPJx7cmYMrM?=
 =?us-ascii?Q?yjGYK1vYA2Mgk+2FN/Zo8/8gLszUb5HualeJIFBzsoIu7wlz27m1qALcwEl/?=
 =?us-ascii?Q?jgB165jWpj8D4e6TlB3l1IGdmzSbHw0auZaA/fDLTzVdDRe3VeuRt6wzi5Te?=
 =?us-ascii?Q?Volv3cY/rz2fF9d3QGkLQDt1PPusBHk/ZnXa+p5wbvEx//DHwhLboO734+ss?=
 =?us-ascii?Q?rFgz2F0FMkTgPXqJPXXV609cAlGZLt+GnrT8GMrFOh+IqWzztxbBMOb7ACdx?=
 =?us-ascii?Q?SrIi7MLpe1MAe4iI+k8DCU/dvGKu2LxudQvQ9U3+sHkMWF68+60npAPeq2KT?=
 =?us-ascii?Q?J5SgTjO1BIVvCjXgziSjFsFHJHac2BhKLPMkITmkcMabIcUZt0aqnyhOMWBi?=
 =?us-ascii?Q?5az76odoICByFbxIdyDfkvnwXj0TiTp3E+VuCU+MzQ0JwIjORsrwLxGZ0mlQ?=
 =?us-ascii?Q?hGkThozDLJO/DysvPLt0IIqksS+cw7Ozmu7MlLQOptf3SlX6cPgqnANS6Jyv?=
 =?us-ascii?Q?0BdCsnKwtYMdt9WTkPS+SjpZLo9LHJ+prbvJyo1E0e+whbGCSUsYMCSPt10Z?=
 =?us-ascii?Q?3hFxx/QdgLqYNljm62MaMPJpwIE72/I5Z95IS14N1f46am7TgQ5lZVosKqmt?=
 =?us-ascii?Q?gpGKGJqsCJOVQvnLayxCb7CDubM/Nb6PE5DDtYN4vZXaqcs9IVKrG7C0AZxa?=
 =?us-ascii?Q?fFSyEtJQ2PTdXaoPfnx1/vihBIxdhuqWzp8CtAtZ24C7HiaqV58L6bcg99jK?=
 =?us-ascii?Q?t3HDhJioI/Z8fNed4GpgvvpRc86vuxsvyGkLmF2/e0zZYE7SPUp8B3FO6GvK?=
 =?us-ascii?Q?f9vohMcObAgeQ0fIP5pceGehYQAlYi+JEhdvtId4EI301+TnjLpelSkmE9vD?=
 =?us-ascii?Q?hLUMkMO8Wqo+mHIk7P7qNm17rYFWrAPT7nCkqrwLCIdv2QGA0UfxgVFZ8Hvs?=
 =?us-ascii?Q?YguWfIyR5gKeJoxXAaEgoQzbrSjbxow7JgRE4VZroaWBj5opa+sZro4+8oiv?=
 =?us-ascii?Q?wJW1qrmDsWU02LDfcpmz4OzPebEwoHhIc1ADLPgm6hnvIYkZIKti/gjmgHBt?=
 =?us-ascii?Q?CKCTHT0A8tWmng8EsYBIy2EvUwagSt1hlIHr7A84Tok4K8RgKTR8bZKA3Chj?=
 =?us-ascii?Q?lrZFh/unYHIjNM97QV8g+kubEBQ/WiCWizJZAFv3MxlCPIHp3VyAQ0OhDLRq?=
 =?us-ascii?Q?J8l2138Wc6RgUYDfCROjDzTTSxLYy2DUv9FHaR3bGbS79706hTee++IQKlWZ?=
 =?us-ascii?Q?KShBKbzksn26EYSevIgcvQLQado2HZ1B50kfDSx1XojlrcFDv1WXuMlWPAXk?=
 =?us-ascii?Q?FyqISvijwRn6zlo90fN44gi5OFB6G/deuXk/vaKBhCvi3oLvLWz9QQwhY6Hi?=
 =?us-ascii?Q?A8OMbFkce07xANeD3DLbB2u7j4vuE6s=3D?=
X-Exchange-RoutingPolicyChecked: hHLDj7Wizc0U/GW/PT/tdtDkl2VaIGkvNmiZuQjsH3lDrryhmhrAQo3MGR63RF2PbQJ+cN/cZA5qhmB3KIrDsFTVAm73soOOyWStP7d+V2kEVyfBVV7FZflZWax4r+Z6UumFkNOcg8Yf7i88+gsykUiMhXPTSv0OfBd1U8cES0VQyMiGdbrR3Az8zcl/snpl6R/UcRCd1sFCZgkU7FaN4zOrrTRGVhW1BWXCF+In0mmK9bbsdoL2KY86ifwOyvmRm+Gx9stNhnEVbYUy5ahj6W2IBjex1bPZVuOUWxJgvBuMM+kXmkgrn5se7uSzKjou9BCP5FAbrZtnIjZnVoaqGA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d582b284-e9a1-4a78-dfed-08dedd351ff1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 21:08:57.5790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5/Zs7FY1Rbpf4K8jQh2jCnk6psSiLWtor52DZhdU0Bk/7jym3ME0OefrZw2d824l15/lt5B2Rb2tNdoOWAtUS2qLZrwsQPmhw11fd7BlgT0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF1DFB73954
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

On Mon, Jul 06, 2026 at 07:42:43PM +0530, Varun Gupta wrote:
> Add a per-GT debugfs entry 'preemption_level' that controls the GPGPU/
> Media preemption granularity for newly created RCS/CCS LRCs on Xe2+.
> 
> The knob accepts: "default", "mid-thread", "thread-group", "command",
> corresponding to CS_CHICKEN1[2:1].
> 
> Per-context control requires FF_SLICE_CS_CHICKEN1[14] (Per Context
> Preemption Granularity Control) to be active; without it CS_CHICKEN1[2:1]
> is ignored by hardware. Two new RTP entries are added for Xe2+ RCS and

Rather than saying it's ignored by the hardware, I'd say that the
hardware uses a single system-wide preemption control setting from
FF_SLICE_CS_CHICKEN2 instead of per-context settings in each LRC's copy
of CS_CHICKEN1.

> CCS engines to arm this gate bit.
> 
> CS_CHICKEN1 is part of the hardware context image and is saved/restored
> automatically on every context switch (Bspec: Render Engine Context Image
> Layout, DW offset 0x00E2). The preemption level is therefore written
> directly into the cloned context image via xe_lrc_write_ctx_reg() in
> xe_lrc_ctx_init() for each new LRC.
> 
> Because Xe2 CCS engines historically shared the xe2_xcs_offsets layout
> with non-compute engines, a dedicated xe2_ccs_offsets layout is introduced
> to safely map CS_CHICKEN1 exclusively for Compute contexts.
> 
> The debugfs entry is registered only on Xe2+ GTs with RCS/CCS engines
> and only for the Physical Function (!IS_SRIOV_VF). If hardware fuses
> indicate Mid-Thread Preemption is disabled in silicon, attempts to
> select "mid-thread" are rejected with -EPERM under a forcewake lock.
> Selecting any non-default value taints the kernel (TAINT_USER) as it
> deviates from the platform default.

Overall I feel like this commit message is doing a bit too much "what"
explanation and not enough "why."  We can always add debugfs interfaces
to change all kinds of internal things, but what we should explain in
the commit message is *why* this one is important to control, and why
it's important to control in a per-context manner (rather than just
using the system-wide enable/disable controls).

I think there are some things in the "what" explanation above that
aren't fully correct, but I'll leave the comments on those in the code
below.

> 
> v4
>   - Fix incorrect NOP padding in the RCS context layout. (Sashiko)
> 
> v3:
>   - Wrapped XEHP_FUSE4 forcewake read with xe_pm_runtime_get/put to
>     prevent PCIe aborts/timeouts when the GPU is in D3hot/D3cold. (sashiko)
>   - Fixed NOP macro truncation by splitting padding offsets larger than
>     0x7f into multiple NOPs, ensuring correct context layout. (sashiko)
>   - Converted CTX_CS_CHICKEN1 initialization to a read-modify-write
>     sequence to avoid overwriting golden context mask bits. (sashiko)
>   - Removed the FF_SLICE_CS_CHICKEN1 workaround for CCS engines, as
>     compute engines lack this 3D fixed-function register, which was
>     causing GuC "illegal register" panics on initialization.
> 
> v2:
>   - Dropped the WA BB/MI_LRI path; per Bspec, CS_CHICKEN1 is context
>     save/restore state at DW 0x00E2, so we map CTX_CS_CHICKEN1 and program
>     it directly in LRC init via xe_lrc_write_ctx_reg(). (Matt)
>   - Split Xe2 CCS context offsets into a dedicated xe2_ccs_offsets array
>     to map CS_CHICKEN1 without polluting other XCS engines.
>   - Converted the debugfs interface from a binary boolean to a
>     multi-option string knob ("default", "mid-thread", "thread-group",
>     "command"). (Gustavo)
>   - Restricted file creation to the Physical Function
>     (!IS_SRIOV_VF). (Gustavo)
>   - Added kernel tainting (TAINT_USER) when deviating from
>     defaults. (Gustavo)
>   - Added power-safe hardware fuse check (FUSE4 register 0x9114[20],
>     CFEG_WMTP_DISABLE) before allowing MTP selection. (Matt)
> 
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_lrc_layout.h |  2 +
>  drivers/gpu/drm/xe/xe_gt_debugfs.c      | 85 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_types.h        | 31 +++++++++
>  drivers/gpu/drm/xe/xe_lrc.c             | 52 +++++++++++++++
>  drivers/gpu/drm/xe/xe_wa.c              |  6 ++
>  5 files changed, 176 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> index 4ab86fc369fd..2236debf5534 100644
> --- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> +++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> @@ -37,6 +37,8 @@
>  #define CTX_QUEUE_TIMESTAMP		(0xd0 + 1)
>  #define CTX_QUEUE_TIMESTAMP_UDW		(0xd2 + 1)
>  
> +#define CTX_CS_CHICKEN1         (0xe2 + 1)

Are you sure this is the right offset?  Looking at bspec 65182, I count
CS_CHICKEN1 as being 94 dwords (0x5e in hex) beyond CTX_QUEUE_TIMESTAMP.
So 0xd0 + 0x5e = 0x12e.

Looking on a BMG machine, default_lrc_rcs in debugfs confirms that this
seems to be correct:

        LRC[0x12e]  =  - 0x2580 = 0xffff0001

The 0xe2 value you have here appears to correspond to the location of
one of register TR_NULL_GFX in the LRC:

        LRC[ 0xe2]  =  - 0x4410 = 0x00000000

> +
>  #define INDIRECT_CTX_RING_HEAD		(0x02 + 1)
>  #define INDIRECT_CTX_RING_TAIL		(0x04 + 1)
>  #define INDIRECT_CTX_RING_START		(0x06 + 1)
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index c38bcacb27e4..b41fafe22a76 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -6,10 +6,13 @@
>  #include "xe_gt_debugfs.h"
>  
>  #include <linux/debugfs.h>
> +#include <linux/panic.h>
> +#include <linux/string.h>
>  
>  #include <drm/drm_debugfs.h>
>  #include <drm/drm_managed.h>
>  
> +#include "regs/xe_gt_regs.h"
>  #include "xe_device.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt.h"
> @@ -23,6 +26,7 @@
>  #include "xe_hw_engine.h"
>  #include "xe_lrc.h"
>  #include "xe_mocs.h"
> +#include "xe_mmio.h"
>  #include "xe_pat.h"
>  #include "xe_pm.h"
>  #include "xe_reg_sr.h"
> @@ -336,6 +340,84 @@ static int force_reset_sync_show(struct seq_file *s, void *unused)
>  }
>  DEFINE_SHOW_STORE_ATTRIBUTE(force_reset_sync);
>  
> +static const char * const preemption_level_names[] = {
> +	[XE_GPGPU_PREEMPT_DEFAULT]      = "default",
> +	[XE_GPGPU_PREEMPT_MID_THREAD]   = "mid-thread",
> +	[XE_GPGPU_PREEMPT_THREAD_GROUP] = "thread-group",
> +	[XE_GPGPU_PREEMPT_COMMAND]      = "command",
> +};
> +
> +static int preemption_level_show(struct seq_file *m, void *unused)
> +{
> +	struct xe_gt *gt = m->private;
> +
> +	seq_printf(m, "%s\n", preemption_level_names[READ_ONCE(gt->gpgpu_preempt_level)]);

Why do we need the READ_ONCE here (and the other READ_ONCE/WRITE_ONCE
uses below)?  It doesn't seem like the compiler optimization /
concurrency cases where these would usually be needed are relevant here.

> +
> +	return 0;
> +}
> +
> +static ssize_t preemption_level_write(struct file *file,
> +				      const char __user *ubuf,
> +				      size_t len, loff_t *offp)
> +{
> +	struct seq_file *m = file->private_data;
> +	struct xe_gt *gt = m->private;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	enum xe_gpgpu_preempt_level new_level;
> +	char buf[16];
> +	int idx;
> +
> +	if (*offp)
> +		return -EINVAL;
> +	if (len >= sizeof(buf))
> +		return -EINVAL;
> +	if (copy_from_user(buf, ubuf, len))
> +		return -EFAULT;
> +	buf[len] = '\0';

I think we can probably use simple_write_to_buffer() for this?

> +
> +	idx = sysfs_match_string(preemption_level_names, buf);
> +	if (idx < 0)
> +		return idx;
> +
> +	new_level = (enum xe_gpgpu_preempt_level)idx;
> +
> +	if (new_level == XE_GPGPU_PREEMPT_MID_THREAD) {
> +		unsigned int fw_ref;
> +		u32 fuse4;
> +
> +		xe_pm_runtime_get(xe);
> +		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +		if (!fw_ref) {
> +			xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +			xe_pm_runtime_put(xe);
> +			return -ETIMEDOUT;
> +		}
> +
> +		fuse4 = xe_mmio_read32(&gt->mmio, XEHP_FUSE4);
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +		xe_pm_runtime_put(xe);

When possible, we prefer to use scope-based runtime PM and forcewake
these days.  So

        guard(xe_pm_runtime)(xe);
        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
        if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FW_GT))
                return -ETIMEDOUT;

        fuse4 = xe_mmio_read32(&gt->mmio, XEHP_FUSE4);

and the references will be dropped automatically when the code exits the
current scope.

Although it might be best if we avoid reading the register here at all.
FUSE4 currently gets used a couple times during GT init (CCS engine
fusing and WMTP fusing) and this is a third place it gets used.  It
would be better if we just read the register value a single time during
driver init, stashed the value in gt->info, and then used that stashed
value in each of the three places.  Then we wouldn't need to worry about
powering up the hardware to access a register here at all.

> +
> +		if (fuse4 & CFEG_WMTP_DISABLE) {
> +			drm_warn(&xe->drm,
> +				 "GT%u: MTP fused off in hardware, cannot select mid-thread\n",
> +				 gt->info.id);
> +			return -EPERM;
> +		}
> +	}
> +
> +	if (new_level != XE_GPGPU_PREEMPT_DEFAULT) {
> +		add_taint(TAINT_USER, LOCKDEP_STILL_OK);
> +		drm_notice(&xe->drm,
> +			   "GT%u: GPGPU preemption overridden to '%s' (applies to new LRCs only)\n",
> +			   gt->info.id, preemption_level_names[new_level]);
> +	}
> +
> +	WRITE_ONCE(gt->gpgpu_preempt_level, new_level);
> +
> +	return len;
> +}
> +DEFINE_SHOW_STORE_ATTRIBUTE(preemption_level);
> +
>  void xe_gt_debugfs_register(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> @@ -368,6 +450,9 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>  	debugfs_create_file("stats", 0600, root, gt, &stats_fops);
>  	debugfs_create_file("force_reset", 0600, root, gt, &force_reset_fops);
>  	debugfs_create_file("force_reset_sync", 0600, root, gt, &force_reset_sync_fops);
> +	if (GRAPHICS_VER(xe) >= 20 && !IS_SRIOV_VF(xe) &&

Why do we skip SR-IOV VF here?  Since this is part of the LRC, I think
it should be relevant in that case as well, right?

> +	    (gt->info.engine_mask & (XE_HW_ENGINE_RCS_MASK | XE_HW_ENGINE_CCS_MASK)))

I don't know if this actually works for CCS engines or not; historically
we've only used it to control the RCS engine's GPGPU pipeline.  Although
the bspec lists "RenderCS, ComputeCS" for this register field, the
actual description is RCS-centric.  CS_CHICKEN1 is also only part of the
LRC on the RCS engine, not the CCS engines.  Choosing between
per-context control of preemption of system-wide control of preemption
in FF_SLICE_CS_CHICKEN1 is something that's only supported for the RCS
engine, so that leaves it ambiguous whether the CCS engines pick up
their preemption settings from CS_CHICKEN1 (which doesn't get
saved/restored on those engines) or from FF_SLICE_CS_CHICKEN2 (which
again has an RCS-centric description in the bspec).

If there's no per-context control of preemption for the CCS engines,
then we don't really need a debugfs to control this at all.  People
debugging preemption behavior can just use tools like intel_reg to 
write the global (not per-context) registers directly and we don't need
any special interface to account for the values changing on context
switch.  So we should probably keep this restricted to just the RCS
engine.

> +		debugfs_create_file("preemption_level", 0600, root, gt, &preemption_level_fops);

We might want to call this "gpgpu_preemption_level" since this only
applies to the gpgpu pipeline.  Historically the render pipeline's
preemption granularity (object-level vs command-level) has been
controlled independently from the gpgpu preemption granularity, and
most people are more familiar with the render setting since we've had to
adjust it for various workarounds many times in the past.

>  
>  	drm_debugfs_create_files(vf_safe_debugfs_list,
>  				 ARRAY_SIZE(vf_safe_debugfs_list),
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index e5588c88800a..b4c677f1047b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -35,6 +35,33 @@ enum xe_gt_eu_type {
>  	XE_GT_EU_TYPE_SIMD16,
>  };
>  
> +/**
> + * enum xe_gpgpu_preempt_level - Per-context GPGPU preemption override mode
> + *
> + * Selects the preemption granularity programmed into CS_CHICKEN1[2:1] for
> + * newly created Xe2+ RCS/CCS LRCs.
> + *
> + * The per-context override is effective only when
> + * FF_SLICE_CS_CHICKEN1[FFSC_PERCTX_PREEMPT_CTRL] is enabled via RTP.
> + *
> + * This setting is GT-scoped and affects only LRCs created after the value is
> + * changed; existing contexts keep their previously programmed value.
> + *
> + * @XE_GPGPU_PREEMPT_DEFAULT: Keep platform default preemption granularity.
> + * @XE_GPGPU_PREEMPT_MID_THREAD: Force mid-thread preemption level.
> + * @XE_GPGPU_PREEMPT_THREAD_GROUP: Force thread-group preemption level.
> + * @XE_GPGPU_PREEMPT_COMMAND: Force command-level preemption.
> + *
> + * Zero-initialized via kzalloc, so XE_GPGPU_PREEMPT_DEFAULT is the safe
> + * default (no override from platform policy).
> + */
> +enum xe_gpgpu_preempt_level {
> +	XE_GPGPU_PREEMPT_DEFAULT = 0,
> +	XE_GPGPU_PREEMPT_MID_THREAD,
> +	XE_GPGPU_PREEMPT_THREAD_GROUP,
> +	XE_GPGPU_PREEMPT_COMMAND,
> +};
> +
>  #define XE_MAX_DSS_FUSE_REGS		4
>  #define XE_MAX_DSS_FUSE_BITS		(32 * XE_MAX_DSS_FUSE_REGS)
>  #define XE_MAX_EU_FUSE_REGS		1
> @@ -219,6 +246,10 @@ struct xe_gt {
>  	 */
>  	u32 ccs_mode;
>  
> +	/**
> +	 * @gpgpu_preempt_level: per-GT GPGPU preemption granularity override.
> +	 */
> +	enum xe_gpgpu_preempt_level gpgpu_preempt_level;
>  	/** @usm: unified shared memory state */

Nitpick: missing a blank line between these two.

>  	struct {
>  		/**
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 3e7c995085d0..903bbda27384 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -567,6 +567,20 @@ static const u8 xe2_rcs_offsets[] = {
>  	LRI(1, 0),              /* [0x47] */
>  	REG(0x0c8),             /* [0x48] R_PWR_CLK_STATE */
>  
> +	NOP(0x7f), NOP(0x1e),              /* Pad from DW 0x44 to 0xe0 */
> +	LRI(1, POSTED),         /* [0xe1] */
> +	REG16(0x580),           /* [0xe2] CS_CHICKEN1 (value at [0xe3]) */
> +
> +	0
> +};

We shouldn't need to update these *_offsets[] tables.  The sole purpose
of these is to populate a handful of the LRIs at the very beginning of
the LRC so that the very first context switch we do to record the
default context loads something that the hardware recognizes as having
the layout of an LRC.  After that very first "restore inhibit" context
switch, all subsequent context switches will cause the bspec to write
the LRC out to memory in the layout documented in the bspec on pages
like 65182, 55793, 60184, etc.  Registers like CS_CHICKEN1 are late
enough in the LRC that we don't need to mimic the hardware's LRC layout
for the very first context switch, and any changes here have no impact
on the things that happen later in the driver.

Also, as noted above, I don't think this is the right offset.

> +
> +static const u8 xe2_ccs_offsets[] = {
> +	XE2_CTX_COMMON,
> +
> +	NOP(0x7f), NOP(0x2e),              /* Pad from DW 0x34 to 0xe0 */
> +	LRI(1, POSTED),         /* [0xe1] */
> +	REG16(0x580),           /* [0xe2] CS_CHICKEN1 (value at [0xe3]) */
> +
>  	0
>  };

Same comment as above, plus CS_CHICKEN1 doesn't appear to be part of the
LRC at all for CCS engines.


Matt
>  
> @@ -636,6 +650,13 @@ static const u8 *reg_offsets(struct xe_device *xe, enum xe_engine_class class)
>  			return xe2_bcs_offsets;
>  		else
>  			return gen12_xcs_offsets;
> +	} else if (class == XE_ENGINE_CLASS_COMPUTE) {
> +		if (GRAPHICS_VER(xe) >= 20)
> +			return xe2_ccs_offsets;
> +		else if (GRAPHICS_VERx100(xe) >= 1255)
> +			return dg2_xcs_offsets;
> +		else
> +			return gen12_xcs_offsets;
>  	} else {
>  		if (GRAPHICS_VER(xe) >= 20)
>  			return xe2_xcs_offsets;
> @@ -1589,6 +1610,37 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
>  	if (xe->info.has_asid && vm)
>  		xe_lrc_write_ctx_reg(lrc, CTX_ASID, vm->usm.asid);
>  
> +	if (GRAPHICS_VER(xe) >= 20 &&
> +	    (hwe->class == XE_ENGINE_CLASS_RENDER ||
> +	     hwe->class == XE_ENGINE_CLASS_COMPUTE)) {
> +		enum xe_gpgpu_preempt_level level = READ_ONCE(gt->gpgpu_preempt_level);
> +
> +		if (level != XE_GPGPU_PREEMPT_DEFAULT) {
> +			u32 level_bits;
> +			u32 val;
> +
> +			switch (level) {
> +			case XE_GPGPU_PREEMPT_MID_THREAD:
> +				level_bits = PREEMPT_GPGPU_MID_THREAD_LEVEL;
> +				break;
> +			case XE_GPGPU_PREEMPT_THREAD_GROUP:
> +				level_bits = PREEMPT_GPGPU_THREAD_GROUP_LEVEL;
> +				break;
> +			case XE_GPGPU_PREEMPT_COMMAND:
> +				level_bits = PREEMPT_GPGPU_COMMAND_LEVEL;
> +				break;
> +			default:
> +				level_bits = 0;
> +				break;
> +			}
> +
> +			val = xe_lrc_read_ctx_reg(lrc, CTX_CS_CHICKEN1);
> +			val &= ~PREEMPT_GPGPU_LEVEL_MASK;
> +			val |= REG_MASKED_FIELD(PREEMPT_GPGPU_LEVEL_MASK, level_bits);
> +			xe_lrc_write_ctx_reg(lrc, CTX_CS_CHICKEN1, val);
> +		}
> +	}
> +
>  	lrc->desc = LRC_VALID;
>  	lrc->desc |= FIELD_PREP(LRC_ADDRESSING_MODE, LRC_LEGACY_64B_CONTEXT);
>  	/* TODO: Priority */
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 139434946f8f..70072963aba0 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -347,6 +347,12 @@ static const struct xe_rtp_table_sr engine_was = XE_RTP_TABLE_SR(
>  	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN1(RENDER_RING_BASE),
>  			     FFSC_PERCTX_PREEMPT_CTRL))
>  	},
> +	{ XE_RTP_NAME("FtrPerCtxtPreemptionGranularityControl-Xe2"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED),
> +		       ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN1(RENDER_RING_BASE),
> +			     FFSC_PERCTX_PREEMPT_CTRL))
> +	},
>  	{ XE_RTP_NAME("18032247524"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
