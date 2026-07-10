Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BC0C43458
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jul 2026 04:30:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ECD210E128;
	Fri, 10 Jul 2026 04:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GZTBOdX6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953CC10E128
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jul 2026 04:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783657839; x=1815193839;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=v99E/Bi8Uf0HJMIK5vfNBtKZX/AkWwPjvSyBArcS9/4=;
 b=GZTBOdX6twEczxmoW1B7IcSwyMgRW3p8oB4ptckmxzgh6h5Fg6AU6tOo
 8RlvYdrgrp4Mgauf849VdEzvNg6unqwKo9Vv/Dx1rT3a83oFC77nfLBZx
 fbnWp65TY0GbTyp51MeSRtEZku+YOgEG2Ud10st+88pfHeZVIxThlSMCV
 2ajLegW4Ghjfc8lovXkTTAyicBRzW2AXmoJwezshcOLCeSSq99q7oHRzz
 naRNtEBNRJkwVcXIRYQzCkrCgQZbsgshdbxsjCw7Othz6PsrNilsuc+/B
 yy53AtSva63tfVIm4PSJMIOf3EItxc8L0B8OUtRLUcgNm/ZshKF+0yVh9 g==;
X-CSE-ConnectionGUID: ZncLOLPqQcSxwDl5tuPt8A==
X-CSE-MsgGUID: hUl3kfxqSIWWrkAme5NqbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95727290"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="95727290"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 21:30:37 -0700
X-CSE-ConnectionGUID: 0uaUBFxwTPCwpOsqMC3UGQ==
X-CSE-MsgGUID: dnJOfeo1Swi7uJDGuVi0Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="284878232"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 21:30:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 21:30:36 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 9 Jul 2026 21:30:36 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.27) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 21:30:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xIpNSaLeiFKOqT0HsN7/6zZKLfmE4FWw2CXZzV3y8vfrKa0DiIaoEXq3y2huejBKbJbMHtFL79+Xj2kMqxIwTdM5yGpn6TNIl6c2cdDf2B1kHjVqtPv3FONniuBfVcSa5vM7MzgQp/0LWXSD6y5+pbtKvR2l5eNAsH+kKkB2xetAifFluAdL6Qsr1KR2rmX6mF7kxZlljP4oUxU1oeHMvZhAHwAsRajcG9r/5schTNG5lObRI6FJRE0G7Vz0EiWMQyN9g9r/eoPJKabki3NATsCwo6eOW+L6kyYOTAlvVD0Up8dkO57kIdYLl7szX3wI4nMC0pLigTFBujTlvFByvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/+M9ZIEOgCNk94UjP5JjVOIrYVLeRAe8obL78BO+ao=;
 b=cv4tFh/bGBRKv4OPTNAVOVTWN+p/NVhLAU/arRv8yfbtAJbMSx0yVR7IYushKzh8jIvZCmkCTr33a0fe+836Aa4FrYoJu6FDw2A0U+1u+bqt+0WiibjGHsf4v8LE6eq9fCXv8pAjI70uvJCckwlEgDlG5l4vkNR/Ezyrm0Fh6pQYkVN+hbXNmBlVDvZjooGOsOH4LPRX3LVb8YwNU5lCDLTmNlAGcTBrZuEFB4/45/uXZXCQWKp0uJGIC4T0rmVcd2V/zjmDxEKBTdpQArwPBVtVMWWz3LB+8wNQN8/hbL8kJdwCSYjj6jNZnN6oEtOslcQuR1Rk2nd1YkQdUVSUPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SJ0PR11MB8296.namprd11.prod.outlook.com (2603:10b6:a03:47a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Fri, 10 Jul
 2026 04:30:33 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.21.0181.014; Fri, 10 Jul 2026
 04:30:33 +0000
Date: Thu, 9 Jul 2026 21:30:30 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 3/5] drm/xe/guc: wait killably for suspend and ban
 queue on timeout
