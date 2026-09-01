Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7D5C624CF
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 11:34:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A3F10E895;
	Tue,  1 Sep 2026 11:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QqfJKdKF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7482B10E3E6;
 Tue,  1 Sep 2026 11:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788262449; x=1819798449;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HBx3s5F+V/5rF43ekpQrmJdkn0dTCIyGo+MQZWS1PGA=;
 b=QqfJKdKFu9dLjvn8aqAIlNpY61KMd+qXlm+IQ9cnqsAu4PwYe91GsR5r
 pUfmm6vSqf/WHfUnkNp+TOtckGx3ySAZxghLP4vhhqJVw6BeRu4F4I2SK
 wZL4bE6KS8NaFP+krpqY/mThikDHU6K1Rhi3it7yL3ub0SSLGn2hW/zfy
 m/Gqd+T9BskV8SbNVi6LMHzdyRUvCTmcQIbhRk7+9L0onc8E0/8q+OovM
 t0eq1CMCKNiCN8FKjTvRyxjjGV/MfYaiE24xQX8vVItYO9XCL/DTWA9nY
 gUo1K2Qa1LJI9YxoSFdxfAE4EJs3MHt0+MKrDPELPgC9KD5eKwDsBPaPL A==;
X-CSE-ConnectionGUID: PxdUZrLjTP2GH6chwH6dRg==
X-CSE-MsgGUID: 4CCGsrn8SaO0wTI7SQsxuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="114226661"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="114226661"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 04:34:08 -0700
X-CSE-ConnectionGUID: xlqvWRh4RJiMyVK7FAx6SQ==
X-CSE-MsgGUID: 0GSorYTSQQakx91qeHU8hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="267759668"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 04:34:08 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 04:34:07 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 04:34:07 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.10) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 04:34:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=edtIKQzBzQsvqpUDa6UuIyMURwI/N/MB2IIdOQg5tUuj2uW2yvKCg78ccnVZorazrragPrAJDrNMmlIDnRk3PxaE3FaLYb/OBpqxQK3GvO0YMR2vr1b58wqzbYKrau8UViaQcLSlfMKOuwi3alX0skoptFSemvXk2s2uwfra3cYlyWt9OAKmG/1onLWyaScbRwQOLhXeyRJTgt4XNLXh38T4IU4YEZZ3lMFP8BbZI0+YtQB1tva742PfS8VilGkMFRMGBiolh/B557H6WfWJbn9Q4YZPAds8kBdX5UqMVTC6Wu4g/28lPQMS5QJB+CQcw3V6KKtsbDk7AxgZ1CSS7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HBx3s5F+V/5rF43ekpQrmJdkn0dTCIyGo+MQZWS1PGA=;
 b=a06RQgpEaHv9sn8evGLeumDCMCAsHdGNM5o+OzkETaYYG5JcyEE0HTCsuyuVrJCllZ82Hv9hxbYQ5SxkOdhsfwOHZ9kcubXlXavTShbOhpoNRZqHto9BD60QiDmWPpqex0ZCxZ9Uuje2MFS518NsQqHXXQHsEg+aoDrmFctdHlJO6pv1ydZCmpgr8hejfWyiTtHEvV62Or7TiiSd+DRm15UhdmYSzczET+6ZTLitv9hsmWrBy5x+ilzM+cnUMYCq1X/Qiz7ppPJdrh8CkwhZ+z8Sk8MmEpy3iJO2jgANti5Qs/5wo50PywtvPwmnQSEgRv+UPKpF/2PrKtGSbofolA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::28) by DM4PR11MB7255.namprd11.prod.outlook.com
 (2603:10b6:8:10d::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Tue, 1 Sep
 2026 11:34:03 +0000
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::4b5f:a185:133a:f36e]) by DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::4b5f:a185:133a:f36e%7]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 11:34:03 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 2/3] drm/i915/display: Restrict flipq to simple
 single-plane updates
Thread-Topic: [PATCH 2/3] drm/i915/display: Restrict flipq to simple
 single-plane updates
