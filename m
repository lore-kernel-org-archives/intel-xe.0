Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55FC4F5A8B6
	for <intel-xe@archiver.kernel.org>; Mon, 20 Apr 2026 19:52:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E4B10EB24;
	Mon, 20 Apr 2026 19:52:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mU+DPVGu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1079D10EB24
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 19:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776714726; x=1808250726;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2M7JTOd9xyLCO5oxftmlK1CMgEKnHsTUuLYqoGrbubQ=;
 b=mU+DPVGuloJ+dowTojJ3aMDLzFJCDTfSkXG+Xt5//GPY6rWEpGEQ+pNj
 YtDm3r4U6wn2jNDA6PEWcCTsboSTG5Yt+sANWBWaQ7rDF2fg/N+2FQKgX
 vow3+/dhskr+dc6acMYybTBea62sVbeA5DmBA0NrQW0/fTvW0WexoKUHe
 8RyakmMHKNCEUqQidXE9dauoOmrGqgY47rZzSSDpFRmLQTNX9KZFBlghh
 Bwk8YnlqNG1tBmc9XnOYnfGv3VI/jgzzA/TEt7T/ViloVgoeOXDgNyULC
 U0anb4sqcLlRFoetaIgsAc2MHM+pcUqjawYecvkS60CbkL1atl18bUnEk w==;
