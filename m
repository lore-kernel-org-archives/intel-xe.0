Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C175EC0015E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 21:35:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A6410E047;
	Wed, 26 Jul 2023 21:35:25 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5173910E047
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 21:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690407323; x=1721943323;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qcjwIdaJI/bouMi4Td+fwbj8WSuhq6Kr3tnECbEfg7Y=;
 b=WHvnhp/tUmTuGnt6YR56EPH5FDwl4kD/TWvrhjK80WogBoZnKygRaOBx
 6KcpzrslfGtWErA1LVAyDSNAFcA6rxPsO82FdVYmVmrNrFVbIgMviHXfZ
 pbZpxPsvAhuex2LaONvs2GcB9G8Kh1HrkwmXiAeQf4mijpkXOgO4xLkn+
 F52HZS5nmh7G1JsuYQ3NcHO8VdPLlSxwCUX9GcElbUIrYu2387BM3u4SO
 s0gqKok+HSEMXn33wriiEkLQhMsRW/5dd2iz4mpZbD58eMXDze4MEyDOu
 qnQMWmM4dyJrL25IhHz0pAWXjgMCfiPyYBF2C45iIY+zjkvpVvSr4ErTu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="454506093"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="454506093"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 14:35:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="730012311"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="730012311"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 26 Jul 2023 14:35:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 14:35:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 14:35:15 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 14:35:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YYPvqQ7hjEAsTzMtwKZJ9j/N1pDo5HYcSzuYlEbRVx6UkBf4qcU3HOVopZK6c7b4LfEwGspPHL2u8lydZxbHFsoab/YY5KIXu4RIzFl5ipmRQoaHyDhfSzqq4kllBQbbzHgTHviiofo9fiE3jnCQY9cxLJNDhHVf9qCcSZqyZNFdi+0qgh/AsybsET8C1Rh2K4oZdT57ctUO0TEKtmiBui/jAVvLaRDnewKVaTU+yCbD8hZg0ZU66dPZX1qgy0dOkan+Wb8m8ICM2tUWow9edqPdSLKOYHbuLwbe0xQ7bljP2jub8z4KLeNTula/6jCR0roJLYFINHvncplpCw4ehw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ga9nqUyqx+lvWI3ErlDXcA4yBh3tbMAi+OJuL3fnjzs=;
 b=MCLNXyWxdp9CK9RQstIih/xs3fZQY2dHtTqvKTWWwpDoHmJG2m80ayqCZm5+LIKlqk4O5mQG49dyhAWLHb03EMl/02GEdkYdC/rUpJVlYv288STaoi69aurcCwgEZw5mZxk3ixs8xJ+xkTum3er+122dz6ErHysF9asIMONWoCslvbbASvBOeleCCsR2xL55H3TacP+Ty7FYq7TTcA8v3wI6dsocv7yMf7o++BJPMV+7diJP6rETw6HzCBmpkqv/WOk4I/2J62e1+gi7SD4QbzHRRpt475ER+LYX9Je6QEMpH/TozBmaYkBImeqPxxKDiT9ELhDSI413jRlUEPDk0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CYYPR11MB8329.namprd11.prod.outlook.com (2603:10b6:930:c7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 21:35:12 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 21:35:12 +0000
Date: Wed, 26 Jul 2023 17:35:08 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZMGRjCuCVkXezCty@intel.com>
References: <20230726192520.383531-1-rodrigo.vivi@intel.com>
 <ZMF0LMxahswx9wyn@DUT025-TGLU.fm.intel.com>
 <01fad5a237f5018521cf426342fc2bac975e09f1.camel@intel.com>
 <apsfze2qz55irp3eltsantis7gkb55ig3snlobpmn5pdjelgby@jiyfoa3kelcb>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <apsfze2qz55irp3eltsantis7gkb55ig3snlobpmn5pdjelgby@jiyfoa3kelcb>
X-ClientProxiedBy: SJ0PR13CA0106.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::21) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CYYPR11MB8329:EE_
X-MS-Office365-Filtering-Correlation-Id: ccbcd459-6c5e-4868-a7e4-08db8e203194
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vNglc+FO41z/RmcRVDx2FbtZJGYYeywcVw51TRA73AFW52rkAxCPgssKhufrNlrIWa5n6ZbEIunC5skT1o6KPsH1QvKKFFHWDJA/zj4rp+yyPJM8/kuG1FLqU3BO5V/HOrHYsB+GAW7sHLbjSAhyZuKGngB3Nc1nU5ZyTJKAGGn9r9DRajcWDUweTblbQ63IIF2Docafvme3GmGr6lwAwGVra04INlY1Mcpv+uRqPXm4huveVaH/oKeVFQNjPo0ppubz6Pwxd2w6ED8OXERBHXe3rgKo1gD58SMt2j7Oj2JiVdEQFpXagLVkGf7QdVB6zYqfSLYg4lZB4TFjjm/i3M6fu2G/wSwSKMoWCzUlnnBCU3LDPuKKd1dVF+SZNlzzt4IGJxm7+cPrLG2FYdeqckC+B73G4gWUhKoPbjNGfbMMkvlyz/rAIImswPBZBPy3zVy9ur3d03c0ZJyCTF50cxCwITRyU4QgtwXRRlsgYfEubxkERSkPOcSFeSxfII9XdDqiYoc86uahu/rjGC8E39odQ5dTJ3GmllKyt8527wg33LWC0G8VMTQpWK07GLNR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(346002)(396003)(136003)(39860400002)(451199021)(316002)(6506007)(26005)(8936002)(41300700001)(6862004)(8676002)(37006003)(54906003)(82960400001)(4326008)(66556008)(66476007)(66946007)(6636002)(478600001)(6512007)(6666004)(6486002)(38100700002)(36756003)(2616005)(2906002)(86362001)(83380400001)(44832011)(186003)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e0Yj0bKiTJYYw2WbjzEj72QMe1mRi+/Gd/s8VlzVnIK4TrXGn75r7clcf7Uq?=
 =?us-ascii?Q?69yMA6vWN2zSv/S5dlMNYUgJwwDzm4p/xHJC90n7k+vk65cuiSVC+Ql51qiz?=
 =?us-ascii?Q?JsFbGwOJrSECkT4dTRoFAGRevaOmMLHBl0dARxSHy8CDeBYAidzNA0m12ypb?=
 =?us-ascii?Q?m8+3g2DdQwKKQNo0FGPyRN87xX+cDnl3bQxwICxtJEoX/MkY+y5eZrfQ43kU?=
 =?us-ascii?Q?mNq8Fvt7AsdGzfpPMm31C/JAoBcZyQV4Yzv4SlHHgGF+im+CNx309KRrkjOl?=
 =?us-ascii?Q?RmCxxJpWTDVOupSc9irPNZUGzAW0RxRreoqK4GLNucuw12VjJ3yMEJ8Gyyc1?=
 =?us-ascii?Q?G5GiDkhkgrP79Gx3Mn0L7ulw8lnW5PDsBorMu44pwcBeXwnF7V/Nn6ScPhrb?=
 =?us-ascii?Q?099swHNulz/weLhd3pUt8lOQhGPpPeLd308K7KP+KloAHNoxjChB2OxBg14I?=
 =?us-ascii?Q?osnaVtWVdoKcK/5pJEzeUrOH7tFdKL3XmS6ruOpb5VVlAzX5PaYNnJTzR8mr?=
 =?us-ascii?Q?PZ9YP2qq+RKmXl3VpP8YTEclCaaPAk2QyNmTMJivocmzqO/2uW1d1Ztsq5TP?=
 =?us-ascii?Q?uSnQtllm0dqqdbb8PK4/XG39KO3Pec5IxrpzLpNoS8uKdG0n5GsNg8FWrre4?=
 =?us-ascii?Q?qo60KusIOkwsAOLvpfOVkpKMVwwxZopQp9ZhoyIkgJGZvbrjN2r0sS8XESVZ?=
 =?us-ascii?Q?3DjvtJ3ps0x1oqUcDLrE85b6LOh+gccB5VOpyLD0Gnq80NQiA4vXTdBRDJbB?=
 =?us-ascii?Q?WVRU8apDxTZ4TGfmmcETfSy8Z7lZcLXygx7r8/hpwb8umg3vgae8Kmdshtf9?=
 =?us-ascii?Q?X/zgEHEtxxvmyE4RVlxvR0J5BDNnoto9bicNRwHHHf24bKRuTr8mFeUnJy8o?=
 =?us-ascii?Q?YyDpT2yFt+lzxCqGqvJBL49SfSefcMVHuMMi69MzrcN3kLYHX3lIX45dqSGq?=
 =?us-ascii?Q?m4NdKb/2s2xSTjauas/q9wgfzPaHj2H+80vEcAdCvLKTe8AwkNtL83MHwxoO?=
 =?us-ascii?Q?f0Z44H9hhNViy7Vu+q3dXVyZlGcL1POIzjU/JX+0GYjzL3m4PYGAJdrPBvFJ?=
 =?us-ascii?Q?utD4P822di49JhVKjbSODb2mosBHH36M+tuasG9TCk4ma/uFeRj673BWJfRz?=
 =?us-ascii?Q?F/V56S0kbh7vNro4B3v97Oj23ROgxmdveg4XCzTvy5kuaXaPP/3+A/VUi7Ba?=
 =?us-ascii?Q?o7mnjNJwQ9KUUlqrDWoZzg9cAmeZNcII0vS+tvjhOcezpbUo+r2FXiQ7iDhK?=
 =?us-ascii?Q?QFZMU8JM0Ep9iPp9cuW6J6g7UL+EioyJ9GKEkKnFX3VEOuVi4z/Da69C+Whb?=
 =?us-ascii?Q?zC8aiEPg6+o0lkiPp40FtPx5n8mF3qcGa5IrYBGIxMdE/4WF4lucRjzbMxC0?=
 =?us-ascii?Q?Np1tljNqr2SIR7sVJYrMwjfJIj+iPu8BjryHzZl/BLl0O7ZTyisugOWx60Vc?=
 =?us-ascii?Q?f9Fxh6mxJibxgsqQcMs0HZ4VlGS2Awlnho+M02TLOKei3GRixmHY8U+Kzayj?=
 =?us-ascii?Q?m5wxNdJ4SThCBphLLkSSu4YLqoH9vN8+ezgm4qkNlk7VN4+1ERC4Tn6JOTSY?=
 =?us-ascii?Q?k8ZIfBy+/ejqCuqf+nceWxfCxjjdlZ+mVOBUelVoY7hgHaG4k09P0oCGRfQz?=
 =?us-ascii?Q?8w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ccbcd459-6c5e-4868-a7e4-08db8e203194
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 21:35:12.7565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1T792UGnclx9lKPEzDgjgMpYI6s8xI817eteoDIupVZi361MxZU9w0ISdyKLL1AhU1+G412BUfXTgWNKK3Q8jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8329
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
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jul 26, 2023 at 05:38:13PM -0300, Lucas De Marchi wrote:
> On Wed, Jul 26, 2023 at 07:37:43PM +0000, Rodrigo Vivi wrote:
> > On Wed, 2023-07-26 at 19:29 +0000, Matthew Brost wrote:
> > On Wed, Jul 26, 2023 at 03:25:19PM -0400, Rodrigo Vivi wrote:
> > This might be an useful debugging information if the driver
> > date is properly updated with a certain cadence. With this
> > we know from which point in time in our development the
> > driver was from.
> > 
> > 
> > Make sense to have this, wondering what the cadence should be...
> > 
> > before we are merged we should probably change the date along with our rebases.
> > 
> > after we are in tree probably after the latest pull request towards the next version.
> 
> 
> does it really make sense though? I think this exists only because of a
> pre-git era. What's the problem with using the git short hash that will
> automatically be updated and accurate?

