Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B544C44501
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jul 2026 05:40:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53FED10E149;
	Fri, 10 Jul 2026 05:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dCWZXuzW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F5B10E149
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jul 2026 05:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783662055; x=1815198055;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PGUyJfgelJuX0eWzAhZHBCoHk4YWoESXD+7WJa9Yq+4=;
 b=dCWZXuzWN5q6c5NKFBQc0QK0SDZ2lx/jPW6o/nyzNcu6j7LLInwelw6B
 lApRKcYAVx4rvUF5JtA0MwwEdoz3yQt67ztnYdNs1InDPx+QZ8hmrp0ny
 vugLamukze8rHwoDu868SbVp8r9M+V0AVOUt6miqXzsBLylqE2+u9sa/n
 H+bK88MXUdZtTSZh8wCufP+dy0Qgdo3JUUGmCDcio5zk3/Z1uf+F5lFS9
 k8W8ekfq3fkYoOfGf2PHOQBvj6DusD5b4BQ0nplRRvYFquevyO7/o8yKk
 efesaVIdMkszDq5Crq6pKZ5rvybBvOHpGz3C5VrFZzFLKj3tEEbeC9GIo A==;
X-CSE-ConnectionGUID: OuPBzOjMT/GnZ50RxJMyCw==
X-CSE-MsgGUID: MS5NKo4QRcS+roRNeTD+6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101908047"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="101908047"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 22:40:54 -0700
X-CSE-ConnectionGUID: AboZ1lm8Rq+z3P3kLfvMuw==
X-CSE-MsgGUID: wfjxkcP5SYGOkcJKMEsXbA==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 22:40:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 22:40:53 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 9 Jul 2026 22:40:53 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.5) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 22:40:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WGAEmeKU7ogvsLC+Ce6JBMgnIw0EDrk5VUR7HS9fHp+8QebQ3ZoasPynf5Sva1XcD5LFkvDXzC6XLoBlucLATmBPo6PaKda8o0Gsy9DFl+2i8oJo+0vW1zsEKSab5vVGD29W/l8ZHJn66Rb7j+JqnG2yAqAe8nn+mPq+6u9qhxhTsrOshyZTkA2gQ6hM38XL34JiVO0TAfABMv+sD3c4XlmOdtB9/Oo62/HscHY/lbsU0NTG0Lul6fgJXaLzEMMB9F01c99DRd2JKVbHkxuVuMCn1Wpvnz/MOCLUHFbU3sHpyUssMvQyp9W3o1ALELrc7HU9nRmPrkZGHd91m9S/ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=399ub5kExeWY3h7gVEaxUwp/2PpieMBVy5lzRR9DBCA=;
 b=kNVVciI1BK96R+q9KbTHvd5S3U4VmEaCCGkLL5ooOOqt4hdhczIuTR9uLOGc1OvERdxRvpdndUdVZThozictL3nVL0B/SD1hGiLq96nSlWtXu2jwuJ/nu84p9wRzeu5iz+Izfwe0DqRbRkrMZ5RhWNZSacXrYHi0uNrdh/pwtDc035yixlYI475MBDlbBm3RW6ymp3xCzI4lBBtby69acXFV67IJHgC4bPMoN3BzZSjufQTwA7MR+1OtMQ7zv6a5opqd1/0+kVzmwZ+GACKXhJXs2CJd3S8sYmR1PEwcJgzXWLC2YUOtRXQ9KurAS2ewYOrdNaCDlWmUC9od5bBdkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB8781.namprd11.prod.outlook.com (2603:10b6:8:256::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 10 Jul
 2026 05:40:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0181.014; Fri, 10 Jul 2026
 05:40:43 +0000
Date: Thu, 9 Jul 2026 22:40:41 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 3/5] drm/xe/guc: wait killably for suspend and ban
 queue on timeout
