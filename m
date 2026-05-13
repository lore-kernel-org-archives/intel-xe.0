Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33911CD4F21
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 22:50:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A3310F0C2;
	Wed, 13 May 2026 22:50:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nKbZ0+OB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C95E10F0B2
 for <intel-xe@lists.freedesktop.org>; Wed, 13 May 2026 22:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778712603; x=1810248603;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MzgKsUHIUnBZjE1m62WOymUj39M/q3wpaoaUb8tfDJg=;
 b=nKbZ0+OBsgHlWc4/rwaUQiI91FcoKlMDvf7EIASDc5Tyh8aCtMdOkeI0
 HdhO+IkKjPjJq21s8czsnbcVqj/+Gadtokc8TdZurPVAQrD7taZrD4Ulx
 9bLnRVO3odB7Ww3z3RTGxv+T9n4s/ZH+YuBe8YfDFIhqZcxjTtcHOTWlu
 2Wiq65tQ6FNVr3+i99rsugG+dljxoN8MjglALoQQpm8pwHMk/kwC9d75u
 EpThjhR6CvMvYxxa937ypUMOdTBwPyLNBrlNZxLzMF6EDzZ1G1aYOXbPt
 SPbtwjnjvHt5k3soEPoyuagMBGR6CSsqRi2R8y9QaN5IjhBvXxr8ZJJZM g==;
X-CSE-ConnectionGUID: 4q3XvoUbSLeo2Jntubf4Ng==
X-CSE-MsgGUID: /ZalwnpMSNignIFLA6xQ8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="91036880"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="91036880"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 15:50:03 -0700
X-CSE-ConnectionGUID: Q4V0sIXRT6KVhDsw5V8MiQ==
X-CSE-MsgGUID: wlvIshuAQRaOJZtE9lIe5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="235148004"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 15:50:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 15:50:02 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 13 May 2026 15:50:02 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.67) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 15:50:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gCEVrx/xcjXqRtZsWov1LIJ5MqVqiB4UfUHc3HkJeq+yHRGxQhn9Anck0dzyVSUZsldaSi7V5FXchUASFZqY1CfeUPpA+UkTzygEdbVT9ewmiZCiS6nC+jmcJOLMprv7JtGx4+zfoQICcRrzo0qcamWxhCOCcKaDf7AS2X13lJ6XQ9X7nNhncyIRF+/9Nzx/ApxnCcEoaQaF9b2L25XcFdl4ofpqQT+orh6TdYNTizF24YL+bjotureC6xnwubJ1enJOZ13BSUxn2Lv4L8SEmPF51Ov0J2Fsr6y4Wx0Z4OpEkhwaLGMJjW1FJ+7Ae0v1FJmTRMwQ0jOj/sgImqlEYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ep8WnPgMrDaERBDpxHkcpdQ0zvHrhOYt4QYSoV/tkA=;
 b=JLvjhmOAg6I7uScMhEqRHyIZtpUx1JbAl8SKF2dVj2euxb9bQ/MduYk5kRn807NpcwzqcXgpXZH3fXF3BjjMHm0YeL4X2DT8PdeNrV+DVmd2l5ErlNlVOW4uab8DeeiBAGiP1rs65B37wH7AG8Rn1WVFwhkvrJE1bxm/E8nug+x8zzakQbczFEUF+v5QpNfOsk5Mc8krteBk6GjNcc6xm3AVp9hDmXf9E69fFFKseW6uCVCMdDxZdaThZHuTO+SOmBPrDlMbQ487Lh08Sif/LuyyW5uDFJCf7gn8lEW3c3Wh8CIZPonJwd0f7fjA6ODfmxv9MYhfASLdtZramlPP1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB7246.namprd11.prod.outlook.com (2603:10b6:208:42e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 22:49:59 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 22:49:57 +0000
Date: Wed, 13 May 2026 15:49:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 8/8] drm/xe/reg_sr: Do sanity check for MCR vs non-MCR
Message-ID: <20260513224955.GE2131374@mdroper-desk1.amr.corp.intel.com>
References: <20260508-rtp-mcr-check-v2-0-9897b147a5d2@intel.com>
 <20260508-rtp-mcr-check-v2-8-9897b147a5d2@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260508-rtp-mcr-check-v2-8-9897b147a5d2@intel.com>
