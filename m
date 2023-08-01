Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81015C0015E
	for <intel-xe@archiver.kernel.org>; Tue,  1 Aug 2023 03:32:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4423810E306;
	Tue,  1 Aug 2023 03:32:26 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F142610E306
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Aug 2023 03:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690860743; x=1722396743;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JIBT8k2GVbsbwbjiIOSQVaJ0Zu1xPGEOz+rvWCHsqnc=;
 b=hwADK9D7N3q8TWIglqelz7oDR4anTfiHryGzh4pWI6SXF4geIOGEuaCe
 NYuKT4HNyrcSHo/Tb6IAxd03bH8wHqYs3eVgY4bq1s4u0wfrKzIFI8NUB
 98xCF5TVmdmDJKn3gSRrjLj1earTepXmdE0owq5qiaqDNOWqFCZpguXL9
 CqNNghsZx42ocM0jux81xjDw+3CqMkYJb+NE9hq7L2uhyj5yD7btd1qiE
 j/J6zVo9j7Q4HfRd+YnQjaQyX8OsMnFmkl3yPBHg2obIOiyVyVttgb0Ku
 6SsjJFgrqyFVIoSNggwaPyZ+TwQS5MHv5tOx+Mnf/yZM+CpbiKIh/9rOT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="369183524"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="369183524"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 20:32:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="763597893"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="763597893"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 31 Jul 2023 20:32:23 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 20:32:22 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 20:32:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 31 Jul 2023 20:32:22 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 31 Jul 2023 20:32:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PAwrjX5cJ9sEvcYlpUcRrSCGJAc2oVlLxfe3CGGS6+kha7vpZu/YbqDkUilJql5pZyeTSlj7IAXHUuIyDOm8fgN9FViEhpoweJh/eaAQHqmupzer0WhVHcOb1XYVxgxrF6I5hXcd1+2HI9QTVtPcJZd+4zmtbV9FBt2+ckG/fhB2RJIR0KTQp/phTtKajV+NuE6rXVuO/Lj82h66YNIHwsKs9tYLl5+El3DylzIXguuhqvwdwa4SbR8XtdOroYBB83ASMQ7lD4aKzk04Is6wdIQvY+cCiAvBlQqKc5Ko+HmEcbsIgmEhxMgnHhMPKiGTIJ3+zE3Rx3v1TFmDvBOgug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yuECAJsvk2ImEr0DK/95teq+E7MWXFok4Q1BNHYga+4=;
 b=bHfRKmECJAbp1shAjJ7oYrMieVMD10iEjP64SAubYszZXDlwaj6CMAqK22lzv9PQAXkjn+j9RN9L01AQAABmOQQVsRCuf3ytrUzGTio6zRv7uQzek8MhArFA+e+3H7xwNfVKhKy13gBsaQUWoL8mgSXZxjkE8Yt4op+eJKMUHJsEnxuPtpksHxAyA2+djtB21QFfqmXzzMIebyzAtaY6vvtW258qjOK07nEzIpr8Qqwagx0j8QZ2UmtSmLYTvc2CzV5Mj3dG2eYhVPx9/QYRhojfiCAQojKP+A9Q/RT5+3mwgGUXdpWVXQpjodme7+9siK8HUWv6lVQ670tGkkIwHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7407.namprd11.prod.outlook.com (2603:10b6:8:136::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Tue, 1 Aug
 2023 03:32:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522%4]) with mapi id 15.20.6631.042; Tue, 1 Aug 2023
 03:32:20 +0000
Date: Tue, 1 Aug 2023 03:31:32 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZMh8lHRUbvU+B3Lh@DUT025-TGLU.fm.intel.com>
References: <20230731191742.1130309-1-tejas.upadhyay@intel.com>
 <20230731191742.1130309-7-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230731191742.1130309-7-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BY5PR20CA0016.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7407:EE_