Message-ID: <alB1ZpIXfUrfm8e3@nvishwa1-desk>
References: <20260701050730.1776476-7-niranjana.vishwanathapura@intel.com>
 <20260701050730.1776476-10-niranjana.vishwanathapura@intel.com>
 <alAGPmGuKrIXN23Z@gsse-cloud1.jf.intel.com>
 <alAHUXLtmyjcuQbq@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <alAHUXLtmyjcuQbq@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: SJ0PR03CA0373.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::18) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SJ0PR11MB8296:EE_
X-MS-Office365-Filtering-Correlation-Id: f3990971-83d5-439a-b63e-08dede3bfb06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|22082099003|18002099003|4143699003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: bVg3Pesy8hKhSJ86d6b0Vy3L6xfTUOM/ozGSbeYQDUP+ARypc1NkAo7XgJuwRXbLkx530WkyISnROu3BVJMwALCQPqn+tNjq4cdlS8zE0VH1MGkKLMw/PChc1JrB381FS30jBmRZKXeblbAj019HDF8y4rPU9KQ321yC29IDO+W9YiIW+BMmDfYm/kJxg+AUAux24R2NFlGMxAcJ2LN7HjRe55vf0svHdJ+aGqBllxuOA8Z4dO79R+2lkxYdqk5qjl+weQs2clCFaKZ4utCedoLMa7MubW58PUFi5wbFej4HbzV5hVyJDklfX+6vTJuPJTmTLmiz+YszE9WbMHnCnm6znBVAayFYiWlqthkhGRr9eAinOP5wZOKWPNwm/t25pd6LkDT/LUxlTw7zZ0SBjujaZZwaAgy+DZGOe4I1BBgoLGMJl/jCC2+OH27izLkNz3vVKEd/Rp/N7p61IV06QPsDf8fVG2oT65Ywou9jVTT9Sws0xpbXhjes5PRmyJW9wtcNYaTp3hXU3gqQpA+6wExyiSzs/d6HPRk8mhwshe9KYHf8Ps2LRwS0KSQbOarziyvcKctMMd82LY+lIf90aAm62N5iNj1ysLcPiHlXJUgBL/rtQycdSAfrhAbjPHCJnPhhaoJLOGL/PbGnKY4T0K5WnoiUhQ5vRBjRvEnUvo8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CQwspjvFNEcYf2vypw4xuZEAHNdlKngxmXR7P5dcfGE4XG1Pw6A4AZjFx2td?=
 =?us-ascii?Q?mi9/l2U2549TqX6cmZYVzgmnM/SIYFTttWCOewUygTc2IEEMnhClyGDiv8B1?=
 =?us-ascii?Q?EMYe1cp8fuiji+5rmMw5y8meYEWbjcGcjZ1Qm25MMfe/oc4vrC5Rc+L4khwI?=
 =?us-ascii?Q?HntmoX5dEoGMLSJxDvYk5+Ty5fGYlPpPvUR0pBzABT1RWZ/hk7UdpDaBXcGx?=
 =?us-ascii?Q?IHUO32bmRXWx3oAEyBZoX2I8CEL1k5/FyQ6Zld344XTdC+P+QrKnTTpMUkwi?=
 =?us-ascii?Q?sQ2luHrfiGV9Cvei49OHMh0sD9ntR9otEH26DOeOnu4c6p+KWn6m503psQto?=
 =?us-ascii?Q?fWpdYFeB2PX2vS3m7ElHe1amDok97l07ROUOmjx4K2C4N8INrcolpWF5Bx7C?=
 =?us-ascii?Q?SuRyXisSkYfMOJ3u1wLmjuyljC6gYTnbZtvf97yR4eEY1EO12xZflLesNtCS?=
 =?us-ascii?Q?xQ/UNKVfOaAm3MlxmfO0L2ePeOtjWKW+Qw2YwuEVSytK68YHDC5caPqbqjNi?=
 =?us-ascii?Q?e6UNDti4JKoeoLCGhwYL/kJAL7wO6llE+nvuUJr+WzaeDSaKlxC5hCmkgG6d?=
 =?us-ascii?Q?HO+E/cxXo5HY8YASkl9mB00yu+YLIBRRRdpdLx4TfOpkUeJTUt4wh9kNBlub?=
 =?us-ascii?Q?5rJCaPsFUNCU+RyiXsD/Gur8hM38kf9GxQifKViTnrBmnwYYaM48A3q5ITzm?=
 =?us-ascii?Q?CmgAzupK8vRQzZl35i3DeNKMek6p4CL0afPC7bSpfone5atWUKAOO3Tkya9N?=
 =?us-ascii?Q?WQt6Sbd5zjKsFyv1OCOuiAyC0h2lxhxIRQnuuq43ZK8Q9UJyNM0rmoyfoRPb?=
 =?us-ascii?Q?4ONiNd2pmFjZU0+QTUgTz4Rg41brr6b3QnDnRCEGbsDo1LpjcESomLSG1zhH?=
 =?us-ascii?Q?+CICcA/LF1HYZESUzqy/ffBrJe1f+LHXU7aJECFpOGIfC1Kxen3lTj/6abQY?=
 =?us-ascii?Q?3MYdfG/e0Ri8PUd0H2jWTcYqdb2Bf9zN0IdO4ZqkaOJ1y624aJsHGowM+TQF?=
 =?us-ascii?Q?dCBMu3kFWUT3U7bW+RwbfyyPL0ZjkQtVZHRcxUcc0RbQbrxl0gNcxpaUqu4f?=
 =?us-ascii?Q?4CU/XXphvvHlkQD59DAeLQVj3AAKBCLuTTX3AJO15Ep7zs/hwHspPuVSYzRt?=
 =?us-ascii?Q?NZruX1PArKSnIxN2fP9vqE59BTYvtTXVfZCYW/S8g3WjRbVdsfLC7dSklEVV?=
 =?us-ascii?Q?p7Ggn6qUP+Qjx4S6ee0K34tvB37hO/D2FuFGONoR4p5251RBi9FnYrv0ulmW?=
 =?us-ascii?Q?aXOfirjUMQ2iAJzEzXqbI0GZKU1KfmLrU2+uvd+d/FHHwXuWepa3tk04iX2f?=
 =?us-ascii?Q?9u8ZVb5FD2FfTciZg/16RWgUEQX3OYvJDITejb6eyuO/nvMLIWkIQkEfNTAH?=
 =?us-ascii?Q?jwU9AbEljhHWKZeuf0Y337az0BsbBON0+C1agE/wG4Zfqz3lpG5hZ3+9+6lr?=
 =?us-ascii?Q?o9W8opfGqlvKnJ/3+IWvumcTI1MFmKYbvRuBA1QJhI62QFxz2Ym46ECyB7Tl?=
 =?us-ascii?Q?QyNSxUpYMsxxk1l7Hk7n1Bydr/5RYli98Ii7dzA6nkwCLiip+6WxMouwAf58?=
 =?us-ascii?Q?CBGN+3mwnX4Dnr1HFa8TFu7x9QhSLlhxg7YQF+b022iyA9SqrtJ6bwBtJer5?=
 =?us-ascii?Q?FYMPqoe9qbbAlxlADJwL9d9V2oVzeyHHdZtphBm7AWdXAXGfwsFNAHIm+qxx?=
 =?us-ascii?Q?CkZZWynN6LubND6XUPyh07kML9ymgMjcGrbH5Kd7QuB0uU1CjdS7Q7OWR8OJ?=
 =?us-ascii?Q?4dH3WHEVv2pQPr9jZVIBUTovwZpbTKip9TkweTQZHpEd7/fEmKLt?=
