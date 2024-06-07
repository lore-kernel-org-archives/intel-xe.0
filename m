Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9133C27C5F
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 14:52:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA3110EC8A;
	Fri,  7 Jun 2024 14:52:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y+cjzAvc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CABA310EC8A
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 14:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717771931; x=1749307931;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=5nyHVtZtsd6KEiOqUK6PxNlTGcoLF7e2pIPQwlU0JV0=;
 b=Y+cjzAvcXyY+9KIAMj+Hiky5tJpLL3yoObDVc3E07TCGX1s+2Lzf5srt
 PghDDT9/STcK2cqJSjJttid6IsM23JvUSbtXnGcWPd+QE5oxhHUcgHfru
 Ocn/rLwc0dOxKQXoXBOeXwHuI1qxLYMyCUstaF4oyTSLogYzPUcW3R586
 8ohhrRqaGyPXMe7Sz5oYqrSs8z+qHoJLrZ4hCEcYFmbc3ivA0xclBqovD
 6zT3+CetqoqVsUd9eW63tTcHkqFcqaS9Ha0pWwao73ZdpMDC0m1F+RyZI
 Fjz6x8QIh+IF8vY1ZfTz8qjZscBnumdhzIg13pLolor/Ctuy5hbV94IKx Q==;
X-CSE-ConnectionGUID: P7IH5NSgQY66gBaqi7GkEA==
X-CSE-MsgGUID: f///Nh0gQxmDgJAsN/08jg==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14614533"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14614533"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 07:52:11 -0700
X-CSE-ConnectionGUID: VB2a49vfRHa4sYXmfHXCBQ==
X-CSE-MsgGUID: wba2QCgUSmiOen0/KPORCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="43277131"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jun 2024 07:52:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 07:52:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 07:52:10 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 07:52:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KNpp6fh1LBD5lAgU8+ffujO5xsI5PFm/HDhdMWezFMPyGXFFQF2VfkFAmXG9HIr5CqmLqLucZuMa990UqynfOtLTJqDoE2pTynMm9fzt+vRXGm4Ldr+r6PQIE5o4bEJxmpKt7CPE6G35NZzxuHrO16mpT+TVIgjq9jUWxvt1Mbs4P9tMPn6buU1FnTKYriMmAfnop+8uuiowjzl85yMaJx2Hb7/0x0xtVwrlJqF4PLL/V6vS9CQJ5Wx3jR8D1fuJ01y9CdIbeLmgLLnSwYG9PxJHY8JN3D2YigSlFSTsKezaNypQGMpxFDNyih6QiRg6erpZNlHMrbSG/eCdspgRqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ITrYEbY6O63PpqS1qk4oFz2SGy+4CWF8PUt2RvYbeLk=;
 b=LlYHE4+Axene/v4i+colHyVJOfqHgYke7jerHec/ZzKTPwmpEovzgO9Pepz+J4Zz7hSSP+h4kx97B9yHQNuoLx44Nb5zSn/qkEi/x15WaehFXEBabBrsrJCrc+7d9siyX/XSTBHSY+ms3lw0hLyr5J6m/rrsglzGpn1I4AwPtySZf5xFv5kZck6DHFsPMsfJ0QcOmhFBijtcZtwnuusV0aDiflBo5DGiO1Psjuypfl6lb9Knxw4LyyLq8KLhp2pmc/YCdpXk6ObSzq+KdB5diZUj9+jMLMnV68v+6q0FAYZ65HzPkm6b4qDgT1C+3W0O6KxeFDTO3xxSAU/FZxP77g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA1PR11MB8492.namprd11.prod.outlook.com (2603:10b6:806:3a3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Fri, 7 Jun
 2024 14:52:08 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7611.016; Fri, 7 Jun 2024
 14:52:08 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240606223819.3545560-7-radhakrishna.sripada@intel.com>
References: <20240606223819.3545560-1-radhakrishna.sripada@intel.com>
 <20240606223819.3545560-7-radhakrishna.sripada@intel.com>
Subject: Re: [PATCH v5 6/6] drm/xe: Add reg read/write trace
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Fri, 7 Jun 2024 11:52:03 -0300
Message-ID: <171777192397.2025.3437226296313371777@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR13CA0231.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::26) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA1PR11MB8492:EE_
X-MS-Office365-Filtering-Correlation-Id: 341838af-5408-441b-b3fe-08dc8701674c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXI5K2pZNEF2S01CQW5URyt6ZFBiNHVoQzJ1N1JqZkhBNWFDN05GcEEwa1hW?=
 =?utf-8?B?b3k5M2tVSVE5d2JwS0M3MnhKQWpBMGZQOHJUQkxCLzZKUnZ1bVlqM3BmWmdF?=
 =?utf-8?B?aFJacDVxK1lsaElPaXdSOW5NcnlRUjMyODQ2ZnR1UHUyRmordnhuMXoxU0FH?=
 =?utf-8?B?bWxacUQ2cGE2ZVZpV1Y3d05BVzFjeVNBNDhmdGFzNHhRcXkrcGV6YUdXNkYv?=
 =?utf-8?B?a09HYVRkT1JUd3UrSDNDSEpwQkdWeTJnNEFTMkEvd0NsL0ZOVWhmWjZ1SHh0?=
 =?utf-8?B?N1pPY2djZFJNRGV4bmZPNEJHckN0SkZ0Qlc1T20xaWZZRzVGWm9QblpJVER5?=
 =?utf-8?B?MHRUcXA1MDFCb2d0cXQwTVg1ZDF6SERhKzFIYTcwSHZPTWpBVGQ3VDRHSXNY?=
 =?utf-8?B?K3IveW9KWW5SUTJZOUtBSVFGMWVJOTBETXdFbkgzdVYxR0VBY1QyK2pIZ3FT?=
 =?utf-8?B?NGl3ZnZNN1hTS01qSXVJcTRhWFh6RVVub2h5U1p6bE1TYkxhMGR6anFPZnQ3?=
 =?utf-8?B?bHY4U3NNNUt5UndSdytoUUVjY1UwVWVrbnB5R3plTEVTMFlDZ1NWaW9qQ0tB?=
 =?utf-8?B?T1NzeDNwUVFaMWRnbDJzSlo5Z2pSRkJjNjhWR0JzWFRudUNqOFd3M2VsYzEy?=
 =?utf-8?B?QzMrWmw3WVptQ3AybG1LYi9HWFNzVG5kLzNZQ1BHd204Q2RSWEp4Qm5TT2hD?=
 =?utf-8?B?TGlrNm5KcXk0QmRPNEpsM1BPdTVPUGZ5dE56TkxqSnEwbXJ2S2xZY3RSUDZ1?=
 =?utf-8?B?ZEF4eGd6MDNwczRlQUtwYWpCZUt4TFRvdnhVYjdUbVJTdUNnMndLSnJOOERx?=
 =?utf-8?B?cHpqdmFWbyt2SWxJaXhQV25DVWVRRnU1VlQxdlRDRXJxekdzanRsd0dtd3JQ?=
 =?utf-8?B?aFR0cXBZaFVNMkg4U0luVEk0cXdGVWdDTEZ2dWUvalljSkdjZGIwdkp3NnFM?=
 =?utf-8?B?c3hUWEMzMmtwdEs4aGFlVzNLTGx3UHFPZlcyb3c5Qk5aaHppdG1tYmZOYUtD?=
 =?utf-8?B?aWY2TDcyUk40a0VQNGtiOVZKaE1MMWxGYWJHMnRrVnFXQ2xVYW1zMk5nNFlX?=
 =?utf-8?B?cEhYNWVwVlJKZSsxZDY3WnNkcnVaaWFPTlMxaWRXYWdBbi9hRzVBUnpjQVQ3?=
 =?utf-8?B?aXJ2S2ttZWk3dUtEZ0s5QzVqZUZOdnljTkU3Sm1RdG1wRTlvalBVbjA2WWUy?=
 =?utf-8?B?YWFGYVZNSm5ua1B0Q25VTTcvNmpUaFUrMGUzYmVuK0h0YXNBR0UvNCs2VmR1?=
 =?utf-8?B?NGNQR0g1eEMvYXJDNHVKaXg4amphZXh0VnRkT0NuY3dOaVlSUkkyVkNRVWps?=
 =?utf-8?B?MDQrRXZPaGU2cmVmUm4yRzQ1MEtMSXdHd2Vpd24xSzVYa2VGV2VzZGp3K1JS?=
 =?utf-8?B?ei9ZdUM4c1RZSHFYaS9zczd3QjdSV2plSXd6dzRmWWwwYmcyQU5lRW1xeWsz?=
 =?utf-8?B?MUpQTkljbnFHd3doZ2t5MFZMaUlKUE84RnU2VndlbEZlUjZjZjRuWFN6S1Bt?=
 =?utf-8?B?ajhmSm9XWm5FaWFsQ2Q4alpJQnNpWjN3YU1SQ3pwU1RmWnBJVE9oUURtWUZV?=
 =?utf-8?B?RmtLZDYrU2Y0ZFYwRk0zU1RBekpkSDR6Mmt1aXhUU3lISHJHTXl4NHpKYnFC?=
 =?utf-8?B?RnNzRmk0cGFRVm9icndyTjJGalI3b3NoSWFKUWRUQmQ4ekN5VFhDdUxCMTZy?=
 =?utf-8?B?NzdOR091MUpvbTh4NjlEYkRHdkZ3MCtTZmJiRncweXVHZEdwMXBxcWE5WE1z?=
 =?utf-8?Q?JLTkcaAO9w8TKLdprHNhBMW9jCkU5kc/CfsAlQ4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blFvd1UwVFF4NlNGNkFmQzB1SkVYaWR2SU9IWkxwdVV0bHVmendUZG1iNHVY?=
 =?utf-8?B?M1hEUFdkRnFzNTAvZE9iL1FmTWs1eGlONkNBRzdwdmIyMlNQNUVsMFBKcWp3?=
 =?utf-8?B?dFdaSEhEUy83cUZBM2Z0N0RkbGZSYXdJR24vekpBQ1RHOGEvTUV0bDJjNkxH?=
 =?utf-8?B?NlZqKzFEQVpXSjMwa0tFNmh3Q0JKU3JrNGR6UmJOUnZXQzhpK2hybHpjWEJ4?=
 =?utf-8?B?dVBuRitmczB0Q0VWa1ZGWW1BNlhQUzdnTXluRGRiSXVDMVNsOEhmZjJmVnZC?=
 =?utf-8?B?dzM1WFZmNUVTeDVpa2lKQWJYcDNLN2NJaHVxbkxSREhMbWhmWnBCcTQ0anpM?=
 =?utf-8?B?WnRZVVZ1N29LamUydkxsR3ZrL0dnK2hlczFEOWRzeEczQ3Z2bjdQb3pLbnYy?=
 =?utf-8?B?b0cyVDV4UFNxRndNVUt3TUo5bThLNHFNeHRBQnlBdHc0USs5Uk9ZWGFIaHFs?=
 =?utf-8?B?bmhRcW10cjJITWRpb0d0LzUrNVdXdFZacjFiZThOamtzMFFONDN6VkRSNUkv?=
 =?utf-8?B?WHYzY0pNSUxncmVDRHEyVTdwOVQvQUhLclE0TjZZWGtXVWdsaklSVHY0QjFR?=
 =?utf-8?B?SCs1V1IzVFMvV2FOVGQ4dHVodlVlTlRIRkwwcHNrbXlYL2VTWk5TSWVVRzFx?=
 =?utf-8?B?Qzk4VHVrMHgyM0VvOW4vK0oybGRIVUhhbzNLZkl1OXd1dlE3OSt2WEJPMVFT?=
 =?utf-8?B?RnQ3QkJHbTBUZ3JSaXFGWXdKRVg5YXR5UCtQMm5DNkE5bTF0Vy9yS251Rjds?=
 =?utf-8?B?YXpnZDZIb3JvVXF4VmhpNjJtclQvOGdMU0M5d3locWRLTjRNV3h6cTlDMW1a?=
 =?utf-8?B?elJwRStkYWVIQTQ3ZUZqZ01HaDJRN1B0b2hLTFlGbWlpQzFMT1lBemMwSDJX?=
 =?utf-8?B?djlWbkJlTzZvWThVQ3BlckJZcXcrbVF6WVgzYzlSYzR6Y1Q3eTJlRjJiNWdv?=
 =?utf-8?B?WDBSSWhNRmd3eFlMNTArcXdaY0h6WkZaK1Jva21RVnh5OGpjNGU1NytzWklJ?=
 =?utf-8?B?ZlFpK2NiUlIyQ2dmZDhveE0rWEZ0MlZ0NzZ1UzhYcWQzdDV0OStsbExia3pD?=
 =?utf-8?B?c1FYdXZRLzRlRmFZMlpMRytuSmtGQVR3cE5YNHBVSGZRam5hTnlzRGdPS0VF?=
 =?utf-8?B?ZnB4RGpJVzZEZ3oyT0NZeWlRVnZldTdwMWhXaktnSkVYR1MvUURqNkdwQWlY?=
 =?utf-8?B?eVdqVFZzVEdteDU0dGlsM3A0QnBiOGxKelhGZzN1MjNUUW1Kb2pDdFNscFVI?=
 =?utf-8?B?UUdCdDc0WUJQQjFtQ2dadVM0dVhaM043TVM4a1F4M3d5VDlmckFzMTJib01k?=
 =?utf-8?B?M0w4S3pNN0xFb1FuemtXK2lucHdIaWdod0RYZ0ZaR0ZiR0lXd1hNdFdKZ3Yx?=
 =?utf-8?B?VVRaUkpjdGJPQWptNThhb2RYNDVrV3RnbGFnQ1lodGlkbVh3NW5iNVR3YVRm?=
 =?utf-8?B?Y2dmbTUwci9SMDFkK0xoWkhWclRyTHg5MjB2U0hRN1R2Vk5aNFZmWFRYb21h?=
 =?utf-8?B?WUdQZHdJNFZGL01QN0dJaS9FOGtlUVQzaWpIYUJBeEF3M1k4Tk5Tb1gyRlBm?=
 =?utf-8?B?RSt4Q0M5azNEUjFQNGxTNUlkV2d1emE3NThrQjlDZHRkaStxNWFVQ1I5T3E0?=
 =?utf-8?B?alhwNzVkQzZKNS9uUDJxUVBQTkRxUWVKeUNpS0Ewd1RGUmRBaXk1ZEFkSVBE?=
 =?utf-8?B?d2JJb0NBWTlEU29xeUhqQVF2VnZrVDBqWkkrb3VCV1p2RWRNNlFBWjVZdm1z?=
 =?utf-8?B?WkJING5ldjlLYm5XTHVOSXhGT0trU0JLSGFEeks4MHByL1NYajhKcEVkaGJs?=
 =?utf-8?B?RDNldWpmdjFoVEc2cGo1WDJXWW8zNWM2M21UMlRxYzI0VkRBSnp5dTV1Rk9x?=
 =?utf-8?B?ZHErSXFONlYraGdVNGswa0lJU2FiZFY2dXQyTUM1c2U1R2RXYkZXRk9XKzFy?=
 =?utf-8?B?WWZMQXEvYUs0UDVCdkFsTVMvZVM4QWFLSy93OHhCb01haXZCQWlQVTR5Yk85?=
 =?utf-8?B?c1BaZktzMk9TMUNKdFUvSG1SZU04VnNBK0VnVlhaRjgvVGo4b0gwOWR0T0lp?=
 =?utf-8?B?SlhjK3RUYWRuWUZhSCs3QlpGdS95UjR2cytiSzgwQ1llWFRoWUw3ZnE5cHlp?=
 =?utf-8?B?T0VWeURKckl6TnZXY1B5amdhMmFvK0ZHYTNNMU5GR2x6K3ZpdVpYYjNJNGxK?=
 =?utf-8?B?T0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 341838af-5408-441b-b3fe-08dc8701674c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 14:52:07.9825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /PpKYSVOX3mJoQVsHra36hbGfNdZCxgzBcQNpGRbKT22YsXsHMw6eODxm5Yt8jvSSqlVFJyL7qeYMQLHvGjF0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8492
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

