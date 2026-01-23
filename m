Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C784ED6CFB0
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 02:41:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 604EB10E103;
	Fri, 23 Jan 2026 02:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D9WUAF4j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F1A910E103
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 02:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769136074; x=1800672074;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kFIL6VnFjIO2Fc7EZY8VnsYwG6splNU2obTzpToZTiQ=;
 b=D9WUAF4jZnVEk2kWKCWUzmqLVEY5HlyiHng0ir0+db1QfmjXZ/Z5GtQp
 TsdaEcf/uTcfxQuz3/Jz7LiD6Nz9vpkRH2rgsfvlBgFJhSS0i5dr6IBA0
 A4vLGCZGjm5WKbkSLaDhkvBxu6eFtnJ3njLUUeN9yh9H+WhDH03EKjegy
 0o1/LAJQGZ0QwpbON79LTdaO81HNsC0wesmwGc8K31onJ083wTcAN3dmp
 FZrGasI6RuieZJhgMg4SO5FDDFDuTBT+mMgrB5tDDUXraUqrs54Ffd4yB
 5+/alxrjlFmG38BjTbPCtOo1UCHjSgB6LL2/USyQJP8gOy2TaysjtNvJA A==;
X-CSE-ConnectionGUID: ibSRfxYnQqGnA0x9UuMqFg==
X-CSE-MsgGUID: FQE4nv4SS22eyHfofmPHiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70362555"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; d="scan'208";a="70362555"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 18:41:13 -0800
X-CSE-ConnectionGUID: fhDKHqg4SgST8x9tLU/zlA==
X-CSE-MsgGUID: F8mFsL9gRH2NT9og7SGwfA==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; d="scan'208";a="211039859"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 18:41:12 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 18:41:12 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 22 Jan 2026 18:41:12 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.67) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 18:41:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mzYCuFTfJ6KjrYrqBJ55nUk+aLaimTNde2S6FQvGO0eUSkZOmpp9arW9aj6wtV1hfSUAWbVTf69eBkyt/x27vk8ZdTZvHRrGMK93qKeaNgFOEOCNG7ttx69bWuJpNG41KitcgG09HgXT3DFbJ2eqOQuRNVdxExnY2DroQ9USZ4b7Il11HbF8So1lxOUMjN1oDaZd/+5jGj0kabgoENbNC6O1zAlR8Fr06SvCYVhQIjxfDMaN1hUK39id//f5ufRd56Ok3Qpt10vsObq02Iys7nMaAenzJ2HZqmDbE8O7Jrqn623N2Stp5PLipy7G9WoEWX0CaIvGlZZ0/u6g5r72Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFIL6VnFjIO2Fc7EZY8VnsYwG6splNU2obTzpToZTiQ=;
 b=r2VOhToMD1TAgTdgQQJaW42xfiqAeTLFX5Q2hgtK6eGqL+5OZCobK0GW8EyRuaPhNXbqS607HPV4Y1OgqDh37ypKV1wYfFr1GnRT3kb6W8bC+YomlAX8MNlX1MnXMykno+Zzjlaw82sqSHq28PLEAzufKxczYbdwmn+SesOLeZZL8I8Gwgt1aVVNiiiwG+dM/anYfcUcWiTNQHa+/V2xxSEgOrnzO6ap2dMvRC3QBUbhnXsyY5CH5XaXyjBMuEahr1TDGx6F03LnlFcIHliLXFYZSYtwPHnLKc18eUEJJIdeQ9fKXs7M0MmuxXtZSv9jTSzwxKJaMI8JWBmISCPzIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ5PPFC0624F2CA.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::850) by BL3PR11MB6529.namprd11.prod.outlook.com
 (2603:10b6:208:38c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.9; Fri, 23 Jan
 2026 02:41:09 +0000
Received: from SJ5PPFC0624F2CA.namprd11.prod.outlook.com
 ([fe80::88f4:becb:ece5:7e22]) by SJ5PPFC0624F2CA.namprd11.prod.outlook.com
 ([fe80::88f4:becb:ece5:7e22%6]) with mapi id 15.20.9542.008; Fri, 23 Jan 2026
 02:41:09 +0000
From: "Mishra, Pallavi" <pallavi.mishra@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH v2] drm/xe/tests: Fix g2g_test_array indexing
Thread-Topic: [PATCH v2] drm/xe/tests: Fix g2g_test_array indexing
Thread-Index: AQHchn6tCwaQg8eEFkKnYUVJBWg9A7VdXNOAgAE2YpCAAEXDAIAAPMWQ
Date: Fri, 23 Jan 2026 02:41:08 +0000
Message-ID: <SJ5PPFC0624F2CABC96211C6507CF372CD68294A@SJ5PPFC0624F2CA.namprd11.prod.outlook.com>
References: <20260116002529.951176-1-pallavi.mishra@intel.com>
 <84622a42-64c8-4712-bfe9-374e32cdd4b4@intel.com>
 <SJ5PPFC0624F2CA292F70351251505F39D18297A@SJ5PPFC0624F2CA.namprd11.prod.outlook.com>
 <4e39ee05-0767-441e-b193-c05fba770740@intel.com>