X-MS-Office365-Filtering-Correlation-Id: b3f61d76-53fb-44ee-c5eb-08db923fe955
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1jtaG+cr6YLVG7Z+Wrj6T/EuRoO+yFYRNSfHckID5PtL+ue2D4bvi2/nSXl0lVZ6LBE3mGfTS6psdr2uecy25rTk+t81eBxW2ov/aCnC1AVIMnl3yJ3lxALr0TdgUlm4xbVt5lqgmZJCgnJw/hHZsi+K+85lbGN05QpwHH9CvW6+aAOi7eQgbGEnTI0ACzCPzKj4szXjMwnZGOzfJP4qzU+NinED73vso7YRaz4u28JT1vFDMxbYU+gZlCdjv1Dtu922TguD4Q50oK1u6oRCDANLaUUnZJy1gDbV/UH+5Ou/iPm4hw2D4y13o+o7VJr6gID2iIsm/2hsNJet4qqu5Y3o1mLG83HPmv+Lo6xpX0TyB/ZWvb/tYjagC6tXzrRewLs5lEfxBguUGU1xHta8CtgOixbb2iPQwGEEsrrGP8kY0govkGljIYL3W/kL9aeV0dz7k6/B88z5mI5J/G/C6AZpDiZY2rhmiyGP2T8Ncy9rZoNlJ0LJW6fOwP08qwr4Ijk6Bk1yxD1M2DhGD3dvM/eO7sPebnHTXXrJr+flBbUqBDm1neVIQpgfHPg+m6HKXzxrQ6iY03O5cT9Pl4XMQ/iKRinzRwdPEFiYHov08SM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(346002)(39860400002)(366004)(396003)(451199021)(478600001)(38100700002)(82960400001)(86362001)(6512007)(6486002)(6666004)(186003)(107886003)(26005)(8676002)(8936002)(6506007)(6862004)(5660300002)(44832011)(4326008)(6636002)(2906002)(66556008)(66946007)(66476007)(19627235002)(41300700001)(316002)(30864003)(83380400001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nk0tMWfqsZz9Z0rzKGw/8zV+kNrfODForaj3bDUYu8Cz1NzDRZkEewwTMGr5?=
 =?us-ascii?Q?7xrEIBR3Hts2mvi3Y61z30JxF5sdFohB3YGB65DCEJ/NCIaQyn1G7SoRWmrX?=
 =?us-ascii?Q?fv/T37ER/GTeqvPzXa05csOFOhi7Pq/05PB/ZsGTO91AbUnN2DjTXJGPHjDn?=
 =?us-ascii?Q?5qmxPOBfY2zeMvwPdawM83vFhLHbvWEcCpxKWKUuX12Ew1TUng6Oq2W6/e96?=
 =?us-ascii?Q?bzFs48rhI7PHM4LzLft4v++gc3k+olZmFyON9xY8ou8bUWCA336VDyXNZY4Y?=
 =?us-ascii?Q?v7GqdZbL2LtcEC4QR9/0t3QWjWNtskVwQuCFebhS1BfhAHJUaSOAJTaErl1z?=
 =?us-ascii?Q?X1QDYTh7psHxmZiwgijXt9HcULf/R5kbUzdkjff6cwY4X5dEgV8OtLzne+y/?=
 =?us-ascii?Q?V9GKUKkXJR96Ld+PemFGCrrARzJo2wVnanCG0hthBijLYD8MxRcOCgoV+NmH?=
 =?us-ascii?Q?xfXy5GfsfXuje6EI9UyTpaidzQHY/WszXD4Lfao9f3W8A88Q/xEfDhfwH/1J?=
 =?us-ascii?Q?worNm6E/N/hxeDpYWGZDjqm5cWTRTZJqN9JEszc5FJTMfFtYV1FdY3iipr71?=
 =?us-ascii?Q?9V+G2tgK9E6YeIMLE8+0wyVGaa6qGz8CqoVQFc7dQVVHxpq5E6wQGNY8DuUi?=
 =?us-ascii?Q?bPPV/ldDHegu+LJh9Fa8oOIQkru6q8uZDiAd/E4R9j7HlGxNM3WxKhKZlJr5?=
 =?us-ascii?Q?rEol/foysIgmMeGSlb5LbXDw7TJlXcx3HkrSdAmyLrKPFEHeDcaGfevYwP50?=
 =?us-ascii?Q?vqYe1tU8Uqf0UeW8QPI5qJS6TfSOy9bebHfymWPpOdGPAUVMpl/VGfZvg754?=
 =?us-ascii?Q?VTzto1C4g103ZKkqwvNHHjjYqOoQudzMvCerhYcD8s3g0NuMydTllOkJA/+5?=
 =?us-ascii?Q?N8ZK/852MlDR44PRW4dDv/lTQObulaFOQxoabPGpZDQMVmbrq8t58wsLX7We?=
 =?us-ascii?Q?8EMQHUPS66YztKxgh+BKox7C0HasNlHI8b058Vpz28K2DIeLjY5gxePGRDCx?=
 =?us-ascii?Q?kykYGxepuh47x6ndn7r65Czylp7GW/to97ZPoAg6eaDt/pevE2Lv0bNo3liY?=
 =?us-ascii?Q?9zoLVfpZ3rgHhV4f9OfNpA5dtXh/uvyPl/hjMWYcumB16MvqZ7JU6z/21/cI?=
 =?us-ascii?Q?TkzFDwcm1+KijRlc2xtR03xyJCRs/cjlHE1cFxdQ1xRqE6USwl+S/OWHpxT7?=
 =?us-ascii?Q?/40fvJsBmr4VNtlGp/pM0OclTSzSVID19GeJ4Q4dgDAEf/KWzdhKVK0tO6KH?=
 =?us-ascii?Q?qDP26dMDuPEmys1ABD33jtt0dHifHUWJ+65UFXIuQcIVbtENAAMCJd3kbUkj?=
 =?us-ascii?Q?H9YjFhxBWG6D20lCRHGkBpHuyDeItEQClrFnDfaICjdE4XvmdntbTswe8lzw?=
 =?us-ascii?Q?MIRC/Nsth42GavAnmNgQ/1l8TGGrFNQ59SN4653nK82ErBSmLBsImykzu8Qu?=
 =?us-ascii?Q?iSSIuSuvUrSe3c3kPzm9Zv3kGXXbnIt5GaG8BiiN+khuiwNOSzYk88SX+p10?=
 =?us-ascii?Q?RhIIqjvHS0mD915MuntBcmLPPaGMcPfinQD5cn2FFQYHdUyMVymvN9KIwM86?=
 =?us-ascii?Q?bwrMWDRylO9Ymhl8VmShAVr7EihuDd+oABfAaNZkuTLAzkZV3IKrxpqD8tlP?=
 =?us-ascii?Q?9g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3f61d76-53fb-44ee-c5eb-08db923fe955
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 03:32:19.9915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HxzKvpTS4FdC0IXE/0AAo+ikEt8doiBQT4fsThEvfwyw/GQJLPsDPVYF+YsL1uDRmGHbOgfHnttxQyTSoWlBbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7407
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V11 6/6] drm/xe: Add min/max cap for engine
 scheduler properties
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Aug 01, 2023 at 12:47:42AM +0530, Tejas Upadhyay wrote:
> Add sysfs entries for the min, max, and defaults for each of
> engine scheduler controls for every hardware engine class.
> 
> Non-elevated user IOCTLs to set these controls must be within
> the min-max ranges of the sysfs entries, elevated user can set
> these controls to any value. However, introduced compile time
> CONFIG min-max values which restricts elevated user to be in
> compile time min-max range if at all sysfs min/max are violated.
> 
> Sysfs entries examples are,
> DUT# cat /sys/class/drm/cardX/device/tileN/gtN/engines/ccs/.defaults/
> job_timeout_max         job_timeout_ms          preempt_timeout_min     timeslice_duration_max  timeslice_duration_us
> job_timeout_min         preempt_timeout_max     preempt_timeout_us      timeslice_duration_min
> 
> DUT# cat /sys/class/drm/card1/device/tileN/gtN/engines/ccs/
> .defaults/              job_timeout_min         preempt_timeout_max     preempt_timeout_us      timeslice_duration_min
> job_timeout_max         job_timeout_ms          preempt_timeout_min     timeslice_duration_max  timeslice_duration_us
> 
> V11:
>    - Make engine_get_prop_minmax and enforce_sched_limit static - Matt
>    - use enum in place of string in engine_get_prop_minmax - Matt
>    - no need to use enforce_sched_limit or no need to filter min/max
>      per user type in sysfs - Matt
> V10:
>    - Add kernel doc for non-static func
>    - Make helper to get min/max for range validation - Matt
>    - Filter min/max per user type
> V9 :
>    - Rebase to use s/xe_engine/xe_hw_engine/ - Matt
> V8 :
>    - fix enforce_sched_limit and avoid code duplication - Niranjana
>    - Make sure min < max - Niranjana
> V7 :
>    - Rebase to replace hw engine with eclass interface
>    - return EINVAL in place of EPERM
>    - Use some APIs to avoid code duplication
> V6 :
>    - Rebase changes to reflect per engine class props interface - MattB
>    - Use #if ENABLED - MattB
>    - Remove MAX_SCHED_TIMEOUT check as range validation is enough
> V5 :
>    - Rebase to resolve conflicts - CI
> V4 :
>    - Rebase
>    - Update commit to reflect tile addition
>    - Use XE_HW macro directly as they are already filtered
>      for CONFIG checks - Niranjana
>    - Add CONFIG for enable/disable min/max limitation
>      on elevated user. Default is enable - Matt/Joonas
> V3 :
>    - Resolve CI hooks warning for kernel-doc
> V2 :
>    - Restric min/max setting to #define default min/max for
>      elevated user - Himal
>    - Remove unrelated changes from patch - Niranjana
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/Kconfig                    |   6 +
>  drivers/gpu/drm/xe/Kconfig.profile            |  46 +++
>  drivers/gpu/drm/xe/xe_engine.c                |  89 ++++-
>  drivers/gpu/drm/xe/xe_hw_engine.c             |   8 +
>  drivers/gpu/drm/xe/xe_hw_engine.h             |  31 ++
>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 332 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h |   1 +
>  7 files changed, 507 insertions(+), 6 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/Kconfig.profile
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index d44794f99338..0a4ea965645b 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -83,3 +83,9 @@ depends on DRM_XE
>  depends on EXPERT
>  source "drivers/gpu/drm/xe/Kconfig.debug"
>  endmenu
> +
> +menu "drm/xe Profile Guided Optimisation"
> +	visible if EXPERT
> +	depends on DRM_XE
> +	source "drivers/gpu/drm/xe/Kconfig.profile"
> +endmenu
> diff --git a/drivers/gpu/drm/xe/Kconfig.profile b/drivers/gpu/drm/xe/Kconfig.profile
> new file mode 100644
> index 000000000000..e72f15ec4bf6
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/Kconfig.profile
> @@ -0,0 +1,46 @@
> +config DRM_XE_JOB_TIMEOUT_MAX
> +       int "Default max job timeout (ms)"
> +       default 10000 # milliseconds
> +       help
> +         Configures the default max job timeout after which job will
> +         be forcefully taken away from scheduler.
> +config DRM_XE_JOB_TIMEOUT_MIN
> +       int "Default max job timeout (ms)"
> +       default 1 # milliseconds
> +       help
> +         Configures the default min job timeout after which job will
> +         be forcefully taken away from scheduler.
> +config DRM_XE_TIMESLICE_MAX
> +       int "Default max timeslice duration (us)"
> +       default 10000000 # microseconds
> +       help
> +         Configures the default max timeslice duration between multiple
> +         contexts by guc scheduling.
> +config DRM_XE_TIMESLICE_MIN
> +       int "Default min timeslice duration (us)"
> +       default 1 # microseconds
> +       help
> +         Configures the default min timeslice duration between multiple
> +         contexts by guc scheduling.
> +config DRM_XE_PREEMPT_TIMEOUT_MAX
> +       int "Default max  preempt timeout (us)"
> +       default 10000000 # microseconds
> +       help
> +         Configures the default max preempt timeout after which context
> +         will be forcefully taken away and higher priority context will
> +         run.
> +config DRM_XE_PREEMPT_TIMEOUT_MIN
> +       int "Default min  preempt timeout (us)"
> +       default 1 # microseconds
> +       help
> +         Configures the default min preempt timeout after which context
> +         will be forcefully taken away and higher priority context will
> +         run.
> +config DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
> +       bool "Default configuration of limitation on scheduler timeout"
> +       default y
> +       help
> +	 Configures the enablement of limitation on scheduler timeout
> +	 to apply to applicable user. For elevated user, all above MIN
> +	 and MAX values will apply when this configuration is enable to
> +	 apply limitation. By default limitation is applied.
> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> index f4eb67915bfc..d77dd42384eb 100644
> --- a/drivers/gpu/drm/xe/xe_engine.c
> +++ b/drivers/gpu/drm/xe/xe_engine.c
> @@ -13,6 +13,7 @@
>  
>  #include "xe_device.h"
>  #include "xe_gt.h"
> +#include "xe_hw_engine_class_sysfs.h"
>  #include "xe_hw_fence.h"
>  #include "xe_lrc.h"
>  #include "xe_macros.h"
> @@ -22,6 +23,13 @@
>  #include "xe_trace.h"
>  #include "xe_vm.h"
>  
> +enum xe_engine_sched_prop {
> +	XE_ENGINE_JOB_TIMEOUT = 0,
> +	XE_ENGINE_TIMESLICE = 1,
> +	XE_ENGINE_PREEMPT_TIMEOUT = 2,
> +	XE_ENGINE_SCHED_PROP_MAX = 3,
> +};
> +
>  static struct xe_engine *__xe_engine_create(struct xe_device *xe,
>  					    struct xe_vm *vm,
>  					    u32 logical_mask,
> @@ -201,11 +209,68 @@ static int engine_set_priority(struct xe_device *xe, struct xe_engine *e,
>  	return e->ops->set_priority(e, value);
>  }
>  
> +static bool xe_engine_enforce_schedule_limit(void)
> +{
> +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> +	return true;
> +#else
> +	return !capable(CAP_SYS_NICE);
> +#endif
> +}
> +
> +static void xe_engine_get_prop_minmax(struct xe_hw_engine_class_intf *eclass,
> +				      enum xe_engine_sched_prop prop,
> +				      u32 *min, u32 *max)
> +{
> +	switch (prop) {
> +	case XE_ENGINE_JOB_TIMEOUT:
> +		*min = eclass->sched_props.job_timeout_min;
> +		*max = eclass->sched_props.job_timeout_max;
> +		break;
> +	case XE_ENGINE_TIMESLICE:
> +		*min = eclass->sched_props.timeslice_min;
> +		*max = eclass->sched_props.timeslice_max;
> +		break;
> +	case XE_ENGINE_PREEMPT_TIMEOUT:
> +		*min = eclass->sched_props.preempt_timeout_min;
> +		*max = eclass->sched_props.preempt_timeout_max;
> +		break;
> +	default:
> +		break;
> +	}
> +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
> +	if (capable(CAP_SYS_NICE)) {
> +		switch (prop) {
> +		case XE_ENGINE_JOB_TIMEOUT:
> +			*min = XE_HW_ENGINE_JOB_TIMEOUT_MIN;
> +			*max = XE_HW_ENGINE_JOB_TIMEOUT_MAX;
> +			break;
> +		case XE_ENGINE_TIMESLICE:
> +			*min = XE_HW_ENGINE_TIMESLICE_MIN;
> +			*max = XE_HW_ENGINE_TIMESLICE_MAX;
> +			break;
> +		case XE_ENGINE_PREEMPT_TIMEOUT:
> +			*min = XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
> +			*max = XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
> +			break;
> +		default:
> +			break;
> +		}
> +	}
> +#endif
> +}
> +
>  static int engine_set_timeslice(struct xe_device *xe, struct xe_engine *e,
>  				u64 value, bool create)
>  {
> -	if (!capable(CAP_SYS_NICE))
> -		return -EPERM;
> +	u32 min = 0, max = 0;
> +
> +	xe_engine_get_prop_minmax(e->hwe->eclass,
> +				  XE_ENGINE_TIMESLICE, &min, &max);
> +
> +	if (xe_engine_enforce_schedule_limit() &&
> +	    !xe_hw_engine_timeout_in_range(value, min, max))
> +		return -EINVAL;
>  
>  	return e->ops->set_timeslice(e, value);
>  }
> @@ -214,8 +279,14 @@ static int engine_set_preemption_timeout(struct xe_device *xe,
>  					 struct xe_engine *e, u64 value,
>  					 bool create)
>  {
> -	if (!capable(CAP_SYS_NICE))
> -		return -EPERM;
> +	u32 min = 0, max = 0;
> +
> +	xe_engine_get_prop_minmax(e->hwe->eclass,
> +				  XE_ENGINE_PREEMPT_TIMEOUT, &min, &max);
> +
> +	if (xe_engine_enforce_schedule_limit() &&
> +	    !xe_hw_engine_timeout_in_range(value, min, max))
> +		return -EINVAL;
>  
>  	return e->ops->set_preempt_timeout(e, value);
>  }
> @@ -279,11 +350,17 @@ static int engine_set_persistence(struct xe_device *xe, struct xe_engine *e,
>  static int engine_set_job_timeout(struct xe_device *xe, struct xe_engine *e,
>  				  u64 value, bool create)
>  {
> +	u32 min = 0, max = 0;
> +
>  	if (XE_IOCTL_DBG(xe, !create))
>  		return -EINVAL;
>  
> -	if (!capable(CAP_SYS_NICE))
> -		return -EPERM;
> +	xe_engine_get_prop_minmax(e->hwe->eclass,
> +				  XE_ENGINE_JOB_TIMEOUT, &min, &max);
> +
> +	if (xe_engine_enforce_schedule_limit() &&
> +	    !xe_hw_engine_timeout_in_range(value, min, max))
> +		return -EINVAL;
>  
>  	return e->ops->set_job_timeout(e, value);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index b7be7b0acb35..b8fcc6e985cf 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -364,8 +364,16 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  
>  	if (!gt->eclass[hwe->class].sched_props.job_timeout_ms) {
>  		gt->eclass[hwe->class].sched_props.job_timeout_ms = 5 * 1000;
> +		gt->eclass[hwe->class].sched_props.job_timeout_min = XE_HW_ENGINE_JOB_TIMEOUT_MIN;
> +		gt->eclass[hwe->class].sched_props.job_timeout_max = XE_HW_ENGINE_JOB_TIMEOUT_MAX;
>  		gt->eclass[hwe->class].sched_props.timeslice_us = 1 * 1000;
> +		gt->eclass[hwe->class].sched_props.timeslice_min = XE_HW_ENGINE_TIMESLICE_MIN;
> +		gt->eclass[hwe->class].sched_props.timeslice_max = XE_HW_ENGINE_TIMESLICE_MAX;
>  		gt->eclass[hwe->class].sched_props.preempt_timeout_us = 640 * 1000;
> +		gt->eclass[hwe->class].sched_props.preempt_timeout_min =
> +								XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
> +		gt->eclass[hwe->class].sched_props.preempt_timeout_max =
> +								XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
>  		/* Record default props */
>  		gt->eclass[hwe->class].defaults = gt->eclass[hwe->class].sched_props;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> index 7eca9d53c7b1..3d37d6d44261 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -10,6 +10,37 @@
>  
>  struct drm_printer;
>  
> +#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> +#define XE_HW_ENGINE_JOB_TIMEOUT_MIN CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> +#else
> +#define XE_HW_ENGINE_JOB_TIMEOUT_MIN 1
> +#endif
> +#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MAX
> +#define XE_HW_ENGINE_JOB_TIMEOUT_MAX CONFIG_DRM_XE_JOB_TIMEOUT_MAX
> +#else
> +#define XE_HW_ENGINE_JOB_TIMEOUT_MAX (10 * 1000)
> +#endif
> +#ifdef CONFIG_DRM_XE_TIMESLICE_MIN
> +#define XE_HW_ENGINE_TIMESLICE_MIN CONFIG_DRM_XE_TIMESLICE_MIN
> +#else
> +#define XE_HW_ENGINE_TIMESLICE_MIN 1
> +#endif
> +#ifdef CONFIG_DRM_XE_TIMESLICE_MAX
> +#define XE_HW_ENGINE_TIMESLICE_MAX CONFIG_DRM_XE_TIMESLICE_MAX
> +#else
> +#define XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000)
> +#endif
> +#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
> +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
> +#else
> +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 1
> +#endif
> +#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
> +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
> +#else
> +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX (10 * 1000 * 1000)
> +#endif
> +
>  int xe_hw_engines_init_early(struct xe_gt *gt);
>  int xe_hw_engines_init(struct xe_gt *gt);
>  void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> index 238275675297..d9b662f22fc8 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> @@ -13,6 +13,22 @@
>  #define MAX_ENGINE_CLASS_NAME_LEN    16
>  static int xe_add_hw_engine_class_defaults(struct kobject *parent);
>  
> +/**
> + * xe_hw_engine_timeout_in_range - Helper to check if timeout is in range
> + * @timeout: timeout to validate
> + * @min: min value of valid range
> + * @max: max value of valid range
> + *
> + * This helper helps to validate if timeout is in min-max range of HW engine
> + * scheduler.
> + *
> + * Returns: Returns false value for failure and true for success.
> + */
> +bool xe_hw_engine_timeout_in_range(u64 timeout, u64 min, u64 max)
> +{
> +	return timeout >= min && timeout <= max;
> +}
> +
>  static void kobj_xe_hw_engine_release(struct kobject *kobj)
>  {
>  	kfree(kobj);
> @@ -41,11 +57,85 @@ kobj_xe_hw_engine_class(struct kobject *parent, char *name)
>  	return keclass;
>  }
>  
> +static ssize_t job_timeout_max_store(struct kobject *kobj,
> +				     struct kobj_attribute *attr,
> +				     const char *buf, size_t count)
> +{
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +	u32 timeout;
> +	int err;
> +
> +	err = kstrtou32(buf, 0, &timeout);
> +	if (err)
> +		return err;
> +
> +	if (timeout < eclass->sched_props.job_timeout_min)
> +		return -EINVAL;
> +
> +	if (!xe_hw_engine_timeout_in_range(timeout,
> +					   XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> +					   XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> +		return -EINVAL;
> +
> +	WRITE_ONCE(eclass->sched_props.job_timeout_max, timeout);
> +
> +	return count;
> +}
> +
> +static ssize_t job_timeout_max_show(struct kobject *kobj,
> +				    struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +
> +	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_max);
> +}
> +
> +static struct kobj_attribute job_timeout_max_attr =
> +__ATTR(job_timeout_max, 0644, job_timeout_max_show, job_timeout_max_store);
> +
> +static ssize_t job_timeout_min_store(struct kobject *kobj,
> +				     struct kobj_attribute *attr,
> +				     const char *buf, size_t count)
> +{
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +	u32 timeout;
> +	int err;
> +
> +	err = kstrtou32(buf, 0, &timeout);
> +	if (err)
> +		return err;
> +
> +	if (timeout > eclass->sched_props.job_timeout_max)
> +		return -EINVAL;
> +
> +	if (!xe_hw_engine_timeout_in_range(timeout,
> +					   XE_HW_ENGINE_JOB_TIMEOUT_MIN,
> +					   XE_HW_ENGINE_JOB_TIMEOUT_MAX))
> +		return -EINVAL;
> +
> +	WRITE_ONCE(eclass->sched_props.job_timeout_min, timeout);
> +
> +	return count;
> +}
> +
> +static ssize_t job_timeout_min_show(struct kobject *kobj,
> +				    struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +
> +	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_min);
> +}
> +
> +static struct kobj_attribute job_timeout_min_attr =
> +__ATTR(job_timeout_min, 0644, job_timeout_min_show, job_timeout_min_store);
> +
>  static ssize_t job_timeout_store(struct kobject *kobj,
>  				 struct kobj_attribute *attr,
>  				 const char *buf, size_t count)
>  {
>  	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +	u32 min = eclass->sched_props.job_timeout_min;
> +	u32 max = eclass->sched_props.job_timeout_max;
>  	u32 timeout;
>  	int err;
>  
> @@ -53,6 +143,9 @@ static ssize_t job_timeout_store(struct kobject *kobj,
>  	if (err)
>  		return err;
>  
> +	if (!xe_hw_engine_timeout_in_range(timeout, min, max))
> +		return -EINVAL;
> +
>  	WRITE_ONCE(eclass->sched_props.job_timeout_ms, timeout);
>  
>  	return count;
> @@ -80,11 +173,35 @@ static ssize_t job_timeout_default(struct kobject *kobj,
>  static struct kobj_attribute job_timeout_def =
>  __ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
>  
> +static ssize_t job_timeout_min_default(struct kobject *kobj,
> +				       struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
> +
> +	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_min);
> +}
> +
> +static struct kobj_attribute job_timeout_min_def =
> +__ATTR(job_timeout_min, 0444, job_timeout_min_default, NULL);
> +
> +static ssize_t job_timeout_max_default(struct kobject *kobj,
> +				       struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
> +
> +	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_max);
> +}
> +
> +static struct kobj_attribute job_timeout_max_def =
> +__ATTR(job_timeout_max, 0444, job_timeout_max_default, NULL);
> +
>  static ssize_t timeslice_duration_store(struct kobject *kobj,
>  					struct kobj_attribute *attr,
>  					const char *buf, size_t count)
>  {
>  	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +	u32 min = eclass->sched_props.timeslice_min;
> +	u32 max = eclass->sched_props.timeslice_max;
>  	u32 duration;
>  	int err;
>  
> @@ -92,11 +209,89 @@ static ssize_t timeslice_duration_store(struct kobject *kobj,
>  	if (err)
>  		return err;
>  
> +	if (!xe_hw_engine_timeout_in_range(duration, min, max))
> +		return -EINVAL;
> +
>  	WRITE_ONCE(eclass->sched_props.timeslice_us, duration);
>  
>  	return count;
>  }
>  
> +static ssize_t timeslice_duration_max_store(struct kobject *kobj,
> +					    struct kobj_attribute *attr,
> +					    const char *buf, size_t count)
> +{
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +	u32 duration;
> +	int err;
> +
> +	err = kstrtou32(buf, 0, &duration);
> +	if (err)
> +		return err;
> +
> +	if (duration < eclass->sched_props.timeslice_min)
> +		return -EINVAL;
> +
> +	if (!xe_hw_engine_timeout_in_range(duration,
> +					   XE_HW_ENGINE_TIMESLICE_MIN,
> +					   XE_HW_ENGINE_TIMESLICE_MAX))
> +		return -EINVAL;
> +
> +	WRITE_ONCE(eclass->sched_props.timeslice_max, duration);
> +
> +	return count;
> +}
> +
> +static ssize_t timeslice_duration_max_show(struct kobject *kobj,
> +					   struct kobj_attribute *attr,
> +					   char *buf)
> +{
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +
> +	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_max);
> +}
> +
> +static struct kobj_attribute timeslice_duration_max_attr =
> +	__ATTR(timeslice_duration_max, 0644, timeslice_duration_max_show,
> +	       timeslice_duration_max_store);
> +
> +static ssize_t timeslice_duration_min_store(struct kobject *kobj,
> +					    struct kobj_attribute *attr,
> +					    const char *buf, size_t count)
> +{
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +	u32 duration;
> +	int err;
> +
> +	err = kstrtou32(buf, 0, &duration);
> +	if (err)
> +		return err;
> +
> +	if (duration > eclass->sched_props.timeslice_max)
> +		return -EINVAL;
> +
> +	if (!xe_hw_engine_timeout_in_range(duration,
> +					   XE_HW_ENGINE_TIMESLICE_MIN,
> +					   XE_HW_ENGINE_TIMESLICE_MAX))
> +		return -EINVAL;
> +
> +	WRITE_ONCE(eclass->sched_props.timeslice_min, duration);
> +
> +	return count;
> +}
> +
> +static ssize_t timeslice_duration_min_show(struct kobject *kobj,
> +					   struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +
> +	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_min);
> +}
> +
> +static struct kobj_attribute timeslice_duration_min_attr =
> +	__ATTR(timeslice_duration_min, 0644, timeslice_duration_min_show,
> +	       timeslice_duration_min_store);
> +
>  static ssize_t timeslice_duration_show(struct kobject *kobj,
>  				       struct kobj_attribute *attr, char *buf)
>  {
> @@ -120,11 +315,35 @@ static ssize_t timeslice_default(struct kobject *kobj,
>  static struct kobj_attribute timeslice_duration_def =
>  __ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
>  
> +static ssize_t timeslice_min_default(struct kobject *kobj,
> +				     struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
> +
> +	return sprintf(buf, "%u\n", eclass->defaults.timeslice_min);
> +}
> +
> +static struct kobj_attribute timeslice_duration_min_def =
> +__ATTR(timeslice_duration_min, 0444, timeslice_min_default, NULL);
> +
> +static ssize_t timeslice_max_default(struct kobject *kobj,
> +				     struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
> +
> +	return sprintf(buf, "%u\n", eclass->defaults.timeslice_max);
> +}
> +
> +static struct kobj_attribute timeslice_duration_max_def =
> +__ATTR(timeslice_duration_max, 0444, timeslice_max_default, NULL);
> +
>  static ssize_t preempt_timeout_store(struct kobject *kobj,
>  				     struct kobj_attribute *attr,
>  				     const char *buf, size_t count)
>  {
>  	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +	u32 min = eclass->sched_props.preempt_timeout_min;
> +	u32 max = eclass->sched_props.preempt_timeout_max;
>  	u32 timeout;
>  	int err;
>  
> @@ -132,6 +351,9 @@ static ssize_t preempt_timeout_store(struct kobject *kobj,
>  	if (err)
>  		return err;
>  
> +	if (!xe_hw_engine_timeout_in_range(timeout, min, max))
> +		return -EINVAL;
> +
>  	WRITE_ONCE(eclass->sched_props.preempt_timeout_us, timeout);
>  
>  	return count;
> @@ -160,17 +382,127 @@ static ssize_t preempt_timeout_default(struct kobject *kobj,
>  static struct kobj_attribute preempt_timeout_def =
>  __ATTR(preempt_timeout_us, 0444, preempt_timeout_default, NULL);
>  
> +static ssize_t preempt_timeout_min_default(struct kobject *kobj,
> +					   struct kobj_attribute *attr,
> +					   char *buf)
> +{
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
> +
> +	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_min);
> +}
> +
> +static struct kobj_attribute preempt_timeout_min_def =
> +__ATTR(preempt_timeout_min, 0444, preempt_timeout_min_default, NULL);
> +
> +static ssize_t preempt_timeout_max_default(struct kobject *kobj,
> +					   struct kobj_attribute *attr,
> +					   char *buf)
> +{
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
> +
> +	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_max);
> +}
> +
> +static struct kobj_attribute preempt_timeout_max_def =
> +__ATTR(preempt_timeout_max, 0444, preempt_timeout_max_default, NULL);
> +
> +static ssize_t preempt_timeout_max_store(struct kobject *kobj,
> +					 struct kobj_attribute *attr,
> +					 const char *buf, size_t count)
> +{
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +	u32 timeout;
> +	int err;
> +
> +	err = kstrtou32(buf, 0, &timeout);
> +	if (err)
> +		return err;
> +
> +	if (timeout < eclass->sched_props.preempt_timeout_min)
> +		return -EINVAL;
> +
> +	if (!xe_hw_engine_timeout_in_range(timeout,
> +					   XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> +					   XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> +		return -EINVAL;
> +
> +	WRITE_ONCE(eclass->sched_props.preempt_timeout_max, timeout);
> +
> +	return count;
> +}
> +
> +static ssize_t preempt_timeout_max_show(struct kobject *kobj,
> +					struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +
> +	return sprintf(buf, "%u\n", eclass->sched_props.preempt_timeout_max);
> +}
> +
> +static struct kobj_attribute preempt_timeout_max_attr =
> +	__ATTR(preempt_timeout_max, 0644, preempt_timeout_max_show,
> +	       preempt_timeout_max_store);
> +
> +static ssize_t preempt_timeout_min_store(struct kobject *kobj,
> +					 struct kobj_attribute *attr,
> +					 const char *buf, size_t count)
> +{
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +	u32 timeout;
> +	int err;
> +
> +	err = kstrtou32(buf, 0, &timeout);
> +	if (err)
> +		return err;
> +
> +	if (timeout > eclass->sched_props.preempt_timeout_max)
> +		return -EINVAL;
> +
> +	if (!xe_hw_engine_timeout_in_range(timeout,
> +					   XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
> +					   XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
> +		return -EINVAL;
> +
> +	WRITE_ONCE(eclass->sched_props.preempt_timeout_min, timeout);
> +
> +	return count;
> +}
> +
> +static ssize_t preempt_timeout_min_show(struct kobject *kobj,
> +					struct kobj_attribute *attr, char *buf)
> +{
> +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
> +
> +	return sprintf(buf, "%u\n", eclass->sched_props.preempt_timeout_min);
> +}
> +
> +static struct kobj_attribute preempt_timeout_min_attr =
> +	__ATTR(preempt_timeout_min, 0644, preempt_timeout_min_show,
> +	       preempt_timeout_min_store);
> +
>  static const struct attribute *defaults[] = {
>  	&job_timeout_def.attr,
> +	&job_timeout_min_def.attr,
> +	&job_timeout_max_def.attr,
>  	&timeslice_duration_def.attr,
> +	&timeslice_duration_min_def.attr,
> +	&timeslice_duration_max_def.attr,
>  	&preempt_timeout_def.attr,
> +	&preempt_timeout_min_def.attr,
> +	&preempt_timeout_max_def.attr,
>  	NULL
>  };
>  
>  static const struct attribute *files[] = {
>  	&job_timeout_attr.attr,
> +	&job_timeout_min_attr.attr,
> +	&job_timeout_max_attr.attr,
>  	&timeslice_duration_attr.attr,
> +	&timeslice_duration_min_attr.attr,
> +	&timeslice_duration_max_attr.attr,
>  	&preempt_timeout_attr.attr,
> +	&preempt_timeout_min_attr.attr,
> +	&preempt_timeout_max_attr.attr,
>  	NULL
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> index c093f381abbe..60469fde4147 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> @@ -12,6 +12,7 @@ struct xe_gt;
>  struct xe_hw_engine_class_intf;
>  
>  int xe_hw_engine_class_sysfs_init(struct xe_gt *gt);
> +bool xe_hw_engine_timeout_in_range(u64 timeout, u64 min, u64 max);
>  
>  /**
>   * struct kobj_eclass - A eclass's kobject struct that connects the kobject and the
> -- 
> 2.25.1
> 
