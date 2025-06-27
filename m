Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00EDC77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 22:48:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 879FE10EA8A;
	Fri, 27 Jun 2025 22:48:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HRoTSiQg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7170810EA8A
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 22:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751064483; x=1782600483;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nleGUGaFk2h7F16BHYgh2dzKDqJLCi9jFj3lvy7Bm9A=;
 b=HRoTSiQg8n0srJH7fZZmJHE2Bi4yA+CC9MfoTQqbNsa4VK1WmRI6Dspf
 AxqmnBXhb1PSJ1sveKCMG4dZ9RRrxgXHCHY5epf+/mQx+nbQzQP4T9OoQ
 NdjQAisNDxIIL9TDeMjvevyfy4QFOZL47YMWbjB15tjHflLXk4QyLIJT1
 h33MVUpP1SqfrRHFmcBa+78qXJqHhAUdceXS33DCfbYOMBdtZJRAFXVlb
 EVdWa03iQ8TW0HPFnoVWmVW2QHh3p9EXeL51qhkJhzpIx2BZxpmyp0Agu
 rFBS2ibiw5HjBLWfAbCWZ9ww01s31aQBcoEqzdjN1kYAHCKu9maanhFhq A==;
X-CSE-ConnectionGUID: MyH9e2YRRp+t7irUxxZwlg==
X-CSE-MsgGUID: B75QIeR0RzqSnmh4xtxfCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="52501523"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="52501523"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 15:48:02 -0700
X-CSE-ConnectionGUID: NXnvA24vQciYhHVgbB+8Dw==
X-CSE-MsgGUID: TLZqYoeJReWy7C9wLiCksw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="152649880"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 15:48:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 15:48:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 15:48:01 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.61)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 15:48:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rOmn6GOfGJIxtzmFA5cbczddoNKUeOUGdlmAoOUNmunmbbvCipAH7kMqRyR3RT60n69WJ6We1tqTh0gLTLz0rCd4Aytm5Gan/AHM2AyCCDPPZd8/qhNCqc/aalO5H430hzYrqreirBUdiZXQmf2HshCaMOT1Op4RNhGzq7Ee+ClOoTxoff2vW88zn7+Ids+UGUE+/Co7vPAg6gI5RkUOb01ASdIgJs2qWuf2Jc0hHRCC3gpE4piE4m2NM7CQtPw/cBny+tCyts49NtvMIDD9zhUEsMJHIjThN7PiWRaNpBaELgFUTKoE1sqKsXNWooj1gIEf07eJsPTFptsg0uwOPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j03wYvYu8wvGQgy10628GfLH6HCiIkSD4jpGlcCY4RM=;
 b=BAdVZtWdWByWK0w9750QyAnY1MqeAolY3tzPF0PTOVMB1iPo0whEHTIb3+ujciL720DLA63NJCsxiyjMUKFat1yVVWMuPgT6+D5Rs6pGqqN/r/f66O6BSrAyz4JyOpCekTNNe91Z6YbAopbsltgQ+I1FKUbrEAQadFGicGbn5CBM8By6+3bCLQv/IOLpYZH9++AW/ctTzblbDaRK/jajUnSq8giSDL7NDYK9Lk+6hZysSmZLEgAjn5yAGhtLWWLIZHrT8hoHtu6tq3ERA8nPLVy5RkNM/CLrorS5xDY4/MOkJe4Hkncl34VhfxiJ4TWkC5h+O4UQozlpuBNWrXxh5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4716.namprd11.prod.outlook.com (2603:10b6:303:53::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Fri, 27 Jun
 2025 22:47:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Fri, 27 Jun 2025
 22:47:45 +0000
Date: Fri, 27 Jun 2025 17:47:42 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH 1/2] drm/xe: Simplify batch buffer allocation in
 emit_wa_job()
