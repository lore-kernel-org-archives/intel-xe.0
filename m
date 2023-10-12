Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A3D9CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 19:08:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D951010E532;
	Thu, 12 Oct 2023 19:08:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6495E10E532
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 19:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697137722; x=1728673722;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=//lFzM1U4deJk4lKzndoWbtzRLxVesPK7vuHLrM447A=;
 b=VJExWYiadACEW1Np6pe114v22w4tsartzVrgb9upiTy1qKMN2YyEV8yb
 ImNeNXRTC/1SUf6vY3X8+HzBpkiJuIp/FuFeOAFwkQk+mJWMB6F40ky+w
 +ATQZFG64u1P8bODe3jI6+EWpx1HncAHBmkpjtaSSC5FcYCq4oot1HoW4
 Xyb4stAjlSn+9+mimAp1l123ByJ88+A+x6ruJ6329cihpqJgAI7eVYj52
 P5OtT/8cGgtPEWObtiOZVKXVlgD9XP5apkAleH3CzK/SIaDmmyf1Umb2A
 cF59n1t3LZPAVvnnkezjZwFSK1qkXFzvazj8F1FjjlZ5wl4pNLK/qqID1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="364383628"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="364383628"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:07:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="898248277"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="898248277"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Oct 2023 12:05:45 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 12:07:33 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 12:07:33 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 12 Oct 2023 12:07:33 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 12:07:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GbFxT16MK4EvNQQnVp9yWmc85i94zLS3oRGeMfDdoSMHde/rTPNBEOtil3cuebY9tqBRRvu4zkp6EliRmztorrFyTpwK/sTre7d6BSljKgmMG1jZZCRINtwvqpxUq8D0Y83t9xUqZPfFOqKd0biQCUbljBtGjsB3BiAr+a7yEPY6AW3Ht9zind2kR192fY9VzErR67zPXw9/zwZLaRgxgY6NkhhXno5xtoJ+Q92a6BjaYLSWlRpHkT0z+ZAt5XaXgQOw66Bi2pQAGKaWGsYnoYOutAVAYj8jJusdEHsMFa4PITnKvp/+s1xXU78lZsO81JpvKouwMFfc4VB5vOJ8MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vlMMEe8fs2kM3ClUwxyMEA6TW08FeugnZ8v4KrLo3M=;
 b=N10v3FgHR2A84P1zLlU5BOVryK2mFE/fI+1MdqrgSTBg7t0CaltC44Mrb/+fWoxTKGslCxgvbUXqqqCnIRo5ZFNtioXYJerXj0NNbUaJ8+oh53JKNucshFd2kgmvB0+9UvaoHjBEURnXa7xoxpKVl5uGTC8F7EUn2/YMUnPtG4CBTbFu8BvymYcEErUL+5u7/ms0A1mIHWOa0Mikv7pXjQrdaWsOv4Mk0rYAtxaLWR37lZt2oFI/43k2b9WCDeCx1fozChmCb5DLOmnxIcEfhUDoWiQjIAgkBWwvaWiH1LHWIQAw5TfCNUEtRlTsV5atAFNk6g84G1BbFg1fukJ8dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA2PR11MB5084.namprd11.prod.outlook.com (2603:10b6:806:116::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.44; Thu, 12 Oct
 2023 19:07:31 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db%3]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 19:07:30 +0000
Date: Thu, 12 Oct 2023 12:07:27 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <20231012190542.GM21382@mdroper-desk1.amr.corp.intel.com>
References: <20231010184151.91195-1-jose.souza@intel.com>
 <20231010184151.91195-3-jose.souza@intel.com>
 <20231012174616.GK21382@mdroper-desk1.amr.corp.intel.com>
 <66f01558afdc0c27eaa4f818a90e4ad246cd15b5.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <66f01558afdc0c27eaa4f818a90e4ad246cd15b5.camel@intel.com>
