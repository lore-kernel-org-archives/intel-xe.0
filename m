Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069A610F2871
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 22:13:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE69010EF34;
	Fri, 27 Mar 2026 22:13:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZkZlAiW+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86DF10EE74
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 22:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774649586; x=1806185586;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=D6zjElWSrco8BF0kphWSpJH0WcyS1Qoz5+VLZuskSxA=;
 b=ZkZlAiW+eju2shlJWEvCXQuGEhkQkRkyGawiljB51HmIBY9zmVeKiZ0R
 AMploK48jejAk+RQe5bc9+G14zdW1G8uOkIX+z+cD3yU5cFUSFpZWyFyP
 lQkD5EN6nI4ojJEZ1ra1CuGtkznq7Scl4TLyINh5zIQwIKkFBS2JhSfHV
 1twMbDDvNiJwcnG2WyDXC2Zx7rllKI5sW9ufetdEvH6GHAR2dRZ2g4AsQ
 6zBvrUT1A39zuhrrEWS0pHW9NylHwWWOAOB8pQPXLpdgFhgfR/XKN0ydD
 JqcsLtI42cFGRDK1B6KKbJcDzs1KQ28srI+iNR6KujHxToA2vrQFYovnx Q==;
X-CSE-ConnectionGUID: 0WwwUb7iS1u7ESfHFJrbfA==
X-CSE-MsgGUID: 6FApD+0HSpuUqBt8/gk6Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75610801"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="75610801"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 15:13:05 -0700
X-CSE-ConnectionGUID: 9ZGJlmIcQCC++La9URPo/g==
X-CSE-MsgGUID: WurTJ3KVQOqIj9nyrzCt+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="248476097"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 15:13:05 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 15:13:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Mar 2026 15:13:04 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 15:13:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b9c81QYiqYwr35awwdNzwVZTPHAx46yUjVJNuqKhdCd9JBV650eCBhap8yw3Ujrl3wwUhUshZFnq5gnuiP4d+/KImqppKcJjOw92z7dswv3Qt3A9Aq4THlOIdppwNHApXAHOfUa3Bt7GW+e4+xFgOWo7LT/vjIqSwS0gajEwzauZ556ALDGLeMUbAgJ9dvuhRR9PGyQFlvp/btpENg1Vk125PKhjaWKTYg1Pz8hd05zAZmRxEJ0hQAgxrChePdutDZOLJqHTnpDPPl/5bQO1iL30mGBc/ck3w0aAKBQYV33kmd1c0HfImYGVug6K9aAb6a1oIUQTXrhXjDQtJN96lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QjIz4czf6zeReav3Uhezno8s5bO3HGv5hZw8CSVmViA=;
 b=NEuLDtekOa2+WUsSYPlwlJc49W6+6Ic0p1V6D2JLLDTfus7IbOlnjvVL9BESJnZdVV93s79VDMr8pR/pq3pw0bvN0d3qOCid9qcLFlaPoYFKYrvg0F1AxSUWgmU4yhsmnzl5xOTbKRwOPGar5ayIk20efoiKcfcUUGHNVIJ0Ch0H1Df/u6KG2Pdkm4v29lpdd2iUshj+0egKDxi0NCLSi6j4MK8fg/ouQia8aSRolmMeHxfUxuJaCSvabwPReFen598ZCZ7PMTvQxI9bxJ8C2Ve0uUVjiXM3IOfePlwijBmmUI7iV90ck1ic0yFh9l0+b/ydYbMl63WigbA2KLR9lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CH2PR11MB8866.namprd11.prod.outlook.com (2603:10b6:610:281::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.10; Fri, 27 Mar
 2026 22:13:01 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.006; Fri, 27 Mar 2026
 22:13:01 +0000
Date: Fri, 27 Mar 2026 15:12:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>,
 <maarten@lankhorst.se>, <jani.nikula@intel.com>, <lukasz.laguna@intel.com>,
 <zhanjun.dong@intel.com>
Subject: Re: [PATCH v4 2/9] drm/xe/guc_submit: Introduce xe_guc_submit_reinit()
Message-ID: <accA6VhvpBTzh2rD@gsse-cloud1.jf.intel.com>
References: <20260327203620.809353-1-raag.jadav@intel.com>
 <20260327203620.809353-3-raag.jadav@intel.com>
 <accAogC8IHidoyng@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <accAogC8IHidoyng@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: BY5PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::33) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CH2PR11MB8866:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cb206ac-3cda-4481-9f9b-08de8c4e0274
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: tP8RZ+vyE0z/HnF6tEQ4fv3TJ9IaYgL4z8wWbiEPKNGiHlcIIP2Uxt88iEkon3FDkkM7PoJ81Rstn9B71nC5x2GQkwDoufITqTTDi31X5r59bQc9CMDTNmVrcKw5/YaTOY8q/ZhZ5NsbX5l5lwGRHGUyY4IJ7D/VXV8Xp90JVEAw2DID1ephtEEveH/USJ/rctpMPpHRMapEOi5pZlGfBVslKWHMfYx0XB3wQfSslonhLe2UbZNcnI2Jx5GLQDOXPapRKHB2RDsi+KnF6DjvkVskNZtIIl7V4/VeVUYkFAaLc6XJEC1ZkP+NbalRmGxP3FHQuhy52UzSuOdvTxMlbKzorDDSTH3yaQ9zx/jUbhaVpz58Gf3KChwEt1QnexQTnb26iHXCNfFCX1MwH7gIRPoCMjeoRwIbfG/ew/CPiQrNErqNr2ApISJdM1zM5LGo/fefvrvImvBmeLvm87gLiVq7XGqWADBtGTDWVlA7AdNAQ+7fU2i2B1+wjvdpNUhVlAITJh5f13lq5qXXeMGT7kWdvX+0ePHH2eDVDplPOvAZg8owg8rlMI5V81FafFKo87zwwHMB/qsc9Msa+i+bVMhO4Cuj1yI5XLUH85cYJwdqpPEci1TiFJUvJl+WOg6yZZmcDEaeiHomXaPIZl/TssNTd+7i6AAiFhxpFOiAQqQ8OoODeelAT/3adHQNG1KgPCRaLGHfeCjz5llfwcj7Cg+DMlnacNTWRl/7TydDaJc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E/ydibKaKLjvN8cLe91/LloIoC5ck9tMcXBlM8f+dT1oiiRs36xhMlnoEtz1?=
 =?us-ascii?Q?VfVjOdf6ihtDmtdsoLHH1raRNOTA49tBbtZ9qTh/1pRfJhcpk0yr+GP4SCV3?=
 =?us-ascii?Q?QpZ/zOBbXc5XaAgBalhf0Folva1hG9MYs+63obFJTbqhWsY04l7RKUYwDf0J?=
 =?us-ascii?Q?ZvR5P9iNB2lcjJBgs2sGp6khtw/BJCrMbk5RUA7nZQwX2uzCKnsmSGxL+TKj?=
 =?us-ascii?Q?m/Zv8Du7r2CZr2VyNLfuoLTNeBSdA1ScZ2afK5wrh63FsxjUmuTyT08T7aCp?=
 =?us-ascii?Q?ntoQCXwfXDEpBAWDknNRtjkT/3vMs5JS/wF9DDAPfpF+VsnSNM7WeC776ZYM?=
 =?us-ascii?Q?SZWCMOpxXDP1jj6eN4Kl+jTqCAvQUdrX+0O5te3p2E2Dxyejg+KrWKej249n?=
 =?us-ascii?Q?82RJGn5XKUbEqwY53ChdkIV6qynCaASFSCEGz3CDvVlCZCBEH+zjp15nPTDY?=
 =?us-ascii?Q?Ay/XB7rGUvKkDLWmJbYM5cj0Dx+rpsLvp/wgR038FZq27ZBnQHtz+MMVwg5G?=
 =?us-ascii?Q?nNOjk3ItlMwX6HrvvuGfyn1yljz6s8vV5BKKUnyyp0xZdwWkB3FWezschEjq?=
 =?us-ascii?Q?Ldke/rRIOkcNj3oQGoLbjUHxlu/HQgnOqQf7sPJVjy8ZL2yJLGJXJB+DeTIo?=
 =?us-ascii?Q?4kKnjqxKIZxWUvAB1pLiKka6mpI+D++n4pRZ6X+3qD1nFyslzFyq3gn4GFbU?=
 =?us-ascii?Q?mJt1a5eeMbPPw/lQz86Q5zGnmZtQQGiiIEw6jRCAXscM6BnHmHwMf1/3evKe?=
 =?us-ascii?Q?umLV+oC3kZESVazrWLQnuP5tkVgiXMzQHgpCkNnm3QlS13/B32gJ4yi6sYZ4?=
 =?us-ascii?Q?HO7eDHeo0vuFQohZxh26fELI4zAFeRbI44eJcWpQ+ffqLWOwj2OUoEQJgJ5M?=
 =?us-ascii?Q?Ldi/bMyITDrvnnCJYoAsOlcwmzVmCD/4fmtuArR+DRG/AoroR3Mn2VX4EEbz?=
 =?us-ascii?Q?vDSqbRiSJFDwbzNEzURQaFg35SlliFGQh4AIiPLkeSQHrvmkkvy59fxDweRm?=
 =?us-ascii?Q?Ga0sINV1RgJZmxoe8AT/lX3GqMVkFiv9OgP6Y4dfdq2Z2stQu9um/kwNH+ni?=
 =?us-ascii?Q?WgVsPLjhl2bwsF9y/n9Qti2y2Q49aL9tK0MbIsadzTbHVcb8DIYyP13yEogp?=
 =?us-ascii?Q?lL/FCjpU1J7g5bhWSDPeyixbxX1OX3fuhsh9dXtozelbStLKkba1QH+7w66/?=
 =?us-ascii?Q?V63Qi6cMOYw4+XJW+TUHpJtfkHzk50YswtdXEGZi453lNgZvinSsWrqGPgq0?=
 =?us-ascii?Q?T7m2+efW2hFm0kv5fh/O/UUrETzP1jjhP5BE9+arHTcoNJToK+EDdd/kSSmY?=
 =?us-ascii?Q?jaq+nwcYQurMQyjB7mAA+YQH2dGik74eMLoXn9hWhoqHomPWkFbAuPrgauqg?=
 =?us-ascii?Q?bS5guB03kaF43xovzoeiwRl6e8jjJ3o0+ATSZ8DOo/KCTQnl6R0nCZ5obX6m?=
 =?us-ascii?Q?xO1mxCqrWFrNFNf4gk24HRegbsjZni0/neTTy3JRqMecyky2I0Ifv3dZPSTQ?=
 =?us-ascii?Q?ROKUOkbo66wnuY9tiPvqh+XMS88OsUO2rVIjRMhA8ivYXByET1oplFJc/PUa?=
 =?us-ascii?Q?108MIoOJFbwGKi5oIhudNS0brbda666pVkTPb7tDmHOwA5lu+b8mRTL4NHMc?=
 =?us-ascii?Q?0nNUJBkWUEfnufAhsj8LAuOehGLjrac01s2qastk1WSOuJ4XEbh9GnpaB0mg?=
 =?us-ascii?Q?+9drcJdQtUw6UOhY3Yenm85fytByf98qOtCQXaFm0soHUsbvC3Nudsg6s0dH?=
 =?us-ascii?Q?NLYM383hr7wPx8FPOQyKNhMakuULe5I=3D?=
