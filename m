Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA48BE83054
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 05:41:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D6110E53D;
	Tue,  3 Feb 2026 05:41:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YtQ0QUQo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106B610E53D
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 05:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770097262; x=1801633262;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HeYwjTKKd4z46OJzCBhmArH8CAoK8/kojyt9RDq31W0=;
 b=YtQ0QUQojFt+lce82XyxXf3iliOAipvfVGTnk9Xb8gmhH1L0QbJ24cGd
 AjbhDyiptUvd822NXT7O+IPscZqEjyvIMA29XEPXwSlxtQAJM4g82mZrP
 1bhdQrP/UyMf0pY0dYqcpGsBAjcFXcYccFZCBY83f8fOTKQ3NLVn6erIz
 d3G7en9T7tQMIGWy2zDpN1pyhaIp7JVOlsRFpBLe9Q7aGLGYMNH0tejlM
 2m7ECU/BPiKxmkqoxKaLermqnXxmeFkTpsTUz5H4iznA1n1/67haWqvv0
 bmyOgJeiGYjEtTYRMqUIkM6wtxWYgjh8pDPh91OB3y4O3SzGsMwJDqhdS A==;
X-CSE-ConnectionGUID: Pe5z78Z0TnmA8SpETx3Hww==
X-CSE-MsgGUID: OTHLHRGnRlSG5ZDV8ebYJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71423353"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="71423353"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 21:40:58 -0800
X-CSE-ConnectionGUID: L+kph3uWTZ+biUe0P2WgLA==
X-CSE-MsgGUID: 7FKR14L3RJ2+GEa6+RzaBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="209496507"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 21:40:57 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 21:40:56 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 21:40:56 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 21:40:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IisBGpM7AsH5lPnrttOqALkxGnfBnYq7driz1LyQ8IxvqZ/OBnO9u7yfgJPPogU1FwUbIlpRJfzWihg+3qDhcNH7PyQfXfIxoaISur3bmOV+V0/dI1vCILMVhzWgzr75Z+QgSi0i/E/yVqcM8GQE00lRMp2fqkSpPZkOLETl0xfBgFWxUqcUpe7hCExoeZ1xN4nxfpSPG06Y5Avovy16itD/dB5smKqhbZtzGHp/TKFIjiSmz069o1r8Ln7N0i1KrQHRgqeT3Jyh3sKgmQduUiQWyVeo8roARLpCXiH6/jAnesNv1mK5mRgJAVJJEsqRYRTSk/FWmcBKO9oP8HIeUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HeYwjTKKd4z46OJzCBhmArH8CAoK8/kojyt9RDq31W0=;
 b=g4WbuKPxBLgf+5909qyIXGawKzuoOhh7TACOABM7MngduI1Tbd5zh4AnqysRTyJnv4t6ylYDw7foP5CrHEWU/s7H8BaPdTHG9KJPGs/5G0JpcNtjZI6LrQGtAvhrq4IrRdLDbzVwDwAKz+1B1QSnL7Xp+Us1uS/ACB/H26QqpDt78AvvCFuo8I03BchhF5m8gPynH3Msr0rZ4zD6GpcCECJMIB2T854e64aC9mysc7VodYaFX9x0aRGVS5a2CbQ1lrRkbqpiMWkaC8V1ItEgPQwBPUTtk15wv5W2P2TmQI1FSfJotnEhxhRiJTA9aWEp78lPfSiOg0vLGbmwg3E+eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by SN7PR11MB7708.namprd11.prod.outlook.com (2603:10b6:806:352::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 3 Feb
 2026 05:40:54 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::22af:c9c9:3681:5201]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::22af:c9c9:3681:5201%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 05:40:54 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>, "Purkait, Soham"
 <soham.purkait@intel.com>
Subject: RE: [PATCH v2] drm/xe/cri: Add check to verify if CSC is a PCIe
 endpoint
Thread-Topic: [PATCH v2] drm/xe/cri: Add check to verify if CSC is a PCIe
 endpoint
