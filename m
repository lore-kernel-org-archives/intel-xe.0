Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D564DCAC5B0
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 12:43:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C9E010E7D4;
	Thu,  2 Oct 2025 12:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MzWB1lQh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6896A10E7D4
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 12:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759409025; x=1790945025;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:date:message-id:mime-version;
 bh=Si2sZ0Kp+7sNzdoLUoKKlGkXiX2rH56fIeKPpAYE7OI=;
 b=MzWB1lQhNt6Kjn72gcUSAFwSg+wM6Qy29D74rgWSKRMwWNns6vMu2EuH
 UP6qH1ovq2myA0U6ZbcYB/ns2G9rw1S/M28nryc+Gal8Wt3FXWR/IzqKv
 nClKAcqn3xD0Py+L3FhGk9KX8pO5KH0tn9Tx5gepQ010XrrCuhbfJjRPd
 o6IDLc0XXldzcceRMeiyuZjH4LQ76wMoILqSrXmNwq8+C9igPn3oLftHP
 R1JlVrRvaKR1TFveGBDiIG4EBqbo+7IHT2JPtw7sSW4FerDvofl7DUcI3
 bBfhkIKE6isVEHbXB+BvBWRRwDMsk5JC+LJi3LiRz5BQHQHtLE62/owz3 w==;
