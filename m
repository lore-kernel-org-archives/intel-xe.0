Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E458ACD342C
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 23:59:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77FB110E09E;
	Mon,  4 May 2026 23:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="atw1FtCO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2219010E09E
 for <intel-xe@lists.freedesktop.org>; Mon,  4 May 2026 23:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777939175; x=1809475175;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hMhrGROdmUm2wH5mwNShToJ6Wg9Z7TEG4rJ7fnJFydI=;
 b=atw1FtCOPheF7peh+bAiGGrr2FuKfTf4oDt12l+wMIE4ivl4dlp+pKuO
 RJG4ZAkKv/z9r2ZJHHDbp2ciLIxvO4Lc9+soyMZ9afyUsjFx4ha5DcUpu
 eJq4z/sqYaN+/+xgaGcTHr9rRlXYmm4XpmXEWdPZ7zB0uzDHn6gqCGIkR
 +ruUJsabHTe0X4LoMJJ40DYfssYfd/Vn0qzBM91kS+ime3o5y/MmdCufX
 15mqQqbdIMdVHTk43ZVH5PwvliOxHUAogw563HM6yf2ojEPJgo6ginPGL
 +KVRDhFErN0RKqDiBAcrzecZ7vgkODZtrInUIOWgTeekCG1pcrDGhoNks w==;
X-CSE-ConnectionGUID: T8u4oZIVSOy5TD1WBUMSPw==
X-CSE-MsgGUID: 5RgnEny/RRKI1eleLQ8Iig==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="89907077"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="89907077"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 16:59:34 -0700
X-CSE-ConnectionGUID: shUjV/ohSkK+wvRmwwYVdQ==
X-CSE-MsgGUID: XFFThpjrQRq1hoUlXHG7eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="259319671"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 16:59:33 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 16:59:32 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 16:59:32 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.57) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 16:59:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kZLSVhV5zWTLLe86Whl4sqgHLv199UsyRi6jGZNcWGQZEKj810hoVUQSj2SzKD8IReKwzipw0nwYhHau7GQ33pbwLDBdhnHKywJz2Dh8DVqScfsl/q/xGfvov+wL8/o20GR/3G7ew7viXW0/2yS1Z8sJokU1F6oLUBjuMOcHXrIsy1u/Az4JfkvIW1seOqDKJWltgP4foPTgpZOdngi5beH8OWWsROQN0Gd7ywrIKBp/t7ONbFcR7H0OYeqrmNMqd3aOuftz7D1rd+PWryQX8H5Ifwp/3DdXcfFP3ySefN+n4iIwPG7XtkBPQLF7oNM0Sfq5stuMkUpleRkQN2e05A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JDaSSg96yR6RRAEnGX16impNZ64ERBtYM0Y2YVLUlvs=;
 b=ELClQfMb7HSj8MXqMfI2GaDoHjHthgKQTtnVWd7WjG2O6k9qul60nWMv1vWvixlSZ6vqZeWQ0SONkOigAdp4idue61UX4I73aB6DExPOmRaJ6Q1jzMcWI+wQUf3KOH+hMFK2wA8n7alORjDQzquLL4CPUsNos3PdJNIqt4ONFq9JaPs/32dZyvE5vFkIUguuoZArcyWX+HBWwkGvEbntWTMi2t/x5zETkwsGJby15zClXYzWEIHPAQD9PssLIaRqeXfYSvAazLHAF3p77EwziFf3YCy1B7OJeIkpjojaBnZUUCdiXrBlMB9wbeKqLPoieP2cENiBd7vC/WXjIyojMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by PH7PR11MB7451.namprd11.prod.outlook.com (2603:10b6:510:27b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 23:59:30 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 23:59:29 +0000
Date: Mon, 4 May 2026 16:59:26 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH v2 2/9] drm/xe: Add timestamp_ms to LRC snapshot
Message-ID: <afky3io69uo2yxKU@nvishwa1-desk>
References: <20260502005332.3135977-11-umesh.nerlige.ramappa@intel.com>
 <20260502005332.3135977-13-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260502005332.3135977-13-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: BYAPR11CA0094.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::35) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|PH7PR11MB7451:EE_
