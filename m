Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E96C3DA6E
	for <intel-xe@archiver.kernel.org>; Thu, 28 Dec 2023 19:02:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0543010E07F;
	Thu, 28 Dec 2023 19:02:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A98F10E07F
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Dec 2023 19:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703790158; x=1735326158;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7CvGfp9ASAEOyWNKhIOot/X5WbIrP4fSa31RD7Q8EvM=;
 b=DGOveqYwm2y7dtlZN74qvL943pHbEOxDLXd6xLXEppODEkPoQCCITHpW
 Z82a6zpPk3hcfvZADrEBUjd9hjZ3jVLc9/ahkfsPHBKp7B4/ZNIKKJS88
 1NQHg2G6TUUqMBnHQwP3yOgivXyL0IcUpXNkh7WSWbIX2L4Bp3ABzGjOP
 9npR2jYOdVt+Zwhs8FoSTLIxp6LOGmQk8r3RcSY8keUhV9QxnXbSqhNIt
 ot6kQ36pz0ri6nRPPFqqG7VEurqMrCwuEqROhpjsHeBm7m1ccillq97LO
 RiEayhlqR1AiX35L8UbwW9XGhNJ3sirDpleBbuhI+YQ6e6mtquMwy5F54 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="376736125"
X-IronPort-AV: E=Sophos;i="6.04,312,1695711600"; d="scan'208";a="376736125"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2023 11:02:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,312,1695711600"; d="scan'208";a="13075695"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Dec 2023 11:02:37 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Dec 2023 11:02:37 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Dec 2023 11:02:36 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Dec 2023 11:02:36 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Dec 2023 11:02:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kxA9vjYqBFrlU4ovE6j/zZ+N6SS1AZ3rpyWwuC7zwVj+GckU/nU7GO6l0j1p3ZHKfKzEDenQoVM7iPFPztaynAYq/pIyh/utuAJrjfDP5aPSPYnNdlXTcHotPwTTejbbgS2YEX6L4OjWElsSo12Y1DCUMjj9euQCIYWb87c4ZImt+N023/x+ndttrzsXXB4QJjkT5gJvE1LsddXQXEsd6pjaOthwt1eNixeLiQX+ehEUiY0mhNPaMfE3DUGxgA28xYxyyUFKXdKhgAQ4S7uE/gwYfy/sILcIQ5en2Np0gOZq7Brg0JZzIJ5WXT5ker91aqopeJDym/NYMRAJU1dzNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnKPZuOcXzasIBBxedhBkvSEM7bMFHygkPTKI/MZ3NM=;
 b=GbE29FyOGe7k/pyiQ/NWm9e+w7YCrtoxOf7YaLEX94gjjnpknrzcS/Nvloggb1GmAICXFm3KQR7C0FiLU+TcTHBU9zp+9ilkGNeUtVgGxSZ+cp0GLghG0WpLWWkoWFaULkjK0qZRc4GunpztH32w0haDxYP8RDRsySmG7NBvuBtN20tjGw5oiYMVbVN0R/+jW2vOuKW0DSwCK2XwkmIPrRdNldF6ATHokplZ29IHyfpqVaTahbcg7F8ojes79y6Ojpg+IUtKl5ahpgC2sjZUbXMjox6d1QCDHChC0NR57Sqhjh6Su8tmTZ9SidYqLIaiU4mM1gbPoUsa+CzYwxdNqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6888.namprd11.prod.outlook.com (2603:10b6:303:22d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.20; Thu, 28 Dec
 2023 19:02:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7135.019; Thu, 28 Dec 2023
 19:02:33 +0000
Date: Thu, 28 Dec 2023 19:01:10 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
Subject: Re: [PATCH] drm/xe/debugfs: Make sysfs gt force reset synchronous
Message-ID: <ZY3F9oal58RE8y50@DUT025-TGLU.fm.intel.com>
References: <20231227083204.3982491-1-karthik.poosa@intel.com>
 <CY5PR11MB6211A31CBBD708FFEDBDCF06959FA@CY5PR11MB6211.namprd11.prod.outlook.com>
 <3add9cb6-2a79-48ad-99ea-97162688a776@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3add9cb6-2a79-48ad-99ea-97162688a776@intel.com>
X-ClientProxiedBy: BYAPR02CA0057.namprd02.prod.outlook.com
 (2603:10b6:a03:54::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6888:EE_
X-MS-Office365-Filtering-Correlation-Id: 22a4a8b5-6f2c-49c7-0361-08dc07d78c59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oAL8KMGTBJIcB1ewhXTsukcFfXI3BwHUAO59jOOYXIeYe/pb7I4QQnaVJDe87vFZcfdLLIW+psNjtwwKozjpDuP5kNY2XkiQvw+nn6E9h2jwUk4RqdzPYDT1aQJHM3fKpTlBYV6A61o/EBlftjSm9VeVOmil/3rf3J4H1KKCELrMmnXIoqjEZFQ8P6uIY8dHGyKZtAI3d69vtJI4ugYN1AWqBHAvUsWS6hdYeskp2k/0wqSUt9O0mbtrW10qOEpMGj6mftf4YuA8AeSaZXeHnLOqIvFAdGCsZOrAqBF84MmhYPnw4SYyGXvu5svhR/dOSiKWV1LYTJnoVhrjJF+o0sVVwgLLaAYzyYPnTVTF0yaVlnWvIFpmSA+wacbjEwUuNcrBKi4I2bLzJkS4G/V0ZgcpUw2q9rdA+SV6fhtPh2FTWqHGtglbWqdfCwIanXpwZg2OeWrKsBOR8cAVXe1iXcSMYUDgoZ8DJjy6zEXUsgrNvfWLVlb9ykmEKO4UDM4+/XBnf4QFogLe6wXvYGF/ulltTRRMBcQQMg3lpGP0gjrGoC72kwnvdOgAi619hFDo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(38100700002)(82960400001)(86362001)(6512007)(6506007)(6666004)(83380400001)(478600001)(8676002)(44832011)(6862004)(4326008)(66476007)(66946007)(6636002)(66556008)(6486002)(107886003)(54906003)(316002)(26005)(8936002)(53546011)(41300700001)(5660300002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tjbyg3z4DreBOi1snQeCf5hsf3BMEwR3i0YxQE3rWDAvFw4566pTrpfME/iS?=
 =?us-ascii?Q?lfSiuoRQUI0uyykvsQ6KcKm+w/mSSYjgW3XCEmK/HI4FLSnssf63iGQNqk7m?=
 =?us-ascii?Q?6Oqoqvqqp8qp80uNk7HE31vQ/E+qWIGEMEiYKNq2DuI729qnCdzcLagrVXOR?=
 =?us-ascii?Q?DiLutHvn0MV52hsPo5ERIh09o3Pz6Xykhd1B8XI/SPDJ/FNHepIshxoj4k69?=
 =?us-ascii?Q?x9pBlKPvFg9GWF1Gm/9iXJvVGqrq155ZVQEBCFtJFN4gj0bGkpQEnXzddNEo?=
 =?us-ascii?Q?s6XhT3WWvotLqZ1FOA3XyotNpHF/IFpeokuw+eeaO8pE/kekWCc3RFms8W88?=
 =?us-ascii?Q?TSZv7Apq82nmiDw/i6jNYn14/K1fCTvRlgQOlByJUWp6bdO8L4G0oNo7lz5L?=
 =?us-ascii?Q?yb0cG/EmK3LMhDvpiTHo5OSAfr755EW2c5djZjS/mQMdcySk8Sr759C5FBna?=
 =?us-ascii?Q?Wd1gaiAUYsAAmPfsefyKy/aiaeeQPAT0dXyDbbtebsubZ0qlBcHpgYP6oTVG?=
 =?us-ascii?Q?l8kkk7xeTLTU2Oe8oOwdV1uc94URUpheQKgO41Jkg9SJxnSAsl9lv94M3iND?=
 =?us-ascii?Q?kR3BJrEL+gbEXp7N+YDTZenEinJ29GQAOo1GE+z5ht3aqmSFnbGqgvFqnf0x?=
 =?us-ascii?Q?La4wk0L0SBP9qDC74ZcZ9mUt3BjsuQ5+1crDtW4leQy8KJaBPBwB2bg06Xje?=
 =?us-ascii?Q?nJIL0TqjQqcDK+fvyP73YYhEDMJhdgOT+fzfbmHiR1Gsj+yRIxJYC1PNpYd9?=
 =?us-ascii?Q?xecgNqIAfuSzEVwEln1/w+W/YZLyGKTl121429F4RX7k8X/jlF6ACKYIk//O?=
 =?us-ascii?Q?Zc7PaGuxM2yPO1OJXb+wyuLL25dhJsewCWg3Ad9Ok0am2Q7/gNfsU5qADS+v?=
 =?us-ascii?Q?m7OT0gsTAykkatcLZU158ggbAg1F/rjlH4CWYiMz+bpCUTJ4Y/GP/mIiOelL?=
 =?us-ascii?Q?gCuizqe8Z7lqBHgC7izxwxWoDYYqMUi4hylKXFI4oSIkGiKrQJTT3qCbp1ZM?=
 =?us-ascii?Q?Qbe5grd/8NRGVioyB++Q2kLXMnRJQhl1ZJiq3HJkOo+yHnTARpAQAfgbONEk?=
 =?us-ascii?Q?VFH8HSKTU9EwFyI6zRowm+17NPqrJKcoOmEr3P9mmvcj7CriAWWS4El5C4kK?=
 =?us-ascii?Q?pjIILEPtK7CugYcIsXSWXVb4mWr77VbWhLz/zLIOJBgFConQPM3muflZwV38?=
 =?us-ascii?Q?2qxoLCO2FQdrdX/7yjRPOAMbyYCYUjOulW7AF4B5SUT4r5mz7BXxKhFy+mG4?=
 =?us-ascii?Q?n8BbE1un+ZmE1vRiLgoQQJAoI4hbAoA51UV4I1vz5CQ0JdCatLmwYCmbOFXR?=
 =?us-ascii?Q?8xgmeLIv/lK+BZkatFvVBfylN+8QD2XkeEkr+P/TIds9GhtO0lxy0pq5pRUP?=
 =?us-ascii?Q?RP/0hMq3qzDehPrQJ+QBeOkGlX4RnBsTrKJhstOJgPrjZTMEycGYK1C7yo1w?=
 =?us-ascii?Q?ALNt+S9IjS5ufmBfxgfhB9FY60gcWoMMZUfmX4AM4BmtjzHBOfIx/2k5YZUt?=
 =?us-ascii?Q?iDt3W7erLZaB98v2AqHDievhzF1QmQ9pBbxS5B2K1V2WWING1pDXR82P7MkQ?=
 =?us-ascii?Q?bpp9Fn4P6kf/A/RRX9W27juISPPicPaRvKX6fJjhWGAOa5jgjwGyeG/BJG40?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22a4a8b5-6f2c-49c7-0361-08dc07d78c59
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2023 19:02:33.6089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lhkfiLf3ojzV6cJpbRvG/MOOWHBU3UcJ4Z2NtHxutkLGBEH96f7GclGWqweKDtWt4saOC9HukUUsGwEJntjKxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6888
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
Cc: "Poosa, Karthik" <karthik.poosa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Dec 27, 2023 at 08:53:03PM +0530, Nilawar, Badal wrote:
> 
> 
> On 27-12-2023 16:06, Gupta, Anshuman wrote:
> > 
> > 
> > > -----Original Message-----
> > > From: Poosa, Karthik <karthik.poosa@intel.com>
> > > Sent: Wednesday, December 27, 2023 2:02 PM
> > > To: intel-xe@lists.freedesktop.org
> > > Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal
> > > <badal.nilawar@intel.com>; Brost, Matthew <matthew.brost@intel.com>;
> > > Vivi, Rodrigo <rodrigo.vivi@intel.com>; Poosa, Karthik
> > > <karthik.poosa@intel.com>
> > > Subject: [PATCH] drm/xe/debugfs: Make sysfs gt force reset synchronous
> > > 
> > > Wait for gt reset to complete before returning from force_reset sysfs call.
> > > Without this igt test freq_reset_multiple fails sporadically in case xe_guc_pc is
> > > not started.
> > > 
> > > v2:
> > > - Changed wait for completion to interruptible (Anshuman).
> > > - Moved timeout to xe_gt.h (Anshuman).
> > > - Created a debugfs for updating timeout (Rodrigo).
> > > 
> > > Testcase: igt@xe_guc_pc@freq_reset_multiple
> > > Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_gt.c         |  2 ++
> > >   drivers/gpu/drm/xe/xe_gt_debugfs.c | 12 ++++++++++++
> > >   drivers/gpu/drm/xe/xe_gt_types.h   |  6 ++++++
> > >   3 files changed, 20 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c index
> > > 3af2adec1295..47abb9336c58 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > @@ -65,6 +65,7 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
> > > 
> > >   	gt->tile = tile;
> > >   	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq", 0);
> > > +	init_completion(&gt->reset_done);
> > > 
> > >   	return gt;
> > >   }
> > > @@ -633,6 +634,7 @@ static int gt_reset(struct xe_gt *gt)
> > >   	xe_device_mem_access_put(gt_to_xe(gt));
> > >   	XE_WARN_ON(err);
> > > 
> > > +	complete(&gt->reset_done);
> > >   	xe_gt_info(gt, "reset done\n");
> > > 
> > >   	return 0;
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > index c4b67cf09f8f..fbda886c8a95 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > > @@ -58,8 +58,16 @@ static int hw_engines(struct seq_file *m, void *data)
> > > static int force_reset(struct seq_file *m, void *data)  {
> > >   	struct xe_gt *gt = node_to_gt(m->private);
> > > +	struct xe_device *xe = gt_to_xe(gt);
> > > +	long ret;
> > > 
> > >   	xe_gt_reset_async(gt);
> > > +	ret = wait_for_completion_interruptible_timeout(&gt->reset_done,
> > > +
> > This would defeat the purpose of xe_gt_reset_async(), as this will make force_reset
> > synchronous , I think we need wait_for_completion_interruptible_timeout in  xe_gt_freq sysfs
> > before reading the guc pc frequency.
> > Something like below.
> > guc_pc_freq_ready()
> > {
> > 	wait_for_completion_interruptible_timeout()
> > }
> Then how force_reset debugfs should be handled then? I am seeing only 2
> possible ways, if reset is in progress 1. Do nothing or 2. Wait for
> completion and then initiate reset.
> 

What about changing force_reset to:

write == 0 -> reset async
write == 1 -> reset sync

Matt

> For freq sysfs entries I agree we should wait for guc pc is ready.
> 
> Regards,
> Badal
> > 
> > Thanks,
> > Anshuman Gupta.
> > 						msecs_to_jiffies(gt-
> > > > reset_timeout_ms));
> > > +	if (ret <= 0) {
> > > +		drm_err(&xe->drm, "gt reset timed out/interrputed, ret
> > > %ld\n", ret);
> > > +		return -ETIMEDOUT;
> > > +	}
> > > 
> > >   	return 0;
> > >   }
> > > @@ -225,6 +233,10 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
> > >   		return;
> > >   	}
> > > 
> > > +	/* set a default timeout */
> > > +	gt->reset_timeout_ms = 1000;
> > > +	debugfs_create_u32("gt_reset_timeout_ms", 0600, root,
> > > +					&gt->reset_timeout_ms);
> > >   	/*
> > >   	 * Allocate local copy as we need to pass in the GT to the debugfs
> > >   	 * entry and drm_debugfs_create_files just references the
> > > drm_info_list diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
> > > b/drivers/gpu/drm/xe/xe_gt_types.h
> > > index f74684660475..824cefde20d2 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > > @@ -358,6 +358,12 @@ struct xe_gt {
> > >   		/** @oob: bitmap with active OOB workaroudns */
> > >   		unsigned long *oob;
> > >   	} wa_active;
> > > +
> > > +	/** @reset_done : completion for GT reset */
> > > +	struct completion reset_done;
> > > +
> > > +	/** @gt_reset_timeout_ms : gt reset timeout in ms */
> > > +	u32 reset_timeout_ms;
> > >   };
> > > 
> > >   #endif
> > > --
> > > 2.25.1
> > 