Thread-Index: AQHclGQ6Ue80g1p9VkixTYoJj8CeYrVwdf5A
Date: Tue, 3 Feb 2026 05:40:54 +0000
Message-ID: <CY5PR11MB6366CBA8C28E25E4C6D9A86DED9BA@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20260202165351.2020699-2-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20260202165351.2020699-2-balasubramani.vivekanandan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|SN7PR11MB7708:EE_
x-ms-office365-filtering-correlation-id: 992da3e6-f587-46e9-bf3f-08de62e6cc35
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?d2NqSllSMXQ0bGlZUjFaS1I4RkpSQkpkZmc4ZUpwNUV5VkVWY3FDV0kvUERB?=
 =?utf-8?B?dXk1YXVwV2RvZVRkd3U5Q0J5cXFLbERGdjVEZzhBQlZHS3VJb3VIMXBHZC9Q?=
 =?utf-8?B?MXBZSEVQSk1tS0oxQlE3bmVTQlVlMHpYUjFtbzlxV0M1Y3FOalIyRmhaYUZT?=
 =?utf-8?B?cHlHeEt2MDI4NGJWU01tdTJPU3FQbFhRSG9hYU12UEJyTzdneHE1THV0TzA1?=
 =?utf-8?B?UExoK0IvckxISis4UStxc1JBVVg2YUlPQUdZL0ZvZHNVdWZ2b21ySkdxVm5r?=
 =?utf-8?B?OGFTUS94N3lJUzdRTXQrcXVQWlVCNEhsSzZ1QnRpSTZRMUY0NE9TOE53d1o1?=
 =?utf-8?B?OTFQNkdqNWV0T1JkWHNqZDI3alRKbUcxQUZqbVJ6UUJCMzZrNTFKbVo2bGJ2?=
 =?utf-8?B?a0dKNUZ6SW5LWXdzczNGQkdISWVhemEzaXBzMGhpdUkzYjRSKzhXSXhLWlFZ?=
 =?utf-8?B?MlRCZk9ENytxV0ZMRTJIVmdmeXBLcWNjODY3VDZnVjZqUnBXMDZ6V25CL2FU?=
 =?utf-8?B?YnljRHNLSVl0cWJoSEJLRm1RcmRLRkw4MC9wSTdYck0xRWd0elVJZlF2dlds?=
 =?utf-8?B?bW5Nb0F0aFhlWHdxa0Y2V3RGYXhHZFN6NVI2VW1KT0ZmZ1dvVkxZOHpHSytS?=
 =?utf-8?B?WWI0Ym9RMUY1N2VrNXRmWnVsQUxLWkJ3NXQwcnhJNVBncUxyN3FQSWYzOGdC?=
 =?utf-8?B?ZFlkcGQ5MTQrWXY3dFBJOWlSemtrUnptYlFDSFlPQW1qSUtiWGJCNi9NdkZ6?=
 =?utf-8?B?SFNudTBmZTdRb0Y5QWhWcE05RjhrdkFwZ0ZGSldRb29mb1BhekRvMzhkZk5x?=
 =?utf-8?B?VEJTK2xFQXg3V1FMNUIwa1BkOVE4LzM1KzhoZGIwdUNabElvTHJVSnRUNHpG?=
 =?utf-8?B?UFBlS2cxbUROOEsyMzA0aHVUMityRHRrRUhqN3JPL0NFZmdoSHpRN2JKT0Fx?=
 =?utf-8?B?SGcwSDhuM29NMjBhZHRIWkFCZU1PSkZMeXMvRWtGTW5jZVdsZklxRjRXTkw2?=
 =?utf-8?B?cC9LSm4xb2VSNGU3ZW9HODNuMnNLMjU0RzRLY25tZ0NNb25CS05mTDNoZXBR?=
 =?utf-8?B?TzJwRVl5eUNJNTN4NW5YRHRJWUxIS0ZiOTZMeFRrWm1Jdnk4ODlyU2xjaUNG?=
 =?utf-8?B?dndMb2ZZdnBmeTBqMU9PS01QOU1YMDFJcW1SNlVpVTNIY2U1TlFUL1kzaFJ2?=
 =?utf-8?B?ZnVrVWtsL1Fha294OVphRlpJOW1sOEptWnJmUVNxZFQ5UXY0T21ndC8vTjY4?=
 =?utf-8?B?SzhxZVBPMThKOW1YTVo1UngrWUpWRGdVWVVVclVZTlJBMm9vV2dFM0RCcy80?=
 =?utf-8?B?WCtRcC9ZbjNmRWpwMkR0TlZPclBrNGwvZVFXM3RyYzJIeXZZRDBUc2krclh1?=
 =?utf-8?B?K1BKN0xJU0cwbndmRERDZjg2NDFzKzB4dU5ETWVrMzNGZDBra3pxcTVCKzds?=
 =?utf-8?B?aHFjakhQV25VM0FVV3JaVG5paGRtS1BoeFRZQmRGMnFYb2YzZ3JoZzAvUklh?=
 =?utf-8?B?elhrSFRiM2taSHhMckV4bnBWbThHQzAzdC85aXNKV1FSbDg3UHlZL1lRUlV1?=
 =?utf-8?B?bVpCRjNpbHdrSmE3ZzBaVlVPVFFqQ0ZoSlBRMkpUdVlHd0tqc2JNK2podmdL?=
 =?utf-8?B?QWhDeFFkRE9MTk9kVitzaEdpM3NNUGp5MjNwSU9FRDFJMXpiWmRrSGV3UG00?=
 =?utf-8?B?bm1SN2s2cklFV3JyRnJWV1VrSVNvMkVMakU5WklyVTE2K0p4UnJtRWZvcnd2?=
 =?utf-8?B?NmFoN2t2MjREMnNxdGk4ejJsR3h2bDhicE1YNDNJSUkrdUV2SDNiTnFYSUdV?=
 =?utf-8?B?WTI3d215QUZsM1M4ajZCYzNkc3g1OHUwVnVaM1QrdmI5K1RuaXpKOUNrQWN3?=
 =?utf-8?B?SHFJb2tJKzZDU0hya201M3hlemY0S2Q1RUhhc0YxRnNDTkJBVkQyR1piampK?=
 =?utf-8?B?anF1M01UQm56c1YyOCtnR2h1TFFKRUlrU0VGQUdzYXRtTVZ0YWxHSHBaZzYv?=
 =?utf-8?B?UGgvZU9xVExlQzB0Slc5WVpwYjlOUDMwSkZGUVhiRWlEdWk5Q01JNVA3Nkp5?=
 =?utf-8?B?U1FYWGFzT2VSZnRpUHZyMlAxWUJnV2JpL1RjUTV5VjlZbVI0MWVZMlYxQWpa?=
 =?utf-8?B?Smk1VERyL3N5dng1UUVkQmdHcWh1RjdDelBQbklFTnp3anR5QXZ3dTVhc2NE?=
 =?utf-8?Q?SbMYRxBgFWDH/jDDXQ8S8n0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WVpmOURpaVBjZW5WaE1ydEdndjE3RXFsUSsxMGp0NUpzVkVjMG9ROXROTFI5?=
 =?utf-8?B?Y2Mvb2hPRnZJQnFsTG1wRDBSQS9YTGtybnI1WXhHMUtZbzJBS254L0VMcGk0?=
 =?utf-8?B?a25PSVo4TmZHeTJjRGtUZ3ZrZjRaODFOR25xQ0lEZXJUZFVlZWROSmpnTDVy?=
 =?utf-8?B?MWJZTnN1Smp0dkZFRVZRV1R2NzdrU1BvU0JNMEx3WWVISC9pY0hzVDBVR0Ru?=
 =?utf-8?B?RmxRQnh5NGxhckNyakc5UW03ejA1dHNiYldacERUNkdGL011cnZQclA0VzFj?=
 =?utf-8?B?dWdGUnNLSFY4Q2tPa0IyWEptTVZVOU5RZkZ4by9mS1NaZjRWNjVLS21lMlY3?=
 =?utf-8?B?djk1RUE3S3hZSFBVRXRXWjZWUCsxdEFHNDdMWC82VHdwWXRBUkpQZnBtN0ln?=
 =?utf-8?B?RWtMR0ZVRFhzYjQ3RmVrUHpxallqOG1PdDBObVRYOENPMzRRY050VUZXZTA2?=
 =?utf-8?B?L3hZaHhmLzFkOW82dUlnN2I1NjZzeXdrUDRId3B2WjdOS1grSndXR2xVZUJF?=
 =?utf-8?B?QmJNSmc3VGF3b1BvRGNBbURObHR0SXhUeDFBdVBkQ3hzcTRnSHNyc0g1cTIz?=
 =?utf-8?B?WUpZMHRUdXF1b1FEd3BLYmVYYVEza3NtaXM5dEZMNzMyNG8xT01CR0lXNVg4?=
 =?utf-8?B?a0FCQmx0Ri9HUjV6UVJuT0IxaGxCOHlTVDRRL09OSm9hbVNFM1YvV1FHL0Nm?=
 =?utf-8?B?dXo1cVhVVng0cFZDYnlDWnNxTHZlRzBWK1A4UUtTZEU0ZTErazhOeTdIUDNP?=
 =?utf-8?B?UmVoMmxoUEh3Z0hzeFNTcys0aExBQURnNmhFbXVhRVRXZ29mTks5U2c5Y3lT?=
 =?utf-8?B?L0h1SWdmenpXNVVUMHJaVGJvamt1ZHJVSjdTUWVIdzgrWll1SEhBQzZseWdn?=
 =?utf-8?B?bzBvSjNZUkdaUmhBMkFXR1lLNHVobytLQXdaeWZ1Q0dJMG5vSjZDeStuVzd6?=
 =?utf-8?B?c1RDWGp1cDdKaEl5NGE3NVhweWp5aXNNU21YT1g4Mm9rY1E2Y3FNYnBYNndE?=
 =?utf-8?B?SzhlUGdCVlpvMjJJN0pHWFRKQ05PUDVNa1YrQTJXK2IwNjZXdG04SlRBdTJi?=
 =?utf-8?B?czQyUFBVRHFYM2dMRXNRb1dWRFpVM2JocEJ6WDFRM2ZFVmdpcUx3N3MveFk5?=
 =?utf-8?B?WmU4TS9TMUpRMVZkZXdmajlYZ0FRSUkyYjhVZU1XS3BreVJOVzZJZ1V2THFa?=
 =?utf-8?B?UmNSd3pSZ0UycjlHc3FPL0pWS1F0TkFtUjJLNHJCMTBLYkFnNGZydUdvNXlk?=
 =?utf-8?B?NkErMGIvRFBDK0psT3VOUDN3QWoyR1NJbHIzQUVoditscXpGek52djVzaFNs?=
 =?utf-8?B?bEFkSGdGbG83Mm9STVNNaWV4QW9Fck9kZUprMVFxeWtEMW5NSzBBV3dYcitD?=
 =?utf-8?B?dVgzTlovTWZmSUlWRDM4ZDVmdDZ0aU5xZnJ6aXhERkV5cmFhUHV2Ny85VDVD?=
 =?utf-8?B?eHZPMSszQ0krc0xyK21ZTWRMSDIzK3ZJbFN2YWZZanFHYzdjM2ZrN21WTVli?=
 =?utf-8?B?b0hieTNnRytRd2ZrYUhiT0ptbEFCd2JLUnV3RjlOcGRVckJvc1BBaTcreEFB?=
 =?utf-8?B?THhOcUF0QjcyUkJyNktGVjBxbUorWDN6Q3ZqRWc3WDhiWk1TcUhIZStNTGdz?=
 =?utf-8?B?WVRBRWNjNUpwZzVXUE9Sd3QyTDc4enNkUXhrMEcwbUovaFJtdCtlYUphcjRU?=
 =?utf-8?B?c3EvZ2tGdWdvMWQzOTV4RTVZNzR2N1RTbFFlMklsbGZMcUNxRGY2U0NvbFh3?=
 =?utf-8?B?N09MTHcyRWFOc3J2M3ZpSDdSMjd6ejFmaVY3dk8wU1l0bnR5TDNmeFVBQk1R?=
 =?utf-8?B?ZXExQ3lnVWc0Znl2WFlnaVFnTUxmN1JrV0lNRlMrRHd5ejFmeDRwdmR4UUl4?=
 =?utf-8?B?ODJheUI1eTNuRE40bU9FSUFXRDZKbGNWMFBuUjhudzhGNWZqYkIzZEp1aXJZ?=
 =?utf-8?B?WFNxVjVsS0ZQVEp3T29IRmZubURyTjFTR205VE9lcXhud0J4VTRqK2ZUUzlZ?=
 =?utf-8?B?WG94V3J6QmpzaWVRakx4dkpHbXNGU2I4bFB2OGtTYmRiK3B0TTZQTk1WZVpt?=
 =?utf-8?B?cEdQbjMxTlVzMm42V3kyOEx3QWg3YUxsc05vd2RYUGxacEc3TDFyWmxRRHZi?=
 =?utf-8?B?NGJiWnZXc2VnWlkrV241TkdkMTl6bHhYWGZncnFTVk9qeFVXVVozMmoxbGFM?=
 =?utf-8?B?WGtCM01HOUFIUTd4V1QzTVB6VmI5WE9vOE4vV0t0UUNORGdCaVdvaHQ1Mm9w?=
 =?utf-8?B?elhjMkp3SXdhT2UwMkNmUG5ES0JJL2dqc0Z0ZHczTmpYY2VUNGhsRnFYWWtH?=
 =?utf-8?B?R0t3c0p3YmpMUFkrb3dWR1YzNG1STE1vTkVsdGxEMEdqaFFMc21wZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 992da3e6-f587-46e9-bf3f-08de62e6cc35
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2026 05:40:54.1235 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WAy30Bw6NwsMOt+Sq5BnjSPcHoazyjmcz3797i4otEOvnf5igD0zOCivalejrjzRH+Py+GWZa+UfbioqRbLFDjE5Rqta1tBRHYzYfaJ4yFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7708
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

