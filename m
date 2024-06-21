Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3215BC27C4F
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jun 2024 20:31:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6C7F10E02D;
	Fri, 21 Jun 2024 20:31:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PoaoSPUB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1669410E02D
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jun 2024 20:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719001872; x=1750537872;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mj1xKMhPAv0Zl90EfJv2Q5g34lz2vgZwRg8T59sozKA=;
 b=PoaoSPUBoalIkGdjadBD7yqjEn2HGMv21gw6/r+yhERb5d4qzU4Ew8Zu
 eOHD9U1YXHBiRmw3PBfrmBnWHQVi+XRU/AHl+gznM8o2t2YJit4NNRHas
 DZ1oek3nKULIfGWlmPT+aDCRZ14KVSsVoBSrymy6XABqwvWIPFfqDts9B
 h9162/PLFLNdkZnnvP/8SiAerAXv4leA6R3N7AYrOtultEkcqSAZxCFPK
 0C2XwV8aloGgSNK7GZG0INxOBoZzCJqxN4HYtJW4ERr4swhVSkpw3fUQs
 pmlng4Jm32astH55GRyvYDxG00oxO9O02zcDD5vsW83uMjnjh0woCWwWF Q==;
X-CSE-ConnectionGUID: 7WbyL7tSQ/O8WVzhPv9i2A==
X-CSE-MsgGUID: boDCMweJR8G6Va02sO1KmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="33597070"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="33597070"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 13:31:11 -0700
X-CSE-ConnectionGUID: sVMxh2BgQRCGSWkZIiDaAw==
X-CSE-MsgGUID: N1ZgoEYnSCWlhYClAaIvgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="47866740"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jun 2024 13:31:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 21 Jun 2024 13:31:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 21 Jun 2024 13:31:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 21 Jun 2024 13:31:10 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 21 Jun 2024 13:31:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJUYtlQBZbSgjsDNNG/yT87VlM/dMixdP55Ntjq4cx4kN0d41XehlT6MwlY/FzEjVtclETVWUwg8Ush6TR8oO88CfaVxz8K9rlTEFYbYUTrbshejfK3bynyDztKUk47xksgyX6mF0arV6OhHeg5JxwZt16XjZiMP0y+y7Noq50zgEkR6ddtjAYP2NvTZ33KrKGY9Q2BFA3OM3RfXeB48Z+tL1X5EaSe3wjIJy5rNJRfCdemvdjLeQ5f+xnbCwVi9JgJ6J03E1at5dG50LNjSim3YopDsmtYsj7K+dQD9q0rqfH24BMoSHfDsCecQR70QovdyCWfLxFKg+wLSToaQsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PY9xrYF76KTEwK/Y+qZ33tOaRJtLjubz4MNPQRA5jxw=;
 b=L4E8LsR4MtiDHUkiIRtdahxADZWJCYJJgG0bAf1BNyiq6xrIE+KE2mAxWUTk9e9ms/zE4uOxcGE3xHmi8eTAfORhLAPKwScH/nQ0PoFwvE0iCXQaX/VMMdysO6MF4gYY/ZgTxGchG2dOUm241GjiGaupk7uudjpyYsA0348b926vXlT6GPaMX401FYwOTotB8Y/M3bISsh39ysnYBoGztLvRKFosG2VdgQqs3krdyCJUowYq3E6aSPGvh69koZ6TEvs9O5CtJtX9+0b/UR/gAbD8FlY3ES902GY3gIHBulyPic3LNScEBfQGYF32uBDoRM/ZmSQdT19/bOhdgXGkBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7643.namprd11.prod.outlook.com (2603:10b6:510:27c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.25; Fri, 21 Jun
 2024 20:31:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7677.033; Fri, 21 Jun 2024
 20:31:08 +0000
Date: Fri, 21 Jun 2024 20:30:31 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH] drm/xe/huc: Use GT oriented error messages in xe_huc.c
Message-ID: <ZnXi52HtwABSB0WU@DUT025-TGLU.fm.intel.com>
References: <20240621172522.1037-1-michal.wajdeczko@intel.com>
 <ZnW8qfILB4O6g4Ei@DUT025-TGLU.fm.intel.com>
 <ab2566db-216f-405b-a719-b49e24aaf423@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ab2566db-216f-405b-a719-b49e24aaf423@intel.com>