X-ClientProxiedBy: SJ0PR05CA0041.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::16) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA2PR11MB5084:EE_
X-MS-Office365-Filtering-Correlation-Id: da9628fc-a0da-4f77-cb7f-08dbcb567b87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ydf9wbzOY0X2pkjiTHVfAJZ4rnCOw5zKUCK1yIFqqxGrVcEwelvoyEKrsvJbk88FkdtqptOafXVLCygzXJqc+I9AnDtpJqhCxVnEfvNyrQwQYxLCUgtyPCg/tdq2MMBZDk8fAdQYCzwzr728XG8/By1FbgHYUNTal7LFQX9Fdr/aatSZ4ngU/UUYU84hVfuUuT9bQ9ajAJc2+PlzWT4eopj5KsQo0gcgvMa4qzk5wxEvixWZ201t0vJld3qTXU2vv9TavSIzJtjBICMPeBPtehoj/q4M3FgZkATYUa+t5Puo35LUnNB3NNYrI/98S4fOOGR+/OUaFI/dqdKGCZnzgLHMABfuMjQZ7rxiRBwlOA0b816MHQZ1I1a8SAwUN7JuEOS2HHuDey9lDeVU9bPLDArQ+zTcpnDddyWWw7P3M/ClHFH+HqhqzUHwnb+YOENMGk3CutXhHu1A0ipleVbNGss1rbx+qvY9rKWuQmpaibiT526b+ZJXuPubMCXXIc+6U+bKZ3WcBT5Z2h2kLKPGdkYfgqCKdJCJSfY6wiX67TRKVB+iGzH59WOvc7wgili5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(366004)(346002)(39860400002)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(1076003)(83380400001)(107886003)(26005)(6512007)(82960400001)(54906003)(5660300002)(8676002)(6636002)(66556008)(66476007)(8936002)(316002)(4326008)(6862004)(30864003)(41300700001)(38100700002)(66946007)(4001150100001)(2906002)(6666004)(478600001)(6506007)(6486002)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?JEY4L2sjcLJHivd3A3z7YeBpCLTIUVK7d1spuEnFCHXtFyqWGyRuhhV5tb?=
 =?iso-8859-1?Q?n5I5JWsDjpAjP5AYzuMRHdnBxm8noLlP88PHTE5hl2ZiYys7sJPPgQJNhq?=
 =?iso-8859-1?Q?zixrakIPOFjVySLjPoixAxksnq+YbvnVMk2euV5kZ1tqNbcxslhe72PRjo?=
 =?iso-8859-1?Q?zIz7jp3zACePQKOj1vNTj44HlJ/khgq83KPfnmOPUgbBIF5WNc03kki+js?=
 =?iso-8859-1?Q?TjZ4J9a32PdGWmX4RkT5Qu1jDFhw6GJ2z/gAxgR4BooRBofLD4ks7rru1H?=
 =?iso-8859-1?Q?Hymi59FyogP02ZZohwXe7yuLWeJ5+/r3zLLWQXbo4fNyaJkCN6y2j9BmZd?=
 =?iso-8859-1?Q?pr37hXl66CiEF4IJaXKLuwUW5zhCaR+ECcvTBZTs3OEvQI3d/xQ3XQVsrA?=
 =?iso-8859-1?Q?j6BCIqJ2Kryg1ON+MRg4nBWxpgg5Mdi5T1y2SlvhsheJ1CkdlLj64+JWef?=
 =?iso-8859-1?Q?4aBEBfeHNG9VjNjWl06Mp3jAkv4i/tUqnbSP7ByrUxUTuVT1CsIGdsAE3Y?=
 =?iso-8859-1?Q?hC8kRQ3eKMU+mBRirFHjajVzndxF1XKzaU/XwFSsr28Xomk0mjDtsxhtMV?=
 =?iso-8859-1?Q?YD/W6BOxTrUEGft8gVNj3u7cLJfmGbRP7+8YCPbLqYxyoaTlKgzDm0yvMI?=
 =?iso-8859-1?Q?LnIO8xpWL/UTNt4uwHeFSo/CqIzTF2U4RFSwi27es6IotjRGKmhKiiWtb7?=
 =?iso-8859-1?Q?XM7oc15irXRDMiq+eR5YqyxaOiQMc1jqZVIIiRz7k4juWihpJ5jkRqHJve?=
 =?iso-8859-1?Q?SrxHrvxyBVaYPusjnLLs8TvNcUgWsmbiAaFXTY1sTyARX51MguWKu3iUVg?=
 =?iso-8859-1?Q?kIq1NdDfeazdiUy1z0azpXXS1fhI0UYgnBfYA/3ZpmlOWKP55rOGkaKQ40?=
 =?iso-8859-1?Q?bJ28BYn13V7d8KweSM0Yj6bE6BDqahESbNjpHTJg6AixfFdHBz3Iq19pa4?=
 =?iso-8859-1?Q?TbLKe9wTD8eB1LLM/WK8piMhmr6jv/ha6FBg7wblCRCEInBTraTt2QdU3h?=
 =?iso-8859-1?Q?zLs22ILU3iNqJ4vnKdux7d3Li/cAT8sw8rFhBUJ+/s0zZy0CVz0Y1zOlr4?=
 =?iso-8859-1?Q?vScNNMo95rdMuH6PfJSY1Hljzo0paUposshbKoVrJyDAKjv/0U6pZ06IiE?=
 =?iso-8859-1?Q?dtEks9c1JjSy+FZl9GL8vFDa9eT3aIAzhxMDDyIf56wBBsK8Sgob7qa97D?=
 =?iso-8859-1?Q?DoEKH1M66Y9u1UD0m4FzbvO3U/kOkFZbdwoKLqaI2jfafCaD/wUK0eFiMg?=
 =?iso-8859-1?Q?ZsaDLVGn2LzxNLW2EVDQgosJCVsZneYKXKAOEsMKSW2p+YqOWT/6RUMN25?=
 =?iso-8859-1?Q?BkEyun9ZxTi4I1W+qRPXm19ALo6v+q3FyzLuNvFFcovQ7BK2avuJD3a2+A?=
 =?iso-8859-1?Q?G9OM+bqKd7LY8Vzg069rnRSGfjHszo2QQwWtQvZ8aCjJWkbf0Lhnnm1+c6?=
 =?iso-8859-1?Q?DyJ/v0Vxo0uYQq114ambgkTbcDeBpiZvzhRp6FpcSIOojpaiJ0wlGpvxcZ?=
 =?iso-8859-1?Q?EPyRpkiCP7uXyOVeoHkOOS+FkhIslIoXVDb5SwCu1GyoWgWt7hpi+3803D?=
 =?iso-8859-1?Q?Q9XvaswYO6MCIlWjr6oOYnmwkhYpKAFAK/FM2b2TaLs3+3cOFvCEP27WF1?=
 =?iso-8859-1?Q?OV+q1tR3FqI2eVi2X00M63yXngNgQYKCYhts1zXX/O1YV5lXOK3DXugQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da9628fc-a0da-4f77-cb7f-08dbcb567b87
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 19:07:30.5111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xkvA4onettcQc+DHb569DlZKiYI4IQfpP/Kvd2E7/7MQidtpkGFlIGh5916n3Ch8CLEhXDJp7jU2CkBN/mCw4Kp6luXseKj/mGrqOoBNhYA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5084
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 3/3] drm/xe: Add INSTDONE registers to
 devcoredump
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Oct 12, 2023 at 11:46:08AM -0700, Souza, Jose wrote:
> On Thu, 2023-10-12 at 10:46 -0700, Matt Roper wrote:
> > On Tue, Oct 10, 2023 at 11:41:51AM -0700, José Roberto de Souza wrote:
> > > This registers contains important information that can help with debug
> > > of GPU hangs.
> > > 
> > > While at it also fixing the double line jump at the end of engine
> > > registers for CCS engines.
> > > 
> > > v2:
> > > - print other INSTDONE registers
> > > 
> > > v3:
> > > - add for_each_geometry/compute_dss()
> > > 
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/regs/xe_engine_regs.h |   1 +
> > >  drivers/gpu/drm/xe/regs/xe_gt_regs.h     |   9 ++
> > >  drivers/gpu/drm/xe/xe_hw_engine.c        | 100 ++++++++++++++++++++++-
> > >  drivers/gpu/drm/xe/xe_hw_engine_types.h  |  10 +++
> > >  4 files changed, 117 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > index 35dd4837dd75f..32465e384fc24 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > @@ -32,6 +32,7 @@
> > >  #define RING_ACTHD_UDW(base)			XE_REG((base) + 0x5c)
> > >  #define RING_DMA_FADD_UDW(base)			XE_REG((base) + 0x60)
> > >  #define RING_IPEHR(base)			XE_REG((base) + 0x68)
> > > +#define RING_INSTDONE(base)			XE_REG((base) + 0x6c)
> > >  #define RING_ACTHD(base)			XE_REG((base) + 0x74)
> > >  #define RING_DMA_FADD(base)			XE_REG((base) + 0x78)
> > >  #define RING_HWS_PGA(base)			XE_REG((base) + 0x80)
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > index cd1821d96a5d8..c6650124ae6a6 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > @@ -105,6 +105,8 @@
> > >  #define   FF_MODE2_TDS_TIMER_MASK		REG_GENMASK(23, 16)
> > >  #define   FF_MODE2_TDS_TIMER_128		REG_FIELD_PREP(FF_MODE2_TDS_TIMER_MASK, 4)
> > >  
> > > +#define XEHPG_INSTDONE_GEOM_SVG			XE_REG_MCR(0x666c)
> > > +
> > >  #define CACHE_MODE_1				XE_REG(0x7004, XE_REG_OPTION_MASKED)
> > >  #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
> > >  
> > > @@ -117,6 +119,10 @@
> > >  
> > >  #define COMMON_SLICE_CHICKEN1			XE_REG(0x7010)
> > >  
> > > +#define SLICE_COMMON_INSTDONE			XE_REG(0x7100)
> > > +#define SLICE_COMMON_INSTDONE_EXTRA		XE_REG(0x7104)
> > > +#define SLICE_COMMON_INSTDONE_EXTRA2		XE_REG(0x7108)
> > 
> > These three are MCR registers on Xe_HP and beyond (one instance per
> > gslice).
> 
> Where I can look for all MCR registers? In the definition of this register there is nothing special... but makes sense.

