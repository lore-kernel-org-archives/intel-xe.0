Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D464DC79F99
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 18:52:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D41C10E173;
	Tue,  8 Sep 2026 18:52:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MBeq+cKv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 384EF10E173
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 18:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788893549; x=1820429549;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=I8wWHcqSVByd8FTYVR35KKlNg6NLHluk3yC2wxOd1s8=;
 b=MBeq+cKvGoWn3BPinDtD5vdJ46cFLjrmvqXjATEH5W3o/KSFxsTJGp6E
 SooYUOdMGxiQ/wN8fC1omIYHBdm4kJPK7y1KYZ+GYr1OACKHc1t3iiSel
 NqJRdqqaQi9X2fWHV6adq1CcVHJzol3sZSJl8oEhguumejymPnVnYXCAb
 CH752HV0Qs8AzwnfJt/vFdaZLwIXDyUaJ5iWSWSnEpQm32tF99in96ONM
 dtlHoR2PQ8VOgQwPktqk0zjromL0fjYJkJORHdQiF/pe6+mnNkx8XJoO6
 mMzkfByO8cBfnssPu9CCom3byKA5eHHWUneSobbIWdMW4MJk7oAT4/95z Q==;
X-CSE-ConnectionGUID: zssvHRa1QyGpxLsjD2Do/g==
X-CSE-MsgGUID: OCvk888HSveQoBz3AcmAiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="88459385"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="88459385"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 11:52:28 -0700
X-CSE-ConnectionGUID: duq+yKptTMqIDOV/HEIKAQ==
X-CSE-MsgGUID: ozsmR0lfR4ecY2zrrOeYWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="276322544"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 11:52:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 11:52:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 11:52:24 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.14)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 11:52:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t/OyhLKObozT5iOZKhqxGC2+TOOjrgPSAnDBJYJLHYemACEl+wgK0bq6lDysa7L0y06PFcS+qFGouWNmTKUJ15lWQjtdj9DTFTA97sadzv6W6jRisFwbVr+2cZFMPPRhx5HTWIFayAsawo24flQfWp1vAp/fELmWNFeUP+/RZ/kS0EMkDC9dzQsGGikKC5NAI1+3uXuwCyxFRz09Msyip4Bu5a4eL2tyOA8qUtkOJDfiaApg5uJxXHmqzemj9KXpkOd8d33jeJd8kVqTZK+d0NpOmryknPwV7FU5XCxJoIv2TH893/7Dix29Ro+TobUSMAtAAFeF8veWm1n2CgO+9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1FwsGdZwL47Remys/pS3Xt2OiqvyBMt+rvpN1g33Ch0=;
 b=UC48h839yIgWGvNQBBZo7Tl4c+caVvc/CbSXpR0UOPUE7iv6Pac6sYyRGy+m8HfWogMz67Nn4vyhKPCC3L6uFkSK6PPtYIU+lur74rolscBVTYpzq7JUdbhT9uoRNpcwTOIERjdPC5YyNkgkEQvvPddgqsQxiz1JlGgFBMGsea1/51JjHEUvmUIsZ+ItVwRMW/3gZA6Z9vr59PyxGVvbfnV2sQXng966enYloSIHsBBLP8dp3chyYX9w4Fdx8c1XpUdzE/NRwTr84aul+rdFY8UNP0qxMQNip2jIGkr2D3sr2uuNSDro3nxkN2nF1ra5tYfsJXGvULEvAenrlVGnaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by SN7PR11MB6849.namprd11.prod.outlook.com (2603:10b6:806:2a1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 18:52:18 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 18:52:18 +0000
Date: Tue, 8 Sep 2026 14:52:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <mallesh.koujalagi@intel.com>, <aravind.iddamsetty@intel.com>,
 <heikki.krogerus@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/i2c: Expose AMC Alert reason sysfs
Message-ID: <aqBZXRgr6epDvWmE@intel.com>
References: <20260904160608.2004174-4-badal.nilawar@intel.com>
 <20260904160608.2004174-5-badal.nilawar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260904160608.2004174-5-badal.nilawar@intel.com>
X-ClientProxiedBy: SJ0PR03CA0335.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::10) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|SN7PR11MB6849:EE_
X-MS-Office365-Filtering-Correlation-Id: f8b3a33b-b97c-488d-5257-08df0dda4eb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|6133799003|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 0O5xthNgeNUBQkpKE4KzKnlltC2x3gehS/dUi9riyA5LYQ3XpJD80NkCQdgfxJ8oEL77OTF11KoJB4s6vx2us0wvcs6lX/l3fgUUd4tSTd7ctLsrsbZ6puOECkcyiL5KMFVSB7gpX2bz3AIkugwiqtr1ZsIJgNsVZLEdKnPKS7CwzwkFO4AF5c3zCa7JteBOvpdfsJYvzzTXGVA+1sDIG6dQSp8kwTJuFldiBR1yy49Hqy9lq3CoPMCUxtXsi7umN11PByb+HlhRFrPmlon/xxLf0ANWvPSY4ioTaPD0mPMHj2QmhQGsikwqfs3aOGg4JBKo9OuxdHydi661Px3trhAYXiIfVVAHsGZRB9n1C8MYXexylk6P8OSkmKGaPtFJPT3jaPjYzlJWL2uw3XcsiYk+Cxi1evdMJ6RG8h7OrIuXxpL8S/OR+LoLq/35R17mLP/plPkyNCYsxzpSBAEJrG+pVDwNxNZfwNaboaE/C+GKSajvec8sg5ebtMLiZQVI3kSFuWMNgXZavS/6YRR+/3trNgSg5LRRXkfbEmESqZVLmHQV/RisdHftyW5x7RQfCgD/c4sDfp2Hdf/X0JHDvkX96IExgCL+2AtMgyEL7Lem0mNzbqVcccT1OZbt30NgXnIFfVKDqyKZBVqMg44K1luYbwDMdm93t/Rn/bbaCCk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EQg1fJVwG4ourCxerKWb1aowXuyBLqwGdFRlmxqWOGvlK1s2RUSVtZsMitaY?=
 =?us-ascii?Q?IvPeiedvKDh7cOhxCsmEK1O5+DGE22XCaf6yD3IXgnm/5kWMk/lh2e8NuIVx?=
 =?us-ascii?Q?8ivm8CzUTElhggfvMBr/yl6wQnUzJYpflgyY0pk27tvPRZx7+GmzhhptPVJS?=
 =?us-ascii?Q?CYjPR74DJnOfrkhhD33bEZJw7k8n2KczAMyt+qEkw/nFmukBq7mxYWExPWod?=
 =?us-ascii?Q?45LCZ2I4242vI8MZ1xCh6snajjB/lpgZWj0QKJlx68c1+tLF5P90c5hl9OOq?=
 =?us-ascii?Q?mmBkJOWjS97NalFOavVyJT+JhHNW/rMmETqtUiVCQYF1e9AShOf7nm7AMEQQ?=
 =?us-ascii?Q?b0O+AOWyI+v2uR0DPNlf0b8IsT9wSgbMSlnI1ku7DJMbS5klDrlcCIu7d19W?=
 =?us-ascii?Q?v8PCF/PFPFhyzPj38CWRZttwm9HWAVoyvhRJ+xvnVHMnUQQVVyWfqbPuoRab?=
 =?us-ascii?Q?zrY7rmEqFLq3Zz9JPKLEg2EkwYR+9kih/GcXmBrGNG4yfjE6d/YsLdFwvzfI?=
 =?us-ascii?Q?LNy0NI9CO7ZWmg21KkhhMLSQbW8NEDSqsHMfvMtuXq45y+NOxfofJYFEv5Mj?=
 =?us-ascii?Q?5so5j2SL1gWmtmYPj0KAd8t18BJoO10cIpENA+owuM/gD8eBiai9rwGLOi31?=
 =?us-ascii?Q?ZnlMHaoiSWYswxAYpKTu/4UoWC/z8H+VTKNBP8ctLgRx3bRx7HiuX8+KV9Hu?=
 =?us-ascii?Q?3INReLtgyz4IGIBEH5P3W8EPlj1YcTLhqzaynw9M3fVNyoWgwAqi+H2AbAxT?=
 =?us-ascii?Q?wFHjS807YfIg9iE+ctt+1iqa+iUoBrbRyVx/Cz31mAVIS4T9gqel1rVOmyXv?=
 =?us-ascii?Q?2IYOBvx1ePxntzIjyN2x9l3CBuKpAbkBpbp063SJRKpr5d3HPQ0zLRMGpIPA?=
 =?us-ascii?Q?E35v/sRpeZTO4yTcAWthfLrYjgm7Pq/Bqtv8UauVg5rFlrWsTl3ZafMLuPdR?=
 =?us-ascii?Q?cqplEcnq59ds/JGld+tZcK96okno92q4hvJmXtBSSNLsN1FZMldR83EjsMxm?=
 =?us-ascii?Q?bbuThLAAiNrfncZUGBDPoDc6LxpP89vzdfdnq/NDHM8gInEfh7ooCBmjyA23?=
 =?us-ascii?Q?PYFVegYjHgNWpTX/kgiDokbNOvNvPmnUj+pOOqQbJM8uF1AkPY1gLU795TUx?=
 =?us-ascii?Q?s26rCqjyqshWDwuh4PFfWZsiDgZdLzYYXrbh5ys1Go7N4qgiZnhgKJnCr1oj?=
 =?us-ascii?Q?ZUjBRHkNQtNEN6uTXRw1mZtIEVP76pfQ7aJthAwjQUky6LBPchA3j+L7/c/J?=
 =?us-ascii?Q?uiPdkujGQP43IV2nsqcgZuCgQ2nFZ++h9ndgGiHAbULWF/AKc4seZ2DUKG9Z?=
 =?us-ascii?Q?998tH8avV5Ea8uEOgf7XTg9aXDT7bSWOcc8veWVvgz8MMt1n9+roMuGncXbD?=
 =?us-ascii?Q?L8oh/A4SsPH33D0lNM9GnXnGTVYjCCOhqTTeltul04T2b0MUfA4ndB748Tmj?=
 =?us-ascii?Q?aqdG/CgXEqByE2jVHUHEZvamtWtBxO5C110QEpJale9lkF7Q47VSy882huKu?=
 =?us-ascii?Q?GShfQoc8184DnLdSfITT/zXf1JNo5mTk4gKQ/btjHHejUM2t59h/r4iXIR9j?=
 =?us-ascii?Q?wKD28JcWwbv49FNeU1Sm7c+wPcbBHSex/nKYq38KCkJiei6wLMGcXEd/U0i4?=
 =?us-ascii?Q?JquQ7t91l4DzbB0/Alw+qF5Kiy9VKYbVag5Q1++ZYdwmvwIJWnTU3zaXgeT6?=
 =?us-ascii?Q?oT8uqcVp5Zt5V3hExp95PGVxRYpdYfZ+DSLE+M5oMdQrDkC7lJYNgPpgoJHF?=
 =?us-ascii?Q?3e8HqYL7rg=3D=3D?=
