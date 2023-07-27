Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE1AC001E0
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 12:06:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A8F10E343;
	Thu, 27 Jul 2023 12:06:33 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E8E10E343
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 12:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690459591; x=1721995591;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lEb5HuqjBqTYXt+hEsDQI6o0e+VRv4B8FURanAVm3TI=;
 b=ZJ5R9SPLMwY/sA75jRAwoyRkCUlRvS4WKVMrIdM8+lPsNEpuZB7g+qQb
 OOrFUpzNZuyjob/kQgT5oLAnyLpGJokI88nFjWuE8bfgiFvFLj1pk9T+x
 clvTf0iRNp5kHIx6GwR716DjIGWQwgjZqMplEfGJy1SXptVc5Mr3cw28/
 9mveBLzbiL6Qk4OlOee83xYUnSLBsK5l0PhBnRlwoM7Tr8+3ll7EVnUaT
 6+CxKocleNNGMKFB8Fqo6SaA1d8Mk/UfL/BlFGNVCU5h0yXwJDjZs0OPn
 ULmwiH3NGjWwyddcyPqjR8yTfTDpMik/LzXUPqHFiRBKGpMevyKM0Qj63 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="365748484"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; d="scan'208";a="365748484"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 05:05:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="1057698414"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; d="scan'208";a="1057698414"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 27 Jul 2023 05:05:05 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 05:05:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 05:05:05 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 05:05:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PiQmWkaMX7dM8MxlRqjoSS1CYaP5PFTDh/04lR0TDqJ0BWujqiNCl3kg6FDrU7yY5SOH94gl6uUzG8gsSe8vVyI5ewsItC832Iw8IuD60a72ueSN9RWXECZRUIFyFnmUmMod4ew5B7vbgVpaw120eCWbn59Uiw6qXPUhAjiqtslfcO/rbdqxO8hnCBJZ2v5A8eJYJZJs2I5hcBgbOhetUqaz+sl4G6xj9jDnatO3s/3fbKO2K8fXNIqHpG9Y1O8XdCwdho1lY3JoY8lDEJVRsQztcmQ98q+nK/vYNs871Xwr+JcmJBLm5otUfQCO7b7LXLlOq8YC42BhqexbXnUn8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2YIMXxeAHt/p8AuV4hil45EBjcW0AquUeH8WWmUG3O8=;
 b=n2YG6W2uCbVl9boKQn91dVkXE1a9w1C2Ox1icFdw4G48UxBy6yIHY8Pvy/yvnsgOtCIfVQ6f42gI/LXxddlxC3hUrdwfRKSXhYNWf+fbRiAZvNy6ZmSkLAVU1gWqtikuxT01wpYyt5DrMzYOlOi1k0ZcRmWpcsI3a2+m9WXrf2AGCNraFiY3YfuCmqoyTc3Iy/Wxsad3+mZgbbLdVzBe7CbMDL9IYjmU4eLdNPhchRDf3IUzk9wz8AdD28/ZleKJ+cQm9xP3zaU1MHNo8XEhQE/i5fkEo2jEafac7r1/iHkJIMRAXJCEvOVF9EkoPqbd/cDTMw/4MdTMnTCT3VCu6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB5555.namprd11.prod.outlook.com (2603:10b6:208:317::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 12:05:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164%7]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 12:05:02 +0000
Date: Thu, 27 Jul 2023 09:04:55 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <xh23li7qzshcuheqlaue2pbwtfzdm7uygowpkovtgc52r6y2tp@apdgbzgegvpy>
X-Patchwork-Hint: comment
References: <20230726192520.383531-1-rodrigo.vivi@intel.com>
 <ZMF0LMxahswx9wyn@DUT025-TGLU.fm.intel.com>
 <01fad5a237f5018521cf426342fc2bac975e09f1.camel@intel.com>
 <apsfze2qz55irp3eltsantis7gkb55ig3snlobpmn5pdjelgby@jiyfoa3kelcb>
 <ZMGRjCuCVkXezCty@intel.com>
 <gfkhtmyxmaag4s2z7ux4a5lgx5l2ad2f6oohibbpvcidn4xngi@vfyqjexmrjwd>
 <ZMG2QeWpRabPTXd3@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZMG2QeWpRabPTXd3@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR03CA0239.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB5555:EE_
