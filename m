Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D20BC3ABB6
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 02:04:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F4B10E0C0;
	Tue,  6 May 2025 02:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PYM7xSsL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45B710E0C0
 for <intel-xe@lists.freedesktop.org>; Tue,  6 May 2025 02:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746497075; x=1778033075;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xjzGNPGQT0bB1IaCmVLk8Mx52HtXmrUQcD9FjW7SQvc=;
 b=PYM7xSsL+XxuoxSU/Wxr5tQ4pFRhGfje4onMCW5nO6KVpRjCz8wQxSQd
 ibeS6ykFMBML6scJCZdFT0yWAn47SQ8xWsVvPLAUuZhpeg9J8N9Y8Yeco
 /SN4bPJKCyo5Qaj+Oe/MDZa8tjKgQPQKOxYj5JSElB15Js2Ye/5x9kLpL
 dssgW+LeQrkdpJhX1U0TLPCRPIjvnrkihLSGVLxYHodRsNeCr3dRKR+Bu
 sDgxGYcQfDAdnJaQa3yxWVI72KSIfGeSGjZUrGeiTRaC8Bt2z/P+vl0jP
 KmwVc88FK0VhJmxrtxAhH+CIGtvHUbx1DEJfqkxqT4WZAaYEOLMUmDTAg g==;
X-CSE-ConnectionGUID: tcmOWM2nT7KZf9hBkOl5GQ==
X-CSE-MsgGUID: DNneZKP0QPC48SslHKxXFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="59528967"
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; d="scan'208";a="59528967"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 19:04:34 -0700
X-CSE-ConnectionGUID: RhDpUZiAQuGIIYezaxEyQg==
X-CSE-MsgGUID: J0yVQpXxSFeMjgtXL5Heew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; d="scan'208";a="135352246"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 19:04:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 5 May 2025 19:04:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 5 May 2025 19:04:33 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 5 May 2025 19:04:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WH3NAuWv2rQlWqPNDWzUZqEC9ZO+LZhbVsN5lSqxq4iaaIZdffsUNLbQ1zr6vSQpJWyowFWb8r0Ok/NZdvHRCcqbXNog7sACtS5RPjmIi0k7SpREOWV+vhpIX4fmE3cWNh57bg8woFzwnPaO56W14oOa1ZjDHXbe+2wdMwcVSP65yauAn0AF6wSAZ8Haj5o6PadUlEY+b3jL3BnMpSqK9w4+Jqgc8I3eLji6RcdS1+bGix3JVwWxWZ5MhBj49KyD5vgCBNPk2z0ZQQx17UNGFi+39DCV9r9caUOox0hog/q4RbrTO97uMdKuMn0UBsPtqyNqKYKPaCHNka8d8BqMYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z6hXTtgl3yVG54LA3VB8ovhYxG/RvZ5SnnBULid4TLA=;
 b=B4Edw5bTDAMIYoh0hM3N8Quzzjma5fogJBnimSvrVfpzi9WyyAX4sj834LK5fea54PwOEHUQCe5jy9EonPrRd0uwaDcLdprP7mSZT48dXPnx3kZe2X0Yx5w6G5a0z1MhMlrpFYm4kIwZC9YhX6ORbLdcTwomr7Bjox6t4yVXopOaRq5vs0bvuspSj7L6ScfnmX3Gy8sh0rh4G8bxWHqMkJQX54+2EdT3ZioZpfdt58qEE7vRjn/FoguhwV5wuAH5LB54sRaEL2f8O4W8+XW9kXqMH8RyGAY+/TJT4xP/KBAPEO4+mltrfjdTjcs6Bwj5hvJh7FRhZ/fqSyvmdifjCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB6495.namprd11.prod.outlook.com (2603:10b6:8:c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 6 May
 2025 02:03:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 02:03:59 +0000
Date: Mon, 5 May 2025 19:05:23 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v3 4/4] drm/xe: Add WA BB to capture active context
 utilization