Quoting Radhakrishna Sripada (2024-06-06 19:38:19-03:00)
>This will help debug register read/writes and provides
>a way to trace all the mmio transactions.
>
>v2: Fix kunit error
>v3: Print devid to help in multi-gpu setup
>v3: rebase and use variable sized variant to display
>    dev name(Gustavo)
>v4: Pass single argument to __asign_str to fix kunit error
>
>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>---
> drivers/gpu/drm/xe/xe_mmio.c  | 24 ++++++++++++++++++++----
> drivers/gpu/drm/xe/xe_trace.h | 28 ++++++++++++++++++++++++++++
> 2 files changed, 48 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index 7962eeb9adb7..feba35ad6a3e 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -21,6 +21,8 @@
> #include "xe_gt_sriov_vf.h"
> #include "xe_macros.h"
> #include "xe_sriov.h"
>+#include "xe_tile.h"

The inclusion of xe_tile.h seems unrelated.

>+#include "xe_trace.h"
>=20
> static void tiles_fini(void *arg)
> {
>@@ -124,16 +126,24 @@ u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg=
)
> {
>         struct xe_tile *tile =3D gt_to_tile(gt);
>         u32 addr =3D xe_mmio_adjusted_addr(gt, reg.addr);
>+        u8 val;
>=20
>-        return readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + =
addr);
>+        val =3D readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) +=
 addr);
