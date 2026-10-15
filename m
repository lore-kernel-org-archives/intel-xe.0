Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4A8CC6B34
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 13:43:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B810010EC0E;
	Thu, 15 Oct 2026 13:43:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8046610EC0E
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 13:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792071776; x=1823607776;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=c1dZrDnSHm/KfYTMpzRHXneyn6yjWT9eFZEaooX1csE=;
 b=hx1hKz3w6nfM5WQep3SJSAnVSwTX4qTVSL3OS0eUaEVds9EbeFHvYCju
 zhCuzIEcXDfkAPBKjlEH1GYpcayIdI28gR9/XqMdbweHs34N0LvTNfa/T
 B7SYOYdLmjCQv9cKWqmvs9YCuO/tvOQ0TgXbecdzaFvul0ps7jC5kVLIb
 yl5E7jjIxzBUYtb+5fzvqZgwyNWOgBt10m3uSuf6Bk1tcyG4tAl3Fh3wt
 qhMCyEwELEJuyMgRw3NKVee1MwjREMnwXWpFcCLSrb6RF1Q3WMDjX6Y8Y
 sHjfxYLgnuzyw8u6ImKr04zrsNfqFa6xOtsnQDwM6WbeMKxwYwpI0R1ac Q==;
X-CSE-ConnectionGUID: 6mLbNbxqQbCKcn/NgY7ThA==
X-CSE-MsgGUID: gB0cmuS9Q7Giqm0RleOAJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="841604"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="841604"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 06:42:56 -0700
X-CSE-ConnectionGUID: 7VkmHamLR+i/plYh7MAl/A==
X-CSE-MsgGUID: gLBJb5dJR32QalQ4qmZiFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1664745"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 06:42:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 06:42:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 15 Oct 2026 06:42:55 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.34) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 06:42:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GBVMhQs8Rt7L3H4vFzIuSSfebMx8M/aqQA76Fa9ZklEaWSXpxYiHLOq5L1oq7mUleACtLPBL8hgEl25BtDiUZ8sDHgm6/ZEjUnFKkn5o/NkAHOJ80mV6YxFmc2Xmy0B5lSPxfjDLcYgtoiirEAvQvLivQi17VaXn6ZHguPxv59iuVDvS/4YNw0nS9OLRPQHKHuc76LXuYlaUsvl1i2MdtVaxdMfgF3LNRPDZcQdh/lds9YW+9fcuAiFSugBinK7ysmT4RktqiWcaIVWQp4WM3qu0kCpkX27YIA4LUMqlBaM4wlxgKMQWrYhlqL1Nb7hktJRS/p1b1GCqAA2j0sqBag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrOUPgt8VOl9JEwVfcE4cjcp/kciJxqqVQPK3B5I50s=;
 b=RXQGS2R8LTfjGUKsTBhsWsLZdQ3H6fTFl7DadZb9+MM3fZrK7BiRJWD/W8Ce+yCLkkilNz4yUHgno+JXDfWh4vllFa1AOtQCuCzgmIkgL1KracUCG988Lgz7QG9xTuZx+ppugiLXEOFiiKVEBn1oIlOfnFqd9X6ByGANORbeEhYHw4TyyEOpHRk3KbOuQ0bFkZXo7HelQY0EZKjzw0tT8bgT72gNuNerGYQkUfWlELfVVrMMvc80a+kBy+GPJZsf1AQmTB4n7ui18wwL6Jr5YPEnX4AeZr5VNJzShSKD+W184NTV69IcV3+RIpAKPwlkYOUNgaWN7pRgV3jVP2V4Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7181.namprd11.prod.outlook.com (2603:10b6:8:113::13)
 by PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Thu, 15 Oct
 2026 13:42:52 +0000
Received: from DM4PR11MB7181.namprd11.prod.outlook.com
 ([fe80::89ec:90c8:3170:5f0a]) by DM4PR11MB7181.namprd11.prod.outlook.com
 ([fe80::89ec:90c8:3170:5f0a%4]) with mapi id 15.21.0496.021; Thu, 15 Oct 2026
 13:42:51 +0000
