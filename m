Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F46CD342C
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 23:52:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA42B10E09E;
	Mon,  4 May 2026 23:52:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N26SPlHa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 168C710E09E
 for <intel-xe@lists.freedesktop.org>; Mon,  4 May 2026 23:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777938723; x=1809474723;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7SVEsv/4Q4w5CnuRI2Pa1lFvH6gfW5D2CFPR9A68UUI=;
 b=N26SPlHa29UYnomhWUose0BlRTTbqndsgQw2GTgF3VWjlcdSqjiwCt99
 pvff0jLZ35pCgCg0Lngm90EX8NlchsGbcDCD3RoSkwRSL3D7Y8sjmwpYV
 I2XJorheGmEDrQRF32xh/U4xmsO3fshePC9gQLFrswWjIZeJlwW6BxvX1
 qpDNPoPb/Ct2mK3ZArOr9pI7UyemrR41w8UvF5ltFb27QrQ2fyUGgNu13
 uga7reBUBfL/PVbXDryPFr+Axy+lpUF5fhGxxY4uKxTjlsui2Btv8kCAX
 gQP6Vx2ijxl8WI6hfUloRslRnGTj+3sKwDJuII9RTY9raMDTGp8Xs6Y9Z Q==;
X-CSE-ConnectionGUID: yL2Ft6gaTr2cAlbD93mB7g==
X-CSE-MsgGUID: 9RuOwMXORUOQ8qHas4RtXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="77825635"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="77825635"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 16:52:00 -0700
X-CSE-ConnectionGUID: qBiur8h7QGeMwrCpYZeuDQ==
X-CSE-MsgGUID: /rFy82mySK+NWOLBB5PBTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="235905852"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 16:51:58 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 16:51:57 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 16:51:57 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.31) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 16:51:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OMQ1p07Tk5t54XV9MBwszMQmjAd6cwlt3P+9CTZtqT9wY36Zg8jTHyhbqI9gAI6AU3acaH5wLoBPFTg/UELOiKtIQEXuPQc64gizvLN9AItqq6ocTDL3zZUJJhxAygwIk+St9k9IEYua86J05JosvUkR5Qp3HLFq3xoauEI9uGAtYzGbdboTM5s7tyjIJbhhaLtgL2A8L5aPPWzaf4oh/5HQvyRhBv1u1iNqq1v2eqQts+PNu1FkzwMmBadGGGM/qXD2L2fBGGD3Wt/hr2Op6aytJxp9gvddBTXbf5uJIlMPCG3iuaA9GJK7nT1bHkIQ0jnEos717cCgLlTUxOipyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BS570U1OEAcDOrVKuOGUJMkUz7mUbDF/5ZOIWT54YPU=;
 b=NdJiB9eZ/MxZ8tdzAz+ww11JJzzayVSXqsqItEUp1zkihniqxQdOTaMu48HLIaImEPk3oF8icL89ynqvHuCLIB+uMyzGQqrHIba+qQcfAJSFXPHuRDXdPI4jvz5vA+phSkhh4PY8+FOvCwYDvOvIK9mVF7VzLq9zT+cs26V+LL+KHeOcGhG3864a6T5fI2WBqfoJ4QFs8pxony2220GZQKauahCFB4Wh8WTJpIBFSz+JSBIntlPT9d2fPtmZukTVcKcpLAh3XkPvWTTp39MAIzy/75lfxdxaACATvIqfLeiBhX+XXSrS/+C+YZi+/IPLbR674Bwhwh/drWMukGCN1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by IA1PR11MB9520.namprd11.prod.outlook.com (2603:10b6:208:59e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 23:51:54 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 23:51:53 +0000
Date: Mon, 4 May 2026 16:51:51 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH v2 1/9] drm/xe/lrc: Use 64 bit ctx timestamp in the LRC
 snapshot
Message-ID: <afkxF3NthDylsl5q@nvishwa1-desk>
References: <20260502005332.3135977-11-umesh.nerlige.ramappa@intel.com>
 <20260502005332.3135977-12-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260502005332.3135977-12-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0335.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::10) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|IA1PR11MB9520:EE_
