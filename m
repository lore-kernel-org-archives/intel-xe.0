Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD3EC761A6
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 00:03:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5084510E56D;
	Thu,  6 Apr 2023 00:03:00 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D1E10E56D
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 00:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680739379; x=1712275379;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=i5DmbGzWWZL1Jx9EV0q1JiBoGEFDzwMOUcMOGCRcyYA=;
 b=DLZpUda3GBP0kSju/Rc7gyVdzWF9Nd3myJlE0kPCBRKE7uMm7LalxkgT
 O9AmhTap2mvUvUInV/5c6xrBScL7yuKvXLPlA8i6fUEgoAKQGSq19YJMs
 ZLpSvsj2h9KXUGWRNaJ0xkdYDvO8jePcvZGkf9MCHrexyPY/z6wxXQYUM
 qxyOrzRibis78TZzCkQPhzjhcln/u0phXlCiqrmwg9oLdDznre8ahqdyP
 bbtf7VSglAEqcQvLMbP8uusCON8KWvXu7qApX3OhQroG8ZzpJGdh6UVer
 DvGTIKa1MYnSKFLc8wQ9vgc9bLeJo14lTfuG+FS5mTOkZNhMekThn6RQR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="326637104"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="326637104"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 17:02:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="776254118"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="776254118"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 05 Apr 2023 17:02:57 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 17:02:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 17:02:56 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 17:02:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gXyUf7BfKR7Aqg2d48mDsnu7598mlNfyzItvwOZXpjnXbTEMo5jqGlQuqSbafEapzJrFm62JvAYWCsazCVjaOPXDEmyAQKEcZtG0+A4uaf+4qX6efMBMoxQmCt0wrmNv7X+nQWpIUgt9MrnGhQdp8NrE4a/7+2BXUx+Ru16jmqnR2qlbvEYZ37jOeh/ETBcCG5bF5v1HfqNEIhVRug3e+KQaxWMcXhWX/9HltCFYAC40Ybzokn/AVEhwK9FdD3VB3FrBMQ+iVBgurNh2wrDrUOFZ7iHcf1bjmZs+veLijKpvHlUbegzeVGRRXQabkww+O3mfL+zjVX/bDLobKV2frQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9zy34syNgJSskiAg7JJ3PNre/Htjd7DhBhuM9nLmr8=;
 b=XBKNTEcw2ON8pySOGSGWJYy8cprvCVdoL3Fd+NYvc6TMbmvEjZkV+71u2ahTvA2eVAYOypBDflfh4y3RXaBNIV39xEBppNpzEy85C15TwhwDOHUtM9OQTYXE8hCCj3s7+SkouyyglnzGsIOZB1AfXNddMKFgy//QmhWvrxOpVA1FEDJFWxGmFGfmSaUWANzgr72tmu7y7N3ckd8rWch3Brk/XB/BL/MH2UCuUnpjUKlI4BHyXhZ9dE2PfYs0022SPRPmNAL2S1XWRrOdIqBrxhnAXp5s/wMWT8iIiaJ61tL5qsknLTupWQF961JFyK7uCU2Fm5WLaPZ8Cg2UOdT7Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8230.namprd11.prod.outlook.com (2603:10b6:8:158::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Thu, 6 Apr
 2023 00:02:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%9]) with mapi id 15.20.6254.033; Thu, 6 Apr 2023
 00:02:55 +0000
Date: Thu, 6 Apr 2023 00:02:50 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZC4MKj5tYmhH292I@DUT025-TGLU.fm.intel.com>
References: <20230405233403.151088-1-matthew.brost@intel.com>
 <20230405233403.151088-2-matthew.brost@intel.com>
 <20230405234230.GK4085390@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230405234230.GK4085390@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR05CA0124.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8230:EE_