Message-ID: <aBluY/izx9yKgiqL@lstrano-desk.jf.intel.com>
References: <20250505225852.1994431-6-umesh.nerlige.ramappa@intel.com>
 <20250505225852.1994431-10-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250505225852.1994431-10-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: BY3PR04CA0010.namprd04.prod.outlook.com
 (2603:10b6:a03:217::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB6495:EE_
X-MS-Office365-Filtering-Correlation-Id: f75ac642-6f4b-43e4-2881-08dd8c4243b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yjcQFuzKDP+kMY2SnI6DyqBKN+Jyx3iBKgs4u1Cf1dR9PKo7547F7P5An93D?=
 =?us-ascii?Q?g7SiloOaPdBoFQnzxDBs9Od9rNvt7wXAcNlp18L08G4D7JQrz0UX6yR14YYp?=
 =?us-ascii?Q?/AZlh23oCE9aQgAEX177yZj7loiTzJZoz5xByWzEg1U09bib8CD0y5EW1g8e?=
 =?us-ascii?Q?xhfA+4knf376jxD6l8FPUEHqlhHt26RSy+eRaYdDN+PW4s+sywLE808XHkSp?=
 =?us-ascii?Q?m8CT/2b2UMyyaXSrzN23I9j3t7n46mVuU9ZQiEs6632rwu7ipST7tFgoBIVd?=
 =?us-ascii?Q?hmWHR1+zEOasinippQToPPQ1Mn9TQaV7sxlvxdpJCRPrzFS7jMlc6xORDFku?=
 =?us-ascii?Q?NYydQdEV2xrusDpyVVp9gWqC1qEmeW8gd1S3azS2sYB/fBcglQBLeAbxZKra?=
 =?us-ascii?Q?wa8DaIvoY8TEKjA1Rz0IdiKxZTJK/SGiH8TY6235IxVeGg7TWD72+zgMIyWL?=
 =?us-ascii?Q?WYbbe7Qjhc7iwZ3QEO2iE5x2G2BGH2fZ5AiiYJy/waN2Afw9U/rqpZhZzvXi?=
 =?us-ascii?Q?2dkNoJsJs3VlgE+WWb/AgG28fbEtU3rqAEaye4Bi+I/2GzsmPOwZnwbYk2LY?=
 =?us-ascii?Q?sjnnNuXe9//hJdKHdvxX7Ps6BYMuyKthvSob2XSJpToGndUBLqa5optapIu7?=
 =?us-ascii?Q?cGNCTrRaFAwmtUCUCgdmAh+pq1t/4EuxreYiS2/ydnyR/d4m9hfO+//y42po?=
 =?us-ascii?Q?+3jFqbcrDpeD/H0R3ZrevTAqOWvDhTxrV7oXutVID54JnbbXFRKC5noZ7sBz?=
 =?us-ascii?Q?5GDJzR83XZcKRaLLocdhFJrrsgBC0l94Mtnwk5c/v9581X9Hb9yhYW8HGHVf?=
 =?us-ascii?Q?l/exdgfmXiaFerjQsIPJATkSXsAlObkrI4ZEr08/tDDfV3V0Jg/v1NPvCFVE?=
 =?us-ascii?Q?RyLmiLKOAxH+S5vyYhvCcCrcfCtYx9DQapyG3hKAA6udFeiTPGPHv/sJzXwY?=
 =?us-ascii?Q?6d6KgpZH9n4FrOLNhP8wVnUpj8GAf7B4yCt0wldY8+wi9M8vKq9Q/AyP5ydm?=
 =?us-ascii?Q?fxfs/Xo3nwrobVtxSElHBZdIalA2nFeMc5zZroloao9WnIBdLSbr5EvnA2Hm?=
 =?us-ascii?Q?meSmdacjfkdrSCDp11K7UAHzBAbxhaxnnDGLifkgRRK9H10+1RiUWcTuVxKZ?=
 =?us-ascii?Q?n5T6h8fMwZ79V6O7BuLzMGTeBB+gy83QIxEud2EnoINWZhskAd1sFS6ejVuh?=
 =?us-ascii?Q?GmqWEoDQ4Yf4xGDaMVfv540phFyeMmLC7/VKfaGqr6lLKhjrOpWTqyYp3/3K?=
 =?us-ascii?Q?0jnuMPQrQcO4aqXI4YCjFG4EbIXwbn9xhhU3nY30okHmGdAlS1lQsYoHc2fC?=
 =?us-ascii?Q?qSfPy3Gwgo0bxYQ79AFjeOiPMoBhqLd5EY4ruMoyI2Al2U8SebVZemyfnuNp?=
 =?us-ascii?Q?kUBaw9A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HdRb0f78KAm7Q7WuQ3VU9KtKnMCSN2OGyUYf1qUNtYWIVFBL3srOcfN0KZoZ?=
 =?us-ascii?Q?ypahFBt7D5kpaOUd5ICEc9b56yREfJajJ3Z5YzNh93gH4RJMIvfEQBor0Xub?=
 =?us-ascii?Q?5tHVaur2cGkgdIOom8S26ZyuL5zsGMrDOFN5FuUelkJvdCwO0TFBHVkWzYDD?=
 =?us-ascii?Q?wk6JDIlNJZsaGbGXX13rVxsRywdQ7U/NXv41Dg3J3YYX4qr7oyI/U8WW8bUg?=
 =?us-ascii?Q?woLBGJtjUGgcok+i85CfonMCllx+jx9sXIGDOxUM8Yu9KhpDbKt54GVkCAJa?=
 =?us-ascii?Q?So6bQfqquwKp/F8y8prAyz8WUSGigRkGFZcZDXZjqSy6cx7g/+xv9/Tu8+Wu?=
 =?us-ascii?Q?YVEJ0JRg8gkQep6h+6iQjaR2GgPL6HqX4oS8D6Z3IL3lHbmwCJVaDnCaQOUb?=
 =?us-ascii?Q?8NVRPV5TUsX1hpRi0UeXsLA+umGewDu/7ZZppUiRDtf+1X93O/J6LF/dMeJu?=
 =?us-ascii?Q?QdRI8fYwk9WIJzBhmQxI1OghH0EHIiMG4pBKqBL23/hjTpkE0JHcrxdloBmU?=
 =?us-ascii?Q?p2NBgBWVmHqgcbqXpgiockDJrMiVRRYuTQ50Q2aWoEh+nB0Yz2guWOMhTRW0?=
 =?us-ascii?Q?3poOzVfrzBPNvHm59bgGvjE00OvwyGcIJI7XTXdzV8mgrSE7JZAF65w5KSGg?=
 =?us-ascii?Q?6mNxhJgdBpl/RqPVauw+EZ8iSUCX8Dj7pobdRjJmu2pefkV788HMt4DQwwZd?=
 =?us-ascii?Q?y87EUuWHhoIINgOSotVsnSuDtDAOV4J4IzFnXFx1P7cRa9QFFNXA88AG0Z2R?=
 =?us-ascii?Q?CkmLiohk93yWIM9tZp7Vr2AbAiSqMSUyIRtSubK3KCHQQcAr/pN0EbPREj9D?=
 =?us-ascii?Q?7Bs7swlLbGk8ytMjvhWF80WZQtbxfgieO317WcZ/5hMhgPXGDYRpMxpv8K6o?=
 =?us-ascii?Q?PDI6qXZWe0e5XUJKTyD9C061OihTXJQspfZBodH601ihD/wof4Th/vcx9zU7?=
 =?us-ascii?Q?Ekh+2QWxl1T5TGcPLzsMMc8LM4+0FgPRMpqB52auopjkC/O+gMOKZsFqPJXw?=
 =?us-ascii?Q?/Q82OKMVoAvjAP6jjBgtheOMQbz/dblYjm/nA+Oc4XbS9x2YY8ZvvZOw0x6O?=
 =?us-ascii?Q?kTR10TgjJ38j+1J6kWcEWhXIntd/3gWF01JlNVbIduWkKVI8Psah/spkRHCW?=
 =?us-ascii?Q?p9h91OP4Hf9ZBwZHXcAHedOORTwyZCEoRTbiky7lMrhnfmZdmCqtn4F+rvDw?=
 =?us-ascii?Q?1Km6ZCtt4oZFK5wytEfogvu+fxlf/x+q2VKbGfVchNl64KWzq8YWkUSQg9g7?=
 =?us-ascii?Q?wbuzo2k9UlyUR0IdvQCKEIKc74NMJoh97eEYgtmnIdpt4NRxkmqjeiYxfPDV?=
 =?us-ascii?Q?0pB8RX2O9lnVd7kZoyyJw29I/Dna8Wqwcolel3dPCMXwWhQTt1KhJHoi9v9K?=
 =?us-ascii?Q?+xceZHSIo+woQi5TmAGy9VgxI8Z5cqP346oUFRzFSsjwHjQe/7AlpKV4pJR1?=
 =?us-ascii?Q?hijHn0SoZ/zWFWaxiVf4QqUQjuSTxd3SBinYPTtCKFsUCoPfp3jhxO1x4XNs?=
 =?us-ascii?Q?Zw+7GGaBkW5upHP/OTJURN8Z9aVTxMcSttJEku5Ci/DEuEfinVSaCF7l2PPG?=
 =?us-ascii?Q?95D3SSu249dQlXSApttNDYbGGvy5KH0RkgFT2hlr3qm0f3YGse2Pk4vjF6sZ?=
 =?us-ascii?Q?lQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f75ac642-6f4b-43e4-2881-08dd8c4243b8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 02:03:59.0323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TLEOQowEk5ZipWwBDzV6dJMVozH3RLBOcfnzOgc5QNpJIe01csvNc79v1bzx2jMvmfSaMX0wV+8tbTVA4FniSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6495
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

On Mon, May 05, 2025 at 03:58:56PM -0700, Umesh Nerlige Ramappa wrote:
> Context Timestamp (CTX_TIMESTAMP) in the LRC accumulates the run ticks
> of the context, but only gets updated when the context switches out. In
> order to check how long a context has been active before it switches
> out, two things are required:
> 
> (1) Determine if the context is running:
> 
> To do so, we program the WA BB to set an initial value for CTX_TIMESTAMP
> in the LRC. The value chosen is 1 since 0 is the initial value when the
> LRC is initialized. During a query, we just check for this value to
> determine if the context is active. If the context switched out, it
> would overwrite this location with the actual CTX_TIMESTAMP MMIO value.
> Note that WA BB runs as the last part of the context restore, so reusing
> this LRC location will not clobber anything.
> 
> (2) Calculate the time that the context has been active for:
> 
> The CTX_TIMESTAMP ticks only when the context is active. If a context is
> active, we just use the CTX_TIMESTAMP MMIO as the new value of
> utilization. While doing so, we need to read the CTX_TIMESTAMP MMIO
> for the specific engine instance. Since we do not know which instance
> the context is running on until it is scheduled, we also read the
> ENGINE_ID MMIO in the WA BB and store it in the PPHSWP.
> 
> Using the above 2 instructions in a WA BB, capture active context
> utilization.
> 
> v2: (Matt Brost)
> - This breaks TDR, fix it by saving the CTX_TIMESTAMP register
>   "drm/xe: Save CTX_TIMESTAMP mmio value instead of LRC value"
> - Drop tile from LRC if using gt
>   "drm/xe: Save the gt pointer in LRC and drop the tile"
> 
> v3:
> - Remove helpers for bb_per_ctx_ptr (Matt)
> - Add define for context active value (Matt)
> - Use 64 bit CTX TIMESTAMP for platforms that support it. For platforms
>   that don't, live with the rare race. (Matt, Lucas)
> - Convert engine id to hwe and get the MMIO value (Lucas)
> - Correct commit message on when WA BB runs (Lucas)
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4532
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |   4 +
>  drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |   1 +
>  drivers/gpu/drm/xe/xe_exec_queue.c       |   2 +-
>  drivers/gpu/drm/xe/xe_lrc.c              | 153 ++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_lrc.h              |   2 +-
>  drivers/gpu/drm/xe/xe_lrc_types.h        |   5 +-
>  drivers/gpu/drm/xe/xe_trace_lrc.h        |   8 +-
>  7 files changed, 163 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 52f4c96c01dc..7ade41e2b7b3 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -43,6 +43,10 @@
>  #define XEHPC_BCS8_RING_BASE			0x3ee000
>  #define GSCCS_RING_BASE				0x11a000
>  
> +#define ENGINE_ID(base)				XE_REG((base) + 0x8c)
> +#define   ENGINE_INSTANCE_ID			REG_GENMASK(9, 4)
> +#define   ENGINE_CLASS_ID			REG_GENMASK(2, 0)
> +
>  #define RING_TAIL(base)				XE_REG((base) + 0x30)
>  #define   TAIL_ADDR				REG_GENMASK(20, 3)
>  
> diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> index 8619244b7c7b..994af591a2e8 100644
> --- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> +++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> @@ -11,6 +11,7 @@
>  #define CTX_RING_TAIL			(0x06 + 1)
>  #define CTX_RING_START			(0x08 + 1)
>  #define CTX_RING_CTL			(0x0a + 1)
> +#define CTX_BB_PER_CTX_PTR		(0x12 + 1)
>  #define CTX_TIMESTAMP			(0x22 + 1)
>  #define CTX_TIMESTAMP_UDW		(0x24 + 1)
>  #define CTX_INDIRECT_RING_STATE		(0x26 + 1)
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 606922d9dd73..cd9b1c32f30f 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -830,7 +830,7 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
>  {
>  	struct xe_device *xe = gt_to_xe(q->gt);
>  	struct xe_lrc *lrc;
> -	u32 old_ts, new_ts;
> +	u64 old_ts, new_ts;
>  	int idx;
>  
>  	/*
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index ae6926dc900e..7b5d5310fd27 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -24,6 +24,7 @@
>  #include "xe_hw_fence.h"
>  #include "xe_map.h"
>  #include "xe_memirq.h"
> +#include "xe_mmio.h"
>  #include "xe_sriov.h"
>  #include "xe_trace_lrc.h"
>  #include "xe_vm.h"
> @@ -655,6 +656,7 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
>  #define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET + 8)
>  #define LRC_CTX_JOB_TIMESTAMP_UDW_OFFSET (LRC_CTX_JOB_TIMESTAMP_OFFSET + 4)
>  #define LRC_PARALLEL_PPHWSP_OFFSET 2048
> +#define LRC_ENGINE_ID_PPHWSP_OFFSET 2096
>  
>  u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
>  {
> @@ -704,6 +706,11 @@ static inline u32 __xe_lrc_parallel_offset(struct xe_lrc *lrc)
>  	return xe_lrc_pphwsp_offset(lrc) + LRC_PARALLEL_PPHWSP_OFFSET;
>  }
>  
> +static inline u32 __xe_lrc_engine_id_offset(struct xe_lrc *lrc)
> +{
> +	return xe_lrc_pphwsp_offset(lrc) + LRC_ENGINE_ID_PPHWSP_OFFSET;
> +}
> +
>  static u32 __xe_lrc_ctx_timestamp_offset(struct xe_lrc *lrc)
>  {
>  	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP * sizeof(u32);
> @@ -745,6 +752,7 @@ DECL_MAP_ADDR_HELPERS(ctx_timestamp)
>  DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw)
>  DECL_MAP_ADDR_HELPERS(parallel)
>  DECL_MAP_ADDR_HELPERS(indirect_ring)
> +DECL_MAP_ADDR_HELPERS(engine_id)
>  
>  #undef DECL_MAP_ADDR_HELPERS
>  
> @@ -932,6 +940,65 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
>  	xe_bo_unpin(lrc->bo);
>  	xe_bo_unlock(lrc->bo);
>  	xe_bo_put(lrc->bo);
> +	xe_bo_unpin_map_no_vm(lrc->bb_per_ctx_bo);
> +}
> +
> +/*
> + * xe_lrc_setup_utilization() - Setup wa bb to assist in calculating active
> + * context run ticks.
> + * @lrc: Pointer to the lrc.
> + *
> + * Context Timestamp (CTX_TIMESTAMP) in the lrc accumulates the run ticks of the
> + * context, but only gets updated when the context switches out. In order to
> + * check how long a context has been running before it switches out, two things
> + * are required:
> + *
> + * (1) Determine if the context is running
> + * To do so, we program the wa bb to set an initial value for CTX_TIMESTAMP in
> + * the lrc. The value chosen is 1 since 0 is the initial value when the lrc is
> + * initialized. During a query, we just check for this value to determine if the
> + * context is active. If the context switched out, it would overwrite this
> + * location with the actual CTX_TIMESTAMP MMIO value. Note that wa bb will run
> + * after the context has been restored, so reusing this lrc location will not
> + * clobber anything.
> + *
> + * (2) Calculate the time that the context has been running for
> + * The CTX_TIMESTAMP ticks only when the context is active. If a context is
> + * active, we just use the CTX_TIMESTAMP MMIO as the new value of utilization.
> + * While doing so, we need to read the CTX_TIMESTAMP MMIO from the specific
> + * engine instance. Since we do not know which instance the context is running
> + * on until it is scheduled, we also read the ENGINE_ID MMIO in the wa bb and
> + * store it in the PPHSWP.
> + */
> +#define CONTEXT_ACTIVE 1ULL
> +static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
> +{
> +	u32 *cmd;
> +
> +	cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
> +
> +	*cmd++ = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
> +	*cmd++ = ENGINE_ID(0).addr;
> +	*cmd++ = __xe_lrc_engine_id_ggtt_addr(lrc);
> +	*cmd++ = 0;
> +
> +	*cmd++ = MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);
> +	*cmd++ = __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
> +	*cmd++ = 0;
> +	*cmd++ = lower_32_bits(CONTEXT_ACTIVE);
> +
> +	if (GRAPHICS_VER(lrc_to_xe(lrc)) >= 20) {

Same suggestion as the previous patch:

s/GRAPHICS_VER(...)/xe->info.has_64bit_ctx_timestamp ?

I think everything else LGTM.

Matt

> +		*cmd++ = MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);
> +		*cmd++ = __xe_lrc_ctx_timestamp_udw_ggtt_addr(lrc);
> +		*cmd++ = 0;
> +		*cmd++ = upper_32_bits(CONTEXT_ACTIVE);
> +	}
> +
> +	*cmd++ = MI_BATCH_BUFFER_END;
> +
> +	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
> +			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
> +
>  }
>  
>  #define PVC_CTX_ASID		(0x2e + 1)
> @@ -973,10 +1040,17 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	if (IS_ERR(lrc->bo))
>  		return PTR_ERR(lrc->bo);
>  
> +	lrc->bb_per_ctx_bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4K,
> +						  ttm_bo_type_kernel,
> +						  bo_flags);
> +	if (IS_ERR(lrc->bb_per_ctx_bo)) {
> +		err = PTR_ERR(lrc->bb_per_ctx_bo);
> +		goto err_lrc_finish;
> +	}
> +
>  	lrc->size = lrc_size;
>  	lrc->ring.size = ring_size;
>  	lrc->ring.tail = 0;
> -	lrc->ctx_timestamp = 0;
>  
>  	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
>  			     hwe->fence_irq, hwe->name);
> @@ -1049,7 +1123,13 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  				     xe_lrc_read_ctx_reg(lrc, CTX_CONTEXT_CONTROL) |
>  				     _MASKED_BIT_ENABLE(CTX_CTRL_PXP_ENABLE));
>  
> -	xe_lrc_write_ctx_reg(lrc, CTX_TIMESTAMP, 0);
> +	lrc->ctx_timestamp = CONTEXT_ACTIVE;
> +	xe_lrc_write_ctx_reg(lrc, CTX_TIMESTAMP,
> +			     lower_32_bits(CONTEXT_ACTIVE));
> +	if (GRAPHICS_VER(lrc_to_xe(lrc)) >= 20) {
> +		xe_lrc_write_ctx_reg(lrc, CTX_TIMESTAMP_UDW,
> +				     upper_32_bits(CONTEXT_ACTIVE));
> +	}
>  
>  	if (xe->info.has_asid && vm)
>  		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ASID, vm->usm.asid);
> @@ -1078,6 +1158,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	map = __xe_lrc_start_seqno_map(lrc);
>  	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
>  
> +	xe_lrc_setup_utilization(lrc);
> +
>  	return 0;
>  
>  err_lrc_finish:
> @@ -1297,6 +1379,21 @@ struct iosys_map xe_lrc_parallel_map(struct xe_lrc *lrc)
>  	return __xe_lrc_parallel_map(lrc);
>  }
>  
> +/**
> + * xe_lrc_engine_id() - Read engine id value
> + * @lrc: Pointer to the lrc.
> + *
> + * Returns: context id value
> + */
> +static u32 xe_lrc_engine_id(struct xe_lrc *lrc)
> +{
> +	struct xe_device *xe = lrc_to_xe(lrc);
> +	struct iosys_map map;
> +
> +	map = __xe_lrc_engine_id_map(lrc);
> +	return xe_map_read32(xe, &map);
> +}
> +
>  static int instr_dw(u32 cmd_header)
>  {
>  	/* GFXPIPE "SINGLE_DW" opcodes are a single dword */
> @@ -1844,21 +1941,67 @@ void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot)
>  	kfree(snapshot);
>  }
>  
> +static int get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id, u64 *reg_ctx_ts)
> +{
> +	u16 class = REG_FIELD_GET(ENGINE_CLASS_ID, engine_id);
> +	u16 instance = REG_FIELD_GET(ENGINE_INSTANCE_ID, engine_id);
> +	struct xe_hw_engine *hwe;
> +	u64 val;
> +
> +	hwe = xe_gt_hw_engine(lrc->gt, class, instance, false);
> +	if (xe_gt_WARN_ONCE(lrc->gt, !hwe || xe_hw_engine_is_reserved(hwe),
> +			    "Unexpected engine class:instance %d:%d for context utilization\n",
> +			    class, instance))
> +		return -1;
> +
> +	if (GRAPHICS_VER(lrc_to_xe(lrc)) >= 20)
> +		val = xe_mmio_read64_2x32(&hwe->gt->mmio,
> +					  RING_CTX_TIMESTAMP(hwe->mmio_base));
> +	else
> +		val = xe_mmio_read32(&hwe->gt->mmio,
> +				     RING_CTX_TIMESTAMP(hwe->mmio_base));
> +
> +	*reg_ctx_ts = val;
> +
> +	return 0;
> +}
> +
>  /**
>   * xe_lrc_update_timestamp() - Update ctx timestamp
>   * @lrc: Pointer to the lrc.
>   * @old_ts: Old timestamp value
>   *
>   * Populate @old_ts current saved ctx timestamp, read new ctx timestamp and
> - * update saved value.
> + * update saved value. With support for active contexts, the calculation may be
> + * slightly racy, so follow a read-again logic to ensure that the context is
> + * still active before returning the right timestamp.
>   *
>   * Returns: New ctx timestamp value
>   */
> -u32 xe_lrc_update_timestamp(struct xe_lrc *lrc, u32 *old_ts)
> +u64 xe_lrc_update_timestamp(struct xe_lrc *lrc, u64 *old_ts)
>  {
> +	u64 lrc_ts, reg_ts;
> +	u32 engine_id;
> +
>  	*old_ts = lrc->ctx_timestamp;
>  
> -	lrc->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
> +	lrc_ts = xe_lrc_ctx_timestamp(lrc);
> +	if (lrc_ts == CONTEXT_ACTIVE) {
> +		engine_id = xe_lrc_engine_id(lrc);
> +		if (!get_ctx_timestamp(lrc, engine_id, &reg_ts))
> +			lrc->ctx_timestamp = reg_ts;
> +
> +		/* read lrc again to ensure context is still active */
> +		lrc_ts = xe_lrc_ctx_timestamp(lrc);
> +	}
> +
> +	/*
> +	 * If context switched out, just use the lrc_ts. Note that this needs to
> +	 * be a separate if condition. Do not convert this to an else block
> +	 * corresponding to the above if.
> +	 */
> +	if (lrc_ts != CONTEXT_ACTIVE)
> +		lrc->ctx_timestamp = lrc_ts;
>  
>  	trace_xe_lrc_update_timestamp(lrc, *old_ts);
>  
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 513093c2b5d6..a0661ac6b1bc 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -138,6 +138,6 @@ u64 xe_lrc_ctx_job_timestamp(struct xe_lrc *lrc);
>   *
>   * Returns the current LRC timestamp
>   */
> -u32 xe_lrc_update_timestamp(struct xe_lrc *lrc, u32 *old_ts);
> +u64 xe_lrc_update_timestamp(struct xe_lrc *lrc, u64 *old_ts);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
> index cd38586ae989..ae24cf6f8dd9 100644
> --- a/drivers/gpu/drm/xe/xe_lrc_types.h
> +++ b/drivers/gpu/drm/xe/xe_lrc_types.h
> @@ -52,7 +52,10 @@ struct xe_lrc {
>  	struct xe_hw_fence_ctx fence_ctx;
>  
>  	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
> -	u32 ctx_timestamp;
> +	u64 ctx_timestamp;
> +
> +	/** @bb_per_ctx_bo: buffer object for per context batch wa buffer */
> +	struct xe_bo *bb_per_ctx_bo;
>  };
>  
>  struct xe_lrc_snapshot;
> diff --git a/drivers/gpu/drm/xe/xe_trace_lrc.h b/drivers/gpu/drm/xe/xe_trace_lrc.h
> index 5c669a0b2180..d525cbee1e34 100644
> --- a/drivers/gpu/drm/xe/xe_trace_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_trace_lrc.h
> @@ -19,12 +19,12 @@
>  #define __dev_name_lrc(lrc)	dev_name(gt_to_xe((lrc)->fence_ctx.gt)->drm.dev)
>  
>  TRACE_EVENT(xe_lrc_update_timestamp,
> -	    TP_PROTO(struct xe_lrc *lrc, uint32_t old),
> +	    TP_PROTO(struct xe_lrc *lrc, uint64_t old),
>  	    TP_ARGS(lrc, old),
>  	    TP_STRUCT__entry(
>  		     __field(struct xe_lrc *, lrc)
> -		     __field(u32, old)
> -		     __field(u32, new)
> +		     __field(u64, old)
> +		     __field(u64, new)
>  		     __string(name, lrc->fence_ctx.name)
>  		     __string(device_id, __dev_name_lrc(lrc))
>  	    ),
> @@ -36,7 +36,7 @@ TRACE_EVENT(xe_lrc_update_timestamp,
>  		   __assign_str(name);
>  		   __assign_str(device_id);
>  		   ),
> -	    TP_printk("lrc=:%p lrc->name=%s old=%u new=%u device_id:%s",
> +	    TP_printk("lrc=:%p lrc->name=%s old=%llu new=%llu device_id:%s",
>  		      __entry->lrc, __get_str(name),
>  		      __entry->old, __entry->new,
>  		      __get_str(device_id))
> -- 
> 2.43.0
> 