X-Exchange-RoutingPolicyChecked: DdLxNddVH80ZzIU40jcR0HnAdv9+DlaENBe1XKjD2KA+KqHvn4aha07zYWSS6BpR4cABpbuqOuE66C3bYif1TjPuX5P7sZs4As1jp9NWPhxCK1Ag6j6xMm+wZ0pZ7IdqNxUJerNA1tgZF+gw27my7oRKzYzBqSivrIlqaSnCu/WhELvw3nD0aFoLF/8Zjm2CK2AuTBbGVrIk9OPmrjU+4DcUbyRpyoDAz5sjnID5BaEkrE+d0OPUQccken3F95YQWe2zNFJsx5YyD2YHurvU0OeUVDDyeMmxnf6JLNF42ZhhuTit+gjdCkwlfbvNww+0eIHZbSFk6Z5/pewtiFgxXA==
X-MS-Exchange-CrossTenant-Network-Message-Id: f3990971-83d5-439a-b63e-08dede3bfb06
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 04:30:33.0647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bywVEYojFTiQiwvBi1LHJrRAimTch/WZuU8loESxbSFPHkNQX03KAfOkgA4Zu0BXtyJRjaoP0QPg8TM63WZ6CEc9K2yQ3oL/XVuy6eVZZgcNEYLU1o/E5F8azx3E3LDe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8296
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

