Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C5FC61DFD
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 01:05:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD2C410E581;
	Tue,  1 Sep 2026 01:05:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QexKsXfw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 134C910E09D
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 01:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788224704; x=1819760704;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NuJB51vP2Wy2svaO7boBvVZtSNeeX5CoefmJs6vp6Zs=;
 b=QexKsXfwCHRFSUBQSdlCiZDTwcPDfIJe3/M5rtyRJbHL1H1AAza3O7Mv
 k7DqzjA7lv+WsB0zu5R8zBnTc1/lL53EY0hNa/UCwO9C3SWFsns64N+5b
 E/52dYCglhx8YXITgOpxdLmQtWTg5scIMgCfO+GxR+txWYa4rtPXEz8/t
 uKwB525fHmNVnKsh05DF6o/nFJ1zW7MEYbg4gSDDRqMJ5Yvbv9YYDkN4m
 aAdLwHdG5gbzT5tQ1+LYlcK0kCZsKFM+1L2EfcoFYzID5xXTOcpY2NmJT
 taZX+WSNiUPybJsAgs5Z+Px8msZA2ix6j0j/uBgdAqvHlkeniOhf7VIiJ Q==;
X-CSE-ConnectionGUID: 2xEKLghnSbyxE20hq6dlUg==
X-CSE-MsgGUID: oOPqZSkKQHiVSNsLIs+YqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88651073"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="88651073"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 18:05:04 -0700
X-CSE-ConnectionGUID: MppBKCXyRSSp6uA98fRIJQ==
X-CSE-MsgGUID: 3UaBt8uPSmaB8G1FmqMZXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="265231425"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 18:05:03 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 18:05:03 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 18:05:03 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.2) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 18:05:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gnal2VxROspNqdPBevZl0rh88vqCW/Xw/713oVuezFDJ+foCDphxxc0aNHjY6NDKkmS98Rv7lNq2dWIVufVKfABIuxrXkXjWyK16m22hClajhOLPiK2CCdA2ffXhEOGcMMWjzVzxPwyS5pIqqDPoB9da8odGGbLOBxdiEgFzyXuIemd5ElT4kbE5Xu92Av9hVRPtqh3mgnBU0cuzJITWBZmYUQk8ACCG48WsC7Pe3LM3XoBhcc7m6aBjLOXWPa+g0/hIENMnkeeOSZX4sNohlp/cI/80d01GdjlpTsXomqmYjp3AvVyyB9MJmgRw2WNqWlaZ8jqvsZ+NhEAGpuBj4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0dJwMoNjinf6wcQbEug8CZPTmqqnjPwJwhUU4/aX33Y=;
 b=P1a0+6vVFYjRPpmRKfSAGRdVU/QjnX08su85Bj+PItsBTu4XhykeqNh0Z/Q6kWQT1AmFxPwqj8eXyBoA6zFCxvx9632mAODk1sndjZ8FuidZsNvH9SbxWHpWaX1JrNmVF8UwRu7OJNptVvUbmreWNqqExupk9qcVFtwpe+oUCjAqI0tKVHCVxY7cWoCeJOKwLg5lKpYISDjhE6zv6Jea8AMKuWiv4Qo1l3HRr+/JOo/hXFkL+SjEUhzckO8oea3NwVfHiWU2YROzBhhDvXjCzmwg/qvoCQBtAqVaGPzfWoiVpfkb5rzzm2QyPw/GKq/oThKqhTEdOWjNF4pxUng05w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PPFE50071912.namprd11.prod.outlook.com (2603:10b6:f:fc00::f57)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 01:04:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 01:04:59 +0000
Date: Mon, 31 Aug 2026 18:04:55 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: "Tauro, Riana" <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <rodrigo.vivi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>, <dev@lankhorst.se>,
 <jani.nikula@intel.com>, <lukasz.laguna@intel.com>, <lukas@wunner.de>,
 <daniele.ceraolospurio@intel.com>, <badal.nilawar@intel.com>
