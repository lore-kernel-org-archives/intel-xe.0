Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E7CC10DCE
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 13:44:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C219910E28C;
	Fri,  8 Dec 2023 13:44:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B53210E28C
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 13:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702043089; x=1733579089;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NMdfjtVKDrra8RqkPGFTtIl1nJ8aKIS7hFV+7ckOpCc=;
 b=HJeEPJIAmpN2+KPzU4F9dJJ3l4iNKUNnbDz0NmvNcUCvIMyQZEXKUddY
 WSIg+KZ/RHK4raw5s1I1TPeAYfP7QQs0RdfvElq9iFVeQrdswHiN955o/
 GVEq6WjRVE3UrotxFJMzqHq7GqPIe3lFC80ht7/lDd+O6BkZYUZ96+iEU
 7aKTFqeo2Gb5JcLimZ/U/ALQo3sT61ceN87JFOMaStQBYh24flyQT5DFI
 bojgDZziOBfcOuM2V03xcbj3DDuqK94by0/gRSWf+DXaKdRCsP1KIHMst
 Y4Z4FvhegIdhpFOv9rpASm4ASPRm2HdqV3I/gcak8ZrORoVeJ83/IOjri w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="398272299"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="398272299"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 05:44:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="838130099"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="838130099"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Dec 2023 05:44:48 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 05:44:48 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 05:44:48 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Dec 2023 05:44:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J8ijbQvlMfKaIrZ/WDFiYLGaXvmKQf7p2kU0AGis7/kFn0YPi6Fkdgv2j1w4Tp/lKGbq79kGAX+D1Ft3xGsDVzYL8eeZWrfKkejMeRx+fIL0GbKKMmBBGdNxsMjj8GtNEnPus5fqGfgU40AQkA8gmahlBsAwm6X/JO7INa2ZcDAgKEOZqlKW87/J1DTN3hDbsoZOgb+mqCSlVIgsb4HlwXnnYirMrbLvEZ4IRFfqrIbCbWstrWj9kXYX5U/byjcnrcUkUw7qoR/BGxMJ6nqpztx/ICchH/8DynOlqNiVf6tz9/CsBDGYoUhs4Me6UPY6SJfZJwnxKXfxsq28CSPRNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwU5O97jkQvhtPVI0bFEZA0A7rFZub9l2gzF0ealUv8=;
 b=es+8mDtNzZf7mlVUE8AeLJ7Uc7OpPbV7r4g+lkVNvn+zl00Da4I0TTwq7RH0llKf9S02lrJSqA2gv61IJQ4ymdEZgQZGR/1StFznFvawdxj45EqxJiMQX6GS2Vs2iLJXthgFhUeFo3Mt8HrKyLTQ8H4Kelvc5WzVkJPegtMustL1djhYB1d3/YAq/5PoPKvbRLRkj3E+PjMyW76KqHu6/0Kiymz8pDS62DTJp8F5csxdN4MjMde1oQLLMpUs6PXRW0fWPtfEPleGt3hs7m5CXypOJLlWrMjojpO/mE12DnwP8C+c8He25l8dpFpacXKDUg6PxsDCy1FGXL+0Vt8UDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB4626.namprd11.prod.outlook.com (2603:10b6:5:2a9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 13:44:45 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 13:44:45 +0000
Date: Fri, 8 Dec 2023 08:44:42 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
Subject: Re: [PATCH] drm/xe: Add frequency throttle reasons sysfs attributes
Message-ID: <ZXMdyoBplb5WJimI@intel.com>
References: <4b0e993f-36f3-4bce-a65e-7043c90890e3@intel.com>
 <20231208065934.881570-1-rodrigo.vivi@intel.com>
 <70cfc033-65f3-467e-b856-56591ae8f1c8@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <70cfc033-65f3-467e-b856-56591ae8f1c8@intel.com>
X-ClientProxiedBy: SJ0PR03CA0354.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM6PR11MB4626:EE_
X-MS-Office365-Filtering-Correlation-Id: 25c02271-5128-4b32-51dc-08dbf7f3d6ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: od8Ge2e19dyyhGqvSpyOp1C1z5uGrDqcolvbUA+ZsCyvSnGozfxOJBzUir8LEIF3O39W+mnPLobjlKB7QBeIrgtf4/fBI6/wjJ/zpapUdllfVWxOYUkFNA9QhjqiTmdQgtUjaOeK7+uszT7uHrQJfBL+7eW/fqqlh/jjdLEz+3sIY0XTwar1EdTr54ENqyLlDJpWp9OeXwsbgymdGFwHisiKXft1OsljPWHe9NTvy5lWSTQ4hF0H8Q++e3Kyn0NkL1EOYSKViY14adKNatKFNT7qM82KixGUtrPmNjk1hc7G+srKgf++30HKR5fzcXijvRMPAqFnvlfP+PKuXbWqSkibfj/bzemabhhsTputDmukxBc2n+1TXaQ9Rskcjuda9CwJYQ6gH/i3YCp1DF3WFx3zva1OL8uE31Fe3DOCHu2HFO9z0GavmdNIQvbo+TAmPUt/2hez8zvFqAOBkbfxYUArBwP7zQRiHOu0zhCR+/4ZMnJ6n58QU86zUCRRarA8/v1d6n4guwLaWygzA+OLxyfNP03PAsUFWFvorDZTBCbC92IC1RhMOv0ps67JCechVwu0zz5KKR2Tp4dI5hMb0yuAegJxd0Rw9PSNJRaQEMKAHzxL6zdF7HKMcNbFbBxN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(346002)(39860400002)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(6666004)(53546011)(6506007)(6486002)(478600001)(36756003)(44832011)(5660300002)(30864003)(66946007)(2906002)(66556008)(66476007)(6636002)(37006003)(316002)(4326008)(6862004)(8676002)(8936002)(83380400001)(82960400001)(2616005)(38100700002)(41300700001)(6512007)(26005)(86362001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3Jc0VLy3nCF/XHsT4XmqTTxDOWJBzm1KI1yVJgYWyRBvQCEu0rwOfZUtgA?=
 =?iso-8859-1?Q?xHAkYmYcdpBrJnKjqYdDyZQrRdQKFo5o6qeHmB3Ohhgwa4JKUHyuttOLKp?=
 =?iso-8859-1?Q?xDgnTXgctb0EjofWTdERlFw95zig2eYzjcvHdIcup2x69O1j54jlWsKokJ?=
 =?iso-8859-1?Q?NXyax7si3qjVM/fC14KYFxJfYLMlDM1ubSfgNNt7QVbns9S4B0+BJeopTp?=
 =?iso-8859-1?Q?kOWowj8G9ljdNr04JGX7by9pxPGPbCFh3qPCtHucfTjQd2xPf4LBNfElGY?=
 =?iso-8859-1?Q?12HKaShpdaGabTFw74TW3zu0oglMl1vq04MxQ5XHSfI5eIBZYfi/9MLhyM?=
 =?iso-8859-1?Q?a0sAir+s5/3PFmF0YIScUKpZdNGEwbC4M6242dSBB6Z+y7ZDTj0n/USfWV?=
 =?iso-8859-1?Q?l0sLqUmzUFD1H2aNigKGHmxNlwHKvIqootLD4xt+RCOI1hjpEFFZZUCLuC?=
 =?iso-8859-1?Q?YEH7LXLdlqKGBMw+MqZRIFxt/dA8MIbBjn6gS/B+Cgqi+gAHCzsLJI6qW1?=
 =?iso-8859-1?Q?ZHAMAcRP0rKI0mjX5tU2tU74N5iIC4H5gPPbzwltv4Oxym/6ErodD7lbhh?=
 =?iso-8859-1?Q?AqA2g3jMK0PNFDQ/4e7L3ih1jcLrcAJUK1nSs7ByzFNBYz1BXCWFCeAeV4?=
 =?iso-8859-1?Q?vpvMEnDL2VDdwDioufyJSLIe6F7dvgA+E7l2mYRPUF/JWA+5YsOIuKTZDR?=
 =?iso-8859-1?Q?GIkHTui/tNGsgE0YYfGQsqxrdagLY/yqE5OcyrYDWGm+aUtRH1SyAXbR/S?=
 =?iso-8859-1?Q?kXPTZeyyUGfO0w96rN63xoYmJ+KgrPmdI4NzPyskg8K9b47wS5lKHAYlvH?=
 =?iso-8859-1?Q?8I3i//uEJbqFQoJ436A4D1vqVty9wDxj5zA0Ux2lVpmzJdH5rBY4g+sQTg?=
 =?iso-8859-1?Q?8NcZmtrI+EYs0LNRM1CahIKBn6/XlWPtJ9csB8xSAiESDi/ogE+I4MAmNo?=
 =?iso-8859-1?Q?uaQwJWWDkAnJUXjH4c9T/xWWInGpYdgINHnTFVIR87Gsyn2sDHSQWgOxqE?=
 =?iso-8859-1?Q?ZipnRnodFCJz/F/IPlyZskWqsu3440VgFBQAyHJred+0mYFZSjZi5+mg9k?=
 =?iso-8859-1?Q?7juzQfXiq3BzKS7+g3yNRAbDTKZyWoO7NDPwC2KG6rAEOmCfq7G9hvOHVb?=
 =?iso-8859-1?Q?Bt1BHqWnLV6M1AsqmHogflS92P2Rws2gzyoe7hPjOFwpL0SSVkJDw2hIlS?=
 =?iso-8859-1?Q?gQbGB40OVFSFHwIPACQYIhiImgJj0amNZnFUyY0wr8HjyEDb+PGiK/Be0/?=
 =?iso-8859-1?Q?epVbpUi7i/pPlG7brDiygpMWdOKXtCRflkVAFLVtq2tEMjAlbdx3/Qkf37?=
 =?iso-8859-1?Q?RhDyrTYDmLxo4i0UOIkW9dLLqUipeHNYJTstp6jd2aEX3YEBO2Sb6VLjS1?=
 =?iso-8859-1?Q?hbH0cYOLUi8YlDhKeIupqotLkBJMskbtq2+hRrB1KlbCvmAimDxLrvqL12?=
 =?iso-8859-1?Q?cDcunE8UkbpONhNWevIp+M80bO/iRKgAr8ZS7lwCxi21v72+9+VgyIb4zc?=
 =?iso-8859-1?Q?j4V4xl5dgn3voHDLgdoTCQLH29HrHrtjvP+OcgRxfQPhI6YOQlSmiPgulB?=
 =?iso-8859-1?Q?DHHL8+W/wHxppDIaxdpGcQiYlrgmJokhjl8smPdbehKCb7gQSPxVbIGuyW?=
 =?iso-8859-1?Q?ENc/CMAPV/CaJoGlBqyo8qocwRi740kiKc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25c02271-5128-4b32-51dc-08dbf7f3d6ba
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 13:44:45.7623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u/eTfSl9LXd56oetYap+RcPfCyLZ/kXTUdu5zvOsa98NnmRAjjOWNnB9/Fll8VqukH7x6f92AMJf1by1xbMQhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4626
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Dec 08, 2023 at 01:44:36PM +0530, Sundaresan, Sujaritha wrote:
> Hi Rodrigo,
> 
> Riana has already added here r-b to this patch in the previous version.
> 
> I think that was missed here.

I know, I was just lazy to add it here. But by using the --in-reply-to
I knew that b4-shazam or pwclient would automatically add it for me when applying
later :)

btw, kernel and igt patches pushed.

Thank you all for the patches and reviews.

> 
> Thanks,
> 
> Suja
> 
> On 12/8/2023 12:29 PM, Rodrigo Vivi wrote:
> > From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> > 
> > Add throttle reasons sysfs attributes under a separate directory.
> > 
> > /device/tile<n>/gt<n>/freq0/throttle
> > 			|- reason_pl1
> > 			|- reason_pl2
> > 			|- reason_pl4
> > 			|- reason_prochot
> > 			|- reason_ratl
> > 			|- reason_vr_tdc
> > 			|- reason_vr_thermalert
> > 			|- status
> > 
> > v2: Remove unnecessary headers and clean-up action (Riana)
> > 
> > v3: - Add missing 'tile#/' to the doc (Riana)
> >      - Add missing documentation (Riana)
> >      - Remove extra line in header (Riana)
> >      - Remove extra header inclusion missed on v2 (Rodrigo).
> > 
> > Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >   drivers/gpu/drm/xe/Makefile               |   1 +
> >   drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  12 +
> >   drivers/gpu/drm/xe/xe_gt_freq.c           |   3 +
> >   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c | 257 ++++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h |  13 ++
> >   5 files changed, 286 insertions(+)
> >   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> >   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 232627e0946e..d35548e437f0 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -78,6 +78,7 @@ xe-y += xe_bb.o \
> >   	xe_gt_mcr.o \
> >   	xe_gt_pagefault.o \
> >   	xe_gt_sysfs.o \
> > +	xe_gt_throttle_sysfs.o \
> >   	xe_gt_tlb_invalidation.o \
> >   	xe_gt_topology.o \
> >   	xe_guc.o \
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index 9744ed0be3a5..5f5a72e9d0d8 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -478,4 +478,16 @@
> >   #define PVC_GT0_PLATFORM_ENERGY_STATUS		XE_REG(0x28106c)
> >   #define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)
> > +#define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
> > +#define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
> > +#define   PROCHOT_MASK				REG_BIT(0)
> > +#define   THERMAL_LIMIT_MASK			REG_BIT(1)
> > +#define   RATL_MASK				REG_BIT(5)
> > +#define   VR_THERMALERT_MASK			REG_BIT(6)
> > +#define   VR_TDC_MASK				REG_BIT(7)
> > +#define   POWER_LIMIT_4_MASK			REG_BIT(8)
> > +#define   POWER_LIMIT_1_MASK			REG_BIT(10)
> > +#define   POWER_LIMIT_2_MASK			REG_BIT(11)
> > +#define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
> > +
> >   #endif
> > diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
> > index 2c3830d0e9e5..08eabcafe7bc 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_freq.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> > @@ -13,6 +13,7 @@
> >   #include "xe_device_types.h"
> >   #include "xe_gt_sysfs.h"
> > +#include "xe_gt_throttle_sysfs.h"
> >   #include "xe_guc_pc.h"
> >   /**
> > @@ -213,4 +214,6 @@ void xe_gt_freq_init(struct xe_gt *gt)
> >   	if (err)
> >   		drm_warn(&xe->drm,  "failed to add freq attrs to %s, err: %d\n",
> >   			 kobject_name(gt->freq), err);
> > +
> > +	xe_gt_throttle_sysfs_init(gt);
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> > new file mode 100644
> > index 000000000000..c2e420b83e35
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> > @@ -0,0 +1,257 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2023 Intel Corporation
> > + */
> > +
> > +#include <drm/drm_managed.h>
> > +
> > +#include <regs/xe_gt_regs.h>
> > +#include "xe_device.h"
> > +#include "xe_gt.h"
> > +#include "xe_gt_sysfs.h"
> > +#include "xe_gt_throttle_sysfs.h"
> > +#include "xe_mmio.h"
> > +
> > +/**
> > + * DOC: Xe GT Throttle
> > + *
> > + * Provides sysfs entries for frequency throttle reasons in GT
> > + *
> > + * device/tile#/gt#/freq0/throttle/status - Overall status
> > + * device/tile#/gt#/freq0/throttle/reason_pl1 - Frequency throttle due to PL1
> > + * device/tile#/gt#/freq0/throttle/reason_pl2 - Frequency throttle due to PL2
> > + * device/tile#/gt#/freq0/throttle/reason_pl4 - Frequency throttle due to PL4, Iccmax etc.
> > + * device/tile#/gt#/freq0/throttle/reason_thermal - Frequency throttle due to thermal
> > + * device/tile#/gt#/freq0/throttle/reason_prochot - Frequency throttle due to prochot
> > + * device/tile#/gt#/freq0/throttle/reason_ratl - Frequency throttle due to RATL
> > + * device/tile#/gt#/freq0/throttle/reason_vr_thermalert - Frequency throttle due to VR THERMALERT
> > + * device/tile#/gt#/freq0/throttle/reason_vr_tdc -  Frequency throttle due to VR TDC
> > + */
> > +
> > +static struct xe_gt *
> > +dev_to_gt(struct device *dev)
> > +{
> > +	return kobj_to_gt(dev->kobj.parent);
> > +}
> > +
> > +static u32 read_perf_limit_reasons(struct xe_gt *gt)
> > +{
> > +	u32 reg;
> > +
> > +	if (xe_gt_is_media_type(gt))
> > +		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
> > +	else
> > +		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
> > +
> > +	return reg;
> > +}
> > +
> > +static u32 read_status(struct xe_gt *gt)
> > +{
> > +	u32 status = read_perf_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
> > +
> > +	return status;
> > +}
> > +
> > +static u32 read_reason_pl1(struct xe_gt *gt)
> > +{
> > +	u32 pl1 = read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
> > +
> > +	return pl1;
> > +}
> > +
> > +static u32 read_reason_pl2(struct xe_gt *gt)
> > +{
> > +	u32 pl2 = read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
> > +
> > +	return pl2;
> > +}
> > +
> > +static u32 read_reason_pl4(struct xe_gt *gt)
> > +{
> > +	u32 pl4 = read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
> > +
> > +	return pl4;
> > +}
> > +
> > +static u32 read_reason_thermal(struct xe_gt *gt)
> > +{
> > +	u32 thermal = read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
> > +
> > +	return thermal;
> > +}
> > +
> > +static u32 read_reason_prochot(struct xe_gt *gt)
> > +{
> > +	u32 prochot = read_perf_limit_reasons(gt) & PROCHOT_MASK;
> > +
> > +	return prochot;
> > +}
> > +
> > +static u32 read_reason_ratl(struct xe_gt *gt)
> > +{
> > +	u32 ratl = read_perf_limit_reasons(gt) & RATL_MASK;
> > +
> > +	return ratl;
> > +}
> > +
> > +static u32 read_reason_vr_thermalert(struct xe_gt *gt)
> > +{
> > +	u32 thermalert = read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
> > +
> > +	return thermalert;
> > +}
> > +
> > +static u32 read_reason_vr_tdc(struct xe_gt *gt)
> > +{
> > +	u32 tdc = read_perf_limit_reasons(gt) & VR_TDC_MASK;
> > +
> > +	return tdc;
> > +}
> > +
> > +static ssize_t status_show(struct device *dev,
> > +			   struct device_attribute *attr,
> > +			   char *buff)
> > +{
> > +	struct xe_gt *gt = dev_to_gt(dev);
> > +	bool status = !!read_status(gt);
> > +
> > +	return sysfs_emit(buff, "%u\n", status);
> > +}
> > +static DEVICE_ATTR_RO(status);
> > +
> > +static ssize_t reason_pl1_show(struct device *dev,
> > +			       struct device_attribute *attr,
> > +			       char *buff)
> > +{
> > +	struct xe_gt *gt = dev_to_gt(dev);
> > +	bool pl1 = !!read_reason_pl1(gt);
> > +
> > +	return sysfs_emit(buff, "%u\n", pl1);
> > +}
> > +static DEVICE_ATTR_RO(reason_pl1);
> > +
> > +static ssize_t reason_pl2_show(struct device *dev,
> > +			       struct device_attribute *attr,
> > +			       char *buff)
> > +{
> > +	struct xe_gt *gt = dev_to_gt(dev);
> > +	bool pl2 = !!read_reason_pl2(gt);
> > +
> > +	return sysfs_emit(buff, "%u\n", pl2);
> > +}
> > +static DEVICE_ATTR_RO(reason_pl2);
> > +
> > +static ssize_t reason_pl4_show(struct device *dev,
> > +			       struct device_attribute *attr,
> > +			       char *buff)
> > +{
> > +	struct xe_gt *gt = dev_to_gt(dev);
> > +	bool pl4 = !!read_reason_pl4(gt);
> > +
> > +	return sysfs_emit(buff, "%u\n", pl4);
> > +}
> > +static DEVICE_ATTR_RO(reason_pl4);
> > +
> > +static ssize_t reason_thermal_show(struct device *dev,
> > +				   struct device_attribute *attr,
> > +				   char *buff)
> > +{
> > +	struct xe_gt *gt = dev_to_gt(dev);
> > +	bool thermal = !!read_reason_thermal(gt);
> > +
> > +	return sysfs_emit(buff, "%u\n", thermal);
> > +}
> > +static DEVICE_ATTR_RO(reason_thermal);
> > +
> > +static ssize_t reason_prochot_show(struct device *dev,
> > +				   struct device_attribute *attr,
> > +				   char *buff)
> > +{
> > +	struct xe_gt *gt = dev_to_gt(dev);
> > +	bool prochot = !!read_reason_prochot(gt);
> > +
> > +	return sysfs_emit(buff, "%u\n", prochot);
> > +}
> > +static DEVICE_ATTR_RO(reason_prochot);
> > +
> > +static ssize_t reason_ratl_show(struct device *dev,
> > +				struct device_attribute *attr,
> > +				char *buff)
> > +{
> > +	struct xe_gt *gt = dev_to_gt(dev);
> > +	bool ratl = !!read_reason_ratl(gt);
> > +
> > +	return sysfs_emit(buff, "%u\n", ratl);
> > +}
> > +static DEVICE_ATTR_RO(reason_ratl);
> > +
> > +static ssize_t reason_vr_thermalert_show(struct device *dev,
> > +					 struct device_attribute *attr,
> > +					 char *buff)
> > +{
> > +	struct xe_gt *gt = dev_to_gt(dev);
> > +	bool thermalert = !!read_reason_vr_thermalert(gt);
> > +
> > +	return sysfs_emit(buff, "%u\n", thermalert);
> > +}
> > +static DEVICE_ATTR_RO(reason_vr_thermalert);
> > +
> > +static ssize_t reason_vr_tdc_show(struct device *dev,
> > +				  struct device_attribute *attr,
> > +				  char *buff)
> > +{
> > +	struct xe_gt *gt = dev_to_gt(dev);
> > +	bool tdc = !!read_reason_vr_tdc(gt);
> > +
> > +	return sysfs_emit(buff, "%u\n", tdc);
> > +}
> > +static DEVICE_ATTR_RO(reason_vr_tdc);
> > +
> > +static struct attribute *throttle_attrs[] = {
> > +	&dev_attr_status.attr,
> > +	&dev_attr_reason_pl1.attr,
> > +	&dev_attr_reason_pl2.attr,
> > +	&dev_attr_reason_pl4.attr,
> > +	&dev_attr_reason_thermal.attr,
> > +	&dev_attr_reason_prochot.attr,
> > +	&dev_attr_reason_ratl.attr,
> > +	&dev_attr_reason_vr_thermalert.attr,
> > +	&dev_attr_reason_vr_tdc.attr,
> > +	NULL
> > +};
> > +
> > +static const struct attribute_group throttle_group_attrs = {
> > +	.name = "throttle",
> > +	.attrs = throttle_attrs,
> > +};
> > +
> > +static void gt_throttle_sysfs_fini(struct drm_device *drm, void *arg)
> > +{
> > +	struct xe_gt *gt = arg;
> > +
> > +	sysfs_remove_group(gt->freq, &throttle_group_attrs);
> > +}
> > +
> > +/**
> > + * xe_gt_throttle_sysfs_init - Initialize throttle reasons sysfs
> > + * @gt: Xe GT object
> > + *
> > + * It needs to be initialized after or along with GT Freq.
> > + */
> > +void xe_gt_throttle_sysfs_init(struct xe_gt *gt)
> > +{
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +	int err;
> > +
> > +	err = sysfs_create_group(gt->freq, &throttle_group_attrs);
> > +	if (err) {
> > +		drm_warn(&xe->drm, "failed to register throttle sysfs, err: %d\n", err);
> > +		return;
> > +	}
> > +
> > +	err = drmm_add_action_or_reset(&xe->drm, gt_throttle_sysfs_fini, gt);
> > +	if (err)
> > +		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
> > +			 __func__, err);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
> > new file mode 100644
> > index 000000000000..9f545938f679
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2023 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_GT_THROTTLE_SYSFS_H_
> > +#define _XE_GT_THROTTLE_SYSFS_H_
> > +
> > +struct xe_gt;
> > +
> > +void xe_gt_throttle_sysfs_init(struct xe_gt *gt);
> > +
> > +#endif /* _XE_GT_THROTTLE_SYSFS_H_ */