PiBTdWJqZWN0OiBbUEFUQ0ggdjJdIGRybS94ZS9jcmk6IEFkZCBjaGVjayB0byB2ZXJpZnkgaWYg
Q1NDIGlzIGEgUENJZSBlbmRwb2ludA0KPiANCj4gRnJvbTogU29oYW0gUHVya2FpdCA8c29oYW0u
cHVya2FpdEBpbnRlbC5jb20+DQo+IA0KPiBBZGQgY2hlY2sgdG8gdmVyaWZ5IGlmIENTQyBpcyBh
IFBDSWUgZW5kcG9pbnQgdmlhIHBjb2RlIG1haWxib3gNCj4gZHVyaW5nIHhlIG1vZHByb2JlLiBJ
ZiB0aGlzIG1vZGUgaXMgbm90IHN1cHBvcnRlZCwgYW4gYXV4aWxpYXJ5DQo+IGNoaWxkIGRldmlj
ZSBmb3IgdGhlIE1FSSBkcml2ZXIgaXMgY3JlYXRlZCBhcyBhIGZhbGxiYWNrIGZsb3cuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBTb2hhbSBQdXJrYWl0IDxzb2hhbS5wdXJrYWl0QGludGVsLmNvbT4N
Cj4gU2lnbmVkLW9mZi1ieTogQmFsYXN1YnJhbWFuaSBWaXZla2FuYW5kYW4NCj4gPGJhbGFzdWJy
YW1hbmkudml2ZWthbmFuZGFuQGludGVsLmNvbT4NCj4gLS0tDQo+IA0KPiB2MjoNCj4gICAtIFVz
ZSBzY29wZWQgYmFzZWQgcmVzb3VyY2UgbWFuYWdlbWVudCBmb3IgcnVudGltZSBwbSAoU2h1aWNo
ZW5nKQ0KPiAgIC0gSW5pdGlsaWF6ZSByZXR1cm4gdmFsdWUgb2YgeGVfcGNvZGVfcmVhZCAoU2h1
aWNoZW5nKQ0KPiAgIC0gQXNzZXJ0IHdoZW4gQ1NDIGlzIG5vdCBzdXBwb3J0ZWQgYXMgYSBQQ0ll
IGVuZHBvaW50DQo+IA0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9oZWNpX2dzYy5j
ICB8IDM1DQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCj4gIGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9wY29kZV9hcGkuaCB8ICAxICsNCj4gIDIgZmlsZXMgY2hhbmdlZCwgMzUgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9oZWNpX2dzYy5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2hlY2lfZ3Nj
LmMNCj4gaW5kZXggYzFmMTUzMTNmOTJlLi40OGI4MzBjOTk5OTcgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9oZWNpX2dzYy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9oZWNpX2dzYy5jDQo+IEBAIC0xMCwxMCArMTAsMTQgQEANCj4gDQo+ICAjaW5jbHVkZSA8
ZHJtL2RybV9wcmludC5oPg0KPiANCj4gKyNpbmNsdWRlICJ4ZV9kZXZpY2UuaCINCj4gICNpbmNs
dWRlICJ4ZV9kZXZpY2VfdHlwZXMuaCINCj4gICNpbmNsdWRlICJ4ZV9oZWNpX2dzYy5oIg0KPiAg
I2luY2x1ZGUgInJlZ3MveGVfZ3NjX3JlZ3MuaCINCj4gKyNpbmNsdWRlICJ4ZV9wY29kZS5oIg0K
PiArI2luY2x1ZGUgInhlX3Bjb2RlX2FwaS5oIg0KPiAgI2luY2x1ZGUgInhlX3BsYXRmb3JtX3R5
cGVzLmgiDQo+ICsjaW5jbHVkZSAieGVfcG0uaCINCj4gICNpbmNsdWRlICJ4ZV9zdXJ2aXZhYmls
aXR5X21vZGUuaCINCj4gDQo+ICAjZGVmaW5lIEdTQ19CQVJfTEVOR1RIICAweDAwMDAwRkZDDQo+
IEBAIC00Miw2ICs0NiwyOSBAQCBzdGF0aWMgaW50IGhlY2lfZ3NjX2lycV9pbml0KGludCBpcnEp
DQo+ICAJcmV0dXJuIGlycV9zZXRfY2hpcF9kYXRhKGlycSwgTlVMTCk7DQo+ICB9DQo+IA0KPiAr
LyoqDQo+ICsgKiBpc19jc2NfcGNpX2VwIC0gQ2hlY2tzIHdoZXRoZXIgQ1NDIGlzIGV4cG9zZWQg
YXMgYSBQQ0llIGVuZHBvaW50DQo+ICsgKiBAeGU6ICB4ZSBkZXZpY2UNCj4gKyAqDQo+ICsgKiBU
aGlzIGZ1bmN0aW9uIHF1ZXJpZXMgd2hldGhlciBDU0MgaXMgZXhwb3NlZCBhcyBhIFBDSWUgZW5k
cG9pbnQsDQo+ICsgKiB0aHJvdWdoIHBjb2RlIG1haWxib3ggc3ViLWNvbW1hbmQNCj4gUENPREVf
U1RBVFVTX1NVQkNPTU1BTkRfQ1NDX1BDSUVfREVWSUNFX1NUQVRVUy4NCj4gKyAqDQo+ICsgKiBy
ZXR1cm5zIHRydWUgdXBvbiBDU0MgYXMgcGNpIGVuZHBvaW50LCBmYWxzZSBvdGhlcndpc2UNCj4g
KyAqLw0KPiArc3RhdGljIGJvb2wgaXNfY3NjX3BjaV9lcChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkN
Cj4gK3sNCj4gKwlpbnQgcmV0ID0gMDsNCj4gKwl1MzIgdmFsID0gMDsNCj4gKw0KPiArCWd1YXJk
KHhlX3BtX3J1bnRpbWUpKHhlKTsNCj4gKwlyZXQgPSB4ZV9wY29kZV9yZWFkKHhlX2RldmljZV9n
ZXRfcm9vdF90aWxlKHhlKSwNCj4gKwkJCSAgICBQQ09ERV9NQk9YKERHRlhfUENPREVfU1RBVFVT
LA0KPiArCQkJCSAgICAgICBER0ZYX0NTQ19QQ0lFX0RFVklDRV9TVEFUVVMsIDApLA0KPiArCQkJ
CSAgICAgICAmdmFsLCBOVUxMKTsNCj4gKw0KPiArCXJldHVybiAoIXJldCAmJiAodmFsICYgMHgx
VSkpOw0KPiArfQ0KPiArDQo+ICAvKioNCj4gICAqIHN0cnVjdCBoZWNpX2dzY19kZWYgLSBncmFw
aGljcyBzZWN1cml0eSBjb250cm9sbGVyIGhlY2kgaW50ZXJmYWNlIGRlZmluaXRpb25zDQo+ICAg
Kg0KPiBAQCAtMTc5LDcgKzIwNiwxMyBAQCBpbnQgeGVfaGVjaV9nc2NfaW5pdChzdHJ1Y3QgeGVf
ZGV2aWNlICp4ZSkNCj4gDQo+ICAJaGVjaV9nc2MtPmlycSA9IC0xOw0KPiANCg0KWW91IHNob3Vs
ZCBzZXQgaGFzX2hlY2lfY3NjZmkgdG8gMSBpbiBDUkkgdG8gZW5hYmxlIHRoZSBIRUNJIENTQyBz
dXBwb3J0IGZvciB0aGlzIHBsYXRmb3JtLg0KDQo+IC0JaWYgKHhlLT5pbmZvLnBsYXRmb3JtID09
IFhFX0JBVFRMRU1BR0UpIHsNCj4gKwlpZiAoeGUtPmluZm8ucGxhdGZvcm0gPT0gWEVfQ1JFU0NF
TlRJU0xBTkQpIHsNCj4gKwkJaWYgKGlzX2NzY19wY2lfZXAoeGUpKQ0KPiArCQkJcmV0dXJuIDA7
DQo+ICsNCg0KDQotIC0gDQpUaGFua3MsDQpTYXNoYQ0KDQoNCg==
