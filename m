Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A40C88E75
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 05:06:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB14F10F960;
	Tue, 15 Sep 2026 05:06:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F5wPCcm8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFF710F960;
 Tue, 15 Sep 2026 05:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789448783; x=1820984783;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F71gkFFSo7qCH2UiIsKUSMurwpLIA4WzXe1DnnTvJmw=;
 b=F5wPCcm8Ep47fxpwJRqaQosVzdFM8iNe4h57XS1DvokbbvVhUvbmper+
 L0Qheb0eS4luOdnvk29qwC5Pspu+rFRcX1PNeuYuhotiesOckmIw4IYhN
 7C++dpem6QknNr9wDoDxejyCFURq5+RQOPjoXixctHhUrvI1FCiIqyuTP
 qA6nBgGfKbiz6SRQN2gJkDaNbWSOloPFAgBjMlhaXOe4J6M4vWZjnb+5u
 ZtG1ulnB0rAc8b2/a6cON1E+NDCg2XwEjw7deeS8OLTzLTgmow4Au6s6g
 ifdzhwLBoFzv4Y2uKspa9RNJJKVt/nYWgzv3W4Ont7K0ocB1GMPS7mENG g==;
X-CSE-ConnectionGUID: 2lZZcRLeROSAhrsckbdFeQ==
X-CSE-MsgGUID: 0lNMi+a8QA+hlwISazMRDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="88940594"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="88940594"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 22:06:22 -0700
X-CSE-ConnectionGUID: punXRvXLSh+7kms2J57rQw==
X-CSE-MsgGUID: y6F9rftQQPOafW5ehw8ylQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="296336947"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 22:06:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 22:06:05 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 22:06:05 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.29)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 22:06:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zrtoi2Zq/lcS04N3XXaFAxthAcQkG/va5q9fNVvM0/7HPG+slvA8Z+F/SRv7v4Q7lGWhgIFXvQX26mRmbA15XNZz9ARsKveNg0d3b9zeONtt/dO+js/G7Fnp2aPP1WZEXop4zCh/Hkc1hl2szb7zABFvNbwLxbFW8HjPyIybElZJGSHi6ZwIPwOQqXhR5UsLreonBfAC3tvbM+Gy1QGOO5BrfMsSH/63OGZLO3oK1xjHHr2ow6+g9Ln7GnGKA7oJsK/SIahsZR/Z+0M4QFWyInzl0n2hEKOHJ58TXmGM4LeKKmyNFkrO8UdlOYZ6lU/4+cXmQXYRs5IgRKnr6Rg3LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F71gkFFSo7qCH2UiIsKUSMurwpLIA4WzXe1DnnTvJmw=;
 b=OHKWKCPTKVzoU/kSHoVQ3lajJQXM2mu96KXghA42YQCEeeF70WVqdJVn7IslTLbwl6XteYWCLYmlxSGEb1rbeIkp5EGyQWR4m4+HeqgB+sngMq+puT4wsfGUsJCjOgLZwc8mYwxovQkaxgYECmduDxMRVczhkYnw4D24RPUK3SjMF9YHAWzW/tjRsqe6omGTGMCVtI/cp8aje9p6X9AusKVQnTbghXbiP4RF3seWjEKskFVj10d+Xl8VfRU8k2GTSMLthAioaGRatwD9gvCRPUCOZ1bZc427V1gXgfQUrC79zv9TLjPsl4Jweie+i2/52BXiVMWAq91YabZtM3zy9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by DM4PR11MB5994.namprd11.prod.outlook.com (2603:10b6:8:5d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 05:06:03 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::5a70:4005:6905:8e31]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::5a70:4005:6905:8e31%7]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 05:06:03 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v1] drm/i915/display: Add command line param for DC balance
Thread-Topic: [PATCH v1] drm/i915/display: Add command line param for DC
 balance
