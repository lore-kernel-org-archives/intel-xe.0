Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE17EB64D7
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jun 2023 04:29:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024E410E3AB;
	Wed, 21 Jun 2023 04:29:57 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BBE210E3AB
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jun 2023 04:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687321796; x=1718857796;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VSkINxLT1Ve1tx+Z+qWsMcCPXBLCPxXXi9WO6MpRaEw=;
 b=iI3eSF1vfN48tNnsyK1p+/XZe4U+dEHD6wZjsjVj0lf+wysSCudTyvGT
 8fBd3qm/jPiYJjVCckbtDatxDVuCFfFtYy4/RS0ZicPADLNmdSLI/LlcR
 QgluF7El5/wJFjA/lxWQVsHSRrplDWxqa6ovoRWOfyzn9cVFJND//ALog
 Z+kvXP7sJF8dBxt/HNeLnretiUYOrY++pUevA7lxQxBDOAtkbJ1IT8TEE
 L2wDKmlblmcLHfKBlX+GNDoTXn6rGlkJdTLJ1rFWP+230f0CVYsfJpGh3
 Ao2beZ+hBz4GWE8LlKyXSzJAsrmdz0IoGOZ0j+wwcxRm8TKZPFzg0paTO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="358933409"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; d="scan'208";a="358933409"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2023 21:29:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="858829192"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; d="scan'208";a="858829192"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 20 Jun 2023 21:29:54 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 20 Jun 2023 21:29:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 20 Jun 2023 21:29:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 20 Jun 2023 21:29:53 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 20 Jun 2023 21:29:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jl1CdCLNUlAnJuRJ3ejQ9YpSMwseU1OrerOQwU9aeBSTYcv7fIEca2hYnXB8hzvN7iZMyqfgo1tDsuPBU0g4H8rl0GfV15E0XKm3Qf8usHrXII28rdw/szFHtcyp3iywY9oc0LqoUJLFfFo1L8Yr9b2Zs68sCAFQ02fxMQUgBAmHLIUdwOH/rPMPnhSFHsFXicq4VXBIg/IxMbUpVuR02oJcPKqEI5Tm771YoerG2ZackERgfX+AR2UJxtHPUwukruHkcT3J0xy74m6FUYjWLJyJ54ca7E0QBkEKCC9ybcI3kmebf90sKBuiE7T0ySm8VfLoM9JxujIg2nVY7D3k0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCLFhRrXINbCF15IdT9qCzU9bICsZQfEYYetWzL0n6w=;
 b=XIcfKTAd9Ev3sDPeuPW9XCL1QeZK0MZ7+ioN9vtfwwvaj5IbbLFuCBOuJPamZpACkLjGqCGoHstVK16zz1B29lLiYASP6l1naEo3/w48LhlQhbS60w1Gm92Uwr27hupuBtyaZvWlD6IKU0ZCKUnd3gmZ5K612JsUR32TqsFjxXuceJm+Q4WVl0ATn6y/ttn3vyRMUXtp3jukFnAIjaCamhxksPEAhcAL2l5U6EF739SbYKiAb3HT7DBa7ZqIiMl7Q7xPDEEZQXchwtu56dlKaMM9QOqJ0B6Ie4Hl2KswI/e2n9rYpH9ViJQW77Pk0ibJabE3PLbSIj3jydomOjtLhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SJ0PR11MB5661.namprd11.prod.outlook.com (2603:10b6:a03:3b9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Wed, 21 Jun
 2023 04:29:50 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::84a5:8625:a20c:4086]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::84a5:8625:a20c:4086%4]) with mapi id 15.20.6500.036; Wed, 21 Jun 2023
 04:29:50 +0000
Date: Tue, 20 Jun 2023 21:29:41 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Message-ID: <ZJJ8tRDKimj0Jrrz@nvishwa1-DESK>
References: <20230615141933.2865583-1-tejas.upadhyay@intel.com>
 <20230615141933.2865583-3-tejas.upadhyay@intel.com>
 <ZIzInHB8NmkuwWd8@nvishwa1-DESK>
 <DS7PR11MB6197AC215DD38AD284EF93CE815FA@DS7PR11MB6197.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <DS7PR11MB6197AC215DD38AD284EF93CE815FA@DS7PR11MB6197.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0343.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::18) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SJ0PR11MB5661:EE_
