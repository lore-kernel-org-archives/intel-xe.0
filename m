Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B8DC5B552
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 06:01:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B5910E00F;
	Tue, 10 Jun 2025 06:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UVMO2wtG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD8610E00F
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Jun 2025 06:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749535274; x=1781071274;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=O8Rnauho6dvp7LAyfScWe0YZItwJNxJCmlvTxJjI8+4=;
 b=UVMO2wtGVNQyyo+FKRYIO7OeJRvixLBaqXL4dPzrIH2Eh/GqxOtugpIn
 yv7Pfr6re3inBKQ9fQhSO+R/AmMLE9oZv3L/pz1qu5J13d6EyCuCCKLXf
 37K0clyryaM63D3ZfzjCtJOXbArknQ5xb4bObR0VSmlGhgH2HIQtkWaUE
 E9YMjtf183eaXsHxy6ugHO8yLoyRvYQfGa2B8tcj7FU/muapE4Obkx4y0
 X7RKfLnIYYT1Q5K7v+7YS1/ZZYNF1X8MvZaU1o6rutyqns47g9+w8yDDK
 +w7O/oN6zZFksqIkjbHNokfnrgJqbjoj0K+yleJ3uhLKQFdyWNgzeikcu g==;
X-CSE-ConnectionGUID: 3vnnbeo/SiitvnVbS6Fj2g==
X-CSE-MsgGUID: trzjMelhRCC9PH+SxbkN/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51714635"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="51714635"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 23:01:14 -0700
X-CSE-ConnectionGUID: DwJjENRQQgyEartwxBkcGw==
X-CSE-MsgGUID: 0qfzhoDdQmSF3Qr0jFvlRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="169903747"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 23:01:13 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 23:01:12 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 23:01:12 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.72)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 23:00:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eIfbNDnmf5srDNh24/4NuA04uvPVrYUt4nQwgqREsnzjL+0NtPLCp13XGpV67ZiGzi0K1RCWVsd71XsARNBDks2cVW9wj2iSZPA1zF9oOLh/wnbfsB4W+KoEhx19aiGH0FoOoZkcFsl1FVo8i8AeQRwVxn9LIYMzDGntoyt4i9yYXRcK0irIEnmZguihk0tZHDTuAmtdUvzgBez7O/gDfXBRKTYmUz91ZPHJRtpYqzh/QUECNuEA5tvP0MJnwT46Dv96S9fWq6Y21vrtx9mMXRtyFB9dxaBuQdxY2D7/908+bHtB9RI//cvjuV++bMooscPKS+qh5u3oKoHlR4P7SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Axt+noUEwXAF3/KKJY3YxCf++oKgpaZ58FkBh/roXa0=;
 b=RIxGasssOIvnXUbRfOwOW8yXWWgcu5Yhe9X7Xsr8LNRHullGUktf0H8TU511n+QR4c8nGFp2kFrYCG7jTz1tWwXpfJL7GFrq5pP58MZMq7yd2IUJahaFSmwtKMM4/kN9RZeI7jhbm9lFEWraiLqVoVDI53JkwY35GzZr2P/XgC09CtGbP9yMQFPuwOtPcbBlqxtnGsCL5fVwlthX0xxolNEQMONXFExDP5yrB+L/NrxyeffyWz2CwPUgMv4AJ4joBt9Fp+htf8I+bcUF2uoElUoFrTQtS+kX+tBc19jEL3kyoIIp8O6OLm/d6qlITh5qIyoled5GTARxnyVMqL97bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by DS7PR11MB8825.namprd11.prod.outlook.com (2603:10b6:8:255::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Tue, 10 Jun
 2025 06:00:41 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%7]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 06:00:40 +0000