X-MS-Office365-Filtering-Correlation-Id: e7ae264a-e5e5-4945-b287-08deaa392dee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: GCMUAEiS0QBEIxQsgEInYsViPb1j0KdESS2YcqGrtfLOfuhYUlu+77FZS8hAtn50DtvB76vpjOrMGQwb3ByZWM4eDb7aFYd4gE+lVj7WVJgEE/fxpb90jmqe5ACmFMhS7ovST10vBVfUMYbj5vK6PpnfVoW4puw9c34YL/8Fuvo1X0FKvwAw/88BL2li4y1PSa98mvSoT2jIRPOnbIAFmwp0NuqO3ezi5hWVf7pGTyAOIGmEqEbcY8Z28rN4A2zAcenYvrmWOwfAl2Tt6DdqNfc2oEpAsyUtxK5jo6rFAp6G35aROihZpPWAiGRVqYIMGXDVz6DbtIgilER6I5e89CDoKnJ/DmQYW61OejzzLlE1HpSNXDfeHzW6zR9yEnLRPvDH1noD9vToi5vihG8RWhHg2h3dWL/ODvc0chW3BZLXKpJDnjsbGTZjgt/Xxpbq1GfSKPElNpg+089iNDDE+zSVoweVtzwgvY+ITA+ohMNqlBgmy9uMq/iGClhV3p56E9TdOAh0dDsCcSLr1xXUePZ6onTiewPbEqTaVqTSb/OHZU8IVfQIe/nOlQJctEKsRZ7W7Lcd4cdNv7f69kQlo4XNYURah9e7gZvdNajAs1x+fZGA3Kt7hSzRjZ0yMtRN7Gb1FEKu1ZP5Y+Y1lbv2NPBZLbXkgHX6yNbfvmFtCN1+RQobMEcKZsXFc/QiMekp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hlXhwg2wyDSW0O3+be63hBN+utsE3XM0Bgm67mpT3ZtgwKOd47YTev6sSNTC?=
 =?us-ascii?Q?oEAdarkQxdH8HVEGjxQWvZFyqnDiT6UNWAYCRiCsbnRskL9wRRismYw5A0iy?=
 =?us-ascii?Q?6XURrJJArbL0wgAAqUxLAKEuQkpuEnmhEKeE7S6M9OnNvcK4fAHNvJVPiaNN?=
 =?us-ascii?Q?70kV4QuSPju6X2lGQ7y6iTDMKoJxSU+hbUsIF8Ok+WEgc69GsGSqtNgeSTLD?=
 =?us-ascii?Q?GFOOwAfREbBX39iPpktPiHWjCNCsip6aeceToUp0/1A18LBG/ObDfcxT7iTG?=
 =?us-ascii?Q?fSdZsFsom60Ui+8z4Sf476Ys4U2JzSgyrKbcKyf5wDF+LGrRWUQPUDZtfEmJ?=
 =?us-ascii?Q?KFev5YzyfqqMn2V2AyCBnmZ5b8QLbQYmPR1REAKsnc8RwRahW2yx07vZ2Okh?=
 =?us-ascii?Q?6Vy6CG3gVV4kOrSMjbYYFEUOdpaUHbqnCOO2mCjNgaNiqKzOtKqa9F9EDhX2?=
 =?us-ascii?Q?iot+Oq+rFcxWFOSyBH0G5nyCIva40Zl+CbfDFbZkBfO61213K4xyvwLyQexf?=
 =?us-ascii?Q?/XKwCOCRbVNp6nlWOPJ8AtZMJGOVgi39BGQv8gxgKcEmE9d58hOG2gSwhtN1?=
 =?us-ascii?Q?wwq0ZxV81wID+BB9ImkENjImSg5aZx6pPPjO1+f6ixR6E5WTLiFBogt0JRUu?=
 =?us-ascii?Q?3AP2d+xVv59nrQAt6blAx4m5Q/uxKqVDgvilYZwKHensToQSnR4XiwVcSIu1?=
 =?us-ascii?Q?inmrT23BJl1Em4VKxUdGCcSvSDSh/ihk0E1OHDSL1yibTsn0P02gXFjeKdvI?=
 =?us-ascii?Q?8aVApQ8y2om22HGl4hgBPftr8GVQJZkaBzeSJcBWovG3hN4G246psnkAfzaM?=
 =?us-ascii?Q?Szi4Y2oLCuuPiMLGguB4Ffj3+jJQ8oIs4q0fT2lCA+9ZFi90uOiDoDKgTXec?=
 =?us-ascii?Q?BwwVkA7ZhF2CtC2lq9tJwsvfbnwL/T6E16gIDvYZfyiHe/mBwHsoLVVvZy29?=
 =?us-ascii?Q?L3nlFKM7IBxkWdlBkMECouzGn+7YRsMKIV5Cn8JTMRBGjLfrEehEZvTj1E8E?=
 =?us-ascii?Q?yTius/H1JRO0O5+iisodvkLkr15TQzUpePS69rOkXstSQnFwMeKbFgjIHkDg?=
 =?us-ascii?Q?kunPZBCNajbgtrTC+8hgRINuLxiBpmhUPlYCPbKvQnGZb2eNMEx7979s4N2p?=
 =?us-ascii?Q?henxrME2OCIB9/+kHHYEkNupm5tRQSUI63VChEOj+a+AWT5Dqm3w8Jt8/bzZ?=
 =?us-ascii?Q?Bk69BhCnYi+Ng6GsPV4rr5ryg4Q36zJ40O6H2ZiHmftFhSh7ZGjYIpwq6OuM?=
 =?us-ascii?Q?XlHi1f1jdTDe840Hk3wMUehpeijU5Wn74ZaSf6V9Ef76A2TCp6S8+chHvEBr?=
 =?us-ascii?Q?KMkfNfu+FlDpkW6TsYFApJcznvvRHOCAk0EcCdPZbJ+WbTVqUSRHPTonl2im?=
 =?us-ascii?Q?sAaHaarxBuDF+slJCG7ajooIrz3eirsy8mRvrxyLq3DtveNJoVjacLDForuK?=
 =?us-ascii?Q?ofYgMuCxMGrJGpD6ZUEj5WwPvQXdnyJZUiir8Sv8wIMv8sDpAT9ihxrecua2?=
 =?us-ascii?Q?C8Qz0ppFUB10dJjnItgkzrAc1aOYv7npNXoyVxWALPLrz+WpSpw0Gvex75sk?=
 =?us-ascii?Q?q6lB1f1e2y/EzFknxr8P9VX3uXZ0l4QO9lbIigVxGWDcaS1RjZS7G3E4d70P?=
 =?us-ascii?Q?wNy9/BOg5as8fvl77xDn+eK48cxPxnytp0EMS9qDwmhe/+7TeCu8jYzafboo?=
 =?us-ascii?Q?o4i0oXqCkRgmJEtLidMGBgYvePRLDl2AhxkjxqDPY2+t4vsKYw7Mj1CVft4l?=
 =?us-ascii?Q?iRR6XkAYpzWtE9yDzIwM3zfED+ZTif20LEs6pQc7qJIagX8znfNJ?=
