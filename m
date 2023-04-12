Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B05C77B6C
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 23:01:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB2A10E9D7;
	Wed, 12 Apr 2023 23:01:20 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C0010E9D7
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 23:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681340477; x=1712876477;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=M88mULXRTU5PysGsJ6u+W3UDwHOUS1VAyFXjgpHUKm4=;
 b=dtFloRycIzDI4f5HstRl0lSBKA9csIDKOLUBRx6wsLnXB5k58wuoCRCS
 GVFDz/ng1/KR3cIz40dNwGVuIRCne3+hfQeVrqU5sKtXMVSUmgBdDVwlR
 qd0q4YbZaiCA4k6JQcsDEk1OXAXOkwwMFLb5SQ0gmmPR0MwlUkxAOCrrh
 tDj91f58LeqEfuMshEKM6kKr3Buomu6tsi2HglmZ+o7pmOFAShpUnjyVN
 w8vZFsVK/FbGRX5y0GCvC5F2QgwRwY38WVtrzKeBhxmr7+/xYp0Id86A5
 urPljaqIV7ySjaQG7+qGRIDOHvNMVN3q1QwHaRV+Cax5ZaB4c2eIS3GBd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="346722793"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="346722793"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 16:01:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="935299531"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="935299531"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 12 Apr 2023 16:01:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 12 Apr 2023 16:01:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 12 Apr 2023 16:01:15 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 12 Apr 2023 16:01:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MPQXkgnIO3tvlGllO8lTIJwh5hLfJkiReNhGLW7QRthTAOUcSqNDVqsSHmcuMzlroiiZFBDxRKPM1s4Z4NuTjfOpH9mLBaJxD+EdeTz1Brt0b8jNfgaVf9TaJ+V9V3wCSmV1CGD/bw2FNothebukjPgtr+fbACEy/EUKZoz+Nmp7QElS8NtTYgBKbbZ6Rd7nMo+9RpXmRp4/pddmaaQgq10hKLdyBRdBjLEfJ0hj8SNrQ0TBsyxtPjHtrS3HXzrA8bOr9Zz9COT3rgez3nHrsPafybcL318cErG6TXJLQsMyqsTnNZyTjNBp0Axd69PDelrYtOyN3JnlJ3krgcUYlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C1P15vEGCHX5VQDhOJTGck+GdP+4H3XSyJL9U2bBpeY=;
 b=VT4IhZzRx0vlCgr5idWx+28Ss/Kz8VRA3utwMVJhpf3Xg2vbMSCz1OtCvcjcShnaB+XSFGyg3jm/mWdKGkVCAqS5C+ME/4L7Svk+7NY5IPvDlTNXpyW14ol713XnsT+SX8fQYANZvX8NYWhcrMJJ3rj5Os2hhohAI9tZ944zVJbtt19a6opHzGboRyqHWYUhkkw72I/DVEwOAUD8l5rf6o2kUzDBB0MWZg/Z9MQXvhngB8fZblgsoMRuyYDktsMaP41oNEDN4rsQ1lmVCZR9kwt8skaOlB5L/UAmLPbsHGnS9z+eVda3Sni93+H5SuKCcq1LwER/XN++NCUpRwjjLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB5983.namprd11.prod.outlook.com (2603:10b6:510:1e2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Wed, 12 Apr
 2023 23:01:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6298.030; Wed, 12 Apr 2023
 23:01:13 +0000
Date: Wed, 12 Apr 2023 16:01:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230412230110.oronq546ogkj5qlw@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230412225248.3229571-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230412225248.3229571-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR21CA0012.namprd21.prod.outlook.com
 (2603:10b6:a03:114::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB5983:EE_
X-MS-Office365-Filtering-Correlation-Id: 34e7f82c-844e-43d5-289c-08db3ba9d018
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yI1F4hooPn5Y5mZXZkobxk8t6E7b/kBbj/6BBNG7ZZ+DA00T0VNynQggQyrOKKaELDrislbY2tZ3evZ5/K52KVfppxmuhodgpGAW6WGj5R7AfKVHR/A9JAGwzPhgwMSHmJABnyiqYBtAiOiKl/WsZOrfHODLImO9EbJIEaMf+zCHiaaRXvKBBWaLiVsnllBJS0xZR7XIcSq570mk1I6eu6wz8f6Xs9cDWwtMswPhNFgiUR3JPM7MCVcr8ZTc1GAQX0buUMlarK7FnssGr3VWk9SgI6fbjksMuRORij7bGw2+Oqfup7WPHH34OEL+bLVO7MYGU/Uj8FHnNWX983BzYxTZu3xkJXm4reNE6mOclrogU0oeWQ0Go2+ye/0KzwIdWFB8QBqg57xApPNpQQ6CMxKSRv6DdwqRVPgS7M3P8TN9AdmdjL7xoate15BSCDlqdJEQ01wxOvUPei2KGNoPy4KrBf+/mN8q14UApEw5HZ9Jpd+3X9mgEgv0lOnCFaDPFi6ANOlRtKojx2o1isP4XDxog4DT+Jn6c/rA3tVUKB2j8GTm+7tTmmm0LWu6gYVl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(346002)(136003)(376002)(39860400002)(451199021)(6486002)(478600001)(6636002)(66556008)(4326008)(66946007)(316002)(41300700001)(66476007)(36756003)(83380400001)(6512007)(86362001)(6506007)(9686003)(26005)(1076003)(15650500001)(8676002)(8936002)(2906002)(5660300002)(82960400001)(38100700002)(6862004)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wqqpUmdymixGzrfuwyGMlrmu0/BNiNEgGZuAp/7QxuZqKfoiGB+jrpNod87d?=
 =?us-ascii?Q?tp21xUv2WgQE+pWkJ4b1mF95sbXBijNmwbBU9iLJqQA9iNH1VvTrzNtzDH67?=
 =?us-ascii?Q?agUAWPQPkI9yaH5qOyESWTixHZCisMTYoXgKpx/2HRuQeRfYnMvs5CMo8IJ4?=
 =?us-ascii?Q?FIdujTxLehCgyKw9L0kBKqzs5ZuNDxvUx8a8vhPXvX65GbzHR2d2MQsosUJa?=
 =?us-ascii?Q?deC1G0p/v6PeuFNZea2Kuh7LxJDEnRBeGB1+A4b03PqO+jUNru1gua8+h0T1?=
 =?us-ascii?Q?EMwFP3LAQlZCjNpwXyayvElnPEaQS5h+o+0RMXFxE50m8v6LWOhsyF2Qp4I3?=
 =?us-ascii?Q?wa7FXvvRmU+6l1HpipljQ5szhALZFMGg8H5FD4lhB8dFZgpKXvH9RQfSwwdH?=
 =?us-ascii?Q?yuWFTJhDiLflT84S0jBuvoGz6b2+Z3Xr4AfKOhj3C4Evl0/UvdyDMyQFxYA5?=
 =?us-ascii?Q?D4ILOFlNubQpB/LKmFUU5dECKG02wmoG0aw7V0efuf3XNklUcuXjOtf1kJiA?=
 =?us-ascii?Q?a+HfNsu1l5jLzU8V7NGus6FR+uHjDtFgC22Z+7wjbZOiu/jbWxctshHI3q4f?=
 =?us-ascii?Q?xjihnv6kfqlOXzIAUmh+zjTRvcKThFV9tXXGsN3mJ87NhmvthXpukG1H5d9d?=
 =?us-ascii?Q?EFJukql9xOcnLOCwoMy556WBJ9NZHWjtvIkoZTnnyBWwNO6HDGDG8NvNfG09?=
 =?us-ascii?Q?8oBbvDGqbQ4/Mp2AnT47YKmCo59Q4JoCEvLEuwRWzeRiMPreBKKUBCWVqRWO?=
 =?us-ascii?Q?MDIKdxPiZWYUb1vgKpPcB+7c6H6yoP3t63mg31fVTBnVjZalsdrX4JLSw/yi?=
 =?us-ascii?Q?7/aR+WFEMXmQupO0Jr7tPjiMFTXvJ7VzEFnHSVqHD6+RJRf43l1k/iWk6/T6?=
 =?us-ascii?Q?IBaAl8BcHVNgXFUsqCcMeZq0MY/RQqzYsu45dfNiMoDVCl4nUX9OFt6Ak8V0?=
 =?us-ascii?Q?Nq4vcOWyrUpxUJoXujOHbHZrhO/gAyRDy9Covh8cxbt3CFoPXemkyfUhMBWe?=
 =?us-ascii?Q?XRsECZmd3rRX1rvreLdwfSxty66izgT2cuFn0/GtnZJHPobFdkM/bv/gMBTC?=
 =?us-ascii?Q?fm2yTGsIXy+ktXQB6mr78ahFhG5RO/Hu1jLIeF25r29gTQS5A/PRnFbEC0cL?=
 =?us-ascii?Q?3c0xWw4L0Z9xMrdsI4zQhancfIuT5QRppUJX2XybwDlDyVxDJy1nJk0eskWe?=
 =?us-ascii?Q?w4WsPAsGm7uAX9DoBMsZqnHWvg0iqu9RTzDlZPfhrhBk75CV1Aq6VSD/he05?=
 =?us-ascii?Q?NHoIRBJS/elB5dGZ1KT3mzEpJ98H9QqwUL1qS5g/Hkg4K4H6gu89ppmbef6G?=
 =?us-ascii?Q?5DSeOFnlf2qbYDBYKV7uJ7b+5qCNOPmHw2q1D1Rxu6KUZEUefdPPKHvV8ITz?=
 =?us-ascii?Q?QYGyfC1/OgilrOrGGhTcnnlQJVJ6xwHpT9byob2C80Zd4cur79VB/v2qm3FW?=
 =?us-ascii?Q?X5CHKRSn/7ai6mHJkJQbMeSM8+kBp2krEJxWW+9cFjIoF801Wr6jwPrDi1Oe?=
 =?us-ascii?Q?+CY6/srMKqjyQY5e9AxbyRpcEgqD6J6GdmCgNoVlnRJ9SOf7XXzi2KWnABX/?=
 =?us-ascii?Q?ptD+qTsTyiWQF3HcdyXC2e1VA28K1DOlYmSIFRJsHgzN+atRttQHYog5AH0I?=
 =?us-ascii?Q?0Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e7f82c-844e-43d5-289c-08db3ba9d018
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 23:01:13.2513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YDni1xawjuPWcMHV9HClEPa/1S50mS5klwl/9m9EWDsTd5vFOIu3YOoPSi+ANHzuteX7tRne1yiZJx8nGNXF37aPImOlxA9vwJ9OamrQVMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5983
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 0/8] Meteorlake interrupt & TLB handling
 updates
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

On Wed, Apr 12, 2023 at 03:52:40PM -0700, Matt Roper wrote:
>Although Meteor Lake has multiple GTs, we need to be careful not to use
>multi-tile flows when processing interrupts.  The platform as a whole
>only has a single copy of the SGunit interrupt registers, and interrupts
>relating to the media GT are delivered as part of the primary GT's IRQ
>reporting flow.  Only when an engine (or GuC) interrupt is raised do we
>need to determine which GT it relates to for further processing.
>
>The whole multi-GT vs multi-tile situation is made more confusing by the
>Xe driver's misuse of 'gt' as the target of all register operations.
>That's probably something we should refactor in the future so that
>xe_mmio_*() will take something more appropriate than an xe_gt
>parameter.

it would be good to type in a kernel-doc somewhere the proper
distinction of gt and tile and describe the status quo: from xe
perspective everything is a "gt" and this is also exposed to userspace
in e.g. the debugfs structure. Because it *is* very confusing, and it's
not only on the xe driver; in the spec as well. One week I know, the
other I forgot already.

Lucas De Marchi

>
>With the fixes in this series, interrupts are now properly flowing on
>both the primary and media GT for MTL.  We're still seeing some TLB
>invalidation timeouts, but those no longer seem to be caused by problems
>with interrupt handling.
>
>
>Matt Roper (8):
>  drm/xe/irq: Cleanup media GT interrupt flow
>  drm/xe/irq: Improve warnings and assertions for GT handling
>  drm/xe/irq: Process Gunit interrupts in relation to the device
>  drm/xe: Fix xe_mmio_rmw32 operation
>  drm/xe/irq: Ensure primary GuC won't clobber media GuC's interrupt
>    mask
>  drm/xe: Include GT ID in error message if TLB invalidation times out
>  drm/xe: Invalidate TLB on all affected GTs during GGTT updates
>  drm/xe/tlb: Obtain forcewake when doing GGTT TLB invalidations
>
> drivers/gpu/drm/xe/xe_ggtt.c                |  24 +++-
> drivers/gpu/drm/xe/xe_ggtt_types.h          |   2 +-
> drivers/gpu/drm/xe/xe_gt.c                  |   4 +
> drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   4 +-
> drivers/gpu/drm/xe/xe_gt_types.h            |   2 +
> drivers/gpu/drm/xe/xe_guc.c                 |  11 +-
> drivers/gpu/drm/xe/xe_irq.c                 | 115 +++++++++++++++-----
> drivers/gpu/drm/xe/xe_mmio.h                |   2 +-
> 8 files changed, 125 insertions(+), 39 deletions(-)
>
>-- 
>2.39.2
>