Date: Thu, 15 Oct 2026 09:42:47 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>,
 <riana.tauro@intel.com>, <michal.wajdeczko@intel.com>,
 <lukasz.laguna@intel.com>, <matthew.d.roper@intel.com>,
 <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH v8 1/7] drm/xe/gt: Use GT ordered workqueue for wedging
Message-ID: <atDYV_pMUFxgj_Me@intel.com>
References: <20261015081042.415942-1-raag.jadav@intel.com>
 <20261015081042.415942-2-raag.jadav@intel.com>
 <atCzaQLVh-SlormW@black.igk.intel.com>
 <atDVeL467De0qK0Q@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <atDVeL467De0qK0Q@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: SJ0PR03CA0200.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::25) To DM4PR11MB7181.namprd11.prod.outlook.com
 (2603:10b6:8:113::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7181:EE_|PH0PR11MB5160:EE_
X-MS-Office365-Filtering-Correlation-Id: e560ea2b-5901-48b8-1f16-08df2ac234d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|10067099003|6133799003|5023799004|18002099003|22082099003|4143699003|11063799006|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info: wJ8mLCaG2z5zUMUGXexmNjPaIjw+YFTlUmn2ikqqFa16D1DqoO9OW2KE1S1A/4pCXi1ObplEe2tBvTdsj07bsoJyqKeZXZXYh9BN87MWOzuDf05SB5wOFsIRfZ9aTT9wh8ANkhFOEOeQkSoYzy3xBGnKK8cMPYchkLQ1C/OpQiF1y77yioBLSCPM6T3UURhM6V+9iVzwAEfQS2KLi0BV8Y7OpTRBVnEu13d019ndIWBmNBDSbVN1M6LqaRaD3vo0mRPS9b0u6fkpl7/s4Oc58ShhlzHVnfx7DxGlX8Jo4XIFbjg48uieGnpL8ShyLC47cg6OOwQY2Nqtde4jLsDcMvBeF5DGr6KQVudDwiqfL6YooiLn/kf9k9gyJBF5sGFUIR20C82Rg0UhzpSoJMDfmWXIeYRqn1uRStj4oqb14zYicC5VfM+T8kNplgIMNKnmpSNgk2FLJGfCgINVizRsDrhZmmQ4LMvLnfgrqfvMClfBS0wyof70DhY/HAGkDi5ji1Rgb1cc23Wk6DoZ+W9+eLpf/+dhqsEXoXRNX0YHrRTV5Qtd4NWiOFZcBxG9K7Ag4qfYdjzqZ9fohwgVGH8fX3bGR5GUaCW5zgEEkbSddsaoD0a174XeyCC7ilx6Zsu7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7181.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(6133799003)(5023799004)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YPIZ3N38rK/D7Hcv3jaqm9TMG0M07mlw3ObidrKr7qNbmpyEdko8lhoyLTvR?=
 =?us-ascii?Q?JRhKtd2g7xwKPLMgN55ibm2FXzrrjsQgH/+lMOK4+KXrfSwfLz4zuhFJuAqt?=
 =?us-ascii?Q?B+z9GBa9RkoVB0fd2zMLqqu0qTpUKH+ITewqnzDCX1amyczR0PWW0Ojq4pOi?=
 =?us-ascii?Q?MX4GehPP1j8//zXuegAYZXxBjMfBfoH0GOove3lr0mmVksVumQrs7yBI2YtZ?=
 =?us-ascii?Q?4WDxHW8Mmxry/RjOC3jSQSijGNrULyiTO7LXZ9OyTZPm/Lh/rMP0dtTDbSZs?=
 =?us-ascii?Q?IcLfDRW6tB6KSDl2FP3hYBOEFB7jWkr7M56u6Svp0gT/1KnQLQ2//xjXb2xw?=
 =?us-ascii?Q?UD2J14W2ZFrHXhdajQjpEOlEfTG/UWfhlW90h6SZikHd+LDhhy3++XVrEoOp?=
 =?us-ascii?Q?9S7/GiLNl/s9Uhc8fc45NzR54irKSsKZ/56ANRUxbMIxD7npXXUsfyqVZ36i?=
 =?us-ascii?Q?mFg0+qJRgvgICyqvkETTPVY5ykNSYvO9Dj8OBFOvObGSKlIBbuL3KO5Qv8eU?=
 =?us-ascii?Q?NdNnH6Im6919v44iXnlw0Z/mTwD7A0i/cxH4iiSyWrkhXh03fQqylLdsjomX?=
 =?us-ascii?Q?bM813kx1KrUHdXQvRk8OXjraHXXBHyo/i3/z6QbwbXwS/77Iqls0ukLpzNOv?=
 =?us-ascii?Q?VWyS60Wm9h2D0KLL/7r3f4h5ztb0FiTabUmPYnti/jw+1h0wiKcjOWZENX+x?=
 =?us-ascii?Q?F7b0hAdpHGs3RLyltT8UC7/ngBIUNkdwPWCHUiwGw6Ca93wS8986md4EVWBJ?=
 =?us-ascii?Q?vC0yRUd4Ts3jeg6ofZBCu7nTgwTplEj8+BVgzWv37fu85/EFOt6RR/pi0ddi?=
 =?us-ascii?Q?MHwVmkTPXBVJFqFCmRdtpmQmaeXVNr3Be5CQoiqPk0YZzxEMpFXSomJgMLrx?=
 =?us-ascii?Q?b+CUGGNne1kqMHKtfsK5vuzbKuK9RQJd9MzNre61kRJz4Q4m1qwDOauf8RXw?=
 =?us-ascii?Q?HnIofN6w8+XV4Ou6aOby3Mqp+mPz8uyZG75uEIzusVCSFVRx9rfXGA+xTMn1?=
 =?us-ascii?Q?MloFC2MwR6v0kkfJzHKaHmBuCCo0GuizFyISSHZRhtuz8cYqUxSLBV8v//dw?=
 =?us-ascii?Q?5de2LkM7jEvxDW4+beBgLuz5iw0OyRBKTknvuywWXzpH5KXyiq8Lym67ZYwt?=
 =?us-ascii?Q?xqeso6x5aVyLhg7pTZO5ejayVa83wXv2A7DIXkYhQT+bXOM7/fjd/bGPQ5If?=
 =?us-ascii?Q?wa+3eT2m3RAxOdC0v3nZwwmT30v5kDM5+EYGFjplYN9VhQKzNPML9Nk0zvTq?=
 =?us-ascii?Q?LE7/LorKEj5gluWBncAiD1ifySrqCl5aWbxVaHnFZ9+Ph7BBcBlW+JOWCPZ9?=
 =?us-ascii?Q?dZwvNebo+cREKuSXBFCd/ypcBdZDdTfOAPfP7uCKYnqyOqO7gyxG737+9UyX?=
 =?us-ascii?Q?wqhqUkkpv0z2sfep8ZwbXaC5A2Khw1QkMz9bWj5JpqJJOJWiy1CM4jsi4wLE?=
 =?us-ascii?Q?rhYGjtt4DjGAED+zbyiDX4Q4VRcgoGJGDZC8CC24eYfQd0Oq2VeWfOQPCqNv?=
 =?us-ascii?Q?2omAyXDfZUvAYA6WVmBPgJtP3UTK5zMvxwQG8JsOfG6UW5WJK5bn4dfu/HZB?=
 =?us-ascii?Q?cF8+Qs+gLyYTh9bBs+F+whC88tcU7sZUXDrbU5IscS9SKUXXjmDSQRQtlNsq?=
 =?us-ascii?Q?GzKHT1oa4Q0UfxaYDwzKp++Rt5TB1b2R6NiSCyw49a7MA3cEXL6eqQu11cI6?=
 =?us-ascii?Q?rpcOrUd3rDoDWtQ3zR7JKRvN/UvCT/t9OLd6CEPBRJiHIrwyFGCCYlT1zXgs?=
 =?us-ascii?Q?nxtVUORs7Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: VWwL9ISQ6oQ2GOPeZIp2ne6CfB/VG4F9FYbR6BhAAwHSjI0d0kK6PJzex3bc6kJvi2Aofj+yb6E1q1cxnqlTrBEjT/pqTGm1ySA8kii34uMMhzL7w7aTmebzSw2idyzQbVcHt9aAeN8YN4G1UJhT3ah4+u5szuonzGAw/0sl1zFHlwKes4+6dyKwMf04OCak9VIcmIZpEZI/8IJKSdtN9PmZ608iR/dyPlSukGj3lFJmJsEpvlIp3Yhdt8SZu9PHHVAujxxrF1KpsjdKFNcqrVAQCOgk/7UeLv5OxfJQHbw2aLOsnCy/CGn5SEC4bDn6PPB3/soTME4qmmpH8wNADg==
X-MS-Exchange-CrossTenant-Network-Message-Id: e560ea2b-5901-48b8-1f16-08df2ac234d3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7181.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 13:42:51.0144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aftrmOdpM9KwPKGy8VHjAN5fO9iL4sesntsflaCXOHbHM24irWh+QfuDKSWNKKYGWsaoKWNrr6xoE+UlkQxN0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5160
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Oct 15, 2026 at 06:30:32AM -0700, Matthew Brost wrote:
> On Thu, Oct 15, 2026 at 01:05:13PM +0200, Raag Jadav wrote:
> > On Thu, Oct 15, 2026 at 01:40:15PM +0530, Raag Jadav wrote:
> > > Currently, xe_gt_declare_wedged() stops GuC CT and initiates exec queue
> > > teardown synchronously. This can result in tdr timeout in cases where
> > > the device is declared wedged while jobs are still in-flight.
> > > 
> > > Introduce a worker for GT specific wedge handling and queue the teardown
> > > on GT ordered workqueue, so we don't disrupt the scheduler while jobs
> > > are still in-flight.
> > > 
> > > While at it, introduce for_each_initialized_gt() macro and use it for
> > > wedging GT. This helps avoid races in case the device is declared wedged
> > > in probe sequence before GT is initialized.
> > > 
> > > Fixes: c9474b726b93 ("drm/xe: Wedge the entire device")
> > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > > v2: Split fixes into separate patches (Rodrigo, Michal)
> > > v4: Introduce for_each_initialized_gt() (Michal)
> > > v5: Flush GT wedge worker to avoid races (Sashiko)
> > > v6: Move wedge worker initialization to xe_gt_init_early() (Rodrigo)
> > >     Don't flush GT wedge worker to avoid deadlock (Sashiko)
> > > v7: Guard GT wedge worker with runtime PM (Rodrigo)
> > > ---
> > >  drivers/gpu/drm/xe/xe_device.c   |  2 +-
> > >  drivers/gpu/drm/xe/xe_device.h   |  4 ++++
> > >  drivers/gpu/drm/xe/xe_gt.c       | 17 +++++++++++++++--
> > >  drivers/gpu/drm/xe/xe_gt_types.h |  9 +++++++++
> > >  4 files changed, 29 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > index db0b883322ef..c7d8aea56f58 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -1436,7 +1436,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
> > >  			    WEDGED_URL, XE_BUG_URL);
> > >  	}
> > >  
> > > -	for_each_gt(gt, xe, id)
> > > +	for_each_initialized_gt(gt, xe, id)
> > >  		xe_gt_declare_wedged(gt);
> > >  
> > >  	if (xe_device_wedged(xe)) {
> > > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > > index 83d6dafab53c..80bda9b548d5 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.h
> > > +++ b/drivers/gpu/drm/xe/xe_device.h
> > > @@ -139,6 +139,10 @@ static inline bool xe_device_uc_enabled(struct xe_device *xe)
> > >  	for_each_gt((gt__), (tile__)->xe, (id__)) \
> > >  		for_each_if((gt__)->tile == (tile__))
> > >  
> > > +#define for_each_initialized_gt(gt__, xe__, id__) \
> > > +	for_each_gt((gt__), (xe__), (id__)) \
> > > +		for_each_if(READ_ONCE((gt__)->initialized))
> > > +
> > >  static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
> > >  {
> > >  	return &gt->pm.fw;
> > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > index bc9bf6f0b5a7..d85406ba6f06 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > @@ -175,6 +175,7 @@ static void xe_gt_enable_comp_1wcoh(struct xe_gt *gt)
> > >  }
> > >  
> > >  static void gt_reset_worker(struct work_struct *w);
> > > +static void gt_wedge_worker(struct work_struct *w);
> > >  
> > >  static int emit_job_sync(struct xe_exec_queue *q, struct xe_bb *bb,
> > >  			 long timeout_jiffies, bool force_reset)
> > > @@ -546,6 +547,7 @@ int xe_gt_init_early(struct xe_gt *gt)
> > >  	xe_gt_mcr_init_early(gt);
> > >  	xe_pat_init(gt);
> > >  
> > > +	INIT_WORK(&gt->wedge.worker, gt_wedge_worker);
> > >  	return 0;
> > >  }
> > >  
> > > @@ -724,6 +726,7 @@ static void xe_gt_fini(void *arg)
> > >  	struct xe_gt *gt = arg;
> > >  	int i;
> > >  
> > > +	disable_work_sync(&gt->wedge.worker);
> > >  	gt_reset_worker_disable(gt);
> > >  
> > >  	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
> > > @@ -784,6 +787,8 @@ int xe_gt_init(struct xe_gt *gt)
> > >  			return err;
> > >  	}
> > >  
> > > +	/* Must be last */
> > > +	WRITE_ONCE(gt->initialized, true);
> > >  	return 0;
> > >  }
> > >  
> > > @@ -1204,6 +1209,15 @@ struct xe_hw_engine *xe_gt_any_hw_engine(struct xe_gt *gt)
> > >  	return NULL;
> > >  }
> > >  
> > > +static void gt_wedge_worker(struct work_struct *w)
> > > +{
> > > +	struct xe_gt *gt = container_of(w, typeof(*gt), wedge.worker);
> > > +
> > > +	guard(xe_pm_runtime)(gt_to_xe(gt));
> > 
> > As this runs on GT ordered WQ, I'm a bit unsure about this. I'll rely on
> > Matt's input on this.
> > 
> 
> You can't take a waking PM reference on the GT ordered workqueue, as the
> entire workqueue is in the reclaim path. Lockdep will complain once we
> eventually annotate the workqueue as reclaim-capable [1]. I agree that
> this work item should probably hold a PM reference, but we should follow
> the same pattern we use for GT reset [2].
> 
> Matt
> 
> [1] https://patchwork.freedesktop.org/patch/711929/?series=163245&rev=1
> [2] https://patchwork.freedesktop.org/patch/682622/?series=156292&rev=1

I had forgotten about that, I'm sorry.

Yes, this solution is what we need.

> 
> > Raag
> > 
> > > +	xe_uc_declare_wedged(&gt->uc);
> > > +	xe_tlb_inval_reset(&gt->tlb_inval);
> > > +}
> > > +
> > >  /**
> > >   * xe_gt_declare_wedged() - Declare GT wedged
> > >   * @gt: the GT object
> > > @@ -1215,6 +1229,5 @@ void xe_gt_declare_wedged(struct xe_gt *gt)
> > >  {
> > >  	xe_gt_assert(gt, gt_to_xe(gt)->wedged.mode);
> > >  
> > > -	xe_uc_declare_wedged(&gt->uc);
> > > -	xe_tlb_inval_reset(&gt->tlb_inval);
> > > +	queue_work(gt->ordered_wq, &gt->wedge.worker);
> > >  }
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > > index 628911346455..c00a7c171f80 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > > @@ -233,6 +233,12 @@ struct xe_gt {
> > >  		struct work_struct worker;
> > >  	} reset;
> > >  
> > > +	/** @wedge: state for GT wedge */
> > > +	struct {
> > > +		/** @wedge.worker: worker for GT wedge to be done async */
> > > +		struct work_struct worker;
> > > +	} wedge;
> > > +
> > >  	/** @tlb_inval: TLB invalidation state */
> > >  	struct xe_tlb_inval tlb_inval;
> > >  
> > > @@ -419,6 +425,9 @@ struct xe_gt {
> > >  
> > >  	/** @eu_stall: EU stall counters subsystem per gt info */
> > >  	struct xe_eu_stall_gt *eu_stall;
> > > +
> > > +	/** @initialized: GT is initialized */
> > > +	bool initialized;
> > >  };
> > >  
> > >  #endif
> > > -- 
> > > 2.43.0
> > > 