Message-ID: <alCF2UINIaEOtySi@gsse-cloud1.jf.intel.com>
References: <20260701050730.1776476-7-niranjana.vishwanathapura@intel.com>
 <20260701050730.1776476-10-niranjana.vishwanathapura@intel.com>
 <alAGPmGuKrIXN23Z@gsse-cloud1.jf.intel.com>
 <alAHUXLtmyjcuQbq@gsse-cloud1.jf.intel.com>
 <alB1ZpIXfUrfm8e3@nvishwa1-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <alB1ZpIXfUrfm8e3@nvishwa1-desk>
X-ClientProxiedBy: MW4P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB8781:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b0080e3-7207-4260-32d7-08dede45c8ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|56012099006|4143699003|18002099003|22082099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: X/o7b9Og4GSLCWi9R0O1O99f949lCyeYjRhWYlyCtgYffhXZ8KPs5TiStEK7Ffw3czBG7PzrgRahoM54zzYh+pj/eh26fN5BblfpvIUBclpub/kq63INRYJDj3MBOPaP28QryJt515aEBW85MCHETX83ilrXyIQ7mvLNlUxy8Xb/0tYm5r6ObQy6BoFcLoUxasYWExedUHQVnTtz3cckImQOMMnbRZ5dkY293Hvyre+yvlISocf83SN31M438cTq4harjDabRCvGrQufuAjV/dNTY7oF4aSgM56J01PWzni0CB7x/5StGQCXnkOlzzky00TDEMyXfXfmOwrU72cjoY47tz2qtrCxS049fz2uDGpe0UOOOJ9LnOO5w1W/kNMRbGbErqpDiVmqDvRYkLqFZr02RtGzjx12a4N0x4P3Mh5xO/YwdZzzvjKE1X8D1c4dyARvBEGA8nWWzVtfr6cWm2Kb4GXDm5J8Np2PmdYXK8b0DKJ1+A+C+BPCeM54EDYO9SgEpQcOONwFjGtYBA5+e03L97BEUfPvwE+6nPQKMnIoESnBA3gfKurZU+fsdA1fHnPRuAc0F5EwQPdh7NgcXuKpCWKctFHJzAan2sgnzrWFZ3h65qtrBL9Bf56tn1IIEbzzancyptr0LReOwFoHr2Sqku1cqXy/yN2xS1gxxxQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(4143699003)(18002099003)(22082099003)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8S/rIWguSemaX+gf/QYIq71mV/DdyWQOwdjfgfdyPhXMiBrdWQRPx52qKnPI?=
 =?us-ascii?Q?yH/8siW5DHuF5O8K6IUCsJfpq5rdC4iuOA9ABIi5bjEuhhjH7FOvIZ4iistq?=
 =?us-ascii?Q?AS/2PtDSWMLmVgxFlghorSq2Pv5xWGtZ/zfe2XppTlQ5oWKzW0m0QBtEtl+8?=
 =?us-ascii?Q?2X2KWmw7PX18Emg3P0UsoNTv0j+SjWMkF1V7G8pAIpDCTBfEve+vPNzKidsz?=
 =?us-ascii?Q?OHRIKJaYNMgj8czyCkf+pIBN/2jPkn4LMF0vBncL9dahbTI50X7M/6EXaKLI?=
 =?us-ascii?Q?SiBclEQXbUnEiQKcWnaM3nMNriiYblVgjvHrw0GVF/6pk1Xsao5TVSTGo8ef?=
 =?us-ascii?Q?Xp7i8qGxvVPuzCMUWDxHbKDsojXG0vrPtOXxzasLoQeM2bZ41sfw4JhOkwH7?=
 =?us-ascii?Q?JpzKKHQ0zR/gcOW6XeHuOzHYUh2GHowb88/dFR6x8e0WM+h+FYjpEIUdg7hF?=
 =?us-ascii?Q?ap1sFfrqAhE6lSyMyRaBWRU/rSpyQvG4PhRLqr01uiibfkasXplzY2LheDvG?=
 =?us-ascii?Q?PkyBc/DRc+UT5/qIu9Y3vI6+9tny1T86aUDfpMa6k6SIkK9UR953UMMSGrK8?=
 =?us-ascii?Q?7PY9V61n2DuJrgW79fFjxqNkGkI+fhUDZeu7BFN3VNdXmqkCdBGcXz4cQVi+?=
 =?us-ascii?Q?7q89W7nqj22hGRlYCt5sX2ON/PBsJS4IUAF6zocXZJXn6H9gedE9lKc5N9qk?=
 =?us-ascii?Q?5y1jrIW3EESgBEYNIvQ6h6AM/K38MN+lcrOEWmdX7AzXqpNJp6+b/IUMqT5W?=
 =?us-ascii?Q?R8obMnJairJhG/Nq4p9rArDlshelq3jCidoymfcXTgfoZkfPODmkL7vXEWv7?=
 =?us-ascii?Q?FoEUqWrXg0k1kROp/6GJ8FNGMxXP9M7SLN4WPfWByTxC2dS8f17kYgHqEs6L?=
 =?us-ascii?Q?NkjVTXlCf2G3cXhFrKW6XwpXlgIHd3ip6oWyqKFEXEaFV/mnlakdN3fL1RIb?=
 =?us-ascii?Q?VTmKJTfFQ58lhEyeH51pT+6A+He2krRsOZ2ep4DR0kuVpzmKoVjUeXHPAtRm?=
 =?us-ascii?Q?Sq6qf116up8xDm1MZ7sXK8kKOpWfVpmjk2VCPrcyb2yvsr5Oct/h36iMSZhv?=
 =?us-ascii?Q?GQw83u5/CvLt79YnzadR0mZsPVZjFvVv5qwOCamC0dZprgkYwixXgDdzyTEb?=
 =?us-ascii?Q?oq+dfsiL128oI8cfIL7eunZ6s/Y9O/o2Q5xyNiqADyFHXdrS27T5N7sWgUQL?=
 =?us-ascii?Q?1P4EBIoDFbwNMA2HQaLY3sl6WRouiN/R8U3hiGhsiAV6tQTuS9MR4OkWAO8J?=
 =?us-ascii?Q?bverRVMJs4m821EF4BSxOEbWOfrbZjK8IWYD573/XvARPSfUKHbG2WuV3sSR?=
 =?us-ascii?Q?Doqd2o3wrH5EygCUST3sUSPA+X/C9YVKI7hy01h3RYeiPCmEhvQ2xQUVjdSi?=
 =?us-ascii?Q?sD1eS223vVDSX3kExQDPw+cEvvAMOjL8Yzez2zFKW8Ikc0TqZbqYrlFXY8BD?=
 =?us-ascii?Q?HI3Jk0mz4gE0C98UBGyq1vHRgdRWPcvnYuD50kgfnsX5+Y4kdPjlW7LvDKEt?=
 =?us-ascii?Q?j2CvH1MCWgViFMWaySyic1DF8X7ctmgNK2hQIlDNa5lkVPNZ25CL3Yg3iVB+?=
 =?us-ascii?Q?neub5+Xbnovybo4kOVN6jMYNX2LAx3bSuL3I1YsCwvjbW5TOXHLZp2snp1j4?=
 =?us-ascii?Q?TdJU9taZZNUEt8wbSFQAQ/Le2CQHGdXFQcCXbI41PacGVfH84CMAfEUNXq6T?=
 =?us-ascii?Q?ENVkfIFslrruS6efhtZwJ8iB7/BlEatLfvsZQDGOPA+7sVfRoRDeBc6bxlzJ?=
 =?us-ascii?Q?nPOXbqdya9uY/hAAQ1saB4Nav0Nc4C4=3D?=
