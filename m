Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F48EB64DA
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jul 2023 03:47:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2DC10E1AD;
	Mon, 17 Jul 2023 03:47:38 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FBF210E1AD
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jul 2023 03:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689565657; x=1721101657;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3NeeH4yLMbMJmJmFnRUfQmNy8Bob/f87z0Acr8syQ04=;
 b=VJRqR9y0paGahQKxwnAoxS+s1UZCcNa+CCIs4Up55ZYibcjtm//d+JSU
 Wx8DxMy5fcHgSib/FazoNrSbRqhLGKJSyc19Z+FSH0cF9pXVz6IZAtrM0
 GMZOGyKobzH5ixKxZKj9JTeaX9yDdYbMusmoRHtS1v2192WmcQiExBYTz
 O+UtQzw4U10eICaLiNyWf6MkoCMOtMvuJq4mUT86FoQQvVlyZufMy9oV+
 oaJUjJr2hvhKyU9TJsph9GSJt6DtC8HXO+LZCEfnlsDWlHrraPshlh63c
 apMZ81khXdrfcuKRBCjKzB7MLSwoG82Agu3+fnlQsKfAGSaBwBmW887NO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="452213894"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="452213894"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2023 20:47:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="758259163"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="758259163"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 16 Jul 2023 20:47:34 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 16 Jul 2023 20:47:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 16 Jul 2023 20:47:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 16 Jul 2023 20:47:33 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 16 Jul 2023 20:47:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7vZbEYoq8A4Z4e4hfWYcQkdHaQHCQLkGrJAS8i18PshZ5RsqGI5jmR5rqsEk8OTILxx/LaXATciz5DBisU9kqGcDuc02HOALqq5DvWEYMHxMJADsF0XXE38LNbYyd7fCMSztO7bEdFZOjUBMN5K+dRYyiJxjgla8F0CfSGn63LhSi6skex3SvpTkiKzlBphziEeY5g6Ynqv3mV0MmTEwRKB5KgSjke6oGdGNI/XEUdKIB/V6XGq+UzkGN/JB7bb+avREe+btKUaMIkTsclBLQZkSz/vermqFi0++k5AZXbU5TrMCbASfyefKFxBvaAA794BIacuzg+HK3iYdyakoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8NDg5UxILWTJ2CjZOJTOcXhvMJGKL21GOjSB99MjkA=;
 b=DLC6dPI5+LvG+LtXEi2gcROf9xd5ZzE2MjSe+kJNewsXF3uhLcbyqsJSkwE7N+fLJDovv3E8XDWBRjteJweuXLPyI33qSBvizWH7e75NnRf0VYb5Go/ajCGWHMUqKRlcIERRAc9WjeSsIs3jEvw0Qusbq1HTef8ZxF0EhY6ZcSbwI2AQnaDqIvnse6dvxkRp8TjkiFgQElmkpCd4TWVRIwM3aWUxciCtB46vUWFxNzevxhf8t0QbJFYalIbkpQ8auX5UwE3BmeK456SjRtWnxxZ65uuJ/1ZtKBNz82vwxwEYPWt6QEVbzXZauKrFazpIRUMrQdij45lCvX3gYSPxzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7311.namprd11.prod.outlook.com (2603:10b6:8:11e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 03:47:26 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164%7]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 03:47:26 +0000
Date: Mon, 17 Jul 2023 00:47:20 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <3zwh5c6wvaure57flxp5jrqe2rira6des6an3ws25anrauxsnu@a24cb3vjzbh3>
References: <20230713150611.7-1-francois.dugast@intel.com>
 <ZLBfsNWDeWYx+c/X@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZLBfsNWDeWYx+c/X@intel.com>
