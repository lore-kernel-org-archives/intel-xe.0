Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77AFC3DA5D
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 17:13:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 706E410E262;
	Thu, 25 Jul 2024 17:13:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MoJHfZAb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4964110E07C
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 17:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721927629; x=1753463629;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=W4JT8A6psvdz/U3inzSSLXYdH0syQMLxjUNyRulwwqQ=;
 b=MoJHfZAbITdFDd2sZePta2WIOJH3quvouaN8txoYZaKkLrMu4XwQoSWw
 lZygZx3rjbHQX0pONapBD+hjqTkkeNC0pCqiZ/UEkoeCFDBNxnNL+djsE
 ORXjE1RP/MJ3tVm5QNIXn0j9it6w7L1+eYYP8blCVpFaV410JeYSQ0rIC
 EbCvPVrMzEjCuY6KzFjL9CNlUdXG2QLkMIyjIg13dMfmPFvhLLrtatSxI
 /fjM0yO1pbGFkkxonuJKZASIL+SFFgPvrbmGEF1J/tsXAZ/e5R84vy/On
 Wdi1JFnJsI1jLewC0rOWrZDYE6lGnzcuCk10JoMdaG2eD9eD5Gt9dw8xl A==;
X-CSE-ConnectionGUID: P71tvCSoQV+9Mmq4Lri8yw==
X-CSE-MsgGUID: XIRfYPWwSXKfSeh3J75/Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="31072571"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="31072571"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 10:13:48 -0700
X-CSE-ConnectionGUID: SmzNOksnQiKIFihVucV0Ag==
X-CSE-MsgGUID: pDA9x2+6RGyWwgq3vC8kIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="52922303"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jul 2024 10:13:47 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 25 Jul 2024 10:13:46 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 25 Jul 2024 10:13:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 25 Jul 2024 10:13:46 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 25 Jul 2024 10:13:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lu7Zjr6Wji3uO29Unz7kRNrZj9TSQH1vt5+ZC5Hfy9bqJjN6zRUtqa5Gopzw2+OKSyJZ3BnM/taoRvWxOwbUQYpgRykZM7xQ8LnuCy+2evYwX7o6N7UB4OvVq00m+9jsgSMNTuOFNA5LhCdctX+yR8OtBLAmS+fqA5dRLuSqJ0IxybhKk6S4/h4Vhm7WCFTRaAzlREeDZypPmjkXDR/QvsNqCOSUqEoI6JbUcgwh8x1eeCJz+qlAaua3vHk54vm0iIs6fo0DGA7KNZish6aCMsDqHYQEstEHQ/lpJiMoiPVksIwviE/AuuIPWN3CCqqHwqGRcEQTx2KCMubXE77cpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97psvGcSpqlK5OpGvBsokpuHTwsgrWm9m5XVGjTzNbM=;
 b=NfKrIvxdCa83lrULkGlKwChHmN+uF7en6XWi1VICjtEYE7zleaJ0dRZnFDIqyRWApVMttTLg+K6uP6HjeGDlSH/vsWCD+sBHF8Knb1pwvyylkBndjQgKVvrduYH1rIX4dTTh0ncKsuSZS4P+0rEs4ijQkMSX1PPgkEw4kqi19X5/RxPocr/rVB7h4cAKXYL2be5B5ZadSKvu7dgUV4upS8V5WMrYnENjTgndf6kzAi7IgMtGUzgaKOTRAPVmv/PRHAZopoBd0RJfulqrhLgnYdYRBAj4HfHpTjlOWQlkPfTk+mvrMDily1uZ+hNadEUPtTUG3T4DTJFbV3yEkshypg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SJ0PR11MB4799.namprd11.prod.outlook.com (2603:10b6:a03:2ae::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Thu, 25 Jul
 2024 17:13:43 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7762.024; Thu, 25 Jul 2024
 17:13:43 +0000
Date: Thu, 25 Jul 2024 13:13:41 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Fix opregion leak
Message-ID: <ZqKHxVQFF96uNdfi@intel.com>
References: <20240724215309.644423-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240724215309.644423-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW3PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:303:2b::16) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SJ0PR11MB4799:EE_
X-MS-Office365-Filtering-Correlation-Id: 9db1d166-567c-4cd1-e511-08dcaccd22eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nNfDTg0eq8oRRCPB4IKOkxeeJO2zD2an5OhkiOX4QCwVu8NrVJDbOlHHG91h?=
 =?us-ascii?Q?8mKWaXcER1gsruWuILeU2Cm7RP+c+TyTC225gsvGGMybWaA2g3ZlE1jeDEnm?=
 =?us-ascii?Q?ZyPvRo3yTZWuuHYVKToZ5LVTB15HqNvWUWandh9igW7dLIndu1zAOvQS10ct?=
 =?us-ascii?Q?ta3IIFP4OY2svjY9UeCb/CTJKk56Me++Zlb7rnhOkkfF1khTJxYEJFaB+gNL?=
 =?us-ascii?Q?5vrF8nlXLz3plNHeHtwypVFSjrhX3myAKd8FX9Opoj85wxoLlkmUOVkR8Ikm?=
 =?us-ascii?Q?uMH94rFQqA8RiIVXWMzOPmd4eXq0Di7P9UDNgp4xXDwQ2Dc6s8+3SfvcvLMk?=
 =?us-ascii?Q?SHC8cABAeDqm1LDKMovDHPaPLhbmDAJTBvlPVIjoPOsEcwWGZAHxEY+BsJT+?=
 =?us-ascii?Q?/qOqlKktKwOmOStkkGcEoN9bk76nQy1Z/W1QKIAAMcKvaUvo9Drza251fygg?=
 =?us-ascii?Q?eCNVevt1Ob3/jRgAidD+eiEhSOHAdn6S/FQKakWRrAYY0bXA4tKK7Y9gGIE3?=
 =?us-ascii?Q?bnoGxv3c4FGowfkNR7j6jBtPcZkeZ8izNyCT4J76GsTuj8Saw7NNs4uSRFeF?=
 =?us-ascii?Q?Sa3teQM+Z6XWcTl8/aCwBiUxcBGK+x5IhrZ82kXTCsYd4aeDkKdS59rX/sh1?=
 =?us-ascii?Q?bPJFYobhzickTiHD6GO7AyUEgVDJuZ3uteKSRFS0o23X5xw4evD95gSOGEIN?=
 =?us-ascii?Q?1caTV3mN1i/ntZikhZzHOlrw3mnxRte698y40Hycgt7S9uUu0WrQsEV09rGx?=
 =?us-ascii?Q?/lFa/BXIyKlOQ4UwNJ8wNmIPWDDPLpWP4+8Za7cKBKFbA8L5oenSVcQOaQY9?=
 =?us-ascii?Q?OQLJMl+las7+2iTID/ercfygXX6/STfyIu74rqMzBcZLMJH3gK/D7Wjr91Ib?=
 =?us-ascii?Q?kulTWxtX9Nl3WwlBgmPMIyKp4xLbfS9nrerzvIrVeuDVAIBO9aytQP5hNDw4?=
 =?us-ascii?Q?HH8iInE/rDBpECAhot0IsbMvaraxnW0LdExyYoSEB73DDt9hv2DP+sIaAe+Y?=
 =?us-ascii?Q?LsjXRhHQR4p+Nn33r+KM+KhY2ue5ka3obAZDfPIVg2yw+Jbbkx4Pb+C6vRs4?=
 =?us-ascii?Q?lcm/O64rP9sb743Bj2FcwO6W/YVpX85ZmoFs1ycryXvgFTbAvC0SBxHKRRqm?=
 =?us-ascii?Q?cKTej9rnwYaKwGQoIa9ioAgBK+GqHVpzf/wK+m6khF4Hh7R7zOYS/E3243zc?=
 =?us-ascii?Q?c7g1ZEDbb7K+Cg2JWtFqto6Zl2NT3hU4HhvHJhSyo5bn5TjQqesvM69UOtGU?=
 =?us-ascii?Q?+V9c0DTHpPBhjuOYrQHjqRXnzSS4kffmHAqtmZt1rccaB9k9vptpiT0TXrSM?=
 =?us-ascii?Q?0etIFVlcMPKzOG5AxILzrwt7djyYdxT7IuihgDgEs6Qwpw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yzCyEyBn0PUSKeozhifTF8WEtRfZY0etBP7PYCxyTJguchPdzFDONqyr3I0I?=
 =?us-ascii?Q?+eXNYww1soips8IxLvyS0mWfJASOtUpzz0F9bV42uaxKhgc1oXGb5/ha006c?=
 =?us-ascii?Q?cjhNOPsPxHMfk+qsmicIv37nwUtSAR9SvAyAoVRHTi1P8vQIJlBT4MNzbmgI?=
 =?us-ascii?Q?tTvYDMaoA5Vp9B16yRw5WBXlZayZJGGtS3jy9q1KJK39ZfdZw/cSscGr8i26?=
 =?us-ascii?Q?mweRpSHBuKn3rrsvSLTfb+vfBpbkG8tWQbK7aKuD05mcWsDhGU0WnkQ6kd9T?=
 =?us-ascii?Q?QBq3/5G0u2OWoM5VRTcNR1VttFUCxWLoM7FWGSAqHX4xJEfrHPbtMJmFBYvy?=
 =?us-ascii?Q?3fYOZcnNyqmKd9RR5WRD9ZiGR2jIo8VlbZBUq0yqZeXns/t2wfG0tU6JT8/Y?=
 =?us-ascii?Q?2h7JfRwiVxIV92vHHk4Q27gnao5DVe+EpAspV+pEtG3ly4IQREI48Nzat3ey?=
 =?us-ascii?Q?+6Ji32HjBfc55Gra1Rh7/RCFY9uDzRAHk0kRwlCqk+u/r906a4dhLeBxjcTg?=
 =?us-ascii?Q?/Gqz8vlY1CTAnny76O4MKy5vfPhhmof8n+QtNVpN9AHtgYvxPN9kNSjdJwAt?=
 =?us-ascii?Q?kcMkBYeGQzumptnBt438EUNH4rwXaaD1XbQTJ9WEgPiw56X1m5yuUdHxhXi8?=
 =?us-ascii?Q?iW45aaiOCqRYbYYF7oxivJNqzbYvziCFmxUwno/Tz4Ce1DK+wehl3Ywlxx4U?=
 =?us-ascii?Q?nzN54AmsS+F4EihyB+gcc6vONo7Hvgozcu/Y0WqJrAOn7Uke1OpRxWXEBV6+?=
 =?us-ascii?Q?Qg/ZtXDaXJ5CsH3hZ8Pyh0iMqNN6Ceyy3VcZrIiO06wLlPXWATv8lWxouJbR?=
 =?us-ascii?Q?Qkm32EOtZ0FCabJcEYhan4MFGriajR7HbXB/igPeNhkqIy8taa+iCcy5Tnu3?=
 =?us-ascii?Q?Q+bJiiLYGkevwES9bnwpuQDSFndf0z6OgpCC2+WMfx5m3uPj66XsBl6RwCjI?=
 =?us-ascii?Q?bObBcF4iOxsSp8hHsL0yqrPW8tjT7k1s/ECGVOhR9Bn3WiVvcS4cMJJTUENs?=
 =?us-ascii?Q?jxIfavumktTlX0ZVBV7QX0FI9lPnrUEo3fEDz0fdJrdSpCD5JDeMKmUHrqKx?=
 =?us-ascii?Q?WpazM5ZfTqlxZlpcY5m859RaNvfsjiJa1UPd3rY1YuOQ6gS1kfwLGHF+hW7P?=
 =?us-ascii?Q?R1mF9t4q5/OLk9AjaxcRO5tAbJPYPsAOglfOmGkAFgvvYMnUNEonJ34l5BRq?=
 =?us-ascii?Q?kzOzNebmIjMVj1K768JaRGmOuFL18G8YQsSS/rr8sAHEXHvvEDGzWkc6vzFg?=
 =?us-ascii?Q?vcoMzfDv75k0ymDl6njQf1tbE9yg8XEPwjCOl+67GNJsVtwRc4JSOXBFCnBW?=
 =?us-ascii?Q?MkJcV5M+clI/IcaOPT8FSq2HE9ffFlBhUhOquCelFl6OnIoWOMCKLVIN2Bu/?=
 =?us-ascii?Q?oJIERULh1+8MzTnagQ4t2jbhDxMp/mkKz/1LZNQ7ewQDs7MXleFid7cQ5tz3?=
 =?us-ascii?Q?EezYBNeRUqq9uggoR7zkYqPCGcodOlnsXB8P93yDm6O+i0QiNnwQ1sflt20E?=
 =?us-ascii?Q?7jf+B0jlY3mhAJy3em6/iv9TB5/HgKE8htMgU/KpfDWX1SJwgSiGRbChlGiH?=
 =?us-ascii?Q?tsx6NBeZWgtt4d4rV0Oi4+VQoU4erpPitlbYEIqpTtDqNMZ+UO8Yu8IHetXX?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9db1d166-567c-4cd1-e511-08dcaccd22eb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 17:13:43.5684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0i2wfWb7/USPS8dEGft/JEZF6CwDS+K44H981KKrgX8UaSRBf77aSK7pMOwsFmUiLnKFJNFesiqo+B+VSxj+Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4799
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