X-ClientProxiedBy: BYAPR11CA0081.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB7246:EE_
X-MS-Office365-Filtering-Correlation-Id: f4959513-ee52-4f17-bd26-08deb141f4d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|11063799003|4143699003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: jFsy0GZ2oENzVUWdIGC/lv1NvY+o9Y4etgB8KufmP6nXTLyxolfmf0rsKQqAOMEtivx7Xz4X+Pe6qs7pzLq6fIVqx6ee8XgrDnkATkk+O4gFAR6zbsXFR5YY8wCdFXSfGbHmoOmASYw+arBLVZuiV6c4lJ71eaMOxNtYuDwa77pelw0Ip0VCiaYaBetFk0RwZdBt2E9ZSBY2ag/OsKMLQnBJuCFHHqRwLxOfzldFFGaQN7DBP1hsyL50wWnTHbQjerRV+Uxet81Jcwcg/mJ1LDJgcSASlhIU1WeB7o1rY7AbWwv+tQzhugrz/1b3eIoZKLhZujawPedxpjGUYkr33qyusgW48NBZWY7sIQubU7AZBSb6Bs4KsRdsh0d/KxcOJI4Ut9h/WLJmIfNNAq5JY096b7Jg1GMhRMklKTaFS6GvuRlPvlY8YHTfKkuZeHWYU+wKzuZovPfteRU24jTfZdahFf1U6nwzsYEOw5B+VQoGLOMyc+d+uS8NbVNRua1zaXvRqFQga0wpPNGK2MtjGFOUnkp18ChtBiO/Cddw4FmmoGL05NZ+blQT0L1RrVTleMYLuPS3pW3LoYVS0uuSWezRF/XeEStmEvSR3OA/AWn+6OGJGi70RUlvA+zatzgGj7wYT5WhWWyznHuyldRTvDhlfmS9Ajk7M8lw/L6Oxwiy8tje4tucrEt0t4nS3oOI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(11063799003)(4143699003)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+Nwv3RG3vddWYVeq1uk2p2rDWjPsBLuwkp12KxEwPV5FZlcIkEZs1237ox?=
 =?iso-8859-1?Q?4dM6GY3EZGqEUjz1XZW6nLoOGPIvTz2Qn1V38rfvcGms/ZPQdyEYWPI3Z+?=
 =?iso-8859-1?Q?pUVwKZBVmKIjrQ+CDNgjlt2NA6SS8eyCGUtHzyQOhevGYa9ZlZLfSzpgrO?=
 =?iso-8859-1?Q?abT0U14koMb/9dH9QS1OPlPjkPH7cfdzEl+HYWO75pZviCvq1EufnHxWLz?=
 =?iso-8859-1?Q?+wOCuEJSyJq5V5aZrWyWmMK9xzZE1KlWvMj3EFttQvyRdtZHxXOcoAoG/J?=
 =?iso-8859-1?Q?T/g6+O0yM4BaRg/ElzdYbgrPEg65hxd8Z2ULKr3lNNJkpsjVyG6+AvaGPz?=
 =?iso-8859-1?Q?FypK6+cwb/VG71KSO3ZQ4OV0cLb6sx3WiQhFobXi9hsQpqikLOHrXH2cl7?=
 =?iso-8859-1?Q?GLz6r2j5bhmtMtpyRNZr8Xh3fOsT2IF1fS8rk7Qd4yafo6eQiPswyYvJ7J?=
 =?iso-8859-1?Q?kRMJ8/gwuebDbNoLwGEZZhwagNqs9ybJKFZYquBTSoynqDwiPN6ksyOLSM?=
 =?iso-8859-1?Q?/1dosgCFk1E2i9PRq3as36dEEKKKp3U0hVeouH35pjnZRkL1kM145q5/Av?=
 =?iso-8859-1?Q?+VjFGrTaxKUKxP+h+oPH2Js2BnkePfL9O/092aH5p6kFDhnJ63dqfrstUJ?=
 =?iso-8859-1?Q?DRB1zqv+HU9UNuf3h8kgnnI4arxBCtw61obP8arz35NxMd1afRrDcKeExH?=
 =?iso-8859-1?Q?ljpDFjnwnTOpKR7X+p4FgyPkSBa3qgCX4Hi4c/kG+WUE3+5+cL3KXkjL1q?=
 =?iso-8859-1?Q?rHmwkbiPCK4aZMWxHbsgnUgrjKxAd2C0ihGBTjsdJIawi2bDGEm7Aumks2?=
 =?iso-8859-1?Q?MRDLtjiqQ4krqqsAWBIkGGtStc/1JKT4o/Hi16/UGQuomhU487P7FWQp6D?=
 =?iso-8859-1?Q?A51Ey23GpiwZ7/FclGeAw79fDbg6pSgFiZzud/jA+43gcwAJUbjEcTlGzS?=
 =?iso-8859-1?Q?EEi0TPuAL9zJX2e3Ym+SDQFybNoN3sOihyd2E3ZnNn4E9pSpYCdVGAWzZM?=
 =?iso-8859-1?Q?8KVCWOWxAI6785xgaCG4x3gx140rdpWz7mu4ad0O6ULfVcxTSKpfJO7KMk?=
 =?iso-8859-1?Q?NEMrdrKjZnlDbox/wgFC3uUNwC4KRqZjNGmL4SdTlMRS85L1Jvl8PQaEz+?=
 =?iso-8859-1?Q?locxHM5/JbPL9THbSLW22izOgT2vPOryfcNztwwYBvI6uX6/Gom8ZOC3H3?=
 =?iso-8859-1?Q?GOPNB5ad8vxv7koxc6+E8X6fn2tydPGxoRuPQggldyl+SqF63bLZjRgiy9?=
 =?iso-8859-1?Q?9EkPZtQIPMGeXSkEwXquAjC+K9FHXPWTYBF26xZ47zmv1RXo5bVY1EPGsv?=
 =?iso-8859-1?Q?FR6Zlq/sBTdmzbF1ESEsFGkzFBFaR2hgsuvo6+Lu5JGrXkpaYfT57s7FjY?=
 =?iso-8859-1?Q?NkDwzjd3bQJgIrQmRzykgYOMKiIMS6sWh+VBtpFWLF1diaMjWZZLswz20B?=
 =?iso-8859-1?Q?ev3XrbtVolndPQl51oLqS3zo2rF+pTI50azjapo3dOG9DQfoYWCJ9dtNAW?=
 =?iso-8859-1?Q?N/13kt7L1f5ZFQ0AA84fmOuSbn9mB/slG0EbgfQXYCKxf9MLVafoPCKWBR?=
 =?iso-8859-1?Q?tal7EoR5MfoMbFcjhNrJBYnmusvVkjV6lNTdBc5Q4L960yTIeNECldO350?=
 =?iso-8859-1?Q?6H8ntt74o0SEqnTlr1rbGsN82hjEj5fvAf3wetHUdI2QwZvJzJJZtkbiR7?=
 =?iso-8859-1?Q?O/DCTFsLNr1XcxE77maxIx3mfukoufSZpTuC1otlX0Ca6ZzcsOfQVyn18E?=
 =?iso-8859-1?Q?rDhbiZuGK/rJeik9hbot9kLAyHoJjFWQewUXKDEfjyZ5Dnn57VB6SOcfii?=
 =?iso-8859-1?Q?yZIgtmdngvbxeex00aw8xZI8lzAdwLM=3D?=
