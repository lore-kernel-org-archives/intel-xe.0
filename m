Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A780C5AD49
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 20:24:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D10410E916;
	Tue,  3 Jun 2025 20:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HHtsv2o/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B478910E969
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 20:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748982257; x=1780518257;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:mime-version;
 bh=0OHLptO/MosStPDJYQFRXE5Ea/wR8waLNg3PIvUM9MM=;
 b=HHtsv2o/u0/4vFglVbeDzPVboz0BSGBJ1Qhi5RRoQy5QmYeG4l8DfcdH
 Lb5b/SWSabd5xzsVzrJWCSacRjoIGpT1KC890foUwlnHWzkf1JmqHXVsn
 BUrFnZ4MdAffWE/DiQmKlZfr7UoHLXHeZ9C7LH+56FlQkDsOxGzy68SRQ
 2lva6iUx0uFK1Hae2uHUt/6drUPODTFfuE4Lctwweg1QmQvcrLOCZsvOe
 e3x4T7ma7v0p8FKgsqmgCEK3kPHvPUqNYTDysfl2UPf859UxJSYMl4BgO
 TriTnL7YEsFRgWeXoQJj4pe0yNz57KQecO28+FCZyrYgKgEVXPHPRVdIq A==;
X-CSE-ConnectionGUID: QkwI2TXHTSGAW01m+kol0A==
X-CSE-MsgGUID: gjs28ETATmiMpQ5O2rUbJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="73571056"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208,217";a="73571056"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 13:24:16 -0700
X-CSE-ConnectionGUID: OL6ZGHW+SXCJLsUxqcBJ5w==
X-CSE-MsgGUID: +HuUuWytR6Kkagl2nxKwQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; 
 d="scan'208,217";a="144852017"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 13:24:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 13:24:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 13:24:12 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.56)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 13:24:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uQ4//vxLFcmL4tawn4IB7i/XF7V3zgF2bd1Z7D6JDfPhZxLZLakDPB3PV6731XEvQvW9KNVRzAgB4PcupIzFi3wua71oWFDhXmxjShMG3T1bjw5ecCCrO1IENuF1e53njD83SxRvJAcjP92peuPIA5WIiwzcyMrnUnvNTLVGghKdHDbqLS7fHTzlVK+EaHxIauSxwo7isUBRkxcCjVi1MIWiSlzzfFOQH6l9r/quc6KLPMGjpd5HhaY8fBb6TGx/9wmgAlSJKQx55Tu1c3SDZU1hjF/aoOrFLwcbGN0lBHVAJN0hX/UY8Ub87m2Z66+bqS7c5ceeIiFS5fv5eTnCEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYcXFmClo8l2fZdu8kRcJXvkxH0c5t5Yi0SJC0fguOU=;
 b=gmlGOHLUzsExKJF8FS7yyse0pw1pz8NcxUB088v9JjvaVue8CEaD+KoHHTxmPYkQgcUJlPAYEkktVwDUw7i4yMxg2Ucjh4L8uYMysbD2S1miMDmVs6NDBeuvpOUNzKHm1nzP9wxhpzovNR9WU3Jff/JXNEgRuNGuafd0P2BhZSal5cGaJOqpX6jZU70jgJhSzjQR5LlSh4E68sDClMzFYfNwdxGjTYrNl/f2612Z1wHM9U5q1M3kik5XcH4J4lddkiA980jVfPMCZW0YYcqzI/tphAVxFtgdUEySGtog9zDFrxIOHmTs936C2pqvnrmfxuHXhMtlagU0W8ban76y4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by PH8PR11MB7071.namprd11.prod.outlook.com (2603:10b6:510:215::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Tue, 3 Jun
 2025 20:23:52 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%5]) with mapi id 15.20.8769.025; Tue, 3 Jun 2025
 20:23:52 +0000
Content-Type: multipart/alternative;
 boundary="------------XzyaaMzYWv9i2vTQT0ASp06C"
