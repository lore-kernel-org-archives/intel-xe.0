Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9E3C47DB7
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jan 2024 19:12:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B356910E147;
	Thu, 18 Jan 2024 19:12:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C376610E0D9
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jan 2024 19:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705605134; x=1737141134;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tGhCjeoaf5wqzDXneZ74lttiqBMkpni8eEcrvKL2fsY=;
 b=a26ClKlyW76Pzzu5hC3PSqqFzUzy1KiLVZVArbHDSS0h85n1h6zKuJBc
 eLyvyl9PboHYO1E/e+YPBvn6vUEBCTe9W5ESAI2L+iBs1YMG7gy/8zQX0
 yxXu1fVp8+L3YR1F/NGVJ3p6BzTs2kpcwoGPoIiTtSbj0//BJwj0ULAUz
 tlA9GBzeoT62/+CC3Kw2c+j3AeQxZq4jxTD6lvrtNerVXXKz6yunEXSIB
 pHxtVVuVBtPs1UcIUv2Fcthnfirr/95aE0xEMMol1dYpGnlO5+MeG4bF7
 cFPTyxPhp7RYzy6ktmZpTMO49LnONH8NCapYvBtOsiKuTK2RkulOnAizT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7639365"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="7639365"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 11:12:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="26844327"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jan 2024 11:12:12 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 11:12:10 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 11:12:10 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Jan 2024 11:12:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AkS3ASvCKI7Qq16F4eoeHpo60TDRonYsICw5XJ0LEIpNkjA4HuvS7TOXl2htycDXkaxbHRiPQqyjSrQDxhaAW/t0F6ZlOkcEbsI0goqwBMbitjTKwkzuZOiWvwd6KImvZUWj+Vh2moCw+rxnTsqNCFlv+KeVdBqmmdCDsYarlTH+9CVm7rhr10QmZ2uUzw2G7xLH/B1S7UYtlTKZ63Zaz2rUzcXQ8FLpKkw9kpaCe8ctan6oY98c7D6cT+g0EtRahBfi1JJ4QiMIQgFjvZX3dPHhXvQz/OeUmNPs6syDvLDTGWU9CpfpRL4LOc5tMZjBovxEp1WTjbMispuAzV4Rbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7Rxln8HSxU+miCmWFZXBENMLzZu1yyAhUxUdyftOSE=;
 b=oSqcJA3rP8l5jnr4F/afjADXm4GH1WdHLqh6L3Oen53A+13uM9417N9lfLr9toIucpQFOV3OP4g/ZI103sgg8z1tJGX2nigcuTFornMpECY3BlQXGaJe/0/8noWVGbtJUSm4JCKAc7J67dIL94sQgLYl7fQAc+Dz0NTXLK7KCNC4X22jQ7+Cg/hN1hUUwQ70cHRdxVgLliJiwkXy8aNItZDlNLiSeIRxY/aU1sCJEYH6eeTj1FxJZl39NgRT9H6GNEiHg3mGZx0i/YsbpxKzK+tosIDe1cKeud/OBhXHPUGvbOye3qT5oMrgKi4z8tH9Ex9CTcIqUtTODuClhrYxFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW6PR11MB8338.namprd11.prod.outlook.com (2603:10b6:303:247::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Thu, 18 Jan
 2024 19:12:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7202.024; Thu, 18 Jan 2024
 19:12:08 +0000
Date: Thu, 18 Jan 2024 19:10:27 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: Re: [PATCH] drm/xe: Do not flood dmesg with guc log
Message-ID: <Zal3oznvaamLHv6x@DUT025-TGLU.fm.intel.com>
References: <20240117204059.345143-1-rodrigo.vivi@intel.com>
 <ztv76j5a2333n3sdl3h6nuulqcdscqcosambxe62rydprzpepz@mitp3w4jgb2o>
 <Zak2LTfFOPRulNje@intel.com>
 <osoxittwh6wna5rq3awbvzddqp6dsggbxg5xrfgcmft3bcut6x@y4vfqvgb4kw5>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <osoxittwh6wna5rq3awbvzddqp6dsggbxg5xrfgcmft3bcut6x@y4vfqvgb4kw5>
X-ClientProxiedBy: SJ0PR13CA0170.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW6PR11MB8338:EE_
X-MS-Office365-Filtering-Correlation-Id: fd80f716-8c76-4c7c-9ce1-08dc18595d72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zLHnLFBRfS2WiA42qUr9apsdS+11wNxk9XD5m/bCZd9pwiLX93he/U85dhJzFk3MT/RkqndfMn1eFNhUDk/Ge8ARFOwHlYwh70Qieu2q11m0Y/MLwMmUKOU8xp66uSUV9uChxCF7bjT9nrpbhVK9x4+NHlffBScaJBNtbqNt9QyYQfRy1AkKzUZDZ/Rrpmk2L6sWJWcNMKdLsCKxjtRk8rpYqCMXR0ovUPNIyF6Xzq/x4iGOTtTey/+Sfa9qFkLinNe3lmCkI1xKip8xRakQWO/cbKn2x2l7TmMFwNZhNmXIjqNV9eNxqRpBp4Sg7amCUFFm3QTJPnJY8v3Gv+Txa0tL1xZYyzI9JJwkSQ/4ezHNTDzZ6IXtjWSkno6S2YA/FEhBNePmuaZjQhaHJNyvPqWK14ojvR6f2QB2ZmmcTvasgL0A8CLQuXHT0vGyt2N523n6AicW+xddAPZqOEBiB9aT+N8QwN0CH3Xe0QHUNUTJ8g5E55rtIemvvxTsPLsWcSzSCo0gxareuRz83QkoTMFcGkGOf3rlAKH+938HDH87TBAiic1t6Fs5VdRZMFdi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(136003)(366004)(376002)(39860400002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(2906002)(478600001)(38100700002)(83380400001)(6486002)(5660300002)(82960400001)(41300700001)(26005)(6512007)(6506007)(6666004)(8936002)(8676002)(44832011)(86362001)(66946007)(4326008)(6636002)(316002)(6862004)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QxSD/uWIE6eBQ/WPTRfD2c3G7M0GuOrRoykMcrYbZiF3Ke1Ee7kny/NrJg5+?=
 =?us-ascii?Q?p4qs0IMe/e+l4wLI4cHOE76SfTnKIAVxlo7YVsfo66AXfzyLTiJPHE6RGt0Q?=
 =?us-ascii?Q?2btH/H/eHp3opEQKWhOFZHGbSDZw85jeMq5OWvBSWyh9gSJaR1CcOKpcL6W8?=
 =?us-ascii?Q?DbvHGqtaP5nI++vDTgbDxM87VsVJWej0MWAlPja3VgrUJOlg8ZZC1tCQdHzV?=
 =?us-ascii?Q?YeciUfR4u2YEq9XehC5JexRlltl+4qKgGDa8zxG7Vas00VMnArkZXdANXow7?=
 =?us-ascii?Q?KLw3m/XXcft2vSQ7TtunNwUgi9D+rL1yDKIdXdD8U03miZvG1utV1U46MjHl?=
 =?us-ascii?Q?4gjghzelytb/DcAv1ni4JviCh/whsklI0dZujA/iFrSLDUTsH3+EDChgiuKf?=
 =?us-ascii?Q?f3zg6vl6Cj53cq0A9tYY2mr2CBUsMY9pDp1hiRX98CCZNgAKp9qRK4lJ4ajG?=
 =?us-ascii?Q?mCanWofUaJU2Hhw0PV3TXxCyiFHXqUfIJ83+P/O9QCtojuUO44HclecFO09C?=
 =?us-ascii?Q?YVQrXiiLSrtuuupO8X4UApb5unSChTi98Y0D59l5I1VB6UnX/So2pkge8v1Y?=
 =?us-ascii?Q?fzO8eOd+In1V4EyLj7NwXkQoPI5BCUzvPcsP1nmT2mXsrT2kMsVAp8nvdNw+?=
 =?us-ascii?Q?H7ySMrBm60CEIG2MK9WtHq9d9Lrnb1p8a7ZkT4AY1qt15HkEFPW0GRf369Th?=
 =?us-ascii?Q?92HkdJE1rl0vJw8yONGjTfT3HaY1QQqHFg8gS81n0iHuAvay6ZoMnK3AfQJt?=
 =?us-ascii?Q?KjyaTHXihj/E6FlK3uNCBe5NLluoRWhc8Ly53ljgTnxZZZnmVXSn6xEb2j13?=
 =?us-ascii?Q?+2kgrFDo2yMbgFH6vkyi5ZEi68OR0yOTPhoYLUVM2vZg3bYbRx1DU3hEa/f/?=
 =?us-ascii?Q?9YvYlZhEKxAPuC8yjprzmxkiw1EKm++4WrqVDkQdSeAeCIjYayifYGYGqpIH?=
 =?us-ascii?Q?4dEWzM3HfMnvY6TVDFAmPeL027aT8P3cHqLH7MvEpjnQ+FW94KFdyAAWJmpj?=
 =?us-ascii?Q?S0AXaxgdvmQ37bRvBfFUtLRCqzFRVIcW014c2vxwdtmBuc6sIngkhsWLZTKc?=
 =?us-ascii?Q?UNxR1jThoM2/XECMK/FwWy48Tp7gwgSQ3dgLNEJNnHZhIH36h2FQKusanth9?=
 =?us-ascii?Q?Bo8JDmSWY269Scpse+iBN+lm3e90D5p207/UhLMEeCbZ/VxKP2OzkyR3/mC2?=
 =?us-ascii?Q?GomckRhqngGt1pCJJTf8Wo2tnsBYXnryyBWYwm9ilY5pmDGaOvwHkavOj7VJ?=
 =?us-ascii?Q?WG0wDrz9pzqbBKoG8hvNflQX1vnB9eQ2Qjf2rigsWObTBu3j+DRBE+ae7GsD?=
 =?us-ascii?Q?9wdurYZW3eaTfcZCicco3t8uuue9xnCWLHlPtOrQZDAEqJGVr9d/OCSwySfx?=
 =?us-ascii?Q?seTpgc3Dc4eqmVPZD9xBmjUr5qv4XjAEoAV6Egcph6wgSRcf9FsGb6HM6lv0?=
 =?us-ascii?Q?yVvpC3a7sZGiD7QX4UcpaUYWt7PmSPJUS/X3SBTVnvQvy28gAWaZ95VVOw80?=
 =?us-ascii?Q?HnzPv+IBwbz6Dv81RegGOQbmtK7G+zgDHhAZRLeb7eJwbcwky2GzBhOblkZk?=
 =?us-ascii?Q?hGalCllRCMjwpoSXn+uvtB4+00z8SUpbY51GQAEyVPR1OL0tfx2boDf0mN96?=
 =?us-ascii?Q?xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd80f716-8c76-4c7c-9ce1-08dc18595d72
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 19:12:07.9674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7TamQcGsztkIbLDNboz0c3BoBAzUw3iXCa1csMjTQD+VRx3vzS3Ta6Yd/3y9U81FVeckH1JT5US7VOFgaCXeow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8338
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jan 18, 2024 at 12:16:27PM -0600, Lucas De Marchi wrote:
> On Thu, Jan 18, 2024 at 09:31:09AM -0500, Rodrigo Vivi wrote:
> > On Wed, Jan 17, 2024 at 05:42:00PM -0600, Lucas De Marchi wrote:
> > > On Wed, Jan 17, 2024 at 03:40:59PM -0500, Rodrigo Vivi wrote:
> > > > This information is already present at
> > > > /sys/kernel/debug/dri/0/gt0/uc/guc_log if needed.
> > > 
> > > but is it persisted if we couldn't load guc?
> > 
> > well, it was there here with the same content that was spit to dmesg.
> > Maybe just because I got this after a resume?
> 
> not sure. I remember past debugs I had to rely on the guc log being
> relayed to to kernel log when debugging issues on the golden LRC
> submission. Honestly I don't remember if that was with i915 or xe.
> 
> commit 4bc3a34f1237 ("drm/xe: Dump GuC log to dmesg on load / auth failure")
> seems to be the one adding it before drm-xe-next creation, but maybe
> we just didn't have a better alternative at the time.
> 
> > 
> > If so I would still prefer to make that persistent instead
> > of the flooded dmesg that gets really messed up and hard
> > to navigate to find the real useful information of the
> > failures.
> 
> that would be my preference too. If it works, I'm fine with that. At
> least the end user should never be exposed to that amount of info we
> print.
> 
> could we add the guc log to a devcoredump if we failed earlier?
>

I agree that if we can avoid flooding dmesg either via debugfs being
available or creating a devcoredump that is the preference.

I added this code originally to debug failures on driver load during
early Xe bring up. I haven't used this in a very long time.

Matt
 
> Lucas De Marchi
> 
> > 
> > > 
> > > >
> > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > ---
> > > > drivers/gpu/drm/xe/xe_guc.c | 1 -
> > > > 1 file changed, 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > > > index 235d27b17ff99..2a71348c5deda 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > > > @@ -466,7 +466,6 @@ static int guc_wait_ucode(struct xe_guc *guc)
> > > > 			ret = -ENXIO;
> > > > 		}
> > > >
> > > 
> > > trailing newline above
> > 
> > not actually a newline, but I can remove that extra line there
> > while removing this.
> > Wonder if I also should remove the spaces between the if/else
> > above this block as well... The "style" there looked strange,
> > but I decided to not touch.
> > 
> > > 
> > > Lucas De Marchi
> > > 
> > > > -		xe_guc_log_print(&guc->log, &p);
> > > > 	} else {
> > > > 		drm_dbg(&xe->drm, "GuC successfully loaded");
> > > > 	}
> > > > --
> > > > 2.43.0
> > > >