X-MS-Office365-Filtering-Correlation-Id: 1344b735-43ff-4021-fec6-08db8e99b4a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UpDM4qNVWxWaAt0EUfW+X9MLkcGnnKYsKmGr/1Bj16Fa7p8tV1AVlA7BltloO6i/ucs0KZVFoQyOwTBCr/drol93WPrLb5YBcxW5grs1Qgc2ReiIj/CSDM/BtlYgo9Azzo0hej2EZuiTYVWpowSfhRqZAUrdlHBPPkpxNP8v5rpzi1EhVzS6Hn2zX4N3lhvamEVWYfZR1e4nBi9vHSaB1M5syZdnSlN376eZ2ECitT+scN2HtwTttknkBMX/n7Rt7SCwWrTRtWyTVJcJr7oo7WPaRrN+2xObkexL8K8r7WkxBcJmu3xtC7s1u4ntuO7fw2Bw3Lp1Q4GTnh6It3Ykx62B92ARg3EtSLzRVK6HX5m60eNPhFwrL66i+JiFZusqfbOdRGjdQYml3UhCV0WrIdua6wOy6dcI8OyvK95EzBjsB378JjHS369Y2GfVYEgFo31RNkwsUMUAAkHWNKFUbhaaouQHQH67FYPHt0KlkcWih0Ya+kY2d+jlyUVG6HGxs98Zos6W2tLB+6ZeRc5vj2UBlAIKksBoskKB+w2esCqdAJlaasoxcE+9hPLWLkjUcrS7XFa+xm5QjZSrPHZL8F1yVWPjiWdR94f92w0Ou0SmOsWKmMmK688jGfIKKIxH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(346002)(366004)(396003)(376002)(39860400002)(451199021)(83380400001)(478600001)(54906003)(5660300002)(6862004)(8676002)(8936002)(2906002)(41300700001)(6506007)(82960400001)(66476007)(33716001)(86362001)(66946007)(38100700002)(66556008)(316002)(6636002)(4326008)(107886003)(6512007)(26005)(6666004)(6486002)(186003)(9686003)(27256005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CG9O6G0SBbgn8mdHpzIq9SjoPFSbGnumDn17m0oigVvOnqp+H/0Ss+l0wF17?=
 =?us-ascii?Q?sDYZzJGk7EHd4UQ/unSveOhEatF/ZVJ/PMpEpry24ZTBNwwbI4oXbiR/pu95?=
 =?us-ascii?Q?sMqxWZ0RpceE2KP/bzIVIVdyNR31m966cIKMnbm3pGX+J1l2duvTGsUKqJBI?=
 =?us-ascii?Q?Z+cFuhW0hk+EcIgLJyqnmp8Sq5+QYC6DmhiZbB0qtvRlb2BBBxyk2IEBbjX/?=
 =?us-ascii?Q?DSKuvwjdQktXzaJFmTwvDVyKTZCd8n7renovA9sHIRWSbeZtZequI1+N0HAE?=
 =?us-ascii?Q?pH4Gi7OvwEd8Jhi2Y/gTGnGJFk23B6dpSbZblPwaoNZ6wIBrwB0GX/RMefVf?=
 =?us-ascii?Q?FVeDoOmg2JZdhbOguQPRhjT/szwmeEuLanZsUu05uZxNqEQ3lnGJFvD8LbaG?=
 =?us-ascii?Q?+k57FtTSmwuZIYm3kW9UJ8tKMCEO5Vx4Y+SpzgKVLLklmGI5EqCd4D2M6Q5b?=
 =?us-ascii?Q?+4lX/2RPMa6cVxtHvQ1mlNJFe20tFhT4J0I4XqA5A/ubk7Bf6G+cBXLPQLNW?=
 =?us-ascii?Q?7V5VYSTgJgCDDs9VuXp4wL+IdQFBY9FKvLTiKVP9sJScpe897JX3dGZxxXq/?=
 =?us-ascii?Q?o2fhv41QJjx93vjYR9ceDyw6mhxvbjhCGvevpTRZqaFEeXdPwUpXyJrWmvAY?=
 =?us-ascii?Q?b5jm+yTxmS4L5BJ2CvS5u19WwKZFhwcTpWnc8BHLozExmL/VfaDBFT8bxVFq?=
 =?us-ascii?Q?VWFuACQDQrQkNHXctAWgTNIuRKbgxTwbDrbFFj13hcNJd5C1M/B2u2IgDWJC?=
 =?us-ascii?Q?dM0Gqp+e6hB7F9CCQ1VXK/GDpT/S+8yhX4mTcszbQeUzuLZXlVXlxoiIoE3Z?=
 =?us-ascii?Q?mSBCvOqcd0KCJC5Pq3VmkJX8kEvSv2q8kyTEfkEHm5jkwWKUuQk1nsXCrpZz?=
 =?us-ascii?Q?3NerMbtxPwnQIWYJ4L9qqLN8nFSyf5hFy7JpjCBaWyNiBTeNR+/Y6Y5OGrpr?=
 =?us-ascii?Q?Y4k0UCLY/gM83sCaMGuLG61sf2G95rB0oW20ZK5LAT1Ons1lHtOrl1L6TAFa?=
 =?us-ascii?Q?B9huaLgbZ/RygwesVI7F81pnD+mA3KGq2L+godBYnZTe0srJqwuHdiSBNbZE?=
 =?us-ascii?Q?IcCVbUKTYJMsEoOIsWHirK4FQs3T6NHbXk58EeJZHL9pm7EsXFTfXPW3Zkyl?=
 =?us-ascii?Q?M927SS0OBtYT87n7zBsKGtgRrjf+d0h8zaGorlmIM7MWdCbi/EifJmID6gwn?=
 =?us-ascii?Q?RJUj21MLXIZkqj7mE2hm0xpccMePQ4bX1P7NciNQHG+xW18iBwJA2Wci3PF0?=
 =?us-ascii?Q?eaJUtsElieoV9GWL/eeCm9hTqqj6Lk75wbWp8GN7YZhUIB8Kkp3tTh3lZ4Pt?=
 =?us-ascii?Q?ZUMbjyvc/wAHB2SbQfPGErMx6Cf0H8le7EnYqBUNVAD9i3AMOTJGO58/G6n3?=
 =?us-ascii?Q?P9rf8OSI+WOsuIPJcGW07nTd2uSsRmtd8a21wkBV+34RaFphEEzikLrzgb+d?=
 =?us-ascii?Q?1GXsz50wgJC0Oo7KB/ybvzWW8m5yXKp7mWBLe0rGRC/4SBwqRlzwFuZWTVXX?=
 =?us-ascii?Q?vwn4PQlhCyGKSQ4vCGsSkTHLql9vS5+bL1tHaKOXY8Ev+AZt1SxlV/tCgAIV?=
 =?us-ascii?Q?ZkZf5ImiFQQqj7Jq9Bv7g/i/xHFrub8ABNzkvfowMcU1i2ftzF1GiI1YSiwE?=
 =?us-ascii?Q?Zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1344b735-43ff-4021-fec6-08db8e99b4a9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 12:05:01.9414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V34HJsF3VWf50ZrVfbPSpCdQs+aiCAkvY1RNZyIbsYdEOjuszUaMLOKAH5GbE0rlG/5oC8SveVd04m2ZqJ27q9UHawPgZdUguH/VXc5eS5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5555
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Add DRIVER_DATE to coredump
 error.
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jul 27, 2023 at 12:11:45AM +0000, Matthew Brost wrote:
>On Wed, Jul 26, 2023 at 06:58:01PM -0300, Lucas De Marchi wrote:
>> On Wed, Jul 26, 2023 at 05:35:08PM -0400, Rodrigo Vivi wrote:
>> > On Wed, Jul 26, 2023 at 05:38:13PM -0300, Lucas De Marchi wrote:
>> > > On Wed, Jul 26, 2023 at 07:37:43PM +0000, Rodrigo Vivi wrote:
>> > > > On Wed, 2023-07-26 at 19:29 +0000, Matthew Brost wrote:
>> > > > On Wed, Jul 26, 2023 at 03:25:19PM -0400, Rodrigo Vivi wrote:
>> > > > This might be an useful debugging information if the driver
>> > > > date is properly updated with a certain cadence. With this
>> > > > we know from which point in time in our development the
>> > > > driver was from.
>> > > >
>> > > >
>> > > > Make sense to have this, wondering what the cadence should be...
>> > > >
>> > > > before we are merged we should probably change the date along with our rebases.
>> > > >
>> > > > after we are in tree probably after the latest pull request towards the next version.
>> > >
>> > >
>> > > does it really make sense though? I think this exists only because of a
>> > > pre-git era. What's the problem with using the git short hash that will
>> > > automatically be updated and accurate?
>> >
>> > well, we still have the drm->date to fill so we need to maintain it.
>> >
>> > maybe we could do like nouveau?!
>> >
>> > #ifdef GIT_REVISION
>> >        .date = GIT_REVISION,
>> > #else
>> >        .date = DRIVER_DATE,
>> > #endif
>>
>> Sounds better. I don't see any value on DRIVER_DATE and having to update
>> it. Just setting to some dummy value when GIT_REVISION is not available
>> would be ok
>>
>> 	$ git grep "\.date\s*=" -- drivers/gpu/drm/ | grep 2023
>> 	$ git grep DRIVER_DATE -- drivers/gpu/drm/ | grep 2023
>>
>> Tells me nobody really maintains that.
>>
>
>Well I think we should attempt to maintain this, a date is helpful to
>give us a very quick idea of when the driver is from without having to
>dig through the git logs.

I don't see how the date helps with that. Nobody really maintains the
date as the grep above shows. Even if we decided "we are going to be the
outlier and really maintain this because we like", then it would be a
date every .... 3 months?  How is that any useful for whom got the
coredump?  Once we are merged upstream, having the *kernel* version is
maybe useful, but the date doesn't really tell much

Lucas De Marchi

>
>My opinion is both of these patches are valid but let's add a 3rd patch
>which also includes the GIT_REVISION in the core dump and perhaps a 4th
>that makes the date plus GIT_REVISION easily available in debugfs entry
>or something.
>
>Matt
>
>> Lucas De Marchi
>>
>> >
>> > >
>> > > Lucas De Marchi
>> > >
>> > > >
>> > > >
>> > > > Anyways:
>> > > > Reviewed-by: Matthew Brost <matthew.brost@intel.com<mailto:matthew.brost@intel.com>>
>> > > >
>> > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com<mailto:rodrigo.vivi@intel.com>>
>> > > > ---
>> > > > drivers/gpu/drm/xe/xe_devcoredump.c | 2 ++
>> > > > 1 file changed, 2 insertions(+)
>> > > >
>> > > > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>> > > > index f53f4b51233a..79b506dc2622 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>> > > > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>> > > > @@ -10,6 +10,7 @@
>> > > > #include <generated/utsrelease.h>
>> > > >
>> > > > #include "xe_device.h"
>> > > > +#include "xe_drv.h"
>> > > > #include "xe_engine.h"
>> > > > #include "xe_force_wake.h"
>> > > > #include "xe_gt.h"
>> > > > @@ -83,6 +84,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>> > > >        drm_printf(&p, "**** Xe Device Coredump ****\n");
>> > > >        drm_printf(&p, "kernel: " UTS_RELEASE "\n");
>> > > >        drm_printf(&p, "module: " KBUILD_MODNAME "\n");
>> > > > +       drm_printf(&p, "driver date: " DRIVER_DATE "\n");
>> > > >
>> > > >        ts = ktime_to_timespec64(ss->snapshot_time);
>> > > >        drm_printf(&p, "Snapshot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
>> > > > --
>> > > > 2.41.0
>> > > >
>> > > >