Message-ID: <89380a6c-74eb-475b-a856-074f191c1622@intel.com>
Date: Tue, 3 Jun 2025 22:23:49 +0200
User-Agent: Mozilla Thunderbird
From: "Lis, Tomasz" <tomasz.lis@intel.com>
Subject: Re: [PATCH v3 4/7] drm/xe: Block reset while recovering from VF
 migration
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>
References: <20250519231925.3196154-1-tomasz.lis@intel.com>
 <20250519231925.3196154-5-tomasz.lis@intel.com>
 <75aq2gastxnu4l5c3izbvniqzpwyfk45ux5oedfrwg3ir4kh3h@fw5zpvvek36d>
Content-Language: en-US
In-Reply-To: <75aq2gastxnu4l5c3izbvniqzpwyfk45ux5oedfrwg3ir4kh3h@fw5zpvvek36d>
X-ClientProxiedBy: VI1PR03CA0051.eurprd03.prod.outlook.com
 (2603:10a6:803:50::22) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|PH8PR11MB7071:EE_
X-MS-Office365-Filtering-Correlation-Id: 34711bd3-e6ed-45e7-e72c-08dda2dc8e76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkpSdThqRnVGSGk4TEV2WE5FanF4eEZxWCtHeE1MbDZuY0N0UFA4aHVzY0pY?=
 =?utf-8?B?U2Eyc2UvcnpYUldVMzU4akIyS29MVXcwZ1FoWVF5Q29rSHZuYUd6Z1V4WFY3?=
 =?utf-8?B?VFFaK0N6NFVTWEtHT05FRGxia2xZMkRuOE50cGJ3eWtZSXRneE10V2pVWTY4?=
 =?utf-8?B?T1d3ZFNUT0Z6WHhCM3RLQWtwWnNXVy9tZ1hJbFY3QWE2UVpiVWNGRkVkQWl5?=
 =?utf-8?B?R1RHaStBRjdQcWlsNkhPSEhYYVFkQ0hLQ2hEUnBXS2RDWnF4UWJqOThCUnk1?=
 =?utf-8?B?VS9ReWIxOHZZN0c3VENXdnF4QmlzQTRRTUNPQUVoRVltRHNSSGJUdXY0Z3RY?=
 =?utf-8?B?M2xXZFlETmdDanFHRW9VemNzL2VpSXQrUURHcDJoV0dDSUJHYkM4NTNDdENF?=
 =?utf-8?B?YkxVMjVvSzlzYy9ISk13U0JhSWJISGNlVHZoaTAySXVwOHlSTDhiVjRMSEY3?=
 =?utf-8?B?R2o1TUJEc1FtQ0ZjVS94Mlkrd1piTERNUnpTMzJKdStvOUllYngwRm8vbjZL?=
 =?utf-8?B?ZGI3QndoMlpHY2dobFZXeUhsenVuRmwwMEp5ejNYRXlaZ0dFRzZXU0V6RHk3?=
 =?utf-8?B?L2Z2RnVkckdoQ3dEeUlyK2NyTkVROUxxWU44b3Nyd3g4U3hpeVEzUWJKdEVM?=
 =?utf-8?B?NDFOVDNCd2JuZ05DRzlHUlpNM3dyQjlUeG90M3hkU3dHTG1Ncm9SUVlXQzdG?=
 =?utf-8?B?WC9oS016U3g1Rk9neDJXc3FBK2pLbmNzQTdoSE9oRSsxZTNBbURHcUhYcERC?=
 =?utf-8?B?aCtLSHJSS3laZ3Jmc21zdTJobHRsTHF4TFJwU1A4ekJZSHpqY0ZTZDdlcEox?=
 =?utf-8?B?cXZxTUdqcWNTOStkRFZGN2RJenhsL0RPVGUrU0N3NUJpRHNiWHF1WllkdlVI?=
 =?utf-8?B?bnU1NUorMmVwcEFUaFc2R3dsOXptWUkraXVwQis3ZmVPb2tUMkROQUwxVG5W?=
 =?utf-8?B?cHZ4SndwdFBLTzRDQ0VzSXV2K3QyZDhVcUhrM0QwMmtDdTZpU1hkTDAzS3Zv?=
 =?utf-8?B?NC8wY3RvVnBGVjhDbm96a1Q4aFplSzFsTlJIUmpNR1lGOGoyemtuOE84OThn?=
 =?utf-8?B?bDNPUnZUYmlhRW9RNkFDWlBCQ0czd2lWZFZaTDdCd2UwZVA4VlBrVUg0eWta?=
 =?utf-8?B?RExBSE5VbHhzRTVUY0htS0plaE1CRU12RDFreWRhTXZvK294Vjl3RnBhbnFW?=
 =?utf-8?B?b1JvU0Vadlk3c1dMSjAycU9pTzBxV3RmMFg0M3NtYVJMNFovZlRVUmpoZm5q?=
 =?utf-8?B?TzFUR3RHRk0rUHZZSWdpWDd1VG1VZDFjLzRsTmhkc0V3eCthMllHdjRjUDB1?=
 =?utf-8?B?Y3JWWTgzWHl5c1lPUEk2M2Y4c3l3NThzNVFUWTlFQ3lTeHNlU29uTHRPSWRi?=
 =?utf-8?B?VWU0aGJCOE0rY08yNUtuWXA3aVJxL21jUitvTWFHMEJtTXdTUFp2M21ranRm?=
 =?utf-8?B?N3JrQnJUL0crbHBXV21NbCtrc2hEUFlZNXdzVUh6NnpCeExJWXlURGxDNmZR?=
 =?utf-8?B?WUxKNWdvUW1ZbHhDNnp2aTVudmlKRlV6QlczNlA2Qjk0R2ZmWUVQaXliNDhI?=
 =?utf-8?B?UVpiQnpPeWZEbThCcERhQmExbHU0Yld3NDFmSFZLdVM1VUlCSGZoZWM0bVlC?=
 =?utf-8?B?bWNYZURmY0xaeWFWc21aaWs3QlYvSXAzQWlNSXhCSnkwYWVZcFBUTXJIdjJB?=
 =?utf-8?B?Y0VmTnV3SFFXWmt6ODBYQ3ZXMWwzcENOakFDZ25PTjJzUFZBalRpY3grR0hI?=
 =?utf-8?B?STM4amdCclN1cWJ5MVk4UkgxZFM0REZaZU81MHZxamJLSkE3aHlSZnJCa1V5?=
 =?utf-8?B?NzM3M1JUUGJJV2I2d0VvQ3M5UlNhOCt2VERZc0h6YWYwV25SYldsYi9qS0ZU?=
 =?utf-8?B?MkdpbmVYNlNIUER5WitjY0tJNHNsc2kzZThHMXFLRytOUko4aVlqeEJxdUpw?=
 =?utf-8?Q?6dwLZjE3UuM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlQ2QWxJVVVQZkZHY0Z4ZGZMdTJsUkhSb0J1TTJuZkdMbURFejRXRFV3Qnk5?=
 =?utf-8?B?WmVhYkVwa1VrN2tWa1FJTkhveDJ3emNFQk5Db3M0Y1pDd2J4VmJjcUxoQlMr?=
 =?utf-8?B?Y2NnZ1I3NEEwTElDZHZNdHh4RDI0MWJSaEdDNFMzcDY0cHlkQVJOTzlGSVpM?=
 =?utf-8?B?MlpqUnJjcnRzU1hLTWJOWGFvNkc0QWUyQkZJY1NKMGw1MEZhUnllS0tIK0ZZ?=
 =?utf-8?B?TWN5c2Fqa2ZveG9YNkJ3Y2NXN2FtZ2l0MjBLa1lINVV6b0t5NU1ESkROVzA1?=
 =?utf-8?B?SzFzb3pwdHVUYXg2L05ZM3htNVJQYTc4WEdXbEVyb0NBditzaXpFV012REZJ?=
 =?utf-8?B?ajRFbXhQMTlqeU1NVXhGWEFpcDdsMXFabnduM2JSM0lwUEt4UmpTaytvSGdP?=
 =?utf-8?B?ckl3OEpNSTdoTkFQWURGbU9HTmw3dUVCdHFEUFVGb1VaTDB3c2xTQ0JGZ3pn?=
 =?utf-8?B?TloyM0RUcUsraHR3QzQxZENYOTR0UmpSa3p4dFVzSEpyWEZ4RzBsSkwzSEVn?=
 =?utf-8?B?THFMd0djaDdkV01ac24wT0tEUWcwUjFTWklPN2JlUnI0SGhzcHZmMjhDMXhX?=
 =?utf-8?B?TTVUMUYrcEowZ2xWVlc4dlRvcVpUQUxWZE1vS3RSY2hpSWlvMHYzeVFGZGIx?=
 =?utf-8?B?aUJLQ1hiWlcxcDNRV0hEOHhINGE2bG1NVzNyLzBRS09yd1ZNZWdSYkRRR3Y1?=
 =?utf-8?B?SGNTQTRFb3llTWw2V1JKZ2hpNE55OVVXdWV1ZFR1akVtMGFZbjUvdkIwdkRW?=
 =?utf-8?B?bTFudVN1Nk0xT1lHY0R4OHBwQ2FLQW5JdmJlWmx6eTBNZmZNQ3o2alJaTlRz?=
 =?utf-8?B?cWpIeGZ6L015MzVVYlM0bmVtalIzZjd2TVpHcmt1d2dLcGt3Q3JTMWlEVUxx?=
 =?utf-8?B?TFFNNjFuWndaZ3lmVDNqclJzN3Ixb1hYYUpaUWhmbWVhZ1BhL29nMEZpSnJE?=
 =?utf-8?B?YzFlbHlYK3Q3aFBvS2VsOGk3TUNwUVhTem5PWGFYekNkd2QyK0JDU3RxQjBR?=
 =?utf-8?B?OXFuYTJGVnQ0VnJ0V200THB4c2NyY1hwWG9DQjN4bktWVERUZHpyRWZZdVpX?=
 =?utf-8?B?cllKUXZSWldIdHBMNEVkWGZkbDFwZWdYdHBqM09QVVJvQlFuOVArSVpJNUVq?=
 =?utf-8?B?ODhvaUhXL0lmL3ZhU1NTWjJYSW1Qem41Smc4NFVkaXhHZ2N4d2Y0RnZtSzcy?=
 =?utf-8?B?dkQvajNQVU9mK2F2Y3BkakVSUk53ZTB5OGFhRktvMG83UUs5c2lRc3kxQ05N?=
 =?utf-8?B?OXRNNjhiRERiZXpXdHM4UUxlTHRMaDBkeW9lZGZIMFpuM3ZEZDNmVmw4QkYz?=
 =?utf-8?B?b0ZwaFkwbk50dXdVOXh0aXFYdlNERHdkOE1UZVZMNUFaRGhzUUxSN1dDWGZM?=
 =?utf-8?B?YVlUeGNJTk5LS01IbXprVVl3cFlIOVJNb2xhbzNUYVJwODZ5QytHdEdvUyti?=
 =?utf-8?B?TjhIMEFLS092TjRmYk9BS2toUVNVS1FmbGZXbGp3dDVqK1hwWG1sVmZMaDNX?=
 =?utf-8?B?TGVveVVjVERaYjJnbHAxdXBBR3lTaVh5THg2clBScEoyQitoWEFJRkJrSlI2?=
 =?utf-8?B?OTJ2Q24rYXArVCtWV1J2c0Y4OHFHZ0ZYalNQZVBveEQ1em13U0N3UTIrNDZt?=
 =?utf-8?B?c0Urb3FCREkxTWdZcHdQeng2NjI5UzdPZDBEKytBSXllY2dpR2R4aEJqVXl5?=
 =?utf-8?B?Y0xUTVJGenRqRnNNcjRock9xY0JzRlFsdkkrT0JMbzc0Nkkwck1weE01Smpu?=
 =?utf-8?B?WFpXR2tzNU00M0pseEZSN1FhYk1MKytYQllkL01ZQ2hnWHpQODJsdlIxdEVR?=
 =?utf-8?B?U2lUMHBtUUV3NURUNUZHVHFyN0NNajZCSURLOUFVSDkxQkhSdWQzS05WRjNB?=
 =?utf-8?B?UFZDSWtpQ2tFYXJNeW85UHRWYlZ2ZVRMZDZMSnQ0MHg5NVZUSXo3TDVNSCsx?=
 =?utf-8?B?bmo5M2Q1eEtxOHZkL2RaVTFIaFluc3FlOHJXR1lCSHFoL1RvakF6UkRNcURl?=
 =?utf-8?B?YnpZWUZUOG9lYXhXZ2k4dU9OR09rU2QvL3cyVFlJZ0ltdEUxZW5HVzFpVkFB?=
 =?utf-8?B?WENuVkhnRzRnREFMOTZxYTVvMlRQTi9FWnEvSmtNMkc1ekovUEZOSU4yeU5T?=
 =?utf-8?Q?TxJY5ZCE0orUcgbN0ClKDKGE+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34711bd3-e6ed-45e7-e72c-08dda2dc8e76
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 20:23:52.5618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aLiW4mZlqQPwEAgj+XzCBvTxcDs8T3cWZaEw4DdtF5U5dNBkWNRtdgBw3KpalJbMgeIHL6L04p6+wpDy2pw6VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7071
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