X-ClientProxiedBy: BY5PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7643:EE_
X-MS-Office365-Filtering-Correlation-Id: 906336ea-039c-43ea-9a0b-08dc923114bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?42WYdHfi8De95+cuJohl4BjHjN+YAslPspIHkYsLKPJbuWjRme/FXtTZz4Zb?=
 =?us-ascii?Q?Gh6P/0M58f9oK6AY7neeKtIaAtNTrc6AuJYL1Ftk2oD+Sr38dpysp3CY5Fzd?=
 =?us-ascii?Q?0pVrt5A+9L8xclZ1HQipyApHVen/OTDO9q2drHiE1bcv7xpkWmSUfqyEsWE6?=
 =?us-ascii?Q?0qTq/R3K21oi3ffvn2kC95O4+Hh8oTw9awb84iPdGqOFOd1Mq+ftI5AK+Eqt?=
 =?us-ascii?Q?Ij4QD30e8PsJCxKvd47A3fGCeov5BRH3Kw2lC0eIuTBzmKIDse4A+aAS7j9k?=
 =?us-ascii?Q?CBTvvJ6YctmgfLHZfzyDmCcxLcOf5+WXUPMjIrpn+VHChidL0ewV5i3KgeNS?=
 =?us-ascii?Q?ECaAmYWSEbnfZzcGxVsiPiCMsjfriIPm4sfjwQzxUZb4nH8A4IyLbFgVNilC?=
 =?us-ascii?Q?FiAMJvIWevdDmuEptni9LDRCYUxHaXnocszdm1+/F4TC80VPbrW3u7NMqQAx?=
 =?us-ascii?Q?9OvKT94hujxQS2vFGL2sV1BlTc9srxAC7sewYcIDsXCAthVCDdMmz7tsfDkx?=
 =?us-ascii?Q?HjjQj2vYxtUt1tjf/yCpdXeELExZhtjLvEPKgTZ+nhT9MizO5wZXJZR7Hy9T?=
 =?us-ascii?Q?h+7ge33ZcVKSY7N1ReLPU8dXhOYXmSxhjh/ReufIEhsZnH9U09ae1bHsL//n?=
 =?us-ascii?Q?QlF/5UTDpn/SLczFO14uaVSmBKySDTKBMgRRbwnzfPSIRZKS+f8o80btr8Ln?=
 =?us-ascii?Q?exdu0KRDCJy6Xe4D9LyZR3oagxDt377n1BzoiBJgGLiIpJZXGFzG83hDbTaC?=
 =?us-ascii?Q?Ki35LZ3G39MBxwb85xsEoASy6PrGLYpDlRMg3GBAcsjj8dbYUFS4yMSiIUu5?=
 =?us-ascii?Q?KLuvu9risIYzfKOjOrnF9etrzvftZxMhp8MzpF9mczyeuFjb0J4DSCL6urTY?=
 =?us-ascii?Q?OjSge4dHrs7EQCcFtsk++FIajcZQugJZ9Nhbkt3vOuRnGc7a4I140Er8FlO8?=
 =?us-ascii?Q?V77x6QKJ6kNZTsHvr0ogSFfbjoizJC2P2p0kmNG8wYuYenVGGU0iDoogQhuH?=
 =?us-ascii?Q?FmZiiu4xN12s/12+M5Rx0/kUcbtf6F/nZ+Q/BZfrLqmqs1ImVK1aWFqttwPP?=
 =?us-ascii?Q?WGjQkM6zmz7wIDPzrdETeJTXeVUSJ4CXtUYyLcz5Xt0Hq5C40zYltTq/m5YL?=
 =?us-ascii?Q?l575BYfDUCm5Uz4fA7fqgT4pWlJ0M/jwkt5pAj6VccbuqoX8fTqD4RbB5cNx?=
 =?us-ascii?Q?yGnM6mOiq6tpNlJNO15IvMAD1tGROrbCcoIhsQGVE5i9YmTBw25wafB3PPwQ?=
 =?us-ascii?Q?R6jbcww0IDkfUwwBlQ6K?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p6CX/728HJECzFyWRizZ2F+3kswHs8QJMXr97I+p8xrnr2hWXZZBCg3fGjPd?=
 =?us-ascii?Q?KYI2bQtAA+p1wBRNjVFwLaFm+z0ufUxRWsHEvYrf76Uc1Hi5NEltUvLMwCaC?=
 =?us-ascii?Q?uDBTtWnOtW2NICRDUmQeXauhcq54U6lk9kJ7u2YeqFA54twqSC5CwOQXoYUp?=
 =?us-ascii?Q?PlVZdHbuQMsWgOmdNutS/Jeb8cShdl9UPooDOXnKlRfTD2a8nqneVrRg/zap?=
 =?us-ascii?Q?D5W3lpFU/COuwDqDPmqJfWp6V3uSRPx9UpSv4lu83Ja/1Xezed7lL3MTXMc6?=
 =?us-ascii?Q?wpU2h0VYAwynt3UyvPJZCitC3MfkpCJoDuhQ86bC5mPs2uyCfCW34bNHxs3O?=
 =?us-ascii?Q?O1l6Oqtydeu1chMH53P9PmRluA8a+Ut5WWG5i4WPT3edrM8Blzai9ehDanQK?=
 =?us-ascii?Q?IofEJdmE2V34Oq3eJBLkqfneqgDlY7WnS67gz4AxAggvNLjrmrKKQWFjqhdO?=
 =?us-ascii?Q?qCLFAXzJZD30cMMHMaeuy+tPdT9TkTybZiRWWGUdNikxzq4RiBe1fAT11BmP?=
 =?us-ascii?Q?x9hI/xDNkPQWipstt47LBz2Uc1LtIfVl3SbStSCfaUBuO9cZqQHKB6hcUwmR?=
 =?us-ascii?Q?i+b6NWnlmASwl6ewC+DrBEgfCTLt/K8qXOepDXCaRloCyLbngTHjKQOrnitM?=
 =?us-ascii?Q?GHjmrrnnJBmTBjcomk9jJ+D9526dJg2NP3zXt0lOuyMQjtChkN8XUXKC616E?=
 =?us-ascii?Q?Ytf94y5qZn9w0vF6IHakFYxXjX/tNF7Gz2CDFhR+PermMYEGnYtsIzKHkwZZ?=
 =?us-ascii?Q?glAQUI4AaHErUzbZzl75zEcyPYoeGdfDyTjQNhNFEXJwNgWOqsfl92VDu4F2?=
 =?us-ascii?Q?fJTCYhYGgo4I6DTLxGahS1sOI4SEGV+krC3fwFcIPRdCNXbQ9xgN1D5NVEy9?=
 =?us-ascii?Q?Kjz8OpE4mY+I8krxQlCs6X4XOfNzu4sOI16RaoUSiyn+VeZGtQDfoCyANd8o?=
 =?us-ascii?Q?z4b8Ud7P37keUECpMFFgVYfQyYn+shBOGWNeVWvprciSQB852BerSb94Xvms?=
 =?us-ascii?Q?7RwPkZrBbjHWe7sarnKqEq85e+JQVNAqUNQzKY4TUVwyE4taciBGuvTmeR63?=
 =?us-ascii?Q?/dEw3+gOoKgpTe5j1OchTzhdxejiuY+DinZVq2y5mUcKetAQ7I9bs/ExI7O0?=
 =?us-ascii?Q?6Mahxm1wHTCdAHz6f/PVpEU3hobn5mTwkNhKlzz3hvJIZCQNzUgdPdFDzwgu?=
 =?us-ascii?Q?JQBM35mRM2I9w3Lidsof0MWUmD7gYYhnU693nQb1FXf258umZvvYBhFhNPET?=
 =?us-ascii?Q?B4EujSr6irCQyiM0ujsbFxs9qTWRWJRM98vnFyR6fBeQTb83uLSOWK532Z9u?=
 =?us-ascii?Q?6K8Hc3V1H10D6GTPyPLhwZ0s9J0+U+XWgI97qoNW7l7pmPgULACFQ1WaDOmp?=
 =?us-ascii?Q?GYjh3163XnfauPCeKXCtdz6NlAwrqUbcQ13D1y/9kOTyYJE0RTQ3VXSHBccM?=
 =?us-ascii?Q?lG5EcFgZSN4L5i1pQoGJEeh4LHfpUEFo7OGRSnPxXvtfbBcKSc3Ida/0XSEy?=
 =?us-ascii?Q?aSSLXbjQJDcSP8z8pCePscZe0gsBbcCBH0XieG+B7zqtaP5UW2WKYO/d0vXC?=
 =?us-ascii?Q?w4gk7pbK/I4nVcEV/GaL6GQw/AzdCATHugt25/vqGF9WoVPaffDdgX9FIjW4?=
 =?us-ascii?Q?vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 906336ea-039c-43ea-9a0b-08dc923114bb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 20:31:08.0785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t+Ylv2i1xoeMtas9ny5CwTPb6Lxbs/rm+wqwg3OUOokvGL9h8NB8DCCm25UUf275PbgYPMMScvKIHcpfFSeuug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7643
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

