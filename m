Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E440ECEB2C1
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 20:56:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B44F010E14B;
	Mon, 30 Sep 2024 20:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HkGcPGLk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C858E10E14B
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 20:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727729766; x=1759265766;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rBpHJoGoD1ixWsbhfIeXPAnT57MYxLu70xLS+l+yu5Q=;
 b=HkGcPGLkf1WR+GaaTXnwXGp92CwpSynq6dUX5aVq76jhWTA6iwNL50M6
 qZu9mWkfy5v/nRM9QQM3ALNly8Y122eScORvMyFzqpsdAd/nyqdRN21EH
 5FgNoClJi50dPc/KvcEjBDIR7Y+y8w9weTdciZCYH9pxLkAuJhIQV7xec
 8bxlSXLhM7rbwLbwzDo2x5IeGwlP6T1cvf73oqh/G++DW6sRLqpzD2/0h
 QeZBoJ1wvUjJBmeC/Y+b2v4MLO8kqqdTakGhvObHLlmxGelrW/rMtYqQt
 VU9SRiHcYyfQ6+EFe5w0zPhoGCSPW6h9b98UlGUbX1Np5sVc+e5IT3f2P Q==;
X-CSE-ConnectionGUID: GBcoyMHGTROL5749lwyb9A==
X-CSE-MsgGUID: 1voarRfFT7yfueJwGvWGZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26724195"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="26724195"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 13:56:05 -0700
X-CSE-ConnectionGUID: V0woLKQCQzai8Y/XYFAkVg==
X-CSE-MsgGUID: /g7TMKg+QrCQYSwR6pXrmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73385778"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Sep 2024 13:56:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 13:56:04 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 30 Sep 2024 13:56:04 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 13:56:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fv1DkSIclg1cx0GL85k6e4/EcrZoXeTnGGVCwvAGnISYOQ6l6UjSBzBpaxpUwJlSMPXUtReqMxX3eFwy4WyucD9NlHLHsvWwbuTlOANuQg2nml2JqNr2f+79DlpV71A6r+186eo0t+xONcgbL9KfY+G2eDSiKAdaGB/lNrD265Wz9YOOfRTdL0DlHXo32xCuJVr79wwtcEWXwLXEf/3sjo1fU8EME8yrnNGp2IJvHFWWS/ZaBnDHpONu9lf42pHPOQedM8q5MCsuhJlzwLXRRHhg6cUetf6730URiuvu0skISj+4OPxFudfPHe3Mn7iKc1G6wmJieyhlb1cjuiZMBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YTCwgbl81Qqv9Q0ynIJXnzM0d3KBsoCQbCNptbLHr5g=;
 b=YuMllbvXfXb3M97zKOMQxOYwtYaL0HjY0AqZfgZh3vbyhSwfbLR6lDrQT9aCTL5M5An8uvcNTDNXJ6zaU9BCZyci0j58go0s15ymxK2O3WbQZaF1h37L+7Q1oP3jY9LJueb1Ek/+tQij7+yoS+zKRLHoh48hh3/gqjDz3AZZgrueajCdrrcWTqqAzLM7OCXBYxRUZEiRxeNZk4slByQBm6iwcDvRHzI8Eo+UTNc5upMJ039BNIR49zJ2+0OJhz2KMkXIhuM+5KYocYZUv8kGPD325yYS66SEFhulhg9KkMaElW0A3wwGkqLmZQZbRjqrdWTuyra3LHOC9y00dmSYZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB5184.namprd11.prod.outlook.com (2603:10b6:a03:2d5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 20:55:55 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 20:55:54 +0000
Date: Mon, 30 Sep 2024 13:55:51 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v6 11/11] drm/xe: Sample ctx timestamp to determine if
 jobs have timed out
