Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB45CAC5BB
	for <intel-xe@archiver.kernel.org>; Sun,  5 Oct 2025 05:25:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E6210E03E;
	Sun,  5 Oct 2025 05:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Prq65mXD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C4B10E03E
 for <intel-xe@lists.freedesktop.org>; Sun,  5 Oct 2025 05:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759641944; x=1791177944;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xfFJZNUNvV0KuwwWrqGZAEuwGApaPKCat1x6sIfJH5Q=;
 b=Prq65mXDaK6ll6CPYGOK7Mr95bPRpqCWp2XThcbob7yvLyvQtVc/qcM1
 GD0/D1n9rsQsqMwefpXywKjVsFEVV7idIQHJOotgT1725j2nb/nuIk6O0
 VFzDSljgke3L7M3w0F/013UcKc9C2N2Q1g9LBfdYNA817R2Zzmi7mZnyA
 ENeKKCBvyqNVh28N9GQIzDFdj3C108POVrxkYVOsqa2MjqZ+N1Fw9rc7X
 qF3EcBV/MfLZ2fctW0wIGAF1URqCZUI4xkCXfjwbaQk1oPsluTkI4KL7i
 Um5SIsXKj8g3TavoAC8Hb6VDixhQLBdZdMaJEhU3/rlTZsJPJYuWR3hia A==;
X-CSE-ConnectionGUID: 7QWpLlLRT/enBmBe2xbuNA==
X-CSE-MsgGUID: zrq4AvBCQEKE06RSvrFMBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11572"; a="87318463"
X-IronPort-AV: E=Sophos;i="6.18,317,1751266800"; d="scan'208";a="87318463"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2025 22:25:44 -0700
X-CSE-ConnectionGUID: CRTzcZ+7QsaFJe/nMiBQoQ==
X-CSE-MsgGUID: SDdxPN79SoOUk+4aV+q4Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,317,1751266800"; d="scan'208";a="216709078"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2025 22:25:44 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 4 Oct 2025 22:25:43 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 4 Oct 2025 22:25:43 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.18) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 4 Oct 2025 22:25:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QUKQh/+C4FZpMBgNxtzzz5i6BHoG4X/Bcvn3G/LNaUVZL/NpxUMmlzDUbRyro963qOuRNLOg7Vjsw9AcmXf+rp9caW4U2vGuLz+xLoeO4gUJJmUx6M2TMn6dQvUuAUVCy2TfVfRCmTsidBzCc6hth0PiVJzaOkRTdvZnFVWr/pkj7rI/0JSA7ByiNc7nd4cEQJ0wnDrIezTKanay5hTLNMNKyP8xM6aB47UBSrdPsJO42wDkAfungUcp3VhsZwFS9CvXySWCX4z1Hg7/T/TYZ02rh6zpky+JT+q4FnO/9EVlU8aTnzTTQxoSB9lQNtqBPHwGduGVxkaz0bdcAxul1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5j4+rOAyoTIbmpBknxwPNnCdCjmy0qysDX5znR/iPos=;
 b=YaqVQa6u9TxEiBt+Qm6Ho5v/s+n9F4EEs7JgNTWeC9VvIBgNUeNydvXzn+5unZeTWfHXvuBQrROAj07Cq8cHPVfCvZZbcVE5jcsuvWvn354ppQPSorKvQkEndh0BnQvZlc5Iwsame6uRDkQ7f2TdOkU/32N7MXpMVM+nplrVKRnAVu0tBCZF7LgR7sqTKGRm23c+6Qn8f7zazUiNzTqrUlQX9cYPOveuVlIzkXJemaHqGDwmk3HEok6zbKvAcJaroMk4VX2IkzizrNMWrT/fB35bRnOKC8Seht0GspUGcxZQQOApSxnnBUeys5AECad6xr8fWjv65xjjH/y0/5V9Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5084.namprd11.prod.outlook.com (2603:10b6:806:116::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Sun, 5 Oct
 2025 05:25:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Sun, 5 Oct 2025
 05:25:37 +0000
Date: Sat, 4 Oct 2025 22:25:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 08/34] drm/xe: Don't change LRC ring head on job
 resubmission
