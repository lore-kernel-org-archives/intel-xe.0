Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F5CC83F09
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 21:24:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C645A10E02C;
	Wed,  9 Jul 2025 21:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="McDF21UF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1491410E02C
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 21:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752096249; x=1783632249;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XlSCHdyF3/LdYqprjYwK8jO3rtCrWHKit24X/DWXK3w=;
 b=McDF21UF4EgtaAd0iziILyZ1BMF0uoFhOoBSZRi4xdv0K5D0RmiyUaYm
 99SgEM61qQZhoZofoDUZFF/jHb/5MEhCCXGYeuEIxOnLCRW7+Pz3JiP2y
 pmrYgMITQucgQogH/sPMeSrBKzQ5eXQJFP1s0D7N6bkNGpzqiCF3URUoR
 CIuf5uWP9a/BrBHx5TU805XsjYZ83fWHY5lLLVF7aZRH9qMYnMNvf2db3
 f8EbW+EGhJIITAN+D114+G3XmIbvJQ13pLjV4UpukcGTJ/asszdmZmExj
 4xeuy4Eodyd6pPzL3sEf79BXUpgg/WaF4B2L8yWElREJgonmzz0ZmG8E8 A==;
X-CSE-ConnectionGUID: QauTiyC2Q/yvmtpsIO6nhw==
X-CSE-MsgGUID: fX88uv/BRNi2egMNCVPM3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="65428556"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="65428556"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 14:24:08 -0700
X-CSE-ConnectionGUID: QXfm4RySTTK31Ug0Vat0SA==
X-CSE-MsgGUID: 58IpnNwOQ8aaoXaeayRJlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="179582733"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 14:24:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 14:24:06 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 14:24:06 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.81)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 14:24:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QXKr97PNNvVd3W+1u9w6Dgl1Js9T9G4W0aLNFQz1WyQn34RcrJ+25faUEyyVNNFU2nRYjXAntwjxNctx9vS+/eS4uU3wI7dotDjEhc5EIeK+B6gWgqCN/NxUy3xr87wejl/Z48jwce7lluXkm/tBrhyfnre8UyFJQyVv6D3qUebzsvzSlBmIaUlpRAIMFc3HAyNu+NA4VSu2V+16zi/XhFe1ybDARohaWuSJVvPiXlCKaozvtwwLJefiuYmuXhQSqulqnzLCz1+zESfvsPoEryNQEWZpBFyxe0sEz871SkLllUlf6DFLcJPA+Cr637SSfvhsAUQg9G/nRLkjuqguZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZbXzIvLyNs/ykrV3HG2gSNihNppAovoexzf2qIbjt0=;
 b=egxD3JAf7pgKTivIBSwThIfQH6eepXov8oM2Df7dyvLqpkHFJdgFDn7YuOoy/aoW/lt7mAAFMqtRF6PPsYuYLTauzSuvHYyDswS/Rt2ye2VLCTsUryx9DpGeUToIe/VeywyKezUBvI++T5luu9fuPPKeK/FYso0fCfsuKQjH88bUhDW26u1hzNOPP8sKsJw2hgrsQ8smMIQtrLTEEunGE6GGEnOStKVtkHm+EIcvNNVUVdFVAQS1DzByBzADsVQEu890u5lGKDcLaaoo5Sk6quj+7/XaQEkUlBa4pKd4mY6PS1MiDOnPpnF87KHJ+HTtAHeNsay/46MVXdT0tN+J6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW6PR11MB8310.namprd11.prod.outlook.com (2603:10b6:303:249::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Wed, 9 Jul
 2025 21:24:04 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Wed, 9 Jul 2025
 21:24:04 +0000
Date: Wed, 9 Jul 2025 16:24:00 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "tvrtko.ursulin@igalia.com"
 <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH 5/7] drm/xe/lrc: Remove leftover TODO