X-ClientProxiedBy: BYAPR07CA0046.namprd07.prod.outlook.com
 (2603:10b6:a03:60::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7311:EE_
X-MS-Office365-Filtering-Correlation-Id: c7a0ddbb-77e1-4409-d931-08db867888ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hBckjZOV84M5MJUu0Vs+yLmG+n9+6MFFtDt7+JnJqSBxmCbS+WUU+8s0tSVl10WNRlKHXzgRrTT+j5hV5k1737GPYIB4I7w5e+wZOh1499fk7X/3cVfwKHe+BNOgh+O0SadtBz7xC5tu/ipz7mGBw0LAK/cAppA4mOixPOuovGE0PzO4RR57nHeDV8B5koydieibZHLv9HczwHpPBdyKxS7GWLzSeAEc9l8MnGSApTqgxKv57643VtHX9h+521xib3skm5OO0pGFq9b8zGKE3tZRFHWxJEKKBW394LaE7SI1M1RnuoV64yr4NLyJuLMhRGR42LB3+ykvrG+KLNiNkS/gU34wAteAwAyeebEf8J8tWaILfJ+dJUCendvdOjJzuFF3avtpP/GHuFuB9Ki6OHblYa78sN/JPgTO/4qZo7QFAQNStxpfbfRe3Ju9tpjjML3D9XJ92DpKIggLMsODURMbkFA4/4M519pEt7u3hQZVey6czHoT0BBsWAOT0fJnHWvi+WDB1fBjBSYDnNzH4yb9+9P17KmDGWONOlOSyR4xREG8zRPojk1xgUJ4pAXt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(366004)(346002)(136003)(39860400002)(376002)(451199021)(478600001)(6666004)(6486002)(186003)(6506007)(26005)(9686003)(6512007)(316002)(2906002)(33716001)(41300700001)(4326008)(66556008)(6636002)(66946007)(66476007)(5660300002)(6862004)(8676002)(8936002)(38100700002)(82960400001)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IjFiOTQfhWBBl4b8lJqJqobAUXYfK/AKzpdyiKPs9/0LiBVUyA1RvCsFV8sb?=
 =?us-ascii?Q?iaPhfopeVZ0h/GFM3WFdo4W1F+BK0PK98RVkR5UjFgeBVXF+KttgQfCNbsTz?=
 =?us-ascii?Q?HMac0ljGBjkxcBtk4WOBKWpfy/r6xZ28WAD1/dEBA4Da2v9+06XJ8Z4BauF4?=
 =?us-ascii?Q?DhJ5vl3cdvEmnezPPXrJpXNfXgbbFs+4AdMWVkjfvaweDc5hsrKTsj9ftNQA?=
 =?us-ascii?Q?X1NsvG33r72DlvU9FlSB/cMlb25jP2QkEJYhXq1LNbBn2GMGUFmHYtxUsJvU?=
 =?us-ascii?Q?jMZZVnTeEZU+RF1kdAwZzD8vGtJ2GVKdACGpLzn0/ehbREgVW4+6pVAa+6sS?=
 =?us-ascii?Q?0thZlSJ9RYq+Y5Go4LYdzx8O9OnGSj0Qm9ONYVyM0EU6Mliu30vLPjX6ZxyM?=
 =?us-ascii?Q?Q79bWAKqw4N0CCKpbOrTmvyIWENv59MVt1VOlP/moT2hkGcm8mk9JXvQchUW?=
 =?us-ascii?Q?zcUe/axaw61lfpp1h8i1NcRASamP/1aKisAWCfN3wthjojOrGibn7YssM7NZ?=
 =?us-ascii?Q?+19IOWKu4djZEBSiNisJil65x9Ssx8cg0osgckQEJf9/27ZPlSm0GavxIVGC?=
 =?us-ascii?Q?2ZVmvNpr6F1qN9nRAbrWDQMeW1yWjdxzr491VwhpuhEml/BH6NK9pb0Y7Wd2?=
 =?us-ascii?Q?pTz8gIJg04jJL2bZt4e9LOB0HUAb528CFVXpNgxCFnXXEQ21TgJScsfm0qdl?=
 =?us-ascii?Q?wrOcl5wJ9YOeUBcQabqYJ4ASuzIDQ5MoHLxvj/mM+7rMg1k8AR10UsVfwhqT?=
 =?us-ascii?Q?7xFo0m7GAM7qWyfPobaEXzXhlmGzD03UeiBcAGj5r+jacH647ABLso+1i0Fn?=
 =?us-ascii?Q?FcmM1RxtY2UNHkiRfEHTY+ioTJO1XzaHFx6qvOGg4GcLiL86eJ3zkgMd049a?=
 =?us-ascii?Q?4uk/ia/A7darpnMj2F7N+tPzABG9puKEhW5nISuvOl5ri47N3Vc9mZTbkHja?=
 =?us-ascii?Q?Gtys9qwBy3kuojV7Iaq8kOj0AelTCVX6klL71OyMEO3UHn8F9n5w8SM4m3CY?=
 =?us-ascii?Q?12iEv7CHDh0+WRtBDDNqCwMqzuno0NgFYQLJ1qzm8Q/RHinLGn2XxqBUOhjB?=
 =?us-ascii?Q?pVg/l6MiTc8wNtIYrVZ22HahSfJnYtEhC13bSH3lfH2OH9kHAmln0CM4u9g1?=
 =?us-ascii?Q?OQNHGk+LMxfendZ6lDkeFvRydnrpsshNg3M9Jmf6q8x5JBIwOgjXdOx6QbRS?=
 =?us-ascii?Q?GBWxP7RwbD0+5Z9kLDu6BGFgyALtJT+nxG/mZHBXqhEhkIVTduy/LTd7Fasm?=
 =?us-ascii?Q?a3eSK/LgQ4N3Y7LWDqYxcc+Hwo1urSA2BPem/0V8xmidtII9CFm7puT13/ss?=
 =?us-ascii?Q?hIGpJmJOD2RQvMHUnq8qSSVY9k5wY1vDUjKj73tNAZ1rje4h8irZUmywsJHt?=
 =?us-ascii?Q?+xbLvmecy8hbGD4b9uCXxfudGLNKF7p0TQJcvkPFJaE3xnjjvkcQuMTcm0Pw?=
 =?us-ascii?Q?bjREIil5FBATL4x8Ks85Ji6kSqG3zCH5Xr8JixzwooSDL6T2sfRxMqT3ViUK?=
 =?us-ascii?Q?i3FjaI9VPw02PD5u+kEFV4SgGT5v90IZZnlrsSzy0PCdf9VjVaXOLcSunCzQ?=
 =?us-ascii?Q?Ui/SfDHUw6rvkmoGtarduXCYoPrvjibicRTUPpi69MeYI1xY9VN5s6/mDChI?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7a0ddbb-77e1-4409-d931-08db867888ed
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 03:47:25.8458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oKSr2S4Tj0ZWXU3ZHdU4Sj9YS1du6HuPAKkW/vMPbnA4jTBDCDhQeNDnQTGF/yoVjn1fQRY+D9PNt1CprgkIkQd95miO8RIIH1bktOLYLQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7311
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/7] drm/xe: Code cleanup
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jul 13, 2023 at 04:33:52PM -0400, Rodrigo Vivi wrote:
>On Thu, Jul 13, 2023 at 03:06:04PM +0000, Francois Dugast wrote:
>> Fix minor typos and reduce ERRORs reported by checkpatch.pl from 95 to 22.
>
>I wonder if we should do this with !fixup patches...

