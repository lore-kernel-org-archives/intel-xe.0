Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31F7C3DA6D
	for <intel-xe@archiver.kernel.org>; Tue, 20 May 2025 20:10:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C3110E051;
	Tue, 20 May 2025 20:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LFKh7ymC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0FAA10E051
 for <intel-xe@lists.freedesktop.org>; Tue, 20 May 2025 20:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747771851; x=1779307851;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=08oHXFOXeLPzJ78u1bwMIt3WdL8vFO3KDron/PfzNEc=;
 b=LFKh7ymC/EmZPU4/Zdoh2VZVsGlhHPRzTNmlHxolk30gOZ7Y7ZwbZnZR
 p5UU+w2VGvuYKsdCXgoZeb8AbQL0abnML/sJIYjYxx2PptbO6GVP/DV5J
 wff0h4CymWJ2u4AVGzT8veZEMHdqGxhNKhbOhFV45PFjn0svNHx33gv/I
 WRdbNP5SUocNnlnQ7CVuMvRskhh9db0aVROegrTY/aoHKpLkwtJwvMknq
 FEVXuWMq3pn3fTdgNBU/PcSJBkhfa1o7WUuVX6hs+4qSmMlMIGuKTWu5g
 wSrpgCXRW+FBjUvvke/I+UoOGcTDEoFmrqwkMdHBaaQTRiDDYP32dj42u w==;
