Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516FDEB64DD
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 18:44:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1576F10E6EF;
	Fri, 21 Jul 2023 18:44:26 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C437C10E6EF
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jul 2023 18:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689965064; x=1721501064;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=v2Fbsw765q0TMbyL0MtC7VMGry5XDSKbxruaGPWCW/g=;
 b=heDxzmUJliYV87yawR4s8qlBifBpjJ4hnwiJrqVexuqwqSlr6temp7Dl
 3WM3okM/p5lU4vGnXMrD8/pUr6nPOqBi7VkQsZX4il/wA9jTdXQcohCbv
 0KfbLrIIL4+cInDzQyMLy0iqojEe7e/hlM1pnBU7VBVfjdw1xDWlEk+uh
 +W0tKF7ig5mi7xHXklfr8oGJNEH5WlNzS5HsVaeMUlWOEmGAyo0L5mHc5
 Yf8t1wTAd5s/BUdrUoQyHaQZCwcyA243Bko1nvbk1tQsb50xYL6ulih9S
 Yui4T2Csqp3XIXNLW7Vbc+4n1DHVapusxGTSbN2vkGRqE+KCyuJgTvG+n w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="351977207"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="351977207"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 11:44:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="795052008"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="795052008"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 21 Jul 2023 11:44:21 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 11:44:16 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 11:44:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 11:44:16 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 11:44:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vbd9xNQiilW4QsD67IfhAMYL3ddzzcDfNn94oIa6dEuinZ0M3hjgoJ8k18C9wv5hpnZ7XkrvgNkdP+53TEg1fSEcXjj3O6GSStssSd+Qb+ooJLb6WFJzhPSfADdyLmGpQtHHzpIKScHavyho18dYPWOUC9zNK4JHwC8BJ4taj94kxdZXSPMNHvZN1ds6cB7Rqo9Jfrym+cEkbP2g8nZRYN3S0pSy3A0DQ6P5GhX8i+78fiKwW6A9Gw4aLIstv2ogeNL3VPXuZ/ZsrNLSxVfD4XM2o4rdqo0iSvOFnzDet9eFqjwhYdGkl8L2ndTS73P7x3UpckgXcWvc3XDIWj97VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6flGU+rYjlH+jG99fKljTe803zBYIk282rHjSUEgzkk=;
 b=NskTtkQUTWtews7AZMd1rZwHVVcjahdxJtPyKTrp1BfhXikqDepUNnoExQlVmP+Z3pWJqUaHruowxXen449rtIrS4Nocwtc7d/f51olsXgfiY9qHiDSEmA2W+bbSIZNockNRnlS5xz6LDNfaCzFXSY58EfkN6qeapH80Ya1ACYagkno9e96V1M/ZyksfCdvHU/MpZE/hjJsXLvsdBDBFI1H/V6sVBXpcoRdMZY8lOC4IO1ZmRLmv9915BPqhGEzg6iIC32aN7Y6Z+nzNcKP5n398c4ViaQuvTBCnTh4Isw7I8eahjZcj1aIjQFBZil4Xi/KV4MWigsqqZTM1jUP3/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6396.namprd11.prod.outlook.com (2603:10b6:208:3ab::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Fri, 21 Jul
 2023 18:44:14 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.024; Fri, 21 Jul 2023
 18:44:14 +0000
Date: Fri, 21 Jul 2023 14:44:11 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZLrR+xU1O1b4tUUY@intel.com>
References: <20230719192726.172056-1-rodrigo.vivi@intel.com>
 <2ed513ec-3a3f-1795-2761-ad1d39bb6a09@intel.com>
 <ZLkiAmNuvjdUi+09@intel.com>
 <adbd55cd-b75b-6b65-7c10-500bb1992850@intel.com>
 <ZLlV8lFWhwdl9hA7@intel.com>
 <37cb1b64-95ff-2f0d-f802-27e79fc55574@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <37cb1b64-95ff-2f0d-f802-27e79fc55574@intel.com>
X-ClientProxiedBy: BY3PR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:a03:217::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6396:EE_
X-MS-Office365-Filtering-Correlation-Id: bd6cfc85-3f12-4214-eb68-08db8a1a7b20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e6nJASTpLS3C/N2/smI5Cl2gatt6oGAm8r6iYAeDyuuT5qsFyIkv36xTfXyJxd3zMW3nAmARdrpSLFx1NawOknG0dCzkiYG+XIV+X/7vJ9j4yS21I3oBF6cCgoWycxql+tV02n7EDINS+5bXPYUEhQTF5mqaVKqmvazfUbqYok/FsVRkJlVSSEBeAUFozQtDvRyCk23hzBx42mZxmNE90k2nUzFblQG44Tg1dCogL8tryw5imvzV/0THs3ucN+B6h2cLHK3CoZESC2GVJhT6YA7wfLRTMJkjjRQkKzL90Abb776YPUHHWMdfM1PB/se6TJqPSQwGPko8dlBPdW2C46eu4SvG7671frcaM2QFKK45Lc7FB0pNQGLDZdKVd8LnyhbDFk9lHUjIork0JaJTMR69lZFuFRSsM9b1Ngfhmkv3xfHYuuIp0B4UueaRsqpwo7r/UlkqeklQ5+XZ4bfBgd5B4VPIAvqSKM8gI6UGISEq5bfIJ7KWkfguPKwQh2u/yW2yeHFarpSSFd42N7EC528bVem9kn0cSsLw0+X+MYs7TA0Z73sSUfVH0IT8kD5MUGxNhWK+FRQ32PJs0cno9v76kIICSHokqwAMtDIllRM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(366004)(396003)(346002)(39860400002)(451199021)(83380400001)(66556008)(66946007)(66476007)(4326008)(6636002)(316002)(478600001)(6666004)(966005)(186003)(37006003)(6506007)(6512007)(6486002)(36756003)(26005)(53546011)(2616005)(86362001)(2906002)(38100700002)(41300700001)(8676002)(82960400001)(5660300002)(44832011)(6862004)(8936002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TmFti9diFT8M2/olFbn5EZObzezVbD0zxGuKFJMknxfKuReMv0zixiAq8Gbv?=
 =?us-ascii?Q?qJFGa/b2XiiGYsgdcspL9ta1amzr/14F5Tnt/TrBHxhJBU+5ittcMR7P4Xpr?=
 =?us-ascii?Q?ieXB5/kayP1m4mx1gmbujiwGYB5Ht4lR40taGuoSv1yV0PGJyEHRg7oqnOvR?=
 =?us-ascii?Q?/rTUFleMHAmMKyuvQXs3mgSArqI9BWDQoiljYOvfHJUGrVwQLoeERktSl9OS?=
 =?us-ascii?Q?aHNakYaEPFjFPHODVtKwzYD+f1OjVCXXly8SJD41qtmumBWa/3fKpt1B0t6s?=
 =?us-ascii?Q?LSvGjigaS1xPfaKesVa/MOCKO9SEj334Y1VEgukwIRN/hRdyG+jNR/YF+XOn?=
 =?us-ascii?Q?+BvwccPf/3LPLoai1FTJ+yDo3rCr/qfI7uoqx7yPZMI4tLNE0fYiybl5NSDR?=
 =?us-ascii?Q?VwoKZ/zSsnp21paR52AVDVSPDe/00qS03XYahkwgrwZGLGJ0d8Voin839JiF?=
 =?us-ascii?Q?u/KS2Q4abxl4PX8AEBeFWmnHA33ZV1CuBJFUSdfRhP/WTGMaonSdwjQJvfax?=
 =?us-ascii?Q?rPp1utVc29QPy/6akIKnMTmAqU1gWuU2LdFWNcuPrGlYikNeXwDflMKvdNXo?=
 =?us-ascii?Q?kKgM6qqmXtRwFprFAJN9g8Xtg4PiCXBuSk9+JMpjGSY8CXqqlveVfNscX7A3?=
 =?us-ascii?Q?nyrVStq8ME6iFLriPmArJuGmu7QIqu/pkSzIHdi+/ItlL4soafBj26bo63uF?=
 =?us-ascii?Q?iVnMaiA9p7VTEyz+CH8UmzC+5tPXtgCAXZ6P3PNbHHeddjXNFgz+9xnON6Va?=
 =?us-ascii?Q?7ZtszrGlJLND1wztuuqEDPv8corjiugEXfIHjJnbLZ12qH2/g/IcEmIZgyux?=
 =?us-ascii?Q?1zuGdoYKzJpPpkTtlr4frTzYr31CcU1pI16l25cw8wDEIVLypcZ18QhzKB0p?=
 =?us-ascii?Q?WMUA3jyueN/BthPWk40mNrWwI41noN3B90I98H8wgxy7vCfi1e0l0834AI3q?=
 =?us-ascii?Q?Qh7EsOVckzO5n3Uy4gA+F5K2k/nuiT43eOitPb5QiQ9/Z8o+BdqEzlRj3lE+?=
 =?us-ascii?Q?eoYkb656TBckVexahD6ngxa0yA3hyFXrmZfjpDUbQhoYfsGZdTvbE54uwhBo?=
 =?us-ascii?Q?BhU4zTBiVC+GwQTA9T8E71Mhnz6JFuo8Y1MEMVibKmqe4oKWBpdw3yDCRX3k?=
 =?us-ascii?Q?mJHk12l/jvYmJPuAUYh7MdZL9x24JjZpuWUT1sjbuR0cCh+VKAftTXgtpJt5?=
 =?us-ascii?Q?snOSpQkAyKTu+Re5GPuNofqHV6mwE/GVhqO/7KB0LWF1UgJNpmPnnyw0XQYf?=
 =?us-ascii?Q?+BDQWVbM/2OVxXmh6Ew4tgIdwBsmbiGcJalSIxhIInW05B/S6Lw2bYjL7/mG?=
 =?us-ascii?Q?sbGWiZxWQlfbx6EGOcB9hCow/ffqyvI1gzisJZ4wGlR0MSy8pag3j2Hi3kwp?=
 =?us-ascii?Q?HIn6c/hPYvXPfB2bi58L8/ANkvPRvesb7MPSt2OJdznil57HyIDcPkfSbiLr?=
 =?us-ascii?Q?5qqml6JbdoVZ4fpIzX1AbtOPKqo1jWuLWg6WaAgyJQwrbX/ZalpuAYVzylRR?=
 =?us-ascii?Q?BkmhrtCb5gvUbgp7TUaRt3R90mJg+EIbmAFE6mUVBxcJMDVdxgXEUk7kARFX?=
 =?us-ascii?Q?LbO89IapOg4FYmpQaOJCQy/zwFa8b0cpVZLVZiK2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd6cfc85-3f12-4214-eb68-08db8a1a7b20
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 18:44:14.5465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LA8YKBD2qWaSL+LWwvSQKV6sjbjK3TL0bvWvGWg5+X/0uE50X6+uJw6Vi4Vcjv4BxC2ui6nbzC5+Ukp8Vztexg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6396
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix an invalid locking wait context
 bug
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

On Fri, Jul 21, 2023 at 12:17:47PM +0100, Matthew Auld wrote:
> On 20/07/2023 16:42, Rodrigo Vivi wrote:
> > On Thu, Jul 20, 2023 at 01:38:18PM +0100, Matthew Auld wrote:
> > > On 20/07/2023 13:01, Rodrigo Vivi wrote:
> > > > On Thu, Jul 20, 2023 at 10:11:00AM +0100, Matthew Auld wrote:
> > > > > On 19/07/2023 20:27, Rodrigo Vivi wrote:
> > > > > > xe_irq_{suspend,resume} were incorrectly using the xe->irq.lock.
> > > > > > 
> > > > > > The lock was created to protect the gt irq handlers, and not
> > > > > > the irq.enabled. Since suspend/resume and other places touching
> > > > > > irq.enabled are already serialized they don't need protection.
> > > > > > (see other irq.enabled accesses).
> > > > > > 
> > > > > > Then with this spin lock around xe_irq_reset, we will end up
> > > > > > calling the intel_display_power_is_enabled() function, and
> > > > > > that needs a mutex lock. Hence causing the undesired
> > > > > > "[ BUG: Invalid wait context ]"
> > > > > > 
> > > > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > > ---
> > > > > >     drivers/gpu/drm/xe/xe_irq.c | 5 -----
> > > > > >     1 file changed, 5 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> > > > > > index eae190cb0969..df01af780a57 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_irq.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_irq.c
> > > > > > @@ -574,10 +574,8 @@ void xe_irq_shutdown(struct xe_device *xe)
> > > > > >     void xe_irq_suspend(struct xe_device *xe)
> > > > > >     {
> > > > > > -	spin_lock_irq(&xe->irq.lock);
> > > > > >     	xe->irq.enabled = false;
> > > > > >     	xe_irq_reset(xe);
> > > > > > -	spin_unlock_irq(&xe->irq.lock);
> > > > > 
> > > > > Do we not need something like:
> > > > > 
> > > > > spin_lock_irq(&xe->irq.lock);
> > > > > xe->irq.enabled = false; /* no new irqs */
> > > > > spin_unlock_irq(&xe->irq.lock);
> > > > > 
> > > > > synchronize_irq(...); /* flush irqs */
> > > > > xe_irq_reset(); /* turn off irqs */
> > > > > ....
> > > > > 
> > > > > And then at the start of the irq handler:
> > > > > 
> > > > > spin_lock_irq(&xe->irq.lock);
> > > > > if (!xe->irq.enabled) {
> > > > >       spin_unlock_irq(&xe->irq.lock);
> > > > >       return ....;
> > > > > }
> > > > > 
> > > > > Or did something happen prior to xe_irq_suspend() to ensure proper
> > > > > serialisation with irq and the above steps are not really needed?
> > > > 
> > > > the suspend and resume calls should be serialized by itself, no?!
> > > 
> > > Is it not possible for IRQs to still be firing or potentially be in-progress
> > > here as we are preparing to suspend?
> > 
> > yes, it is. We are letting the rpm to run with irq enabled otherwise
> > we will face the same invalid wait bug that this patch is trying to solve.
> > 
> > But I don't believe the right way is to use the lock to protect the irq.enabled.
> > 
> > Taking a look around I believe that what we are missing is the
> > synchronize_irq() call right after the reset. So we ensure that all the
> > racy handlers were properly processed before we allow the suspend.
> > 
> > So I believe we need something like i915 that would be:
> > 
> > xe_irq_suspend()
> > {
> > 	xe_irq_reset(xe);
> > 	xe->irq.enable = false;
> > 	synchronize_irq(pdev->irq);
> > }
> > 
> > xe_irq_resume()
> > {
> > 	xe->irq.enabled = true;
> > 	xe_irq_reset(xe);
> > 	xe_irq_postinstall(xe);
> > 
> > 	for_each_gt(gt, xe, id)
> > 			xe_irq_enable_hwe(gt);
> > }
> 
> Ok, but tbh I'm not completely sure what is going on with irq.enabled.
> AFAICT it looks to also be exposed into i915/display with
> intel_irqs_enabled() and that seems to have various callers. Are they not
> holding the lock?

Oh, they are really holding the lock.
I had missed the
#define irq_lock irq.lock
at xe/compat-i915-headers/i915_drv.h

In i915 I noticed something strange. instead of checking the irq_enable
they are using a secondary runtime_pm.irqs_enable and the only difference
is that this is set at the end of the irq reset function. while irq_enable
is set at the beginning.... it looks a hack to workaround races?!
at least very suspicious.

So, probably the right solution here lays in i915 side:

1. convert power_domains.lock from mutex to spinlock
(sent to trybot to get some feedback:
https://patchwork.freedesktop.org/series/121155/
)

2. then, add the spinlocks around the irq reset (or install and uninstall)

3. then get rid of this runtime_pm.irqs_enabled in favor
of the irq.enabled.

thoughts?

> Also the write here is to shared memory so without the
> lock it's unclear what is going on here wrt barriers and unmarked accesses
> (missing READ_ONCE/WRITE_ONCE?). I don't want to block you here since
> "Invalid wait context" is breaking CI, so I guess just go with the simplest
> thing for now.
> 
> > 
> > > 
> > > > 
> > > > no other place touching or inspecting irq.enable uses this lock
> > > > anyway, since it was created to serialize the gt_handler.
> > > > 
> > > > > 
> > > > > >     }
> > > > > >     void xe_irq_resume(struct xe_device *xe)
> > > > > > @@ -585,13 +583,10 @@ void xe_irq_resume(struct xe_device *xe)
> > > > > >     	struct xe_gt *gt;
> > > > > >     	int id;
> > > > > > -	spin_lock_irq(&xe->irq.lock);
> > > > > >     	xe->irq.enabled = true;
> > > > > >     	xe_irq_reset(xe);
> > > > > >     	xe_irq_postinstall(xe);
> > > > > >     	for_each_gt(gt, xe, id)
> > > > > >     		xe_irq_enable_hwe(gt);
> > > > > > -
> > > > > > -	spin_unlock_irq(&xe->irq.lock);
> > > > > >     }
