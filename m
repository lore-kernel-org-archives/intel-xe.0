Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0B9CCA476
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 01:40:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8797F10E73B;
	Wed,  8 Oct 2025 01:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j3LjQFID";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0797B10E73A
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 01:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759887642; x=1791423642;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=f5nWOOSRPjWQl+59cknAkAX41SDdlPf7iiOB6szAhyw=;
 b=j3LjQFIDTHrIWE3AZHHAiKPa+y4m0h+W7m90LDeI0W0eE+KXCrQyy1X7
 M1GHcyJtXR0Rc7GUqURdBvE5fNG6aoHV4x3ZfyidZI6TiQf2TqTGLjq/9
 9QzxR48uIpwLYS57HRN39k8CHczHBlgGXMxcuWDwtWUw/B+IMEEi2/Az3
 BJ3OmEjSbSSTpZ3PxKhtHAYKHUWdQioR4z+C5GSIUAVFnS3mEY6czs0R/
 52ziv0AXV/fdmTEm9iv6e8iv3wYXLJ+kjVTkDecTGXAVa0XlKm/jgnCQo
 GWROwSvTuo7wOuuUX1xbR2tuYWaHGjjWZfVm+hGMD79uveJw/a3poMVwp A==;
X-CSE-ConnectionGUID: 8yrwjbByRuuWPWoAjItshw==
X-CSE-MsgGUID: sLDKQ+bKR3iUBh4l7zvr6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62024196"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62024196"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 18:40:42 -0700
X-CSE-ConnectionGUID: bcsKmh5GTkudUtBHSIKj/g==
X-CSE-MsgGUID: yKm16hTGSs2PHPOKHZZVXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,322,1751266800"; d="scan'208";a="185605130"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 18:40:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 18:40:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 18:40:40 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.61) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 18:40:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YYOy9SX21hZ8ymBvdzatbyzoDaw3dirZZv/VqccY3fuiLLhpB7MtHZjpMAhxkb5jkAbZluI/rS0oJeghwpn7XHNdU2/b2qQRPq2uDBuORfdGFzU+32UV+CxDP65H3A9jSuMXT4/BBB7jO4sLFzUyl4Gd+spzgKhtz+PrkmTZjvL8ZkMWoXDOVIcAUMGj0CYO7kAus9kQgDQGVE4RESg7FZwh11kJZvpYUtplCJQyVSCJteNNjjXYow4k8/m23baOyIh1ZgmKBEUz6VYotzN+EQungav8L+dhxuzF/q+XXAa5SOew1FZ7xeW70vOqw9F6uGfYz0yRefRfWCJS0wVCVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dhcmjf42Im7EMDOq/p7FZTZQEuN7cZHoqA7zQJHzi5k=;
 b=xbUK4X4HcxsFPtOEsXl4BfQvmGS1o6MODWlCTbPK5r13IIXbdjS61/xgTd8GYFqI7WnlmHb2gkcn6Y0hHHnOcXAtynjkF5+KTh/WEnNpHKFvTcnbjFvQHh1i8+hg2LmqEduHlDAtHbv9x6R9QaAKI/kFDGRRx9QruLbIBWEM/PugY6VEZu4pFIEJmElu4PGah5ga2SNnRMrjtdQ/YK8Oj5SW1NMdrvAioqV5LCzeEcSqIp38yW1tjTeDEuEhPWPxiMG2cfGbgVC73f1b+3MeS+LYS7HNntACjaHh1Rofo7qmv5w2XAV5hS7VIVQWuqUJeh7vAWWzuhO2IojOfmIPUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 01:40:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 01:40:35 +0000
Date: Tue, 7 Oct 2025 18:40:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v4 3/3] drm/xe/vf: Clear CCS read/write buffers in atomic
 way