Message-ID: <20240930205551.GA4891@mdroper-desk1.amr.corp.intel.com>
References: <20240611144053.2805091-1-matthew.brost@intel.com>
 <20240611144053.2805091-12-matthew.brost@intel.com>
 <20240828192301.GO5774@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240828192301.GO5774@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY3PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:a03:254::18) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB5184:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ea032c6-7f9f-4a1a-0e02-08dce192468c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?twqYSZYRZ+qTBMysuqHd+UASoZryVUD6DXFR0QCjrMripetRv9CvJvzSm+y3?=
 =?us-ascii?Q?DGcy9EfjjGNJPnIkh9NgmX7N+X4mZm1hGVmgHJWCJqMxPdZcJunbQM2/V0u4?=
 =?us-ascii?Q?93fIuSzJW2D45f86kOCUUHYL2NYx+v3oQ4yaaaYZvaELsk8kN1H2vLoxNUyd?=
 =?us-ascii?Q?ed6v5OgNWUWhOntqOguQLTv97/jWP/WzVSshuFYrwJwM8J7OyXRmIeUw025p?=
 =?us-ascii?Q?vVmF6hrhxStF9VE58N3u9vfsyk6TYqtiTv73AQ1RuAkTMA8T+o0WIF65LKaw?=
 =?us-ascii?Q?TW3W9Q50y5a0DjPU4cB0P4mD7PdDH5SxrJvkSyvu/vr/vtYmnad74C/pIbO7?=
 =?us-ascii?Q?LZYZAALXggrSsuZPgBcyVTEcwc1P89IY3C8L/f/jTKLa+XmDtutFl1RCLYQ4?=
 =?us-ascii?Q?gnsg4Z1SDx/ep/kqNZ0T6mLB1RPfpPd0enpcX/OtG8hbuN1PdE/YNgNNIvdl?=
 =?us-ascii?Q?7oq8w+N+KaAIQANUePs/qeHBzbBojirM8ErYLYa5CsGHwxLi9ovkplIbwAnE?=
 =?us-ascii?Q?jED62MDWEZEM1G028E/oFlOUd20XohNLVLm6iT7VMkoiSh5nKTAjylIQBK1j?=
 =?us-ascii?Q?2IBC3M/ZqcCHiHObP6Veq6ncEhAF7xpJraaSpDr1nCm4jL2su7eT74ERNqTK?=
 =?us-ascii?Q?WYEis1XWTzuui4IxdKTcTXBZK8BEmrT6JB2qUN/VIJ7mIPXmUrG1VcmBEYnL?=
 =?us-ascii?Q?Zw8eRk6XWtQ67PlruWRg7PU4f7Xijah8+aXIUBfoXQeMtsSNw9XmnmdHlfZK?=
 =?us-ascii?Q?Cr1bnP6YKZeWF/y0J/rJc9zd21vQeFS6HScE+A5zkhVtVG1IYdNp0wnmhjHb?=
 =?us-ascii?Q?nDOTCvj1xxE9fQT4LcH8BMyObUJlqkYFqY5/0RVpIm5C7LZxTImua9zTD0Tk?=
 =?us-ascii?Q?qVn1m8UNVOMrQg6vlkzJ1smv07Herotm+H7TCXlcqOY1IaenF1BpgszDVsVu?=
 =?us-ascii?Q?QzhBU/VUFvR2lYOzIRsIMYXV9FkXmy2n8dxXX8jp9k44QANL5t7+yZ/GkBJx?=
 =?us-ascii?Q?XDQMpHhH0Qhq3TjGjptJjs7TkxOiJtx1/6KMc60W/OfxyGfssLv6XY8jsaxU?=
 =?us-ascii?Q?S53ieLH8rw2hgohkdNLFl4+Oc5F6gyYOlUjI4tE6jIPzKqae5RuNuaZmfurW?=
 =?us-ascii?Q?Dpq3tjnzz8cDI+iy7TYzDchuhzAk8P9SRlgam5RW+efimox2YQte4k9spHPW?=
 =?us-ascii?Q?Ti31R+Og/X2b4d7I6U8feB6YhMn78U+AG422VJa6Os2SzZhCQcFyDjQ9iVbj?=
 =?us-ascii?Q?/OYyczzHfAqzWnp6FCy6zxChaps5dxzVf89DijuJo+gM3XmPO6af+iS8cOtx?=
 =?us-ascii?Q?6jY/uBe8IiCZCTisCYMBasVVU0ceIXAaPfHQpyF4KiRHbQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iNCenB/rw6XiLUuktBoxBMtpDPI8JmWW9yR8LZt23tRfQIQIrc1C/JDPMhxK?=
 =?us-ascii?Q?G/NVTwoauERLqoaTddTbtVIXX31CVSCNBrFKh2JMpYQBzmoI9UcVr+9JQiV+?=
 =?us-ascii?Q?v2gUVVmPr9XNMP8ktKGswqlOwMrrJKPUjIZUGrIIMkThGV1wJirZMOfxNiYq?=
 =?us-ascii?Q?LEZlB6KGgsogGQSzZm/kUeyAWoqmHHF6HFkVfntLafN1CHso/wVUAVOmHJ08?=
 =?us-ascii?Q?ZX/h64CRF2Apq8dLp5mgzIoszpJzSPwIoQBe7VOzYb5Apkg1gXlYQHgTHRQe?=
 =?us-ascii?Q?K+pON5ea/B18IUvE+mJCVPm9dddrwO5zrOSQt+lYMEQpYmWRSZyUv4i0nknQ?=
 =?us-ascii?Q?6TynkXl63qtoZ8nb8Xx/XaF78NUkOGvXn0GDUX0dTXv+v1QqMKRNEc+GfsgI?=
 =?us-ascii?Q?WJIGR5R/HepnvGoWwoIk8v3w2g10Qz5aGcq4aNOXsoQvlH/L0AViXqAqBhvm?=
 =?us-ascii?Q?uMBtzMwjq6CHzYRKHURffWLy8aReqYAFE6Xt71VNUopNv2YpqmFsfQEZlRNE?=
 =?us-ascii?Q?BJI0//pnjoo8BM50aaSjswefC2uFKf7lUXlFdQnQke+0WlUUXSzH5FY+QTMv?=
 =?us-ascii?Q?fHZraqBLyB7Zt3Naw87bJVhnFh4AgeHEIcVkFAAQQngSxoxcjCvTDutOnn3o?=
 =?us-ascii?Q?+Lmep+d3VsIWE3wln+42NE08vsbGMUK1wFSSw7jBhUPez9cjF2yJ/bemzwDN?=
 =?us-ascii?Q?O5No6GLdr/L3YDFBnukL48z11dFmaKXZfuQ4WZHxJZJokEneSTsoy7d1UFKf?=
 =?us-ascii?Q?nU/xavYYpaFSPHWq+l1vLxEX+NhSYgavk0PvQ+1jv5x48YK38DXF3iyVjTd8?=
 =?us-ascii?Q?28F7tFe7NmyzpJBhukhxQxswvQmiMnLN3VhvPRy8DwlyoKeuzsLjupoViBuO?=
 =?us-ascii?Q?hmIwhZZR68InfOrLOvSWkze3PqZOY05UZILzCXko8yCnlopDQu6KME51uxcM?=
 =?us-ascii?Q?OujpON24fNGSN+85liVE3PoEw3SIEM0x3YyyLpCRtkjHqRG8ph3XcJNi6tDp?=
 =?us-ascii?Q?EaZzhZF7l9rj1yWKgVpAzTs7K+xUwwb2OW+dEo8nkWrB6O5wgozH5VkAUKFz?=
 =?us-ascii?Q?H4C8DD+OvauplXcX0A5zVQSudZn6Gqf4Po/97GXvSFzJtDzrU4aLbyvcuErk?=
 =?us-ascii?Q?rtilNo6jp+qqmvV0VeBJ8MExlKK7kErhoybzVnzUTpqjrmTQTsKUbeylNGh6?=
 =?us-ascii?Q?tIw8yimWUyNnWawD7g8TUYDsIGP02LNDIwZFdaOWPPh5shonrjPYoKTnjxLT?=
 =?us-ascii?Q?BfiFXrlQhB5ZIczdQ6IYt1mA2c3bxooekPiA9X7NndPHUivxT02ZiMceZMto?=
 =?us-ascii?Q?p6QYklghLtLO2X1npGCgVt4k3GG5EYTKNd6ctbzmx6FAT/uHX5CeQnr/tm8Z?=
 =?us-ascii?Q?9Ss1RMuRLsLPtRvAUpIQrlfjyy1Nv1fz0P+QTxFcJ8ojJWdBrkhc6owmSjMb?=
 =?us-ascii?Q?sVJJZeU/HX/rlyuAiY9uL1lTicJyKGKcCBUzIesCjIPu0kwjTLMwM9F9XWM6?=
 =?us-ascii?Q?oygP8EmsMIqS0NCke/sBU1I/B4JTIsfIniuSxZ73Wsxp5Yz1xyGIu9GILIva?=
 =?us-ascii?Q?VVQizMiI9zHgB2yPHh40cOGLlw+tYrnROFZV8WcAc8JQBtA8UqN/flCcFGtL?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ea032c6-7f9f-4a1a-0e02-08dce192468c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 20:55:54.8857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5CcPvsAYUEpxslAhAiFJa5svq2LYuBsv21PPuWiAV+ysKBkEYrH2lvreASHamkToxQkTbLFxt0k8OZ2txGDFZ4AhKBLAvzvD1lWhgO+qerk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5184
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

