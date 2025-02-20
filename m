Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8236FC021B1
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 11:53:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E2C10E0F1;
	Thu, 20 Feb 2025 11:53:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DotACkBN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7619810E0F1
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 11:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740052393; x=1771588393;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=e98qAzYdvUscV80PdynyGgQrNIKWAwEVMlto458lySw=;
 b=DotACkBNj9/K5rtOgwSIQKU8Ac1QRXZuhB5GYmP49+WfcI5Q/dJQ7M3j
 t34lyykYDn7Ve2Twv+VlTQ4w+Jw8HTxW+JMJXOB7vlXdx/UX7Fg+RYRUT
 GGgP2xEiIt9Fpsa1m1Fi2txQxMPUuWmCrFklhCRlLJdBYAhv3R1J82SXG
 gKQQh0KgsU/QHU2K6DZSeskBNRjn217F81PFIYLqGggaW9oEPr2ldLuSZ
 I+1p+UsDwgJUfk2DQ05fQJCsb0crSr63b1LD+eBBqCQdwKHKZezvXtD/D
 DK1KoRA2T7eEsZ0CBDaYNF48C2Js4/aSqPvp1950qc4c7iiYGIMljeJwe g==;
X-CSE-ConnectionGUID: dxVzuPdOR16Y670NOppqgQ==
X-CSE-MsgGUID: ygmPFmlAQsqlMJVvdVS55g==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="52259635"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="52259635"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 03:53:12 -0800
X-CSE-ConnectionGUID: FUoacuZYQsKtT0ZqsHQ08w==
X-CSE-MsgGUID: Iei/68jvT5WWCnZAhJSABA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="114749759"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2025 03:53:12 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Feb 2025 03:53:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Feb 2025 03:53:11 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 03:53:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L5xYRavhTw2+o2i8AmJxSdVc2YbphJ2/lWiIEd2DNPtnO/e0RjQq+SryUgkFID5HJKjKnlGT7Ykct9bIkQWpBWqi+3FmnfDE0J2wm58QXesN0Y3nVcMBjk7lPmAB7qPFhf8iZtZXw3+X3g/yMzWSrCyZ1TV8aJoxZzIenJITaYUBRUu4tEimWppyWuhIcUzKrJQ0dWurxULaMsen9oYqqd+UkuqjJMFVn2D2qr1/IoPQ5dO0d06Ygy9NbVUNje39h+yvUrnWJlgG7u6lbOYR2pOxEXD2QThByk9TpJImwWsIzSCPr6JyznB8Ha8jIPoMk/vSNSbuMgjuBnayISbZBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HbOUiDq2g++hUJcR3jEjsO1hFIeOcy1w96/Kbtd+u6s=;
 b=fDI0by3U6//BgmfNcIXrVjLjYeFQtWfVMzQaQWo7olbp41dlIvbnS8iT2mqx9rwzB8AauqDwc/2m3sOI6uG/dnbgZSKcMEKZ4Kr2HFGJIgdV22CXrpL3CnqN4w0dyT4kfPMeeXUzLTAFFIRBvRsChlwNF6PI7J5d8fgMWFNn/MdMA2UCZfmIeYNEf8vsGPgFMtIORSaiR5vNdANw3HbL/c/f17DJ7WpOGvaSsXFNrJzkL263hCkggGhIl8pr77jogioICcmqJWpoRTohNF2vVRjmSBNrs/AFNnBMxhwoo9E2pa3imM+3yKDYDM5YmvoOUsdzhy1QNLhItqz+maT1ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH0PR11MB7657.namprd11.prod.outlook.com (2603:10b6:510:26c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Thu, 20 Feb
 2025 11:53:08 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%7]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 11:53:08 +0000
Date: Thu, 20 Feb 2025 12:53:03 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/vf: Retry sending MMIO request to GUC on
 timeout error
