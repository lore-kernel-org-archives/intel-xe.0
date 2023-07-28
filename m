Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0350C001E0
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 06:25:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D82510E653;
	Fri, 28 Jul 2023 06:25:47 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B6A10E653
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 06:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690525546; x=1722061546;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/b7icSv94HDI7YWfwdQD5lpEZkNBmd4C+fvu2NWvKsA=;
 b=D4yvPJw1vTq1JHppigjWgvML7nTgpx/ipWniun4Xca1dXX5Ok67Nf+ID
 LMShJUTPr5XFIyBPkRQOyKizN+uRC3GLfm1ohkH/dOqIFxSoN3yp4hJLU
 NI4f4PM6QfVanElmW0RPOROig18931KjoTt2UrCdHKgg6Sl+eSMfXMGdY
 gQ2JHiByD7fUIS6Rj4OsH0r9+k3IkMYr0w6yrbefzj7wNp2tiUC6QEctP
 Cm9Y6cRT4h68tpynonUyYjIc7x71h+MJq6YtHauonGuCqPFfARdCDwePg
 kWuQNYBPe1jS1Ib5JnW5Ib+2O0shBxkrBqpi9/Iv/bA9iRkeYVcLRzqia w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="358542688"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="358542688"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 23:25:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="1058001135"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; d="scan'208";a="1058001135"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 27 Jul 2023 23:25:45 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 23:25:45 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 23:25:45 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 23:25:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KvdP8k7vvctgAsg8BhFu9uFcuWY1Uta5cJVgb6KMlcn7Z+LyWqh1qW37Gwdh0nduYu5hpMJJmyEuHt500/3rtY4MG63WgBZa9FMNCWxkXFIdi6jpZ/FO4qXqT4jj8aFxpj6dwcRCOAcn7mcBiLhYjDd9WNNum9XDUc7Xp1OsD9YLxHhTjhhok/D0eMfLZMAH7LzD4Dfbt8Db616Z+QUHS/u5iDuPBiaP8XZQ6F13gSvmWXKRZdoifcSBGMKm/N67xFGUU7jqACM9vnO7rtw1Oa2Xv+HWWUql8cqUyKip1M8g48+2rP6XT9VBjoNvSX+T+JXlHvI17kJFFkiqIRm6sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SiJ72CNA6cS5PllMdHqfqMFWz68l2WV689Oif2Y881k=;
 b=T0Qefda/9wW9bwzZuLd2gTWY3tG+/Kwtrg8NtwYQn9PRsfVJes9Eshsv9hswYcDAFNUp//ghZV/dgvV/AjBB9qNh8qrga4t9gbUG0bKzSxKPB65XS3tqnr+gx7ytIXnf2nn05pHQ5XfKYVvX9NT3Tuw6u00wWW5TrBLWoBpzXW1B30dA+uIrCJ4gTVDS+FZfXALtPHPZgDA9b9iSQ/kezdwctQCN/pTNGmITFOxjbQ67zn1gkq4SiqJjaD6shisqWTCFXNXCxYoQneKK7lfA+x0MMo+1mCE/Wrgn0J57i/cV59+88rqcdJtvrVtzm4CXBHAYEKBMC2F4v60dAy3B/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by CY8PR11MB7265.namprd11.prod.outlook.com (2603:10b6:930:98::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 06:25:42 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::fe5e:ee9:8806:c9fa]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::fe5e:ee9:8806:c9fa%7]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 06:25:42 +0000
Date: Thu, 27 Jul 2023 23:25:39 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Message-ID: <ZMNfY83ZteSxWk3w@nvishwa1-DESK>
References: <20230727082235.905240-1-tejas.upadhyay@intel.com>
 <20230727082235.905240-7-tejas.upadhyay@intel.com>
 <ZMKMuWeQBXsSo2Sb@DUT025-TGLU.fm.intel.com>
 <ZMNHp1f+wwyd9ZTB@nvishwa1-DESK>
 <ZMNMdIXaJrm4RKGJ@DUT025-TGLU.fm.intel.com>
 <SJ1PR11MB62041E3422EBC2A5D9ABC05C8106A@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB62041E3422EBC2A5D9ABC05C8106A@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR11CA0101.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::42) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|CY8PR11MB7265:EE_