X-Exchange-RoutingPolicyChecked: EQs3NRS/tYgQMBt2uEo2Px/89xlm8/fn88hHgl6ZmXvyAhIcqXResSCphk3buJKbvTZFuKLOteTP8gFPQOLEccFza/akGm73N+dA8UrAc3f/qZLFxsg4FsiVGTdAa2JZalyf/Gb3Ok4VQnuyNLxYcBxQz3AfYe3GP026Iy9a2uOhrEPUTTqsYuLcZSroMTYkmHFTzAFAreQAef7HgFn7Z1/rl+9Lo4sf4gpjrj/liMvV9wV2ylHIAT6rj+y7OINIJ1Bd2XsKf3Rb3E5DDI3GLle4P2/sqjsF6W0Pj5s27nMqVU1qdtH5C6C91qDQszqXXJHuEWwgu3kAYfYgaEN7mA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e7ae264a-e5e5-4945-b287-08deaa392dee
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 23:59:29.4919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TfjGHdgF8tT9WvOsG08sT1Gtz9CIi3SAu3QlxAWgugLSMGv4+8d8oW6gHs0uU3dIZwrn/8dRex3RMsBbR5eaFTpOWvSKGV94fbw9hldZDMURqzWsjLJF/VH8IgsRBPfM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7451
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

On Fri, May 01, 2026 at 05:53:35PM -0700, Umesh Nerlige Ramappa wrote:
>From: Matthew Brost <matthew.brost@intel.com>
>
>Add a timestamp in milliseconds to the LRC snapshot to make it easier to
>reason about how long the LRC has been running and the average duration
>of each job.
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_lrc.c | 4 ++++
> drivers/gpu/drm/xe/xe_lrc.h | 1 +
> 2 files changed, 5 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 98dc4d0eb61b..d85c712d106b 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -23,6 +23,7 @@
> #include "xe_drm_client.h"
> #include "xe_exec_queue_types.h"
> #include "xe_gt.h"
>+#include "xe_gt_clock.h"
> #include "xe_gt_printk.h"
> #include "xe_hw_fence.h"
> #include "xe_map.h"
>@@ -2476,6 +2477,8 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
> 	snapshot->replay_size = lrc->replay_size;
> 	snapshot->lrc_snapshot = NULL;
> 	snapshot->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
>+	snapshot->ctx_timestamp_ms =
>+		xe_gt_clock_interval_to_ms(lrc->gt, xe_lrc_ctx_timestamp(lrc));
> 	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
> 	return snapshot;
> }
>@@ -2529,6 +2532,7 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
> 	drm_printf(p, "\tStart seqno: (memory) %d\n", snapshot->start_seqno);
> 	drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->seqno);
> 	drm_printf(p, "\tTimestamp: 0x%016llx\n", snapshot->ctx_timestamp);
>+	drm_printf(p, "\tTimestamp ms: %llu\n", snapshot->ctx_timestamp_ms);

Do we need a separate field for this? Maybe add it in a single line?
drm_printf(p, "\tTimestamp: 0x%016llx (%llums)\n", snapshot->ctx_timestamp, snapshot->ctx_timestamp_ms);

I am hoping we don't have any script that is using these capture dumps which we might be breaking here.

> 	drm_printf(p, "\tJob Timestamp: 0x%08x\n", snapshot->ctx_job_timestamp);
>
> 	if (!snapshot->lrc_snapshot)
>diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>index 62beaffba0af..97aef0327fc8 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.h
>+++ b/drivers/gpu/drm/xe/xe_lrc.h
>@@ -39,6 +39,7 @@ struct xe_lrc_snapshot {
> 	u32 seqno;
> 	u64 ctx_timestamp;
> 	u32 ctx_job_timestamp;
>+	u64 ctx_timestamp_ms;

NIT...may be put ctx_timestamp_ms right after ctx_timestamp?
That way, we won't be adding a u32 in between two u64s.

Niranjana

> };
>
> #define LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR (0x34 * 4)
>-- 
>2.43.0
>