On Fri, Jun 21, 2024 at 08:12:48PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 21.06.2024 19:47, Matthew Brost wrote:
> > On Fri, Jun 21, 2024 at 07:25:22PM +0200, Michal Wajdeczko wrote:
> >> If applicable, we prefer GT oriented dmesg messages. Update all
> >> HuC related messages and use more user friendly error codes.
> >>
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_huc.c | 22 +++++++++++-----------
> >>  1 file changed, 11 insertions(+), 11 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
> >> index c88761fe31c9..bec4366e5513 100644
> >> --- a/drivers/gpu/drm/xe/xe_huc.c
> >> +++ b/drivers/gpu/drm/xe/xe_huc.c
> >> @@ -18,6 +18,7 @@
> >>  #include "xe_force_wake.h"
> >>  #include "xe_gsc_submit.h"
> >>  #include "xe_gt.h"
> >> +#include "xe_gt_printk.h"
> >>  #include "xe_guc.h"
> >>  #include "xe_map.h"
> >>  #include "xe_mmio.h"
> >> @@ -107,7 +108,7 @@ int xe_huc_init(struct xe_huc *huc)
> >>  	return 0;
> >>  
> >>  out:
> >> -	drm_err(&xe->drm, "HuC init failed with %d", ret);
> >> +	xe_gt_err(gt, "HuC: initialization failed: %pe\n", ERR_PTR(ret));
> > 
> > Why the ERR_PTR change? I think this make everything less clear. Or does
> > %pe convert this back to an easily readable value?
> 
> yes, instead of raw error value:
> 
> 	"... [drm] *ERROR* HuC init failed with -5"
> 
> it will print error name:
> 
> 	"... [drm] *ERROR* GT0: HuC: initialization failed: -EIO"
> 
> see [1] for more details
> 
> [1] https://elixir.bootlin.com/linux/latest/source/lib/Kconfig.debug#L191

