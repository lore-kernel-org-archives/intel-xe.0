Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D24C10F1A
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 10:22:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 408F010E399;
	Thu,  9 May 2024 10:22:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VLLSMGQ+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A875110E5B1
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 10:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715250126; x=1746786126;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PUaeKNQ3hac+w95dA4YaVbNQ+QYL0YEd2hA3HOjJUOM=;
 b=VLLSMGQ+eR857O+F5FV86h/TBp5tuOnzCaZ4Rw82RY2Qejy+7RcFZ77U
 dHVLB4w5XaQyT8qOkUgV8RLJYotuBx1ghVszoU7BzfI1XDlQeFQJmGBuP
 DkUHTveNnabGSIUbm/MxvuCE9GLEJ3e5hTrj9hLx8Nq0Ei6vWTx/WU3vz
 fbWvXHyBIFj//bn4R+BRtIDiOz+/AbQ2pMLkMd2SyEScJzBNYaMRM69kh
 VGorOtOk3rymHjXWQszksZNi8en5qO2taGl6v5HsbHvIOFC8qpyxAjdQ/
 CqyZML51slWYy4DCH586uOg4dEjWbLp/vxiBZVuzeerLrZLFeXewoymbZ A==;
X-CSE-ConnectionGUID: DsRAXWnjThC6ujlUpeTZWQ==
X-CSE-MsgGUID: 68lzDEvnTCSbxRLttpHKhg==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="10998783"
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; d="scan'208";a="10998783"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 03:22:06 -0700
X-CSE-ConnectionGUID: ++1vLZ71QJC6d81MnuOyfA==
X-CSE-MsgGUID: FAvlfuY1RNicrnYCO46HeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; d="scan'208";a="29767364"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 May 2024 03:22:06 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 03:22:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 03:22:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 03:22:05 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 03:22:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nlqq1nScf2INOyKZSbRVPEP359bGIvhoxMSZM3w/nqCJLsu2FWx4tsgbVSBYGjf4olLCzZpFWtDzoI4HWtyOBlhsbmXyUqugzfPwQidGiHMi23kbdlTnJ9SbdSAF14+3OCWXln20/F6ZbJgGpe8eD1R1JjN8+HH9oZx3clyG+zRdPfItyiF6IpLfoLYyTjbK9RYjWKVlbQN7ZII3vJhz7jkedxtMmolKwaLnUEJxHyb5kVArsUcF370ALJximmWJbi0I9dkcwm4hxkjsVmiGLIfrJ4JC70P8tMhrgGHIUTwZf1raTyh1q2qPF0wkBqdwdodDMsih85qrW5kGo71Q1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXdtxibxpfkjUNvOPS1Nrr2cLSjISNeg5/M8XXAXjV8=;
 b=EzIaC/6zSEuC9+Wa6kFCAilyTiuxDwuS7/v4NrEQFa7D2cUZXSIDvbr75IdkogNXchCbmBJDpXECXBYAXyUmSvrFelvK9lOH8BfMg/s8JO1QSFINbmiMp3R2LNkHLLXxJKj2xcIrm2YTt1m5LSZz+BMFeTW0qNkYmGfbQ4LUHBAzzMba1HRD0kdU2acrO1cQJbngDsPYzYlPDx71h+nJKu3jSJTUZHzSdBZEc1CdzXaDTMUauN2Ch3WuBtMXUDsr3JFaoZJrnel8PJmfDKzOC1LPnJ4yGW9I3aa+egudo2AgTTzyq+ZAsYj9r3wkrrWs200IYH/ijwK7VNsKJ4inOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH7PR11MB5888.namprd11.prod.outlook.com (2603:10b6:510:137::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Thu, 9 May
 2024 10:22:02 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::602d:c299:6d13:7e5a]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::602d:c299:6d13:7e5a%3]) with mapi id 15.20.7544.045; Thu, 9 May 2024
 10:21:58 +0000
Date: Thu, 9 May 2024 12:21:50 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>,
 <matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <matthew.auld@intel.com>, <anshuman.gupta@intel.com>
