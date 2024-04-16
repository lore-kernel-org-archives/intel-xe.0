Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56273C04FFF
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 15:53:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B18112D2A;
	Tue, 16 Apr 2024 15:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AsgSF9x+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1424510F19B
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 15:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713282830; x=1744818830;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0GuFGIrlwDr1PePmf05o2CdrMLle0OzPUlYKCtQynus=;
 b=AsgSF9x+HqZN9YlE8SC+oycM0Fj3/ByNB4pobbyDsiRwlqz/jxy3v/iQ
 xpxX6b3nJR3ZuI63GQXbPXwpn0vzXzFozXIEOO/w1uh5BNjK52GC6Wuz1
 ktbPiTPP1ojrKqqyLRPKvMcOmWw3x1chjP061KzzHnPuuvjraR4ga3RbU
 yU74RHX0IibJCb9TVKh2YxDeL0VIqlU4mlFb3UbIo4Xsox0fHBN8UbWeb
 XTI/8yfLVGaC3fcLV2/cc3SLsge3XdAbhT5ohLYE+59LhCMjx3rkJqnK0
 bJfC7ot1e3ZczDQxFFE//aNkgVf5VCoxNxFwRB5FeSNyXGLR0ROfLcr5J w==;
X-CSE-ConnectionGUID: lq81hlUlRpeqZrS4wNfP1w==
X-CSE-MsgGUID: qHUT9VHLQpWT+jF9rNWlWA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="26192473"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="26192473"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 08:53:46 -0700
X-CSE-ConnectionGUID: of3E+jQ5S3yGcNNFNOen+g==
X-CSE-MsgGUID: co2+DLhpQxGDY7k2qxgcZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="26960731"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 08:53:45 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 08:53:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 08:53:44 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 08:53:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UtjfMv7rU8DIe+X8d58Lq8HbYqcklIUOQ6mxH5IFnSRhBKusEonXMkftzDjLJF/i9mPqbqxmyJygrMXTFMauUkuSUFJMlObULDgMRfgpumHlpyRkTu+SPa+MY4mQkB9mKDSw6sQzBnhJ3NtQMDhE+VZCDJaGuwgVbCD6j3W0YWuLQwpgtInen/stp0z8nV+96OUp4/UwRHdCaa/lR/BMU1cPXRzRTA8YWfoJDVnwV9KxsAt2bQizrJMpJO48cKjst3e6c0iufX+dXiiFRJq7qaJ0cvsWG891yZw5oRFyWuuiwnt/9A/hnZZGFDAsxjERPTs/a6BiskrcddcJ9kyx+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qzJ6jKpuszFn1ckC4OPRnv6axvfEMpTz1OxlwnGd/s4=;
 b=ibGOSs/BV0v6cDDqcZiKJMI7Ov4Kt77Z37yGAKMfIogjHe/+C5lyYyMcpwQ4YPTP+6enShQNX/0GyzCXd7yStRTPMYZSslrGjBy/uogVo8d/QcnxYEonh++9ReFY3CrSnQgbSKpwXoaJUvupG9s3b24VwG8eK9wxB4hzrvy4JcbF/mPwz/cZx3vRzajFu3CthZb739KdzVALi5krvR8mgAG3qhNL1/5X4osRYdk5ENpcMl0bIgKMu+8QM1UzAUhxVdHVSHNZajwkGH3nRSFiX2k4VycT2V6/BxedFB4sGg6vOnLk0rHRpl3z7bY4VSWsksRXPRFlgdaUTw1AjUxpQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4873.namprd11.prod.outlook.com (2603:10b6:806:113::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Tue, 16 Apr
 2024 15:53:42 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7472.025; Tue, 16 Apr 2024
 15:53:42 +0000
Date: Tue, 16 Apr 2024 10:53:39 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH 2/7] drm/xe: Add helper to capture context runtime
Message-ID: <kqmmb46bjzebl73knydivy3ehchirsvuwdyhuope72fmzdpxbd@cyxieg2yc7xx>
References: <20240416030454.3739862-1-lucas.demarchi@intel.com>
 <20240416030454.3739862-3-lucas.demarchi@intel.com>
 <Zh4L9YhWnN5_CEKP@bvivekan-mobl2>
 <5yckw2zkfkdzlv6gjx77tmrtfpqrxe7yoywtgvbdzslnamyfha@lrfctmrwcqn5>
 <Zh6dDMMFsBMLPIbK@bvivekan-mobl2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Zh6dDMMFsBMLPIbK@bvivekan-mobl2>
