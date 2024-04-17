Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494C9C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 22:35:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3C4E11285C;
	Wed, 17 Apr 2024 22:35:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DmMyvlEX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 375B011285C
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 22:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713393317; x=1744929317;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=el/TOtj3jA8kWnx+hfoFX0uPsxSvXuu8D14orXrgBNw=;
 b=DmMyvlEXPkZruqX6SyhviAf5B12CrGfTRZGIXIr9w/MXhp4ZL0ALaoFM
 v1n0ZIdVQKtSjVUYMq22pB5Z20mvpN/PZ0yo+oIhXa5nI94KgYrF8CIan
 d79vvftkfx6At0PHTpbUOkTHbV8FM/tCzKQyo/he9YrvVCN8eTlepfbs8
 5VGHUEBx+QaVc3ofPu93X5WqHxfiYk/LFeSx43xr/5p257wpyokjB5x9Q
 aD6+LWBRvn17DfK7y1oU5Ry697xB2EYVW7bjLtq0EBwFPCgEbRqs0u4ie
 OzwIowE+gOG0gDifzmTWksy+8dNlJJ3dlY+Q5E23uvwAwCt2p6Rf0TpdG g==;
X-CSE-ConnectionGUID: u4WeCLcURXKjmM0LcqgvQw==
X-CSE-MsgGUID: yEu6vGi1Qem4U+H5ZEah1w==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="19471320"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="19471320"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 15:35:16 -0700
X-CSE-ConnectionGUID: t2nlkADgR3u8xcRBz86XbA==
X-CSE-MsgGUID: +EJAHNefSWKE86vNiJ2G3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="60200978"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 15:35:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 15:35:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 15:35:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 15:35:15 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 15:35:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QlQ02GcA8TTwxZ6GkOHZUwMJsw7Fy2uV6lneLLCQI1U38Xuz8hI3Tf7E57Nmr22Fc9gbrq0QhaOXhKPihwaVPxLjDN3xkyjiBYV5jycLecc+qUXVZ5tfBOmobKkLWv1/XuN12utxzRJ1c4joT2Dhqa6rH5tDNDtFHZbkvBbOdf4I1zPmcRSVtIdAHFQse97AEgLrlMKniXe8RW6typtn5kivPj9qc89upEyhqJWehWexDzaFz3q13eKrOFUhDe2fsTtxtQePH+ihs6VQgajwUpGF/Gu2+NwEz82O++Tf1esi/lOPxBYzNxK18tJjhUQF8CFL+6bwb++k9XiL3przUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=el/TOtj3jA8kWnx+hfoFX0uPsxSvXuu8D14orXrgBNw=;
 b=cJQcCmwlJuweuFj2hZ4XRdDyT15/H7D3GrBiQkMO8LBej2+o6mbSvA8YFm10feU+79oX+Szg4uZhIoirubTimBtK9GhxK1u6EjbnscdW1Rh3rNsWzsMExtoaz8tZ7H0kKiH8u0yH23yNGhuUVarzJ4e+uFntzgNvvFfusVibgaMF3KW/TpYFeMhmQFG/cz+DWGC8VlmZvEy1L0PxOLOIuchi0zGP0eTbUJEZdQZwdEn6SsOwWr6BkXudhVA1Ern6FRXXQb+/pz9NBO9mN95Nn1n/YFoQS5G58wo6nfMLiyYmHWGb1A5ihsXyTZGQT1xRTgeaBpVucSaAULVPJIq3Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7480.namprd11.prod.outlook.com (2603:10b6:510:268::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Wed, 17 Apr
 2024 22:35:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7472.025; Wed, 17 Apr 2024
 22:35:13 +0000
Date: Wed, 17 Apr 2024 17:35:11 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.de.marchi@gmail.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe/xe2lpg: Extend Wa_14020338487
Message-ID: <h7vbeswsxbjgf672ddvqgyobvpfslhbu6vmxuc5c6tmt6rbjm4@q5k7wdducac6>
References: <20240417212501.312346-1-gustavo.sousa@intel.com>
 <171339034765.54602.16408540374552896913@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <171339034765.54602.16408540374552896913@gjsousa-mobl2>
X-ClientProxiedBy: SJ0PR03CA0129.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7480:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b821996-8221-4daa-52ed-08dc5f2ea5a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o2t6isVVeTfaaj2Vobtr9r/+bhWWALhO/DBLkkRlzDtI+0+s2cLuideYpT5mwGEV5K65cYohKVdok/2/6gw3i5OwFZqBQRdqVGB2eFasHzPwFbFldNEjLD4GtpdqqFGNpkf3ycnMPdx18XBr6gsF0dapuzPVK/va8VquogKFKSQaA3FcxBLMTwhwwxu1H+MpFhWMzf7KtFMZgnwdKgLCJf0fMxnFTg3w4ZA/2do2jLb0fJqsBdkUjJtWpopElfLLUDft9djTw/e7b0n+pGZwgI34WU0nlRZt14gQDA7MWLhqqwUyfthKeTt89k8joeklx57fVV2HdG398+iohzFU9bgbv22NQQJdk//qjvSKWQWceklMrByYp3e1qEWS2j63HideNBVXRtouzkkOSjkma7D1Mul3G/jKfE7P4Vbro7FeYGAS0MOJr3mwii+tZKlTlBACDwck0votff7ZbMSTHa90MEqLj7ZWvy8/rx8U/xuh2DggymMPAn+8XzhBdzWNzjDXBqYxOyICzEfHjAGRBOgDV3hA1EpfQu50UFE2Z8YuldcgDp5dw4ch3c6CZSWEn0yLEy53o5G7YPPttUB0ARjSQSdrhuLavntY6PXN4j4WyLgC9PzJefJrB8vuB2cwua+bRd9g9KmAP8lODGWRPs+J9mH607SenC96MDDNhPg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vns1oNhLEwvttF+nPecyHcjGZpj61NnLU6EwmAQLYzlL2bNc5ijZI4OL6BRJ?=
 =?us-ascii?Q?WMt8MeANT3g2zh6c/VDPCPo5vSGdKvCI9p57cLYuTPFEvSYOTWBuL22AXHDU?=
 =?us-ascii?Q?pm/uR6HNr/lUMzRo/oJm9+DYmrgDAUJO529Vo9sBsZEcR34q3SuN8QkqJ/m2?=
 =?us-ascii?Q?uSufQ4hi44VRRou7JgzHVmUhqSIVaWHJszodPYQYcGUK3TKY7xrh+SYKAB8b?=
 =?us-ascii?Q?C6Bur9kRpBWBt4fP4WSa+6U0SLxff65cCmaEVk+eTkoEdsp82d4tryy1OymD?=
 =?us-ascii?Q?cco0fJpclCPM22bH9wXuKsuKJP/UC+ihHhJ805DBK9Tb7JoUSshvx8Lnxvc+?=
 =?us-ascii?Q?rjhvZ4TAL+JXWH/hrwYkH/Wbfh5Xc7Lb61wIR40VR96FJN3UcDIn7DBlhV81?=
 =?us-ascii?Q?Cwc8i9HC4XqgjiKiGUw5U1rprkgvO5+ZwiGqmSn4sCXmXoQ87VhgNW3xr12a?=
 =?us-ascii?Q?2OgxwWn+tH8lRFJsnTzYKdj5vZ+O2RkS9wMcXWueWy6tU6LkvV2V1MMJT38L?=
 =?us-ascii?Q?NPC6iSXD42YTbXMncZ3rVx3883wlyrWniRyH1xqb0UvzYUFvj7FenauIzKzY?=
 =?us-ascii?Q?L7ROPUi911HX9bbWvu3efWLyPQnM5AK9viS8KlCyomsR6C5k7pDhRBuYG6WX?=
 =?us-ascii?Q?rDZf3ezBzZXU67+YlzRDuXQUGQeb7S7l8wRQ25hA3XUaQS5NWu1seIBFEJ2P?=
 =?us-ascii?Q?LZOQAugvcn+GtoJxaSWhWVfQCuWzSr/PMH7Hh9kyo9qH5DYvxdklhLkRRtlz?=
 =?us-ascii?Q?d8jOBvMkJZRo/d2NFmFjGx0rnv4R2G1PZCEyhInKALomt385a1z5GIHUQVMB?=
 =?us-ascii?Q?DOfm1f3jmInjV47eiTBV81ZKZ5rFbrgaZYcegneQeu0BYBp/xEccaIC/Z6pf?=
 =?us-ascii?Q?2XJDoxyU9AkcrkNZAj7ewMUOAxlI/qJ4718P/CMv7cFaZYdoOe8tETBlkJjO?=
 =?us-ascii?Q?q4O5gr5X9cJmVxnW1sqW0oORgjssyrS4TBqaLndpn++DSq4m5ggh1z7xIz2c?=
 =?us-ascii?Q?qmRVJz/Q9EBoC11Lhmgh1fm7dSQ3UF1iL3aERtYwV3J/773wK8thNmPo4gT6?=
 =?us-ascii?Q?UTTKu8fo4PUu+74pL1R6OIx8zOU1yoP0ObIpRnPom3+BvG9CPxF6Fj3AE8uu?=
 =?us-ascii?Q?a/Ibvcg+FiiknMMGuZkRF0ghXieDeLTL7T46Yq+ezZjunLxU7JPLp7xSd/KG?=
 =?us-ascii?Q?5at9kv25Kwf1+CxFMEoGe0SSQcswjMigvgnjHsrdGaiEnOC+XodABlzdsQkt?=
 =?us-ascii?Q?3bYvtuI8mQWkuOXhZG7M4oe4COQzEts01yy+5ENrNAL4VIvOeEsl/oH9Qo8C?=
 =?us-ascii?Q?U8ol6BgHDOpIBESI76bMQDPu0Ru+lnW2Ch2ulaPyD/QuCJzN2fjDpsf6Ryv/?=
 =?us-ascii?Q?f7ARw1LlZeZ+Df3TS/ZAiMR46l28Bw3bLPCGWDrYXHGIRxQDybHySqTYomFa?=
 =?us-ascii?Q?jh3a2AKVIv5/6EyYtMXLYqJ7XiZh/Jo7cbXZXPk7FMwoVlpP3isifTwHqWPi?=
 =?us-ascii?Q?fCAbi2MMpnTvx5A17fqxwvtUsYg85mhNM095+S8Fizi0aTMGZ/g8dyhqaYdc?=
 =?us-ascii?Q?LBtpy7u72kwfWaPfofuHVaLv3EFnjwZDfTSuwJWwNcK+O+kLdUs2dRc45v7H?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b821996-8221-4daa-52ed-08dc5f2ea5a8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 22:35:13.4241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ID5Z9f+qpcxg0FFx/AaX9kbvAMv5ZIrS/PzaOl3/qaj2Z1yUg1ALk/v9TamjisWkJMX1Hjm7p3o2YHHlbYheF2vI//RFvIi1a+xG4jsuK9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7480
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

On Wed, Apr 17, 2024 at 06:45:47PM GMT, Gustavo Sousa wrote:
>Quoting Gustavo Sousa (2024-04-17 18:25:01-03:00)
>>Wa_14020338487 also applies to Xe2_LPG. Replicate the existing entry to
>>one specific for Xe2_LPG.
>
>I would also like to take this as an opportunity to discuss the way we
>are currently arranging the RTP entries for the workaround. Using this
>one as example, created a copy of the entry and edited the argument of
>GRAPHICS_VERSION() to match Xe2_LPG. There are multiple cases already
>following the same pattern, mainly because we are grouping entries by
>IP release.
>
>Do we want to continue following that pattern and keep the code
>duplication? Or should we think of a way to avoid code duplication here?
>
>A very simple approach that I think of is having a single entry for each
>lineage. But I guess that's not really feasible today because I guess we
>do not have a way of expressing logical disjunction in XE_RTP_RULES().

yes, implementing it was always something I considered, but then there
was also the fact that when we have WAs that are on IPs that are not
close to each other we may have subtle differences like registers with
different offset or mcr vs non-mcr.

There's also the implementation side: implementing the OR probably means
increasing the size for every item so some of them can have ORed rules.

The other option that I was considering was to eventually split
the rules from the actions and follow a similar scheme to what was done
in drivers/gpu/drm/xe/xe_wa_oob.rules (but generating a table rather
than the current xe_wa.oob.c). The positive side is that we free
ourselves from having to implement things in CPP. I'd probably gone
that direction if xe_wa_oob had been done before the rest.

Lucas De Marchi