Subject: Re: [PATCH 0/7] Unlock deeper package-C states (PC-10) and D3Cold
Message-ID: <ZjyjvmL8BgiAsEi1@fdugast-desk>
References: <20240503191309.7022-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240503191309.7022-1-rodrigo.vivi@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: MI1P293CA0016.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:3::8)
 To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH7PR11MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: 003dc9fa-3234-42c9-edfe-08dc7011dbd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?spsEFWPy36OnKJC7/bTvv8wRJ4tXIJq3pDtJoQKgpjua8JjiUVo1rbVsxIov?=
 =?us-ascii?Q?xXv4cbphVPL0LkrRjn3jJkTj8DitHUBwwiYdpgpqpNSFf9QpkRZEW6DATn7a?=
 =?us-ascii?Q?2ANdzzvTccwBp1XR5Uxs4atlGh680YFQL7vW+PFrxr+p51gG9Bqt6tSI7GIZ?=
 =?us-ascii?Q?JYliVY6JzmKn1kdXvjMhiZZ2GvdVzn3XFe+t4mZTBzQezgdenpaUoFRDEfFB?=
 =?us-ascii?Q?GAr2jNr6CJGVgozhQLFb9+GGfe1NoRNvzjk6rsHYQ1M7r1Clhc+0IyTets7N?=
 =?us-ascii?Q?DVJOAxl91P6aoKIhKexWfp2UOPFWKVfrVeHBkAx+bltLzh08eZhLh4vD2Y5c?=
 =?us-ascii?Q?nA+lvIoQdYC3clLZi/d41yW3hvL705kXsRg6+xgXzzdXeA66s4SADGW/j8IU?=
 =?us-ascii?Q?/ncXymR0gKi3cSg8zB8GiBUYFRsXZq8RNuIUyQyWpBPGHvVyZPX5Ju4fCWvX?=
 =?us-ascii?Q?QLY9cDnUF2zp8IVhkHExhDijRGMcTxf1CiQmhKs+9s9JHql0Zfq9tA3aax4W?=
 =?us-ascii?Q?7Cx3fSJ1APpebYQPP9KkPj28UPbOMBmTE9ykqSElBQf9PI72Snd+R0BoqMPl?=
 =?us-ascii?Q?cxzQRWP5E9Wdmpgb5cM4Z26e8njMMYPmfKDKEEcaw/Lc/fJBSuDnI8IGzN+k?=
 =?us-ascii?Q?VLPfgGZZHlZ16V0RrM0Xq8OynWvGTseFL3r0JJaG3VC+8qMvtCAiU+yGqRTL?=
 =?us-ascii?Q?ZMwXUzDMm1Ucy9G1BywIT1jwgmSw9WxAasNF2wsb8jZOeLNb1MKcuD0TTN27?=
 =?us-ascii?Q?YPLXR/7Ys6jGYwHtYStqRoZguhA+mc1r8V9AGIk6wfj1y1/LOXuBbQF2BOtQ?=
 =?us-ascii?Q?HuOBo8hsZUGFe9ZSXneRarw1kK/A9bAXHjVU1MhSRJFc7WmzzBbNugv6JlJg?=
 =?us-ascii?Q?no/a0uFhmSTMBXVtjblhrAcUy5v5D9U6627Gg7e62TJbjvXwy6FHLBvrKJ/a?=
 =?us-ascii?Q?lVhcvZx0ON3FOsK0dl9yKuOZj5xiHNYznnybYw3VcurFss4U9KBYOzhVoWcL?=
 =?us-ascii?Q?JAJuYsebTWFfrAeQZY7pkt3PCuE+PaB1GEo/8UaE4BtJYYihPA0WzXBLVHdb?=
 =?us-ascii?Q?+r8C+HdnljCDJwAGzRuIIp+M/AtpU7WnQdyutZKurzImledFV9RNreYKXLvi?=
 =?us-ascii?Q?rO5iPn3NVdrSaa3inguhqzTMXm2ZamLt1+Clu27/2ytvXiUHHsFIMHWBJe01?=
 =?us-ascii?Q?iLNqlL7+H9QCCmndd4aojRGNomdWAFbIc26yf/0jqfc0G9Q9RbuSzq/liTpT?=
 =?us-ascii?Q?2sa5W9B73E+IRFNZ7N64fnCgXFS/7x/85Are0O8FUQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q+lNpWb+B+Y819bPgJwn8rcq7rBW7Q+fdRGsDhPZFpITbXb5qpFfX+3iiX8B?=
 =?us-ascii?Q?EGn2opufM3TAuRkvIlaUNhPMqPo03Zvmczar7rwPk/oUBAXqdWx2Qa5LdcE5?=
 =?us-ascii?Q?tjblno+kk6Fb+3XgTTcObJQ298Y/gIh9TjgENELs8wJuTRfiB8AdxrI9RN0C?=
 =?us-ascii?Q?yWfNnAWxuvw3A5+cnenUfZN2ZCTI2+QSCuHkZbL/yCHYg9PedSUWMrOHh0uU?=
 =?us-ascii?Q?L59tknNOc1JNKg5EUVNhZaylToyM/69snamuQZXznA9Q922fkx6iKginRcGs?=
 =?us-ascii?Q?tCMCucPbO0AWRO2IhB83+PZMkY4Hx9+74FuzehxzSWxrNkvlPMvcAWJ3KMVj?=
 =?us-ascii?Q?N50ggPn/4lsx3TNVeWfoAvgXVLAnYYB/OX6B/vab1uaV+aJSjKAkwlo5UVVU?=
 =?us-ascii?Q?abpFdaFKkhyXq1ZHABl3SC+N9UVgdJRSCuLLxmtYV84hcNl4iMfWB7AbLBNq?=
 =?us-ascii?Q?MXKYTbO4E4yyPR1znHXk1oEQK9X6fzDB7mZ5ns9BuY/M67MLQvwQWVpZRDwJ?=
 =?us-ascii?Q?Oac9c1TKZxVRFZMGQ/mcYQ8pAC4G0AZG2oqU8Sz7JAnPWb7ZYtfOVM6JoAJj?=
 =?us-ascii?Q?1TQsUPZzUY/rqfUkUlMgQI7ARs/AZOM6+yIytiCeZsa1S9dKqHho1tdeCwAB?=
 =?us-ascii?Q?RUKfEvFP5/xuYy+sQrlAEDdaXAqcPKAAjla9Jzd9K1Odx4gtCH8gyot9AK9/?=
 =?us-ascii?Q?pjGdEdcECEsUMfer3sUKEovSqf4QihKPw4I1XNVm0SeZKXCdIbLyguD45ezN?=
 =?us-ascii?Q?Jpfw9y/C9Rx0JT1T9ubZhsl97lBX+N7UYzEaxVTbf7YPyK6py5dIeB3mCLwV?=
 =?us-ascii?Q?CuobvHeWhn+lPe1zU+dI7WQlrkg9a9i7PxInF9ewvWr21fXd+QNwu8QhVecE?=
 =?us-ascii?Q?Qwv9KSiyaBT/8Rffua0moCYZLkm6/5axvuYMTZMDH2S+hizYHyhElsk0bQB/?=
 =?us-ascii?Q?036i7QFibcMTruNDeoqss4aAKphFjFDr7gDluu6jfjIs26vmjo5VS2S7mv05?=
 =?us-ascii?Q?esAYP7QY9ERqnA0q0OCP/LyZ3T5KJHh7LXrZjgf9kfFn7U4hIGcxwdaTSVIc?=
 =?us-ascii?Q?Ch53IMxSNWs9hgQOHE9uIAiYxokCG4Ndg0TRZtkmGFnZD3WyiHKIt3vuJSlu?=
 =?us-ascii?Q?YxObM03oo3jPvnF3FOzaVKRNGs1DezjJJRuYxgFq7PFTCGE7Vx39J9T4tTEq?=
 =?us-ascii?Q?PhA+Va5egrKKJNZ9ijizrgkORrvcU89NI6F1Jku0etwMIp/a27YZQMtYTlmu?=
 =?us-ascii?Q?PX8K46ITAmVkUtPoM+izIbxmuPntEddfVpAsF6GCuLSmOUWH+jKAfV1n69ts?=
 =?us-ascii?Q?ebGEHmXCtlk4+KfTYqORRuZdZ//tirT5kdYSLdOTdE52rE174YLIr/k9eRdq?=
 =?us-ascii?Q?6ECaDp7Yq0WI1mJvpX639kohQ6dRQT4uDr61lze6DYFIIFllNoRIXLPSaYh0?=
 =?us-ascii?Q?OJnMcmhVbtDHIGU77xOQcYpPLGko1+9kJSOleWgMfg4+1lG8dhXyanEq/kKO?=
 =?us-ascii?Q?vU3Pcffdiz1qjnnZ031Po/WO3Myqi2yxlWyF1v7HDnsHHCQ9uTxMZlru2Xvi?=
 =?us-ascii?Q?9rEiyEZiKUcdO8836OAaT4EugX820dinR8JOfdRopDX2BlegMDJ0ewZf/w0i?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 003dc9fa-3234-42c9-edfe-08dc7011dbd7
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 10:21:58.7769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mbXDcKXLaG3TCcm99xLclaFKoYHn98jrmwHCjS9t3tSQJJMEsxFoIuxZftpOenh9NkRY3jEYoiLev6+XSJpDWoqqcCARmcQ+Eu4SWEs0VEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5888
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

