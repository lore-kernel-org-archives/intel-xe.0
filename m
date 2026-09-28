Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E64CA5FA2
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 19:20:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 628FE10EBA9;
	Mon, 28 Sep 2026 19:20:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LXtR71HW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88FEF10EBA9
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 19:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790623258; x=1822159258;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=e0Zck+duVNqoDiiOFQbdEAJ7aMuC489beQ9qY3nLme8=;
 b=LXtR71HWcpLY94aYkjxIUPapZuAlphN1C5aDLZ1TQ+npq1wuljF5IQzX
 xHOkaGCfVQIySl317zxhCpIo17hOSMMnBo0/T+4IMlnpqAXzrueOWAwbM
 MrnjSUhNQ8IBXd1M+KoAdEK+mRgNLsDXX3G+C5segM1wLMwvhERoK/Pqb
 PSdtl6D0adlP/4jU6WmKD1mriL7afIBgG/tDlIrnAIwgibTdSaMh9atN6
 ylpyaEaAAxsSO4GojK2AkTi42WirLz/sVrk301+xiktsGb2LhrUccSv9r
 CPKv8PRR2Il81bAjVFT0WW71MXcLf6tRhsEjVvpy8Cghp3YOClmMmzYhc g==;
X-CSE-ConnectionGUID: OX+idkHBReCNEP0ugGT39Q==
X-CSE-MsgGUID: 4H22NTasSIyTxsAe0HEajw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90386542"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; d="scan'208";a="90386542"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 12:20:58 -0700
X-CSE-ConnectionGUID: semmODCHTqq4sv0UKlI6Ng==
X-CSE-MsgGUID: UFvRkBjPR3eLzadBr8ufHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; d="scan'208";a="274351790"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 12:20:57 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 12:20:56 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 12:20:56 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.51)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 12:20:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x4JDeb3f150ROJXmJ5iazwR0rBeZPvBliCxGZu06xF8a+buRh3fX9w+QJ9I7HR/97R5AQb5rKZV6y4gZZlYpylrgKIwzGzHFjzAD86P7S6f7yyYgwwVNF4ny3rcDzDQZvhyIadmzgbzrFqscNvvZPlnN49duC6fZOQnL+rfIf/PZV73w2SKW/ekv0CG84pNaaC+iYe4ocOI+stHeLHPKuOxyYplGQUnhQ6nyZo2ZC2oQP26rKqgULCMJU+/KD4i+xKFyG5eNYmUpgEksXzzfOUr7tK/bWUSi+/CSHBYXJqbJF0DGYqZob07azKWpuNHeqSiwAOGGvqbYbCHWLkMfoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Apt4pATO+v7PL9qwuMRWeSLgM2oJyRrgjbD9HSA6h9Q=;
 b=hkeJOwO1mbTHqsO7FXgTH6bgA06d/KfGBt4EsNw0b5Bbx5bDYjfe88ImLueCnCnn/98yCuU6zTRPfM0EySTGGPeyi6xaPYKGBnKO7ynOTz6dDuZvavDmuGtVJ+P/RpGPL1EqT80liP2AsGSP/Hq+NdvBJhxxwM0/CxvR65/mQF6RILF7sSzCX6nFbdCCNPzWPHb12rg8GNFHGG+qAIgb44XSldlZl+2hiB4zwENBxbwurP1F/1x9Mafs/3PTQScB0tcZfOFBeB85qn9WeooY6mPdpWv/dv9eKzaNTiel97vljV5acV9/xJk9iVVZoSYl+HNRCssrsbETsS8wIz9G4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by CH3PR11MB7251.namprd11.prod.outlook.com (2603:10b6:610:147::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 19:20:51 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 19:20:51 +0000
Date: Mon, 28 Sep 2026 15:20:37 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Nerlige
 Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Sousa, Gustavo"
 <gustavo.sousa@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>
Subject: Re: [PATCH 00/16] Add new debug infrastructure for configfs
Message-ID: <arq-BaxllEIUtpSH@intel.com>
References: <20260924230120.389685-18-stuart.summers@intel.com>
 <arngX+7ix5t4ccil@gsse-cloud1.jf.intel.com>
 <68ded8dfcc0dfdc9fbef51e343c751924194672d.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <68ded8dfcc0dfdc9fbef51e343c751924194672d.camel@intel.com>
X-ClientProxiedBy: SI1PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::19) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|CH3PR11MB7251:EE_
X-MS-Office365-Filtering-Correlation-Id: b28b97e7-15cb-47cf-458b-08df1d959b46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|10067099003|11063799006|3023799007|56012099006|6133799003|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: +BSzKMO78flxp2u8qaJZNPdqbSDrOMDWe84KeScd5BGvzuKOIE/sGU9s0omu9kDPf7nejhWqNVg/eHGHNqMLEUga62Nak3dpwbLTUa32KaL1hqNq8C7HfP5q1GNGT6o06aQV/9NHYF6O+ebHgA+NtGyyfZ/ikKKlPGQZeiLCekDOX6A6mseS9bi5h9J3RGggzbhkOAnyshgbdoHFM01Rd7ALPfCUZFXJOyyGH7XO+HHbUTppADFC8n2ssv/6l36ITbwwDk1UlZR8vDxwYxgc5L9xibXiwTD5fSLRodCMnApNg5iEtwWKFGuctZ70nNO3EWHYG40QJt3TkAXqWnlt3Ht0cynvvHgdyRV2rghnMGUpLgbUCN2gGWZm7cD6ZVikvAQCFlyb43k/Cnaya+PnegtR2He9JGOCnTprASz29HBCGwgbuKemipT6Q3Yk01l6S3kUhNMT2UXX1+2hrdoPuAc5wH2I44zkKREDS6SR9h8rpoT+L706yjaUu4FNXhGSRLFQ/MgJg13rJhukAaMVR5N2gPSC8xuXmezK2AXJXJyy3oMYV9MrR7u12re2aRs03HOFiFpiUkmks5e820DMGvlx3BtFM3fU543pvyT5LtQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(11063799006)(3023799007)(56012099006)(6133799003)(18002099003)(22082099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?C9Z6kPZ29jqAhew0MCcPyDNdP4xVPRP+/jqzZQxQYFN9s76C14k6NAYpW9?=
 =?iso-8859-1?Q?vKS+XzIT4WZteOcCbbc8q1XvnLt8ou7Fuwqyn92/Msqg2hRBm4Xd5zmURT?=
 =?iso-8859-1?Q?CIKywD1c/m84yi4/PcNtA6+Hsi6bYYlath7EZ7x1m9ZIVrKQrcbhOhNc8z?=
 =?iso-8859-1?Q?iLz8qERR9Glqv82X5rcv6wdeoAkl1plENjdg/uaE17Vw/e9bFULd+6u862?=
 =?iso-8859-1?Q?0oLg1MihosV8jyieLSgvNzw/omm/YxfzkbgVQpyTdH2MGu6iuqPrDuAGiz?=
 =?iso-8859-1?Q?Tnw8LgnB9XQcV0Ph8lIHw5pJAZSeqRhB9XMyyCDvBcZt3yrxenFfLi5So8?=
 =?iso-8859-1?Q?BLfA9ie/q0BVrFxadrcbuOK/mMLfJqUNOaYURmrbbyojhoY2IaFOxFgpHF?=
 =?iso-8859-1?Q?M/dKL+v1bX45sGCuIIH/+7D4nAZNxLTxT5Qrn33DMQuNC4NRiwZ8kkK39S?=
 =?iso-8859-1?Q?hyVbGvjS6cufa/bJuEefvny2ur6cPUnlOpKpTjSNsNJJyIETHEtuesglA/?=
 =?iso-8859-1?Q?NsQmG5WA4XcZWWSc9fjmE56U3CSb2sToFPQt6dWamiB8XvS1DHMDGGv/xl?=
 =?iso-8859-1?Q?Fj5i447SqgFfDTaOyaKhBj/KToAiHYLWLrX1pucFJNy2bYrqrxOaIugpZc?=
 =?iso-8859-1?Q?/UnG7rZ9dktwsMGhUd/q9xiZ+PMJCG8Y4PAMn3xYyy3aYrUxVuUuu2qPRD?=
 =?iso-8859-1?Q?z8ENTYrIUSOoWrnuDb3siCcds72f8EhLnJxsXZnhVWe+CLLPLqlftVgj/t?=
 =?iso-8859-1?Q?V6v1IKiNSpzNPZNrlwzb3OEyRXK/UQcBPLiUf4XZUBV4v5vpBiY9IfN0bD?=
 =?iso-8859-1?Q?R5lhPfbOA7uN0rUnNt+dCFGd6i1Vm7McUCp4bHKv46lPoRcugpWVQIwKvm?=
 =?iso-8859-1?Q?CriB20rTbZe45EUhb/aEKdapjCKG0TBjz/m71t7iJ59YZoRYvJQ1Tmp0Cn?=
 =?iso-8859-1?Q?gwYH69baZztncWy5HhaRdU0HV/JfZI4khtWM4vkyRP7Etom4NQ7F4H44Sm?=
 =?iso-8859-1?Q?fkZ/RQ5ZZaLOB3h5EYkNMjYnDK0gaJw/+hwreSl8RYmpgrvUz8GYb6J3nq?=
 =?iso-8859-1?Q?xNngnjVxqJmomgjUwUiYD2W1+FDwwAJIqQZgfPWcaKCDjhN+5CHBNU52Fj?=
 =?iso-8859-1?Q?B6eaHACK+WjyVwjH3ZlgRN90lrpOCRwh4AOJoPTqzqriONt+b3wcmmtOos?=
 =?iso-8859-1?Q?Eo0ruIpJIcQOq5ZoKUpOloQE/TbV3bI5x7upSXYbcBuupIxojhdl31rOIe?=
 =?iso-8859-1?Q?17Ia/TgyUcouD1oEuRaMfJk2Qj/wrlQyl9EnhTcZH8shASCxgUo2MvXNLy?=
 =?iso-8859-1?Q?e/bgfhem3FdFfOlOxkww2DwuSjQ4kYlroFeWntKxhsnjwll1hNbL2+Zqab?=
 =?iso-8859-1?Q?pLwTL3Y9S5ce5LXPgpSqbQpLBzxG/ZVP3jzERrN968LIa23U1QXhiewXFG?=
 =?iso-8859-1?Q?FSgXiOoJcbJDejZz2vjOd5RspxWYXC6EcaF56kAkCk4TB8Q6pnMkuLeEo5?=
 =?iso-8859-1?Q?R4yybJP7hdFiNxmPDaCpWUB2uIVQ1I9CzhGAapDSDQAdgzv7WVlKVeLWQ6?=
 =?iso-8859-1?Q?OD+Z1AfDo3uSz2W85eX+sJemmRtZbE9k2et3vsVyHaBag5jgukZnocm9SO?=
 =?iso-8859-1?Q?MnrGXNwNiIRkR3zg0NHHboKdFUvJbQfFlNIeuUZ7ugfQqtVibk/JNJdls3?=
 =?iso-8859-1?Q?/yzLPxYVawxeQn/VETMP1JZuAMJ0Qrf5t7I8GqHBttx3bg6J/V/vz5QRCT?=
 =?iso-8859-1?Q?TDtP8P66raSemBeOAPf+lw0Nwe8ETFEXbh7lvjtsHzSpWm7L/B1AMg68Vm?=
 =?iso-8859-1?Q?x6UqPdOxE8rNN53YwPTlsBLW0AHY5cg=3D?=
X-Exchange-RoutingPolicyChecked: 4DS5QldGXjVX0qsAnJUGqdl2DBdJGikF4sC7kVuM/wPotDfOmx3GpL4KO9sU4Kcnkcbt5ZcvslBa3d9xFUdJRSWVctz4ghIrII3TMrGVRlbubqLlW1HVYQ6ZomkcHKsCazwNUSEghcoZanl/aikfQ0h6DXsXUCko2UD34MRCZEGexBqZyvOxHbPNBJ3FsxC67+ws7t18D6BVP0YwrqzijPsYgzGfPb2pudPd9EeBg6sp/pPQ3tO0NzeD8MY6FvaTHdhF5wMnGWFUxcPDLIycPEhAuLBgx4zldmlV4qWCzDsa4z7q8n3FQH1NpMy+LvWNOgoD+0mF1WXWfUgdB2wiag==
X-MS-Exchange-CrossTenant-Network-Message-Id: b28b97e7-15cb-47cf-458b-08df1d959b46
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 19:20:51.0155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xbPjtwbQ+dqPXiP4TdzRRBwj8LW78UyAZD6WqnqCQSe+iegM2nOodnfShJ8fYDKhOHp8X8t3xFAx//+u7QVn8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7251
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

On Mon, Sep 28, 2026 at 01:07:19PM -0400, Summers, Stuart wrote:
> On Sun, 2026-09-27 at 20:34 -0700, Matthew Brost wrote:
> > On Thu, Sep 24, 2026 at 11:01:19PM +0000, Stuart Summers wrote:
> > 
> > Thanks for the work here. I was going to look in depth but
> > immediately
> > have a question.
> > 
> > > Add a new configfs debug group. The intent of this structure is
> > > to allow us to separate ABI facing configfs entries from those
> > > which are purely for debug purposes. And it allows us more
> > > flexibility
> > 
> > Why not use debugfs for debug knobs and keep configfs as a strict
> > ABI? Is
> > the reasoning that everything in configfs is considered a boot-time
> > configuration?
> > 
> > In the past, I've added debug tunables as module parameters that
> > probably should have lived in either configfs or debugfs.
> > 
> > I'm just struggling to understand the distinction here. What really
> > defines a "normal" configfs setting versus a "debug" configfs
> > setting?
> > For example, let's say we have a tuning parameter that a
> > knowledgeable
> > customer may want to adjust. Where should that live?
> > 
> > I'm not opposed to this; I'm just a bit fuzzy on the rules and the
> > reasoning behind them. That said, if we can't get clear rules then
> > I'd
> > say lump everything together.
> 
> Yeah at least from my perspective, module parameters are things that
> apply to all devices on the system at probe time (yes we can change
> some of these at runtime, but typically they are probe-time
> parameters).
> 
> debugfs is used for either information reporting or for runtime
> configuration for debug purposes (vs sysfs for runtime configuration
> for "production" purposes - ABI)
> 
> configfs is used for probe-time configurations that need to be per
> device.
> 
> I know in i915 we had overloaded the modparams with a debugfs layer
> that looks a like what I have here for the X-params. At least when we
> were discussing for Xe, we wanted to move more towards configfs for
> these kinds of parameters.
> 
> I just want a way to be able to quickly and easily add new parameters
> upstream that are needed for low level software/hardware debug with a
> clear way to implement those. If we want to go the debugfs route, I'm
> sure we can make that work too, but I want it to be really clear where
> that should live. We do already have things like enable_psmi and
> enable_multi_queue here that are doing exactly this - probe time, per-
> device parameters.
> 
> In terms of how we define what is production and what is debug... I
> think that's going to be a case-by-case basis. Essentially what I was
> thinking is a production parameter is something a customer will be
> using as part of a "normal" runtime flow (like firmware update for
> survivability_mode). Whereas a debug parameter is something we don't
> want a customer to use without explicitly understanding what they are
> doing - they are wrapped in a debug kconfig and have explicit
> documentation. One example we don't have here now but could add in the
> future is something like the enable_rc6 where we really don't want
> customers to be setting this unless they are trying to debug something
> with us - it would at least take a kernel rebuild from what is provided
> in the distros.
> 
> I'm open to discussion. I just want to make sure we have a clear
> process here so we can facilitate the parameters we need for debug.

I agree with Stuart here. It is case by case and I don't believe we need
written hard rules here.
We should have easy ways to add debug stuff.
If it is runtime: debugfs
If it is needed at probe time: configfs protected by debug config
Module parameter should be really avoided for these debugs.

For production:
Runtime: It depends on the case: sysfs, ioctl, fwctl, netlink, io_uring, ...
Probe time: Configfs
Boot time and homogeneous across all devices: Module Parameter

But again, production like these only if really needed and understanding the
validation impacts: http://www.islinuxaboutchoice.com/

Thanks,
Rodrigo.

> 
> Thanks,
> Stuart
> 
> > 
> > Matt
> > 
> > > in how we define those parameters used for debug.
> > > 
> > > Add a new infrastructure to this debug configfs group that lets us
> > > easily define the parameters in a quick list. This is primarily
> > > useful for simple, single-type parameters such as enable/disable
> > > features or simple values passed. For more complex parameters,
> > > we will still need to define these separately.
> > > 
> > > Pull the GuC target related changes from [1] to fit within
> > > this new structure and add a new definition for guc_log_level
> > > on top of the existing module parameter (to ensure we aren't
> > > impacting existing users of the module parameter).
> > > 
> > > Note that the debug parameters here are all to be used "at your
> > > own risk". Without having in depth knowledge of how these impact
> > > the software and hardware, there could be unforeseen consequences
> > > of setting them. As such, they are all wrapped in a
> > > CONFIG_DRM_XE_DEBUG configfs option.
> > > 
> > > In terms of the patches here, I'm sorting the existing parameters
> > > by name/type. I know we have a few other module parameters that
> > > could migrate here, but I didn't want to overload this series
> > > too much, so the focus for now is on the existing configfs entries
> > > and demonstrating the new structures with the GuC log level and
> > > target parameters.
> > > 
> > > I used GitHub Copilot with Claude pretty extensively through the
> > > process here and attributed as such. Happy to answer any questions
> > > around this. Took a bit of time getting back to this series around
> > > other work, and in that time I was playing around with a few
> > > different
> > > models, hence some of the patches are showing multiple of them. I
> > > tried to attribute each as I was implementing the changes.
> > > 
> > > I also decided to drop John Harrison from the NPK patch. It has
> > > been modified quite a bit from the original, but more importantly
> > > John is no longer with Intel and that email address isn't available
> > > any more. If it makes a difference here, John and I had both
> > > separately
> > > implemented this same change at different occasions for debug. The
> > > one I used to start that initial series was cherry-picked from his
> > > latest variant.
> > > 
> > > v2:
> > >  - In this second revision I did confirm that the guc_log_level
> > >    module parameter is taking precedence over the configfs
> > > parameter
> > >    and ensured the other parameters seem to be autogenerating and
> > >    working as expected.
> > >  - I tried to address all the review feedback from the first
> > >    revision, [2].
> > >  - I also did another pass on the sorting since there were a few
> > >    discrepancies I noticed in the first revision. I kept Gustavo's
> > >    R-B on that one, but would like an ack before merging at least
> > >    to confirm the patch is sane.
> > >  - And finally I moved the getter functions into the X-macro
> > >    generators so we can autogenerate more of the similar functions
> > >    between the different parameters in that debug param list.
> > > v3:
> > >  - Address a couple of comments from Sashiko around GuC log level
> > >    input checking and proper guard implementation.
> > > v4:
> > >  - More review feedback from Sashiko addressed...
> > > v5:
> > >  - Move the goto to a return (more Sashiko feedback) in the GuC
> > >    log level setter before moving to the X-macro solution.
> > > v6:
> > >  - Make the autogenerated X-macro function names more specific to
> > >    avoid naming collisions (Sashiko again).
> > > v7:
> > >  - Fix the couple of pre-existing bugs called out by Sashiko in
> > >    the prior rev...
> > >  - Make CONFIGFS_FS a required config for xe to avoid issues with
> > >    stale values in the fallback getters.
> > >  - Renamed disable_vram_page_offline to enable_vram_page_offline
> > >    for a more consistent naming scheme (this was a new configfs
> > >    entry added since the prior rev).
> > >  - Converted survivability_mode to a u8 bitmap to allow for
> > >    extendability in the future. Only bit 0 is defined, so the
> > > behavior
> > >    should be the same.
> > >  - Added an enable_media module parameter at the end of the series.
> > >    gt_types_allowed is debug-only, so this gives production builds
> > > a
> > >    supported way to leave the media GT alone. The modparam takes
> > >    precedence over configfs.
> > >  - Adjust the sorting to be alphabetical for the documentation
> > >    specifically (Matt)
> > > 
> > > [1]: https://patchwork.freedesktop.org/series/162087/
> > > [2]: https://patchwork.freedesktop.org/series/165879/
> > > 
> > > Stuart Summers (16):
> > >   drm/xe: Guard configfs attribute reads in getters
> > >   drm/xe/configfs: Fix out-of-bounds read in parse_wa_bb_lines()
> > >   drm/xe/configfs: Copy wa_bb out under the configfs lock
> > >   drm/xe: Require CONFIGFS_FS
> > >   drm/xe: Invert vram_page_offline configfs attribute
> > >   drm/xe: Make survivability_mode configfs attribute a bitmap
> > >   drm/xe: Sort xe_config_device fields
> > >   drm/xe: Split out configfs data structures
> > >   drm/xe: Add a new debug focused configfs group
> > >   drm/xe: Move debug configfs entries to xe_configfs_debug.c
> > >   drm/xe/guc: Add configfs support for guc_log_level
> > >   drm/xe/guc: Add support for NPK as a GuC log target
> > >   drm/xe: Add infrastructure for debug configfs parameters
> > >   drm/xe: Migrate existing debug configfs entries to params
> > >     infrastructure
> > >   drm/xe: Taint kernel when debug configfs parameters are set
> > >   drm/xe: Add enable_media module parameter
> > > 
> > >  drivers/gpu/drm/xe/Kconfig                    |    1 +
> > >  drivers/gpu/drm/xe/Makefile                   |    3 +-
> > >  drivers/gpu/drm/xe/abi/guc_log_abi.h          |    8 +
> > >  drivers/gpu/drm/xe/xe_configfs.c              | 1056 ++-----------
> > > ----
> > >  drivers/gpu/drm/xe/xe_configfs.h              |  124 +-
> > >  drivers/gpu/drm/xe/xe_configfs_debug.c        |  899
> > > ++++++++++++++
> > >  drivers/gpu/drm/xe/xe_configfs_debug.h        |   48 +
> > >  drivers/gpu/drm/xe/xe_configfs_debug_params.c |  158 +++
> > >  drivers/gpu/drm/xe/xe_configfs_debug_params.h |  194 +++
> > >  drivers/gpu/drm/xe/xe_configfs_types.h        |   60 +
> > >  drivers/gpu/drm/xe/xe_defaults.h              |    6 +
> > >  drivers/gpu/drm/xe/xe_drm_ras_types.h         |    4 +-
> > >  drivers/gpu/drm/xe/xe_guc.c                   |   14 +-
> > >  drivers/gpu/drm/xe/xe_guc_ads.c               |    1 +
> > >  drivers/gpu/drm/xe/xe_guc_log.c               |    3 +-
> > >  drivers/gpu/drm/xe/xe_hw_engine.c             |    1 +
> > >  drivers/gpu/drm/xe/xe_lrc.c                   |   39 +-
> > >  drivers/gpu/drm/xe/xe_module.c                |    6 +
> > >  drivers/gpu/drm/xe/xe_module.h                |    1 +
> > >  drivers/gpu/drm/xe/xe_pci.c                   |   20 +-
> > >  drivers/gpu/drm/xe/xe_psmi.c                  |    3 +-
> > >  drivers/gpu/drm/xe/xe_ras.c                   |    9 +-
> > >  drivers/gpu/drm/xe/xe_rtp.c                   |    3 +-
> > >  drivers/gpu/drm/xe/xe_survivability_mode.c    |    7 +-
> > >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |    2 +-
> > >  25 files changed, 1615 insertions(+), 1055 deletions(-)
> > >  create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug.c
> > >  create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug.h
> > >  create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug_params.c
> > >  create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug_params.h
> > >  create mode 100644 drivers/gpu/drm/xe/xe_configfs_types.h
> > > 
> > > -- 
> > > 2.43.0
> > > 
> 