On Wed, Aug 28, 2024 at 12:23:01PM -0700, Matt Roper wrote:
> On Tue, Jun 11, 2024 at 07:40:53AM -0700, Matthew Brost wrote:
> > In GuC TDR sample ctx timestamp to determine if jobs have timed out. The
> > scheduling enable needs to be toggled to properly sample the timestamp.
> > If a job has not been running for longer than the timeout period,
> > re-enable scheduling and restart the TDR.
> > 
> > v2:
> >  - Use GT clock to msec helper (Umesh, off list)
> >  - s/ctx_timestamp_job/ctx_job_timestamp
> > v3:
> >  - Fix state machine for TDR, mainly decouple sched disable and
> >    deregister (testing)
> >  - Rebase (CI)
> > v4:
> >  - Fix checkpatch && newline issue (CI)
> >  - Do not deregister on wedged or unregistered (CI)
> >  - Fix refcounting bugs (CI)
> >  - Move devcoredump above VM / kernel job check (John H)
> >  - Add comment for check_timeout state usage (John H)
> >  - Assert pending disable not inflight when enabling scheduling (John H)
> >  - Use enable_scheduling in other scheduling enable code (John H)
> >  - Add comments on a few steps in TDR (John H)
> >  - Add assert for timestamp overflow protection (John H)
> > v6:
> >  - Use mul_u64_u32_div (CI, checkpath)
> >  - Change check time to dbg level (Paulo)
> >  - Add immediate mode to sched disable (inspection)
> >  - Use xe_gt_* messages (John H)
> >  - Fix typo in comment (John H)
> >  - Check timeout before clearing pending disable (Paulo)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_submit.c | 303 +++++++++++++++++++++++------
> >  1 file changed, 242 insertions(+), 61 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 671c72caf0ff..cddb391888b6 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/circ_buf.h>
> >  #include <linux/delay.h>
> >  #include <linux/dma-fence-array.h>
> > +#include <linux/math64.h>
> >  
> >  #include <drm/drm_managed.h>
> >  
> > @@ -23,6 +24,7 @@
> >  #include "xe_force_wake.h"
> >  #include "xe_gpu_scheduler.h"
> >  #include "xe_gt.h"
> > +#include "xe_gt_clock.h"
> >  #include "xe_gt_printk.h"
> >  #include "xe_guc.h"
> >  #include "xe_guc_ct.h"
> > @@ -62,6 +64,8 @@ exec_queue_to_guc(struct xe_exec_queue *q)
> >  #define EXEC_QUEUE_STATE_KILLED			(1 << 7)
> >  #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
> >  #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
> > +#define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
> > +#define EXEC_QUEUE_STATE_EXTRA_REF		(1 << 11)
> >  
> >  static bool exec_queue_registered(struct xe_exec_queue *q)
> >  {
> > @@ -188,6 +192,31 @@ static void set_exec_queue_wedged(struct xe_exec_queue *q)
> >  	atomic_or(EXEC_QUEUE_STATE_WEDGED, &q->guc->state);
> >  }
> >  
> > +static bool exec_queue_check_timeout(struct xe_exec_queue *q)
> > +{
> > +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_CHECK_TIMEOUT;
> > +}
> > +
> > +static void set_exec_queue_check_timeout(struct xe_exec_queue *q)
> > +{
> > +	atomic_or(EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
> > +}
> > +
> > +static void clear_exec_queue_check_timeout(struct xe_exec_queue *q)
> > +{
> > +	atomic_and(~EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
> > +}
> > +
> > +static bool exec_queue_extra_ref(struct xe_exec_queue *q)
> > +{
> > +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_EXTRA_REF;
> > +}
> > +
> > +static void set_exec_queue_extra_ref(struct xe_exec_queue *q)
> > +{
> > +	atomic_or(EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
> > +}
> > +
> >  static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
> >  {
> >  	return (atomic_read(&q->guc->state) &
> > @@ -920,6 +949,109 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> >  	xe_sched_submission_start(sched);
> >  }
> >  
> > +#define ADJUST_FIVE_PERCENT(__t)	mul_u64_u32_div((__t), 105, 100)
> > +
> > +static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
> > +{
> > +	struct xe_gt *gt = guc_to_gt(exec_queue_to_guc(q));
> > +	u32 ctx_timestamp = xe_lrc_ctx_timestamp(q->lrc[0]);
> > +	u32 ctx_job_timestamp = xe_lrc_ctx_job_timestamp(q->lrc[0]);
> > +	u32 timeout_ms = q->sched_props.job_timeout_ms;
> > +	u32 diff;
> > +	u64 running_time_ms;
> > +
> > +	/*
> > +	 * Counter wraps at ~223s at the usual 19.2MHz, be paranoid catch
> > +	 * possible overflows with a high timeout.
> > +	 */
> > +	xe_gt_assert(gt, timeout_ms < 100 * MSEC_PER_SEC);
> > +
> > +	if (ctx_timestamp < ctx_job_timestamp)
> > +		diff = ctx_timestamp + U32_MAX - ctx_job_timestamp;
> > +	else
> > +		diff = ctx_timestamp - ctx_job_timestamp;
> 
> Just noticed this while looking through the code...what is this if/else
> supposed to do?  It looks like it's trying to detect when ctx_timestamp
> has gone past U32_MAX and wrapped around while ctx_job_timestamp hasn't
> yet.  But even if that's happened it doesn't seem like it's doing
> anything meaningful either; I think the u32 subtraction works out the
> same way regardless of whether or not there's a wraparound, and since
> all the variables involved here are u32, adding U32_MAX is effectively
> the same as just subtracting 1 from the final result, which doesn't seem
> to actually do anything important for the rest of the logic in this
> function?
> 
> It's also worth noting that starting with Xe2, CTX_TIMESTAMP is now a
> 64-bit register rather than 32-bits.  For the short timeouts we're
> dealing with in this function is probably doesn't matter, but to prevent
> future mistakes elsewhere in the driver we may want to think about
> updating xe_lrc_ctx_timestamp() and such to return u64's and actually
> fill both dwords when running on a platform that has the larger
> timestamp.

Ping; going back through my emails and I don't think I saw a response
here.


Matt

> 
> 
> Matt
> 
> > +
> > +	/*
> > +	 * Ensure timeout is within 5% to account for an GuC scheduling latency
> > +	 */
> > +	running_time_ms =
> > +		ADJUST_FIVE_PERCENT(xe_gt_clock_interval_to_ms(gt, diff));
> > +
> > +	xe_gt_dbg(gt,
> > +		  "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, running_time_ms=%llu, timeout_ms=%u, diff=0x%08x",
> > +		  xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> > +		  q->guc->id, running_time_ms, timeout_ms, diff);
> > +
> > +	return running_time_ms >= timeout_ms;
> > +}
> > +
> > +static void enable_scheduling(struct xe_exec_queue *q)
> > +{
> > +	MAKE_SCHED_CONTEXT_ACTION(q, ENABLE);
> > +	struct xe_guc *guc = exec_queue_to_guc(q);
> > +	int ret;
> > +
> > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
> > +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
> > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
> > +
> > +	set_exec_queue_pending_enable(q);
> > +	set_exec_queue_enabled(q);
> > +	trace_xe_exec_queue_scheduling_enable(q);
> > +
> > +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > +		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> > +
> > +	ret = wait_event_timeout(guc->ct.wq,
> > +				 !exec_queue_pending_enable(q) ||
> > +				 guc_read_stopped(guc), HZ * 5);
> > +	if (!ret || guc_read_stopped(guc)) {
> > +		xe_gt_warn(guc_to_gt(guc), "Schedule enable failed to respond");
> > +		set_exec_queue_banned(q);
> > +		xe_gt_reset_async(q->gt);
> > +		xe_sched_tdr_queue_imm(&q->guc->sched);
> > +	}
> > +}
> > +
> > +static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
> > +{
> > +	MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
> > +	struct xe_guc *guc = exec_queue_to_guc(q);
> > +
> > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
> > +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
> > +
> > +	if (immediate)
> > +		set_min_preemption_timeout(guc, q);
> > +	clear_exec_queue_enabled(q);
> > +	set_exec_queue_pending_disable(q);
> > +	trace_xe_exec_queue_scheduling_disable(q);
> > +
> > +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > +		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> > +}
> > +
> > +static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
> > +{
> > +	u32 action[] = {
> > +		XE_GUC_ACTION_DEREGISTER_CONTEXT,
> > +		q->guc->id,
> > +	};
> > +
> > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
> > +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
> > +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
> > +
> > +	set_exec_queue_destroyed(q);
> > +	trace_xe_exec_queue_deregister(q);
> > +
> > +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > +		       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
> > +}
> > +
> >  static enum drm_gpu_sched_stat
> >  guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >  {
> > @@ -927,10 +1059,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >  	struct xe_sched_job *tmp_job;
> >  	struct xe_exec_queue *q = job->q;
> >  	struct xe_gpu_scheduler *sched = &q->guc->sched;
> > -	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(q));
> > +	struct xe_guc *guc = exec_queue_to_guc(q);
> >  	int err = -ETIME;
> >  	int i = 0;
> > -	bool wedged;
> > +	bool wedged, skip_timeout_check;
> >  
> >  	/*
> >  	 * TDR has fired before free job worker. Common if exec queue
> > @@ -942,49 +1074,53 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >  		return DRM_GPU_SCHED_STAT_NOMINAL;
> >  	}
> >  
> > -	drm_notice(&xe->drm, "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
> > -		   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> > -		   q->guc->id, q->flags);
> > -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> > -		   "Kernel-submitted job timed out\n");
> > -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
> > -		   "VM job timed out on non-killed execqueue\n");
> > -
> > -	if (!exec_queue_killed(q))
> > -		xe_devcoredump(job);
> > -
> > -	trace_xe_sched_job_timedout(job);
> > -
> > -	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
> > -
> >  	/* Kill the run_job entry point */
> >  	xe_sched_submission_stop(sched);
> >  
> > +	/* Must check all state after stopping scheduler */
> > +	skip_timeout_check = exec_queue_reset(q) ||
> > +		exec_queue_killed_or_banned_or_wedged(q) ||
> > +		exec_queue_destroyed(q);
> > +
> > +	/* Job hasn't started, can't be timed out */
> > +	if (!skip_timeout_check && !xe_sched_job_started(job))
> > +		goto rearm;
> > +
> >  	/*
> > -	 * Kernel jobs should never fail, nor should VM jobs if they do
> > -	 * somethings has gone wrong and the GT needs a reset
> > +	 * XXX: Sampling timeout doesn't work in wedged mode as we have to
> > +	 * modify scheduling state to read timestamp. We could read the
> > +	 * timestamp from a register to accumulate current running time but this
> > +	 * doesn't work for SRIOV. For now assuming timeouts in wedged mode are
> > +	 * genuine timeouts.
> >  	 */
> > -	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> > -			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> > -		if (!xe_sched_invalidate_job(job, 2)) {
> > -			xe_sched_add_pending_job(sched, job);
> > -			xe_sched_submission_start(sched);
> > -			xe_gt_reset_async(q->gt);
> > -			goto out;
> > -		}
> > -	}
> > +	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
> >  
> > -	/* Engine state now stable, disable scheduling if needed */
> > +	/* Engine state now stable, disable scheduling to check timestamp */
> >  	if (!wedged && exec_queue_registered(q)) {
> > -		struct xe_guc *guc = exec_queue_to_guc(q);
> >  		int ret;
> >  
> >  		if (exec_queue_reset(q))
> >  			err = -EIO;
> > -		set_exec_queue_banned(q);
> > +
> >  		if (!exec_queue_destroyed(q)) {
> > -			xe_exec_queue_get(q);
> > -			disable_scheduling_deregister(guc, q);
> > +			/*
> > +			 * Wait for any pending G2H to flush out before
> > +			 * modifying state
> > +			 */
> > +			ret = wait_event_timeout(guc->ct.wq,
> > +						 !exec_queue_pending_enable(q) ||
> > +						 guc_read_stopped(guc), HZ * 5);
> > +			if (!ret || guc_read_stopped(guc))
> > +				goto trigger_reset;
> > +
> > +			/*
> > +			 * Flag communicates to G2H handler that schedule
> > +			 * disable originated from a timeout check. The G2H then
> > +			 * avoid triggering cleanup or deregistering the exec
> > +			 * queue.
> > +			 */
> > +			set_exec_queue_check_timeout(q);
> > +			disable_scheduling(q, skip_timeout_check);
> >  		}
> >  
> >  		/*
> > @@ -1000,15 +1136,60 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >  					 !exec_queue_pending_disable(q) ||
> >  					 guc_read_stopped(guc), HZ * 5);
> >  		if (!ret || guc_read_stopped(guc)) {
> > -			drm_warn(&xe->drm, "Schedule disable failed to respond");
> > -			xe_sched_add_pending_job(sched, job);
> > -			xe_sched_submission_start(sched);
> > +trigger_reset:
> > +			xe_gt_warn(guc_to_gt(guc), "Schedule disable failed to respond");
> > +			set_exec_queue_extra_ref(q);
> > +			xe_exec_queue_get(q);	/* GT reset owns this */
> > +			set_exec_queue_banned(q);
> >  			xe_gt_reset_async(q->gt);
> >  			xe_sched_tdr_queue_imm(sched);
> > -			goto out;
> > +			goto rearm;
> > +		}
> > +	}
> > +
> > +	/*
> > +	 * Check if job is actually timed out, if so restart job execution and TDR
> > +	 */
> > +	if (!wedged && !skip_timeout_check && !check_timeout(q, job) &&
> > +	    !exec_queue_reset(q) && exec_queue_registered(q)) {
> > +		clear_exec_queue_check_timeout(q);
> > +		goto sched_enable;
> > +	}
> > +
> > +	xe_gt_notice(guc_to_gt(guc), "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
> > +		     xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> > +		     q->guc->id, q->flags);
> > +	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> > +		   "Kernel-submitted job timed out\n");
> > +	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
> > +		   "VM job timed out on non-killed execqueue\n");
> > +
> > +	trace_xe_sched_job_timedout(job);
> > +
> > +	if (!exec_queue_killed(q))
> > +		xe_devcoredump(job);
> > +
> > +	/*
> > +	 * Kernel jobs should never fail, nor should VM jobs if they do
> > +	 * somethings has gone wrong and the GT needs a reset
> > +	 */
> > +	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> > +			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> > +		if (!xe_sched_invalidate_job(job, 2)) {
> > +			clear_exec_queue_check_timeout(q);
> > +			xe_gt_reset_async(q->gt);
> > +			goto rearm;
> >  		}
> >  	}
> >  
> > +	/* Finish cleaning up exec queue via deregister */
> > +	set_exec_queue_banned(q);
> > +	if (!wedged && exec_queue_registered(q) && !exec_queue_destroyed(q)) {
> > +		set_exec_queue_extra_ref(q);
> > +		xe_exec_queue_get(q);
> > +		__deregister_exec_queue(guc, q);
> > +	}
> > +
> >  	/* Stop fence signaling */
> >  	xe_hw_fence_irq_stop(q->fence_irq);
> >  
> > @@ -1030,7 +1211,19 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >  	/* Start fence signaling */
> >  	xe_hw_fence_irq_start(q->fence_irq);
> >  
> > -out:
> > +	return DRM_GPU_SCHED_STAT_NOMINAL;
> > +
> > +sched_enable:
> > +	enable_scheduling(q);
> > +rearm:
> > +	/*
> > +	 * XXX: Ideally want to adjust timeout based on current exection time
> > +	 * but there is not currently an easy way to do in DRM scheduler. With
> > +	 * some thought, do this in a follow up.
> > +	 */
> > +	xe_sched_add_pending_job(sched, job);
> > +	xe_sched_submission_start(sched);
> > +
> >  	return DRM_GPU_SCHED_STAT_NOMINAL;
> >  }
> >  
> > @@ -1133,7 +1326,6 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
> >  			   guc_read_stopped(guc));
> >  
> >  		if (!guc_read_stopped(guc)) {
> > -			MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
> >  			s64 since_resume_ms =
> >  				ktime_ms_delta(ktime_get(),
> >  					       q->guc->resume_time);
> > @@ -1144,12 +1336,7 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
> >  				msleep(wait_ms);
> >  
> >  			set_exec_queue_suspended(q);
> > -			clear_exec_queue_enabled(q);
> > -			set_exec_queue_pending_disable(q);
> > -			trace_xe_exec_queue_scheduling_disable(q);
> > -
> > -			xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > -				       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> > +			disable_scheduling(q, false);
> >  		}
> >  	} else if (q->guc->suspend_pending) {
> >  		set_exec_queue_suspended(q);
> > @@ -1160,19 +1347,11 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
> >  static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
> >  {
> >  	struct xe_exec_queue *q = msg->private_data;
> > -	struct xe_guc *guc = exec_queue_to_guc(q);
> >  
> >  	if (guc_exec_queue_allowed_to_change_state(q)) {
> > -		MAKE_SCHED_CONTEXT_ACTION(q, ENABLE);
> > -
> >  		q->guc->resume_time = RESUME_PENDING;
> >  		clear_exec_queue_suspended(q);
> > -		set_exec_queue_pending_enable(q);
> > -		set_exec_queue_enabled(q);
> > -		trace_xe_exec_queue_scheduling_enable(q);
> > -
> > -		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > -			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> > +		enable_scheduling(q);
> >  	} else {
> >  		clear_exec_queue_suspended(q);
> >  	}
> > @@ -1434,8 +1613,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
> >  
> >  	/* Clean up lost G2H + reset engine state */
> >  	if (exec_queue_registered(q)) {
> > -		if ((exec_queue_banned(q) && exec_queue_destroyed(q)) ||
> > -		    xe_exec_queue_is_lr(q))
> > +		if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
> >  			xe_exec_queue_put(q);
> >  		else if (exec_queue_destroyed(q))
> >  			__guc_exec_queue_fini(guc, q);
> > @@ -1612,6 +1790,8 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
> >  		smp_wmb();
> >  		wake_up_all(&guc->ct.wq);
> >  	} else {
> > +		bool check_timeout = exec_queue_check_timeout(q);
> > +
> >  		xe_gt_assert(guc_to_gt(guc), runnable_state == 0);
> >  		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_disable(q));
> >  
> > @@ -1619,11 +1799,12 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
> >  		if (q->guc->suspend_pending) {
> >  			suspend_fence_signal(q);
> >  		} else {
> > -			if (exec_queue_banned(q)) {
> > +			if (exec_queue_banned(q) || check_timeout) {
> >  				smp_wmb();
> >  				wake_up_all(&guc->ct.wq);
> >  			}
> > -			deregister_exec_queue(guc, q);
> > +			if (!check_timeout)
> > +				deregister_exec_queue(guc, q);
> >  		}
> >  	}
> >  }
> > @@ -1664,7 +1845,7 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
> >  
> >  	clear_exec_queue_registered(q);
> >  
> > -	if (exec_queue_banned(q) || xe_exec_queue_is_lr(q))
> > +	if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
> >  		xe_exec_queue_put(q);
> >  	else
> >  		__guc_exec_queue_fini(guc, q);
> > @@ -1728,7 +1909,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >  	 * guc_exec_queue_timedout_job.
> >  	 */
> >  	set_exec_queue_reset(q);
> > -	if (!exec_queue_banned(q))
> > +	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
> >  		xe_guc_exec_queue_trigger_cleanup(q);
> >  
> >  	return 0;
> > @@ -1758,7 +1939,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
> >  
> >  	/* Treat the same as engine reset */
> >  	set_exec_queue_reset(q);
> > -	if (!exec_queue_banned(q))
> > +	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
> >  		xe_guc_exec_queue_trigger_cleanup(q);
> >  
> >  	return 0;
> > -- 
> > 2.34.1
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
