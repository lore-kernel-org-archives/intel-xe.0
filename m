Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED68CD6E56
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 10:57:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8DB510FBDF;
	Wed,  3 Jun 2026 10:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ULHPkWGm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0F610FBDD
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 10:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780484220; x=1812020220;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TcR3Z05u3cVIliGSSiT2SZDWndi8B7eC3jDc9AojQLA=;
 b=ULHPkWGm524alWOSW3J8tcRTXVnsFH39CuQQBwmmddHmhFECg1PP01sh
 RuK/qymsSOmjSoV7rq2ULC7aTDLmDaWoEcnyt2jZvnMvfvWwBqQHmeE0n
 rewC0IXZ/QHEcmQn3w+uLq3qiDQ4+LMZg4DjdTVg6h0Nlbaa8TG7F9mbC
 uMqkiAGylnR/eKlpYlcSgxhgc3Vn34WW9e8gDyg/zufp241fkbnWT4klB
 DGnz7iwgThCqiZVr6R/AiVf568dNH1rIoA8mUgug6XtRT4wVlAOUJ1N44
 h3RtJp13N4ylRZP+2ICHuOe/09BRdWs7Pmtn/6YwPdFXFTDENHiTm8hS3 A==;
X-CSE-ConnectionGUID: tiXnHvJ3Qdi9Ul9Kg9zFBw==
X-CSE-MsgGUID: bQBNw7sDQEWgMyzW/IAmuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="91970987"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="91970987"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 03:57:00 -0700
X-CSE-ConnectionGUID: vJbOLjwyTOuwkbobNjxb0g==
X-CSE-MsgGUID: Uf6NCBR1S1+Zv1Mh9HvuGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="248136091"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 03:57:00 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 03:56:59 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 03:56:59 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.32) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 03:56:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJ0SvQN2HmoFCm0w2mui/qY688ku8qF6hHGXJgvXQufRM6biGqtMNNr5m+Mhu+tbix0NwYvzEpG9NFxysodz7PzzsROkZ0C/qLuEvDat+SLkw+GT0dB4rwam9/2D/XI3lSZgeVXZoIvz0fhTpaOeuM6H3YW4twZqF/xWcfmiqrRWfyEG8V/+fcPxXeD5aLBiC/8qxDrIa4qvfe0gHsjbRYkE+7oHcH6X82Uc4nqfXTw+q0Z61M+nthZFqkuIdovVKRNo/UzA/jemNrmg/JLLwFO5BqJi6RyunmmwE1wBq42mtUyVjkHCNycMXjqPkxwhwDojJ+XfO5s143+ZjiRfrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/r61tUtgdqDKSOJajBkZxH1fg33PiQSzmlj71QCsH7w=;
 b=nocohrqYm+LlLSOrWv9eH85Fe0V0Z6A0IchEJUV2zQ0wWR+gMQo3lD2QWxKk4uGHk9h/frAGm9cApNkiikXPoTFJY4e7vetxlzf+vBHM17FmPjElwfHOj1aMVFIvDHqbwaZSbJMS+E1779ktpggPGoioVYWouATTBzQ1Oe6pbhD5IqYXGJ4Ysgbsn/i5lZx6deoDS3g3hq/h9XxGU96ATObyK0HbmYBLlQcl/NY0kKg2FkhP1441d9DePS7bzAgrOuS0bLYYk4EyJ9bUOHGwX1FMFqfW7kgSTYZF7iIqoM53Q8TpEfk17j5qhZA0n8pQxB/4IJhSKRYpjciS1WkIyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by CO1PR11MB4850.namprd11.prod.outlook.com (2603:10b6:303:9c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 10:56:53 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 10:56:53 +0000
Date: Wed, 3 Jun 2026 06:56:48 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>, <dev@lankhorst.se>,
 <jani.nikula@intel.com>, <lukasz.laguna@intel.com>, <zhanjun.dong@intel.com>, 
 <lukas@wunner.de>, <daniele.ceraolospurio@intel.com>,
 <badal.nilawar@intel.com>
Subject: Re: [PATCH v8 08/10] drm/xe: Improve wedged state management
Message-ID: <aiAIcAihJhDwOj5e@intel.com>
References: <20260603101814.916948-1-raag.jadav@intel.com>
 <20260603101814.916948-9-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260603101814.916948-9-raag.jadav@intel.com>
X-ClientProxiedBy: SJ0PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:a03:333::19) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|CO1PR11MB4850:EE_
X-MS-Office365-Filtering-Correlation-Id: 967b0033-fd34-45d1-21f6-08dec15ed289
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: BHKdbcrprdzsm90MxHGZkN/rKG41bp/1WNydOxIZnO9xtAYk5eUST/xZpcczy58dYve7nBnzB/cdIKLOBKz2x8NdOfHRBN5VUhQ2hVvplOwoI8hr49Sjf/qCYwy0xB8TOc/eGc52CXhESRPy5I4w5pYuu9Fx7Ct/kQ/vn+Y+DUoPSmEOnQk47Fo4toZMSfu4QAIKUVYsk5hQi+qiePRD7HbpJ/GyfiPFmbDA+GTXtgVCwsZlvcR4vA7TGGFqN19V3q2+OyOMsswwa5lUjSlMrJTUnM8vP127spqRoWL7PJATKQd6uUmv9Z+IyCZprhLoa60tV/L5MxeXHUg38zr1QxU1pR5moeQGeR8cFHK11RkFmVI8O9WrfuF29pp0vlfBDbkwfd5gITv+WLfy1pRaMRVr1dv3Z02QpIV3f8R5wiLifzM+f21W1ejMdWnL8v5fBvfpS/Q17kCaePqUxm8VKAIExWfOSB8jMklqX/MD/VFPJeT1H6zJ8WTZnFuf7JuaA4y5lGmjCcqnnqSFsvAmmYYxBZmpEgBM0NC5fpxNCsqoIdIRHWZf8wBJLVhHmgV02zFu6jODyqz6zjj8QYw9sztV1csj5orEtWH7/77WyqF+2IQW4XKpu7T297krnflZzDPBAEvHMHLRRdTtJgh39pswtrOhNX9LKbo2hcR9sD+be8MMXZ2u5DpJ6k649nAW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mq6ElEE5OWv0cXunwi0xPtXyJsvGC3yL3uJeSTAf8xiK2MKrjtI/rD0YMsWT?=
 =?us-ascii?Q?nBrT7ZQKIa2Y+Cg0Upok+oWiPbtPnHGsMuW3NKiIl0PkRlY7R3w4tcBs30w2?=
 =?us-ascii?Q?yZiAJV96SO/ZqiMR0NL2XVDRLNBHLhxixHUkXEGFxtGRtYkYJdL4vVD8cUhm?=
 =?us-ascii?Q?GxduQSgQRCs1ctPT0Fcr1rtoX0cbHpR5cu4fRuv9ZJG6JzIyKhCX986Up2VJ?=
 =?us-ascii?Q?Rc2/g9MpMMc4g00z4ChMmOmMuU1oy70KkEcY8wqap7//A5jICk4+7X5ZlywF?=
 =?us-ascii?Q?jCHVKXr3IpxPIx1mKDdNyS38hPaRahC4QLCy9qhogz89U8rZ/Obz5pjAL8vS?=
 =?us-ascii?Q?98gf84jTcbz7XOArDovLKhdynvTGaBz9C+MoaKWyLcxGSTbRs0OlNK6hs1ce?=
 =?us-ascii?Q?4wQ0H2zQEYVxKClo6/TA88B1+peRJIJOp6DP/smaapr5aKK7PfDE0l6TfXdH?=
 =?us-ascii?Q?jFiirFyt/QGMGR4uESdyPUWHWstZKkr3bfOtRpM17NInDIaHoXkcfoxtlN+A?=
 =?us-ascii?Q?7Uscjp3koU5g7nUG/U4EVzSTt0Sr+rx4KXefqx5JzNS3dzfx9mipJ0WGLFsl?=
 =?us-ascii?Q?5u2KC4/mymimETzlsTwIDq6J4mOB1t73FqV23sGJQ1Kypk/fqHxYbU2GNpwB?=
 =?us-ascii?Q?ZDxqPY8omOoEeS6Cq3wvA/Ca/nTfW3I179vDwIr88X8d9XPkfQkGkcUD41pI?=
 =?us-ascii?Q?fXiJ+wDrgbob9OTKuDTm4kGHSCrYYPcfsqE/ohhTMkFu8GlvJ6ltPSi26/BO?=
 =?us-ascii?Q?5eU9+NNss4cldrEcJLypFlBGL+NCkPRC9EFUQhx1Df/YlfLHUeRsVQsJ3lzr?=
 =?us-ascii?Q?/uROxjk/4b3eLL27q/vzTNpKpIvja/wzEzP0tOhTe6eolN+fRJwd60yM+695?=
 =?us-ascii?Q?9wPQfnukrOCNcQWC1701I81yJk8fcJ4vYhw2tGi7pZOUx9VVIlduVCv/D7Ta?=
 =?us-ascii?Q?LrGby8PKBzPuDMPAWW+JDi5UnlPydbKp0QgtRFi6gJkseXnGwyJcuZ6I0TJB?=
 =?us-ascii?Q?atBOeswnJFRzCy8S1FjV8FumZETw+dBIZVR+hlKQwfohkrgYz1r1FeYcNuz5?=
 =?us-ascii?Q?KY14cXzDd5mXo+KWhhAmUnFwKZldmtiZz+YyQn3tC/ky4Ip//x5Qd5mOCNzG?=
 =?us-ascii?Q?qlbTBajY0NLyMFdm9KAq+94GX4em6HDkEfcoosqEmHa44Ej5eecfmBswb9oh?=
 =?us-ascii?Q?wSLnDSN9FQ3Wvpuv+ZHyH1dNoIU2keVGQ+QpLfeu5ko456lC8DX1TJQWTm2g?=
 =?us-ascii?Q?s2X6gyx/VG5XXnmRy4ieqoYuDpSPkPBntq0WYWZPEEKnlgMISDt5ONFdqlsH?=
 =?us-ascii?Q?mq4gz8CvFlOgbCxI1V1EkwdqUY0O+syS8VdVB+Bljdq63hkwKfIufHhwHbMY?=
 =?us-ascii?Q?vyOGAgWRdg6PmaTOFLzb9QUYT2j1JeNMxV/9mZzsqde4LZPvOVSKJqRAmEJf?=
 =?us-ascii?Q?fL2DGwL1rKOxnJmY8Dy7ZLNfOdCKISsInLfqjYNoc9hTlu8Vl6svLDToCI7L?=
 =?us-ascii?Q?E+2e+IV5RRL4K1yaXIaBpUNLupnXlGKE4iMLee2f6D9gPCMxEM3y5nfmbd/K?=
 =?us-ascii?Q?2dkyXA2H3WpjJhlA85aYHBBYc2OxdjVGohGiCMsPCQpuKYsdnJU78RA8kN2+?=
 =?us-ascii?Q?4ry+ZC4dHyVvPS1SKYVpBfq4yt1mWGpbbO6jwM7k9F7XlQYl4KoxtAJ+a6GH?=
 =?us-ascii?Q?1ashCal0YEdiRnIeMzVFz4KmCcHiC2kOhpT+nD+lgfD1JX27XxLPma6Ki1YA?=
 =?us-ascii?Q?7J8a4oWDhg=3D=3D?=
