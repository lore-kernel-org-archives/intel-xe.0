Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15940C87FD3
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 05:36:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D1410E4B8;
	Fri,  8 Aug 2025 05:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KMlV6tfk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFEA10E4B8
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 05:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754631383; x=1786167383;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1P8Cjw9FokRwJc6ZEiHqvykm7M83zVz16WX57bRkVnE=;
 b=KMlV6tfk5s4nkSsvM0b29kYJwHBEI8isgYk3WEt62lYJd45MTrIqbErf
 SX7nmPem2Yn47HBaTCwpKCKN2cIfG5laAcm1GChY2aNyqBsKHV6TIc6Nu
 PDbpbOjZ2+HZq3mrJajImsjXMUz6fpN86xroSQrY07s4bbxlCCBIZWezL
 CtEyzvCDhU50MKo6+afyX7BIQQo9ELVxWSQwuRnd/f9qMS/q8uf7GQomX
 5dZ20mxIKIaPEktLyISxSWMN/bnJMJBYQhCVBuSpuJsSAIml1HqXoUBh1
 VpPruWcNbqcwq5VhqduXJrEZZBNtfg9EX958P8HkSOYX3Ur5Qf/E5ey1A A==;
X-CSE-ConnectionGUID: 0JIru61iQ8SxqIupyuszlQ==
X-CSE-MsgGUID: CfnYWAywTPew/f77bsJCiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="74553240"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="74553240"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 22:36:21 -0700
X-CSE-ConnectionGUID: SLJ+FZlFSNuV+ihzwG6jFg==
X-CSE-MsgGUID: qMOl11ImTgG4UzW1Nh9+qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="164902603"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 22:36:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 22:36:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 7 Aug 2025 22:36:19 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.60)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 22:36:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LbncMvfKm1A5JY4EfO2leUJP2zOq1uAV993ELS2lxkUV0P0OIFBMR64DKLpfESZfCwq/CxmRwstw+GW3qLHRNKTLQv1V42jF7u1Uw64eC4lWxoenKB/X2lTWOEgvOVZ/gBz6yzGeBxurOyk/atWWyVaDECPUEACvLxmpfHUglYOEZ2UigskPmvoBwWofRY+0v2dtfDolYKZcc+i1tDw4k0QE6WMszt7IK62UvTk+3nRdzDDER63ivSYZE4zDWvWm6/dPiTGQDDGIkXFWMCA+box7TCkoBNYa1zxfBvMDxi6GlDVprE70jCuTwqKgovtwshJk6PoJ8F4qXG0l7xx6gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=usIBQbZCPTCejAwiJnrDROcnI4nOWpgU9pFUT5tYDmQ=;
 b=rSEkvHPXHz+zd+/umXC/vfkHaoR5S0P2DozcpP9fUNqrtHvBb48BtWT4vMgtTzeuyzCfU5vDLVVxJCvvqGe56LIildgBtBPT3mWqDBnPgLNZCOW7aziOGBE7TL5hoQZ5XLyvvyVxcOh2Uc6qnD9GSxTmuMBWb9RchJ9aVeaR5W4SkLy52//nEzZlNhzzP2tILV10iFuU9G2mF/zFO66VujwWMDi52kiMaQrfwKza1i1uO4UR2QyKotg7qvNsFbCC8U4Gv4UG1IRTbH3b9FfdoOiQ6e6vwSTRtHi2sDkRQTuV63C6EPi/k4SPUD0WJZplCVBcKj+TvW8jH0eNW+PU1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH3PPF4B53DB4B3.namprd11.prod.outlook.com (2603:10b6:518:1::d1d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Fri, 8 Aug
 2025 05:36:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9009.013; Fri, 8 Aug 2025
 05:36:18 +0000