Message-ID: <46bbda01-59ec-4806-9c33-38cc3dd2dede@intel.com>
Date: Tue, 10 Jun 2025 08:00:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [1/2] drm/xe/pf: Print runtime registers using debug printer
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250604190021.725-2-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20250604190021.725-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7b::11) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|DS7PR11MB8825:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dc4b3bd-08f5-409a-3bfd-08dda7e420f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MEQ4Z3h6dVZrbzlOaWtmV2l2cDAxK1p1ZVJOcFpac3ovQ1ZvZ0Y0RXRLT1N6?=
 =?utf-8?B?ZDRwa2xnT24vWnRzUGxCN2YwM0huV0pYOGQyYUg3aFVzZEQ0V0NrNzVOQ2RP?=
 =?utf-8?B?T2k0QUdIaDVyZHhvSWdRbnNGWDcweHF2a2lyWUhDVU0zd2lYOVcxWHhSL1BM?=
 =?utf-8?B?R2o2eGE3cWdreWlQczB0UmtMb0FtMGErZkdNR3BsUlJYelpWRHRMajUyby8y?=
 =?utf-8?B?QnNRZVJIbVg5bjNsRW14a3pFZ0pUSGpkSXhtd1dWeEpnMm02a1o5V0x2OG1U?=
 =?utf-8?B?eHNaWUpxSmg5Sk03d0lLNzl6TlN4aXFHRGJPS05nT2N4N1dHZFdTaTVIeHFH?=
 =?utf-8?B?VnB2V2tJKzhWSHB5TW9LN3RhUERzVldRdGNQMVhYdVlEdWtta3k2aVpzSzdh?=
 =?utf-8?B?anZITGxDemNmSk93ZE9YbDhZZW5ycUhsVVBwVmNNSlM0YlhqbEszSU54ajRv?=
 =?utf-8?B?REZCTlplbGQ5aEpEY2R6UDRDOFlDbHU1YWV5dUFQTU4weGR0WTRXUFlDL0o5?=
 =?utf-8?B?WGZ6R2JjOUdUR1p1MDl3QUlkODI3RDlPaFJLNDF0T0dxQ1NGRUphakU3TWpr?=
 =?utf-8?B?SnNQdGpBVkhwaGxwWWt1NHdHem42NHRNblE1UUc4R2lMV24xRnRDOWRxTk53?=
 =?utf-8?B?aWNQeXp6NTFUVHk5SElhQ0NCbldHdFZzblBVZUI2VXhSZGtDQ0JIQ1RSckJX?=
 =?utf-8?B?eWF0a09KNmJWc3Juc3VXLzU0RnFhSVE1b21kbVlTUFJYa3BHd0hFQXFJSDRs?=
 =?utf-8?B?eEx0bjJhRWhTUWM4Y05CdThKRllDWlIwZzlIWnVoM0tyVnpMY3FKSFo5T3NI?=
 =?utf-8?B?NmxLRzlIL3ZwSlhzREh4dmVJT2UzYStWWWhMRS9nSnJLMDZPaisrMjlvRFNU?=
 =?utf-8?B?WVppSTlUalJUeE1ROC9QWGwrOEsrRldQK0FGTDRHcG5SWjlhNHZEeEx1R1Ri?=
 =?utf-8?B?VGc5c0Jvd2lBbEhicFhueGZhS3VkeUN2bHVUZ21kUlJ5bS9iV2ZHanRKOXBB?=
 =?utf-8?B?NUxFSDZYbDI5TlFhQ2lBeGZDV3V4SG1OUklNR3ZMMUUrWmw2eVNMeDdCWjZT?=
 =?utf-8?B?cVJGNFRHWlh2clNEZE5ZZWR2YVVOazZRdzBZVEtERE5UWlA1cTFmbEROTkFL?=
 =?utf-8?B?UEhLVk00ajd1d2dMMFg0RDhUQkxZV0lKbmpxS3hkSlZvREZQV1dHc0luUFNJ?=
 =?utf-8?B?ZHdDSVVKcE9KVk5FUnJCUGluSjNPbUNkWE4ycW5PY0RxeVlwc01WN1dZNXRy?=
 =?utf-8?B?N1I3WmNmUUJzRnpPVHQ4SnlUa0JHMlJ2TlFCNHNXMHRMaEhXTmJFRjFvblNP?=
 =?utf-8?B?a0RpVytJWjZhNHBJWHRwWDd5TU1Oci85ZWVGUjZpV2laTDFTN3liVmZRY3Jy?=
 =?utf-8?B?ZFZxb3puZ3ZLZjF0UjYyczlyUktoa3pjK2VMYjNEQ2FqNzRXZ21icGpDcnY3?=
 =?utf-8?B?WWtQdjl1ZTBydHNEaTZzSzFDQnQrWnVwV1NmazFVR25PVzIxRmFjYkhIRnE0?=
 =?utf-8?B?c0MvbWlwU25ZVU1iNnYzb0FCN0tHZEhEQVVhQlJNT3R3NUJhYlpId2N2SVNU?=
 =?utf-8?B?VUpwUHBlZFZPVWVIVVNKV0hWaTRVME56WkdybWIzaHJvSTRiQW9ZdTlPSXdU?=
 =?utf-8?B?L0E0dG9RNnMyZE00cnN5Y3BsaTNBUHgvamdXWis3VGFrSlpScEMxL1M0R1Nr?=
 =?utf-8?B?ZjJuSTNkQ3RhbXMwcFY2cFBna2pqRmlwNTVxU05QSVFmRGFyY3VySDhOS1RY?=
 =?utf-8?B?b0E5QWJSaUowbGFXK2l4SStmUkxJNDJqdWZqUldHanVWYklEU0xuZEVsNlk1?=
 =?utf-8?B?R1VzMkVJbEJWN1hrZFAreVVDOXBKZXJnemxIY1VycWJVR1Z1aSttakVJdXFu?=
 =?utf-8?B?UEdObVk1Qk9jWjBsVERGZm0zeUYzQmdzTVJlYzJvQVkxTFlMS0R5OWNNcUdN?=
 =?utf-8?Q?IzHzuaWbBY0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHdsUXVnT1JRRU0wTHV0WXdWdTdKemRnSWlsR3NUYmRwUlJxcUxmQjNjZ2JZ?=
 =?utf-8?B?U3k3cTJMZU84c04vVVVaRVBLK0NlVlJMUWh0TlNXMVgwaTErRnNwaWxVZ2p2?=
 =?utf-8?B?bmQxdGQ5SjgwRTBTR0RlcS9vOFVkQ2N6T0dWSG05UnBLMy9WQml1WjkxWnh3?=
 =?utf-8?B?V3JBdHY3YnE2bGNTdzlrbHI1QUhNQ0lRTnZ5d1Jid1Rmb0svWUtOcGRKRzlX?=
 =?utf-8?B?d1lsUk5ZcElkek5Zb3RzSmhJZDhDZDcvZEJaaWVnanI2N2pHa3pDWncvNVp2?=
 =?utf-8?B?L1VXeUYrUU9ITW84c2F6ckM3c281aGZyOG1nZjBZVmxZM2VHUmNCTC9ta0tR?=
 =?utf-8?B?VXZSbXduTGdGMnpCQ0hLRFI2RUVCaGJTa3RkVXRUUlg5OEN4aUM4SUxmVndq?=
 =?utf-8?B?WVk2amFHc0cwVVV5UGQyRWhSNElDNm5BaWtTNWorVUJJZXBkVmNVSUxGYklz?=
 =?utf-8?B?cUNaSlZwYmU3KzZCZ1VoZlBlQ0J5b1lVeVBBWmNJK0s1dERheTN6UkltTTZw?=
 =?utf-8?B?a043WjlvTXRSc1lEU1ppRFljdWRaREVTTzZPT2JsZDhsMFZLa1FKcHMyVWtL?=
 =?utf-8?B?OVA3cUdnNjJlNkRjY01SeGtVTis1c2VWc3IwSGZrOVU1U0tHS0tDRUlqclh4?=
 =?utf-8?B?dCtNTVBkblVMSGhicnpYL2ZKRzlSQ1pHOVlHL1dBZkZ6M1ovUzFneVBaWWFM?=
 =?utf-8?B?UlF1T1pqc2xoWFR2VkNxV2FJTVdtWGJ4QmVLNWJ4bFFuMVZ2aTlmeGxyNEhM?=
 =?utf-8?B?NEV1SEx0WkxLcWM4aWpnMTVmUjlEalZWcUxDRUR6OXJ4MjB1cU5kdmJ2QmU2?=
 =?utf-8?B?NXU3MFRvc1VBN1BEYk92TjJaZHliNEVwY3pyMkdXWHdaUGpNQm84ZTM5blFt?=
 =?utf-8?B?a3k5U3I1cnhUMGhvaURxaGtBMnpuQ1dJTnBuVkluMGVNNTBwdEVFdFF0ekVm?=
 =?utf-8?B?N25SaW54aGl2aXZkc0JqNjRMaU1tZ2VzVGN0M04ycnR0VmZRdTcxVnZoU3dI?=
 =?utf-8?B?VHRTbHNtUDh2a2s0K2hROEFGKzBNOHhxWmZkNTdpM2xSZjRQeVMwb1Q3cU83?=
 =?utf-8?B?ZzVGRndZdGlOakVrZVZscHJ3azEzQnRaQnJoMjZZTDRGVm44QzkzRkpEVjZx?=
 =?utf-8?B?TzZEVFh4ZkN2ZVEyNHVUdW5VRUJvMk1GT1RiS3MzSGdTcy8wYzdqQjRzUTVm?=
 =?utf-8?B?ZzF1czhxcTVHQnBoRWJHTUM5ZE0razF0RUtVV2FUcXBOQWdmYWxoT3MxY05q?=
 =?utf-8?B?SEdTbUc3RnduOFJSWDVTcnI1eTFDakJWK29jQ091WW5NUC9UYnNzdkdGdDk0?=
 =?utf-8?B?SFYvakFqVVJJYmlCQWhsTkR5VGVwSUtEQ1hMc2Y4TGw4N2QzeXlMSEdHc0Ru?=
 =?utf-8?B?NFVyU1FGL04yalRKR1IyazNKa0F6Y1p6VCtWUk1CNm1tZ3RVckVMQzhWQWt6?=
 =?utf-8?B?Q2pXU0Vxc0V4akx0MnVsU2l4UXFtQkVxbDRkaTJkOGpTVnZKSUpoZUdzRnpB?=
 =?utf-8?B?TjJxRjNheWdpdVJzMEp0VW5hZlZESkxVYlBTWVM0WnpFRmRSNnVuN3FySjRX?=
 =?utf-8?B?eG9Dd29CaEpMT05ORC9YRW12T3d5Slc5dzNZR3FCd2RyTWR6dGlVdVMydXpB?=
 =?utf-8?B?SzZQa3lzbTM5OTNMRGYvelRmdmNlbmRNeVBRUDBrLy82UlRDOHJFcHFmVzN3?=
 =?utf-8?B?TGJ0K2hXd0x4ZHhuYWZoS0l0Z25IQU1JbG1scVJ3YnBveTY0dWZjRitiQUpH?=
 =?utf-8?B?bkxTYzZqL0JJcHkydkgvNzN3NXN6MkpwUGpUS2RpOTNFNGhOSk04SnVHVUI0?=
 =?utf-8?B?cUNiNVdERmxndHBWRGt4ZFZkYTBXR3k5ajNJNlhQTXEweDcwZnd2NUdCTy84?=
 =?utf-8?B?ZmZnTHE2bUNtVWZmY1daaE1ncWljS3NodDZUZW1JSHFCb0hnbFJESjRGUnQz?=
 =?utf-8?B?dU80a1pVQS9yTktMOWZOaXJpWVFzRWhOVXc0cllxTzZRYXRwK2QzVGpYTCt3?=
 =?utf-8?B?OHZzUVNJY0xuVFZRYVcvMmpLWWJ2VGx6cWlUL3NodVhRSys3R1FpdkN6RS9x?=
 =?utf-8?B?UXpmYTR6dk52ZzRQdWZ0YTJ3VzZDQnkzaXAzVXhwYmRCMStHQlFXM0lMR2hp?=
 =?utf-8?B?eThTYVpxVWFNeTRaellsUFJKa3ZhUTZBcnpRYTluZklIcmJOb0YvMkxpejRW?=
 =?utf-8?B?VlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc4b3bd-08f5-409a-3bfd-08dda7e420f0
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 06:00:40.8628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kgVmlR5RD2o8aqdbv94JMFxoEe8y81Q8zEN4OHqByjIeIf80kC9rBb11u97XhuMk71/xLAf/xNnULJyloai0sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8825
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

On 6/4/2025 21:00, Michal Wajdeczko wrote:
> While we already print VF's runtime registers only under DEBUG_SRIOV
> config, we should be still doing it at debug level, not info.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> index 821cfcc34e6b..fa74b3e1a964 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> @@ -266,7 +266,7 @@ static void pf_prepare_runtime_info(struct xe_gt *gt)
>   	read_many(gt, size, regs, values);
>   
>   	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV)) {
> -		struct drm_printer p = xe_gt_info_printer(gt);
> +		struct drm_printer p = xe_gt_dbg_printer(gt);
>   
>   		xe_gt_sriov_pf_service_print_runtime(gt, &p);
>   	}

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