I think that would be a nightmare to thread through the conflicts.
Let's just accept the mistakes happened when we werent' checking
for checkpatch in CI.

Lucas De Marchi

>
>But we anyway need this,
>
>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>for the series
>
>>
>> Francois Dugast (7):
>>   drm/xe: Cleanup SPACING style issues
>>   drm/xe: Cleanup OPEN_BRACE style issues
>>   drm/xe: Cleanup POINTER_LOCATION style issues
>>   drm/xe: Cleanup CODE_INDENT style issues
>>   drm/xe: Cleanup TRAILING_WHITESPACE style issues
>>   drm/xe: Cleanup COMPLEX_MACRO style issues
>>   drm/xe: Fix typos
>>
>>  drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  |  4 ++--
>>  drivers/gpu/drm/xe/display/ext/intel_device_info.c | 11 ++++++++---
>>  drivers/gpu/drm/xe/display/xe_fb_pin.c             |  4 ++--
>>  drivers/gpu/drm/xe/xe_device.h                     |  6 +++---
>>  drivers/gpu/drm/xe/xe_device_types.h               |  4 ++--
>>  drivers/gpu/drm/xe/xe_engine.c                     |  4 ++--
>>  drivers/gpu/drm/xe/xe_force_wake.c                 |  2 +-
>>  drivers/gpu/drm/xe/xe_gt.h                         |  2 +-
>>  drivers/gpu/drm/xe/xe_gt_clock.c                   |  8 ++++----
>>  drivers/gpu/drm/xe/xe_gt_debugfs.c                 |  2 +-
>>  drivers/gpu/drm/xe/xe_gt_mcr.c                     |  3 ++-
>>  drivers/gpu/drm/xe/xe_gt_types.h                   |  8 ++++----
>>  drivers/gpu/drm/xe/xe_guc.c                        |  2 +-
>>  drivers/gpu/drm/xe/xe_guc_debugfs.c                |  2 +-
>>  drivers/gpu/drm/xe/xe_guc_fwif.h                   | 12 ++++++------
>>  drivers/gpu/drm/xe/xe_guc_submit.c                 | 14 +++++++-------
>>  drivers/gpu/drm/xe/xe_huc_debugfs.c                |  2 +-
>>  drivers/gpu/drm/xe/xe_hw_engine.c                  |  2 +-
>>  drivers/gpu/drm/xe/xe_lrc.c                        |  4 ++--
>>  drivers/gpu/drm/xe/xe_rtp.h                        |  4 ++--
>>  drivers/gpu/drm/xe/xe_rtp_helpers.h                | 10 +++++-----
>>  drivers/gpu/drm/xe/xe_sched_job.c                  |  2 +-
>>  drivers/gpu/drm/xe/xe_uc.c                         | 10 +++++-----
>>  drivers/gpu/drm/xe/xe_uc_fw.c                      |  4 ++--
>>  drivers/gpu/drm/xe/xe_vm.c                         |  2 +-
>>  drivers/gpu/drm/xe/xe_wa.c                         |  4 ++--
>>  26 files changed, 69 insertions(+), 63 deletions(-)
>>
>> --
>> 2.34.1
>>