Message-ID: <aOIBTgubs5rRHIvS@lstrano-desk.jf.intel.com>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
 <20251002055402.1865880-9-matthew.brost@intel.com>
 <0f7ae66b-1272-4164-9b41-faac00f42f73@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0f7ae66b-1272-4164-9b41-faac00f42f73@intel.com>
X-ClientProxiedBy: MW4PR04CA0306.namprd04.prod.outlook.com
 (2603:10b6:303:82::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5084:EE_
X-MS-Office365-Filtering-Correlation-Id: 4369269a-8bc5-4239-dace-08de03cf9d85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1gWzlCsNMAJSDfoyD8pjJq+q11IggrRqBKSAcsOyJbMXiwV4tGPLwKAWfz0R?=
 =?us-ascii?Q?oIW8O+GQ7j4S9uiZRFVHRjBSceSGb9yg87OOOAXAO7D1MnzOXUxIahIEVT3I?=
 =?us-ascii?Q?DyR0VMYJ2iM8BYkheuqLSKNSF5hToWJilMlJJiCPcqZ40biecw8xqiLXYhS9?=
 =?us-ascii?Q?SqRfn5qnmzIbHh/3HWRnp/BwdCETwLggJGrjjsXYlxwLpAWi46CrgFZ0ZCeE?=
 =?us-ascii?Q?gfshWTCy6q7dMvkpaLiL9uIWWZTzTJ1RXiVITKNdVvp3AsfOwl8NbsXvfXYT?=
 =?us-ascii?Q?n5MhXqEjRfcUGpmDeGN2DYCOKcNhGOh77Nh+j3tUNUxDnyRZBNDG/MuE7r5F?=
 =?us-ascii?Q?WoHmLRB/iFzw/QL+BprXHqN/b9vHmkbfyjD+kR6casyt3m/Yaw5hFPdARNW7?=
 =?us-ascii?Q?RWzfgPSKDMqS0CriWuGGtMMt1NmV1E7Wp/RddjYiGsmD1TiVW7d+rnWPiwbR?=
 =?us-ascii?Q?QuYU/3ewFWGx74mNrdgvGNDXur6KIDx9aXKjmIY4KriF6GnbPB8ZYNMfGWtf?=
 =?us-ascii?Q?lpVhkDZisCvx7nBEhSQMc1wW3bwQ+uiMK5GocFihzuyROBW/MnyBFb71Q2Yn?=
 =?us-ascii?Q?LbvGjW2BpgeHyiqcrtBT7z8G62HnWzzQ8GQplj5PGDqpSODPyNauWeJkc/It?=
 =?us-ascii?Q?XtadyCXdiR0Qlu4lqnok46IYEu+a9CbQEYDrTy2RAcjeHDzCl3OtpfyLipCg?=
 =?us-ascii?Q?fXBcbiJ9WphDjl8PchbG9xaILRc9aA3zCHDBLZD2Gsj1zcsT/lfsuiNKnKCm?=
 =?us-ascii?Q?RQu9nh3Ag9vgNcwdSalWYre9VXrhvl7Mx/9fHDJGgmx7Tq1WtXnnkiC8rdzD?=
 =?us-ascii?Q?cJ53o618nQi6oATKWkk/JCemjlSIqBDykpmw/jZjxP2Grgy6dT7aHFx14Aye?=
 =?us-ascii?Q?0dV3Xd7bkO58WlpOIoi4rd1md7qKwQ2ACu4aKn1MK4yQFa5ObCfUr7siOJAW?=
 =?us-ascii?Q?WxWUfD+vKwg0JOU4loMomj2b5Cw+E/7s2zR/4i95rqO8IUJM/ssnPLXElkIw?=
 =?us-ascii?Q?fZe3iFu+cMWa/RMcWgqjebrXaOkV0egOXZ2X94StODw3/S10Ir7F3Z60mzPF?=
 =?us-ascii?Q?seSbGTmRni6haolW8xb4SC63QrwHkn5Qk0x92lGz44w89Tm64CTbRyzMH3FC?=
 =?us-ascii?Q?UqLfO74kJaPjgVqoaTRvNZ+d7UppKYfiAjdiwwBjFKDjjQFe0ewZiOBY67VW?=
 =?us-ascii?Q?fYTycXyrqxNGgaIsnx+QweyFBG8I6OXY4DxFjhXybLB/ok3pcCZ1Pk1bERut?=
 =?us-ascii?Q?RutTtLj3s5NpqcTqTFAoXPBKMhysMFLyL0Qb2rKY1w/afgt+UcaIxy478dgB?=
 =?us-ascii?Q?8TSVlNqb8wpPg3fMMnt1WIElFlcKj808GfNOAV5S0XJcpZROyYUfV9w3V5Jt?=
 =?us-ascii?Q?MWszPRoHePgFd6/O50kYGlPUBXsui558gG8XHGAnSZXS6otYHiay18+zmw99?=
 =?us-ascii?Q?OfUiMPn0KRhnOGDu2Hjur8zFVVcjSy0a?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+qmjWewPsqcfpmYXwXZ5ABP7cLF1VMw3N8+UA/qHQxi/FndWJkB4G7ziH8D4?=
 =?us-ascii?Q?jQ/yDaqHkEhrghugTa9Js/N9WngXBcZoDhAp/btjvRAT2XeRmAuCTRouL/t5?=
 =?us-ascii?Q?afT61GAKK2vmJ4Js9SFshP71GeKEX7hZy72Ti91sG9W5/qSi5RbqGJQ7Db+P?=
 =?us-ascii?Q?p3jarPFdVob7MAT3evvBo2nqDIq8IuSCzWanlZJbDOoHhAOibfWyLaM3J25G?=
 =?us-ascii?Q?oluyyQiaXM3Hc4eGHD9uFUKLcrqt7EcNPz4TPy+Y2Xahfit/hzoesC/aQpv2?=
 =?us-ascii?Q?EVhepQkJvXlSd5cs2Wf+Ik8usIiExljuhzLBxHGOxk2d4t3TDXhqu4gwy8Jw?=
 =?us-ascii?Q?Y1JtHNUNuNKIDcSC0qZcHke5204z3mGryL7hMmxlXk6GXv454aHztq/0Wfo3?=
 =?us-ascii?Q?rmvieeIppWt5GuPzItrNpT3FMBVlI7LBmtkV0grjNbj7iciADCsd7ULfdZWs?=
 =?us-ascii?Q?+fCU0dKykj9M3AziMST32C26wnPPS8mwqi76wGeRUsjVIqtkj7V7nW/foJAt?=
 =?us-ascii?Q?S1QLOGMBOjXbW+0+6VeAQNOUxZV/ZSBc6sDICZYDFq343iQhKBq4I4ua/ZlL?=
 =?us-ascii?Q?F0daIW24olWR1K5KQjN+d6ch7nMOqgDUzIPWGwZZiEasvxJP3wuccukKoeHR?=
 =?us-ascii?Q?qw1XBy3T9bRQlPmaMkDKIXeMj31s6AHUJgm6pEaNhThL/XeXl79vkgumReAL?=
 =?us-ascii?Q?cSzgrT1lPu8LFz8/XXRchaklpjRsHNku4bqQJhRH65hc6IO2WQXnq84Rl1Qu?=
 =?us-ascii?Q?Lu319BSC7agmf/s9IFQymnV+5LmXDLd/BPa4kwTJC4MZfYbPWyw6ife6jfSo?=
 =?us-ascii?Q?UmQsTCbPCq1n36zEZ5RXOn151qgrIA3Vg2Qb3Mhyl9uy4odeL8fvAzqFU87c?=
 =?us-ascii?Q?eBiHfZcQXH0c94zWcYEOwVaYUmzeoVB5rkcP+6MM80prT7ao/ecjggnftbct?=
 =?us-ascii?Q?DuQsM0Qo0IDfD7pDT/OJdGAwCDPHPTYyldCQuaCoYnqLi9mqGEkJQIfiB9PA?=
 =?us-ascii?Q?GbIK7is645dA47/2jp3f34dHXrp2ZmkckjYKVujD1gCYHVahUzifqiqtUAkv?=
 =?us-ascii?Q?5DhCCWTVEEiVCHYkkE3wsrArxW5G59duJt9BW9uQ9XSg6vCkd3i8bBol8wej?=
 =?us-ascii?Q?eW98ZOrNCRdLZq0JmFMKB5Ifa6CdcunqEu3nOvX7F+D/SSEbkByMUSWu04or?=
 =?us-ascii?Q?LvCQHY+YtnOtVeZzrkXGRe8kIuD6XgFbNqKiTBAvY3vaMUX21Y2TfzUXhV+7?=
 =?us-ascii?Q?PvLBufODBXYdRgerF71jcgAycwvrBOMPAgcHPz9H+R4+eTNYf/0H4au28Kbp?=
 =?us-ascii?Q?5MgvEiwS4W6luSAfoOnuPG7ChHU7VFUKbPqI3cPMvDy1ttTYMunaHhLn1Ax4?=
 =?us-ascii?Q?6+iDMJE53J1Idu2Kz1shNa6gRKoR439r6lbes+LbZdxvzl6M77bGq2kaMrem?=
 =?us-ascii?Q?ZA25u967NiBAp4DEdHfnU7Wy3CqtBdVMAuDC4Jj5NLlroMFJo6D7lqRqJYOp?=
 =?us-ascii?Q?aNfqS0Hj8nHk48UivbXDXLYzukLC8JPwZ/4OPjzTliv/dltJrEgVVM4oTl02?=
 =?us-ascii?Q?9p6s3ARIY4/IAd/PfnFHXfVibmhED521esRr5XtaYlo/T8DPBoybDd1mkAAP?=
 =?us-ascii?Q?Hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4369269a-8bc5-4239-dace-08de03cf9d85
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2025 05:25:37.0369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PUSBGovVsjDD2Ki5aVZR3QUMVjD96/s3BRdCHe/ZXvj1mSiRnGwITLNn5JF1Qgw51yhb/Mzi30+f9sCSDK/xUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5084
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

On Thu, Oct 02, 2025 at 03:15:13PM +0100, Matthew Auld wrote:
> On 02/10/2025 06:53, Matthew Brost wrote:
> > Now that we save the job's head during submission, it's no longer
> > necessary to adjust the LRC ring head during resubmission. Instead, a
> > software-based adjustment of the tail will overwrite the old jobs in
> > place. For some odd reason, adjusting the LRC ring head didn't work on
> > parallel queues, which was causing issues in our CI.
> > 
> > v6:
> >   - Also set LRC tail to head so queue is idle coming out of reset
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_guc_submit.c | 10 ++++++++--
> >   1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 3a534d93505f..70306f902ba5 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -2008,11 +2008,17 @@ static void guc_exec_queue_start(struct xe_exec_queue *q)
> >   	struct xe_gpu_scheduler *sched = &q->guc->sched;
> >   	if (!exec_queue_killed_or_banned_or_wedged(q)) {
> > +		struct xe_sched_job *job = xe_sched_first_pending_job(sched);
> >   		int i;
> >   		trace_xe_exec_queue_resubmit(q);
> > -		for (i = 0; i < q->width; ++i)
> > -			xe_lrc_set_ring_head(q->lrc[i], q->lrc[i]->ring.tail);
> > +		if (job) {
> > +			for (i = 0; i < q->width; ++i) {
> > +				q->lrc[i]->ring.tail = job->ptrs[i].head;
> > +				xe_lrc_set_ring_tail(q->lrc[i],
> > +						     xe_lrc_ring_head(q->lrc[i]));
> 
> IIRC the sched pending_list stuff can also give back pending jobs that have
> completed on the hw, but are still kept pending until the final free_job()?
> 
> Suppose we have a pending_list like:
> 
> [pending/complete, pending/complete, actual pending kernel job that never
> completed/ran]
> 
> IIUC the sw ring.tail will actually go backwards to the first pending
> free/complete job head in the pending_list, with the hw tail being reset to
> the current hw head here. But on the next submit the sw ring.tail is where
> the commands are emitted to, and on the next update
> of the hw tail it will be synced to the sw ring.tail? But if that happens
> won't we get hw tail < hw head (since we used the head of an already
> complete job for the sw tail), which will make the hw think there is a
> massive ring wrap, so it will execute garbage until it wraps back around to
> tail?
> 

Let me tweak this flow to use the skip_emit / last_replay flow
introduced later in series to avoid this issue.

Matt 

> > +			}
> > +		}
> >   		xe_sched_resubmit_jobs(sched);
> >   	}
> 