--------------XzyaaMzYWv9i2vTQT0ASp06C
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 28.05.2025 22:02, Michał Winiarski wrote:
> On Tue, May 20, 2025 at 01:19:22AM +0200, Tomasz Lis wrote:
>> Resetting GuC during recovery could interfere with the recovery
>> process. Such reset might be also triggered without justification,
>> due to migration taking time, rather than due to the workload not
>> progressing.
>>
>> Doing GuC reset during the recovery would cause exit of RESFIX state,
>> and therefore continuation of GuC work while fixups are still being
>> applied. To avoid that, reset needs to be blocked during the recovery.
>>
>> This patch blocks the reset during recovery. Reset request in that
>> time range will be dropped.
>>
>> In case a reset procedure already started while the recovery is
>> triggered, there isn't much we can do - we cannot wait for it to
>> finish as it involves waiting for hardware, and we can't be sure
>> at which exact point of the reset procedure the GPU got switched.
>> Therefore, the rare cases where migration happens while reset is
>> in progress, are still dangerous. Resets are not a part of the
>> standard flow, and cause unfinished workloads - that will happen
>> during the reset interrupted by migration as well, so it doesn't
>> diverge that much from what normally happens during such resets.
>>
>> Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
>> Cc: Michal Wajdeczko<michal.wajdeczko@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_submit.c | 26 ++++++++++++++++++++++++--
>>   drivers/gpu/drm/xe/xe_guc_submit.h |  2 ++
>>   drivers/gpu/drm/xe/xe_sriov_vf.c   | 12 ++++++++++--
>>   3 files changed, 36 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 6f280333de13..69ccfb2e1cff 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -1761,7 +1761,11 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
>>   	}
>>   }
>>   
>> -int xe_guc_submit_reset_prepare(struct xe_guc *guc)
>> +/**
>> + * xe_guc_submit_reset_block - Disallow reset calls on given GuC.
>> + * @guc: the &xe_guc struct instance
>> + */
>> +int xe_guc_submit_reset_block(struct xe_guc *guc)
>>   {
>>   	int ret;
>>   
>> @@ -1774,6 +1778,24 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
>>   	 */
>>   	ret = atomic_fetch_or(1, &guc->submission_state.stopped);
>>   	smp_wmb();
>> +
>> +	return ret;
>> +}
>> +
>> +/**
>> + * xe_guc_submit_reset_unblock - Allow back reset calls on given GuC.
>> + * @guc: the &xe_guc struct instance
>> + */
>> +void xe_guc_submit_reset_unblock(struct xe_guc *guc)
>> +{
>> +	atomic_dec(&guc->submission_state.stopped);
>> +}
>> +
>> +int xe_guc_submit_reset_prepare(struct xe_guc *guc)
>> +{
>> +	int ret;
>> +
>> +	ret = xe_guc_submit_reset_block(guc);
>>   	wake_up_all(&guc->ct.wq);
>>   
>>   	return ret;
>> @@ -1849,7 +1871,7 @@ int xe_guc_submit_start(struct xe_guc *guc)
>>   	xe_gt_assert(guc_to_gt(guc), xe_guc_read_stopped(guc) == 1);
>>   
>>   	mutex_lock(&guc->submission_state.lock);
>> -	atomic_dec(&guc->submission_state.stopped);
>> +	xe_guc_submit_reset_unblock(guc);
>>   	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
>>   		/* Prevent redundant attempts to start parallel queues */
>>   		if (q->guc->id != index)
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
>> index f1cf271492ae..2c2d2936440d 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
>> @@ -20,6 +20,8 @@ void xe_guc_submit_stop(struct xe_guc *guc);
>>   int xe_guc_submit_start(struct xe_guc *guc);
>>   void xe_guc_submit_pause(struct xe_guc *guc);
>>   void xe_guc_submit_unpause(struct xe_guc *guc);
>> +int xe_guc_submit_reset_block(struct xe_guc *guc);
>> +void xe_guc_submit_reset_unblock(struct xe_guc *guc);
>>   void xe_guc_submit_wedge(struct xe_guc *guc);
>>   
>>   int xe_guc_read_stopped(struct xe_guc *guc);
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index fcd82a0fda48..82b3dd57de73 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -150,9 +150,15 @@ static void vf_post_migration_shutdown(struct xe_device *xe)
>>   {
>>   	struct xe_gt *gt;
>>   	unsigned int id;
>> +	int ret = 0;
>>   
>> -	for_each_gt(gt, xe, id)
>> +	for_each_gt(gt, xe, id) {
>>   		xe_guc_submit_pause(&gt->uc.guc);
>> +		ret |= xe_guc_submit_reset_block(&gt->uc.guc);
>> +	}
>> +
>> +	if (ret)
>> +		drm_info(&xe->drm, "migration recovery encountered ongoing reset\n");
> I'd suggest debug level, as it doesn't seem all that useful in general.
> But I guess you want to have a trace that this happened and the handling
> of this scenario is somewhat iffy...

Yes, reset and post-migration recovery interfere, leading to dangerous 
corner cases. If they meet, it's better if we know that from the log.

Reset is a rare, exceptional procedure, so we don't expect this to be 
logged much.

>>   }
>>   
>>   /**
>> @@ -170,8 +176,10 @@ static void vf_post_migration_kickstart(struct xe_device *xe)
>>   	/* make sure interrupts on the new HW are properly set */
>>   	xe_irq_resume(xe);
>>   
>> -	for_each_gt(gt, xe, id)
>> +	for_each_gt(gt, xe, id) {
>> +		xe_guc_submit_reset_unblock(&gt->uc.guc);
> If we were doing migration recovery during reset, we'll change the state
> of guc->submission_state.stopped (btw... is it possible to decrement it
> below 0 now?).
Yes, the decrement should be fixed. Not sure why 
xe_guc_submit_reset_block() doesn't do that by itself, maybe it was just 
a simplification due to it being used only during reset. But - the 
further analysis below makes it irrelevant.
> There are "some" places where we have asserts that expect a particular
> state, and some places where we use that state as an event (combined
> with a waitqueue). Should we wake up the waiters at some point? And
> perhaps synchronize with the places which depend on being in a "stopped"
> state (if at all possible)?

After getting an understanding of all the wait places, it looks to me 
that my implementation is just wrong.

We can not re-use the `xe_guc_submit_reset_block()`  here, regardless if 
async or not, because this leads to all

waits for GuC responses being terminated, usually with an error. This is 
not acceptable as, in case of migration,

related responses from GuC will come as soon as the recovery is done.

Even if we won't wake up the waits within migration recovery, the check 
may still be triggered somewhere else,

or a new wait call may happen and bail out of wait immediately, leaving 
us with detached G2H response, or maybe

even freeing an object while HW still accesses it (ie. a preempted queue 
may be sent back to HW by GuC on

RESFIX_DONE before GuC reads all pending G2H commands, the context 
becomes active but on KMD side it

bailed out from waiting to be disabled and got freed).

I will figure out a better way to block the reset, one which doesn't 
mess with existing waits.

-Tomasz

> Thanks,
> -Michał
>
>>   		xe_guc_submit_unpause(&gt->uc.guc);
>> +	}
>>   }
>>   
>>   /**
>> -- 
>> 2.25.1
>>
--------------XzyaaMzYWv9i2vTQT0ASp06C
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 28.05.2025 22:02, Michał Winiarski
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:75aq2gastxnu4l5c3izbvniqzpwyfk45ux5oedfrwg3ir4kh3h@fw5zpvvek36d">
      <pre wrap="" class="moz-quote-pre">On Tue, May 20, 2025 at 01:19:22AM +0200, Tomasz Lis wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Resetting GuC during recovery could interfere with the recovery
process. Such reset might be also triggered without justification,
due to migration taking time, rather than due to the workload not
progressing.

Doing GuC reset during the recovery would cause exit of RESFIX state,
and therefore continuation of GuC work while fixups are still being
applied. To avoid that, reset needs to be blocked during the recovery.

This patch blocks the reset during recovery. Reset request in that
time range will be dropped.

In case a reset procedure already started while the recovery is
triggered, there isn't much we can do - we cannot wait for it to
finish as it involves waiting for hardware, and we can't be sure
at which exact point of the reset procedure the GPU got switched.
Therefore, the rare cases where migration happens while reset is
in progress, are still dangerous. Resets are not a part of the
standard flow, and cause unfinished workloads - that will happen
during the reset interrupted by migration as well, so it doesn't
diverge that much from what normally happens during such resets.

Signed-off-by: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
Cc: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 26 ++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_submit.h |  2 ++
 drivers/gpu/drm/xe/xe_sriov_vf.c   | 12 ++++++++++--
 3 files changed, 36 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 6f280333de13..69ccfb2e1cff 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1761,7 +1761,11 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 	}
 }
 
-int xe_guc_submit_reset_prepare(struct xe_guc *guc)
+/**
+ * xe_guc_submit_reset_block - Disallow reset calls on given GuC.
+ * @guc: the &amp;xe_guc struct instance
+ */
+int xe_guc_submit_reset_block(struct xe_guc *guc)
 {
 	int ret;
 
@@ -1774,6 +1778,24 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
 	 */
 	ret = atomic_fetch_or(1, &amp;guc-&gt;submission_state.stopped);
 	smp_wmb();
+
+	return ret;
+}
+
+/**
+ * xe_guc_submit_reset_unblock - Allow back reset calls on given GuC.
+ * @guc: the &amp;xe_guc struct instance
+ */
+void xe_guc_submit_reset_unblock(struct xe_guc *guc)
+{
+	atomic_dec(&amp;guc-&gt;submission_state.stopped);
+}
+
+int xe_guc_submit_reset_prepare(struct xe_guc *guc)
+{
+	int ret;
+
+	ret = xe_guc_submit_reset_block(guc);
 	wake_up_all(&amp;guc-&gt;ct.wq);
 
 	return ret;
@@ -1849,7 +1871,7 @@ int xe_guc_submit_start(struct xe_guc *guc)
 	xe_gt_assert(guc_to_gt(guc), xe_guc_read_stopped(guc) == 1);
 
 	mutex_lock(&amp;guc-&gt;submission_state.lock);
-	atomic_dec(&amp;guc-&gt;submission_state.stopped);
+	xe_guc_submit_reset_unblock(guc);
 	xa_for_each(&amp;guc-&gt;submission_state.exec_queue_lookup, index, q) {
 		/* Prevent redundant attempts to start parallel queues */
 		if (q-&gt;guc-&gt;id != index)
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index f1cf271492ae..2c2d2936440d 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -20,6 +20,8 @@ void xe_guc_submit_stop(struct xe_guc *guc);
 int xe_guc_submit_start(struct xe_guc *guc);
 void xe_guc_submit_pause(struct xe_guc *guc);
 void xe_guc_submit_unpause(struct xe_guc *guc);
+int xe_guc_submit_reset_block(struct xe_guc *guc);
+void xe_guc_submit_reset_unblock(struct xe_guc *guc);
 void xe_guc_submit_wedge(struct xe_guc *guc);
 
 int xe_guc_read_stopped(struct xe_guc *guc);
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index fcd82a0fda48..82b3dd57de73 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -150,9 +150,15 @@ static void vf_post_migration_shutdown(struct xe_device *xe)
 {
 	struct xe_gt *gt;
 	unsigned int id;
+	int ret = 0;
 
-	for_each_gt(gt, xe, id)
+	for_each_gt(gt, xe, id) {
 		xe_guc_submit_pause(&amp;gt-&gt;uc.guc);
+		ret |= xe_guc_submit_reset_block(&amp;gt-&gt;uc.guc);
+	}
+
+	if (ret)
+		drm_info(&amp;xe-&gt;drm, &quot;migration recovery encountered ongoing reset\n&quot;);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">I'd suggest debug level, as it doesn't seem all that useful in general.
But I guess you want to have a trace that this happened and the handling
of this scenario is somewhat iffy...</pre>
    </blockquote>
    <p>Yes, reset and post-migration recovery interfere, leading to
      dangerous corner cases. If they meet, it's better if we know that
      from the log.</p>
    <p>Reset is a rare, exceptional procedure, so we don't expect this
      to be logged much.<br>
    </p>
    <blockquote type="cite" cite="mid:75aq2gastxnu4l5c3izbvniqzpwyfk45ux5oedfrwg3ir4kh3h@fw5zpvvek36d">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> }
 
 /**
@@ -170,8 +176,10 @@ static void vf_post_migration_kickstart(struct xe_device *xe)
 	/* make sure interrupts on the new HW are properly set */
 	xe_irq_resume(xe);
 
-	for_each_gt(gt, xe, id)
+	for_each_gt(gt, xe, id) {
+		xe_guc_submit_reset_unblock(&amp;gt-&gt;uc.guc);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">If we were doing migration recovery during reset, we'll change the state
of guc-&gt;submission_state.stopped (btw... is it possible to decrement it
below 0 now?).</pre>
    </blockquote>
    Yes, the decrement should be fixed. Not sure why
    xe_guc_submit_reset_block() doesn't do that by itself, maybe it was
    just a simplification due to it being used only during reset. But -
    the further analysis below makes it irrelevant.<br>
    <blockquote type="cite" cite="mid:75aq2gastxnu4l5c3izbvniqzpwyfk45ux5oedfrwg3ir4kh3h@fw5zpvvek36d">
      <pre wrap="" class="moz-quote-pre">There are &quot;some&quot; places where we have asserts that expect a particular
state, and some places where we use that state as an event (combined
with a waitqueue). Should we wake up the waiters at some point? And
perhaps synchronize with the places which depend on being in a &quot;stopped&quot;
state (if at all possible)?</pre>
    </blockquote>
    <p>After getting an understanding of all the wait places, it looks
      to me that my implementation is just wrong.</p>
    <p>We can not re-use the `xe_guc_submit_reset_block<span style="white-space: pre-wrap"><span style="white-space: normal">()`&nbsp; here, regardless if async or not, because this leads to all</span></span></p>
    <p><span style="white-space: pre-wrap"><span style="white-space: normal">waits for GuC responses being terminated, usually with an error. This is not acceptable as, in case of migration,</span></span></p>
    <p><span style="white-space: pre-wrap"><span style="white-space: normal">related responses from GuC will come as soon as the recovery is done.</span></span></p>
    <p><span style="white-space: pre-wrap"><span style="white-space: normal">Even if we won't wake up the waits within migration recovery, the check may still be triggered somewhere else,</span></span></p>
    <p><span style="white-space: pre-wrap"><span style="white-space: normal">or a new wait call may happen and bail out of wait immediately, leaving us with detached G2H response, or maybe</span></span></p>
    <p><span style="white-space: pre-wrap"><span style="white-space: normal">even freeing an object while HW still accesses it (ie. a preempted queue may be sent back to HW by GuC on</span></span></p>
    <p><span style="white-space: pre-wrap"><span style="white-space: normal">RESFIX_DONE before GuC reads all pending G2H commands, the context becomes active but on KMD side it</span></span></p>
    <p><span style="white-space: pre-wrap"><span style="white-space: normal">bailed out from waiting to be disabled and got freed).
</span></span></p>
    <p><span style="white-space: pre-wrap"><span style="white-space: normal">I will figure out a better way to block the reset, one which doesn't mess with existing waits.</span></span></p>
    <p><span style="white-space: pre-wrap"><span style="white-space: normal">-Tomasz
</span></span></p>
    <blockquote type="cite" cite="mid:75aq2gastxnu4l5c3izbvniqzpwyfk45ux5oedfrwg3ir4kh3h@fw5zpvvek36d">
      <pre wrap="" class="moz-quote-pre">Thanks,
-Michał

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 		xe_guc_submit_unpause(&amp;gt-&gt;uc.guc);
+	}
 }
 
 /**
-- 
2.25.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------XzyaaMzYWv9i2vTQT0ASp06C--