In-Reply-To: <4e39ee05-0767-441e-b193-c05fba770740@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ5PPFC0624F2CA:EE_|BL3PR11MB6529:EE_
x-ms-office365-filtering-correlation-id: 3af59c8d-e235-4f3a-444d-08de5a28dd38
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?QWo4c1AyNThpdXIyYjN2THRNWTN4aXNwVDRFdlBNeE1zWG1zTDI2amhLQmVH?=
 =?utf-8?B?VFM0b1VFWlVJUXZxK29hbVFJOUhYUHRoNHlZRkNlQW12L2hRTFV3aDVhVkc5?=
 =?utf-8?B?ZHZhTDMvZlpkeU1KMjJkU09BM3NXcWs2MG4wYklpTUlLbGJlSEtYNXZ5Qnox?=
 =?utf-8?B?cjBORUk1OUxlWForVTNSbkFudkJSREMxOUdtUThrSkR1ZDNSUy9pb1hkcnJG?=
 =?utf-8?B?WmN6Z1VzWDJVTmcrSjRiZWRhMnFueHJJNWJqU2RwMUI1Y3Mwc1RzODl3dUU0?=
 =?utf-8?B?VHIwVEJ5ZlR6WUZaYms1NjVYOHMyZzhqSXp4UHhTNytoK0hyaTJKTjR4NWhm?=
 =?utf-8?B?RFN3R2RweEpqNysrV09mN1ZieFVQUEhvOWE3ZTdTVzdBRkJFTUl2ZWFpVEJL?=
 =?utf-8?B?N3V4WCtjQisydDNydkxMM2ltaVE4NzFhdWNlOGpocloxUHFjbkxSRDIzSkRT?=
 =?utf-8?B?VUR4K01nOExYTklxTUtjNlBQK1h5RE80UVhrT3VyWmlScnJ2aTIrRG5QdDln?=
 =?utf-8?B?WnBQeVVLRWovS2VOMjVUeTl2NHc4c0dqQjRReW9pOEFBd1c1OGJxQzJiSXlM?=
 =?utf-8?B?eHY1WXJkeE50MjRKS1JGWFkxdE9xMGVMVkxLM1pxUDRvc0RIL0wrY2g1dkhO?=
 =?utf-8?B?a3pCcXozZVppdWVubjhleFpXRXh4cFpjRkRzaFZzNHYyTUNPMU51ekJFOTJV?=
 =?utf-8?B?Y1k1RHFQaXY4RDc0LzdoYTdHaStaZXRBcUhpYXlGWkpSV082Z0o2dDRrSUFG?=
 =?utf-8?B?WnZwUnBpWU5ldlU5eUM4VHJVK3pVV0lWNTZjdXgyZG90cmVxVXNNQXl3bW5R?=
 =?utf-8?B?TkZHalR3N0dkaVNTdWlta2c0U01vbzZOMnVTd2hHZUcwWTRtR2VWYTZiQnYw?=
 =?utf-8?B?NUIvRG9tSFlxU21Wa0NpZUNaRTdsTXFFZDFLbm5xVnNGaG9yK0lnZHZtQzVo?=
 =?utf-8?B?ZVpYYmt0V2Z3RGxtMzdQS282Y2VYNDEwSk1iU202eG1wWk0zUG9sYkkwanVX?=
 =?utf-8?B?dlNBSUxGd3dzV1JVUjZpejZweHR1OStacUd4ZWpuWTV3L2g4emhwbXRuaFNH?=
 =?utf-8?B?QTJTTWVqWmIzZ1JDM0NTemZVUUNBUFlTNThGQVBJeGM4MGpCaGJOc3VVRWEy?=
 =?utf-8?B?NXdDakFLclJBWTR5c2tzc2QxSXRvWnQyU2I1L3NNMThxdzFrbitscW9JVnly?=
 =?utf-8?B?cnNBU1pWcFdSWXBsdXdaTUdHc0NzaVBxbVBjdkl3Z3IzdjBiR2t3VG5OcVZK?=
 =?utf-8?B?WnVTZE1Fc2N2cEwrVmVyelFhQytnaG5FN2QzT3UrM0ZNVmxGa1BURE5vOFhJ?=
 =?utf-8?B?RmVkenJiVi9pdnFTTDIwbmhOSlJJenU1Ny9JN2dBUjdCUy90WDk0eCttV0w5?=
 =?utf-8?B?c0pDOXpTSTBZNlFmNVY3WUJUY09uT0V2c1R6Qk0wL0pDc0QzZnBDbFQyU2cr?=
 =?utf-8?B?ZDJtc0cxQUViQ0dxREpqUE54VVgrNTZTbWVzRFJUUTNNUWhyZmprRTJQWnkw?=
 =?utf-8?B?OTg0eXhkMXZFU3BidEoySUdaUnFkaHpvMVV6OGFxVWJEWnhrRDFDbkZEUnRB?=
 =?utf-8?B?Z1FmN1QzdlhQTEpWUmxDQjY2ZmppdlBHbFhSRnYxTk1mLzlVTHRpdlFZTVJy?=
 =?utf-8?B?MmVwWWU2elZGekh6eGphU2JuKzZ3Z1RxbnY4eFlUK1NpSkJ5cUQ5WGlUSzZj?=
 =?utf-8?B?NmIvZHNlWkltdkVITHFiL0FwVHphNFFsU2x0VWEzb1JTTUlmL09JSERzblpY?=
 =?utf-8?B?eTE0dXJhZTM2V05ZRE5aSlI3TmQya3BmOGRQanA0NGpDNEdMa3piWXIwL2Y3?=
 =?utf-8?B?eEkwYjRxTlZxKzlha0JMWjd3SS9ENk5XY0hUdVVaQVUvOW1Hd2EyWnRPSG50?=
 =?utf-8?B?bUlsamFpbjBlM2Y2c1hIalRWOVJHaC9KS0tDOE14YnNGNXFmSVZpNmRxbEVk?=
 =?utf-8?B?dUpKek1BV0t2WjRqdFBTSld5L2ZxZXBYL3VrME5GeFhSZ280cVlTbCthdW1Z?=
 =?utf-8?B?dGVGOVBXSnlIV3M0ZFJnVnZZcDlUZ0JmNC93RG9jdmVlNkh0bVVna2piemhj?=
 =?utf-8?B?bXhOay9pTHN3YUxPVXJjTFB1VEVkQlJPdnN3TTR6Nk9iSklpb2w2ejl5VHJC?=
 =?utf-8?B?MCtmZW8wbURHNy9qTzF4VUJJUklaMDBkMDlQV29rQTV3U3JvYm9yS1E5UytY?=
 =?utf-8?Q?ig2sEh2K4HzZbRMkZ31SPIY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPFC0624F2CA.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cWN4UTFGd0NmeHBDeUx6RFZhTWJPeDFKbFpXTWFzcm1qTGJNSmlwc3ZDQ0VS?=
 =?utf-8?B?VlphekZpMldibjl0MnFObzZiRWhhbHJoblFqZ1g3SFF4R0JIOGIweDQwdVJh?=
 =?utf-8?B?Z29SMzNqSCtqOWpaTk5zTGtTVnhLTDUxMG0rdFFKRnJZT1RVK1RXNGIzSUYw?=
 =?utf-8?B?RUpLbGNLS05JaTUxVXRQeDM5VVBzWUtNSkxuY0FCdTRuazE1bDRYeWxRMXIz?=
 =?utf-8?B?UktJNUhLUEhXQXFORTZKUWpVVHhaT1MrcDlvbkhqSnpCcHVPMTlQZEU0Z0lG?=
 =?utf-8?B?RFN3WHBMRDVzalllcWhWUkhXUmoza0xXOUU4MnNCZ1lWdG51dFMrdXVIc2Ft?=
 =?utf-8?B?U0NTNlp5ZGdFNlhJUWVOdnFpNVZpUy9ralBTYTA3TWJrTGhzdlBqaFd2N01U?=
 =?utf-8?B?ZUVEQ0Y0VlNQaUhBeDBCeFBvWEhQS0hVLzAxRzBlYW8yYXQ3ZjlQQzRnTlA1?=
 =?utf-8?B?WHpFbXVwdUI0b290VGF5aG56WXRmWVFzNHREdHNZa1FKb1RSNEZVa1JhVldC?=
 =?utf-8?B?N2g4RC9TRkxwMWxHTTNRcitXY29aZ28yZk1VYUkwOTd4SjdwU3Z1NmlwREQw?=
 =?utf-8?B?S21Sb2cxT2pZR3dQdEcwTDJuWldZZVlVMytFNjk5dFJFUTJUdnU0Kzhka0dy?=
 =?utf-8?B?VHZESFJBYnpNM0w3MWpyMXpCSDArVStTcENUNm5Da0lZMnoyTEg0a2hPcy9Q?=
 =?utf-8?B?T0RhME80RE8wOWF2bStrNDAzTmVGZlZxcWYwOUpEYXplblVmVlhXQ2plUnZS?=
 =?utf-8?B?R3QzME5qZk5weU0waThxeC8xKzRBQ0NuTlUweWRVWW5wZ2wwdXp3SVJEd204?=
 =?utf-8?B?anVUZjlsaFQ1Y2o5MGlIczdmamFpaDJQeUdtS3ZwTEF6c0ZNUldlaGliYWRM?=
 =?utf-8?B?ZWt5MFZ2TEZxZW92ejJ3S0FNZW9LclNGeTJPaGZaSjRrdGN5RmNjaUFXODZS?=
 =?utf-8?B?b1M3dnBBUlcwUjRhUGg5UXdkUDAvSitqRkl3cHRyclk5cVdZaUI5V0pmTnFn?=
 =?utf-8?B?ODRlUTY3cTdieWpQNlo4dStFb1k2K2ZTZFg3QW9DdUlCMXQ0TE9HU1lwa3Zi?=
 =?utf-8?B?RUZzL0dPY29kL1hLdHBFYzlCUVpqQk9ET1Rlem1ySjJSdGQzbkRVbFR1N24v?=
 =?utf-8?B?V2phOTluZHozSWJYcUJaY3lobVlPc1pQOXpkZGJJaXpXVmRid1V6dEFRc3ZM?=
 =?utf-8?B?NUU4RU1mcEZnNklPM2llcWxnL3JBMHBtWVZKUTA2UWc5d1R4dEV2TFIxaEhT?=
 =?utf-8?B?L3E1ZTZOUWZnSmQxODhzNjAwRnp1ZjliZW5RQi9lVlBUVmtNUE9KYmhGVlRU?=
 =?utf-8?B?K05Hdk1EWWpYTnFQZDdNOU8xN2dMeTJ1T0tvZGV5YnppdFl1anJUOGFNTWgx?=
 =?utf-8?B?b1kzRmRvTm9lQ21qVU1YbmpyVTZQbllXMWNlK2pOaGQ4VUNObFNIVnhHTlMz?=
 =?utf-8?B?QkRBKzN0Ynh2OG5RclBkalBpNzl3ZzR4R2dGUlhHbFVzVnI1OWVnWHZwR3VK?=
 =?utf-8?B?dTdBemdaZ1lrL09aZ2JKY0M3emZjSzNyODZYcGJOcDUzU1U5K3JnTkduNVFs?=
 =?utf-8?B?cEhCQ1lXamxRWU9HR0hFSHhoWmJVNnBRNzl3a05WSWtFcUNNazlvZ3RMblI3?=
 =?utf-8?B?ZDgwY2FjOUYrL0RQL3hWTWlDNzRaWDVmVG8wNTVvVzlyd05JWGlLQ2lVeFFr?=
 =?utf-8?B?L2lveWhnM0tmYlBpVGhQYUVlL2ptMEZaamtWQ0cvREdxYk1zUzB2ZU1jN2xt?=
 =?utf-8?B?SFF1Qzc5K1BmUUloTjg1SGgvcW9meUNBV1JUV3ZBYzVDNnYvSi9aMFptR1dH?=
 =?utf-8?B?Z1BYbkpkUzNSYUI3TDYxN0RGOGRRV0RYdmhwRFlYYkMyb3hRdnYrNkt4d0dS?=
 =?utf-8?B?ZFl6QmlkY0Q3ekEwU0F1dkpWY2IzUGUrZ1Rrc2tPTTJBNmhXeWh5UU1GYzIv?=
 =?utf-8?B?by8xZnRsdmhFakc4Vzd0bjh6SnlkeklXTGJuMlZablREV1UyMXZPaWhHcEp1?=
 =?utf-8?B?cUlTdXVKRFVwenJJR0g3T2VyVmc2ZUVKV0EwOUZ2c3JKTWVCcHhCMzhiSkxz?=
 =?utf-8?B?Nmc2Uk5xc0M1akpVMTg2ZlFvRXp4ME5RcUt3b3NZaU14VlV1NFlsSGhKYUtR?=
 =?utf-8?B?L1ExT3dSYlcwaVgrVldqd2VPbU9SUHB5Y1oveVVuMjhkS3kzU0duZmZlMXAw?=
 =?utf-8?B?OGRBelFSU0VHMEUrZ0JySnM0SGs1Y1d4SjZ1SFBMQllTQk84MWhDWi8wOE5X?=
 =?utf-8?B?YzhFbHZFenR6dlZpanlteTA0THNtS2lKQ1BVWHJiWmtyd2tQT0EwYkx6VWtN?=
 =?utf-8?B?TkRNSzZYcFpWZEg0R2YvWDNSZnpGdUkzakhpbDVtcmtRcmhEN0w5dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPFC0624F2CA.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3af59c8d-e235-4f3a-444d-08de5a28dd38
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2026 02:41:08.9438 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GzEWpajMKRtumt742Zjr+oEXL4hEN+rDDE0O1jiaDCcKZtPwH1RDREHUQG07vp41uf06ucVbpUySJFt9grcoTjCzu0SRfwbfJ6towUkTH6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6529
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2VyYW9sbyBTcHVyaW8s
IERhbmllbGUgPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+DQo+IFNlbnQ6IFRodXJz
ZGF5LCBKYW51YXJ5IDIyLCAyMDI2IDM6MDEgUE0NCj4gVG86IE1pc2hyYSwgUGFsbGF2aSA8cGFs
bGF2aS5taXNocmFAaW50ZWwuY29tPjsgaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+
IENjOiBWaXNod2FuYXRoYXB1cmEsIE5pcmFuamFuYSA8bmlyYW5qYW5hLnZpc2h3YW5hdGhhcHVy
YUBpbnRlbC5jb20+Ow0KPiBTdW1tZXJzLCBTdHVhcnQgPHN0dWFydC5zdW1tZXJzQGludGVsLmNv
bT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0gZHJtL3hlL3Rlc3RzOiBGaXggZzJnX3Rlc3Rf
YXJyYXkgaW5kZXhpbmcNCj4gDQo+IA0KPiANCj4gT24gMS8yMi8yMDI2IDExOjMzIEFNLCBNaXNo
cmEsIFBhbGxhdmkgd3JvdGU6DQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gPj4gRnJvbTogQ2VyYW9sbyBTcHVyaW8sIERhbmllbGUgPGRhbmllbGUuY2VyYW9sb3NwdXJp
b0BpbnRlbC5jb20+DQo+ID4+IFNlbnQ6IFdlZG5lc2RheSwgSmFudWFyeSAyMSwgMjAyNiA0OjIw
IFBNDQo+ID4+IFRvOiBNaXNocmEsIFBhbGxhdmkgPHBhbGxhdmkubWlzaHJhQGludGVsLmNvbT47
DQo+ID4+IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+PiBDYzogVmlzaHdhbmF0
aGFwdXJhLCBOaXJhbmphbmEgPG5pcmFuamFuYS52aXNod2FuYXRoYXB1cmFAaW50ZWwuY29tPjsN
Cj4gPj4gU3VtbWVycywgU3R1YXJ0IDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+DQo+ID4+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIGRybS94ZS90ZXN0czogRml4IGcyZ190ZXN0X2FycmF5IGlu
ZGV4aW5nDQo+ID4+DQo+ID4+DQo+ID4+DQo+ID4+IE9uIDEvMTUvMjAyNiA0OjI1IFBNLCBQYWxs
YXZpIE1pc2hyYSB3cm90ZToNCj4gPj4+IFRoZSBHMkcgS1VuaXQgdGVzdCBhbGxvY2F0ZXMgYSBj
b21wYWN0IE7Dl04gbWF0cml4IHNpemVkIGJ5IGd0X2NvdW50DQo+ID4+PiBhbmQgdmVyaWZpZXMg
ZW50cmllcyB1c2luZyBkZW5zZSBpbmRpY2VzOiBpZHggPSAoaiAqIGd0X2NvdW50KSArIGkNCj4g
Pj4+DQo+ID4+PiBUaGUgcHJvZHVjZXIgcGF0aCBjdXJyZW50bHkgY29tcHV0ZXMgaWR4IHVzaW5n
DQo+ID4+PiBndC0+aW5mby5pZC4gSG93ZXZlciwgZ3QtPmluZm8uaWQgdmFsdWVzDQo+ID4+PiBh
cmUgbm90IGd1YXJhbnRlZWQgdG8gYmUgY29udGlndW91cy4NCj4gPj4+IEZvciBleGFtcGxlLCB3
aXRoIGd0X2NvdW50PTIgYW5kIElEcyB7MCwzfSwgdGhpcyBmb3JtdWxhIHByb2R1Y2VzDQo+ID4+
PiBpbmRpY2VzIGJleW9uZCB0aGUgYWxsb2NhdGVkIHJhbmdlLCBjYXVzaW5nIG1pc21hdGNoZXMg
YW5kIHBvdGVudGlhbA0KPiA+Pj4gb3V0LW9mLWJvdW5kcyBhY2Nlc3MuDQo+ID4+Pg0KPiA+Pj4g
VXBkYXRlIHRoZSBwcm9kdWNlciB0byBtYXAgZWFjaCBHVCB0byBhIGRlbnNlIGluZGV4IGluDQo+
ID4+PiBbMC4uZ3RfY291bnQtMV0gYW5kIGNvbXB1dGU6DQo+ID4+PiAgICAgICBpZHggPSAodHhf
ZGVuc2UgKiBndF9jb3VudCkgKyByeF9kZW5zZQ0KPiA+Pj4NCj4gPj4+IEFkZGl0aW9uYWxseSwg
aW50cm9kdWNlIGFuIGV2ZW50LWJhc2VkIGRlbGF5IGluIGcyZ190ZXN0X2luX29yZGVyKCkNCj4g
Pj4+IHRvIGVuc3VyZSBvcmRlcmluZyBiZXR3ZWVuIHNlbmRzLg0KPiA+Pj4NCj4gPj4+IHYyOiBB
ZGQgc2luZ2xlIGhlbHBlciBmdW5jdGlvbiAoRGFuaWVsZSkNCj4gPj4+DQo+ID4+PiBTaWduZWQt
b2ZmLWJ5OiBQYWxsYXZpIE1pc2hyYSA8cGFsbGF2aS5taXNocmFAaW50ZWwuY29tPg0KPiA+Pj4g
LS0tDQo+ID4+PiAgICBkcml2ZXJzL2dwdS9kcm0veGUvdGVzdHMveGVfZ3VjX2cyZ190ZXN0LmMg
fCA1Ng0KPiA+PiArKysrKysrKysrKysrKysrKysrKystDQo+ID4+PiAgICAxIGZpbGUgY2hhbmdl
ZCwgNTQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPj4+DQo+ID4+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3Rlc3RzL3hlX2d1Y19nMmdfdGVzdC5jDQo+ID4+PiBi
L2RyaXZlcnMvZ3B1L2RybS94ZS90ZXN0cy94ZV9ndWNfZzJnX3Rlc3QuYw0KPiA+Pj4gaW5kZXgg
M2IyMTNmY2FlOTE2Li5lYzE4MDg2Yjk4ZDggMTAwNjQ0DQo+ID4+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGUvdGVzdHMveGVfZ3VjX2cyZ190ZXN0LmMNCj4gPj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS90ZXN0cy94ZV9ndWNfZzJnX3Rlc3QuYw0KPiA+Pj4gQEAgLTQ4LDYgKzQ4LDM4IEBA
IHN0cnVjdCBnMmdfdGVzdF9wYXlsb2FkICB7DQo+ID4+PiAgICAJdTMyIHNlcW5vOw0KPiA+Pj4g
ICAgfTsNCj4gPj4+DQo+ID4+PiArc3RhdGljIGludCBzbG90X2luZGV4X2Zyb21fZ3RzKHN0cnVj
dCB4ZV9ndCAqdHhfZ3QsIHN0cnVjdCB4ZV9ndA0KPiA+Pj4gKypyeF9ndCkgew0KPiA+Pj4gKwlz
dHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IGd0X3RvX3hlKHR4X2d0KTsNCj4gPj4+ICsJaW50IGlkeCA9
IDAsIGZvdW5kID0gMCwgaWQsIHR4X2lkeCwgcnhfaWR4Ow0KPiA+Pj4gKwlzdHJ1Y3QgeGVfZ3Qg
Kmd0Ow0KPiA+Pj4gKwlzdHJ1Y3Qga3VuaXQgKnRlc3QgPSBrdW5pdF9nZXRfY3VycmVudF90ZXN0
KCk7DQo+ID4+PiArDQo+ID4+PiArCWZvciAoaWQgPSAwOyBpZCA8IHhlLT5pbmZvLnRpbGVfY291
bnQgKiB4ZS0+aW5mby5tYXhfZ3RfcGVyX3RpbGU7IGlkKyspIHsNCj4gPj4+ICsJCWd0ID0geGVf
ZGV2aWNlX2dldF9ndCh4ZSwgaWQpOw0KPiA+Pj4gKwkJaWYgKCFndCkNCj4gPj4+ICsJCQljb250
aW51ZTsNCj4gPj4+ICsJCWlmIChndCA9PSB0eF9ndCkgew0KPiA+Pj4gKwkJCXR4X2lkeCA9IGlk
eDsNCj4gPj4+ICsJCQlmb3VuZCsrOw0KPiA+Pj4gKwkJfQ0KPiA+Pj4gKwkJaWYgKGd0ID09IHJ4
X2d0KSB7DQo+ID4+PiArCQkJcnhfaWR4ID0gaWR4Ow0KPiA+Pj4gKwkJCWZvdW5kKys7DQo+ID4+
PiArCQl9DQo+ID4+PiArDQo+ID4+PiArCQlpZiAoZm91bmQgPT0gMikNCj4gPj4+ICsJCQlicmVh
azsNCj4gPj4+ICsNCj4gPj4+ICsJCWlkeCsrOw0KPiA+Pj4gKwl9DQo+ID4+PiArDQo+ID4+PiAr
CWlmIChmb3VuZCAhPSAyKQ0KPiA+Pj4gKwkJS1VOSVRfRkFJTCh0ZXN0LCAiR1QgaW5kZXggbm90
IGZvdW5kIik7DQo+ID4+PiArDQo+ID4+PiArCXJldHVybiAodHhfaWR4ICogeGUtPmluZm8uZ3Rf
Y291bnQpICsgcnhfaWR4OyB9DQo+ID4+PiArDQo+ID4+PiAgICBzdGF0aWMgdm9pZCBnMmdfdGVz
dF9zZW5kKHN0cnVjdCBrdW5pdCAqdGVzdCwgc3RydWN0IHhlX2d1YyAqZ3VjLA0KPiA+Pj4gICAg
CQkJICB1MzIgZmFyX3RpbGUsIHUzMiBmYXJfZGV2LA0KPiA+Pj4gICAgCQkJICBzdHJ1Y3QgZzJn
X3Rlc3RfcGF5bG9hZCAqcGF5bG9hZCkgQEAgLTE2Myw3DQo+ID4+ICsxOTUsNyBAQCBpbnQNCj4g
Pj4+IHhlX2d1Y19nMmdfdGVzdF9ub3RpZmljYXRpb24oc3RydWN0IHhlX2d1YyAqZ3VjLCB1MzIg
Km1zZywgdTMyIGxlbikNCj4gPj4+ICAgIAkJZ290byBkb25lOw0KPiA+Pj4gICAgCX0NCj4gPj4+
DQo+ID4+PiAtCWlkeCA9ICh0eF9ndC0+aW5mby5pZCAqIHhlLT5pbmZvLmd0X2NvdW50KSArIHJ4
X2d0LT5pbmZvLmlkOw0KPiA+Pj4gKwlpZHggPSBzbG90X2luZGV4X2Zyb21fZ3RzKHR4X2d0LCBy
eF9ndCk7DQo+ID4+Pg0KPiA+Pj4gICAgCWlmICh4ZS0+ZzJnX3Rlc3RfYXJyYXlbaWR4XSAhPSBw
YXlsb2FkLT5zZXFubyAtIDEpIHsNCj4gPj4+ICAgIAkJeGVfZ3RfZXJyKHJ4X2d0LCAiRzJHOiBT
ZXFubyBtaXNtYXRjaCAlZCB2cyAlZCBmb3IgJWQ6JWQgLQ0KPiA+Pj4NCj4gPj4+ICVkOiVkIVxu
IiwgQEAgLTE4MCwxMyArMjEyLDE3IEBAIGludA0KPiA+PiB4ZV9ndWNfZzJnX3Rlc3Rfbm90aWZp
Y2F0aW9uKHN0cnVjdCB4ZV9ndWMgKmd1YywgdTMyICptc2csIHUzMiBsZW4pDQo+ID4+PiAgICAJ
cmV0dXJuIHJldDsNCj4gPj4+ICAgIH0NCj4gPj4+DQo+ID4+PiArI2RlZmluZSBHMkdfV0FJVF9U
SU1FT1VUX01TIDEwMA0KPiA+Pj4gKyNkZWZpbmUgRzJHX1dBSVRfUE9MTF9NUyAxDQo+ID4+PiAr
DQo+ID4+PiAgICAvKg0KPiA+Pj4gICAgICogU2VuZCB0aGUgZ2l2ZW4gc2Vxbm8gZnJvbSBhbGwg
R3VDcyB0byBhbGwgb3RoZXIgR3VDcyBpbiB0aWxlL0dUIG9yZGVyDQo+ID4+PiAgICAgKi8NCj4g
Pj4+ICAgIHN0YXRpYyB2b2lkIGcyZ190ZXN0X2luX29yZGVyKHN0cnVjdCBrdW5pdCAqdGVzdCwg
c3RydWN0DQo+ID4+PiB4ZV9kZXZpY2UgKnhlLCB1MzINCj4gPj4gc2Vxbm8pDQo+ID4+PiAgICB7
DQo+ID4+PiAgICAJc3RydWN0IHhlX2d0ICpuZWFyX2d0LCAqZmFyX2d0Ow0KPiA+Pj4gLQlpbnQg
aSwgajsNCj4gPj4+ICsJaW50IGksIGosIHdhaXRlZDsNCj4gPj4+ICsJdTMyIGlkeDsNCj4gPj4+
DQo+ID4+PiAgICAJZm9yX2VhY2hfZ3QobmVhcl9ndCwgeGUsIGkpIHsNCj4gPj4+ICAgIAkJdTMy
IG5lYXJfdGlsZSA9IGd0X3RvX3RpbGUobmVhcl9ndCktPmlkOyBAQCAtMjA1LDYgKzI0MSwyMg0K
PiA+PiBAQA0KPiA+Pj4gc3RhdGljIHZvaWQgZzJnX3Rlc3RfaW5fb3JkZXIoc3RydWN0IGt1bml0
ICp0ZXN0LCBzdHJ1Y3QgeGVfZGV2aWNlDQo+ID4+PiAqeGUsIHUzMg0KPiA+PiBzZXFuDQo+ID4+
PiAgICAJCQlwYXlsb2FkLnJ4X2RldiA9IGZhcl9kZXY7DQo+ID4+PiAgICAJCQlwYXlsb2FkLnJ4
X3RpbGUgPSBmYXJfdGlsZTsNCj4gPj4+ICAgIAkJCXBheWxvYWQuc2Vxbm8gPSBzZXFubzsNCj4g
Pj4+ICsNCj4gPj4+ICsJCQkvKiBDYWxjdWxhdGUgaWR4IGZvciBldmVudC1iYXNlZCB3YWl0ICov
DQo+ID4+PiArCQkJaWR4ID0gc2xvdF9pbmRleF9mcm9tX2d0cyhuZWFyX2d0LCBmYXJfZ3QpOw0K
PiA+Pj4gKwkJCXdhaXRlZCA9IDA7DQo+ID4+PiArDQo+ID4+PiArCQkJLyogV2FpdCBmb3IgcHJl
dmlvdXMgc2Vxbm8gdG8gYmUgYWNrbm93bGVkZ2VkDQo+ID4+IGJlZm9yZSBzZW5kaW5nICovDQo+
ID4+PiArCQkJd2hpbGUgKHhlLT5nMmdfdGVzdF9hcnJheVtpZHhdICE9IChzZXFubyAtIDEpKSB7
DQo+ID4+PiArCQkJCW1zbGVlcChHMkdfV0FJVF9QT0xMX01TKTsNCj4gPj4+ICsJCQkJd2FpdGVk
ICs9IEcyR19XQUlUX1BPTExfTVM7DQo+ID4+PiArCQkJCWlmICh3YWl0ZWQgPj0gRzJHX1dBSVRf
VElNRU9VVF9NUykgew0KPiA+Pj4gKwkJCQkJa3VuaXRfaW5mbyh0ZXN0LCAiVGltZW91dCB3YWl0
aW5nISB0eA0KPiA+PiBndDogJWQsIHJ4IGd0OiAlZFxuIiwNCj4gPj4+ICsJCQkJCQkgICBuZWFy
X2d0LT5pbmZvLmlkLCBmYXJfZ3QtDQo+ID4+PiBpbmZvLmlkKTsNCj4gPj4gU29ycnkgSSBtaXNz
ZWQgdGhpcyBvbiB0aGUgcHJldmlvdXMgcmV2LCBidXQgc2hvdWxkbid0IHRoaXMgYmUgYQ0KPiA+
PiBmYWlsdXJlPyBJZiB3ZSBkb24ndCBnZXQgb25lIG9mIHRoZSBwcmV2aW91cyBtZXNzYWdlcyB0
aGVuIHNvbWV0aGluZyBoYXMNCj4gZ29uZSB3cm9uZy4NCj4gPj4gVGhlIHBhdGNoIGxvb2tzIGdv
b2QgdG8gbWUgYXBhcnQgZnJvbSB0aGlzLg0KPiA+Pg0KPiA+PiBEYW5pZWxlDQo+ID4gSSB0aGlu
ayBtYXJraW5nIGEgZmFpbHVyZSBhdCB0aGlzIHBvaW50IG1heSBiZSB0b28gZWFybHkuIFNlcW5v
IGNoZWNrDQo+ID4gdmFsaWRhdGlvbiBoYXBwZW5zIGxhdGVyIG9uIGluIGcyZ19ydW5fdGVzdCgp
IGFuZCBhbHNvIGluDQo+ID4geGVfZ3VjX2cyZ190ZXN0X25vdGlmaWNhdGlvbigpLiBJZiBhbnkg
bm90aWZpY2F0aW9uIGlzIG1pc3NlZCBvciBvdXQgb2Ygb3JkZXIsDQo+IHRoZSB0ZXN0IHdpbGwg
ZmFpbCBhdCB0aGF0IHN0YWdlLg0KPiANCj4gVGhlbiB3aHkgd2FpdCBmb3IgaXQgYXQgYWxsPyBl
aXRoZXIgd2FpdGluZyBmb3IgaXQgaXMgc2lnbmlmaWNhbnQgKGFuZCB0aGVyZWZvcmUgd2UNCj4g
ZmFpbCB0aGUgdGVzdCBpZiB0aGUgd2FpdCB0aW1lcyBvdXQpIG9yIGl0IGRvZXNuJ3QgbWF0dGVy
IGJlY2F1c2Ugd2UgaGF2ZSBvdGhlcg0KPiBjaGVja3MgbGF0ZXIgKGluIHdoaWNoIGNhc2Ugd2Ug
Y2FuIGp1c3QgYXZvaWQgd2FpdGluZykuDQo+IA0KPiBEYW5pZWxlDQoNClRvIHByb3ZpZGUgc29t
ZSBiYWNrZ3JvdW5kIGhlcmUsIHRoZSB3aGlsZSBsb29wIGFuZCB3YWl0IGFyZSBwcmltYXJpbHkg
YWRkZWQgdG8gcGFjZSB0aGUgdGVzdCBhbmQgYXZvaWQgc2VuZGluZyBiYWNrLXRvLWJhY2sgbWVz
c2FnZXMsIHdoaWNoIHByZXZpb3VzbHkgY2F1c2VkIHRoZSB0ZXN0IHRvIGFsd2F5cyB0aW1lIG91
dCB3YWl0aW5nIGZvciBub3RpZmljYXRpb25zLiBJbnRyb2R1Y2luZyBhIGRlbGF5L3NsZWVwIGJl
Zm9yZSB0aGUgZzJnX3Rlc3Rfc2VuZCgpIHJlc29sdmVkIHRoaXMuIER1cmluZyBpbnRlcm5hbCBy
ZXZpZXcgaXQgd2FzIHN1Z2dlc3RlZCB0aGF0IGEgZml4ZWQgZGVsYXkgaGVyZSBtYXkgbm90IHdv
cmsgYWNyb3NzIHBsYXRmb3Jtcywgc28gSSBtb2RpZmllZCB0aGUgc2FtZSB0byBhbiBldmVudCBi
YXNlZCBkZWxheS4gU28gdGhlIHdhaXQgaGVyZSBpc24ndCBtZWFudCB0byB2YWxpZGF0ZSBjb3Jy
ZWN0bmVzcyBhdCB0aGlzIHN0YWdlLCBidXQgc2ltcGx5IHBhY2UgdGhlIHRlc3QuIFRoZSB0aW1l
b3V0IG1lc3NhZ2UgaGVyZSBtaWdodCBiZSBjb25mdXNpbmcsIHNvIEkgY2FuIHJlbW92ZSBpdCBp
ZiBwcmVmZXJyZWQuIFBsZWFzZSBsZXQgbWUga25vdyB5b3VyIHRob3VnaHRzLg0KDQo+IA0KPiA+
DQo+ID4gUGFsbGF2aQ0KPiA+Pj4gKwkJCQkJYnJlYWs7DQo+ID4+PiArCQkJCX0NCj4gPj4+ICsJ
CQl9DQo+ID4+PiArDQo+ID4+PiAgICAJCQlnMmdfdGVzdF9zZW5kKHRlc3QsICZuZWFyX2d0LT51
Yy5ndWMsIGZhcl90aWxlLA0KPiA+PiBmYXJfZGV2LCAmcGF5bG9hZCk7DQo+ID4+PiAgICAJCX0N
Cj4gPj4+ICAgIAl9DQoNCg==