X-Exchange-RoutingPolicyChecked: TbuFC25jdewBC3qvT9OFmFybJuWKqWMIlP26swaI0jkk2fc2Tc04DP4KcbK43r1JCYyTY6rEgK6YfXEneSCtn7VmUyZGeCL/Lj0dHJBss9uNUvxyo+iYCwDbT7qEwtglIqhagtrdhFzVnS/sqa7QH+1RLxuLyL0DmYlB2Y1A+J+GnXHOdfo0HzrB2+r7icMEA++EEDunM8H2QuzHLBEslrBZ9nlJP6kOii7uLMU/gyJPnB2lp/P0U/J7R3iRU5AnVQBqOzd1HmwZ9GeGpoPyK6Fr2Y+FqL2jx2SHKq4LyyFgLQBwaBLWICvup6j3GMqJYgTI+AOHYtbWYd8MFiXQhQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 967b0033-fd34-45d1-21f6-08dec15ed289
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 10:56:53.8463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aLIAUgEG6ugGrinEF+YUziv1Iv9qf/fcQsr4jA6aeGRTMNaPy0d/vbRMA2H0f1vhuYAUgZuKQT37IudpAoUvfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4850
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

On Wed, Jun 03, 2026 at 03:47:08PM +0530, Raag Jadav wrote:
> Currently, wedged state is serving a single usecase where the device is
> declared wedged, but this doesn't allow any wedged state management for
> runtime usecases. In preparation of usecases which requires to facilitate
> temporary device wedging, convert wedged.flag to wedged.ref which serves
> as a driver internal refcount and blocks critical path execution during
> device lifetime and while at it, introduce wedged.fini and use it as a
> cleanup indicator during driver unwind which operates independent of the
> refcount.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c       |  5 +++--
>  drivers/gpu/drm/xe/xe_device.h       | 12 +++++++++++-
>  drivers/gpu/drm/xe/xe_device_types.h |  6 ++++--
>  3 files changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 9e0cbad8adb0..d77f8f054a1a 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -917,7 +917,7 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>  {
>  	struct xe_device *xe = arg;
>  
> -	if (atomic_read(&xe->wedged.flag))
> +	if (atomic_read(&xe->wedged.fini))
>  		xe_pm_runtime_put(xe);
>  }
>  
> @@ -1413,7 +1413,8 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  		return;
>  	}
>  
> -	if (!atomic_xchg(&xe->wedged.flag, 1)) {
> +	if (!atomic_xchg(&xe->wedged.fini, 1)) {
> +		xe_device_wedged_get(xe);
>  		xe->needs_flr_on_fini = true;
>  		xe_pm_runtime_get_noresume(xe);
>  		drm_err(&xe->drm,
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index d61fdb362f91..14677729aa24 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -194,9 +194,19 @@ bool xe_device_is_l2_flush_optimized(struct xe_device *xe);
>  void xe_device_td_flush(struct xe_device *xe);
>  void xe_device_l2_flush(struct xe_device *xe);
>  
> +static inline void xe_device_wedged_get(struct xe_device *xe)
> +{
> +	atomic_inc(&xe->wedged.ref);
> +}
> +
> +static inline void xe_device_wedged_put(struct xe_device *xe)
> +{
> +	atomic_dec(&xe->wedged.ref);
> +}
> +
>  static inline bool xe_device_wedged(struct xe_device *xe)
>  {
> -	return atomic_read(&xe->wedged.flag);
> +	return atomic_read(&xe->wedged.ref);
>  }
>  
>  void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 32dd2ffbc796..66e673e4e3e7 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -485,8 +485,10 @@ struct xe_device {
>  
>  	/** @wedged: Struct to control Wedged States and mode */
>  	struct {
> -		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
> -		atomic_t flag;
> +		/** @wedged.fini: Needs cleanup on fini */
> +		atomic_t fini;

to me it is easier to see this as a 'permanent' flag than
a flag to 'clean' on 'fini'.

but up to you...

either way:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +		/** @wedged.ref: Refcount for wedged device, blocks critical path execution */
> +		atomic_t ref;
>  		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
>  		enum xe_wedged_mode mode;
>  		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
> -- 
> 2.43.0
> 
