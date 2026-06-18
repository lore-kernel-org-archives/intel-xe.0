Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DE7CD98ED
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 08:03:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C0410F1D7;
	Thu, 18 Jun 2026 08:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FvfAnrzQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6DBD10F1D7
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jun 2026 08:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781769802; x=1813305802;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=i7JCU7oNNUZH0wdJAllerV8hF7MZpIFf2b2zRpTJL4o=;
 b=FvfAnrzQIfz5tr++yuk47K0zOGDwtyFqYOYF3Wmik/+9UkvhgnKpZne8
 Rxr8wfb39U+9DpDTUfhv5pWVxrfubWeeDpeAGOCpeEGQTZOSOTzNv+HEL
 e+k5xqV9NdfD++0h4sGYqTtlLGbK/Aa27cr/5kx8vvsjsYIv3AJT08THQ
 9+k5AyQfqdaUbQ0UfdBbnoVQrNYGXX0Kv1WeVQab/VGvKwPA2goBmMfuR
 OduAQUvVnJuve/g1hCbiDnneWgEAZG04htJPDPWvYWLGllLicbm/raOcF
 s8hiRya6sgppig44ZuMyqqxk7bw9G4tkOSooqDR8yVYCN3qTn10u3a5wI w==;
X-CSE-ConnectionGUID: PVif/VWuR7Si6preSsQ55g==
X-CSE-MsgGUID: G2Gr4yliRiWANShBz7o2QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="86439708"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="86439708"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 01:03:22 -0700
X-CSE-ConnectionGUID: 30t8Gd72Rm+VnKQYzFYHiQ==
X-CSE-MsgGUID: 7VDKz0KHSUiTgO3JRMnz8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="245933508"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 01:03:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 18 Jun 2026 01:03:21 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 18 Jun 2026 01:03:21 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.17)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 18 Jun 2026 01:03:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JIU3uOc5CCmufPnhvbo2rBf5kPrsG12VkSvrO9hSWG9RBO1m8xIwNHcNns5Mp4ShPfWrju2+X2bGD1DF6981LJ5H6MkkA8C3KdzRSR0fhHAl3pvaatpZ/tnr9ovCDG/uBj5NLKLLjWrP/a7OzWihx0GdPrAxmm7YFbHGzSKScsxME6f0DvoHE0vUvVG3OvEG2gkyPnpdwpGYvuJEQj/X+g+tYswaovQj6jWIMaWZ1sAexYshb4cWpDUOrKHOKnlJ385u9pebeMdQmhNxzUyzCiYWBTgEFcU+6V0lNdPnJcna/puOU2FEq2eZTopm6pCsU4ibIahbOsJic4sE4FJJXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kwVjfFLxjLMfEtBLP0deevceXCxu/AtzjiBL0NUsT/k=;
 b=preQDIP0AC5YK2CcDG1mLxEOniGdP9ptOIZzYo+29+4nJSxoi3ln1kgY3JtiodvFr2U/htF1hqd37iHVgzxkZJXvdLaSj+0p6Z6prOeZh7xSoPIIqIAvL5Nyqq94Y7fLw+H0JyeSqJ98Pn81udCQZJImrhPSoRD/YnhJXpOJ/rnudeSJ4VTTxkmWl3vI99nIuAzFyapHGULnzuPcxQScQxcfvhb7bYVyRi5R9oMzbulybm0gavc7GkR53SdutiDNNMLgc7qaw0eW8Pg9cnG9Kq/A+aYa4ky1K2s32Zorf1JW73CyDqDLcJt/M5mZuT/k2F4CRQYeXcfTLgc/HGRG6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA3PR11MB9511.namprd11.prod.outlook.com (2603:10b6:806:47e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Thu, 18 Jun
 2026 08:03:19 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0113.015; Thu, 18 Jun 2026
 08:03:19 +0000
Message-ID: <15cc665f-65a2-4847-84f4-b12fd562126d@intel.com>
Date: Thu, 18 Jun 2026 13:33:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/1] drm/xe/xe_ras: Add RAS GPU health indicator
To: Soham Purkait <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <mallesh.koujalagi@intel.com>,
 <andi.shyti@intel.com>, <rodrigo.vivi@intel.com>