Message-ID: <a5xk7rv2p5gr3tqlt6w7xwthchix4gvzddbrkmwwlxtlpa5cy7@3qhl5c67sbts>
References: <20250627131438.54398-1-tvrtko.ursulin@igalia.com>
 <20250627131438.54398-2-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250627131438.54398-2-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: BYAPR06CA0023.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::36) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4716:EE_
X-MS-Office365-Filtering-Correlation-Id: a7a15e62-edf6-4308-14e6-08ddb5cca1b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nFHmbnuvEHki/x7O0zB+v5jX+KF1H5f4Ix2jc6PPrck+X8jA3P+UH0/Gg8Nm?=
 =?us-ascii?Q?UrzmzPCrgPQntTIhAHtEJhXWA0JXr5FUD3Iy1Kod8ECAEJkP6+hbuMf40KOB?=
 =?us-ascii?Q?ibwl732NRtim9/WP3m+7xvkQQDRgXBX4e9gSgXm6KuiLqd2y0qTaZ40SAuQ+?=
 =?us-ascii?Q?zFRHPFtISZryXA/BdAGPorw8LnjrLvoCTB8dyY22vTeQ8xTSmuQ2N7uleFUQ?=
 =?us-ascii?Q?bA+nDM1ltLwM5vpehR2qlYahQUGcK/sjVyXRFvO6LJzRNU9xN/uST8F1MxGD?=
 =?us-ascii?Q?xH7nB5T93PWpXI8iaFl5dFCa7DBfEd2mgR04z0ccYzRtIL//45cpEwvT2U00?=
 =?us-ascii?Q?FdsQHKXw6+P7+cmEMMGSNYfa/jG4gDlokH1g4ZC91TIi4tscRQyY6WIvTe/h?=
 =?us-ascii?Q?MMvBoniuoMpy+boh0s0hRsB7fQR6r7ZFvExQTrMvrfARUaPvfhY1Mn9AIzRo?=
 =?us-ascii?Q?BJdEFE5yBUhgp42vb5TlY1wHnmGD9pbxjv0trovs4aWpgEYgZaiZ4Cv9z3To?=
 =?us-ascii?Q?iaOKv02ew7Pgftm2X17Gmx5t2wZaqRfW1lgu4523tVRSdE2PoJWkKBlzP8b9?=
 =?us-ascii?Q?8Us6Yi70Ej9EI7wrajlGdn4xu2FGF5ck4YtSeGPcmLREgBKvak3+xBqMqVw2?=
 =?us-ascii?Q?tguKFnmgSymPjro68LNAXtI1lwWId5MK0DwWPezLOVT0ar8SV+yzJEL5ylg9?=
 =?us-ascii?Q?of9jjMIYwrllKQmjewtPlPSKsHi143VnbrPkdGPSmmM4oQbD9YQf0Mjf9Aed?=
 =?us-ascii?Q?/qEhkm+4pt0ka86n9EMCKfSnlxfpMMGSaJlLTkKjWl0Iv4Dk0wIKdCb+anWC?=
 =?us-ascii?Q?jCD0pj8kdn/JXcTjbUHTrRUc08XnpwXiVHtTEIqONBOt9hQJN007aoVfEQtN?=
 =?us-ascii?Q?gWI3uK9zANlTaiGusUvuEKD3rcWgTepI2Xy7E0uH3r/b6np0ZqoX82yZ0OEn?=
 =?us-ascii?Q?V6NNP1T15CbJCsXkJS6Jql9qaOAjYsQCc/bvcTJrS5d0lApwdVQXd8q8iN7z?=
 =?us-ascii?Q?iExAn7wveUsY0Tm/3oZU8lf1HyZdsAfdXeYFhfHMb/FGpkLPj18EMTypnzJ6?=
 =?us-ascii?Q?NA/UGr0Co137nIKw8wnbZXu20HbSV0n60ydJSb/67VEuZUSe93Hi8xDNWmQJ?=
 =?us-ascii?Q?/TjYr6K9oHL1CdGrDikdjGeThUNEJKfp2TGT9FxND7NtWpGJAX7I0mZgev6s?=
 =?us-ascii?Q?Zn9qOxqqrFE3Jk87gPa/hFcMbFIWE9Uv67LuW2N2GDZGZKbP2FFu7l9oooih?=
 =?us-ascii?Q?Q4BdHblYez3IX0J0YKg60UUokLcrGLHAWd4rN+pm/BIDUH2k49W4PDApMZjL?=
 =?us-ascii?Q?TGk+lTD39uHrUFO868AnvtdYuvrqiY41E8d+6KGAlwhkID0hs7chyR/zjb8f?=
 =?us-ascii?Q?OXd63Ki8iHiTUUMu5Sh1+EngSA2AZax7enIRbNlpBUTH5pYKlw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AJqpl+EeayIcIKOHB6XF8ONMwTCjFsWcs2/hs9w/nldHNpdkd1Qz4PvKwAPT?=
 =?us-ascii?Q?1SYx3draVd1yho+WTss+RpL4fYLK1EFsnETWgawEJv5ng+FO7V4g92n0McBg?=
 =?us-ascii?Q?jGOwRYFPairou3U0kpsC9ygZZXnJN2+H/Wvnz5wOJ3j5HnxaljY62ZeslDbg?=
 =?us-ascii?Q?8vsUCor/HCAlw38TLlmDQT6cErIjcZ5/QXyNV1HQ49lUBnOGgUDCCcp7726k?=
 =?us-ascii?Q?xz7tcI36Iyc0jMmA3xDV//ik0Hml/BHc746+q0yxj1nSVxct423c/kwfyECL?=
 =?us-ascii?Q?Uu0/gn6KdyykhAkSNyPUcpE6+9ibdFvDwrAteL2RaXwCNh2sCMRAwRT1yYm0?=
 =?us-ascii?Q?nWmVGn+56wkMUCAbZqwUyZbw7msmX3l16pd3JbUyj25yJc1u+gUu7pVO2Msr?=
 =?us-ascii?Q?Izchld1sDXO9k1EkbTGYs4DLm8nT/c9nEMU946llzHWFKcBMwT5wKXMcGtbj?=
 =?us-ascii?Q?u5ZOrv6Tps/eB9R0q2WreBZKDWTF/k6IHjjV/Rm1wKP+qX4QCLCp2IR37ta2?=
 =?us-ascii?Q?9+NunZQeiFsrS+9Fz/EF7DMENOWtamRbDYqLy5S9Yf8Z2y6eWPX1gFJqgG+t?=
 =?us-ascii?Q?sTX1dsX77i3VEksPPxIZmRFQ2Fn9Ex8JUgUN53NILiWUnkmnqHsQ6TnRirmb?=
 =?us-ascii?Q?rzRVCDTwGSgMMKSH+xjoMx7u6VMr3QtBQAm3dRKSPCa932Hiwap55Fu3Vo//?=
 =?us-ascii?Q?wQE7DCJMbMdcHvM86HWDsU5xoLqyoLw8pj30otRNbIEyeFbqn9Qa5HM15rvC?=
 =?us-ascii?Q?CuOoJPM1JN8MVqPOeCY2KGhFrLKCJuLu/jaqYRqvsYpOd3Rnb/0ioiqt/xBg?=
 =?us-ascii?Q?ZwGc0xVP8GgOHiL9kJPGhlC9HcopPLDQ2obu0AXwZaBfDBWcyKm5090HBqBF?=
 =?us-ascii?Q?DdZE2ND2vPIxDjdE7cQvCI3/gnuiETT7tPu0fTC1Tp2J8zM74u2Mfp8mdPAw?=
 =?us-ascii?Q?7XAvAzuhdz/gXzzJ/AM1VASZj1+rohDody2eNWc3W55hZ+YvrB4jCPQ5UKFV?=
 =?us-ascii?Q?RF4wIDpTSBx7I8ZYHCNbgpG+mpnQtYjX5saeJA5N8e2QjWIGLw8gqqP6lSRI?=
 =?us-ascii?Q?UHh8Raa735LG1KI958iJTL2BJU+s6w5xHLvDzHou5tGYTQABYGG1Qn3ihjla?=
 =?us-ascii?Q?kYiLKhz1FL5v4P1ml/6WhdqCql+LezVKEm5UUpvGOFt3ox0tpmv2af1hh0OH?=
 =?us-ascii?Q?Ma8p7kPX3KhnD4wb7H5o7m9KW7ONar2AHBiy3Q4ba83PtZuaSVhfCnfT37Vr?=
 =?us-ascii?Q?eIRoCpWPw8JFjE4BKkYpNljqccjsUpq2Lb4Dp43K9i2C2Xt37eYa7kLCyPVY?=
 =?us-ascii?Q?v/S88PjBccqMX+gCa5vB4KNikwTqBrbpSQP/yEneerLc86ggd6CSaJrm8/R2?=
 =?us-ascii?Q?gC3UqE0t7Ui3n8iS8fHvomWmExSsqgSIKWz93FEK+cTmg//Qa7Zs/hbeZaV8?=
 =?us-ascii?Q?fbxny6LsiifIsH02wQSZOEiEWJIOp0wAoCJZt+fUNqdh7ix19BUVC8MgOq4n?=
 =?us-ascii?Q?QFqi+We5HgHS0Mc093fSIcRjxfRdauxWwuda3+jC/0vsBMeBqRH+nlupSQj7?=
 =?us-ascii?Q?PzgvxJSqu6gbpd2wjz2YAyJPs7guxeQinNfFKaJzq3DxWF+70+a2aRBMjdIu?=
 =?us-ascii?Q?yA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a15e62-edf6-4308-14e6-08ddb5cca1b9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 22:47:45.0244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pblV31qqquzkPEFX0a67/IyiiNj15GLPiJeED4VEWPhj4wqSXGKpuVn5iTsaBYWrJfqj9gBR1EWD2uhdny//iIMySK6TIiKEjTI4+N0VaNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4716
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