X-MS-Office365-Filtering-Correlation-Id: c643f719-dba4-44f4-1258-08db8f3377d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fT7Du9ElsIPva+XEZAQ8KPM1dFSZIUAUXMM6kTcSECqyr2W2MQF/EbG680tfa+/xYEg+G2959NKkJZy/JI5UXtu7nOAE/v5KuqWOoKSzCtV1Oqm6xkkuoSK2nMnURdyEIG3q4d+SVxu0VnYxekJiOmTacqCmMklzWWU/b2lBqpJYkG5pJPx5V+HjZMkHFot0t6gBvEscjM/D69yNwD7xNfoYj2E9AqwxlxlnYciWbdB0500+Eqk6VEKgDCTpwBxltPGLTuhQts2RwimANJwTPZZbWCH+1SsCXrUt5jzZBGu2xXQ05/rlmz0fjnrVejsUuQMqWBd4hldeYEwM9WxxHYGMjFPjavC70OfwW3x6WB7wK0XI+eH4Szr1jHpoki2Mfil750dayOzSJgSs1bMWtEkjX6rPFxcvj9/KPtWerGh9DspKxidFeiAYhKG7x3ZUE8KHfTBmpXTVrobti0rFeOYNS7kvkud6sZgnQCTmyEVfgYubFmdoqWqOrjpUg9Oqd1+xh6B0ofx6q8RQ++nnv8q4ge/kczmGMTCB0Fl6QI6pAcM7grfJQYbTh/j/6j0W
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199021)(26005)(6862004)(6506007)(53546011)(83380400001)(8936002)(186003)(8676002)(86362001)(5660300002)(33716001)(9686003)(6512007)(41300700001)(6666004)(478600001)(82960400001)(2906002)(6486002)(54906003)(19627235002)(30864003)(38100700002)(316002)(44832011)(66556008)(66476007)(6636002)(66946007)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z6mB+1asjA1AzCGlhRr55O+2IYzWMfE5lR2zlzjQspim1vHlXbsbl8RJzeDM?=
 =?us-ascii?Q?JZvls3sbeVj+Gr/uJaK7uhQNk4yQUq8Ya+2HZcXQfjoR83bkbMbBDPKnW5K/?=
 =?us-ascii?Q?uJpfAIJUCUbS0Dnay34ah/xOEJ52RNE8MSl1skEpSVJYPRQGPt/xtJ9feXZl?=
 =?us-ascii?Q?Im/Z7KlMgfmxN109EUfP8WZpL22ZtkrT7AYDy8F40ZoDMZuiKzazDxQgaMvb?=
 =?us-ascii?Q?Z/wpHxGW5OuiqPdTvsc9eB774Xutgrzu/B27EkfF8BmgQ5o9D0TrQsdgmvp6?=
 =?us-ascii?Q?mdIvurdqQKBQwaMey8Vgrp0fMbbs0XATtHWighWjx8Ynee2os3ni2NOAACwy?=
 =?us-ascii?Q?Xa8xb7BK8hvTMl4PwqpzS+DoPCTtO9iRWKbN3vGcVcUibAuDfgLACZtTE7Tw?=
 =?us-ascii?Q?M99rn+Giu1ldIjVc/1lpC92X5blhoPUk03Ic4PerXjRxt4XGSOkjg4yaBkBg?=
 =?us-ascii?Q?6XHyhuyGHsFfwbwvKK51IXFPUhG8CMWYzC9M0nmZZCPKpvQg87vkA5A2DCUU?=
 =?us-ascii?Q?9vW+Dsbyyy6l9qD5qQ0dSs9l/rov3t20EcbmSOdXM32X3uj3VHHyfUVxkH64?=
 =?us-ascii?Q?tKmkRRPUqI87vvBdRGVodUcGVYKPbh0iNww6m98uBdwynBb8awD5msh1Yj2e?=
 =?us-ascii?Q?LDOhmtC2TUx1kh4yu3+njlalboD9vyZJTdgKA7YDo+6F++iyaE6dcATggQjB?=
 =?us-ascii?Q?0XTIcBRJ4gd52400miEtf1rG4l7qqyVhY8uyqGYsursV5oHcPWW3edXnIjHQ?=
 =?us-ascii?Q?bOagnA8d4acZw1qAZH416sDgDlmuzNYKtDlmsd1SHy+pYManRJ6aBx5KKv7P?=
 =?us-ascii?Q?g/KA6VOcr1NV5fcEOP5GfezJVGHc9owmqXP87t50VCmcvftl5DcrJ0RT9FJZ?=
 =?us-ascii?Q?07c2u67WcXz+b1RNgw8tZr/ccKMpA5VDyQqgJTSGAnTVKlpqi6uLtA0ujLZv?=
 =?us-ascii?Q?a8mB5H4waT4qvru2N7KeWnFJFqqvhLoL7IufUGTXhdqJb6C9CxreoYurRd6I?=
 =?us-ascii?Q?WdsZ8UsZM+KQAq6sRZL6Mozx/f1b6zbJWqJnlWWUtsG2t8/qfOCRSjrHqRBr?=
 =?us-ascii?Q?7qN+2a/Xmh2oO3DgSeEvNXVRuwcgbF5d5dyYHkEN8KwMafD9W2mhIb45PB2I?=
 =?us-ascii?Q?zDXt3OkbM9Muis1e5FFVMmzyTCTdU7ojV5jrzfM5JxHGHVkyq9IGfaFVZJjX?=
 =?us-ascii?Q?fp2yZXkNzlKaKjKC4fnEWhC+3y6lfxrzbhhtup2+RLM3AOaIzNf79PRV7E9C?=
 =?us-ascii?Q?8+Cca6WG+m5SLR39nXVqrVy3WIdg/ovMddO+3gyEu5rQprOO45urfDCU1c+0?=
 =?us-ascii?Q?pSVWqaSx00yc9GjFbvP07ldneIYWXtHl4vo2hVyUW3Nj70zcngPeJ7wLFGZP?=
 =?us-ascii?Q?vb4o6ovbySKwrZ3kYtmDVt6L75diXYq7F+tGsLrgyZplHyoFBkybZ3zw/TM/?=
 =?us-ascii?Q?47IqlR9Yp5xL34hY1Vfx6C9+ICRq0xYw8EpPfurMmSqAgeMRCbIIKZ2gMGyi?=
 =?us-ascii?Q?V4LqsvTYAIK77iTwnlPQiBoIebpBNdaqNh3MuZeP6wrBcRXl1rqr7oezHM7j?=
 =?us-ascii?Q?96djKLlUBUCdylhsliqoyoDpkLMqNHF3rnuQWXp2XUa9EO+8+Y1V3ZhxtXp2?=
 =?us-ascii?Q?bJvdzBjVArmU+eIweWAjKKA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c643f719-dba4-44f4-1258-08db8f3377d6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 06:25:42.1763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CRU3E0ZvqAy6/ATgHJAM019wj8s6nPhlZDvd98Zwk1Qc0pT1qahGyE3XoohnbvYrVGhEUIWX2A4NDCYjcvb3EF6f6iKf1WjDLrg4uxBPZFx0yL+ey1yxCBkXugMAHvrE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7265
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V9 6/6] drm/xe: Add min/max cap for engine
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jul 27, 2023 at 10:54:42PM -0700, Upadhyay, Tejas wrote:
>
>
>> -----Original Message-----
>> From: Brost, Matthew <matthew.brost@intel.com>
>> Sent: Friday, July 28, 2023 10:35 AM
>> To: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
>> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Subject: Re: [PATCH V9 6/6] drm/xe: Add min/max cap for engine scheduler
>> properties
>>
>> On Thu, Jul 27, 2023 at 09:44:23PM -0700, Niranjana Vishwanathapura
>> wrote:
>> > On Thu, Jul 27, 2023 at 03:26:49PM +0000, Matthew Brost wrote:
>> > > On Thu, Jul 27, 2023 at 01:52:35PM +0530, Tejas Upadhyay wrote:
>> > > > Add sysfs entries for the min, max, and defaults for each of
>> > > > engine scheduler controls for every hardware engine class.
>> > > >
>> > > > Non-elevated user IOCTLs to set these controls must be within the
>> > > > min-max ranges of the sysfs entries, elevated user can set these
>> > > > controls to any value. However, introduced compile time CONFIG
>> > > > min-max values which restricts elevated user to be in compile time
>> > > > min-max range if at all sysfs min/max are violated.
>> > > >
>> > > > Sysfs entries examples are,
>> > > > DUT# cat /sys/class/drm/cardX/device/tileN/gtN/engines/ccs/.defaults/
>> > > > job_timeout_max         job_timeout_ms          preempt_timeout_min
>> timeslice_duration_max  timeslice_duration_us
>> > > > job_timeout_min         preempt_timeout_max     preempt_timeout_us
>> timeslice_duration_min
>> > > >
>> > > > DUT# cat /sys/class/drm/card1/device/tileN/gtN/engines/ccs/
>> > > > .defaults/              job_timeout_min         preempt_timeout_max
>> preempt_timeout_us      timeslice_duration_min
>> > > > job_timeout_max         job_timeout_ms          preempt_timeout_min
>> timeslice_duration_max  timeslice_duration_us
>> > > >
>> > > > V9 :
>> > > >    - Rebase to use s/xe_engine/xe_hw_engine/ - Matt
>> > > > V8 :
>> > > >    - fix enforce_sched_limit and avoid code duplication - Niranjana
>> > > >    - Make sure min < max - Niranjana
>> > > > V7 :
>> > > >    - Rebase to replace hw engine with eclass interface
>> > > >    - return EINVAL in place of EPERM
>> > > >    - Use some APIs to avoid code duplication
>> > > > V6 :
>> > > >    - Rebase changes to reflect per engine class props interface - MattB
>> > > >    - Use #if ENABLED - MattB
>> > > >    - Remove MAX_SCHED_TIMEOUT check as range validation is enough
>> > > > V5 :
>> > > >    - Rebase to resolve conflicts - CI
>> > > > V4 :
>> > > >    - Rebase
>> > > >    - Update commit to reflect tile addition
>> > > >    - Use XE_HW macro directly as they are already filtered
>> > > >      for CONFIG checks - Niranjana
>> > > >    - Add CONFIG for enable/disable min/max limitation
>> > > >      on elevated user. Default is enable - Matt/Joonas
>> > > > V3 :
>> > > >    - Resolve CI hooks warning for kernel-doc
>> > > > V2 :
>> > > >    - Restric min/max setting to #define default min/max for
>> > > >      elevated user - Himal
>> > > >    - Remove unrelated changes from patch - Niranjana
>> > > >
>> > > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> > > > ---
>> > > >  drivers/gpu/drm/xe/Kconfig                    |   6 +
>> > > >  drivers/gpu/drm/xe/Kconfig.profile            |  46 +++
>> > > >  drivers/gpu/drm/xe/xe_engine.c                |  25 +-
>> > > >  drivers/gpu/drm/xe/xe_hw_engine.c             |   8 +
>> > > >  drivers/gpu/drm/xe/xe_hw_engine.h             |  31 ++
>> > > >  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 354
>> ++++++++++++++++++
>> > > >  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h |   2 +
>> > > >  7 files changed, 466 insertions(+), 6 deletions(-)  create mode
>> > > > 100644 drivers/gpu/drm/xe/Kconfig.profile
>> > > >
>> > > > diff --git a/drivers/gpu/drm/xe/Kconfig
>> > > > b/drivers/gpu/drm/xe/Kconfig index d44794f99338..0a4ea965645b
>> > > > 100644
>> > > > --- a/drivers/gpu/drm/xe/Kconfig
>> > > > +++ b/drivers/gpu/drm/xe/Kconfig
>> > > > @@ -83,3 +83,9 @@ depends on DRM_XE  depends on EXPERT  source
>> > > > "drivers/gpu/drm/xe/Kconfig.debug"
>> > > >  endmenu
>> > > > +
>> > > > +menu "drm/xe Profile Guided Optimisation"
>> > > > +	visible if EXPERT
>> > > > +	depends on DRM_XE
>> > > > +	source "drivers/gpu/drm/xe/Kconfig.profile"
>> > > > +endmenu
>> > > > diff --git a/drivers/gpu/drm/xe/Kconfig.profile
>> > > > b/drivers/gpu/drm/xe/Kconfig.profile
>> > > > new file mode 100644
>> > > > index 000000000000..e72f15ec4bf6
>> > > > --- /dev/null
>> > > > +++ b/drivers/gpu/drm/xe/Kconfig.profile
>> > > > @@ -0,0 +1,46 @@
>> > > > +config DRM_XE_JOB_TIMEOUT_MAX
>> > > > +       int "Default max job timeout (ms)"
>> > > > +       default 10000 # milliseconds
>> > > > +       help
>> > > > +         Configures the default max job timeout after which job will
>> > > > +         be forcefully taken away from scheduler.
>> > > > +config DRM_XE_JOB_TIMEOUT_MIN
>> > > > +       int "Default max job timeout (ms)"
>> > > > +       default 1 # milliseconds
>> > > > +       help
>> > > > +         Configures the default min job timeout after which job will
>> > > > +         be forcefully taken away from scheduler.
>> > > > +config DRM_XE_TIMESLICE_MAX
>> > > > +       int "Default max timeslice duration (us)"
>> > > > +       default 10000000 # microseconds
>> > > > +       help
>> > > > +         Configures the default max timeslice duration between multiple
>> > > > +         contexts by guc scheduling.
>> > > > +config DRM_XE_TIMESLICE_MIN
>> > > > +       int "Default min timeslice duration (us)"
>> > > > +       default 1 # microseconds
>> > > > +       help
>> > > > +         Configures the default min timeslice duration between multiple
>> > > > +         contexts by guc scheduling.
>> > > > +config DRM_XE_PREEMPT_TIMEOUT_MAX
>> > > > +       int "Default max  preempt timeout (us)"
>> > > > +       default 10000000 # microseconds
>> > > > +       help
>> > > > +         Configures the default max preempt timeout after which context
>> > > > +         will be forcefully taken away and higher priority context will
>> > > > +         run.
>> > > > +config DRM_XE_PREEMPT_TIMEOUT_MIN
>> > > > +       int "Default min  preempt timeout (us)"
>> > > > +       default 1 # microseconds
>> > > > +       help
>> > > > +         Configures the default min preempt timeout after which context
>> > > > +         will be forcefully taken away and higher priority context will
>> > > > +         run.
>> > > > +config DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
>> > > > +       bool "Default configuration of limitation on scheduler timeout"
>> > > > +       default y
>> > > > +       help
>> > > > +	 Configures the enablement of limitation on scheduler timeout
>> > > > +	 to apply to applicable user. For elevated user, all above MIN
>> > > > +	 and MAX values will apply when this configuration is enable to
>> > > > +	 apply limitation. By default limitation is applied.
>> > > > diff --git a/drivers/gpu/drm/xe/xe_engine.c
>> > > > b/drivers/gpu/drm/xe/xe_engine.c index 9e167b113963..d934196eb79f
>> > > > 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_engine.c
>> > > > +++ b/drivers/gpu/drm/xe/xe_engine.c
>> > > > @@ -13,6 +13,7 @@
>> > > >
>> > > >  #include "xe_device.h"
>> > > >  #include "xe_gt.h"
>> > > > +#include "xe_hw_engine_class_sysfs.h"
>> > > >  #include "xe_hw_fence.h"
>> > > >  #include "xe_lrc.h"
>> > > >  #include "xe_macros.h"
>> > > > @@ -191,8 +192,12 @@ static int engine_set_priority(struct
>> > > > xe_device *xe, struct xe_engine *e,  static int
>> engine_set_timeslice(struct xe_device *xe, struct xe_engine *e,
>> > > >  				u64 value, bool create)
>> > > >  {
>> > > > -	if (!capable(CAP_SYS_NICE))
>> > > > -		return -EPERM;
>> > > > +	u32 min = e->hwe->eclass->sched_props.timeslice_min;
>> > > > +	u32 max = e->hwe->eclass->sched_props.timeslice_max;
>> > >
>> > > So I screwed this up in my last comment, sorry.
>> > >
>> > > min = cap_nice ? KConfig option for min :
>> > > e->hwe->eclass->sched_props.timeslice_min;
>> > > same logic for max;
>> > >
>> > > Probably add helper for this.
>> > >
>> > > > +
>> > > > +	if (enforce_schedule_limit() &&
>> > > > +	    !engine_timeout_in_range(value, min, max))
>> > >
>> > > Then I think logic works too...
>> > >
>> > > if cap nice && !Kconfig option to enfore limits (enforce_schedule_limit
>> returns false):
>> > > 	user can do whatever
>> > > else if cap nice
>> > > 	user within Kconfig range
>> > > else
>> > > 	user within sysfs range
>> > >
>> > > This is what we want in the end.
>> > >
>> >
>> > Matt, I think this is exactly what the previous revision of the patch was
>> doing.
>> >
>>
>> No... Previous version
>>
>> min = Kconfig option to enfore limits ? KConfig option for min : e->hwe-
>> >eclass->sched_props.timeslice_min
>> same for max
>>
>> Results in:
>>
>> if cap nice && !Kconfig option to enfore limits (enforce_schedule_limit
>> returns false):
>> 	user can do whatever
>> else if cap_nice || Kconfig option to enfore limit
>> 	user within Kconfig range
>> else
>>  	user within sysfs range
>>
>> !cap_nice && Kconfig option to enfore limits == user within Kconfig range
>> (previously) !cap_nice && Kconfig option to enfore limits == user within sysfs
>> range (my suggestion)
>
>In previous version we can achieve it by just adding one below check right?
>#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT) && cap_nice
>+       u32 min = XE_HW_ENGINE_TIMESLICE_MIN;
>+       u32 max = XE_HW_ENGINE_TIMESLICE_MAX;
>+#else
>+       u32 min = e->hwe->eclass->sched_props.timeslice_min;
>+       u32 max = e->hwe->eclass->sched_props.timeslice_max;
>+#endif
>
>Please let me know!
>

Ah I see. Yah, it is a limits selection issue.
We can do,

u32 min = e->hwe->eclass->sched_props.timeslice_min;
u32 max = e->hwe->eclass->sched_props.timeslice_max;

#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
         if (cap_nice) {
                 u32 min = XE_HW_ENGINE_TIMESLICE_MIN;
                 u32 max = XE_HW_ENGINE_TIMESLICE_MAX;
         }
#endif

Matt, Tejas
Also, looks like you missed my another comment below.

Niranjana

>>
>> The logic is different and I believe we want what I'm suggesting.
>>
>> Matt
>>
>> > > > +		return -EINVAL;
>> > > >
>> > > >  	return e->ops->set_timeslice(e, value);  } @@ -201,8 +206,12 @@
>> > > > static int engine_set_preemption_timeout(struct xe_device *xe,
>> > > >  					 struct xe_engine *e, u64 value,
>> > > >  					 bool create)
>> > > >  {
>> > > > -	if (!capable(CAP_SYS_NICE))
>> > > > -		return -EPERM;
>> > > > +	u32 min = e->hwe->eclass->sched_props.preempt_timeout_min;
>> > > > +	u32 max = e->hwe->eclass->sched_props.preempt_timeout_max;
>> > > > +
>> > > > +	if (enforce_schedule_limit() &&
>> > > > +	    !engine_timeout_in_range(value, min, max))
>> > > > +		return -EINVAL;
>> > > >
>> > > >  	return e->ops->set_preempt_timeout(e, value);  } @@ -266,11
>> > > > +275,15 @@ static int engine_set_persistence(struct xe_device *xe,
>> > > > struct xe_engine *e,  static int engine_set_job_timeout(struct xe_device
>> *xe, struct xe_engine *e,
>> > > >  				  u64 value, bool create)
>> > > >  {
>> > > > +	u32 min = e->hwe->eclass->sched_props.job_timeout_min;
>> > > > +	u32 max = e->hwe->eclass->sched_props.job_timeout_max;
>> > > > +
>> > > >  	if (XE_IOCTL_DBG(xe, !create))
>> > > >  		return -EINVAL;
>> > > >
>> > > > -	if (!capable(CAP_SYS_NICE))
>> > > > -		return -EPERM;
>> > > > +	if (enforce_schedule_limit() &&
>> > > > +	    !engine_timeout_in_range(value, min, max))
>> > > > +		return -EINVAL;
>> > > >
>> > > >  	return e->ops->set_job_timeout(e, value);  } diff --git
>> > > > a/drivers/gpu/drm/xe/xe_hw_engine.c
>> > > > b/drivers/gpu/drm/xe/xe_hw_engine.c
>> > > > index afa7d25c3852..e601bffe3b13 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> > > > @@ -364,8 +364,16 @@ static void hw_engine_init_early(struct xe_gt
>> > > > *gt, struct xe_hw_engine *hwe,
>> > > >
>> > > >  	if (!gt->eclass[hwe->class].sched_props.job_timeout_ms) {
>> > > >  		gt->eclass[hwe->class].sched_props.job_timeout_ms = HZ *
>> 5;
>> > > > +		gt->eclass[hwe->class].sched_props.job_timeout_min =
>> XE_HW_ENGINE_JOB_TIMEOUT_MIN;
>> > > > +		gt->eclass[hwe->class].sched_props.job_timeout_max =
>> > > > +XE_HW_ENGINE_JOB_TIMEOUT_MAX;
>> > > >  		gt->eclass[hwe->class].sched_props.timeslice_us = 1 * 1000;
>> > > > +		gt->eclass[hwe->class].sched_props.timeslice_min =
>> XE_HW_ENGINE_TIMESLICE_MIN;
>> > > > +		gt->eclass[hwe->class].sched_props.timeslice_max =
>> > > > +XE_HW_ENGINE_TIMESLICE_MAX;
>> > > >  		gt->eclass[hwe->class].sched_props.preempt_timeout_us =
>> 640 *
>> > > > 1000;
>> > > > +		gt->eclass[hwe->class].sched_props.preempt_timeout_min =
>> > > > +
>> 	XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
>> > > > +		gt->eclass[hwe->class].sched_props.preempt_timeout_max =
>> > > > +
>> 	XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
>> > > >  		/* Record default props */
>> > > >  		gt->eclass[hwe->class].defaults = gt->eclass[hwe-
>> >class].sched_props;
>> > > >  	}
>> > > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h
>> > > > b/drivers/gpu/drm/xe/xe_hw_engine.h
>> > > > index 7eca9d53c7b1..3d37d6d44261 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_hw_engine.h
>> > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
>> > > > @@ -10,6 +10,37 @@
>> > > >
>> > > >  struct drm_printer;
>> > > >
>> > > > +#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN #define
>> > > > +XE_HW_ENGINE_JOB_TIMEOUT_MIN
>> CONFIG_DRM_XE_JOB_TIMEOUT_MIN #else
>> > > > +#define XE_HW_ENGINE_JOB_TIMEOUT_MIN 1 #endif #ifdef
>> > > > +CONFIG_DRM_XE_JOB_TIMEOUT_MAX #define
>> > > > +XE_HW_ENGINE_JOB_TIMEOUT_MAX
>> CONFIG_DRM_XE_JOB_TIMEOUT_MAX #else
>> > > > +#define XE_HW_ENGINE_JOB_TIMEOUT_MAX (10 * 1000) #endif #ifdef
>> > > > +CONFIG_DRM_XE_TIMESLICE_MIN #define
>> XE_HW_ENGINE_TIMESLICE_MIN
>> > > > +CONFIG_DRM_XE_TIMESLICE_MIN #else #define
>> > > > +XE_HW_ENGINE_TIMESLICE_MIN 1 #endif #ifdef
>> > > > +CONFIG_DRM_XE_TIMESLICE_MAX #define
>> XE_HW_ENGINE_TIMESLICE_MAX
>> > > > +CONFIG_DRM_XE_TIMESLICE_MAX #else #define
>> > > > +XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000) #endif #ifdef
>> > > > +CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN
>> > > > +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN
>> > > > +CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN #else #define
>> > > > +XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 1 #endif #ifdef
>> > > > +CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
>> > > > +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX
>> > > > +CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX #else #define
>> > > > +XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX (10 * 1000 * 1000) #endif
>> > > > +
>> > > >  int xe_hw_engines_init_early(struct xe_gt *gt);  int
>> > > > xe_hw_engines_init(struct xe_gt *gt);  void
>> > > > xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
>> > > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>> > > > b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>> > > > index 990bb675d1e0..2b7ac4e02db6 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>> > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>> > > > @@ -11,6 +11,20 @@
>> > > >
>> > > >  static int xe_add_hw_engine_class_defaults(struct kobject
>> > > > *parent);
>> > > >
>> > > > +bool enforce_schedule_limit(void) { #if
>> > > > +IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
>> > > > +	return true;
>> > > > +#else
>> > > > +	return !capable(CAP_SYS_NICE);
>> > > > +#endif
>> > > > +}
>> > > > +
>> > > > +bool engine_timeout_in_range(u64 timeout, u64 min, u64 max) {
>> > > > +	return timeout >= min && timeout <= max; }
>> > > > +
>> > > >  static void kobj_xe_hw_engine_release(struct kobject *kobj)  {
>> > > >  	kfree(kobj);
>> > > > @@ -39,11 +53,92 @@ kobj_xe_hw_engine_class(struct kobject
>> *parent, char *name)
>> > > >  	return keclass;
>> > > >  }
>> > > >
>> > > > +static ssize_t job_timeout_max_store(struct kobject *kobj,
>> > > > +				     struct kobj_attribute *attr,
>> > > > +				     const char *buf, size_t count) {
>> > > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>> > > > +	u32 timeout;
>> > > > +	int err;
>> > > > +
>> > > > +	err = kstrtou32(buf, 0, &timeout);
>> > > > +	if (err)
>> > > > +		return err;
>> > > > +
>> > > > +	if (timeout < eclass->sched_props.job_timeout_min)
>> > > > +		return -EINVAL;
>> > > > +
>> > > > +	if (enforce_schedule_limit() &&
>> > > > +	    !engine_timeout_in_range(timeout,
>> > > > +				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
>> > > > +				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
>> > > > +		return -EINVAL;
>> > > > +
>> > > > +	WRITE_ONCE(eclass->sched_props.job_timeout_max, timeout);
>> > > > +
>> > > > +	return count;
>> > > > +}
>> > > > +
>> > > > +static ssize_t job_timeout_max_show(struct kobject *kobj,
>> > > > +				    struct kobj_attribute *attr, char *buf) {
>> > > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>> > > > +
>> > > > +	return sprintf(buf, "%u\n",
>> > > > +eclass->sched_props.job_timeout_max);
>> > > > +}
>> > > > +
>> > > > +static struct kobj_attribute job_timeout_max_attr =
>> > > > +__ATTR(job_timeout_max, 0644, job_timeout_max_show,
>> > > > +job_timeout_max_store);
>> > > > +
>> > > > +static ssize_t job_timeout_min_store(struct kobject *kobj,
>> > > > +				     struct kobj_attribute *attr,
>> > > > +				     const char *buf, size_t count) {
>> > > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>> > > > +	u32 timeout;
>> > > > +	int err;
>> > > > +
>> > > > +	err = kstrtou32(buf, 0, &timeout);
>> > > > +	if (err)
>> > > > +		return err;
>> > > > +
>> > > > +	if (timeout > eclass->sched_props.job_timeout_max)
>> > > > +		return -EINVAL;
>> > > > +
>> > > > +	if (enforce_schedule_limit() &&
>> > > > +	    !engine_timeout_in_range(timeout,
>> > > > +				     XE_HW_ENGINE_JOB_TIMEOUT_MIN,
>> > > > +				     XE_HW_ENGINE_JOB_TIMEOUT_MAX))
>> > > > +		return -EINVAL;
>> > > > +
>> > > > +	WRITE_ONCE(eclass->sched_props.job_timeout_min, timeout);
>> > > > +
>> > > > +	return count;
>> > > > +}
>> > > > +
>> > > > +static ssize_t job_timeout_min_show(struct kobject *kobj,
>> > > > +				    struct kobj_attribute *attr, char *buf) {
>> > > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>> > > > +
>> > > > +	return sprintf(buf, "%u\n",
>> > > > +eclass->sched_props.job_timeout_min);
>> > > > +}
>> > > > +
>> > > > +static struct kobj_attribute job_timeout_min_attr =
>> > > > +__ATTR(job_timeout_min, 0644, job_timeout_min_show,
>> > > > +job_timeout_min_store);
>> > > > +
>> > > >  static ssize_t job_timeout_store(struct kobject *kobj,
>> > > >  				 struct kobj_attribute *attr,
>> > > >  				 const char *buf, size_t count)  {
>> > > >  	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>> > > > +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
>> > > > +	u32 min = XE_HW_ENGINE_JOB_TIMEOUT_MIN;
>> > > > +	u32 max = XE_HW_ENGINE_JOB_TIMEOUT_MAX; #else
>> > > > +	u32 min = e->hwe->eclass->sched_props.job_timeout_min;
>> > > > +	u32 max = e->hwe->eclass->sched_props.job_timeout_max;
>> > > > +#endif
>> > >
>> > > I don't think we need this, just make sure default is within min /
>> > > max of the sched_props.
>> > >
>> >
>> > Shouldn't the sched_prop set through sysfs here which applies to all
>> > future user engines (xe_engine) has the same requirement as the
>> > sched_prop set directly to user engine (xe_engine) through set_properly
>> ioctl?
>> > ie., shoudln't the requirement be same in job_timeout_store() and
>> > engine_set_job_timeout()?
>> >
>> > Niranjana
>> >
>> > > Matt
>> > >
>> > > >  	u32 timeout;
>> > > >  	int err;
>> > > >
>> > > > @@ -51,6 +146,10 @@ static ssize_t job_timeout_store(struct kobject
>> *kobj,
>> > > >  	if (err)
>> > > >  		return err;
>> > > >
>> > > > +	if (enforce_schedule_limit() &&
>> > > > +	    !engine_timeout_in_range(timeout, min, max))
>> > > > +		return -EINVAL;
>> > > > +
>> > > >  	WRITE_ONCE(eclass->sched_props.job_timeout_ms, timeout);
>> > > >
>> > > >  	return count;
>> > > > @@ -78,11 +177,40 @@ static ssize_t job_timeout_default(struct
>> > > > kobject *kobj,  static struct kobj_attribute job_timeout_def =
>> > > > __ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
>> > > >
>> > > > +static ssize_t job_timeout_min_default(struct kobject *kobj,
>> > > > +				       struct kobj_attribute *attr, char *buf) {
>> > > > +	struct xe_hw_engine_class_intf *eclass =
>> > > > +kobj_to_eclass(kobj->parent);
>> > > > +
>> > > > +	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_min);
>> > > > +}
>> > > > +
>> > > > +static struct kobj_attribute job_timeout_min_def =
>> > > > +__ATTR(job_timeout_min, 0444, job_timeout_min_default, NULL);
>> > > > +
>> > > > +static ssize_t job_timeout_max_default(struct kobject *kobj,
>> > > > +				       struct kobj_attribute *attr, char *buf) {
>> > > > +	struct xe_hw_engine_class_intf *eclass =
>> > > > +kobj_to_eclass(kobj->parent);
>> > > > +
>> > > > +	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_max);
>> > > > +}
>> > > > +
>> > > > +static struct kobj_attribute job_timeout_max_def =
>> > > > +__ATTR(job_timeout_max, 0444, job_timeout_max_default, NULL);
>> > > > +
>> > > >  static ssize_t timeslice_duration_store(struct kobject *kobj,
>> > > >  					struct kobj_attribute *attr,
>> > > >  					const char *buf, size_t count)  {
>> > > >  	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>> > > > +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
>> > > > +	u32 min = XE_HW_ENGINE_TIMESLICE_MIN;
>> > > > +	u32 max = XE_HW_ENGINE_TIMESLICE_MAX; #else
>> > > > +	u32 min = e->hwe->eclass->sched_props.timeslice_min;
>> > > > +	u32 max = e->hwe->eclass->sched_props.timeslice_max;
>> > > > +#endif
>> > > >  	u32 duration;
>> > > >  	int err;
>> > > >
>> > > > @@ -90,11 +218,92 @@ static ssize_t timeslice_duration_store(struct
>> kobject *kobj,
>> > > >  	if (err)
>> > > >  		return err;
>> > > >
>> > > > +	if (enforce_schedule_limit() &&
>> > > > +	    !engine_timeout_in_range(duration, min, max))
>> > > > +		return -EINVAL;
>> > > > +
>> > > >  	WRITE_ONCE(eclass->sched_props.timeslice_us, duration);
>> > > >
>> > > >  	return count;
>> > > >  }
>> > > >
>> > > > +static ssize_t timeslice_duration_max_store(struct kobject *kobj,
>> > > > +					    struct kobj_attribute *attr,
>> > > > +					    const char *buf, size_t count) {
>> > > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>> > > > +	u32 duration;
>> > > > +	int err;
>> > > > +
>> > > > +	err = kstrtou32(buf, 0, &duration);
>> > > > +	if (err)
>> > > > +		return err;
>> > > > +
>> > > > +	if (duration < eclass->sched_props.timeslice_min)
>> > > > +		return -EINVAL;
>> > > > +
>> > > > +	if (enforce_schedule_limit() &&
>> > > > +	    !engine_timeout_in_range(duration,
>> > > > +				     XE_HW_ENGINE_TIMESLICE_MIN,
>> > > > +				     XE_HW_ENGINE_TIMESLICE_MAX))
>> > > > +		return -EINVAL;
>> > > > +
>> > > > +	WRITE_ONCE(eclass->sched_props.timeslice_max, duration);
>> > > > +
>> > > > +	return count;
>> > > > +}
>> > > > +
>> > > > +static ssize_t timeslice_duration_max_show(struct kobject *kobj,
>> > > > +					   struct kobj_attribute *attr,
>> > > > +					   char *buf)
>> > > > +{
>> > > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>> > > > +
>> > > > +	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_max);
>> > > > +}
>> > > > +
>> > > > +static struct kobj_attribute timeslice_duration_max_attr =
>> > > > +	__ATTR(timeslice_duration_max, 0644,
>> timeslice_duration_max_show,
>> > > > +	       timeslice_duration_max_store);
>> > > > +
>> > > > +static ssize_t timeslice_duration_min_store(struct kobject *kobj,
>> > > > +					    struct kobj_attribute *attr,
>> > > > +					    const char *buf, size_t count) {
>> > > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>> > > > +	u32 duration;
>> > > > +	int err;
>> > > > +
>> > > > +	err = kstrtou32(buf, 0, &duration);
>> > > > +	if (err)
>> > > > +		return err;
>> > > > +
>> > > > +	if (duration > eclass->sched_props.timeslice_max)
>> > > > +		return -EINVAL;
>> > > > +
>> > > > +	if (enforce_schedule_limit() &&
>> > > > +	    !engine_timeout_in_range(duration,
>> > > > +				     XE_HW_ENGINE_TIMESLICE_MIN,
>> > > > +				     XE_HW_ENGINE_TIMESLICE_MAX))
>> > > > +		return -EINVAL;
>> > > > +
>> > > > +	WRITE_ONCE(eclass->sched_props.timeslice_min, duration);
>> > > > +
>> > > > +	return count;
>> > > > +}
>> > > > +
>> > > > +static ssize_t timeslice_duration_min_show(struct kobject *kobj,
>> > > > +					   struct kobj_attribute *attr, char
>> *buf) {
>> > > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>> > > > +
>> > > > +	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_min);
>> > > > +}
>> > > > +
>> > > > +static struct kobj_attribute timeslice_duration_min_attr =
>> > > > +	__ATTR(timeslice_duration_min, 0644,
>> timeslice_duration_min_show,
>> > > > +	       timeslice_duration_min_store);
>> > > > +
>> > > >  static ssize_t timeslice_duration_show(struct kobject *kobj,
>> > > >  		struct kobj_attribute *attr, char *buf)  { @@ -118,11 +327,40
>> > > > @@ static ssize_t timeslice_default(struct kobject *kobj,  static
>> > > > struct kobj_attribute timeslice_duration_def =
>> > > > __ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
>> > > >
>> > > > +static ssize_t timeslice_min_default(struct kobject *kobj,
>> > > > +				     struct kobj_attribute *attr, char *buf) {
>> > > > +	struct xe_hw_engine_class_intf *eclass =
>> > > > +kobj_to_eclass(kobj->parent);
>> > > > +
>> > > > +	return sprintf(buf, "%u\n", eclass->defaults.timeslice_min); }
>> > > > +
>> > > > +static struct kobj_attribute timeslice_duration_min_def =
>> > > > +__ATTR(timeslice_duration_min, 0444, timeslice_min_default,
>> > > > +NULL);
>> > > > +
>> > > > +static ssize_t timeslice_max_default(struct kobject *kobj,
>> > > > +				     struct kobj_attribute *attr, char *buf) {
>> > > > +	struct xe_hw_engine_class_intf *eclass =
>> > > > +kobj_to_eclass(kobj->parent);
>> > > > +
>> > > > +	return sprintf(buf, "%u\n", eclass->defaults.timeslice_max); }
>> > > > +
>> > > > +static struct kobj_attribute timeslice_duration_max_def =
>> > > > +__ATTR(timeslice_duration_max, 0444, timeslice_max_default,
>> > > > +NULL);
>> > > > +
>> > > >  static ssize_t preempt_timeout_store(struct kobject *kobj,
>> > > >  				     struct kobj_attribute *attr,
>> > > >  				     const char *buf, size_t count)  {
>> > > >  	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>> > > > +#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
>> > > > +	u32 min = XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
>> > > > +	u32 max = XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX; #else
>> > > > +	u32 min = e->hwe->eclass->sched_props.preempt_timeout_min;
>> > > > +	u32 max = e->hwe->eclass->sched_props.preempt_timeout_max;
>> > > > +#endif
>> > > >  	u32 timeout;
>> > > >  	int err;
>> > > >
>> > > > @@ -130,6 +368,10 @@ static ssize_t preempt_timeout_store(struct
>> kobject *kobj,
>> > > >  	if (err)
>> > > >  		return err;
>> > > >
>> > > > +	if (enforce_schedule_limit() &&
>> > > > +	    !engine_timeout_in_range(timeout, min, max))
>> > > > +		return -EINVAL;
>> > > > +
>> > > >  	WRITE_ONCE(eclass->sched_props.preempt_timeout_us, timeout);
>> > > >
>> > > >  	return count;
>> > > > @@ -158,17 +400,129 @@ static ssize_t
>> > > > preempt_timeout_default(struct kobject *kobj,  static struct
>> > > > kobj_attribute preempt_timeout_def =  __ATTR(preempt_timeout_us,
>> > > > 0444, preempt_timeout_default, NULL);
>> > > >
>> > > > +static ssize_t preempt_timeout_min_default(struct kobject *kobj,
>> > > > +					   struct kobj_attribute *attr,
>> > > > +					   char *buf)
>> > > > +{
>> > > > +	struct xe_hw_engine_class_intf *eclass =
>> > > > +kobj_to_eclass(kobj->parent);
>> > > > +
>> > > > +	return sprintf(buf, "%u\n",
>> > > > +eclass->defaults.preempt_timeout_min);
>> > > > +}
>> > > > +
>> > > > +static struct kobj_attribute preempt_timeout_min_def =
>> > > > +__ATTR(preempt_timeout_min, 0444, preempt_timeout_min_default,
>> > > > +NULL);
>> > > > +
>> > > > +static ssize_t preempt_timeout_max_default(struct kobject *kobj,
>> > > > +					   struct kobj_attribute *attr,
>> > > > +					   char *buf)
>> > > > +{
>> > > > +	struct xe_hw_engine_class_intf *eclass =
>> > > > +kobj_to_eclass(kobj->parent);
>> > > > +
>> > > > +	return sprintf(buf, "%u\n",
>> > > > +eclass->defaults.preempt_timeout_max);
>> > > > +}
>> > > > +
>> > > > +static struct kobj_attribute preempt_timeout_max_def =
>> > > > +__ATTR(preempt_timeout_max, 0444,
>> preempt_timeout_max_default,
>> > > > +NULL);
>> > > > +
>> > > > +static ssize_t preempt_timeout_max_store(struct kobject *kobj,
>> > > > +					 struct kobj_attribute *attr,
>> > > > +					 const char *buf, size_t count) {
>> > > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>> > > > +	u32 timeout;
>> > > > +	int err;
>> > > > +
>> > > > +	err = kstrtou32(buf, 0, &timeout);
>> > > > +	if (err)
>> > > > +		return err;
>> > > > +
>> > > > +	if (timeout < eclass->sched_props.preempt_timeout_min)
>> > > > +		return -EINVAL;
>> > > > +
>> > > > +	if (enforce_schedule_limit() &&
>> > > > +	    !engine_timeout_in_range(timeout,
>> > > > +
>> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
>> > > > +
>> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
>> > > > +		return -EINVAL;
>> > > > +
>> > > > +	WRITE_ONCE(eclass->sched_props.preempt_timeout_max, timeout);
>> > > > +
>> > > > +	return count;
>> > > > +}
>> > > > +
>> > > > +static ssize_t preempt_timeout_max_show(struct kobject *kobj,
>> > > > +					struct kobj_attribute *attr, char *buf)
>> {
>> > > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>> > > > +
>> > > > +	return sprintf(buf, "%u\n",
>> > > > +eclass->sched_props.preempt_timeout_max);
>> > > > +}
>> > > > +
>> > > > +static struct kobj_attribute preempt_timeout_max_attr =
>> > > > +	__ATTR(preempt_timeout_max, 0644, preempt_timeout_max_show,
>> > > > +	       preempt_timeout_max_store);
>> > > > +
>> > > > +static ssize_t preempt_timeout_min_store(struct kobject *kobj,
>> > > > +					 struct kobj_attribute *attr,
>> > > > +					 const char *buf, size_t count) {
>> > > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>> > > > +	u32 timeout;
>> > > > +	int err;
>> > > > +
>> > > > +	err = kstrtou32(buf, 0, &timeout);
>> > > > +	if (err)
>> > > > +		return err;
>> > > > +
>> > > > +	if (timeout > eclass->sched_props.preempt_timeout_max)
>> > > > +		return -EINVAL;
>> > > > +
>> > > > +	if (enforce_schedule_limit() &&
>> > > > +	    !engine_timeout_in_range(timeout,
>> > > > +
>> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
>> > > > +
>> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
>> > > > +		return -EINVAL;
>> > > > +
>> > > > +	WRITE_ONCE(eclass->sched_props.preempt_timeout_min, timeout);
>> > > > +
>> > > > +	return count;
>> > > > +}
>> > > > +
>> > > > +static ssize_t preempt_timeout_min_show(struct kobject *kobj,
>> > > > +					struct kobj_attribute *attr, char *buf)
>> {
>> > > > +	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj);
>> > > > +
>> > > > +	return sprintf(buf, "%u\n",
>> > > > +eclass->sched_props.preempt_timeout_min);
>> > > > +}
>> > > > +
>> > > > +static struct kobj_attribute preempt_timeout_min_attr =
>> > > > +	__ATTR(preempt_timeout_min, 0644, preempt_timeout_min_show,
>> > > > +	       preempt_timeout_min_store);
>> > > > +
>> > > >  static const struct attribute *defaults[] = {
>> > > >  	&job_timeout_def.attr,
>> > > > +	&job_timeout_min_def.attr,
>> > > > +	&job_timeout_max_def.attr,
>> > > >  	&timeslice_duration_def.attr,
>> > > > +	&timeslice_duration_min_def.attr,
>> > > > +	&timeslice_duration_max_def.attr,
>> > > >  	&preempt_timeout_def.attr,
>> > > > +	&preempt_timeout_min_def.attr,
>> > > > +	&preempt_timeout_max_def.attr,
>> > > >  	NULL
>> > > >  };
>> > > >
>> > > >  static const struct attribute *files[] = {
>> > > >  	&job_timeout_attr.attr,
>> > > > +	&job_timeout_min_attr.attr,
>> > > > +	&job_timeout_max_attr.attr,
>> > > >  	&timeslice_duration_attr.attr,
>> > > > +	&timeslice_duration_min_attr.attr,
>> > > > +	&timeslice_duration_max_attr.attr,
>> > > >  	&preempt_timeout_attr.attr,
>> > > > +	&preempt_timeout_min_attr.attr,
>> > > > +	&preempt_timeout_max_attr.attr,
>> > > >  	NULL
>> > > >  };
>> > > >
>> > > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
>> > > > b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
>> > > > index 757136614672..2e2ab351a991 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
>> > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
>> > > > @@ -10,6 +10,8 @@
>> > > >
>> > > >  #define MAX_ENGINE_CLASS_NAME_LEN    16
>> > > >  int xe_hw_engine_class_sysfs_init(struct xe_gt *gt);
>> > > > +bool enforce_schedule_limit(void); bool
>> > > > +engine_timeout_in_range(u64 timeout, u64 min, u64 max);
>> > > >
>> > > >  /**
>> > > >   * struct kobj_eclass - A eclass's kobject struct that connects
>> > > > the kobject and the
>> > > > --
>> > > > 2.25.1
>> > > >