X-ClientProxiedBy: SJ0PR13CA0088.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4873:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b8adf63-de7d-4595-128e-08dc5e2d63d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xm2GtotbNvw8Nx3PbVSO8wca34QRuwXxUbW1D0j8f0WG/YKYZwWmxwPAqNXy5nGUXITeeqbubiyov4vK9kibNgYu6fssANfCxDexE+68YfiPwbQ1SLWNYLXM6TyOEdwKvnX6wG17dTd+W+1UJ+GcTYZYEvV6X6T6qFrnCKY64IRFLJl0gCqQjuB+OCyNBZc0mvCRVpOsUd60yc+XR2du4bEu0HqagL/OLuygNvSl30E4dnUgWAyq4FAuSPi7MX55ZBKtOph2kKBUwCZ4Dmokl7yXzHtZOdZMmJLKd/rBmW+AZyoJ+Ekh8Kn3DSe6u4i4CeG5JtQ7stv+TnXlgZK+FAPq9GR1WYRXvbVVJFWcyz54k49p5Grbw3nbNJ/N5OkGINuS1fnY7pWQUaiUZ/9kh256An8TV3V1Ve1S0c6Yqia1ZKy6iY/slbRv1udFM1c0uvbZjHN8hfJjq118s5483+PCeeM5kzGymKr1jxqttoaqDlkXw4/IgAjxppVrtlDoReI3ZApkdGygrcy/hhx0FO8sCJLIOvuO+o+NEtxOoreNrHgMYVV/ve2hgA8Oq+AY6oxuJVJoQGH2erJzE2mBzF7+edwq1W9szFQ2ZES+7otdiwcbpEpSFZancP3XSVnHqoGYyUqPyH0/CsLC/UTAjlNH3ENvKCbCjXtZRtZHr9E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3slaEj2YGKqrZn9MAJnfBs5ABrhlm69O1rYXax69CCrKRP2/esCM/y8dsEH7?=
 =?us-ascii?Q?C3Rk4lj/5OIdtWwphIdeqaWy6loWJVnYv1b6jhcsraVWTltCr0P4CHkrEiC1?=
 =?us-ascii?Q?8PkB+CeiOptsPXdjo62v283rYmba3yvp9dgNddeF0z0ZqAClInjRD5MWQ6Bs?=
 =?us-ascii?Q?dukWnxvD8maiVgHWpZM6gr1rxdxUcVpglpwhGXkNflYsf7Ok1b72ywtHcub9?=
 =?us-ascii?Q?qzV0YcHGhkqoFz34IRJITTesz2imRIDBTUaRgSUfQbwnfno4FRBE7b2O/hkd?=
 =?us-ascii?Q?aD8hfeHmlVgFZTivhfSzUqtsYcZb95KmsemsZSUHBdMglVGxb09IH0aKZ5uc?=
 =?us-ascii?Q?efXtt1YX1UadJ9lyk72xbczvx0YHGLhBpt61u1LTka6MaZXTo7LKdlanZ7T7?=
 =?us-ascii?Q?s3N2IDTfXIkCoj971DYQA4NNAY8AGLJuxV6bAfj0LQHIFlHsDqLs5UcQlxoS?=
 =?us-ascii?Q?zcXyemtvtKk6pvDddfq4GqGpUjqCzYcBIcmp5cYnm7qt5RVoQRBHNPsQwjvz?=
 =?us-ascii?Q?TsUGMEgUE6Qr9pvLzFsA2daGeMECxdft1bKzgBu1ReEMHbhkA8OnOabZA6Ky?=
 =?us-ascii?Q?Z49yMvXBPD/mw8SyyNDilw/ReP+pRTztqJ9iyhPBFEKPEQT4HJvqfHjfGjoK?=
 =?us-ascii?Q?/CIruvPnlW0yw9Tf/ZIq6Oph9yFw2sSl0cJUr1A+hToko5NojvzPt3BfdqXt?=
 =?us-ascii?Q?3h+2/Ay3BIsbvH1bTMHMqG+oJCZava3rXKiupzYHLB//O/cSjAYr6AF1HRKn?=
 =?us-ascii?Q?oafOYLcwXfYLy83gZzk5bU8pieBbnB23ZH7/e2kOtg/lI0/aPcvleufv254A?=
 =?us-ascii?Q?MX+20W+2y0ym/c6H0CBO53GoBIRrrDtTnewL8a38IZwwLuIXxyNPeZYjq5JM?=
 =?us-ascii?Q?5dLX5iCNfS2zvHAThEqTezFwM7Le9ia4Kdy7KrpsC75PAc8d/p5gQp4KskYz?=
 =?us-ascii?Q?haRudoLz0ctD4O/girijymDBMRtwZnNYszftQMLDx2osCzQynWaAPCzRhQtX?=
 =?us-ascii?Q?fi3sa3IuhZJM2wrv9N0/RFFFYaLDEZQp7Bzj4VYIbxQY6n7ynlfK+9TWEc9u?=
 =?us-ascii?Q?8aXa/0k2RkLYYKyBoLTAwIpUMbAe7lTT/WjyxevP8zjIPgpVGekqGSg7x7TR?=
 =?us-ascii?Q?CPYoPKedwgR5TKJtSjfUU+w4l//WlV3tJRX5PlBd8N9M+IE6nrCfYzmyyAOE?=
 =?us-ascii?Q?3NTLfOkrWjM44Ssx4BMHaBNOJUnrqgs3QA90oLxbiJ+I+407R4T4k0kT73Se?=
 =?us-ascii?Q?wFdug6i7vCptyV+c81/hz+nfPCc+5ic1BIfyOkceuCUzsZHWqjfUApadKT63?=
 =?us-ascii?Q?GQ7ugnDGApunqc/jp/dcFnNrQG0CH4OwH8JRmZVts5daz0qZ0pJaLB+9rHYs?=
 =?us-ascii?Q?ZivS6tH0o2PfO1KqeTP1s1OiAsFKJ22loa/OOtGspkwVJdbHdCJ2viJi9WO0?=
 =?us-ascii?Q?ZQqyqKvgAdMoP5Tyku1g0U8mHcfzU/svQIFB9Va3ccy2vNy3GF50bPY0JJG1?=
 =?us-ascii?Q?L61e17jzkuUTy48lq1S/AuiWguGpuZQXCYQefIG+xCLdffis1levzzV+7dfe?=
 =?us-ascii?Q?xPnpkdHCyuB9i2dpLXPJ9oZNjgcMVh8i7xzwX7MutZmNp7oJSTgCT3qma21v?=
 =?us-ascii?Q?MA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b8adf63-de7d-4595-128e-08dc5e2d63d7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 15:53:42.3032 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JJLmODqlqoakv2g7/If2nF0Y0HkI+2zPp4qFwg3OVjN7NGrd4HgZngEXoJyF3tm47uXHx6ya/VuG97drz0lBTrGDaKV8YgSoLQsqNVI4zAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4873
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