On Fri, Jun 27, 2025 at 02:14:37PM +0100, Tvrtko Ursulin wrote:
>Code just needs a large enough buffer and it doesn't even check. Lets
>therefore simplify to one allocation path which is guaranteed to be as
>least as big as the current ones.

In my stashed patches (not sent yet since they don't fix an LRC
corruption we are chasing) I went the other way around:

b1f0626cb3d3 o drm/xe/gt: Extract emit_job_sync()
979fe60f3883 o drm/xe: Count dwords before allocating
5dca40d2503f o drm/xe/lrc: Reduce scope of empty lrc data
d892c8ac707a o drm/xe/lrc: Add table with LRC layout

... particularly the "Count dwords before allocating".


Lucas De Marchi

>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>---
> drivers/gpu/drm/xe/xe_gt.c | 9 ++-------
> 1 file changed, 2 insertions(+), 7 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index d397df056e4c..86018fee74d3 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -190,13 +190,8 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
> 	int count_rmw = 0;
> 	int count = 0;
>
>-	if (q->hwe->class == XE_ENGINE_CLASS_RENDER)
>-		/* Big enough to emit all of the context's 3DSTATE */
>-		bb = xe_bb_new(gt, xe_gt_lrc_size(gt, q->hwe->class), false);
>-	else
>-		/* Just pick a large BB size */
>-		bb = xe_bb_new(gt, SZ_4K, false);
>-
>+	/* Just pick a large BB size */
>+	bb = xe_bb_new(gt, xe_gt_lrc_size(gt, q->hwe->class), false);
> 	if (IS_ERR(bb))
> 		return PTR_ERR(bb);
>
>-- 
>2.48.0
>