X-Exchange-RoutingPolicyChecked: BP4/3jsrLHqmSd/Lr4+NmioZgzjeeZooWAknXXcLZ0L8FlVFXtExsHJX/7QNpZlfbjGeQ9JMvQwacqtwVBmUw0JGoS4zlUlczXUbHdTW40RDPIi/lsdYPEaKEeu0dFOLYVJFFyBzVcwFsQOZtPpFsiW4gv6jLJHVTXzJbvWEIGG9u9dgvPuTFIJ3dEwvijWjwH2pnLfGpS2cbf+BBmGWxlA2Sm5S1yA2n7tQR3bA/8JSkBlInbMpcPXa89scPxGqO1iaP1VRrRNskIToKlmVsCYOE6Mpl9OQRdbjZ9Tk5pT5lctftEe1+W9YJhiV00dDS+Urx9JJrBAlLcUYzzqk4A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b0080e3-7207-4260-32d7-08dede45c8ad
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 05:40:43.5504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qfq8dN19twizQOmpUegA1QGHVkcVgn8nxkxxFXpAz1ZGnKiXfU+d8irACgTenJw667G93kJ+KBDm0r3h73ANOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8781
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

On Thu, Jul 09, 2026 at 09:30:30PM -0700, Niranjana Vishwanathapura wrote:
> On Thu, Jul 09, 2026 at 01:40:49PM -0700, Matthew Brost wrote:
> > On Thu, Jul 09, 2026 at 01:36:14PM -0700, Matthew Brost wrote:
> > 
> > 
> > > On Tue, Jun 30, 2026 at 10:07:31PM -0700, Niranjana Vishwanathapura wrote:
> > > > Harden guc_exec_queue_suspend_wait():
> > > >
> > > >  - Wait killably rather than interruptibly. Once a suspend has been
> > > >    issued it must be waited to completion (or timeout); an arbitrary
> > > >    non-fatal signal must not abandon an in-flight suspend, otherwise the
> > > >    wait reports a spurious failure while the suspend is still pending.
> > > >    Only a fatal signal aborts, in which case the dying task tears the
> > > >    queue down (clearing suspend_pending), so no stuck state persists.
> > > >
> > > >  - On timeout, ban the queue and trigger cleanup rather than leaving it
> > > >    suspended forever. Clearing suspend_pending via __suspend_fence_signal()
> > > >    lets a subsequent resume() proceed without tripping the
> > > >    !suspend_pending assert.
> > > >
> > > > v2: Add comment about -ERESTARTSYS in suspend_wait
> > > >
> > > 
> > > This doesn't actually help per my comments in patch #2 given sigkill on
> > > one process doesn't mean another processes queues are being torn down.
> > > 
> > > I'd drop this patch as I dont see this buying us anything.
> > > 
> > > Matt
> > > 
> > 
> > Sorry typing too fast... More below.
> > 
> > > > Assisted-by: Github-Copilot:Claude-opus-4.8
> > > > Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_guc_submit.c | 39 ++++++++++++++++++++++++------
> > > >  1 file changed, 32 insertions(+), 7 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > index 9458bf477fa6..3d9bdc22c89f 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > @@ -2195,22 +2195,41 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
> > > >  	 xe_guc_read_stopped(guc))
> > > >
> > > >  retry:
> > > > +	/*
> > > > +	 * Wait killably rather than interruptibly: once a suspend has been
> > > > +	 * issued it must be waited to completion (or timeout), otherwise an
> > > > +	 * arbitrary (non-fatal) signal would abandon an in-flight suspend and
> > > > +	 * the wait would report a spurious failure while suspend_pending is
> > > > +	 * still set. Only a fatal signal aborts here; in that case the dying
> > > > +	 * task tears the queue down (clearing suspend_pending), so no stuck
> > > > +	 * state persists.
> > > > +	 */
> > > >  	if (IS_SRIOV_VF(xe))
> > > > -		ret = wait_event_interruptible_timeout(guc->ct.wq, WAIT_COND ||
> > > > -						       vf_recovery(guc),
> > > > -						       HZ * 5);
> > > > +		ret = wait_event_killable_timeout(guc->ct.wq, WAIT_COND ||
> > > > +						  vf_recovery(guc), HZ * 5);
> > > >  	else
> > > > -		ret = wait_event_interruptible_timeout(q->guc->suspend_wait,
> > > > -						       WAIT_COND, HZ * 5);
> > > > +		ret = wait_event_killable_timeout(q->guc->suspend_wait,
> > > > +						  WAIT_COND, HZ * 5);
> > 
> > Drop this part.
> > 
> 
> wait_event_interruptible_timeout() will get woken up for user signals (SIGINT)
> also with -ERESTARTSYS as return value and I am not sure if it is ok to treat that
> as an error condition without a retry. The wait_event_killable_timeout() only gets
> woken for fatal signals (and not SIGINT).
> 