X-Exchange-RoutingPolicyChecked: l3b/2xhL+FuXnNpUPA3cALrfbhhg74bJKs8qIUpoYPRNj59zpzEefZAjRI8V4Qj/7GcR0Gs440I6YOVNVvhU+KiYltcHlfX4V92DkHjoZqFEgalojX35wn2etAhsue4RmiLYmZI9KFYzotFAKES9kdAFygLtJrLfIDDJoLucCc35WtMGTBq6zH+cp2N02x/etzNlns/rtT3iOMxVtXMIGeQhZYyplwEyK2qMZwEVWoSp3kFqSr2mjofJ+QaqKBs2mEcSKXzj5sWD8QBwaAO8Ba87lnet2vUDodXfG66clc8oxlJcP42phXy5oVpUegPdN7ygpZJf0W6EzKXmrqX4iQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb206ac-3cda-4481-9f9b-08de8c4e0274
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 22:13:01.1668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wvJYT2eH1jc4uXWzU6zBOw7zK2GJ3zMfTHf0xfPk4ZiEPEfaI/INAIAPKyrDIOyo+D/U2NlQtimTirPENxEliw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8866
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

On Fri, Mar 27, 2026 at 03:11:46PM -0700, Matthew Brost wrote:
> On Sat, Mar 28, 2026 at 02:06:13AM +0530, Raag Jadav wrote:
> > In preparation of usecases which require re-initializing GuC submission
> > after PCIe FLR, introduce xe_guc_submit_reinit() helper. This will restore
> > exec queues which might have been killed before PCIe FLR.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> > v4: Teardown exec queues instead of mangling scheduler pending list (Matthew Brost)
> > ---
> >  drivers/gpu/drm/xe/xe_gpu_scheduler.h |  5 ++++
> >  drivers/gpu/drm/xe/xe_guc_submit.c    | 35 +++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_guc_submit.h    |  1 +
> >  3 files changed, 41 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > index 664c2db56af3..1e079ca3891c 100644
> > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > @@ -51,6 +51,11 @@ static inline void xe_sched_tdr_queue_imm(struct xe_gpu_scheduler *sched)
> >  	drm_sched_tdr_queue_imm(&sched->base);
> >  }
> >  
> > +static inline void xe_sched_update_timeout(struct xe_gpu_scheduler *sched, long timeout)
> > +{
> > +	sched->base.timeout = timeout;
> > +}
> > +
> >  static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
> >  {
> >  	struct drm_sched_job *s_job;
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index a145234f662b..c92bf42b8d3d 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -193,6 +193,11 @@ static void set_exec_queue_killed(struct xe_exec_queue *q)
> >  	atomic_or(EXEC_QUEUE_STATE_KILLED, &q->guc->state);
> >  }
> >  
> > +static void clear_exec_queue_killed(struct xe_exec_queue *q)
> > +{
> > +	atomic_and(~EXEC_QUEUE_STATE_KILLED, &q->guc->state);
> > +}
> 
> I think you'd want to do an atomic_set(&q->guc->state, 0) as we need
> clear everything.
> 
> > +
> >  static bool exec_queue_wedged(struct xe_exec_queue *q)
> >  {
> >  	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_WEDGED;
> > @@ -347,6 +352,36 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
> >  	return devm_add_action_or_reset(xe->drm.dev, guc_submit_fini, guc);
> >  }
> >  
> > +/**
> > + * xe_guc_submit_reinit() - Re-initialize GuC submission.
> > + * @guc: the &xe_guc to re-initialize
> > + */
> > +void xe_guc_submit_reinit(struct xe_guc *guc)
> > +{
> > +	struct xe_exec_queue *q;
> > +	unsigned long index;
> > +
> > +	xe_gt_assert(guc_to_gt(guc), xe_guc_read_stopped(guc) == 1);
> > +
> > +	mutex_lock(&guc->submission_state.lock);
> > +
> > +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
> 
> This is will reset user queues too which I don't think is desired as
> those should be torn down and cannot be reused.
> 
> We really only to reset kernel queues.
> 
> So how about a xe_exec_queue_ops reinit...
> 
> Something like:
> 
> static void guc_exec_queue_active(struct xe_exec_queue *q)
> {
> 	xe_sched_update_timeout(sched, timeout);
> 	atomic_set(&q->guc->state, 0);
> }
> 

Opps, typo... s/guc_exec_queue_active/guc_exec_queue_reinit

Matt

> Matt
> 
> > +		struct xe_gpu_scheduler *sched = &q->guc->sched;
> > +		long timeout;
> > +
> > +		/* Prevent redundant attempts to reinit parallel queues */
> > +		if (q->guc->id != index)
> > +			continue;
> > +
> > +		timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
> > +			   msecs_to_jiffies(q->sched_props.job_timeout_ms);
> > +		xe_sched_update_timeout(sched, timeout);
> > +		clear_exec_queue_killed(q);
> > +	}
> > +
> > +	mutex_unlock(&guc->submission_state.lock);
> > +}
> > +
> >  /*
> >   * Given that we want to guarantee enough RCS throughput to avoid missing
> >   * frames, we set the yield policy to 20% of each 80ms interval.
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> > index b3839a90c142..a40aef196cbf 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> > @@ -13,6 +13,7 @@ struct xe_exec_queue;
> >  struct xe_guc;
> >  
> >  int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids);
> > +void xe_guc_submit_reinit(struct xe_guc *guc);
> >  int xe_guc_submit_enable(struct xe_guc *guc);
> >  void xe_guc_submit_disable(struct xe_guc *guc);
> >  
> > -- 
> > 2.43.0
> > 