Message-ID: <aOXBD0w5mCPKv9pY@lstrano-desk.jf.intel.com>
References: <20251006152443.12269-5-satyanarayana.k.v.p@intel.com>
 <20251006152443.12269-8-satyanarayana.k.v.p@intel.com>
 <aOQiu9ImX79DLiLQ@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aOQiu9ImX79DLiLQ@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW3PR06CA0012.namprd06.prod.outlook.com
 (2603:10b6:303:2a::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7608:EE_
X-MS-Office365-Filtering-Correlation-Id: b1263e1d-3ff7-49e0-b651-08de060bacbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?COcq0m7h0Kcsj3OL2QdcpX0NkBkBtbwpSqSIgTVT6NNLC98iyqiOQLZsA68f?=
 =?us-ascii?Q?HsgXh0VqFj/Z4SdJoNAMLfZKVdhzpu0JW3HHgY4YBE3yXCIb66R3BZFUvO+9?=
 =?us-ascii?Q?A3eAHOq59I0IGXBMpXib1XXEWWmMRKHlEttJgBEg7R/shEVJnbLiO/fLC9Ua?=
 =?us-ascii?Q?SlcQ5jo+mdbam1UL/h7HTws8ciUm2Ap0O2xo9GjyviYxn3PDOzHSMvlq8RtY?=
 =?us-ascii?Q?B6PSSUNSWG1OjvnsJNDuRmRIjHSOk6H811DkuKO7xj/9hTTTsPcjz9TfMPj1?=
 =?us-ascii?Q?E1qXDoCIZtODHFG4Yh1HE4OMpP9VuiWFavWdJr3YJOwRusO2MjR1e0+nmJnN?=
 =?us-ascii?Q?JmmBbrMA1pBPgS8EAYBhdn4JlTCXW2ZmawH+iixeSuXONKTlWBfXh6iTAE+M?=
 =?us-ascii?Q?SJW0HY4RBHQ6SisijkmCXSDDXdABO1ZMyLCs++W1qaoqzHTp2bEO1hVU2Uds?=
 =?us-ascii?Q?mM+69swTTBamfVtDNH9NezukzRTAViYlmPq/YYTmmhlkVA/c+l+11U5wmD3/?=
 =?us-ascii?Q?zQfOTDkHPW7+EVR3R9AiNalHlMrAbaL59miYUAUpkFKBJLynjS4upw4IHuv0?=
 =?us-ascii?Q?B632N9M5m119zplGpJyGjF/hd/2roN2dpVMb6jpWlqTeEoOFonXyL16lr+yZ?=
 =?us-ascii?Q?ns70/NHxPkDE39Awfl/EKFwHmKGXz50POd+XYgBGdxehVhXVK0E2B2wkTdMN?=
 =?us-ascii?Q?ogzp92dplh28v/6oi1/OD715aK35xYUj9udZ9DxkjfHWSwEldUSEibiuZYB4?=
 =?us-ascii?Q?YkhHss8YyDWfCmVgengr/++T3asptEC4xvV/m8X7/Bd7oyQHJUfB+PHpgWSX?=
 =?us-ascii?Q?jdJT94PoUz7nawJIoxWdoLaz1VYAB76EAHpDh8P2XL8rdYJQxmY8rmxphlIO?=
 =?us-ascii?Q?W5XFs7w5BV56eiCLaqn41l+tGfbcc8mJDbh8ul5KqNceE7oM35ATIdrilHNF?=
 =?us-ascii?Q?AOsMZ05QyhDAQk8uNV2o5dhPl7S5skSL/oWyJJeu4p3NoAlXF7euQVBJvoY4?=
 =?us-ascii?Q?sAFwTBygoCiPo6Y9NefGCr97BJJDgnWPyVY+vrDsjz1xkPGp4ott+CnEoTAr?=
 =?us-ascii?Q?wCKYEd1k5Q+qyHzKygMpjXLC6EoZkgXkSNSAC3P//l3d6jocGR93jnGVFGHU?=
 =?us-ascii?Q?uBHo7WMNfVZukGtZJk9aPp87/KEmkwLGBjbNEWMkCoKaQPh8j4zDuZA7UnBI?=
 =?us-ascii?Q?C8ZYxHzDf+Sq6hDOo9EWNhK7d9Bj049QXFeiCKKx55mYFrDfow892p7QEzw/?=
 =?us-ascii?Q?m2dzDuWZwFQ1odB7TBiAC6NeHp7ASGvXrT0oX/QiAt1h3F0Kv+TIFv1gM0ic?=
 =?us-ascii?Q?oCViYkSKK7TtU7tIIy1/xj9SNsOvNVQwsPkg2PrdeutLyuh31AJ864e2wpNp?=
 =?us-ascii?Q?biqgqXiZ82umIJOfYsUvCgn6c0Vgta1v/Z/f0LgUueZm4lLlWSxV4X1t9Kwm?=
 =?us-ascii?Q?0iUiSyHDlwQeOBUy/m6Pb2W03gc8Y+LR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vBWUmNoeP/XMXF0AlhQ7NSglDTf5rG7peWMHoHjzajH07tyWg281GKd4ll+c?=
 =?us-ascii?Q?RfPhC2khJK/AONpYHiwXPR2j0z8oC2I41moUNvieuoCRcF/KDF9GMxQazo33?=
 =?us-ascii?Q?Loq4KbGYfK27QOukpRuzmbHqC6gidHgiveCTJ5F6+whPhcSM+MwVmf+ecp0R?=
 =?us-ascii?Q?kI67r2bvuNizjHOBqVp1HzJ5IBxiLi7WBQlfC6tJR6QIncM8M6Xn/+20jjxo?=
 =?us-ascii?Q?wczEhYq1Fg3z7RkdD/aOfdzsNHe9LYZ8+/jTCGBblcL8IfPvLY5TrHeSoe81?=
 =?us-ascii?Q?HubwlZ2WpQRCMpT58B1hZztcuqXCNf1dwPXO3BdL+h+TnpbvRmj3XJ+N9S8s?=
 =?us-ascii?Q?eCAs8LWqnIZVT+xagIC35+jXNkkbnDR6hHJRVmndk7oSgKkGii9vYvCucNxJ?=
 =?us-ascii?Q?1jtDKQxPeK+BwhCmB+pGovC6OiUtpuVgaJVBV4TWZYxSHuENWKSxJufTIxy2?=
 =?us-ascii?Q?aAq6dQg6MErFk/LtRb03NGwz6tdbViyltVyWoB3Bg/8lQ9AwfPDwYIEiJKok?=
 =?us-ascii?Q?VR6KzW3gKfRnA+T7zYXDNjqM6Jt+wy4AZHWHTbGEs83bSbInPrGrN8G+2ffD?=
 =?us-ascii?Q?O7ViuTZrgLuZxiiGDdDhPioIV20Qqc6hvGocUFJMU+KvsK1YMRmdSCnA1ROH?=
 =?us-ascii?Q?WDSUM8+uCbzYVIQ9IrT34E5dK9uNbejMUiKffDV17LvONPwelycazWw2O+7E?=
 =?us-ascii?Q?RPdZyfx/7JJBIjRGmDRhvfmFPR6PBjBT9H/u+pzoHaDSRGLuRhGHeQ2ryAh4?=
 =?us-ascii?Q?GTM5ndxJgHliu8KHkQISfGRquuIvZlpbsbm+ohqr1LQ36IcxnQ/l3s3xpTyE?=
 =?us-ascii?Q?QYKRin570CELg6JEaPKx7zLIufGF/Afnmjcx9msUSzqwYb+53VqdLYicU2EZ?=
 =?us-ascii?Q?RpKgyj1lGT+7Q8qvhd3575rWeFohIkyvhHieJ/R1H+umyKgIqnWnwQPQHuPi?=
 =?us-ascii?Q?XhPzfz0BTiJY6u9DF91C0czw46o1QkYpaCrONPEmcOEI4r41mWzYhtFL4UFz?=
 =?us-ascii?Q?oAzRbZF5tH6gzjbIr98UT6D3fcTO0lMMiAuwDCPRxjiWvtJIfxk4TvWTxheC?=
 =?us-ascii?Q?ZgIfXlK8Upxm+QT3NHdWYgNUDSaOxlssZ4BNVHsbea15xeZEUdyzZk9BC4h0?=
 =?us-ascii?Q?hy7igpiQZCO6x3JTVlSHs2dZsBF4uznCJjSpL1+QiCvWhJaHyDsWVxHJQZHp?=
 =?us-ascii?Q?RWPcIS0apXNiO+H2iYVilh3sxzMdOOSeOnEUjvxM4Pj1cbVYN6MEgX/xqkKC?=
 =?us-ascii?Q?6Efpq7TJeOIdNXpmZEmRhfn5ir5zjwVz+DWlvM0w5DztYa8yadpn6QaO1Jex?=
 =?us-ascii?Q?7tVDwjSh7DwE0A8IEQKlTMRMiurYEq1lAZ3sNUuy7+NlSlcIPhWOMwUO6Tkb?=
 =?us-ascii?Q?qXk1jOyn08JfR4LP/bt86f4gkTeJYTgYa8v9qZz6fH9mxkTn0q0jfI626rru?=
 =?us-ascii?Q?72wktEf6GL5rYwvw0jS3NVXNDsXGb29Ye/1lfMdM2Ii4x7wCG7aA0qf7eWWo?=
 =?us-ascii?Q?K71lLCy3MhKq5G8IzdZVIGlGfEuWpz4O2Nu+3Cgd4RbM90RkTKM1FIFshzNu?=
 =?us-ascii?Q?+jwvwhIm+QWL2bzI3LQ7XqudC7DK3jTlHBhD3499pYcRY+kFeJfrhWxeJfeY?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1263e1d-3ff7-49e0-b651-08de060bacbd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 01:40:35.1575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lUQi6udaBPa2MEj1WORPRSLsQL05K3p/Ywaexre/M/UnxabrfIAZF4Wucz7Twoa6kbwHmT3Lx34Px5yyHmnd3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7608
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

On Mon, Oct 06, 2025 at 01:12:43PM -0700, Matthew Brost wrote:
> On Mon, Oct 06, 2025 at 08:54:47PM +0530, Satyanarayana K V P wrote:
> > Clear the contents of the CCS read/write batch buffer, ensuring no page
> > faults / GPU hang occur if migration happens midway.
> > 
> 
> It is going to take me minute to fully validate the algorithm given the
> complexity but some quick comments.
> 
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > 
> > ---
> > V3 -> V4:
> > - New commit added.
> > 
> > V2 -> V3:
> > - None
> > 
> > V1 -> V2:
> > - None
> > ---
> >  drivers/gpu/drm/xe/xe_migrate.c      | 130 +++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_migrate.h      |   3 +
> >  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c |   5 +-
> >  3 files changed, 137 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index 4c575be45a76..71c446e74d84 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -651,6 +651,42 @@ static void emit_pte(struct xe_migrate *m,
> >  	}
> >  }
> >  
> > +static void emit_pte_clear(struct xe_gt *gt, struct xe_bb *bb, int start_offset,
> > +			   int end_offset)
> > +{
> > +	u32 dw_nop[SZ_4] = {MI_NOOP};
> 
> SZ_2 or just 2.
> 
> > +	int i = start_offset;
> > +	int len = end_offset;
> > +	u32 *cs = bb->cs;
> > +
> > +	/* Reverses the operations performed by emit_pte() */
> > +	while (i < len) {
> > +		u32 dwords, qwords;
> > +
> > +		xe_assert(gt_to_xe(gt), (REG_FIELD_GET(REG_GENMASK(31, 23), cs[i]) == 0x20));

Ah, I see you have asserts everywhere which is self validating. Good
idea. If these asserts are not popping then I don't really have any more
comments. Looks good.

Matt

> > +
> > +		qwords = REG_FIELD_GET(MI_SDI_LEN_DW, cs[i]);
> > +		/*
> > +		 * If Store QW is enabled, then the value of the dwlengh
> > +		 * includes the header, address and multiple QW pairs of data
> > +		 * which means the values will be limited to odd values starting
> > +		 * at a value of 3(3 representing the size of a 5 DW command
> > +		 * including header, 2 dw address and 2 dw data).
> > +		 */
> > +		dwords = qwords - 1;
> > +		/*
> > +		 * Do not clear header first. Clear PTEs first and then clear the
> > +		 * header to avoid page faults.
> > +		 */
> > +		memset(&cs[i + 3], MI_NOOP, (dwords) * sizeof(u32));
> > +
> 
> I think you a need wmb() here to ensure the above is GPU visable before
> clearing the header instruction.
> 
> > +		WRITE_ONCE(*(u64 *)&cs[i], READ_ONCE(*(u64 *)dw_nop));
> > +
> > +		cs[i + 2] = MI_NOOP;
> > +		i += (dwords + 3);
> > +	}
> > +}
> > +
> >  static void memcpy_vmovdqu(void *dst, const void *src, u32 size)
> >  {
> >  	kernel_fpu_begin();
> > @@ -732,6 +768,17 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> >  	bb->len = cs - bb->cs;
> >  }
> >  
> > +static u32 emit_copy_ccs_clear(struct xe_gt *gt, struct xe_bb *bb, u32 offset)
> > +{
> > +	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
> > +	u32 *cs = bb->cs + offset - EMIT_COPY_CCS_DW;
> > +
> > +	xe_assert(gt_to_xe(gt), (REG_FIELD_GET(REG_GENMASK(31, 22), *cs) == 0x148));
> > +	emit_atomic(gt, cs, dw, sizeof(dw));
> 
> I think you need a wmb() here to the clearing of copy is GPU visable
> before you start clearing out the PTEs.
> 
> > +
> > +	return offset - EMIT_COPY_CCS_DW;
> > +}
> > +
> >  #define EMIT_COPY_DW 10
> >  static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
> >  		      u64 src_ofs, u64 dst_ofs, unsigned int size,
> > @@ -1062,6 +1109,19 @@ static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *dw, int i, u32 fl
> >  	return i + j;
> >  }
> >  
> > +static u32 emit_flush_invalidate_clear(struct xe_gt *gt, struct xe_bb *bb,
> > +				       u32 offset)
> > +{
> > +	u32 dw[SZ_4] = {MI_NOOP};
> 
> As discussed in patch 1 use EMIT_FLUSH_INVALIDATE_DW.
> 
> Matt
> 
> > +	u32 *cs = bb->cs + offset - SZ_4;
> > +
> > +	xe_assert(gt_to_xe(gt), (REG_FIELD_GET(REG_GENMASK(31, 23), *cs) == 0x26));
> > +
> > +	emit_atomic(gt, cs, dw, sizeof(dw));
> > +
> > +	return offset - SZ_4;
> > +}
> > +
> >  /**
> >   * xe_migrate_ccs_rw_copy() - Copy content of TTM resources.
> >   * @tile: Tile whose migration context to be used.
> > @@ -1186,6 +1246,76 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> >  	return err;
> >  }
> >  
> > +static u32 ccs_rw_pte_size(struct xe_gt *gt, struct xe_bb *bb, u32 offset)
> > +{
> > +	int len = bb->len;
> > +	u32 *cs = bb->cs;
> > +	u32 i = offset;
> > +
> > +	while (i < len) {
> > +		u32 dwords, qwords;
> > +
> > +		xe_assert(gt_to_xe(gt), (REG_FIELD_GET(REG_GENMASK(31, 23), cs[i]) == 0x20));
> > +
> > +		qwords = REG_FIELD_GET(MI_SDI_LEN_DW, cs[i]);
> > +		/*
> > +		 * If Store QW is enabled, then the value of the dwlengh
> > +		 * includes the header, address and multiple QW pairs of data
> > +		 * which means the values will be limited to odd values starting
> > +		 * at a value of 3(3 representing the size of a 5 DW command
> > +		 * including header, 2 dw address and 2 dw data).
> > +		 */
> > +		dwords = qwords - 1;
> > +		i += dwords + 3;
> > +
> > +		/*
> > +		 * Break if the next dword is for emit_flush_invalidate_clear()
> > +		 * or emit_copy_ccs_clear()
> > +		 */
> > +		if ((REG_FIELD_GET(REG_GENMASK(31, 23), cs[i]) == 0x26) ||
> > +		    (REG_FIELD_GET(REG_GENMASK(31, 22), cs[i]) == 0x148))
> > +			break;
> > +	}
> > +	return i;
> > +}
> > +
> > +/**
> > + * xe_migrate_ccs_rw_copy_clear() - Clear the CCS read/write batch buffer
> > + * content.
> > + * @tile: Tile whose migration context to be used.
> > + * @src_bo: The buffer object @src is currently bound to.
> > + * @read_write : Creates BB commands for CCS read/write.
> > + *
> > + * The CCS copy command has three stages: PTE setup, TLB invalidation, and CCS
> > + * copy. Each stage includes a header followed by instructions. When clearing,
> > + * remove the instructions first, then the header. For the TLB invalidation and
> > + * CCS copy stages, ensure the writes are atomic.
> > + *
> > + * This reverses the operations performed by xe_migrate_ccs_rw_copy().
> > + *
> > + * Returns: None.
> > + */
> > +void xe_migrate_ccs_rw_copy_clear(struct xe_tile *tile, struct xe_bo *src_bo,
> > +				  enum xe_sriov_vf_ccs_rw_ctxs read_write)
> > +{
> > +	struct xe_bb *bb = src_bo->bb_ccs[read_write];
> > +	u32 bb_offset = 0, bb_offset_chunk = 0;
> > +	struct xe_gt *gt = tile->primary_gt;
> > +
> > +	while (bb_offset_chunk >= 0 && bb_offset_chunk < bb->len) {
> > +		bb_offset = ccs_rw_pte_size(gt, bb, bb_offset_chunk);
> > +		/*
> > +		 * After PTE entries, we have one TLB invalidation, CCS copy
> > +		 * command and another TLB invalidation command.
> > +		 */
> > +		bb_offset_chunk = bb_offset + SZ_4 + EMIT_COPY_CCS_DW + SZ_4;
> > +		bb_offset = emit_flush_invalidate_clear(gt, bb, bb_offset_chunk);
> > +		bb_offset = emit_copy_ccs_clear(gt, bb, bb_offset);
> > +		bb_offset = emit_flush_invalidate_clear(gt, bb, bb_offset);
> > +		emit_pte_clear(gt, bb, bb_offset_chunk, bb_offset);
> > +	}
> > +}
> > +
> >  /**
> >   * xe_get_migrate_exec_queue() - Get the execution queue from migrate context.
> >   * @migrate: Migrate context.
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> > index 0d8944b1cee6..bd2c0eb3ad94 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > @@ -129,6 +129,9 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> >  			   struct xe_bo *src_bo,
> >  			   enum xe_sriov_vf_ccs_rw_ctxs read_write);
> >  
> > +void xe_migrate_ccs_rw_copy_clear(struct xe_tile *tile, struct xe_bo *src_bo,
> > +				  enum xe_sriov_vf_ccs_rw_ctxs read_write);
> > +
> >  struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate);
> >  struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate);
> >  struct dma_fence *xe_migrate_raw_vram_copy(struct xe_bo *vram_bo, u64 vram_offset,
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > index 790249801364..2d3728cb24ca 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > @@ -387,6 +387,7 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
> >  {
> >  	struct xe_device *xe = xe_bo_device(bo);
> >  	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> > +	struct xe_tile *tile;
> >  	struct xe_bb *bb;
> >  
> >  	xe_assert(xe, IS_VF_CCS_READY(xe));
> > @@ -394,12 +395,14 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
> >  	if (!xe_bo_has_valid_ccs_bb(bo))
> >  		return 0;
> >  
> > +	tile = xe_device_get_root_tile(xe);
> > +
> >  	for_each_ccs_rw_ctx(ctx_id) {
> >  		bb = bo->bb_ccs[ctx_id];
> >  		if (!bb)
> >  			continue;
> >  
> > -		memset(bb->cs, MI_NOOP, bb->len * sizeof(u32));
> > +		xe_migrate_ccs_rw_copy_clear(tile, bo, ctx_id);
> >  		xe_bb_free(bb, NULL);
> >  		bo->bb_ccs[ctx_id] = NULL;
> >  	}
> > -- 
> > 2.51.0
> > 
