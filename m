Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81CEC0218D
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 19:26:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DFC010E175;
	Wed, 29 Jan 2025 19:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kYRzwKyQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B707610E175
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jan 2025 19:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738178818; x=1769714818;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=tEvOOPPhCLHOfKY8vVOMHjG/oa6vRgDuiDwv6IJdxhE=;
 b=kYRzwKyQiLjazYwyF/KmnK4EPuxOUqKN5gl1hhzcICX+NC8nivU8HUEV
 7+HwbfdfHbq8mhdAE0voBfPE439CWZcITSD1NxW3IuiKKyxP1SHukkHBQ
 fjCYqqOc3ezs95mAoRx7V+6BN1SIvft/g4ZFHAL51fQebduQVODZ/10f8
 dmrql9dhbGs2/ljdFlIVfXrPD/O2i3/NgMpCk2VQAhrQrfaIgGfHlAGF2
 +5f3sC6cB+OFNRZVrK8bocQwBcH5oh/XLviYZZ/6V8P7cMQ5yeGL6TJcL
 HM0PVDR2EzmNdlqnpNvGBUOgRPVukoEAFkxV3aTZu75BgMwVy+JC0eS/r w==;
X-CSE-ConnectionGUID: hHooCzVSRbufYyVH6/WvxQ==
X-CSE-MsgGUID: ly3Rm5YDTIuXHijuyME1BA==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="38741773"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="38741773"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:26:57 -0800
X-CSE-ConnectionGUID: 947s5vhXRrOHZq0v3cYnfQ==
X-CSE-MsgGUID: gncg0uPiQP+AdivpPOLrgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="114102968"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2025 11:26:56 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 11:26:55 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 11:26:55 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 11:26:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t3wBytlCTwO1Q6EQ3wievNJLksX/KZ5Lt+TejKASfoEK+tWf3hsw18c/NwiX1zvDLpzl4CQQ+o4EZ4kTFCego2DhT2OkrNGGQKl/Pq44d3ZXMVQ53rUz7htQj6WwfX5z2aDlDmj8qIgwv0czgj4F8uUIWdJFVUK4HY+zOy/AD7StIHX1nHj1IPheWKzs+fML66ET82eyGaWhQj1m7CtZ0WzDBGpAJ+xTLBk2iaXZsHxZD1lw6LMxg2WhyNuYPVVGuGZJK6hi9XF4yZ339m0AsEY0PZ4MuTfhcww3JTzoX/qkotvmWwnnz1cx7z0sSiTYIF9t05+bwRL8Qs6vg+yVCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tEvOOPPhCLHOfKY8vVOMHjG/oa6vRgDuiDwv6IJdxhE=;
 b=vYPhoBQxz17kTOHlLsFj8JmKLlqcHTJp07+MetgGNFWszjKF783jlktlsluWynWB53Ra03W+g0VrXOEHEgVjmaCGpN51d9XWjeWZRTEqxKbN2H66wJxsKC+Nn5ezw5Wqz8lX8UxTW6CLJGfn5AgGzEm0E+iZKFZ32vbjHfDHlwbx5DbktgrIAFiuvyTUR9E+n6tqp5MRqJo8RJW06yRXj+OBUQdinpoZby/NJ5v1ZhZcuAnNvhtKKd9YYE8n/PU/AdOgLEO+LSGOXNYkvTwBteD6vjBdxuLWuHmiZDrRpOzwHoAgJ86H6FXlOs8jri4YtHQxLm0vSE0heWa1KfogVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH7PR11MB6748.namprd11.prod.outlook.com (2603:10b6:510:1b6::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.23; Wed, 29 Jan 2025 19:26:25 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 19:26:25 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
CC: lkp <lkp@intel.com>, "Souza, Jose" <jose.souza@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Fix size_t print format
Thread-Topic: [PATCH] drm/xe/guc: Fix size_t print format
Thread-Index: AQHbcZvGVa7ZVPks6kCuXLa3ioNkX7MuJCWA
Date: Wed, 29 Jan 2025 19:26:25 +0000
Message-ID: <d70d72bede522da63143bd4e318a787516e12627.camel@intel.com>
References: <20250128154242.3371687-1-lucas.demarchi@intel.com>
In-Reply-To: <20250128154242.3371687-1-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH7PR11MB6748:EE_
x-ms-office365-filtering-correlation-id: bda9eaf8-34e0-40a4-6b68-08dd409ad280
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OFdLNERvV0JmN3gvSVFhSktNRy92LzcyVUlKVzhqazZyTTFSVEF6cCt3cEpO?=
 =?utf-8?B?RUpHaDRQUmlqTGZYNzNLa3U0SDMzY1VuVEczVnZHV2o3RFo2ODNja0h6SDda?=
 =?utf-8?B?NGF6M3VtWEVZYkVRMVV6ZDJUaXJmbVBCdmVoZ2ZaemhsY05Ccmlab0ExQWJ3?=
 =?utf-8?B?amxRTGF2VmhidEdwNU81cDU4NmpQaWNLb2hxU2lndFpidlNsZHByUzl3a2g5?=
 =?utf-8?B?eXpQekpCSFpaUC9hZmU2ZWN3NHYzdkxrcVVhdGJpdi8yUmRxMlVlUUR4R1Ex?=
 =?utf-8?B?ZHVYcmJkUnp4L0JURUFUTXpEZVh5c04xYnBXRzhZdE0xM1N2VlI0WDNoZkpG?=
 =?utf-8?B?L3VwbTBCZXNJVUJxblJOY2lEdjdSdHFuQXhCYTVqOXpkZnFSa1ZWRmlqLzdw?=
 =?utf-8?B?TjJtdXhSUVVMb2FkYTh6bEZtRlNUbHZMZmhCT1hSUC8vU2EvbjVKbnRaT1RT?=
 =?utf-8?B?akF4WTVGV0Vqc0huNGRrNE1CVUMyQzI5c3c5RzdNUHNJd3hGY1F3S0RaT0V6?=
 =?utf-8?B?NldBMTk3bVYzQkJrSWpJZGpsY0hBa3dFWFF0Z2JMTXUwbVR3Y2o3aENKVFBH?=
 =?utf-8?B?U21JMUdWY2llRlV2S0VQZXlORmZtRzdCamNBKzlMOWVXRGJoRE5TdWEwbzlt?=
 =?utf-8?B?RERvV2RIM0FOamJhNCtTZmZWb01kbVcxVEdEOFp4cWVGU2owMmJWWHJBY2g1?=
 =?utf-8?B?K1VPMzNHSDA2a0FtRHRqa0FwUGhBUkVqUnVTMEN5WnV1aEVnaGtLMTVvNVU2?=
 =?utf-8?B?S2FhWmMxT2Y5OUJZby96WXorbVJkbERqb2dzT1FubU5hOU5KT25ab09QTERL?=
 =?utf-8?B?dnVxMTh6a0xXc1J1M0ozWDJwYUJLUDZILy90YTJkU0pSQ1dsTUxlNmRJVzEz?=
 =?utf-8?B?bXJxQUxjSkFZam0rV2NNaFJOMjliTWRVMlVCVUVRdHdLV0lNWVI1T01UMCt4?=
 =?utf-8?B?RXFJSzhhNkc1ekFRVGwvdndaVGhldVgvV0VkL093SFJrM2w3QXJ2dk8xbith?=
 =?utf-8?B?M0hNS3ZFZWtNZ2FFQUJLZ3JDRXp1Z1RQcGhRMXBEWFdpd1JIeEdGTk82djNh?=
 =?utf-8?B?TW03YUhZZnN4OXZaNk5XbjU1azBlemFNUHR0eDVNa1djMXVFMDVZdGJFSHNy?=
 =?utf-8?B?ZkJMZXlOTk0vSytSUHFaa01mZkEvWWUxcVZpQkp6d0crVzg4Z1U5MmZJMkkw?=
 =?utf-8?B?cEFQR0FKYU9KLytYSXVQSDNoeTJzWGd0T0VlMEFSVVhQUlIzWVhyTlVtREFy?=
 =?utf-8?B?cU1ZbGhoT3FuNml4ZEptN0RLTG9vM2lVMVdZbFptUUZaUUN2eElZTWRoYXIz?=
 =?utf-8?B?Z1ZLbURySU41TUpsVjZQUmhjVWttMGViMVVkbjc0emdhamdnblZSQ05BRGdt?=
 =?utf-8?B?c2l1djY1NkhqZHZGVzBXYldNOVoxRkdyaDF2N0JsWUI1a2lqaVFJTThlYTFr?=
 =?utf-8?B?blRUSzdDMnNSVDcyZHFQSE1VN3lCNk5qYStkWmg3WERTZkVNb2krM3JQY25a?=
 =?utf-8?B?K1UyNGZFK2tIT0dtMklYMTZqYUcxWlRYNDBTSy8vK0l4WXIxK3kzWkxENkMy?=
 =?utf-8?B?ajlWNmoxUjJJNzJvK0Qzd0FPU05JbFpYOHkvamhSUEJtaWpaU1JCVWN2QzVX?=
 =?utf-8?B?dlpOZGJIQURWNFdReFF0L2lsbVBBZld6TjNCTDFuMTR3dDJFeE1IRGpRM3Q5?=
 =?utf-8?B?Sko5Wnpub2VwYklvSi9Ed01rWmp6VURQNERFL3pHaXhDTUMxc0YwZDF1Wm5q?=
 =?utf-8?B?ejQ4Rkt5N215UFdwYS8xSldMRHZFUk9QZWZ4V3huU0NHS29lb0wxVXBzWW1q?=
 =?utf-8?B?VUltT1ZMbFZENkZxOVF4TEZzZWtQSis5bnozY3c5K1lnd25CN0d0ejNBRFpP?=
 =?utf-8?B?YmZRVStTelBDTlcrODFpMC9vdDZLenYvMUNFdkp2a01JcXRSRXQ4VXcwdU1W?=
 =?utf-8?Q?YA/MLnytQWbEZj8hAOI/UGKtaejSRBbn?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bjNEbldvWWtZejNtTkNkSTI0aVVhcjdWVW5zVDZjRi81NEhYSFYwUXRjZWwx?=
 =?utf-8?B?bmgwQ2RBcXdXK2ZsYlNhc1pjTUJHRkJIYTYyd3dMcnduU2RYMktTSWhhYUVR?=
 =?utf-8?B?SDQ3QXNROXAzK1hMOEU5bDhVNUR5TFkwT0VSVHBGK3JucjhIZmRnNnhpQzlp?=
 =?utf-8?B?M0kyNUlXVXRRa1ZUK2JrejJPNHE5V3lBbVJvUUJ2c3Z3Tk4wZExEUWJnUk5I?=
 =?utf-8?B?ODQ5cXJ6NVMzNjJsS1FnQUtTOUZWUzRZZzA4cVdsL0hNMTFlSUxRakRobHFs?=
 =?utf-8?B?VUNFbUdBSU8wMG5KMmZZdlcvdnRTeGJrTkNjOTRjOHpzd0Z2ZFNoNFZNQmpO?=
 =?utf-8?B?a0Qvb0wrNDFIR0tabklUUzl2M0R5dFBwNnNrU1FZb1pJWUJpT3RMYTliZmVn?=
 =?utf-8?B?ZndOdzA4VGFVNVBkSmx6Q05QSWt3QWJpa2h1clNEZk9DMjZmRUc5MWJhZmhS?=
 =?utf-8?B?QTlleHVBckY4LzN6b1hLYnBxSU9sNTQ2UllSRC94M0RMclNIK0xRNytHTG0x?=
 =?utf-8?B?bDVaM0xzenpMYjlWUjl3TGEyaWNvNE81d0pYdVlZVUk1dVBWZXlzN1FpTENH?=
 =?utf-8?B?c0NsUnoxUzVFZGRFZjAyRWVCUzkrNUtnVEJXaHBwL1k2eVFPbEZoeHVtSFZV?=
 =?utf-8?B?aVBsUTZjTjBDd2NjcVJPUFdxQjJpU2puM2NKVFdlZzBSY3pqU0l4NVp2V2tB?=
 =?utf-8?B?WlNUUWdiTDNIVlhtRFVSMjVPdUlnVDkzRGc2L3poM3NTMENaM0d3clhCRXpN?=
 =?utf-8?B?MnppRXVhZnU5MkF1Z0o2b2Y4SnlqNEFjLzNQbWgvZFJyclVwYVVQbVVLaEhV?=
 =?utf-8?B?L0hIOTJRdUhvc0hSeWQvOU1DVTFvd0kyRUZpRE12RUZOQU9GRndqMlk4M0dB?=
 =?utf-8?B?Rko0UG4wdXNxMW9UaFBSdE5pTEVOckVtZ3BMbmY2WWpqNWRmb2JBMkJYbWNP?=
 =?utf-8?B?eWhQRXVaWHM0akZEMWtkZ3ZWbHJsQWNnaDNYdWk0dDdEbnF1eXh6NUJtMmoy?=
 =?utf-8?B?NUt3TVVJTGtHa0tKWEI4UjdlN28rSHgreXlnV3o4NXVYUnpORWhUaEpWMmhs?=
 =?utf-8?B?aFFZVWhOd0VzZTdpQjEzcFUwVjJ0cVYzWVNmbmE2TUg5Y084Sm0yQ2lFOEY4?=
 =?utf-8?B?OFRFVGFxcS9ub2RjUGlCRjJQWXM1UUtzV3pRQkVjVnkvM2JhekFKSDFYbEdm?=
 =?utf-8?B?RGIrTmJUbDBvZllmdU1DdDJBQjZqRU1DQ3FMRmVTME9xZkhyakRTYXcyMFdP?=
 =?utf-8?B?MGFXaUxPYmhpYytOSkRXSGxsSkVLR3cwZTVhS040QnVjd050enZ0UWdPVS9S?=
 =?utf-8?B?VGNDZEJOTFFlSkZJTVNhOVNacmN3MER2Vkx6WEhlKytLWkVmMnVOR1F4VW1D?=
 =?utf-8?B?M0RiRFM5ZzNiQ3VmbnhwL0NKLzRJZ0hoYUFJVTU3QWE4OWNSOG44SW5CUzRV?=
 =?utf-8?B?eGFoak1IdGNVTmJHcldmeUU1bVdHQjdtYkRzUVg2dit1ZHA5aXovYUpzZThL?=
 =?utf-8?B?RVNpUkYrWElLbjlkbEFaYll4Q00yUytJNGxvSVRJR1FOdGpvOTRocmhCeE9F?=
 =?utf-8?B?TU5XVDYrKzZKREZJNFdPRXMzbk51U3N3SEJHcjZkS2Z5OEkzV1ltc0FQZmRF?=
 =?utf-8?B?WTRJMHo4czZzZ2JzQXJWQ0RqcFM2czFhWkRxRC9PekgrTDhRRzBURlNCaFN0?=
 =?utf-8?B?S2FTcHdqcTZoY054WXJkQm9OMFRLSDNSRWFOQlRRRDBweXN5b1lieXJRQWdm?=
 =?utf-8?B?elRwQ2lPNlgwaHhRdE9ZTEJ4bmVEa1N1TytQcFJrOUJERVp5eU92Y0VzZkNx?=
 =?utf-8?B?Uy9MZE5DVVJJQ2tsNWgzeWRyejA0ZW9lcEtGUStiYUNKUUFHWTVqYkFwbnlK?=
 =?utf-8?B?MjFYdjhKdzIrN3B4djVJYTA2S0lZTFlaTGdZYk80dHh1ZGplQ2oxd2NieUNB?=
 =?utf-8?B?WFEyS3hlOFFaUkw1YlFjV2FwRHdrdEo2aWlHaElEeGN6MVBsQUQzTld3YTAy?=
 =?utf-8?B?djQ4MGNaVStTMDJ1Tkg0VjNMWURCV1dnSHZlUENRZUlsYWNRb1VXbE02bDBK?=
 =?utf-8?B?TFZtWDUxK0Z4aFFHckdETXVjZjZpc2JNd0NoTmZTQ0Jpd2FxMzlmT1BDQmhy?=
 =?utf-8?B?NDNwaHJQY0J2WWxUYU44cmI0UHZNWlZqRzFDK09IK0JDUVN2MTlIUVdMYjk3?=
 =?utf-8?B?N1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E1910AE16DB87E48A470F3ED5B8F9FC9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bda9eaf8-34e0-40a4-6b68-08dd409ad280
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2025 19:26:25.6963 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ipk4HVIyewawccYiPqEFFu+URfSju0Aj8+QR/cMW8Ec/aGI+K9Oy8Cq2apb6WvW+oSZRZ8oAZcNSjvT4ZzXzjvbLPGF1j2eIpLFgE1LrW14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6748
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

T24gVHVlLCAyMDI1LTAxLTI4IGF0IDA3OjQyIC0wODAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
Cj4gVXNlICV6eCBmb3JtYXQgdG8gcHJpbnQgc2l6ZV90IHRvIHJlbW92ZSB0aGUgZm9sbG93aW5n
IHdhcm5pbmcgd2hlbgo+IGJ1aWxkaW5nIGZvciBpMzg2Ogo+IAo+IMKgwqAgaW5jbHVkZS9saW51
eC92bXN0YXQuaDo1MTg6MzY6IHdhcm5pbmc6IGFyaXRobWV0aWMgYmV0d2Vlbgo+IGRpZmZlcmVu
dCBlbnVtZXJhdGlvbiB0eXBlcyAoJ2VudW0gbm9kZV9zdGF0X2l0ZW0nIGFuZCAnZW51bQo+IGxy
dV9saXN0JykgWy1XZW51bS1lbnVtLWNvbnZlcnNpb25dCj4gwqDCoMKgwqAgNTE4IHzCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiBub2RlX3N0YXRfbmFtZShOUl9MUlVfQkFTRSArIGxydSkgKyAzOyAv
Lwo+IHNraXAgIm5yXyIKPiDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfn5+fn5+fn5+fn4gXiB+fn4K
PiA+ID4gZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5jOjE3Mjc6NDM6IHdhcm5pbmc6IGZv
cm1hdCBzcGVjaWZpZXMKPiA+ID4gdHlwZSAndW5zaWduZWQgbG9uZycgYnV0IHRoZSBhcmd1bWVu
dCBoYXMgdHlwZSAnc2l6ZV90JyAoYWthCj4gPiA+ICd1bnNpZ25lZCBpbnQnKSBbLVdmb3JtYXRd
Cj4gwqDCoMKgIDE3MjcgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBkcm1fcHJpbnRmKHAsICJbQ1RCXS5sZW5ndGg6Cj4gMHglbHhcbiIsIHNuYXBzaG90
LT5jdGJfc2l6ZSk7Cj4gwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiB+fn7CoMKgwqDCoCBefn5+fn5+fn5+fn5+
fn5+fn4KPiDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAlengKPiAKPiBDYzogSm9zw6kgUm9iZXJ0byBkZSBTb3V6
YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+Cj4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90
IDxsa3BAaW50ZWwuY29tPgo+IENsb3NlczoKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1r
YnVpbGQtYWxsLzIwMjUwMTI4MTYyNy5INm5qMTg0ZS1sa3BAaW50ZWwuY29tLwo+IEZpeGVzOiBj
YjFmODY4Y2ExMzcgKCJkcm0veGU6IE1ha2UgR1VDIGJpbmFyaWVzIGR1bXAgY29uc2lzdGVudCB3
aXRoCj4gb3RoZXIgYmluYXJpZXMgaW4gZGV2Y29yZWR1bXAiKQo+IFNpZ25lZC1vZmYtYnk6IEx1
Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPgoKUmV2aWV3ZWQtYnk6IFN0
dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+CgpGb3IgdGhlIHRlc3QgZmFp
bHVyZSwgbG9va3MgbGlrZSBhIGNpLWJ1Z2xvZyBpc3N1ZSBub3QgcmVwb3J0aW5nIHRoZQpyaWdo
dCBsb2dzLi4uCgpbNzYzLjQ1MjQ0NV0gWzExNC8xMjJdICg2ODFzIGxlZnQpIHhlX2RybV9mZGlu
Zm8gKHV0aWxpemF0aW9uLW90aGVycy0KaWRsZSkKWzc2My41MTc1MzddIFN0YXJ0aW5nIHN1YnRl
c3Q6IHV0aWxpemF0aW9uLW90aGVycy1pZGxlCls3NzAuNTQ1MTI0XSBTdWJ0ZXN0IHV0aWxpemF0
aW9uLW90aGVycy1pZGxlOiBTVUNDRVNTICg3LjAyNnMpCgpUZXN0IHNlZW1zIGZpbmUuCgo+IC0t
LQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5jwqAgfCAyICstCj4gwqBkcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3VjX2xvZy5jIHwgMiArLQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndWNfY3QuYwo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5jCj4g
aW5kZXggNDk3MDM2Njc1YTM4Yy4uNzJhZDU3NmZjMThlYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3VjX2N0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Vj
X2N0LmMKPiBAQCAtMTcyNCw3ICsxNzI0LDcgQEAgdm9pZCB4ZV9ndWNfY3Rfc25hcHNob3RfcHJp
bnQoc3RydWN0Cj4geGVfZ3VjX2N0X3NuYXBzaG90ICpzbmFwc2hvdCwKPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNuYXBzaG90LT5nMmhfb3V0
c3RhbmRpbmcpOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoc25h
cHNob3QtPmN0Yikgewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgZHJtX3ByaW50ZihwLCAiW0NUQl0ubGVuZ3RoOiAweCVseFxuIiwKPiBzbmFwc2hvdC0+
Y3RiX3NpemUpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgZHJtX3ByaW50ZihwLCAiW0NUQl0ubGVuZ3RoOiAweCV6eFxuIiwKPiBzbmFwc2hvdC0+Y3Ri
X3NpemUpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHhlX3ByaW50X2Jsb2JfYXNjaWk4NShwLCAiW0NUQl0uZGF0YSIsICdcbicsCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNuYXBzaG90LT5jdGIsIDAsCj4gc25hcHNob3QtPmN0
Yl9zaXplKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19sb2cuYwo+IGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2d1Y19sb2cuYwo+IGluZGV4IGFiOTdhYzcyOGQ3YTguLjgwNTE0YTQ0NmJhMjggMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19sb2cuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndWNfbG9nLmMKPiBAQCAtMjA0LDcgKzIwNCw3IEBAIHZvaWQgeGVfZ3Vj
X2xvZ19zbmFwc2hvdF9wcmludChzdHJ1Y3QKPiB4ZV9ndWNfbG9nX3NuYXBzaG90ICpzbmFwc2hv
dCwgc3RydWN0IGRybV8KPiDCoMKgwqDCoMKgwqDCoMKgZHJtX3ByaW50ZihwLCAiR3VDIHRpbWVz
dGFtcDogMHglMDhsbFggWyVsbHVdXG4iLCBzbmFwc2hvdC0KPiA+c3RhbXAsIHNuYXBzaG90LT5z
dGFtcCk7Cj4gwqDCoMKgwqDCoMKgwqDCoGRybV9wcmludGYocCwgIkxvZyBsZXZlbDogJXVcbiIs
IHNuYXBzaG90LT5sZXZlbCk7Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqBkcm1fcHJpbnRmKHAsICJb
TE9HXS5sZW5ndGg6IDB4JWx4XG4iLCBzbmFwc2hvdC0+c2l6ZSk7Cj4gK8KgwqDCoMKgwqDCoMKg
ZHJtX3ByaW50ZihwLCAiW0xPR10ubGVuZ3RoOiAweCV6eFxuIiwgc25hcHNob3QtPnNpemUpOwo+
IMKgwqDCoMKgwqDCoMKgwqByZW1haW4gPSBzbmFwc2hvdC0+c2l6ZTsKPiDCoMKgwqDCoMKgwqDC
oMKgZm9yIChpID0gMDsgaSA8IHNuYXBzaG90LT5udW1fY2h1bmtzOyBpKyspIHsKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNpemVfdCBzaXplID0gbWluKEdVQ19MT0dfQ0hVTktf
U0laRSwgcmVtYWluKTsKCg==