My point is if you can make sigkill work, you get sigint for free as to
the upper layers the handling is the same, so might as leave this as is.

> > > >
> > > >  	if (vf_recovery(guc) && !xe_device_wedged((guc_to_xe(guc))))
> > > >  		return -EAGAIN;
> > > >
> > > >  	if (!ret) {
> > > >  		xe_gt_warn(guc_to_gt(guc),
> > > > -			   "Suspend fence, guc_id=%d, failed to respond",
> > > > +			   "Suspend fence, guc_id=%d, failed to respond, banning queue",
> > > >  			   q->guc->id);
> > > > -		/* XXX: Trigger GT reset? */
> > > > +		/*
> > > > +		 * The GuC failed to respond to the suspend within the timeout.
> > > > +		 * This is not recoverable for this context, so ban it rather
> > > > +		 * than leave it suspended forever (unmarked). Clearing
> > > > +		 * suspend_pending lets a subsequent resume() proceed without
> > > > +		 * tripping the !suspend_pending assert (the RESUME message is
> > > > +		 * dropped for a banned queue), and triggering cleanup tears the
> > > > +		 * context down.
> > > > +		 */
> > > > +		set_exec_queue_banned(q);
> > > > +		__suspend_fence_signal(q);
> > > > +		xe_guc_exec_queue_trigger_cleanup(q);
> > 
> > This part mostly looks good but __suspend_fence_signal should actually
> > be signaled in the TDR after queue is off the hardware as without that
> > we could get a memory corruption signaling suspend fence early while the
> > hardware could possibly be touching memory.
> > 
> > guc_exec_queue_kill has the same bug which should also be fixed.
> > 
> 
> Ok. It seems there are 2 issues here, but both of them also apply to
> existing cases like guc_exec_queue_kill().
> 
> 1. The one you mentioned above. It seems the fix will be bit more involved
> as suspend_wait() returns immediately if the queue is killed before TDR can
> run and take the job off of HW. So, caller of suspend_wait() must handle it
> somehow and not trigger any fences.
> 
> 2. handle_sched_done()/guc_exec_queue_stop() reading suspend_pending and calling
> suspend_fence_signal() might race against guc_exec_queue_kill()/suspend_wait()
> clearing the suspend_pending. This might lead to hitting suspend_pending assert
> in suspend_fence_signal(). Some some kind of locking is required here. Probably
> xe_sched_msg_lock() will do here.
> 
> But both of these cases goes beyond this patch series. Is it ok if we can take
> it separately and address it in a later patch series?

No problem fixing up this part of later. I was going to rework the
guc_exec_queue_kill() logic to avoid faults on FD close and fix up
guc_exec_queue_kill() then and if this merged will also fix this part
up.

Matt

> 
> Niranjana
> 
> > Matt
> > 
> > > >  		return -ETIME;
> > > >  	} else if (IS_SRIOV_VF(xe) && !WAIT_COND) {
> > > >  		/* Corner case on RESFIX DONE where vf_recovery() changes */
> > > > @@ -2219,6 +2238,12 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
> > > >
> > > >  #undef WAIT_COND
> > > >
> > > > +	/*
> > > > +	 * ret < 0 (-ERESTARTSYS): aborted by a fatal signal. The queue is not
> > > > +	 * banned - the failure is in the waiter, not the queue. The suspend is
> > > > +	 * not confirmed complete, so suspend_pending may still be set; callers
> > > > +	 * must not resume() on this error without re-confirming the suspend.
> > > > +	 */
> > > >  	return ret < 0 ? ret : 0;
> > > >  }
> > > >
> > > > --
> > > > 2.43.0
> > > >