Message-ID: <wxagvld5vyqf7sb2h6l3kee7b4uvgrvb7hclw4rpy2idqmreif@4csjak43m3hk>
References: <20250703-lrc-refactors-v1-0-6aa22f174041@intel.com>
 <20250703-lrc-refactors-v1-5-6aa22f174041@intel.com>
 <8e4710aa4b3d241c27f01661ae2a2cb862367cbb.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e4710aa4b3d241c27f01661ae2a2cb862367cbb.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0189.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW6PR11MB8310:EE_
X-MS-Office365-Filtering-Correlation-Id: f6026463-ec2c-4f4c-9006-08ddbf2eee06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?BnvuUrncvrqeymmepKRSJ/cFuE8TkKrti3PM/Pcp3kks1P1POhIARMDJfG?=
 =?iso-8859-1?Q?6gFLe4Oh6PdM0aN+MDCDHus5D+RGuTsoO2a5bsnrFx+bhXDNp99KkpaEbr?=
 =?iso-8859-1?Q?VAbvwn+31NEjVLgoHT5fGa8UhDZAa2LkPa0EUQpE54Tf4TnZFNHYwwGm3t?=
 =?iso-8859-1?Q?S2t7vHmePUskrQF9AiA/GsP6ivWIj+UzEUUQAylA9qeyDt/3bBPB51tyBx?=
 =?iso-8859-1?Q?W9WnFNuCAzYLPGPeJmzC2I6GVGi0y5litPN4R79i+dV6z/zlKr6dMc2tPX?=
 =?iso-8859-1?Q?HFiXMFFB7WkWwYz7KHACoHuGKGWwGWfmgoLgPAH2EYTebXyTWVUznFwEP+?=
 =?iso-8859-1?Q?WpzffD4oQZQWnHNAF4f3nMY9XuM4bE9/L/NCKx3SrT49GW3EFhoaRgvBpn?=
 =?iso-8859-1?Q?zagsWTEQfUWm0YWAK+cGUcWqoDZgucjZZpDw+kGhgSWJ9VZ6YCUk47z80L?=
 =?iso-8859-1?Q?6eFN0+n3RJ4FxSJp2bJB6+DxMysQvo6gg4eK+aE5YGcH0+A3CtV8Riyxiu?=
 =?iso-8859-1?Q?TJj0xF/G//leopHUX62Zg0XrS2gwpep8PY8om26nrSojMHQyQ8SEst2VJM?=
 =?iso-8859-1?Q?6Hl87eGRw9Y/JN6JGDFNwNX6zp1XbPYovfxjyeGceakEiTDcXVXSWCPvf8?=
 =?iso-8859-1?Q?i2zvpN9qytJmhsze8T8TiIqTNFrstE4rNa6WClz5bPpI+3W4Ps+ss5uC/+?=
 =?iso-8859-1?Q?wnqp2CciFtytMdq2All1+mRdwunIRDzIfkJou3yuCTSlimLSchg8Pr0992?=
 =?iso-8859-1?Q?7JkzfWsTmYs1cYleHhlddGPP/gEIjWUf4Ou1MD/MgGw2nbp6YBVKtfW0n+?=
 =?iso-8859-1?Q?J58Ul2lHKxcXUxDtje6LZNfqWC0w0sxrIZ053E5zEwKHopt0viIlgaGQxZ?=
 =?iso-8859-1?Q?z52p06gu9s7AxV8Ze03timJyJVw/eILbcQ/Wl1rOkhRW4sb6grKxbE8ond?=
 =?iso-8859-1?Q?tEXf7nXz+//SbVngWWLIevPIQr946WWGtwbDzDUlzggTprKdSZVF7GxhMC?=
 =?iso-8859-1?Q?bpErotYQ0mI7gLhCo1JN7Ktq8U+1i22+mCA1E8YEq2eLomIRdWaNmBgO/l?=
 =?iso-8859-1?Q?Y4Opv+o+AQMZjc5AH7sdZe71YrgNfrghyAmMTeptuUxsob7xY7xAigntnM?=
 =?iso-8859-1?Q?OSrqOfJvRR4iSz4NoWiosq+HmWZHf45JoayK+ZCwzDaXkAXf3X0JSuQINc?=
 =?iso-8859-1?Q?vfjZ9Kua6ejEOvQSCFNNG3zkV6UUemNGvyRqru+YW63Zn0FKXz/OsBxTFX?=
 =?iso-8859-1?Q?Q1Md47+C2b2XE53SzmR02XJJvMwMYCVLoZvj3EvNDdW16xcE/phxtRlsuA?=
 =?iso-8859-1?Q?N2tvwqj77CzSTUWS+D9ZgIUKeaabpYOrzzY471s7mzben7KH4qaULSKg8Y?=
 =?iso-8859-1?Q?ECrbuXgZ43CJ7gfWlRksHOc22efXbSM9m+1+sX3VrFWbRQ3Dtebv8XOMQN?=
 =?iso-8859-1?Q?8VZom5bdbzyopFaEvzuhhNwhShjpbBUIV6q67cJk5O9f0C8zLynX7iN4l1?=
 =?iso-8859-1?Q?0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?dGjr0q/RgBJC5ZwqIyz3fZJGZbDoEngspzDabCw8qeqcAXbEXyOHCJHI7E?=
 =?iso-8859-1?Q?8i0oG6sNxcKvArW2IbESYhQsWo5o7YqYVnOMhV9RyAPYYrqAjNLy1ieQof?=
 =?iso-8859-1?Q?3pHrEbKpUHaBcywpdh7iPgBw7ZgZtZdFB5ZOR891TNqW8iZZwfzovXYbnW?=
 =?iso-8859-1?Q?ur83qTsopQNpbexWN87gsPag3Ne4BC5d4Si8fxOIRh6aWd+yfOl5hSicwa?=
 =?iso-8859-1?Q?0g3g5LvvZwfSFRarux5X/ZoFf/c+I1D73odxx/UNI5UlORCXZqQCsmoXyF?=
 =?iso-8859-1?Q?AJAOty9r6OTAJ92dJCrJ4Uv7jMrjRK8fbLgrssXwx3VJcF4y2qa7DZBgMO?=
 =?iso-8859-1?Q?GpziO8Qp1qberZeyssSqyvUiE0llBLLDmBgJ8A+ZL1VQNX2QCUui4XqqYg?=
 =?iso-8859-1?Q?tvZDrvewAnr9MkcQaAyax6qYmQsiWD4EUL15yuYiCqXzupr99fa9FB3Y7z?=
 =?iso-8859-1?Q?ejQB9JuJ9Vkz+Wu6lktYYdJ/9jMNl+gq3eQs0E2RYtiSRtYrjpffQ8LGUO?=
 =?iso-8859-1?Q?Yq1cyhj1nDIOlNoVgaMDOOdgqrv8qW/UKjTldNfqz2U0kwsGnaIMQ4JUkq?=
 =?iso-8859-1?Q?ijwjmr1ZtnGPBU4b9xkz2bQwXIU9FKeat7eNFJhLDbkTM7KLU+6v7wYJQU?=
 =?iso-8859-1?Q?06nn+3Iu9zom/YJI0yyErWyk9z9J6rfbBqFMsl+xi/my7gmccK9O+TSUxY?=
 =?iso-8859-1?Q?dR0PqH2WvdrFcU5oBo9mH9RGreELCbSIywEdtzolY16g5RIQhOOvtsLX/+?=
 =?iso-8859-1?Q?ccgU/G5tRf3vaZAO+J80GcSD5Su245oOn9uNPqxybzIN1IitpeWOjJPLVY?=
 =?iso-8859-1?Q?+/c9L5oXTHum6pDF96hHr/MBG+XTNPK6VOgwW/BpCGy7pkjPJXGSnlDLZV?=
 =?iso-8859-1?Q?VG4QpC8mSHH/cxzogUFoE/EUB3GsI41gqbyUf2j7RekOVp7FCLQt6jsUu/?=
 =?iso-8859-1?Q?m0PA0am8q4Xfn6vLQImRKhuDxQdSYw9VM3XYMCDTxOwpmRR/v16hmHdVC0?=
 =?iso-8859-1?Q?9MKiRnmAZu3MtwpSqSvRs4LNmP0EfWt9jF5axr7ytQhuiNzi166BKm5iP4?=
 =?iso-8859-1?Q?k1DPIx+PQOkKRPaz6Npl5pP1ZIMg8wxyE0K4n69EMQhp3tq2BoablDi/ca?=
 =?iso-8859-1?Q?yo3Lh+DVATi1UOz+iYr0/LyoFovjKeKXonpFTCOyMC/5oU35BsBfG1Rt4A?=
 =?iso-8859-1?Q?Rkq//1f31GWVx2kdSR5A1/7Q92oZo5Xl7BI/+VMqPF99RNmJP0T20plP0P?=
 =?iso-8859-1?Q?cpZp+G4h4dXzKYvP1ZrDd9sWx5M0XgKOvAeNCSlrp0QaWjomjkEHZHc+dQ?=
 =?iso-8859-1?Q?+lBmRBiLE3WM4rHKC/79bnHNRkl6+zDeUC6OL+GDglmNDvCjn1RDcPoGDF?=
 =?iso-8859-1?Q?t+hDxiL4JneSvNliRadbgwihoHEX9z/Du0iMlSe1ENb4vRo3FZaYsM5Akz?=
 =?iso-8859-1?Q?qIliHjEM8Og/f+LPtTmWnO5RlIdXwfHcvmI1mXqco6Q8hCCwMEwU5lLO0z?=
 =?iso-8859-1?Q?zLcbGnxQIXmj9BTiqZBcRF930BUwehC5tMusJtrgCaJQVwPPZu0/q8J6mA?=
 =?iso-8859-1?Q?iDBxg4yJBOHaJ/UrKYzoljybLyC16T/OcbE1XA4G9ESJoJAFeTVarOppiS?=
 =?iso-8859-1?Q?VMCpX7NC2Y0NKPgTszybLRYf+cYZu/4Mz/lJl61t68CkTrOksrZwSBfQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6026463-ec2c-4f4c-9006-08ddbf2eee06
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 21:24:04.0893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f2gP82mvri+pGtSrHzxcEEa763c/wxZSfDQn4DA9f0Gjg8Mlrwy46JFj+MAJr68/fsJo1Zngd8BzI4rDAZMZD9UbbntyjSPvcTLZlTY29OY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8310
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