X-MS-Office365-Filtering-Correlation-Id: 696696f0-b2b6-4458-7b49-08db721026b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c6YR0iXCWmFlVXaNIrRuMrCAZBKu/mn112Ckz+zxGhqZGXM7bOB+H9ikw3WEKRenB4IJ69dcDHc2fGQnRLOXCc+gqyL9Km/+/6hcqunxzG/64uQroNe9oXNjGluejaEfaMHZyD3Du32Ir0RxVDcL5w9PhhZ5N7DHcZEzzIzZA6XLKQXU4ERONdEW8XUOWhLDhjElxgz0D/74+ThF9BncmCeg/CGpu+zllxQzrj/6b0QbREQtJZaX5tadmREmkJBoeJ+PJy3+TLU7hv3uQfAvCb4SZ0T6Yaj+HufR0OJnlZtOblSaRzeodZM70lCyr7yQDBcirrwUEODP6iuus5/0Az1MAnAhBLnMY9bOnL2U9ncRo5chTVWhT9/+MeXlR0HAXkbhSDZ02KykR9hLZvUrmPtV/2bN/s0iyXHo6so1+3Uw+0mOILTkVn+6RNgkfyXyy/ne6EsBrHUwe7FBLkwQc8exSy6aNNFa+KT0ieEpFaEozfa2bcGQCZhrmDwLBV6cw3qJ6H3RV/G08QK0QGThhYJXFHp3UWd1Zfjwwh86gwuqlZS5fLXQEcD4bB/zrXqf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(396003)(346002)(376002)(136003)(39860400002)(451199021)(30864003)(44832011)(66556008)(4326008)(66476007)(66946007)(6636002)(316002)(5660300002)(66899021)(2906002)(6862004)(8676002)(8936002)(41300700001)(6486002)(54906003)(86362001)(478600001)(38100700002)(33716001)(6506007)(107886003)(6512007)(186003)(9686003)(26005)(53546011)(82960400001)(83380400001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XTDAfgaRHKfZR/iOH44mmhCOyc81UamZRamlcrD65U/14lZRM5tS1F9RQWbr?=
 =?us-ascii?Q?k1kx9U9L25kOwJpfI6el4OyznlbHSKH13q16SmB5IUvjo8OOnmWI9+p8UlBd?=
 =?us-ascii?Q?HiD02MDxaD4qRcwZgiyPm0zfRorCcVX6QT2NUVBETlR+2yNcw6DZIT9aMiW8?=
 =?us-ascii?Q?ysO+UuLb+wMgGOmwFrrufbtHtNs7ytHK7fHUU4G8pZeagfncea9Oqg6qEY/F?=
 =?us-ascii?Q?YZBDOz5JMAcJfXFoOLOIyHjZn9FAnwwZgMFG27yLGn8g24XQ1JaEZO/a2mck?=
 =?us-ascii?Q?R9vIQCWk9hSxbX4lJPqKk1gERAd9zDmlIoiII4FNRwB0f3mecW6UD8IO2oLl?=
 =?us-ascii?Q?E6TULPReL/2R9dCj3SjYdvzoChGxy70XozDQlxDBjz+fOrCx1CWhChHuIgOT?=
 =?us-ascii?Q?49/c9+gYzJQsRefcXxejh3SqcWtjsz19NmGe7bWeo7YeXkGZLhTrKb80msd0?=
 =?us-ascii?Q?RNJaqPY0B6iElWj6L8s1cpZla/lkndpmAiv6+xJaQccBMFszFJJRG/WfaE2+?=
 =?us-ascii?Q?ta+TMGiuzZ0jeiSD9vN5ZpKNBmy3nTmipRznOqn3X7hHkMY9QTGw9VOIP0YK?=
 =?us-ascii?Q?Lp2AU0OXeJw9lfgEkSSePEgF1u3ej4EMbcBmyw3rm0GpBNf2EvSWN68P4EpZ?=
 =?us-ascii?Q?RSVyuNXslel/xj9vYiKzYMF9ujpG+0ZGV7t2pO3oiMr/dOR2P/0uhceXpGee?=
 =?us-ascii?Q?FvHdZ+OplddhVoNVZoZkbpCtVWyw9AIyCfS1bOQd+y8AQiuy5o8T2pxxs6A7?=
 =?us-ascii?Q?z7mtRN9QASoOJ01A7aLCj4N6rGnnM+1ItLcRhS88SJGW7CQscnNDfySk2KV5?=
 =?us-ascii?Q?jrAB+P2WMN3y5jrY9YBHbdF21x12gn9jsSIu2UkDd1fhL9s8lgaqaN/V6Qxn?=
 =?us-ascii?Q?vlJuHdwQc1cYay/TXuARysY9TvNFL6T1TMQSuEHu5L4us7o+JUDnWdeicQmE?=
 =?us-ascii?Q?LIvozru79LycFIUoRyve//w3plM7NCMwcfKEQeaNW1kJgqnsdYpMnjrd6KV2?=
 =?us-ascii?Q?5sz4uTMp09FXNl2ECgeSBhDITR+MsIg7QvX8o2Kw1fnPlB/51mwXAhyhJp2L?=
 =?us-ascii?Q?0ESu5ihHnE1EUmlRCaxrzs2zERTuHI1XY388eH/btu+cdZtSr1WxQrWO105c?=
 =?us-ascii?Q?su7PHqZwcCq7QhC9xKm41xZ3Bh9X+l87tSEpEpg00UQUcFslzZkbSQRRNu8t?=
 =?us-ascii?Q?4IAHUxFBS4vqaJKeFV6obWReheiZ69wmM95Bv7trKKI+dTNETf6bAH7c2LhG?=
 =?us-ascii?Q?HufPJsylFkg78ATIsNRSY60rT/rnEHDvhI0KEzOVcNorjkzl7QgvsrxA6L8F?=
 =?us-ascii?Q?qO9aTLOrsvXeltAb0X5v7ZX+uopKsjyNilRt7+mKpD9abIUZrU8vRKP08pz4?=
 =?us-ascii?Q?WNThrTZgsm/zxJ6i1WHAPOiHO/Qeg6qI6tyLap6lUmt8PlamZBOph0T4doyH?=
 =?us-ascii?Q?5gGbvcboSAb5z2Vjg3/GQbTD4nkFh/hgBoRtuk/V0nWNelvvI/j0Uc7RmMjw?=
 =?us-ascii?Q?0EqDkzYV53GSdWA76aZujOTAAxwWBLCryeMGo6azWz0L7IryNix5NLkpiQyA?=
 =?us-ascii?Q?d+zOfeg2Gfq4k0ipno33rXOtntNrP3wGYk2ZkhwQj8RxbMdJ2MI7AYnr1LCq?=
 =?us-ascii?Q?8lrKkLfPIiCe3o6Ut7IbssY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 696696f0-b2b6-4458-7b49-08db721026b0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 04:29:50.2087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ow9++qvZYyZ87Ix/zgWKcaqZB65VRNcmrI+TeYtodGYzDUZyMZztyhr2DoFWsNWt1n+CuGlpy0ALxOJHc5pQDg0ko8puO3gh+Sjb8WNoYQ4I0UKhLbsGuSCTXD3bBg64
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5661
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/6] drm/xe: Add sysfs for default engine
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