Message-ID: <20250220115303.ywzoaxc6w3aawszr@intel.com>
References: <20250220064119.26623-1-satyanarayana.k.v.p@intel.com>
 <20250220064119.26623-3-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250220064119.26623-3-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: DUZPR01CA0272.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::12) To CY5PR11MB6138.namprd11.prod.outlook.com
 (2603:10b6:930:2a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH0PR11MB7657:EE_
X-MS-Office365-Filtering-Correlation-Id: 28ed2d34-4287-43dd-5ef6-08dd51a5243e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?clF4dXcrWCsyR2FHTTFUTnAyTE8rL3FxczZ5WUNDQlRIcTZ5QnNhTlBpdTE4?=
 =?utf-8?B?SFlnTE1zRkUvK28vR2ZhdzM5RnQvOTd3L2hsc2lObFlNMXFLVTIwTlc5cFNa?=
 =?utf-8?B?ZlRYTnE2SmpVcDNKdEE0NnR5UEpTbnNXaWl3MkgrMU1TMU9rUFlGeG1UZUlv?=
 =?utf-8?B?RldwSExFSk5sb0RKRGVlZEJRMDJ2aFBheXh2bVR4dVVteTQyYmV0a21jYktm?=
 =?utf-8?B?bmI1QzU3Zm5pYmhPQWU1SkxydnRuK29BVmdSSXU3b3E0MGZHREU2RnphNk9h?=
 =?utf-8?B?WW9jOWZGTzNmY0hTbEIzcWJIcXcyTzVsdS9zSE5NYmxiL3JOenlDNFBaRVNY?=
 =?utf-8?B?KzF0ZFJWZ0NUVWJoNWE5b0JHMGlIVStIcUxHVHRLM2dqeUh3b3QzNjVnQnds?=
 =?utf-8?B?REsvL2pzN0lJazQ1V3k0U2lTMW9Kemx4bE4rY01hTTA4NmdSZVJ4dkh4Q21u?=
 =?utf-8?B?WjFLNEVudHhrYjJWRkRGVStmUGJjSWloeENmQ1pPZk5zQ2xoMkFNYmFvallB?=
 =?utf-8?B?Y3I4SDJzZUtpei9xMlZRdTM4YUc3MmdYeHdqWlQySjlpdUFhVzg0K3AvV0Ir?=
 =?utf-8?B?R3JRSmVLd0hBZ2djK2VmVDBaeWlyaVZaOXpaTG5KYjFyaWYyTnM2ZXNUVTJE?=
 =?utf-8?B?emliSzRWWGVkR3labFVZdGVlc2pBcVhTQXpqaVZMVmhWb0dFMEZkU1BJRm5L?=
 =?utf-8?B?V0hFa01FeExaNS9XSW5xMW9iSFF4eVJzcDZJT3FkRk9hblBDa1AvS1VpVDJQ?=
 =?utf-8?B?d2pMUFpYV0pjNjR4MkpCTzkxcGVEL2k1cWJTT1BwOXRRVXhEWmRWNWpmT3pS?=
 =?utf-8?B?a2YwN0J3d2ZXaUtaN0wrWm02RHlQRklwZUZOTERFME9hQ2Q4WW1oMHJITThB?=
 =?utf-8?B?SWFQTjdzaHJ6OENHcTZvMi9nQXRSTFpzYjhSbHd3UWh5bVlnV1diRXc4a2dx?=
 =?utf-8?B?S21hd3dqUlh3ZnZ3WUppZjlJZ0w0a0JiRmVLZWF5amQ5aVdvRjBKWitCeHVP?=
 =?utf-8?B?MkE2QjNPNDdSY2orVENHTlEreHhtdWlDcnplR3cycVJURk5WY1BmcGwwUTQ2?=
 =?utf-8?B?dC9zemJhd0tKdDJhOGNuRzJnUndYYTZMV09DWEFjU01uWXhpZEx5ZzczR21y?=
 =?utf-8?B?ZnFDZTZDMDZ4czYzQ2MrM1U2S2JBOGQ4aEIwVlo1RjIyNEE1MGtOMUNSMmdF?=
 =?utf-8?B?OUQyWlhLN2ZybEhXYmVLN1hEUCs1VXYzazAzQjlHeGNEeGE0L2xpeE1ZMDAz?=
 =?utf-8?B?dU1rZXhvamZpeGtYNzUzZ21zK2J1NEtjb1FVbnA2V2ZQMjR3dUZCb1U0eVJQ?=
 =?utf-8?B?RllXZzBJbktyYjFkWjdIWGxDZ0hvdmJIS05xR0JHYWNrYVROWW9FUG5MR0VG?=
 =?utf-8?B?dnMrMlN2RytCQ0lBTGM1amRpek5FM05jdDVwdHJSZ0pDNXBFOFpmWVhIZzZH?=
 =?utf-8?B?Q0VYdUpTUEdLdHpwWWVPQmVqRnp6UVZKY1hHRDFtZmh6bWJITU93VXgwbjIz?=
 =?utf-8?B?SkhFK0RTQTJJSXgvV01pWlhrUDQyUTQ0MUtmcmF2UE9wOTlLaGdOVElnVUJr?=
 =?utf-8?B?M1FaNjVGZEplL1c4VnVPYStZQlBQWFozbGIyWlVhaE0vdjFScWJReG5QeFpW?=
 =?utf-8?B?Q0NwV1gvUHV3eDFqRkM5WlZ2V1VpbnpSdk05OUdkb2h1Uno0MWRRcXhBMUxa?=
 =?utf-8?B?TGNmRU0ybjBKcUN4R1pUL0Y0QWNFTW05ZVNwWWo1UGxrczdxMUJlaUx2VXRp?=
 =?utf-8?B?b0c1MmhxajZPVnprNVpIVFJCandrM1pyc1lPdmRSMW9RNHlUNzQ3UkV6Y081?=
 =?utf-8?B?NnpTVmNsbFJxUkhOMnlrbXU2Wmd1Qm1lTUQvRENWejhUb21GOXVCYnBEMktC?=
 =?utf-8?Q?kh+lDrfmt6F04?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWRscmpKNVJmVERuWGYyL0xQMlNaQXFnSElNWlJpUVZiTFprZkdtYnh5RmhW?=
 =?utf-8?B?UWlxMjU4ZWhWWXVuUHF5TWI0OHd2RURTaUtnL2JERDAvMlJUdTZ4OVRVQnR0?=
 =?utf-8?B?R0d2WGk1elBNRkt1LzBzNDZ5emtZVG5QOEQ3TCtpNXBiUE16eUZJdFFJYWlK?=
 =?utf-8?B?VDB1QjluNmtKM2pUYkliQTh0MEcwWERWT084MEd1dWtWL1RpaElveCtIWEo5?=
 =?utf-8?B?R1pIU29XTzBmblV4aHVVRXl4VlFpbzU2bjBsTHBpaDBVbFJIaWNsbkhVTkNS?=
 =?utf-8?B?OTN0bUt0TlRTQ241T1ppUzIrRTY0OUdtNFh3Z2ZZTkY1MU40MzNOeUVNOHB5?=
 =?utf-8?B?SFpCYmttMm5Bd3BsRTRiQnVrT2lNU0FOREI0Q1h2eGtxWlNEanU5Y1F3WC9K?=
 =?utf-8?B?YURuMWNqTDU0aDA1UUVXTjFHV0laay84eW5JRElhUHlsUWord2tLd2pnL2ZV?=
 =?utf-8?B?QUl5VDQxdXlTWUgzN3hNNlRBb2RPb2doeld4SmcrcVk5UFRLeUhwcFJMNTEr?=
 =?utf-8?B?RlhMV1liV3hmRzVOR0tSR2pFTlZ4R1VCTG5RaWhtYWs1dk84QWFvOU1ia1ZM?=
 =?utf-8?B?M0dSdnBuRDZobFdudDQyV2FnaXllTVB6NGdvNktBVmZnY2xlbUgzcm9GdGc1?=
 =?utf-8?B?RFFudll6OUZjVGVyWkNPbjJURjc5VlNaWis0TXVqSU02ZmVPUUFNcng2bW4x?=
 =?utf-8?B?MmZPOEgweFYybG91TmtFRk9hOFByNDZFdmtpbEFScVFJZG5DVHduQ0hxQWow?=
 =?utf-8?B?aStwMzlJN251U1ZmUnRUM3BwMzZjSjRMdkRUV253M2VlODdyaEcwWWd6dUIv?=
 =?utf-8?B?dzRRL3E0NXF2RmlqV09BVFR4Yzd0c1VrSlA5U0UxcG82ZUZPc01BMjBKU0xV?=
 =?utf-8?B?TlZQNlRRZ29wME5aSGF1OFA0SUZNOTRPdEhCdnRHMTRZd2VCS3FGZ0Z6UDQ2?=
 =?utf-8?B?MjBGbE1WdEhKUkRLUXhwcjZmT3A5NVAzNmlvSVRzZzQxZmRiZUZXUElMTkFM?=
 =?utf-8?B?MXQwSWhBMlVnbGlwSHJHbHlUUk1PNkYwWXh5UWpWc2hVOTg3YnY5NDdTMmxX?=
 =?utf-8?B?dDN0MTlqbUVMWFlvd1JvR0E1TVRwQU1VZTJ4bVIwTnFsVHh1Q1NNNEZPTTZZ?=
 =?utf-8?B?TjQrbThiclo2RlVjRnhVZHlpaXg2SlYwalNHVjZRZDB3Q1lnS0UvTlI3Wm5n?=
 =?utf-8?B?ZEI5OSs0cWdVc1dBTVFmeXBBRVRIN2l0MGxyc095d1pmS2Ira3loNHRuT2li?=
 =?utf-8?B?VHBCbTloUEV1WHJXZmhhM1lRN2w2eEIvTGxvMVp6Z0QxanN5eDlIbDNtTEpG?=
 =?utf-8?B?bjNMVEJYNGVuWXFrRmFQVHo3TG8rR214Mlk0MjdxU0NoSWRoS1REcmhaWVhK?=
 =?utf-8?B?QVpiZ2EvWXdlUVluMGtIVHBjN2w1bGpMdHN1SE1zbFZqNmsySTgzaVdUQkIy?=
 =?utf-8?B?QWR2YitYZVRHVEV2UFJUcHRobUlrT2VldXlGYlZNQnk5c2pqSm9ITWlGc0xv?=
 =?utf-8?B?VjdhYzcrK1NwMExwMWlVaXlKb1dlR0hnTkpFMndPT1laVjBlWTZHM1lHUU5i?=
 =?utf-8?B?S0s5bnVlVVM2eFNyRjhhYzB4UHZqZzMvek5zWmhiMUV0ekNwTHN0bFhETWZO?=
 =?utf-8?B?VDljVkw0TXRwTG93MnhURk9jd2R6TE5BajI2eHRGVmpsS2daWUJCOG95d1JX?=
 =?utf-8?B?ZzhlVGt0SEdjSVd1anhDMXFGSFlRSUFidDJNRUxrTXc2K2R5eUJCSEJSNVZL?=
 =?utf-8?B?a2NHWnk4MktxSldublhERFNxeDNXTE1jZjVXR0FCNmVOOTU5b2t0OFVxOTJJ?=
 =?utf-8?B?NysvVzFROCtqdmpQTVd4eXo3bmFPSkZVVzMydC9kSkNPNjRVYTlBNk56QVM3?=
 =?utf-8?B?a0RuRmQzcyt4QnU0NXl2TWtVNW5UMm0xMmRCcFh6L3RxOWQrVzdORTRVNzJv?=
 =?utf-8?B?RGN1Y2JMZS8yWXVLcG04dkZNQXRveTNPbVRCdlhNM3YvMElaU1dvVURxV2th?=
 =?utf-8?B?aVFmYU5pK2VCSUZZZ29Cd3RmS3k3NmVFdTcyd2ZtOVhpUkpkYVlnM2VnY1FE?=
 =?utf-8?B?UWxlRWdsQlhsNzJXWXlhNGpYVms3dFdJM0JFMklOM2h1Sjl4bkJKUnR2d0Yv?=
 =?utf-8?B?R1dIOTN6NkRBbk5NbzFjRGRvQjV2cXd4ZGVNdzFINGhhcUtzUjdkYUF0Z09s?=
 =?utf-8?B?eWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ed2d34-4287-43dd-5ef6-08dd51a5243e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6138.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 11:53:08.4705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D6ODrMBkxXmhvHOReJG/Hf+gvZY2vB8dqJYpubqdmhY6EvFvTwhyb3Q16apg5bx6kvzq+26QHT/2n8hfP7WIQLt4mfO57M2RGIarIv1rEV0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7657
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

Satyanarayana K V P <satyanarayana.k.v.p@intel.com> wrote on czw [2025-lut-20 12:11:19 +0530]:
> Add support to allow retrying the sending of MMIO requests
> from the VF to the GUC in the event of an error. During the
> suspend/resume process, VFs begin resuming only after the PF has
> resumed. Although the PF resumes, the GUC reset and provisioning
> occur later in a separate worker process.
> 
> When there are a large number of VFs, some may attempt to resume
> before the PF has completed its provisioning. Therefore, if a
> MMIO request from a VF fails during this period, we will retry
> sending the request up to GUC_RESET_VF_STATE_RETRY_MAX times,
> which is set to a maximum of 10 attempts.

Maybe I'm wrong, but shouldn't the previous patch have prevented this?
I understand that if PF and VF are on the same host, that prev patch will cause VF
to not start resuming until PF has finished resuming.
If the VF is passed on to the VM, then I don't think there should be a problem, because
userspace (and VM) will not start resuming until the kernel on the host is ready.

So it seems to me that a situation should not arise here when VF sends the reset
button actions and the config has not yet been sent by PF to GuC.

BTW: The title of the cover letter is a bit misleading because it only mentions the PF and VF link.

Thanks,
Piotr

> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 4831549da319..a439261bf4d7 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -47,12 +47,19 @@ static int guc_action_vf_reset(struct xe_guc *guc)
>  	return ret > 0 ? -EPROTO : ret;
>  }
>  
> +#define GUC_RESET_VF_STATE_RETRY_MAX	10
>  static int vf_reset_guc_state(struct xe_gt *gt)
>  {
> +	unsigned int retry = GUC_RESET_VF_STATE_RETRY_MAX;
>  	struct xe_guc *guc = &gt->uc.guc;
>  	int err;
>  
> -	err = guc_action_vf_reset(guc);
> +	do {
> +		err = guc_action_vf_reset(guc);
> +		if (!err || err != -ETIMEDOUT)
> +			break;
> +	} while (--retry);
> +
>  	if (unlikely(err))
>  		xe_gt_sriov_err(gt, "Failed to reset GuC state (%pe)\n", ERR_PTR(err));
>  	return err;
> -- 
> 2.35.3
> 

-- 