X-Exchange-RoutingPolicyChecked: iUrpeFFR50SB+0a3lp+WYG1FUHsM1PvshY0iThs4NBmQi1J+mUojJYP+u2CxWv+clEhTkxVONCJXCHinV+EM670aGSQRY8K4/n7HG3eGVzh8SLlsS1DudqHyzHE3/LryZYBywPXeogzapnC6rwLguFt+pOP44nSOY8LWGbqnYhFtGTKjBrh/ut2LTyXG8Yh7jEu4gWi3FHoZ8CbrKJKL+carSuC8NHoe3FDp1GcZ2xslEo/DtcS1Ri0We5o82VvLqBVIgYOZXzBj2z2d0WxWUAlA9zhPYkgQa0B/y2BPm/UlM1a2D8uNBjntnwqA3jhgycRHNMNIeLucJ6RxYkYJXA==
X-MS-Exchange-CrossTenant-Network-Message-Id: f8b3a33b-b97c-488d-5257-08df0dda4eb8
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 18:52:18.7256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6nG2oc3wzQNHlFv03hysJNRhvDnP8bnNwOPR1EkHoXd06HBnHJ29XDRTdowWX9MmbreCrZZGN3vZV5eAiyZIMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6849
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

On Fri, Sep 04, 2026 at 09:36:10PM +0530, Badal Nilawar wrote:
> AMC raises an SMBUS alert before performing a power removal or
> power-cycle operation. The xe driver then places the device into
> vendor-specific wedge mode until the recovery is performed.
> 
> Expose a read-only xe_amc_alert_reason sysfs attribute to help users
> identify the required recovery action.
> 
> Assisted-by: Claude:claude-opus-4.8
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
> v2:
>  - Created sysfs during i2c probe time
>  - Fix Documentation (Rodrigo)
> ---
>  .../ABI/testing/sysfs-driver-intel-xe-amc     | 21 +++++++
>  drivers/gpu/drm/xe/xe_amc.c                   | 61 ++++++++++++++++++-
>  2 files changed, 79 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-amc
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-amc b/Documentation/ABI/testing/sysfs-driver-intel-xe-amc
> new file mode 100644
> index 000000000000..4e5389163dbb
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-amc
> @@ -0,0 +1,21 @@
> +What:		/sys/bus/pci/drivers/xe/.../xe_amc_alert_reason
> +Date:		September 2026
> +KernelVersion:	7.4
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:
> +		This file exposes the reason for the most recent Add-In
> +		Management Controller (AMC) alert on Intel Xe platforms.
> +
> +		An AMC alert is delivered via an SMBUS interrupt and causes the
> +		device to be wedged, requiring vendor-specific recovery. This
> +		attribute is created when such an alert is handled and is
> +		available to all users as read-only.
> +
> +		Read returns a single line containing one of the following
> +		alert reasons:
> +
> +			Firmware Download
> +			Thermal Trip
> +			OOB Request
> +			OOB Reset
> +			Catastrophic