X-MS-Office365-Filtering-Correlation-Id: e9c8a92c-be54-441c-a124-08db3632459b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k7mVB522BxfG2/IHFpGHPQ2Rt7wgITWWscSir7DegNS3ZuBqA9DddEZY2xgZ/qxvsQvv5+odEpKav8TfKcWg7gkUfj8POJ5+hi1Ew492ZOrMPZCZ/tTElExoy2nkCGTKb6hx1sPW9nPQYatzM0lNe+1+24aofnoe9lFTp2R5ZecxlIVrzZLZ2b6cGgly6xUNnbODjrPME7f0g7V4+7Bg8J4dUsVMvpmkBuCy5FPCECbL4mf1hwUj1IqLDzNLD9kKSc3jlHcaPUy7XHrnOeu9Y/yQeJZHzdP8ixPW/jhPXwMcwh+z8+Xfc7PhASlizbONEGoI8BHchdO9BSJwqzsI6Hf/gn38VFdYjIWXnX0aAM6GoE0EBhEZ3NueJ/9X28QmITUutZkT4UzNmp23Bu5dn4cub7SBnvz7hoY46Macwk4MpSJ3IO/dQ9s2GCdVq7gfr2HBZQB+L07OxlplsRXRR2K/MPLemZwg++8WcT1BADDRUFDUYXF2SWVFod+xkHQ5fjQ4snFIQXkUo191BcKOq0EjIh0z9Qt7SallQd3v9b0tdbu+chpEK0LB7gzDaIP+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(39860400002)(346002)(376002)(366004)(451199021)(8936002)(41300700001)(478600001)(66556008)(8676002)(6636002)(66476007)(4326008)(5660300002)(316002)(6862004)(82960400001)(38100700002)(44832011)(83380400001)(6512007)(6486002)(6506007)(6666004)(66946007)(26005)(186003)(86362001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m+6L00EyT3uwpv/eq73ojeFqZccSEZcV/EPz05TimPEDy9LN8AKRZqJAy6f1?=
 =?us-ascii?Q?DbNE9kYqM8/z6xeZltaWuJYHlEBxBXZ5gPw3C0iSee9urrZwi1s5QcnJwvL7?=
 =?us-ascii?Q?noMQP6XKXeUm7ZSjlz1Tv/cciE/ksq6lz6F6HOZIf7jySSlEVeGLef94BVXh?=
 =?us-ascii?Q?BOO5dRljEj0FCcnv55Q9ZrImIIjJGqL5DbNKG7zNScr0lvXAfjD6sQiXuxLw?=
 =?us-ascii?Q?nfllQ6R5znewMy1EAjp1GqfThMnqlus39/LMOohq5vk3Fo+URS9YynFFNgx1?=
 =?us-ascii?Q?9LDXM6IFWD/63ppUgEDY0Bkb9w74Xb+H0vWF1OmKldul//p1gtR4144mowJe?=
 =?us-ascii?Q?vBs0DASeTFkovV3gNPr2LtUT9Ro26DVF9vBdRIoB4+aOZ/Bw1hse53IrEBcX?=
 =?us-ascii?Q?1MUOEbOIh0ziHNXi3Nv5X2Tp+pF+B74jcHj26etq8bZSOosVGdZn5pEjKppM?=
 =?us-ascii?Q?Pa11a2AITqfYzEfFXiSvqORsPK34cCkQ6n7QkNuqQwvTuEddrZaOHwzuGMZs?=
 =?us-ascii?Q?wtiF8grOW7ip31SQMban2Fts7zS1drLNkzASDi9l9kU+c8zItb7+NhUYIEZN?=
 =?us-ascii?Q?qfbmNTaM4fioO9kjIzp1Tp0x1GYzISY1gZpJ64Umh8EO1NUbglV1zj64AaJj?=
 =?us-ascii?Q?HwHyvcn39p4o89Ajy2syE+EA4CrqLpRzytpUEj6CGH7ZN++f/CU3rEYCJyxk?=
 =?us-ascii?Q?6bJN4AacN76/DFiQssAhT/k6aAEzCjnsmZwLkn9a9ZYtg3MQNaOfnmwRrdpV?=
 =?us-ascii?Q?plVWcpOf8ww5Giy0pkrdbv1Rg9wOjLn7tt0IWm9/BfWaJIzeA2b1V+whjnbj?=
 =?us-ascii?Q?P5HjedOqxDPPk5IgGVn6gRP69jaW+NKiplqAQ5RjXU8bWTKE5kJ4bR+PdU6s?=
 =?us-ascii?Q?hRjc4OcN6dY3tkhB10VAyoRpr+SII0lulUwodQm+8/29JFG/T0Qzx/gYpbpV?=
 =?us-ascii?Q?5qLhnrfpthmkB3x7j7EOMk1D4M0Js9hT240eaox0LQbQEBP4duONGCZwZjma?=
 =?us-ascii?Q?PrTmCgdR1oAZw+IzNHBrtom1Gj7DwExTME5wyV/PlsGhUsp4RuOF6ZEbcyN7?=
 =?us-ascii?Q?BghUrLraWAK3WflRt1qNmR5ENCV2RelaSdQhD4oOmAu7KZGj9p57aIR+2UZg?=
 =?us-ascii?Q?t+1JWiFsXIVDgG98TjIqgqrD5o5xycC4iCiZZpvgIPT6AL6YnMjHLhc2SDVY?=
 =?us-ascii?Q?LbVv7Yp/h3XkM0tXQveVCIX/l+qP1IHwwsBs+sjX5D4Jg4iLYsA8FSGF+kBl?=
 =?us-ascii?Q?xsjQOqj+CdblZ394ybEN/spHwq2aCErkNM2iyosBTQbzhpDbGRfmQ+Z7NOOu?=
 =?us-ascii?Q?KkSwRtY9Po+l432ipccUs8fRx8dPa12Br55bPL/qnGRLEmMPIxE0F6PlOtmU?=
 =?us-ascii?Q?4dkGVpeFUEz5kYrMSZd+afYRtzxBq2PFXoCztsCR0lyaDA8YpcD4HrbpCDHd?=
 =?us-ascii?Q?p+CL7n9K6aknx/CgnBzH9pyrBW345EMkNIu0M1KBmkFXYKX2XLcn+eyrQgH7?=
 =?us-ascii?Q?UqJqBI5H37A7/Ho9b1klXaC3Y1TILAFrT1WkJG/lLt0GvAeznn1yRyOf+f1i?=
 =?us-ascii?Q?wj1/CklZlvY4rDH6Fk0R302aGEJwIToJuPLbFjH3f/szy9pe59garImiWIqU?=
 =?us-ascii?Q?DA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9c8a92c-be54-441c-a124-08db3632459b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 00:02:54.9107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bosONRRTiqj6CtkDHkz+7rbpDEAoCbq/5pHh+fPBV5mbD9t1EqiKch3Py77xyYa3m6IBfAJMWBsRZW22hxfHKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8230
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Always write
 GEN12_RCU_MODE.GEN12_RCU_MODE_CCS_ENABLE for CCS engines
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

On Wed, Apr 05, 2023 at 04:42:30PM -0700, Matt Roper wrote:
> On Wed, Apr 05, 2023 at 04:34:02PM -0700, Matthew Brost wrote:
> > If CCS0 was fused we did not write this register thus CCS engine were
> > not enabled resulting in driver load failures.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> 
> I'm not sure why only BIT(0) was being checked specifically.  It looks
> like that was added in b9d18a2338c2d1 ("drm/xe: fix compute on
> XEHP_SDV"), but there's no explanation there of what it was actually
> trying to fix.  XEHPSDV isn't something we care about anymore, but it
> might be worth doing a quick test on a DG2_G10 that has CCS0 just to
> make sure there isn't some other problem lurking (DG2-G11 will always
> have CCS0 fused off).
> 

The BIT(0) doesn't seem to make much sense, it certainly is harmless to
write this register on every CCS engine.

CI seems to have a G10 and is clean. Going to merge this now.

Matt

> 
> Matt
> 
> > ---
> >  drivers/gpu/drm/xe/xe_hw_engine.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> > index 63a4efd5edcc..4b56c35b988d 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > @@ -253,7 +253,7 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
> >  	u32 ccs_mask =
> >  		xe_hw_engine_mask_per_class(hwe->gt, XE_ENGINE_CLASS_COMPUTE);
> >  
> > -	if (hwe->class == XE_ENGINE_CLASS_COMPUTE && ccs_mask & BIT(0))
> > +	if (hwe->class == XE_ENGINE_CLASS_COMPUTE && ccs_mask)
> >  		xe_mmio_write32(hwe->gt, GEN12_RCU_MODE.reg,
> >  				_MASKED_BIT_ENABLE(GEN12_RCU_MODE_CCS_ENABLE));
> >  
> > -- 
> > 2.34.1
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