On Wed, Jul 24, 2024 at 02:53:09PM -0700, Lucas De Marchi wrote:
> Being part o the display, ideally the setup and cleanup would be done by
> display itself. However this is a bigger refactor that needs to be done
> on both i915 and xe. For now, just fix the leak:
> 
> unreferenced object 0xffff8881a0300008 (size 192):
>   comm "modprobe", pid 4354, jiffies 4295647021
>   hex dump (first 32 bytes):
>     00 00 87 27 81 88 ff ff 18 80 9b 00 00 c9 ff ff  ...'............
>     18 81 9b 00 00 c9 ff ff 00 00 00 00 00 00 00 00  ................
>   backtrace (crc 99260e31):
>     [<ffffffff823ce65b>] kmemleak_alloc+0x4b/0x80
>     [<ffffffff81493be2>] kmalloc_trace_noprof+0x312/0x3d0
>     [<ffffffffa1345679>] intel_opregion_setup+0x89/0x700 [xe]
>     [<ffffffffa125bfaf>] xe_display_init_noirq+0x2f/0x90 [xe]
>     [<ffffffffa1199ec3>] xe_device_probe+0x7a3/0xbf0 [xe]
>     [<ffffffffa11f3713>] xe_pci_probe+0x333/0x5b0 [xe]
>     [<ffffffff81af6be8>] local_pci_probe+0x48/0xb0
>     [<ffffffff81af8778>] pci_device_probe+0xc8/0x280
>     [<ffffffff81d09048>] really_probe+0xf8/0x390
>     [<ffffffff81d0937a>] __driver_probe_device+0x8a/0x170
>     [<ffffffff81d09503>] driver_probe_device+0x23/0xb0
>     [<ffffffff81d097b7>] __driver_attach+0xc7/0x190
>     [<ffffffff81d0628d>] bus_for_each_dev+0x7d/0xd0
>     [<ffffffff81d0851e>] driver_attach+0x1e/0x30
>     [<ffffffff81d07ac7>] bus_add_driver+0x117/0x250

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 8b83dcff72e1..ca4468c82078 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -132,6 +132,7 @@ static void xe_display_fini_noirq(void *arg)
>  		return;
>  
>  	intel_display_driver_remove_noirq(xe);
> +	intel_opregion_cleanup(xe);
>  }
>  
>  int xe_display_init_noirq(struct xe_device *xe)
> @@ -157,8 +158,10 @@ int xe_display_init_noirq(struct xe_device *xe)
>  	intel_display_device_info_runtime_init(xe);
>  
>  	err = intel_display_driver_probe_noirq(xe);
> -	if (err)
> +	if (err) {
> +		intel_opregion_cleanup(xe);
>  		return err;
> +	}
>  
>  	return devm_add_action_or_reset(xe->drm.dev, xe_display_fini_noirq, xe);
>  }
> -- 
> 2.43.0
> 
