Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F9DC7EE25
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 23:39:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B7CA10E578;
	Wed,  7 Jun 2023 23:39:18 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B0A10E578
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 23:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686181156; x=1717717156;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Skhbnv9UFjMmkuwAPa1xT+VgEleg6Dl3Mjqo0tjBbXM=;
 b=PYtmcIW/w2qGYTRLuWktKsrV/JoxkeZvZ9u51NXQn3ldfLfp3jWLNwft
 ymEC33/Y/9r/Gt6iAJ64ZU9DWBtsq4cAAl2CgwQgd957qzwV/KGy9TzUm
 Tfeduehgyxr7mHZ5vtULwTearSwy2LjL7eF1k/4IFExQuHoAMxtylpynv
 E5QrNyveif/vp1vR3XuGz6N0UOBoNwP+rHYZUvN5/Xb+SkRbK32iNjgyt
 u+LVVGX2KeBSzLbENaAb8GHNwqr43MhKjQxPxD7TU2d1eDeTwm/cV0XqR
 K0G8p9TnD3CVYZ2NDjRx+k7Ifr5bCE+xoDfxQgYwFIWPAyJGtpwBtPh6l w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="355997995"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; d="scan'208";a="355997995"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 16:39:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="799585434"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; d="scan'208";a="799585434"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 07 Jun 2023 16:39:13 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 16:39:13 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 7 Jun 2023 16:39:13 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 7 Jun 2023 16:39:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SIGOEh40FgqwgWZFIfC/kbNKm2iwJzwjCae7UaTbzDgVVozVd7oGyymjF3ZLCzPH42psmtLfvxvg00Q3mBObp2gN29ju3C6/Aku7QOUb4b0b3Gaqa2BtpviBNMJbSMlpy1AZ0wy+f/3W8lYIqxz0Cz4S5YiqS23jdcFGfZFy8/BJ8GOEViqr89iUDlmmAfCVPdjy+IMvmWbGBrZ9QppIgEcla1x4itrHD2C/MgJC8vnAt4yq1ApC1Qh2RVmTgvr++2G+D7ee1EFhqUEqtlyL7En4iU4o8P8pRuyBaH39xo5YzLoxvdzYs4lDocxTSulQJt6PbtgwKQJ05ZxHyX/etA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+5kF+b4mEl7uCOCJ0ZLY9R3I0eWl8PYR5dc1Vdzt5+k=;
 b=mEuI1V9lxLqLhhQhC/DKNiuLjVwHtg9zyWu4KJzivjSUkFPVh29oCzbAonTnRf/EGp5FqcIj3KFyyED1OagB0Hcy967nylKRkJaURetV07GbZKU7QPkvW/jeEkR3DP5yV2vasqnKuyeglCKz6h1zQ1ItiKaDS8hpqnRzROeAmePP3KZk7yB+wrausVRLGQWO0BBO7c3dxiDxw8Kl1IRbmrEywJ+kXm2w4kHu5eK31FrFql/Q2qvfI2H5TS0DnM07+44IqTaKyo0G0m3FDNrOMzo6eyn9Zhsryp+24wCX0uBIGg1XYW4DA6sYUWnMey5lWDe59RDvCrOsY9zgjgpA+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 BN0PR11MB5696.namprd11.prod.outlook.com (2603:10b6:408:14b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 23:39:11 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 23:39:10 +0000
Date: Wed, 7 Jun 2023 16:39:08 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230607233908.GY6953@mdroper-desk1.amr.corp.intel.com>
References: <20230606235242.1895643-1-matthew.d.roper@intel.com>
 <20230606235242.1895643-8-matthew.d.roper@intel.com>
 <ozcpduwlkdrbzx6bit2eqdrca3qawnjvoo454rrsebtelu24ng@yl6sktkr6fwg>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ozcpduwlkdrbzx6bit2eqdrca3qawnjvoo454rrsebtelu24ng@yl6sktkr6fwg>
X-ClientProxiedBy: BY3PR10CA0017.namprd10.prod.outlook.com
 (2603:10b6:a03:255::22) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|BN0PR11MB5696:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f16d486-d9d5-44ba-1b4f-08db67b064be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6ah09zC6/rHBOx0n7zP++nJ8dGF4rfi01ywPB8zHejSxS3Qy9fZCl/MSAc8MfTfaiwaxtP2/ODKQmZjNy55Fx997S7Fe+Qz47Yqi8ZVW9hqdzL2bCcPwuadalUCUqhR3TvAIAlc1aey9JqavCrhYheO4hV9L1eQPhtN/E6x9TOSGLqQDIHUGFiJVCmJuEiV3Hb16TY1WE21rOALm7S4Nm60V5vqgNAANrBUq1PYcSLEoueYN8m024a5K2ghUEi7pfJs3WJytbDn15lyARRwCWbMRaxgYfIW30v3GW769yNNPpcdVmCodhc8bmyMopLtwC5UcWkuScriy/oiNplxIAosXD7DIcvFOdaLmmeCOBP/agrR5J0bSIueT1h7cvdEg+BtQWNhNsMB2Z17xHGPEWdzIc8RBMGmtywd9h9LSoZ17BQVBUDJOa8//nlHTEO6tCLNY4IkgypFpp60rT7exCEPhWhjB86K1fsncqp8CpY723Hx/mh2wHoro9Yw+Tfiz8Fi0CKAdwGF7pGynvnC+5c7ePWjP+VMjAe5ca94C3wn3qHOv65vGf13T7BaHXOdJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(136003)(346002)(376002)(396003)(451199021)(6486002)(26005)(83380400001)(6512007)(33656002)(6506007)(1076003)(86362001)(186003)(38100700002)(2906002)(82960400001)(5660300002)(316002)(478600001)(41300700001)(4326008)(6862004)(66476007)(8936002)(6636002)(8676002)(66946007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cEOafDT3aRrnsDz000NNGZhVmg9ZbHeQ5mganTkf5FwBSCTGYA5DwR20w4xE?=
 =?us-ascii?Q?jDQ01oxCacxjiLIU9ojBHCFcxeJaRr15/L5CRU4Iz3QICxdzFeCHwl7ug7Gs?=
 =?us-ascii?Q?2GcXGyAW8wVug8Y+DrycHzkusJUtdLlGMK5kp7+CXMlbOsmWdFfC5BN5LbXZ?=
 =?us-ascii?Q?fXYHBdOpcekSmECFr7jlIWk7feM4cZN03J5VBpz7s4hTBQcrNX+RBs9e3Wp/?=
 =?us-ascii?Q?4eqBPOEnGVLB9684smV78l5GumHtWRpZFfIAIPIxSkmlBlRw70kcXuEZfECm?=
 =?us-ascii?Q?ber4NhJGfr81b/rsRJwg5iaVyu0vHsvYSIqnDP6DOGWetWTZdRiwLgXiXrP/?=
 =?us-ascii?Q?xXmRCGhFXmf6FEWJH6lTd18E/222juok/jVF3+u02VO+NVsFSJBeaJTh3wS1?=
 =?us-ascii?Q?h8rnTiKFE5EYmH/0oxETuFKD7s5SUYf6bDleIpO+5nHNvLU5AKcSoluX8iav?=
 =?us-ascii?Q?+OiFBNiGnjls/2RWyLngSFcs86LedLTHitqO5+uPnsKUlEkymKMgCIMITx9P?=
 =?us-ascii?Q?RjVHA6BO/06DTO0dkgdEJfVxTDxjlCtlRJEdjoN4dr/z8NZ2eQ90Qd5NNTGp?=
 =?us-ascii?Q?6Yw3BJh4VwmfpYjGgY8JDy8n/xL5jHxgH2MZ7Ko5EgvQpSnDih5rzy6HT9Z/?=
 =?us-ascii?Q?OAvIP3pvGHu5lL1CfLow7OB+/bV81/eM74Quzg/jcj62lUeLOWVRtF801Qw4?=
 =?us-ascii?Q?F949dZPJOWWOaYDn5ffO1XJe3BCbiXwvynjvPVVXGYh7K4ylY2UtoQi/zio/?=
 =?us-ascii?Q?Rx6dL3sxTh8PAahWERr1XqVVnFMThAehNT6GHEQx4p9lXyWAYRRYjJfIMYCq?=
 =?us-ascii?Q?104/jhe4FBFjOpNhNLUgduOIMSkxyhOM8W9qY3jfS4UZrs1e+Vqm3XlyArmp?=
 =?us-ascii?Q?5lG97wyx+3kbTOXZ30IJDJGRxQ3Xr/cQUcD35EHctytKm2VqqQt3tS+YavGQ?=
 =?us-ascii?Q?ggV+nDVYIHj7GdabWI9P4OCG4i3GO5YQ/dScJfCUJukRr6IbVFGR9MIZdxvu?=
 =?us-ascii?Q?eHci2uCbdXqa24HIscWPTbyXfFoNqoY+7g5iJVdzQE7sUCkyGmRdbM31CTjI?=
 =?us-ascii?Q?vKAYUEE+zUbA1iNQu9sPyWSdO+q7oDRoIGPfaQz7rpGR/VQ5GsK4P89rEI7y?=
 =?us-ascii?Q?OhspLJfsnlLHc7iNhXnfvG+NfDxxsDvY3LiBrSK21OvCPCu/YDH0lWyfVwYK?=
 =?us-ascii?Q?goWjN+wIYPM/W1bvdXB0pT0US4/QNxH0B8E54Ms2KXJN7y4Cv/cnAivgFFLS?=
 =?us-ascii?Q?Vmqh761/PAaRlALQqyE+wrUQ+jVKCXwUrXda4177jdd+jI3mU7BIEM6AAX1i?=
 =?us-ascii?Q?wFeiNCSbzzElgNwJvl3pt1dhUW3jHS122zgLF/2lfsMmst0iikMx7feZUky2?=
 =?us-ascii?Q?h7UYai61Ye1caQRtJL5ifN5tSkKi19pjkPsj5HgcY36JPj3gNU1pqwgCLr2i?=
 =?us-ascii?Q?P2tA9Hdz9DkHCCTWFi5G9Xv+3hxcjq9t+DyL1phEsba3YazL/aCqBdjI+RQH?=
 =?us-ascii?Q?9RzFLU8s/CYycMRV/WIcVZrWG8B7t/qkpoqRbLuvTfgpkM58wa9ZIVIYoN9O?=
 =?us-ascii?Q?ne0rYl00WMyz7bTMKYyiOyr6wy9pQr+pVeJyjEy7kKUrY/Wcqz8qX1wB2IwQ?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f16d486-d9d5-44ba-1b4f-08db67b064be
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 23:39:10.7425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yWDHbyoL2C6M+75U2ttY029FMt6z7+f3Q1Obj9qs688WgI/YPGxqJaMSmAbyVRBI0C+66g+cJEc3IX6NpKb5MpkA8MOREfrXEwGyShCU+LI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5696
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 07/10] drm/i915/display: Include of
 display limits doesn't need 'display/'
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

On Tue, Jun 06, 2023 at 09:33:29PM -0700, Lucas De Marchi wrote:
> On Tue, Jun 06, 2023 at 04:52:39PM -0700, Matt Roper wrote:
> > Drop the unnecessary directory prefix.  This also makes
> > intel_display_device.h easier to use from the Xe driver.
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> 
> is this supposed to be a cherry-pick?

It hadn't landed in drm-intel yet when I sent this series to the mailing
list, but it has now, so I replaced this with the cherry-pick while
applying.

Thanks.


Matt

> 
> Lucas De Marchi
> 
> > ---
> > drivers/gpu/drm/i915/display/intel_display_device.h | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
> > index 2aa82cbdf1c5..327520b0ecb9 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_device.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_device.h
> > @@ -8,7 +8,7 @@
> > 
> > #include <linux/types.h>
> > 
> > -#include "display/intel_display_limits.h"
> > +#include "intel_display_limits.h"
> > 
> > struct drm_i915_private;
> > 
> > -- 
> > 2.40.1
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