On Wed, Jul 09, 2025 at 07:37:02PM +0000, Stuart Summers wrote:
>On Thu, 2025-07-03 at 15:41 -0700, Lucas De Marchi wrote:
>> There isn't anything to set for CTX_TIMESTAMP handling in the empty
>> LRC, that is set on every LRC init since it should always start from
>> 0
>> rather than the value saved in the image after first submission.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_lrc.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c
>> b/drivers/gpu/drm/xe/xe_lrc.c
>> index 75f4678cb090a..2c735b3679f86 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -603,8 +603,6 @@ static void set_context_control(u32 *regs, struct
>> xe_hw_engine *hwe)
>>         if (xe_gt_has_indirect_ring_state(hwe->gt))
>>                 regs[CTX_CONTEXT_CONTROL] |=
>>                         _MASKED_BIT_ENABLE(CTX_CTRL_INDIRECT_RING_STA
>> TE_ENABLE);
>> -
>> -       /* TODO: Timestamp */
>
>Seems interesting to add your commit comment here instead of the TODO
>unless we're already documenting that somewhere else.

It seems counter productive to add a comment in a random place about
things that are done elsewhere. If this was "the normal place to do it,
but handled elsewhere", ok. But this is not and it's still here because
it went unnoticed when the timestamp handling was added.

Lucas De Marchi