Thanks, this is more clear. Good to know and will use this in code I
write going forward.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> 
> > 
> > Matt
> > 
> >>  	return ret;
> >>  }
> >>  
> >> @@ -195,14 +196,14 @@ static int huc_auth_via_gsccs(struct xe_huc *huc)
> >>  	} while (--retry && err == -EBUSY);
> >>  
> >>  	if (err) {
> >> -		drm_err(&xe->drm, "failed to submit GSC request to auth: %d\n", err);
> >> +		xe_gt_err(gt, "HuC: failed to submit GSC request to auth: %pe\n", ERR_PTR(err));
> >>  		return err;
> >>  	}
> >>  
> >>  	err = xe_gsc_read_out_header(xe, &pkt->vmap, PXP43_HUC_AUTH_INOUT_SIZE,
> >>  				     sizeof(struct pxp43_huc_auth_out), &rd_offset);
> >>  	if (err) {
> >> -		drm_err(&xe->drm, "HuC: invalid GSC reply for auth (err=%d)\n", err);
> >> +		xe_gt_err(gt, "HuC: invalid GSC reply for auth: %pe\n", ERR_PTR(err));
> >>  		return err;
> >>  	}
> >>  
> >> @@ -213,7 +214,7 @@ static int huc_auth_via_gsccs(struct xe_huc *huc)
> >>  	 */
> >>  	out_status = huc_auth_msg_rd(xe, &pkt->vmap, rd_offset, header.status);
> >>  	if (out_status != PXP_STATUS_SUCCESS && out_status != PXP_STATUS_OP_NOT_PERMITTED) {
> >> -		drm_err(&xe->drm, "auth failed with GSC error = 0x%x\n", out_status);
> >> +		xe_gt_err(gt, "HuC: authentication failed with GSC error = %#x\n", out_status);
> >>  		return -EIO;
> >>  	}
> >>  
> >> @@ -242,7 +243,6 @@ bool xe_huc_is_authenticated(struct xe_huc *huc, enum xe_huc_auth_types type)
> >>  
> >>  int xe_huc_auth(struct xe_huc *huc, enum xe_huc_auth_types type)
> >>  {
> >> -	struct xe_device *xe = huc_to_xe(huc);
> >>  	struct xe_gt *gt = huc_to_gt(huc);
> >>  	struct xe_guc *guc = huc_to_guc(huc);
> >>  	int ret;
> >> @@ -272,26 +272,26 @@ int xe_huc_auth(struct xe_huc *huc, enum xe_huc_auth_types type)
> >>  		return -EINVAL;
> >>  	}
> >>  	if (ret) {
> >> -		drm_err(&xe->drm, "Failed to trigger HuC auth via %s: %d\n",
> >> -			huc_auth_modes[type].name, ret);
> >> +		xe_gt_err(gt, "HuC: failed to trigger auth via %s: %pe\n",
> >> +			  huc_auth_modes[type].name, ERR_PTR(ret));
> >>  		goto fail;
> >>  	}
> >>  
> >>  	ret = xe_mmio_wait32(gt, huc_auth_modes[type].reg, huc_auth_modes[type].val,
> >>  			     huc_auth_modes[type].val, 100000, NULL, false);
> >>  	if (ret) {
> >> -		drm_err(&xe->drm, "HuC: Firmware not verified %d\n", ret);
> >> +		xe_gt_err(gt, "HuC: firmware not verified: %pe\n", ERR_PTR(ret));
> >>  		goto fail;
> >>  	}
> >>  
> >>  	xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_RUNNING);
> >> -	drm_dbg(&xe->drm, "HuC authenticated via %s\n", huc_auth_modes[type].name);
> >> +	xe_gt_dbg(gt, "HuC: authenticated via %s\n", huc_auth_modes[type].name);
> >>  
> >>  	return 0;
> >>  
> >>  fail:
> >> -	drm_err(&xe->drm, "HuC: Auth via %s failed: %d\n",
> >> -		huc_auth_modes[type].name, ret);
> >> +	xe_gt_err(gt, "HuC: authentication via %s failed: %pe\n",
> >> +		  huc_auth_modes[type].name, ERR_PTR(ret));
> >>  	xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
> >>  
> >>  	return ret;
> >> -- 
> >> 2.43.0
> >>