please make this non capital letters and no space

firmware_download
thermal_trip
oob_request
oob_reset
catastrophic

> diff --git a/drivers/gpu/drm/xe/xe_amc.c b/drivers/gpu/drm/xe/xe_amc.c
> index 8ecadee6eea3..c2d516c76502 100644
> --- a/drivers/gpu/drm/xe/xe_amc.c
> +++ b/drivers/gpu/drm/xe/xe_amc.c
> @@ -18,6 +18,7 @@
>  #include "xe_device.h"
>  #include "xe_i2c.h"
>  #include "xe_mmio.h"
> +#include "xe_printk.h"
>  
>  /**
>   * DOC: Add-In Management Controller (AMC)
> @@ -46,6 +47,7 @@ enum xe_amc_alert {
>  };
>  
>  static const char * const amc_alert[] = {
> +	[AMC_ALERT_UNKNOWN]		= "None",

shouldn't be unknown?
shouldn't be in the list above?

>  	[AMC_ALERT_FW_DOWNLOAD]		= "Firmware Download",
>  	[AMC_ALERT_THERMAL_TRIP]	= "Thermal Trip",
>  	[AMC_ALERT_OOB_REQUEST]		= "OOB Request",
> @@ -56,6 +58,8 @@ static const char * const amc_alert[] = {
>  struct xe_amc {
>  	struct xe_i2c *i2c;
>  	struct work_struct work;
> +	u8 alert_reason;
> +	bool sysfs_created;
>  };
>  
>  struct amc_header {
> @@ -104,6 +108,45 @@ static const struct amc_request amc_get_alert_reason = {
>  	},
>  };
>  
> +/**
> + * DOC: AMC Alert Reason
> + *
> + * On Intel Xe platforms, AMC sends an alert notification via an SMBUS interrupt
> + * to notify events such as firmware download, thermal trip or a
> + * catastrophic error. See enum xe_amc_alert for the full list of reasons.
> + * Upon an AMC alert the device is wedged and requires vendor-specific recovery.
> + *
> + * The alert reason is exposed through
> + * /sys/bus/pci/devices/<BDF>/xe_amc_alert_reason
> + *
> + * See Documentation/ABI/testing/sysfs-driver-intel-xe-amc for the ABI
> + * specification.
> + */
> +
> +static ssize_t xe_amc_alert_reason_show(struct device *dev,
> +					struct device_attribute *attr, char *buff)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
> +	struct xe_amc *amc = xe->i2c->amc;
> +
> +	return sysfs_emit(buff, "%s\n", amc_alert[amc->alert_reason]);
> +}
> +static DEVICE_ATTR_RO(xe_amc_alert_reason);
> +
> +static void xe_amc_remove_alert_sysfs(struct xe_i2c *i2c)
> +{
> +	struct device *dev = i2c->drm_dev;
> +
> +	device_remove_file(dev, &dev_attr_xe_amc_alert_reason);
> +}
> +
> +static int xe_amc_create_alert_sysfs(struct xe_i2c *i2c)
> +{
> +	struct device *dev = i2c->drm_dev;
> +
> +	return device_create_file(dev, &dev_attr_xe_amc_alert_reason);
> +}
> +
>  static void xe_amc_work(struct work_struct *work)
>  {
>  	const struct amc_request *request = &amc_get_alert_reason;
> @@ -158,10 +201,15 @@ static void xe_amc_work(struct work_struct *work)
>  	case AMC_ALERT_THERMAL_TRIP:
>  	case AMC_ALERT_OOB_REQUEST:
>  	case AMC_ALERT_OOB_RESET:
> -	case AMC_ALERT_CATERR:
> +	case AMC_ALERT_CATERR: {
> +		struct xe_device *xe = i2c_client_to_xe_device(client);
> +
>  		dev_warn(amc->i2c->drm_dev, "AMC Alert: %s\n", amc_alert[alert_reason]);
> -		xe_device_declare_wedged(i2c_client_to_xe_device(client));
> +		amc->alert_reason = alert_reason;
> +		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
> +		xe_device_declare_wedged(xe);
>  		break;
> +	}
>  	default:
>  		dev_warn(amc->i2c->drm_dev, "unknown AMC alert: %d\n", alert_reason);
>  		break;
> @@ -176,6 +224,7 @@ void xe_amc_handle_alert(struct xe_i2c *i2c)
>  int xe_amc_init(struct xe_i2c *i2c)
>  {
>  	struct xe_amc *amc;
> +	int ret;
>  
>  	amc = kzalloc(sizeof(*amc), GFP_KERNEL);
>  	if (!amc)
> @@ -185,11 +234,17 @@ int xe_amc_init(struct xe_i2c *i2c)
>  	i2c->amc = amc;
>  	amc->i2c = i2c;
>  
> -	return 0;
> +	ret =  xe_amc_create_alert_sysfs(i2c);
> +	if (ret)
> +		kfree(i2c->amc);
> +
> +	return ret;
>  }
>  
>  void xe_amc_exit(struct xe_i2c *i2c)
>  {
> +	xe_amc_remove_alert_sysfs(i2c);
> +
>  	if (i2c->amc) {
>  		cancel_work_sync(&i2c->amc->work);
>  		kfree(i2c->amc);
> -- 
> 2.54.0
> 