On Tue, Apr 16, 2024 at 09:15:16PM +0530, Vivekanandan, Balasubramani wrote:
>On 16.04.2024 08:42, Lucas De Marchi wrote:
>> On Tue, Apr 16, 2024 at 10:56:13AM +0530, Vivekanandan, Balasubramani wrote:
>> > On 15.04.2024 20:04, Lucas De Marchi wrote:
>> > > From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> > >
>> > > Add a helper to update the runtime of an exec_queue accumulate it at 2
>> > > places:
>> > >
>> > > 1. when the exec_queue is destroyed
>> > > 2. when the sched job is completed
>> > >
>> > > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > > ---
>> > >  drivers/gpu/drm/xe/xe_device_types.h |  9 +++++++
>> > >  drivers/gpu/drm/xe/xe_exec_queue.c   | 37 ++++++++++++++++++++++++++++
>> > >  drivers/gpu/drm/xe/xe_exec_queue.h   |  1 +
>> > >  drivers/gpu/drm/xe/xe_sched_job.c    |  2 ++
>> > >  4 files changed, 49 insertions(+)
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> > > index 60ced5f90c2b..f6632b4d8399 100644
>> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
>> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> > > @@ -553,6 +553,15 @@ struct xe_file {
>> > >  		struct mutex lock;
>> > >  	} exec_queue;
>> > >
>> > > +	/**
>> > > +	 * @runtime: hw engine class runtime in ticks for this drm client
>> > > +	 *
>> > > +	 * Only stats from xe_exec_queue->lrc[0] are accumulated. For multi-lrc
>> > > +	 * case, since all jobs run in parallel on the engines, only the stats
>> > > +	 * from lrc[0] are sufficient.
>> > > +	 */
>> > > +	u64 runtime[XE_ENGINE_CLASS_MAX];
>> > > +
>> > >  	/** @client: drm client */
>> > >  	struct xe_drm_client *client;
>> > >  };
>> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> > > index 71bd52dfebcf..c752d292fd33 100644
>> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> > > @@ -214,6 +214,8 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
>> > >  {
>> > >  	int i;
>> > >
>> > > +	xe_exec_queue_update_runtime(q);
>> > > +
>> > >  	for (i = 0; i < q->width; ++i)
>> > >  		xe_lrc_finish(q->lrc + i);
>> > >  	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
>> > > @@ -769,6 +771,41 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
>> > >  		q->lrc[0].fence_ctx.next_seqno - 1;
>> > >  }
>> > >
>> > > +/**
>> > > + * xe_exec_queue_update_runtime() - Update runtime for this exec queue from hw
>> > > + * @q: The exec queue
>> > > + *
>> > > + * Update the timestamp saved by HW for this exec queue and save runtime
>> > > + * calculated by using the delta from last update. On multi-lrc case, only the
>> > > + * first is considered.
>> > > + */
>> > > +void xe_exec_queue_update_runtime(struct xe_exec_queue *q)
>> > > +{
>> > > +	struct xe_file *xef;
>> > > +	struct xe_lrc *lrc;
>> > > +	u32 old_ts, new_ts;
>> > > +
>> > > +	/*
>> > > +	 * Jobs that are run during driver load may use an exec_queue, but are
>> > > +	 * not associated with a user xe file, so avoid accumulating busyness
>> > > +	 * for kernel specific work.
>> > > +	 */
>> > > +	if (!q->vm || !q->vm->xef)
>> > > +		return;
>> > > +
>> > > +	xef = q->vm->xef;
>> > > +	lrc = &q->lrc[0];
>> > > +
>> > > +	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
>> > > +
>> > > +	/*
>> > > +	 * Special case the very first timestamp: we don't want the
>> > > +	 * initial delta to be a huge value
>> > > +	 */
>> > > +	if (old_ts)
>> > > +		xef->runtime[q->class] += new_ts - old_ts;
>> > What is the need for accumulating the delta instead of using the
>> > absolute timestamp read from CTX_TIMESTAMP?
>> > This would break if xe_lrc_update_timestamp() is called from some
>> > additional places in future. The delta would be incorrect.
>>
>> can you clarify the breakage?
>>
>> - CTX_TIMESTAMP is per context (or exec_queue if you want to use the sw
>>   name)
>> - Reported runtime is per client.
>> - any update to xef->runtime[] should only ever be done by
>>   xe_lrc_update_timestamp()
>>
>> Anytime xe_lrc_update_timestamp() is called, it updates the timestamp,
>> saves the new one in the lrc, and updates the delta in the xef. The
>Everytime xe_lrc_update_timestamp() is invoked, it reads the
>CTX_TIMESTAMP and caches it in lrc. The value in lrc is updated on every
>invoke of xe_lrc_update_timestamp().
>xe_exec_queue_update_runtime() is using the delta between the new value
>from CTX_TIMESTAMP and the value stored in lrc. In this series,
>xe_lrc_update_timestamp() is called only from
>xe_exec_queue_update_runtime(). But there is nothing blocking from
>xe_lrc_update_timestamp() being called from some other place in future.

there is nothing blocking it, but it would be the wrong thing to do.

Just like there's nothing blocking a call to e.g. xe_guc_ads_populate(),
but calling it willing nilly is the wrong thing to do.

xe_lrc_update_timestamp() shouldn't be called from other places. The
alternative would be to move the logic to be all inside
xe_exec_queue_update_runtime(), but it would be breaking one abstraction
layer to make xe_exec_queue_ know about the lrc layout. And that I
consider worse than what's here.


>In that case, the cached value in lrc would be updated by that
>invocation outside of xe_exec_queue_update_runtime(). So the next time
>xe_exec_queue_update_runtime() calls xe_lrc_update_timestamp(), it would
>have lost a update.
>
>> value in xef is the **runtime** for all the exec_queues created by that
>> client, per engine class.
>>
>> Note that we already call it from multiple places with this patch
>No, xe_lrc_update_timestamp() is called only from
>xe_exec_queue_update_runtime(). But it is xe_exec_queue_update_runtime()
>which is called from multiple places.

I thought you were referring to xe_exec_queue_update_runtime(), not
xe_lrc_update_timestamp().

Lucas De Marchi

>
>Regards,
>Bala
>
>> series:
>>
>> 1. when the exec_queue is destroyed
>> 2. when the sched job is completed
>> 3. when userspace queries the runtime
>>
>> ... so I don't think I understood what would break.
>>
>> Lucas De Marchi