On Thu, Jul 09, 2026 at 01:40:49PM -0700, Matthew Brost wrote:
>On Thu, Jul 09, 2026 at 01:36:14PM -0700, Matthew Brost wrote:
>
>
>> On Tue, Jun 30, 2026 at 10:07:31PM -0700, Niranjana Vishwanathapura wrote:
>> > Harden guc_exec_queue_suspend_wait():
>> >
>> >  - Wait killably rather than interruptibly. Once a suspend has been
>> >    issued it must be waited to completion (or timeout); an arbitrary
>> >    non-fatal signal must not abandon an in-flight suspend, otherwise the
>> >    wait reports a spurious failure while the suspend is still pending.
>> >    Only a fatal signal aborts, in which case the dying task tears the
>> >    queue down (clearing suspend_pending), so no stuck state persists.
>> >
>> >  - On timeout, ban the queue and trigger cleanup rather than leaving it
>> >    suspended forever. Clearing suspend_pending via __suspend_fence_signal()
>> >    lets a subsequent resume() proceed without tripping the
>> >    !suspend_pending assert.
>> >
>> > v2: Add comment about -ERESTARTSYS in suspend_wait
>> >
>>
>> This doesn't actually help per my comments in patch #2 given sigkill on
>> one process doesn't mean another processes queues are being torn down.
>>
>> I'd drop this patch as I dont see this buying us anything.
>>
>> Matt
>>
>
>Sorry typing too fast... More below.
>
>> > Assisted-by: Github-Copilot:Claude-opus-4.8
>> > Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> > ---
>> >  drivers/gpu/drm/xe/xe_guc_submit.c | 39 ++++++++++++++++++++++++------
>> >  1 file changed, 32 insertions(+), 7 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> > index 9458bf477fa6..3d9bdc22c89f 100644
>> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> > @@ -2195,22 +2195,41 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>> >  	 xe_guc_read_stopped(guc))
>> >
>> >  retry:
>> > +	/*
>> > +	 * Wait killably rather than interruptibly: once a suspend has been
>> > +	 * issued it must be waited to completion (or timeout), otherwise an
>> > +	 * arbitrary (non-fatal) signal would abandon an in-flight suspend and
>> > +	 * the wait would report a spurious failure while suspend_pending is
>> > +	 * still set. Only a fatal signal aborts here; in that case the dying
>> > +	 * task tears the queue down (clearing suspend_pending), so no stuck
>> > +	 * state persists.
>> > +	 */
>> >  	if (IS_SRIOV_VF(xe))
>> > -		ret = wait_event_interruptible_timeout(guc->ct.wq, WAIT_COND ||
>> > -						       vf_recovery(guc),
>> > -						       HZ * 5);
>> > +		ret = wait_event_killable_timeout(guc->ct.wq, WAIT_COND ||
>> > +						  vf_recovery(guc), HZ * 5);
>> >  	else
>> > -		ret = wait_event_interruptible_timeout(q->guc->suspend_wait,
>> > -						       WAIT_COND, HZ * 5);
>> > +		ret = wait_event_killable_timeout(q->guc->suspend_wait,
>> > +						  WAIT_COND, HZ * 5);
>
>Drop this part.
>