X-CSE-ConnectionGUID: jUawSJoqQ4qPMCENGVfKKQ==
X-CSE-MsgGUID: yRubp6+xRHCqxdjGUJHrpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61792144"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="61792144"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 05:43:45 -0700
X-CSE-ConnectionGUID: +DbVMtb/RZu+qlKpvlO/tA==
X-CSE-MsgGUID: xTpj3g/jRjKBPHzfgIEq6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="178309558"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 05:43:45 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 05:43:44 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 05:43:44 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.16) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 05:43:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ipNYH32P9IZSf/PjqiXiEl6LRERM2uKywpUHaru+96a0mDiaWAjyeaCzqX8nlevJqvECn3YiCPDcgPkF2ElwqCuy4LHCpLjE6MtPdV7xSYHPtaeWVUk71SlLBH84FIg4/vZRM5KZblSd1JQPc/qCsZLnPXIYce/6ZhPl4K9zg88k7QDv42oz5PLN3T4prWy74axf82XSXixVXFCGy8yRuEYaiudbL6Ban/xldc0xgXzlTq+rPS24W+KpaFqT4Hn8lYcsSpwJOHX/CDiECcmKiTaqpEHwNkDlCEWFEgj9aQp0JOeRh6mPJ9BHhbuZqtg91V/CXOY3mlfaxrPvLYH9fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8OWDX4joZyxPUgfGMtB1mVo/0VZmad7zD9/BkXS6Ow=;
 b=bW3reaJrc1yVekgxkQiIkxilznNJox4JbnJN5CRNSjnsczVkujuo/aIJqMudAZv1acSbHtk/G8uqQcSLoraqiv1BlMcTeyLZu+uT3RXVtTAClZCDp/+TuX7CGphpV3cPeEAdoGcP+UZpp2x8a4lfkZFByCFY861Iv0yTmQjQeENBzitMZ2pwU+YsDCC70eQsu5AWDLT6uTJmrskv9nsTXFWohwv7yt3CoWiW/td1tzS4Dq9vz5xxLq3/+Yr65SJlschL7/wiaF6hROnmiW8c2umM0sEcIAC/QF/HXiNJ8J98C6hPG9I2AZgM4KS1bHwPLdP62IPwvcjeYOtHCYk0bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by LV8PR11MB8584.namprd11.prod.outlook.com (2603:10b6:408:1f0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Thu, 2 Oct
 2025 12:43:36 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9160.015; Thu, 2 Oct 2025
 12:43:36 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0ce62511-3c46-4d1a-aef9-8c5f5a4f4d0a@intel.com>
References: <20250930225618.140071-25-matthew.d.roper@intel.com>
 <20250930225618.140071-32-matthew.d.roper@intel.com>
 <0ce62511-3c46-4d1a-aef9-8c5f5a4f4d0a@intel.com>
Subject: Re: [PATCH v3 07/23] drm/xe: Read VF GMD_ID with a
 specifically-allocated dummy GT
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 2 Oct 2025 09:43:32 -0300
Message-ID: <175940901218.1952.3042709661416045697@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR03CA0081.namprd03.prod.outlook.com
 (2603:10b6:a03:331::26) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|LV8PR11MB8584:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d8c0a90-d68b-4975-eab4-08de01b14de1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RHNFZnEvc053UVRLTjBRU2JKR0FYekREYnlsS29uWVNEUVF2Nzhib2tmYVlp?=
 =?utf-8?B?dXFyY2d5SWdORlA4SUM4WG5xRGZLZzdNand4ZUs4YnM3WFRxdEg2d0NSVTI5?=
 =?utf-8?B?OE5PWFdpZ2dDTVhvbTlNdTZPTHpGQS9MajIvaFRYQ1VkZjQ1YWZWL01SNkFk?=
 =?utf-8?B?UGJFVmsySjZGZFJNVWhQa2RKY2dKWTZ3WG8yTFVkYjB3RTZuZE9DM2MydW5q?=
 =?utf-8?B?d1hET3BaWXZQekhpcnpQM1ZnVzM3MWVvMS9yNUxnTW9RVG9rZS9UdVhUVGt2?=
 =?utf-8?B?VXpteW1JMXkxV2ZJazdIbDRYaUNaWTlRTVczQlFOcGZDOXZHdjJrbUg3dXB1?=
 =?utf-8?B?dVQ4NW5NT3FOS1lIQ3FrN1dTelRIVm9LWDk2ZkxrWjdjTXlRK09mVDRvUUwy?=
 =?utf-8?B?ekpnSjduNmRCRENSTXgrNVRzR0MvQXZLRjR6R0d5Sk1XL0dQVW9tbnFGenpL?=
 =?utf-8?B?YllzdE1aWi9zTWNZU1U0eUtsTTRhcVJRM0ZNUzhHdUxMZ0N1ei92WVg1RjJ3?=
 =?utf-8?B?eUh0S0YrRVYvTlZNOUNlczN4SWZlYkFYL0FyanlDOTRKTFZtaThpR3dqRmlU?=
 =?utf-8?B?WDdxN01DcXBBM2lHQ21kUkd3T0s1RUtEajR5ZnRhZVlhbGNJSFB3R0Q4ZjIv?=
 =?utf-8?B?OE5BOHhZWkxiMEIxcXZCMFVRY3lIYkQzTHpKblJKRU4rbTlnNVhmRllRaVB1?=
 =?utf-8?B?VGIyNjV6S3Avd3MrY1JXMWc5dzNQVHZQSVBqcHg4Y3NZR0laOHY3S0RXcVV0?=
 =?utf-8?B?M0xzSkE3YmJXODYvc3VKaVdOUHQwNFJQV0ZhaHU1L2srZXpLczhkK2FGeElD?=
 =?utf-8?B?VGF3TWlUeG51dU56TC84eENsc05lWmNKS09NUnI4emwrWDhOSkllUlQvbDlB?=
 =?utf-8?B?YzlPTS9tZDMxcnl6c0tJV0FldVVwbnFvUG1MZzBLV3FaNGxlUDNXRFoyeC95?=
 =?utf-8?B?S09UUWh0aG1YK29BWU55RE44U1ltMCtVZzlTR2U2cDArelFLaWRIWjZIL05C?=
 =?utf-8?B?OGp4c1lUVVNubG1sWlBsMjV5Z2tyeHd5Nnh5MHcwaE1rdGc1WW00enVrS2Nt?=
 =?utf-8?B?SHFhSDM2Qm5OVDYvNnVZNTRhOVhrcnEyMG51WWRIUXl2ZVhaTTNQb3NpNHd0?=
 =?utf-8?B?N1BMUGlVUGo5UkRFWE5KNEh5eXRBRW5hWFFZN1NhWWJFandESEQzYkYwUGRj?=
 =?utf-8?B?M21tbXhzMC8wT1lON2ppK2Jsdm5nSE9BemlTNzhrTWZ2aW5tdkp2WXh1cHoz?=
 =?utf-8?B?NTZ2R2xaTWVOMVZ3ejNEYkpuKy9RRkFVanlmUTRMUW1qS3NXNjl5d1NFUFpo?=
 =?utf-8?B?bHVpclY0Q1FwYVpXeHNmM0JIdFozMWtUcDJJS0tQZjZaODdUS3NaN0JydkN2?=
 =?utf-8?B?eVdsOWx1K1RyZmdNWkV2R3VSVnNvZnNkdUZGdHRIajFKK2MxMExibzJMWWNY?=
 =?utf-8?B?YnVJb0VtTmE5ZU04T3RQVzYxUmx5ZUhUYVk5MUFKSlZlTUp2d091Z1dtZEtI?=
 =?utf-8?B?cFBvMXprcWZHOGVGdTFPeXN6ckFoZHJseHUySjlxczBKS1daaFlNYjcwWTZZ?=
 =?utf-8?B?WHdOYkU1YnZZbHMyM0FIN3Jpblpob3VUMkZ2SlNnU2dpVXg1ZFk0VDR4YVlV?=
 =?utf-8?B?UXdCVm9DSEQ2cjNHajRnZVRuODFvbnhWbnBIOXhFRnNaZ1B0Yy9XS01hZFMy?=
 =?utf-8?B?dUhJM0tvS2tVdDhyT2thVFQ3TVZGQitQcnRzekFpUGhNUC80REVpRFNMbFhp?=
 =?utf-8?B?RUI2aGNUOTBZYkxNOFpLaFhUbHMzLzhWbUM1dktJb1F5d3UyTXlOSFROVDFw?=
 =?utf-8?B?Ym5YK1pPSzBsRG1HUUZDTHJqZ2RldE1GS0dXcndnUzV5aXh0WmRCUUNPYmNY?=
 =?utf-8?B?TVRxSU9zbHpiNFF3OGg3cURwNll0R0IvUHQ5Wlc4eVl2a0o4Zm9mQjJOaDRi?=
 =?utf-8?Q?/bGeFxcNI32kgHV5Gga+C97sf8/AuHwU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2Y1d05JL0cwRTJDK1MyY1JFNnhOKy9nRzRkMktNUU1JRjZvcEdqbDNxemFs?=
 =?utf-8?B?RnBCQWtNR2tLOXRqRGZLNzl0clFyb3RVQ1p3RDhBY3NHL3ZVSWY5RERVOEQ4?=
 =?utf-8?B?MTZyVU43MHZWb1k3OHVlQ1FiaG0vM3pKOFpUQk1GbTRmaDlWUmxBOUlsZ1Bp?=
 =?utf-8?B?R3FZR1JEUUtJZnUvUDg0cXE0OVlqSjFQcXJhRXFMdis0YlV2d29YeU5iaG5m?=
 =?utf-8?B?Skl2dWxhVU5UdUJmSWY5UERwa01vNUF0ODZLRE9mVnVCT25lR0E5K3hPS01r?=
 =?utf-8?B?cUc5b3AyYkZjalVJenRGaVNtRGt1NXpReHphZ05nYXRPc1JaMUFoL2prWk1S?=
 =?utf-8?B?Z2pPM0xVYW9oZFdBSkxLU25nWDZ0cFN2T2VZckpaaWo4YkJDQlR4UEV6SjJs?=
 =?utf-8?B?S3FWWUl6Ukd4NnE1aDZwVExqN2VrM1NtL0E2b3RoVGZkNk5Uc3RLRndvWmRX?=
 =?utf-8?B?ZGszK0g1bW5aTFF2QU5pT3luNTV6V3dFSWMvVjA0VHB0b1JHVlJua1ZzKzAx?=
 =?utf-8?B?VjVYbm1xRXpTK3dtT1B4S1dQczR0RkVzOEdQakczYUlhYW1RSDZId0pHc1Ra?=
 =?utf-8?B?bU9pYmo1Q2JnTU5janYzWko1bWlmWmZET3h5ZG80aFFCNk81bWMrSlloVWhx?=
 =?utf-8?B?Q21FNTc3RklTM2dYVGJ4c3JxQktReXNNWmpaVHhha2QvRk1mem44NUNuQmNZ?=
 =?utf-8?B?N0Q2WXdObm5LK05zK0pQNDhoZjM0WEs1WVI5WU1vblpUOUVPUFNQbEw1NTMv?=
 =?utf-8?B?Z2lsVmdzTXFSeWZzMzcyRExSMzU2QXhoOTVFeDdHWG1OeFk4eVZkdjYySGJF?=
 =?utf-8?B?Y25NMjBrWkhZMENpRlZYRlBtellWSGU0QWpaa2JkT2x6dy9kcktEeXlZRjVG?=
 =?utf-8?B?a1NWUFcxd24yWXduVnhLdkoxMytyZGFnZmN1bjZlWXBsalVLalVJcHpGWm5w?=
 =?utf-8?B?L0ZRS0t6T3pkaE00WFNjMEVIK1NvRk9YM0FGMy85SHdKdkZhUGt5V2dmc3hU?=
 =?utf-8?B?NzJVVlI3TUhITVRiamxDQjNnZm9RSkJCcTBoMmR0aENsdXA3cy9scjNQQXIv?=
 =?utf-8?B?ZXRLbkI3WFdUU2J6OGFwZGpsMURmSld3d1Rndm1rYUJrU3lBNWNXWUFWV0dM?=
 =?utf-8?B?Y1A0dS9UWjV3TjZWQ0gvckVCalRUNDBhQlMzYUhjc1RmUEttT3hwc203WDZ2?=
 =?utf-8?B?U3RYQ2hCRWRNbDRRQzkxVjNsVy9wejl5WjBkSGlaNVczTGZQUncwZDFUOUVE?=
 =?utf-8?B?cVorMUVBTUtPbTU5LzhRZkg3dG5heklEemZSMjFXZFNCUmt4SkpvZXQwTW03?=
 =?utf-8?B?c0JMV2JnSjIyVnk5QVBLY1R5VkY5TWI0Yy9saC9vZ2xxWkRCaFgyVit3UUxn?=
 =?utf-8?B?bFVSNjJBUGJ0Q3dVcWJsZWdvY0NadG9hWjBac1kxM1RGY2s2Y3ZRYkZ6TTZE?=
 =?utf-8?B?dWZlQnAxZUhFaHBoOFg3QTV3YVFWZGhENkxSRVZFVm1qTTAranBLdThSTEZL?=
 =?utf-8?B?QVV6aUE4cEFjL2xUUEkra0EvMkx2U3FUVTV6bWQvMkRPcmNHeStCb2VORUtJ?=
 =?utf-8?B?T1YwVnlDSk56MWZiK2wzY0xpQlZHcnpDaTRZSDliTWdFMElUZ1A3U1FRWDdy?=
 =?utf-8?B?cXRUVmJFWU1XRHU2eEZva3RKYUtGaFZCaFZlYWtBTnoxeWVEd0tTM2I4OHdX?=
 =?utf-8?B?VVh5S1lQc3hUZTJPNnh5eldqOXBFWUxhQXMvRVVRcjRLRmxDREFQdldZdGM3?=
 =?utf-8?B?VUFuZWhzNTZsaGxyUXJYU2lqQllsNDJjMzUyWmRnVXVYVWJGeTRUMFBtUzFv?=
 =?utf-8?B?YThDT2dSVHJ5dE42VTRxdVhQeVNEa1doSDdhVlRHaFM3VzVqK2psa2RuS3ZN?=
 =?utf-8?B?bDNMMTF5dWRGckVnaTMyaE44aFlEK2lhcE9XZU9YbkV5QXE5U1RYdEZ2dlM5?=
 =?utf-8?B?aVFENUVWNHVVUXlJc3pLamM5NjBoU3I3ekhzVlV3eEY2UzZzSzZIWWVGU0RO?=
 =?utf-8?B?Y0ZjdUlYRjlVc29Td3pWWW1pZ2l2OEU4b1UrclQvRlRHQkgxQ1RTTHBoTmRq?=
 =?utf-8?B?SmE5dW1oUzZPZkVGWXZ6RlQwUEhjVTF4d3F4K0xXMUNsQWdHeHJpRG5zSUI2?=
 =?utf-8?B?b1NraGV2bzhtd1lrRVY2V05YY3B3TmFSQmJzNHltN1pkR0tyOGlnMVNqOUtn?=
 =?utf-8?B?UFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d8c0a90-d68b-4975-eab4-08de01b14de1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 12:43:36.4694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UAtBMXY9iDCFtu1aE6n7y6gAav5kWrnta7wHxJvzzQggH/zGLTv2N3WuLcZLNTtsdj6FLK+baFB80CxeIoep5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8584
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

Quoting Michal Wajdeczko (2025-10-01 07:07:04-03:00)
>
>
>On 10/1/2025 12:56 AM, Matt Roper wrote:
>> SRIOV VF initialization has a bit of a chicken and egg design problem.
>> Determining the IP version of the graphics and media IPs can't be done
>> via direct register reads as it is on PF or native and instead requires
>> querying the GuC.  However initialization of the GT, including its GuC,
>> needs to wait until after we know the IP versions so that the proper
>> initialization steps for the platform/IP are followed.
>>=20
>> Currently the (somewhat hacky) solution is to manually fill out just
>> enough fields in tile 0's primary GT structure to make it look as if the
>> GT has been initialized so that the GuC can be partially initialized and
>> queried to obtain the GMD_ID values.  When the GT gets properly
>> initialized during the regular flows, the hacked-up values will get
>> overwritten as part of the general initialization flows.
>>=20
>> Rather than using tile 0's primary GT structure to hold the hacked up
>> values for querying every GT on every tile, instead allocate a dedicated
>> dummy structure.  This will allow us to move the tile->primary_gt's
>> allocation to a more consistent place later in the initialization flow
>> in future patches (i.e., we shouldn't even allocate this GT structure if
>> the GT is disabled/unavailable).  It also helps ensure there can't be
>> any accidental leakage of initialization or state between the dummy
>> initialization for GMD_ID and the real driver initialization of the GT.
>>=20
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> ---
>>  drivers/gpu/drm/xe/tests/xe_pci.c |  6 ++-
>>  drivers/gpu/drm/xe/xe_pci.c       | 61 +++++++++++++++++--------------
>>  2 files changed, 38 insertions(+), 29 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/test=
s/xe_pci.c
>> index 0f136bc85b76..969f1dacade8 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>> @@ -307,8 +307,8 @@ const void *xe_pci_id_gen_param(const void *prev, ch=
ar *desc)
>>  }
>>  EXPORT_SYMBOL_IF_KUNIT(xe_pci_id_gen_param);
>> =20
>> -static void fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type ty=
pe,
>> -                            u32 *ver, u32 *revid)
>> +static int fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type typ=
e,
>> +                           u32 *ver, u32 *revid)
>>  {
>>          struct kunit *test =3D kunit_get_current_test();
>>          struct xe_pci_fake_data *data =3D test->priv;
>> @@ -320,6 +320,8 @@ static void fake_read_gmdid(struct xe_device *xe, en=
um xe_gmdid_type type,
>>                  *ver =3D data->graphics_verx100;
>>                  *revid =3D xe_step_to_gmdid(data->step.graphics);
>>          }
>> +
>> +        return 0;
>>  }
>> =20
>>  static void fake_xe_info_probe_tile_count(struct xe_device *xe)
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 37ae49f4b648..9fb5df10844d 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -464,7 +464,7 @@ enum xe_gmdid_type {
>>          GMDID_MEDIA
>>  };
>> =20
>> -static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u=
32 *ver, u32 *revid)
>> +static int read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u3=
2 *ver, u32 *revid)
>>  {
>>          struct xe_mmio *mmio =3D xe_root_tile_mmio(xe);
>>          struct xe_reg gmdid_reg =3D GMD_ID;
>> @@ -473,21 +473,19 @@ static void read_gmdid(struct xe_device *xe, enum =
xe_gmdid_type type, u32 *ver,
>>          KUNIT_STATIC_STUB_REDIRECT(read_gmdid, xe, type, ver, revid);
>> =20
>>          if (IS_SRIOV_VF(xe)) {
>> -                struct xe_gt *gt =3D xe_root_mmio_gt(xe);
>> -
>>                  /*
>>                   * To get the value of the GMDID register, VFs must obt=
ain it
>>                   * from the GuC using MMIO communication.
>>                   *
>> -                 * Note that at this point the xe_gt is not fully unini=
tialized
>> -                 * and only basic access to MMIO registers is possible.=
 To use
>> -                 * our existing GuC communication functions we must per=
form at
>> -                 * least basic xe_gt and xe_guc initialization.
>> -                 *
>> -                 * Since to obtain the value of GMDID_MEDIA we need to =
use the
>> -                 * media GuC, temporarily tweak the gt type.
>> +                 * Note that at this point the GTs are not initialized =
and only
>> +                 * tile-level access to MMIO registers is possible. To =
use our
>> +                 * existing GuC communication functions we must create =
a dummy
>> +                 * GT structure and perform at least basic xe_gt and xe=
_guc
>> +                 * initialization.
>>                   */
>> -                xe_gt_assert(gt, gt->info.type =3D=3D XE_GT_TYPE_UNINIT=
IALIZED);
>> +                struct xe_gt *gt =3D kzalloc(sizeof(*gt), GFP_KERNEL);
>
>nit: we can use __free(kfree) here ...

Taking a step back, do we really need to allocate this? I get the
impression that keeping the dummy gt on the stack should be fine since
we are keeping its lifetime constrained within this function.

--
Gustavo Sousa

>
>> +                if (!gt)
>> +                        return -ENOMEM;
>> =20
>>                  if (type =3D=3D GMDID_MEDIA) {
>>                          gt->info.id =3D 1;
>
>it looks that it is still crashing in xe_gt_mmio_init() called from below
>
><1> [146.543510] BUG: kernel NULL pointer dereference, address: 0000000000=
000028
><1> [146.543528] #PF: supervisor read access in kernel mode
><1> [146.543538] #PF: error_code(0x0000) - not-present page
><4> [146.543611] RIP: 0010:xe_gt_mmio_init+0x27/0x1b0 [xe]
><4> [146.544175] Call Trace:
><4> [146.544182]  <TASK>
><4> [146.544196]  read_gmdid+0x12b/0x2a0 [xe]
><4> [146.544601]  xe_info_init+0x50e/0xc90 [xe]
><4> [146.544948]  ? drmm_kmalloc+0x87/0x100
><4> [146.544968]  ? xe_device_probe_early+0xdf/0x230 [xe]
><4> [146.545253]  ? pci_write_config_word+0x27/0x50
><4> [146.545274]  xe_pci_probe+0x163/0x600 [xe]
>
>likely due to NULL gt->tile
>
>> @@ -503,12 +501,7 @@ static void read_gmdid(struct xe_device *xe, enum x=
e_gmdid_type type, u32 *ver,
>>                  /* Don't bother with GMDID if failed to negotiate the G=
uC ABI */
>>                  val =3D xe_gt_sriov_vf_bootstrap(gt) ? 0 : xe_gt_sriov_=
vf_gmdid(gt);
>
>... so in case of bootstrap error we can easily return actual error,
>instead of returning plain 0.00 version
>
>> =20
>> -                /*
>> -                 * Only undo xe_gt.info here, the remaining changes mad=
e above
>> -                 * will be overwritten as part of the regular initializ=
ation.
>> -                 */
>> -                gt->info.id =3D 0;
>> -                gt->info.type =3D XE_GT_TYPE_UNINITIALIZED;
>> +                kfree(gt);
>>          } else {
>>                  /*
>>                   * GMD_ID is a GT register, but at this point in the dr=
iver
>> @@ -526,6 +519,8 @@ static void read_gmdid(struct xe_device *xe, enum xe=
_gmdid_type type, u32 *ver,
>> =20
>>          *ver =3D REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 + REG_FIELD=
_GET(GMD_ID_RELEASE_MASK, val);
>>          *revid =3D REG_FIELD_GET(GMD_ID_REVID, val);
>> +
>> +        return 0;
>>  }
>> =20
>>  static const struct xe_ip *find_graphics_ip(unsigned int verx100)
>> @@ -552,18 +547,21 @@ static const struct xe_ip *find_media_ip(unsigned =
int verx100)
>>   * Read IP version from hardware and select graphics/media IP descripto=
rs
>>   * based on the result.
>>   */
>> -static void handle_gmdid(struct xe_device *xe,
>> -                         const struct xe_ip **graphics_ip,
>> -                         const struct xe_ip **media_ip,
>> -                         u32 *graphics_revid,
>> -                         u32 *media_revid)
>> +static int handle_gmdid(struct xe_device *xe,
>> +                        const struct xe_ip **graphics_ip,
>> +                        const struct xe_ip **media_ip,
>> +                        u32 *graphics_revid,
>> +                        u32 *media_revid)
>>  {
>>          u32 ver;
>> +        int ret;
>> =20
>>          *graphics_ip =3D NULL;
>>          *media_ip =3D NULL;
>> =20
>> -        read_gmdid(xe, GMDID_GRAPHICS, &ver, graphics_revid);
>> +        ret =3D read_gmdid(xe, GMDID_GRAPHICS, &ver, graphics_revid);
>> +        if (ret)
>> +                return ret;
>> =20
>>          *graphics_ip =3D find_graphics_ip(ver);
>>          if (!*graphics_ip) {
>> @@ -571,16 +569,21 @@ static void handle_gmdid(struct xe_device *xe,
>>                          ver / 100, ver % 100);
>>          }
>> =20
>> -        read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
>> +        ret =3D read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
>> +        if (ret)
>> +                return ret;
>> +
>>          /* Media may legitimately be fused off / not present */
>>          if (ver =3D=3D 0)
>> -                return;
>> +                return 0;
>> =20
>>          *media_ip =3D find_media_ip(ver);
>>          if (!*media_ip) {
>>                  drm_err(&xe->drm, "Hardware reports unknown media versi=
on %u.%02u\n",
>>                          ver / 100, ver % 100);
>>          }
>> +
>> +        return 0;
>>  }
>> =20
>>  /*
>> @@ -690,6 +693,7 @@ static int xe_info_init(struct xe_device *xe,
>>          const struct xe_media_desc *media_desc;
>>          struct xe_tile *tile;
>>          struct xe_gt *gt;
>> +        int ret;
>>          u8 id;
>> =20
>>          /*
>> @@ -705,8 +709,11 @@ static int xe_info_init(struct xe_device *xe,
>>                  xe->info.step =3D xe_step_pre_gmdid_get(xe);
>>          } else {
>>                  xe_assert(xe, !desc->pre_gmdid_media_ip);
>> -                handle_gmdid(xe, &graphics_ip, &media_ip,
>> -                             &graphics_gmdid_revid, &media_gmdid_revid)=
;
>> +                ret =3D handle_gmdid(xe, &graphics_ip, &media_ip,
>> +                                   &graphics_gmdid_revid, &media_gmdid_=
revid);
>> +                if (ret)
>> +                        return ret;
>> +
>>                  xe->info.step =3D xe_step_gmdid_get(xe,
>>                                                    graphics_gmdid_revid,
>>                                                    media_gmdid_revid);
>
