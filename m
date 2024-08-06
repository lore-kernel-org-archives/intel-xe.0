Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37B3C3DA64
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 09:46:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F5D10E32D;
	Tue,  6 Aug 2024 09:46:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nc2552WI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2EF810E32B
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Aug 2024 09:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722937614; x=1754473614;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7t4w4TtSyp5b4RpoyFzdV0JkvBgaYywSqxRzajaCXH8=;
 b=Nc2552WIh/pHDr3gLlnHbeJKQaEhhCcKcf29YUx/kuYyY2/tWUpxUN3z
 a4jmbN2K/tdgec4FRrq8UT6oL7FnVz9pRjTVwNVNpCfun6H7ojBJf9AFx
 sJcdvA7MxOd/lJcipYY0ZpQOyYpzAPD9UHUGq7GtXTyvaQQFEol7hS1sR
 7zFVyRkLPmkGzzlgNMvKEjYmxWc9092di4hFtD18NOexyA12t5S12nPWy
 z7gOP7zAp9lFR4dpW3xKVDd1SZluaQSJIwFsiYUgRMwSXNTGBe/AwhSqx
 PjuS+Bn5uBI2WQOgZZG5KI/sA0F6Fg5EvtNTwc0QZQhnPQsaCOK00G0JL Q==;
X-CSE-ConnectionGUID: Qs5YCoZJTWqtvEnHy3CbQA==
X-CSE-MsgGUID: 1uMKqfwYRsi+g+AktELe8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="24706657"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; d="scan'208";a="24706657"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 02:46:54 -0700
X-CSE-ConnectionGUID: o9Cu1tBdS7WVOt2RFsmSiQ==
X-CSE-MsgGUID: DceXm1fCS62u+eUhQkKspg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; d="scan'208";a="56148318"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Aug 2024 02:46:53 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 6 Aug 2024 02:46:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 6 Aug 2024 02:46:52 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 6 Aug 2024 02:46:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ACgi0IN1K2Btf1H/Hj7BWUIw6xIsmOCvWFKgGfTf5WsEEo/CfU4O0XISR6VYBWQ97qjyAP7Gc1ctFC3EcuOuIm19/A6heMTy6quKVxReSzrvOyMslwwTBsuxOrUJd+SH9WITA5orAeh9Es+8DVnldFj7gZSNU6JDt3EKN61G956vWP13wn1Bsr3W6rGuoGy7Dxgf8AmJSDRVMbZq71xhCV2nAkHINf9K3a2AMQjVUft6K/4ufsD8nJBglnOxRbh6behORsEjz4Iu4lNBwpfzXZi+ofHq8Ht1nXxHGBQNYHPtsNcWLTMwcMvP943xvyhV2ZCkGkD6msa8Kotv0lFnkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=De61IGGBoX+UC9U+m4o7pEiqCJ9jX4xANg4YnQEBncw=;
 b=ZMEbyVTt984ewjxxQgBhQI/Tp41m+jNEm77KNC7LbCnuWF1KeC4oohLHniyrCDLIfVe0OjFa7j/xXCq2HhUGE1VY+v3tg6MYRcZ12WE5MHJZG434ZHYhItGcy5oFJi008M5lpxW3g5vxAIct0571OOTMiPCW0tF/XiNlo5Q0l+Etm3iB14qLCCLl1Ba/Xt5tSCc56dc8MmuXzR3He1Bg9M00d2rBjjuQQIn5xMUGAz815D4l9PiqwTwI5pTpQes7GciXu1LNNizeI8phv/6i4hKeFDebDJ8C95SVDJs9QcrQfySEb9JvM2K7fYX5esclCn04zTDzgwuwKK/8KwFKYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Tue, 6 Aug
 2024 09:46:50 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%5]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 09:46:50 +0000
Date: Tue, 6 Aug 2024 11:46:41 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 06/13] drm/xe/exec_queue: Prepare last fence for hw
 engine group resume context