well, we still have the drm->date to fill so we need to maintain it.

maybe we could do like nouveau?!

#ifdef GIT_REVISION
        .date = GIT_REVISION,
#else
        .date = DRIVER_DATE,
#endif

> 
> Lucas De Marchi
> 
> > 
> > 
> > Anyways:
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com<mailto:matthew.brost@intel.com>>
> > 
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com<mailto:rodrigo.vivi@intel.com>>
> > ---
> > drivers/gpu/drm/xe/xe_devcoredump.c | 2 ++
> > 1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> > index f53f4b51233a..79b506dc2622 100644
> > --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > @@ -10,6 +10,7 @@
> > #include <generated/utsrelease.h>
> > 
> > #include "xe_device.h"
> > +#include "xe_drv.h"
> > #include "xe_engine.h"
> > #include "xe_force_wake.h"
> > #include "xe_gt.h"
> > @@ -83,6 +84,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> >        drm_printf(&p, "**** Xe Device Coredump ****\n");
> >        drm_printf(&p, "kernel: " UTS_RELEASE "\n");
> >        drm_printf(&p, "module: " KBUILD_MODNAME "\n");
> > +       drm_printf(&p, "driver date: " DRIVER_DATE "\n");
> > 
> >        ts = ktime_to_timespec64(ss->snapshot_time);
> >        drm_printf(&p, "Snapshot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
> > --
> > 2.41.0
> > 
> > 