Thread-Index: AQHdNsvGSZRRVPFRI0mXYOec3HZDkrazPtKAgBvzJXA=
Date: Tue, 15 Sep 2026 05:06:03 +0000
Message-ID: <IA1PR11MB6348E1AFDBE56F2F1A0B8BCCB2BA2@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20260828085037.1430881-1-mitulkumar.ajitkumar.golani@intel.com>
 <23a0819e-35b9-4061-ba87-288601f9fbeb@intel.com>
In-Reply-To: <23a0819e-35b9-4061-ba87-288601f9fbeb@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6348:EE_|DM4PR11MB5994:EE_
x-ms-office365-filtering-correlation-id: 68890120-4849-418d-7682-08df12e70a94
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|4143699003|22082099003|18002099003|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info: /19+tn+x1rYyndpCzM2Uo2AKUrDh/wq75qedRfRWe11fyl/FmFMzz+O69MovHFFWU4wY/21O1x20Hch6AH1rkKVut01zMU2h3MjOdLBuhQS8Q+rRlnfnjiOya4ncCDs23mtfbb+KtIQEOn55fWsAaxjGffqkWmy6Zi9bYF8PR1XQyU0Ja7LxtjNF79auG6toV6U2pz4f+CP8qyOKVaAmZuGdlRwFPuEdzRC9QZ6xujHRLbMlGJh2ppBwxcFwSGwy3pkjJRtRJ9cyGvwcEWr3A+WZu0THuTxBNK1P0NaDegjr+2RWvAZHHYrQ31vGXSwo4AQR3mBGGBlh+vn+m4AP4amMiEKOSJcUrrtxlVDre+t0jc3P91mjOSEAtcWABsQoFdE9o3oy4zW/jPAcYgC3ye+tPHb8KE95D6OJG5zduoQ5PTO2wrMcQugOn5kOyX48cTxJcTkGv9HANl4pX9NNr5OJyH323aQHa8T2lK25KQrj1kT6iKR5n/aiwmLw7YgKAOS0oo4//8HikyK4allIu8viUWSM/Ni6VEeDa6f4Yk1MfauA0Kpvpg5z98kqempsNdYZ6+xMBdmdpMy05zZQDm8SYL6Eyk7Cz9KEVA6DCxFaegangJlZXIjO+OlIaQcADQFeV9h/pys8ezJFDHd3Yxi64X8rCT3fKAMr9S6c1y2rTqKKM2hJGeiv2tSLwwyGX1L0xXdHYauy3fHbYSjg8rifqh4JOngvFNK2/aH6oMk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(4143699003)(22082099003)(18002099003)(11063799006)(56012099006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VGVqV1ZsTXhsK3F0M05jeTNyVk5RK3NXSUtRYzloMm1scTFCSzRpbzB6RWFj?=
 =?utf-8?B?em82NERLdWlTMzVyWnM2b2w3MDFLLzlHLzZUOWRIR1l4eUVvWFJSOGp2eXNo?=
 =?utf-8?B?ZGZCLzQ1SlkvUlo2ZU1jc3FLYU92QkZYSE52bVpEbGFvU3pDNEdLZC9OZ1Yy?=
 =?utf-8?B?K2t6eFJRcUI1ZlV0eUdPdEtlcmpFNUhPWnlpTEVwbVJwalpIWHBOMUVsRFM1?=
 =?utf-8?B?Qm51a2hVY1hQRUhlRnVuMHJIaC84cGljK1RRMnpJQTNmcUJGN05GbjJXRUlL?=
 =?utf-8?B?VHVhTFJhNUd5TzAwL0RFRGl3anZhN3hLVUxVQ08rN2tWME5BRStlTjRqbzlh?=
 =?utf-8?B?UjNGby9RcTdhaElJZ2pSOHpWVTVmeXIzY0xvZzFsbzhDYkJXZC9HV2dYdTEx?=
 =?utf-8?B?K2o3dndNeW95Y0Yzc3F1aU9QRVQvRXhyU0YzckEvWnJadEhLUW10V2xuUXI1?=
 =?utf-8?B?NWJwbE9mOU91N2dwdVUyeFUvbjRRWkpOaml2SDF3TlByM29UNDFwUDN5VHpZ?=
 =?utf-8?B?b3JKdnJxYWJuelIyYXB1RGJnd3NTcFZBRXpiOUx5VGd3ZTVYOEZ2K0dvVnBz?=
 =?utf-8?B?RDE0emYzUDM4S2NDYVNTU293NE9WNElKcmhlTkg3bHhrdU4wWDdDWFRXYkhG?=
 =?utf-8?B?VGJJT3JXTDB5WnNVVm5wZ3NITllYaXpCRC9ocVVVT1dkWUgxZTZQditiYUVT?=
 =?utf-8?B?MzViQTdya2NZbnErM0U4THRmUExNTGg0alhnNnBOT1o2clcrT0V1c04wUEtp?=
 =?utf-8?B?Zy9qQ2VjbGh6VFBxcHpreEFZWWZyOU1nZXQ0b1ZJeVN5QjU3a1NRdUhJZ0VS?=
 =?utf-8?B?Q2FmYzkyQXlGNlQ2SnFiNUhzdXY1Y0JBL3VHS2Zhb24zUWtUTkR3b0M2R0N5?=
 =?utf-8?B?VDVibDFYMXh0ZXI0K1ZmbDVzVnhmNmFuUEROMnQ2VmZ0NkFSS3BZYmVHdENI?=
 =?utf-8?B?U251WGFKa25Uc2RxZXR0YlhLWmVBZ2MxaWlmNkt6M1RodG5zVHJKcnlteENV?=
 =?utf-8?B?YW44OXBSVGIyd3VuMWxwRE1TQ2FVSzNJaDJHTm1VQUFxbmxWRWluWFpvd1Zz?=
 =?utf-8?B?QTZRQmhBVE5JLytSYWhzeGZLcnlaRWNhZ29ibG16TTZydnVjQ085YnNTOW5W?=
 =?utf-8?B?VnRaVk80bDdzVlE0RnFjem84ZWp5aDlVZTdtRkNDNFBrd2V1a3YvNExJUGVy?=
 =?utf-8?B?L21EWk9XV2tLWElsenFCSHJ1WVdQTWIyeW9yY1Z4aWRVa1FOckpUMlU3bVB4?=
 =?utf-8?B?V2t4YU1pc2pHTmZ4d3c2YlRtclNJeVhBS2ZCWmp4RG1MSTh2dnBNcHhZQ0lm?=
 =?utf-8?B?NnB3U0diMWwvcWszbVBhQk9xbHIweEV5QlF6bCtOeUJNMTNGV2ZuREJJY0dK?=
 =?utf-8?B?TjczU2NnUnN4amRDQ0k2NjlNQWRVVlR6MWZ6Mmowb3pPT2JDeGNZMDJlSEZy?=
 =?utf-8?B?ZXFsd1YxU2NhcjJXZDRMRzBlOURxdk84Si83MFhSbzBQS05FSklQUUtHbXF5?=
 =?utf-8?B?LzYrNW5uTnVWeTZrU0lqSkVNaXdyR1NQSFU0YVAwK251UDY3dnlMaDRRL200?=
 =?utf-8?B?QWpHRlFTdEdHWXF6VkNzYTdHSnhEcG5tMzVaQSs0aXVnb2l5di94VzNibjV0?=
 =?utf-8?B?blNHN2NkcEdGNndrY2ZRelVwUldJQndrZ3Vtdi9DdEE2V1dSMUNmaG0raGlw?=
 =?utf-8?B?eDRzSmFjUkxtcmRDaWMxb01yTXFadWNmNUZpcXczTWVaODB6dWZRS0xoclpr?=
 =?utf-8?B?ZittVWRKaXYycnI5cGFFL3VNOGo1MHpHUUVXTHkwbzFYT0s1ZUF4UUtEOW05?=
 =?utf-8?B?ZjAxNWMyZFRBc1RXazlwSXV6UTJUazd0V2s0RWUrbVlxWWc3Q3dYTi9jbkhR?=
 =?utf-8?B?MitBcEpUbVAvL3NHNXVOYm8xSU5qbkovb0h1bzUzdmZtdGtkVlh6WnF3dy9D?=
 =?utf-8?B?OHB4VWVrOU1FNUIrVGpwa0VhVGFqclJWR0FjOXp6Q1lFK3FlQzA2aFZXbDRa?=
 =?utf-8?B?cmJtT0xRcnE0cFRUc3VNSnByMHFTaXo0dU52R3dLMTkxQ2tRV3dtQXJsNmdU?=
 =?utf-8?B?MWtZZ3BCVnlaV1FacnRsNkVIdENKWU1lYk84Q243MGdoM0E0OWEzek5mSmdN?=
 =?utf-8?B?VTdCakh4RzFWcWRwMTlmODhrVmJCRXZTenJJWFJQRStFd1h6aURMTFJTYjRm?=
 =?utf-8?B?d2R3VFhqN0JRTWo3TkhqbDZEQyt4S1Q4Mk1pOFdpejhqV1lFVk5NcVZ4bkw5?=
 =?utf-8?B?azVOZkV0TS8wWXkxRHhnVFl2aW9Ia00zVktxdFVvalZON2EvNHZWNHdveVRp?=
 =?utf-8?B?U3BFWEUrcmtYNVFEMUpwT2FkcU5uUHowTngrQWFEOVZqdkZjSXdlemdRZG1R?=
 =?utf-8?Q?+WqPq8l86E6eqbhBsPztDZzmnayepbSrKNzLt?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 5YJ00+Gt3Tqjjtfa0B54K59o0ybHOzhyusyc1UVc2ajoDaRZ/F5qY2bhwWAHfDiTQiPRtcdtk0aDdvqfhlVdVVQVtqYDV6H+PA5bxUvUdWvMUuxN5b9fN2+WZpRqER47c6eXrII3hzzO2tVNy47mofqL4MFs3dqAmqbZm3ycNGvDStbF69HALv/j9MFJuwq9hw6Fx9IRk6HbpKobyYuvOgjOSmQMz1F9VqN6PdKriXdibStcJRCLJo/OyuJ67PZCNqEgp79bXE2DG5tblHwwJZXSuauCGhwG5+EZ21BnifYzetW+d4ZVGe4rOhtLJDwtVc6MIL4F5K6ybkraeLBtCw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68890120-4849-418d-7682-08df12e70a94
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 05:06:03.3823 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZxtvqECPG1lqCNsEJbsFvRfO8AX8LSzdgUi6o1u02040gudRCRH7FydIqX6hTIUWJ/mPhIQo0UA0AAXFUDcN2bFMLvkcKfUMA5n46sIQgoPCPVUIVgH27wLSpv8YRtm3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5994
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQm9yYWgsIENoYWl0YW55
YSBLdW1hciA8Y2hhaXRhbnlhLmt1bWFyLmJvcmFoQGludGVsLmNvbT4NCj4gU2VudDogMjggQXVn
dXN0IDIwMjYgMTU6NDYNCj4gVG86IEdvbGFuaSwgTWl0dWxrdW1hciBBaml0a3VtYXIgPG1pdHVs
a3VtYXIuYWppdGt1bWFyLmdvbGFuaUBpbnRlbC5jb20+Ow0KPiBpbnRlbC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQo+IENjOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IE5hdXRp
eWFsLCBBbmtpdCBLDQo+IDxhbmtpdC5rLm5hdXRpeWFsQGludGVsLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSCB2MV0gZHJtL2k5MTUvZGlzcGxheTogQWRkIGNvbW1hbmQgbGluZSBwYXJhbSBm
b3IgREMNCj4gYmFsYW5jZQ0KPiANCj4gDQo+IA0KPiBPbiA4LzI4LzIwMjYgMjoyMCBQTSwgTWl0
dWwgR29sYW5pIHdyb3RlOg0KPiA+IEFkZCBhIG5ldyBtb2R1bGUgcGFyYW1ldGVyICdlbmFibGVf
ZGNfYmFsYW5jZScgdG8gYWxsb3cgZW5hYmxpbmcgb3INCj4gPiBkaXNhYmxpbmcgdGhlIFZSUiBE
QyBiYWxhbmNlIGZlYXR1cmUgYXQgcnVudGltZS4gVGhlIERDIGJhbGFuY2UNCj4gPiBjb21wdXRh
dGlvbiBpbiBpbnRlbF92cnJfZGNfYmFsYW5jZV9jb21wdXRlX2NvbmZpZygpIG5vdyBob25vdXJz
IHRoaXMNCj4gPiBwYXJhbWV0ZXIsIHNvIHRoZSBmZWF0dXJlIGNhbiBiZSB0b2dnbGVkIHdpdGhv
dXQgcmVjb21waWxpbmcuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBNaXR1bCBHb2xhbmkgPG1p
dHVsa3VtYXIuYWppdGt1bWFyLmdvbGFuaUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfcGFyYW1zLmMgfCAzICsrKw0K
PiA+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3BhcmFtcy5o
IHwgMSArDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Zyci5jICAg
ICAgICAgICAgfCA0ICsrKy0NCj4gPiAgIDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3BhcmFtcy5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfcGFyYW1zLmMNCj4gPiBpbmRleCAyYWVkMTEwYzVi
MDkuLmVkM2FhODRjNWQ0MyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2Rpc3BsYXlfcGFyYW1zLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfcGFyYW1zLmMNCj4gPiBAQCAtMTIwLDYgKzEyMCw5
IEBAIGludGVsX2Rpc3BsYXlfcGFyYW1fbmFtZWRfdW5zYWZlKGVuYWJsZV9wc3IsDQo+IGludCwg
MDQwMCwNCj4gPiAgIAkiKDA9ZGlzYWJsZWQsIDE9ZW5hYmxlIHVwIHRvIFBTUjEsIDI9ZW5hYmxl
IHVwIHRvIFBTUjIpICINCj4gPiAgIAkiRGVmYXVsdDogLTEgKHVzZSBwZXItY2hpcCBkZWZhdWx0
KSIpOw0KPiA+DQo+ID4gK2ludGVsX2Rpc3BsYXlfcGFyYW1fbmFtZWRfdW5zYWZlKGVuYWJsZV9k
Y19iYWxhbmNlLCBpbnQsIDA0MDAsDQo+ID4gKwkiRW5hYmxlIERDIEJhbGFuY2UgKDA9ZGlzYWJs
ZWQsIDE9ZW5hYmxlKS4gRGVmYXVsdDogMSAodXNlIHBlci1jaGlwDQo+ID4gK2RlZmF1bHQpIik7
DQo+ID4gKw0KPiA+ICAgaW50ZWxfZGlzcGxheV9wYXJhbV9uYW1lZF91bnNhZmUoZW5hYmxlX3Bh
bmVsX3JlcGxheSwgaW50LCAwNDAwLA0KPiA+ICAgCSJFbmFibGUgUGFuZWwgUmVwbGF5ICgwPWRp
c2FibGVkLCAxPWVuYWJsZWQpLiBEZWZhdWx0OiAtMSAodXNlDQo+ID4gcGVyLWNoaXAgZGVmYXVs
dCkiKTsNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2Rpc3BsYXlfcGFyYW1zLmgNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfZGlzcGxheV9wYXJhbXMuaA0KPiA+IGluZGV4IGI5NWVjZjcyOGRhYS4uOGMyOGMy
N2UyYzQ2IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZGlzcGxheV9wYXJhbXMuaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfZGlzcGxheV9wYXJhbXMuaA0KPiA+IEBAIC00Niw2ICs0Niw3IEBAIHN0cnVjdCBk
cm1fcHJpbnRlcjsNCj4gPiAgIAlwYXJhbShib29sLCBlbmFibGVfZHBfbXN0LCB0cnVlLCAwNjAw
KSBcDQo+ID4gICAJcGFyYW0oaW50LCBlbmFibGVfZmJjLCAtMSwgMDYwMCkgXA0KPiA+ICAgCXBh
cmFtKGludCwgZW5hYmxlX3BzciwgLTEsIDA2MDApIFwNCj4gPiArCXBhcmFtKGludCwgZW5hYmxl
X2RjX2JhbGFuY2UsIGZhbHNlLCAwNjAwKSBcDQo+IA0KPiBZb3UgbWVhbiB0cnVlPw0KPiANCg0K
QXMgZGlzY3Vzc2VkIG5vdyB0aGUgaW50ZW50IGlzIGRpc2FibGVkLWJ5LWRlZmF1bHQsIHNvIHJh
dGhlciB0aGFuIHRydWUgSSBmaXhlZCB0aGUgdW5kZXJseWluZyB0eXBlL3ZhbHVlIG1pc21hdGNo
OiB0aGUgcGFyYW1ldGVyIGlzIG5vdyBhIHByb3BlciBib29sIGRlZmF1bHRpbmcgdG8gZmFsc2Us
IGFuZCB0aGUgZGVzY3JpcHRpb24gaXMgY29ycmVjdGVkIHRvIHNheSBEZWZhdWx0OiAwIChkaXNh
YmxlZCkuDQoNCj4gPiAgIAlwYXJhbShpbnQsIGVuYWJsZV9wYW5lbF9yZXBsYXksIC0xLCAwNjAw
KSBcDQo+ID4gICAJcGFyYW0oYm9vbCwgcHNyX3NhZmVzdF9wYXJhbXMsIGZhbHNlLCAwNDAwKSBc
DQo+ID4gICAJcGFyYW0oYm9vbCwgZW5hYmxlX3BzcjJfc2VsX2ZldGNoLCB0cnVlLCAwNDAwKSBc
IGRpZmYgLS1naXQNCj4gPiBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfdnJy
LmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfdnJyLmMNCj4gPiBp
bmRleCBlMzZkYjExNzQ0NDAuLjE2OThjNTRlMjU4YiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Zyci5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF92cnIuYw0KPiA+IEBAIC00MzksMTAgKzQzOSwxMiBAQCBz
dGF0aWMgYm9vbCBpbnRlbF92cnJfZGNfYmFsYW5jZV9wb3NzaWJsZShjb25zdA0KPiBzdHJ1Y3Qg
aW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdA0KPiA+ICAgc3RhdGljIHZvaWQNCj4gPiAgIGludGVs
X3Zycl9kY19iYWxhbmNlX2NvbXB1dGVfY29uZmlnKHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpj
cnRjX3N0YXRlKQ0KPiA+ICAgew0KPiA+ICsJc3RydWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkg
PSB0b19pbnRlbF9kaXNwbGF5KGNydGNfc3RhdGUpOw0KPiA+ICAgCWludCBndWFyZGJhbmRfdXNl
YywgYWRqdXN0bWVudF91c2VjOw0KPiA+ICAgCXN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICphZGp1
c3RlZF9tb2RlID0NCj4gPiAmY3J0Y19zdGF0ZS0+aHcuYWRqdXN0ZWRfbW9kZTsNCj4gPg0KPiA+
IC0JaWYgKCFpbnRlbF92cnJfZGNfYmFsYW5jZV9wb3NzaWJsZShjcnRjX3N0YXRlKSB8fCAhY3J0
Y19zdGF0ZS0NCj4gPnZyci5lbmFibGUpDQo+ID4gKwlpZiAoIWludGVsX3Zycl9kY19iYWxhbmNl
X3Bvc3NpYmxlKGNydGNfc3RhdGUpIHx8DQo+ID4gKwkgICAgIWNydGNfc3RhdGUtPnZyci5lbmFi
bGUgfHwgIWRpc3BsYXktPnBhcmFtcy5lbmFibGVfZGNfYmFsYW5jZSkNCj4gPiAgIAkJcmV0dXJu
Ow0KPiA+DQo+ID4gICAJY3J0Y19zdGF0ZS0+dnJyLmRjX2JhbGFuY2Uudm1heCA9IGNydGNfc3Rh
dGUtPnZyci52bWF4Ow0KDQo=