X-CSE-ConnectionGUID: DsibD9LeSROkan0/bLcsDA==
X-CSE-MsgGUID: l2xx+TcJTEW1WGfqyvTafQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="95197374"
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; d="scan'208";a="95197374"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 12:52:05 -0700
X-CSE-ConnectionGUID: ClUKNCaPQQibSYEL71W77A==
X-CSE-MsgGUID: wFNdr6OVRQmj2/mi0KhD2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; d="scan'208";a="231732377"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 12:52:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 12:52:05 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 20 Apr 2026 12:52:05 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.59) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 12:52:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aG64VJdc/czdU8ccI7RJJMFU8B2vS2/wIT0pzWR7+vWj8Jug365HiLTq6yOtxi5TGAkCtTCsppayl0305HoCdCI4vtxUAeYU3+5smyY059Ln9FCiaJTHP4yZFz58Xj4ko6IwbMHREnt44QA2msSlduEq6uh62UTRnWgGqe7GPRxNd7Gj+k4QXKklcn0DK17gJqP1utQweclaAMEHP0zuLCqj5M0sp1v3JnTfuxxyMBKQr2UoSDYQueV2ioBHMItbYRcM0dA8fnRuuCrNETWI3FBrpYH4d9i4KGYjVfQrvjPfFRMY8Le02yatyjZBa1by8jGHZJvEn3IGF6sANmffxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LPZ25AvbKe+Q1b/47tHbN/mGxfD9hCaffHrHQrID+nk=;
 b=Hpz2RGwtbykXd886NIpgqQL3COKuJPEchCZ8ZQNrX1xEgsPNEhaYlXdNWENpz7U8iA1OBNDQhRS8dV22SLgmKAc2kOw420/AoLHuQss84N8hboOSPn47cehKtX+eARE7ITD+qM1n70NyjxeD9h52HdmCEqBfyRheTBgcFvGg7ZBmtpe87bIU3ba1Q/XEioag30W6mx0XW7VQ0yuQucgBxxXtOELziEUS4Npc0uR0vVNLVVG+/ZQmkGtPYamrdrsRuqp01MQ+/qFJs25W3g7VwkxChATHtsPE6yqo0TALgKCCxr1Gsypw8mnRCnTnvG5QkkWDZD8KBQ4JEcKhJqi4fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH3PPF681F257FD.namprd11.prod.outlook.com (2603:10b6:518:1::d29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Mon, 20 Apr
 2026 19:52:03 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9846.014; Mon, 20 Apr 2026
 19:52:03 +0000
Date: Mon, 20 Apr 2026 15:51:58 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: Soham Purkait <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <anoop.c.vijay@intel.com>
Subject: Re: [PATCH v1 2/2] drm/xe/xe_ras: Add RAS support for GPU health
 indicator
Message-ID: <aeaD3n25U8LqGTM8@intel.com>
References: <20260416093610.4085667-1-soham.purkait@intel.com>
 <20260416093610.4085667-3-soham.purkait@intel.com>
 <aeDN6g6HWd3v-V72@ashyti-mobl2.lan> <aeJI1WrAr33degB-@intel.com>
 <aeZFqaIlrddHmlCn@ashyti-mobl2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aeZFqaIlrddHmlCn@ashyti-mobl2.lan>
X-ClientProxiedBy: SJ0PR13CA0126.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::11) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH3PPF681F257FD:EE_
X-MS-Office365-Filtering-Correlation-Id: f794b479-52a7-4253-9c60-08de9f164b19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: XEe7NkwP2Y8oo8PsAhMZ8StJ56CZoir7Np3AzyuCXopmn/Ps1g0TyYoS/rk+ENUzoYS7+fF3jNgkVDMn/AWY4BOMR4moB8xTbxzibVNHy0F7wAZARxoSy8zU4+b6cJ9i67e4APqj+gyqlrEp7UOWOLjVJvcFIZ/iXMyYgrMC5vet+kMgnzT5sLqGzxhYQ3J/f1YHmQTsOtddfKjaUFnnxNqLd6lH2SiXhc0EJDJn08Rdxcun/x7d5VaQqFVLXmHxQPqmcIX0ecR5r6kA0isMre88BXJI1xwYKPOdCzYRw5mCvWEdi+gIpqqLGqA/bZTTCW0LzvbDNVzjeCa8PljZ8nacfXJEJ/s7qKnQx0/ZhERCQQVe6Pl+0GTAq+SzLM2nWAGvHd+vESuGchrUzLVAUcYgXOIGH9GD3nX5+K8knxo64IeKaqj3ghFU2LWj0laC6vZSWgj9m/p8rWQ03hfU9hTqxfEvyj4qdraN/98+vT25b8N39IGPn3ST6WTWcAqYcnkvnFQuNwxx416cbJ+HbEO03EUMYGJLrM/enzzUkboSAbZkVlITEQmO7wYcmxFZQWD7oXMsZI6bDYdac5ZrmjcaCCaaeGL7csmz96WSOpj4Xkga6Ba4jM7AmFJNyF1GFLK5TO7v58ArVyS58tGzjWikSKEQp0mJmoaq5k2BuegGR16sExX/Qb7HjE9IrMbehQrLHA9Dkg9Eal91aK29/O/lZF41h8Sa/FetXRYnFe4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XBTEdVfEPjkBt7q5/tMh4AixxvVO4ge9DDErDilBp/wSVhXybwRnCPpzTJRc?=
 =?us-ascii?Q?zYpb2Khz8PRDXjoJ0c/mdSWXEMVKTiq6j7gqIadRaIycogwbPyEAgwFRKj0S?=
 =?us-ascii?Q?Wl8H2I6O39dS+tK4abR8nO4yuS1OkiamlYt8k4pRTxlkGE4J5zDKOYuLJg0r?=
 =?us-ascii?Q?/ohNa1tYdGHCCsX6goe8Yuh4+3WQpe01a6JyjP/h11/SjGPMwWtRHZXJXpob?=
 =?us-ascii?Q?m96xcH6rFcmaTkCVF0oKdJg/fSUoOXBUNhtsOAYBZXhw4tne5+2ipBBz4auM?=
 =?us-ascii?Q?2ohg24ymqzInovFSIMxtSM3gy0TwKd8ZODxrfiSWZQuPQjM+RofYW1ji1oo+?=
 =?us-ascii?Q?aScTP9J/M7QJDjOuFzppVjM2k1YP5PphKc1hS6p1J8OSjakNiqPuMJG+M0ai?=
 =?us-ascii?Q?2zm289upICm1LR+7s9qeKjAinXPio0WzOjO6nMykw25WrDIZXyqnYhThbC+/?=
 =?us-ascii?Q?bbKbsggVoOzR3wxJmPzQv8Wvkfw+ADpsq1JTg8+h/jIeS731MA4N/JKdlM/K?=
 =?us-ascii?Q?2fdYMzZ7JJC19G7mplbqJeyRS24Y2kwsUkBGLKg3szAsBhBYZeFvLEBZKOz8?=
 =?us-ascii?Q?2bhi1/uVSkaxaFYHqMMv3veoFJ2qd0ftV3XKK+ljxmmbJP6juj8yCJaLXN8j?=
 =?us-ascii?Q?b8j/fAprBjulyRUkFQiyNFdxokt5rCy430P94rzIGaR+HibPHq/YVdLpfv63?=
 =?us-ascii?Q?8WjM80l/8XKVWNOj/cLF6/IpVnhZa+eytOgfkZFZamXxHEKf5r0hrzwYtPU6?=
 =?us-ascii?Q?Okbqvf93LYf7c5ztPkOjN7G01ifcmua9NXccK/eXlMS/oqRgrOxX4SMYYV9v?=
 =?us-ascii?Q?oELesHBCgMQPZoViRLp0OV8S6VVTUiorXQSaVJM+awDQtyKTiP9JsXkXYAo0?=
 =?us-ascii?Q?Oq9qGSWBEJvQNjKnhjf/+8bREy151cNWbmkoSsXNa5cAd9pCy71ffSlpnYOy?=
 =?us-ascii?Q?UXGbnYsJiFTkWuN2MzF8zXr1WMMr5VqEui7FNwaMV8+1zr0c0pdgKCdMNlB9?=
 =?us-ascii?Q?6Gbxgz5nwm+3xmHSQHQ2S3R1GuZGdC4MWPL3x4n92LXvRrxNZVq3NCYCRbv7?=
 =?us-ascii?Q?8Jm82UMUSScPdn5PwtOV+uaRN2mmfNhSCYpuiaiMg1bBMOLZBjNdYiGwuHWm?=
 =?us-ascii?Q?I9aUiJNA63bHVIm2zlfJSWGTNHSwyPxgHwQJSI65LNNUHhwVlvccFfX/zeP7?=
 =?us-ascii?Q?hPCcoF01dvRxkouDqAEOLnmiKIY8dGIXJQuY/lrgXXWbSpd7VVoOSIM4Ao7S?=
 =?us-ascii?Q?+0ZYGiOWk0yqVNagWu/cnJVjQf7Hj8KviyPUJccKTHvxqjOzjPVuWOUPyPS5?=
 =?us-ascii?Q?x4rIUsI4EZeHMaO+4otkR0LGVelEfVZMUxKAgofV7TfXerFyi7QGaBAeBFHU?=
 =?us-ascii?Q?2cDmikZCFhrQcxjUorMMpML0xVRv0goHDF/Yc8zhV3X7I46Mza2xGO81HHxW?=
 =?us-ascii?Q?9yrha3hpHbsZyWBglERU9AhI/7dl+kMT1+PlYugOFNCJ+OnuyMkoyT/JjNnF?=
 =?us-ascii?Q?zOhQymbxVTJMw+oIx3ixOdvEoQ0V+NNBRAek2NU+PqeI1fyjM60baQ1sT815?=
 =?us-ascii?Q?Vr6TbQcNN7dFaBmr5dR9ePHo2xsUjsiXouTaH4WhMpd2vJhKu0KtZEo5tn+k?=
 =?us-ascii?Q?RbctUNOGlElWdfYSw+grjmGQy0g66GZEX+b3Jrg9jOG2gDMOVvmRq2wQntzj?=
 =?us-ascii?Q?vaLm4BOhFxxgvtITZOaXyn4i4YVacHx2XZkhVcPgDC+FtnLb3Gc8HHcarSPl?=
 =?us-ascii?Q?AyLpRAywTA=3D=3D?=