Message-ID: <ZrHxAUVNOZRmBrg5@fdugast-desk>
References: <20240801125748.355078-1-francois.dugast@intel.com>
 <20240801125748.355078-7-francois.dugast@intel.com>
 <ZrE1L2hhrsFndmrP@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZrE1L2hhrsFndmrP@DUT025-TGLU.fm.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: BE1P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:67::11) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ2PR11MB7573:EE_
X-MS-Office365-Filtering-Correlation-Id: e872247a-4eff-4769-005e-08dcb5fcb1e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RQh0KbdS6r+BYciZnVtAPBlHnSpsN0yc8QVTY3gmwp/rGoOEoFvMT7GbGC/T?=
 =?us-ascii?Q?gr3ydb5qiom6gDzDi/9ZC9kk2Fppxi4HWeXfVzUHc54uMT9l5btgbgge0csJ?=
 =?us-ascii?Q?YE4oDwfWwOEnEfhJnEdtzOqNcVfYGEnM14X6Q7HRH1hWDBDq0NhNb6vwqvLF?=
 =?us-ascii?Q?59J6byd6cXq9iFaXaPewJG5lF+RIjwWXec7rDap0RHYRNWsWoJU6ItLmmFoR?=
 =?us-ascii?Q?7ciM6oAsjWz5sldKJOvH4/yTEIE+axlKP0bl6r4v1IGDWL/XN9xa0iRB/GwV?=
 =?us-ascii?Q?27OZsmLo5s/F6MGAqNqCT7QCZ0Zb1S80LN7G97cQni2C4riGCaHhL21qgpul?=
 =?us-ascii?Q?2u42N9enifl8zf8rxjyrUGGYpdDufXT0uP2fZ3Yv0iKxQYBhwZE8EIdOy0vo?=
 =?us-ascii?Q?JY9SGPQqKYFxvITSjlruKVkT2MeWPvOvaqZgnJV+7ELZS/VbR5m15PJyqBcL?=
 =?us-ascii?Q?NxISMq0KhlE0ycZyON9ey2nrAEhwyHdm7Rm+FFqBzrRhDla0eKWqdOe3laaL?=
 =?us-ascii?Q?DwNney/QHO3AtpNswdTomjP0oBPftxrftSwZpvMscG+xB9rSxgTJYuayHHsQ?=
 =?us-ascii?Q?BqRAYwlcS615RSMl0FeLpb7fr/juSE9asN/E+gWsmcPe/teLhmSDaoEy4FIV?=
 =?us-ascii?Q?DJjVEN0G+yF+rfggbdmJvhZoNrWQM3xK3w8IX2dfw6AE7q0rSMU1/vNyH1wn?=
 =?us-ascii?Q?WoCLMDgcYCDjYZvFy23x9kje41XHshCwPDEvMQrCPIARPAlKQbae8nKf3ycr?=
 =?us-ascii?Q?lQyiKIdeklysjYgdgC2Y/CPE7+3tayqgQGYJ24rt24NqDzX2KJv9/C1bWthW?=
 =?us-ascii?Q?vuC80rWdjkVAMevJ6VerHoxG/6fgLCj8X2m9DWcgF/XA6ar9rqCxs9/kVum6?=
 =?us-ascii?Q?pAi+2v4XdNhFyLpVtLmZZGTmiGyS7XVdpruOD5RRwJMHAGClOoy1vsu9QcVT?=
 =?us-ascii?Q?bgKa2fZyVPpBSETHQkVe2ZV+eM9uKVJntbp4pv4agPaHF/2OOOUSzBq34SxK?=
 =?us-ascii?Q?HqaKBiN7ugKVsBRs08oCddO9JojhXGL0/E7XNqY8xSV0s0L26x326CAbdYan?=
 =?us-ascii?Q?okl0UpJUBd57y+PF3/iNICLRWeArC0hl6P8TZetHU7P+CzaIa9EWt6Zes5lm?=
 =?us-ascii?Q?ERQaZfI7dYR4AKLV/QQite3qloiYtokLqokfv/Vk8YJAKIP/wEhDWdBFkT3o?=
 =?us-ascii?Q?um2dZz/aDukRUNdnhs9IfW3q9gTYoovvjO1TRwEnd/kFL+z+wlpEJP1wwOdM?=
 =?us-ascii?Q?KreXfDyFPhZXhhOh+FoCoXSzrXudJlIIUzEjMgIxt8o0tW5u2OJSxXS4euQ+?=
 =?us-ascii?Q?beY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8oiumVfakZDvqX9Guas+C0pxrFNeVqQ/uye6FaDahDpWYrlXiIivpWr4Xi+F?=
 =?us-ascii?Q?ZDd6DnOl1EL7brLaONOqH6vy0FKuIioqL9r9SzggQOz09HUhftHtxmlizHSa?=
 =?us-ascii?Q?sfGg80ixiYITuEoRl8toY9Niju3AqNm6j5nuLmjbDMJaDL9SpiuppTAwydXg?=
 =?us-ascii?Q?bocC1nSp5FPqGuU0d5po8OiStSjH193OgOn4Qb+0Ywxw0t2UHdLfJ7F5mDcU?=
 =?us-ascii?Q?ya8HHuDjlOFlgfHkbgV8XG5PdxfpKCfzoqBSXKbxrYRqirqwTNh5rIg0wyfY?=
 =?us-ascii?Q?gziM3RMmXP+Uc+FR2bl5/1mR/phMqyrPE5EozjK4pNDX2qlYG3+CeA5ciMei?=
 =?us-ascii?Q?rh9ltTD0lLemRzUZzUuDHv0touD78t9VdhGvPW6inP0BH221KryRvcUGSdhb?=
 =?us-ascii?Q?e5UUFvVLSuhFKiCs3+LJip2Ha6HVh6gPWizpjKvRltdiW+ssHM2N8z4XCoS5?=
 =?us-ascii?Q?sl4IjeU1zjt35bnPWV5YDb/bPKX8WahbOV3meZizjNisYe57GMzYtMMKCkTT?=
 =?us-ascii?Q?Abb8BNCBe3PQgqt2qFgczfygaWzhi+luk8aduiDAd4RGBG58w9Adh0G+fF/K?=
 =?us-ascii?Q?Bg7lAxzjwEZfv8WIFg2ugA9299lHNHVIla7yrWmUTfX3GA22/Zn9V5hWaAIC?=
 =?us-ascii?Q?8khlr3ES4ZHfyImT3WS8OOlCHpkWeDWU/xDWI71kdgkmYf2B109RXiUMOsGY?=
 =?us-ascii?Q?26TUccXoFPr2oR5sGWKeGzmWd+m2ZU0Pa1hF/la7VqOI2PZOwTiNbxhpQ8ss?=
 =?us-ascii?Q?RqJjXlGVbmDbV+l8QAM2lJuJYCX/pNKvSO8ONvxS3cgZb8G0cocn4P3AkBdS?=
 =?us-ascii?Q?+gE6H6nenei+aLCIn4BIzeWYWrAvVhG6qr880BYUAK4R+3k4PDIOMWft+lgl?=
 =?us-ascii?Q?Y9+9970HqaVRecx/CKcM454TNxlpYK+AtBqkwGKz4bv2I9Iy9jtqnTHlK2cA?=
 =?us-ascii?Q?RCtViheZzmuDudlEnStggC4t7dRsKUI1PVJSM4z5zcMIXMj6peutnhcCYBRb?=
 =?us-ascii?Q?nv8ui5TI822qvGUwL1zP8zVHKXO0O4dk3VcjIirL2PdwVxcc51KAmLgFdy9x?=
 =?us-ascii?Q?AquLhzcZ8ij/GjmexyfKKUh95X/XgbxVjO289N9AvTbZdwE4LZ8jj9b8oszs?=
 =?us-ascii?Q?ES8G04CLqWrw7EYep7cFJFALCfk1ERX3bmDpRaZkbDMDvPUFwCVjTKBYzz/c?=
 =?us-ascii?Q?qFQi5W5lFKZwgwcZr3hcjC8OYM+rys/6DHrE6axDHLZpBf3OKjQGA980kiEk?=
 =?us-ascii?Q?u4V9dmo1s2SxUvoM9FipKWqc7CX3zvQEMrjKwTrck7er7wk/8vq2XleC1nf+?=
 =?us-ascii?Q?lA7EMNpxEGafiWPu3reG18d11fbS98NGz1LPCH5quNEZRzMefmgJNgLmneuy?=
 =?us-ascii?Q?DekmuMSkE4tLioTJxaGK6zU3m+UMPibt+QkPNk/YVUVA+BVc6LVZa6BTj3Mm?=
 =?us-ascii?Q?s3RHcJbiq9vhrGBwtTgZNK+ryGJpTmhob3KEVapDt/f6zYZCUQabwFGnppcZ?=
 =?us-ascii?Q?vsoEidC2RUxK2OC2kNigjQCi9AnUSryWXWNAGYcTzglqNogYA95oiAJxPN01?=
 =?us-ascii?Q?8nIFpZr812WgLFKtACFnAlFhmJog1JAqipft6FUR/gePm5NEQVFsy+PlV8Tx?=
 =?us-ascii?Q?HQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e872247a-4eff-4769-005e-08dcb5fcb1e5
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 09:46:50.3017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hg79upmaJQUwO4PRQHsaTdQvZJuh+jytXcSaqxOAylTgfGsLWdVgRCZsuRqQcXkfJ/K/CKVgf3q5lTsVOLYgbrou3jR0qERK7Huyepc8iT8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7573
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

