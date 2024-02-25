Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09458C54E41
	for <intel-xe@archiver.kernel.org>; Sun, 25 Feb 2024 09:08:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF19D10E047;
	Sun, 25 Feb 2024 09:08:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PP0yuEQ4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF6110E047
 for <intel-xe@lists.freedesktop.org>; Sun, 25 Feb 2024 09:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708852121; x=1740388121;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SR887DSykntAkH51gJaS2ajpSrgTcM1L4FFTFU15DmM=;
 b=PP0yuEQ4jX3CEIUIeTSdIuP7EWqjppS/GT5DvHrALyqHC/NKOX6i3V+I
 F9NZLIg9tm2mGgIinaATor1ZOTjVWtGq2dUsa4My6FAVyg5Aa8XFZshjq
 7cY5dEEDCztmyaeWdw5OX/CKbb6xRZwtfa77lBLJy1p8LaAN72LQu+bAd
 OHBDeL9EQqkM9efJ5qmAnposi0NbgXvxZ+Js/VJBwKmtJA0dZa/+FZlrc
 jUhkCre2WQuWg7pYMMt4flQW71HajfUCtFhw/PzkZ2Joic4g6hrRRf3Mg
 EVc/PYF1vBn1ZH6iuI7nEjRLUv/xvaq93a7uZIsDlOCnGOOE4fpW/NzOX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="14277465"
X-IronPort-AV: E=Sophos;i="6.06,183,1705392000"; d="scan'208";a="14277465"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2024 01:08:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,183,1705392000"; d="scan'208";a="37352485"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Feb 2024 01:08:40 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 25 Feb 2024 01:08:39 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 25 Feb 2024 01:08:39 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 25 Feb 2024 01:08:39 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 25 Feb 2024 01:08:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E15AVA6gnO+aJcxeq2gYEVgnBnFqagNzrDcEFvD47hnlkDAPXpsSeAwXn8cAppe3n7eEwpmB1xfxL7/xVNoT8uto920nLe3ybPae1Pyw3zyoUWDcz9R+dJYVcw3S5Ryf4qiZaolg6rnD0BHJn5EyhsQqSbA1+QurSuRf7phVdWzRykP+UijM35FjWYZvTSS+Jksd27H6LShxWcRMReVbRVEnOKykozEQk5w6NdPUt1HlW+Kewoz4Qo0NOdmJZNajiAWyGn6R3GtL7GpuW/J475IbQJOnpVRXdF9IrdD1xAq1wGaAIQNqVBzjwVU9VsjAy19UsyC1IUV3E75hCUwEqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yyeAhvhAyspuI8Hz5HXeyNsIP1jqzjOLjc53iy7S/Lw=;
 b=EZgN4tg3wTV1AzW3pk9et5lTXKqkOeoRBF2+sTAAe/InCyZsYjTElswp44QO/XstxKuGfdY8SAJPy42X0lsTBa3esj6sYaTQKLDXCx1SMSPB8wp4N7toJAB/nm6X+egVQYGYTqbNLWEMnpEcjOaQUiJzFf4iTRcezPQiJxY9mtIBJzvFuK7ud6hWnuv8mm9p3lsOiVkzdz7aehHZtvx4x4dAjWGAM8d8KXp0DT8uPcA65U3O+ytwvYNdEhSLZXSRNz6/xP0EopXSgaw5UURpn2iHuJAtLYDRCW0JwTOIGsmleefJdms9sjA2YEUguxpVuFYeykw0qbTAiQ7G9NcGmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by SA3PR11MB8075.namprd11.prod.outlook.com (2603:10b6:806:303::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.10; Sun, 25 Feb
 2024 09:08:36 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584%3]) with mapi id 15.20.7339.019; Sun, 25 Feb 2024
 09:08:36 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Auld, Matthew" <matthew.auld@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Subject: RE: [PATCH 01/14] drm/xe: Document Xe PM component