X-MS-Office365-Filtering-Correlation-Id: 26760c1c-ecd9-4497-d8c6-08deaa381e4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: 5RS5Lc23kGmuRLnSMmqb2lfbvoDGFcVUCmPs1LANs70tx0bgGuhbqeCbto5D2Jqrh4C+cVPY68jF0ZHja9lq06zexhfIAcsfpkexBF0IwrcXbWlwUiDmQrOJsijR2dzrZ4NQiGqFRTb6oDqqRvJTwdjD+4pX2/RihY4IyfeZe/MElQGmflVZ6bh6n2b8MPKbA6sdp1mydR8r5S966edjCST9J2+OunZ0mKmfNoLktzCRPN1ylCPxMsxKz8B44+pxmoU2LesMkmEboVXXMqluBFj0gx+OYM8qct8RTjNO2ofj523bjmdvzI/1HjpOfcdFDF1jbw0FeIzKlqjRaghwDzCtGND1kGezTz9zy2cBGp4GxV7WFDA29vdC+oQDaNe6T4yU6opH9/waK1t+vazhnhrEhir3jvd7g7bQ+WL9yf2e6JO+KhIHg0kkcGE0yyyaWFjYhfioxViu7+2EH1Syg8uOAoQaCHtzpybZhUzEdHWeTQajOTy4RM7v8CXdPHskMzTDxE4etKYka1aqlrcHkOQeJKxy7V4qVlps5UIO+BUZo9UWSes7u71RjTGrhUDqJaLSNr/Vrigao8gSN7Gm6FynreLk3nY7kP14K01HwbIXHjhLUNcZDdYxWpD+7ZpxpvhqnANTcPTwaJ2w0Gw7Kko4TkQTeAgSk/f5xgD2FLRHguzHlDahW+3TsVQAUnQS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HgLUnlIOTqU2vFBahdufiFKBxIzaVJOk/95v2jZ2p2azADGk8OixsWhTD+u3?=
 =?us-ascii?Q?GtfMSFqOLXbui4VzbJJ1vhmpVm/lZCqpETFuF2Ge9UzbZXJfMIV1G4AdipOD?=
 =?us-ascii?Q?r3QdpOjnoRRdP1lCRgqo3mGl11D89uvsXQVomsrmDA0lYL0Bt2McWLOecWZi?=
 =?us-ascii?Q?yd6ghifdcpBvBy8EzIj8Roo5NRVv4tasMYV2E12YDA0p+9rNSYn0D4yslNab?=
 =?us-ascii?Q?AhmvE/qXavn9oJXINMxaLP3pOxfEA3W8n6cnKY4KstCsrjiWv2Hw09XDhT/C?=
 =?us-ascii?Q?e22WfquEeMYC/hcJZACTSoROo2cLZT3NxFbjdixiU4a8fqkyufnFVFVGV5Dv?=
 =?us-ascii?Q?iBQc15RLLzJ67uSUhYi6dTmpkrZzPxyt68rsXFD76+PZz5ytu9GfXTJPwwIK?=
 =?us-ascii?Q?zJyVb6mAVwZTUCdZOkmSJSyvXFGBLj4u8uamp4QGvItqQamOb1fNV0bd/2kV?=
 =?us-ascii?Q?OrK5yrUdGm0UVDsPsXGznH2iAfPmq1h03zjL+E13rwb90PP9FsytV8GCRIuA?=
 =?us-ascii?Q?zJ9zU3GfKwBWoDt8RlxUJtiftqe8xLHwWLgVvsewF/Haw8v9H2rzjqXCk4Xu?=
 =?us-ascii?Q?QdAJWkQitaTpEbtS6EdaargeN+u6xiyQt4p6HjPWLGWNwMeq7BHDpbWSjxDp?=
 =?us-ascii?Q?4yQsQZwhWfcNAoTwKvjymx7aCTgcmI+8pxAvoHBEgM9G/jZHwxEX1EJsJJlC?=
 =?us-ascii?Q?4sCaUEDwQ6Njsr5QS3qTtXFh+jMjqs+tjh1iZqCU891HGGDaoE4WFeqoPhjd?=
 =?us-ascii?Q?UG/uUwtxtlEP71JaeYAoNqQPp2YbUU96lrW6h20QfchWmeO+jRu9RS1iUEL/?=
 =?us-ascii?Q?/iaII347+2xU18ydF9BtGtrTIfQA0/VcjbtJExbyPaNm1mD18L18u0w7Ia0d?=
 =?us-ascii?Q?W2xr/4HAuORp42X7XE4qSK5ZHkabPpH1yPla+FPRByoz54StXmEj+Sq6gU1E?=
 =?us-ascii?Q?tnCoVH6JYp8ow0b1v9QdpMaanXKnxoXRuPMNPPJ3eCUgYDnfZTMcvWcHuM6B?=
 =?us-ascii?Q?iVWkWn7ZezyB/nNStLuQ3N2uhKFfxWnzOsOMp0vJ8Qc4w3EW8159NKrkWoVT?=
 =?us-ascii?Q?40+uIBQ1zdqLhlJy7JjxfKmj4GUGVI962QWffWBUqsLMwKPs3nIXP7AvFB/U?=
 =?us-ascii?Q?CFmd6INBEydp+nCkjaZwWT0GFqJO2jpMlcMs/choVRrRjAuidWURov93jxM9?=
 =?us-ascii?Q?ifA4gxWmN2mSSfjqBBU6MQ63OPJ3ruZR8VWI0RnGAqGXUUsZn9Ex2QJoSJSh?=
 =?us-ascii?Q?lUr9l4L7m3yF1FHbO5Sx3sbjHmHNku+5hmC5LpC5DMf+34eMfYqFFSN1YpWp?=
 =?us-ascii?Q?wYQeNDfv8UOhlhi0Z0DBM0cwontP7NQMeDus0TLLvy8hjHMbSigpHzTheEAT?=
 =?us-ascii?Q?Wle51LxJWf+yBDzuVKBQJ07OGKACe+Aiuq18tAsy/hCxBwdBjR0UuysrKxB5?=
 =?us-ascii?Q?aO7mT5GND5/Vcp0aHUJ8Q8Nsddjbi5sfuIj3V0+U19ht2OLaElWEKqFDszBo?=
 =?us-ascii?Q?qoc+vxr90vnMjQLLAtCgBXdRmwVQHPmgNfxd8yRRk86GmuREqK7UEjYdCxJb?=
 =?us-ascii?Q?o+/W0MNkXIJDYOORaLBR56Ki+QsJjIUQaORAkIdPtwirQZarzsROItmoUUfY?=
 =?us-ascii?Q?MQUS/xvj0l7da/jdIkqehO63u/FzboEBsTC/7MKHwOENJ2M7KBe1IdN5rL4X?=
 =?us-ascii?Q?rDwavNTJ1w5LZWt+1uqidTAZPg3W71wEENjLtmS8JGh/QgTS4ZbnrUXuBeki?=
 =?us-ascii?Q?MOv6wGcjqoFS0tqe8BJZ9OUW5sRKC/kpySxMy/db1M6GuesQNEpH?=