On Mon, Aug 05, 2024 at 08:25:19PM +0000, Matthew Brost wrote:
> On Thu, Aug 01, 2024 at 02:56:47PM +0200, Francois Dugast wrote:
> > Ensure we can safely take a ref of the exec queue's last fence from the
> > context of resuming jobs from the hw engine group. The locking requirements
> > differ from the general case, hence the introduction of
> > xe_exec_queue_last_fence_{get,put}_for_resume().
> > 
> > v2: Add kernel doc, rework the code to prevent code duplication
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_exec_queue.c | 123 ++++++++++++++++++++++++++---
> >  drivers/gpu/drm/xe/xe_exec_queue.h |   3 +
> >  2 files changed, 113 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 85da2a30a4a4..a860ba752786 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -815,8 +815,37 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
> >  	return 0;
> >  }
> >  
> > -static void xe_exec_queue_last_fence_lockdep_assert(struct xe_exec_queue *q,
> > -						    struct xe_vm *vm)
> > +/**
> > + * exec_queue_last_fence_lockdep_assert() - Assert locking to access last fence
> > + * @q: The exec queue
> > + * @vm: The VM
> > + *
> > + * These are the locking requirements to access the last fence of this exec
> > + * queue. This is the general and strictest version, to be used by default.
> > + */
> > +static void exec_queue_last_fence_lockdep_assert(struct xe_exec_queue *q,
> > +						 struct xe_vm *vm)
> > +{
> > +	if (q->flags & EXEC_QUEUE_FLAG_VM) {
> > +		lockdep_assert_held(&vm->lock);
> > +	} else {
> > +		xe_vm_assert_held(vm);
> > +		lockdep_assert_held(&q->hwe->hw_engine_group->mode_sem);
> 
> I think this (lockdep_assert_held(&q->hwe->hw_engine_group->mode_sem))
> is the only change needed here, then just use existing functions as is.
> Yes, we won't have have lockdep_assert_held_write in this layer for
> resume but we'd have it in the resume worker so I think we are fine?
> Does that sounds reasonable?

I was hoping to come up with complete explicit locking requirements here but
in the end the multiple variants are difficult to read.

Yes your suggestion makes sense for lockdep_assert_held_write, however beyond
this assert another reason for adding separate *_for_resume variants was to
skip xe_vm_assert_held(vm) above in the context of calling from the resume
worker. Or did you mean to also grab the VM lock for each exec queue in the
resume worker?

> 
> Note you will need this patch though [1] to stop kernel binds from
> blowing up lockdep.

Thanks for this patch.

Francois

> 
> Matt
> 
> [1] https://patchwork.freedesktop.org/series/136898/
> 
> > +	}
> > +}
> > +
> > +/**
> > + * exec_queue_last_fence_lockdep_assert_for_test_dep() - Assert locking only to
> > + * test the last fence dep
> > + * @q: The exec queue
> > + * @vm: The VM
> > + *
> > + * This version of exec_queue_last_fence_lockdep_assert() does not require
> > + * locking of the hw engine group semaphore. It is exclusively meant to be used
> > + * from the context of xe_exec_queue_last_fence_test_dep().
> > + */
> > +static void exec_queue_last_fence_lockdep_assert_for_test_dep(struct xe_exec_queue *q,
> > +							      struct xe_vm *vm)
> >  {
> >  	if (q->flags & EXEC_QUEUE_FLAG_VM)
> >  		lockdep_assert_held(&vm->lock);
> > @@ -831,7 +860,22 @@ static void xe_exec_queue_last_fence_lockdep_assert(struct xe_exec_queue *q,
> >   */
> >  void xe_exec_queue_last_fence_put(struct xe_exec_queue *q, struct xe_vm *vm)
> >  {
> > -	xe_exec_queue_last_fence_lockdep_assert(q, vm);
> > +	exec_queue_last_fence_lockdep_assert(q, vm);
> > +
> > +	xe_exec_queue_last_fence_put_unlocked(q);
> > +}
> > +
> > +/**
> > + * xe_exec_queue_last_fence_put_for_resume() - Drop ref to last fence
> > + * @q: The exec queue
> > + * @vm: The VM the engine does a bind or exec for
> > + *
> > + * Only safe to be called in the context of resuming the hw engine group's
> > + * long-running exec queue, when the group semaphore is held.
> > + */
> > +void xe_exec_queue_last_fence_put_for_resume(struct xe_exec_queue *q, struct xe_vm *vm)
> > +{
> > +	lockdep_assert_held_write(&q->hwe->hw_engine_group->mode_sem);
> >  
> >  	xe_exec_queue_last_fence_put_unlocked(q);
> >  }
> > @@ -851,30 +895,82 @@ void xe_exec_queue_last_fence_put_unlocked(struct xe_exec_queue *q)
> >  }
> >  
> >  /**
> > - * xe_exec_queue_last_fence_get() - Get last fence
> > + * exec_queue_last_fence_get() - Get last fence
> >   * @q: The exec queue
> >   * @vm: The VM the engine does a bind or exec for
> > + * @only_for_test_dep: True if context is testing last fence dependency
> > + * @only_for_resume: True if context is resuming the hw engine group's queues
> >   *
> > - * Get last fence, takes a ref
> > + * Get last fence, takes a ref, after checking locking depending on the
> > + * context.
> >   *
> > - * Returns: last fence if not signaled, dma fence stub if signaled
> > + * This function is parameterized to cover various contexts and consequently
> > + * various locking requirements from which the caller gets the last fence,
> > + * while also avoiding code duplication.
> > + *
> > + * It is intentionally made static to hide those parameters externally and
> > + * limit possible incorrect uses from the wrong context.
> >   */
> > -struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *q,
> > -					       struct xe_vm *vm)
> > +static struct dma_fence *exec_queue_last_fence_get(struct xe_exec_queue *q,
> > +						   struct xe_vm *vm,
> > +						   bool only_for_test_dep,
> > +						   bool only_for_resume)
> >  {
> >  	struct dma_fence *fence;
> >  
> > -	xe_exec_queue_last_fence_lockdep_assert(q, vm);
> > +	xe_assert(vm->xe, !(only_for_test_dep && only_for_resume));
> > +	if (only_for_resume)
> > +		lockdep_assert_held_write(&q->hwe->hw_engine_group->mode_sem);
> > +	else if (only_for_test_dep)
> > +		exec_queue_last_fence_lockdep_assert_for_test_dep(q, vm);
> > +	else
> > +		exec_queue_last_fence_lockdep_assert(q, vm);
> >  
> >  	if (q->last_fence &&
> > -	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &q->last_fence->flags))
> > -		xe_exec_queue_last_fence_put(q, vm);
> > +	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &q->last_fence->flags)) {
> > +		if (only_for_resume)
> > +			xe_exec_queue_last_fence_put_for_resume(q, vm);
> > +		else
> > +			xe_exec_queue_last_fence_put(q, vm);
> > +	}
> >  
> >  	fence = q->last_fence ? q->last_fence : dma_fence_get_stub();
> >  	dma_fence_get(fence);
> >  	return fence;
> >  }
> >  
> > +/**
> > + * xe_exec_queue_last_fence_get() - Get last fence
> > + * @q: The exec queue
> > + * @vm: The VM the engine does a bind or exec for
> > + *
> > + * Get last fence, takes a ref
> > + *
> > + * Returns: last fence if not signaled, dma fence stub if signaled
> > + */
> > +struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *q,
> > +					       struct xe_vm *vm)
> > +{
> > +	return exec_queue_last_fence_get(q, vm, false, false);
> > +}
> > +
> > +/**
> > + * xe_exec_queue_last_fence_get_to_resume() - Get last fence
> > + * @q: The exec queue
> > + * @vm: The VM the engine does a bind or exec for
> > + *
> > + * Get last fence, takes a ref. Only safe to be called in the context of
> > + * resuming the hw engine group's long-running exec queue, when the group
> > + * semaphore is held.
> > + *
> > + * Returns: last fence if not signaled, dma fence stub if signaled
> > + */
> > +struct dma_fence *xe_exec_queue_last_fence_get_for_resume(struct xe_exec_queue *q,
> > +							  struct xe_vm *vm)
> > +{
> > +	return exec_queue_last_fence_get(q, vm, false, true);
> > +}
> > +
> >  /**
> >   * xe_exec_queue_last_fence_set() - Set last fence
> >   * @q: The exec queue
> > @@ -887,7 +983,7 @@ struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *q,
> >  void xe_exec_queue_last_fence_set(struct xe_exec_queue *q, struct xe_vm *vm,
> >  				  struct dma_fence *fence)
> >  {
> > -	xe_exec_queue_last_fence_lockdep_assert(q, vm);
> > +	exec_queue_last_fence_lockdep_assert(q, vm);
> >  
> >  	xe_exec_queue_last_fence_put(q, vm);
> >  	q->last_fence = dma_fence_get(fence);
> > @@ -906,7 +1002,8 @@ int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q, struct xe_vm *vm)
> >  	struct dma_fence *fence;
> >  	int err = 0;
> >  
> > -	fence = xe_exec_queue_last_fence_get(q, vm);
> > +	fence = exec_queue_last_fence_get(q, vm, true, false);
> > +
> >  	if (fence) {
> >  		err = test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) ?
> >  			0 : -ETIME;
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> > index ded77b0f3b90..fc9884a6ce85 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> > @@ -71,8 +71,11 @@ enum xe_exec_queue_priority xe_exec_queue_device_get_max_priority(struct xe_devi
> >  
> >  void xe_exec_queue_last_fence_put(struct xe_exec_queue *e, struct xe_vm *vm);
> >  void xe_exec_queue_last_fence_put_unlocked(struct xe_exec_queue *e);
> > +void xe_exec_queue_last_fence_put_for_resume(struct xe_exec_queue *e, struct xe_vm *vm);
> >  struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *e,
> >  					       struct xe_vm *vm);
> > +struct dma_fence *xe_exec_queue_last_fence_get_for_resume(struct xe_exec_queue *e,
> > +							  struct xe_vm *vm);
> >  void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
> >  				  struct dma_fence *fence);
> >  int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
> > -- 
> > 2.43.0
> > 
