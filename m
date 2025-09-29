Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA98CAC5B5
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 08:52:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0237810E3CD;
	Mon, 29 Sep 2025 08:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rbsx21za";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398CB10E3CD
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 08:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759135970; x=1790671970;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2SzAGSdPGyArEEKY4aWPuwWSZyph0BZVh5IzHfpGErU=;
 b=Rbsx21zavlgEFnOdHEWwg66f0iaQ8GTrmlWxzcwXauoxJ+bzjgLB+ah5
 3zeOuM2zzU9rW3ndTNm3WUYRP4p3hNGUN7/cOukExTH8zRX0Jskii8ghN
 wmSEsj3IujGuYpOxdVzzukd/KhYCyOhG7LzoVphh5/3tK1vOdm92JalbH
 oLt41JI5SM6N0xdFZxwXyIoBK3fiWvjVKZzfqJ9xPQTV9xCgZfgqNQnuS
 bBw2u7TJZk/NmmnMZIPHK30VwNVlfXwFxasFN9iLearayj478dWzvOi6c
 5AljrPdeO/nUsBuiA1PLZc490lKC83iY0SWwvkRxyFxo7Z5Su53qFq/kS Q==;
X-CSE-ConnectionGUID: V2MiX4xQTZisIcfmqfVZJg==
X-CSE-MsgGUID: l+wwNjzlQZWIMs4Lnv9Fjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="72469813"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="72469813"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 01:52:49 -0700
X-CSE-ConnectionGUID: QvUByvOjQ3Oh6SI0NqNztw==
X-CSE-MsgGUID: XUBzfXmzR8WuTjdpWEaoJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="201850462"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 01:52:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 01:52:47 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 01:52:47 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.42) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 01:52:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FgeFH5MCjrpRWsY0wDjztwS8/FHf+jYVISIiWk1VjDpROzJv0EB9//ZBzMkzg/hfBbCiJ748yEGDUBu7iOWRoE2iXlajMOO+h6sKFtKpZ9XI29BDDFQKIfCCae+6Hxszb58TOi+5n71GTfNXv+z9Xkd8TYsJLhXYh8J44+6eILP1y1FwlVAo6UY6h8KCsaSSnAbfwOJhpj++Yq0G5R27XkuS1/nQXcdSsowQYpyAdkb1R7ISAQiglwu1u2YfdTJjPl2XMcrXWOb5o5N/IgFDHwZZrEONl1ap5a12gKyWh3KuihXkkeCd1EOMsYEBjG/X7Lv8tNMrxz36vFaywQWHwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xT/in/WuaYM6vyBjPJlUM/mFiwdMS2xHtj1m0YObH2s=;
 b=NtyJiWobysa6vSH68iiD8a5IHIpGEGuAcjJmDLP0GLdyMHS5GNzd93GxLHb32zjV7t6A3NtbFOB3lysiFmYQ2sgsF3XGZ6G5/aICJts6y4yHViFD1aQ7QHr7HetlcKThhSdZ8Zkouj0Jiwh5sn3Sjpy4W82HTOWEtOA+I0VXG04srmf6XAWcXsdkT8Spl3mNAmvriwPX2VlrDhTbebFOxE9a+DmOJ6H83KBLSi4+si1/7IYeQvETlaK41vDNkAAV7T2LOx+hJ78vyJgmncxzzueMdpbE6CY8g9Jfsu827Xn/rOPrE6pYkiiWL/hfxYXzO+TsNINoPOg0fAduj4foPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Mon, 29 Sep
 2025 08:52:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9160.014; Mon, 29 Sep 2025
 08:52:45 +0000
Date: Mon, 29 Sep 2025 01:52:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 12/36] drm/xe/vf: Add xe_gt_recovery_inprogress helper
Message-ID: <aNpI2x/f2KrzLPvb@lstrano-desk.jf.intel.com>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-13-matthew.brost@intel.com>
 <2ccc4c58-5ca0-48ef-be4a-902073f7b8df@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2ccc4c58-5ca0-48ef-be4a-902073f7b8df@intel.com>