Thread-Topic: [PATCH 01/14] drm/xe: Document Xe PM component
Thread-Index: AQHaZa29eYL7NRQBWkON94VHA3mhubEayKzA
Date: Sun, 25 Feb 2024 09:08:36 +0000
Message-ID: <CY5PR11MB621182C71EBB1F6623E255EF955B2@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20240222163937.138342-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240222163937.138342-1-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|SA3PR11MB8075:EE_
x-ms-office365-filtering-correlation-id: 0717ac6e-59b2-4112-770c-08dc35e15938
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0qtQal/k5XsHFMr7eeu3NgJdpYeS0SfZS7CtNSnEPz2YhJUrOOzPluT2IWz6tx3v82qV4uUvf8od3HFz2mKgAQ/GVMZZ9jmEsmI907Se5+dN/dxdNISp8GyTh2tQlY0cx1M+W8mkEU5Q2NJq9uZy0ujvJPpr6190kGr2385gt0RLa4yyIc5uMp8QEvJMjTjv3opwNo6XppvqnEweAGBZfo6v6dwyPbNKFUTEfKOUhE9jt6lpJzt4FqZhuzLX4kgBvz72GAJiV9ARh196ABtc8/TWz1BFf4U6w7qOmlQKrEXnv8azpdlCTOueTcq8k6yEoLFEk8sAWZ8EhSEjEErcNGmBbXiYB+9TQVzdTcv6wlE0rdGy2+ycobhZcYqDLMwzMcMkka8VbChkiNUQ5UHSGvE4KaesjuHrigcTxordrC2NVUEo06NS9jRHVyrEPFYzDoZPfC9AB6oGrFMtgM108ynPHN+U26aD0Kqz25bp/WU/UR9cIb/WjTHy++jGsWAlrrYX6vmJggO01zqyK9sMFKDHLHMRRi4QokIDzKOKJv0uWIhvsAqj9ac55R7uHb40k1mBPgpmaIWptMfyqhqMMOnhnJQPkj2IMiEO6t989Nb//JBdaEVOQDbYMm8SX0ma
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mAAAZ3oX/5qIX8hXkH9wJALQqZVJDZxzepUXLmnWmg0Z4YkgMPxp0HSf3kWz?=
 =?us-ascii?Q?v/spxE4DJ848i8YlKbBoBHkhtir1B27rso7vHllFNO+F53ciXNI78jxp99CC?=
 =?us-ascii?Q?rmdnXpUBKrk8Sca7GZmcW3Ih8S2xQlY/rjxOWhVoautqhHzQNNhGX/jo4BSJ?=
 =?us-ascii?Q?fhQbcPRlUzksqKOXFjawHmpfsIxQ7pHfDDH0VMGhoNc05/I3h0PyNvhIL7ZX?=
 =?us-ascii?Q?S4a7YNMpfBEd3EVwD11X/4YVAcqG/9AgK95Mk1vIj839McN09sEFYnWv1nA7?=
 =?us-ascii?Q?LgkA2x1SVB8s92qFkWPqZRR/e1KEFMbTy17khXr73/URvB0of1O6YOqKKEmE?=
 =?us-ascii?Q?SUaQpWihd4zV/ywaTrMBBagvhl5SEJipV9UsdzSjkjVBS0xshwrbhmN0Cso9?=
 =?us-ascii?Q?4SOGYdWOrgePzd0Y6toa/o82TX0OGsfjHl8YIIcSlA033nWETsj4S3KlWJrV?=
 =?us-ascii?Q?7HL/bVyxMM0zqFd75Mtw5BPYm2jCwc0xcmiXgMRo2DEZnAdyq9A5/SR/5xEh?=
 =?us-ascii?Q?NyX5S+HtjTjQl0WjvarzrwpTrQBtRUMYic2a6Vo1ogOxSpxoSxKH92LG6ezb?=
 =?us-ascii?Q?hYkpLvDGp/GEhtPSCXvcX9DUugEh+FSxzUJrnnessN36zBplaK2W6ASlDqzR?=
 =?us-ascii?Q?wzKY5qBXRY3lkZf+4LVNJmIOnAfCI0WCEI769kK1xIsF/F/xLnBRH4Z9uLET?=
 =?us-ascii?Q?SE51v312LmpGSig5Z531hDTBo6MnVwm1nxAE91rqWA+5vx9Ty4HS/fYmVSMo?=
 =?us-ascii?Q?CYYU5ZPigJ9bmZ3mLZh5kmc9/cDYgPYY9G2mzDBkzdQLRTGvYJtnwQeNckVa?=
 =?us-ascii?Q?WzsQ7gJtF7OPRdsk8zDPsgiYgYMG9HTqaru4U++MhWVWESp0MYi0C42+z09w?=
 =?us-ascii?Q?GiAdSmEZhDUGFvFmtuAeM2ju1ZU0Ngv4yj5y3Jfgf/PVVXjtYuGPcmRclG7h?=
 =?us-ascii?Q?HYW8cjJFdaB/PTkW2GmoAvJMm2dpJ0ZKqvEqAdkOyorUSd9fcUqQwKHALeu5?=
 =?us-ascii?Q?pqwhur8AWcecJQtUmZz3NjdPeopzT5PpXgYu9So8ElIByCm6Xe2rMTpdSDwk?=
 =?us-ascii?Q?LL3yyuAmvDTzlTUlEvAkcWV3sEVBxJxAB27pwjOrgVKzwQSIoA6oY6dwe7HV?=
 =?us-ascii?Q?5+eB9aOmvvsvCnVxhSzglUX7wCnWjWGfmLnX/gYMbp4q1p9Og0LrpNeyq7jO?=
 =?us-ascii?Q?KoqiLeDwQgMcLU98+PByWH4plrr9TKgswg4xd62LKp9Z77+qfznWU99KaYtQ?=
 =?us-ascii?Q?pDahRZ5NF66vONetu1RopP+0huiofVlS6ahNFaoY1c1oM4M6ihLoaOcEdEwJ?=
 =?us-ascii?Q?hINFgsFOYvgFSpJALNEUKNNr+6SrjwwMtrYAf8M9OWhv9RNshwrTUIoXNecN?=
 =?us-ascii?Q?iWTzW5V1XJf4t53NqDQs1UNfKtefpmow6ZJAo3ZUWvia69DGGIf/phGk2oJD?=
 =?us-ascii?Q?vIUPoKUv+R+77iuvbKHbbxkA0mmy05gLoSFlm112crYZaTN6vR/jR4qyJqDF?=
 =?us-ascii?Q?W1xlI1NP8KpABQvUyUnIghAk/FDDbypI8mDbco8dEtgPOeo+z0DCpgRORkTP?=
 =?us-ascii?Q?s7S23lgiGoXDA1Ii7qcXXX//uBTp05/jpMufv15L?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0717ac6e-59b2-4112-770c-08dc35e15938
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2024 09:08:36.0494 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5EGQXVSZnqSWwCVl6Xzo6apHWtTp5aIE+58++QJqdjIH0Q6OPfliXy+aMQLQnuD0CWhgSPcj4oAKoADPbDmJqg6Vusk9LIwjYeTIjSqInug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8075
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