Date: Thu, 7 Aug 2025 22:36:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe: Misc refine for svm
Message-ID: <aJWMzwFLxQYhwB8i@lstrano-desk.jf.intel.com>
References: <20250718212409.86516-2-shuicheng.lin@intel.com>
 <20250721153339.369318-2-shuicheng.lin@intel.com>
 <aH6Gib4X+cHLi/Dj@lstrano-desk.jf.intel.com>
 <DM4PR11MB5456CA65B950D1D096E360AFEA2FA@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DM4PR11MB5456CA65B950D1D096E360AFEA2FA@DM4PR11MB5456.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0152.namprd04.prod.outlook.com
 (2603:10b6:303:85::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH3PPF4B53DB4B3:EE_
X-MS-Office365-Filtering-Correlation-Id: 9098444a-6f85-4b24-59ae-08ddd63d7fa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uORFoTZ2HNTUXn1pQQBTgAVYlRJ427I043lTynpS/MzaWAlqTXZeAoEnDtJf?=
 =?us-ascii?Q?fgIXwxK2TSjjwSbaN4zPFSsjcdkdq2YkJi6FBo4qYKsgAlwERVh30gwI1qnf?=
 =?us-ascii?Q?/A0vEwMOgQ5+nydR44ktjkuSTQd1S1QLaLpqNzWei423ibv71jrTRPzPsDwe?=
 =?us-ascii?Q?jIP/z2QhM/ca/cSzLlrALihxWjbLgfLZ67TCZSmKoGJKZlewy7hXiwzaap+l?=
 =?us-ascii?Q?rL44PeqaEuD+B4uVOIgb4oA0aDv3aSKkBxh8KwjqsHly4zmRSRiBEKlyKVgz?=
 =?us-ascii?Q?WaHEvtDkq+Cn/NFo9oGAjirwfkpXW32zmKluuMJxF7j18Y64UJ1lntuXdvx+?=
 =?us-ascii?Q?qslXgdr+KSZqEXOyaH2YRSIK6oMXt6j4Du2UvF1R1+9+v+mwnfcbDaqBEycY?=
 =?us-ascii?Q?VXlURNONepDZYGWn2SfyzNIX4N9QSU6wpV5orjf+eCTQlkAypW+pkKWe/pie?=
 =?us-ascii?Q?zIkPaq5JvXWSBR1qk1MScuED/99BYfJ3VE9KaxvnyTCrW1s0szILRUWB89Yp?=
 =?us-ascii?Q?ht17aSon7zJE7rFjiKnJcxKpX2m1CNpCZD4SC9fhOlC+KXk/u3Bs3+5ekALI?=
 =?us-ascii?Q?AN/CvpF9mHYISIb1MhoYAIh3NGjnyMlH0rKJbIfmbFcbvt7TOzjLXZea7ovb?=
 =?us-ascii?Q?LkcSDq+AC+LrYmP4T4Jp5u9iakUqNqUUtmNVe0ugM6g3KB7IrAh8H+wvs2+p?=
 =?us-ascii?Q?vvVxUrBMULQosbq/PzvS83bdhFD26FYIhpnUS1/g9ulcTGytv5PF/N7M7ZvK?=
 =?us-ascii?Q?Mll2tqZaW+OTpJWYG/kpd13E5svY0geE7O1vGrdcq5Pee/Q1x6f3b9FVB3yM?=
 =?us-ascii?Q?3yxt8wcvhG/ANWS3i3/FoAHwlsSg2rt8P94W5mcD3JB3/IawwJkjaBDTYWFr?=
 =?us-ascii?Q?E5RTpGr/v861gIwwbI6DeUsLNCmqeA39Ce+g6f+wPEE8H1l3xQz7LceR57+M?=
 =?us-ascii?Q?sZTNBEGrfAZrXdK4UWlL98uTaINYZxYBm1+thNz0RkMT/JzEQlZGNVe5GA5K?=
 =?us-ascii?Q?CY59q5ra8XpSfehlISbqisZOnK2hQ/iwtaVV9lifNbGwfCfN7UE8afrN/az+?=
 =?us-ascii?Q?LcyiAA2jzZuaXYglXcTUgt5CDh/yyk9vto9oouqPp/OTwv8mc8lpEvrv2Q7U?=
 =?us-ascii?Q?Apx0MVj+jUQr+HBC4a9RuORi/QvYY9FZQXJHGo5N7BvnZrsN5VM2PpxLQI7v?=
 =?us-ascii?Q?VhRKf2JXx7eAaf3W+z+Fd98t+lpTPU1eLMyrlOKEI8Ldi8Fu8Csa4A5qt4e4?=
 =?us-ascii?Q?wyJ3JvG5kwbsllF2CDtHTOYLvxbQSJ+s+rqGJcppC5JXprxDGwzl2iLSDIiL?=
 =?us-ascii?Q?vwKDOiJ1UmUf4tlK6+UH3V32zSgahLdIonVGVY7dtp/bQP2XZoWEzTHi6hxx?=
 =?us-ascii?Q?oHmUTzk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iXkFeNjxTGvgBEwTSZU5cY8cFG/vzYwezbJyn14wZB45iIRetbpmsmYIh+sH?=
 =?us-ascii?Q?cNy7OFv6jAguQ3+cfQoT1G7DOQ6UR7jKHCeK3A7M1THDI90hy/iDlIx685p3?=
 =?us-ascii?Q?0uJLsC3y6+csU0efP7TIzxFJigwetO/ETMPfpj7APXB/4PMCCZczLff0fS/o?=
 =?us-ascii?Q?bYcTAuCm9erSkPy1FNFE4EaxVE6Fj4cDrm8ejnKtA1LS5v5WZAadz8RX9u/Y?=
 =?us-ascii?Q?P+lmeFiyMMgq1ujSp0kmhUG3iFHC1cTgvANXCAZsY62+zHEjWB2V5AZwhHqC?=
 =?us-ascii?Q?2uDa0c37ERTi+wuZpHMFs4+qOwlgWNOHIFjPXk2Q+wBIA5U32F5sL6Xcry3r?=
 =?us-ascii?Q?H8kYYNjvFVoh83Am5wu7xzduySqMTFIJJE57zvOESNOr+D9uq2ftj2Ny/kNJ?=
 =?us-ascii?Q?2z47RLU314vWwK/9ZozywTXHjzAY6rQjjTnstXRdLbuJkz9KoLKWqR62Lrrz?=
 =?us-ascii?Q?+c38j9pn6GZtP5NC8wve3y5ueF5RoVMixzuScfxz43wmTTTHpnai1RYdFmVh?=
 =?us-ascii?Q?DqzdlEt21I1X1kNAJ5aQNvFkh0K82/b9g2KykwndNT+o5uc2Lo8wMtYj+hzt?=
 =?us-ascii?Q?UF32WKYUSPgF8aLh76oXegFmOnVSER9NDAkrz3C/rJ4favMaMu1v2SuqoiU0?=
 =?us-ascii?Q?NzHD4rxwiQyIfYsKI2k1QDIPfevlTdwwnBb0crk8S2oNjGuydVdwLedROAu5?=
 =?us-ascii?Q?Walt/FcJ7b+O+0vx9OYA6cHP832pJZJwaF46Frs4KgpRosSqzKkJDBBtHPNk?=
 =?us-ascii?Q?5pbjOtQ/9pfBjnzdKP70ZOkUWzWdVhuUX0gbt1DyniSsVBm/V1n9oZ3FUWoM?=
 =?us-ascii?Q?D/+PvFKAWYP0U2QbBhLe/5CKXgn+/OSr4+v89T0NbwheJDfqKmsmyJRHWg4P?=
 =?us-ascii?Q?p+KIkWvm7fbCWnuMl9AsMmhy8Jd7+vaODJGUojoYd55ZgXHD8lunq0sWcNgS?=
 =?us-ascii?Q?lqdGffiUkW7M5smnPezd/8mW1DboYxDTAaqNyUnVoMUW2Znm8BXLDJFBxYuP?=
 =?us-ascii?Q?RXirwryjuv3FUM180Hu8RSqZKlozUVtdUe8JTlZe9HKyWKwjwgc6cZh54GZr?=
 =?us-ascii?Q?iwrYiaPL1ANyDADCP00GInTy3fF2OEBg0u62gHUv+Wga6zbJlGtD9vxTYvy8?=
 =?us-ascii?Q?mImyMmuPUGjXU6m0frKU1pNo0PwQAP94/m0TUyn/4vLIiqOZSFd5umMFwVsr?=
 =?us-ascii?Q?p+wUWcR0E85LRbP0OqIlQ4YONSL4XXXUPkmHTYRL+rizI/+CVHMnTaLwaRYW?=
 =?us-ascii?Q?B+eha4J1TW8PJ/KKHTocIEnyqV3IfdFCTRtrj1fMBJT3otmyWGf8LWpUCp3n?=
 =?us-ascii?Q?lPTy1ovlCG3PhO8LEBFbp2WoW2kFLsyApeM+QNaCfYSW6tngkwTn+nenKrc5?=
 =?us-ascii?Q?5+ZvfGi6Z0WeQ1eISOg653SsOVuVx1bIbhcTJYnLAqcEpm01BsU/Zw7q0RoB?=
 =?us-ascii?Q?xDDV7QL9lgckMP9vDLbTox4r+Zv5Wpx4pe360kwk6Y7FFx1l1RxzhyE4o7MY?=
 =?us-ascii?Q?2KiTsQ9R2ETSAKBHt+kx8fjOrLcUXTj0qNE6XKI1/ThOmjxNW57Aq5yo5aSm?=
 =?us-ascii?Q?/edSvyrLUGXHsAhiU95VUBcOTMuPPfvR1qQfG1FLYcHweNrONarG5JuEV9PX?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9098444a-6f85-4b24-59ae-08ddd63d7fa0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 05:36:18.0251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J9O/WIBAiyhjYhpX5kAMSfdmRRDMy/XBI44Avk8ZnCT5xZXm9KgOp/k/2uZDWsRvZjdEE0TrBCdebNe1JcF2hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF4B53DB4B3
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

On Thu, Aug 07, 2025 at 10:53:43PM -0600, Lin, Shuicheng wrote:
> Hi maintainers,
> Could you please help me review and merge the patch.
> Thanks in advance.
> 

Bad timing, I'm going to suggest we hold off to make Himal's life a bit
easier, I think we are a couple of days away from merging [1] and after
tht merge we rebase this one on top.

Matt

[1] https://patchwork.freedesktop.org/series/149550/

> Best Regards
> Shuicheng
> 
> On Mon, July 21, 2025 11:27 AM, Matthew Brost wrote:
> > On Mon, Jul 21, 2025 at 03:33:40PM +0000, Shuicheng Lin wrote:
> > > Below changes should have no function effect.
> > > 1. Correct typo of "operation"in macro range_debug().
> > > 2. Combine 2 spin_lock() call in xe_svm_garbage_collector() into 1.
> > > 3. Remove preferred_region_is_vram check in
> > xe_svm_range_needs_migrate_to_vram()
> > >    as it is already checked in the begin of this function.
> > > 4. Combine the devmem_possible check in xe_svm_handle_pagefault().
> > > 5. Combine 2 xe_vm_unlock() call in xe_svm_handle_pagefault() into 1.
> > >
> > > v2: revert !ctx.devmem_only change (Matt)
> > >
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > 
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_svm.c | 30 ++++++++++++------------------
> > >  1 file changed, 12 insertions(+), 18 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > > index 10c8a1bcb86e..a35bca95ab95 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > @@ -50,11 +50,11 @@ static struct xe_vm *range_to_vm(struct
> > drm_gpusvm_range *r)
> > >  	return gpusvm_to_vm(r->gpusvm);
> > >  }
> > >
> > > -#define range_debug(r__, operaton__)
> > 	\
> > > +#define range_debug(r__, operation__)
> > 	\
> > >  	vm_dbg(&range_to_vm(&(r__)->base)->xe->drm,
> > 	\
> > >  	       "%s: asid=%u, gpusvm=%p, vram=%d,%d, seqno=%lu, " \
> > >  	       "start=0x%014lx, end=0x%014lx, size=%lu",		\
> > > -	       (operaton__), range_to_vm(&(r__)->base)->usm.asid,	\
> > > +	       (operation__), range_to_vm(&(r__)->base)->usm.asid,	\
> > >  	       (r__)->base.gpusvm,					\
> > >  	       xe_svm_range_in_vram((r__)) ? 1 : 0,			\
> > >  	       xe_svm_range_has_vram_binding((r__)) ? 1 : 0,		\
> > > @@ -263,8 +263,8 @@ static int xe_svm_garbage_collector(struct xe_vm
> > *vm)
> > >  	if (xe_vm_is_closed_or_banned(vm))
> > >  		return -ENOENT;
> > >
> > > -	spin_lock(&vm->svm.garbage_collector.lock);
> > >  	for (;;) {
> > > +		spin_lock(&vm->svm.garbage_collector.lock);
> > >  		range = list_first_entry_or_null(&vm-
> > >svm.garbage_collector.range_list,
> > >  						 typeof(*range),
> > >  						 garbage_collector_link);
> > > @@ -282,8 +282,6 @@ static int xe_svm_garbage_collector(struct xe_vm
> > *vm)
> > >  			xe_vm_kill(vm, true);
> > >  			return err;
> > >  		}
> > > -
> > > -		spin_lock(&vm->svm.garbage_collector.lock);
> > >  	}
> > >  	spin_unlock(&vm->svm.garbage_collector.lock);
> > >
> > > @@ -763,12 +761,12 @@ bool
> > xe_svm_range_needs_migrate_to_vram(struct
> > > xe_svm_range *range, struct xe_vm
> > >
> > >  	xe_assert(vm->xe, IS_DGFX(vm->xe));
> > >
> > > -	if (preferred_region_is_vram && xe_svm_range_in_vram(range)) {
> > > +	if (xe_svm_range_in_vram(range)) {
> > >  		drm_info(&vm->xe->drm, "Range is already in VRAM\n");
> > >  		return false;
> > >  	}
> > >
> > > -	if (preferred_region_is_vram && range_size < SZ_64K
> > && !supports_4K_migration(vm->xe)) {
> > > +	if (range_size < SZ_64K && !supports_4K_migration(vm->xe)) {
> > >  		drm_dbg(&vm->xe->drm, "Platform doesn't support SZ_4K
> > range migration\n");
> > >  		return false;
> > >  	}
> > > @@ -793,16 +791,14 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > struct xe_vma *vma,
> > >  			    struct xe_gt *gt, u64 fault_addr,
> > >  			    bool atomic)
> > >  {
> > > +	int devmem_possible = IS_DGFX(vm->xe) &&
> > > +		IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
> > >  	struct drm_gpusvm_ctx ctx = {
> > >  		.read_only = xe_vma_read_only(vma),
> > > -		.devmem_possible = IS_DGFX(vm->xe) &&
> > > -			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
> > > -		.check_pages_threshold = IS_DGFX(vm->xe) &&
> > > -			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ? SZ_64K :
> > 0,
> > > -		.devmem_only = atomic && IS_DGFX(vm->xe) &&
> > > -			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
> > > -		.timeslice_ms = atomic && IS_DGFX(vm->xe) &&
> > > -			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
> > > +		.devmem_possible = devmem_possible,
> > > +		.check_pages_threshold = devmem_possible ? SZ_64K : 0,
> > > +		.devmem_only = atomic && devmem_possible,
> > > +		.timeslice_ms = atomic && devmem_possible ?
> > >  			vm->xe->atomic_svm_timeslice_ms : 0,
> > >  	};
> > >  	struct xe_svm_range *range;
> > > @@ -882,8 +878,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > > struct xe_vma *vma,
> > >  retry_bind:
> > >  	xe_vm_lock(vm, false);
> > >  	fence = xe_vm_range_rebind(vm, vma, range, BIT(tile->id));
> > > +	xe_vm_unlock(vm);
> > >  	if (IS_ERR(fence)) {
> > > -		xe_vm_unlock(vm);
> > >  		err = PTR_ERR(fence);
> > >  		if (err == -EAGAIN) {
> > >  			ctx.timeslice_ms <<= 1;	/* Double timeslice if we have
> > to retry */
> > > @@ -894,13 +890,11 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > struct xe_vma *vma,
> > >  			goto retry_bind;
> > >  		goto err_out;
> > >  	}
> > > -	xe_vm_unlock(vm);
> > >
> > >  	dma_fence_wait(fence, false);
> > >  	dma_fence_put(fence);
> > >
> > >  err_out:
> > > -
> > >  	return err;
> > >  }
> > >
> > > --
> > > 2.49.0
> > >