X-CSE-ConnectionGUID: wFQ6h72sRJSn98lQdJE74A==
X-CSE-MsgGUID: LnTENCN7TuC5lwZ1gsPhwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="48978493"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="48978493"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 13:10:50 -0700
X-CSE-ConnectionGUID: VuZTG7MJQMKebwPdjyWvLA==
X-CSE-MsgGUID: BMmNmc5jRI+Op3rM0sjeOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="144662128"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 13:10:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 20 May 2025 13:10:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 20 May 2025 13:10:49 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 20 May 2025 13:10:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pHQgMmX9BIcKae607GQfUCcGlxMfQ2SOh0KEadufS3zK7nOrqG3aKt/0JTiyX5hdQw5bOuLBy70w6YF8D6LklqcVGl6irho4v5v585GAecADN5uPhiP8SbajbmkW3UiVDH2zXGjaz2ktF7BkgraX9uiXbNejqiWefgK6ezRbTpRMmA4WpSrl3Z8qjub9Q2YaDQxuuJdC4H2LQEzHMQin5Bpr22mUN8s1Io1kQwS/AU+Olz3orBnfXDRiej3Pkyk/lyrkPhsQKqjd2LXQtMbgUkgDvHxijHUznu04uKvcf1ksDFsEscESWEN78fL3cirDpiRBQrBJZKGusYOUljPuOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08oHXFOXeLPzJ78u1bwMIt3WdL8vFO3KDron/PfzNEc=;
 b=QxPpbVwJXaPZ0L/GkktLWipnGgTTh7/Syjo9oyvCahpH+elAT+TVYrvOz5KLShH2M5T1Ws0LEgHnp4zy9/Npj7LMQHJUWeWy62GKlqyTnkj3ON5MCnTwCk3oOXCq9crBMJ4G/uhJxxR5fPBN3xdmBvBrJVmYo607mUTzYGEWI9aE5sqL8XhZFtH1pfUHiC4J8yUEFr1vJ6bo5SqsVu5zA9ui54+TCWgnG7eRMdSS2+GcLsP7vLSriVEBfsBf0vgPhsVgxejln7dTwJBxJYsm8WG86BLkjdRsASYDkcL+XXTzRithltekJlW+oA2ywNPpBdUQdP19EQsVhyL/5dSoMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB5700.namprd11.prod.outlook.com (2603:10b6:208:33f::22)
 by SJ2PR11MB7574.namprd11.prod.outlook.com (2603:10b6:a03:4ca::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 20:10:32 +0000
Received: from BL3PR11MB5700.namprd11.prod.outlook.com
 ([fe80::7fe7:55d4:2fc0:6398]) by BL3PR11MB5700.namprd11.prod.outlook.com
 ([fe80::7fe7:55d4:2fc0:6398%6]) with mapi id 15.20.8722.027; Tue, 20 May 2025
 20:10:32 +0000
From: "Taylor, Clinton A" <clinton.a.taylor@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Atwood, Matthew S" <matthew.s.atwood@intel.com>
Subject: Re: [PATCH] drm/xe/ptl: Update the PTL pci id table
Thread-Topic: [PATCH] drm/xe/ptl: Update the PTL pci id table
Thread-Index: AQHbycGNPwXH9j24Yk+qPxfBHJjC8LPb8usA
Date: Tue, 20 May 2025 20:10:32 +0000
Message-ID: <77be31f72959c0d2519e35171993689cae67ae46.camel@intel.com>
References: <20250520195749.371748-1-matthew.s.atwood@intel.com>
In-Reply-To: <20250520195749.371748-1-matthew.s.atwood@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB5700:EE_|SJ2PR11MB7574:EE_
x-ms-office365-filtering-correlation-id: e731719b-6ac9-4c4c-fcfa-08dd97da5fe4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cFJVdjV3RVc0NEF1NytxY0drUGNGSVl0T3dBN3BJVXh4Z1k2TEljcWp3ejBO?=
 =?utf-8?B?UGhkNWVBK3VjcnQ0TVU5UVJLTHNSYXFlaDkvOUpXNVQyYThydUJLVk9KeXJX?=
 =?utf-8?B?bXluczZ0ZFQ4bHNCNXNzQllRTVNoQlF3dUZFdkpsZXltSUw4SHpJbWFzSERk?=
 =?utf-8?B?OUdrSSs4WjZ1T0RYMG96cXEvTGQxUUM2bnUrcXoxM0lYUHBXdzdLR0g3eHE0?=
 =?utf-8?B?OW1DQXU4eGsybWdWTElmcDRsbEJLeU84Qk1aWlNtcVZEc1BobENSVVFPKzdQ?=
 =?utf-8?B?WmU0WDVrNi9leTF3S3JlSXhKNFVlMUozQzdTU1pxQURaNW1rK2tLYU1MYnBR?=
 =?utf-8?B?blc2NGRaMkhuMXViZW1iNnhJbTVuWHpTWGJwa0svNmRFYklkbWJZYWd5dlBo?=
 =?utf-8?B?eGVxNVBzVkNpWWxaTlpYWkJvZ3FjL01FQ3NFWUxtNUZkZldtNFJPcW5mck1w?=
 =?utf-8?B?b0pheFRjSktmSGFJV2kyUWZzeGFTQWxYbGhia1JqK3luNU5jSVoyTnI2R2pC?=
 =?utf-8?B?aGQrY0graE1WN2U1UTBMUEJQMUlRdFpCUmd6amd2YmZSL3NYUk1CVk0wWThO?=
 =?utf-8?B?M0FVUHJCWEg3Mmo1VUhOZ1lISnR4dlVjV2xodkxXckVaOU01UUhpYy9sM2w4?=
 =?utf-8?B?ekMzTURzeU9yclR4bk9oTzF4dHdWeVBoTm9MK28zODVwRldnWUo0ajB2NlVk?=
 =?utf-8?B?N0FmVmYvZ3c4TWZNY3NCRjFPUzgxYUEwd0RYL0xFeklQNWlxU0ltQ0YxcWs2?=
 =?utf-8?B?cmpLdzlhaHdLN3hVRlphbFZyNWZpTkZLNWsraWpNVkdjTUVyektUQytVNWsy?=
 =?utf-8?B?cWYxa0oyR282M3FLU09tTzR4S1BqVmc0dVN3VkdNNGJrVGRxd0Z3NDQyeThV?=
 =?utf-8?B?Rmg0Skx0Y0x1dGQ3TGtkZXBZTE41VCtLa2hmZHFkaTFibHNQM3RNd0s2V0dO?=
 =?utf-8?B?ai82ZWNVVi9qOXB6LzRMaHI1L2RpbVo0c2tFcFI5b29VNUIxWmU5QVJpbm9Q?=
 =?utf-8?B?ZU54RTArOEw0YVF5MmZyZy96UTdoaGtQcXpJeFBCQkJTeEpkNGc3VFNyNWZS?=
 =?utf-8?B?MWdxdiszZ3h6MnkzRVNJRWt5Zll4bU1IcDM4Ukd3bzFzSkpxR3I3bDhxd3FT?=
 =?utf-8?B?QTVCTTQ2SlhUNlZJbXIyRmNUS3MwRFRyNlF3d01QZm5ML2JuZExtN2RaZWVx?=
 =?utf-8?B?b1h4OUFpRzlNZlVoaVpFVGRVbjFzS04xTVpJZTM5S2lyYW90VERIUEt4cTNW?=
 =?utf-8?B?OUtSUm5LUUhudzd6bWErR2xJQkM2SS84MmFVRGZOM29KSGZMM2pJejVKTzEr?=
 =?utf-8?B?UjhNdlVEMnBWaTFFcFIzU0IzWDJ3MU9vSml5VnBZVE1nQzduRWlBSEE4ODVL?=
 =?utf-8?B?Q2c4Vkg0T0xuTmJ0MTFlQm5qNzZVRWg4cVJFd1U1a1ZBT1RxN3c5WFVoOUNu?=
 =?utf-8?B?QzBNQmFRcHNmSUo3VTZYeXFOUTVodkMvZ2JYR0Jtci9aSlJ0QzZrZy90aWdk?=
 =?utf-8?B?Z095YWUrcEdZUXZDUlU3d3VJcnFhSWw1am5telFUdDg5NFhjVEdRaVJPcHFS?=
 =?utf-8?B?YVBnQVV3QkFPVERuODUyMlpaZ09YZW56VFlkOFREMFl1TU5UNTNLMTQ4NFRN?=
 =?utf-8?B?REo5S2FPMG9rSzl2Nnc1M2grTVdiYy9PejUyRUJZcVF4TW1EcGFtMnRqWmdZ?=
 =?utf-8?B?OWF4OE5JTy93T0I5VjVyUVlHQXFDV3pPcTNZT0hLL0NHRTMrdzVqcHhQTjVp?=
 =?utf-8?B?ZWllbHQ3Q3VDYnJTT0NiQ1A1RlhzdGtzWmhKejdIL2xScUs4a1lYbWs3RW9T?=
 =?utf-8?B?SmlDVUdxVUMxdXg3ZHFFakpFM2E2RnZYOERDbW1tcG5IMlBxNEUxQnNIYzhm?=
 =?utf-8?B?OXcyeWxQOC8zZWVFcnpFWkIwbEE4NWIrUEI1dFBFbml2dEs4Q1EzcjNjYTFX?=
 =?utf-8?B?YjROK1ZpVmtyME5hTUNXMlMxazlIUHBIWEV5b0ZGRVd6RnZMMTJFYW9tWk5n?=
 =?utf-8?Q?1sYjdrqcGy5BY1Dhao2m0mjp2BNN+I=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB5700.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZEdVa254UTl1QXc0OWpTWVVuQ29HWkc3VmlWOWFvdnFNT1ZoeTdoa090bFVH?=
 =?utf-8?B?MGNPOWdGV2FaejRRVDdpWjQrK2hJckN6cXR2VndYaTJ0d0ZqY3ZHUTc1eEFs?=
 =?utf-8?B?UUU1VXdRTUFxOVR4eENVaGVYQ3FJdys1aGdKL0UzVXVDNW9qMElXek5KRFp0?=
 =?utf-8?B?UkV3ZXMwTHlVNWlWTzhoU0xpbzFnNzFzZzlxTFpXbys3ZU44cEpzY1NjMndj?=
 =?utf-8?B?dE1xNmR2RS94aVdwNjlIekxxYjZiZG1GK2ppQWQrc1FabDg5TXY3WkkwQ3Nt?=
 =?utf-8?B?bmZQNUJ0bk1neDdTRUpNVWRCUGh2bGg3ejNtNXZTcGs3NHgwSU1GZVMyUTJU?=
 =?utf-8?B?LzdhbEZSczFWRllRV3ZYaDVmZmlWMVJDWGJIZWhoTGFPRUJsOFlRMkh5L0Qx?=
 =?utf-8?B?VWFtOWxCYVl0NGhKRmF3WG52VTR0dTNPYVZFRGRjd3dYT0VPamIxOUtaRDNp?=
 =?utf-8?B?K2VUSHJYU0k4R0RmQVVDekZZbUozY2FOUkk5VXBZZlpHTy8ybzhrVGVXN1JG?=
 =?utf-8?B?aVNsWTBoQjlNR1hNWjYvTE40WEl1THBpS2ZlL1NZcER3UFNpS3VhMlNPbmMv?=
 =?utf-8?B?UWVpTCtiRXJBUFJZaXl3c2lERHBiN0lkeVVmZEhtaDR2Um9jK2t1LzRoZ1VU?=
 =?utf-8?B?TWUzbnZwRTMzd0xBWXh3SFZDazRJcnZWM3kvb3oxSEhHM3gxMDFjSkZ1dVpR?=
 =?utf-8?B?NHkyU3NXNjZlUVFUcnRDalIrVHZWRlBWTko0eE9aMGJNVEdBUmhkUVFIT1kx?=
 =?utf-8?B?U1RWQnkwbTZ5YlFBMDdSMDQ2K3RQbTFwUFRBNVU4MGN2dnBYb0pCK0tHMjQr?=
 =?utf-8?B?a20vNHgvNkp3cmZlcnZuOENtL1BUQTlqYnErUEk2VkNQaEg3L1FVM2dGKzhE?=
 =?utf-8?B?RVRsazNxeDVGQnlLcEs0WmJEWFRoOWJQM3hNbXBwOVFOM1l6bk82ek51cU1E?=
 =?utf-8?B?SWYvMGo3ZG12ZUhqSEFwWE1EN1dsanp0VGxJd2Z1RHBtL0ROVU8vMm5QWG56?=
 =?utf-8?B?VThDYTN1eDdqUDZCbGEwbVZURjZGaE1VNWtzWTRDbkZWYTNhYkZVWWNVVCsy?=
 =?utf-8?B?dXBOR0NnSWFaTW1lblNRS0FxTmQvaEpYKzdWT0orT2tkay9McWNhc2RNZmo2?=
 =?utf-8?B?RGJWL3M5aC9wajRJNHJpRTFibitPa2JBcEsrZUJRSFJEVVVPLzQvdGlodTQ2?=
 =?utf-8?B?YmxOSTM1cHFUL3llOEo1UGtnT0NoeC9NZHRYZU90STFEZGduT2xaK0l4eUdq?=
 =?utf-8?B?NkhzVzJzcWlPalMvN2JtNC9GdHBPVC9oais5QlBOanZKTE5oeWV1bmYxWUUy?=
 =?utf-8?B?UTBoNkxXRnVsTzlqSi9leEh1R21sL1VvTGJ2eHkvb1N2dm53UDZqWkp0Tjhz?=
 =?utf-8?B?MmFKZis3bkxhTzBKZlA4QjBDMHR1SmRTSmt5ZWQyUUxwaWhRMW4rakUrUnFr?=
 =?utf-8?B?MmNTUXoxK0lGcVdGMnk4MDJuVHgybGVtWkM5M1dKcGx3eHR2N2Z5bnBScEJ6?=
 =?utf-8?B?S01BSGZlN0ZheWNJQ1Vkc29KMkxScC9FVzVDZW53aEFybXBVeWNRSzJ6ZmQ4?=
 =?utf-8?B?UWZ6L3loRXFXWVpvV1QvbGdwc000c2YwY1Y4bWtNUktDU2F1SWdPTkJZYXF5?=
 =?utf-8?B?WUZnd1FQWlYwTFNaem5abjJmNFFVQlM5R1dPR2NoT2JRcjRiU3ZsSDBDYUJz?=
 =?utf-8?B?RmNldFNFU2JCUTYwWWxaNWs2RjVQT28vNnlMQm52aldFTjQzY3dpODY1ZzEx?=
 =?utf-8?B?RzZEMCtZVG5ma3NqdlVZZTIyL1U3THRQZ0k3VXA1a3BiY1cxL0U3RitGZEht?=
 =?utf-8?B?WW00THhJL3lqT3ZweU5DWFo2RU14TXJ3d2E0TVpyeFZ2RlNBL0UzeVBKZUhw?=
 =?utf-8?B?QUtDcUROYjlDSVIvdy80WnpadHBMSkFKV1hKbnMvQmJxazRJK0xiTFU3dGx6?=
 =?utf-8?B?aHBSM2hsY0ZBMmp0RDRkeWNsKzA5QndycXFRYytEa0ZLVjlHeUtxRFE0SG51?=
 =?utf-8?B?Snk5UUZrb3BsdXRPSEd3Z09NN1ZpVCt6ekZPemNKbFBaS0hGZzIrZXJaYzJM?=
 =?utf-8?B?QXAxQXpQMG02TUVSdVg2dzhFYVM1NExlMTdoOXc5OXQzM1dHWnRlSllUS0Rz?=
 =?utf-8?B?cW84eXpFWFdSMnl0UW5ETFB2NXp1VjdSUHEvbjY5SHZ2SGI5aTd3VUdoa1pP?=
 =?utf-8?B?SFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FBFEC58EA2DCB744808DC70320DE3A62@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB5700.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e731719b-6ac9-4c4c-fcfa-08dd97da5fe4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 20:10:32.3296 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PQIPJZJteKocl1cEutBjUoR06CrM+I1eTPTVWZjEbpCi27dfpBzk6C5c+aMJfQLtRafnihxRx+qi+2hnr4w3T9kOlO5dpyDRd/OxRSWrNjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7574
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

TEdUTSwgbWF0Y2hlcyBjdXJyZW50IGJzcGVjDQoNClJldmlld2VkLWJ5OiBDbGludCBUYXlsb3Ig
PENsaW50b24uQS5UYXlsb3JAaW50ZWwuY29tPiANCg0KLUNsaW50DQoNCk9uIFR1ZSwgMjAyNS0w
NS0yMCBhdCAxMjo1NyAtMDcwMCwgTWF0dCBBdHdvb2Qgd3JvdGU6DQo+IFVwZGF0ZSB0byBjdXJy
ZW50IGJzcGVjIHRhYmxlLg0KPiANCj4gQnNwZWM6IDcyNTc0DQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBNYXR0IEF0d29vZCA8bWF0dGhldy5zLmF0d29vZEBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgaW5j
bHVkZS9kcm0vaW50ZWwvcGNpaWRzLmggfCA0ICsrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9pbnRlbC9wY2lpZHMu
aCBiL2luY2x1ZGUvZHJtL2ludGVsL3BjaWlkcy5oDQo+IGluZGV4IGQyMTI4NDhkMDdmMy4uYTdj
ZTk1MjNjNTBkIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2RybS9pbnRlbC9wY2lpZHMuaA0KPiAr
KysgYi9pbmNsdWRlL2RybS9pbnRlbC9wY2lpZHMuaA0KPiBAQCAtODYxLDYgKzg2MSwxMCBAQA0K
PiAgCU1BQ1JPX18oMHhCMDgxLCAjIyBfX1ZBX0FSR1NfXyksIFwNCj4gIAlNQUNST19fKDB4QjA4
MiwgIyMgX19WQV9BUkdTX18pLCBcDQo+ICAJTUFDUk9fXygweEIwODMsICMjIF9fVkFfQVJHU19f
KSwgXA0KPiArCU1BQ1JPX18oMHhCMDg0LCAjIyBfX1ZBX0FSR1NfXyksIFwNCj4gKwlNQUNST19f
KDB4QjA4NSwgIyMgX19WQV9BUkdTX18pLCBcDQo+ICsJTUFDUk9fXygweEIwODYsICMjIF9fVkFf
QVJHU19fKSwgXA0KPiArCU1BQ1JPX18oMHhCMDg3LCAjIyBfX1ZBX0FSR1NfXyksIFwNCj4gIAlN
QUNST19fKDB4QjA4RiwgIyMgX19WQV9BUkdTX18pLCBcDQo+ICAJTUFDUk9fXygweEIwOTAsICMj
IF9fVkFfQVJHU19fKSwgXA0KPiAgCU1BQ1JPX18oMHhCMEEwLCAjIyBfX1ZBX0FSR1NfXyksIFwN
Cg==