X-ClientProxiedBy: MW4PR03CA0340.namprd03.prod.outlook.com
 (2603:10b6:303:dc::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: fbaa75d8-d8c3-4847-00fc-08ddff358f1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6WYjy9HtAV4FRqvexCxbV85sX8uFJB6vD1KKpD01sJajFSaDYhmPyGY0TvHJ?=
 =?us-ascii?Q?Th4UZ3C9Pe86UMad2BkWdfAnsP0qAkTxZRULh0Rwu/rfkPtFSQ61TR0uL+Qd?=
 =?us-ascii?Q?L0vF/BJ3wnd0j4GZhNrOHeoAjjNG5B32mTLcSASQQEDDZNBuE0q2ZXcVXVwe?=
 =?us-ascii?Q?2SZCgUQYSLHAp1yRxpEW831UpQ3vBiKX5jACMNllCgsolkMDt48FyXmhcy6R?=
 =?us-ascii?Q?Rsh+7SztkFWhV/PViWTKE+6yGfFHGceGBZ1QaW9QjvxG83skGWce6ot0SjSA?=
 =?us-ascii?Q?PX5Kam0hyvmXsy9/eTv7gRtsTBFy1LTL6ANJwSSftORL0UHbwoo0+4WuAm7w?=
 =?us-ascii?Q?FWoGYl5R42ppuM3/oq8H+yNWfCgbHLBkklfiWCr7DKEm4RqqonhMnNSde3++?=
 =?us-ascii?Q?SrA6Rx00DCcfxHIqabE/4mOcp1y3kNFD/s/cZdEPg9bMZtVuASE8opvc/mDd?=
 =?us-ascii?Q?JQt9vZp+uB873aaoPyQtHsjSAVRUrpKh2Qld1MZAg/3xFuQIQl37QlWbePLn?=
 =?us-ascii?Q?BWKl1qMw0YMazeE4rYLFBFCYlnqreWbx2qxLgWl3Ffobb4VQCLEIT2dIqKOn?=
 =?us-ascii?Q?Xl5ZUfCsKasBpmh8Kirl3tpzWfy7GK4/5kPg+G+lpf5FgJ6PpnR+vnQTo9aK?=
 =?us-ascii?Q?CCQ2oyUKRGrFjo5bTxT1TW57Iwr3Qx7eGiK/sbMiA3xHnIzGEgjhZzPkMDbU?=
 =?us-ascii?Q?cWMrrBmGqTpCBF6cL7BxsX5PoF/uVGAZ2pZjl1B6rmJpyWAOIr1PLXG8pOtQ?=
 =?us-ascii?Q?zwnOeJZRSrDle+2IvQDwQxqjNBPGKMTNCMsiKXwJymojwzAD4aK+5JQR8XmM?=
 =?us-ascii?Q?yzbJ6BVSle7r4nSYft/zcolVLaBO/XpFGWovhjsxcvDfcAhW8oT3iaBlCLLp?=
 =?us-ascii?Q?Eil1sXqEzcyvRoAbzH+MAzTkhMMsoznbKboJiNWTCPb3RpexaCTH5VwVRzKw?=
 =?us-ascii?Q?xmlWLlsfYaIrTrsWf+x+GOT49c3/FZDAKyrdianhSv7HK4WNThAKo1i/sONm?=
 =?us-ascii?Q?uvdtHmhY78XZNrYTFNIOehFqiHnNxZdHAEIIauq5SHa6nHM0dmeQ/sX4yoA9?=
 =?us-ascii?Q?JLVG+OLrBrqJD0mOkSFP2/sS8a1vtQnXpGQWFpRQDsk67fg9JB/rT33dTSS4?=
 =?us-ascii?Q?52XFrQS3mQTLU+I7GeiI8Vm0sPAh/BgpAtAJhDY9l2yD6b80pkK+LaPgvalq?=
 =?us-ascii?Q?CPlzJY1DZGnG0eaeDwd0j3UhAFJphczsjkdv+nwvyh8CjPayot3VbyGOhi0x?=
 =?us-ascii?Q?8iYeJYj+QO0f5Goi02hUxf7gySDHRj6rqwYCJGSi8A/8nvjHSUlFQlP99G9U?=
 =?us-ascii?Q?9lyRRUd4vg3bQO2o8hxuqtsZ0PWp18mM6yzehKaHsrJ9mhCY/EXuncDXWz57?=
 =?us-ascii?Q?4494oyA3j+SkApeknxmKAX8Rdla2mkAjORT4yEmR6IhKXUaINQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PvYOndE88d9dhGGFXJevt2JO8nMVyCuqLvYgDPgJun1BPPFkgswTMc9EF1aK?=
 =?us-ascii?Q?D/1tUCsZN4zAWDkXH0ZFTflLB3QtNFtGKXY8qixWStedeGYG697vu0p//u4C?=
 =?us-ascii?Q?c8zroy5XHh7kgNp3AT9u2BeRUxAXcbuIyOFylNNq8JASbYD7nNpmO/fzdyg/?=
 =?us-ascii?Q?veOWcSQQs1B/4Ip34LikGjM+p31/UwMmgas0OvkSgPWgnQEwuZTZ7crcLX71?=
 =?us-ascii?Q?ncUAjz0WBHA6aLV7DXwKngfFmC6cj8KeG6JGRLeEUVwzwG/kaKXtxkejnb/J?=
 =?us-ascii?Q?ZWWYn2IgfmMInKORPxuiIYc2jWKvv50TRYYsAgNIF4lsmMiP0hzIGmcxYyQD?=
 =?us-ascii?Q?E7wXo0IOcICx9ejO2jkec5TrGe9FiwtQVpBk5BtlwrxVeTd21h44hS+hyBvg?=
 =?us-ascii?Q?gMZfov2JdZAojAqgmGQB48glMEbICW3e0XK4GIkOhto/dc1RPLuUgfWeHAF9?=
 =?us-ascii?Q?XKZtiwgqs7YyoCoC9m2Q14p/4WlOGT0ZHUWn7/XIrScCvED7bqEQhUH7MAb7?=
 =?us-ascii?Q?CJ5fLA+slUsqEgmmfkVCTGN7I1+bI0hhCl2ZUb3OoBVqW2F3TmZL9yDufveU?=
 =?us-ascii?Q?cx0bYKuv9H+VWL/rGPf1d5Blwdm1rXgBc36PjSEBKkfnSTB21C5cSgIqhbke?=
 =?us-ascii?Q?YS5keTkueeMActE9KJMRwrOwqg2Cpwy26ykYyHWiePVxo4MUF3yyEGPE8Qrp?=
 =?us-ascii?Q?+pprCPtJ0PDqOP708q6qAQ+1omRXefTMZnw8e8U68hw6a9xKfhWMZk7SFZj/?=
 =?us-ascii?Q?NxvTg0RGjXWee6HYjcVsQKtVTDiruMMgRBWOozoUtbauOa0euDJIFh1N1QbV?=
 =?us-ascii?Q?3WGAV9x6LAqNoFvEMrUol09HtS6YPhFkAVwG4CIAd44mon65K40NNrwI7vvl?=
 =?us-ascii?Q?YCPpuOvmwEO8g/NBHWmBuAd/Kfi3GAlYqQq+5H35t/J4+ZR8gKts+pOmUa9o?=
 =?us-ascii?Q?AWZ70hdUsEKLnwkcGy2KtBA1gR+D1HtsY0BtI9t7HwzI9u8ukt9ebXVDu8hJ?=
 =?us-ascii?Q?XzrPYh8pmP5TmQWiroMUUtpBM/drkRS7KA1YiCaHy4QtzJ7S4QJzsItAWr2D?=
 =?us-ascii?Q?KSNsAnvyjV/j7+Syw5ZA/JZQeFLzF+r3NMJqAu5pHr1r7GoRVsRGSIlLj8y4?=
 =?us-ascii?Q?Oi4v+kkfDBxGSpY1xIsqc31zQWwWqrmVRFMWJwCBAHyFNkdSztrPo96mwnOe?=
 =?us-ascii?Q?O/kyXmCcMBm8KTB271AiR/RSy8u+zGpv6mI3mETYR99KmpOdcgOU4yE2mHSZ?=
 =?us-ascii?Q?o4aq+cgBl+wwNFa4VCs/izyEhVyyXfB1UuwW4ctufydBQbGkLq1/wu1eHxmM?=
 =?us-ascii?Q?53iFgc5bdbxD8Wi4QBJ18PIQTPyEq7efER2KAULGq6nRP9KFlMXA5Ps1hVnB?=
 =?us-ascii?Q?DwnvyGeibYSGqPrp8HXA/6T0gm7SJMIYwMuTo7cjU2XrUc6Ql3ZsEjo7r6Mp?=
 =?us-ascii?Q?/9oNFBumcD+KhjhB2p1G+K97WjLZKYKlbc1z7FZOLbsJhCa+mAZezfp76sse?=
 =?us-ascii?Q?xwIgVRiZMiUFIL6jN4FxiQ/vWMw5JQSAB7SfGyCOG05K0MAEBCeZMharVC0/?=
 =?us-ascii?Q?dD0DDq5MpJxZl50fRjw7hleBJ9TYfiANbY07JgjcTlwhQBbv6acgagzNarul?=
 =?us-ascii?Q?8w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fbaa75d8-d8c3-4847-00fc-08ddff358f1e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 08:52:45.7283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wo7a9+N1/xAKXqYuCvDKuYIMmA2+99untDjtFXL9iMiv/2YVWvnyPakyXnaLMRrn7f7PYkT2Hjdos6ko78iyMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7955
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

On Mon, Sep 29, 2025 at 10:04:51AM +0200, Michal Wajdeczko wrote:
> 
> 
> On 9/29/2025 4:55 AM, Matthew Brost wrote:
> > Add xe_gt_recovery_inprogress helper.
> > 
> > This helper serves as the singular point to determine whether a GT
> > recovery is currently in progress. Expected callers include the GuC CT
> > layer and the GuC submission layer. Atomically visable as soon as vCPU
> > are unhalted until VF recovery completes.
> > 
> > v3:
> >  - Add GT layer xe_gt_recovery_inprogress (Michal)
> >  - Don't blow up in memirq not enabled (CI)
> >  - Add __memirq_received with clear argument (Michal)
> >  - xe_memirq_sw_int_0_irq_pending rename (Michal)
> >  - Use offset in xe_memirq_sw_int_0_irq_pending (Michal)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt.h                | 13 ++++++
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 25 ++++++++++++
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 +
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h | 10 +++++
> >  drivers/gpu/drm/xe/xe_memirq.c            | 48 +++++++++++++++++++++--
> >  drivers/gpu/drm/xe/xe_memirq.h            |  2 +
> >  6 files changed, 96 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> > index 41880979f4de..ee0239b2f48c 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.h
> > +++ b/drivers/gpu/drm/xe/xe_gt.h
> > @@ -12,6 +12,7 @@
> >  
> >  #include "xe_device.h"
> >  #include "xe_device_types.h"
> > +#include "xe_gt_sriov_vf.h"
> >  #include "xe_hw_engine.h"
> >  
> >  #define for_each_hw_engine(hwe__, gt__, id__) \
> > @@ -124,4 +125,16 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
> >  		hwe->instance == gt->usm.reserved_bcs_instance;
> >  }
> >  
> > +/**
> > + * xe_gt_recovery_inprogress() - GT recovery in progress
> > + * @gt: the &xe_gt
> > + *
> > + * Return: True if GT recovery in progress, False otherwise
> > + */
> > +static inline bool xe_gt_recovery_inprogress(struct xe_gt *gt)
> > +{
> > +	return IS_SRIOV_VF(gt_to_xe(gt)) &&
> > +		xe_gt_sriov_vf_recovery_inprogress(gt);
> > +}
> > +
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index 016c867e5e2b..71309219a4b7 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -26,6 +26,7 @@
> >  #include "xe_guc_hxg_helpers.h"
> >  #include "xe_guc_relay.h"
> >  #include "xe_lrc.h"
> > +#include "xe_memirq.h"
> >  #include "xe_mmio.h"
> >  #include "xe_sriov.h"
> >  #include "xe_sriov_vf.h"
> > @@ -828,6 +829,7 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt)
> >  	struct xe_device *xe = gt_to_xe(gt);
> >  
> >  	xe_gt_assert(gt, IS_SRIOV_VF(xe));
> > +	xe_gt_assert(gt, xe_gt_sriov_vf_recovery_inprogress(gt));
> 
> do we really need this?
> with current code this function will be limited to memirq platforms only
> 