CC: <anoop.c.vijay@intel.com>
References: <20260618061053.3307213-3-soham.purkait@intel.com>
 <20260618061053.3307213-4-soham.purkait@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260618061053.3307213-4-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0145.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA3PR11MB9511:EE_
X-MS-Office365-Filtering-Correlation-Id: 883519fe-3b7e-4068-c529-08decd100f1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|921020|3023799007|6133799003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: evXiVY3BnAgBhoPvW0rD7N1viWc2UtjqMUefNV0YEfcGsQg8YzmPjnzb+vqOljoduEKYL6mqxlzbOB9jalPkbNrAwkdG8qbEqklqrK8bEVGkqv4VppJwzpwfeHN8+QbsJ4wN/FfYLwv3MDgahCqOSFHYnhANtb+nf3lseH6GDTk13uBI0nqtMrxpgejtbt2Do8DoaePvbBw8jPHLnlwgCTpbdx/nupvwg49Fh7iRSfqEFBI5FVghtn5VVl6d4k4THk4JvIeoogAPlVSu2D8JU/bvSWTLoUdmT1fcHsbtNtHMYGcyP+nUOZ4mGIb5MSk5m3QhMecz9HqKyGe1xxHij8Qg6u9ZSOxHroVReVYrbVGCvGROC/y1XODXYzcfnpB7cpTp7BVCCpuoC6lzfKC0nSip43WlqTrw9hXxeRo2bhCas7rzEetJTsVj7VOrumDQkIzm8wFBqEFMljv1ZYU4nwv/seECkWpi+ZzF+B7sxqNq0jooboGgfd0NO0EusIrDpWI0Au10B81aGGtUdQISo9JaWUwoOmAkmP9M2tq+Xl+Dqh7iQKpjswYIPbKnABnnD8ygeBr5LP0QerPYFToh5VIuzXqrS0S8ND8vp35H2+QGuSCGg34/pZ74b4agbKDK4HBDA444vphqKvl5h+bXaWXw6kGt37+Dt+BImhV0P8NjuUbsru67nBw83lgRVbXzzBQlqgNMC/mNauUSoVxpWLIW4aVZm5DQ8K3iR6Z+PAuQTf8MFCIe7TK0jTjum7hu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(921020)(3023799007)(6133799003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUdBTEdYanR3RStRczJ1VlN2RnY0MXpBZ0N4K3Q0WCtxTUdPWHQ3T2hiNVFG?=
 =?utf-8?B?WTZ2R0R0OE1oY0ZoQWNpMGcwYi90R3BiNDJtWXk4RkVIU1ZVMENHaml2aXJQ?=
 =?utf-8?B?ZDdBZENkamN1WWZCdENEbTBIOTVDKzduSUlsSlNad0RPVm5KUVUyditucDYx?=
 =?utf-8?B?cG9zN0N1cDdRWDQ0cndCTkRmcGduanEvYkVQQ1I0TjBhU2I1bXdTaWJZZitT?=
 =?utf-8?B?K1FvOFR2NDJvQUV4QTFxYUc0QTc0RjFRV3llazdKRWNWVzIzY3AyRVNJcWdO?=
 =?utf-8?B?R0x2dFhGd3JZTDBsNS9pOTUxS09ITStiZCsxNm9Ib3lKWll2dHh4QmZBdzcz?=
 =?utf-8?B?LysyYm91bnNUWjh6K29nNGdsREVGWVZ5RmtCeFFzTnVYWUlGZS9XVlIzWW1N?=
 =?utf-8?B?TVAyNkkxRjladWFJdnZaY2J1REt4VC8xVUswS1VtcGYyUy9YSlRsT050VkpE?=
 =?utf-8?B?K21DaHVOMFBZK0lZYnJHVVZKYWcvUUtCVGlkeVFubTJSL2ZtOGZ0VWppRGdL?=
 =?utf-8?B?WjkxZjZtdE5VNWx3b0thR1A3ejN6KzhEbXJUemFjZzZ2b1pyZ2NLd0FVbzZx?=
 =?utf-8?B?S1dnYUZNMDBEa0tvZ2czODBSNm9OaTMxVWdNc2lsNmRnbUxjUDEvcGFHdGtV?=
 =?utf-8?B?Z0xwT2JGclF2V1VkbkM4Y01NUXFWYkhobFZXakZldU5LdVpYMDdLUjRWbklG?=
 =?utf-8?B?R0dLTGg5bEpHcWk2MVF2cHBSU0tXTWZ5WW1JSDZTdDF1Q3FkRjk5cFpLWklu?=
 =?utf-8?B?L3YwWDd4NDYvOFREMllvVGtZck5EMURDYUhLYVZ4UjBndlpoWkxRUUNuRXhV?=
 =?utf-8?B?c25aVGthd1YrckZ1ZTg5clVhSUJkRnlFTjFBWE90b2Fud2EwTHQ1LzllNXdX?=
 =?utf-8?B?blhDT0lXOFRBWDlrL1IwUFVjN05oTk9uVjBHMzFaUm1sQXZiNHk5bWFwOXlX?=
 =?utf-8?B?MFc1TGU1ekQ4Y3lSSFhKeHdIYkR4emhXVXJJMUtHNEFOYmZvNlFMQm5WT0cw?=
 =?utf-8?B?MDFralpqak9Velc4clpRVzFlM3RLNjNoR290bGU0SmsvNXQwRGNWTXQ0eEMx?=
 =?utf-8?B?WE01a2krZk9nbUlNUmc4MGhtemRlb0RxRzdPMnFla1dOTEg4Uk1JS2VMOEZ5?=
 =?utf-8?B?MzFDcXdhR1NTWlNHZlFId3p0aWYzWkFYSWxyVnFmNWNiSktkTFoyaUxOL3VI?=
 =?utf-8?B?L2JDc01tUVltWlBQRzAzVVZ2d21PcWw0WkE2cDdlei96S3p4eHdUbDBNZ3lF?=
 =?utf-8?B?NmxXUUhjSUVadjdiQUVEUmY0QWpCZzhQY3N1NVRsQVNKdnhOOGhnUy9RZXVx?=
 =?utf-8?B?WVIwWDVlNGcyZ2dXb2sxbERoZG1uTStNY1R4WXhiV2E1eHBNY2xHalJZNjd1?=
 =?utf-8?B?RWN3R3VseFE5K25MZUovdnhPRWF0RUhhei9xSHEra0VmUVc2a2RhaEhGMTBq?=
 =?utf-8?B?UTBsREVVNVZQTjhSZkVob1NSeDlWOEZmZFNQK2FUVnd3Y3kzbmh3VnVwcG1O?=
 =?utf-8?B?bk9xNGxYbmxhSDRLNVhDcFl1WG9jWCtYM2IrbGp0eDVsbUtCL0hGbTl6bnJ2?=
 =?utf-8?B?UXJOVUxiN2VoZzhLaVdGMVdxLzJPclcwTGtoQ1lZWEZ3YmlCZE9ZQXNKbzRL?=
 =?utf-8?B?a3hjUXNOWXF1RndHQnhNTG1Udk5LaGZnTzZkREQ1MS9qNHFtZVlLZjNGWXBn?=
 =?utf-8?B?cWdsbnNuRUhXbTNMa0hkZnFsdjhYeUs0M2xXZ0NQUlZ0VVVrcGlLNjdrQVlF?=
 =?utf-8?B?MGZmK0VsV3B2SGR2WWs0d2NxVnpVL2VOcnkrR1U2WmZxME5JNi9uTHNhd01S?=
 =?utf-8?B?OWsvazY4VzZKMHJpbWFmYUxQZ1oveWJsSTN0bzdUcnQ3dFpHNTQwbnZnazVH?=
 =?utf-8?B?T3lqMjczY0RWbzUvTkRHdFk0a0lHRm9aTnVhNGtNYmwzMFdDdUhya1M4Tk84?=
 =?utf-8?B?ZGlWVDVXVVNBdmRjRGVlRmlISVhsR1VhWWFDKzhSdFN3WFJRQzhrdm5nWDl3?=
 =?utf-8?B?dGZ5ODYzamZvQTF3dDZkdlZNQ0lXbmw0cFJlV2JuOWI1M1VFanBBUUJsd2lv?=
 =?utf-8?B?YmRNcVN6b0QvdEFEa2lvOWFlMjc5TFZzN09SeUxnYjc3MmQ5eXZRKzVLdEhx?=
 =?utf-8?B?ckJkVHJCSy9SUWZFQm5CSXhlbXlaQTBqcitPRjROVHZXYUJYRzhZWHdyNGQr?=
 =?utf-8?B?MkNYZHRySm11OTFUcWZjREp5NDZHaHpNTW4vNU42TVkxTnF6UXVwUDdmc3RQ?=
 =?utf-8?B?YktES0ZUb25WZ0Z6QjcwazA2Nmh1dDJBc29CYVFueW9LRkZoelFLbHhZd3ZH?=
 =?utf-8?B?VGdGeVR6Q1Bib2g5ZDJYRDlrNjEyMUE5UGY3U05LVTUxa0NXc0VXQT09?=
X-Exchange-RoutingPolicyChecked: r6ihFnMlFGgk26Y8nAGZNk8T33EBlyt2/SlGVusGSwRpV+dU3iObM1rVP0r/b02k5fSDRaQc1T1eDq2vsB/7+heNwsOvq9yq6hvpIGWC+8QzrLANxqB36W2/PYhGOEFacajkzg7Zgtqu9YIZVjSb2ackuETavztrEdWv9BcM7pCp0wqy2suUFlPo91YBgpVt33hz4Lhn8Y76pttYSuQbzPMvJNIli4AKlG8En5OWFvDgM6EA81ByHHAHQi6plKbn1fzw3s4zj6hYOQJt1RrSqEg8eL9e2p9VWctDoS0hUfyZO82MlpuA+GeaN3fbpdzQGPJHC1c1wl3lnS58zZkMfg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 883519fe-3b7e-4068-c529-08decd100f1d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 08:03:19.3704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F7zBD4UarrqHNjY16Rl0d6HhMqGTh5+XSaqs8PlCpd3UQJtAua0Ts3wxrf6d86tLhjU4wTPzqho739/ceWt+Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9511
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


On 18-06-2026 11:40, Soham Purkait wrote:
> Add a sysfs interface that reports the current GPU health state and
> lets admin users and management tools update it but is readable by all
> users. Requests are routed through the sysctrl mailbox. The interface
> is present only on platforms that support the GPU health indicator.
>
> The interface is a single read/write file at the device level:
>
>    $ cat /sys/.../device/gpu_health
>    ok
>
>    $ echo critical > /sys/.../device/gpu_health
>
>    $ cat /sys/.../device/gpu_health
>    critical
>
> v1:
>   - Add enum for health status. (Andi, Rodrigo)
>   - Return error number instead of error message in _show/_store. (Andi)
>   - Move GPU health sysfs init error logging to xe_ras_init. (Andi)
>   - Return only the current health state for sysfs read. (Andi, Rodrigo)
>   - Add documentation for sysfs interface. (Andi, Rodrigo)
>
> v2:
>   - Make logs and structures consistent with their counterparts. (Riana)
>   - Drop unnecessary variables. (Andi, Riana)
>   - Add correct KernelVersion. (Raag)
>
> v3:
>   - Add missing blank line before #endif. (Badal)
>
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-ras     |  30 +++
>   drivers/gpu/drm/xe/xe_ras.c                   | 177 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras.h                   |   1 +
>   drivers/gpu/drm/xe/xe_ras_types.h             |  61 ++++++
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       |  28 +++
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |   3 +
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   4 +
>   7 files changed, 304 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-ras
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-ras b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
> new file mode 100644
> index 000000000000..c7f2cf8bb6ad
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
> @@ -0,0 +1,30 @@
> +What:		/sys/bus/pci/drivers/xe/.../gpu_health
> +Date:		April 2026
> +KernelVersion:	7.2
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:
> +		This file exposes the current GPU health state and allows the GPU
> +		health state to be updated.
> +
> +		This sysfs file is present only on Intel Xe platforms that support
> +		the GPU health indicator interface for RAS. Reading the current
Use device health or gpu health. The below enums mentions device health
> +		health state is available to all users, while updating the health
> +		state is restricted to administrative users only.
> +
> +		Read returns a single line containing one of the valid values for
> +		the current device health state. Writing one of the valid values
> +		updates the current device health state.
> +
> +		The valid values for the device health state are:
> +
> +			ok
> +				The device is healthy and operating within normal
> +				parameters.
> +
> +			warning
> +				The device is experiencing minor issues but remains
> +				operational.
> +
> +			critical
> +				The device is in a critical state and may not be
> +				operational.
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 4cb16b419b0c..b7efd607aadf 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -4,11 +4,14 @@
>    */
>   
>   #include "xe_device.h"
> +#include "xe_pm.h"
>   #include "xe_printk.h"
>   #include "xe_ras.h"
>   #include "xe_ras_types.h"
>   #include "xe_sysctrl.h"
>   #include "xe_sysctrl_event_types.h"
> +#include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_mailbox_types.h"
>   
>   /* Severity of detected errors  */
>   enum xe_ras_severity {
> @@ -31,6 +34,16 @@ enum xe_ras_component {
>   	XE_RAS_COMP_MAX
>   };
>   
> +/* RAS response status codes */
> +enum xe_ras_response_status {
> +	XE_RAS_STATUS_SUCCESS = 0,
> +	XE_RAS_STATUS_INVALID_PARAM,
> +	XE_RAS_STATUS_OP_NOT_SUPPORTED,
> +	XE_RAS_STATUS_TIMEOUT,
> +	XE_RAS_STATUS_HARDWARE_FAILURE,
> +	XE_RAS_STATUS_INSUFFICIENT_RESOURCES
> +};
> +
>   static const char *const xe_ras_severities[] = {
>   	[XE_RAS_SEV_NOT_SUPPORTED]		= "Not Supported",
>   	[XE_RAS_SEV_CORRECTABLE]		= "Correctable Error",
> @@ -50,6 +63,33 @@ static const char *const xe_ras_components[] = {
>   };
>   static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
>   
> +static const char * const gpu_health_states[] = {
> +	[XE_RAS_HEALTH_STATUS_OK]		= "ok",
> +	[XE_RAS_HEALTH_STATUS_WARNING]		= "warning",
> +	[XE_RAS_HEALTH_STATUS_CRITICAL]		= "critical"
> +};
> +static_assert(ARRAY_SIZE(gpu_health_states) == XE_RAS_HEALTH_STATUS_MAX);
> +
> +static int ras_status_to_errno(u32 status)
> +{
> +	switch (status) {
> +	case XE_RAS_STATUS_SUCCESS:
> +		return 0;
> +	case XE_RAS_STATUS_INVALID_PARAM:
> +		return -EINVAL;
> +	case XE_RAS_STATUS_OP_NOT_SUPPORTED:
> +		return -EOPNOTSUPP;
> +	case XE_RAS_STATUS_TIMEOUT:
> +		return -ETIMEDOUT;
> +	case XE_RAS_STATUS_HARDWARE_FAILURE:
> +		return -EIO;
> +	case XE_RAS_STATUS_INSUFFICIENT_RESOURCES:
> +		return -ENOSPC;
> +	default:
> +		return -EPROTO;
> +	}
> +}
> +
>   static inline const char *sev_to_str(u8 severity)
>   {
>   	if (severity >= XE_RAS_SEV_MAX)
> @@ -91,3 +131,140 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>   			comp_to_str(component), sev_to_str(severity));
>   	}
>   }
> +
> +static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct xe_ras_get_health_response response = {0};
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_get_health_request request = {0};
> +	struct xe_device *xe = kdev_to_xe_device(dev);
> +	enum xe_ras_health_status health;
> +	size_t rlen = 0;
> +	int ret;
> +
> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_HEALTH,
> +				  &request, sizeof(request), &response, sizeof(response));
> +	guard(xe_pm_runtime)(xe);
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: failed to send get health command %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (rlen != sizeof(response)) {
> +		xe_err(xe, "sysctrl: unexpected get health response length %zu (expected %zu)\n",
> +		       rlen, sizeof(response));
> +		return -EIO;
> +	}
> +	if (response.current_health >= XE_RAS_HEALTH_STATUS_MAX) {
> +		xe_err(xe, "sysctrl: invalid health state %u\n",
> +		       response.current_health);
> +		return -EIO;
> +	}
> +
> +	health = (enum xe_ras_health_status)response.current_health;
> +
> +	xe_dbg(xe, "[RAS]: get health:%s\n", gpu_health_states[health]);
> +
> +	return sysfs_emit(buf, "%s\n", gpu_health_states[health]);
> +}
> +
> +static ssize_t gpu_health_store(struct device *dev, struct device_attribute *attr,
> +				const char *buf, size_t count)
> +{
> +	struct xe_ras_set_health_response response = {0};
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_set_health_request request = {0};
> +	struct xe_device *xe = kdev_to_xe_device(dev);
> +	enum xe_ras_health_status health;
> +	size_t rlen = 0;
> +	int ras_status;
> +	int state;
> +	int ret;
> +
> +	state = sysfs_match_string(gpu_health_states, buf);
> +	if (state < 0) {
> +		xe_err(xe, "[RAS]: invalid health state '%.*s'\n",
> +		       (int)strcspn(buf, "\n"), buf);
> +		return -EINVAL;
> +	}
> +
> +	request.new_health = (u8)state;
> +
> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_SET_HEALTH,
> +				  &request, sizeof(request), &response, sizeof(response));
> +	guard(xe_pm_runtime)(xe);
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: failed to send set health command %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (rlen != sizeof(response)) {
> +		xe_err(xe, "sysctrl: unexpected set health response length %zu (expected %zu)\n",
> +		       rlen, sizeof(response));
> +		return -EIO;
> +	}
> +
> +	ras_status = ras_status_to_errno(response.status);
> +	if (ras_status) {
> +		xe_err(xe, "sysctrl: set health command failed with status %d\n",
> +		       response.status);
> +		return ras_status;
> +	}
> +
> +	if (response.current_health >= XE_RAS_HEALTH_STATUS_MAX) {
> +		xe_err(xe, "sysctrl: invalid health state %u\n",
> +		       response.current_health);
> +		return -EIO;
> +	}
> +
> +	health = (enum xe_ras_health_status)response.current_health;
> +
> +	xe_dbg(xe, "[RAS]: set health:%s\n", gpu_health_states[health]);
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(gpu_health);
> +
> +static void gpu_health_sysfs_fini(void *arg)
> +{
> +	struct device *dev = arg;
> +
> +	device_remove_file(dev, &dev_attr_gpu_health);
> +}
> +
> +static int gpu_health_sysfs_init(struct xe_device *xe)
> +{
> +	struct device *dev = xe->drm.dev;
> +	int err;
> +
> +	err = device_create_file(dev, &dev_attr_gpu_health);
> +	if (err)
> +		return err;
> +
> +	err = devm_add_action_or_reset(dev, gpu_health_sysfs_fini, dev);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_ras_init - Initialize Xe RAS
> + * @xe: xe device instance
> + *
> + * Initialize the RAS GPU health sysfs interface.
> + */
> +void xe_ras_init(struct xe_device *xe)

Where is it called?

> +{
> +	int ret;
> +
> +	if (!xe->info.has_sysctrl || IS_SRIOV_VF(xe))
> +		return;
> +
> +	ret = gpu_health_sysfs_init(xe);
> +	if (ret)
> +		xe_err(xe, "[RAS]: failed to initialize GPU health sysfs, err=%d\n", ret);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> index ea90593b62dc..8acfd0ffe48e 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -11,5 +11,6 @@ struct xe_sysctrl_event_response;
>   
>   void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>   				      struct xe_sysctrl_event_response *response);
> +void xe_ras_init(struct xe_device *xe);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index 4e63c67f806a..535841b8d037 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -10,6 +10,21 @@
>   
>   #define XE_RAS_NUM_COUNTERS			16
>   
> +/**
> + * enum xe_ras_health_status - Device health status values

Either use GPU or device. Not a mix of both

> + *
> + * @XE_RAS_HEALTH_STATUS_OK: Device is healthy and operating normally.
> + * @XE_RAS_HEALTH_STATUS_WARNING: Device has minor issues but is still operational.
> + * @XE_RAS_HEALTH_STATUS_CRITICAL: Device is in a critical state and may not be operational.
> + * @XE_RAS_HEALTH_STATUS_MAX: Sentinel value for validation
> + */
> +enum xe_ras_health_status {
> +	XE_RAS_HEALTH_STATUS_OK = 0,
> +	XE_RAS_HEALTH_STATUS_WARNING,
> +	XE_RAS_HEALTH_STATUS_CRITICAL,
> +	XE_RAS_HEALTH_STATUS_MAX
> +};
> +
>   /**
>    * struct xe_ras_error_common - Error fields that are common across all products
>    */
> @@ -70,4 +85,50 @@ struct xe_ras_threshold_crossed {
>   	struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];
>   } __packed;
>   
> +/**
> + * struct xe_ras_get_health_request - Request structure for GFSP GET_HEALTH
> + *
> + * GET_HEALTH takes no input parameters; the reserved payload is kept to
> + * preserve the firmware wire layout and allow future extensions. The
> + * driver must zero all reserved fields.

Remove description. If required add for all.
Avoid caps unless enum


> + */
> +struct xe_ras_get_health_request {
> +	/** @reserved: Reserved for future use. */
> +	u32 reserved[2];
> +} __packed;
> +
> +/**
> + * struct xe_ras_get_health_response - Response structure for GFSP GET_HEALTH
> + */
> +struct xe_ras_get_health_response {
> +	/** @current_health: Current GPU health, see &enum xe_ras_health_status */
> +	u8 current_health;
> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +} __packed;
> +
> +/**
> + * struct xe_ras_set_health_request - Request structure for GFSP SET_HEALTH
> + */
> +struct xe_ras_set_health_request {
> +	/** @new_health: New GPU health to set, see &enum xe_ras_health_status */
> +	u8 new_health;
> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +} __packed;
> +
> +/**
> + * struct xe_ras_set_health_response - Response structure for GFSP SET_HEALTH
> + */
> +struct xe_ras_set_health_response {
> +	/** @status: Status of set health operation, see &enum xe_ras_response_status */
> +	u32 status;
> +	/** @current_health: Resulting current GPU health, see &enum xe_ras_health_status */
> +	u8 current_health;
> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +	/** @reserved1: Reserved for future use */
> +	u32 reserved1[2];
> +} __packed;
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> index 3caa9f15875f..9507f68bc2eb 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -293,6 +293,34 @@ static int sysctrl_send_command(struct xe_sysctrl *sc,
>   	return 0;
>   }
>   
> +/**
> + * xe_sysctrl_create_command() - Create system controller command
> + * @command: Sysctrl command structure
> + * @group_id: Command group ID
> + * @cmd_id: Command ID
> + * @request: Pointer to request buffer (can be NULL)
> + * @request_len: Size of request buffer
> + * @response: Pointer to response buffer
> + * @response_len: Size of response buffer
> + *
> + * Helper function to build sysctrl command to be sent via %xe_sysctrl_send_command()

create

> + */
> +void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command *command, u8 group_id, u8 cmd_id,
> +			       void *request, size_t request_len, void *response,
> +			       size_t response_len)
> +{
> +	struct xe_sysctrl_app_msg_hdr header = {0};
> +
> +	header.data = FIELD_PREP(APP_HDR_GROUP_ID_MASK, group_id) |
> +		      FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_id);
> +
> +	command->header = header;
> +	command->data_in = request;
> +	command->data_in_len = request_len;
> +	command->data_out = response;
> +	command->data_out_len = response_len;
> +}
> +
>   /**
>    * xe_sysctrl_mailbox_init - Initialize System Controller mailbox interface
>    * @sc: System controller structure
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> index f67e9234de48..fb434cc165b2 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> @@ -23,6 +23,9 @@ struct xe_sysctrl_mailbox_command;
>   #define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
>   	FIELD_GET(APP_HDR_VERSION_MASK, (hdr)->data)
>   
> +void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command *command, u8 group_id, u8 cmd_id,
> +			       void *request, size_t request_len, void *response,
> +			       size_t response_len);
>   void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
>   int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>   			    struct xe_sysctrl_mailbox_command *cmd,
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index 84d7c647e743..f82e3fb9b5ef 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -23,9 +23,13 @@ enum xe_sysctrl_group {
>    * enum xe_sysctrl_gfsp_cmd - Commands supported by GFSP group
>    *
>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
> + * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve current health status

status? retrieve 'device/GPU health' would be better

Thanks
Riana

> + * @XE_SYSCTRL_CMD_SET_HEALTH: Set new health status
>    */
>   enum xe_sysctrl_gfsp_cmd {
>   	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
> +	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
> +	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
>   };
>   
>   /**