X-Exchange-RoutingPolicyChecked: let9D6DY9a8QWm/FYoLKEJcfOyPrr6zCEN05lOfsrDsG9BGyJmHWrVMMSfiM9yzVpNbSw7QqGVefeE7ajb9+iYiqMgCpgJfOwmmi1CbNbboLC4EXzvBKbhW37BkolJ2EvlyX+xnAZIwM5tdaqTHmQZPpo3dRPbMUow+fudQVt5Ktzzg195oYIgJuPrCbrLQTAZL0Oi8D0I/9MxkHcRyPTPr2VkZdPVDhqruhEiP4U44ErJi0ewwnEd8QZtaSShEv9J718+BoFYhVGjdw3Vtm3gIs33NBq6gwSATt1e3WPNTvXzxTS+Mr98bP4J4mZUwFAi3l6BC1EPz7ns1kTVqCfg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 26760c1c-ecd9-4497-d8c6-08deaa381e4a
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 23:51:53.8856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wpNpePdGlIDlgU1C0tuaBowMivypu0h5J/Hge9GfpZkx09vBPEApVPiJTIwbrIINxd4v4fE9zE/oXGur2/JkqY/J8A2kMn9LJT0GZ/ekMb6nMxTvUs1s+3w5i+MiDgre
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9520
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

On Fri, May 01, 2026 at 05:53:34PM -0700, Umesh Nerlige Ramappa wrote:
>Use the 64 bit value when available for the context timestamp in the LRC
>snapshot.
>
>Suggested-by: Matthew Brost <matthew.brost@intel.com>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

LGTM
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> drivers/gpu/drm/xe/xe_lrc.c | 4 ++--
> drivers/gpu/drm/xe/xe_lrc.h | 2 +-
> 2 files changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 9d12a0d2f0b5..98dc4d0eb61b 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -2475,7 +2475,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
> 	snapshot->replay_offset = 0;
> 	snapshot->replay_size = lrc->replay_size;
> 	snapshot->lrc_snapshot = NULL;
>-	snapshot->ctx_timestamp = lower_32_bits(xe_lrc_ctx_timestamp(lrc));
>+	snapshot->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
> 	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
> 	return snapshot;
> }
>@@ -2528,7 +2528,7 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
> 	drm_printf(p, "\tRing start: (memory) 0x%08x\n", snapshot->start);
> 	drm_printf(p, "\tStart seqno: (memory) %d\n", snapshot->start_seqno);
> 	drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->seqno);
>-	drm_printf(p, "\tTimestamp: 0x%08x\n", snapshot->ctx_timestamp);
>+	drm_printf(p, "\tTimestamp: 0x%016llx\n", snapshot->ctx_timestamp);
> 	drm_printf(p, "\tJob Timestamp: 0x%08x\n", snapshot->ctx_job_timestamp);
>
> 	if (!snapshot->lrc_snapshot)
>diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>index e7c975f9e2d9..62beaffba0af 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.h
>+++ b/drivers/gpu/drm/xe/xe_lrc.h
>@@ -37,7 +37,7 @@ struct xe_lrc_snapshot {
> 	} tail;
> 	u32 start_seqno;
> 	u32 seqno;
>-	u32 ctx_timestamp;
>+	u64 ctx_timestamp;
> 	u32 ctx_job_timestamp;
> };
>
>-- 
>2.43.0
>