Hi Rodrigo,

On Fri, May 03, 2024 at 03:13:02PM -0400, Rodrigo Vivi wrote:
> For integrated graphics, this series mean the unlock of
> deeper package-C states. With this, on MTL I'm glad to
> see PC-10 even with display enabled (with eDP PSR).
> 
> On my DG2 I'm gladly getting the big saves of D3Cold when
> display is off/idle. And everything working niftly on
> the desktop environment.

This is really great. I just tested the latest version of
this series on ADL-P and confirm the device now suspends
in an idle desktop session, whereas previously this was
prevented by held references (power/runtime_usage > 0).
Besides, no other issue so far so feel free to add to
the whole series:

Tested-by: Francois Dugast <francois.dugast@intel.com>

Thanks,
Francois

> 
> But in order to achieve that, we need to relax the runtime
> PM protection around VMs and exec_queue, as explained on
> each individual patch touching them.
> 
> Please let me know your thoughts, specially around those
> relaxation cases.
> 
> Thanks,
> Rodrigo.
> 
> Rodrigo Vivi (7):
>   drm/xe: Fix xe_pm_runtime_get_if_active return
>   drm/xe: Fix xe_pm_runtime_get_if_in_use documentation
>   drm/xe: Relax runtime pm protection during execution
>   drm/xe: Relax runtime pm protection around VM
>   drm/xe: Prepare display for D3Cold
>   drm/xe: Stop checking for power_lost on D3Cold
>   drm/xe: Enable D3Cold on 'low' VRAM utilization
> 
>  drivers/gpu/drm/xe/display/xe_display.c | 10 ++++---
>  drivers/gpu/drm/xe/display/xe_display.h |  8 ++---
>  drivers/gpu/drm/xe/xe_bo.c              | 17 ++++++++++-
>  drivers/gpu/drm/xe/xe_device_types.h    |  3 --
>  drivers/gpu/drm/xe/xe_exec_queue.c      | 14 ---------
>  drivers/gpu/drm/xe/xe_guc.c             | 27 -----------------
>  drivers/gpu/drm/xe/xe_guc.h             |  1 -
>  drivers/gpu/drm/xe/xe_guc_submit.c      |  3 ++
>  drivers/gpu/drm/xe/xe_pm.c              | 40 +++++++++++++------------
>  drivers/gpu/drm/xe/xe_pm.h              |  9 ++----
>  drivers/gpu/drm/xe/xe_sched_job.c       | 10 ++-----
>  drivers/gpu/drm/xe/xe_vm.c              |  6 ++--
>  12 files changed, 58 insertions(+), 90 deletions(-)
> 
> -- 
> 2.44.0
> 
