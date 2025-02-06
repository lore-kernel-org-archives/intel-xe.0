Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DB3C02194
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 22:40:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2FB610E971;
	Thu,  6 Feb 2025 22:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dI0PHrgi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A007A10E974
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 22:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738881636; x=1770417636;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FBjGs715QcK2Rt7AeRPNKyIqve68kUrvduwJ2DolYy4=;
 b=dI0PHrgiQrLVk57HrZ1qwf45g89qD2s6llIhfK9SKylmqtzwlGGBSqVo
 LKRGOizl2wN+8/lZ9D2zDrLNAXaAfY0L4OLyQO5OeHAJfnDCLpzdTwLcc
 1zD5VAPJHR8b478fVF/9xWJ/XFX04hnHwU1e/AIassBO3JfyqIHnXcFaN
 RAbThN+HvjsDWHZBSFKDKFCrH0yfbPqsBKv3MhZWGLNDX5C58ylGX0K93
 g9IZGdMh/rna81SzzXMzcwqejdujnLYYnUx1afhnblSHIvODtC3FL2acR
 K+ZRFYcSBuPufEZF/6cCfGR/U+C6Vl+DBNUbH+q1cLtIZbiWIV80Uqjnp g==;
X-CSE-ConnectionGUID: 8lqrvdcdSAOmhjaODgptzQ==
X-CSE-MsgGUID: UUeVG+5CRNCFol4kJmYNsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50902301"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; d="scan'208";a="50902301"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 14:40:36 -0800
X-CSE-ConnectionGUID: kMcBUsMaSRKyTg1AIjQKJg==
X-CSE-MsgGUID: INLDaLVETXapoACr1p6qIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; d="scan'208";a="111874097"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 14:40:35 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 14:40:34 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 14:40:34 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 14:40:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pG3q/s1cpYyLgSc0Np9fxU+wyjztIUHahnRSP2PrHskdM0Jdbtaxfbk0Hm9IFhXQTj/P+uTqoK7c6x0lkK8gNxpxKPYSjML+VcWe8t34ghwgBt6XHx1e3YX0VGxrQekOU6SIW0VvezFl7u8qM6GAJVPoxlVvcUy7eAEgvlojEoImsESgl7HvV1lDBqH7GtC3q44oq8BC7R1WYCum478ECil28y6WQXQhV83swjfmb+jZ+Fq0Efc8l/M4tYmYI810YuSkNYJrSVKJa22QlkdOxiJmsGtX7pHvLpRbz14i61xLkoOqZ3PyGRLdIAoizdmU5l51mDj3PgW+srpTMEpJDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XcKk7Uc5xBr1BF6CApMbs6UIE5LzAB5u8FCqP+G/9Vg=;
 b=FN8P1W8u+mQ5AQXQUcFnk91nqwxmEd6X3WTrapFlYbCPP9THDwJzJBeeK7XbqWY41t35pwHCGkLn2gEA2WwsOq4wca0VkY2oHbc0UafH6bDMHpcx8qrXxKQtAl/rsSy2Gu0zGree3jIsVHeAypZ+k6SizU5Fy7xJPspPt2s6z50+3FQOiTrCD+S1kXYxNl/zFEcEP+jvqeOqexSC9dZg8aLbo4R/eOiqFaKI4J8BVtc2t+Q6tMYCan8NDoAAHZzHlAaeTE7nyONr4Ziq6MuwRQLdKwZEhnmZldO6GSlq6F4JmWpIvfQzwsNEWJ/hEsxKB5ClDAaqnr26VMzi2aIycw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by CY8PR11MB7799.namprd11.prod.outlook.com (2603:10b6:930:78::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 22:40:30 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8398.025; Thu, 6 Feb 2025
 22:40:30 +0000
Date: Thu, 6 Feb 2025 17:40:24 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas Hellstrom
 <thomas.hellstrom@linux.intel.com>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>, Jakub Kolakowski <jakub1.kolakowski@intel.com>, 
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Enable SR-IOV for PTL
Message-ID: <Z6U6WDFF1t29Az_t@intel.com>
References: <20250206214545.940-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250206214545.940-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW2PR16CA0016.namprd16.prod.outlook.com (2603:10b6:907::29)
 To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|CY8PR11MB7799:EE_
X-MS-Office365-Filtering-Correlation-Id: b1fb215c-ccaa-4a7b-35cf-08dd46ff4246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWdmNGNWYWNpL0VsSHl1ZzNFOFUzOWEySTJsdytRT3JYZVR4bFBDRVdrWWVu?=
 =?utf-8?B?QzlOb0pReTArMnBKdjYrTTBQZXIrQS9JM1c5ZnRXZ0pxc1RqUFZtS0M1UFU2?=
 =?utf-8?B?Uk5lazRqVDI5VnhuamlKOUNYT0p2SEZWWURsR1JwRTV3SnNsWklwbHlydWF6?=
 =?utf-8?B?TVptRGMvaWpoQm9Sb0NYYWprZmpVR0EwT0ZNNUxWUlpjWUREa2tJWFVud0Nj?=
 =?utf-8?B?amhDc3dPeTFnV0lqRkFYOWh0Smh1SVIyZVJMcWpJWjI2cHk0a2JDeXhmUjBx?=
 =?utf-8?B?d0cwWlU4M1BTQnd2RTVpMDVlSjlNQkV6bkFZVCtnTnZnTXZkL1FWbEtHNlRx?=
 =?utf-8?B?NXo3S3VXbjFzSzM3VWdwN2ZLM0RLY1VnaXdjZ3lYNWFqOWtTM2dxS2V0Qyta?=
 =?utf-8?B?NkJic29CMDd3WDMyNTlwdFNUcDFPUDVxWFVMYmlrbXkwKzhUVlN3WXk0T3Na?=
 =?utf-8?B?c3NPZXRyRXJnbGhWOGcvM2N2RkhYT204KzhpTmR0ZURjSExJRFd6UjMzZmdF?=
 =?utf-8?B?bWtpZnBsU09IRWR0OVhjNEVvM3dYK2h0T29UTE5WUTFDZ3ZPbVpRQlllZ3hN?=
 =?utf-8?B?a3RJMFBGbytVMWlMYmN2dUZXTUJtQkw2dmVtbEdHdUc1VHRnRzZwNDQzK3li?=
 =?utf-8?B?RENSSXhpSUFGSkYrbDArMVgwOWhiZ04wUzVDL1JTeW1tamdITWhRcEZCdko2?=
 =?utf-8?B?Mzg5UVgra3Q2d2VwUUR4cmU3Z0VXbDRraUtTVzAxNERkQlpNS2gxUS90WGJM?=
 =?utf-8?B?R0s0UkNONE5ONkxiWFJaN1RxdExqR0gwbk9OaVZxZ1BIZE5ieThqcE1QZVE0?=
 =?utf-8?B?SytLQmt2RlE0QXBHczhBaXFjUjJGRFlyaVlSNW9BdjVjanpRNGdpSzhEMFVn?=
 =?utf-8?B?TndXVHUwai9GSGFlNStjbEZxZE9oU3RXbzhJZkJOeVlzVXZaVWgyVXFzVVA2?=
 =?utf-8?B?Y3FFQ1JWaVpHZW1UdjJlLzN0cXBuV3BOMzllRlZYVE9waHFiL2Z1bit6Z1pu?=
 =?utf-8?B?R0hFd3J1MWlUZ3ZTTWdGMkZpVzI3dWROMkJpQncyUlozUGt1eDg2RVBWNitI?=
 =?utf-8?B?U0lDOTV1cmhtZTM5dENaR0pRVDZxeG9US0VZNGZ2YWFOYWhOY0pxOE5sdlpt?=
 =?utf-8?B?VkF1R0JDeGNOTzJQU2R3ZWVFU3ZGMnZ6TENzZ3QyZ0NUZW1TdEVCK2FoaEk5?=
 =?utf-8?B?OGFJOURwUi9jUVFOV0FxT2EzUHQzRE1LNy9BMHBma3dIS01EUXpLbDQyRlBK?=
 =?utf-8?B?Yzd5VUx1d3loM3RkRk9ZRmNkcHNLN1h5MjQzOEUzNkowYjdJYXhvRU50N2k1?=
 =?utf-8?B?OGFMUkpPWWdudG1tUE1Kd3F4d0dBTjZBYjl4d0J5c2J2SFEreFdMNDJEd0Ex?=
 =?utf-8?B?T2FjbHg5ZnlHV3lNTXMzYi9zaU56MWkvSXdhTXZ6d0R6N08zSk90Uk1oNCtY?=
 =?utf-8?B?SUF1bHd5RVB1TWJjL1Y0QXJiSjA2UFNhcEMwRlMyUlNaZmhqNXRKMjhrVEdu?=
 =?utf-8?B?MU02Y1RBSGFVYUFqZFJWaC9Ham1pTTduZm9pQnVqVmk1ZVFWS0RiNlBGcFZz?=
 =?utf-8?B?S01KM1ZBT08wUFh1UEVvUEx0Qmk1dnJhdmYvRzJUZStndHhoQUl2Y2pERjNS?=
 =?utf-8?B?bm1lbXV6LzVEaUwvYmVpdmZDWEI3djBuZGlGcVRNS0xqQW1NeEY4Z2dHQVV1?=
 =?utf-8?B?QXQ4ZnNBajZmWksyejU1QWZEVk5mWkc3S0VkY2kyYTJzSkd1WGdhR2VFb2VK?=
 =?utf-8?B?T2NSZHM5ZERxRzk3TEJVYlRERVoxT3c4TU5VMnNhVFA0dTB4YVc5bkdPV0k5?=
 =?utf-8?B?TlU0azZwVUZVQVRNV09nTmVDcDcreWhEVjhkK2ZxR2psN095MDVOcVJmWW5u?=
 =?utf-8?Q?i9Vu1XLfoZy0E?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGdUdnN2U0tvUldia3pWWDB4SGN1VHJjdUg0TlRaVWM3cjBndW1EU2I0ejNn?=
 =?utf-8?B?Vy83QlZJRXdHeUg3NkR4cXdRRk14d3ZVVXU4RlV3V3VxQisxMEJMaEpsVHEy?=
 =?utf-8?B?OHRJbjFEcWJVVmdnWi93dmZIUG5CbHJLSFBHWVRudC84THhLWjYxL2ZicGJZ?=
 =?utf-8?B?Vzk2VFFmMUtBS0xSc0ZDWGlyN2xCMFhuS29LZnQrQVp4aXVMaU9ZK1hXVkJT?=
 =?utf-8?B?NGpiL1UxbVE5Wm1LcTlUR0ZpQXc4cnRUT0JvZml4aEJTTmcyQVJKQ09sMm5l?=
 =?utf-8?B?YzlJY2hxOUk0ZDl2Qk9oT0pBRjMxRHhuQ3ppTlh4ekR4MGFvWVFzQ0ZFMEpL?=
 =?utf-8?B?S0VDN1FPRi84UTdDMDZ5ZndNN3QzMm1sZFVQQkJPQ05DZDM3Q2NYaUpjSkly?=
 =?utf-8?B?NDloMkNOcmxKdm1zR1NhQ2VtL1UxSnFPbTNuVmtYUHd0bW1obXNMWmI1VGVQ?=
 =?utf-8?B?SExWcU9oRENVSnQrVU1XRGo3cDkzZ0I2UGxuT1hudnVmTVRTdEVmeEJnYjlk?=
 =?utf-8?B?cXFrWGpRS1ZHcVRRZWFFU090Wmg4KzVDUVpFV1ZrOVltaFlGTXlEZ2hMaE52?=
 =?utf-8?B?S2d0WnNhVWIzWVMweXcvS1hxY1M2NTl6YzlLR051MmduSFdjQVAxaUY0blZD?=
 =?utf-8?B?RjE4d0lvS21rbW8xUWMzbGhoWTNWWm43MFUvMHpiako1eGpGc3VTSEIrd2Zy?=
 =?utf-8?B?UzFLalR0TUxueVlIWGVNdXhrd05FdzBDMjIydkJLanBkZTdKemN5OEd4YTBV?=
 =?utf-8?B?RXZQNVdkVXNvbTRURWlPdGtjWmppK3hOcUNvZUJGT25QZTBsa2FyQ2JORmto?=
 =?utf-8?B?aVErNXpPVGZlWlAwRG9MOGMxSmIyUStRblROalIrSGFTYXNlL3lOR1lMV2Rt?=
 =?utf-8?B?d3pZS3RBdlVCUVJNbi9ZVVA2UEpsbFREeDJwQmk1LzN3N0k0VFFVcHFvNG1W?=
 =?utf-8?B?ek9pOUxkQXZwMzdndm15bmc1d3QwQ3kvOENoS3lheW9iT0FuTDVSeU5zV28x?=
 =?utf-8?B?Mlprc2hIZWQvOUdvRlN5d2JSbVNsTXlCdTB2OVZYU2hvcktiYmNIZVh5Q1RY?=
 =?utf-8?B?NkQ4L3NVSkFUcWNBTFdlYkh0RGEvaXgvZCtkMlpGK3A5dkxIeFpOTU12M080?=
 =?utf-8?B?ampMZDFGRlZtcjdCUzRScDRlVCtKVHNqKzl0ODVMclZNc1l2U09aYW95YTIr?=
 =?utf-8?B?S3NtZW9hVHhKaTRyelFaSThPODVZY0N1UkUxVEJyaFJHN0pkTkVScUg3NVQy?=
 =?utf-8?B?REsrSExtekxhRDRUaThQa1EzYzBlcEJSZUlITHpxSFpFT3RUemVRalZpUGdG?=
 =?utf-8?B?VEdiRWhTTmphQmhRbzlnS3ZPNlNMUWVWaWdqSDQrQStWWGF0dTVZa2xNMjVO?=
 =?utf-8?B?dWt2NjBYV3N2NlRFNkhzdnlXM05rbEo0K3ZWQ1FwaHVKYmlpQ1RqeFRCWGg2?=
 =?utf-8?B?azNKdFF3SmxSZTNnQWFza3JZRittajg3eFRwOTdNUUJTUUVxT2NKUG9TYXFq?=
 =?utf-8?B?QUlDb1VQYnlFTFc4SXRjazdMZC9rNWtjWmp2V0M0aEE0UFZtVUFFZ0lRZVRh?=
 =?utf-8?B?dTFwMkw1OUFWNUhCNzJ3bWdkOTE1aU1jSk5vSGpER1lEZTlYOUx6N1FtSjE4?=
 =?utf-8?B?dW9DUHZGL3czeWVwdjYyZGlGamtPbzRvODByRVF6R1g1M3lqaG9KdEwrOXJj?=
 =?utf-8?B?aXpLVi9Wd29wam0xemxueW5GQ0tQbStKYmJDUG1YaHNwMWJ5OVdCYlAxNy92?=
 =?utf-8?B?MUxlS09BNnk2NXlSSEQ2V1BPOENEdGRJQVBmanhENUoxUjJiTGdEL25nVEpI?=
 =?utf-8?B?OGUrWit1UDlURi9DWWRRaUhHNW5DYTBPbndiY1M3M1ZPNHlCalg3NE5ZSFQ5?=
 =?utf-8?B?R0NzUkQrWDdsYWYzaUFqRVBlVCsrd25pNk8yMTZRV3VjVyt5cklvVzdUdDEy?=
 =?utf-8?B?Rll3RHlNY05FejZ2bG9JTDViVXl2a3JPcmxjaDFJNm55ZEEvQWUxWUlTL2xE?=
 =?utf-8?B?ajRtNnJqYXlKcmF1MkR2a29kR2R0M052RTNCa2xVQUIzbHUrQVZ2VFU5M1Bt?=
 =?utf-8?B?c2tJRG8wd3EzdmJITjdjcjV0c3hhWmxkbmlHMVZoV25QbGVlUzd2WFg0VnRJ?=
 =?utf-8?B?NlBMMWt3UlU2OUxEMVFJd1piVERndk80ZndKVlRwOXhNUVN0dUZNbVh6YlUr?=
 =?utf-8?B?Qnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1fb215c-ccaa-4a7b-35cf-08dd46ff4246
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 22:40:30.1439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oSdS7Tyn/3dI6biI9sJASNcu2RcjtkHa+VuiuLmg2qFZKY3TwnhLAvI+5AeYHaoXJ3KVoTBfR0sC2EJNE9vTZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7799
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

On Thu, Feb 06, 2025 at 10:45:45PM +0100, Michal Wajdeczko wrote:
> We should now have sufficient changes in the driver to run it on
> PTL platforms in the SR-IOV Physical Function (PF) mode, that would
> allow us to enable SR-IOV Virtual Functions (VFs), and successfully
> probe our driver in the VF mode on enabled VF devices.
> 
> To unblock SR-IOV PF mode you need to load xe with modparam:
> 
>  xe.max_vfs=7
> 
> Then to enable VFs it is sufficient to use:
> 
>  $ echo 7 > /sys/bus/pci/devices/0000:00:02.0/sriov_numvfs
> 
> Note that in default auto-provisioning all VFs are allocated with
> some amount of shared resources (like unlimited GPU execution and
> preemption times, fair GGTT space, fair GuC context IDs range, ...)
> 
> However with CONFIG_DEBUG_FS enabled it is possible to tweak most
> of the SR-IOV configuration parameters using attributes like:
> 
>  /sys/kernel/debug/dri/0000:00:02.0/gt0/
>  ├── pf
>  │   ├── contexts_spare
>  │   ├── doorbells_spare
>  │   ├── exec_quantum_ms
>  │   ├── ggtt_spare
>  │   ├── preempt_timeout_us
>  │   ├── sched_priority
>  │   └── ...
>  ├── vf1
>  │   ├── contexts_quota
>  │   ├── doorbells_quota
>  │   ├── exec_quantum_ms
>  │   ├── ggtt_quota
>  │   ├── preempt_timeout_us
>  │   ├── sched_priority
>  │   └── ...
>  ├── vf2
>  │   └── ...
>  :
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
> ---
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index e8ef7d6b4db8..6a8e82aff385 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -367,6 +367,7 @@ static const struct xe_device_desc ptl_desc = {
>  	PLATFORM(PANTHERLAKE),
>  	.dma_mask_size = 46,
>  	.has_display = true,
> +	.has_sriov = true,

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  	.require_force_probe = true,
>  };
>  
> -- 
> 2.47.1
> 