Subject: Re: [PATCH v10 03/10] drm/xe/gt: Introduce FLR helpers
Message-ID: <apYktyc+I3Cc3JIO@gsse-cloud1.jf.intel.com>
References: <20260821112436.545405-1-raag.jadav@intel.com>
 <20260821112436.545405-4-raag.jadav@intel.com>
 <fcd99d4a-b7b4-4bfd-9e78-65ff1ea2d7d7@intel.com>
 <apBaXqzn32nzL7qF@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <apBaXqzn32nzL7qF@black.igk.intel.com>
X-ClientProxiedBy: MW4PR04CA0197.namprd04.prod.outlook.com
 (2603:10b6:303:86::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PPFE50071912:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bd692b4-76e9-45f7-2ae0-08df07c50b26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|56012099006|11063799006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: kFdpEmReLpf2mAPdWBtdsuK7Q3vWrV94zY1rsRJJHNl36EuERs8tUF5EhegMkMPNDbL8MpwpJ9q7sDecgpV4SUvDjDD/BTxP8yKaID2cNPQd0/Q/7M8NPXyKd8IrMw7BJbjycy2wgj5Ytcuj0+Vu5vnX21Qh+A4PBYNHphqnfqHDj07ddBZEGvIykhKHtfgxlV68wtK6qsf/nMeVRcq9ScJsgDjqY/Mq/qzCNpzQOZUwGSRM4X1K4xBAKLEqBChIShVATptyPHQMXHpTNTzcJNX0pCLH6h4exI5aAfkCs/MchjtdYORCAw1NJYCdnLJ2kr8hVTVM/fe99jEOKgrqfHrbYIOWR3j3eolxBT/m6xwZ1NqzEhbCRv6Gew9kieTXw+AIam3oyjJ1gpNMw96lsbVedNgrhtpVrHMh0UHv1NbpfUpCenlp7ATnmWzQbcQXfCjZn/BErchRAnWtdJi5fNYAiONAskJK4Zl82fYjNh0vEz+n40CULXLLxfw704ADcDzk5KFBlrrVCIi7Y5KYlzbKfLG+q7AwE14I+ZO2nSxY8HisM93qxQFhXVZXBNh1N+FTonRgwBcvCbylHP0wJuB4z7y4DpLr+FOOQdb1yI0kAPg/9SYlb0OsspAYFqJH0IYI0MUGm0cD9PfxBzt8fLLva67SzbDE33BroNRSda8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(56012099006)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R+kosOUIKX/9EezbbiQ1XSHJXOAokoN/XRW4Mg4FClrQwd3iyQjN/XmuvWWP?=
 =?us-ascii?Q?YDzALdMpTMyydwf1hXKywGC9SmfG9PRqozQZQlrITvTCsI0GNFTvnQux43P2?=
 =?us-ascii?Q?r2Qh+kLGtcesn2AoIWaBWRxD9EwDrYoaSpEzpIxXPVrQXCgmNA0OG8f+rh30?=
 =?us-ascii?Q?b5hnwStS4xC1hOZnyHuSOyYtRXOmfllrlIdp4JBtQTb8hFICybhEIwHzianD?=
 =?us-ascii?Q?XY64qJxGgB4LFWCdGnAL+y/gD5gdqim29z17tGm5R8gpVMyaiGxxPlIxItEC?=
 =?us-ascii?Q?/qNNkpvVa0uL5DfhHPhcAPVHYYnHHgi/8k4uYqaatZ+HlaqxuUwguqtDgFEe?=
 =?us-ascii?Q?7Cn1SVXqg5A4xhZK8aWyK1Y32D1Kxgtiz5Ts/dcHbSkC0ULQ6gF+4LMyKRJG?=
 =?us-ascii?Q?Mq8wcfRGleEUBSQDadzKCF7WMkf1yUctR0lP2TKAs4x+3PAwvgF/+Pjj6vQg?=
 =?us-ascii?Q?jZY/v2i/Kdr6QNUnD1vX45C3DsOyv75MHJ60Hj9nb449GaSfNQOknhezRoIf?=
 =?us-ascii?Q?M4hvrQ2S1jPlVo5KpLe4GWzPX9+NXmPKvEDz+HsPWXP17byLAsc1PQsYNPny?=
 =?us-ascii?Q?xpRaLlb9D7xd+nIKdBfBlHSr2D2okm3vbY+Z+7hP29bse1DUazOrZuNWARdn?=
 =?us-ascii?Q?ajb2Lk9l2uZwKtT2kYPCDa8sBCKwJS2YAAPm8GwUse9Kh17nbcW1A7PPXbbh?=
 =?us-ascii?Q?G8d03KvPiOz5WkFqFF/SPiz+vshqVHAjnyhyvBFa5WI1axwSBz/zJqGxsThU?=
 =?us-ascii?Q?IHkcx3HuRA57Vybhwo4/I3Yn4fj9U1dyDnE9BUJVokZsroouFL+Ttf976qqv?=
 =?us-ascii?Q?KpEcG5OeNQM/xivB1qGp/swZvQWhmm+Yn0OOz5BL6Du9+jFLg+WxEaYT3kgw?=
 =?us-ascii?Q?JStRHa/+Fms8xJ4oSHjEmK5SabzDiaRiFiTjtOByNNeZ6w/HNqeWto2Eu8kI?=
 =?us-ascii?Q?cemvICKr6WSidEIiMbFrUUX5Qi4jsAWpWoiT/Prwcc8lYM3s5V1e/nadiCNT?=
 =?us-ascii?Q?XRkWuxs2oraIT+MHV2JCw0mr403I6bwjcrtqW9PpOteNe2WPsW+ePh4IBZ4E?=
 =?us-ascii?Q?ySGWteVBQmsRzDsY9cKQ7zycEqeFFpSyqV7vXUQ30ya6+HpXGoPbJtvxouQZ?=
 =?us-ascii?Q?qzcRBUU38T/gQkyrmTiyv/TnhDEgZPWsymPLQOYnnpkOKlz0Cmq54P8Li4lX?=
 =?us-ascii?Q?z8oyURIpop4YOJ2XxoE0FXDoyljLIuffKiiDP+Wif6X52ndOKVwopf7m+Ilp?=
 =?us-ascii?Q?nBDiv1hRwJ1Ab3MlhsvVQzj/WhGXGDJMXSDciX9TlWr2M6skr5yoNNCPDOWm?=
 =?us-ascii?Q?5xeR/IPCPNofxaclyFvxvtdopcyieYo4JeKuHataBqAbSlfQSPKep9pUJ6qf?=
 =?us-ascii?Q?CIGV+cEqek3f4blGfO6xRcWdzXuiSEeoJ+nrV5RO5Zt295YlCDRk4NyFjHZk?=
 =?us-ascii?Q?+ZP7uSAsu0ydsawpIsi870CWm32iwE6dwwQIwxUp5f5uhkGpGRYzxurk1b/L?=
 =?us-ascii?Q?OSWzdibsVzeXMl5veKit/R0TTmn2A3falBKQ5rdhaHBYCOT6Sc/LYrx2aP+t?=
 =?us-ascii?Q?1mpWql30qUkOHwfJDakoAMZy6WUrD2cS0xWZIpPVEntVYkvIvLrvvZwrUlHr?=
 =?us-ascii?Q?dFqp/E/6IfmzyDu46NP4Dt9TXKjkMadmMNGD58zleGnJDzHq/SB9sQ4NRRyV?=
 =?us-ascii?Q?5PUHL7C44GbHXOryDH8h7FLjpU4TMxNCDdQuaOJGxflQdOudN5jVCA3HKjEY?=
 =?us-ascii?Q?Mea3lMbuELggbQDul9vWH3zeZ6x/KOM=3D?=
X-Exchange-RoutingPolicyChecked: dd/X1eSMOA9BkrulTgGQsBwaZuYT49/Z5ABl2RL6ypt0SVV661D+z1+BawrL6vhYpA0JAJAtYbWtVJfpadbutD2NkIVrc6ax+eRu8ESHsLqDZejBnitHWhHcpK7zIjcSHa6AdU5cBaA1Cs8gAAREyzSp3rD8er/Ki2Cc61qmiCcQfavX9bb8AWszyhw8QyrSF8pmZogEwJX1TDpXjknqpyJEzvLGlK37iU+MrGs+XA5RQR/LM21c7vJyDAovjljlKaXjODv8Lvi1aUiK2p+94jUF1QcqM4NA2juMUOkaRhgzM7Fs+TN5IjwcgZ8FFB27tz1O7vHOYF4bwIKjxynCHA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd692b4-76e9-45f7-2ae0-08df07c50b26
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 01:04:58.9960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QtcyHadOuptBdgjaXntPjT47d4+/miVvLQQC09c2DAeeBsIyK1sIe0q5PQ3Naml7I44bScKWUsiSvb9kOzkDwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFE50071912
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

On Thu, Aug 27, 2026 at 05:40:14PM +0200, Raag Jadav wrote:
> On Wed, Aug 26, 2026 at 03:09:21PM +0530, Tauro, Riana wrote:
> > On 21-08-2026 16:53, Raag Jadav wrote:
> > > In preparation of usecases which require preparing/re-initializing GT and
> > > all its uCs before/after PCIe FLR, introduce flr_prepare/reinit() helpers.
> > > 
> > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
> > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > > v2: Add kernel doc (Matthew Brost)
> > > v4: Teardown exec queues instead of mangling scheduler pending list (Matthew Brost)
> > > v6: Add IS_DGFX() assert (Daniele)
> > >      s/flr_done/reinit (Daniele)
> > > ---
> > >   drivers/gpu/drm/xe/xe_gsc.c      | 14 ++++++
> > >   drivers/gpu/drm/xe/xe_gsc.h      |  1 +
> > >   drivers/gpu/drm/xe/xe_gt.c       | 23 ++++++++++
> > >   drivers/gpu/drm/xe/xe_gt.h       |  2 +
> > >   drivers/gpu/drm/xe/xe_guc.c      | 29 +++++++++++++
> > >   drivers/gpu/drm/xe/xe_guc.h      |  2 +
> > >   drivers/gpu/drm/xe/xe_huc.c      | 14 ++++++
> > >   drivers/gpu/drm/xe/xe_huc.h      |  1 +
> > >   drivers/gpu/drm/xe/xe_uc.c       | 73 ++++++++++++++++++++++++++++++++
> > >   drivers/gpu/drm/xe/xe_uc.h       |  2 +
> > >   drivers/gpu/drm/xe/xe_uc_types.h | 14 ++++++
> > >   11 files changed, 175 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> > > index 524ac56bdcc7..475e44455c9e 100644
> > > --- a/drivers/gpu/drm/xe/xe_gsc.c
> > > +++ b/drivers/gpu/drm/xe/xe_gsc.c
> > > @@ -548,6 +548,20 @@ void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc)
> > >   		flush_work(&gsc->work);
> > >   }
> > > +/**
> > > + * xe_gsc_reinit() - Re-initialize GSC after FLR
> > > + * @gsc: The GSC object
> > > + *
> > > + * Returns: 0 on success, negative error code otherwise.
> > > + */
> > > +int xe_gsc_reinit(struct xe_gsc *gsc)
> > > +{
> > > +	if (!xe_uc_fw_is_loadable(&gsc->fw))
> > > +		return 0;
> > > +
> > > +	return xe_uc_fw_reinit(&gsc->fw);
> > > +}
> > > +
> > >   void xe_gsc_stop_prepare(struct xe_gsc *gsc)
> > >   {
> > >   	struct xe_gt *gt = gsc_to_gt(gsc);
> > > diff --git a/drivers/gpu/drm/xe/xe_gsc.h b/drivers/gpu/drm/xe/xe_gsc.h
> > > index b8b8e0810ad9..ce390bffb163 100644
> > > --- a/drivers/gpu/drm/xe/xe_gsc.h
> > > +++ b/drivers/gpu/drm/xe/xe_gsc.h
> > > @@ -15,6 +15,7 @@ struct xe_hw_engine;
> > >   int xe_gsc_init(struct xe_gsc *gsc);
> > >   int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc);
> > > +int xe_gsc_reinit(struct xe_gsc *gsc);
> > >   void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc);
> > >   void xe_gsc_stop_prepare(struct xe_gsc *gsc);
> > >   void xe_gsc_load_start(struct xe_gsc *gsc);
> > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > index 6805e0d3bf21..d4fac8c4d8a4 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > @@ -910,6 +910,29 @@ static int do_gt_restart(struct xe_gt *gt)
> > >   	return 0;
> > >   }
> > > +/**
> > > + * xe_gt_flr_prepare() - Prepare GT for FLR
> > > + * @gt: the GT object
> > > + *
> > > + * Prepare all GT uCs for FLR.
> > > + */
> > > +void xe_gt_flr_prepare(struct xe_gt *gt)
> > > +{
> > > +	xe_gt_sanitize(gt);
> > > +	xe_uc_flr_prepare(&gt->uc);
> > > +}
> > > +
> > > +/**
> > > + * xe_gt_reinit() - Re-initialize GT after FLR
> > > + * @gt: the GT object
> > > + *
> > > + * Returns: 0 on success, negative error code otherwise.
> > > + */
> > > +int xe_gt_reinit(struct xe_gt *gt)
> > > +{
> > > +	return xe_uc_reinit(&gt->uc);
> > > +}
> > > +
> > >   static void gt_reset_worker(struct work_struct *w)
> > >   {
> > >   	struct xe_gt *gt = container_of(w, typeof(*gt), reset.worker);
> > > diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> > > index 65a4655b0994..1e56355318c9 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt.h
> > > @@ -37,8 +37,10 @@
> > >   })
> > >   struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
> > > +void xe_gt_flr_prepare(struct xe_gt *gt);
> > >   int xe_gt_init_early(struct xe_gt *gt);
> > >   int xe_gt_init(struct xe_gt *gt);
> > > +int xe_gt_reinit(struct xe_gt *gt);
> > >   void xe_gt_mmio_init(struct xe_gt *gt);
> > >   void xe_gt_declare_wedged(struct xe_gt *gt);
> > >   int xe_gt_record_default_lrcs(struct xe_gt *gt);
> > > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > > index c7f8bbd4cb92..ffe7f0847e76 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > > @@ -1709,6 +1709,35 @@ void xe_guc_sanitize(struct xe_guc *guc)
> > >   	xe_guc_submit_disable(guc);
> > >   }
> > > +/**
> > > + * xe_guc_flr_prepare() - Prepare GuC for FLR
> > > + * @guc: The GuC object
> > > + *
> > > + * Stop GuC submission and tear down exec queues.
> > > + */
> > > +void xe_guc_flr_prepare(struct xe_guc *guc)
> > > +{
> > > +	if (!xe_uc_fw_is_loadable(&guc->fw))
> > > +		return;
> > > +
> > > +	xe_guc_submit_stop(guc);
> > > +	xe_guc_submit_pause_abort(guc);
> > > +}
> > > +
> > > +/**
> > > + * xe_guc_reinit() - Re-initialize GuC after FLR
> > > + * @guc: The GuC object
> > > + *
> > > + * Returns: 0 on success, negative error code otherwise.
> > > + */
> > > +int xe_guc_reinit(struct xe_guc *guc)
> > > +{
> > > +	if (!xe_uc_fw_is_loadable(&guc->fw))
> > > +		return 0;
> > > +
> > > +	return xe_uc_fw_reinit(&guc->fw);
> > > +}
> > > +
> > >   int xe_guc_reset_prepare(struct xe_guc *guc)
> > >   {
> > >   	return xe_guc_submit_reset_prepare(guc);
> > > diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> > > index 61e3ee19a59b..e0226cc28046 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc.h
> > > @@ -32,10 +32,12 @@
> > >   struct drm_printer;
> > >   void xe_guc_comm_init_early(struct xe_guc *guc);
> > > +void xe_guc_flr_prepare(struct xe_guc *guc);
> > >   int xe_guc_init_noalloc(struct xe_guc *guc);
> > >   int xe_guc_init(struct xe_guc *guc);
> > >   int xe_guc_init_post_hwconfig(struct xe_guc *guc);
> > >   int xe_guc_post_load_init(struct xe_guc *guc);
> > > +int xe_guc_reinit(struct xe_guc *guc);
> > >   int xe_guc_reset(struct xe_guc *guc);
> > >   int xe_guc_upload(struct xe_guc *guc);
> > >   int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
> > > diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
> > > index 57afe21444b1..c73e1acbd091 100644
> > > --- a/drivers/gpu/drm/xe/xe_huc.c
> > > +++ b/drivers/gpu/drm/xe/xe_huc.c
> > > @@ -296,6 +296,20 @@ void xe_huc_sanitize(struct xe_huc *huc)
> > >   	xe_uc_fw_sanitize(&huc->fw);
> > >   }
> > > +/**
> > > + * xe_huc_reinit() - Re-initialize HuC after FLR
> > > + * @huc: The HuC object
> > > + *
> > > + * Returns: 0 on success, negative error code otherwise.
> > > + */
> > > +int xe_huc_reinit(struct xe_huc *huc)
> > > +{
> > > +	if (!xe_uc_fw_is_loadable(&huc->fw))
> > > +		return 0;
> > > +
> > > +	return xe_uc_fw_reinit(&huc->fw);
> > > +}
> > > +
> > >   void xe_huc_print_info(struct xe_huc *huc, struct drm_printer *p)
> > >   {
> > >   	struct xe_gt *gt = huc_to_gt(huc);
> > > diff --git a/drivers/gpu/drm/xe/xe_huc.h b/drivers/gpu/drm/xe/xe_huc.h
> > > index fa1c45e70443..cb1a770b4a9c 100644
> > > --- a/drivers/gpu/drm/xe/xe_huc.h
> > > +++ b/drivers/gpu/drm/xe/xe_huc.h
> > > @@ -19,6 +19,7 @@ enum xe_huc_auth_types {
> > >   int xe_huc_init(struct xe_huc *huc);
> > >   int xe_huc_init_post_hwconfig(struct xe_huc *huc);
> > > +int xe_huc_reinit(struct xe_huc *huc);
> > >   int xe_huc_upload(struct xe_huc *huc);
> > >   int xe_huc_auth(struct xe_huc *huc, enum xe_huc_auth_types type);
> > >   bool xe_huc_is_authenticated(struct xe_huc *huc, enum xe_huc_auth_types type);
> > > diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> > > index 65f59f06177f..4b9b5ea4fb08 100644
> > > --- a/drivers/gpu/drm/xe/xe_uc.c
> > > +++ b/drivers/gpu/drm/xe/xe_uc.c
> > > @@ -18,6 +18,7 @@
> > >   #include "xe_guc_submit.h"
> > >   #include "xe_huc.h"
> > >   #include "xe_sriov.h"
> > > +#include "xe_uc_fw.h"
> > >   #include "xe_wopcm.h"
> > >   static struct xe_gt *
> > > @@ -278,6 +279,78 @@ static void uc_reset_wait(struct xe_uc *uc)
> > >   		goto again;
> > >   }
> > > +static void uc_flr_prepare(struct work_struct *w)
> > > +{
> > > +	struct xe_uc_flr *flr = container_of(w, struct xe_uc_flr, work);
> > > +	struct xe_uc *uc = flr->uc;
> > > +
> > > +	xe_gt_assert(uc_to_gt(uc), xe_device_wedged(uc_to_xe(uc)));
> > > +
> > > +	xe_uc_reset_prepare(uc);
> > > +	xe_guc_flr_prepare(&uc->guc);
> > > +}
> > > +
> > > +static void uc_flr_sanitize(struct work_struct *w)
> > > +{
> > > +	struct xe_uc_flr *flr = container_of(w, struct xe_uc_flr, work);
> > > +	struct xe_uc *uc = flr->uc;
> > > +
> > > +	/* TODO: Sanitize GSC firmware */
> > > +	xe_gt_assert(uc_to_gt(uc), IS_DGFX(uc_to_xe(uc)));
> > > +	xe_gt_assert(uc_to_gt(uc), !xe_uc_fw_is_loadable(&uc->gsc.fw));
> > > +
> > > +	xe_uc_stop(uc);
> > 
> > Apologies in advance if this question is basic or wrong,
> > 
> > I was checking the suspend path and i see uc_stop being called before
> > submit_stop.
> > Any reason why this is not done here?
> > 
> > What if an execqueue is already in the process of getting destroyed and is
> > waiting on g2h.
> > Shouldn't we stop ct before the stopping and killing exec queues?
> 
> My understanding was to teardown the queues before fiddling with guc ct,
> as any outstanding messages would create a splat. But I fully agree that
> destroy wq needs to be drained. Thanks for catching this.
> 
> That said, I may have missed a few things here so this can definitely
> use some guidance.

This all is a bit of a mess but the flow is:

1. xe_guc_reset_prepare -> this will abort all CT waiters
2. Stop all CT and drain GH
3. Stop all queues and cleanup any missing G2H state

The later two steps are done in xe_uc_stop() in the right order.

We probably have a few races here as this written early in Xe and copied
a bunch of things from the i915 but as is, the code in this series looks
correct.

Matt

> 
> Raag
> 
> > > +	xe_uc_sanitize(uc);
> > > +}
> > > +
> > > +/**
> > > + * xe_uc_flr_prepare() - Prepare uCs for FLR
> > > + * @uc: The uC object
> > > + *
> > > + * Tear down pending work and stop all uCs.
> > > + */
> > > +void xe_uc_flr_prepare(struct xe_uc *uc)
> > > +{
> > > +	struct xe_uc_flr flr = { .uc = uc };
> > > +	struct xe_gt *gt = uc_to_gt(uc);
> > > +
> > > +	/*
> > > +	 * We'll be tearing down exec queues which signals all fences and frees the
> > > +	 * jobs but all of that happens asynchronously, so make sure we don't disrupt
> > > +	 * the scheduler while jobs are still in-flight.
> > > +	 */
> > > +	INIT_WORK_ONSTACK(&flr.work, uc_flr_prepare);
> > > +	queue_work(gt->ordered_wq, &flr.work);
> > > +	flush_work(&flr.work);
> > > +	destroy_work_on_stack(&flr.work);
> > > +
> > > +	INIT_WORK_ONSTACK(&flr.work, uc_flr_sanitize);
> > > +	queue_work(gt->ordered_wq, &flr.work);
> > > +	flush_work(&flr.work);
> > > +	destroy_work_on_stack(&flr.work);
> > > +}
> > > +
> > > +/**
> > > + * xe_uc_reinit() - Re-initialize uCs after FLR
> > > + * @uc: The uC object
> > > + *
> > > + * Returns: 0 on success, negative error code otherwise.
> > > + */
> > > +int xe_uc_reinit(struct xe_uc *uc)
> > > +{
> > > +	int ret;
> > > +
> > > +	ret = xe_guc_reinit(&uc->guc);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = xe_huc_reinit(&uc->huc);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	return xe_gsc_reinit(&uc->gsc);
> > > +}
> > > +
> > >   void xe_uc_suspend_prepare(struct xe_uc *uc)
> > >   {
> > >   	xe_gsc_wait_for_worker_completion(&uc->gsc);
> > > diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> > > index 255a54a8f876..e06f7937111f 100644
> > > --- a/drivers/gpu/drm/xe/xe_uc.h
> > > +++ b/drivers/gpu/drm/xe/xe_uc.h
> > > @@ -8,10 +8,12 @@
> > >   struct xe_uc;
> > > +void xe_uc_flr_prepare(struct xe_uc *uc);
> > >   int xe_uc_init_noalloc(struct xe_uc *uc);
> > >   int xe_uc_init(struct xe_uc *uc);
> > >   int xe_uc_init_post_hwconfig(struct xe_uc *uc);
> > >   int xe_uc_load_hw(struct xe_uc *uc);
> > > +int xe_uc_reinit(struct xe_uc *uc);
> > >   int xe_uc_reset_prepare(struct xe_uc *uc);
> > >   void xe_uc_runtime_resume(struct xe_uc *uc);
> > >   void xe_uc_runtime_suspend(struct xe_uc *uc);
> > > diff --git a/drivers/gpu/drm/xe/xe_uc_types.h b/drivers/gpu/drm/xe/xe_uc_types.h
> > > index 1708379dc834..2b47382f7b3b 100644
> > > --- a/drivers/gpu/drm/xe/xe_uc_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_uc_types.h
> > > @@ -25,4 +25,18 @@ struct xe_uc {
> > >   	struct xe_wopcm wopcm;
> > >   };
> > > +/**
> > > + * struct xe_uc_flr - uC FLR teardown
> > > + */
> > > +struct xe_uc_flr {
> > > +	/** @uc: uC to schedule FLR worker on */
> > > +	struct xe_uc *uc;
> > > +
> > > +	/**
> > > +	 * @work: worker for FLR teardown to be done async allowing to safely
> > > +	 * flush all code paths
> > > +	 */
> > > +	struct work_struct work;
> > > +};
> > > +
> > >   #endif