X-Exchange-RoutingPolicyChecked: cM/fnfRthrz9UyJFnzy6K3kssxaLyd0fJgIGTnFBZyqFuDPLXMY11i+cleyGAAenGAM3fA6wzWIhIEhKAC8OSnszupU5L83EiKL4MFxmRfAX1HRI0IjtLB6n3n2knQ+nOVGRGu/AZa9LPdpqFmtLtQrJIvLueOGAhRz2UuqUlF8BsoIqfftryHHevKgp5lFKslMTMnVCvdc6ATPrwRNRER0DfVEEIUiUbJhdGKxdUFUAWY0rq3De7aphQz+QZQOIHQZ8YaRtmxtIDzI/1ahf3K4WuV0WASlTCQDC9ArMhcnwvUfzK9uCU/6Wym+uwLPuALnA8j2abw7ITnynz+tG9Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: f794b479-52a7-4253-9c60-08de9f164b19
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 19:52:03.3393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 68H7QMBvZOc3NWCjEdtMLMisq3lKSjhF88Bs5iVXtzv34F18zY96F7eAxoSAGgdBzmTgn3d6tRj6VuV3Ongh0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF681F257FD
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

On Mon, Apr 20, 2026 at 05:26:33PM +0200, Andi Shyti wrote:
> Hi Rodrigo,
> 
> > > > +static const char * const gpu_health_states[] = { "ok", "warning", "critical" };
> > > > +static const char * const gpu_health_fmt[] = {
> > > > +	"[%s] %s %s\n",
> > > > +	"%s [%s] %s\n",
> > > > +	"%s %s [%s]\n",
> > > > +};
> > > 
> > > Please, don't use complex sentences in sysfs outputs. Use a
> > > single string/character/value
> > 
> > I like this one better. So we don't need to have an uAPI entry to define
> > the meaning of 0, 1, 2.
> > 
> > Regarding the sysfs rules, as long as it is one entry per sysfs we should
> > be compliant with the rule. So, we should be good here.
> > 
> > This style is consistent with the style used in /sys/power/ entries for instance:
> 
> Well, if it's a sysfs interface, it's a uAPI entry and needs to
> be documented (something that I don't see in this series, BTW).

Indeed a good point. Soham, can you please provide a documentation
in a next revision?

> 
> The sysfs interfaces don't really need to be 1, 2, etc, they can
> also be strings, as long as userspace applications are able to
> easily parse the content and know what to expect from them.

Which is the case here.
We only have these 3 states that user space can easily parse:
[ok] warning critical
ok [warning] critical
ok warning [critical]

> 
> If we need two strings, then we create two files.

This part I don't agree. This is just the same as the power cases
which I already had pointed out.

But right, you do have a point here. Different from power, we don't
necessarily need to expose all the supported modes + the current one.
After all, these states won't be that different from state to state.

We just need to document it properly and then just print:
either

ok
instead of
[ok] warning critical

or
warning
instead of
ok [warning] critical

or critical
instead of
ok warning [critical]

The full string with all the supported modes do sound bloated for
this case. Considering that the supported cases themselves shouldn't
change much and that we keep that documented. My bad, I'm sorry for
the confusion here.

>
> If we just need to provide information to system administrators,
> then we can either use the debugfs or procfs that don't need to
> be considered as uAPI.

That is not true. In many data center deployments the 'debugfs'
is not available and the admin and cluster tools still need this
information. It needs to be stable API.

> 
> Andi
> 
> > $ cat /sys/power/mem_sleep
> > [s2idle] deep
> > 
> > $ cat /sys/power/state
> > freeze mem disk