Same bspec page as forcewake.  E.g., 66534 for DG2, 67788 for MTL, 74417
for Xe2, etc.  The "multicast / replicated" column tells you whether
something is multicast or not, and the "replication group type" tells
you the specific type of replication (per gslice, per DSS, per l3bank,
etc.).  The rules for how to encode the target into the group/instance
fields of the steering register are given farther down near the bottom
of the page.

> 
> i915 would also need to have it fixed.

Yeah, if these values are actually useful to debug then it would make
sense to fix there too.  If there are any other mis-handled MCR
registers that aren't actually useful for debug, we could also just drop
those (I think we've done that in the past in some places where nobody
noticed for years that they weren't getting meaningful values).


Matt

> 
> > 
> > 
> > Matt
> > 
> > > +
> > >  #define COMMON_SLICE_CHICKEN4			XE_REG(0x7300, XE_REG_OPTION_MASKED)
> > >  #define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
> > >  
> > > @@ -299,6 +305,9 @@
> > >  #define XE_OAG_BLT_BUSY_FREE			XE_REG(0xdbbc)
> > >  #define XE_OAG_RENDER_BUSY_FREE			XE_REG(0xdbdc)
> > >  
> > > +#define SAMPLER_INSTDONE			XE_REG_MCR(0xe160)
> > > +#define ROW_INSTDONE				XE_REG_MCR(0xe164)
> > > +
> > >  #define SAMPLER_MODE				XE_REG_MCR(0xe18c, XE_REG_OPTION_MASKED)
> > >  #define   ENABLE_SMALLPL			REG_BIT(15)
> > >  #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > index 37b3ee1268090..6e144859abb1a 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > @@ -16,6 +16,7 @@
> > >  #include "xe_execlist.h"
> > >  #include "xe_force_wake.h"
> > >  #include "xe_gt.h"
> > > +#include "xe_gt_mcr.h"
> > >  #include "xe_gt_topology.h"
> > >  #include "xe_hw_fence.h"
> > >  #include "xe_irq.h"
> > > @@ -655,6 +656,40 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
> > >  		xe_hw_fence_irq_run(hwe->fence_irq);
> > >  }
> > >  
> > > +static void
> > > +xe_he_engine_snapshot_instdone_capture(struct xe_hw_engine *hwe,
> > > +				       struct xe_hw_engine_snapshot *snapshot)
> > > +{
> > > +	struct xe_gt *gt = hwe->gt;
> > > +	struct xe_device *xe = gt_to_xe(gt);
> > > +	unsigned int dss;
> > > +	int group, instance;
> > > +
> > > +	snapshot->reg.instdone.ring = hw_engine_mmio_read32(hwe, RING_INSTDONE(0));
> > > +
> > > +	if (snapshot->hwe->class != XE_ENGINE_CLASS_RENDER)
> > > +		return;
> > > +
> > > +	snapshot->reg.instdone.slice_common =
> > > +		xe_mmio_read32(gt, SLICE_COMMON_INSTDONE);
> > > +	snapshot->reg.instdone.slice_common_extra =
> > > +		xe_mmio_read32(gt, SLICE_COMMON_INSTDONE_EXTRA);
> > > +	snapshot->reg.instdone.slice_common_extra2 =
> > > +		xe_mmio_read32(gt, SLICE_COMMON_INSTDONE_EXTRA2);
> > > +
> > > +	for_each_geometry_dss(gt, dss, group, instance) {
> > > +		snapshot->reg.instdone.sampler[dss] =
> > > +			xe_gt_mcr_unicast_read(gt, SAMPLER_INSTDONE, group, instance);
> > > +		snapshot->reg.instdone.row[dss] =
> > > +			xe_gt_mcr_unicast_read(gt, ROW_INSTDONE, group, instance);
> > > +
> > > +		if (GRAPHICS_VERx100(xe) >= 1255)
> > > +			snapshot->reg.instdone.geom_svg[dss] =
> > > +				xe_gt_mcr_unicast_read(gt, XEHPG_INSTDONE_GEOM_SVG,
> > > +						       group, instance);
> > > +	}
> > > +}
> > > +
> > >  /**
> > >   * xe_hw_engine_snapshot_capture - Take a quick snapshot of the HW Engine.
> > >   * @hwe: Xe HW Engine.
> > > @@ -679,10 +714,30 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
> > >  	if (!snapshot)
> > >  		return NULL;
> > >  
> > > +	/* Because XE_MAX_DSS_FUSE_BITS is defined in xe_gt_types.h and it
> > > +	 * includes xe_hw_engine_types.h the length of this 3 registers can't be
> > > +	 * set in struct xe_hw_engine_snapshot, so here doing additional
> > > +	 * allocations.
> > > +	 */
> > > +	len = (XE_MAX_DSS_FUSE_BITS * sizeof(u32));
> > > +	snapshot->reg.instdone.sampler = kzalloc(len, GFP_ATOMIC);
> > > +	snapshot->reg.instdone.row = kzalloc(len, GFP_ATOMIC);
> > > +	snapshot->reg.instdone.geom_svg = kzalloc(len, GFP_ATOMIC);
> > > +	if (!snapshot->reg.instdone.sampler ||
> > > +	    !snapshot->reg.instdone.row ||
> > > +	    !snapshot->reg.instdone.geom_svg) {
> > > +		xe_hw_engine_snapshot_free(snapshot);
> > > +		return NULL;
> > > +	}
> > > +
> > >  	len = strlen(hwe->name) + 1;
> > >  	snapshot->name = kzalloc(len, GFP_ATOMIC);
> > > -	if (snapshot->name)
> > > -		strscpy(snapshot->name, hwe->name, len);
> > > +	if (!snapshot->name) {
> > > +		xe_hw_engine_snapshot_free(snapshot);
> > > +		return NULL;
> > > +	}
> > > +
> > > +	strscpy(snapshot->name, hwe->name, len);
> > >  
> > >  	snapshot->hwe = hwe;
> > >  	snapshot->logical_instance = hwe->logical_instance;
> > > @@ -730,6 +785,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
> > >  	snapshot->reg.ring_dma_fadd =
> > >  		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0));
> > >  	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, RING_IPEHR(0));
> > > +	xe_he_engine_snapshot_instdone_capture(hwe, snapshot);
> > >  
> > >  	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
> > >  		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
> > > @@ -737,6 +793,38 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
> > >  	return snapshot;
> > >  }
> > >  
> > > +static void
> > > +xe_hw_engine_snapshot_instdone_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p)
> > > +{
> > > +	struct xe_gt *gt = snapshot->hwe->gt;
> > > +	struct xe_device *xe = gt_to_xe(gt);
> > > +	unsigned int dss;
> > > +	int group, instance;
> > > +
> > > +	drm_printf(p, "\tRING_INSTDONE: 0x%08x\n", snapshot->reg.instdone.ring);
> > > +
> > > +	if (snapshot->hwe->class != XE_ENGINE_CLASS_RENDER)
> > > +		return;
> > > +
> > > +	drm_printf(p, "\tSC_INSTDONE: 0x%08x\n",
> > > +		   snapshot->reg.instdone.slice_common);
> > > +	drm_printf(p, "\tSC_EXTRA_INSTDONE: 0x%08x\n",
> > > +		   snapshot->reg.instdone.slice_common_extra);
> > > +	drm_printf(p, "\tSC_EXTRA2_INSTDONE: 0x%08x\n",
> > > +		   snapshot->reg.instdone.slice_common_extra2);
> > > +
> > > +	for_each_geometry_dss(gt, dss, group, instance) {
> > > +		drm_printf(p, "\tSAMPLER_INSTDONE[%u]: 0x%08x\n", dss,
> > > +			   snapshot->reg.instdone.sampler[dss]);
> > > +		drm_printf(p, "\tROW_INSTDONE[%u]: 0x%08x\n", dss,
> > > +			   snapshot->reg.instdone.row[dss]);
> > > +
> > > +		if (GRAPHICS_VERx100(xe) >= 1255)
> > > +			drm_printf(p, "\tGEOM_SVGUNIT_INSTDONE[%u]: 0x%08x\n",
> > > +				   dss, snapshot->reg.instdone.geom_svg[dss]);
> > > +	}
> > > +}
> > > +
> > >  /**
> > >   * xe_hw_engine_snapshot_print - Print out a given Xe HW Engine snapshot.
> > >   * @snapshot: Xe HW Engine snapshot object.
> > > @@ -785,10 +873,13 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
> > >  	drm_printf(p, "\tDMA_FADDR: 0x%08x_%08x\n",
> > >  		   snapshot->reg.ring_dma_fadd_udw,
> > >  		   snapshot->reg.ring_dma_fadd);
> > > -	drm_printf(p, "\tIPEHR: 0x%08x\n\n", snapshot->reg.ipehr);
> > > +	drm_printf(p, "\tIPEHR: 0x%08x\n", snapshot->reg.ipehr);
> > > +	xe_hw_engine_snapshot_instdone_print(snapshot, p);
> > > +
> > >  	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
> > >  		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
> > >  			   snapshot->reg.rcu_mode);
> > > +	drm_puts(p, "\n");
> > >  }
> > >  
> > >  /**
> > > @@ -803,6 +894,9 @@ void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot)
> > >  	if (!snapshot)
> > >  		return;
> > >  
> > > +	kfree(snapshot->reg.instdone.sampler);
> > > +	kfree(snapshot->reg.instdone.row);
> > > +	kfree(snapshot->reg.instdone.geom_svg);
> > >  	kfree(snapshot->name);
> > >  	kfree(snapshot);
> > >  }
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > > index 71c0a0169e62a..0a10a79962c97 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > > @@ -221,6 +221,16 @@ struct xe_hw_engine_snapshot {
> > >  		u32 ipehr;
> > >  		/** @rcu_mode: RCU_MODE */
> > >  		u32 rcu_mode;
> > > +		/** @ring_instdone: RING_INSTDONE */
> > > +		struct {
> > > +			u32 ring;
> > > +			u32 slice_common;
> > > +			u32 slice_common_extra;
> > > +			u32 slice_common_extra2;
> > > +			u32 *sampler;
> > > +			u32 *row;
> > > +			u32 *geom_svg;
> > > +		} instdone;
> > >  	} reg;
> > >  };
> > >  
> > > -- 
> > > 2.42.0
> > > 
> > 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