X-Exchange-RoutingPolicyChecked: rtTpU4qa8DAB681wjfRdwXU+RxJZJDAcU3DcoSIEVuoY/x0VeufyVBTVrqXh81eLB9COKGH6WcTKz1r+0hIpQ3REA4oHF5BCF4aHMmUcGCntJRjnZ0/CY368WWcuiFiOqU07NQU0KqkLtc0KS5WUD5chWqnsIE0pVZcLHTor/hexJ8Y9RYrExidD4cdWBE2SCiZSkjmlnRGb4OIqg5b4su0A7XYkx3FsPsy8/ePYvrRcjZ2AbZyfJnI7/peFCXci9z3vIMjAXyaWljHsejQODXOb2Xuwn1EMo+voAC/xK8CHtShvqEBx7VbyrwzAkUOACYUBWexv8ETr4X+FcU7rpg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f4959513-ee52-4f17-bd26-08deb141f4d1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 22:49:57.3337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 19Xm3+UBCqutdAxtYbsSP9g+ah2EPbBJ/Vuj0WkbIoQ/Lm/hg8jKZwfVo080w0rbl+VAec+cQIPeZTQKFlcz7FjqaqkAVjH5aclvHlpEq54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7246
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

On Fri, May 08, 2026 at 06:42:38PM -0300, Gustavo Sousa wrote:
> The type struct xe_reg_mcr exists to ensure that the correct API is used
> when handling MCR registers.  However, for the register save/restore
> functionality, the RTP processing always cast the register to a struct
> xe_reg and then apply_one_mmio() selects the MMIO API based on the "mcr"
> field of the register instance.
> 
> This allows the developer to commit mistakes like passing a MCR register
> for an RTP action for a GT where the respective register is not MCR; and
> vice-versa.
> 
> To capture such scenarios, do a sanity check in xe_reg_sr_add() that,
> upon an inconsistency:
> 
> - "fixes" the register type by favoring what we have in our MCR range
>   tables instead of what the developer selected for the save/restore
>   entry;
> - raises a notice-level message to inform about the inconsistency.
> 
> Note: As a collateral of this change, we need to include MCR
> initialization in xe_wa_test.c, otherwise a bunch of test cases end up
> failing because xe_gt_mcr_check_reg() will always return false, meaning
> that will incorrectly say that a MCR register is not MCR.
> 
> v2:
>   - Downgrade messages to notice level so as not to block CI execution
>     when inconsistencies are found. (Matt)
>   - Add missing EXPORT_SYMBOL_IF_KUNIT() calls. (Gustavo)
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_rtp_test.c | 71 ++++++++++++++++++++++++++++++----
>  drivers/gpu/drm/xe/tests/xe_wa_test.c  | 12 +++++-
>  drivers/gpu/drm/xe/xe_gt.c             |  3 ++
>  drivers/gpu/drm/xe/xe_gt_mcr.c         | 24 ++++++++++++
>  drivers/gpu/drm/xe/xe_gt_mcr.h         |  1 +
>  drivers/gpu/drm/xe/xe_reg_sr.c         | 36 +++++++++++++++++
>  6 files changed, 139 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> index e5a0f985a700..5d78f2283df9 100644
> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> @@ -9,24 +9,30 @@
>  #include <drm/drm_drv.h>
>  #include <drm/drm_kunit_helpers.h>
>  
> +#include <kunit/static_stub.h>
>  #include <kunit/test.h>
>  
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_reg_defs.h"
>  #include "xe_device.h"
>  #include "xe_device_types.h"
> +#include "xe_gt_mcr.h"
>  #include "xe_kunit_helpers.h"
>  #include "xe_pci_test.h"
>  #include "xe_reg_sr.h"
>  #include "xe_rtp.h"
>  
> -#define REGULAR_REG1	XE_REG(1)
> -#define REGULAR_REG2	XE_REG(2)
> -#define REGULAR_REG3	XE_REG(3)
> -#define MCR_REG1	XE_REG_MCR(1)
> -#define MCR_REG2	XE_REG_MCR(2)
> -#define MCR_REG3	XE_REG_MCR(3)
> -#define MASKED_REG1	XE_REG(1, XE_REG_OPTION_MASKED)
> +#define REGULAR_REG1		XE_REG(1)
> +#define REGULAR_REG2		XE_REG(2)
> +#define REGULAR_REG3		XE_REG(3)
> +#define REGULAR_REG4		XE_REG(4)
> +#define BAD_REGULAR_REG5	XE_REG(5)
> +#define MCR_REG1		XE_REG_MCR(1)
> +#define MCR_REG2		XE_REG_MCR(2)
> +#define MCR_REG3		XE_REG_MCR(3)
> +#define BAD_MCR_REG4		XE_REG_MCR(4)
> +#define MCR_REG5		XE_REG_MCR(5)
> +#define MASKED_REG1		XE_REG(1, XE_REG_OPTION_MASKED)
>  
>  #undef XE_REG_MCR
>  #define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr = 1)
> @@ -48,6 +54,23 @@ struct rtp_test_case {
>  	const struct xe_rtp_entry *entries;
>  };
>  
> +static bool fake_xe_gt_mcr_check_reg(struct xe_gt *gt, struct xe_reg reg)
> +{
> +	/*
> +	 * All supported platforms in this imaginary setup will always have REG4
> +	 * as a non-MCR register and REG5 as MCR, meaning that BAD_MCR_REG4 and
> +	 * BAD_REGULAR_REG5 represent programming errors to be captured by our
> +	 * tests.
> +	 */
> +	if (reg.raw == BAD_REGULAR_REG5.raw)
> +		return true;
> +
> +	if (reg.raw == BAD_MCR_REG4.raw)
> +		return false;
> +
> +	return reg.mcr;
> +}
> +
>  static bool match_yes(const struct xe_device *xe, const struct xe_gt *gt,
>  		      const struct xe_hw_engine *hwe)
>  {
> @@ -304,6 +327,38 @@ static const struct rtp_to_sr_test_case rtp_to_sr_cases[] = {
>  			{}
>  		},
>  	},
> +	{
> +		.name = "bad-mcr-reg-forced-to-regular",
> +		.expected_reg = REGULAR_REG4,
> +		.expected_set_bits = REG_BIT(0),
> +		.expected_clr_bits = REG_BIT(0),
> +		.expected_active = BIT(0),
> +		.expected_count_sr_entries = 1,
> +		.expected_sr_errors = 1,
> +		.entries = (const struct xe_rtp_entry_sr[]) {
> +			{ XE_RTP_NAME("bad-mcr-regular-reg"),
> +			  XE_RTP_RULES(FUNC(match_yes)),
> +			  XE_RTP_ACTIONS(SET(BAD_MCR_REG4, REG_BIT(0)))
> +			},
> +			{}
> +		},
> +	},
> +	{
> +		.name = "bad-regular-reg-forced-to-mcr",
> +		.expected_reg = MCR_REG5,
> +		.expected_set_bits = REG_BIT(0),
> +		.expected_clr_bits = REG_BIT(0),
> +		.expected_active = BIT(0),
> +		.expected_count_sr_entries = 1,
> +		.expected_sr_errors = 1,
> +		.entries = (const struct xe_rtp_entry_sr[]) {
> +			{ XE_RTP_NAME("bad-regular-reg"),
> +			  XE_RTP_RULES(FUNC(match_yes)),
> +			  XE_RTP_ACTIONS(SET(BAD_REGULAR_REG5, REG_BIT(0)))
> +			},
> +			{}
> +		},
> +	},
>  };
>  
>  static void xe_rtp_process_to_sr_tests(struct kunit *test)
> @@ -523,6 +578,8 @@ static int xe_rtp_test_init(struct kunit *test)
>  	xe->drm.dev = dev;
>  	test->priv = xe;
>  
> +	kunit_activate_static_stub(test, xe_gt_mcr_check_reg, fake_xe_gt_mcr_check_reg);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
> index 2bf6fab015cd..ff0e2502b39f 100644
> --- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
> @@ -9,6 +9,8 @@
>  #include <kunit/test.h>
>  
>  #include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_gt_mcr.h"
>  #include "xe_kunit_helpers.h"
>  #include "xe_pci_test.h"
>  #include "xe_reg_sr.h"
> @@ -19,8 +21,10 @@ static int xe_wa_test_init(struct kunit *test)
>  {
>  	const struct xe_pci_fake_data *param = test->param_value;
>  	struct xe_pci_fake_data data = *param;
> -	struct xe_device *xe;
>  	struct device *dev;
> +	struct xe_device *xe;
> +	struct xe_gt *gt;
> +	int id;
>  	int ret;
>  
>  	dev = drm_kunit_helper_alloc_device(test);
> @@ -33,6 +37,12 @@ static int xe_wa_test_init(struct kunit *test)
>  	ret = xe_pci_fake_device_init(xe);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
> +	/* Needed for sanitize_mcr(). */
> +	for_each_gt(gt, xe, id) {
> +		xe_gt_mcr_init_early(gt);
> +		xe_gt_mmio_init(gt);
> +	}
> +
>  	if (!param->graphics_verx100)
>  		xe->info.step = param->step;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index c4b25daad542..783eb6d631b5 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -7,6 +7,8 @@
>  
>  #include <linux/minmax.h>
>  
> +#include <kunit/visibility.h>
> +
>  #include <drm/drm_managed.h>
>  #include <uapi/drm/xe_drm.h>
>  
> @@ -785,6 +787,7 @@ void xe_gt_mmio_init(struct xe_gt *gt)
>  	if (IS_SRIOV_VF(xe))
>  		gt->mmio.sriov_vf_gt = gt;
>  }
> +EXPORT_SYMBOL_IF_KUNIT(xe_gt_mmio_init);
>  
>  void xe_gt_record_user_engines(struct xe_gt *gt)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 2b2a4d9c3749..04f0098070a4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -3,6 +3,9 @@
>   * Copyright © 2022 Intel Corporation
>   */
>  
> +#include <kunit/static_stub.h>
> +#include <kunit/visibility.h>
> +
>  #include "xe_gt_mcr.h"
>  
>  #include "regs/xe_gt_regs.h"
> @@ -553,6 +556,7 @@ void xe_gt_mcr_init_early(struct xe_gt *gt)
>  	/* Mark instance 0 as initialized, we need this early for VRAM and CCS probe. */
>  	gt->steering[INSTANCE0].initialized = true;
>  }
> +EXPORT_SYMBOL_IF_KUNIT(xe_gt_mcr_init_early);
>  
>  /**
>   * xe_gt_mcr_init - Normal initialization of the MCR support
> @@ -614,6 +618,26 @@ static bool reg_in_steering_type_ranges(struct xe_gt *gt,
>  	return false;
>  }
>  
> +/*
> + * xe_gt_mcr_check_reg - check if a register is recognized by this GT as MCR
> + * @gt: GT structure
> + * @reg: The register to check
> + *
> + * Returns true if the register offset falls within one of the MMIO ranges
> + * classified as MCR for the GT.
> + */
> +bool xe_gt_mcr_check_reg(struct xe_gt *gt, struct xe_reg reg)
> +{
> +	KUNIT_STATIC_STUB_REDIRECT(xe_gt_mcr_check_reg, gt, reg);
> +
> +	for (int type = 0; type <= IMPLICIT_STEERING; type++)
> +		if (reg_in_steering_type_ranges(gt, reg, type))
> +			return true;
> +
> +	return false;
> +}
> +EXPORT_SYMBOL_IF_KUNIT(xe_gt_mcr_check_reg);
> +
>  /*
>   * xe_gt_mcr_get_nonterminated_steering - find group/instance values that
>   *    will steer a register to a non-terminated instance
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
> index 2be9419b8acc..75374662f10d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.h
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
> @@ -26,6 +26,7 @@ void xe_gt_mcr_unicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
>  void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
>  			       u32 value);
>  
> +bool xe_gt_mcr_check_reg(struct xe_gt *gt, struct xe_reg reg);
>  bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
>  					  struct xe_reg_mcr reg_mcr,
>  					  u8 *group, u8 *instance);
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index 2df0277efb2f..e328f5072557 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -70,14 +70,49 @@ static void reg_sr_inc_error(struct xe_reg_sr *sr)
>  #endif
>  }
>  
> +static struct xe_reg sanitize_mcr(struct xe_reg_sr *sr,
> +				  const struct xe_reg_sr_entry *e,
> +				  struct xe_gt *gt)
> +{
> +	struct xe_reg reg = e->reg;
> +	bool is_mcr;
> +
> +	/*
> +	 * We need the gt structure to check MCR ranges.
> +	 */
> +	if (!gt)
> +		return reg;
> +
> +	is_mcr = xe_gt_mcr_check_reg(gt, reg);
> +
> +	if (is_mcr && !reg.mcr) {
> +		reg.mcr = 1;
> +		xe_gt_notice(gt, "xe_reg_sr_entry using non-MCR register for address 0x%x, forcing MCR\n",
> +			     reg.addr);
> +		reg_sr_inc_error(sr);
> +	}
> +
> +	if (!is_mcr && reg.mcr) {
> +		reg.mcr = 0;
> +		xe_gt_notice(gt, "xe_reg_sr_entry using MCR register for address 0x%x, forcing non-MCR\n",
> +			     reg.addr);
> +		reg_sr_inc_error(sr);
> +	}
> +
> +	return reg;
> +}
> +
>  int xe_reg_sr_add(struct xe_reg_sr *sr,
>  		  const struct xe_reg_sr_entry *e,
>  		  struct xe_gt *gt)
>  {
>  	unsigned long idx = e->reg.addr;
>  	struct xe_reg_sr_entry *pentry = xa_load(&sr->xa, idx);
> +	struct xe_reg reg;
>  	int ret;
>  
> +	reg = sanitize_mcr(sr, e, gt);
> +
>  	if (pentry) {
>  		if (!compatible_entries(pentry, e)) {
>  			ret = -EINVAL;
> @@ -98,6 +133,7 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
>  	}
>  
>  	*pentry = *e;
> +	pentry->reg = reg;
>  	ret = xa_err(xa_store(&sr->xa, idx, pentry, GFP_KERNEL));
>  	if (ret)
>  		goto fail_free;
> 
> -- 
> 2.53.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