On Sun, Jun 18, 2023 at 10:01:45PM -0700, Upadhyay, Tejas wrote:
>
>
>> -----Original Message-----
>> From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
>> Sent: Saturday, June 17, 2023 2:10 AM
>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
>> Cc: intel-xe@lists.freedesktop.org; Iddamsetty, Aravind
>> <aravind.iddamsetty@intel.com>; Ghimiray, Himal Prasad
>> <himal.prasad.ghimiray@intel.com>; Brost, Matthew
>> <matthew.brost@intel.com>
>> Subject: Re: [PATCH 2/6] drm/xe: Add sysfs for default engine scheduler
>> properties
>>
>> On Thu, Jun 15, 2023 at 07:49:29PM +0530, Tejas Upadhyay wrote:
>> >For each HW engine under GT we are adding defaults sysfs entry to list
>> >all engine scheduler properties and its default values. So that it will
>> >be easier for user to fetch default values of these properties anytime
>> >to go back to default.
>> >
>> >For example,
>> >DUT# cat /sys/class/drm/card1/device/gt0/engines/bcs/.defaults/
>> >job_timeout_ms         preempt_timeout_us     timeslice_duration_us
>> >
>> >where,
>> >@job_timeout_ms: The time after which a job is removed from the
>> scheduler.
>> >@preempt_timeout_us: How long to wait (in microseconds) for a
>> preemption
>> >                     event to occur when submitting a new context.
>> >@timeslice_duration_us: Each context is scheduled for execution for the
>> >                        timeslice duration, before switching to the next
>> >                        context.
>> >
>> >Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> >---
>> > drivers/gpu/drm/xe/xe_engine.c          |  4 +-
>> > drivers/gpu/drm/xe/xe_gt_sysfs.c        | 94 +++++++++++++++++++++++--
>> > drivers/gpu/drm/xe/xe_gt_sysfs.h        |  5 ++
>> > drivers/gpu/drm/xe/xe_gt_sysfs_types.h  | 13 ++++
>> > drivers/gpu/drm/xe/xe_guc_submit.c      |  5 +-
>> > drivers/gpu/drm/xe/xe_hw_engine.c       |  5 ++
>> > drivers/gpu/drm/xe/xe_hw_engine_types.h | 11 +++
>> > 7 files changed, 128 insertions(+), 9 deletions(-)
>> >
>> >diff --git a/drivers/gpu/drm/xe/xe_engine.c
>> >b/drivers/gpu/drm/xe/xe_engine.c index b3036c4a8ec3..e72423bc398a
>> >100644
>> >--- a/drivers/gpu/drm/xe/xe_engine.c
>> >+++ b/drivers/gpu/drm/xe/xe_engine.c
>> >@@ -53,8 +53,8 @@ static struct xe_engine *__xe_engine_create(struct
>> xe_device *xe,
>> > 	INIT_LIST_HEAD(&e->multi_gt_link);
>> >
>> > 	/* FIXME: Wire up to configurable default value */
>> >-	e->sched_props.timeslice_us = 1 * 1000;
>> >-	e->sched_props.preempt_timeout_us = 640 * 1000;
>> >+	e->sched_props.timeslice_us = hwe->sched_props.timeslice_us;
>> >+	e->sched_props.preempt_timeout_us =
>> >+hwe->sched_props.preempt_timeout_us;
>> >
>> > 	if (xe_engine_is_parallel(e)) {
>> > 		e->parallel.composite_fence_ctx =
>> dma_fence_context_alloc(1); diff
>> >--git a/drivers/gpu/drm/xe/xe_gt_sysfs.c
>> >b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>> >index 7528cc723699..72809078bd83 100644
>> >--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
>> >+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>> >@@ -32,22 +32,92 @@ static struct kobj_type kobj_xe_engine_type = {
>> > 	.sysfs_ops = &kobj_sysfs_ops
>> > };
>> >
>> >-static struct kobject *
>> >-kobj_xe_engine(struct kobject *parent, char *name)
>> >+static ssize_t job_timeout_default(struct kobject *kobj,
>> >+				 struct kobj_attribute *attr, char *buf) {
>> >+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
>> >+
>> >+	return sprintf(buf, "%u\n", hwe->defaults.job_timeout_ms); }
>> >+
>> >+static struct kobj_attribute job_timeout_def = __ATTR(job_timeout_ms,
>> >+0444, job_timeout_default, NULL);
>> >+
>> >+static ssize_t timeslice_default(struct kobject *kobj,
>> >+				 struct kobj_attribute *attr, char *buf) {
>> >+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
>> >+
>> >+	return sprintf(buf, "%u\n", hwe->defaults.timeslice_us); }
>> >+
>> >+static struct kobj_attribute timeslice_duration_def =
>> >+__ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
>> >+
>> >+static ssize_t preempt_timeout_default(struct kobject *kobj,
>> >+				       struct kobj_attribute *attr,
>> >+				       char *buf)
>> >+{
>> >+	struct xe_hw_engine *hwe = kobj_to_hwe(kobj->parent);
>> >+
>> >+	return sprintf(buf, "%u\n", hwe->defaults.preempt_timeout_us);
>> >+}
>> >+
>> >+static struct kobj_attribute preempt_timeout_def =
>> >+__ATTR(preempt_timeout_us, 0444, preempt_timeout_default, NULL);
>> >+
>> >+int xe_add_engine_defaults(struct kobject *parent)
>> > {
>> > 	struct kobject *kobj;
>> >+	int err = 0;
>> >
>> > 	kobj = kzalloc(sizeof(*kobj), GFP_KERNEL);
>> > 	if (!kobj)
>> >-		return NULL;
>> >+		return -ENOMEM;
>> >
>> > 	kobject_init(kobj, &kobj_xe_engine_type);
>> >-	if (kobject_add(kobj, parent, "%s", name)) {
>> >+
>> >+	err = kobject_add(kobj, parent, "%s", ".defaults");
>> >+	if (err)
>> >+		goto err_object;
>> >+
>> >+	err = sysfs_create_file(kobj, &job_timeout_def.attr);
>> >+	if (err)
>> >+		goto err_object;
>> >+
>> >+	err = sysfs_create_file(kobj, &timeslice_duration_def.attr);
>> >+	if (err)
>> >+		goto err_object;
>> >+
>> >+	err = sysfs_create_file(kobj, &preempt_timeout_def.attr);
>> >+	if (err)
>> >+		goto err_object;
>> >+
>> >+	if (0) {
>> >+err_object:
>> > 		kobject_put(kobj);
>> >+		return err;
>> >+	}
>> >+
>> >+	return err;
>> >+}
>> >+
>> >+static struct kobj_hwe *
>> >+kobj_xe_engine(struct kobject *parent, char *name) {
>> >+	struct kobj_hwe *khwe;
>> >+
>> >+	khwe = kzalloc(sizeof(*khwe), GFP_KERNEL);
>> >+	if (!khwe)
>> >+		return NULL;
>> >+
>> >+	kobject_init(&khwe->base, &kobj_xe_engine_type);
>> >+	if (kobject_add(&khwe->base, parent, "%s", name)) {
>> >+		kobject_put(&khwe->base);
>> > 		return NULL;
>> > 	}
>> >
>> >-	return kobj;
>> >+	return khwe;
>> > }
>> >
>> > int xe_gt_sysfs_engines(struct xe_gt *gt) @@ -72,7 +142,7 @@ int
>> >xe_gt_sysfs_engines(struct xe_gt *gt)
>> >
>> > 	for_each_hw_engine(hwe, gt, id) {
>> > 		char name[MAX_ENGINE_NAME_LEN];
>> >-		struct kobject *khwe;
>> >+		struct kobj_hwe *khwe;
>> >
>> > 		if ((hwe->class == XE_ENGINE_CLASS_OTHER) ||
>> > 		    (hwe->class == XE_ENGINE_CLASS_MAX)) @@ -109,6
>> +179,18 @@ int
>> >xe_gt_sysfs_engines(struct xe_gt *gt)
>> > 			kobject_put(kobj);
>> > 			return -EINVAL;
>> > 		}
>> >+
>> >+		khwe->hwe = hwe;
>> >+		hwe->sysfs_hwe = &khwe->base;
>> >+
>> >+		err = xe_add_engine_defaults(&khwe->base);
>> >+		if (err) {
>> >+			kobject_put(kobj);
>> >+			drm_warn(&gt_to_xe(gt)->drm,
>> >+				 "Warning: adding .defaults to engines
>> failed!, err: %d\n",
>> >+				 err);
>> >+			return err;
>> >+		}
>> > 	}
>> >
>> > 	return err;
>> >diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.h
>> >b/drivers/gpu/drm/xe/xe_gt_sysfs.h
>> >index a531aebd10d6..a539cf031c7d 100644
>> >--- a/drivers/gpu/drm/xe/xe_gt_sysfs.h
>> >+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.h
>> >@@ -19,4 +19,9 @@ kobj_to_gt(struct kobject *kobj)
>> > 	return container_of(kobj, struct kobj_gt, base)->gt;  }
>> >
>> >+static inline struct xe_hw_engine *kobj_to_hwe(struct kobject *kobj) {
>> >+	return container_of(kobj, struct kobj_hwe, base)->hwe; }
>> >+
>> > #endif /* _XE_GT_SYSFS_H_ */
>> >diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs_types.h
>> >b/drivers/gpu/drm/xe/xe_gt_sysfs_types.h
>> >index d3bc6b83360f..d0a5eae1bbb4 100644
>> >--- a/drivers/gpu/drm/xe/xe_gt_sysfs_types.h
>> >+++ b/drivers/gpu/drm/xe/xe_gt_sysfs_types.h
>> >@@ -23,4 +23,17 @@ struct kobj_gt {
>> > 	struct xe_gt *gt;
>> > };
>> >
>> >+/**
>> >+ * struct kobj_hwe - A hwe's kobject struct that connects the kobject
>> >+and the
>> >+ * hwe.
>> >+ *
>> >+ * When dealing with multiple hwe, this struct helps to understand
>> >+which hwe
>> >+ * needs to be addressed on a given sysfs call.
>> >+ */
>> >+struct kobj_hwe {
>> >+	/** @base: The actual kobject */
>> >+	struct kobject base;
>> >+	/** @hwe: A pointer to the hwe itself */
>> >+	struct xe_hw_engine *hwe;
>> >+};
>>
>> More on this below.
>>
>> > #endif	/* _XE_GT_SYSFS_TYPES_H_ */
>> >diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
>> >b/drivers/gpu/drm/xe/xe_guc_submit.c
>> >index b209e4c2a3a9..bc0ffcf9fb1c 100644
>> >--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> >+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> >@@ -1063,13 +1063,16 @@ static int guc_engine_init(struct xe_engine *e)
>> > 	ge->engine = e;
>> > 	init_waitqueue_head(&ge->suspend_wait);
>> >
>> >-	timeout = xe_vm_no_dma_fences(e->vm) ?
>> MAX_SCHEDULE_TIMEOUT : HZ * 5;
>> >+	timeout = xe_vm_no_dma_fences(e->vm) ?
>> MAX_SCHEDULE_TIMEOUT :
>> >+		  e->hwe->sched_props.job_timeout_ms;
>> > 	err = drm_sched_init(&ge->sched, &drm_sched_ops,
>> > 			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
>> > 			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
>> > 			     e->name, gt_to_xe(e->gt)->drm.dev);
>> > 	if (err)
>> > 		goto err_free;
>> >+	/* Record timeout value, in order to show current set timeout */
>> >+	e->hwe->sched_props.job_timeout_ms = timeout;
>>
>> But, timeout can be MAX_SCHEDULE_TIMEOUT which can be more than the
>> max defined in the patch#6 right?
>
>Yes, how should we handle this, any thoughts? Thanks for pointing this out. I think we need to change default max timeout in that case to match our config?
>

Yes, I think so, but will let others comment.

>>
>> >
>> > 	sched = &ge->sched;
>> > 	err = drm_sched_entity_init(&ge->entity,
>> DRM_SCHED_PRIORITY_NORMAL,
>> >diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
>> >b/drivers/gpu/drm/xe/xe_hw_engine.c
>> >index 68cd793cdfb5..8314429cfa90 100644
>> >--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> >+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> >@@ -361,6 +361,11 @@ static void hw_engine_init_early(struct xe_gt *gt,
>> struct xe_hw_engine *hwe,
>> > 	hwe->name = info->name;
>> > 	hwe->fence_irq = &gt->fence_irq[info->class];
>> > 	hwe->engine_id = id;
>> >+	/* FIXME: Wire up to configurable default value */
>> >+	hwe->sched_props.job_timeout_ms = HZ * 5;
>> >+	hwe->sched_props.timeslice_us = 1 * 1000;
>> >+	hwe->sched_props.preempt_timeout_us = 640 * 1000;
>> >+	hwe->defaults = hwe->sched_props; /* Record default props */
>> >
>> > 	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt));
>> > 	xe_wa_process_engine(hwe);
>> >diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h
>> >b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>> >index d788e67312b9..406a1e33a05e 100644
>> >--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
>> >+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>> >@@ -107,6 +107,17 @@ struct xe_hw_engine {
>> > 	void (*irq_handler)(struct xe_hw_engine *, u16);
>> > 	/** @engine_id: id  for this hw engine */
>> > 	enum xe_hw_engine_id engine_id;
>> >+	/** @sched_props: scheduling properties */
>> >+	struct {
>> >+		/** @set_job_timeout: Set job timeout in ms for engine */
>> >+		u32 job_timeout_ms;
>> >+		/** @timeslice_us: timeslice period in micro-seconds */
>> >+		u32 timeslice_us;
>> >+		/** @preempt_timeout_us: preemption timeout in micro-
>> seconds */
>> >+		u32 preempt_timeout_us;
>> >+	} sched_props, defaults;
>> >+	/** @sysfs: sysfs kobject pointing to this hwe */
>> >+	struct kobject *sysfs_hwe;
>>
>> Whwere is this sysfs_hwe used?
>> I wonder whether we really need 'struct kobj_hwe'.
>> Why can't we just have kobject defined here in the xe_hw_engine sturcture
>> instead of having a pointer to one. That way we don't need to kzalloc it.
>
>You are right, its miss. I initially thought same and added sysfs_hwe and ended up not using it. As container of does not work on pointers.
>
>If we add it as part of xe_hw_engine then also allocation will happen right! And other reason to keep this way was to maintain uniformity the same way GT sysfs is doing and same way its done in tile sysfs patch(which is on patchwork) as well.
>
>Thanks,
>Tejas
>>
>> Niranjana
>>
>> > };
>> >
>> > /**
>> >--
>> >2.25.1
>> >