Yes, this helps proves what I document in [1] in section 'Waiters during
VF post migration recovery' in true - that is it immediately visable
after vCPU unhalt.

[1] https://patchwork.freedesktop.org/patch/677309/?series=154627&rev=3

> >  
> >  	set_bit(gt->info.id, &xe->sriov.vf.migration.gt_flags);
> >  	/*
> > @@ -1172,3 +1174,26 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
> >  	drm_printf(p, "\thandshake:\t%u.%u\n",
> >  		   pf_version->major, pf_version->minor);
> >  }
> > +
> > +/**
> > + * xe_gt_sriov_vf_recovery_inprogress() - VF post migration recovery in progress
> > + * @gt: the &xe_gt
> > + *
> > + * Return: True if VF post migration recovery in progress, False otherwise
> > + */
> > +bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt)
> > +{
> > +	struct xe_memirq *memirq = &gt_to_tile(gt)->memirq;
> > +
> > +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> > +
> > +	/*
> > +	 * In practice, VF migration will never be supported on platforms
> > +	 * without memirq, avoid CI blowing up on older VF platforms.
> > +	 */
> 
> maybe instead of closing that door simply code this as:
> 
> 	/* early detection until recovery starts */
> 	if (xe_device_uses_memirq(gt_to_xe(gt)) &&
> 	    xe_memirq_sw_int_0_irq_pending(memirq, &gt->uc.guc))
> 		return true;
> 
> 	return READ_ONCE(gt->sriov.vf.migration.recovery_inprogress);
> 

Sure. But...

This likely will the break the above assert, but VF migration will not
work 100% reliabliy if that assert fails.

Matt

> > +	if (!xe_device_uses_memirq(gt_to_xe(gt)))
> > +	       return false;
> > +
> > +	return (xe_memirq_sw_int_0_irq_pending(memirq, &gt->uc.guc) ||
> > +		READ_ONCE(gt->sriov.vf.migration.recovery_inprogress));
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > index 0af1dc769fe0..bb5f8eace19b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> > @@ -25,6 +25,8 @@ void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt);
> >  int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
> >  void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
> >  
> > +bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt);
> > +
> >  u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
> >  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
> >  u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > index d95857bd789b..7b10b8e1e10e 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> > @@ -49,6 +49,14 @@ struct xe_gt_sriov_vf_runtime {
> >  	} *regs;
> >  };
> >  
> > +/**
> > + * xe_gt_sriov_vf_migration - VF migration data.
> > + */
> > +struct xe_gt_sriov_vf_migration {
> > +	/** @recovery_inprogress: VF post migration recovery in progress */
> > +	bool recovery_inprogress;
> > +};
> > +
> >  /**
> >   * struct xe_gt_sriov_vf - GT level VF virtualization data.
> >   */
> > @@ -61,6 +69,8 @@ struct xe_gt_sriov_vf {
> >  	struct xe_gt_sriov_vf_selfconfig self_config;
> >  	/** @runtime: runtime data retrieved from the PF. */
> >  	struct xe_gt_sriov_vf_runtime runtime;
> > +	/** @migration: migration data for the VF. */
> > +	struct xe_gt_sriov_vf_migration migration;
> >  };
> >  
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> > index 49c45ec3e83c..b681c67dcace 100644
> > --- a/drivers/gpu/drm/xe/xe_memirq.c
> > +++ b/drivers/gpu/drm/xe/xe_memirq.c
> > @@ -398,8 +398,9 @@ void xe_memirq_postinstall(struct xe_memirq *memirq)
> >  		memirq_set_enable(memirq, true);
> >  }
> >  
> > -static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
> > -			    u16 offset, const char *name)
> > +static bool __memirq_received(struct xe_memirq *memirq,
> > +			      struct iosys_map *vector, u16 offset,
> > +			      const char *name, bool clear)
> >  {
> >  	u8 value;
> >  
> > @@ -409,12 +410,26 @@ static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
> >  			memirq_err_ratelimited(memirq,
> >  					       "Unexpected memirq value %#x from %s at %u\n",
> >  					       value, name, offset);
> > -		iosys_map_wr(vector, offset, u8, 0x00);
> > +		if (clear)
> > +			iosys_map_wr(vector, offset, u8, 0x00);
> >  	}
> >  
> >  	return value;
> >  }
> >  
> > +static bool memirq_received_noclear(struct xe_memirq *memirq,
> > +				    struct iosys_map *vector,
> > +				    u16 offset, const char *name)
> > +{
> > +	return __memirq_received(memirq, vector, offset, name, false);
> > +}
> > +
> > +static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
> > +			    u16 offset, const char *name)
> > +{
> > +	return __memirq_received(memirq, vector, offset, name, true);
> > +}
> > +
> >  static void memirq_dispatch_engine(struct xe_memirq *memirq, struct iosys_map *status,
> >  				   struct xe_hw_engine *hwe)
> >  {
> > @@ -434,8 +449,16 @@ static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *stat
> >  	if (memirq_received(memirq, status, ilog2(GUC_INTR_GUC2HOST), name))
> >  		xe_guc_irq_handler(guc, GUC_INTR_GUC2HOST);
> >  
> > -	if (memirq_received(memirq, status, ilog2(GUC_INTR_SW_INT_0), name))
> > +	/*
> > +	 * We must wait to perform the clear operation until after
> > +	 * xe_gt_sriov_vf_start_migration_recovery() runs, to avoid race
> > +	 * conditions where xe_gt_sriov_vf_recovery_inprogress() returns false.
> > +	 */
> > +	if (memirq_received_noclear(memirq, status, ilog2(GUC_INTR_SW_INT_0),
> > +				    name)) {
> >  		xe_guc_irq_handler(guc, GUC_INTR_SW_INT_0);
> > +		iosys_map_wr(status, ilog2(GUC_INTR_SW_INT_0), u8, 0x00);
> > +	}
> >  }
> >  
> >  /**
> > @@ -460,6 +483,23 @@ void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
> >  	}
> >  }
> >  
> > +/**
> > + * xe_memirq_sw_int_0_irq_pending() - SW_INT_0 IRQ is pending
> > + * @memirq: the &xe_memirq
> > + * @guc: the &xe_guc to check for IRQ
> > + *
> > + * Return: True if SW_INT_0 IRQ is pending on @guc, False otherwise
> > + */
> > +bool xe_memirq_sw_int_0_irq_pending(struct xe_memirq *memirq,struct xe_guc *guc)
> > +{
> > +	struct xe_gt *gt = guc_to_gt(guc);
> > +	u32 offset = xe_gt_is_media_type(gt) ? ilog2(INTR_MGUC) : ilog2(INTR_GUC);
> > +	struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&memirq->status, offset * SZ_16);
> > +
> > +	return memirq_received_noclear(memirq, &map, ilog2(GUC_INTR_SW_INT_0),
> > +				       guc_name(guc));
> > +}
> > +
> >  /**
> >   * xe_memirq_handler - The `Memory Based Interrupts`_ Handler.
> >   * @memirq: the &xe_memirq
> > diff --git a/drivers/gpu/drm/xe/xe_memirq.h b/drivers/gpu/drm/xe/xe_memirq.h
> > index 06130650e9d6..f87e1274b730 100644
> > --- a/drivers/gpu/drm/xe/xe_memirq.h
> > +++ b/drivers/gpu/drm/xe/xe_memirq.h
> > @@ -25,4 +25,6 @@ void xe_memirq_handler(struct xe_memirq *memirq);
> >  
> >  int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc);
> >  
> > +bool xe_memirq_sw_int_0_irq_pending(struct xe_memirq *memirq,struct xe_guc *guc);
> > +
> >  #endif
> 