Thread-Index: AQHdJmaGvjuH4Dm82kuumBZ62BvxSraz6+4AgAXSHEA=
Date: Tue, 1 Sep 2026 11:34:03 +0000
Message-ID: <DS4PPF69154114F9574E4C6F98E3D38B5AEEFA82@DS4PPF69154114F.namprd11.prod.outlook.com>
References: <20260807121540.2032283-1-mika.kahola@intel.com>
 <20260807121540.2032283-3-mika.kahola@intel.com> <apHVjiELFEoIfBM4@intel.com>
In-Reply-To: <apHVjiELFEoIfBM4@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF69154114F:EE_|DM4PR11MB7255:EE_
x-ms-office365-filtering-correlation-id: a056a080-7ff5-4b2c-78d6-08df081cecb8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: zatbvK164ULIzlxzY/NC6TXcdOSqVXqvoBwrM/PnD5rAquh0COBZPzRxGGxDtu3FER9uYZ37Pf3k3vX0qqjyQlJaXVYD5sTONxmtSWn3xGScmpWdYuUosyUXOH+pWn2oXc3t7xQvYZzdDYCuahr46rNETmmLVigi/IEjjL7KkExWdbxOoZVaIdTLNnB6Gjadz6bFI5tb2Zn5iYSSh/OM9/tbyuI8QiO9Pq0/MUx7KvMEDhReCv9G//CbB72r3PTeIl/kRv7cw/07+GsbQHUvhALfSGlOMqd2PzZRRJkrGAyMhqEr6RbgYYRGvGn0i2I37NbwRL3Q6JUXcir8FrAIOKgWaN/jIpIpeas/2sKNfMdIK03yhugI2UB0RkSur+D8MPpXMPtXvKBaBqNDbkPjPaOTmGYLyjVGUHRL1K8JyXQiZi3gOMjs5uE1h0WhJ7hHcX9NxMtwI8KgZJwC0m9uze017nCY8P9KeHLe5QHGzdbm1t0inPaoMptxncMEwk2kLV+zsDTyaWqda9MAjDRffBnMNlpley7ydt4bVPaEtMPmC80ZSkyFVIamN4QbWLQhWBnPoLbQtr1fqMQMDctQhYdS1hHSqN68vDrPqxihAuw2V/5sEh2qbHIFU/4J17/wHn11wf0J5nRxSZKetCMhkFMWCJpj4wfDlyzM4torjq2SWLQ4EJglJlqeo0Hk0V6mcCvqjL1brnRyNrzAlb43Z/3KtHB3Kddkv9zKQnoObfQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF69154114F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b2xHOWVhYmNGTHdyODI4V2pkVUJWcGRSaVdURWF6c01FNzBZN1c2Y2FUczEx?=
 =?utf-8?B?VEV1VG1TcURnNndQVTFEbmpSYVROVVpESGpDRkZ3SHQxYXlOZkFDRERqWmdB?=
 =?utf-8?B?aUwvdjhIb1phMGd4djMrMUpzOGgrZUtsSWNpbGxnZ29DQVpBeHJlTXFRbDVK?=
 =?utf-8?B?VUp2SURIWVUvM09xbXBoaW43ZXNKOTEvZHQ3dm9mdEhrSSs5RmpmMkc0VFMr?=
 =?utf-8?B?ajViaTlmU2p4bEd4bzJrTkxwZjI0UDl4akRGQjZiUTdOWXAvd2xISW0vWUQz?=
 =?utf-8?B?eWhwZ3Z6aDJhRzMzZmNMcDUzNHdTZ0hDdzMrMnZaS2t2c1RHakJ4bXNCMEE4?=
 =?utf-8?B?aHJvL0t3WnNIMmFhZ1hQc3l0RnlaR1piRDVpVlJIdTlqU1AzUEVRN2cwZHdI?=
 =?utf-8?B?cnFqdjRpL0RHMC92QnNWMDNUSWwySTRlclovWWRGam8xVWJjT28ydklvMm9P?=
 =?utf-8?B?cWJ3aSs5THY2VzNEUXJ0aVpiNTYxLzI1QUd2WEdUa1Zma0w4WjhEOW9zQzN6?=
 =?utf-8?B?YUludmlHbXVRc3pZMkVBUDZvckYrOCs4WDZkWllEVitab0laQkVrT1N5ZW9P?=
 =?utf-8?B?RzA4bkYvMHdwRDd6S1JlMGYvRmhTR29JOUxJZmdQZFQ0SVErQU5ZOUViRDVI?=
 =?utf-8?B?ODVpSXpQaisrV0NBb3pUVU5KeG82SmlJbTRYdGVycDVHcnZsL2JFMHNVSlQ1?=
 =?utf-8?B?V3hVQm50MGUxZW1heDd0UHdncWZucXN4QWRVM29vekFYMVd2dTFOd3JjRUk1?=
 =?utf-8?B?bjZPUG1IVDJYMVEvNFd5cnh5cnZLTDZLdFlmSzB2NXdmUXQ0alYrQjJKanBv?=
 =?utf-8?B?aElpWTAvWTZjbWpTWHJCNm9XRERwdXRaMm1DdjhmZG5WWDd6RWorQTJ6NWVh?=
 =?utf-8?B?L2s5N1lJQlZRZFExSWozYzh2Y2VoQU1PejRta2JQeUs5WXpHZzg2MkpRQ3BC?=
 =?utf-8?B?NjNwOUhCUzhJSndKVlFHTHdxanE0NmZrVHVuSUVJS1hJSGp0ZnpXa3BValNh?=
 =?utf-8?B?YnE3NmgwYlFvQ2M4VDNhQUtXNUxhMmZqUTIzNE5TOXJqNDQ4MTI5UGdKa1FG?=
 =?utf-8?B?K0J0SEg1d0xlcmt5cUlMNzd2eUhqZStKWXllM3k0Sm56M1pKbUtxZTlXVDYz?=
 =?utf-8?B?cytWT204VGh5VUcweUd3VU10YlF3emM2MjM5VlFDNFdXY3VEUDN2WEpQM014?=
 =?utf-8?B?eU9vdlV4cnNOU29wak9kNXNTVUFMZ3RhU1l0S0tIR0pTalUveUJFcHpaRmlS?=
 =?utf-8?B?UGhzKzRpWTFOWndrRkplVm5vYVMvOVJkenltaWV1bi9WdVZ3YmFpYTRaOG5R?=
 =?utf-8?B?dHpnMUI1d1Jia3U3NlFCREFFL0RLVWFjMnJtODQ4cFA4SUtYY2RvWVlVak1p?=
 =?utf-8?B?NWJtSXZoeTljbGIxb3JhN1luMGlHcHo3TDNySFNkdVZ6WVh6dHIxTGFXRHps?=
 =?utf-8?B?NFU1cW42WEFraHZNYjFaQ3VQWEhmQU9tcEVxQmVVUmh0SGU0eFlKNkY5YU9u?=
 =?utf-8?B?M0JnM05rdll1QU1DdXVJWUZUV0UrbTUrd291OWdKTVc2UERnSG8xWEpGejFn?=
 =?utf-8?B?YjhEUVZvaEx2eW5oTmwzQmtoUXo5VVRHekxSdE1NVmg0Z0FIbU5iQVc3SU1a?=
 =?utf-8?B?eVlWNk5kYkRPNGJ3eGlXMlRlWEdqVU1yVmhrT3dOWFlXYnU0WGt0cStYaHND?=
 =?utf-8?B?anc2L0lTeTF5N1V3N1E2OVg2NndFVU9XQ3RBMGR5SzluMkJtYnNJSjc4OG5T?=
 =?utf-8?B?K3VhZmNLbHRRU1NZUXFtd3B6VVdIV3Z4amNYWGgxeUpxZWFTMHZJS0hHTmI4?=
 =?utf-8?B?QmJUYzQ2TmxIZmZiSzNTa0ZzaFZUZ1d6VGF6NlVTckdNeHJGWGU4VHhYSmN6?=
 =?utf-8?B?VmdXSlVTMmR0elh3aUNkRXpYVTZjV21MdGoyWUFJWk1qckhnUXgxY0tVTlYw?=
 =?utf-8?B?dCtHU2g4YXZIQXJ1a2xmd2JzaWRjNVphSzVkMnhKS1JGYjZkYVQ3ejNPOExp?=
 =?utf-8?B?alB1VUwxVjZRNSt1NFh1SnZiVjl0R3NQVGpIczQxWWhnWjJEMGovOGNmWUlU?=
 =?utf-8?B?UmY2enZXV3JPVi9tTjhpT3VaNHFERFcyU1g5bVhwaWIwZW1BVENsOUJQYUI3?=
 =?utf-8?B?UXBybXJFQlRFNzBGc3AzR20xVkM5bEhLemVWRElTU1pMUVBuVDdRMjdXVUZi?=
 =?utf-8?B?aDRDRUNJbjl0MUVYa1RFNzBtaHF6Yml0S2VKV2ZnTXZrY1p5RE45YmplSTZ0?=
 =?utf-8?B?bllDZHRyMFlPYW1uRVVYMmZ4Vk5DeUZTa3hnd1kvZzNvTldXeFNzTGtRaTNO?=
 =?utf-8?Q?iqh6FGlZYGAFgzHQk6?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ki/68GROLk4oVRXd2FEJuquydbDxkJ379SL+Rd4wpWLEhc+KxQTYC5x9UHeClEqJwu2MCYyB/qsrqiRg6Dr1Fkvhv7dP/3aj/pGkFng/7+/CUUs7O9VmO9x0fqXs+6lAwHbp/jonCN4/8EswckQHTiuN3K/x65bp5VZBjlQvB0f3y1XrIiBgR2oAQgbFRTAelsncSTbNy41HwPpzxezdEOxyPXHvP7GgEh2wb7VR+k8mR0GK3e+/WN97apDixo60hiD3t3iopyWIweGBC6h6lqZk5AaTXSOxcWy+PKaGtNlmgkvcHO++RPk+MOEGfcynFKsKIpfuym/esHu2JpmA2A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF69154114F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a056a080-7ff5-4b2c-78d6-08df081cecb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2026 11:34:03.3128 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rTW4I5wKbtOl7db1woAzhdP/tjZvzQCaT9U+QUUPC/8Bq+IBwHorYQS9RXQVh9jS985OJKFvtOQzbN44ilTG2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7255
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVmlsbGUgU3lyasOkbMOk
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gU2VudDogRnJpZGF5LCAyOCBBdWd1
c3QgMjAyNiAyMS4zOA0KPiBUbzogS2Fob2xhLCBNaWthIDxtaWthLmthaG9sYUBpbnRlbC5jb20+
DQo+IENjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC14ZUBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzNdIGRybS9pOTE1L2Rpc3Bs
YXk6IFJlc3RyaWN0IGZsaXBxIHRvIHNpbXBsZSBzaW5nbGUtcGxhbmUgdXBkYXRlcw0KPiANCj4g
T24gRnJpLCBBdWcgMDcsIDIwMjYgYXQgMTI6MTU6MzlQTSArMDAwMCwgTWlrYSBLYWhvbGEgd3Jv
dGU6DQo+ID4gT3VyIGZsaXBxIGVsaWdpYmlsaXR5IGNoZWNrIGlzIHRvbyBsb29zZTogaXQgc3Rp
bGwgbGV0cyB0aHJvdWdoDQo+ID4gY29tbWl0cyB0aGF0IGNoYW5nZSB0aGUgYWN0aXZlL2VuYWJs
ZWQgcGxhbmUgbWFzaywgb3IgbmVlZCBleHRyYQ0KPiA+IHBpcGUvTS1OL0xSUi93YXRlcm1hcmsg
cHJvZ3JhbW1pbmcuIFRob3NlIGFyZW4ndCBzaW1wbGUgcXVldWVkIHBsYW5lDQo+ID4gdXBkYXRl
cyBhbmQgaGF2ZSBubyBidXNpbmVzcyBnb2luZyB0aHJvdWdoIGZsaXBxLg0KPiA+DQo+ID4gRm91
bmQgdGhpcyBjaGFzaW5nIGEgQ1JDIG1pc21hdGNoIGluIGttc19jdXJzb3JfY3JjJ3MNCj4gPiBj
dXJzb3ItYWxwaGEtb3BhcXVlOiBhIHBsYW5lIGVuYWJsZS9kaXNhYmxlIGNvbW1pdCBzbGlwcGVk
IHRocm91Z2gNCj4gPiBmbGlwcSBhaGVhZCBvZiB0aGUgcGxhbmUtY29udGVudCBjb21taXQgdGhl
IENSQyBhY3R1YWxseSBjaGVja3MuDQo+ID4NCj4gPiBSZWplY3QgZmxpcHEgZm9yIGFueXRoaW5n
IHRvdWNoaW5nIG1vcmUgdGhhbiBvbmUgcGxhbmUsIGNoYW5naW5nIHRoZQ0KPiA+IGFjdGl2ZS9l
bmFibGVkIHBsYW5lIG1hc2tzLCBvciBuZWVkaW5nIGFzeW5jIGZsaXAsIFZSUiwgUFNSLCBjb2xv
ciwNCj4gPiBwaXBlLCBNL04sIExSUiBvciB3YXRlcm1hcmsgdXBkYXRlcy4gTW9yZSBjb25zZXJ2
YXRpdmUgdGhhbiBzdHJpY3RseQ0KPiA+IG5lY2Vzc2FyeSBpbiBzb21lIGNhc2VzLCBidXQgYmV0
dGVyIHNhZmUgdGhhbiByYWN5Lg0KPiA+DQo+ID4gQXNzaXN0ZWQtYnk6IENvcGlsb3Q6Y2xhdWRl
LXNvbm5ldC01DQo+ID4gU2lnbmVkLW9mZi1ieTogTWlrYSBLYWhvbGEgPG1pa2Eua2Fob2xhQGlu
dGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kaXNwbGF5LmMgfCA1MyArKysrKysrKysrKysrKysrKy0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgNDYgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jDQo+ID4gaW5kZXggNWNkYWE1OWYw
MDVlLi4yNDgzYzAzMTYzMWMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2Rpc3BsYXkuYw0KPiA+IEBAIC03MzIzLDYgKzczMjMsNTEgQEAgc3RhdGlj
IHZvaWQgaW50ZWxfYXRvbWljX3ByZXBhcmVfcGxhbmVfY2xlYXJfY29sb3JzKHN0cnVjdCBpbnRl
bF9hdG9taWNfc3RhdGUgKnMNCj4gPiAgCX0NCj4gPiAgfQ0KPiA+DQo+ID4gK3N0YXRpYyBib29s
IGludGVsX2ZsaXBxX2NvbW1pdF9pc19lbGlnaWJsZShzdHJ1Y3QgaW50ZWxfYXRvbWljX3N0YXRl
ICpzdGF0ZSwNCj4gPiArCQkJCQkgICBzdHJ1Y3QgaW50ZWxfY3J0YyAqY3J0YykNCj4gPiArew0K
PiA+ICsJc3RydWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkgPSB0b19pbnRlbF9kaXNwbGF5KHN0
YXRlKTsNCj4gPiArCWNvbnN0IHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpvbGRfY3J0Y19zdGF0
ZSA9DQo+ID4gKwkJaW50ZWxfYXRvbWljX2dldF9vbGRfY3J0Y19zdGF0ZShzdGF0ZSwgY3J0Yyk7
DQo+ID4gKwljb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqbmV3X2NydGNfc3RhdGUgPQ0K
PiA+ICsJCWludGVsX2F0b21pY19nZXRfbmV3X2NydGNfc3RhdGUoc3RhdGUsIGNydGMpOw0KPiA+
ICsNCj4gPiArCWlmICghaW50ZWxfZmxpcHFfc3VwcG9ydGVkKGRpc3BsYXkpKQ0KPiA+ICsJCXJl
dHVybiBmYWxzZTsNCj4gPiArDQo+ID4gKwlpZiAoaW50ZWxfY3J0Y19uZWVkc19tb2Rlc2V0KG5l
d19jcnRjX3N0YXRlKSB8fA0KPiA+ICsJICAgIGludGVsX2NydGNfbmVlZHNfZmFzdHNldChuZXdf
Y3J0Y19zdGF0ZSkgfHwNCj4gPiArCSAgICBpbnRlbF9jcnRjX25lZWRzX2NvbG9yX3VwZGF0ZShu
ZXdfY3J0Y19zdGF0ZSkpDQo+ID4gKwkJcmV0dXJuIGZhbHNlOw0KPiA+ICsNCj4gPiArCWlmICgh
bmV3X2NydGNfc3RhdGUtPnVwZGF0ZV9wbGFuZXMgfHwNCj4gPiArCSAgICAhaXNfcG93ZXJfb2Zf
MihuZXdfY3J0Y19zdGF0ZS0+dXBkYXRlX3BsYW5lcykpDQo+ID4gKwkJcmV0dXJuIGZhbHNlOw0K
PiANCj4gVGhlIG51bWJlciBvZiBwbGFuZXMgYmVpbmcgdXBkYXRlZCBkb2Vzbid0IG1hdHRlci4N
Cg0KUmlnaHQuIFJlbW92aW5nIHRoZXNlLg0KPiANCj4gPiArDQo+ID4gKwlpZiAobmV3X2NydGNf
c3RhdGUtPmRvX2FzeW5jX2ZsaXAgfHwNCj4gPiArCSAgICBuZXdfY3J0Y19zdGF0ZS0+dnJyLmVu
YWJsZSB8fA0KPiA+ICsJICAgIG5ld19jcnRjX3N0YXRlLT5oYXNfcHNyKQ0KPiA+ICsJCXJldHVy
biBmYWxzZTsNCj4gPiArDQo+ID4gKwlpZiAob2xkX2NydGNfc3RhdGUtPmFjdGl2ZV9wbGFuZXMg
IT0gbmV3X2NydGNfc3RhdGUtPmFjdGl2ZV9wbGFuZXMgfHwNCj4gPiArCSAgICBvbGRfY3J0Y19z
dGF0ZS0+ZW5hYmxlZF9wbGFuZXMgIT0gbmV3X2NydGNfc3RhdGUtPmVuYWJsZWRfcGxhbmVzKQ0K
PiA+ICsJCXJldHVybiBmYWxzZTsNCj4gDQo+IEVuYWJsaW5nL2Rpc2FibGluZyBwbGFuZXMgaXMg
cGVyZmVjdGx5IGZpbmUuDQoNClJpZ2h0LCBlc3BlY2lhbGx5IGFzIHRoZSBmaXJzdCBwYXRjaCBv
ZiB0aGUgc2VyaWVzIHdpbGwgYmUgcmV3b3JrZWQgLCB0aGlzIGlzIG5vdCBuZWVkZWQuIFJlbW92
aW5nIHRoaXMgYXMgd2VsbC4NCiANCj4gDQo+ID4gKw0KPiA+ICsJLyoNCj4gPiArCSAqIEZsaXBx
IGlzIG9ubHkgc3VpdGFibGUgZm9yIHNpbXBsZSBxdWV1ZWQgc2luZ2xlLXBsYW5lIHVwZGF0ZXMN
Cj4gPiArCSAqIHRoYXQgZG8gbm90IGNoYW5nZSBwbGFuZSB0b3BvbG9neSBhbmQgZG8gbm90IHJl
cXVpcmUgYWRkaXRpb25hbA0KPiA+ICsJICogcGlwZS90aW1pbmcvd2F0ZXJtYXJrIHByb2dyYW1t
aW5nLg0KPiA+ICsJICovDQo+ID4gKwlpZiAobmV3X2NydGNfc3RhdGUtPnVwZGF0ZV9waXBlIHx8
DQo+ID4gKwkgICAgbmV3X2NydGNfc3RhdGUtPnVwZGF0ZV9tX24gfHwNCj4gPiArCSAgICBuZXdf
Y3J0Y19zdGF0ZS0+dXBkYXRlX2xyciB8fA0KPiA+ICsJICAgIG5ld19jcnRjX3N0YXRlLT51cGRh
dGVfd21fcHJlIHx8DQo+ID4gKwkgICAgbmV3X2NydGNfc3RhdGUtPnVwZGF0ZV93bV9wb3N0KQ0K
PiANCj4gVGhvc2UgdXBkYXRlX3dtXyogZmxhZ3MgYXJlIGp1c3QgaGFja3MgZm9yIGFuY2llbnQg
cGxhdGZvcm1zLg0KPiBOb3QgcmVsZXZhbnQgaGVyZS4NCg0KWWVzLCB0aGVzZSB3ZSBkb24ndCBu
ZWVkLg0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXchDQoNCi1NaWthLQ0KDQo+IA0KPiA+ICsJCXJl
dHVybiBmYWxzZTsNCj4gPiArDQo+ID4gKwlyZXR1cm4gdHJ1ZTsNCj4gPiArfQ0KPiA+ICsNCj4g
PiAgc3RhdGljIHZvaWQgaW50ZWxfYXRvbWljX2RzYl9wcmVwYXJlKHN0cnVjdCBpbnRlbF9hdG9t
aWNfc3RhdGUgKnN0YXRlLA0KPiA+ICAJCQkJICAgICBzdHJ1Y3QgaW50ZWxfY3J0YyAqY3J0YykN
Cj4gPiAgew0KPiA+IEBAIC03MzM4LDEzICs3MzgzLDcgQEAgc3RhdGljIHZvaWQgaW50ZWxfYXRv
bWljX2RzYl9wcmVwYXJlKHN0cnVjdCBpbnRlbF9hdG9taWNfc3RhdGUgKnN0YXRlLA0KPiA+DQo+
ID4gIAkvKiBGSVhNRSBkZWFsIHdpdGggZXZlcnl0aGluZyAqLw0KPiA+ICAJbmV3X2NydGNfc3Rh
dGUtPnVzZV9mbGlwcSA9DQo+ID4gLQkJaW50ZWxfZmxpcHFfc3VwcG9ydGVkKGRpc3BsYXkpICYm
DQo+ID4gLQkJIW5ld19jcnRjX3N0YXRlLT5kb19hc3luY19mbGlwICYmDQo+ID4gLQkJIW5ld19j
cnRjX3N0YXRlLT52cnIuZW5hYmxlICYmDQo+ID4gLQkJIW5ld19jcnRjX3N0YXRlLT5oYXNfcHNy
ICYmDQo+ID4gLQkJIWludGVsX2NydGNfbmVlZHNfbW9kZXNldChuZXdfY3J0Y19zdGF0ZSkgJiYN
Cj4gPiAtCQkhaW50ZWxfY3J0Y19uZWVkc19mYXN0c2V0KG5ld19jcnRjX3N0YXRlKSAmJg0KPiA+
IC0JCSFpbnRlbF9jcnRjX25lZWRzX2NvbG9yX3VwZGF0ZShuZXdfY3J0Y19zdGF0ZSk7DQo+ID4g
KwkJaW50ZWxfZmxpcHFfY29tbWl0X2lzX2VsaWdpYmxlKHN0YXRlLCBjcnRjKTsNCj4gPg0KPiA+
ICAJbmV3X2NydGNfc3RhdGUtPnVzZV9kc2IgPQ0KPiA+ICAJCSFuZXdfY3J0Y19zdGF0ZS0+dXNl
X2ZsaXBxICYmDQo+ID4gLS0NCj4gPiAyLjQzLjANCj4gDQo+IC0tDQo+IFZpbGxlIFN5cmrDpGzD
pA0KPiBJbnRlbA0K