wait_event_interruptible_timeout() will get woken up for user signals (SIGINT)
also with -ERESTARTSYS as return value and I am not sure if it is ok to treat that
as an error condition without a retry. The wait_event_killable_timeout() only gets
woken for fatal signals (and not SIGINT).

>> >
>> >  	if (vf_recovery(guc) && !xe_device_wedged((guc_to_xe(guc))))
>> >  		return -EAGAIN;
>> >
>> >  	if (!ret) {
>> >  		xe_gt_warn(guc_to_gt(guc),
>> > -			   "Suspend fence, guc_id=%d, failed to respond",
>> > +			   "Suspend fence, guc_id=%d, failed to respond, banning queue",
>> >  			   q->guc->id);
>> > -		/* XXX: Trigger GT reset? */
>> > +		/*
>> > +		 * The GuC failed to respond to the suspend within the timeout.
>> > +		 * This is not recoverable for this context, so ban it rather
>> > +		 * than leave it suspended forever (unmarked). Clearing
>> > +		 * suspend_pending lets a subsequent resume() proceed without
>> > +		 * tripping the !suspend_pending assert (the RESUME message is
>> > +		 * dropped for a banned queue), and triggering cleanup tears the
>> > +		 * context down.
>> > +		 */
>> > +		set_exec_queue_banned(q);
>> > +		__suspend_fence_signal(q);
>> > +		xe_guc_exec_queue_trigger_cleanup(q);
>
>This part mostly looks good but __suspend_fence_signal should actually
>be signaled in the TDR after queue is off the hardware as without that
>we could get a memory corruption signaling suspend fence early while the
>hardware could possibly be touching memory.
>
>guc_exec_queue_kill has the same bug which should also be fixed.
>

Ok. It seems there are 2 issues here, but both of them also apply to
existing cases like guc_exec_queue_kill().

1. The one you mentioned above. It seems the fix will be bit more involved
as suspend_wait() returns immediately if the queue is killed before TDR can
run and take the job off of HW. So, caller of suspend_wait() must handle it
somehow and not trigger any fences.

2. handle_sched_done()/guc_exec_queue_stop() reading suspend_pending and calling
suspend_fence_signal() might race against guc_exec_queue_kill()/suspend_wait()
clearing the suspend_pending. This might lead to hitting suspend_pending assert
in suspend_fence_signal(). Some some kind of locking is required here. Probably
xe_sched_msg_lock() will do here.

But both of these cases goes beyond this patch series. Is it ok if we can take
it separately and address it in a later patch series?

Niranjana

>Matt
>
>> >  		return -ETIME;
>> >  	} else if (IS_SRIOV_VF(xe) && !WAIT_COND) {
>> >  		/* Corner case on RESFIX DONE where vf_recovery() changes */
>> > @@ -2219,6 +2238,12 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>> >
>> >  #undef WAIT_COND
>> >
>> > +	/*
>> > +	 * ret < 0 (-ERESTARTSYS): aborted by a fatal signal. The queue is not
>> > +	 * banned - the failure is in the waiter, not the queue. The suspend is
>> > +	 * not confirmed complete, so suspend_pending may still be set; callers
>> > +	 * must not resume() on this error without re-confirming the suspend.
>> > +	 */
>> >  	return ret < 0 ? ret : 0;
>> >  }
>> >
>> > --
>> > 2.43.0
>> >