>+        trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
>+
>+        return val;
> }
>=20
> u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg)
> {
>         struct xe_tile *tile =3D gt_to_tile(gt);
>         u32 addr =3D xe_mmio_adjusted_addr(gt, reg.addr);
>+        u16 val;
>+
>+        val =3D readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) +=
 addr);
>+        trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
>=20
>-        return readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + =
addr);
>+        return val;
> }
>=20
> void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
>@@ -141,6 +151,7 @@ void xe_mmio_write32(struct xe_gt *gt, struct xe_reg r=
eg, u32 val)
>         struct xe_tile *tile =3D gt_to_tile(gt);
>         u32 addr =3D xe_mmio_adjusted_addr(gt, reg.addr);
>=20
>+        trace_xe_reg_rw(gt, true, addr, val, sizeof(val));
>         writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + a=
ddr);
> }
>=20
>@@ -148,11 +159,16 @@ u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg r=
eg)
> {
>         struct xe_tile *tile =3D gt_to_tile(gt);
>         u32 addr =3D xe_mmio_adjusted_addr(gt, reg.addr);
>+        u32 val;
>=20
>         if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)))
>-                return xe_gt_sriov_vf_read32(gt, reg);
>+                val =3D xe_gt_sriov_vf_read32(gt, reg);
>+        else
>+                val =3D readl((reg.ext ? tile->mmio_ext.regs : tile->mmio=
.regs) + addr);
>+
>+        trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
>=20
>-        return readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + =
addr);
>+        return val;
> }
>=20
> u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr, u32 set)
>diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
>index f0b3477c0e1a..8d074a828d47 100644
>--- a/drivers/gpu/drm/xe/xe_trace.h
>+++ b/drivers/gpu/drm/xe/xe_trace.h
>@@ -347,6 +347,34 @@ DEFINE_EVENT(xe_hw_fence, xe_hw_fence_free,
>              TP_ARGS(fence)
> );
>=20
>+TRACE_EVENT(xe_reg_rw,
>+        TP_PROTO(struct xe_gt *gt, bool write, u32 reg, u64 val, int len)=
,
>+
>+        TP_ARGS(gt, write, reg, val, len),
>+
>+        TP_STRUCT__entry(
>+                __string(dev, __dev_name_gt(gt))
>+                __field(u64, val)
>+                __field(u32, reg)
>+                __field(u16, write)
>+                __field(u16, len)
>+                ),
>+
>+        TP_fast_assign(
>+                __assign_str(dev);
>+                __entry->val =3D (u64)val;

This cast seems unnecessary.

With those tweaks,

    Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>+                __entry->reg =3D reg;
>+                __entry->write =3D write;
>+                __entry->len =3D len;
>+                ),
>+
>+        TP_printk("dev=3D%s, %s reg=3D0x%x, len=3D%d, val=3D(0x%x, 0x%x)"=
,
>+                  __get_str(dev), __entry->write ? "write" : "read",
>+                  __entry->reg, __entry->len,
>+                  (u32)(__entry->val & 0xffffffff),
>+                  (u32)(__entry->val >> 32))
>+);
>+
> #endif
>=20
> /* This part must be outside protection */
>--=20
>2.34.1
>