> -----Original Message-----
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Thursday, February 22, 2024 10:09 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Auld, Matthew
> <matthew.auld@intel.com>; Gupta, Anshuman <anshuman.gupta@intel.com>;
> Dugast, Francois <francois.dugast@intel.com>
> Subject: [PATCH 01/14] drm/xe: Document Xe PM component
>=20
> Replace outdated information with a proper PM documentation.
> Already establish the rules for the runtime PM get and put that Xe needs =
to
> follow.
>=20
> Also add missing function documentation to all the "exported" functions.
>=20
> v2: updated after Francois' feedback.
>     s/grater/greater (Matt)
> v3: detach D3 from runtime_pm
>     remove opportunistic S0iX (Anshuman)
>=20
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Acked-by: Francois Dugast <francois.dugast@intel.com>
> Reviewed-by: Francois Dugast <francois.dugast@intel.com> #v2
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pm.c | 109 +++++++++++++++++++++++++++++++++---
> -
>  1 file changed, 98 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c inde=
x
> ab283e9a8b4e..ae220f21acb1 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -25,21 +25,47 @@
>  /**
>   * DOC: Xe Power Management
>   *
> - * Xe PM shall be guided by the simplicity.
> - * Use the simplest hook options whenever possible.
> - * Let's not reinvent the runtime_pm references and hooks.
> - * Shall have a clear separation of display and gt underneath this compo=
nent.
> + * Xe PM implements the main routines for both system level suspend
> + states and
> + * for the opportunistic runtime suspend states.
>   *
> - * What's next:
> + * System Level Suspend (S-States) - In general this is OS initiated
> + suspend
> + * driven by ACPI for achieving S0ix (a.k.a. S2idle, freeze), S3
> + (suspend to ram),
> + * S4 (disk). The main functions here are `xe_pm_suspend` and
> + `xe_pm_resume`. They
> + * are the main point for the suspend to and resume from these states.
>   *
> - * For now s2idle and s3 are only working in integrated devices. The nex=
t step
> - * is to iterate through all VRAM's BO backing them up into the system
> memory
> - * before allowing the system suspend.
> + * PCI Device Suspend (D-States) - This is the opportunistic PCIe
> + device low power
> + * state D3, controlled by the PCI subsystem and ACPI with the help
> + from the
> + * runtime_pm infrastructure.
> + * PCI D3 is special and can mean D3hot, where Vcc power is on for
> + keeping memory
> + * alive and quicker low latency resume or D3Cold where Vcc power is
> + off for
> + * better power savings.
> + * The Vcc control of PCI hierarchy can only be controlled at the PCI
> + root port
> + * level, while the device driver can be behind multiple
> + bridges/switches and
> + * paired with other devices. For this reason, the PCI subsystem cannot
> + perform
> + * the transition towards D3Cold. The lowest runtime PM possible from
> + the PCI
> + * subsystem is D3hot. Then, if all these paired devices in the same
> + root port
> + * are in D3hot, ACPI will assist here and run its own methods (_PR3
> + and _OFF)
> + * to perform the transition from D3hot to D3cold. Xe may disallow this
> + * transition by calling pci_d3cold_disable(root_pdev) before going to
> + runtime
> + * suspend. It will be based on runtime conditions such as VRAM usage
> + for a
> + * quick and low latency resume for instance.
>   *
> - * Also runtime_pm needs to be here from the beginning.
> + * Runtime PM - This infrastructure provided by the Linux kernel allows
> + the
> + * device drivers to indicate when the can be runtime suspended, so the
> + device
> + * could be put at D3 (if supported), or allow deeper package sleep
> + states
> + * (PC-states), and/or other low level power states. Xe PM component
> + provides
> + * `xe_pm_runtime_suspend` and `xe_pm_runtime_resume` functions that
> + PCI
> + * subsystem will call before transition to/from runtime suspend.
>   *
> - * RC6/RPS are also critical PM features. Let's start with GuCRC and GuC=
 SLPC
> - * and no wait boost. Frequency optimizations should come on a next stag=
e.
> + * Also, Xe PM provides get and put functions that Xe driver will use
> + to
> + * indicate activity. In order to avoid locking complications with the
> + memory
> + * management, whenever possible, these get and put functions needs to
> + be called
> + * from the higher/outer levels.
> + * The main cases that need to be protected from the outer levels are:
> + IOCTL,
> + * sysfs, debugfs, dma-buf sharing, GPU execution.
> + *
> + * This component is not responsible for GT idleness (RC6) nor GT
> + frequency
> + * management (RPS).
>   */
>=20
>  /**
> @@ -178,6 +204,12 @@ void xe_pm_init_early(struct xe_device *xe)
>  	drmm_mutex_init(&xe->drm, &xe->mem_access.vram_userfault.lock);
>  }
>=20
> +/**
> + * xe_pm_init - Initialize Xe Power Management
> + * @xe: xe device instance
> + *
> + * This component is responsible for System and Device sleep states.
> + */
>  void xe_pm_init(struct xe_device *xe)
>  {
>  	/* For now suspend/resume is only allowed with GuC */ @@ -196,6
> +228,10 @@ void xe_pm_init(struct xe_device *xe)
>  	xe_pm_runtime_init(xe);
>  }
>=20
> +/**
> + * xe_pm_runtime_fini - Finalize Runtime PM
> + * @xe: xe device instance
> + */
>  void xe_pm_runtime_fini(struct xe_device *xe)  {
>  	struct device *dev =3D xe->drm.dev;
> @@ -225,6 +261,12 @@ struct task_struct *xe_pm_read_callback_task(struct
> xe_device *xe)
>  	return READ_ONCE(xe->pm_callback_task);  }
>=20
> +/**
> + * xe_pm_runtime_suspend - Prepare our device for D3hot/D3Cold
> + * @xe: xe device instance
> + *
> + * Returns 0 for success, negative error code otherwise.
> + */
>  int xe_pm_runtime_suspend(struct xe_device *xe)  {
>  	struct xe_bo *bo, *on;
> @@ -290,6 +332,12 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  	return err;
>  }
>=20
> +/**
> + * xe_pm_runtime_resume - Waking up from D3hot/D3Cold
> + * @xe: xe device instance
> + *
> + * Returns 0 for success, negative error code otherwise.
> + */
>  int xe_pm_runtime_resume(struct xe_device *xe)  {
>  	struct xe_gt *gt;
> @@ -341,22 +389,47 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  	return err;
>  }
>=20
> +/**
> + * xe_pm_runtime_get - Get a runtime_pm reference and resume
> +synchronously
> + * @xe: xe device instance
> + *
> + * Returns: Any number greater than or equal to 0 for success, negative
> +error
> + * code otherwise.
> + */
>  int xe_pm_runtime_get(struct xe_device *xe)  {
>  	return pm_runtime_get_sync(xe->drm.dev);  }
>=20
> +/**
> + * xe_pm_runtime_put - Put the runtime_pm reference back and mark as
> +idle
> + * @xe: xe device instance
> + *
> + * Returns: Any number greater than or equal to 0 for success, negative
> +error
> + * code otherwise.
> + */
>  int xe_pm_runtime_put(struct xe_device *xe)  {
>  	pm_runtime_mark_last_busy(xe->drm.dev);
>  	return pm_runtime_put(xe->drm.dev);
>  }
>=20
> +/**
> + * xe_pm_runtime_get_if_active - Get a runtime_pm reference if device
> +active
> + * @xe: xe device instance
> + *
> + * Returns: Any number greater than or equal to 0 for success, negative
> +error
> + * code otherwise.
> + */
>  int xe_pm_runtime_get_if_active(struct xe_device *xe)  {
>  	return pm_runtime_get_if_active(xe->drm.dev, true);  }
>=20
> +/**
> + * xe_pm_assert_unbounded_bridge - Disable PM on unbounded pcie parent
> +bridge
> + * @xe: xe device instance
> + */
>  void xe_pm_assert_unbounded_bridge(struct xe_device *xe)  {
>  	struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev); @@ -371,6 +444,13
> @@ void xe_pm_assert_unbounded_bridge(struct xe_device *xe)
>  	}
>  }
>=20
> +/**
> + * xe_pm_set_vram_threshold - Set a vram threshold for
> +allowing/blocking D3Cold
> + * @xe: xe device instance
> + * @threshold: VRAM size in bites for the D3cold threshold
> + *
> + * Returns 0 for success, negative error code otherwise.
> + */
>  int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold)  {
>  	struct ttm_resource_manager *man;
> @@ -395,6 +475,13 @@ int xe_pm_set_vram_threshold(struct xe_device *xe,
> u32 threshold)
>  	return 0;
>  }
>=20
> +/**
> + * xe_pm_d3cold_allowed_toggle - Check conditions to toggle
> +d3cold.allowed
> + * @xe: xe device instance
> + *
> + * To be called during runtime_pm idle callback.
> + * Check for all the D3Cold conditions ahead of runtime suspend.
> + */
>  void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)  {
>  	struct ttm_resource_manager *man;
> --
> 2.43.2

