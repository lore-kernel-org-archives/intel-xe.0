Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F5EC83F17
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 21:21:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C78AB10E159;
	Thu, 10 Jul 2025 21:21:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FQgMXnuu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF2BA10E159
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 21:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752182475; x=1783718475;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VNLwONXsh9xISXqxeBMPbhtCtHBWDQrN3AFXQTk8qM4=;
 b=FQgMXnuuutZ8ElqsdHpLFIAeP3yH++XbP2zZWF/n4O/lFQaTValbipJ7
 K+NKIqzHDlUBqpi+WO9uCe2h7hmiENSQ8WFSVNNfROAh3CLdGbkFK0IRs
 /DaaLnhY/kO9K6rfU/4+ap1nmuSjawAhekvWwkQPqZUBoXndwDS9EcbZi
 wN6iJQrSeWfRMZmzcky1KsxHcCJ1xDBeGVdnE54y5LjtBE10u6A53CZ/O
 5yuUOHKH+u2u7MlUFG3dtkmWisrFz0dOK+fIiENhM0+PdqYdsiPBStKCL
 f3OiMPwAwJUIG0tt3iRt8T18e+w3rTUWtWVP53Jyua/xA6T5F1fz31QGD A==;
X-CSE-ConnectionGUID: 3p94bV5RTX+HY///FVirgg==
X-CSE-MsgGUID: l7GXqHuaTXGxOsmKja+dBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="42110874"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="42110874"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 14:21:15 -0700
X-CSE-ConnectionGUID: rRBZWU7LSyixGvLzR7z5Sw==
X-CSE-MsgGUID: P/BwjYdzTCqZ41x6CSrlDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="156296313"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 14:21:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 14:21:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 14:21:14 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.78) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 14:21:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m5pxIHoDSB2BSRUudIdtH2BlRhJMWMR/6YRCfGbtcvfU/BpC2P0ZInyhUqiayWmwFiQnfjS5vlTgTBHjyDUTkBJ9DATgrO8v4Gli9i8GqIyGEExHjNMVvEg3CSl9SJLCx1V1UsOzoIIQ4+bt+cYMCv8bd66Nfjf0GslBksXTl8I6sCqil+xoc32aUARtrf9RF2eHGHd/gUOgWuH4EBntm3Ty1VKJr0Q9kbn6mq6JbeWkSj6wFtuOPGOwhqgOOTss93jkkd8ZJYfoAn1zX6MfJdYzgBETB9EjTK0BURFNJUgIrIhvIaFDrNtWHKKqPbm4cWVBhElRkUb/fgz19giDdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ewi7Zx/TxSOfsR7vJt2hnFU0QtJ2DV+gFaLdqDKWJNQ=;
 b=sS2L5Wx4vcJJLaBF7fh/4VCH9hgTtAJQKEvZT78vyalk19ABVnTLhm+wJbaz2IYqxgAzhSy0UtXhxDczPkqSVzZ/xiM5DgTzGvNR0yr8JFdhI0XxYImFIzwh87xNQicnUTZ8NZDuoXDoYbEaMIfMoIDgl2+p53pquZqgl5ysSdpsWnqabtnLth8dZmZCVJ/ku3mgxI1ho0LGIgTJVeTIWShpooSRSYLPyBN/jjCBB9SAQ94OpRItPxYoRofDakcCYCnyi8dBhLFLoZkrZgU2KxevTkZTNM+SxtzYWmEUmGLzCTZnLxchPvTFzCnFNUJrw3d4qdwm/zRY5n033l0MAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7415.namprd11.prod.outlook.com (2603:10b6:806:318::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Thu, 10 Jul
 2025 21:20:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 21:20:57 +0000
Date: Thu, 10 Jul 2025 14:22:41 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Remove references to CONFIG_DRM_XE_DEVMEM_MIRROR
Message-ID: <aHAvIeeQJB5mNSwp@lstrano-desk.jf.intel.com>
References: <20250710205413.1105595-1-matthew.brost@intel.com>
 <CH0PR11MB5444A2EE452F111723C4635CE548A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH0PR11MB5444A2EE452F111723C4635CE548A@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR03CA0145.namprd03.prod.outlook.com
 (2603:10b6:303:8c::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7415:EE_
X-MS-Office365-Filtering-Correlation-Id: a5db4808-e3fa-4c25-41d1-08ddbff7a95f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KPZxdNi3nSyS+QeWcmeB0G1cB/uIyoAZMghA4yD44iAsXTjtMK9Kd1hFR6VL?=
 =?us-ascii?Q?7whK3h68qnzsxtUCM9+XLVZdr+1Ur/yGnK7mEpZxIV29cc1EY5caBgz3DWnn?=
 =?us-ascii?Q?fsg/Kk85d5PNco0khkr/BZSV0BgKjzZEECNNBq+8wFgYCJLqylpbcClljopO?=
 =?us-ascii?Q?KWtOuVnfdDoXdfCAoQvsPqQHDiMDqi/wIWhlpeNKQH9x2pqdTUOSfQ2S0SNt?=
 =?us-ascii?Q?ygRbonX/1oiMqdWaFVkPcyrbHpmVKcpjrJt/3s1oQlv4bjtbD1yLgMyYnBhN?=
 =?us-ascii?Q?nC//TffbfLTbrOmo7t2TQjlMiGbeWK+cUksW49Wwj8q/D6waHT1iqnInIe/m?=
 =?us-ascii?Q?NvPG+rXOzYnOMKBvYKzGpiDcioe77W1koSh6CW2+Ks2W0OA7ihAE69VjsKSl?=
 =?us-ascii?Q?0nalL6FyG35efRkyRVPszdH1WvNF2rNEnBqrviBhMvS73jcrqg4y1W6F/hGO?=
 =?us-ascii?Q?CcWiKDyMq/lV+b1r4pEqIGHwcrccZ0UNDgBB//nBheI07IZP8V2LFA1/qjUu?=
 =?us-ascii?Q?R8xSQAasOlBsGn4g4uNio89UQy7aZDvFEj7szs/CZPG5JzV5XG3iTKSxzT7F?=
 =?us-ascii?Q?UQJwHzIput3bWexMxas1XNQSBgD4XuEsuQmDF8xnpQ/fpbVkXyZw4JVFi7th?=
 =?us-ascii?Q?8sscSXRwOp6z5EBdoumLe1Q6ujY6FBQH70ml/sZ2lTOcBwoZqt8i7hWFGhQK?=
 =?us-ascii?Q?/LJRPXLr6t7l2ahF3qgcjHhVLyPsLi38/eQMNZh5z6ip0MuQhfMT91rN0Vid?=
 =?us-ascii?Q?GDN8Ykz7aZIJI6OL9mxXAg/hBtzkWF2bvXpZWdRtk9M8xOmtnRiXH/2BC+28?=
 =?us-ascii?Q?v0QauDfzAi/7vPBzy31GvwvSjibBCLvveBFuUdFsXQ7fP7h/UF/RfbNE0h4R?=
 =?us-ascii?Q?+3CPlGZFUlWA+GZOfnoGQVl3LArVxvImfsnZcmiZyT50syyHwO50uP7tSsAL?=
 =?us-ascii?Q?o087SOUNfCN9HOjZpLMxF9ZW/hljSHPzqgMD3bPVJVPK18inD/qMNecZxvPu?=
 =?us-ascii?Q?3o6HBMlmmqCYfTyEVgpT4XV+gXXG4gEioNYvLnNDzTS7u5tvHhUGZRA113ZB?=
 =?us-ascii?Q?kgklB2siyvZkvjCnzeWFEGOpC7Ty2FYf1ByyDaZ9u8oaF6oCwGpOn9lT8TrB?=
 =?us-ascii?Q?bF3JrT4+KCwhsvazn3mOo5X06HvTCM9igkv+skWD9x8S8g4u154yzWZ/iCRi?=
 =?us-ascii?Q?HcgXhld8zYqMJ/v7SyPijBBLp3drJbLVaZUW1qLTrSf4qZ2lC8Nl5Ncp2CYv?=
 =?us-ascii?Q?EGJ5KLBq2gcpBIE+NAdKq/RteR51Sbd/DSBKGTizjF7JH+ILP92RM0xcUSkR?=
 =?us-ascii?Q?3T+CXMfpNskQMcMdV5Lujkp1M+YDYAIWEv4bDGix6Nx01otqFlhBPvpu5ijc?=
 =?us-ascii?Q?RLVU1dI6QiauZRTpz+oy91/9pI57eDBH/EDgLOMfpEsfRAb8WQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YePV8ScjyBMK0t849jtCBQReWLpc9VHim2q7hAv64suXYyHHZC7MFSJNPGea?=
 =?us-ascii?Q?d4LBBg4fn/HATGV6ZvcPBJuJsIx9I6XmpNPFClXLRtXi4bG7RzyPXJ/Hqhnb?=
 =?us-ascii?Q?lAC4jnb4NtTAJv6tP7ZhFQ5XKiu/KG2ryPvkCgw0sVdwY5R/zSSqDDIbFeMy?=
 =?us-ascii?Q?gCeGhuSCrB4TtHRBcy57qdxeE3V92p/ziFTvwjbTU+aaoQGGZx/6vzgKw1gP?=
 =?us-ascii?Q?UoWsfeuHKb0KNyNjPF43WQe+6j0uQo/THwIWOiA5lmbggywcEdhK7oI0H1pe?=
 =?us-ascii?Q?njitPmgnwbg5MWyFAZY1E514MxdajDtxF/251kzfwA0rVtl96sq0v2upEv4p?=
 =?us-ascii?Q?26himtLfbZW/Jtz3KIPYfHeeYWIJAYBWKQh2oVsiTUcxjtYDmqcF1wo9AF2b?=
 =?us-ascii?Q?a5OGuxMlQYLT8ZRennO0cgoRzKS7JUnqWw8e7Z5wAxktXQVFhBH5boUQRxTp?=
 =?us-ascii?Q?zw0l713vW/q+VLNHfKBkXRqS+JHUeGRoAKNdqigxWx2INGQDUQNpxPcCAqqF?=
 =?us-ascii?Q?N6k3HEVOpTH9+7YV5QTjM6Uvi2SoSqxPWrFxBWuxzhENlpfZy1UWgOUjCj4C?=
 =?us-ascii?Q?VPGasw415WfCtC4b5d5U9rDWmkeSOmwuGdWBhJqherNAkm64//6YbX/0eJet?=
 =?us-ascii?Q?93vDEspMCe4okkR0pdtI/MHy4TRKrnNvVDbHW9vkNKlsM/zwSllBQ+OYMwxi?=
 =?us-ascii?Q?Lq4lD+9rZ0i4bz9xHTOl1t08AbxzjIHfB/IoQVXLtaE3m7UzKf2BrvfQigRm?=
 =?us-ascii?Q?CISGWay0mA2teHv4cj1TwxNh8cagENFplc8p21dmpJ/+WcY7rStoFuZtx8Gh?=
 =?us-ascii?Q?pihmW4uhzPDkWYoiZoHPiwf8FlPjfyfnDtCPFl8bW8X32TZ91Tr1pv/g28Dp?=
 =?us-ascii?Q?jvuS9Ya8N4iPHZQmoqM+Hup2ZH/PHMsBShHshzBbAJn7EAk+nRpxf9vFY1nH?=
 =?us-ascii?Q?EVC8lCt2bm92NhGbm3NrK2D9vGW7E1IU1u3NLvBOBPtC2hh1fkz2qwjzTLbm?=
 =?us-ascii?Q?XPfFihilMe5WjuYMHnJgvyHBdjm2QwnSPUmPVMy7dIRiuCJtYZiQqI5WRJF3?=
 =?us-ascii?Q?wYqnyAfq8iZwElKh6OBe+zH8McJkPlvOwIpMMggikPvDGjMdGfZ+/dtnSSHc?=
 =?us-ascii?Q?p+T56GyfF/Gt1nQKm4vCNTEAcM2JeX5lcFvST3SAFi+4zyRuupUCBke/QJVJ?=
 =?us-ascii?Q?NJhhvpsFnOLz8uWQSzAkriRTORLH16dwgGbbMKx9kfEEgNEpnrg3PsdNrIio?=
 =?us-ascii?Q?bhWePv7eRsNmF3vRZ3TQjoUTcIiq3DXBGd0RHXMC2Ta2Mq8NxNLu5LiQzOW3?=
 =?us-ascii?Q?jqmVm0kFCnrTDY8MtAF4aMM9nQW8GrkH7UytV4NJM/9hvIGieD5dKVBrln9t?=
 =?us-ascii?Q?sNTpHq8mLXQAAOKVnHkG6wj82uB9yT70K4+dxY6BJU7Ku5GYcTS3LYLjEIv2?=
 =?us-ascii?Q?zpm9sc3+DyD7zS4kbTG2RH3gedYhbeiAqj6txWSh93cen2W0YXxWgcMZK8D/?=
 =?us-ascii?Q?qN88iYN96PfnbSQXCMtmfJmClGZ4FIqoJAJUL/2zNYHXXZOkWdxpFmVoftby?=
 =?us-ascii?Q?H+NyQdR/skeMrfzDtN1AdP0VlBC4rAYzhGpPaj+WgQ7h92FIqVFHqw/wbmIN?=
 =?us-ascii?Q?gQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5db4808-e3fa-4c25-41d1-08ddbff7a95f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 21:20:57.7784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aNjhHNxDIbq6pCTpH7wdsvMJpAs+B4OUf/699bdKPjrjXWzXPU+zUeEy1Wic5726AmUeM/DAtIHjm8m8ywYsyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7415
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

On Thu, Jul 10, 2025 at 03:19:03PM -0600, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew Brost
> Sent: Thursday, July 10, 2025 1:54 PM
> To: intel-xe@lists.freedesktop.org
> Subject: [PATCH] drm/xe: Remove references to CONFIG_DRM_XE_DEVMEM_MIRROR
> > 
> > The prefetch code was referencing CONFIG_DRM_XE_DEVMEM_MIRROR, which has
> > been replaced by CONFIG_DRM_XE_PAGEMAP. As a result, prefetches were
> > limited to SRAM. Update the code to use CONFIG_DRM_XE_PAGEMAP instead of
> > the deprecated option.
> > 
> > Fixes: f86ad0ed620c ("drm/gpusvm, drm/pagemap: Move migration functionality to drm_pagemap")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> LGTM, though I will admit it's a bit weird this didn't cause the kernel to fail to compile
> before, as CONFIG_DRM_XE_DEVMEM_MIRROR doesn't seem to have an official
> declaration in the code to be referenced.
> 

IS_ENABLED just checks if CONFIG_DRM_XE_DEVMEM_MIRROR was defined, which it is not.

Matt

> Maybe that's because it's "just" a config declaration?
> 
> Just thinking aloud.
> 
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt
> 
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index e875ea4658a9..2035604121e6 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2380,7 +2380,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
> >  
> >  			ctx.read_only = xe_vma_read_only(vma);
> >  			ctx.devmem_possible = IS_DGFX(vm->xe) &&
> > -					      IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR);
> > +					      IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
> >  
> >  			for_each_tile(tile, vm->xe, id)
> >  				tile_mask |= 0x1 << id;
> > @@ -2887,7 +2887,7 @@ static int check_ufence(struct xe_vma *vma)
> >  
> >  static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
> >  {
> > -	bool devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR);
> > +	bool devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
> >  	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> >  	int err = 0;
> >  
> > -- 
> > 2.34.1
> > 
> > 
